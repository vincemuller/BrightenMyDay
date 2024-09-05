//
//  JokeCriteriaScreen.swift
//  BrightenMyDay
//
//  Created by Vince Muller on 9/5/24.
//

import SwiftUI

struct JokeHomeScreen: View {
    @ObservedObject var viewModel = BrightenMyDayViewModel()
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                Color.offWhite
                JokerMasksLogoView()
                    .offset(y: -(geometry.size.height * 0.327654))
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: geometry.size.width * 0.923, height: viewModel.jokeGenerationIsActive ? geometry.size.height * 0.42 : geometry.size.height * 0.33)
                        VStack {
                            !viewModel.jokeGenerationIsActive ? CategorySelectionView(viewModel: viewModel)
                                .padding(.vertical, 20) : nil
                            
                            viewModel.jokeGenerationIsActive ?
                            JokeGeneratorView(jokeSetup: $viewModel.joke.setup, jokeDelivery: $viewModel.joke.delivery, joke: $viewModel.joke.joke) : nil
                            
                            CTAButtonView(action: {
                                if viewModel.categorylabel != "" {
                                    viewModel.jokeGenerationIsActive = true;
                                    viewModel.getJoke()
                                }
                            }, label: "Generate New Joke")
                            if viewModel.jokeGenerationIsActive == true {
                                Button("Select Different Category") {
                                    viewModel.jokeGenerationIsActive = false
                                }
                                .tint(Color.secondary)
                                .padding()
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .task {
                await viewModel.getCategories()
            }
        })
    }
}

#Preview {
    JokeHomeScreen()
}
