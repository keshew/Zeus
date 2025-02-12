import SwiftUI

class ZeusFinalViewModel: ObservableObject {
    let contact = ZeusFinalModel()
    @Published var isEnd = false
}
