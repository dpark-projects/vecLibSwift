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

        
        let input:NSArray = [NSNumber(float: 1), NSNumber(float: 2), NSNumber(float: 3)]
        let output:NSDictionary = accelerate.pows(input)
        NSLog("output:\(output)")
        
    }
}

