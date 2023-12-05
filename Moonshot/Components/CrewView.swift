//
//  CrewView.swift
//  Moonshot
//
//  Created by Damien Chailloleau on 05/12/2023.
//

import SwiftUI

struct CrewView: View {
    
    let astronautImage: String
    let astronautName: String
    let astronautRole: String
    
    var body: some View {
        HStack {
            Image(astronautImage)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(.capsule)
                .overlay(
                    Capsule()
                        .stroke(.white, lineWidth: 1)
                )
            VStack(alignment: .leading) {
                Text(astronautName)
                    .font(.headline)
                    .foregroundStyle(.white)
                Text(astronautRole)
                    .foregroundStyle(.white.opacity(0.6))
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    CrewView(astronautImage: "armstrong", astronautName: "Neil A. Armstrong", astronautRole: "Commander")
}
