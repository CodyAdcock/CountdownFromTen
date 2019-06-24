//
//  ViewController.swift
//  Lumatouch Challenge
//
//  Created by Cody on 6/24/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var countdownButton: UIButton!
    
    var seconds = 10
    var timer = Timer()
    var timerIsActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// IBAction reacts to the Begin/Cancel button on the main biew
    @IBAction func countdownButtonTapped(_ sender: Any) {
        timerIsActive = !timerIsActive
        updateButton()
        updateLabel()
    }
}

// MARK: - Helper Functions
extension ViewController{
    
    /// A function to update the Begin/Cancel Button depending on the timerIsActive Boolean
    func updateButton(){
        if timerIsActive{
            countdownButton.setTitle("Cancel", for: .normal)
        }else{
            countdownButton.setTitle("Begin", for: .normal)
        }
    }
    
    //A function to update the Countdown/Ready Label depending on the timerIsActive Boolean
    func updateLabel(){
        if !timerIsActive{
            //stop the timer and reset the count of seconds
            timer.invalidate()
            seconds = 10
            countdownLabel.text = "Ready"
        }else{
            countdownLabel.text = "\(seconds)"
            startCountdown()
        }
    }
    
    /// A timer that calls the update timer function every 1 second.
    func startCountdown(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    /// A function to decrement the seconds variable and update the countdown label every time the startCountdown timer fires. When seconds hits zero It will run the hitZero function
    @objc func updateTimer(){
        if seconds <= 0{
            hitZero()
        }else{
            seconds -= 1
            countdownLabel.text = "\(seconds)"
        }
    }
    
    /// A function designed to handle the countdown hitting Zero. Invalidates timer, sets timerIsActive to false, sets seconds back to 10, calls the updateLabel function, and calls the updateButton function
    func hitZero(){
        timer.invalidate()
        timerIsActive = false
        seconds = 10
        updateLabel()
        updateButton()
    }
}

