//
//  VacancyFetchService.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 22.03.2022.
//

import Foundation

final class DetailedVacancyFetchService {
  private let url: URL
  private let networkService: NetworkService
  private let decodingService: DecodingService
  
  init(url: URL = .vacancies, networkService: NetworkService = .init(), decodingService: DecodingService = .init()) {
    self.url = url
    self.networkService = networkService
    self.decodingService = decodingService
  }
  
  func fetchVacancy(id: String) async throws -> DetailedVacancy {
    let adjustedUrl = url.appendingPathComponent("\(id)")
    let data = try await networkService.downloadData(with: adjustedUrl)
    let detailedVacancy = try decodingService.decode(data: data, of: DetailedVacancy.self)
    return detailedVacancy
  }
}

enum DetailedVacancyFetcherServiceError: Error {
  case unknown
}

extension URL {
  fileprivate static var vacancies: URL {
    guard let url = URL(string: "https://api.hh.ru/vacancies") else {
      fatalError("...")
    }
    return url
  }
}

