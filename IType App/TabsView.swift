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
                
                Text("Person")
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(Route.profile)
                
                HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(Route.home)
                Text("Settings")
                    .tabItem {
                        Image(systemName: "gear")
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
