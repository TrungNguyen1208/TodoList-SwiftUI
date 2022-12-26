//
//  TodoListViewModel.swift
//  TodoList-SwiftUI
//
//  Created by Trung Nguyen on 18/12/2022.
//

import Foundation

final class TodoListViewModel: ObservableObject {
  
  @Published var items: [TodoItemModel] = [] {
    didSet {
      saveItems()
    }
  }
  let itemsKey: String = "items_list"
  
  init() {
    getItems()
  }
  
  func getItems() {
    guard let data = UserDefaults.standard.data(forKey: itemsKey),
          let savedItems = try? JSONDecoder().decode([TodoItemModel].self, from: data) else {
      return
    }
    items = savedItems
  }
  
  func addItem(title: String) {
    let newItem = TodoItemModel(title: title, isCompleted: false)
    items.append(newItem)
  }
  
  func deleteItem(indexSet: IndexSet) {
    items.remove(atOffsets: indexSet)
  }
  
  func moveItem(from oldIndex: IndexSet, to newIndex: Int) {
    items.move(fromOffsets: oldIndex, toOffset: newIndex)
  }
  
  func updateItem(item: TodoItemModel) {
    if let index = items.firstIndex(where: { $0.id == item.id }) {
      items[index] = item.updateCompletion()
    }
  }
  
  func saveItems() {
    if let encodedData = try? JSONEncoder().encode(items) {
      UserDefaults.standard.setValue(encodedData, forKey: itemsKey)
    }
  }
}
