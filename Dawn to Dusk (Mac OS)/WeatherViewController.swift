//
//  WeatherViewController.swift
//  Dawn to Dusk (Mac OS)
//
//  Created by Nick Hayward on 11/2/16.
//  Copyright © 2016 Nick Hayward. All rights reserved.

import Cocoa
import CoreLocation

class WeatherViewController: NSViewController {
  
  let locationManager = CLLocationManager()
  let darkskyAPIKey = "c1be9a9ebe32129386dd862f15afb522"
  
  @IBOutlet var parentCollectionView: NSScrollView!
  @IBOutlet var weekViewCollection: NSCollectionView!
  @IBOutlet var infoStack: NSStackView!
  @IBOutlet var cityNameLabel: NSTextField!
  @IBOutlet var weatherImageView: NSImageView!
  @IBOutlet var temperatureLabel: NSTextField!
  @IBOutlet var summaryLabel: NSTextField!
  @IBOutlet var timeLabel: NSTextField! {
    didSet{
      timeLabel.isBezeled = false
      timeLabel.isEditable = false
      timeLabel.isSelectable = false
      timeLabel.backgroundColor = .clear
    }
  }
  
  
  @IBOutlet var precipIcon: NSImageView!
  @IBOutlet var precipLabel: NSTextField!
  
  @IBOutlet var humidityLabel: NSTextField!
  @IBOutlet var uvLabel: NSTextField!
  @IBOutlet var windLabel: NSTextField!
  @IBOutlet var sunPositionIcon: NSImageView!
  @IBOutlet var sunTimeLabel: NSTextField!
  @IBOutlet var helperText: NSTextField!
  
  
  
  
  var hourlyBlock: DataBlock?
  var dailyBlock: DataBlock?

  var time: [String] = []
  
  @IBOutlet var labelLeadingMarginConstraint: NSLayoutConstraint!
  
  var chart = Chart()
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    parentCollectionView.isHidden = true
//    weekViewCollection.isHidden = false
    initTable()
    // Do view setup here.
    chart = Chart(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 150))

    chart.delegate = self
    self.view.addSubview(chart)

    
//    infoStack.arrangedSubviews[0].isHidden = true
    
    self.view.acceptsTouchEvents = true
    
    DispatchQueue.main.async {
    
      self.location()
    }

//    setWeather("", long: "", city: "Redmond")
    
    //    setUpBackground()
    
    Timer.scheduledTimer(timeInterval: 60 * 45, target: self, selector: #selector(WeatherViewController.location), userInfo: nil, repeats: true)
    
//  
    
    // Add Gesture

//    NSAnimationContext.runAnimationGroup({ (context) in
//      context.duration = 1
//      windView.animator().alphaValue = 0
//    }, completionHandler: {
//      self.windView.isHidden = true
//      self.windView.alphaValue = 1
//    })
//  
//    windView.animator().isHidden = true
  
    
  }
  
  
  var i = 1
  func sayHello()
  {
    i += 1
    statusItem.button?.title = "\(1 + i)"
  }
  
  override func viewDidAppear() {
    styleChart()
    NSApplication.shared().activate(ignoringOtherApps: true)
    
    
    
//    NSAnimationContext.runAnimationGroup({ (context) in
//      context.duration = 10
//      windView.animator().alphaValue = 0
//      windView.animator().frame.origin.y = 100
////      windView.frame.origin.y += 100
//    }, completionHandler: {
//      self.windView.isHidden = true
//      self.windView.alphaValue = 1
//    })
    
//    
//    NSAnimationContext.runAnimationGroup({ (context) in
//      context.duration = 10
//      infoStack.animator().alphaValue = 0
//      infoStack.animator().frame.origin.y = 100
//    }, completionHandler: {
//      self.infoStack.isHidden = true
//      self.infoStack.alphaValue = 1
//    })

  }
  
  
  func setUpBackground(){
    let bwGradient = BackgroundController.BlackGradient()
    
    
    view.layer = bwGradient.gl
    
  }
  
  
  
  func setWeather(_ lat: String, long: String, city: String) {
    let prefs:UserDefaults = UserDefaults.standard
    let tempPref:Bool = prefs.bool(forKey: "tempSwitch") as Bool
    
    //    tempPref = false
    
    let forecast = DarkSkyForecast(apiKey: darkskyAPIKey).getCurrentForecast(lat, longitude: long, units: tempPref, lang: "")
    
    
    hourlyBlock = forecast.hourly
    dailyBlock = forecast.daily
    
    cityNameLabel.stringValue = city
    //    // Set current variables
    //    self.current = forecast
    //
    //    //    let time:String = forecast.timezone!
    let temperature = forecast.currently?.temperature
    temperatureLabel.stringValue =  String(format: "%.0f", temperature!)
    
    let summary = forecast.minutely?.summary
    summaryLabel.stringValue = summary!
    
    //    var humity = forecast.currently?.humidity
    //    let wind = forecast.currently?.windSpeed
    //    let uv = forecast.currently?.uvIndex
    //    var precip = forecast.currently?.precipProbability
    //
    //    uvIndex = (forecast.currently?.uvIndex)!
    //
    //
    //    //    let precip = forecast.currently?.precipType
    //    let icon = forecast.currently?.icon
    var isDay = true
    //
    //    //    print(forecast.currently?.doulbe[0])
    //    self.view.viewWithTag(-2)?.removeFromSuperview()
    //
    //
    //    // Set UILabels
    //    // All Caps City
    //    cityName = city
    //    cityNameLabel.text = city
    //
    //    // Send Weather Temp and Icon to Watch
    //    tempForWatch = String(format: "%.0f", temperature!)
    //    iconForWatch = icon!
    //
    //    // Save Current Temp
    //    currentTemp = temperature!
    //    cityTempLabel.text = String(format: "%.0f", temperature!)
    //    aiLabel.text = summary
    //    windLabel.text = String(format: "%.0f mph", wind!)
    //
    //    precip = precip! * 100
    //    precipLabel.text = String(format: "%.0f%%", precip!)
    //
    //    humity = humity! * 100
    //    humidityLabel.text = String(format: "%.0f%%", humity!)
    //
    //    // Animate City
    //    cityNameLabel.animation = "slideDown"
    //    cityNameLabel.curve = "spring"
    //    cityNameLabel.duration =  0.5
    //    cityNameLabel.animate()
    //
    //    // Animate Temp
    //    cityTempLabel.animation = "slideUp"
    //    cityTempLabel.curve = "easeInCubic"
    //    cityTempLabel.duration =  1.0
    //    cityTempLabel.animate()
    //
    //    // Animate AI
    //    aiLabel.animation = "zoomIn"
    //    aiLabel.curve = "easeInQuad"
    //    aiLabel.duration =  1.4
    //    aiLabel.delay =  1.0
    //    aiLabel.animate()
    //
    //    // Set Weather Icon
    //    //println(icon)
    //    setWeatherIcon(icon!)
    //
    //    // Spring Test
    //    weatherIconImage.animation = "zoomIn"
    //    weatherIconImage.curve = "easeOut"
    //    weatherIconImage.duration = 1.0
    //    weatherIconImage.animate()
    //
    //
    //    // Set Sunrise
    let hourly = forecast.daily?.dataPoints
    let current = hourly?.first
    //
    //    let sunriseTime = current?.sunriseTime
    let sunsetTime = current?.sunsetTime
    //
    //    // Precip
    //    precipProbability = current?.precipProbability
    //    precipProbability = precipProbability! * 100
    //    //println(precipProbability)
    //    // TODO Fix Sunrise
    //    //println(sunriseTime)
    //
    //    let dateFormatter = DateFormatter()
    //    //the "M/d/yy, H:mm" is put together from the Symbol Table
    //    dateFormatter.dateFormat = "h:mm a"
    //    dateFormatter.timeZone = TimeZone(identifier: (self.current?.timezone)!)
    //
    //    let sunsetFormatted = dateFormatter.string(from: sunsetTime!)
    //    let sunriseFormatted = dateFormatter.string(from: sunriseTime!)
    //
    //
    let currentDate = Date()
    
    let dateComparisionResult:ComparisonResult = currentDate.compare(sunsetTime!)
    
    if dateComparisionResult == ComparisonResult.orderedDescending
    {
      //          // Current date is smaller than end date.
      //          sunset_sunriseLabel.text = sunriseFormatted
      //          sunsetImage.image = UIImage(named: "Sunrise")
      isDay = false
      
    } else {
      //          sunsetImage.image = UIImage(named: "Sunset")
      //          sunset_sunriseLabel.text = sunsetFormatted
    }
    
    
    setBackground(temperature!, isDay: isDay, fade: true)
    //
    //    // Sets 7-Day Forecast
    //    var days = forecast.daily?.dataPoints
    //
    //    let todays = days?.first
    //
    //    if let temp = forecast.daily?.summary{
    //      weekSummary = temp
    //    }
    //
    //    if let temp = forecast.hourly?.summary{
    //      hourSummary = temp
    //    }
    //
    //    let alert = forecast.alerts
    //    if let firstAlert = alert.first{
    //      weatherAlerts = firstAlert.title!
    //    }
    //
    //    //println(weatherAlerts)
    //    //println(todays?.precipProbability)
    //    moonphase = todays?.moonPhase as Double!
    //    //println(todays?.ozone)
    //
    //
    //    for i in 0..<8  {
    //      let day = days?.first
    //      if let temp = day?.temperatureMax {
    //        multiTempHigh[i] = temp
    //      }
    //      if let temp = day?.temperatureMin {
    //        multiTempLow[i] = temp
    //      }
    //      if let icon = day?.icon {
    //        multiIcon[i] = icon
    //      }
    //      days?.remove(at: 0)
    //    }
    //
    //    days = forecast.daily?.dataPoints
    //    weekdays.removeAll()
    //    for _ in 0..<8  {
    //      if let day = days?.first {
    //        weekdays.append(day)
    //        days?.remove(at: 0)
    //      }
    //    }
    //
    //    // Setup hour
    //    var day = forecast.hourly?.dataPoints
    //    today.removeAll()
    //    for _ in 0..<18  {
    //      if let hour = day?.first {
    //        today.append(hour)
    //        day?.remove(at: 0)
    //      }
    //    }
    //
    //
    //    // Hourly Forecast
    
    //
    //
    //
    //    for i in 0..<13  {
    //      let hour = hours?.first
    //      if let temp = hour?.temperature{
    //        multiTempToday[i] = String(format: "%.0f", temp)
    //        //println(temp)
    //      }
    //      if let icon = hour?.icon {
    //        //println(icon)
    //        multiIconToday[i] = icon
    //      }
    //      if var precipProb = hour?.precipProbability {
    //        precipProb = precipProb * 100
    //        multiPrecipProbToday[i] = Int(precipProb)
    //        //println(precipProb)
    //      }
    //      hours?.remove(at: 0)
    //    }
    //
    //
    //
    
    
    
    // Resets Hours to Original
    var hours = forecast.hourly?.dataPoints
    let calendar = Calendar.current
    let hour = hours?.first
    let comp = calendar.dateComponents([.hour, .minute], from: (hour?.time)!)
    let currentHour = comp.hour
    //
    //
    var hourlyTimes: [String] = []
    var hourlyTemp: [Double] = []
    var precipIntensity: [Double] = []
    
    //    multiIconToday = []
    //    multiUV = []
    //    multiPrecip = []
    //    multiTime = []
    //    multiWindToday = []
    //    multiHumidityToday = []
    //
    
    for i in 0 ..< 18 {
      let hour = hours?.first
      if let temp = hour?.temperature{
        var newHour = currentHour! + i
        var stringHour = ""
        if newHour > 11 && newHour < 24{
          newHour = newHour % 12
          stringHour = String(newHour) + " PM"
          if newHour == 0 {
            stringHour = "12 PM"
          }
        } else if newHour > 23 {
          newHour = newHour % 12
          stringHour = String(newHour) + " AM"
          if newHour == 0 {
            stringHour = "12 AM"
          }
        } else {
          stringHour = String(newHour) + " AM"
        }
        hourlyTemp.append(floor(temp))
        hourlyTimes.append(String(newHour))
        time.append(stringHour)
      }
      //      if let wind = hour?.windSpeed{
      //
      //        multiWindToday.append(floor(wind))
      //      }
      //      if var humity = hour?.humidity{
      //        humity = humity * 100
      //        multiHumidityToday.append(floor(humity))
      //      }
      //
      //      if let icon = hour?.icon {
      //        multiIconToday.append(icon)
      //      }
      //
      //      if var precip = hour?.precipProbability{
      //        precip = precip * 100
      //        multiPrecip.append(floor(precip))
      //
      //      }
      //      if let uv = hour?.uvIndex{
      //        multiUV.append(uv)
      //      }
      precipIntensity.append((hour?.precipIntensity)!)
      hours?.remove(at: 0)
    }
    

    setChart(hourlyTimes, values: hourlyTemp)

    statusItem.title = String(format: " %.0f°",temperature!)
    //
    //
    //    // Reload Table Data
    //    //    forecastTable.reloadData()
    //    // TODO: Daily Forecast datapoints
        weekViewCollection.reloadData()
    //
    //    // Setup Push Notification
    //    // Push Notification
    //
    //    // Fix
    //    // pushNotification()
    //
    //    print(forecast.minutely?.summary)
    
    
    setMoreInfoStack(time: 0, value: Float(temperature!))
  }
  
  // Set Background
  func setBackground(_ temperature: Double, isDay: Bool, fade: Bool) {
    // Convert temperature to int    let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let prefs:UserDefaults = UserDefaults.standard
    
    var temp = Double(temperature)
    var backgroundLayer = BackgroundController.day60_70Gradient().gl
    
    let tempPref:Bool = prefs.bool(forKey: "tempSwitch") as Bool
    
    if tempPref {
      temp = (temp * 1.8 + 32)
    }
    
    
    // Set Background Color
    if isDay {
      switch temp {
      case -50...20:
        backgroundLayer = BackgroundController.day_20Gradient().gl
      case 20...30:
        backgroundLayer = BackgroundController.day20_30Gradient().gl
      case 30...40:
        backgroundLayer = BackgroundController.day30_40Gradient().gl
      case 40...50:
        backgroundLayer = BackgroundController.day40_50Gradient().gl
      case 50...60:
        backgroundLayer = BackgroundController.day50_60Gradient().gl
      case 60...95:
        backgroundLayer = BackgroundController.day60_70Gradient().gl
      case 95...100:
        backgroundLayer = BackgroundController.day90_100Gradient().gl
      case 100...110:
        backgroundLayer = BackgroundController.day100_110Gradient().gl
      case 110...120:
        backgroundLayer = BackgroundController.day110_120Gradient().gl
      case 120...180:
        backgroundLayer = BackgroundController.day120_Gradient().gl
      default:
        backgroundLayer = BackgroundController.day60_70Gradient().gl
      }
    } else {
      switch temp {
      case -50...30:
        backgroundLayer = BackgroundController.night_30Gradient().gl
      case 30...50:
        backgroundLayer = BackgroundController.night30_50Gradient().gl
      case 50...70:
        backgroundLayer = BackgroundController.night50_70Gradient().gl
      case 70...150:
        backgroundLayer = BackgroundController.night70_Gradient().gl
      default:
        backgroundLayer = BackgroundController.night50_70Gradient().gl
      }
    }
    
    
    
    view.layer = backgroundLayer
    
    
    if fade {
      let fadeAnimation = CABasicAnimation(keyPath: "opacity")
      fadeAnimation.fromValue = 0.0
      fadeAnimation.toValue = 1.0
      fadeAnimation.duration = 3
      fadeAnimation.repeatCount = 0
      
      backgroundLayer.opacity = 1.0
      backgroundLayer.add(fadeAnimation, forKey: "FadeAnimation")
      
      
    }
  }
  
  
  
  
}




// Location Manager
extension WeatherViewController: CLLocationManagerDelegate{
  
  
  func location(){
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.distanceFilter = 100
    locationManager.startUpdatingLocation()
  }
  
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    switch (status){
    case .authorizedAlways:
      print(status)
    default:
      print(status)
      
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error) ->
      Void in
      
      
      if error != nil {
        print("Here Error: " + error!.localizedDescription)
        //manager.stopUpdatingLocation()
        return
      }
      
      if placemarks!.count > 0 {
        manager.stopUpdatingLocation()
        let pm = placemarks![0]
        self.displayLocationInfo(pm)
        
      }
    })
  }
  
  
  
  func displayLocationInfo(_ placemark: CLPlacemark) {
    let loc = placemark.location!.coordinate
    let lat:String = String(stringInterpolationSegment: loc.latitude)
    let long:String = String(stringInterpolationSegment: loc.longitude)
    let city = placemark.locality
    
    if(city != nil){
      
      setWeather(lat, long: long, city: city!)
    } else {
      // Can't Find City Name
      
    }
    
    
  }
  
  
  override func mouseUp(with event: NSEvent) {
    let locationInView = view.convert(event.locationInWindow, from: nil)

    if locationInView.y < chart.frame.height || locationInView.y < weekViewCollection.frame.height{
      swapChartCollection()
    }
  }
  
  override func mouseDown(with event: NSEvent) {
    let locationInView = view.convert(event.locationInWindow, from: nil)
    
    if locationInView.y < chart.frame.height || locationInView.y < weekViewCollection.frame.height{
//      if (event.clickCount > 1){
        swapChartCollection()
//      }
    }
  }

  
  func swapChartCollection(){
    
    helperText.removeFromSuperview()
    self.didFinishTouchingChart(chart)
    if parentCollectionView.isHidden{
      timeLabel.stringValue = ""
      parentCollectionView.isHidden = false
      chart.isHidden = true
    }else {
      chart.isHidden = false
      parentCollectionView.isHidden = true
    }
  }
  
  
  
}



extension WeatherViewController: ChartDelegate{
  
  func styleChart(){
    
    timeLabel.stringValue = ""
    
    
    // Configure chart layout
    chart.highlightLineColor = .lightGray
    chart.highlightLineWidth = 2
    chart.lineWidth = 4
    chart.labelFont = NSFont.systemFont(ofSize: 12)
    chart.axesColor = .clear
    chart.areaAlphaComponent = 0
    chart.gridColor = .clear
    
    
    
    chart.labelColor = .clear
    chart.layer?.backgroundColor = .clear
    
  }
  
  
  func didTouchChart(_ chart: Chart, indexes: Array<Int?>, x: Float, left: CGFloat) {
    
    guard chart.series.count > 0 else {
      print("Empty")
      return
    }
    
    if indexes.count < 0 {
      return
    }
    if let value = chart.valueForSeries(0, atIndex: indexes[0]) {
      let labelLeadingMarginInitialConstant = CGFloat(0)

      // Align the label to the touch left position, centered
      // Appoximate Width
      var constant = labelLeadingMarginInitialConstant+left - (timeLabel.frame.width/2)
      //      print(label.frame.width)
      
      // Avoid placing the label on the left of the chart
      if constant < labelLeadingMarginInitialConstant {
        constant = labelLeadingMarginInitialConstant
      }
      
      // Avoid placing the label on the right of the chart
      let rightMargin = chart.frame.width - timeLabel.frame.width
      if constant > rightMargin {
        constant = rightMargin
      }
      
      
      //      DispatchQueue.main.async {
      timeLabel.stringValue = time[Int(x)]
      labelLeadingMarginConstraint.constant = constant
      
      setMoreInfoStack(time: Int(x), value: value)
      
    }
    
    
    
  }
  
  func didFinishTouchingChart(_ chart: Chart) {
    timeLabel.stringValue = ""
  
    setMoreInfoStack(time: 0, value: chart.valueForSeries(0, atIndex: 0)!)
  }
  
  func setMoreInfoStack(time: Int, value: Float){

    // Set Weather Icon Image
    var moonPhase = 0.0
    var uv = 0.0
    
    if let phase = hourlyBlock?.dataPoints[time].moonPhase {
      moonPhase = phase
    }
    
    if let uvIndex = hourlyBlock?.dataPoints[time].uvIndex {
      uv = uvIndex
    }

    
   
    let icon = hourlyBlock?.dataPoints[time].icon
    let precipIntensity = hourlyBlock?.dataPoints[time].precipIntensity
    let precipProb = hourlyBlock?.dataPoints[time].precipProbability
    
    weatherImageView.image = NSImage(named: WeatherIcon().iconName(icon: icon!, uv: uv, moonphase: moonPhase))
    
    var myString = "Drizzle"
    let precip = String(format: "%\(0.3)f", precipIntensity!)
    
    var myMutableString = NSMutableAttributedString()
    
    
    // Heavy .10 > Medium > .06 Light > .0397 Drizzle > .0065
    var b = NSColor(calibratedRed: 117/256, green: 180/256, blue: 217/256, alpha: 1)

    switch precipIntensity!{
    case 0.0..<0.0065:
      myString = "Drizzle"
    case 0.0065...0.037:
      myString = "Light"
    case 0.037...0.06:
      myString = "Medium"
      b = NSColor(calibratedRed: 10/256, green: 57/256, blue: 260/256, alpha: 1)

    default:
      myString = "Heavy"
      b = NSColor(calibratedRed: 0/256, green: 0/256, blue: 70/256, alpha: 1)

    }
    
    
    myMutableString = NSMutableAttributedString(string: myString, attributes: nil)
    //117	180	217
    myMutableString.addAttribute(NSForegroundColorAttributeName, value: b, range: NSRange(location:0,length:myString.characters.count))
    
    myMutableString.append(NSAttributedString(string: " \(precip) in/h"))
  
    precipLabel.attributedStringValue = myMutableString


    // Add some padding above the x-axis
    temperatureLabel.stringValue = String(format: "%.0f", value)
    windLabel.stringValue = String(format: "%.0f mph", (hourlyBlock?.dataPoints[time].windSpeed)!)
    humidityLabel.stringValue = String(format: "%.0f%%", ((hourlyBlock?.dataPoints[time].humidity)!*100))
    
    if precipIntensity! < 0.04{
      precipLabel.stringValue = String(format: "%.0f%%", precipProb!*100)
    }
    
    if uv > 0{
      uvLabel.stringValue = String(format: "%.0f", (hourlyBlock?.dataPoints[time].uvIndex)!)
    } else {
      infoStack.arrangedSubviews[2].isHidden = true
    }
  }
  
  
  
  
  func setChart(_ dataPoints: [String], values: [Double]) {
    chart.removeAllSeries()

    
    var seriesData: Array<Float> = []
    //    var labels: Array<Float> = []
    //    var labelsAsString: Array<String> = []
    
    // Date formatter to retrieve the month names
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM"
    
    
    // Make sure data point doesn't exceed data
    guard dataPoints.count >= values.count else {
      print("Count too large")
      return
    }
    
    for i in 0..<dataPoints.count {
      seriesData.append(Float(values[i]))
    }
    
    let series = ChartSeries(seriesData)
    
    //    let series = ChartSeries([0, 6.5, 2, 8, 4.1, 7, -3.1, 10, 8])
    series.color = .white
    series.bezier = true
    
    // Add some padding above the x-axis
    //    chart.minY = seriesData.min()! - 5
    chart.add(series)
    
    chart.xLabelsFormatter = { (labelIndex: Int, labelValue: Float) -> String in
      return ""
    }
    
    chart.setNeedsDisplay()
    
  }
  
  
}


extension WeatherViewController: NSCollectionViewDataSource, NSCollectionViewDelegate{


  func initTable(){
    weekViewCollection.delegate = self
    weekViewCollection.dataSource = self
//    getDownloads()
  
    // 3
//    weekViewCollection.layer?.backgroundColor = NSColor.red.cgColor
    
    configureCollectionView()
  }
  

  func numberOfSections(in collectionView: NSCollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
    if dailyBlock != nil {
      return (dailyBlock?.dataPoints.count)!
    }
    return 0
  }
  

  
  func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
    
    // 4
    let item = collectionView.makeItem(withIdentifier: "DayCollectionItem", for: indexPath)
    
    
    guard let collectionViewItem = item as? DayCollectionItem else { return item }
    
    collectionViewItem.weekdayLabel.stringValue = "HEY"
    collectionViewItem.view.layer?.backgroundColor = NSColor.clear.cgColor

    collectionViewItem.setData(data: (dailyBlock?.dataPoints[indexPath.item])!)
    
    
    
    // 5
    return item
  }
  
  func configureCollectionView() {
    // 1
    let flowLayout = NSCollectionViewFlowLayout()
    flowLayout.itemSize = NSSize(width: 80, height: 125)
    flowLayout.sectionInset = EdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    //    flowLayout.minimumInteritemSpacing = 20.0
    //    flowLayout.minimumLineSpacing = 20.0
    flowLayout.scrollDirection = .horizontal
    
    
    parentCollectionView.enclosingScrollView?.horizontalScroller?.isHidden = true
    parentCollectionView.enclosingScrollView?.hasHorizontalScroller = false
    parentCollectionView.enclosingScrollView?.hasVerticalScroller = false
    parentCollectionView.enclosingScrollView?.horizontalScroller = nil
    
    weekViewCollection.collectionViewLayout = flowLayout
    
    weekViewCollection.enclosingScrollView?.hasHorizontalScroller = false
    weekViewCollection.enclosingScrollView?.hasVerticalScroller = false
    weekViewCollection.enclosingScrollView?.horizontalScroller = nil


    // 2
    view.wantsLayer = true
    // 3
    weekViewCollection.layer?.backgroundColor = NSColor.clear.cgColor
  }
  
  
}
