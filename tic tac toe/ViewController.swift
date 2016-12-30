//
//  ViewController.swift
//  tic tac toe
//
//  Created by Mayank Daswani on 12/28/16.
//  Copyright © 2016 Mayank Daswani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tictacimg1: UIImageView!
    @IBOutlet var tictacimg2: UIImageView!
    @IBOutlet var tictacimg3: UIImageView!
    @IBOutlet var tictacimg4: UIImageView!
    @IBOutlet var tictacimg5: UIImageView!
    @IBOutlet var tictacimg6: UIImageView!
    @IBOutlet var tictacimg7: UIImageView!
    @IBOutlet var tictacimg8: UIImageView!
    @IBOutlet var tictacimg9: UIImageView!
    
    @IBOutlet var tictacbtn1: UIButton!
    @IBOutlet var tictacbtn2: UIButton!
    @IBOutlet var tictacbtn3: UIButton!
    @IBOutlet var tictacbtn4: UIButton!
    @IBOutlet var tictacbtn5: UIButton!
    @IBOutlet var tictacbtn6: UIButton!
    @IBOutlet var tictacbtn7: UIButton!
    @IBOutlet var tictacbtn8: UIButton!
    @IBOutlet var tictacbtn9: UIButton!
    
    @IBOutlet var resetbtn: UIButton!
    
    @IBOutlet var usermessage: UILabel!
    
    var plays = Dictionary<Int, Int>()
    var aiDeciding = false
    var done = false
    
    @IBAction func UIbtnclick(sender: UIButton)
    {
        //usermessage.isHidden = true
        if !(plays[sender.tag] != nil) && !aiDeciding && !done{
            setimage(spot: sender.tag, player:1)
        }
        checkwin()
        aiturn();
    }
    
    @IBAction func resetbtnclick(sender: UIButton){
        done = false
        reset()
    }
    
    func setimage(spot:Int, player:Int )
    {
        let playermark =  player == 1 ?    "x" : "o"
        plays[spot] = player
        switch spot{
        case 1:
            tictacimg1.image = UIImage(named: playermark)
        case 2:
            tictacimg2.image = UIImage(named: playermark)
        case 3:
            tictacimg3.image = UIImage(named: playermark)
        case 4:
            tictacimg4.image = UIImage(named: playermark)
        case 5:
            tictacimg5.image = UIImage(named: playermark)
        case 6:
            tictacimg6.image = UIImage(named: playermark)
        case 7:
            tictacimg7.image = UIImage(named: playermark)
        case 8:
            tictacimg8.image = UIImage(named: playermark)
        case 9:
            tictacimg9.image = UIImage(named: playermark)
        default:
            tictacimg5.image = UIImage(named: playermark)
        }
        
    }
    
    func checkwin(){
        let whowon = ["I": 0, "you" : 1]
        for(key,value) in whowon{
        if ((plays[7] == value && plays [8] == value && plays[9] == value) ||
            (plays[4] == value && plays [5] == value && plays[6] == value) ||
            (plays[1] == value && plays [2] == value && plays[3] == value) ||
            (plays[1] == value && plays [5] == value && plays[9] == value) ||
            (plays[3] == value && plays [5] == value && plays[7] == value) ||
            (plays[1] == value && plays [4] == value && plays[7] == value) ||
            (plays[2] == value && plays [5] == value && plays[8] == value) ||
            (plays[3] == value && plays [6] == value && plays[9] == value)){
            usermessage.text = "\(key) won!";
            done = true;
            }
        }
    }

    
    func reset(){
        plays = [:]
        usermessage.text = " "
        tictacimg1.image = nil
        tictacimg2.image = nil
        tictacimg3.image = nil
        tictacimg4.image = nil
        tictacimg5.image = nil
        tictacimg6.image = nil
        tictacimg7.image = nil
        tictacimg8.image = nil
        tictacimg9.image = nil
    }
    
//    func rowcheck(value:Int) -> (location:String,pattern:String){
//        var acceptabelfinds = ["110", "101", "011"]
//        var findfuncs = [checktop, checkbottom, chackleft, checkright, checkleftacross, chackrightacross, checkdiagleftright, checkdiagrightleft]
//        
//        for algorithm in findfuncs{
//            var algorithmresults = algorithm(value:value)
//            if find(acceptablefinds,algorithmresults.pattern)
//            {
//                
//            }
//        }
//        
//    
//    }
//
//    func aiturn(){
//        if done{
//            return
//        }
//        
//        aideciding = true
//        
//        if let result = rowcheck(value: 0){
//        }
//        
//    }
//    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

