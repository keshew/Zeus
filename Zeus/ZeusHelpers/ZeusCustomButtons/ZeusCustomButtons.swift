import SwiftUI

struct Statements: View {
    var image: String
    var backImage: String
    var text: String
    var body: some View {
        ZStack {
            Image(backImage)
                .resizable()
                .frame(width: 140, height: 45)
            
            Image(image)
                .resizable()
                .frame(width: 53, height: 53)
                .offset(x: -75)
            
            Text(text)
                .Yeast(size: 14, outlineWidth: 0.8)
                .offset(x: 5, y: -2)
        }
    }
}

struct SimpleButton: View {
    var text: String
    var fontSize: CGFloat = 30
    var sizeW: CGFloat = 146
    var sizeH: CGFloat = 64
    var action: (() -> ())
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.buttonOrangeBack)
                    .resizable()
                    .frame(width: sizeW, height: sizeH)
                    .cornerRadius(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.black, lineWidth: 2)
                    )
                
                Text(text)
                    .Yeast(size: fontSize)
            }
        }
    }
}

struct SimpleView: View {
    var text: String
    var image = ZeusImageName.buttonOrangeBack.rawValue
    var fontSize: CGFloat = 30
    var sizeW: CGFloat = 146
    var sizeH: CGFloat = 64
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .frame(width: sizeW, height: sizeH)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.black, lineWidth: 2)
                )
            
            Text(text)
                .Yeast(size: fontSize)
        }
    }
}

struct Trophy: View {
    var name: String
    var desc: String
    var geometry: GeometryProxy
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.yellow)
                .frame(width: geometry.size.width * 0.164, height: geometry.size.height * 0.216)
            
            Image(.border)
                .resizable()
                .frame(width: geometry.size.width * 0.191, height: geometry.size.height * 0.298)
            
            VStack {
                Text(name)
                    .Cartoon(size: 9, outlineWidth: 0.5)
                
                HStack(spacing: 0) {
                    Image(.circleBrown)
                        .resizable()
                        .frame(width: 25, height: 25)
                    
                    Text(desc)
                        .Cartoon(size: 6, outlineWidth: 0.5)
                        .multilineTextAlignment(.center)
                        .frame(width: 80, height: 24)
                }
            }
        }
    }
}

struct CircleButton: View {
    var image: String = ZeusImageName.backBtnBlack.rawValue
    var size: CGFloat = 54
    var action: (() -> ())
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(image)
                .resizable()
                .frame(width: size, height: size)
        }
    }
}

struct TextBack: View {
    var text: String
    var action: (() -> ())
    var body: some View {
        ZStack {
            Image(.textPrehistory)
                .resizable()
                .frame(width: 482, height: 221)
            
            Text(text)
                .Cartoon(size: 20, outlineWidth: 0.3)
                .multilineTextAlignment(.center)
                .frame(width: 440)
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    action()
                }
            }) {
                Image(.nextBtn)
                    .resizable()
                    .frame(width: 61, height: 61)
                
            }
            .offset(y: 110)
        }
    }
}

struct AnswerButton: View {
    var text: String
    var action: (() -> ())
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.answerBack)
                    .resizable()
                    .frame(width: 161, height: 66)
                
                Text(text)
                    .Cartoon(size: 11, outlineWidth: 0.3)
                    .frame(width: 140, height: 44)
                    .minimumScaleFactor(0.8)
            }
        }
    }
}

struct FinalPreview: View {
    var image: String
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .ignoresSafeArea()
        }
    }
}

struct BonusAdd: View {
    var image: String
    var positionX: CGFloat
    var geometry: GeometryProxy
    var body: some View {
        ZStack {
            HStack(spacing: 5) {
                Text("+1")
                    .Cartoon(size: 20)
                    .offset(y: 2)
                
                Image(image)
                    .resizable()
                    .frame(width: 32, height: 32)
            }
        }
        .position(x: geometry.size.width / positionX, y: geometry.size.height / 1.3)
    }
}

struct NewFact: View {
    @Binding var offset: CGFloat
    var geometry: GeometryProxy
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.yellow)
                .frame(width: 120, height: 80)
            
            Image(.border)
                .resizable()
                .frame(width: 145, height: 110)
            
            VStack {
                Text("NEW FACT\nUNLOCKED!")
                    .Cartoon(size: 15, outlineWidth: 0.7)
                    .multilineTextAlignment(.center)
                    .offset(y: 5)
            }
        }
        .position(CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 5))
        .offset(y: offset)
    }
}
