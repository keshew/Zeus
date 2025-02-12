import SwiftUI

struct ZeusLoadingView: View {
    @StateObject var zeusLoadingModel =  ZeusLoadingViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @ObservedObject var audioManager = AudioManager.shared
    
    var body: some View {
        NavigationView {
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
                            .position(x: geometry.size.width / 1.2, y: geometry.size.height / 1.4)
                        
                        if zeusLoadingModel.isHistoryVisible {
                            Image(.prehistory)
                                .resizable()
                                .frame(width: geometry.size.width * 0.637,
                                       height: geometry.size.height * 0.33)
                                .position(x: geometry.size.width / 2, y: geometry.size.height / 5)
                                .opacity(zeusLoadingModel.isHistoryVisible ? 1 : 0)
                                .scaleEffect(zeusLoadingModel.isHistoryVisible ? 1 : 0.5)
                        }
                        
                        VStack {
                            Spacer()
                            
                            VStack {
                                Text("LOADING")
                                    .YestGradient(size: 30, colors: [Color(red: 184/255, green: 136/255, blue: 0/255),
                                                                     Color(red: 250/255, green: 183/255, blue: 0/255)])
                                
                                ZStack {
                                    Rectangle()
                                        .fill(.black)
                                        .frame(width: geometry.size.width * 0.427,
                                               height: geometry.size.height * 0.081)
                                        .cornerRadius(32)
                                        .shadow(color: Color(red: 128/255, green: 80/255, blue: 13/255), radius: 10, y: 5)
                                    
                                    Rectangle()
                                        .fill(Color(red: 255/255, green: 172/255, blue: 91/255))
                                        .frame(width: geometry.size.width *  zeusLoadingModel.contact.arraySize[zeusLoadingModel.currentIndex], height: 18)
                                        .cornerRadius(32)
                                        .offset(x: geometry.size.width *  zeusLoadingModel.contact.arrayOffset[zeusLoadingModel.currentIndex])
                                    
                                }
                                .onAppear {
                                    audioManager.playMenuMusic()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        zeusLoadingModel.currentIndex += 1
                                            withAnimation {
                                                zeusLoadingModel.isHistoryVisible = true
                                            }
                                    }
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        zeusLoadingModel.currentIndex += 1
                                        if UserDefaultsManager().firstLaunch() {
                                            zeusLoadingModel.isLink = true
                                        } else {
                                            zeusLoadingModel.isMenu = true
                                        }
                                    }
                                }
                                
                                NavigationLink(destination: ZeusPrehistoryView(),
                                               isActive: $zeusLoadingModel.isLink) {}
                                .hidden()
                                
                                NavigationLink(destination: ZeusMenuView(),
                                               isActive: $zeusLoadingModel.isMenu) {}
                                .hidden()
                            }
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ZeusLoadingView()
}

