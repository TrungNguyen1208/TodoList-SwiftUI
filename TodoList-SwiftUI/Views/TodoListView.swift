//
//  TodoListView.swift
//  TodoList-SwiftUI
//
//  Created by Trung Nguyen on 14/12/2022.
//

import SwiftUI

struct TodoListView: View {
  
  @EnvironmentObject var listViewModel: TodoListViewModel
  
  var body: some View {
    ZStack {
      if listViewModel.items.isEmpty {
        EmptyItemView()
          .transition(AnyTransition.opacity.animation(.easeIn))
      } else {
        List {
          ForEach(listViewModel.items) { item in
            ListRowView(item: item)
              .onTapGesture {
                withAnimation(.linear) {
                  listViewModel.updateItem(item: item)
                }
              }
          }
          .onDelete(perform: listViewModel.deleteItem)
          .onMove(perform: listViewModel.moveItem)
        }
      }
    }
    .listStyle(PlainListStyle())
    .navigationTitle("Todo List 📝")
    .navigationBarItems(
      leading: EditButton(),
      trailing:NavigationLink("Add", destination: AddView())
    )
  }
}

struct TodoListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      TodoListView()
    }
    .environmentObject(TodoListViewModel())
  }
}
