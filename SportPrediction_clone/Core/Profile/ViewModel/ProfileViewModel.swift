import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var newName: String = "test"
    @Published var isEditingName: Bool = false
    @Published var saveButtonTapped: Bool = false
    @Published var errorMessage: String?
    @Published var userPoint:String?

    
    func saveUser() {
        // Call your API endpoint to create a user
        // Replace "YOUR_API_ENDPOINT" with the actual endpoint URL
        guard let url = URL(string: "https://ydq5icuzkk.execute-api.us-east-2.amazonaws.com/dev") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let payload = [
            "UserID": newName
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload) else {
            errorMessage = "Failed to serialize JSON data"
            return
        }
        
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    self.errorMessage = "Invalid server response"
                }
                return
            }
            
            if !(200...299).contains(httpResponse.statusCode) {
                DispatchQueue.main.async {
                    self.errorMessage = "Server error: \(httpResponse.statusCode)"
                }
                return
            }
            
            // Handle the response as needed
            // For simplicity, you can ignore the response
        }.resume()
    }
    
}
