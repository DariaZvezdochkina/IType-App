//
//  DetailedVacancy.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 24.03.2022.
//

import Foundation

// MARK: - Vacancies
struct DetailedVacancy: Codable {
    let id: String
    let premium: Bool
    let billingType: BillingType
    let relations: [JSONAny]
    let name: String
    let insiderInterview: JSONNull?
    let responseLetterRequired: Bool
    let area: Area
    let salary: Salary
    let type: BillingType
    let address: JSONNull?
    let allowMessages: Bool
    let site, experience, schedule, employment: BillingType
    let department, contacts: JSONNull?
    let vacanciesDescription: String
    let brandedDescription, vacancyConstructorTemplate: JSONNull?
    let keySkills: [KeySkill]
    let acceptHandicapped, acceptKids, archived: Bool
    let responseURL: JSONNull?
    let specializations: [Specialization]
    let professionalRoles: [BillingType]
    let code: JSONNull?
    let hidden, quickResponsesAllowed: Bool
    let driverLicenseTypes: [JSONAny]
    let acceptIncompleteResumes: Bool
    let employer: Employer
    let publishedAt, createdAt: Date
    let negotiationsURL, suitableResumesURL: JSONNull?
    let applyAlternateURL: String
    let hasTest: Bool
    let test: JSONNull?
    let alternateURL: String
    let workingDays, workingTimeIntervals, workingTimeModes: [JSONAny]
    let acceptTemporary: Bool

    enum CodingKeys: String, CodingKey {
        case id, premium
        case billingType = "billing_type"
        case relations, name
        case insiderInterview = "insider_interview"
        case responseLetterRequired = "response_letter_required"
        case area, salary, type, address
        case allowMessages = "allow_messages"
        case site, experience, schedule, employment, department, contacts
        case vacanciesDescription = "description"
        case brandedDescription = "branded_description"
        case vacancyConstructorTemplate = "vacancy_constructor_template"
        case keySkills = "key_skills"
        case acceptHandicapped = "accept_handicapped"
        case acceptKids = "accept_kids"
        case archived
        case responseURL = "response_url"
        case specializations
        case professionalRoles = "professional_roles"
        case code, hidden
        case quickResponsesAllowed = "quick_responses_allowed"
        case driverLicenseTypes = "driver_license_types"
        case acceptIncompleteResumes = "accept_incomplete_resumes"
        case employer
        case publishedAt = "published_at"
        case createdAt = "created_at"
        case negotiationsURL = "negotiations_url"
        case suitableResumesURL = "suitable_resumes_url"
        case applyAlternateURL = "apply_alternate_url"
        case hasTest = "has_test"
        case test
        case alternateURL = "alternate_url"
        case workingDays = "working_days"
        case workingTimeIntervals = "working_time_intervals"
        case workingTimeModes = "working_time_modes"
        case acceptTemporary = "accept_temporary"
    }
}
