//
//  UpdateNoteUseCase.swift
//  ToDoiOS
//
//  Created by Carlos Alfredo Osorio Perez	 on 15/01/24.
//

import Foundation

protocol UpdateNoteProtocol {
    func updateNoteWith(identifier: UUID, title: String, text: String?) throws
}

struct UpdateNoteUseCase: UpdateNoteProtocol {
    var notesDatabase: NotesDatabasesProtocol
    
    init(notesDatabase: NotesDatabasesProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func updateNoteWith(identifier: UUID, title: String, text: String?) throws {
        try notesDatabase.update(identifier: identifier, title: title, text: text)
    }
}
