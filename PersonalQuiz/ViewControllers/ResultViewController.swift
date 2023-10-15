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
        var animals = getAnimals(from: chosenAnswers)
        var finalAnimals = getAnimalsCount(from: animals)
        var resultAnimal = getMainAnimalAnswer(from: finalAnimals)
        resultDefinition.text = resultAnimal?.definition
        resultLabel.text = "Вы - \(resultAnimal?.rawValue.description ?? "")"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func getAnimals(from answers: [Answer]) -> [Animal] {
        return answers.map { $0.animal }
    }
    
    private func getAnimalsCount(from animals: [Animal]) -> [Animal: Int] {
        var frequencyForAnmal: [Animal : Int] = [:]
        
        for animal in animals {
            if let count = frequencyForAnmal[animal] {
                frequencyForAnmal[animal] = count + 1
            } else {
                frequencyForAnmal[animal] = 1
            }
        }
        return frequencyForAnmal
    }
    
    private func getMainAnimalAnswer(from animals: [Animal : Int]) -> Animal?{
        let mainAnimalAnswer = animals.max(by: { $0.value < $1.value })
        return mainAnimalAnswer?.key
    }
    
}
