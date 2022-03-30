//
//  SearchView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 29.03.2022.
//

import SwiftUI

struct SearchView: View {
  @State private var searchText = ""
  var body: some View {
    NavigationView {
      ScrollView {
        VStack {
          HStack {
            Button(action: {
              print("button pressed")
              
            }) {
              Image(systemName: "clear")
                .renderingMode(.original)
            }
            Spacer()
            Text("Search")
              .fontWeight(.semibold)
              .font(.title)
              .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
            Button(action: {
              print("button pressed")
              
            }) {
              Image(systemName: "slider.vertical.3")
            }
          }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .searchable(text: $searchText, prompt: LocalizedStringKey("homeView.searchKeyTerms"))
      }
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    TabsView(route: .search)
  }
}
