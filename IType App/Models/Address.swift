import Foundation

// MARK: - Address
struct Address: Codable {
  let city, street, building: String
  let id: String
  
  enum CodingKeys: String, CodingKey {
    case city
    case street
    case building
    
    case id
  }
}
