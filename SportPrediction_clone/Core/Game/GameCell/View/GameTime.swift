//
//  GameTime.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/30/24.
//

import SwiftUI
import Foundation


struct GameTime: View {
    let gameStartTime: String
    let isPredicted: Bool
    
    @State private var showCountdown = true
    @State private var countdown: String = "00:00"
    
    
    
    var body: some View {
        HStack{
            if(showCountdown && !isPredicted)
            {
                Text("Game Start in: ")
                    .foregroundStyle(.gray)
                Text(countdown)
                    .foregroundStyle(.red)
                
            }
            else{
                Text(convertToHourMinute(from: gameStartTime) ?? "")
                    .foregroundStyle(.gray)
            }
            
        }
        .font(.footnote)
        .fontWeight(.semibold)
        .onAppear {
            updateCountdown(gameStartTimeString: gameStartTime)
            if(showCountdown)
            {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                         updateCountdown(gameStartTimeString: gameStartTime)
                }
            }
        }
    }
    private func updateCountdown(gameStartTimeString:String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"

        let currentTime = Date()
        let currentTimeString = dateFormatter.string(from: currentTime)
      
        guard let gameStartTime = dateFormatter.date(from: gameStartTimeString) else {
            fatalError("Invalid game start time")
        }

        // Convert current time string to Date
        guard let currentTime = dateFormatter.date(from: currentTimeString) else {
            fatalError("Invalid current time")
        }
        
        let differenceInSeconds = Int(gameStartTime.timeIntervalSince(currentTime))

        // Check if the difference is within an hour
        if abs(differenceInSeconds) <= 3600  && differenceInSeconds >= 0{
            showCountdown = true
            countdown = formatTime(seconds: differenceInSeconds)
        }
        else{
            showCountdown = false
        }
    }
    func formatTime(seconds: Int) -> String {
        let minutes = (seconds % 3600) / 60
        let seconds = (seconds % 3600) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func convertToHourMinute(from timeString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        
        guard let date = dateFormatter.date(from: timeString) else {
            return nil
        }
        
        let hourMinuteFormatter = DateFormatter()
        hourMinuteFormatter.dateFormat = "HH:mm"
        
        return hourMinuteFormatter.string(from: date)
    }
    

}

#Preview {
    GameTime(gameStartTime:"12:10:00",isPredicted:true)
}
