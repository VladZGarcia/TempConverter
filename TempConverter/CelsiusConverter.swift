//
//  CelsiusConverter.swift
//  TempConverter
//
//  Created by Hugo Garcia on 2022-11-29.
//

import Foundation


class CelsiusConverter {
    
    func degreesFahrengeit(degreesCelsius: Int) -> Int {
        
        let tempF = 1.8 * Double(degreesCelsius)+32.0
        
        return Int(round(tempF))
    }
}
