//
//  MealDBProjectApp.swift
//  MealDBProject
//
//  Created by catalina lozano on 01/09/23.
//

import SwiftUI

@main
struct MealDBProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(meal: Meals(strMeal: "", strCategory: "", strInstructions: "", strMealThumb: "", ingredients: []))
        }
    }
}
