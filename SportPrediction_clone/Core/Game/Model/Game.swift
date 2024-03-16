//
//  Game.swift
//  sports_prediction
//
//  Created by 杨嘉煌 on 2/17/24.
//

import Foundation


struct GameInfo: Codable {
    let id: String
    let date: String
    let time: String
    let teamInfo: TeamInformation
    let gameResult: String? // Change the type accordingly if gameResult is not a string
}

struct TeamInformation: Codable {
    let teamA: Team
    let teamB: Team
}

struct Team: Codable {
    let name: String
    let standing: String
    let img: String
}

struct GamesResponse: Codable {
    let statusCode: Int
    let body: [Game]
}

struct Game: Codable {
    let gameInfo: GameInfo
}
