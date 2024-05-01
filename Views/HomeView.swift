//
//  HomePage.swift
//  Gachor
//
//  Created by Balya Elfata on 27/04/24.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    @State var isTapped = false
    @State var isScaled = false
    @Environment(\.backgroundMaterial) var backgroundMaterial
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                    .blur(radius: 2)
                VStack (alignment: .center){
                    // Logo
                    Image("logo")
                        .resizable()
                        .frame(width: 264, height: 264)
                        .padding(.bottom, 34.5)
                        .shadow(color: Color(red: 0.13, green: 0.05, blue: 0.27).opacity(0.3), radius: 15, x: 0, y: 0)
                        .scaleEffect(isScaled ? 1.0 : 0.8)
                        .rotation3DEffect(
                            Angle(
                                degrees: self.isTapped ? 360 : 0),
                            axis: (x: 0, y: self.isTapped ? 360 : 0, z: 0)
                        )
                        .onAppear {
                            Sounds.playSound(sound: "coin6", type: "wav")
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.2)){
                                self.isScaled.toggle()
                            }
                        }
                        .onTapGesture {
                            Sounds.playSound(sound: "coin1", type: "wav")
                            withAnimation(.linear(duration: 0.5)) {isTapped.toggle()}
                        }
                        .sensoryFeedback(.success, trigger: isTapped)
                    
                    //Camera Button
                    NavigationLink (destination: ContentView()) {
                        ZStack {
                            Rectangle()
                                .frame(width: 164, height: 68)
                                .cornerRadius(15)
                                .foregroundColor(Color(red: 0.95, green: 0.68, blue: 0))
                                .shadow(color: Color(red: 0.13, green: 0.05, blue: 0.27).opacity(0.3), radius: 15, x: 0, y: 0)
                            
                            Image(systemName: "camera.fill")
                                .resizable()
                                .frame(width: 40, height: 32)
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 14)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                        Sounds.playSound(sound: "coin3", type: "wav")})
                    
                    // Card Collection Button
                    NavigationLink(destination: CardCollectionView()) {
                        ZStack {
                            Rectangle()
                                .frame(width: 164, height: 68)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .shadow(color: Color(red: 0.13, green: 0.05, blue: 0.27).opacity(0.3), radius: 15, x: 0, y: 0)
                            Image(systemName:"book.closed.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                                .foregroundColor(Color(red: 0.95, green: 0.68, blue: 0))
                        }
//                        .padding(.top, 20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                            .inset(by: 2.5)
                            .stroke(Color(red: 0.95, green: 0.68, blue: 0), lineWidth: 5)

                        )
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                        Sounds.playSound(sound: "coin2", type: "wav")})
                }
            }
        }
//         Play Music
        .onAppear() {
            Sounds.playMusic(music: "bgMusic", type: "mp3")
        }
    }
}

#Preview {
    HomeView()
}
