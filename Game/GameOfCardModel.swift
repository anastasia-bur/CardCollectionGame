//
//  GameOfCardModel.swift
//  Game
//
//  Created by Анастасия on 13.04.2021.
//

import Foundation

enum cardState {
    case clouse
    case open
    case dropped
}

struct GameOfCardModel {
    var smile : String = "🦜"
    var state : cardState = .clouse
}












