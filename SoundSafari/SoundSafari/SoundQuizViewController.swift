//
//  QuizVC.swift
//  SoundSafari
//
//  Created by jin fu on 2024/11/22.
//


import UIKit

class SoundQuizViewController: UIViewController {

    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    
    var index = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI()
    }
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func AnswerButton(_ sender: UIButton) {
        
        let userAns = sender.currentTitle
        let correctAns = animalQuiz[index].correctAns
        
        if userAns == correctAns {
            MyshowAlert(title: "Right", message: "Your Answer is Right", in: self)
        }
        else {
            MyshowAlert(title: "Wrong", message: "Right Answer is \(animalQuiz[index].correctAns)", in: self)
        }
        if index+1 < animalQuiz.count {
            index += 1
            score += 1
        }

        UpdateUI()
    }
    
    
    func MyshowAlert(title: String, message: String, in viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [self] _ in
            if index+1 < animalQuiz.count {
//                index += 1
//                score += 1
            }
            else {
                index = 0
                showAlert(title: "Complated", message: "Your Quiz is Complated and your score is \(score) out of \(animalQuiz.count)", in: self)
            }
        }
        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func UpdateUI() {
        animalImage.image = UIImage(named: animalQuiz[index].AnimalImage)
        btnOne.setTitle(animalQuiz[index].op1, for: .normal)
        btnTwo.setTitle(animalQuiz[index].op2, for: .normal)
        btnThree.setTitle(animalQuiz[index].op3, for: .normal)
        btnFour.setTitle(animalQuiz[index].op4, for: .normal)
    }
    
}
