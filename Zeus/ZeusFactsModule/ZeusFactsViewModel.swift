import SwiftUI

class ZeusFactsViewModel: ObservableObject {
    let contact = ZeusFactsModel()
    @Published var offset: CGSize = .zero
    @Published var currentIndex = 0
    @Published var isFact = false
    @Published var factCount = 0
}
