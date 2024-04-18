import Foundation

// Define models for the game data

struct GameResponseClone: Decodable {
    let get: String
    let parameters: ParametersClone
    let errors: [String]
    let results: Int
    let response: [GameClone]
    
    private enum CodingKeys: String, CodingKey {
        case get, parameters, errors, results, response
    }
}

struct ParametersClone: Decodable {
    let date: String
    
    private enum CodingKeys: String, CodingKey {
        case date
    }
}

struct GameClone: Decodable {
    let id: Int
    let league: String
    let season: Int
    let date: DateInfoClone
    let stage: Int
    let status: StatusClone
    let periods: PeriodsClone
    let arena: ArenaClone
    let teams: TeamsClone
    let scores: ScoresClone
    let officials: [String]?
    let timesTied: Int?
    let leadChanges: Int?
    let nugget: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, league, season, date, stage, status, periods, arena, teams, scores, officials, timesTied, leadChanges, nugget
    }
}

struct DateInfoClone: Decodable {
    let start: String
    let end: String?
    let duration: String?
    
    private enum CodingKeys: String, CodingKey {
        case start, end, duration
    }
}

struct StatusClone: Decodable {
    let clock: String?
    let halftime: Bool
    let short: Int
    let long: String
    
    private enum CodingKeys: String, CodingKey {
        case clock, halftime, short, long
    }
}

struct PeriodsClone: Decodable {
    let current: Int
    let total: Int
    let endOfPeriod: Bool
    
    private enum CodingKeys: String, CodingKey {
        case current, total, endOfPeriod
    }
}

struct ArenaClone: Decodable {
    let name: String
    let city: String
    let state: String
    let country: String?
    
    private enum CodingKeys: String, CodingKey {
        case name, city, state, country
    }
}

struct TeamsClone: Decodable {
    let visitors: TeamClone
    let home: TeamClone
    
    private enum CodingKeys: String, CodingKey {
        case visitors, home
    }
}

struct TeamClone: Decodable {
    let id: Int
    let name: String
    let nickname: String
    let code: String
    let logo: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name, nickname, code, logo
    }
}

struct ScoresClone: Decodable {
    let visitors: TeamScoreClone
    let home: TeamScoreClone
    
    private enum CodingKeys: String, CodingKey {
        case visitors, home
    }
}

struct TeamScoreClone: Decodable {
    let win: Int
    let loss: Int
    let series: SeriesClone
    let linescore: [String]
    let points: Int
    
    private enum CodingKeys: String, CodingKey {
        case win, loss, series, linescore, points
    }
}

struct SeriesClone: Decodable {
    let win: Int
    let loss: Int
    
    private enum CodingKeys: String, CodingKey {
        case win, loss
    }
}
