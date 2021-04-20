//
//  FuncTutorial.swift
//  Game
//
//  Created by Анастасия on 13.04.2021.
//

import Foundation
class Math {
    
    var age: Int = 18
        var name: String = ""
         
        func move(){
             
            print("\(name) передвигается")
        }
    
    func myCicleArea (r: Double) -> Double {
       let pi = 3.14
    let area = pi * (r*r)
    return area
    }

    func myRectangleArea (a: Int, b:Int) -> Int {
        let area = a * b
        return area
    }
    func myTriangleArea (a: Int, h:Int) -> Int {
        let area = a * (h * h)
        return area
    }


    func numberSymbols (_ string:String) -> Int {
        return string.count
    }


}




