//
//  UpdateNoteView.swift
//  ToDoiOS
//
//  Created by Carlos Alfredo Osorio Perez	 on 12/12/23.
//

import SwiftUI

struct UpdateNoteView: View {

  var viewModel: ViewModel
  let identifier: UUID
  @State var title: String = ""
  @State var text: String = ""

  @Environment(\.dismiss) private var dismiss

  var body: some View {
    VStack {
      Form {
        Section {
          TextField("", text: $title, prompt: Text("*Titulo"), axis: .vertical)
          TextField("", text: $text, prompt: Text("*Texto"), axis: .vertical)
        }
      }
        Button(action: {
            viewModel.removeNoteWith(identifier: identifier)
            dismiss()
        }, label: {
            Text("Eliminar Nota")
                .foregroundStyle(.gray)
                .underline()
        })
        .buttonStyle(BorderedButtonStyle())
        Spacer()
    }
    .background(Color(uiColor: .systemGroupedBackground))
    .toolbar {
      ToolbarItem(placement: .topBarTrailing) {
        Button {
          viewModel.updateNoteWith(identifier: identifier, newTitle: title, newText: text)
            dismiss()
        } label: {
          Text("Guardar")
            .bold()
        }
      }
    }
    .navigationTitle("Modificar Nota")
  }
}

#Preview {
    NavigationStack{
        UpdateNoteView(viewModel: ViewModel.init(), identifier: .init(), title: "Demo 1", text: "Description 1")
      }
    }
