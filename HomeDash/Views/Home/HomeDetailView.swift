//
//  HomeDetailView.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/22/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//
import SwiftUI

struct HomeDetailView: View {
    var home: Home

    var body: some View {
        List {
            Section(header: Text("Overview")) {
                Text("Name: \(home.wrappedName)")
                if let date = home.purchaseDate {
                    Text("Purchased: \(date, style: .date)")
                }
            }

            Section(header: Text("Explore")) {
                NavigationLink("Rooms") {
                    RoomListView(home: home)
                }
                NavigationLink("Upgrades") {
                    Text("Upgrades View Placeholder")  // placeholder
                }
                NavigationLink("Inventory") {
                    Text("Inventory View Placeholder")  // placeholder
                }
            }
        }
        .navigationTitle(home.wrappedName)
    }
}
