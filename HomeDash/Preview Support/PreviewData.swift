//
//  PreviewData.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/22/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//


import Foundation
import CoreData

enum PreviewData {

    static let sampleHome: Home = {
        let context = PersistenceController.preview.container.viewContext
        let home = Home(context: context)
        home.id = UUID()
        home.name = "Preview Home"
        home.purchaseDate = Date()
        return home
    }()

    static let sampleUpgrade: Upgrade = {
        let context = PersistenceController.preview.container.viewContext
        let upgrade = Upgrade(context: context)
        upgrade.id = UUID()
        upgrade.title = "New Furnace Install"
        upgrade.dateCompleted = Date()
        upgrade.cost = 4500.00
        upgrade.details = "Upgrade DETAILS HERE"
        upgrade.home = sampleHome
        upgrade.room = sampleRoom
        return upgrade
    }()

    static let sampleInventoryItem: InventoryItem = {
        let context = PersistenceController.preview.container.viewContext
        let item = InventoryItem(context: context)
        item.id = UUID()
        item.name = "Samsung Refrigerator"
        item.purchaseDate = Date().addingTimeInterval(-86400 * 365)
        item.category = "Category"
        item.serialNumber = "RF-XYZ1234"
        item.home = sampleHome
        return item
    }()
    
    static let sampleDocument: Document = {
        let context = PersistenceController.preview.container.viewContext
        let document = Document(context: context)
        document.id = UUID()
        document.title = "Sample Document"
        document.fileData = Data()
        document.home = sampleHome
        document.rooms = sampleRoom
        return document
    }()
    
    static let sampleNote: Note = {
        let context = PersistenceController.preview.container.viewContext
        let note = Note(context: context)
        note.id = UUID()
        note.content = "Sample Note content"
        note.room = sampleRoom
        note.home = sampleHome
        return note
    }()
    
    static let sampleRoom: Room = {
        let context = PersistenceController.preview.container.viewContext
        let room = Room(context: context)
        room.id = UUID()
        room.name = "Living Room"
        room.home = sampleHome
        room.notes = [sampleNote]
        room.documents = [sampleDocument]
        room.inventoryItems = [sampleInventoryItem]
        room.upgrades = [sampleUpgrade]
        return room
    }()
}
