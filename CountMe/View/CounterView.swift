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
            Text("📈CountMe!")
                .font(.title)
                .padding(.top)
            
            Spacer()
            
            Text("Target: \(viewModel.targetScore)")
                .fontWeight(.light)
            Text("\(viewModel.score)")
                .font(.system(size: 100, weight: .light))
            
            Spacer()
            
            Button(action: {
                viewModel.increment()
            }) {
                Text("Add one")
                    .frame(width: 200, height: 50)
                    .foregroundStyle(.white)
                    .background(colorScheme == .dark ? .gray : .black)
                    .clipShape(.buttonBorder)
                    .padding(.bottom)
            }
            
        }
        .onAppear(){
            viewModel.reset()
        }
    }
}

#Preview {
    CounterView()
}
