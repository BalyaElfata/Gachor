//
//  HomePage.swift
//  Gachor
//
//  Created by Balya Elfata on 27/04/24.
//

import SwiftUI
import AVFoundation
struct HomePage: View {
    var body: some View {
        // Logo
        Circle()
            .frame(width: 264)
            .foregroundColor(.gray)
            .padding(.top, 128)
            .onTapGesture {
                AudioServicesPlaySystemSound(1026)
            }
        
        //Play Button
        ZStack {
            Rectangle()
//                .padding(.vertical)
                .frame(width: 125, height: 68)
                .cornerRadius(12)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            Image(systemName: "play.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.white)
        }
        .padding(.top, 20)
        
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
}

#Preview {
    HomePage()
}
