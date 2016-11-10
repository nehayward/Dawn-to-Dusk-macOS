//
//  HttpAddressBuilder.swift
//  SwiftForecast
//
//  Created by Matt on 3/29/15.
//  Copyright (c) 2015 MattNedrich. All rights reserved.
//

import Foundation

class HttpAddressBuilder {
  let apiKey: String
  let urlBase: URL
  let urlScheme = "https"
  let urlHost = "api.forecast.io"
  let urlPath = "/forecast"
  
  init(apiKey: String) {
    self.apiKey = apiKey
    urlBase = (NSURL(scheme: urlScheme, host: urlHost, path: urlPath) as? URL)!
  }
  
  func createCurrentForecastURL(_ latitude: String, longitude: String, units: Bool, lang: String) -> URL? {
    var urlParams = "/" + apiKey + "/" + latitude + "," + longitude
    
    if (units == true){
      urlParams = urlParams + "?units=si" + "&solar=1"
    } else {
      urlParams =  urlParams + "?units=us" + "&solar=1"
    }
    if (lang != ""){
      urlParams = urlParams + "?lang=" + lang + "&solar=1"
    }
    
    let fullURL = URL(string: urlBase.absoluteString + urlParams)
    print(fullURL)
    return fullURL
  }
  
  func createPastForecastURL(_ latitude: String, longitude: String, time: Date) -> URL? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let dateString = dateFormatter.string(from: time)
    let urlParams = "/" + apiKey + "/" + latitude + "," + longitude + "," + dateString
    let fullURL = URL(string: urlBase.absoluteString + urlParams)
    return fullURL
  }
}
