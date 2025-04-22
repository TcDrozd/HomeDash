//
//  Room+Extensions.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/22/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//


import Foundation

extension Room {

    /// Safe, Swift-friendly sorted list of inventory items for this room.
    var wrappedInventoryItems: [InventoryItem] {
        let set = inventoryItems as? Set<InventoryItem> ?? []
        return set.sorted { ($0.name ?? "").localizedCompare($1.name ?? "") == .orderedAscending }
    }

    /// Safe room name fallback.
    var wrappedName: String {
        name ?? "Unnamed Room"
    }
}