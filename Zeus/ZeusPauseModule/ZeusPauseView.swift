import SwiftUI

struct ZeusPauseView: View {
    @StateObject var ZeusPauseModel =  ZeusPauseViewModel()
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
                        .frame(width: 390, height: 300)
                        .scaleEffect(x: -1)
                        .position(x: geometry.size.width / 16, y: geometry.size.height / 1.5)
                    
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
                            
                            Image(.pauseLabel)
                                .resizable()
                                .frame(width: 274, height: 100)
                            
                            Spacer()
                        }
                        .padding(.trailing, 55)
                        
                        HStack {
                            Spacer()
                            
                            ZStack {
                                Image(.textPrehistory)
                                    .resizable()
                                    .frame(width: 482, height: 227)
                                
                                Text("As Zeus, the supreme god of Olympus, waits in anticipation, the world around him stands still. Time itself seems to have halted, and even the wind ceases to rustle the leaves. Heroes, poised for battle, remain frozen in their stances, while the gods watching from above hold their breath. Zeus, with a lightning bolt clutched in his hand, surveys the battlefield, awaiting the precise moment to intervene. His eyes, filled with wisdom and power, scrutinize every warrior and every movement. He knows that his decision will shape the destinies of many.")
                                    .Cartoon(size: 15, outlineWidth: 0.3)
                                    .frame(width: 417, height: 219)
                                    .multilineTextAlignment(.center)
                                
                                HStack(spacing: 50) {
                                    NavigationLink(destination: ZeusMenuView()) {
                                        SimpleView(text: "MENU", sizeH: 48)
                                    }
                                    
                                    
                                    SimpleButton(text: "CONTINUE", fontSize: 25, sizeH: 48) {
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                    
                                }
                                .offset(y: 110)
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
    ZeusPauseView()
}

