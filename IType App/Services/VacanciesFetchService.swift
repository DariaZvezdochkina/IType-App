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
  
  func fetch(page: Int = 1, dictionary: QueryDictionary = [:]) async throws -> Vacancies {
    var adjustedComponents = urlComponents.addPageQueryItem(page)
    adjustedComponents.addQueryItems(dictionary)
    let data = try await networkService.downloadData(with: adjustedComponents.url!)
    let vacancies = try decodingService.decode(data: data, of: Vacancies.self)
    return vacancies
  }
}

enum VacanciesFetchServiceError: Error {
  case unknown
}

extension URLComponents {
  fileprivate static var vacancies: URLComponents {
    guard let url = URLComponents(string: "https://api.hh.ru/vacancies?industry=7&per_page=15&area=113") else {
      fatalError("...")
    }
      return url
  }
  
  fileprivate func addPageQueryItem(_ page: Int) -> URLComponents {
    var copy  = self
    copy.addQueryItems(["page": "\(page)"])
    return copy
  }
  
  fileprivate mutating func addQueryItems(_ dictionary: [String: String]) {
    guard !dictionary.isEmpty else { return }
    for (key, value) in dictionary {
      queryItems?.append(.init(name: key, value: value))
    }
  }
}

