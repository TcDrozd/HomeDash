//
//  PersistenceTestView.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/22/25.
//


import SwiftUI
import CoreData

struct PersistenceTestView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Home.name, ascending: true)],
        animation: .default
    ) private var homes: FetchedResults<Home>

    var body: some View {
        VStack {
            List(homes) { home in
                Text("🏡 \(home.name ?? "Unnamed Home")")
            }
            Button("Add Sample Home") {
                addTestData()
            }
        }
        .padding()
    }

    private func addTestData() {
        let newHome = Home(context: viewContext)
        newHome.id = UUID()
        newHome.name = "My First Home"
        newHome.purchaseDate = Date()

        let newUpgrade = Upgrade(context: viewContext)
        newUpgrade.id = UUID()
        newUpgrade.title = "Installed Smart Thermostat"
        newUpgrade.dateCompleted = Date()
        newUpgrade.cost = 199.99
        newUpgrade.home = newHome  // establishes the relationship

        do {
            try viewContext.save()
            print("✅ Test data saved.")
        } catch {
            let nsError = error as NSError
            print("❌ Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}