//
//  DetailedVacancyViewModel.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 24.03.2022.
//

import Foundation

final class DetailedVacancyViewModel: ObservableObject {
  
  private let vacancyId: String
  @Published var detailedVacancy: DetailedVacancy?
  @Published var presentedError = false
  private let detailedVacancyFetchingService: DetailedVacancyFetchService
  
  init(vacancyId: String, detailedVacancy: DetailedVacancy, detailedVacancyFetchingService: DetailedVacancyFetchService = DetailedVacancyFetchService()) {
    self.vacancyId = vacancyId
    self.detailedVacancy = detailedVacancy
    self.detailedVacancyFetchingService = detailedVacancyFetchingService
  }
  
  func fetchVacancy() async {
    do {
      detailedVacancy = try await detailedVacancyFetchingService.fetchVacancy(id: vacancyId)
    } catch {
      print(error.localizedDescription)
    }
  }
  
}

