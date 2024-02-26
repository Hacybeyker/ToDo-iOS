//
//  UpdateNoteViewSnapshotTest.swift
//  ToDoiOSTests
//
//  Created by Carlos Alfredo Osorio Perez	 on 18/02/24.
//

import XCTest
import SnapshotTesting

@testable import ToDoiOS
import SwiftUI

final class UpdateNoteViewSnapshotTest: XCTestCase {

    func testUpdateNoteViewWhitoutData() throws {
        let updateNoteView = NavigationStack {
            UpdateNoteView(
                viewModel: ViewModel.init(),
                identifier: .init(),
                title: "",
                text: "")
        }
        
        assertSnapshot(of: updateNoteView, as: .image)
    }
    
    func testUpdateNoteViewWithData() throws {
        let updateNoteView = NavigationStack {
            UpdateNoteView(
                viewModel: ViewModel.init(),
                identifier: .init(),
                title: "Demo 1",
                text: "Description 1")
        }
        
        assertSnapshot(of: updateNoteView, as: .image)
    }

}
