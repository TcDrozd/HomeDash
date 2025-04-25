//
//  SeasonalRemindersView.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/24/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//

import SwiftUI

struct SeasonalRemindersView: View {
    let reminders = [
        ("leaf.fill", "Clean gutters before fall"),
        ("flame.fill", "Schedule furnace inspection"),
        ("drop.fill", "Turn off outdoor faucets before winter")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Seasonal Reminders")
                .font(.title3)
                .bold()
                .padding(.bottom, 4)

            ForEach(reminders, id: \.1) { (icon, text) in
                SeasonalReminderCard(icon: icon, text: text)
            }
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .cornerRadius(12)
    }
}

struct SeasonalReminderCard: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .font(.title2)
                .frame(width: 32)

            Text(text)
                .font(.body)

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .shadow(radius: 1)
    }
}

// Previews

struct SeasonalRemindersView_Previews: PreviewProvider {
    static var previews: some View {
        SeasonalRemindersView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
