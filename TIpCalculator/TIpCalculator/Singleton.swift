//
//  Singleton.swift
//  TIpCalculator
//
//  Created by Nguyen Nam Long on 2/1/17.
//  Copyright © 2017 Nguyen Nam Long. All rights reserved.
//

import Foundation

class Singleton {
    static let Instance = Singleton()
    
    var Color = ColorModel()
    var Tipmodel = TipModel()
    let currencySymbol = (Locale.current as NSLocale).object(forKey: NSLocale.Key.currencySymbol)!
    let currencyCode = (Locale.current as NSLocale).object(forKey: NSLocale.Key.currencyCode)!
}
