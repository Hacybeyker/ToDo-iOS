//
//  RemoveNoteUseCase.swift
//  ToDoiOS
//
//  Created by Carlos Alfredo Osorio Perez	 on 18/02/24.
//

import Foundation

protocol RemoveNoteProtocol {
    func removeNoteWith(identifier: UUID) throws
}

struct RemoveNoteUseCase: RemoveNoteProtocol {
    var notesDataBase: NotesDatabasesProtocol
    
    init(notesDataBase: NotesDatabasesProtocol = NotesDatabase.shared) {
        self.notesDataBase = notesDataBase
    }
    
    func removeNoteWith(identifier: UUID) throws {
        try notesDataBase.remove(identifier: identifier)
    }
    
    
}
