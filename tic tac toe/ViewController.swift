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
    
    func checkbottom(value: Int)-> (location:String,pattern:String){
        return ("bottom", checkfor(value: value, inList: [7,8,9]))
    }

    func checktop(value: Int)-> (location:String,pattern:String){
        return ("bottom", checkfor(value: value, inList: [1,2,3]))
    }
    
    func checkleft(value: Int)-> (location:String,pattern:String){
        return ("bottom", checkfor(value: value, inList: [1,4,7]))
    }
    
    func checkrigth(value: Int)-> (location:String,pattern:String){
        return ("bottom", checkfor(value: value, inList: [3,6,9]))
    }
    
    func checkmiddleacross(value: Int)-> (location:String,pattern:String){
        return ("bottom", checkfor(value: value, inList: [4,5,6]))
    }
    
    func checkmiddledown(value: Int)-> (location:String,pattern:String){
        return ("bottom", checkfor(value: value, inList: [2,5,8]))
    }
    
    func checkdiagleftright(value: Int)-> (location:String,pattern:String){
        return ("bottom", checkfor(value: value, inList: [1,5,9]))
    }
    
    func checkdiagrightleft(value: Int)-> (location:String,pattern:String){
        return ("bottom", checkfor(value: value, inList: [3,5,7]))
    }
    
    func checkfor(value:Int, inList:[Int])-> String{
        var conclusion = ""
        for cell in inList{
            if plays[cell] == value{
                conclusion += "1"
            }
            else{
                conclusion += "0"
            }
        }
        return conclusion
        
        
        
        
    }
    
    func rowcheck(value:Int) -> (location:String,pattern:String){
        var acceptabelfinds = ["110", "101", "011"]
        var findfuncs = [checktop, checkbottom, checkleft, checkrigth, checkmiddleacross, checkmiddledown, checkdiagleftright, checkdiagrightleft]
        
        for algorithm in findfuncs{
            var algorithmresults = algorithm(value)
            if find(acceptabelfinds,algorithmresults.pattern){
                return algorithmresults
            }
        }
    }
    
    func occupied(spot:Int)->Bool{
        return Bool((plays[spot] != nil))
    }

    func aiturn(){
        if done{
            return
        }
        
        aiDeciding = true
        let result = rowcheck(value:0)

            var wheretoplayresult = wheretoplay(location: result.location, pattern:result.pattern)
            if !occupied(spot: wheretoplayresult)
            {
                aiDeciding = false
                checkwin()
                return
            }
        
        let result2 = rowcheck(value:1)

            var wheretoplayresult2 = wheretoplay(location: result2.location, pattern:result2.pattern)
            if !occupied(spot: wheretoplayresult2)
            {
                aiDeciding = false
                checkwin()
                return
            }
        
        if !occupied(spot: 5)
        {
            setimage(spot: 5, player: 0)
            aiDeciding = false
            checkwin()
            return
        }
        
        
        
        let corneravailable = firstavailable(iscorner: true)
        if corneravailable{
            setimage(spot: <#T##Int#>, player: <#T##Int#>)
        }
        
    }
    
    func wheretoplay(location:String, pattern:String)-> Int{
        
        var leftp = "011"
        var rightp = "110"
        var midp = "101"
        
        switch location{
        case "top":
            if pattern == leftp{
                return 1
            }
            else if pattern == rightp{
                return 3
            }
            else {
                return 2
            }
        case "bottom":
            if pattern == leftp{
                return 7
            }
            else if pattern == rightp{
                return 9
            }
            else {
                return 8
            }
        case "left":
            if pattern == leftp{
                return 1
            }
            else if pattern == rightp{
                return 7
            }
            else {
                return 4
            }

        case "right":
            if pattern == leftp{
                return 3
            }
            else if pattern == rightp{
                return 9
            }
            else {
                return 6
            }

        case "midvert":
            if pattern == leftp{
                return 2
            }
            else if pattern == rightp{
                return 8
            }
            else {
                return 5
            }

        case "midacross":
            if pattern == leftp{
                return 4
            }
            else if pattern == rightp{
                return 6
            }
            else {
                return 5
            }
        case "diagleftright":
            if pattern == leftp{
                return 1
            }
            else if pattern == rightp{
                return 9
            }
            else {
                return 5
            }
        case "diagrightleft":
            if pattern == leftp{
                return 3
            }
            else if pattern == rightp{
                return 7
            }
            else {
                return 5
            }
        default: return 4

        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

