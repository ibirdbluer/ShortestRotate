//
//  ViewController.swift
//  ShortestRotate
//
//  Created by Gregory Qian on 2/20/16.
//  Copyright © 2016 Gregory Qian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var facePlayer: UILabel!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!


    
    // MARK: - Function
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
    
    // Mark: - Button Action
    let initArray = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    var resultArray = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    let finalArray = [9, 4, 7, 8, 5, 2, 3, 6, 1]
    var historySteps = [Int]()
    
    @IBAction func buttonClicked(sender: UIButton) {
        
        historySteps.append(sender.tag)
        
        switch sender.tag {
        case 0:
            resultArray = self.r1(resultArray)
            facePlayer.text?.appendContentsOf("r1 ")
        case 1:
            resultArray = self.r2(resultArray)
            facePlayer.text?.appendContentsOf("r2 ")
        case 2:
            resultArray = self.r3(resultArray)
            facePlayer.text?.appendContentsOf("r3 ")
        case 3:
            resultArray = self.r4(resultArray)
            facePlayer.text?.appendContentsOf("r4 ")
        case 4:
            resultArray = self.R1(resultArray)
            facePlayer.text?.appendContentsOf("R1 ")
        case 5:
            resultArray = self.R2(resultArray)
            facePlayer.text?.appendContentsOf("R2 ")
        case 6:
            resultArray = self.R3(resultArray)
            facePlayer.text?.appendContentsOf("R3 ")
        case 7:
            resultArray = self.R4(resultArray)
            facePlayer.text?.appendContentsOf("R4 ")
        default:
            return
        }
        
        self.reflashView()
    }
    
    @IBAction func reset(sender: UIButton) {
        facePlayer.text = ""
        resultArray = initArray
        self.reflashView()
    }
    
    @IBAction func back(sender: UIButton) {
        var step = 0
        if let i = historySteps.last {
            step = i
        }else {
            return
        }
        
        switch step {
        case 0:
            resultArray = self.R1(resultArray)
        case 1:
            resultArray = self.R2(resultArray)
        case 2:
            resultArray = self.R3(resultArray)
        case 3:
            resultArray = self.R4(resultArray)
        case 4:
            resultArray = self.r1(resultArray)
        case 5:
            resultArray = self.r2(resultArray)
        case 6:
            resultArray = self.r3(resultArray)
        case 7:
            resultArray = self.r4(resultArray)
        default:
            return
        }
        historySteps.removeLast()
        facePlayer.text = facePlayer.text?.substringToIndex(facePlayer.text!.endIndex.advancedBy(-3))
        self.reflashView()
    }
    
    // Mark: - helper
    var labelArray = [UILabel]()
    func reflashView() {
        for i in 0...8 {
            labelArray[i].text = String(resultArray[i])
        }
    }
    
    
    // Mark: - life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labelArray = [label1, label2, label3, label4, label5, label6, label7, label8, label9]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

