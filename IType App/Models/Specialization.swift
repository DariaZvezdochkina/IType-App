import Foundation

// MARK: - Specialization
struct Specialization: Codable, Identifiable {
  let id, name, profareaID, profareaName: String
  
  enum CodingKeys: String, CodingKey {
    case id, name
    case profareaID = "profarea_id"
    case profareaName = "profarea_name"
  }
}
