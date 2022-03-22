//
//  NetworkService.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 22.03.2022.
//

import Foundation

protocol Downloadable: AnyObject {
  func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension Downloadable {
  func data(from url: URL) async throws -> (Data, URLResponse) {
    return try await data(from: url, delegate: nil)
  }
}

extension URLSession: Downloadable {
  
}

final class NetworkService {
  
  private let session: Downloadable
  
  init(session: Downloadable = URLSession.shared) {
    self.session = session
  }
  
  func downloadData(with url: URL) async throws -> Data {
    let (data, responce) = try await session.data(from: url)
    guard let httpResponce = responce as? HTTPURLResponse else { fatalError() } // throw
    guard httpResponce.statusCode == 200 else { fatalError() } // throw
    return data
  }
  
}
