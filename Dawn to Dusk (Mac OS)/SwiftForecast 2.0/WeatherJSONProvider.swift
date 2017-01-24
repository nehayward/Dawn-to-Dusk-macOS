//
//  WeatherJSONProvider.swift
//  SwiftForecast
//
//  Created by Matt on 3/29/15.
//  Copyright (c) 2015 MattNedrich. All rights reserved.
//

import Foundation

class WeatherJSONProvider {
  let urlBuilder: HttpAddressBuilder
  
  init (apiKey: String) {
    urlBuilder = HttpAddressBuilder(apiKey: apiKey)
  }
  
  func getWeatherJSON(_ latitude: String, longitude: String, units: Bool, lang: String) -> NSDictionary {
    let url = urlBuilder.createCurrentForecastURL(latitude, longitude: longitude, units: units, lang: lang)
    return getJSONSync(url!)
  }
  
  func getPastWeatherJSON(_ latitude: String, longitude: String, time: Date) -> NSDictionary {
    let url = urlBuilder.createPastForecastURL(latitude, longitude: longitude, time: time)
    return getJSONSync(url!)
  }
  
  func getJSONSync(_ url: URL) -> NSDictionary {
    let responseData = getURLResponseSync(url)
    
    do {
      let jsonDictionary = try JSONSerialization.jsonObject(with: responseData, options: [])
      // success ...
      return jsonDictionary as! NSDictionary
    } catch let error as NSError {
      // failure
      print(error.localizedDescription)
      let jsonDictionary:NSDictionary = NSDictionary()
      return jsonDictionary
    }
  }
  
  func getURLResponseSync(_ url: URL) -> Data {
    let sem = DispatchSemaphore(value: 0)
    var responseData = Data()
    URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
      responseData = data!
      sem.signal()
    }).resume()
    sem.wait(timeout: DispatchTime.distantFuture)
    
  
// MARK: Uncomment for json data
//        var responseData = Data()
//
//    if let url = Bundle.main.url(forResource: "vancouver", withExtension: "json") {
//      if let data = NSData(contentsOf: url) {
//        responseData = data as Data
//      }
//    }
    
    
    return responseData
  }
}
