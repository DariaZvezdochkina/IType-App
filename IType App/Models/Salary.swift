//
//  Salary.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 22.03.2022.
//

import Foundation

// MARK: - Salary
struct Salary: Codable {
    let from, to: Int?
    let currency: String
    let gross: Bool
}

extension Salary: CustomStringConvertible {
  var description: String {
    if let from = from, let to = to {
      return "От \(from) до \(to) \(currency)"
    } else if let from = from {
      return "От \(from) \(currency)"
    } else if let to = to {
      return "До \(to) \(currency)"
    } else {
      return ""
    }
    
  }
}
