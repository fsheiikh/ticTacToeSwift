//
//  game.swift
//  07_stackView
//
//  Created by User on 4/26/17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation

class TicTcToe
{
    var player1 : Player
    var player2 : Player
    let winningCombos : [[Int]] = [[1, 2, 3], [1, 5, 9], [1, 4, 7], [2, 5, 8], [3, 5, 7], [3, 6, 9], [4, 5, 6], [7, 8, 9]]
    
    
    init(name1: String, name2: String)
    {
        self.player1 = Player(name: name1)
        self.player2 = Player(name: name2)
    }
    
    
    func addScore(player: Player, int: Int)
    {
        player.score.append(int)
    }
    
    func checForWin(player: Player) -> Bool
    {
        
        for combo in winningCombos //checks each array in array of combos
        {
            var matches : Bool = true
            for number in combo //each element in that array
            {
                
                if(!(player.score.contains(number))) { matches = false } //if all 3 elements in one array are present in players score, match = true, winner declared
            }
            
            if(matches == true) { return true }
        }
        
        return false
    }

}