//
//  CreateNoteViewSnapshotTest.swift
//  ToDoiOSTests
//
//  Created by Carlos Alfredo Osorio Perez	 on 18/02/24.
//

import XCTest
import SnapshotTesting

@testable import ToDoiOS

final class CreateNoteViewSnapshotTest: XCTestCase {

    func testCreateNoteView() throws {
        let createNoteView = CreateNoteView(viewModel: .init())
        assertSnapshot(of: createNoteView, as: .image)
    }
    
    func testCreateNoteViewWithData(){
        let createNoteView = CreateNoteView(viewModel: .init(), title: "title", text: "text")
        assertSnapshot(of: createNoteView, as: .image)
    }

}
