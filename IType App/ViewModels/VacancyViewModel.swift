//
//  VacancyViewModel.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 22.03.2022.
//

import Foundation

final class VacancyViewModel: ObservableObject {
  private var vacancy: Vacancy
  @Published var presentedError = false
  private let vacancyFetchingService: VacancyFetchService
  
  init(vacancy: Vacancy, vacancyFetchingService: VacancyFetchService = VacancyFetchService()) {
    self.vacancy = vacancy
    self.vacancyFetchingService = vacancyFetchingService
  }
  
  func fetchVacancy() async {
    do {
      vacancy = try await vacancyFetchingService.fetchVacancy(id: vacancy.id)
    } catch {
      print(error.localizedDescription)
    }
  }
  
}

