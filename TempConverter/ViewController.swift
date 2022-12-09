//
//  ViewController.swift
//  TempConverter
//
//  Created by Hugo Garcia on 2022-11-29.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var celciusPickerView: UIPickerView!
    
    private var temperatureValues = (-100...100).reversed().map {$0}
    
    let converter = CelsiusConverter()
    
    private let userDefaultRowKey = "defaultRowKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultPickerRow = initialPickerRow()
        
        celciusPickerView.selectRow(defaultPickerRow, inComponent: 0, animated: false)
        pickerView(celciusPickerView, didSelectRow: defaultPickerRow, inComponent: 0)
        
  //      for index in -100...100
  //        teperaturValue.append(index)
  //      }
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
     return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return temperatureValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "\(temperatureValues[row]) ºC"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print("\(row) : \(temperatureValues[row])")
        
        let tempC = temperatureValues[row]
        let tempF = converter.degreesFahrengeit(degreesCelsius: tempC)
        
        tempLabel.text = "\(tempF) ºF)"
        saveSelected(row: row)
    }
    
    func initialPickerRow() -> Int{
        
        let savedRow = UserDefaults.standard.object(forKey: userDefaultRowKey)as? Int
        
        if let row = savedRow{
         return row
        }else {
            return temperatureValues.count / 2
            
        }
        
        
    }
    
    func saveSelected(row : Int) {
        let defaults = UserDefaults.standard
        
        defaults.set(row, forKey: userDefaultRowKey)
        defaults.synchronize()
    }
}

