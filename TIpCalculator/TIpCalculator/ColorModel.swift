//
//  ColorModel.swift
//  TIpCalculator
//
//  Created by Nguyen Nam Long on 1/28/17.
//  Copyright © 2017 Nguyen Nam Long. All rights reserved.
//

import Foundation
import UIKit

class ColorModel {
    var darkMode: Bool
    var colorConfig: ColorMode
    var screenColor: UIColor {
        if darkMode {
            return UIColor(hex: "#262626")
        }else {
            return UIColor.white
        }
    }
    
    var backgroundView: UIColor {
        if darkMode {
            return colorConfig.normal
        }else {
            return UIColor.white
        }
    }
    
    
    var numberPadColor: UIColor {
        if darkMode {
            return UIColor(hex: "#2b2b2b")
        }else {
            return colorConfig.normal
        }
    }
    
    
    
    var numberColor: UIColor{
        if darkMode {
            return colorConfig.normal
        }else {
            return UIColor.white
        }
    }
    
    
    
    var disableColor: UIColor{
        if darkMode {
            return colorConfig.dark
        }else {
            return colorConfig.light
        }
    }
    
    
    
    
    
    

    
    private let redColor = ColorMode(name: "red", normal: UIColor(hex: "#ff3b30") , dark: UIColor(hex: "#92322d"), light: UIColor(hex: "#fc9a94"))
    private let orangeColor = ColorMode(name: "orange", normal: UIColor(hex: "#ff9600"), dark: UIColor(hex: "#925f16"), light: UIColor(hex: "#fcc77c"))
    private let blueColor = ColorMode(name: "blue", normal: UIColor(hex: "#54c7fc"), dark: UIColor(hex: "#3f7791"), light: UIColor(hex: "#a6e0fa"))
    private let greenColor = ColorMode(name: "green", normal: UIColor(hex: "#44db5e"), dark: UIColor(hex: "#378043"), light: UIColor(hex: "#9eeaab"))
    private let pinkColor = ColorMode(name: "pink", normal: UIColor(hex: "#ff4981"), dark: UIColor(hex: "#913953"), light: UIColor(hex: "#fca1bd"))
    private let purpleColor = ColorMode(name: "purple", normal: UIColor(hex: "#c644fc"), dark: UIColor(hex: "#763791"), light: UIColor(hex: "#df9efa"))
    private let yellowColor = ColorMode(name: "yellow", normal: UIColor(hex: "#ffcd00"), dark: UIColor(hex: "#927a16"), light: UIColor(hex: "#fce37c"))
    
    
    init() {
        darkMode = false
        colorConfig = redColor
    }
    
    
    func convertStringToColor(name: String) {
        switch name {
        case "red": colorConfig = redColor
        case "orange": colorConfig = orangeColor
        case "blue": colorConfig = blueColor
        case "green": colorConfig = greenColor
        case "pink": colorConfig = pinkColor
        case "purple": colorConfig = purpleColor
        default:
            colorConfig = yellowColor
        }
    }

    
    
}


struct ColorMode {
    var name: String
    var normal: UIColor
    var dark: UIColor
    var light: UIColor
}



extension UIColor {
    convenience init(hex: String) {
        var cString:String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = cString.substring(from: cString.characters.index(cString.startIndex, offsetBy: 1))
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
