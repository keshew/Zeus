import SwiftUI

struct ZeusNovelView: View {
    @StateObject var zeusNovelModel =  ZeusNovelViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
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
                        .frame(width: 390, height: 300)
                        .scaleEffect(x: -1)
                        .position(x: geometry.size.width / 16, y: geometry.size.height / 1.5)
                    
                    VStack {
                        HStack {
                            NavigationLink(destination: ZeusPauseView()) {
                                Image(.pause)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                            
                            Spacer()
                            
                            Image(zeusNovelModel.currentIndex >= 6 ? ZeusImageName.finalChooseLabel.rawValue : chapterModel.chapterImage)
                                .resizable()
                                .frame(width: zeusNovelModel.currentIndex >= 6 ? 456 : 352, height: 92)
                                .padding(.trailing, zeusNovelModel.currentIndex >= 6 ? 60 : 90)
                            
                            Spacer()
                        }
                        
                        HStack(spacing: 50) {
                            Statements(image: ZeusImageName.intuition.rawValue,
                                       backImage: ZeusImageName.intuitionBack.rawValue,
                                       text: "INTUITION: \(UserDefaultsManager.defaults.object(forKey: Keys.intuition.rawValue) as? Int ?? 1)")
                            
                            Statements(image: ZeusImageName.kidness.rawValue,
                                       backImage: ZeusImageName.kidnessBack.rawValue,
                                       text: "KINDNESS: \(UserDefaultsManager.defaults.object(forKey: Keys.kindness.rawValue) as? Int ?? 1)")
                            
                            Statements(image: ZeusImageName.knowledge.rawValue,
                                       backImage: ZeusImageName.knowledgeBack.rawValue,
                                       text: "KNOWLEDGE: \(UserDefaultsManager.defaults.object(forKey: Keys.knowledge.rawValue) as? Int ?? 1)")
                        }
                        
                        HStack {
                            ZStack {
                                Image(.questionBack1)
                                    .resizable()
                                    .frame(width: 352, height: 150)
                                
                                Text(chapterModel.question[zeusNovelModel.currentIndex])
                                    .SkrampCyr(size: 20)
                                    .frame(width: 280, height: 100)
                            }
                            .padding(.leading, 150)
                        }
                        
                        HStack {
                            Spacer()
                            
                            AnswerButton(text: chapterModel.answers[zeusNovelModel.currentIndex].answer1) {
                                zeusNovelModel.isFinalLeading()
                                zeusNovelModel.newFactWhile()
                            }
                            
                            AnswerButton(text: chapterModel.answers[zeusNovelModel.currentIndex].answer2) {
                                zeusNovelModel.isFinalMid()
                                zeusNovelModel.newFactWhile()
                            }
                            
                            AnswerButton(text: chapterModel.answers[zeusNovelModel.currentIndex].answer3) {
                                zeusNovelModel.isFinalTrailing()
                                zeusNovelModel.newFactWhile()
                            }
                        }
                        .padding(.trailing, 50)
                    }
                    
                    if zeusNovelModel.isLeftVisible {
                        BonusAdd(image: ZeusImageName.kidness.rawValue,
                                 positionX: 3.5,
                                 geometry: geometry)
                    }
                    
                    if zeusNovelModel.isMiddleVisible {
                        BonusAdd(image: ZeusImageName.intuition.rawValue,
                                 positionX: 1.7,
                                 geometry: geometry)
                    }
                    
                    if zeusNovelModel.isRightVisible {
                        BonusAdd(image: ZeusImageName.knowledge.rawValue,
                                 positionX: 1.2,
                                 geometry: geometry)
                    }
                    
                    if zeusNovelModel.isFact {
                        NewFact(offset: $zeusNovelModel.offset, geometry: geometry)
                    }
                }
                
                NavigationLink(destination: ZeusFinalView(text: chapterModel.finalText[0], backgroundImage: chapterModel.finalImages[0]),
                               isActive: $zeusNovelModel.isFinalLeft) {}
                    .hidden()
                
                NavigationLink(destination: ZeusFinalView(text: chapterModel.finalText[1], backgroundImage: chapterModel.finalImages[1]),
                               isActive: $zeusNovelModel.isFinalMiddle) {}
                    .hidden()
                
                NavigationLink(destination: ZeusFinalView(text: chapterModel.finalText[2], backgroundImage: chapterModel.finalImages[2]),
                               isActive: $zeusNovelModel.isFinalRight) {}
                    .hidden()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let chapterModel =  ChapterModel(backgroundImage: ZeusImageName.stage3Back.rawValue,
                                     chapterImage: ZeusImageName.chapterLabel3.rawValue,
                                     text: "I have noticed that Olympus lacks joy and harmony. Athena suggests starting with solving a small problem. I decide to visit the mortals to find out what troubles them. Understanding the problems and needs of humans will help find ways to support them and restore harmony on Olympus.",
                                     enemyImage: ZeusImageName.chapter3.rawValue,
                                     loadingImage: ZeusImageName.chapter3end.rawValue,
                                     answers: [Answer(answer1: "Organize a grand festival with music, dance, and theatrical performances.",
                                                      answer2: "Build a new temple in honor of the gods so that people can pray and find solace.",
                                                      answer3: "Hold sporting competitions so that people can have fun and showcase their skills."),
                                               Answer(answer1: "Seek Demeter's help in restoring the harvest and ensuring abundance.",
                                                      answer2: "Organize trade fairs so that people can exchange goods and resources.",
                                                      answer3: "Create systems for storing and distributing food to ensure everyone is provided for."),
                                               Answer(answer1: "Seek Zeus's help in establishing fair laws and order.",
                                                      answer2: "Appoint wise and just judges to resolve disputes and conflicts.",
                                                      answer3: "Create a system of punishments and rewards to maintain order and justice."),
                                               Answer(answer1: "Seek Athena's help in creating schools and educational institutions..",
                                                      answer2: "Invite wise men and teachers to educate people in various sciences and arts.",
                                                      answer3: "Create libraries and archives so that people can access knowledge and information."),
                                               Answer(answer1: "Seek Asclepius's help in creating medical institutions and clinics.",
                                                      answer2: "Invite doctors and healers to treat the sick and injured.",
                                                      answer3: "Create systems for training and preparing new doctors and healers."),
                                               Answer(answer1: "Seek Ares's help in creating an army and security forces.",
                                                      answer2: "Appoint brave and experienced warriors to protect cities and settlements.",
                                                      answer3: "Create systems for training and preparing new warriors and defenders."),
                                               Answer(answer1: "Establish a council of wise elders to guide the people and maintain harmony.",
                                                      answer2: "Create a network of community centers where people can gather, learn, and support each other.",
                                                      answer3: "Found a new cult dedicated to the worship of the gods to ensure their continued blessings and protection."),
                                               Answer(answer1: "Establish a council of wise elders to guide the people and maintain harmony.",
                                                      answer2: "Create a network of community centers where people can gather, learn, and support each other.",
                                                      answer3: "Found a new cult dedicated to the worship of the gods to ensure their continued blessings and protection.")],
                                     question: ["The mortals complain about the lack of festivals and entertainment.",
                                                "The mortals complain about the\n lack of food and resources.",
                                                "The mortals complain about the lack of justice and order.",
                                                "The mortals complain about the lack of knowledge and education.",
                                                "The mortals complain about the lack of medical care and treatment.",
                                                "The mortals complain about the lack of safety and protection." ,
                                                "The mortals are grateful for your help and offer you a choice to further support them:",
                                                "The mortals are grateful for your help and offer you a choice to further support them:"],
                                     finalImages: [ZeusImageName.stage3left.rawValue, ZeusImageName.stage3middle.rawValue, ZeusImageName.stage3right.rawValue],
                                     finalText: ["After the successful completion of the trials, Olympus is reborn in new splendor. The gods and mortals work together to restore and improve the sacred place. Zeus is pleased with the results and promises that Olympus will continue to prosper under his guidance.",
                                                 "The rebirth of Olympus begins, but not everyone agrees with the changes. Some gods and mortals believe that traditions should be preserved. Zeus organizes discussions and votes to find a compromise and satisfy all participants.",
                                                 "The rebirth of Olympus is successful, but new threats are revealed that could jeopardize what has been achieved. Zeus decides to create a special group of defenders of Olympus who will ensure the safety and prosperity of the sacred place"])
    return ZeusNovelView(chapterModel: chapterModel)
}

