//
//  ContentView.swift
//  Gachor
//
//  Created by Balya Elfata on 24/04/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
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
    }
}

#Preview {
    ContentView()
}
