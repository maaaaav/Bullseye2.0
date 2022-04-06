//
//  MainBoardViewController.swift
//  Bullseye
//
//  Created by ASDiMac2 on 3/18/22.
//

import UIKit

class MainBoardViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    var  guessingNumber : Int = Int.random(in: 1...100)
    
    //number tne player shuold guess
    
    var score : Int = 0
    //Score calculated by the player
    
    var gameround: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let normalThumbImage = UIImage(named:
        "SliderThumb-Normal")
        let highlightedThumbImage = UIImage(named:"SliderThumb-Highlighted")
        
        slider.setThumbImage(normalThumbImage, for: .normal)
        slider.setThumbImage(highlightedThumbImage, for: .highlighted)
          
        setUp()
        
        //Setting up the game
        
        //1.Set the slider value up tp 50
        slider.value = 50
        //2.Give a number to guess
        taskLabel.text = "Попробуйте угадать число: " + String( guessingNumber )
        //3.Zerofy the scores
        scoreLabel.text = " Очки:" + String(score)
    }
    
    @IBAction func didThumbSelectButton(_ sender: Any) {
        
        // 1. Забрать число у слайдера
        let sliderValue: Float = slider.value
        
        //2. Перевести это число в Int(sliderValueInt), чтобы можно было сравнить два  целых числа
        let sliderValueInt: Int  = Int(slider.value)
        
        //3.Сравнить два числа, и если они совпадают, то начислить 1 очко игроку, иначе ничего не делать
        let isValuesEquals = sliderValueInt == guessingNumber
        if isValuesEquals {
            //-Добавить 1 очко
            score += 1
            //- обнавить значение текста для лейбела с очками
            scoreLabel.text = " Очки:" + String(score)
            print ("You guess the number")
        }else {
        
            print("You choose number\(sliderValueInt)")
        }
        gameround +=  1
        round.text = "Раунд" + String(gameround)
        updateGuessingNumber()
        if gameround == 11{
            setUp()
               
        }
        gameround += 1
        round.text = "Раунд " + String(gameround)
        updateGuessingNumber()
    }
    @IBAction func didTapTryAgainButton(_ sender: Any) {
        print("Try Again")
        setUp()
    }
    func setUp() {
        //1.Set the slider value up tp 50
        slider.value = 50
        
        //2.Give a number to guess
        updateGuessingNumber()
        
        //3.Zerofy the scores
        score = 0
        scoreLabel.text = " Очки:" + String(score)
        
        gameround = 1
        round.text = "Раунд " + String(gameround)
    }
    func updateGuessingNumber(){
        guessingNumber = Int.random(in:1...100)
        taskLabel.text = "Попробуйте угадать число: " + String( guessingNumber )
    }
}
