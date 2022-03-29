//
//  Schedule.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 22.03.2022.
//

import Foundation

struct Schedule: Codable {
    let id: ID
    let name: Name
}

extension Schedule {
    enum ID: String, Codable {
        case fullDay = "fullDay"
        case idOpen = "open"
        case remote = "remote"
    }

    enum Name: String, Codable {
        case открытая = "Открытая"
        case полныйДень = "Полный день"
        case удаленнаяРабота = "Удаленная работа"
    }
}

extension Schedule: CustomStringConvertible {
  var description: String {
    name.rawValue
  }
}
