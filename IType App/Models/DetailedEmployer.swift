import Foundation

// MARK: - DetailedEmployer
struct DetailedEmployer: Codable {
  let id: String
  let name, type, description: String
  let siteURL, alternateURL, vacanciesURL: String
  let logoUrls: LogoUrls
  let area: Area
  let industries: [Industry]
  let openVacancies: Int
  
  enum CodingKeys: String, CodingKey {
    case id
    case name, type
    case description = "description"
    case siteURL = "site_url"
    case alternateURL = "alternate_url"
    case vacanciesURL = "vacancies_url"
    case logoUrls = "logo_urls"
    case area, industries
    case openVacancies = "open_vacancies"
  }
}
