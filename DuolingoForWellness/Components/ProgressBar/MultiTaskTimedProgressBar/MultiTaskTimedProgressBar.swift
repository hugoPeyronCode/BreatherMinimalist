//
//  MultiTaskTimedProgressBar.swift
//  DuolingoForWellness
//
//  Created by Hugo Peyron on 01/04/2024.

import SwiftUI

struct MultiTaskTimedProgressBar: View {
    let tasks: [String] = ["Breathe", "Meditate", "Manifest", "Quote", "Reflect"]
    
    // The duration it takes to move from one task to the next
    let incrementDuration: Double = 1 // seconds for simplicity, adjust as needed
    
    @State private var progressValue: CGFloat = 0.0 // Represents the current progress
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Rectangle() // Background of the progress bar
                    .frame(width: progressBarWidth, height: progressBarHeight)
                    .foregroundColor(.gray)
                
                Rectangle() // Foreground showing progress
                    .frame(width: progressBarWidth * progressValue, height: progressBarHeight)
                    .foregroundColor(.orange)
                    .animation(.linear(duration: incrementDuration), value: progressValue)
            }
            
            Button(action: {
                // Calculate the next progress value as a fraction of the total number of tasks
                let nextProgress = (1.0 / CGFloat(tasks.count)) * CGFloat((tasks.firstIndex(where: { $0 == tasks[Int(progressValue * CGFloat(tasks.count))] }) ?? 0) + 1)
                if nextProgress <= 1.0 {
                    progressValue = nextProgress
                }
            }) {
                Text("Next Task")
                    .padding()
                    .background(progressValue < 1.0 ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .disabled(progressValue >= 1.0)
            }
            
            Spacer()
        }
    }
}

private extension MultiTaskTimedProgressBar {
    var progressBarWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var progressBarHeight: CGFloat {
        UIScreen.main.bounds.height * 0.1
    }
}

// Preview provider here

// Preview provider here
#Preview {
    MultiTaskTimedProgressBar()
}
