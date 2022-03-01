//
//  HomeView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 01.03.2022.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            ScrollView {
                HStack(spacing: 16) {
                    ForEach(0 ..< 5) { item in
                        GeometryReader { geometry in
                            RoundedRectangle(cornerRadius: 30)
                                .rotation3DEffect(
                                    Angle(
                                        degrees: Double((geometry.frame(in: .global).minX - 20) / -20)
                                    ),
                                    axis: (x: 0, y: 1, z: 0),
                                    anchor: .center,
                                    anchorZ: 0.0,
                                    perspective: 1.0
                                )
                        }
                        .frame(width: 150, height: 150)
                    }
                }
                .padding()
                VStack(alignment: .trailing) {
                    Text("Vacancies for You")
                    Spacer()
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Home")
                .searchable(text: $searchText, prompt: "Job title, key words")
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView(route: .home)
    }
}
