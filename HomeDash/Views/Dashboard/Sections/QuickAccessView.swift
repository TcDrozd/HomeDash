//
//  QuickAccessView.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/24/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//

import SwiftUI

struct QuickAccessView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Quick Access")
                .font(.title3)
                .bold()
                .padding(.bottom, 4)

            HStack(spacing: 16) {
                QuickAccessTile(icon: "cube.box", label: "Inventory", color: .blue)
                QuickAccessTile(icon: "doc.fill", label: "Documents", color: .purple)
                NavigationLink(destination: NoteListView()) {
                    QuickAccessTile(icon: "note.text", label: "Notes", color: .orange)
                }
                QuickAccessTile(icon: "checkmark.circle", label: "Tasks", color: .green)
            }
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .cornerRadius(12)
    }
}

struct QuickAccessTile: View {
    let icon: String
    let label: String
    let color: Color

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.white)
                .padding(12)
                .background(color)
                .clipShape(Circle())

            Text(label)
                .font(.caption)
                .foregroundColor(.primary)
        }
        .frame(width: 80, height: 90)
    }
}

// Previews
struct QuickAccessView_Previews: PreviewProvider {
    static var previews: some View {
        QuickAccessView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
