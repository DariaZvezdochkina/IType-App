//
//  Address.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 22.03.2022.
//

import Foundation

// MARK: - Address
struct Address: Codable {
    let city, street, building: String
    let addressDescription: JSONNull?
    let lat, lng: Double
    let raw: String
    let metro: JSONNull?
    let metroStations: [JSONAny]
    let id: String

    enum CodingKeys: String, CodingKey {
        case city, street, building
        case addressDescription = "description"
        case lat, lng, raw, metro
        case metroStations = "metro_stations"
        case id
    }
}
