//
//  HomeSmallCardView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 25.03.2022.
//

import SwiftUI

struct HomeSmallCardView: View {
  var card: HomeSmallCard
  var body: some View {
    RoundedRectangle(cornerRadius: 30)
      .shadow(color: Color("MainFrameColor"), radius: 4)
      .overlay(
        HStack {
          VStack(alignment: .leading) {
            
            Image("\(card.imageName)")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 60, height: 60)
              .clipped()
            Text(card.title)
              .font(.headline)
            
          }
            .foregroundColor(.black)
            .padding()
          Spacer()
        }
       
      )
      .foregroundColor(Color.white)
      .frame(width: 145, height: 145)
  }
}

