//
//  Time.swift
//  pitchperfect
//
//  Created by Saw Yu Nwe on 3/4/17.
//  Copyright © 2017 Saw Yu Nwe. All rights reserved.
//

import Foundation
struct Time{
    let hourUnit: Int = 60
    let minuteUnit: Int = 60
    let secondUnit: Int = 60
    
    var hour: Int
    var minute: Int
    var second: Int
    
    init(timeInSecond: Int){
        hour = (timeInSecond / minuteUnit) / hourUnit
        var leftSeconds = timeInSecond - (hour * minuteUnit * hourUnit)
        minute = leftSeconds / minuteUnit
        leftSeconds = timeInSecond - (minute * minuteUnit)
        second = leftSeconds
    }
    
    func toString() -> String{
        return "\(format(time: hour)):\(format(time: minute)):\(format(time: second))"
    }
    
    private func format(time: Int) -> String{
        let addZero = time / 10 == 0
        let result: String = addZero ? "0\(time)" : String(time)
        return result
    }
}
