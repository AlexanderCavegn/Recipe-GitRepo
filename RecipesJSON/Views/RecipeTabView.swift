//
//  RecipeTabView.swift
//  RecipesJSON
//
//  Created by Alexander on 29.07.21.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {

        TabView {


			// Text("Featured View")
            RecipeFeatureView()
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                } // TabItem

            	RecipeListView() //
                .tabItem {
                    VStack {

                    Image(systemName: "list.bullet")
                    Text("List")
                    }
                }

        } // TabView
        .environmentObject(RecipeModel())
        

    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
