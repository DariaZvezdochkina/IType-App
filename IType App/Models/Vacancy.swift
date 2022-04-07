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
  let name: String
  let area: Area
  let salary: Salary?
  let employer: Employer
  let snippet: Snippet
  let schedule: Schedule
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case area
    case salary
    case employer
    case snippet
    case schedule
  }
}


