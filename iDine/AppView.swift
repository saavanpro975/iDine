//
//  AppView.swift
//  iDine
//
//  Created by Ayush on 28/11/20.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            ContentView().tabItem {
                Image(systemName: "list.dash")
                Text("Menu")
            }
            OrderView().tabItem {
                Image(systemName: "square.and.pencil")
                Text("Cart")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
