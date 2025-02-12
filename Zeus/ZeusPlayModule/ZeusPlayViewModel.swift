import SwiftUI

class ZeusPlayViewModel: ObservableObject {
    let contact = ZeusPlayModel()
    @Published var isEnd = false
    @Published var isAnimating = false
    @Published var isDarkened = false
    @Published var isMenu = false
    @Published var opacity: CGFloat = 1
    @Published var isTapped = false
    @Published var isNovel = false
}
