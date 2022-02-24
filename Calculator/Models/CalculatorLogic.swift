//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Hayley Robinson on 2/23/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, operation: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(calcMethod: String) -> Double? {
        
        if let n = number {
            switch calcMethod{
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, operation: calcMethod)
            }
        }
        return nil
    }
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
            let operation = intermediateCalculation?.operation {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷" :
                return n1 / n2
            default:
                    fatalError("Operation passed in does not match cany cases")
            }
        }
        return nil
    }
}
