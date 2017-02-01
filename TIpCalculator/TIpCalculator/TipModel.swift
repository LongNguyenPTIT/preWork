//
//  TipModel.swift
//  TIpCalculator
//
//  Created by Nguyen Nam Long on 1/28/17.
//  Copyright © 2017 Nguyen Nam Long. All rights reserved.
//

import Foundation

class TipModel {
    var billAmount: Double = 0.0
    var tipPercent: Int = 0
    var tipAmount: Double { return billAmount * Double(tipPercent)/100 }
    var totalAmount: Double { return billAmount + tipAmount }
    var people: Int = 1
    var totalPerPerson: Double { return totalAmount / Double(people) }
    
}
