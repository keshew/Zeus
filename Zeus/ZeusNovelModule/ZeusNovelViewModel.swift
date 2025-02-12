import SwiftUI

class ZeusNovelViewModel: ObservableObject {
    let contact = ZeusNovelModel()
    @Published var currentIndex = 0
    @Published var isFinalLeft = false
    @Published var isFinalMiddle = false
    @Published var isFinalRight = false
    @Published var isLeftVisible = false
    @Published var isMiddleVisible = false
    @Published var isRightVisible = false
    @Published var isFact = false
    @Published var offset: CGFloat = -150
    
    func isFinalLeading() {
        UserDefaultsManager().addStats(key: Keys.kindness.rawValue)
        currentIndex += 1
        if currentIndex == 7 {
            isFinalLeft = true
        }
        
        withAnimation {
            isLeftVisible = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                self.isLeftVisible = false
            }
        }
    }
    
    func isFinalMid() {
        UserDefaultsManager().addStats(key: Keys.intuition.rawValue)
        currentIndex += 1
        if currentIndex == 7 {
            isFinalMiddle = true
        }
        
        withAnimation {
            isMiddleVisible = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                self.isMiddleVisible = false
            }
        }
    }
    
    func isFinalTrailing() {
        UserDefaultsManager().addStats(key: Keys.knowledge.rawValue)
        currentIndex += 1
        if currentIndex == 7 {
            isFinalRight = true
        }
        
        withAnimation {
            isRightVisible = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                self.isRightVisible = false
            }
        }
    }
    
    func newFactWhile() {
        let factCount = UserDefaultsManager.defaults.object(forKey: Keys.facts.rawValue) as? Int ?? 1
        if factCount <= 9 {
            isFact = true
            if isFact {
                UserDefaultsManager().addFactCount()
                withAnimation {
                    offset = 0
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.offset = -150
                }
            }
        }
    }
}
