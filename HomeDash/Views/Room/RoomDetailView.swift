//
//  RoomDetailView.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/22/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//


import SwiftUI

struct RoomDetailView: View {
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
        }
        .navigationTitle(room.wrappedName)
    }
}

struct RoomDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoomDetailView(room: PreviewData.sampleRoom)
        }
    }
}
