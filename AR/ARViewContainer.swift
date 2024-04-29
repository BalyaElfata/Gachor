import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        var myMaterial = PhysicallyBasedMaterial()
        
        if let baseResource = try? TextureResource.load(named: "khoi") {
            // Create a material parameter and assign it.
            let baseColor = MaterialParameters.Texture(baseResource)
            myMaterial.baseColor = PhysicallyBasedMaterial.BaseColor(texture:baseColor)
        }

        let entity = ModelEntity(
            mesh: .generatePlane(width: 0.5, depth: 1),
            materials: [myMaterial]
        )
        
        let anchor = AnchorEntity(.image(group: "AR Resources", name: "pattern1"))
        
        entity.setParent(anchor)
        
//        // Retrieve the current transformation of the model entity
//        var transform = entity.transform
//        // // Set the rotation of the entity
//        transform.rotation = simd_quatf(angle: .pi, axis: [1,3,3])
//        // Move the modelEntity to its new transformed position
//        entity.move(to: transform, relativeTo: entity.parent, duration: 3.0)
        
//        entity.playAnimation(anim.repeat(duration: .infinity),
//                             transitionDuration: 1.25,
//                             startsPaused: false)
        
//        let radians = 90.0 * Float.pi / 180.0
//        entity.orientation *= simd_quatf(angle: radians, axis: SIMD3(x: 0, y: 0, z: 1))
        
        arView.scene.anchors.append(anchor)
        
        var myMaterial2 = PhysicallyBasedMaterial()
        if let baseResource2 = try? TextureResource.load(named: "gta") {
            // Create a material parameter and assign it.
            let baseColor2 = MaterialParameters.Texture(baseResource2)
            myMaterial2.baseColor = PhysicallyBasedMaterial.BaseColor(texture:baseColor2)
        }
        let entity2 = ModelEntity(
            mesh: .generatePlane(width: 0.5, depth: 1),
            materials: [myMaterial2]
        )
        let anchor2 = AnchorEntity(.image(group: "AR Resources", name: "pattern2"))
        entity2.setParent(anchor2)
        arView.scene.anchors.append(anchor2)
        
        return arView
    }
    func updateUIView(_ uiView: ARView, context: Context) { }
}
