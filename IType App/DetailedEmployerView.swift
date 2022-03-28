//
//  CompanyView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 28.03.2022.
//

import SwiftUI

struct DetailedEmployerView: View {
  @ObservedObject private var viewModel: DetailedEmployerViewModel
  @State private var dynamicHeight: CGFloat = .zero
  
  
  init(viewModel: DetailedEmployerViewModel) {
    self.viewModel = viewModel
  }
  var body: some View {
    if let detailedEmployer = viewModel.detailedEmployer, let description = viewModel.employerDescription {
      ScrollView {
        VStack (spacing: 10) {
          Text(detailedEmployer.area.name)
            .font(.headline)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
          Text(detailedEmployer.name)
            .foregroundColor(Color("MainFrameColor"))
            .font(.title)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
          Text(detailedEmployer.siteURL)
            .foregroundColor(Color("MainFrameColor"))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
          HStack {
            AsyncImage(url: URL(string: detailedEmployer.logoUrls.original)) { image in
              image.resizable()
            } placeholder: {
              ProgressView()
            }
            .frame(width: 130, height: 130, alignment: .leading)
            Spacer()
          }
          .padding()
          Text(description)
            .padding(.horizontal)
            .padding(.top)
          Text("Отрасли: ")
            .font(.headline)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
          
          ForEach(detailedEmployer.industries) { industry in
            
            Text(industry.name)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.leading, 16)
          }
          Text("Открытые вакансии: \(detailedEmployer.openVacancies)")
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
        }
      }
    } else {
      ProgressView()
        .progressViewStyle(.circular)
        .padding()
        .task {
          await viewModel.fetchEmployer()
        }
      
    }
    
  }
}

struct DetailedEmployerView_Previews: PreviewProvider {
  static var previews: some View {
    DetailedEmployerView(viewModel: .init(employerId: "2901591"))
    
    
  }
}
