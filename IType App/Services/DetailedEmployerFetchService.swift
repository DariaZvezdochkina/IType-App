//
//  DetailedEmployerFetchService.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 28.03.2022.
//

import Foundation

final class DetailedEmployerFetchService {
  private let url: URL
  private let networkService: NetworkService
  private let decodingService: DecodingService
  
  init(url: URL = .employers, networkService: NetworkService = .init(), decodingService: DecodingService = .init()) {
    self.url = url
    self.networkService = networkService
    self.decodingService = decodingService
  }
  
  func fetchEmployer(id: String) async throws -> DetailedEmployer {
    let adjustedUrl = url.appendingPathComponent("\(id)")
    let data = try await networkService.downloadData(with: adjustedUrl)
    let detailedEmployer = try decodingService.decode(data: data, of: DetailedEmployer.self)
    return detailedEmployer
  }
}

enum DetailedEmployerFetcherServiceError: Error {
  case unknown
}

extension URL {
  fileprivate static var employers: URL {
    guard let url = URL(string: "https://api.hh.ru/employers") else {
      fatalError("...")
    }
    return url
  }
}
