//
//  SearchViewModel.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 30.03.2022.
//

import Foundation

typealias QueryDictionary = [String: String]
final class SearchViewModel: ObservableObject {
  @Published var vacancies: [Vacancy] = []
  @Published var presentedError = false
  @Published var salary: String = ""
  @Published var schedule: ScheduleVariants = .none
  @Published var text: String = ""
  @Published var searchText = ""
  enum ScheduleVariants {
    case fullDay
    case shift
    case flexible
    case remote
    case flyInFlyOut
    case none
  }
  
  private let vacancyFetchingService: VacanciesFetchService
  private var page = 1
  
  init(vacancyFetchingService: VacanciesFetchService = VacanciesFetchService()) {
    self.vacancyFetchingService = vacancyFetchingService
  }
  
  @MainActor
  func fetchVacancies() async {
    page = 1
    let vacancies = await makeRequest()
    self.vacancies = vacancies
  }
  
  @MainActor
  func fetchNextPage() async {
    let nextPortion = await makeRequest()
    vacancies += nextPortion
  }
  
  // MARK: - Private methods
  
  private func makeRequest() async -> [Vacancy] {
    do {
      let dictionary = makeQueryDictionary()
      let vacancies = try await vacancyFetchingService.fetch(page: page, dictionary: dictionary)
      defer { page += 1 }
      return vacancies.vacancies
    } catch {
      assertionFailure(error.localizedDescription)
      return []
    }
  }
  
  private func makeQueryDictionary() -> QueryDictionary {
    var queryDictionary = QueryDictionary()
    if let int = Int(salary), !salary.isEmpty {
      queryDictionary["salary"] = "\(int)"
      queryDictionary["currency"] = "RUR"
    }
    if schedule != .none {
      let schedule: String
      switch self.schedule {
      case .fullDay:
        schedule = "fullDay"
      case .shift:
        schedule = "shift"
      case .flexible:
        schedule = "flexible"
      case .remote:
        schedule = "remote"
      case .flyInFlyOut:
        schedule = "flyInFlyOut"
      case .none:
        fatalError("Data is expected!")
      }
      queryDictionary["schedule"] = schedule
    }
    if let textWithPercentEncoding = text.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed), !text.isEmpty {
      queryDictionary["text"] = "\(textWithPercentEncoding)"
    }
    return queryDictionary
  }
}

