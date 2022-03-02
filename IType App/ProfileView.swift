//
//  ProfileView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 21.02.2022.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("resume")
                    .resizable()
                    .frame(width: 120, height: 130)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 40, trailing: 0))
                Text("Create your \nresume")
                    .fontWeight(.bold)
                    .font(.system(size: 34))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
                    .multilineTextAlignment(.center)
                Text("Fill information about yourself \nand your skills. It will help \nthe employee find you faster!")
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 70, trailing: 0))
                Button(action: {
                    print("Create tapped!")
                }) {
                    HStack {
                        Text("Create")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .frame(width: 150, height: 30)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("MainFrameColor"))
                    .cornerRadius(40)
                }
            }
            .navigationTitle("Profile")
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView(route: .profile)
    }
}
