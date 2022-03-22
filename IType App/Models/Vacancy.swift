//
//  Vacancy.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 22.03.2022.
//

import Foundation

// MARK: - Vacancy
struct Vacancy: Codable {
    let id: String
    let premium: Bool
    let name: String
    let department: String?
    let hasTest, responseLetterRequired: Bool
    let area: Area
    let salary: Salary?
    let type: Schedule
    let address: Address?
    let responseURL, sortPointDistance: JSONNull?
    let publishedAt, createdAt: Date
    let archived: Bool
    let applyAlternateURL: String
    let insiderInterview: JSONNull?
    let url, alternateURL: String
    let relations: [JSONAny]
    let employer: Employer
    let snippet: Snippet
    let contacts: JSONNull?
    let schedule: Schedule
    let workingDays, workingTimeIntervals, workingTimeModes: [JSONAny]
    let acceptTemporary: Bool

    enum CodingKeys: String, CodingKey {
        case id, premium, name, department
        case hasTest = "has_test"
        case responseLetterRequired = "response_letter_required"
        case area, salary, type, address
        case responseURL = "response_url"
        case sortPointDistance = "sort_point_distance"
        case publishedAt = "published_at"
        case createdAt = "created_at"
        case archived
        case applyAlternateURL = "apply_alternate_url"
        case insiderInterview = "insider_interview"
        case url
        case alternateURL = "alternate_url"
        case relations, employer, snippet, contacts, schedule
        case workingDays = "working_days"
        case workingTimeIntervals = "working_time_intervals"
        case workingTimeModes = "working_time_modes"
        case acceptTemporary = "accept_temporary"
    }
}
