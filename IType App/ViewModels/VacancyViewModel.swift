import Foundation

final class VacancyViewModel: ObservableObject {
  private var vacancy: Vacancy
  @Published var detailedVacancy: DetailedVacancy?
  @Published var presentedError = false
  private let detailedVacancyFetchingService: DetailedVacancyFetchService
  
  init(vacancy: Vacancy, detailedVacancyFetchingService: DetailedVacancyFetchService = DetailedVacancyFetchService()) {
    self.vacancy = vacancy
    self.detailedVacancyFetchingService = detailedVacancyFetchingService
  }
  
  func fetchVacancy() async {
    do {
      detailedVacancy = try await detailedVacancyFetchingService.fetchVacancy(id: vacancy.id)
    } catch {
      print(error.localizedDescription)
    }
  }
  
}

