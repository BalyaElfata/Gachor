import SwiftUI
import RealityKit

//struct CustomARViewRepresentable: UIViewRepresentable {
//    func makeUIView(context: Context) -> some UIView {
//        return CustomARView()
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: Context) { }
//}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let entity = ModelEntity(mesh: .generateBox(size: 0.1))
        let anchor = AnchorEntity(.image(group: "AR Resources",
                                          name: "IMG_0596"))
        entity.setParent(anchor)
        arView.scene.anchors.append(anchor)
        return arView
    }
    func updateUIView(_ uiView: ARView, context: Context) { }
}