//
//  CounterViewModel.swift
//  Hello Swift UI
//
//  Created by Yaroslaw Homziak on 13.05.2025.
//

import Foundation
final public class CounterViewModel: ObservableObject {
    var model: CounterModel
    @Published var targetScore : Int = 0 {
        didSet { model.targetScore = targetScore }
    }
    @Published var score : Int = 0 {
        didSet { model.score = score}
    }
    
    init(model: CounterModel = CounterModel(), targetScore customTargetScore: Int = 0) {
        self.model = model
        self.score = model.score
        if customTargetScore > 0 {
            self.targetScore = customTargetScore
            model.targetScore = customTargetScore
        } else {
            self.targetScore = model.targetScore
        }
        setNewRandomTargetScore()
    }
    
    public func increment() {
        score += 1
        
        if checkIsWon() {
            reset()
            setNewRandomTargetScore()
        }
    }
    
    public func reset() {
        score = 0
    }
    
    private func checkIsWon() -> Bool {
        score >= targetScore
    }
    
    private func setNewRandomTargetScore() {
        targetScore = Int.random(in: 15...80)
    }
}
