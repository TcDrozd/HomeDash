
//
//  NotesListView.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/23/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//

import SwiftUI

// Floating Add button!
struct FloatingAddButton<Destination: View>: View {
    let destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
            Image(systemName: "plus")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
                .padding()
                .background(Color.accentColor)
                .clipShape(Circle())
                .shadow(radius: 4)
        }
        .padding()
    }
}

#Preview {
    NavigationView {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            FloatingAddButton(destination: Text("Destination Placeholder"))
        }
    }
}
