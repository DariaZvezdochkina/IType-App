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
                        Text(LocalizedStringKey("tabsView.home"))
                    }
                    .tag(Route.home)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                            .foregroundColor(Color("MainFrameColor"))
                        Text(LocalizedStringKey("tabsView.profile"))
                    }
                    .tag(Route.profile)
              
              SearchView()
                  .tabItem {
                      Image(systemName: "magnifyingglass")
                          .foregroundColor(Color("MainFrameColor"))
                      Text(LocalizedStringKey("tabsView.search"))
                  }
                  .tag(Route.search)
            
                FavouritesView()
                    .tabItem {
                        Image(systemName: "heart")
                            .foregroundColor(Color("MainFrameColor"))
                        Text(LocalizedStringKey("tabsView.favorites"))
                    }
                    .tag(Route.favourites)
                
                
                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                            .foregroundColor(Color("MainFrameColor"))
                        Text(LocalizedStringKey("tabsView.settings"))
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
