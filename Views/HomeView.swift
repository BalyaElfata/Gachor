//
//  HomePage.swift
//  Gachor
//
//  Created by Balya Elfata on 27/04/24.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    @State var isCameraTapped = false
    @Environment(\.backgroundMaterial) var backgroundMaterial
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    // Logo
                    Image("twitch")
                        .resizable()
                        .frame(width: 264, height: 264)
                        .scaledToFill()
                        .cornerRadius(246)
                        .padding(.top, 128)
                        .rotation3DEffect(
                            Angle(
                                degrees: self.isCameraTapped ? 360 : 0),
                            axis: (x: 0, y: self.isCameraTapped ? 360 : 0, z: 0)
                        )
                        .onTapGesture {
                            Sounds.playSound(sound: "coin1", type: "wav")
                            withAnimation(.linear(duration: 0.5)) {isCameraTapped.toggle()}
                        }
                        .sensoryFeedback(.success, trigger: isCameraTapped)
                    
                    //Camera Button
                    NavigationLink (destination: ContentView()) {
                        ZStack {
                            Rectangle()
                            //                .padding(.vertical)
                                .frame(width: 125, height: 68)
                                .cornerRadius(12)
                                .foregroundColor(Color(red: 0.95, green: 0.68, blue: 0))
                            
                            Image(systemName: "camera.fill")
                                .resizable()
                                .frame(width: 40, height: 32)
                                .foregroundColor(.white)
                        }
                        .padding(.top, 20)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        Sounds.playSound(sound: "coin3", type: "wav")
                    })
                    
                    Spacer()
                    
                    // Card Collection Button
                    HStack()
                    {
                        Spacer()
                        NavigationLink(destination: CardCollectionView()) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 68, height: 68)
                                    .foregroundColor(Color(red: 0.95, green: 0.68, blue: 0))
                                    .cornerRadius(12)
                                Image(systemName:"book.closed.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
                                    .foregroundColor(.white)
                            }
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            Sounds.playSound(sound: "coin2", type: "wav")
                        })
                    }
                    .padding(.trailing, 20)
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
