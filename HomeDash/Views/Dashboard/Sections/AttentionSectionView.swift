//
//  AttentionSection.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/24/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//

import SwiftUI

struct AttentionSectionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Attention Needed")
                .font(.title3)
                .bold()
                .padding(.bottom, 4)

            VStack(spacing: 8) {
                AttentionCard(icon: "clock.badge.exclamationmark", title: "Change air filter", detail: "Overdue by 3 days")
                AttentionCard(icon: "doc.plaintext", title: "Washer warranty expiring", detail: "Expires in 5 days")
            }
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .cornerRadius(12)
    }
}

struct AttentionCard: View {
    let icon: String
    let title: String
    let detail: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.orange)
                .frame(width: 32, height: 32)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.body)
                    .bold()
                Text(detail)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .shadow(radius: 1)
    }
}


// Previews
struct AttentionSectionView_Previews: PreviewProvider {
    static var previews: some View {
        AttentionSectionView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
