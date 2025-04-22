//
//  Home+Extensions.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/22/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//

import Foundation

extension Home {
    var roomsArray: [Room] {
        let set = rooms as? Set<Room> ?? []
        return set.sorted { ($0.name ?? "") < ($1.name ?? "") }
        /*
         NOTE TO SELF: rooms in Home Core Data model is originally an NSSet? — which is a Foundation (Objective-C) type. ForEach in SwiftUI expects an Array or something similar, not an NSSet. By converting rooms to Set<Room> and then sorting, we are producing an explicit [Room] as your return type.
         */
    }

    var wrappedName: String {
        name ?? "Unnamed Home"
    }
}
