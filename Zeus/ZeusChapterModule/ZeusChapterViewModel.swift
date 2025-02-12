import SwiftUI

class ZeusChapterViewModel: ObservableObject {
    let contact = ZeusChapterModel()
    @Published var currentIndex = 0
    
}
