//
//  ViewModelIntegrationTests.swift
//  ToDoiOSTests
//
//  Created by Carlos Alfredo Osorio Perez	 on 14/12/23.
//

import XCTest
@testable import ToDoiOS

@MainActor
final class ViewModelIntegrationTests: XCTestCase {
    
    var sutViewModel: ViewModel!

     override func setUpWithError() throws {
        let database = NotesDatabase.shared
        database.container = NotesDatabase.setupContainer(inMemory: true)
        
        let createNoteUseCase = CreateNoteUseCase(notesDatabase: database)
        let fetchAllNoteUseCase = FetchAllNotesUseCase(notesDatabase: database)
        
        sutViewModel = ViewModel(
            createNoteUseCase: createNoteUseCase,
            fetchAllNotesUseCase: fetchAllNoteUseCase)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateNote() {
        // Given
        sutViewModel.createNoteWith(title: "title 1", text: "text 1")
        
        // When
        let note = sutViewModel.notes.first
        
        // Then
        XCTAssertNotNil(note)
        XCTAssertEqual(note?.title, "title 1")
        XCTAssertEqual(note?.text, "text 1")
        XCTAssertEqual(sutViewModel.notes.count, 1)
    }
    
    func testCreateTwoNotes() {
        // Given
        sutViewModel.createNoteWith(title: "title 1", text: "text 1")
        sutViewModel.createNoteWith(title: "title 2", text: "text 2")
        
        // When
        let note1 = sutViewModel.notes.first
        let note2 = sutViewModel.notes.last
        
        // Then
        XCTAssertNotNil(note1)
        XCTAssertEqual(note1?.title, "title 1")
        XCTAssertEqual(note1?.text, "text 1")
        
        XCTAssertNotNil(note2)
        XCTAssertEqual(note2?.title, "title 2")
        XCTAssertEqual(note2?.text, "text 2")
        
        XCTAssertEqual(sutViewModel.notes.count, 2)
    }
    
    func testFetchAllNotes() {
        // Given
        sutViewModel.createNoteWith(title: "title 1", text: "text 1")
        sutViewModel.createNoteWith(title: "title 2", text: "text 2")
        
        // When
        let note1 = sutViewModel.notes[0]
        let note2 = sutViewModel.notes[1]
        
        // Then
        XCTAssertNotNil(note1)
        XCTAssertEqual(note1.title, "title 1")
        XCTAssertEqual(note1.text, "text 1")
        
        XCTAssertNotNil(note2)
        XCTAssertEqual(note2.title, "title 2")
        XCTAssertEqual(note2.text, "text 2")
        
        XCTAssertEqual(sutViewModel.notes.count, 2)
    }
    
    func testUpdateNote(){
        sutViewModel.createNoteWith(title: "title1", text: "text1")
        guard let note = sutViewModel.notes.first else {
            XCTFail()
            return
        }
        
        sutViewModel.updateNoteWith(identifier: note.identifier, newTitle: "newtitle", newText: "newtext")
        sutViewModel.fetchAllNotes()
        
        XCTAssertEqual(sutViewModel.notes.count, 1, "Deberia haber 1 nota en la base de datos")
        XCTAssertEqual(sutViewModel.notes[0].title, "newtitle")
        XCTAssertEqual(sutViewModel.notes[0].text, "newtext")
    }
    
    func testRemoveNote(){
        sutViewModel.createNoteWith(title: "title1", text: "text1")
        sutViewModel.createNoteWith(title: "title2", text: "text2")
        sutViewModel.createNoteWith(title: "title3", text: "text3")
        
        guard let note = sutViewModel.notes.last else {
            XCTFail()
            return
        }
        
        sutViewModel.removeNoteWith(identifier: note.identifier)
        XCTAssertEqual(sutViewModel.notes.count, 2, "Deberia haber notas en la base de datos")
    }
    
    func testRemoveNoteInDatabaseShouldThrowError(){
        sutViewModel.removeNoteWith(identifier: UUID())
        
        XCTAssertEqual(sutViewModel.notes.count, 0)
        XCTAssertNotNil(sutViewModel.databaseError)
        XCTAssertEqual(sutViewModel.databaseError, DatabaseError.errorRemove)
    }
}
