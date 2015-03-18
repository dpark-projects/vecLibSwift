//
//  MJAccelerate.swift
//  vForce
//
//  Created by Dan Park on 3/18/15.
//  Copyright (c) 2015 Dan Park. All rights reserved.
//

import Accelerate

class MJAccelerate {
    func pows(x: [Float], var y: Float) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointers(&y, &n) {
            var z = x
            vvpowsf(&z, $0, x, $1)
            return z
        }
    }
    
    func pows(numbers:NSArray) -> NSDictionary {
        var x:[Float] = [Float]()
        for number in numbers as [NSNumber] {
            var value:Float = number.floatValue
            x.append(value)
        }
        
        var y:Float = 2
        var z:[Float] = pows(x, y:y)
        var mutable:NSMutableDictionary = NSMutableDictionary()
        
        for index in 0...numbers.count-1 {
            let key:NSNumber = numbers[index] as NSNumber;
            let value:NSNumber = NSNumber(float: z[index]);
            mutable[key] = value;
        }
        return mutable;
    }
}
