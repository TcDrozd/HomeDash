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
    @Environment(\.managedObjectContext) private var viewContext

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                NavigationLink {
                    RoomListView(home: home)
                } label: {
                    DashboardTile(icon: "house.fill", title: "Rooms")
                }

                NavigationLink {
                    Text("Upgrades View Placeholder")
                } label: {
                    DashboardTile(icon: "wrench.and.screwdriver.fill", title: "Upgrades")
                }

                NavigationLink {
                    Text("Inventory View Placeholder")
                } label: {
                    DashboardTile(icon: "cube.box.fill", title: "Inventory")
                }

                NavigationLink {
                    Text("Documents View Placeholder")
                } label: {
                    DashboardTile(icon: "doc.fill", title: "Documents")
                }

                NavigationLink {
                    NoteListView()
                } label: {
                    DashboardTile(icon: "note.text", title: "Notes")
                }

                NavigationLink {
                    Text("Reminders View Placeholder")
                } label: {
                    DashboardTile(icon: "clock.fill", title: "Reminders")
                }
            }
            .padding()
        }
        .navigationTitle(home.wrappedName)
    }
}

// Previews
struct HomeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeDetailView(home: PreviewData.sampleHome)
        }
    }
}
