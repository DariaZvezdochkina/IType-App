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
    let responseURL, sortPointDistance: JSONNull?
    let publishedAt, createdAt: String // Date
    let archived: Bool
    let applyAlternateURL: String
    let insiderInterview: JSONNull?
    let url, alternateURL: String
    let relations: [JSONAny]
    let employer: Employer
    let snippet: Snippet
    let contacts: JSONNull?
    let schedule: Schedule

    enum CodingKeys: String, CodingKey {
        case id, premium, name, department
        case area
        case salary
        case address
        case responseURL = "response_url"
        case sortPointDistance = "sort_point_distance"
        case publishedAt = "published_at"
        case createdAt = "created_at"
        case archived
        case applyAlternateURL = "apply_alternate_url"
        case insiderInterview = "insider_interview"
        case url
        case alternateURL = "alternate_url"
        case relations, employer, snippet, contacts
        case schedule
    }
}


