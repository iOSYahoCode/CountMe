//
//  CounterView.swift
//  Hello Swift UI
//
//  Created by Yaroslaw Homziak on 13.05.2025.
//

import SwiftUI

struct CounterView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var viewModel = CounterViewModel()
    
    var body: some View {
        VStack() {
            Text("CountMe")
                .font(.title)
            
            Spacer()
            
            Text("Target: \(viewModel.targetScore)")
            Text("\(viewModel.score)")
                .font(.system(size: 100, weight: .light))
            
            Spacer()
            
            Button("Add one") {
                viewModel.increment()
            }
            .frame(width: 200, height: 50)
            .foregroundStyle(.white)
            .background(colorScheme == .dark ? .gray : .black)
            .clipShape(.buttonBorder)
        }
        .onAppear(){
            viewModel.reset()
        }
    }
}

#Preview {
    CounterView()
}
