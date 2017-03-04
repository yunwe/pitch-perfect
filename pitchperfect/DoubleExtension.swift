//
//  DoubleExtension.swift
//  pitchperfect
//
//  Created by Saw Yu Nwe on 3/4/17.
//  Copyright © 2017 Saw Yu Nwe. All rights reserved.
//

import Foundation
extension Double{
    func toInt() -> Int?{
        if self > Double(Int.min) && self < Double(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
}
