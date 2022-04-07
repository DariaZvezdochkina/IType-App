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
  @Published var schedule: ScheduleVariants = .none
  @Published var text: String = ""
  @Published var salaryTo: String = ""
  @Published var isPresentedSalaryTo = true
  
  enum ScheduleVariants: String, CaseIterable {
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
    self.vacancies = []
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
    if !text.isEmpty {
      queryDictionary["text"] = "\(text)"
      queryDictionary["enable_snippets"] = "true"
    }
    
    addSalaryIfNeeded(to: &queryDictionary)
    return queryDictionary
  }
  
  private func addSalaryIfNeeded(to dictionary: inout [String: String]) {
    guard isPresentedSalaryTo && !salaryTo.isEmpty else { return }
    guard let value = Int(salaryTo) else { return }
    dictionary["salary"] = "\(value)"
    dictionary["currency"] = "RUR"
  }
}


