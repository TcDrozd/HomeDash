//
//  NotesListView.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/23/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//


import SwiftUI

struct NoteListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Note.timestamp, ascending: false)],
        animation: .default)
    private var notes: FetchedResults<Note>

    var body: some View {
        List {
            ForEach(notes) { note in
                NavigationLink(destination: NoteDetailView(note: note)) {
                    HStack(alignment: .top, spacing: 12) {
                        if let imageData = note.image, let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .frame(width: 44, height: 44)
                                .aspectRatio(contentMode: .fill)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text(note.title?.isEmpty == false ? note.title! : "Untitled Note")
                                    .font(.headline)
                                if let roomName = note.room?.wrappedName {
                                    Spacer()
                                    Text(roomName)
                                        .font(.caption)
                                        .padding(5)
                                        .background(Color(.systemGray5))
                                        .clipShape(RoundedRectangle(cornerRadius: 4))
                                }
                            }

                            Text(note.content?.prefix(100) ?? "")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            if let date = note.timestamp {
                                Text(date, style: .date)
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .onDelete(perform: deleteNotes)
        }
        .navigationTitle("Notes")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: addNote) {
                    Label("Add Note", systemImage: "plus")
                }
            }
        }
    }

    private func addNote() {
        withAnimation {
            let newNote = Note(context: viewContext)
            newNote.id = UUID()
            newNote.timestamp = Date()
            newNote.title = ""
            newNote.content = ""

            do {
                try viewContext.save()
            } catch {
                print("Failed to save new note: \(error.localizedDescription)")
            }
        }
    }

    private func deleteNotes(offsets: IndexSet) {
        withAnimation {
            offsets.map { notes[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                print("Failed to delete notes: \(error.localizedDescription)")
            }
        }
    }
}

struct NotesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoteListView()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}

