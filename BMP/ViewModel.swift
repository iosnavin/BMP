//
//  ViewModel.swift
//  BMP
//
//  Created by Naveen Reddy on 24/11/21.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var pushToDetail = false
    @Published var person = Person()
    
    enum Actions {
        case increase
        case decrease
    }
    
    func performAge(action: Actions) {
        switch action{
        case .increase:
            person.age += 1
        case .decrease:
            person.age -= 1
        }
    }
    
    func performWeight(action: Actions) {
        switch action{
        case .increase:
            person.weight += 1
        case .decrease:
            person.weight -= 1
        }
    }
    
    
    
    struct Person {
        var height: Double = 166
        var weight = 64
        var age = 21
        
        var bmi: Int {
            let meterSquare = (height / 100) * 2
            return (weight / Int(meterSquare))
        }
        
        func getAdultsBMI(bmiValue: Int) -> String {
            switch bmiValue {
            case ..<16:
                return "Sever Thinness"
            case 16...17:
                return "Moderate Thinnes"
            case 18...19:
                return "Mild Thinness"
            case 20...25:
                return "Normal"
            case 26...30:
                return "Overweight"
            case 31...35:
                return "Obese ClassI"
            case 36...40:
                return "Obese ClassII"
            default:
                return "Obese ClassIII"
            }
        }
        
        func getBMIResult(bmiResult: Int) -> String {
            switch bmiResult {
            case ..<16:
                return "Underweight"
            case 17...18:
                return "Underweight"
            case 19...25:
                return "Normal"
            case 26...30:
                return "Overweight"
            case 31...35:
                return "Obesity"
            default:
                return "Obesity"
            }
        }
    }
}
