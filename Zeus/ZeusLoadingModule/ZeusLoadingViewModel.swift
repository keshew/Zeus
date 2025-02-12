import SwiftUI

class ZeusLoadingViewModel: ObservableObject {
    let contact = ZeusLoadingModel()
    @Published var currentIndex = 0
    @Published var isHistoryVisible = false
    @Published var isLink = false
    @Published var isMenu = false
}
