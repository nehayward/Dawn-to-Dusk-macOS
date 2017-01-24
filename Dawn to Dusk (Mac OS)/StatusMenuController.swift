//
//  StatusMenuController.swift
//  Weather
//
//  Created by Nick Hayward on 10/25/16.
//  Copyright © 2016 Nick Hayward. All rights reserved.
//

import Cocoa

let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)

class StatusMenuController: NSObject {
  
  let popover = NSPopover()
  
  @IBOutlet weak var contextMenu: NSMenu!
  var eventMonitor: EventMonitor?

  
  override func awakeFromNib() {
    
    let kStatusIcon = "Oval"

    if let button = statusItem.button {
      button.image = NSImage(named: kStatusIcon)
      button.target = self
      button.action = #selector(self.statusBarButtonClicked(sender:))
      button.sendAction(on: [.leftMouseUp, .rightMouseUp])
    
      
      popover.contentViewController = WeatherViewController(nibName: "WeatherViewController", bundle: nil)
//      popover.appearance = NSAppearance.init(named: NSAppearanceNameAqua)
    }
    
    showPopover(sender: nil)
    
    
    eventMonitor = EventMonitor(mask: [.leftMouseDown,.rightMouseDown]) { [unowned self] event in
      if self.popover.isShown {
        self.closePopover(sender: event)
      }
    }
    eventMonitor?.start()
    
  }
  
  
  func statusBarButtonClicked(sender: NSStatusBarButton) {
    let event = NSApp.currentEvent!
    
    if event.type == NSEventType.rightMouseUp {
      closePopover(sender: nil)
      
      statusItem.menu = contextMenu
      statusItem.popUpMenu(contextMenu)
      
      // This is critical, otherwise clicks won't be processed again
      statusItem.menu = nil
    } else {
      togglePopover(sender: nil)
    }
  }
  
  func togglePopover(sender: AnyObject?) {
    if popover.isShown {
      closePopover(sender: sender)
    } else {
      showPopover(sender: sender)
    }
  }
  
  func showPopover(sender: AnyObject?) {
    if let button = statusItem.button {
      popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
    }
  }
  
  func closePopover(sender: AnyObject?) {
    popover.performClose(sender)
  }
  
  
  
  @IBAction func quitClicked(sender: NSMenuItem) {
    
    let event = NSApp.currentEvent!
    
    if event.type == NSEventType.rightMouseUp {
      print("Right click")
    } else {
      NSApplication.shared().terminate(self)
    }
  }
}
