//
//  CheckoutView.swift
//  iDine
//
//  Created by Ayush on 28/11/20.
//

import SwiftUI

import Firebase

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    static let  paymentTypes = ["Cash" , "CreditCard", "iDine Points"]
    static let tipAmounts = [10 ,15, 20 ,25 , 0]
    @State private var paymentType = 0
    @State private var addLoyaltyPoints = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var alertPresent = false
 
    
   
   
    var totalPrice: Double{
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(CheckoutView.tipAmounts[tipAmount])
        return total + tipValue
    }//tip added
    var body: some View {
        Form{
            Section{
                Text("How Do You Want To Pay?")
                    .font(.title2)
                    .padding(.vertical, -5)
                Picker(selection: $paymentType, label: Text("Picker"), content: {
                        ForEach(0 ..< Self.paymentTypes.count){
                            Text(Self.paymentTypes[$0])
                        }
                }).pickerStyle(SegmentedPickerStyle())
                Text("Selected Payemnt :"+" \(CheckoutView.paymentTypes[paymentType])").font(.subheadline)
 
            }.padding()
            Section{
                Toggle(isOn: $addLoyaltyPoints.animation()){
                    Text("Add iDine Loyalty Points")
                }
                
                if addLoyaltyPoints{
                    TextField("Enter Your iDine ID", text: $loyaltyNumber)
                }
            }
            Section(header: Text("  Add a Tip?")){
                Text("Percentage")
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(0..<CheckoutView.tipAmounts.count){
                        Text("\(CheckoutView.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
               
            }
            Text("Total is \(totalPrice, specifier: "%0.2f")").font(.title)
            Section(){
                Button("Confirm Order"){
                    //Place The Order
                    alertPresent.toggle() ; print(order.items) ;

                    
                   
                 
                    
                }.font(.title3)
            }
        }.navigationBarTitle(Text("Payment") , displayMode: .inline)
        .alert(isPresented: $alertPresent, content: {
            Alert(title: Text("Order Confirmed"), message: Text("Your Total was $\(totalPrice , specifier: "%0.2f") - thank you!"), dismissButton: .default(Text("Ok")))
        })
        
        
    }
    
    
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}


func addData(order: String){
    let db = Firestore.firestore()
    do{
        let _ = try db.collection("order").addDocument(data: [
            "Name": order ,
         
            "Time": Date().timeIntervalSince1970
        ])
    }catch{
        print(error)
    }
}

