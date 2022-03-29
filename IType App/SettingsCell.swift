//
//  SettingsCell.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 09.03.2022.
//

import SwiftUI

struct SettingsCell: View {
    
    var title: LocalizedStringKey
    var imgNmae: String
    var clr: Color
    
    var body: some View {
        HStack{
            Image(systemName: imgNmae)
                .resizable()
                .frame(width: 30, height:30)
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
        SettingsCell(title: "Notifications", imgNmae: "bell", clr: Color("MainFrameColor"))
    }
}
