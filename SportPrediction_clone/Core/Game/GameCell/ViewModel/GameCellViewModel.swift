import Foundation

class GameCellViewModel: ObservableObject {
    @Published var ifPredicted: Bool = false
    @Published var voteRatio: Float = 0
    @Published var ifVoteForTeamA: Bool = true

    func sendPrediction(gameID: String, teamName: String) {
        // Construct and send the prediction request to the Lambda function
        // You can use Combine or other techniques to handle the response asynchronously
        // Example: Use URLSession to make the request
        // Note: Replace the placeholder URL with your actual Lambda function endpoint
        let lambdaEndpoint = "https://arrhfxvxo9.execute-api.us-east-2.amazonaws.com/dev"

        guard let url = URL(string: lambdaEndpoint) else {
            // Handle invalid URL
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let payload = [
            "GameID": gameID,
            "winTeam": teamName
        ]
        self.ifVoteForTeamA = teamName == "TeamA"

        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload) else {
            // Handle JSON serialization error
            return
        }

        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle the response or error
            // You may want to use Combine to update the UI or handle errors
            // For simplicity, print the response to the console
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                print("Lambda response: \(responseString)")
                if let jsonData = responseString.data(using: .utf8),
                           let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []),
                           let responseDict = jsonObject as? [String: Any],
                           let bodyDict = responseDict["body"] as? [String: Any],
                           let teamAVotesString = bodyDict["TeamAVotes"] as? String,
                           let teamBVotesString = bodyDict["TeamBVotes"] as? String,
                           let teamAVotes = Int(teamAVotesString),
                           let teamBVotes = Int(teamBVotesString),
                           teamAVotes + teamBVotes > 0 {

                            let voteRatio = Float(teamAVotes) / Float(teamAVotes + teamBVotes)
                            print("Vote Ratio: \(voteRatio)")

                            // Now you can use voteRatio as needed, e.g., update your UI
                            // Update your published properties in your ViewModel
                            DispatchQueue.main.async {
                                self.voteRatio = voteRatio
                                self.ifPredicted = true
                            }
                        }
            } else if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    
    
    func voteForTeamByUser(userID: String, gameID: String, winTeam: String) {
        let lambdaEndpoint = "https://nly17grqq8.execute-api.us-east-2.amazonaws.com/dev"

        guard let url = URL(string: lambdaEndpoint) else {
            // Handle invalid URL
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let payload = [
            "UserID": userID,
            "GameID": gameID,
            "winTeam": winTeam
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload) else {
            // Handle JSON serialization error
            return
        }

        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle the response or error
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
