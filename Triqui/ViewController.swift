//
//  ViewController.swift
//  Triqui
//
//  Created by pc on 6/27/16.
//  Copyright © 2016 Bizagi.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var xWinsLabel: UILabel!
    @IBOutlet weak var tiesLabel: UILabel!
    @IBOutlet weak var oWinsLabel: UILabel!
    
    
    enum TurnType: String{
        case O = "O"
        case X = "X"
    }
    
    var turn = TurnType.X
    
    let winArray = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3, 5, 7]]
    
    var xWins = 0
    var oWins = 0
    var ties = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func Play(sender: UIButton) {
        sender.setTitle(turn.rawValue, forState: UIControlState.Normal)
        turn = turn == .X ? .O : .X
        sender.enabled = false
        validatePlay()
    }
    
    func validatePlay(){
        for win in winArray{
            let firstButton = view.viewWithTag(win[0]) as? UIButton
            let secondButton = view.viewWithTag(win[1]) as? UIButton
            let thirdButton = view.viewWithTag(win[2]) as? UIButton
            if firstButton?.currentTitle != nil && firstButton?.currentTitle == secondButton?.currentTitle && secondButton?.currentTitle == thirdButton?.currentTitle{
                playerDidWin(TurnType.X.rawValue == firstButton?.titleLabel?.text! ? TurnType.X : TurnType.O)
                return
            }
        }
    }
    
    func playerDidWin(player: TurnType){
        if player == .X {
            xWins += 1
            xWinsLabel.text = String(xWins)
        }else{
            oWins += 1
            oWinsLabel.text = String(oWins)
        }
        newGame()
        print("The winner is: \(player.rawValue)")
    }
    
    func newGame(){
        for tag in 1...9{
            let button = view.viewWithTag(tag) as? UIButton
            button!.setTitle(nil, forState: UIControlState.Normal)
            button?.enabled = true
        }
    }
    
}

