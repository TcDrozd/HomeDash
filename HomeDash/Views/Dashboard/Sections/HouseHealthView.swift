//
//  HouseHealthView.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/24/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//

import SwiftUI

struct HouseHealthView: View {
    // Placeholder health metric
    let healthPercent: Double = 0.7
    let maintenanceDue: Int = 3

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("House Health")
                .font(.title3)
                .bold()

            ProgressView(value: healthPercent)
                .progressViewStyle(LinearProgressViewStyle(tint: healthPercent >= 0.8 ? .green : .orange))
                .scaleEffect(x: 1, y: 2, anchor: .center)

            Text("\(Int(healthPercent * 100))% healthy")
                .font(.body)
                .bold()

            if maintenanceDue > 0 {
                Text("\(maintenanceDue) maintenance item\(maintenanceDue > 1 ? "s" : "") due")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .cornerRadius(12)
    }
}

// Previews

struct HouseHealthView_Previews: PreviewProvider {
    static var previews: some View {
        HouseHealthView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
