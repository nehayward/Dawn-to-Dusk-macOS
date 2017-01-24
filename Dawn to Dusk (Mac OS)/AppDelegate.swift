//
//  AppDelegate.swift
//  Dawn to Dusk (Mac OS)
//
//  Created by Nick Hayward on 11/2/16.
//  Copyright © 2016 Nick Hayward. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application
    
    PFMoveToApplicationsFolderIfNecessary()
    // Schedule
    
//    Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(WeatherViewController.sayHello), userInfo: nil, repeats: true)

  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }

  
  
  

}

