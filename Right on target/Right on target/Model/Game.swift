//
//  Game.swift
//  Right on target
//
//  Created by Nikolay Zhukov on 18.05.2022.
//

import Foundation

protocol GameProtocol {
    var score: Int { get }  //колличество заработанных очков
    var currentSecretValue: Int { get } //загаданное значение
    var isGameEnded: Bool { get }   //поверяет закончена ли игра
    func restartGame()  //начинает новый игру и стартует первый раунд
    func startNewRound()    //начинает новый раунд
    func calculateScore(with value: Int)   //сравнивает переданное число с загаданным и начисляет очки
}

class Game: GameProtocol {
    var score = 0
    private var minSecretValue: Int
    private var maxSecretValue: Int
    var currentSecretValue = 0
    private var lastRound: Int
    private var currentRound = 1
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        guard startValue <= endValue else {
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = self.getNewSecretValue()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    
    private func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
    
    func calculateScore(with value: Int) {
        if value > currentRound {
            score += 50 - value + currentSecretValue
            print(score)
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
            print(score)
        } else {
            score += 50
            print(score)
        }
    }
}
