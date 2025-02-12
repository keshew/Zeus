import SwiftUI

struct ChapterModel {
    var backgroundImage: String
    var chapterImage: String
    var text: String
    var enemyImage: String
    var loadingImage: String
    var answers: [Answer]
    var question: [String]
    var finalImages: [String]
    var finalText: [String]
}

struct Answer {
    var answer1: String
    var answer2: String
    var answer3: String
}

struct Choice {
    var text: String
    var image: String
}

struct ZeusChapterModel {
    let arrayImage = [ZeusImageName.chapter1.rawValue, ZeusImageName.chapter2.rawValue, ZeusImageName.chapter3.rawValue]
    let arrayText = ["Chapter 1:\nThe return of joy and\n harmony to Olympus",
                     "Chapter 2:\nFood is life for everyone, even\n for the gods",
                     "Chapter 3:\n Am I a god for people or for\n other gods?"]
    let widthSize: [CGFloat] = [319, 279, 319]
    
    var stageModel = [ChapterModel(backgroundImage: ZeusImageName.chooseChapterBack.rawValue,
                                   chapterImage: ZeusImageName.chapterLabel1.rawValue,
                                   text: "I have noticed that Olympus lacks joy and harmony. Athena suggests starting with solving a small problem. I decide to go to Apollo to discuss how to return inspiration to humans. Apollo, the god of arts and prophecies, can help find a way to inspire mortals and bring joy back to their lives.",
                                   enemyImage: ZeusImageName.chapter1.rawValue,
                                   loadingImage: ZeusImageName.chapter1end.rawValue,
                                   answers: [Answer(answer1: "Ask Athena for a hint to solve the riddle.",
                                                    answer2: "Try to solve the riddle on\n your own using intuition.",
                                                    answer3: "Seek the muses for inspiration and help in solving the riddle."),
                                             Answer(answer1: "Explore sacred groves and temples to find the artifact.",
                                                    answer2: "Consult the oracle at Delphi for a clue on where to find the artifact.",
                                                    answer3: "Ask Hermes for help, using his cunning and resourcefulness to find the artifact."),
                                             Answer(answer1: "Invite the best musicians and poets from all over Greece.",
                                                    answer2: "Organize competitions among musicians to find the most talented.",
                                                    answer3: "Hold the festival in sacred places to give it special significance."),
                                             Answer(answer1: "Seek the muses for inspiration and help in creating the melody.",
                                                    answer2: "Research ancient texts and legends to find inspiration for the melody.",
                                                    answer3: "Invite talented musicians to help create the melody."),
                                             Answer(answer1: "Seek the muses for inspiration and help in creating the myth.",
                                                    answer2: "Research ancient legends and stories to find inspiration for the new myth.",
                                                    answer3: "Invite talented poets and writers to help create the myth."),
                                             Answer(answer1: "Seek the muses for inspiration and help in creating the artwork.",
                                                    answer2: "Research ancient artworks to find inspiration for the new creation.",
                                                    answer3: "Invite talented artists and sculptors to help create the artwork."),
                                             Answer(answer1: "Seek the muses for inspiration and help in creating the artwork.",
                                                    answer2: "Research ancient artworks to find inspiration for the new creation.",
                                                    answer3: "Invite talented artists and sculptors to help create the artwork."),
                                             Answer(answer1: "Seek the muses for inspiration and help in creating the artwork.",
                                                    answer2: "Research ancient artworks to find inspiration for the new creation.",
                                                    answer3: "Invite talented artists and sculptors to help create the artwork.")],
                                   question: ["Apollo asks you to solve a riddle to test your wisdom.",
                                              "Apollo asks you to find a hidden artifact that will help return inspiration to humans.",
                                              "Apollo suggests organizing a music festival to inspire people.",
                                              "Apollo asks for your help in creating a new melody that will inspire people.",
                                              "Apollo suggests creating a new myth that will inspire people.",
                                              "Apollo asks for your help in creating a new work of art that will inspire people." ,
                                              "Apollo is pleased with your efforts and offers you a choice to further inspire humanity:",
                                              "Apollo is pleased with your efforts and offers you a choice to further inspire humanity:"],
                                   finalImages: [ZeusImageName.stage1left.rawValue, ZeusImageName.stage1middle.rawValue, ZeusImageName.stage1right.rawValue],
                                   finalText: ["After the successful completion of the trials, the gods and mortals celebrate together on Olympus. Harmony and unity are restored, and all inhabitants of the world live in peace and accord. Zeus, pleased with the outcome, promises to continue supporting these connections so that such festivities become regular.",
                                               "The trials conclude, but not all participants are satisfied with the results. Some gods and mortals feel that their efforts were not adequately appreciated. Zeus realizes that there is still much work to be done to fully restore harmony and decides to continue efforts to strengthen the bonds.",
                                               "The trials are successful, but hidden conflicts and grievances between the gods and mortals are revealed in the process. Zeus uses this as an opportunity to resolve long-standing disputes and build trust. As a result, harmony is restored, but everyone understands that maintaining unity requires constant effort."]),
                      
                      ChapterModel(backgroundImage: ZeusImageName.stage2Back.rawValue,
                                   chapterImage: ZeusImageName.chapterLabel2.rawValue,
                                   text: "I have noticed that Olympus lacks joy and harmony. Athena suggests starting with solving a small problem. I decide to turn to Demeter to restore abundance on Earth. Demeter, the goddess of fertility and agriculture, can help restore the harvest and bring abundance back to the people.",
                                   enemyImage: ZeusImageName.chapter2.rawValue,
                                   loadingImage: ZeusImageName.chapter2end.rawValue,
                                   answers: [Answer(answer1: "Choose which fields to plant first to ensure the best harvest.",
                                                    answer2: "Consult local farmers for advice on which crops to plant.",
                                                    answer3: "Invite the wind gods to help create favorable conditions for crop growth."),
                                             Answer(answer1: "Seek help from the nature gods in fighting pests.",
                                                    answer2: "Research ancient methods of pest control to find effective ways.",
                                                    answer3: "Invite local residents to help fight pests."),
                                             Answer(answer1: "Seek help from the gods of science and knowledge in\n creating a new variety of grain.",
                                                    answer2: "Research ancient breeding methods to find inspiration for creating a new variety.",
                                                    answer3: "Invite local scientists and agronomists to help create a new variety of grain."),
                                             Answer(answer1: "Seek help from the water and rain gods in creating a new irrigation method.",
                                                    answer2: "Research ancient irrigation methods to find inspiration for creating a new method.",
                                                    answer3: "Invite local engineers and hydrologists to help create a new irrigation method."),
                                             Answer(answer1: "Seek help from the gods of storage and preservation in creating a new method of storing the harvest.",
                                                    answer2: "Research ancient methods of storing the harvest to find inspiration for creating a new method.",
                                                    answer3: "Invite local storage and logistics specialists to help create a new method of storing the harvest."),
                                             Answer(answer1: "Seek help from the gods of justice and equality in creating a new method of distributing the harvest.",
                                                    answer2: "Research ancient methods of distributing the harvest to find inspiration for creating a new method.",
                                                    answer3: "Invite local economists and logistics specialists to help create a new method of distributing the harvest."),
                                             Answer(answer1: "Establish a network of agricultural schools to teach advanced farming techniques.",
                                                    answer2: "Create a system of public granaries to store and distribute food during times of need.",
                                                    answer3: "Found a new cult dedicated to the worship of Demeter to ensure her continued blessings."),
                                             Answer(answer1: "Establish a network of agricultural schools to teach advanced farming techniques.",
                                                    answer2: "Create a system of public granaries to store and distribute food during times of need.",
                                                    answer3: "Found a new cult dedicated to the worship of Demeter to ensure her continued blessings.")],
                                   question: ["Demeter asks for your help in restoring the harvest in the fields.",
                                              "Demeter asks for your help in fighting pests that are destroying the harvest.",
                                              "Demeter asks for your help in creating a new variety of grain that will be drought-resistant.",
                                              "Demeter asks for your help in creating a new irrigation method that will be effective in drought conditions.",
                                              "Demeter asks for your help in creating a new method of storing the harvest that will prevent it from spoiling.",
                                              "Demeter asks for your help in creating a new method of distributing the harvest that will be fair and efficient." ,
                                              "Demeter is pleased with your efforts and offers you a choice to further ensure abundance:",
                                              "Demeter is pleased with your efforts and offers you a choice to further ensure abundance:"],
                                   finalImages: [ZeusImageName.stage2left.rawValue, ZeusImageName.stage2middle.rawValue, ZeusImageName.stage2right.rawValue],
                                   finalText: ["After the completion of the first trials, Zeus decides that this is just the beginning. He announces even more challenging new trials that will be held regularly. The gods and mortals enthusiastically accept the challenge, knowing that it will help them become stronger and wiser.",
                                               "New trials begin, but not everyone is ready for such difficulties. Some participants start to doubt their abilities and strengths. Zeus sees this and decides to provide additional support and mentorship to help everyone overcome the challenges.",
                                               "The new trials are successful, but they reveal new threats and challenges that need to be addressed. Zeus understands that the trials must continue to prepare everyone for future difficulties. He announces the creation of a permanent council that will develop and coordinate new trials."]),
                      
                      
                      
                      ChapterModel(backgroundImage: ZeusImageName.stage3Back.rawValue,
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
                                               "The rebirth of Olympus is successful, but new threats are revealed that could jeopardize what has been achieved. Zeus decides to create a special group of defenders of Olympus who will ensure the safety and prosperity of the sacred place"])]
}



