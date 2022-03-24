//
//  Specialization.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 24.03.2022.
//

import Foundation

// MARK: - Specialization
struct Specialization: Codable {
    let id, name, profareaID, profareaName: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case profareaID = "profarea_id"
        case profareaName = "profarea_name"
    }
}
