//
//  SearchView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 29.03.2022.
//

import SwiftUI

struct SearchView: View {
  @ObservedObject private var searchViewModel = SearchViewModel()
  @State var presentPopup = false
  @State var selectedItem: Int = 1
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
                .resizable()
                .frame(width: 28, height: 28)
            }
            Spacer()
            Text("Search")
              .fontWeight(.semibold)
              .font(.title)
              .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
            
            Button {
              presentPopup = true
              
            } label: { Image(systemName: "slider.vertical.3")
                .resizable()
                .frame(width: 28, height: 28)
              .foregroundColor(Color("MainFrameColor")) }
            .popover(isPresented: $presentPopup) {
              VStack {
                Text("Pull down to close")
                  .padding()
                Spacer()
                VStack {
                  Text("Salary")
                    .fontWeight(.semibold)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                  HStack {
                    Text("To:")
                    Spacer()
                    TextField("Type amount", text: $searchViewModel.salary)
                  }
                }
                Spacer()
                VStack {
                  Text("Schedule")
                    .fontWeight(.semibold)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                  VStack {
                    HStack{
                      Text("Choose:")
                      Spacer()
                      Picker("Color", selection: $selectedItem) {
                        Text("Red").tag(0)
                        Text("Blue").tag(1)
                        Text("Green").tag(2)
                      }
                    }
                  }
                }
                Spacer()
              }
              .padding()
            }
          }
          

        }
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .searchable(text: $searchViewModel.searchText, prompt: LocalizedStringKey("homeView.searchKeyTerms"))
      }
    }
  }
}



struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    TabsView(route: .search)
  }
}
