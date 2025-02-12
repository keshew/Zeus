import SwiftUI

struct ZeusTrophyView: View {
    @StateObject var zeusTrophyModel =  ZeusTrophyViewModel()
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
                        .frame(width: geometry.size.width * 0.57,
                               height: geometry.size.height * 0.845)
                        .position(x: geometry.size.width / 1.22, y: geometry.size.height / 1.5)
                    
                    LazyVGrid(columns: zeusTrophyModel.columns, spacing: 10) {
                        ForEach(zeusTrophyModel.currentIndex..<zeusTrophyModel.currentIndex + 6, id: \.self) { index in
                            HStack {
                                Trophy(name: zeusTrophyModel.contact.arrayOfTrophy[index].name,
                                       desc: zeusTrophyModel.contact.arrayOfTrophy[index].desc,
                                       geometry: geometry)
                                .offset(y: -10)
                                Spacer()
                            }
                        }
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.8)
                    
                    VStack(spacing: 5) {
                        Text(zeusTrophyModel.currentIndex == 0 ? "1\\2" : "2\\2")
                            .Cartoon(size: 20)
                        
                        
                        Text(zeusTrophyModel.currentIndex == 0 ? "SWIPE RIGHT TO NEXT PAGE" : "SWIPE LEFT TO PREV PAGE")
                            .Cartoon(size: 20)
                    }
                    .position(x: geometry.size.width / 3.15, y: geometry.size.height / 1.05)
                    
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
                            
                            Image(.trophy)
                                .resizable()
                                .frame(width: geometry.size.width * 0.47,
                                       height: geometry.size.height * 0.27)
                                .padding(.trailing, 70)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                }
                .gesture(
                    DragGesture(minimumDistance: 0.0)
                        .onChanged({ value in
                            self.zeusTrophyModel.offset = value.translation
                        })
                        .onEnded({ value in
                            if abs(value.translation.width) > abs(value.translation.height) {
                                if value.translation.width < -50 {
                                    if zeusTrophyModel.currentIndex != 0 {
                                        zeusTrophyModel.currentIndex -= 6
                                    }
                                } else if value.translation.width > 50 {
                                    if zeusTrophyModel.currentIndex != 6 {
                                        zeusTrophyModel.currentIndex += 6
                                    }
                                }
                            }
                            self.zeusTrophyModel.offset = CGSize.zero
                        })
                )
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ZeusTrophyView()
}

