//
//  CarouselCardView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 07.04.2022.
//

import SwiftUI

struct CarouselCardView: View {
  var card: CarouselCard
  var body: some View {
    RoundedRectangle(cornerRadius: 30)
      .shadow(color: Color("MainFrameColor"), radius: 2)
      .overlay(
        HStack {
          VStack(alignment: .leading) {
            
            Image("\(card.imgName)")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 60, height: 60)
              .clipped()
          }
            .foregroundColor(.black)
            .padding()
          Spacer()
        }
       
      )
      .foregroundColor(Color.white)
      .frame(width: 300)
  }
}
