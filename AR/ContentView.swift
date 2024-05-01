//
//  ContentView.swift
//  Gachor
//
//  Created by Balya Elfata on 24/04/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showingImage = true
    
    var body: some View {
        ZStack {
            ARViewContainer()
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(Color(red: 0.95, green: 0.68, blue: 0))
                            Image(systemName: "house.fill")
                                .foregroundColor(Color(red: 0.95, green: 0.68, blue: 0))
                        }
                    }
                }
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { // Adjust the time interval as needed
                        showingImage = false
                    }
                }
            if showingImage {
                Image("pattern")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .opacity(0.5)
                    .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 75)
                    .foregroundColor(.white)
                    .padding(.leading, 150)
                    .padding(.top, 150)
                    .opacity(0.5)
            }
        }
    }
    private func showImage() {
        self.showingImage = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showingImage = false
        }
    }
}

#Preview {
    ContentView()
}
