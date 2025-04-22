//
//  HomeViewTests.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/22/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//


// HomeViewTests.swift
// HomeDashTests

import XCTest
import SwiftUI
import CoreData
@testable import HomeDash

@MainActor
final class HomeViewTests: XCTestCase {

    var context: NSManagedObjectContext!

    override func setUpWithError() throws {
        context = PersistenceController.preview.container.viewContext
    }

    override func tearDownWithError() throws {
        context = nil
    }

    func testHomeListViewLoads() throws {
        // Prepare sample data
        let home = Home(context: context)
        home.id = UUID()
        home.name = "Test Home for UI"
        home.purchaseDate = Date()
        try context.save()

        // Create the SwiftUI view
        let view = HomeListView()

        // Render the body (compile-time test)
        XCTAssertNotNil(view.body, "HomeListView should have a body")
    }
}
