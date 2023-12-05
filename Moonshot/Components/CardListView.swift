//
//  CardListView.swift
//  Moonshot
//
//  Created by Damien Chailloleau on 05/12/2023.
//

import SwiftUI

struct CardListView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decodeFile("astronauts.json")
    let missions: [Mission] = Bundle.main.decodeFile("missions.json")
    
    var body: some View {
        ForEach(missions) { mission in
            ZStack {
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    EmptyView()
                }
                HStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .padding(.horizontal)
                    
                    VStack {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text(mission.formattedLaunchDate)
                            .font(.subheadline.italic())
                            .foregroundStyle(.white.opacity(0.7))
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.lightBackground)
                }
                .clipShape(.rect(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.lightBackground)
                )
            }
        }
    }
}

#Preview {
    NavigationStack {
        CardListView()
    }
}
