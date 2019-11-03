//
//  ViewController.swift
//  coffeefix
//
//  Created by Kasey Schlaudt on 7/6/19.
//  Copyright © 2019 Kasey Schlaudt. All rights reserved.
//

import UIKit
import TextFieldEffects

class ViewController: UIViewController {
    
    @IBOutlet weak var waterField: UITextField!
    @IBOutlet weak var coffeeField: UITextField!
    
    var startY: CGFloat? = nil
    let measurementText = " CUPS"
    let gramsInCup = 226
    
    var water = 0
    var coffee = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        waterField.delegate = self
        coffeeField.delegate = self
        
        let textField = JiroTextField(frame: coffeeField.frame)
        textField.placeholderColor = .darkGray
        textField.placeholder = "hi"
        
        water = v60Water
        coffee = v60Coffee
        
        setupValues()
    
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(dismissKeyboard)))
    }
    
    //bloom should be double the coffee
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let keyboardHeight: CGFloat = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue.height
        
        if startY == nil {
            startY = self.view.frame.origin.y
        }
        if (startY == self.view.frame.origin.y) {
            UIView.animate(withDuration: 0.25, delay: 0.25, options: .curveEaseOut, animations: {
                self.view.frame = CGRect(x: 0, y: (self.startY! - keyboardHeight), width:    self.view.bounds.width, height: self.view.bounds.height)
            }, completion: nil)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if startY == nil {
            startY = self.view.frame.origin.y
        }
        if (startY != self.view.frame.origin.y) {
            UIView.animate(withDuration: 0.25, delay: 0.25, options: .curveEaseInOut, animations: {
                self.view.frame = CGRect(x: 0, y: self.startY!, width: self.view.bounds.width, height: self.view.bounds.height)
            }, completion: nil)
        }
    }
    
    @objc func dismissKeyboard() {
//        totalCupsField.resignFirstResponder()
        waterField.resignFirstResponder()
        coffeeField.resignFirstResponder()
    }
    
    func setupValues() {
        //TODO: this should get the last saved values
        if v60Water != 0 {
            waterField.text = "\(v60Water) grams"
        }
        if v60Coffee != 0 {
            coffeeField.text = "\(v60Coffee) grams"
        }
    }
    
    func setMeasurementData(id: Int = 0) {
        if id == 0 {
            guard let waterAmount = waterField.text, waterField.text != "" else {
                setupValues()
                return
            }
            water = Int(waterAmount) ?? 0
            coffee = water / v60AspectRatio
        } else {
            guard let coffeeAmount = coffeeField.text, coffeeField.text != "" else {
                setupValues()
                return
            }
            coffee = Int(coffeeAmount) ?? 0
            water = coffee * v60AspectRatio
        }
        
        v60Coffee = coffee
        v60Water = water
        setupValues()
    }
    
    @IBAction func startTimer(_ sender: Any) {
        setupValues()
        if (water <= 0 || coffee <= 0) { return }
        performSegue(withIdentifier: "to-timer", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "to-timer") {
            guard let destinationVC = segue.destination as? TimerViewController else {return}
            destinationVC.cups = 0
            destinationVC.water = water
            destinationVC.coffee = coffee
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        setMeasurementData(id: textField.tag)
    }
}

