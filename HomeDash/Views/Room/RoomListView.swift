//
//  RoomListView.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/22/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//
import SwiftUI


struct RoomListView: View {
    var home: Home // the selected Home we're viewing rooms for
    
    var body: some View {
        List {
            ForEach(home.roomsArray, id: \.self) { room in
                NavigationLink {
                    // placeholder destination
                    Text("Room details for \(room.wrappedName)")
                } label: {
                    VStack(alignment: .leading) {
                        Text(room.wrappedName) // name
                            .font(.headline)
                        Text("\(room.wrappedInventoryItems.count) items (placeholder)") // count
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .navigationTitle("Rooms")
    }
}

// PREVIEWS

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoomListView(home: PreviewData.sampleHomeWithRooms)
        }
    }
}

