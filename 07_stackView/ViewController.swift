//
//  ViewController.swift
//  07_stackView
//
//  Created by User on 4/26/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    //declared each button on view
    
    var buttonsArray : Array<UIButton>?
    //array of buttons to be used for enabling.disabling all later
   
    
    @IBOutlet weak var lblWinner: UILabel!
    
    var game = TicTcToe(name1: "Sam", name2: "Bob") //initialize game
    var turn = 1
    var flex : Int = 0 //detremines who goes first in flexFix methd
    
    
    @IBAction func btn1(sender: UIButton) {
        sender.enabled = false
        print(sender)
        
        
        turn += 1
        if(turn % 2 == flex) //turn and flex make sure that the turns alterate each time and after each winner
        {
            game.player1.score.append(sender.tag)
            sender.backgroundColor = UIColor.blueColor()
        }
        else
        {
            game.player2.score.append(sender.tag)
            sender.backgroundColor = UIColor.redColor()
        }
        
        if(game.checForWin(game.player1))
        {
            lblWinner.text = "Player 1 Wins"
            lblWinner.backgroundColor = UIColor.yellowColor()
            disableAll()
            flexFix()
        }
        else if(game.checForWin(game.player2))
        {
            lblWinner.text = "Player 2 Wins"
            lblWinner.backgroundColor = UIColor.yellowColor()
            disableAll()
            flexFix()
        }

    }
    
    func flexFix()
    {
        (flex == 0) ? (flex = 1) : (flex = 0)
    }
    
    func disableAll() //disbles all buttons, invoked once there is a winner
    {
        buttonsArray = [btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9]
        
        for button in buttonsArray! { button.enabled = false }
    }
    
    @IBAction func btnReset(sender: UIButton) {
        game = TicTcToe(name1: "Sam", name2: "Bob") //resets game object

        
        buttonsArray = [btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9]
        
        for button in buttonsArray! //resets color back to orginal
        {
            button.backgroundColor = UIColor.grayColor()
            button.enabled = true
        }
        turn = 1
        lblWinner.text = "Winner : "
        lblWinner.backgroundColor = UIColor.whiteColor()
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

