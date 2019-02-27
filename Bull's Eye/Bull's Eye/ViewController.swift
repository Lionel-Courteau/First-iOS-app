//
//  ViewController.swift
//  Lionel's "Hello World!"
//
//  Created by Lionel Courteau on 2/3/19.
//  Copyright © 2019 Lionel Courteau. All rights reserved.
//
// 1) This app works perfectly, just a few cautionary notes
// 2) I could only deploy it on an iphone simulation
// 3) The basic approach was to watch the videos and then try to implement the necessary code.
// 4) Besides the project requirements, I've added my own title messages.
// 5) I've learned how set up a system for making gaming rounds, and how to add bonus point.
//   Also it's getting easier to assign functions to variables.
// 6) I have not consulted with any foreign source other than the project videos.
// 7) This was by far the step that was the most fun.

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBAction func ShowHitMeAlert() {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        score += points
        
        let title: String
        if difference == 0 {
            title = "Right on the dot!"
            points += 100
        } else if difference < 5 {
            title = "Almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
            score += points
        } else {
            title = "Not even close"
            score += points
        }
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewGame()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    
    
    

}

