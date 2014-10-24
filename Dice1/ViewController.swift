//
//  ViewController.swift
//  Dice1
//
//  Created by Cory Vogan on 10/23/14.
//  Copyright (c) 2014 Cory Vogan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var userFaces : UInt32 = 4
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            userFaces = 4
        case 1:
            userFaces = 6
        case 2:
            userFaces = 8
        case 3:
            userFaces = 10
        case 4:
            userFaces = 12
        case 5:
            userFaces = 20
        case 6:
            userFaces = 100
        default:
            break;
        }
    }
    

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var numDice: UILabel!
    @IBOutlet weak var seperateRolls: UILabel!
    @IBAction func stepperValueChange(sender: UIStepper) {
        numDice.text = Int(sender.value).description
    }

    
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var rollResultDisplay: UILabel!
    @IBAction func rollAction(sender: UIButton) {
        struct Die {
            let faces : UInt32
            func roll() -> UInt32 {
                return(arc4random_uniform(faces) + 1)
            }
        }
        let die = Die(faces: UInt32(userFaces))
        var rollResults : [UInt32] = []

        while (rollResults.count) < numDice.text?.toInt() {
            func dieRoll(UInt32) -> UInt32 {
                return die.roll()
            }
            rollResults.append(dieRoll(userFaces))
        }
        rollResultDisplay.text = Int(rollResults.reduce(0,+)).description
        seperateRolls.text = rollResults.description
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

