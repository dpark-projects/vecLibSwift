//
//  ViewController.swift
//  vForce
//
//  Created by engineering on 3/18/15.
//  Copyright (c) 2015 Dan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var xTextField: UITextField!
    @IBOutlet weak var fxTextField: UITextField!
    @IBOutlet weak var elapsedTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func compute(sender: AnyObject) {
        let accelerate = MJAccelerate()
        var ceiling:Int = (xTextField.text as NSString).integerValue;
        var numbers = [NSNumber]()
        for index in 1...ceiling {
            numbers.append(NSNumber(integer: index))
        }
        
        let input:NSArray = numbers as NSArray;
        let output:NSDictionary = accelerate.pows(input)
        NSLog("output:\(output)")
        
    }
}

