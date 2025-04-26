//
//  Persistence.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/21/25.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    static let containerName = "HomeDash"
    
    @MainActor
    static let preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        // Plant mock data for previews
        let sampleHome = Home(context: viewContext)
        sampleHome.name = "Preview Home"
        sampleHome.purchaseDate = Date()
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("💥 Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        return controller
    }()
    
    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: Self.containerName)
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                let nsError = error as NSError
                fatalError("💥 Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            self.seedSeasonalRemindersIfNeeded(context: self.container.viewContext)
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    private func seedSeasonalRemindersIfNeeded(context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<Reminder> = Reminder.fetchRequest()
        
        do {
            let count = try context.count(for: fetchRequest)
            guard count == 0 else {
                print("✅ Seasonal reminders already exist.")
                return
            }
            
            print("🌱 Seeding default seasonal reminders...")

            let presetReminders = [
                (title: "Check sump pump", month: 1),
                (title: "Inspect attic for leaks", month: 2),
                (title: "Reverse ceiling fan (spring)", month: 3),
                (title: "Clean gutters after spring rains", month: 4),
                (title: "Service air conditioner", month: 5),
                (title: "Inspect decks and outdoor areas", month: 6),
                (title: "Check fire extinguishers", month: 7),
                (title: "Inspect caulking/weather stripping", month: 8),
                (title: "Reverse ceiling fan (fall)", month: 9),
                (title: "Winterize outdoor faucets", month: 10),
                (title: "Clean gutters after leaves fall", month: 11),
                (title: "Test carbon monoxide detectors", month: 12)
            ]

            for preset in presetReminders {
                let reminder = Reminder(context: context)
                reminder.id = UUID()
                reminder.title = preset.title
                reminder.month = Int16(preset.month)
                reminder.isCompleted = false
            }
            
            try context.save()
            print("✅ Seasonal reminders seeded successfully.")
        } catch {
            print("❌ Failed to fetch or seed reminders: \(error.localizedDescription)")
        }
    }
}
