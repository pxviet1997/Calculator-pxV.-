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
    
    var operators = ""
    var operand1 = 0.0
    var operand2 = 0.0
    
    var operandDone = false
    
    var result = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        resultLabel.text! = "0"
        operators = ""
        operand1 = 0.0
        operand2 = 0.0
        
        operandDone = false
        
        result = 0.0
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if resultLabel.text! == "0" {
            resultLabel.text! = ""
        }
        if operandDone {
            resultLabel.text! = ""
            operandDone = false
        }
        resultLabel.text! += sender.titleLabel!.text!
        result = Double(resultLabel.text!)!
    }
    
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        
        if sender.titleLabel!.text == "+" {
            operators = "+"
            operand1 = Double(resultLabel.text!)!
            operandDone = true
        }
        else if sender.titleLabel!.text == "-" {
            operators = "-"
            operand1 = Double(resultLabel.text!)!
            operandDone = true
        }
        else if sender.titleLabel!.text == "X" {
            operators = "X"
            operand1 = Double(resultLabel.text!)!
            operandDone = true
        }
        else if sender.titleLabel!.text == "/" {
            operators = "/"
            operand1 = Double(resultLabel.text!)!
            operandDone = true
        }
        
    }
    
    @IBAction func resultButtonPressed(_ sender: UIButton) {
        calculation()
        
        var resultString = String(result)
        if resultString.contains(".") {
            let index = resultString.firstIndex(of: ".")
            if resultString.substring(from: index!) == nil {
                resultString = resultString.substring(to: index!)
            }
        }
        
        resultLabel.text = resultString
    }
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        
        resultLabel.text! += sender.titleLabel!.text!
        
    }
    
    
    func calculation() {
        operand2 = Double(resultLabel.text!)!
        operandDone = true
        
        if operators == "+" {
            result = operand1 + operand2
        }
        else if operators == "-" {
            result = operand1 - operand2
        }
        else if operators == "X" {
            result = operand1 * operand2
        }
        else if operators == "/" {
            result = operand1 / operand2
        }
        
    }
    
    
    
    
    
}

