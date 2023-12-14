//
//  MissionView.swift
//  Moonshot
//
//  Created by Damien Chailloleau on 05/12/2023.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember: Hashable {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing: \(member.name)")
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                
                Text(mission.formattedLaunchDate)
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .padding(.top)
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.lightBackground)
                    .padding(.vertical)
                
                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                }
                .padding(.horizontal)
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.lightBackground)
                    .padding(.vertical)
                
                Text("Crew")
                    .font(.title.bold())
                    .padding(.bottom, 5)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(crew, id: \.role) { crewMember in
                            NavigationLink {
                                AstronautView(astronaut: crewMember.astronaut)
                            } label: {
                                CrewView(astronautImage: crewMember.astronaut.id, astronautName: crewMember.astronaut.name, astronautRole: crewMember.role)
                            }
                        }
                    }
                }
                
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decodeFile("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decodeFile("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
