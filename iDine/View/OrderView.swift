//
//  OrderView.swift
//  iDine
//
//  Created by Ayush on 28/11/20.
//

import SwiftUI
import Firebase


struct OrderView: View {
    @EnvironmentObject var order: Order
    public var data : [String] = []
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items) { item in
                        HStack{
                            Image(item.thumbnailImage)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray , lineWidth: 2))
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: { indexSet in
                        deleteItems(at: indexSet)
                    })
                   
                }
                Section{
                    NavigationLink(destination: CheckoutView()){
                        Text("Place Order")
                    }
                }
            }.navigationTitle(Text("Order")).listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItems(at offSets: IndexSet) {
        order.items.remove(atOffsets: offSets)
    }
}

struct OrderView_Previews: PreviewProvider {
    
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
