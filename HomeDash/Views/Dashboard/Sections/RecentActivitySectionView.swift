//
//  RecentActivityView.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/24/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//

import SwiftUI

struct ActivityEvent: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
}

struct RecentActivitySectionView: View {
    // For now, mock some recent events
    let events: [ActivityEvent] = [
        .init(icon: "doc.text", title: "Uploaded washing machine manual"),
        .init(icon: "paintbrush", title: "Updated kitchen wall color"),
        .init(icon: "camera.fill", title: "Logged paint scratch in hallway")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Recent Activity")
                .font(.title3)
                .bold()
                .padding(.bottom, 4)

            ForEach(events) { event in
                HStack(spacing: 12) {
                    Image(systemName: event.icon)
                        .foregroundColor(.blue)
                        .frame(width: 24)

                    Text(event.title)
                        .font(.body)

                    Spacer()
                }
                .padding(.vertical, 6)
            }
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .cornerRadius(12)
    }
}

// Previews
struct RecentActivitySectionView_Previews: PreviewProvider {
    static var previews: some View {
        RecentActivitySectionView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
