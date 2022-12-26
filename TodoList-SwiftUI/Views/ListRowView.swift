//
//  ListRowView.swift
//  TodoList-SwiftUI
//
//  Created by Trung Nguyen on 14/12/2022.
//

import SwiftUI

struct ListRowView: View {
  
  let item: TodoItemModel
  
  var body: some View {
    HStack {
      Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
        .foregroundColor(item.isCompleted ? .green : .black)
      Text(item.title)
        .foregroundColor(item.isCompleted ? .green : .black)
      Spacer()
    }
    .font(.title2)
    .padding(.vertical, 8)
  }
}

struct ListRowView_Previews: PreviewProvider {
  
  static var item1 = TodoItemModel(title: "Clean home", isCompleted: false)
  static var item2 = TodoItemModel(title: "Cooking", isCompleted: true)
  
  static var previews: some View {
    Group {
      ListRowView(item: item1)
      ListRowView(item: item2)
    }
    .previewLayout(.sizeThatFits)
  }
}
