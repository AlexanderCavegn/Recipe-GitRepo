//
//  DataServices.swift
//  RecipesJSON
//
//  Created by Alexander on 25.07.21.
//

import Foundation

class DataService  {

    static func getLocalData() -> [Recipe] {

        // Parse local json File
        // ---------------------

        /* Get a url path to the json file
         möglich dass der path nich gefunden wird, deshalb wird dieser mit guard überprüft
         */
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")

        // Check if pathString in not nil, sonst wird ein leerer Array zurückgegeben
        guard pathString != nil else {
            return [Recipe]()
        }

        // Create a url object
        let url = URL(fileURLWithPath: pathString!)

        do {

            // Create a data object
            let data = try Data(contentsOf: url)

            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()

            do {
                let recipeData = try decoder.decode(([Recipe].self), from: data)

                // Add the unique IDs to the data from JSON
                for r in recipeData {
                    r.id = UUID()

                    // Add unique IDs to recipe ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }

                // Return the recipes
                return recipeData
            }
            catch {

                // error with parsing json
                print(error)

            }
        }
        catch {

            // error wenn keine Daten gefunden werden
            print(error)
    	}
    return [Recipe]()

	}
}
