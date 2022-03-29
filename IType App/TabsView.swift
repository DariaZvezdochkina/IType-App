//
//  HomeView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 21.02.2022.
//

import Foundation
import SwiftUI

struct TabsView: View {
    enum Route: String, Hashable {
        case home, profile, search, favourites, settings
    }
    
    @State var route: Route = .home
    
    var body: some View {
        VStack {
            TabView(selection: $route) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                            .accentColor(.black)
                        Text("Домой")
                    }
                    .tag(Route.home)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                            .foregroundColor(Color("MainFrameColor"))
                        Text("Профиль")
                    }
                    .tag(Route.profile)
              
              SearchView()
                  .tabItem {
                      Image(systemName: "magnifyingglass")
                          .foregroundColor(Color("MainFrameColor"))
                      Text("Поиск")
                  }
                  .tag(Route.search)
            
                FavouritesView()
                    .tabItem {
                        Image(systemName: "heart")
                            .foregroundColor(Color("MainFrameColor"))
                        Text("Избранное")
                    }
                    .tag(Route.favourites)
                
                
                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                            .foregroundColor(Color("MainFrameColor"))
                        Text("Настройки")
                    }
                    .tag(Route.settings)
            }
            
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
