//
//  HomeView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 01.03.2022.
//

import SwiftUI

struct HomeView: View {
  @ObservedObject private var vacanciesViewModel = VacanciesViewModel()
  @State var homeSmallCards = [
    HomeSmallCard(imageName: "createResume", title: LocalizedStringKey("homeView.createResumeCard")),
    HomeSmallCard(imageName: "jobsNear", title: LocalizedStringKey("homeView.jobsNearCard")),
    HomeSmallCard(imageName: "news", title: LocalizedStringKey("homeView.newsCard"))
  ]
  
  var body: some View {
    NavigationView {
      ScrollView {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 7) {
            ForEach(homeSmallCards) { card in
              GeometryReader { geometry in
                HomeSmallCardView(card: card)
                  .rotation3DEffect(
                    Angle(
                      degrees: Double((geometry.frame(in: .global).minX - 20) / -20)
                    ),
                    axis: (x: 0, y: 1, z: 0),
                    anchor: .center,
                    anchorZ: 0.0,
                    perspective: 1.0
                  )
              }
              .frame(width: 150, height: 150)
            }
          }
          .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        VStack(alignment: .trailing) {
          Text(LocalizedStringKey("homeView.vacanciesForYou"))
            .fontWeight(.semibold)
            .font(.title)
            .frame(maxWidth: .infinity, alignment: .leading)
          Spacer()
        }
        .padding()
        Spacer()
        VStack(spacing: 10) {
          ForEach(vacanciesViewModel.vacanciesResult) { vacancy in
            RoundedRectangle(cornerRadius: 30)
              .shadow(color: Color("MainFrameColor"), radius: 3)
              .overlay(
                VStack {
                  NavigationLink(destination: DetailedVacancyView(viewModel: .init(vacancyId: vacancy.id))) {
                    VStack (spacing: 5) {
                      Text(vacancy.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()

                      Text(vacancy.area.name)
                        .font(.headline)
                        .fontWeight(.bold)
                      Text(vacancy.employer.name)
                        .font(.headline)
                        .fontWeight(.bold)
                      if let requirement = vacancy.snippet.requirement {
                        Text(requirement)
                          .font(.footnote)
                          .padding()
                      }
                      Spacer()
                      if let salary = vacancy.salary {
                        Text(salary.description)
                          .font(.headline)
                          .fontWeight(.bold)
                          .frame(maxWidth: .infinity, alignment: .trailing)
                          .padding(.trailing, 16)
                          
                      }
                      Text(vacancy.schedule.description)
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 16)
                        .padding(.bottom, 10)
                    }
                    .foregroundColor(.black)
                  }
                }
              )
          }
          .foregroundColor(Color.white)
          .frame(height: 300)
          .padding()
        }
      }
    }
    .task {
      do {
        try await vacanciesViewModel.fetchVacancies()
      } catch {
        print(error.localizedDescription)
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    TabsView(route: .home)
//                        .environment(\.locale, .init(identifier: "ru"))

  }
}
