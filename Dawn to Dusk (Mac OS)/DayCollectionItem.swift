//
//  DayCollectionItem.swift
//  Dawn to Dusk (Mac OS)
//
//  Created by Nick Hayward on 11/6/16.
//  Copyright © 2016 Nick Hayward. All rights reserved.
//

import Cocoa

class DayCollectionItem: NSCollectionViewItem {

  var data: DataPoint?
  @IBOutlet var weekdayLabel: NSTextField!
  @IBOutlet var highLowLabel: NSTextField!
  @IBOutlet var conditionImage: NSImageView!
  
  
  var width: CGFloat = 81
  var height: CGFloat = 126

  override func viewDidLoad() {
    super.viewDidLoad()
    self.preferredContentSize = CGSize(width: width, height: height)
    view.wantsLayer = true
    configTextfields()
    
  }
  
  func setData(data:DataPoint){

    let dateFormatter1 = DateFormatter()
    let date = data.apparentTemperatureMaxTime
    //the "M/d/yy, H:mm" is put together from the Symbol Table
    dateFormatter1.dateFormat = "E"
    let stringDate = dateFormatter1.string(from: date!)
    weekdayLabel.stringValue = stringDate

    
    
    var highTemp = NSMutableAttributedString()
    var lowTemp = NSMutableAttributedString()
    var split = NSMutableAttributedString()
    let highLowTemp = NSMutableAttributedString()
    
    highTemp = NSMutableAttributedString(string: String(format: "%.0f˚", (data.apparentTemperatureMax)!))
    lowTemp = NSMutableAttributedString(string:  String(format: "%.0f˚", (data.apparentTemperatureMin)!))
    split = NSMutableAttributedString(string: " | ")
    
    
    
    // 63	139	195
    lowTemp.addAttribute(NSForegroundColorAttributeName, value: NSColor(red: 130/255, green: 203/255, blue: 237/255, alpha: 1), range: NSRange(location:0,length:lowTemp.length))
    
    // 254	132	132
    highTemp.addAttribute(NSForegroundColorAttributeName, value: NSColor(red: 254/255, green: 150/255, blue: 140/255, alpha: 1), range: NSRange(location:0,length:highTemp.length))
    
    highTemp.addAttribute(NSFontAttributeName, value: NSFont.boldSystemFont(ofSize: 15), range: NSRange(location:0,length:highTemp.length))
    
    lowTemp.addAttribute(NSFontAttributeName, value: NSFont.boldSystemFont(ofSize: 15), range: NSRange(location:0,length:lowTemp.length))
    
    split.addAttribute(NSForegroundColorAttributeName, value: NSColor.white, range: NSRange(location:0,length:split.length))
    
    highLowTemp.append(highTemp)
    highLowTemp.append(split)
    highLowTemp.append(lowTemp)
    
    highLowLabel.attributedStringValue = highLowTemp
    
    // Set Icon
    var moonPhase = 0.0
    var uv = 0.0
    
    if let phase = data.moonPhase {
      moonPhase = phase
    }
    
    if let uvIndex = data.uvIndex {
      uv = uvIndex
    }
    
    let icon = data.icon
    conditionImage.image = NSImage(named: WeatherIcon().iconName(icon: icon!, uv: uv, moonphase: moonPhase))

  }

  
  func configTextfields(){

    weekdayLabel.drawsBackground = true
    weekdayLabel.isBezeled = false
    weekdayLabel.isEditable = false
    weekdayLabel.isSelectable = false
    weekdayLabel.backgroundColor = .clear

    highLowLabel.drawsBackground = true
    highLowLabel.isBezeled = false
    highLowLabel.isEditable = false
    highLowLabel.isSelectable = false
    highLowLabel.backgroundColor = .clear

  }
  
}
