//
//  FetchAllNotesUseCase.swift
//  ToDoiOS
//
//  Created by Carlos Alfredo Osorio Perez	 on 14/12/23.
//

import Foundation

protocol FetchAllNotesProtocol {
    func fetchAll() throws -> [Note]
}

struct FetchAllNotesUseCase: FetchAllNotesProtocol {
    var notesDatabase: NotesDatabasesProtocol
    
    init(notesDatabase: NotesDatabasesProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func fetchAll() throws -> [Note] {
        try notesDatabase.fetchAll()
    }
}
