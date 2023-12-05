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
                        CardListView()
                    }
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 30) {
                            CardView()
                        }
                        .padding([.bottom, .horizontal])
                    }
                }
            }
            .navigationTitle("Moonshot")
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


//LazyVGrid(columns: columns, spacing: 30) {
//    
//}
//.padding([.bottom, .horizontal])
