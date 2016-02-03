//
//  AppDelegate.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 24/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import GameAnalytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Fabric.with([Crashlytics.self, GameAnalytics.self])
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = StartViewController()
        self.window?.makeKeyAndVisible()
        return true
    }
}
