//
//  QuestionData.swift
//  ReccomendationQuiz
//
//  Created by Tim Kemp on 10/5/18.
//  Copyright © 2018 Tim Kemp. All rights reserved.
//

import Foundation
class Question {
    var text: String
    var type: ResponseType
    
    init(text: String, type: ResponseType) {
        self.text = text
        self.type = type
    }
}

class whatToPlayQuestion: Question {
    var answers: [whatToPlayAnswer]
    init(text: String, type: ResponseType, answers: [whatToPlayAnswer]) {
        self.answers = answers
        super.init(text: text, type: type)
    }
}

class whereToStayQuestion: Question {
    var answers: [whereToStayAnswer]
    init(text: String, type: ResponseType, answers: [whereToStayAnswer]) {
        self.answers = answers
        super.init(text: text, type: type)
    }
}

class Answer {
    var text: String
    init(text: String) {
        self.text = text
    }
}

class whereToStayAnswer: Answer {
    var whereToStay: whereToStayOutcome
    init(text: String, whereToStay: whereToStayOutcome) {
        self.whereToStay = whereToStay
        super.init(text: text)
    }
}

class whatToPlayAnswer: Answer {
    var whatToPlay: whatToPlayOutcome
    init(text: String, whatToPlay: whatToPlayOutcome) {
        self.whatToPlay = whatToPlay
        super.init(text: text)
    }
}

enum ResponseType {
    case single, multiple, ranged
}

enum Topic {
    case whatToPlay, whereToStay
}

enum whatToPlayOutcome {
    case soccer, swimming, golf, surfing, tennis, netball, gymnastics, cricket, darts, indoorSoccer, tenPinBowling, lawnBowls
    
    var definition: String {
        switch self {
        case .soccer:
            return "You should play soccer"
        case .swimming:
            return "You should do swimming"
        case .golf:
            return "You should play golf"
        case .surfing:
            return "You should go surfing"
        case .tennis:
            return "You should play tennis"
        case .netball:
            return "You should play netball"
        case .gymnastics:
            return "You should do gymnastics"
        case .cricket:
            return "You should play cricket"
        case .darts:
            return "You should play darts"
        case .indoorSoccer:
            return "You should play indoor soccer"
        case .tenPinBowling:
            return "You should play ten pin bowling"
        case .lawnBowls:
            return "You should play lawn bowls"
        }
    }
}

enum whereToStayOutcome {
    case car, couch, remoteCampsite, youthHostel, chainMotel, fiveStarHotel
    
    var definition: String {
        switch self {
        case .car:
            return "You should sleep in your car"
        case .couch:
            return "You should sleep on your friend's couch"
        case .remoteCampsite:
            return "You should stay in a remote campsite"
        case .youthHostel:
            return "You should stay at a youth hostel"
        case .chainMotel:
            return "You should stay at a chain motel"
        case .fiveStarHotel:
            return "You should stay in a 5 star hotel"
        }
    }
}


