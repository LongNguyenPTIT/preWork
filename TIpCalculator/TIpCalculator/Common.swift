//
//  Common.swift
//  TIpCalculator
//
//  Created by Nguyen Nam Long on 1/29/17.
//  Copyright © 2017 Nguyen Nam Long. All rights reserved.
//

import Foundation

extension Decimal {
    var significantFractionalDecimalDigits: Int {
        return max(-exponent, 0)
    }
}
