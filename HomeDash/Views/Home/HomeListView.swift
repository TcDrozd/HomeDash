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
    
    @State private var showingAddHomeSheet = false
    @State private var newHomeName: String = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(homes) { home in
                    NavigationLink {
                        HomeDetailView(home: home)
                    } label: {
                        Text(home.wrappedName ?? "Unnamed Home")
                    }
                }
                .onDelete(perform: deleteHomes)
            }
            .navigationTitle("Your Homes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {
                        showingAddHomeSheet = true
                    }) {
                        Label("Add Home", systemImage: "plus")
                    }
                }
            }
            Text("Select a home")
        }
        .sheet(isPresented: $showingAddHomeSheet) {
            VStack {
                Text("Create a New Home")
                    .font(.title2)
                TextField("Home name", text: $newHomeName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Save") {
                    addHome()
                    showingAddHomeSheet = false
                }
                .disabled(newHomeName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)

                Button("Cancel", role: .cancel) {
                    showingAddHomeSheet = false
                }
                .padding(.top)
            }
            .padding()
        }
    }
    
    private func addHome() {
        let context = PersistenceController.shared.container.viewContext
        let newHome = Home(context: context)
        newHome.id = UUID()
        newHome.name = newHomeName.isEmpty ? "New Home" : newHomeName
        newHome.purchaseDate = Date()

        do {
            try context.save()
            newHomeName = ""
        } catch {
            print("Failed to save new home: \(error.localizedDescription)")
        }
    }
    
    private func deleteHomes(offsets: IndexSet) {
        let context = PersistenceController.shared.container.viewContext
        offsets.map { homes[$0] }.forEach(context.delete)

        do {
            try context.save()
        } catch {
            print("Failed to delete home: \(error.localizedDescription)")
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
