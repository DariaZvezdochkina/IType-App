//
//  SettingsView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 03.03.2022.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        Button(action: {}) {
                            SettingsCell(title: "Notifications", imgNmae: "bell", clr: Color("MainFrameColor"))
                        }
                        .foregroundColor(.black)
                        Button(action: {}) {
                            SettingsCell(title: "Profile", imgNmae: "person", clr: Color("MainFrameColor"))
                        }
                        .foregroundColor(.black)
                    
                        Button(action: {}) {
                            SettingsCell(title: "About us", imgNmae: "message", clr: Color("MainFrameColor"))
                        }
                        .foregroundColor(.black)
                        Button(action: {}) {
                            SettingsCell(title: "Help", imgNmae: "questionmark.circle", clr: Color("MainFrameColor"))
                        }
                        .foregroundColor(.black)
                        
                    }
                    
                }
                .navigationTitle("Settings")
            }
        }
    }
}



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView(route: .settings)
    }
}
