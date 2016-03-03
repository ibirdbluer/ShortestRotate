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

    var brain = Brain()
    // MARK: - Function
    func r1(var array: [UILabel]){
        array[0].center = array[0].center
        array[3].center = array[3].center
        array[4].center = array[4].center
        array[1].center = array[1].center
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            let tmp = array[0].center
            array[0].center = array[3].center
            array[3].center = array[4].center
            array[4].center = array[1].center
            array[1].center = tmp
            }, completion: nil)
        
        resultArray = brain.r1(resultArray)

    }
    func r2(var array: [UILabel]) -> [UILabel] {
        let tmp = array[1]
        array[1] = array[4]
        array[4] = array[5]
        array[5] = array[2]
        array[2] = tmp
        return array
    }
    func r3(var array: [UILabel]) -> [UILabel] {
        let tmp = array[3]
        array[3] = array[6]
        array[6] = array[7]
        array[7] = array[4]
        array[4] = tmp
        return array
    }
    func r4(var array: [UILabel]) -> [UILabel] {
        let tmp = array[4]
        array[4] = array[7]
        array[7] = array[8]
        array[8] = array[5]
        array[5] = tmp
        return array
    }
    
    func R1(var array: [UILabel]) -> [UILabel] {
        let tmp = array[0]
        array[0] = array[1]
        array[1] = array[4]
        array[4] = array[3]
        array[3] = tmp
        return array
    }
    func R2(var array: [UILabel]) -> [UILabel] {
        let tmp = array[1]
        array[1] = array[2]
        array[2] = array[5]
        array[5] = array[4]
        array[4] = tmp
        return array
    }
    func R3(var array: [UILabel]) -> [UILabel] {
        let tmp = array[3]
        array[3] = array[4]
        array[4] = array[7]
        array[7] = array[6]
        array[6] = tmp
        return array
    }
    func R4(var array: [UILabel]) -> [UILabel] {
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
            self.r1(resultLabelArray)
//            resultArray = self.r1(resultLabelArray)
            facePlayer.text?.appendContentsOf("r1 ")
        case 1:
            resultLabelArray = self.r2(resultLabelArray)
//            resultArray = self.r2(resultArray)
            facePlayer.text?.appendContentsOf("r2 ")
        case 2:
            resultLabelArray = self.r3(resultLabelArray)
//            resultArray = self.r3(resultArray)
            facePlayer.text?.appendContentsOf("r3 ")
        case 3:
            resultLabelArray = self.r4(resultLabelArray)
//            resultArray = self.r4(resultArray)
            facePlayer.text?.appendContentsOf("r4 ")
        case 4:
            resultLabelArray = self.R1(resultLabelArray)
//            resultArray = self.R1(resultArray)
            facePlayer.text?.appendContentsOf("R1 ")
        case 5:
            resultLabelArray = self.R2(resultLabelArray)
//            resultArray = self.R2(resultArray)
            facePlayer.text?.appendContentsOf("R2 ")
        case 6:
            resultLabelArray = self.R3(resultLabelArray)
//            resultArray = self.R3(resultArray)
            facePlayer.text?.appendContentsOf("R3 ")
        case 7:
            resultLabelArray = self.R4(resultLabelArray)
//            resultArray = self.R4(resultArray)
            facePlayer.text?.appendContentsOf("R4 ")
        default:
            return
        }
        
        self.reflashView()
    }
    
    @IBAction func reset(sender: UIButton) {
        facePlayer.text = ""
        resultLabelArray = [label1, label2, label3, label4, label5, label6, label7, label8, label9]
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
            resultLabelArray = self.R1(resultLabelArray)
        case 1:
            resultLabelArray = self.R2(resultLabelArray)
        case 2:
            resultLabelArray = self.R3(resultLabelArray)
        case 3:
            resultLabelArray = self.R4(resultLabelArray)
        case 4:
            self.r1(resultLabelArray)
        case 5:
            resultLabelArray = self.r2(resultLabelArray)
        case 6:
            resultLabelArray = self.r3(resultLabelArray)
        case 7:
            resultLabelArray = self.r4(resultLabelArray)
        default:
            return
        }
        historySteps.removeLast()
        facePlayer.text = facePlayer.text?.substringToIndex(facePlayer.text!.endIndex.advancedBy(-3))
        self.reflashView()
    }
    
    // Mark: - helper
    var resultLabelArray = [UILabel]()
    func reflashView() {
        for i in 0...8 {
            resultLabelArray[i].text = String(resultArray[i])
        }
    }
    
    
    // Mark: - life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabelArray = [label1, label2, label3, label4, label5, label6, label7, label8, label9]
        for i in 0...8 {
            print("tag: \(resultLabelArray[i].tag) center: \(resultLabelArray[i].center)")
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

