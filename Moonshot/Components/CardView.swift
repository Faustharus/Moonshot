//
//  CardView.swift
//  Moonshot
//
//  Created by Damien Chailloleau on 05/12/2023.
//

import SwiftUI

struct CardView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decodeFile("astronauts.json")
    let missions: [Mission] = Bundle.main.decodeFile("missions.json")
    
    var body: some View {
        ForEach(missions) { mission in
            NavigationLink {
                MissionView(mission: mission, astronauts: astronauts)
            } label: {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding()
                    
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
    CardView()
}
