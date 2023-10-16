//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDefinition: UILabel!
    
    var chosenAnswers: [Answer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let resultAnimal = getMainAnimalAnswer(from: chosenAnswers)
        resultDefinition.text = resultAnimal?.definition
        resultLabel.text = "Вы - \(resultAnimal?.rawValue.description ?? "")"
    }

    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func getMainAnimalAnswer(from answers: [Answer]) -> Animal? {
        var frequencyForAnimal: [Animal: Int] = [:]

        for answer in answers {
            let animal = answer.animal
            if let count = frequencyForAnimal[animal] {
                frequencyForAnimal[animal] = count + 1
            } else {
                frequencyForAnimal[animal] = 1
            }
        }

        let mainAnimalAnswer = frequencyForAnimal.max(by: { $0.value < $1.value })
        return mainAnimalAnswer?.key
    }
    
}
