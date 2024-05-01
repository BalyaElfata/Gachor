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
                        Button(action: {dismiss()}) {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(Color(red: 0.95, green: 0.68, blue: 0))
                            Image(systemName: "house.fill")
                            .foregroundColor(Color(red: 0.95, green: 0.68, blue: 0))}}
                }
                .onAppear() {
                    withAnimation(.linear.delay(5)){showingImage = false}
                }
                Image("pattern")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .opacity(0.5)
                    .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .overlay{
                        Color(red: 0.95, green: 0.68, blue: 0)
                            .opacity(0.2)
                            .cornerRadius(30)
                    }
                    .opacity(withAnimation(.easeInOut(duration: 2)) {
                        showingImage == true ? 0.5 : 0})
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 75)
                    .foregroundColor(Color(red: 0.95, green: 0.68, blue: 0))
                    .padding(.leading, 200)
                    .padding(.top, 300)
                    .opacity(withAnimation(.easeInOut(duration: 2)) {
                        showingImage == true ? 0.5 : 0})
        }
    }
}

#Preview {
    ContentView()
}
