//
//  Brain.swift
//  ShortestRotate
//
//  Created by Gregory Qian on 2/21/16.
//  Copyright © 2016 Gregory Qian. All rights reserved.
//

import Foundation

class Brain {
    
    func r1(var array: [Int]) -> [Int]{
        let tmp = array[0]
        array[0] = array[3]
        array[3] = array[4]
        array[4] = array[1]
        array[1] = tmp
        return array
    }
    func r2(var array: [Int]) -> [Int] {
        let tmp = array[1]
        array[1] = array[4]
        array[4] = array[5]
        array[5] = array[2]
        array[2] = tmp
        return array
    }
    func r3(var array: [Int]) -> [Int] {
        let tmp = array[3]
        array[3] = array[6]
        array[6] = array[7]
        array[7] = array[4]
        array[4] = tmp
        return array
    }
    func r4(var array: [Int]) -> [Int] {
        let tmp = array[4]
        array[4] = array[7]
        array[7] = array[8]
        array[8] = array[5]
        array[5] = tmp
        return array
    }
    
    func R1(var array: [Int]) -> [Int] {
        let tmp = array[0]
        array[0] = array[1]
        array[1] = array[4]
        array[4] = array[3]
        array[3] = tmp
        return array
    }
    func R2(var array: [Int]) -> [Int] {
        let tmp = array[1]
        array[1] = array[2]
        array[2] = array[5]
        array[5] = array[4]
        array[4] = tmp
        return array
    }
    func R3(var array: [Int]) -> [Int] {
        let tmp = array[3]
        array[3] = array[4]
        array[4] = array[7]
        array[7] = array[6]
        array[6] = tmp
        return array
    }
    func R4(var array: [Int]) -> [Int] {
        let tmp = array[4]
        array[4] = array[5]
        array[5] = array[8]
        array[8] = array[7]
        array[7] = tmp
        return array
    }
}
