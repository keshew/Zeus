import SwiftUI

struct ZeusChapterView: View {
    @StateObject var zeusChapterModel =  ZeusChapterViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(.chooseChapterBack)
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image(.zeus)
                        .resizable()
                        .frame(width: geometry.size.width * 0.57,
                               height: geometry.size.height * 0.845)
                        .scaleEffect(x: -1)
                        .position(x: geometry.size.width / 16, y: geometry.size.height / 1.5)
                    
                    Image(zeusChapterModel.contact.arrayImage[zeusChapterModel.currentIndex])
                        .resizable()
                        .frame(width: zeusChapterModel.contact.widthSize[zeusChapterModel.currentIndex],
                               height: 307)
                        .position(x: geometry.size.width / 1.11, y: geometry.size.height / 1.5)
                    
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
                            
                            Image(.chooseChapterLabel)
                                .resizable()
                                .frame(width: 422, height: 89)
                            
                            Spacer()
                        }
                        .padding(.trailing, 55)
                        
                        Text(zeusChapterModel.contact.arrayText[zeusChapterModel.currentIndex])
                            .Cartoon(size: 30)
                            .multilineTextAlignment(.center)
                        
                        VStack(spacing: 20) {
                            switch zeusChapterModel.currentIndex {
                            case 0:
                                NavigationLink(destination: ZeusPlayView(chapterModel: zeusChapterModel.contact.stageModel[0])) {
                                    SimpleView(text: "NEW", sizeW: 171, sizeH: 75)
                                }
                                
                            case 1:
                                NavigationLink(destination: ZeusPlayView(chapterModel: zeusChapterModel.contact.stageModel[1])) {
                                    SimpleView(text: "NEW", sizeW: 171, sizeH: 75)
                                }
                                
                            case 2:
                                NavigationLink(destination: ZeusPlayView(chapterModel: zeusChapterModel.contact.stageModel[2])) {
                                    SimpleView(text: "NEW", sizeW: 171, sizeH: 75)
                                }
                            default:
                                NavigationLink(destination: ZeusPlayView(chapterModel: zeusChapterModel.contact.stageModel[0])) {
                                    SimpleView(text: "NEW", sizeW: 171, sizeH: 75)
                                }
                            }
                            
                            HStack {
                                CircleButton {
                                    zeusChapterModel.currentIndex -= 1
                                }
                                .disabled(zeusChapterModel.currentIndex == 0 ? true : false)
                                .opacity(zeusChapterModel.currentIndex == 0 ? 0.5 : 1)
                                
                                SimpleButton(text: "CONTINUE", sizeW: 195, sizeH: 75) {
                                    
                                }
                                .opacity(0.5)
                                .disabled(true)
                                
                                CircleButton(image: ZeusImageName.nextBtn.rawValue) {
                                    zeusChapterModel.currentIndex += 1
                                }
                                .disabled(zeusChapterModel.currentIndex == 2 ? true : false)
                                .opacity(zeusChapterModel.currentIndex == 2 ? 0.5 : 1)
                            }
                        }
                    }
                }
                .blur(radius: zeusChapterModel.currentIndex >= (UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 1) ? 3 : 0)
                
                if zeusChapterModel.currentIndex >= UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 1 {
                    ZStack {
                        Color.black
                            .ignoresSafeArea()
                            .opacity(0.7)
                        
                        VStack(spacing: 60) {
                            HStack {
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Image(.backBtn)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }
                                
                                Spacer()
                                
                                Image(.chooseChapterLabel)
                                    .resizable()
                                    .frame(width: 422, height: 89)
                                
                                Spacer()
                            }
                            .padding(.trailing, 55)
                            
                            Text("LOCKED")
                                .Cartoon(size: 80, color: .yellow)
                            
                            
                            HStack {
                                CircleButton {
                                    zeusChapterModel.currentIndex -= 1
                                }
                                .disabled(zeusChapterModel.currentIndex == 0 ? true : false)
                                .opacity(zeusChapterModel.currentIndex == 0 ? 0.5 : 1)
                                
                                SimpleButton(text: "CONTINUE", sizeW: 195, sizeH: 75) {
                                    
                                }
                                .opacity(0)
                                .disabled(true)
                                
                                CircleButton(image: ZeusImageName.nextBtn.rawValue) {
                                    zeusChapterModel.currentIndex += 1
                                }
                                .disabled(zeusChapterModel.currentIndex == 2 ? true : false)
                                .opacity(zeusChapterModel.currentIndex == 2 ? 0.5 : 1)
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
    ZeusChapterView()
}

