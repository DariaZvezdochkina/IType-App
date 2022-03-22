//
//  VacanciesFetchService.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 22.03.2022.
//

import Foundation

final class VacanciesFetcherService {
  private let url: URL
  private let networkService: NetworkService
  private let decodingService: DecodingService
  
  init(url: URL = .people, networkService: NetworkService = .init(), decodingService: DecodingService = .init()) {
    self.url = url
    self.networkService = networkService
    self.decodingService = decodingService
  }
  
  func fetch() async throws -> Vacancies {
    let data = try await networkService.downloadData(with: url)
    let people = try decodingService.decode(data: data, of: Vacancies.self)
    return people
  }
}

enum VacanciesFetcherServiceError: Error {
  case unknown
}

extension URL {
  fileprivate static var people: URL {
    guard let url = URL(string: "https://api.hh.ru/vacancies") else {
      fatalError("...")
    }
    return url
  }
}
