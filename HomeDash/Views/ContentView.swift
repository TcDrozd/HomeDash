//
//  ContentView.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/21/25.
//

import SwiftUI
import CoreData
/*
struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Home.name, ascending: true)],
        animation: .default)
    private var homes: FetchedResults<Home>

    var body: some View {
        NavigationView {
            List {
                ForEach(homes) { home in
                    NavigationLink {
                        VStack(alignment: .leading) {
                            Text(home.name ?? "Unnamed Home")
                            if let date = home.purchaseDate {
                                Text("Purchased \(DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .none))")
                            }
                        }
                    } label: {
                        Text(home.name ?? "Unnamed Home")
                    }
                }
                .onDelete(perform: deleteHomes)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addHome) {
                        Label("Add Home", systemImage: "plus")
                    }
                }
            }
            Text("Select a home")
        }
    }

    private func addHome() {
        withAnimation {
            let newHome = Home(context: viewContext)
            newHome.purchaseDate = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteHomes(offsets: IndexSet) {
        withAnimation {
            offsets.map { homes[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

*/
