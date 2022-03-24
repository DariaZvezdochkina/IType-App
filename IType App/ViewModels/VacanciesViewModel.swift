//
//  VacanciesViewModel.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 22.03.2022.
//

import Foundation

final class VacanciesViewModel: ObservableObject {
    @Published var vacanciesResult: [Vacancy] = []
    private let fetchingService: VacanciesFetchService
    private var currentPage = 1
    
    init(fetcherService: VacanciesFetchService = VacanciesFetchService()) {
        self.fetchingService = fetcherService
    }
    
  @MainActor func fetchVacancies() async throws {
    let fetchedVacancies = try await fetchingService.fetch(page: currentPage)
    currentPage += 1
    vacanciesResult += fetchedVacancies.vacancies
  }
    
}
