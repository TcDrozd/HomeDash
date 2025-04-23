//
//  NotesDetailView.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/23/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//

import SwiftUI

struct NoteDetailView: View {
    var note: Note

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let title = note.title, !title.isEmpty {
                    Text(title)
                        .font(.title)
                        .bold()
                }

                Text(note.content ?? "No content available.")
                    .font(.body)

                if let date = note.timestamp {
                    Text("Written on \(date.formatted(date: .abbreviated, time: .shortened))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                if let imageData = note.image, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationTitle("Note")
    }
}

// Previews

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetailView(note: PreviewData.sampleNote)
    }
}
