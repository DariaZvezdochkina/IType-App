//
//  ContentView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 21.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State var isActive: Bool = false
    
    var body: some View {
        SplashView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
