//
//  ViewCoordinator.swift
//  Gachor
//
//  Created by Balya Elfata on 01/05/24.
//

import SwiftUI

struct ViewCoordinator: View {
    @State private var isActive = false
    var body: some View {
        if isActive {
            HomeView()
        }else {
            LoadingView(isActive: $isActive)
        }
    }
}

#Preview {
    ViewCoordinator()
}
