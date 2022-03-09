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
            List {
                Section {
                    Button(action: {}) {
                        SettingsCell(title: "Notifications", imgNmae: "iphone.radiowaves.left.and.right", clr: Color("MainFrameColor"))
                    }
                    Button(action: {}) {
                        SettingsCell(title: "Profile", imgNmae: "person", clr: Color("MainFrameColor"))
                    }
                
                    Button(action: {}) {
                        SettingsCell(title: "About us", imgNmae: "message", clr: Color("MainFrameColor"))
                    }
                    Button(action: {}) {
                        SettingsCell(title: "Help", imgNmae: "questionmark.circle", clr: Color("MainFrameColor"))
                    }
                    
                }
                Section {
                    Button(action: {}) {
                        SettingsCell(title: "Log out", imgNmae: "iphone.radiowaves.left.and.right", clr: Color("MainFrameColor"))
                    }
                }
                
            }
            
            .navigationTitle("Settings")
        }
    }
}



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
