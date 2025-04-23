//
//  RoomDetailView.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/22/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//


import SwiftUI

struct RoomDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var room: Room

    var body: some View {
        List {
            Section(header: Text("Room Overview")) {
                Text("Name: \(room.wrappedName)")
                Text("\(room.wrappedInventoryItems.count) items stored here.")
            }
            Section(header: Text("Notes")) {
                Text("Notes view placeholder")
            }
            Section(header: Text("Inventory")) {
                if room.wrappedInventoryItems.isEmpty {
                    Text("No items recorded")
                        .foregroundColor(.secondary)
                } else {
                    ForEach(room.wrappedInventoryItems) { item in
                        VStack(alignment: .leading) {
                            Text(item.name ?? "Unnamed Item")
                                .font(.headline)
                            if let date = item.purchaseDate {
                                Text("Purchased on \(date, style: .date)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            // TODO: Add more sections for Notes, Upgrades, etc. as needed
        }
        .navigationTitle(room.wrappedName)
    }
}

// Previews
struct RoomDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext

        NavigationView {
            RoomDetailView(room: PreviewData.sampleRoom)
                .environment(\.managedObjectContext, context)
        }
    }
}
