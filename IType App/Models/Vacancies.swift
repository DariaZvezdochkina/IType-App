//
//  Vacancies.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 22.03.2022.
//

import Foundation

// MARK: - Vacancies
struct Vacancies: Codable {
    let vacancies: [Vacancy]
    let found, pages, perPage, page: Int
    let clusters, arguments: String?
    let alternateURL: String

    enum CodingKeys: String, CodingKey {
        case vacancies = "items"
        case found, pages
        case perPage = "per_page"
        case page, clusters, arguments
        case alternateURL = "alternate_url"
    }
}
