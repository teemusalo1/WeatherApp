//
//  ViewController.swift
//  WeatherApp
//
//  Created by iosdev on 23.11.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, WeatherObserver {
   
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityPicker: UIPickerView!
    var weatherData = WeatherData()
    
    var city = ["Helsinki", "Turku", "Vantaa", "Espoo", "Rovaniemi"]
    var currentCity = ""
    
    func update(main: MainInfo, wind: [String:Double], desc: [Weather]) {
           DispatchQueue.main.async {
            
               self.tempLabel.text = "temp: \(((main.temp - 273.15) * 10).rounded() / 10) C"
               self.cityLabel.text = self.currentCity
               
           }

       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cityPicker.dataSource = self
        self.cityPicker.delegate = self
        currentCity = ""
        weatherData.registerObserver(observer: self)
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
       }
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
              return city.count
          }
      
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            currentCity = city[row]
             weatherData.getWeatherData(city: currentCity)
           return String(city[row])
           
       }
  
    
}



