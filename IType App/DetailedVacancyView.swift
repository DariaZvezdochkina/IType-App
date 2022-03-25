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
        VStack (spacing: 10){
          Text(detailedVacancy.name)
            .font(.title)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
          Text(detailedVacancy.employer.name)
            .font(.headline)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
          if let salary = detailedVacancy.salary {
            Text(salary.description)
              .font(.headline)
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.leading, 16)
          }
          Text("Опыт работы: \(detailedVacancy.experience.name)")
            .font(.headline)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
          Text(detailedVacancy.vacanciesDescription)
            .padding()
          Text("Ключевые навыки: ")
            .font(.headline)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
          ForEach(detailedVacancy.keySkills) { skill in
            Text(skill.name)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.leading, 16)
          }
          Text("Специализация: ")
            .font(.headline)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
          ForEach(detailedVacancy.specializations) { specialization in
            Text(specialization.name)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.leading, 16)
          }
//          Button(action: {}) {
//                      Text("Start Over")
//            }
//          .shadow(color: Color.black, radius: 20)
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
