import Foundation

class GameViewModel: ObservableObject {
    @Published var games: [Game] = []
    
    @Published var dummyData_games: [Game] = []
    @Published var dummyData_falsePredictions:[Game] = []
    let jsonData = """
           {
               "statusCode": 200,
               "body": [
                   {
                       "gameInfo": {
                           "id": "20240110NBA",
                           "date": "2024 Jan 10th",
                           "time": "19:00:00",
                           "teamInfo": {
                               "teamA": {
                                   "name": "BOS Celtics",
                                   "standing": "29-8, 1st Eastern",
                                   "img": "https://assets-sports.thescore.com/basketball/team/1/w72xh72_logo.png"
                               },
                               "teamB": {
                                   "name": "MIL Bucks",
                                   "standing": "25-12, 2nd Eastern",
                                   "img": "https://assets-sports.thescore.com/basketball/team/10/w72xh72_logo.png"
                               }
                           },
                           "gameResult": null,
                            "isPredicted": true
                       }
                   },
                   {
                       "gameInfo": {
                           "id": "20240120NBA",
                           "date": "2024 Jan 14th",
                           "time": "20:00:00",
                           "teamInfo": {
                               "teamA": {
                                   "name": "SA Spurs",
                                   "standing": "7-33, 15th Western",
                                   "img": "https://assets-sports.thescore.com/basketball/team/25/w72xh72_logo.png"
                               },
                               "teamB": {
                                   "name": "CHA Hornets",
                                   "standing": "8-30, 13 Eastern",
                                   "img": "https://assets-sports.thescore.com/basketball/team/12/w72xh72_logo.png"
                               }
                           },
                           "gameResult": null,
                            "isPredicted": true
                       }
                   },
                   {
                       "gameInfo": {
                           "id": "20240210NBA",
                           "date": "2024 Feb 10th",
                           "time": "17:00:00",
                           "teamInfo": {
                               "teamA": {
                                   "name": "ORL Magic",
                                   "standing": "30-25, 8st Eastern",
                                   "img": "https://assets-sports.thescore.com/basketball/team/14/w72xh72_logo.png"
                               },
                               "teamB": {
                                   "name": "CLE Cavaliers",
                                   "standing": "36-17, 2nd Eastern",
                                   "img": "https://assets-sports.thescore.com/basketball/team/7/w72xh72_logo.png"
                               }
                           },
                           "gameResult": null,
                            "isPredicted": false
                       }
                   }
               ]
           }
           """.data(using: .utf8)!
    
    func fetchGames() {
        
        // Parse JSON data into an array of Game objects
        do {
               let decoder = JSONDecoder()
               let gamesResponse = try decoder.decode(GamesResponse.self, from: jsonData)
               self.dummyData_games = gamesResponse.body
              
               dummyData_falsePredictions = dummyData_games.filter { !$0.gameInfo.isPredicted }
            
           } catch {
               print("Error decoding JSON: \(error)")
           }
    }

}
