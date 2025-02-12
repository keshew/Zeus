import SwiftUI

enum Keys: String {
    case shopItems = "shopItems"
    case currentLevel = "currentLevel"
    case backgroundVolume = "backgroundVolume"
    case intuition = "intuition"
    case kindness = "kindness"
    case knowledge = "knowledge"
    case facts = "facts"
}

class UserDefaultsManager: ObservableObject {
    static let defaults = UserDefaults.standard

    func firstLaunch() -> Bool {
        var value = false
        if UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) == nil {
            UserDefaultsManager.defaults.set(1,  forKey: Keys.currentLevel.rawValue)
            UserDefaultsManager.defaults.set(20,  forKey: Keys.intuition.rawValue)
            UserDefaultsManager.defaults.set(20,  forKey: Keys.kindness.rawValue)
            UserDefaultsManager.defaults.set(20,  forKey: Keys.knowledge.rawValue)
            UserDefaultsManager.defaults.set(0,  forKey: Keys.facts.rawValue)
            UserDefaultsManager.defaults.set(0.5, forKey: Keys.backgroundVolume.rawValue)
            value = true
        }
        return value
    }
    
    func increaseLevel() {
        let currentLevel = UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 1
        if currentLevel <= 2 {
            UserDefaultsManager.defaults.set(currentLevel + 1, forKey: Keys.currentLevel.rawValue)
        }
    }
    
    func addFactCount() {
        let currentFact = UserDefaultsManager.defaults.object(forKey: Keys.facts.rawValue) as? Int ?? 1
        if currentFact <= 9 {
            UserDefaultsManager.defaults.set(currentFact + 1, forKey: Keys.facts.rawValue)
        }
    }
    
    func addStats(key: String) {
        let currentStat = UserDefaultsManager.defaults.object(forKey: key) as? Int ?? 1
        UserDefaultsManager.defaults.set(currentStat + 1, forKey: key)
    }
    
    func saveVolumeSettings(backgroundVolume: Float) {
        UserDefaultsManager.defaults.set(backgroundVolume, forKey: Keys.backgroundVolume.rawValue)
    }
    
    func loadVolumeSettings() -> Float {
        var backgroundVolume = UserDefaultsManager.defaults.float(forKey: Keys.backgroundVolume.rawValue)
        if backgroundVolume == 0.0 {
            backgroundVolume = 1.0
        }
        return backgroundVolume
    }
}
