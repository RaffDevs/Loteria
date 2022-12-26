//
//  ViewController.swift
//  Loteria
//
//  Created by Rafael Veronez Dias on 26/12/22.
//

import UIKit

enum GameType: String {
    case megasena = "Mega-Sena"
    case quina = "Quina"
}



class ViewController: UIViewController {

    @IBOutlet weak var gameTypeLabel: UILabel!
    
    @IBOutlet weak var gameTypeSegmentControl: UISegmentedControl!
    
    @IBOutlet var balls: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumbers(for: .megasena)
    }

    @IBAction func generateGame() {
        switch gameTypeSegmentControl.selectedSegmentIndex {
        case 0:
            showNumbers(for: .megasena)
        default:
            showNumbers(for: .quina)
        }
    }
    
    func showNumbers(for type: GameType) {
        gameTypeLabel.text = type.rawValue
        
        var game: [Int] = []
        switch type {
            case .megasena:
                game = factoryNumbers(total: 6, universe: 60)
                balls.last?.isHidden = false
            case .quina:
                game = factoryNumbers(total: 5, universe: 80)
                balls.last?.isHidden = true
        }
        
        for (index, game) in game.enumerated() {
            balls[index].setTitle("\(game)", for: .normal)
        }
        
    }
    
    func factoryNumbers(total: Int, universe: Int) -> [Int] {
        var result: [Int] = []
        
        while result.count < total {
            let randomNumber = Int.random(in: 0...universe)
            
            if !result.contains(randomNumber) {
                result.append(randomNumber)
            }
        }
        
        return result.sorted()
    }
    
    
}

