//
//  ViewModelTests.swift
//  ToDoiOSTests
//
//  Created by Carlos Alfredo Osorio Perez	 on 13/12/23.
//

import XCTest
@testable import ToDoiOS

final class ViewModelTests: XCTestCase {
    
    var viewModel: ViewModel!

    override func setUpWithError() throws {
        self.viewModel = ViewModel(
            createNoteUseCase: CreateNoteUseCaseMock(),
            fetchAllNotesUseCase: FetchAllNotesUseCaseMock(),
            updateNoteUse: UpdateNoteUseCaseMock(),
            removeNoteUseCase: RemoveNoteUseCaseMock()
        )
    }

    override func tearDownWithError() throws {
        mockDatabase = []
    }
    
    func testCreateNote() {
        // Given
        let title: String = "title"
        let text: String = "text"
        
        // When
        viewModel.createNoteWith(title: title, text: text)
        
        //Then
        XCTAssertEqual(viewModel.notes.count, 1)
        XCTAssertEqual(viewModel.notes.first?.title, title)
        XCTAssertEqual(viewModel.notes.first?.text, text)
    }
    
    func testCreateThreeNotes() {
        // Given
        let title1: String = "title1"
        let text1: String = "text1"
        
        let title2: String = "title2"
        let text2: String = "text2"
        
        let title3: String = "title3"
        let text3: String = "text3"

        // When
        viewModel.createNoteWith(title: title1, text: text1)
        viewModel.createNoteWith(title: title2, text: text2)
        viewModel.createNoteWith(title: title3, text: text3)
        
        // Then
        XCTAssertEqual(viewModel.notes.count, 3)
        XCTAssertEqual(viewModel.notes.first?.title, title1)
        XCTAssertEqual(viewModel.notes.first?.text, text1)
        XCTAssertEqual(viewModel.notes[1].title, title2)
        XCTAssertEqual(viewModel.notes[1].text, text2)
        XCTAssertEqual(viewModel.notes[2].title, title3)
        XCTAssertEqual(viewModel.notes[2].text, text3)
    }
    
    func testUpdateNote(){
        // Given
        let title: String = "title"
        let text: String = "text"
        
        viewModel.createNoteWith(title: title, text: text)
        
        let newTitle: String = "newTitle"
        let newText: String = "newText"
        
        // When
        if let identifier = viewModel.notes.first?.identifier{
            viewModel.updateNoteWith(identifier: identifier, newTitle: newTitle, newText: newText)
            // Then
            XCTAssertEqual(viewModel.notes.count, 1)
            XCTAssertEqual(viewModel.notes.first?.title, newTitle)
            XCTAssertEqual(viewModel.notes.first?.getText, newText)
        }else{
            XCTFail("No note was created!")
        }
    }
    
    func testDeleteNote(){
        // Given
        let title: String = "title"
        let text: String = "text"
        
        viewModel.createNoteWith(title: title, text: text)
        
        if let identifier = viewModel.notes.first?.identifier{
            // When
            viewModel.removeNoteWith(identifier: identifier)
            
            // Then
            XCTAssertEqual(viewModel.notes.count, 0)
            XCTAssert(viewModel.notes.isEmpty)
        }else{
            XCTFail("No note was created")
        }
    }
}
