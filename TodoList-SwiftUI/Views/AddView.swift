//
//  AddView.swift
//  TodoList-SwiftUI
//
//  Created by Trung Nguyen on 14/12/2022.
//

import SwiftUI

struct AddView: View {
  
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var listViewModel: TodoListViewModel
  @State var textFieldText: String = ""
  
  @State var alertTitle: String = ""
  @State var showAlert: Bool = false
  
  var body: some View {
    ScrollView {
      VStack {
        TextField("Add new work need to do", text: $textFieldText)
          .padding()
          .frame(height: 55)
          .background(Color.gray.opacity(0.2))
          .cornerRadius(10)
        Spacer(minLength: 16)
        Button(action: saveButtonPressed, label: {
          Text("Save".uppercased())
            .foregroundColor(.white)
            .font(.headline)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
        })
      }
      .padding(14)
    }
    .navigationTitle("Add an Item 📝")
    .alert(isPresented: $showAlert, content: getAlert)
  }
  
  func saveButtonPressed() {
    if textIsValid() {
      listViewModel.addItem(title: textFieldText)
      presentationMode.wrappedValue.dismiss()
    }
  }
  
  func textIsValid() -> Bool {
    if textFieldText.count < 3 {
      alertTitle = "Your new todo item must be at least 3 charaters!!! 🥹"
      showAlert.toggle()
      return false
    }
    return true
  }
  
  func getAlert() -> Alert {
    Alert(title: Text(alertTitle))
  }
}

struct AddView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      AddView()
    }
    .environmentObject(TodoListViewModel())
  }
}
