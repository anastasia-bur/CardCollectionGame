//
//  ViewController.swift
//  Game
//
//  Created by Анастасия on 03.04.2021.
//

import UIKit

class ViewController: UIViewController, MyFirstProtocol {
    
    @IBOutlet weak var settingBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cards:[GameOfCardModel] = []
    var selectedCardIndex: IndexPath? = nil
    var menuVC: SettingViewController!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        cards = randomCardModels(level: "medium")
        menuVC = self.storyboard?.instantiateViewController(identifier: "MenuVC") as! SettingViewController
        menuVC.delegate = self
    }

    @IBAction func settingBarButtonItem(_ sender: UIBarButtonItem) {
          if AppDelegate.isMenuVC {
            showMenu()
        } else {
            hideMenu()
        }
    }
    func showMenu() {
        UIView.animate(withDuration: 0.3) {
            self.menuVC.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.addChild(self.menuVC)
            self.view.addSubview(self.menuVC.view)
            AppDelegate.isMenuVC = false
        }
    }
    func hideMenu() {
        UIView.animate(withDuration: 0.3, animations: {
            self.menuVC.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }) { (finished) in
            self.menuVC.view.removeFromSuperview()
            AppDelegate.isMenuVC = true
        }
    }
    func setupCollectionView() {
    }
    func lightLevel() {
        cards = randomCardModels(level: "Light")
        collectionView.reloadData()
        hideMenu()
   }
    func mediumLevel() {
        cards = randomCardModels(level: "Medium")
        collectionView.reloadData()
        hideMenu()
   }
    func hightLevel() {
        cards = randomCardModels(level: "Hight")
        collectionView.reloadData()
        hideMenu()
    }
}
//MARK:-
//MARK: UICollectionView Delegate, DataSource Methods
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellOfCard", for: indexPath) as! GameOfCardsCell
        cell.cellCard.text = cards[indexPath.row].smile
        if cards[indexPath.row].state == .clouse {
            cell.backgroundColor = UIColor.white
        } else {
            cell.backgroundColor = UIColor.white
        }
        if cards[indexPath.row].state == .dropped {
            cell.backgroundColor = UIColor.white
            cell.cellCard.text = nil
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedCardIndex == nil {
            selectedCardIndex = indexPath
        } else {
            if selectedCardIndex == indexPath {
            } else {
                let selectedFirstCard = cards[selectedCardIndex!.row].smile
                let selectedSecondCard = cards[indexPath.row].smile
                if selectedFirstCard == selectedSecondCard {
                    cards[selectedCardIndex!.row].state = .dropped
                        cards[indexPath.row].state = .dropped
                        collectionView.reloadData()
                }else{
                }
                        selectedCardIndex = nil
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return CGSize(width: Int(screenWidth)/3-30, height: 100)
    }
    func randomCardModels(level:String) -> [GameOfCardModel] {
        var newCards: [GameOfCardModel] = []
        if level == "light" {
           let numberdOfPare = 6
        for i in 0..<numberdOfPare {
            let smile:String = randomEmoji()
            let firstCardModel = GameOfCardModel(smile: smile, state: .clouse)
            let secondCardModel = GameOfCardModel(smile: smile, state: .clouse)
                newCards.append(firstCardModel)
                newCards.append(secondCardModel)
            }
        }
        if level == "medium" {
            let numberOfPare = 12
        for i in 0..<numberOfPare {
            let smile:String = randomEmoji()
            let firstCardModel = GameOfCardModel(smile: smile, state: .clouse)
            let secondCardModel = GameOfCardModel(smile: smile, state: .clouse)
                newCards.append(firstCardModel)
                newCards.append(secondCardModel)
            }
        }
        if level == "hight" {
            let numberOfPare = 20
        for i in 0..<numberOfPare {
            let smile:String = randomEmoji()
            let firstCardModel = GameOfCardModel(smile: smile, state: .clouse)
            let secondCardModel = GameOfCardModel(smile: smile, state: .clouse)
                newCards.append(firstCardModel)
                newCards.append(secondCardModel)
            }
        }
        return newCards
    }
    func randomEmoji() -> String {
        let range = 0x1F300...0x1F3F0
        let index = Int(arc4random_uniform(UInt32(range.count)))
        let ord = range.lowerBound + index
        guard let scalar = UnicodeScalar(ord) else { return "❓" }
        return String(scalar)
    }
}
