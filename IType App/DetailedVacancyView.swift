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
  @State private var dynamicHeight: CGFloat = .zero
  
  init(viewModel: DetailedVacancyViewModel) {
    self.viewModel = viewModel
  }
  var body: some View {
    if let detailedVacancy = viewModel.detailedVacancy, let description = viewModel.vacancyDescription {
      ScrollView {
        Group {
          VStack (spacing: 10){
            Text(detailedVacancy.name)
              .font(.title)
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.leading, 16)
            NavigationLink(destination: DetailedEmployerView(viewModel: .init(employerId: detailedVacancy.employer.id))) {
                VStack {
                  HStack {
                    AsyncImage(url: URL(string: detailedVacancy.employer.logoUrls.original)) { image in
                      image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    } placeholder: {
                      ProgressView()
                    }
                    .frame(height: 100, alignment: .leading)
                    Spacer()
                  }
                  .padding()
                  Text(detailedVacancy.employer.name)
                    .foregroundColor(Color("MainFrameColor"))
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                }
              }
            
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
            Text(description)
              .padding(.horizontal)
              .padding(.top)
            Text("Ключевые навыки: ")
              .font(.headline)
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.leading, 16)
            ForEach(detailedVacancy.keySkills) { skill in
              HStack {
                Image(systemName: "circle.fill")
                  .resizable()
                  .frame(width: 4, height: 4)
                Spacer()
                Text(skill.name)
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding(.leading, 16)
                  .padding(.trailing, 25)

              }
              .padding(.bottom, 10)
              .padding(.leading, 50)
            }
            Text("Специализация: ")
              .font(.headline)
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.leading, 16)
              .padding(.top, 10)
            
            ForEach(detailedVacancy.specializations) { specialization in
              HStack {
                Image(systemName: "circle.fill")
                  .resizable()
                  .frame(width: 4, height: 4)
                Spacer()
                Text(specialization.name)
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding(.leading, 16)
                  .padding(.trailing, 25)
              }
              .padding(.bottom, 10)
              .padding(.leading, 50)
            }
            
          }
          Button(action: {}) {
            Text(LocalizedStringKey("detailedVacancyView.respondButton"))
              .foregroundColor(Color("MainFrameColor"))
              .frame(maxWidth: .infinity)
              .frame(height: 44)
              .overlay(
                Capsule()
                  .stroke(Color("MainFrameColor"))
                  .shadow(color: Color("MainFrameColor"), radius: 20)
              )
              .padding(.horizontal, 16)
              .padding(.top, 8)
              .padding(.bottom, 8)
          }
        }
        
      }
      .navigationBarTitleDisplayMode(.inline)

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
    NavigationView {
      DetailedVacancyView(viewModel: .init(vacancyId: "53735875"))
    }
//                            .environment(\.locale, .init(identifier: "ru"))

  }
}
