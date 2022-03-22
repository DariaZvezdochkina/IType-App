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
    let url, alternateURL: String
    let logoUrls: LogoUrls
    let vacanciesURL: String
    let trusted: Bool

    enum CodingKeys: String, CodingKey {
        case id, name, url
        case alternateURL = "alternate_url"
        case logoUrls = "logo_urls"
        case vacanciesURL = "vacancies_url"
        case trusted
    }
}
