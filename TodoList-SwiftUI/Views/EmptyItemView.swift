//
//  EmptyItemView.swift
//  TodoList-SwiftUI
//
//  Created by Trung Nguyen on 25/12/2022.
//

import SwiftUI

struct EmptyItemView: View {
  
  var body: some View {
    ScrollView {
      VStack(spacing: 10) {
        Text("There are no items!")
          .font(.title)
          .fontWeight(.semibold)
        
        Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
        
        NavigationLink(destination: AddView(), label: {
          Text("Add something 🥹")
            .foregroundColor(.white)
            .font(.headline)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
        })
      }
      .multilineTextAlignment(.center)
      .padding(35)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
  }
}

struct EmptyItemView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      EmptyItemView()
        .navigationTitle("Title")
    }
  }
}
