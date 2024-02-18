//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet private var animalLabel: UILabel!
    @IBOutlet private var descriptionAnimalLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        let animal = getFrequentAnimal()
        showResult(with: animal ?? .cat)
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    func showResult(with animal: Animal) {
        animalLabel.text = "Вы - \(animal.rawValue)"
        descriptionAnimalLabel.text = animal.definition
    }
    
    func getFrequentAnimal() -> Animal? {
        var animalsCount: [Animal: Int] = [:]
        
        for answer in answersChosen {
            if animalsCount[answer.animal] != nil {
                animalsCount[answer.animal]! += 1
            } else {
                animalsCount[answer.animal] = 1
            }
        }
        return animalsCount.max(by: { $0.value < $1.value })?.key
    }
}

