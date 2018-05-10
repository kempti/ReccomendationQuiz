//
//  StayQuestionViewController.swift
//  ReccomendationQuiz
//
//  Created by Tim Kemp on 9/5/18.
//  Copyright © 2018 Tim Kemp. All rights reserved.
//

import UIKit

class StayQuestionViewController: UIViewController {
    
   var questionIndex = 0
    var questions: [whereToStayQuestion] = [
        whereToStayQuestion(text: "What is your budget?",
                           type: .single,
                           answers: [
                            whereToStayAnswer(text: "$", whereToStay: .couch),
                            whereToStayAnswer(text: "$$", whereToStay: .youthHostel),
                            whereToStayAnswer(text: "$$$", whereToStay: .fiveStarHotel)
            ]),
        whereToStayQuestion(text: "Expected length of stay?",
                            type: .single,
                            answers: [
                                whereToStayAnswer(text: "1 night", whereToStay: .couch),
                                whereToStayAnswer(text: "2-5 nights", whereToStay: .youthHostel),
                                whereToStayAnswer(text: ">5 nights", whereToStay: .fiveStarHotel)
            ]),
        whereToStayQuestion(text: "Which of the following are important for your stay?",
                            type: .multiple,
                            answers: [
                                whereToStayAnswer(text: "Solitude", whereToStay: .remoteCampsite),
                                whereToStayAnswer(text: "Cleanliness", whereToStay: .fiveStarHotel),
                                whereToStayAnswer(text: "Self-catering", whereToStay: .youthHostel),
                                whereToStayAnswer(text: "Date flexibility", whereToStay: .couch),
                                whereToStayAnswer(text: "Wi-fi access", whereToStay: .chainMotel),
                                whereToStayAnswer(text: "Socialising", whereToStay: .youthHostel),
                                whereToStayAnswer(text: "Pets allowed", whereToStay: .remoteCampsite)
            ]),
        whereToStayQuestion(text: "How important to you is a comfortable bed?",
                            type: .ranged,
                            answers: [
                                whereToStayAnswer(text: "I can sleep on anything", whereToStay: .remoteCampsite),
                                whereToStayAnswer(text: "Reasonably important", whereToStay: .youthHostel),
                                whereToStayAnswer(text: "I demand ultimate comfort", whereToStay: .fiveStarHotel)
            ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
