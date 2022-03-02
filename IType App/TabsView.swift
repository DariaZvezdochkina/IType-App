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
        case home, profile, settings
    }
    
    @State var route: Route = .home
    
    var body: some View {
        VStack {
            TabView(selection: $route) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                            .foregroundColor(Color("MainFrameColor"))
                        Text("Home")
                    }
                    .tag(Route.home)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                            .foregroundColor(Color("MainFrameColor"))
                        Text("Profile")
                    }
                    .tag(Route.profile)
                
                
                Text("Settings")
                    .tabItem {
                        Image(systemName: "gear")
                            .foregroundColor(Color("MainFrameColor"))
                        Text("Settings")
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
