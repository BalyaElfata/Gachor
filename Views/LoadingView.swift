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
                HStack {
                    Text("Loading")
                        .font(.custom("Chalkduster", size: 28))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .frame(width: 130)
                        .foregroundColor(.orange)
                    Text("\(textArray[currentIndex])")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .frame(width: 30)
                        .foregroundColor(.orange)
                        .onAppear{
                            startAnimationText()
                        }
                }
            }
        }
    }
    func startAnimationBar(){
        _ = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true){timer in
            withAnimation{
                progressValue += 0.01
            }
        }
    }
    
    func startAnimationText(){
        _ = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){timer in
            withAnimation{
                currentIndex = (currentIndex+1)%textArray.count
            }
        }
    }
    
}

//#Preview {
//    ZStack{
//        LoadingView()
//    }
//}
