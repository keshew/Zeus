import SwiftUI

class ZeusMenuViewModel: ObservableObject {
    let contact = ZeusMenuModel()
    @Published var isMusicOff = false
    @Published var isSoundOff = false
}
