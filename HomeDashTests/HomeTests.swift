//
//  HomeTests.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/22/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//


import XCTest
import CoreData
@testable import HomeDash

final class HomeTests: XCTestCase {

    var context: NSManagedObjectContext!

    override func setUpWithError() throws {
        context = PersistenceController.preview.container.viewContext
    }

    override func tearDownWithError() throws {
        context = nil
    }

    func testCreateHome() throws {
        let home = Home(context: context)
        home.id = UUID()
        home.name = "Test Home"
        home.purchaseDate = Date()

        try context.save()

        let fetchRequest: NSFetchRequest<Home> = Home.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", "Test Home")

        let results = try context.fetch(fetchRequest)
        XCTAssertFalse(results.isEmpty, "Expected to fetch at least one Home.")
        XCTAssertEqual(results.first?.name, "Test Home")
    }

    func testSampleHomeData() throws {
        let home = PreviewData.sampleHome
        XCTAssertEqual(home.name, "Preview Home")
        XCTAssertNotNil(home.purchaseDate, "Sample Home should have a purchase date.")
    }
}
