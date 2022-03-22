//
//  LogoUrls.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 22.03.2022.
//

import Foundation

// MARK: - LogoUrls
struct LogoUrls: Codable {
    let the90, the240: String
    let original: String

    enum CodingKeys: String, CodingKey {
        case the90 = "90"
        case the240 = "240"
        case original
    }
}
