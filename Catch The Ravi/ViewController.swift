//
//  ViewController.swift
//  Catch The Ravi
//
//  Created by Hardik Wason on 14/06/17.
//  Copyright © 2017 Hardik Wason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var score = 0
    var counter = 0
    var timer = Timer()
    var kennyarray = [UIImageView]()
    var hidetimer = Timer()
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    @IBOutlet weak var countlbl: UILabel!
    @IBOutlet weak var scorelbl: UILabel!
    @IBOutlet weak var highlbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Setting HighScores
        let highscore = UserDefaults.standard.object(forKey: "high")
        if highscore == nil
        {
            highlbl.text! = "0"
        }
        if let newscore = highscore as? Int
        {
            highlbl.text = String(newscore)
        }
        
        
        
        
        scorelbl.text = "Score: \(score)"
        
        // Gestures
         let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increasescore))
         let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increasescore))
         let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increasescore))
         let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increasescore))
         let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increasescore))
         let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increasescore))
         let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increasescore))
         let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increasescore))
         let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increasescore))
        
           kenny1.addGestureRecognizer(recognizer1)
           kenny2.addGestureRecognizer(recognizer2)
           kenny3.addGestureRecognizer(recognizer3)
           kenny4.addGestureRecognizer(recognizer4)
           kenny5.addGestureRecognizer(recognizer5)
           kenny6.addGestureRecognizer(recognizer6)
           kenny7.addGestureRecognizer(recognizer7)
           kenny8.addGestureRecognizer(recognizer8)
           kenny9.addGestureRecognizer(recognizer9)
        
        kenny1.isUserInteractionEnabled = true
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        
        
        
        // Timers
        counter = 30
        countlbl.text! = "\(counter)"
        timer  = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countimer), userInfo: nil, repeats: true)
        hidetimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hidekenny), userInfo: nil, repeats: true)
        
        
        // Kenny Array
         kennyarray.append(kenny1)
         kennyarray.append(kenny2)
         kennyarray.append(kenny3)
         kennyarray.append(kenny4)
         kennyarray.append(kenny5)
         kennyarray.append(kenny6)
         kennyarray.append(kenny7)
         kennyarray.append(kenny8)
         kennyarray.append(kenny9)
        
        hidekenny()
        
        
        
    }
    
    
   
    
    func increasescore(){
        score += 1
        scorelbl.text = "Score: \(score)"
        
    }
    
   
    
    
    //CountDowns
    func countimer()
    {
        counter -= 1
        countlbl.text = "\(counter)"
        if counter == 0
        {
            timer.invalidate()
            hidetimer.invalidate()
            
            
            
            // highscore
            if self.score > Int(highlbl.text!)!
            {
                UserDefaults.standard.set(self.score, forKey: "high")
                highlbl.text = String(self.score)
            }
    
           
            
            
            
            
            // alert creation
            let alert = UIAlertController(title: "Game Over", message: "Time's Up!!", preferredStyle: UIAlertControllerStyle.alert)
            let replay = UIAlertAction(title: "Replay", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                self.score = 0
                self.scorelbl.text = "Score: \(self.score)"
                self.counter = 30
                self.countlbl.text = "\(self.counter)"
                self.timer  = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countimer), userInfo: nil, repeats: true)
                self.hidetimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hidekenny), userInfo: nil, repeats: true)
            })
            alert.addAction(replay)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    
    
    

    func hidekenny()
    {
        for kenny in kennyarray{
            kenny.isHidden = true
        }
        let randomnumber = Int(arc4random_uniform(UInt32(kennyarray.count-1)))
        kennyarray[randomnumber].isHidden = false
    }
    
    
    
    
    
    
}

