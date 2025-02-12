import SwiftUI

class ZeusCatchLightViewModel: ObservableObject {
    let contact = ZeusCatchLightModel()

    func createCatchLighGameScene(gameData: CatchLighGameData) -> CatchLightGameSpriteKit {
        let scene = CatchLightGameSpriteKit()
        scene.game  = gameData
        return scene
    }
}
