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
                    Text("Profile picture")
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
