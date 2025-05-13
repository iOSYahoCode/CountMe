//
//  CounterViewModel.swift
//  Hello Swift UI
//
//  Created by Yaroslaw Homziak on 13.05.2025.
//

import Foundation
public class CounterViewModel: ObservableObject {
    var model: CounterModel
    @Published var targetScore : Int = 0 {
        didSet {
            model.targetScore = targetScore
        }
    }
    @Published var score : Int = 0 {
        didSet {
            model.score = score
        }
    }
    
    init(model: CounterModel = CounterModel()) {
        self.model = model
        self.score = model.score
        self.targetScore = model.targetScore
    }
    
    public func increment() {
        score += 1
        
        if checkIsWon() {
            reset()
        }
    }
    
    public func reset() {
        setNewRandomTargetScore()
        score = 0
    }
    
    private func checkIsWon() -> Bool {
        score >= targetScore
    }
    
    private func setNewRandomTargetScore() {
        targetScore = Int.random(in: 15...80)
    }
}
