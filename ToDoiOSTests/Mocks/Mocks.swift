//
//  Mocks.swift
//  ToDoiOSTests
//
//  Created by Carlos Alfredo Osorio Perez	 on 18/02/24.
//

@testable import ToDoiOS

import Foundation

var mockDatabase: [Note] = []

struct CreateNoteUseCaseMock: CreateNoteProtocol {
    func createNoteWith(title: String, text: String) throws {
        let note = Note(title: title, text: text, createdAt: .now)
        mockDatabase.append(note)
    }
}

struct FetchAllNotesUseCaseMock: FetchAllNotesProtocol {
    func fetchAll() throws -> [ToDoiOS.Note] {
        return mockDatabase
    }
}

struct UpdateNoteUseCaseMock: UpdateNoteProtocol{
    func updateNoteWith(identifier: UUID, title: String, text: String?) throws {
        if let index = mockDatabase.firstIndex(where: { $0.identifier == identifier }){
            mockDatabase[index].title = title
            mockDatabase[index].text = text
        }
    }
}

struct RemoveNoteUseCaseMock: RemoveNoteProtocol{
    func removeNoteWith(identifier: UUID) throws {
        if let index = mockDatabase.firstIndex(where: { $0.identifier == identifier }){
            mockDatabase.remove(at: index)
        }
    }
}
