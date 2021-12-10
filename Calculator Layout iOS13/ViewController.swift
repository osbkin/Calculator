//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayResultLabel: UILabel!
    var typingNumber = false
    var dotIsPlacced = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    
    var currentInut: Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                displayResultLabel.text = "\(valueArray[0])"
            } else {
                displayResultLabel.text = "\(newValue)"
            }
        }
    }
    
    @IBAction func pressedNumber(_ sender: UIButton) {
        let numberButton = sender.currentTitle!
       
        if typingNumber {
            if displayResultLabel.text!.count < 15 {
            displayResultLabel.text = displayResultLabel.text! + numberButton
            }
        } else {
            displayResultLabel.text = numberButton
            typingNumber = true
        }
    }
    
    @IBAction func twoOperandSingPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentInut
        typingNumber = false
    }
    
    func operateWithTwoOperands(operationDone: (Double, Double) -> Double) {
        currentInut = operationDone(firstOperand, secondOperand)
        typingNumber = false
        dotIsPlacced = false
    }
    
    @IBAction func equalitySignPressed(_ sender: UIButton) {
        if typingNumber {
            secondOperand = currentInut
        }
        dotIsPlacced = false
        
        switch operationSign {
        case "+":
            operateWithTwoOperands {$0 + $1}
        case "-":
            operateWithTwoOperands {$0 - $1}
        case "×":
            operateWithTwoOperands {$0 * $1}
        case "÷":
            operateWithTwoOperands {$0 / $1}
        default:
            break
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInut = 0
        displayResultLabel.text = "0"
        typingNumber = false
        dotIsPlacced = false
        operationSign = ""
    }
    
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        currentInut = -currentInut
    }
    
    @IBAction func percentageButtonPressed(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInut = currentInut / 100
        } else {
            secondOperand = firstOperand * currentInut / 100
            typingNumber = false
        }
    }
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if typingNumber && !dotIsPlacced {
            displayResultLabel.text = displayResultLabel.text! + "."
            dotIsPlacced = true
        } else if !typingNumber && !dotIsPlacced {
            displayResultLabel.text = "0."
        }
    }
    
}
    
<<<<<<< HEAD
// test sourcetree
=======
// text comment
>>>>>>> 34c930bbdcdd8590536b4513ed6889cedde98f22

