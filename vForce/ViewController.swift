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
    @IBOutlet weak var fxTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func compute(sender: AnyObject) {
        let accelerate = MJAccelerate()
        var numbers = [NSNumber]()
        var ceiling:Int = (xTextField.text as NSString).integerValue;
        for index in 1...ceiling {
            numbers.append(NSNumber(integer: index))
        }
        
        let input = numbers as NSArray;
        let output = accelerate.pows(input)
        
        var string =  String()
        for index in 0...ceiling-1 {
            let number = numbers[index]
            let square = output[number] as NSNumber
            string += "\(number):\(square.integerValue)\n"
        }
        
        fxTextView.text = string
        NSLog("output:\(output)")
        NSLog("string:\(string)")
    }
}

