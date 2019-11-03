//
//  TimerViewController.swift
//  coffeefix
//
//  Created by Kasey Schlaudt on 7/15/19.
//  Copyright © 2019 Kasey Schlaudt. All rights reserved.
//

import UIKit

enum TimerType : Int {
    case starting
    case bloom
    case pour
    case wait
    case done
}

class TimerViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var gramsLabel: UILabel!
    @IBOutlet weak var timer: CoffeeTimer!

    var cups = 0
    var water = 0
    var coffee = 0
    var bloom = 0
    var intervalCount = 1
    var currentInterval = 0
    private var intervals = [(TimerType, Int)]()
    
    //take the total coffee size and divide that by 70-90 and that is one interval
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer.delegate = self

        gramsLabel.text = String(water) + " GRAMS" // todo: maybe change this when the timer changes
        setTimer(time: 3, type: .starting)
        
        intervalCount = (v60IntervalCount != 0) ? v60IntervalCount : water / v60IntervalTime
        
        for i in 0..<intervalCount {
            if (i == 0) {
                addInterval(time: v60BloomTime, type: .bloom)
                addInterval(time: v60BloomWaitTime, type: .wait)
            } else {
                addInterval(time: v60IntervalTime, type: .pour)
                addInterval(time: v60IntervalWaitTime, type: .wait)
            }
        }
    }
    
    func addInterval(time: Int, type: TimerType) {
        intervals.append((type, time))
    }
    
    func setTimer(time: Int, type: TimerType) {
        switch type {
        case .starting:
            setTimerLbl(title: "STARTING", color: COLOR_GREY)
            timer.lineColor = .white
            timer.trailLineColor = COLOR_GREY
        case .bloom:
            setTimerLbl(title: "BLOOM", color: COLOR_BLUE)
            timer.lineColor = COLOR_BLUE
            timer.trailLineColor = .white
        case .wait:
            setTimerLbl(title: "WAIT")
            timer.lineColor = .white
            timer.trailLineColor = COLOR_GREY
        case .pour:
            setTimerLbl(title: "POUR", color: COLOR_BLUE)
            timer.lineColor = COLOR_BLUE
            timer.trailLineColor = .white
        default:
            setTimerLbl(title: "DONE")
            timer.isHidden = true
        }
        timer.start(beginingValue: time)
    }
    
    func setTimerLbl(title: String, color: UIColor = COLOR_GREY) {
        timerLabel.text = title
        timerLabel.textColor = .white
    }
}

extension TimerViewController: CoffeeTimerDelegate {
    func timerDidEnd() {
        guard intervals.count > currentInterval else {
            setTimer(time: 0, type: .done)
            return
        }
        let interval = intervals[currentInterval]
        setTimer(time: interval.1, type: interval.0)
        currentInterval += 1
    }
}
