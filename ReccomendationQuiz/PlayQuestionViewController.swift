//
//  PlayQuestionViewController.swift
//  ReccomendationQuiz
//
//  Created by Tim Kemp on 9/5/18.
//  Copyright © 2018 Tim Kemp. All rights reserved.
//

import UIKit

class PlayQuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiLabel4: UILabel!
    @IBOutlet weak var multiSwitch4: UISwitch!
    @IBOutlet weak var multiLabel5: UILabel!
    @IBOutlet weak var multiSwitch5: UISwitch!
    @IBOutlet weak var multiLabel6: UILabel!
    @IBOutlet weak var multiSwitch6: UISwitch!
    @IBOutlet weak var multiLabel7: UILabel!
    @IBOutlet weak var multiSwitch7: UISwitch!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var rangedLabel3: UILabel!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    var answersChosen: [Answer] = []
    var questionIndex = 0
    var questions: [whatToPlayQuestion] = [
        whatToPlayQuestion(text: "Are you a team player?",
                           type: .single,
                           answers: [
                            whatToPlayAnswer(text: "Yes", whatToPlay: .soccer),
                            whatToPlayAnswer(text: "No", whatToPlay: .golf)
            ]),
        whatToPlayQuestion(text: "Do you like to play indoors or outdoors?",
                           type: .single,
                           answers: [
                            whatToPlayAnswer(text: "Indoors", whatToPlay: .soccer),
                            whatToPlayAnswer(text: "Outdoors", whatToPlay: .golf)
            ]),
        whatToPlayQuestion(text: "What do you want to get from this activity?",
                           type: .multiple,
                           answers: [
                            whatToPlayAnswer(text: "Relaxation", whatToPlay: .soccer),
                            whatToPlayAnswer(text: "Fitness", whatToPlay: .golf),
                            whatToPlayAnswer(text: "Social interaction", whatToPlay: .golf),
                            whatToPlayAnswer(text: "Challenging myself", whatToPlay: .golf),
                            whatToPlayAnswer(text: "Mindfulness", whatToPlay: .golf),
                            whatToPlayAnswer(text: "Something to do while drinking", whatToPlay: .golf),
                            whatToPlayAnswer(text: "Competition", whatToPlay: .golf)
            ]),
        whatToPlayQuestion(text: "What is your fitness level?",
                           type: .ranged,
                           answers: [
                            whatToPlayAnswer(text: "Unfit", whatToPlay: .soccer),
                            whatToPlayAnswer(text: "Reasonably fit", whatToPlay: .golf),
                            whatToPlayAnswer(text: "Very fit", whatToPlay: .golf)
            ])
    ]
                 
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiSwitch5.isOn = false
        multiSwitch6.isOn = false
        multiSwitch7.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
        multiLabel5.text = answers[4].text
        multiLabel6.text = answers[5].text
        multiLabel7.text = answers[6].text
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers[Int(answers.count/2)].text
        rangedLabel3.text = answers.first?.text
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        default:
            break
        }
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        if multiSwitch5.isOn {
            answersChosen.append(currentAnswers[4])
        }
        if multiSwitch6.isOn {
            answersChosen.append(currentAnswers[5])
        }
        if multiSwitch7.isOn {
            answersChosen.append(currentAnswers[6])
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "WhatToPlayResultsSegue", sender: nil)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "WhatToPlayResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen
        }
    }
}
