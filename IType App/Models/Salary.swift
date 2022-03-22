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
