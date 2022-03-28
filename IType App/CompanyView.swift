//
//  CompanyView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 28.03.2022.
//

import SwiftUI

struct CompanyView: View {
  private let detailedVacancy: DetailedVacancy
  
  init(detailedVacancy: DetailedVacancy) {
    self.detailedVacancy = detailedVacancy
  }
    var body: some View {
      ScrollView {
        HStack {
          AsyncImage(url: URL(string: detailedVacancy.employer.logoUrls.original)) { image in
            image.resizable()
          } placeholder: {
            ProgressView()
          }
          .frame(width: 100, height: 100, alignment: .leading)
          Spacer()
        }
        .padding()
        Text(detailedVacancy.employer.name)
          .font(.headline)
          .fontWeight(.bold)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.leading, 16)
      }
        
    }
}

private struct CompanyWrapperView: View {
  @ObservedObject var viewModel: DetailedVacancyViewModel
  
  var body: some View {
    VStack {
      if let detailedVacancy = viewModel.detailedVacancy {
        CompanyView(detailedVacancy: detailedVacancy)
      } else {
        ProgressView()
      }
    }
    .task {
      await viewModel.fetchVacancy()
    }
  }
}
struct CompanyView_Previews: PreviewProvider {
    static var previews: some View {
      CompanyWrapperView(viewModel: .init(vacancyId: "53735875"))
    }
}
