//
//  DetailedVacancy.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 24.03.2022.
//

import Foundation
import UIKit

// MARK: - Vacancies
struct DetailedVacancy: Codable {
  let id: String
  let premium: Bool
  let billingType: BillingType
  let name: String
  let area: Area
  let salary: Salary
  let type: BillingType
  let allowMessages: Bool
  let site, experience, schedule, employment: BillingType
  let vacanciesDescription: String
  let keySkills: [KeySkill]
  let specializations: [Specialization]
  let professionalRoles: [BillingType]
  let employer: Employer
  let applyAlternateURL: String
  let alternateURL: String
  
  
  enum CodingKeys: String, CodingKey {
    case id, premium
    case billingType = "billing_type"
    case name
    case area, salary, type
    case allowMessages = "allow_messages"
    case site, experience, schedule, employment
    case vacanciesDescription = "description"
    case keySkills = "key_skills"
    case specializations
    case professionalRoles = "professional_roles"
    case employer
    case applyAlternateURL = "apply_alternate_url"
    case alternateURL = "alternate_url"
    
  }
}
