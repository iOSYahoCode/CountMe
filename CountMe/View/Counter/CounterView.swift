//
//  CounterView.swift
//  Hello Swift UI
//
//  Created by Yaroslaw Homziak on 13.05.2025.
//

import SwiftUI

struct CounterView: View {
    @Environment(\.colorScheme) private var colorScheme
    @StateObject private var viewModel = CounterViewModel()
    
    var body: some View {
        VStack {
            Text(CounterViewConstants.title)
                .font(.title)
                .padding(.top)
            
            Spacer()
            
            Text("\(CounterViewConstants.targetPrefix)\(viewModel.targetScore)")
                .fontWeight(.light)
            Text("\(viewModel.score)")
                .font(.system(size: 100, weight: .light))
            
            Spacer()
            
            HStack{
                Button(action: {
                    viewModel.increment()
                }) {
                    Text(CounterViewConstants.addButtonTitle)
                        .frame(width: 200, height: 50)
                        .foregroundStyle(.white)
                        .background(colorScheme == .dark ? .gray : .black)
                        .clipShape(.buttonBorder)
                }
                if viewModel.score > 0 {
                    Button {
                        withAnimation {
                            viewModel.reset()
                        }
                    } label: {
                        Image(systemName: CounterViewConstants.trashIcon)
                            .frame(width: 35, height: 50)
                            .foregroundStyle(.white)
                            .background(colorScheme == .dark ? .gray : .black)
                            .clipShape(.buttonBorder)
                    }
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                }
                
            }
            .padding(.bottom)
            .animation(.easeInOut(duration: 0.3), value: viewModel.score)
        }
        .onAppear(){
            viewModel.reset()
        }
    }
}

#Preview {
    CounterView()
}
