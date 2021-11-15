//
//  Firestore Data Type.swift
//  Swift Practice # 114 Upload Data To Firestore
//
//  Created by Dogpa's MBAir M1 on 2021/11/15.
//

import Foundation
import FirebaseFirestoreSwift

struct MoneyBook: Codable, Identifiable {
    @DocumentID var id: String?
    let date : String?
    let price: Int?
    let category: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case date
        case price
        case category
        case title
        
    }
}

public struct City: Codable {

    let name: String
    let state: String?
    let country: String?
    let isCapital: Bool?
    let population: Int64?

    enum CodingKeys: String, CodingKey {
        case name
        case state
        case country
        case isCapital = "capital"
        case population
    }

}
