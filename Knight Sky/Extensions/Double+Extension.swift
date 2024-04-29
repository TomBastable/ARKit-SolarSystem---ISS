//
//  Double+Extension.swift
//  Knight Sky
//
//  Created by Tom Bastable on 29/04/2024.
//

import Foundation

extension Double {
    var radians: Double { self * .pi / 180 }
    var degrees: Double { self * 180 / .pi }
}
