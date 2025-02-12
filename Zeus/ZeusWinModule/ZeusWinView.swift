import SwiftUI

struct ZeusWinView: View {
    @StateObject var zeusWinModel =  ZeusWinViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Color(.black)
                        .opacity(0.5)
                        .ignoresSafeArea()
                    
                    Image(.zeus)
                        .resizable()
                        .frame(width: 390, height: 300)
                        .scaleEffect(x: -1)
                        .position(x: geometry.size.width / 16, y: geometry.size.height / 1.5)
                    
                    VStack {
                        HStack {
                            Button(action: {
                                zeusWinModel.isMenu = true
                            }) {
                                Image(.backBtn)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                            
                            Spacer()
                            
                            Image(.victory)
                                .resizable()
                                .frame(width: 290, height: 86)
                            
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
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            ZStack {
                                Image(.textPrehistory)
                                    .resizable()
                                    .frame(width: 375, height: 172)
                                
                                VStack(spacing: -50) {
                                    VStack(spacing: -35) {
                                        Text("CONGRATULATION!")
                                            .Cartoon(size: 30)
                                        
                                        Text("You did a great job and here's your\nreward.")
                                            .Cartoon(size: 20)
                                            .frame(width: 418, height: 114)
                                            .multilineTextAlignment(.center)
                                    }.offset(y: -20)
                                    
                                    Statements(image: ZeusImageName.knowledge.rawValue,
                                               backImage: ZeusImageName.knowledgeBack.rawValue,
                                               text: "KNOWLEDGE: +1")
                                }
                                .offset(y: 5)
                                
                                Button(action: {
                                    zeusWinModel.isMenu = true
                                }) {
                                    Image(.nextBtn)
                                        .resizable()
                                        .frame(width: 61, height: 61)
                                    
                                }
                                .offset(y: 90)
                            }
                        }
                        
                        Spacer()
                    }
                }
                NavigationLink(destination: ZeusMenuView(),
                               isActive: $zeusWinModel.isMenu) {}
                .hidden()
            }
        }
    }
}

#Preview {
    ZeusWinView()
}

