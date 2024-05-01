import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let cardData = CardModel.getCardData()
        
        for card in cardData {
            var myMaterial = PhysicallyBasedMaterial()
                
            if let baseResource = try? TextureResource.load(named: card.imageName) {
                // Create a material parameter and assign it.
                let baseColor = MaterialParameters.Texture(baseResource)
                myMaterial.baseColor = PhysicallyBasedMaterial.BaseColor(texture: baseColor)
            }
            
            let entity = ModelEntity(
                mesh: .generateBox(width: 0.5, height: 1, depth: 0.001),
                materials: [myMaterial])
            
            let anchor = AnchorEntity(.image(group: "AR Resources", name: card.pattern))
            
            entity.setParent(anchor)
            arView.scene.anchors.append(anchor)
            
            // Retrieve the current transformation of the model entity
            var transform = entity.transform
            // Set the rotation of the entity
            transform.rotation = simd_quatf(angle: .pi, axis: [0, 1, 0])
            
            // Apply the rotation animation with repeat count set to infinity
            entity.move(to: transform, relativeTo: entity.parent, duration: 6.0, timingFunction: .easeInOut)
        }
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) { }
}
