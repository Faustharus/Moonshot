//
//  ContentView.swift
//  Moonshot
//
//  Created by Damien Chailloleau on 02/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decodeFile("astronauts.json")
    let missions: [Mission] = Bundle.main.decodeFile("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var changeViewStyle: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if changeViewStyle {
                    List {
                        ForEach(missions) { mission in
                            CardListView(mission: mission, image: mission.image, displayName: mission.displayName, formattedLaunchDate: mission.formattedLaunchDate)
                        }
                    }
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 30) {
                            ForEach(missions) { mission in
                                CardView(mission: mission, image: mission.image, displayName: mission.displayName, formattedLaunchDate: mission.formattedLaunchDate)
                            }
                        }
                        .padding([.bottom, .horizontal])
                    }
                }
            }
            .navigationTitle("Moonshot")
            .navigationDestination(for: Mission.self, destination: { selected in
                MissionView(mission: selected, astronauts: astronauts)
            })
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    self.changeViewStyle.toggle()
                } label: {
                    Label("Switch View", systemImage: "arrow.circlepath")
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
