//
//  DessertDetailView.swift
//  MealDBProject
//
//  Created by catalina lozano on 02/09/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct DessertDetailView: View {
    @StateObject var mealVM = MealViewModel()
    @Environment(\.presentationMode) var presentation
    var mealElementArray: [MealElement] = []
    var meal: Meals
    var rec: Recipie
    
    var info : String
    
    var body: some View {
        ZStack{
            Color.brown.opacity(0.15)
                .ignoresSafeArea()
                 NavigationStack {
                     ScrollView {
                         VStack {
                             VStack{
                                 ForEach(mealVM.mealElementArray, id: \.self){ prod in
                                     if(prod.idMeal == info){
                                         WebImage(url: URL(string: prod.strMealThumb))
                                             .resizable()
                                             .frame(width: 240, height: 200)
                                             .aspectRatio(contentMode: .fit)
                                             .cornerRadius(15)
                                    
                                         VStack{
                                             Text("Meal name" )
                                                 .font(.system(size: 14))
                                                 .fontWeight(.bold)
                                                 .textCase(.uppercase)
                                                 .foregroundColor(.blue)
                                                 .background(Color.blue.opacity(0.15))
                                             HStack{
                                                 Image(systemName: "fork.knife")
                                                     .resizable()
                                                     .fixedSize()
                                                     .frame(width: 10, height: 10)
                                                     .foregroundColor(Color.orange)
                                                 Text(prod.strMeal)
                                                 Image(systemName: "fork.knife")
                                                     .resizable()
                                                     .fixedSize()
                                                     .frame(width: 10, height: 10)
                                                     .foregroundColor(Color.orange)
                                             }.frame(width: 270)
                                             
                                         }.frame(width: 270, height: 100)
                                         
                                     }
                                 }
                            }
        
                             VStack(alignment: .leading){
                                 Text("INGREDIENTS / MEASUREMENTS")
                                     .font(.system(size: 15))
                                     .fontWeight(.bold)
                                     .textCase(.uppercase)
                                     .foregroundColor(.blue)
                                     .background(Color.blue.opacity(0.15))
                                 
                                 VStack(alignment: .leading){
                                     ForEach(mealVM.ingred, id: \.self) { item in
                                         HStack{
                                             Image(systemName: "menucard.fill")
                                                 .resizable()
                                                 .fixedSize()
                                                 .frame(width: 10, height: 10)
                                                 .foregroundColor(.brown)
                                             Text(item.ingredient)
                                             Image(systemName: "arrow.right")
                                                 .resizable()
                                                 .fixedSize()
                                                 .frame(width: 10, height: 10)
                                                 .foregroundColor(.brown)
                                             Text(item.measure)
                                         }
                                         
                                     }
                                 }
                             }
                          
                         }
                         
                     }
                 }
            Spacer()
                 .task {
                     await mealVM.getData()
                     await mealVM.getIngredients(info: info)
                 }
        }
       Spacer()
        
    }
}

struct DessertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailView( meal: Meals(strMeal: "", strCategory: "", strInstructions: "", strMealThumb: "", ingredients: []), rec: Recipie(ingredients: []), info: "")
    }
}
