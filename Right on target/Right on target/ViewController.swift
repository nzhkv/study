//
//  ViewController.swift
//  Right on target
//
//  Created by Nikolay Zhukov on 13.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slader: UISlider!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // загаданное число
    var number: Int = 0
    // раунд
    var round: Int = 0
    // сумма очков за раунд
    var points: Int = 0
    
    @IBAction func checkNumber() {
        // если игра только начинается
        if self.round == 0 {
            // генерируем случайное число
            self.number = Int.random(in: 1...50)
            // передаем значение случайного числа в label
            self.label.text = String(self.number)
            // устанавливаем счетчик раундов на 1
            self.round = 1
        } else {
            // получаем значение на слайдере
            let numSlider = Int(self.slader.value.rounded())
            // сравниваем значение с загаданным
            // и подсчитываем очки
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number } else if numSlider < self.number {
                    self.points += 50 - self.number + numSlider
                    
                } else {
                    self.points += 50 }
            if self.round == 5
            {
                // выводим информационное окно // с результатами игры
                let alert = UIAlertController(
                    title: "Игра окончена",
                    message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.round = 1
                self.points = 0
            } else {
                self.round += 1
            }
            // генерируем случайное число
            self.number = Int.random(in: 1...50)
            
            // передаем значение случайного числа в label
            self.label.text = String(self.number)
        }
    }
    
}
