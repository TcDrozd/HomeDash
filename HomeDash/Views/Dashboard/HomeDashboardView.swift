//
//  HomeDashboardView.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/24/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//

import SwiftUI

struct HomeDashboardView: View {
    var body: some View {
        ScrollView {
            VStack {
                AttentionSectionView()
                QuickAccessView()
                HouseHealthView()
                RecentActivitySectionView()
                SeasonalRemindersView()
            }
            .padding()
        }
        .navigationTitle(Text("Dashboard"))
    }
}

// Previews

struct HomeDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeDashboardView()
        }
    }
}
