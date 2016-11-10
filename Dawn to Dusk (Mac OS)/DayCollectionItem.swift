//
//  DayCollectionItem.swift
//  Dawn to Dusk (Mac OS)
//
//  Created by Nick Hayward on 11/6/16.
//  Copyright © 2016 Nick Hayward. All rights reserved.
//

import Cocoa

class DayCollectionItem: NSCollectionViewItem {

//  @IBOutlet var text: NSTextField!
  // 2
  override func viewDidLoad() {
    super.viewDidLoad()
    view.wantsLayer = true
    view.layer?.backgroundColor = NSColor.red.cgColor
    // 1
    
//    text.stringValue = "HYE"
    view.layer?.borderWidth = 0.0
    // 2
    view.layer?.borderColor = NSColor.white.cgColor  }
  
  func setHighlight(selected: Bool) {
    view.layer?.borderWidth = selected ? 5.0 : 0.0
  }
  
}
