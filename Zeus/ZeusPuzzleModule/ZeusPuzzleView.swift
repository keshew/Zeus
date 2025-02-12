import SwiftUI
import SpriteKit

class PuzzleGameData: ObservableObject {
    @Published var isLose = false
    @Published var isWin = false
    @Published var isBack = false
    @Published var timeLeft = 120
}

class PuzzleGameSpriteKit: SKScene, SKPhysicsContactDelegate {
    var game: PuzzleGameData?
    var timer: Timer!
    let gridSize = 4
    let puzzleSize: CGFloat = 45
    var puzzles: [[SKSpriteNode]] = []
    var selectedPuzzle: SKSpriteNode?
    var correctPuzzleArrangement: [String] = []
    
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
        
        let gameScene = SKSpriteNode(imageNamed: ZeusImageName.textPrehistory.rawValue)
        gameScene.size = CGSize(width: 480, height: 240)
        gameScene.position = CGPoint(x: size.width / 2, y: size.height / 3.1)
        addChild(gameScene)
    }
    
    func setupView() {
       createMainObject()
       createStats()
    }
    
    func returnAllPuzzles() -> [String] {
          return [ZeusImageName.puzzle1.rawValue, ZeusImageName.puzzle2.rawValue, ZeusImageName.puzzle3.rawValue, ZeusImageName.puzzle4.rawValue, ZeusImageName.puzzle5.rawValue, ZeusImageName.puzzle6.rawValue, ZeusImageName.puzzle7.rawValue, ZeusImageName.puzzle8.rawValue, ZeusImageName.puzzle9.rawValue, ZeusImageName.puzzle10.rawValue, ZeusImageName.puzzle11.rawValue, ZeusImageName.puzzle12.rawValue, ZeusImageName.puzzle13.rawValue, ZeusImageName.puzzle14.rawValue, ZeusImageName.puzzle15.rawValue, ZeusImageName.puzzle16.rawValue]
      }
    
    func returnRightPuzzles() -> [String] {
        return ["puzzle6",
                "puzzle3",
                "puzzle5",
                "puzzle4",
                "puzzle15",
                "puzzle1",
                "puzzle16",
                "puzzle2",
                "puzzle11",
                "puzzle12",
                "puzzle13",
                "puzzle14",
                "puzzle7",
                "puzzle8",
                "puzzle9",
                "puzzle10"]
      }
      
      func createGrid() {
          let puzzleImages = returnAllPuzzles()
          for row in 0..<gridSize {
              var puzzleRow: [SKSpriteNode] = []
              for column in 0..<gridSize {
                  let puzzle = SKSpriteNode(imageNamed: puzzleImages[row * gridSize + column])
                  puzzle.size = CGSize(width: puzzleSize, height: puzzleSize)
                  puzzle.position = CGPoint(
                      x: CGFloat(column) * (puzzleSize + 15) + puzzleSize * 7.3,
                      y: CGFloat(row) * (puzzleSize + 10) + puzzleSize / 1
                  )
                  puzzle.name = "\(puzzleImages[row * gridSize + column])"
                  addChild(puzzle)
                  puzzleRow.append(puzzle)
              }
              puzzles.append(puzzleRow)
          }
      }
      
      override func didMove(to view: SKView) {
          physicsWorld.contactDelegate = self
          size = UIScreen.main.bounds.size
          setupView()
          createGrid()
          correctPuzzleArrangement = returnRightPuzzles()
      }
      
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        if let tappedPuzzle = self.atPoint(location) as? SKSpriteNode, tappedPuzzle.name?.contains("puzzle") == true {
            
            if let selected = selectedPuzzle {
                if selected == tappedPuzzle {
                    selectedPuzzle = nil
                    selected.color = .white
                } else {
                    swapPuzzles(selected, tappedPuzzle)
                    selectedPuzzle = nil
                }
            } else {
                selectedPuzzle = tappedPuzzle
                tappedPuzzle.color = .yellow
            }

            checkWinCondition()
        }
        
        if let tappedPuzzle = self.atPoint(location) as? SKSpriteNode, tappedPuzzle.name?.contains("back") == true {
            game!.isBack = true
        }
    }

    func checkWinCondition() {
        let currentArrangement = puzzles.flatMap { $0.map { $0.name ?? "" } }
        let isWin = currentArrangement == correctPuzzleArrangement

        if isWin {
            game?.isWin = true
            UserDefaultsManager().addStats(key: Keys.knowledge.rawValue)
        }
    }
      
    func swapPuzzles(_ first: SKSpriteNode, _ second: SKSpriteNode) {
        guard let firstIndex = indexOfPuzzle(first), let secondIndex = indexOfPuzzle(second) else {
            return
        }

        let firstPosition = first.position
        let secondPosition = second.position
        first.position = secondPosition
        second.position = firstPosition
        let temp = puzzles[firstIndex.row][firstIndex.column]
        puzzles[firstIndex.row][firstIndex.column] = puzzles[secondIndex.row][secondIndex.column]
        puzzles[secondIndex.row][secondIndex.column] = temp
    }

    func indexOfPuzzle(_ puzzle: SKSpriteNode) -> (row: Int, column: Int)? {
        guard let puzzleName = puzzle.name else { return nil }
        for row in 0..<puzzles.count {
            for column in 0..<puzzles[row].count {
                if puzzles[row][column].name == puzzleName {
                    return (row: row, column: column)
                }
            }
        }
        return nil
    }
}
struct ZeusPuzzleView: View {
    @StateObject var zeusPuzzleModel =  ZeusPuzzleViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.presentationMode) var presentationMode
    @StateObject var gameModel =  PuzzleGameData()
    
    var body: some View {
        ZStack {
            SpriteView(scene: zeusPuzzleModel.createPuzzleGameScene(gameData: gameModel))
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
            
            if gameModel.isWin {
                ZeusWinView()
            }
        }
        NavigationLink(destination: ZeusMenuView(),
                       isActive: $gameModel.isBack) {}
        .hidden()
    }
}

#Preview {
    ZeusPuzzleView()
}

