//
//  BarkBarkApp.swift
//  BarkBark
//
//  Created by Sasha on 3/18/21.
//

import SwiftUI
import Firebase
import UIKit

@main
struct BarkBarkApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
       
        return true
    }
}
