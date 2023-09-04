//
//  MealDataModel.swift
//  MealDBProject
//
//  Created by catalina lozano on 01/09/23.
//

import Foundation

struct MealData: Decodable, Hashable {
    let meals: [[String: String?]]
}

struct Detail {
    var detalles: [Detalles]
}

struct Detalles: Hashable {
     let meal: String
     let instructions: String
}

struct Recipie {
    var ingredients: [Ingredient]
}

struct Ingredient: Hashable {
    let ingredient: String
    let measure: String
}
