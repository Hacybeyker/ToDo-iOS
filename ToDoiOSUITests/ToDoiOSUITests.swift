//
//  ToDoiOSUITests.swift
//  ToDoiOSUITests
//
//  Created by Carlos Alfredo Osorio Perez	 on 18/02/24.
//

import XCTest

final class ToDoiOSUITests: XCTestCase {

    func testCreateNote() throws {
        let app = XCUIApplication()
        app.launch()
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear nota"]/*[[".otherElements[\"Crear nota\"]",".buttons[\"Crear nota\"].staticTexts[\"Crear nota\"]",".staticTexts[\"Crear nota\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews

        let titleTextView = collectionViewsQuery.textViews.matching(identifier: "create_note_title_identifier").element
        titleTextView.tap()
        titleTextView.typeText("title")
        
        let textTextView = collectionViewsQuery.textViews.matching(identifier: "create_note_text_identifier").element
        textTextView.tap()
        textTextView.typeText("text")

        app.navigationBars["Nueva Nota"]/*@START_MENU_TOKEN@*/.buttons["Crear Nota"]/*[[".otherElements[\"Crear Nota\"].buttons[\"Crear Nota\"]",".buttons[\"Crear Nota\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testCreateTwoNotes() throws {
        let app = XCUIApplication()
        app.launch()
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear nota"]/*[[".otherElements[\"Crear nota\"]",".buttons[\"Crear nota\"].staticTexts[\"Crear nota\"]",".staticTexts[\"Crear nota\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews

        let titleTextView = collectionViewsQuery.textViews.matching(identifier: "create_note_title_identifier").element
        titleTextView.tap()
        titleTextView.typeText("title")
        
        let textTextView = collectionViewsQuery.textViews.matching(identifier: "create_note_text_identifier").element
        textTextView.tap()
        textTextView.typeText("text")

        app.navigationBars["Nueva Nota"]/*@START_MENU_TOKEN@*/.buttons["Crear Nota"]/*[[".otherElements[\"Crear Nota\"].buttons[\"Crear Nota\"]",".buttons[\"Crear Nota\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear nota"]/*[[".otherElements[\"Crear nota\"]",".buttons[\"Crear nota\"].staticTexts[\"Crear nota\"]",".staticTexts[\"Crear nota\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        titleTextView.tap()
        titleTextView.typeText("title2")
        
        textTextView.tap()
        textTextView.typeText("text2")

        app.navigationBars["Nueva Nota"]/*@START_MENU_TOKEN@*/.buttons["Crear Nota"]/*[[".otherElements[\"Crear Nota\"].buttons[\"Crear Nota\"]",".buttons[\"Crear Nota\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testRemoveNote() throws {
        let app = XCUIApplication()
        app.launch()
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear nota"]/*[[".otherElements[\"Crear nota\"]",".buttons[\"Crear nota\"].staticTexts[\"Crear nota\"]",".staticTexts[\"Crear nota\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews

        let titleTextView = collectionViewsQuery.textViews.matching(identifier: "create_note_title_identifier").element
        titleTextView.tap()
        titleTextView.typeText("title")
        
        let textTextView = collectionViewsQuery.textViews.matching(identifier: "create_note_text_identifier").element
        textTextView.tap()
        textTextView.typeText("text")

        app.navigationBars["Nueva Nota"]/*@START_MENU_TOKEN@*/.buttons["Crear Nota"]/*[[".otherElements[\"Crear Nota\"].buttons[\"Crear Nota\"]",".buttons[\"Crear Nota\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let firstNote = collectionViewsQuery.cells.element(boundBy: 0)
        firstNote.tap()
        app.buttons["Eliminar Nota"].tap()
    }

}
