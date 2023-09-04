//
//  MealViewModel.swift
//  MealDBProject
//
//  Created by catalina lozano on 01/09/23.
//

import Foundation
import SwiftUI

class MealViewModel: ObservableObject {
    @Published var mealModel = MealModel.self
    @Published var mealElementArray: [MealElement] = []
    @Published var idMeal: String = ""
    @Published var detailMeals: [Meals] = []
    
    @Published var ingred: [Ingredient] = []
    @Published var details: [Meals] = []
    
    var urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    
    func getData() async {
        guard let url = URL(string: urlString) else {
            print("could not create the url from \(urlString)")
            return
        }
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let returned = try? JSONDecoder().decode(MealModel.self, from: data) else {
                print("could not create the url from \(urlString)")
                return
            }
            print("return \(returned.meals)")
            DispatchQueue.main.async {
                self.mealElementArray = returned.meals
            }
        } catch {
            print("could not user url at \(urlString) to get data and response")
        }
    }
    
    func getDatas(info: String) async {
        guard let url = URL(string: urlString) else {
            print("could not create the url from \(urlString)")
            return
        }
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let returned = try? JSONDecoder().decode(MealModel.self, from: data) else {
                print("could not create the url from \(urlString)")
                return
            }
            print("return \(returned.meals)")
            DispatchQueue.main.async {
                self.mealElementArray = returned.meals
            }
        } catch {
            print("could not user url at \(urlString) to get data and response")
        }
    }
    
    
    func getIngredients(info: String) async {
        let baseUrl = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(info)"
        
        guard let urlB = URL(string: baseUrl) else {
            print("could not create the url from \(baseUrl)")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: urlB)
            let result = try JSONDecoder().decode(MealData.self, from: data)
           
            var recipies = [Recipie]()
            
            for meal in result.meals {
                var recipie = Recipie(ingredients: [])
                var index = 1
                while true {
                    guard let ingredientValue = meal["strIngredient\(index)"],
                          let measureValue = meal["strMeasure\(index)"],
                          let ingredient = ingredientValue, !ingredient.isEmpty,
                          let measure = measureValue, !measure.isEmpty
                    else { break }
                    recipie.ingredients.append(Ingredient(ingredient: ingredient, measure: measure))
                    recipies.append(recipie)
                    index += 1
                    print("")
                    
                     recipies.append(recipie)
                   
                    
                    let rep = recipie.ingredients
                    print(rep )
                  
                    await MainActor.run(body: {
                        self.ingred = rep
                        print(self.ingred)
                    })
                   
                    
                }
            }
        } catch {
            print(error)
        }
    }
}


 
