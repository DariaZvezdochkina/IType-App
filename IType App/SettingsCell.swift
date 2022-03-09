//
//  SettingsCell.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 09.03.2022.
//

import SwiftUI

struct SettingsCell: View {
    
    var title: String
    var imgNmae: String
    var clr: Color
    
    var body: some View {
        HStack{
            Image(systemName: imgNmae)
                .font(.headline)
                .foregroundColor(clr)
            
            Text(title)
                .font(.headline)
                .padding(.leading)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.headline)
                .foregroundColor(.gray)
        }
    }
}

struct SettingsCell_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCell(title: "Notifications", imgNmae: "iphone.radiowaves.left.and.right", clr: Color("MainFrameColor"))
    }
}
