import AVFoundation
import SwiftUI

class AudioManager: ObservableObject {
    static let shared = AudioManager()
    var menuPlayer: AVAudioPlayer?
    var firstPlayer: AVAudioPlayer?
    var secondPlayer: AVAudioPlayer?
    var thirdPlayer: AVAudioPlayer?
    
    @Published var backgroundVolume: Float {
        didSet {
            menuPlayer?.volume = backgroundVolume
            firstPlayer?.volume = backgroundVolume
            secondPlayer?.volume = backgroundVolume
            thirdPlayer?.volume = backgroundVolume
        }
    }
    
    init() {
        self.backgroundVolume = UserDefaultsManager().loadVolumeSettings()
       
        loadMenuMusic()
        loadFirstMusic()
        loadSecondMusic()
        loadThirdMusic()
    }
    
    private func loadMenuMusic() {
        if let url = Bundle.main.url(forResource: "menu", withExtension: "wav") {
            do {
                menuPlayer = try AVAudioPlayer(contentsOf: url)
                menuPlayer?.numberOfLoops = -1
                menuPlayer?.volume = backgroundVolume
                menuPlayer?.prepareToPlay()
            } catch {
                print("Ошибка \(error)")
            }
        }
    }
    
    private func loadFirstMusic() {
        if let url = Bundle.main.url(forResource: "firstStage", withExtension: "mp3") {
            do {
                firstPlayer = try AVAudioPlayer(contentsOf: url)
                firstPlayer?.numberOfLoops = -1
                firstPlayer?.volume = backgroundVolume
                firstPlayer?.prepareToPlay()
            } catch {
                print("Ошибка \(error)")
            }
        }
    }
    
    private func loadSecondMusic() {
        if let url = Bundle.main.url(forResource: "secondStage", withExtension: "mp3") {
            do {
                secondPlayer = try AVAudioPlayer(contentsOf: url)
                secondPlayer?.numberOfLoops = -1
                secondPlayer?.volume = backgroundVolume
                secondPlayer?.prepareToPlay()
            } catch {
                print("Ошибка \(error)")
            }
        }
    }
    
    private func loadThirdMusic() {
        if let url = Bundle.main.url(forResource: "thirdStage", withExtension: "mp3") {
            do {
                thirdPlayer = try AVAudioPlayer(contentsOf: url)
                thirdPlayer?.numberOfLoops = -1
                thirdPlayer?.volume = backgroundVolume
                thirdPlayer?.prepareToPlay()
            } catch {
                print("Ошибка \(error)")
            }
        }
    }
    
   
    
    func playMenuMusic() {
        menuPlayer?.play()
    }
    
    func stopMenuMusic() {
        menuPlayer?.stop()
    }
    
    func playFirstMusic() {
        firstPlayer?.play()
    }
    
    func stopFirstMusic() {
        firstPlayer?.stop()
    }
    
    func playSecondMusic() {
        secondPlayer?.play()
    }
    
    func stopSecondMusic() {
        secondPlayer?.stop()
    }
    
    func playThirdMusic() {
        thirdPlayer?.play()
    }
    
    func stopThirdMusic() {
        thirdPlayer?.stop()
    }
}
