import SwiftUI

struct ZeusFactsDetailView: View {
    @StateObject var zeusFactsDetailModel =  ZeusFactsDetailViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.presentationMode) var presentationMode
    @Binding var currentIndex: Int
    
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
                    
                    VStack(spacing: 0) {
                        HStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(.backBtn)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                            
                            Spacer()
                            
                            Image(.facts)
                                .resizable()
                                .frame(width: 244, height: 92)
                            
                            Spacer()
                        }
                        .padding(.trailing, 55)
                        
                        HStack {
                            Spacer()
                            ZStack {
                                Image(.textPrehistory)
                                    .resizable()
                                    .frame(width: 482, height: 221)
                                
                                VStack {
                                    Text("Fact \(currentIndex + 1)")
                                        .Cartoon(size: 30)
                                        .multilineTextAlignment(.center)
                                    
                                    Text(zeusFactsDetailModel.contact.factsArry[currentIndex])
                                        .Cartoon(size: 20)
                                        .frame(width: 418, height: 114)
                                    
                                }
                            }
                        }
                        
                        HStack {
                            Spacer()
                            VStack {
                                Text("\(currentIndex + 1)\\10")
                                    .Cartoon(size: 20)
                                
                                Text("SWIPE left\\right TO next\\prev FACT")
                                    .Cartoon(size: 20)
                            }
                            .padding(.top)
                        }
                        .padding(.trailing, 90)
                    }
                }
                .gesture(
                    DragGesture(minimumDistance: 0.0)
                        .onChanged({ value in
                            self.zeusFactsDetailModel.offset = value.translation
                        })
                        .onEnded({ value in
                            if abs(value.translation.width) > abs(value.translation.height) {
                                if value.translation.width < -50 {
                                    if currentIndex != 0 {
                                        currentIndex -= 1
                                    }
                                } else if value.translation.width > 50 {
                                    if currentIndex != ((UserDefaultsManager.defaults.object(forKey: Keys.facts.rawValue) as? Int ?? 0) - 1) {
                                        currentIndex += 1
                                    }
                                }
                            }
                            self.zeusFactsDetailModel.offset = CGSize.zero
                        })
                )
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @State var index = 3
    return ZeusFactsDetailView(currentIndex: $index)
}

