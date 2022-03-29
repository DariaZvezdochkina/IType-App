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
                            SettingsCell(title: LocalizedStringKey("settingsView.notifications"), imgNmae: "bell", clr: Color("MainFrameColor"))
                        }
                        .foregroundColor(.black)
                        
                        Button(action: {}) {
                            SettingsCell(title: LocalizedStringKey("settingsView.profile"), imgNmae: "person", clr: Color("MainFrameColor"))
                        }
                        .foregroundColor(.black)
                    
                        Button(action: {}) {
                            SettingsCell(title: LocalizedStringKey("settingsView.aboutUs"), imgNmae: "message", clr: Color("MainFrameColor"))
                        }
                        .foregroundColor(.black)
                        Button(action: {}) {
                            SettingsCell(title: LocalizedStringKey("settingsView.help"), imgNmae: "questionmark.circle", clr: Color("MainFrameColor"))
                        }
                        .foregroundColor(.black)
                        
                    }
                    
                }
                .navigationTitle(LocalizedStringKey("settingsView.navigationTitle"))
            }
        }
    }
}



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView(route: .settings)
//              .environment(\.locale, .init(identifier: "ru"))

    }
}
