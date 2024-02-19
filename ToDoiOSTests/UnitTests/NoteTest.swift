//
//  ToDoiOSTests.swift
//  ToDoiOSTests
//
//  Created by Carlos Alfredo Osorio Perez	 on 13/12/23.
//

import XCTest
@testable import ToDoiOS

final class NoteTest: XCTestCase {

    func testNoteInitialization(){
        // Given or Arrange
        let title = "title"
        let text = "text"
        let date = Date()
        
        // When or Act
        let note = Note(title: title, text: text, createdAt: date)
        
        // Then or Assert
        XCTAssertEqual(note.title, title)
        XCTAssertEqual(note.getText, text)
        XCTAssertEqual(note.createdAt, date)
    }
    
    func testNoteTextEmpty() {
        let title = "title"
        let date = Date()
        
        let note = Note(title: title, text: nil, createdAt: date)
        
        XCTAssertEqual(note.getText, "")
        XCTAssertTrue(note.getText.isEmpty)
    }
}
