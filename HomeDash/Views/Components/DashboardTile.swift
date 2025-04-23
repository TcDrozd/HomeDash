//
//  DashboardTile 2.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/23/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//
import SwiftUI

struct DashboardTile: View {
    let icon: String
    let title: String

    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.largeTitle)
                .padding(.bottom, 4)
            Text(title)
                .font(.body)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, minHeight: 100)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
