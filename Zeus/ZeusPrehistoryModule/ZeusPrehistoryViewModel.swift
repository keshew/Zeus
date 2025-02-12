import SwiftUI

class ZeusPrehistoryViewModel: ObservableObject {
    let contact = ZeusPrehistoryModel()
    @Published var textIndex = 0
    @Published var tapCount = 0
    @Published var isEnd = false
    @Published var isAnimating = false
    @Published var isDarkened = false
    @Published var isMenu = false
    
    func increaseTextIndex() {
        if textIndex < 2 {
            textIndex += 1
        }
    }
    
    func increaseTapCount() {
            tapCount += 1
    }
}
