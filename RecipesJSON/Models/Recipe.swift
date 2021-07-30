//
//  Recipe.swift
//  RecipesJSON
//
//  Created by Alexander on 25.07.21.
//

import Foundation

class Recipe: Identifiable, Decodable {

    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[Ingredient]
    var highlights:[String]
    var directions:[String]
    
}

class Ingredient: Identifiable, Decodable {

    var id: UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?

}
