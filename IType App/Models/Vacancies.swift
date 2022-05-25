import Foundation

// MARK: - Vacancies
struct Vacancies: Codable {
  let vacancies: [Vacancy]
  let found, pages, perPage, page: Int
  
  enum CodingKeys: String, CodingKey {
    case vacancies = "items"
    case found, pages
    case perPage = "per_page"
    case page
  }
}
