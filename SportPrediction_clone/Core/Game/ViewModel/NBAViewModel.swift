import Foundation

class NBAViewModel: ObservableObject {
    @Published var games: [GameClone] = []
    @Published var isLoading: Bool = false

    
    func fetchGames(date: String) {
        guard let url = URL(string: "https://api-nba-v1.p.rapidapi.com/games?date=\(date)") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("02de0540a8mshfdc1a7541145d77p178a01jsn301f2d0436f4", forHTTPHeaderField: "X-RapidAPI-Key")
        request.addValue("api-nba-v1.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")

        isLoading = true
        URLSession.shared.dataTask(with: request) { data, response, error in
            defer { self.isLoading = false }
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(GameResponseClone.self, from: data)
                    DispatchQueue.main.async {
                        if let game = decodedResponse.response.first {
                            self.games = [game]
                        } else {
                            // Handle no games for the date
                            self.games = []
                        }
                    }
                } catch {
                    print("Error decoding JSON")
                    DispatchQueue.main.async {
                        // Handle decoding errors
                        self.games = []
                    }
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
}
