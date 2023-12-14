//
//  CardView.swift
//  Moonshot
//
//  Created by Damien Chailloleau on 05/12/2023.
//

import SwiftUI

struct CardView: View {
    
    let mission: Mission
    let image: String
    let displayName: String
    let formattedLaunchDate: String
    
    init(mission: Mission, image: String, displayName: String, formattedLaunchDate: String) {
        self.mission = mission
        self.image = image
        self.displayName = displayName
        self.formattedLaunchDate = formattedLaunchDate
    }
    
    var body: some View {
        NavigationLink(value: mission) {
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding()
                
                VStack {
                    Text(displayName)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text(formattedLaunchDate)
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

#Preview {
    CardView(mission: Mission(id: 1, launchDate: .now, crew: [Mission.CrewRole.init(name: "Armstrong", role: "Commander")], description: ""), image: "apollo11", displayName: "Apollo 11", formattedLaunchDate: "16 Jul 1969")
}
