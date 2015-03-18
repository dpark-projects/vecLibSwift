//
//  ViewController.swift
//  vForce
//
//  Created by engineering on 3/18/15.
//  Copyright (c) 2015 Dan Park. All rights reserved.
//

import UIKit
import Accelerate

class ViewController: UIViewController {

    func pows(x: [Double], var y: Double) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointers(&y, &n) {
            var z = x
            vvpows(&z, $0, x, $1) // z,y,x,n
            return z
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var x:[Double] = [1, 2, 3]
        var y:Double = 2
        var z:[Double] = pows(x, y:y)
        NSLog("z:\(z)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

