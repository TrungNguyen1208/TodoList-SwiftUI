//
//  TodoItemModel.swift
//  TodoList-SwiftUI
//
//  Created by Trung Nguyen on 18/12/2022.
//

import Foundation

struct TodoItemModel: Identifiable, Codable {
  let id: String
  let title: String
  let isCompleted: Bool
  
  init(
    id: String = UUID().uuidString,
    title: String,
    isCompleted: Bool
  ) {
    self.id = id
    self.title = title
    self.isCompleted = isCompleted
  }
  
  func updateCompletion() -> TodoItemModel {
    TodoItemModel(id: id, title: title, isCompleted: !isCompleted)
  }
}
