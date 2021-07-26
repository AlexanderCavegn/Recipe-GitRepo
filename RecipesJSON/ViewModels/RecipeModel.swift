//
//  RecipeModel.swift
//  RecipesJSON
//
//  Created by Alexander on 25.07.21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init()
    {
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()        
    }
}
