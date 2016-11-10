//
//  DataPoint.swift
//  SwiftForecast
//
//  Created by Matt on 3/29/15.
//  Copyright (c) 2015 MattNedrich. All rights reserved.
//

import Foundation

public class DataPoint {
  public let time: Date?
  public let summary: String?
  public let icon: String?
  public let sunriseTime: Date? // daily only
  public let sunsetTime: Date? // daily only
  public let moonPhase: Double? // daily data points only
  public let nearestStormDistance: Double? // currently data points only
  public let nearestStormBearing: Double? // currently data points only
  public let precipIntensity: Double?
  public let precipProbability: Double?
  public let precipType: String?
  public let precipAccumulation: Double? // hourly and daily only
  public let temperature: Double? // not on daily
  public let temperatureMin: Double?
  public let temperatureMinTime: Date?
  public let temperatureMax: Double?
  public let temperatureMaxTime: Date?
  public let apparentTemperature: Double?
  public let apparentTemperatureMin: Double?
  public let apparentTemperatureMinTime: Date?
  public let apparentTemperatureMax: Double?
  public let apparentTemperatureMaxTime: Date?
  public let dewPoint: Double?
  public let windSpeed: Double?
  public let windBearing: Double?
  public let cloudCover: Double?
  public let humidity: Double?
  public let pressure: Double?
  public let visibility: Double?
  public let ozone: Double?
  public let uvIndex: Double?
//  public var doulbe:[operations] = []
  
  public struct operations{
    var open:String
  }
  
  init (jsonDict: NSDictionary) {

//    self.doulbe.append(operations.init(open: "HEY"))
    self.temperature = jsonDict["temperature"] as? Double
    self.temperatureMin = jsonDict["temperatureMin"] as? Double
    self.temperatureMax = jsonDict["temperatureMax"] as? Double
    self.apparentTemperature = jsonDict["apparentTemperature"] as? Double
    self.apparentTemperatureMin = jsonDict["apparentTemperatureMin"] as? Double
    self.apparentTemperatureMax = jsonDict["apparentTemperatureMax"] as? Double
    self.uvIndex = jsonDict["uvIndex"] as? Double

    self.summary = jsonDict["summary"] as? String
    self.icon = jsonDict["icon"] as? String
    
    self.moonPhase = jsonDict["moonPhase"] as? Double
    self.nearestStormDistance = jsonDict["nearestStormDistance"] as? Double
    self.nearestStormBearing = jsonDict["nearestStormBearing"] as? Double
    self.precipIntensity = jsonDict["precipIntensity"] as? Double
    self.precipProbability = jsonDict["precipProbability"] as? Double
    self.precipType = jsonDict["precipType"] as? String
    self.precipAccumulation = jsonDict["precipAccumulation"] as? Double
    self.dewPoint = jsonDict["dewPoint"] as? Double
    self.windSpeed = jsonDict["windSpeed"] as? Double
    self.windBearing = jsonDict["windBearing"] as? Double
    self.cloudCover = jsonDict["cloudCover"] as? Double
    self.humidity = jsonDict["humidity"] as? Double
    self.pressure = jsonDict["pressure"] as? Double
    self.visibility = jsonDict["visibility"] as? Double
    self.ozone = jsonDict["ozone"] as? Double
    
    if let timeNumber = jsonDict["time"] as? NSNumber {
      self.time = Date(timeIntervalSince1970: timeNumber.doubleValue)
    } else {
      self.time = nil
    }
    
    if let sunriseTimestamp = jsonDict["sunriseTime"] as? NSNumber {
      self.sunriseTime = Date(timeIntervalSince1970: sunriseTimestamp.doubleValue)
    } else {
      self.sunriseTime = nil
    }
    
    if let sunriseTimestamp = jsonDict["sunsetTime"] as? NSNumber {
      self.sunsetTime = Date(timeIntervalSince1970: sunriseTimestamp.doubleValue)
    } else {
      self.sunsetTime = nil
    }
    
    if let tempMinTimeNumber = jsonDict["temperatureMinTime"] as? NSNumber {
      self.temperatureMinTime = Date(timeIntervalSince1970: tempMinTimeNumber.doubleValue)
    } else {
      self.temperatureMinTime = nil
    }
    
    if let tempMaxTimeNumber = jsonDict["temperatureMaxTime"] as? NSNumber {
      self.temperatureMaxTime = Date(timeIntervalSince1970: tempMaxTimeNumber.doubleValue)
    } else {
      self.temperatureMaxTime = nil
    }
    
    if let apparentTempMinTimeNumber = jsonDict["apparentTemperatureMinTime"] as? NSNumber {
      self.apparentTemperatureMinTime = Date(timeIntervalSince1970: apparentTempMinTimeNumber.doubleValue)
    } else {
      self.apparentTemperatureMinTime = nil
    }
    
    if let apparentTempMaxTimeNumber = jsonDict["apparentTemperatureMaxTime"] as? NSNumber {
      self.apparentTemperatureMaxTime = Date(timeIntervalSince1970: apparentTempMaxTimeNumber.doubleValue)
    } else {
      self.apparentTemperatureMaxTime = nil
    }
    
  }
}
