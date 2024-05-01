//
//  HomePage.swift
//  Gachor
//
//  Created by Balya Elfata on 27/04/24.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    @State var isLogoTapped = false
    @Environment(\.backgroundMaterial) var backgroundMaterial
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack (alignment: .center){
                    // Logo
                    Image("Logo")
                        .resizable()
                        .frame(width: 264, height: 264)
                        .padding(.bottom, 50)
                        .shadow(color: .black.opacity(0.2), radius: 12.5, x: 0, y: 9)
                        .rotation3DEffect(
                            Angle(
                                degrees: self.isLogoTapped ? 360 : 0),
                            axis: (x: 0, y: self.isLogoTapped ? 360 : 0, z: 0)
                        )
                        .onTapGesture {
                            Sounds.playSound(sound: "coin1", type: "wav")
                            withAnimation(.linear(duration: 0.5)) {isLogoTapped.toggle()}
                        }
                        .sensoryFeedback(.success, trigger: isLogoTapped)
                    
                    //Camera Button
                    NavigationLink (destination: ContentView()) {
                        ZStack {
                            Rectangle()
                                .frame(width: 164, height: 68)
                                .cornerRadius(15)
                                .foregroundColor(Color(red: 0.95, green: 0.68, blue: 0))
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 8)
                            
                            Image(systemName: "camera.fill")
                                .resizable()
                                .frame(width: 40, height: 32)
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 14)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        Sounds.playSound(sound: "coin3", type: "wav")})
                    .sensoryFeedback(.success, trigger: isLogoTapped)
                    
                    // Card Collection Button
                    NavigationLink(destination: CardCollectionView()) {
                        ZStack {
                            Rectangle()
                                .frame(width: 164, height: 68)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 8)
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
                            Sounds.playSound(sound: "coin2", type: "wav")})
                    .sensoryFeedback(.success, trigger: isLogoTapped)
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
