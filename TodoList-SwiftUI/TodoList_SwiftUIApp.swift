//
//  TodoList_SwiftUIApp.swift
//  TodoList-SwiftUI
//
//  Created by Trung Nguyen on 14/12/2022.
//

import SwiftUI

@main
struct TodoList_SwiftUIApp: App {
  
  @StateObject var listViewModel: TodoListViewModel = TodoListViewModel()
  
  var body: some Scene {
    WindowGroup {
      NavigationView {
        TodoListView()
      }
      .navigationViewStyle(.stack)
      .environmentObject(listViewModel)
    }
  }
}
