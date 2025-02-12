import SwiftUI

class ZeusMiniGamesViewModel: ObservableObject {
    let contact = ZeusMiniGamesModel()
    @Published var currentIndex = 0
    @Published var offset: CGSize = .zero
    @Published var isLight = false
    @Published var isPuzzle = false 
    @Published var remainingTime: Int = 0
    @Published var timer: Timer?
    @Published var isTimerRunning: Bool = false
    @Published private var startTime: Date?
    
    func startTimer() {
           startTime = Date()
           isTimerRunning = true
           updateRemainingTime()

           timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
               if self.remainingTime > 0 {
                   self.remainingTime -= 1
               } else {
                   self.timer?.invalidate()
                   self.isTimerRunning = false
               }
           }

           saveTimer()
       }

       func updateRemainingTime() {
           if let savedStartTime = UserDefaults.standard.object(forKey: "startTime") as? Date {
               let elapsedTime = Int(Date().timeIntervalSince(savedStartTime))
               remainingTime = max(0, (24 * 60 * 60) - elapsedTime)
           } else {
               remainingTime = 24 * 60 * 60
           }
       }

       func formatTime(_ seconds: Int) -> String {
           let hours = seconds / 3600
           let minutes = (seconds % 3600) / 60
           return String(format: "%02d:%02d", hours, minutes)
       }

       func saveTimer() {
           UserDefaults.standard.set(remainingTime, forKey: "remainingTime")
           UserDefaults.standard.set(isTimerRunning, forKey: "isTimerRunning")
           if isTimerRunning {
               UserDefaults.standard.set(Date(), forKey: "startTime")
           } else {
               UserDefaults.standard.removeObject(forKey: "startTime")
           }
       }

       func loadTimer() {
           if let savedTime = UserDefaults.standard.value(forKey: "remainingTime") as? Int,
              let savedRunningState = UserDefaults.standard.value(forKey: "isTimerRunning") as? Bool {
               remainingTime = savedTime
               isTimerRunning = savedRunningState

               if isTimerRunning {
                   updateRemainingTime()
                   startTimer()
               }
           } else {
               remainingTime = 24 * 60 * 60
           }
       }
}
