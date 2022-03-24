//
//  Address.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 22.03.2022.
//

import Foundation

// MARK: - Address
struct Address: Codable {
    let city, street, building: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case city, street, building
        case id
    }
}
