//
//  Employer.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 22.03.2022.
//

import Foundation

// MARK: - Employer
struct Employer: Codable {
  let id, name: String
  let logoUrls: LogoUrls?
  
  enum CodingKeys: String, CodingKey {
    case id, name
    case logoUrls = "logo_urls"
  }
}
