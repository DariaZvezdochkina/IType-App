//
//  VacancyView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 09.03.2022.
//

import SwiftUI

struct DetailedVacancyView: View {
  @ObservedObject private var viewModel: DetailedVacancyViewModel
  @State var shouldPresentError = false
  
  init(viewModel: DetailedVacancyViewModel) {
      self.viewModel = viewModel
  }
    var body: some View {
        NavigationView {
            VStack {
                
            }
        }
    }
}

struct DetailedVacancyView_Previews: PreviewProvider {
    static var previews: some View {
      DetailedVacancyView(viewModel: .init(vacancyId: "53735875"))
    }
}
