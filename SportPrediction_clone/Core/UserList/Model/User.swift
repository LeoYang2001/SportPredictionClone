import Foundation

struct User: Decodable {
    let NBAPoints: NBAPoints
    let UserID: UserID
    let Voted: HistoryGame
    let GameIDs_win: GameIDsWin
}

struct NBAPoints: Decodable {
    let N: String
}

struct UserID: Decodable {
    let S: String
}

enum HistoryGame: Decodable {
    case empty
    case nonEmpty([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        do {
            self = try .nonEmpty(container.decode([String].self))
        } catch DecodingError.typeMismatch {
            // If it's not an array, treat it as an empty array
            self = .empty
        }
    }
}

struct GameIDsWin: Decodable {
    let SS: [String]
}

struct UserListResponse: Decodable {
    let body: [User]
}

struct ProfileUser {
    let userName: String
    let userPoint: String
}
