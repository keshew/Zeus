import SwiftUI

struct ZeusFinalView: View {
    @StateObject var zeusFinalModel =  ZeusFinalViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @ObservedObject var audioManager = AudioManager.shared
    @State var isShow = false
    var text: String
    var backgroundImage: String
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    FinalPreview(image: backgroundImage)
                    
                    if isShow {
                        Color(.black)
                            .ignoresSafeArea()
                            .opacity(0.5)
                        
                        Image(.zeus)
                            .resizable()
                            .frame(width: 390, height: 300)
                            .scaleEffect(x: -1)
                            .position(x: geometry.size.width / 16, y: geometry.size.height / 1.5)
                        
                        VStack {
                            Image(.finale)
                                .resizable()
                                .frame(width: 284, height: 85)
                                .padding(.top)
                            
                            HStack {
                                Spacer()
                                
                                TextBack(text: text) {
                                    zeusFinalModel.isEnd = true
                                    UserDefaultsManager().increaseLevel()
                                }
                            }
                            .padding(.trailing)
                            
                            Spacer()
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            isShow = true
                        }
                    }
                }
                
                .onDisappear() {
                    audioManager.stopFirstMusic()
                    audioManager.stopSecondMusic()
                    audioManager.stopThirdMusic()
                    
                    audioManager.playMenuMusic()
                }
                
                NavigationLink(destination: ZeusMenuView(),
                               isActive: $zeusFinalModel.isEnd) {}
                .hidden()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let text = "blablablablalbalblablablablalbalblablablablalbalblablablablalbal"
    let image = ZeusImageName.stage1left.rawValue
    return ZeusFinalView(text: text, backgroundImage: image)
}


