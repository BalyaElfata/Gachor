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
    
    var body: some View {
        NavigationStack {
            // Logo
            Image("bully")
                .resizable()
                .frame(width: 264, height: 264)
                .scaledToFill()
                .cornerRadius(246)
                .padding(.top, 128)
                .rotation3DEffect(
                    Angle(
                    degrees: self.isTapped ? 360 : 0),
                    axis: (x: 0, y: self.isTapped ? 360 : 0, z: 0)
                )
                .onTapGesture {
                    AudioServicesPlaySystemSound(1028)
                    withAnimation(.easeInOut(duration: 1.7)) {isTapped.toggle()}
                }
                .sensoryFeedback(.success, trigger: isTapped)
            
            
            //Play Button
            NavigationLink {
                ContentView()
            } label: {
                ZStack {
                    Rectangle()
                    //                .padding(.vertical)
                        .frame(width: 125, height: 68)
                        .cornerRadius(12)
                        .foregroundColor(.blue)
                    
                    Image(systemName: "camera.fill")
                        .resizable()
                        .frame(width: 40, height: 32)
                        .foregroundColor(.white)
                }
                .padding(.top, 20)
//                .onTapGesture {
//                    playSound(sound: "coin1", type: "wav")
//                }
            }
            
            Spacer()
            
            // Card Collection Button
            HStack {
                Spacer()
                NavigationLink{
                    CardCollectionView()
                } label: {
                    Rectangle()
                        .frame(width: 101, height: 107)
                        .padding(.trailing, 16)
                        .foregroundColor(.gray)
                }
            }
        }
        .onAppear() {
            playMusic(music: "bgMusic", type: "mp3")
        }
    }
}

#Preview {
    HomeView()
}
