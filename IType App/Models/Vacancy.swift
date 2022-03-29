//
//  Vacancy.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 22.03.2022.
//

import Foundation

// MARK: - Vacancy
struct Vacancy: Codable, Identifiable {
  let id: String
  let premium: Bool
  let name: String
  let department: String?
  let area: Area
  let salary: Salary?
  let address: Address?
  let employer: Employer
  let snippet: Snippet
  let schedule: Schedule
  
  enum CodingKeys: String, CodingKey {
    case id, premium, name, department
    case area
    case salary
    case address
    case employer
    case snippet
    case schedule
  }
}


