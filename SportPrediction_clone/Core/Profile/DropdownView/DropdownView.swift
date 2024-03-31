//
//  DropdownView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/30/24.
//

import SwiftUI

struct DropdownView: View {
    let options: [String]
       
       // State variable to store the selected option
       @State private var selectedOption = 0
       
       var body: some View {
           VStack {
               // Picker view to display dropdown selection
               Picker("Select an option", selection: $selectedOption) {
                   ForEach(0..<options.count) { index in
                       Text(self.options[index])
                           .font(.headline)
                   }
               }
               .pickerStyle(MenuPickerStyle()) 
               .accentColor(.white)
               
               
//               // Display the selected option
//               Text("Selected Option: \(options[selectedOption])")
//                   .padding()
           }
         
       
       }
}


#Preview {
    DropdownView(options: ["NBA","NFL","NCAA"])
}
