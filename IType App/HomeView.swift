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
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0 ..< 5) { item in
                            GeometryReader { geometry in
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundColor(Color.white)
                                    .shadow(color: Color("MainFrameColor"), radius: 5)
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
                            .frame(width: 160, height: 160)
                        }
                    }
                    .padding()
                }
                VStack(alignment: .trailing) {
                    Text("Vacancies for You")
                    Spacer()
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Home")
                .searchable(text: $searchText, prompt: "Job title, key words")
                Spacer()
                VStack(alignment: .trailing, spacing: 30) {
                    ForEach(0..<3) { item in
                        RoundedRectangle(cornerRadius: 30)
                    }
                    .foregroundColor(Color.white)
                    .shadow(color: Color("MainFrameColor"), radius: 5)
                    .frame(width: 350, height: 500)
                }
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView(route: .home)
    }
}
