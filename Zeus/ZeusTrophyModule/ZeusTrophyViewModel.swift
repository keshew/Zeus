import SwiftUI

class ZeusTrophyViewModel: ObservableObject {
    let contact = ZeusTrophyModel()
    let columns = [
          GridItem(.flexible(), spacing: -230),
          GridItem(.flexible(), spacing: -230),
          GridItem(.flexible(), spacing: -230)
      ]
    @Published var currentIndex = 0
    @Published var offset: CGSize = .zero
}
