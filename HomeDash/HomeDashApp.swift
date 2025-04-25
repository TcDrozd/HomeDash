//
//  HomeDashApp.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/21/25.
//

import SwiftUI

@main
struct HomeDashApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeDashboardView()
            }
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
