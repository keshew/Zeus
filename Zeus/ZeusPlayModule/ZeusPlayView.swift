import SwiftUI

struct ZeusPlayView: View {
    @StateObject var zeusPlayModel =  ZeusPlayViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @ObservedObject var audioManager = AudioManager.shared
    var chapterModel: ChapterModel
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(chapterModel.backgroundImage)
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image(.zeus)
                        .resizable()
                        .frame(width: geometry.size.width * 0.57,
                               height: geometry.size.height * 0.845)
                        .scaleEffect(x: -1)
                        .position(x: geometry.size.width / 16, y: geometry.size.height / 1.5)
                    
                    Image(chapterModel.enemyImage)
                        .resizable()
                        .frame(width: 310,
                               height: 307)
                        .position(zeusPlayModel.isTapped ? CGPoint(x: geometry.size.width / 1.11, y: geometry.size.height / 1.5) : CGPoint(x: geometry.size.width / 0.7, y: geometry.size.height / 1.5))
                    
                    VStack {
                        Image(chapterModel.chapterImage)
                            .resizable()
                            .frame(width: 352, height: 92)
                        
                        HStack {
                            Spacer()
                            
                            TextBack(text: chapterModel.text) {
                                zeusPlayModel.opacity = 0
                                zeusPlayModel.isTapped = true
                                zeusPlayModel.isEnd = true
                            }
                            .opacity(zeusPlayModel.opacity)
                        }
                        .padding(.trailing)
                    }
                    
                    if zeusPlayModel.isEnd  {
                        Color.black
                            .ignoresSafeArea()
                            .opacity(zeusPlayModel.isAnimating ? 1 : 0)
                            .overlay {
                                Image(chapterModel.loadingImage)
                                    .resizable()
                                    .ignoresSafeArea()
                                    .opacity(zeusPlayModel.isDarkened ? 1 : 0)
                            }
                            .onAppear() {
                                withAnimation(.easeInOut(duration: 2.0)) {
                                    zeusPlayModel.isAnimating = true
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                    withAnimation(.easeInOut(duration: 1.5)) {
                                        zeusPlayModel.isDarkened = true
                                        
                                    }
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                    withAnimation(.easeInOut(duration: 2)) {
                                        zeusPlayModel.isDarkened = false
                                        zeusPlayModel.isNovel = true
                                    }
                                }
                            }
                        
                        NavigationLink(destination: ZeusNovelView(chapterModel: chapterModel),
                                       isActive: $zeusPlayModel.isNovel) {}
                        .hidden()
                        
                        .onAppear {
                            audioManager.stopMenuMusic()
                            
                            if chapterModel.enemyImage == "chapter1" {
                                audioManager.playFirstMusic()
                            } else if chapterModel.enemyImage == "chapter2" {
                                audioManager.playSecondMusic()
                            } else {
                                audioManager.playThirdMusic()
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
   let chapterModel = ChapterModel(backgroundImage: ZeusImageName.chooseChapterBack.rawValue,
                                   chapterImage: ZeusImageName.chapterLabel1.rawValue,
                                   text: "I have noticed that Olympus lacks joy and harmony. Athena suggests starting with solving a small problem. I decide to go to Apollo to discuss how to return inspiration to humans. Apollo, the god of arts and prophecies, can help find a way to inspire mortals and bring joy back to their lives.",
                                   enemyImage: ZeusImageName.chapter1.rawValue,
                                   loadingImage: ZeusImageName.chapter1end.rawValue,
                                   answers: [Answer(answer1: "", answer2: "", answer3: "")],
                                   question: [""],
                                   finalImages: [""],
                                   finalText: [""])
    return ZeusPlayView(chapterModel: chapterModel)
}

