//
//  ContentView.swift
//  iDine
//
//  Created by Ayush on 27/11/20.
//

import SwiftUI

struct ContentView: View {
    

    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView{
            List{
                ForEach(menu) { section in
                    Section(header: Text(section.name)){
                        ForEach(section.items) { item in
                            ItemRow(item: item)
                        }
                    }
                }
                
            }.navigationBarTitle("iDine").listStyle(GroupedListStyle())
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
