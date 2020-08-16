//
//  ViewController.swift
//  Calculator (#pxV.)
//
//  Created by Viet Pham on 4/8/20.
//  Copyright © 2020 Viet Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        resultLabel.text! = "0"
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if resultLabel.text! == "0" {
            resultLabel.text! = ""
        }
        resultLabel.text! += sender.titleLabel!.text!
    }
    
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func resultButtonPressed(_ sender: UIButton) {
    }
    
    
    
    
    
}

