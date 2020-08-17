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
    
    var newOperand = false
    var operandDone = false
    var dotPressed = false
    
    var result = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signButtonPressed(_ sender: UIButton) {
        checkForZero()
        resultLabel.text! = "-"
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        resultLabel.text! = "0"
        operators = ""
        operand1 = 0.0
        operand2 = 0.0
        newOperand = false
        operandDone = false
        dotPressed = false
        result = 0.0
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        checkForZero()
        
        if operandDone {
            if resultLabel.text! != "-" {
                resultLabel.text! = ""
            }
            operandDone = false
        }
        
        resultLabel.text! += sender.titleLabel!.text!
//        result = Double(resultLabel.text!)!
        newOperand = true
    }
    private func checkForZero() {
        if resultLabel.text! == "0" {
            resultLabel.text! = ""
        }
    }
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        operatorType(sender.titleLabel!.text!)
    }
    
    private func operatorType(_ type: String) {
        operators = type
        operand1 = Double(resultLabel.text!)!
        operandDone = true
        dotPressed = false
    }
    
    @IBAction func resultButtonPressed(_ sender: UIButton) {
        if newOperand {
            operand2 = Double(resultLabel.text!)!
            newOperand = false
        }
        else {
            operand1 = result
        }
        
        if operators == "+" {
            result = ((operand1 + operand2) * 100) / 100
        }
        else if operators == "-" {
            result = ((operand1 - operand2) * 100) / 100
        }
        else if operators == "X" {
            result = ((operand1 * operand2) * 100) / 100
        }
        else if operators == "/" {
            result = ((operand1 / operand2) * 100) / 100
        }

        operandDone = true
        
        resultLabel.text = String(result)
        
    }
    
    @IBAction func percentageButtonPressed(_ sender: UIButton) {
        resultLabel.text = String(Double(resultLabel.text!)! / 100)
    }
    
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if !dotPressed {
            resultLabel.text! += sender.titleLabel!.text!
            dotPressed = true
        }
    }
    
}
