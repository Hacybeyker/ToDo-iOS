//
//  UpdateNoteViewSnapshotTest.swift
//  ToDoiOSTests
//
//  Created by Carlos Alfredo Osorio Perez	 on 18/02/24.
//

import XCTest
import SnapshotTesting

@testable import ToDoiOS

final class UpdateNoteViewSnapshotTest: XCTestCase {

    func testUpdateNoteView() throws {
        let updateNoteView = UpdateNoteView(viewModel: ViewModel.init(), identifier: .init(), title: "Demo 1", text: "Description 1")
        assertSnapshot(of: updateNoteView, as: .image)
    }

}
