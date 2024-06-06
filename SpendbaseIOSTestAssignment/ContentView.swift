//
//  ContentView.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: AppScreen = .home
    
    let mockTeamModel: MockTeamModel = .init(id: "mockId", currency: .euro)
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppScreen.allCases) { screen in
                NavigationStack {
                    screen.destination(with: mockTeamModel)
                }
                .tag(screen as AppScreen?)
                .tabItem { screen.label }
            }
        }
    }
}

#Preview {
    ContentView()
}
