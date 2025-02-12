import SwiftUI

struct ZeusPrehistoryView: View {
    @StateObject var zeusPrehistoryModel =  ZeusPrehistoryViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
  
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
                        .scaleEffect(x: zeusPrehistoryModel.textIndex <= 1 ? -1 : 1)
                        .position(zeusPrehistoryModel.tapCount <= 1 ? CGPoint(x: geometry.size.width / 5, y: geometry.size.height / 1.4) : CGPoint(x: geometry.size.width / 1.2, y: geometry.size.height / 1.4))
                    
                    Image(.prehistory)
                        .resizable()
                        .frame(width: geometry.size.width * 0.637,
                               height: geometry.size.height * 0.33)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 5)
                    
                    VStack {
                        HStack {
                            if zeusPrehistoryModel.tapCount <= 1 {
                                Spacer()
                            }
                            
                            ZStack {
                               
                                
                                Image(.textPrehistory)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.657,
                                           height: geometry.size.height * 0.595)
                                
                                Text(zeusPrehistoryModel.contact.arrayOfText[zeusPrehistoryModel.textIndex])
                                    .Yeast(size: 20, outlineWidth: 0.3)
                                    .multilineTextAlignment(.center)
                                    .frame(width: geometry.size.width * 0.573)
                                
                                Button(action: {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        zeusPrehistoryModel.increaseTapCount()
                                    }
                                    
                                    zeusPrehistoryModel.increaseTextIndex()
                                    
                                    if zeusPrehistoryModel.tapCount >= 3 {
                                        zeusPrehistoryModel.isEnd = true
                                    }
                                }) {
                                    Image(.nextBtn)
                                        .resizable()
                                        .frame(width: 61, height: 61)
                                    
                                }
                                .offset(y: geometry.size.height * 0.296)
                            }
                            
                            if zeusPrehistoryModel.tapCount >= 2 {
                                Spacer()
                            }
                        }
                        .padding(.trailing)
                        .padding(.top, geometry.size.height * 0.242)
                        
                    }
                    
                    if zeusPrehistoryModel.isEnd  {
                        Image(.endZeus)
                            .resizable()
                            .ignoresSafeArea()
                            .opacity(zeusPrehistoryModel.isAnimating ? 1 : 0)
                            .overlay(Color.black.opacity(zeusPrehistoryModel.isDarkened ? 1 : 0))
                            .onAppear() {
                                withAnimation(.easeInOut(duration: 2.0)) {
                                    zeusPrehistoryModel.isAnimating = true
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                    withAnimation(.easeInOut(duration: 1.5)) {
                                        zeusPrehistoryModel.isDarkened = true
                                        
                                    }
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                    withAnimation(.easeInOut(duration: 1.5)) {
                                        zeusPrehistoryModel.isMenu = true
                                    }
                                }
                            }
                    }
                }
                
                NavigationLink(destination: ZeusMenuView(), isActive: $zeusPrehistoryModel.isMenu) {

                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    ZeusPrehistoryView()
}

