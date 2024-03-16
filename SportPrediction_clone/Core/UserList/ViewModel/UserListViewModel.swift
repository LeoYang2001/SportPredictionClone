
import Foundation


class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var userPoint: String = "-1"

    func fetchUserList() {
        print("fetching users")
        let lambdaEndpoint = "https://adnlapig97.execute-api.us-east-2.amazonaws.com/dev"  // Replace with your actual Lambda function endpoint

        guard let url = URL(string: lambdaEndpoint) else {
            // Handle invalid URL
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let userListResponse = try decoder.decode(UserListResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.users = userListResponse.body
                        print(self.users)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching user list: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func getPoints(for userName: String){
        if let user = users.first(where: { $0.UserID.S == userName }) {
            self.userPoint = user.NBAPoints.N
            print("fetch user: \(userName) -- point:\(userPoint)")
        } else {
            self.userPoint =  "-1" // User not found in the list
        }
    }
}
