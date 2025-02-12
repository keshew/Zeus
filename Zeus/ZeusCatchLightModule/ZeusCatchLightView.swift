import SwiftUI
import SpriteKit

class CatchLighGameData: ObservableObject {
    @Published var isLose = false
    @Published var isWin = false
    @Published var isBack = false
    @Published var isStartTimer = false
    @Published var timeLeft = 120
    @Published var score = 0
}

class CatchLightGameSpriteKit: SKScene, SKPhysicsContactDelegate {
    var game: CatchLighGameData?
    var timer: Timer!
    let spawnInterval: TimeInterval = 1.0
    var spawnTimer: Timer?
    var timeLabel: SKLabelNode!
    var scoreLabel: SKLabelNode!
    
    func createStats() {
        let intBack = SKSpriteNode(imageNamed: ZeusImageName.intuitionBack.rawValue)
        intBack.size = CGSize(width: 140, height: 45)
        intBack.position = CGPoint(x: size.width / 3.6, y: size.height / 1.4)
        addChild(intBack)
        
        let intuition = SKSpriteNode(imageNamed: ZeusImageName.intuition.rawValue)
        intuition.size = CGSize(width: 58, height: 60)
        intuition.position = CGPoint(x: size.width / 4.8, y: size.height / 1.4)
        addChild(intuition)
        
        let intuitionLabel = SKLabelNode(fontNamed: "SkrampCyr")
        intuitionLabel.attributedText = NSAttributedString(string: "Intuition:\(UserDefaultsManager.defaults.object(forKey: Keys.intuition.rawValue) as? Int ?? 1)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "SkrampCyr", size: 15)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -6
        ])
        intuitionLabel.position = CGPoint(x: size.width / 3.4, y: size.height / 1.44)
        addChild(intuitionLabel)
        
        let kindnessBack = SKSpriteNode(imageNamed: ZeusImageName.kidnessBack.rawValue)
        kindnessBack.size = CGSize(width: 140, height: 45)
        kindnessBack.position = CGPoint(x: size.width / 2, y: size.height / 1.4)
        addChild(kindnessBack)
        
        let kindness = SKSpriteNode(imageNamed: ZeusImageName.kidness.rawValue)
        kindness.size = CGSize(width: 63, height: 58)
        kindness.position = CGPoint(x: size.width / 2.4, y: size.height / 1.4)
        addChild(kindness)
        
        let kindnessLabel = SKLabelNode(fontNamed: "SkrampCyr")
        kindnessLabel.attributedText = NSAttributedString(string: "Kindness:\(UserDefaultsManager.defaults.object(forKey: Keys.kindness.rawValue) as? Int ?? 1)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "SkrampCyr", size: 15)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -6
        ])
        kindnessLabel.position = CGPoint(x: size.width / 1.97, y: size.height / 1.44)
        addChild(kindnessLabel)
        
        let knownledgeBack = SKSpriteNode(imageNamed: ZeusImageName.knowledgeBack.rawValue)
        knownledgeBack.size = CGSize(width: 140, height: 45)
        knownledgeBack.position = CGPoint(x: size.width / 1.37, y: size.height / 1.4)
        addChild(knownledgeBack)
        
        let knowledge = SKSpriteNode(imageNamed: ZeusImageName.knowledge.rawValue)
        knowledge.size = CGSize(width: 58, height: 60)
        knowledge.position = CGPoint(x: size.width / 1.55, y: size.height / 1.4)
        addChild(knowledge)
        
        let knowledgeLabel = SKLabelNode(fontNamed: "SkrampCyr")
        knowledgeLabel.attributedText = NSAttributedString(string: "knowledge:\(UserDefaultsManager.defaults.object(forKey: Keys.knowledge.rawValue) as? Int ?? 1)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "SkrampCyr", size: 15)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -6
        ])
        knowledgeLabel.position = CGPoint(x: size.width / 1.352, y: size.height / 1.44)
        addChild(knowledgeLabel)
    }
    
    func createMutatuingObject() {
        let timeBack = SKSpriteNode(imageNamed: ZeusImageName.timeBack.rawValue)
        timeBack.size = CGSize(width: 93, height: 38)
        timeBack.position = CGPoint(x: size.width / 2.7, y: size.height / 1.75)
        addChild(timeBack)
        
        timeLabel = SKLabelNode(fontNamed: "SkrampCyr")
        timeLabel.attributedText = NSAttributedString(string:"\(String(describing: (game?.timeLeft ?? 0) / 60)):\(String(describing: (game?.timeLeft ?? 0) % 60))", attributes: [
            NSAttributedString.Key.font: UIFont(name: "SkrampCyr", size: 14)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -6
        ])
        timeLabel.position = CGPoint(x: size.width / 2.7, y: size.height / 1.84)
        addChild(timeLabel)
        
        let scoreBack = SKSpriteNode(imageNamed: ZeusImageName.timeBack.rawValue)
        scoreBack.size = CGSize(width: 93, height: 38)
        scoreBack.position = CGPoint(x: size.width / 1.65, y: size.height / 1.75)
        addChild(scoreBack)
        
        scoreLabel = SKLabelNode(fontNamed: "SkrampCyr")
        scoreLabel.attributedText = NSAttributedString(string: "score:\(game!.score)\\100", attributes: [
            NSAttributedString.Key.font: UIFont(name: "SkrampCyr", size: 14)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -6
        ])
        scoreLabel.position = CGPoint(x: size.width / 1.653, y: size.height / 1.84)
        addChild(scoreLabel)
    }
    
    func createMainObject() {
        let gameBackground = SKSpriteNode(imageNamed: ZeusImageName.stage3Back.rawValue)
        gameBackground.size = CGSize(width: size.width, height: size.height)
        gameBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(gameBackground)
        
        let pause = SKSpriteNode(imageNamed: ZeusImageName.backBtn.rawValue)
        pause.size = CGSize(width: 50, height: 50)
        pause.name = "back"
        pause.position = CGPoint(x: size.width / 11, y: size.height / 1.15)
        addChild(pause)
        
        let gameLabel = SKSpriteNode(imageNamed: ZeusImageName.miniGamesLabel.rawValue)
        gameLabel.size = CGSize(width: 347, height: 82)
        gameLabel.position = CGPoint(x: size.width / 2, y: size.height / 1.15)
        addChild(gameLabel)
    }
    
    func startSpawningNodes() {
        spawnTimer = Timer.scheduledTimer(timeInterval: spawnInterval, target: self, selector: #selector(spawnNodes), userInfo: nil, repeats: true)
    }
    
    @objc func spawnNodes() {
        for _ in 0..<1 {
            let node = SKSpriteNode(imageNamed: ZeusImageName.light.rawValue)
            node.size = CGSize(width: 17, height: 43)
            node.name = "Node"
            node.position = CGPoint(x: 0, y: CGFloat.random(in: 100...size.height / 1.5))
            addChild(node)
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.updateTimer()
        }
    }
    
    func updateTimer() {
        if game?.timeLeft ?? 0 > 0 {
            game?.timeLeft -= 1
            timeLabel.attributedText = NSAttributedString(string:"\(String(describing: (game?.timeLeft ?? 0) / 60)):\(String(describing: (game?.timeLeft ?? 0) % 60))", attributes: [
                NSAttributedString.Key.font: UIFont(name: "SkrampCyr", size: 14)!,
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.strokeColor: UIColor.black,
                NSAttributedString.Key.strokeWidth: -6
            ])
        } else {
            if game!.isWin != true {
                game?.isLose = true
                scene?.isPaused = true
                timer?.invalidate()
            }
        }
    }
    
    func setupView() {
        createMainObject()
        createStats()
        createMutatuingObject()
        startSpawningNodes()
        startTimer()
    }
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        size =  UIScreen.main.bounds.size
        setupView()
    }
    
    override func update(_ currentTime: TimeInterval) {
        for node in children {
            if node.name == "Node" {
                node.position.x += 3
                if node.position.x > size.width {
                    node.removeFromParent()
                }
            }
        }
        
        if game!.score >= 100 {
            UserDefaultsManager().addStats(key: Keys.knowledge.rawValue)
            game!.isWin = true
            timer.invalidate()
            scene?.isPaused = true
        }
    }
    
    deinit {
        spawnTimer?.invalidate()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let node = atPoint(location)
        if node.name == "Node" {
            node.removeFromParent()
            game!.score += 1
            scoreLabel.attributedText = NSAttributedString(string: "score:\(game!.score)\\100", attributes: [
                NSAttributedString.Key.font: UIFont(name: "SkrampCyr", size: 14)!,
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.strokeColor: UIColor.black,
                NSAttributedString.Key.strokeWidth: -6
            ])
        }
        
        if node.name == "back" {
            game!.isBack = true
        }
    }
}

struct ZeusCatchLightView: View {
    @StateObject var zeusCatchLightModel =  ZeusCatchLightViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.presentationMode) var presentationMode
    @StateObject var gameModel =  CatchLighGameData()
    
    var body: some View {
        ZStack {
            SpriteView(scene: zeusCatchLightModel.createCatchLighGameScene(gameData: gameModel))
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
            
            if gameModel.isWin {
                ZeusWinView()
            }
            
            if gameModel.isLose {
                ZeusLoseView()
            }
        }
        NavigationLink(destination: ZeusMenuView(),
                       isActive: $gameModel.isBack) {}
        .hidden()
    }
}

#Preview {
    ZeusCatchLightView()
}

