//
//  MealModel.swift
//  MealDBProject
//
//  Created by catalina lozano on 01/09/23.
//

import Foundation


struct MealModel: Codable {
    let meals: [MealElement]
}


struct MealElement: Codable, Hashable {
    let strMeal: String
    let strMealThumb: String
    var idMeal: String
}
