//: Playground - noun: a place where people can play

import UIKit





func findingPair() -> Bool {
   
    var array1 = [1,2,3,9]
    var array2 = [1,2,4,4]
    let sum = 8
    var setOfNumbers: Set<Int> =[]

    
    
    
    for element in array1 {
        if array1.first! + array1.last! > sum {
            array1.remove(at: array1.last!)
        } else if array1.first! + array1.last! < sum {
            array1.remove(at: array1.first!)
        } else if array1.first! + array1.last! == sum {
            return true
    }
    }
    
    for index in array1 {
        var complementNumber: Int = sum - array1[index]
        setOfNumbers.insert(complementNumber)
        if setOfNumbers.contains(array1[index]) {
            return true
        }
    }
    return false
}




