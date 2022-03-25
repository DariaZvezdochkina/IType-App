//
//  VacancyView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 09.03.2022.
//
import Foundation
import SwiftUI

struct DetailedVacancyView: View {
  @ObservedObject private var viewModel: DetailedVacancyViewModel
  
  init(viewModel: DetailedVacancyViewModel) {
    self.viewModel = viewModel
  }
  var body: some View {
    if let detailedVacancy = viewModel.detailedVacancy {
      ScrollView {
        VStack {
          HStack {
            Text(detailedVacancy.name)
              .font(.title)
              .fontWeight(.bold)
            if let salary = detailedVacancy.salary {
              Text(salary.description)
            }
          }
          .padding()
          Text(detailedVacancy.vacanciesDescription)
            .padding()
        }
      }
    } else {
      ProgressView()
        .progressViewStyle(.circular)
        .padding()
        .task {
          await viewModel.fetchVacancy()
        }
    }
  }
}

struct DetailedVacancyView_Previews: PreviewProvider {
  static var previews: some View {
    DetailedVacancyView(viewModel: .init(vacancyId: "53735875"))
  }
}
