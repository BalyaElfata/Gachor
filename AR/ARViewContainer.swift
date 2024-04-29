import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let entity = ModelEntity(mesh: .generatePlane(width: 0.5, height: 1)) // add corner radius
        let anchor = AnchorEntity(.image(group: "AR Resources",
                                          name: "IMG_0596"))
        entity.setParent(anchor)
        arView.scene.anchors.append(anchor)
        return arView
    }
    func updateUIView(_ uiView: ARView, context: Context) { }
}
