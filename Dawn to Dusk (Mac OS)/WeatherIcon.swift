//
//  WeatherIcon.swift
//  Dawn to Dusk (Mac OS)
//
//  Created by Nick Hayward on 11/9/16.
//  Copyright © 2016 Nick Hayward. All rights reserved.
//

import Foundation


class WeatherIcon {
  
  func iconName(icon:String, uv: Double, moonphase: Double) -> String{
    var iconName = ""
    switch icon {
    case "clear-day":
      iconName = sunForUVIndex(uv: uv)
    case "clear-night":
      iconName =  setMoonPhase(moonPhase: moonphase)
    case "rain":
      iconName = "Rain"
    case "wind":
      iconName = "Wind"
    case "snow":
      iconName = "Snow"
    case "sleet":
      print("sleet")
    case "fog":
      iconName = "Fog"
    case "hail":
      iconName =  "Hail"
    case "tornado":
      print("tornado")
    case "thunderstorm":
      iconName = "Lightning"
    case "partly-cloudy-day":
      
      iconName = "PartlyCloudyDay"
    case "partly-cloudy-night":
      
      iconName = "PartlyCloudyNight"
    case "lightning":
      iconName = "Lightning"
    case "cloudy":
      iconName =  "Cloud"
    default:
      iconName =  "Cloud"
    }
    return iconName
  }
  
  func sunForUVIndex(uv: Double) -> String{
    var sunIndex = ""
    if (uv >= 3 && uv <= 5) {
      sunIndex = "SunIndex3_5"
    } else if (uv > 5 && uv <= 7) {
      sunIndex =  "SunIndex7_10"
    } else if (uv > 7 && uv <= 12) {
      sunIndex =  "SunIndex9_11"
    } else {
      sunIndex = "sun"
    }
    return sunIndex
  }
  
  func setMoonPhase(moonPhase: Double) -> String{
    var moon = ""
    switch moonPhase {
    case 0.0...0.125:
      moon = "Moon1"
    case 0.126...0.25:
      moon = "Moon2"
    case 0.26...0.375:
      moon = "Moon3"
    case 0.376...0.50:
      moon = "Moon4"
    case 0.51...0.625:
      moon = "Moon5"
    case 0.626...0.750:
      moon = "Moon6"
    case 0.751...0.875:
      moon = "Moon7"
    case 0.876...1.0:
      moon = "Moon8"
    default:
      moon = "Moon"
    }
    return moon
  }
  
  
}
