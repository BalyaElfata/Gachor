//
//  AppDelegate.swift
//  Gachor
//
//  Created by Balya Elfata on 26/04/24.
//

import SwiftUI
import ARKit
import RealityKit

final class ARKitSession

let planeData = PlaneDetectionProvider(alignments: [.horizontal, .vertical])


Task {
    do {
        try await self.session.run([planeData])
        // Update app based on the planeData.anchorUpdates async sequence.
    } catch {
        print("ARKitSession error:", error)
    }
}
