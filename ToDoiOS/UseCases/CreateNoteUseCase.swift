//
//  CreateNoteUseCase.swift
//  ToDoiOS
//
//  Created by Carlos Alfredo Osorio Perez	 on 14/12/23.
//

import Foundation

protocol CreateNoteProtocol{
    func createNoteWith(title: String, text: String) throws
}

struct CreateNoteUseCase: CreateNoteProtocol {
    var notesDatabase: NotesDatabasesProtocol
    
    init(notesDatabase: NotesDatabasesProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func createNoteWith(title: String, text: String) throws {
        let note: Note = .init(identifier: .init(), title: title, text: text, createdAt: .now)
        try notesDatabase.insert(note: note)
        
    }
}
