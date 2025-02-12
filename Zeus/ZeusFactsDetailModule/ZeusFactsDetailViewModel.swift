import SwiftUI

class ZeusFactsDetailViewModel: ObservableObject {
    let contact = ZeusFactsDetailModel()
    @Published var offset: CGSize = .zero
}
