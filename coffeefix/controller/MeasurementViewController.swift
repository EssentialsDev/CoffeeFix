//
//  MeasurementViewController.swift
//  coffeefix
//
//  Created by Kasey Schlaudt on 11/3/19.
//  Copyright © 2019 Kasey Schlaudt. All rights reserved.
//

import UIKit

class MeasurementViewController: UIViewController {
    
    @IBOutlet weak var ratioTextField: UITextField!
    @IBOutlet weak var bloomTimeTextField: UITextField!
    @IBOutlet weak var bloomWaitTimeTextField: UITextField!
    @IBOutlet weak var poursAfterBloomTextField: UITextField!
    @IBOutlet weak var pourTimeTextField: UITextField!
    @IBOutlet weak var pourWaitTimeTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        ratioTextField.text = "\(v60AspectRatio)"
        bloomTimeTextField.text = "\(v60BloomTime)"
        bloomWaitTimeTextField.text = "\(v60BloomWaitTime)"
        poursAfterBloomTextField.text = "\(v60IntervalCount)"
        pourTimeTextField.text = "\(v60IntervalTime)"
        pourWaitTimeTextField.text = "\(v60IntervalWaitTime)"
    }
    
    @IBAction func onSave(_ sender: Any) {
        if let aspectRatio = ratioTextField.text {
            v60AspectRatio = Int(aspectRatio) ?? v60AspectRatio
        }
        if let bloomTime = bloomTimeTextField.text {
            v60BloomTime = Int(bloomTime) ?? v60BloomTime
        }
        if let bloomWaitTime = bloomWaitTimeTextField.text {
            v60BloomWaitTime = Int(bloomWaitTime) ?? v60BloomWaitTime
        }
        if let intervals = poursAfterBloomTextField.text {
            v60IntervalCount = Int(intervals) ?? v60IntervalCount
        }
        if let intervalTime = pourTimeTextField.text {
            v60IntervalTime = Int(intervalTime) ?? v60IntervalTime
        }
        if let intervalWaitTime = pourWaitTimeTextField.text {
            v60IntervalWaitTime = Int(intervalWaitTime) ?? v60IntervalWaitTime
        }
        dismiss(animated: true, completion: nil)
    }
}
