import SwiftUI

class ZeusPuzzleViewModel: ObservableObject {
    let contact = ZeusPuzzleModel()

    func createPuzzleGameScene(gameData: PuzzleGameData) -> PuzzleGameSpriteKit {
        let scene = PuzzleGameSpriteKit()
        scene.game  = gameData
        return scene
    }
}
