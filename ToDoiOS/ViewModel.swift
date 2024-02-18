//
//  ViewModel.swift
//  ToDoiOS
//
//  Created by Carlos Alfredo Osorio Perez on 12/12/23.
//

import Foundation
import Observation

@Observable
class ViewModel {
    
    var notes: [Note]
    var databaseError: DatabaseError?
    
    var createNoteUseCase: CreateNoteProtocol
    var fetchAllNotesUseCase: FetchAllNotesProtocol
    var updateNoteUseCase: UpdateNoteProtocol
    var removeNoteUseCase: RemoveNoteProtocol
    
    init(notes: [Note] = [],
         createNoteUseCase: CreateNoteProtocol = CreateNoteUseCase(),
         fetchAllNotesUseCase: FetchAllNotesProtocol = FetchAllNotesUseCase(),
         updateNoteUse: UpdateNoteProtocol = UpdateNoteUseCase(),
         removeNoteUseCase: RemoveNoteProtocol = RemoveNoteUseCase()
    ) {
        self.notes = notes
        self.createNoteUseCase = createNoteUseCase
        self.fetchAllNotesUseCase = fetchAllNotesUseCase
        self.updateNoteUseCase = updateNoteUse
        self.removeNoteUseCase = removeNoteUseCase
        fetchAllNotes()
    }
    
    func createNoteWith(title: String, text: String) {
        //let note: Note = .init(title: title, text: text, createdAt: .now)
        //notes.append(note)
        do {
            try createNoteUseCase.createNoteWith(title: title, text: text)
            fetchAllNotes()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func fetchAllNotes() {
        do {
            notes = try fetchAllNotesUseCase.fetchAll()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func updateNoteWith(identifier: UUID, newTitle: String, newText: String?) {
        do{
            try updateNoteUseCase.updateNoteWith(identifier: identifier, title: newTitle, text: newText)
        }catch{
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func removeNoteWith(identifier: UUID) {
        do{
            try removeNoteUseCase.removeNoteWith(identifier: identifier)
            fetchAllNotes()
        }catch let error as DatabaseError {
            print("Error: \(error.localizedDescription)")
            databaseError = error
        }catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
