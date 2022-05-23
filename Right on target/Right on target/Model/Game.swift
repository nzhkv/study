//
//  Game.swift
//  Right on target
//
//  Created by Nikolay Zhukov on 18.05.2022.
//

import Foundation

protocol GameProtocol {
    var score: Int { get }  //колличество заработанных очков
    var currentRound: GameRoundProtocol! { get } //загаданное значение
    var isGameEnded: Bool { get }   //поверяет закончена ли игра
    var secretValueGenerator: GeneratorProtocol { get }
    func restartGame()  //начинает новый игру и стартует первый раунд
    func startNewRound()    //начинает новый раунд
}

class Game: GameProtocol {
    var score: Int {
        var totalScore: Int = 0
        for round in self.rounds {
            totalScore += round.score
        }
        return totalScore
    }
    
    var currentRound: GameRoundProtocol!
    private var rounds: [GameRoundProtocol] = []
    var secretValueGenerator: GeneratorProtocol
    private var roundsCount: Int!
    var isGameEnded: Bool {
        if roundsCount == rounds.count {
            return true
        } else {
            return false
        }
    }
    
    init(valueGenerator: GeneratorProtocol, rounds: Int) {
        secretValueGenerator = valueGenerator
        roundsCount = rounds
        startNewRound()
    }
    
    func restartGame() {
        rounds = []
        startNewRound()
    }
    
    func startNewRound() {
        let newSecretValue = self.getNewSecretValue()
        currentRound = GameRound(secretValue: newSecretValue)
        rounds.append(currentRound)
    }
    
    private func getNewSecretValue() -> Int {
        secretValueGenerator.getRandomValue()
    }
}

