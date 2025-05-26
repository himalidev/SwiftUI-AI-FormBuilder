//
//  ContentView.swift
//  OpenAIDynamicUIApp
//
//  Created by Himali Marasinghe on 2025-05-26.
//

import SwiftUI

struct ContentView: View {
    @State private var prompt: String = ""
    @State private var layout: ViewLayout?
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TextField("Enter your UI prompt...", text: $prompt)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: generateLayout) {
                    if isLoading {
                        ProgressView()
                    } else {
                        Text("Generate Layout")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                }
                .disabled(prompt.isEmpty || isLoading)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(3)
                .padding(.horizontal, 24) // ✅ Adds spacing from screen edges
                .shadow(radius: 4) // optional visual elevation

                Divider()

                if let layout = layout {
                    DynamicFormView(layout: layout)
                } else if let errorMessage = errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    Text("Generated UI will appear here.")
                        .foregroundColor(.gray)
                }

                Spacer()
            }
            .navigationTitle("AI UI Generator")
        }
    }

    private func generateLayout() {
        isLoading = true
        errorMessage = nil

        OpenAIService().fetchLayout(for: prompt) { result in
            DispatchQueue.main.async {
                self.isLoading = false

                switch result {
                    case .success(let fetchedLayout):
                        self.layout = fetchedLayout
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                        self.layout = nil
                }
            }
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
