//
//  HomeListView.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/22/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//


import SwiftUI

struct HomeListView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Home.name, ascending: true)],
        animation: .default
    ) private var homes: FetchedResults<Home>

    var body: some View {
        NavigationView {
            List(homes) { home in
                NavigationLink {
                    HomeDetailView(home: home)
                } label: {
                    Text(home.name ?? "Unnamed Home")
                }
            }
            .navigationTitle("Your Homes")
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        // Uses in-memory preview context
        let context = PersistenceController.preview.container.viewContext
        // Inject a sample Home if none exist
        if (try? context.count(for: Home.fetchRequest())) == 0 {
            let _ = PreviewData.sampleHome
            try? context.save()
        }
        return HomeListView()
            .environment(\.managedObjectContext, context)
    }
}
