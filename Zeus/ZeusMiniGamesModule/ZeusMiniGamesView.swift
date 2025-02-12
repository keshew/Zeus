import SwiftUI

struct ZeusMiniGamesView: View {
    @StateObject var zeusMiniGamesModel =  ZeusMiniGamesViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.presentationMode) var presentationMode
 
    
    
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(.loadingBack)
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image(.zeus)
                        .resizable()
                        .frame(width: 380, height: 290)
                        .position(x: geometry.size.width / 1.22, y: geometry.size.height / 1.5)
                    
                    
                    VStack {
                        HStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(.backBtn)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                            
                            Spacer()
                            
                            Image(.miniGamesLabel)
                                .resizable()
                                .frame(width: 347, height: 82)
                            
                            Spacer()
                        }
                        .padding(.trailing, 55)
                        
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
                        
                        ZStack {
                            Rectangle()
                                .fill(.yellow)
                                .frame(width: 200, height: 110)
                            
                            Image(.border)
                                .resizable()
                                .frame(width: 219, height: 160)
                            
                            VStack {
                                Text(zeusMiniGamesModel.currentIndex == 0 ? "Catch the lightning" : "Set all part of puzzle")
                                    .SkrampCyr(size: 15, outlineWidth: 0.7)
                                
                                Text(zeusMiniGamesModel.currentIndex == 0 ? "You need to catch the lightning bolts\n that appear on the screen." : "You need to set up all part of puzzles\n that on your screen")
                                    .SkrampCyr(size: 10, outlineWidth: 0.4)
                                    .multilineTextAlignment(.center)
                            }
                      
                            
                            if zeusMiniGamesModel.isTimerRunning {
                                SimpleView(text: "\(zeusMiniGamesModel.formatTime(zeusMiniGamesModel.remainingTime))",
                                           image: ZeusImageName.grayButton.rawValue,
                                           sizeW: 110,
                                           sizeH: 48)
                                    .offset(y: 70)
                            } else {
                                SimpleButton(text: "PLAY", sizeW: 110, sizeH: 48) {
                                    if zeusMiniGamesModel.currentIndex == 0 {
                                        zeusMiniGamesModel.isLight = true
                                        zeusMiniGamesModel.startTimer()
                                    } else {
                                        zeusMiniGamesModel.isPuzzle = true
                                        zeusMiniGamesModel.startTimer()
                                    }
                                }
                                .offset(y: 70)
                            }
                            
                        }
                        .offset(y: -10)
                        
                        Spacer()
                        
                        VStack {
                            Text(zeusMiniGamesModel.currentIndex == 0 ? "1\\2" : "2\\2")
                                .SkrampCyr(size: 20)
                               
                            
                            Text("SWIPE left\\right TO next\\prev GAME")
                                .SkrampCyr(size: 20)
                        }
                        .offset(y: -5)
                        .padding(.top)
                    }
                }
                .gesture(
                    DragGesture(minimumDistance: 0.0)
                        .onChanged({ value in
                            self.zeusMiniGamesModel.offset = value.translation
                        })
                        .onEnded({ value in
                            if abs(value.translation.width) > abs(value.translation.height) {
                                if value.translation.width < -50 {
                                    if zeusMiniGamesModel.currentIndex != 0 {
                                        zeusMiniGamesModel.currentIndex -= 1
                                    }
                                } else if value.translation.width > 50 {
                                    if zeusMiniGamesModel.currentIndex != 1 {
                                        zeusMiniGamesModel.currentIndex += 1
                                    }
                                }
                            }
                            self.zeusMiniGamesModel.offset = CGSize.zero
                        })
                )
                
                NavigationLink(destination: ZeusCatchLightView(),
                               isActive: $zeusMiniGamesModel.isLight) {}
                .hidden()
                
                NavigationLink(destination: ZeusPuzzleView(),
                               isActive: $zeusMiniGamesModel.isPuzzle) {}
                .hidden()
                
                .onAppear(perform: zeusMiniGamesModel.loadTimer)
                .onDisappear(perform: zeusMiniGamesModel.saveTimer)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ZeusMiniGamesView()
}

