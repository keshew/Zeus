import SwiftUI

struct ZeusMenuView: View {
    @StateObject var zeusMenuModel =  ZeusMenuViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @ObservedObject var audioManager = AudioManager.shared
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(.loadingBack)
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image(.zeus)
                        .resizable()
                        .frame(width: geometry.size.width * 0.57,
                               height: geometry.size.height * 0.845)
                        .position(x: geometry.size.width / 1.22, y: geometry.size.height / 1.5)
                    
                    VStack {
                        HStack {
                            Button(action: {
                                zeusMenuModel.isSoundOff.toggle()
                            }) {
                                Image(zeusMenuModel.isSoundOff ? ZeusImageName.soundOff.rawValue : ZeusImageName.sound.rawValue)
                                .resizable()
                                .frame(width: 50, height: 50)
                            }
                            Spacer()
                            
                            Text("MYTHIC SAGA")
                                .Cartoon(size: 60)
                            
                            Spacer()
                            
                            Button(action: {
                                zeusMenuModel.isMusicOff.toggle()
                                
                                if zeusMenuModel.isMusicOff {
                                    UserDefaultsManager().saveVolumeSettings(backgroundVolume: 0)
                                    audioManager.backgroundVolume = 0
                                } else {
                                    UserDefaultsManager().saveVolumeSettings(backgroundVolume: 1)
                                    audioManager.backgroundVolume = 1
                                }
                            }) {
                                Image(zeusMenuModel.isMusicOff ? ZeusImageName.musicOff.rawValue : ZeusImageName.music.rawValue)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        
                        HStack(spacing: 50) {
                            Statements(image: ZeusImageName.intuition.rawValue,
                                       backImage: ZeusImageName.intuitionBack.rawValue,
                                       text: "INTUITION: \(UserDefaultsManager.defaults.object(forKey: Keys.intuition.rawValue) as? Int ?? 1)")
                            
                            Statements(image: ZeusImageName.kidness.rawValue,
                                       backImage: ZeusImageName.kidnessBack.rawValue,
                                       text: "KINDNESS: \(UserDefaultsManager.defaults.object(forKey: Keys.kindness.rawValue) as? Int ?? 1)")
                            
                            Statements(image: ZeusImageName.knowledge.rawValue,
                                       backImage: ZeusImageName.knowledgeBack.rawValue,
                                       text: "KNOWLEDGE: \(UserDefaultsManager.defaults.object(forKey: Keys.knowledge.rawValue) as? Int ?? 1)")
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 30) {
                            NavigationLink(destination: ZeusChapterView()) {
                                SimpleView(text: "PLAY")
                            }
                            
                            HStack(spacing: 30) {
                                NavigationLink(destination: ZeusTrophyView()) {
                                    SimpleView(text: "TROPHIES", fontSize: 26)
                                }
                                
                                NavigationLink(destination: ZeusMiniGamesView()) {
                                    SimpleView(text: "MINI-GAMES", fontSize: 22)
                                }
                                
                                NavigationLink(destination: ZeusFactsView()) {
                                    SimpleView(text: "FACTS")
                                }
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ZeusMenuView()
}

