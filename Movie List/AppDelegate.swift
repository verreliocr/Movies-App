//
//  AppDelegate.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initWindow()
        setupNavBar()
        return true
    }
    
    private func initWindow() {
        let appRouter = AppRouter()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        appRouter.setRoot(to: .listGenres, window: window, using: [:])
    }
    
    private func setRootScreen() {
        
    }
    
    private func setupNavBar() {
        let navAppearance = UINavigationBar.appearance()
        navAppearance.tintColor = .black
        navAppearance.setBackgroundImage(UIImage(), for: .default)
        navAppearance.shadowImage = UIImage()
        navAppearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 24)]
    }
    
}

