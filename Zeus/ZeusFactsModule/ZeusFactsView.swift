import SwiftUI

struct ZeusFactsView: View {
    @StateObject var zeusFactsModel =  ZeusFactsViewModel()
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
                    
                    VStack(spacing: 30) {
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
                        
                        HStack(spacing: 50) {
                            Spacer()
                            ForEach(zeusFactsModel.currentIndex..<zeusFactsModel.currentIndex + 3, id: \.self) { index in
                                if UserDefaultsManager.defaults.object(forKey: Keys.facts.rawValue) as? Int ?? 0 <= index {
                                    Image(.closed)
                                        .resizable()
                                        .frame(width: 146, height: 64)
                                } else {
                                    SimpleButton(text: "FACT \(index + 1)") {
                                        zeusFactsModel.isFact = true
                                        zeusFactsModel.factCount = index
                                    }
                                }
                            }
                        }
                        .padding(.trailing)
                        
                        HStack(spacing: 50) {
                            Spacer()
                            ForEach((zeusFactsModel.currentIndex + 3)..<zeusFactsModel.currentIndex + 5, id: \.self) { index in
                                if UserDefaultsManager.defaults.object(forKey: Keys.facts.rawValue) as? Int ?? 0 <= index {
                                    Image(.closed)
                                        .resizable()
                                        .frame(width: 146, height: 64)
                                } else {
                                    SimpleButton(text: "FACT \(index + 1)") {
                                        zeusFactsModel.isFact = true
                                        zeusFactsModel.factCount = index
                                    }
                                }
                            }
                        }
                        .padding(.trailing, 120)
                        
                        HStack {
                            Spacer()
                            VStack {
                                Text(zeusFactsModel.currentIndex == 0 ? "1\\2" : "2\\2")
                                    .SkrampCyr(size: 20)
                                
                                Text(zeusFactsModel.currentIndex == 0 ? "SWIPE RIGHT TO NEXT PAGE" : "SWIPE LEFT TO PREV PAGE")
                                    .SkrampCyr(size: 20)
                            }
                            .padding(.top)
                        }
                        .padding(.trailing, 190)
                    }
                }
                .gesture(
                    DragGesture(minimumDistance: 0.0)
                        .onChanged({ value in
                            self.zeusFactsModel.offset = value.translation
                        })
                        .onEnded({ value in
                            if abs(value.translation.width) > abs(value.translation.height) {
                                if value.translation.width < -50 {
                                    if zeusFactsModel.currentIndex != 0 {
                                        zeusFactsModel.currentIndex -= 5
                                    }
                                } else if value.translation.width > 50 {
                                    if zeusFactsModel.currentIndex != 5 {
                                        zeusFactsModel.currentIndex += 5
                                    }
                                }
                            }
                            self.zeusFactsModel.offset = CGSize.zero
                        })
                )
                
                NavigationLink(destination: ZeusFactsDetailView(currentIndex: $zeusFactsModel.factCount),
                               isActive: $zeusFactsModel.isFact) {}
                .hidden()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ZeusFactsView()
}

