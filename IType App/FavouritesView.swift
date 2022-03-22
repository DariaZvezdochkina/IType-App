//
//  FavouritesView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 09.03.2022.
//

import SwiftUI

struct FavouritesView: View {
    var body: some View {
        NavigationView{
            VStack {
                Image("favourites")
                    .resizable()
                    .frame(width: 120, height: 130)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 40, trailing: 0))
                Text("Add vacancies \nto favorites")
                    .fontWeight(.bold)
                    .font(.system(size: 34))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
                    .multilineTextAlignment(.center)
                Text("You can also add to the list \nby clicking on the Heart \nicon on the main page.")
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 70, trailing: 0))
                Button(action: {
                    print("Create tapped!")
                }) {
                    HStack {
                        Text("Search vacancies")
                            .fontWeight(.bold)
                            .font(.title)
                    }
                    .frame(width: 250, height: 30)
                    .padding()
                    .foregroundColor(Color("MainFrameColor"))
                    .background(.white)
                    .cornerRadius(40)
                    .shadow(color: Color("MainFrameColor"), radius: 5)
                }
                
            }
            .navigationTitle("Favourites")
        }
        .padding()
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView(route: .favourites)
    }
}
