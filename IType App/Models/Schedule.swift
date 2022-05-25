import Foundation

struct Schedule: Codable {
  let id: ID
  let name: Name
}

extension Schedule {
  enum ID: String, Codable {
    case fullDay = "fullDay"
    case idOpen = "open"
    case remote = "remote"
    case shift = "shift"
    case flexible = "flexible"
    case flyInFlyOut = "flyInFlyOut"
  }
  
  enum Name: String, Codable {
    case открытая = "Открытая"
    case полныйДень = "Полный день"
    case удаленнаяРабота = "Удаленная работа"
    case сменныйГрафик = "Сменный график"
    case гибкийГрафик = "Гибкий график"
    case вахтовыйМетод = "Вахтовый метод"
  }
}

extension Schedule: CustomStringConvertible {
  var description: String {
    name.rawValue
  }
}
