//
//  VacanciesFetchService.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 22.03.2022.
//

import Foundation

final class VacanciesFetchService {
  private let urlComponents: URLComponents
  private let networkService: NetworkService
  private let decodingService: DecodingService
  
  init(urlComponents: URLComponents = .vacancies, networkService: NetworkService = .init(), decodingService: DecodingService = .init()) {
    self.urlComponents = urlComponents
    self.networkService = networkService
    self.decodingService = decodingService
  }
  
    func fetch(page: Int) async throws -> Vacancies {
      let adjustedComponents = urlComponents.addPageQueryItem(page)
      let data = try await networkService.downloadData(with: adjustedComponents.url!)
      let people = try decodingService.decode(data: data, of: Vacancies.self)
      return people
  }
}

enum VacanciesFetchServiceError: Error {
  case unknown
}

extension URLComponents {
  fileprivate static var vacancies: URLComponents {
    guard let url = URLComponents(string: "https://api.hh.ru/vacancies?industry=7&per_page=5&area=113") else {
      fatalError("...")
    }
      return url
  }
  
  fileprivate func addPageQueryItem(_ page: Int) -> URLComponents {
    var copy  = self
    copy.queryItems?.append(.init(name: "page", value: "\(page)"))
    return copy
  }
}

