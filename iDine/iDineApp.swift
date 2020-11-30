//
//  iDineApp.swift
//  iDine
//
//  Created by Ayush on 27/11/20.
//

import SwiftUI
import Firebase

var order = Order()


@main
struct iDineApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
       
        WindowGroup {
            
            AppView().environmentObject(order)        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            let db = Firestore.firestore()
            print(db)
            
            return true
        }
    }
}


