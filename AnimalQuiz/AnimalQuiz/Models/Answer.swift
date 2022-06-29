//
//  Answer.swift
//  AnimalQuiz
//
//  Created by Nikolay Zhukov on 29.06.2022.
//

struct Answer {
    let text: String
    let type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Собака"
        case .cat:
            return "Кошка"
        case .rabbit:
            return "Заяц"
        case .turtle:
            return "Черепаха"
        }
    }
}
