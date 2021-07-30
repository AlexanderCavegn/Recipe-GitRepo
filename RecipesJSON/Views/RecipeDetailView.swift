//
//  RecipeDetailView.swift
//  RecipesJSON
//
//  Created by Alexander on 26.07.21.
//

import SwiftUI

struct RecipeDetailView: View {

    var recipe:Recipe

    var body: some View {

        ScrollView {

            VStack (alignment: .leading) {

                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()

                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5.0)

                    // ForEach (recipe.ingredients, id:\.self) { item in
                        // Text("• " + item)
                    ForEach (recipe.ingredients) { item in

                        Text("• " + item.name)
                    }
                }
                .padding(.horizontal)
            }
			Divider()

        	// MARK: Directions
            VStack(alignment: .leading) {
                Text("Directions")
                    .font(.headline)
                    .padding(.bottom, 5)

//                ForEach(recipe.directions, id: \.self) { item in
//                	Text(item)
//            	}


                // Weil ich eine Nummerierung will, verwende ich den Index
                ForEach(0..<recipe.directions.count, id: \.self) { index in

                    Text(String(index+1) + ". " + recipe.directions[index])
                        .padding(.bottom, 5.0)
                        


                }
            }
            .padding(.horizontal)
        }
        .navigationBarTitle(recipe.name)

    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {

        // Create a Dummy recipe and pass it into the detail view so that we can see a preview (etwas umständlich)

    let model = RecipeModel()
        // RecipeDetailView()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
