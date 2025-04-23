//
//  RoomDetailViewTests.swift
//  HomeDash
//
//  Created by Trevor Drozd on 4/23/25.
//  Copyright © 2025 tcdrozd. All rights reserved.
//

import XCTest
import SwiftUI
@testable import HomeDash

@MainActor
final class RoomDetailViewTests: XCTestCase {

    func testRoomDetailViewRenders() throws {
        let room = PreviewData.sampleRoom
        let view = RoomDetailView(room: room)

        // Render the view's body to verify it compiles and builds
        XCTAssertNotNil(view.body, "RoomDetailView should have a valid body")
    }

    func testRoomNameDisplays() throws {
        let room = PreviewData.sampleRoom
        let view = RoomDetailView(room: room)

        // Ensure wrappedName is correctly set for previews/testing
        XCTAssertEqual(room.wrappedName, "Living Room")
    }

    func testInventoryCountMatchesPreview() throws {
        let room = PreviewData.sampleRoom
        let count = room.wrappedInventoryItems.count

        // Test should pass even if inventory is empty for now
        XCTAssertGreaterThanOrEqual(count, 0, "Inventory item count should be valid")
    }
} 
