//
//  HomeView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 01.03.2022.
//

import SwiftUI

struct HomeView: View {
  @State private var searchText = ""
  @ObservedObject private var vacanciesViewModel = VacanciesViewModel()
  @State var homeSmallCards = [
    HomeSmallCard(image: Image("createResume"), title: "Create your first Resume"),
    HomeSmallCard(image: Image("jobsNear"), title: "Jobs Near You"),
    HomeSmallCard(image: Image("news"), title: "News")
  ]
  
  var body: some View {
    NavigationView {
      ScrollView {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 15) {
            ForEach(homeSmallCards.indices) { index in
              GeometryReader { geometry in
                HomeSmallCardView(card: self.homeSmallCards[index])
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
        VStack(alignment: .trailing) {
          Text("Vacancies for You")
            .fontWeight(.semibold)
            .font(.title)
            .frame(maxWidth: .infinity, alignment: .leading)
          Spacer()
        }
        .padding()
        .navigationTitle("Home")
        .searchable(text: $searchText, prompt: "Job title, key words")
        Spacer()
        VStack(alignment: .trailing, spacing: 30) {
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
                      Text(vacancy.snippet.requirement)
                        .font(.footnote)
                        .padding()
                      if let salary = vacancy.salary {
                        Text(salary.description)
                        
                          .font(.headline)
                          .fontWeight(.bold)
                          .frame(maxWidth: .infinity, alignment: .trailing)
                          .padding(.trailing, 16)
                          .padding(.bottom, 15)
                      }
                      
                    }
                    .foregroundColor(.black)
                  }
                }
              )
          }
          .foregroundColor(Color.white)
          .frame(width: 320, height: 280)
        }
      }
    }
    .padding()
    .task {
      do {
        try await vacanciesViewModel.fetchVacancies()
      } catch {
        print(error.localizedDescription)
        print("")
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    TabsView(route: .home)
  }
}
