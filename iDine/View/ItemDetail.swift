//
//  ItemDetail.swift
//  iDine
//
//  Created by Ayush on 27/11/20.
//

import SwiftUI
import Firebase

struct ItemDetail: View {
    var item: MenuItem
    @EnvironmentObject var order: Order
    @State private var alertShow = false
    var body: some View {
       
        VStack{
            ZStack(alignment: .bottom){
                Image(item.mainImage)
                    .resizable()
                    .cornerRadius(25)
                    .aspectRatio(contentMode: .fit)
                    .padding().padding(.top , 15)
                Text("Photo: \(item.photoCredit)")
                    .font(.caption).fontWeight(.light)
                    .padding(4)
                    .background(Color.gray)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                    .offset(y: 10)
                    
                    
            }.padding(.vertical , 10)
            
            Text(item.description).padding()

            Button(action: {self.order.add(item: item); alertShow.toggle() }
            ) {
                
                Text("Add To Cart")
                    .fontWeight(.bold)
                    .foregroundColor(Color("sblack"))
                    .padding(.vertical, 15)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("sblack"), lineWidth: 1)
                    )
            }

            Spacer()
        }.navigationBarTitle(Text(item.name) , displayMode: .inline)
        .alert(isPresented: $alertShow, content: {
            Alert(title: Text("Item added to cart"), message: Text( "\(item.name) has been added to your cart"), dismissButton: .default(Text("Ok")))
        })
        
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
        
    }
}


//func addData(order: MenuItem){
//   var db = Firestore.firestore()
//    do{
//        let _ = try db.collection("order").addDocument(data: [
//            "Name": order.name ,
//            "Price": order.price ,
//            "Time": Date().timeIntervalSince1970
//        ])
//    }catch{
//        print(error)
//    }
//}
//
