//
//  ContentView.swift
//  MealDBProject
//
//  Created by catalina lozano on 01/09/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @StateObject var mealVM = MealViewModel()
    var meal: Meals
    
    var body: some View {
        ZStack{
            NavigationStack {
                List {
                    ForEach(mealVM.mealElementArray, id: \.self){ items in
                        
                        NavigationLink(destination: DessertDetailView(meal: Meals(strMeal: "", strCategory: "", strInstructions: "", strMealThumb: "", ingredients: []), rec: Recipie(ingredients: []), info: items.idMeal)) {
                          
                            HStack(alignment: .top) {
                                VStack(alignment: .leading, spacing: 8) {
                                  
                                    Text(items.strMeal )
                                        .font(.system(size: 19, weight: .bold))
                                        .foregroundColor(Color.black)
                                
                                }
                                .padding(.top)
                                .padding(.leading)
                                
                                Spacer()
                                
                                ZStack(alignment: .topTrailing) {
                                    WebImage(url: URL(string: items.strMealThumb))
                                        .resizable()
                                        .foregroundColor(.gray)
                                        .cornerRadius(10)
                                        .frame(width: 70, height: 70)
                                }
                           }
                            .frame(width: 290, height: 70)
                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray.opacity(0.3), lineWidth: 1))
                        }   
                    }
                    
                }.navigationTitle("Desserts")
            }
            .task {
                await mealVM.getData()
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(meal: Meals(strMeal: "", strCategory: "", strInstructions: "", strMealThumb: "", ingredients: []))
    }
}
