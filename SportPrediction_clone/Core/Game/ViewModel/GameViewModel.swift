import Foundation

class GameViewModel: ObservableObject {
    @Published var games: [Game] = []
    
    func fetchGames() {
        
        guard let url = URL(string: "https://0pb03n9zj7.execute-api.us-east-2.amazonaws.com/dev") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let data = data{
                do {
                    let decoder = JSONDecoder()
                    let gamesResponse = try decoder.decode(GamesResponse.self, from: data)
                    self.games = gamesResponse.body
//                     Loop through games and print them out
//                    for game in self.games {
//                        print(game)
//                    }
                }
                catch {
                    print("Error decoding JSON: \(error)")
                }

            }
            
        }
        task.resume()
        
    }

}
