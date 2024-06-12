//
//  LoadingView.swift
//  Gachor
//
//  Created by Balya Elfata on 01/05/24.
//

import SwiftUI

struct ProgressBar : View {
    var value : Float
    var barHeight : CGFloat
    var barColor : Color
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment: .leading){
                Rectangle()
                    .frame(width: geometry.size.width, height: barHeight)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                Rectangle()
                    .frame(width: CGFloat(value)*geometry.size.width+5, height: barHeight)
                    .foregroundColor(.orange)
            }
        }
    }
}

struct LoadingView: View {
    @State private var currentIndex = 0
    let textArray = ["",".","..","..."]
    @State private var offsetY = 0.0
    @State private var progressValue: Float = 0.0
    @Binding var isActive: Bool
    
    var body: some View {
        if progressValue >= 1 {
            Text("")
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.isActive = true
                    }
                }
        } else {
            VStack {
                VStack {
                    ProgressBar(value: progressValue, barHeight: 20, barColor: .orange)
                }
                .cornerRadius(20)
                .frame(width: 200, height: 20)
                .onAppear{
                    startAnimationBar()
                }
            }
        }
    }
    func startAnimationBar(){
        _ = Timer.scheduledTimer(withTimeInterval: 0.025, repeats: true){timer in
            withAnimation{
                progressValue += 0.01
            }
        }
    }
    
}

//#Preview {
//    ZStack{
//        LoadingView()
//    }
//}
