import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let cardData = CardModel.getCardData()
        
//        var myMaterial = [PhysicallyBasedMaterial()]
        
//        ForEach(1..<25) { index in
        var myMaterial = PhysicallyBasedMaterial()
        if let baseResource = try? TextureResource.load(named: cardData[0].imageName) {
                // Create a material parameter and assign it.
        myMaterial.baseColor = PhysicallyBasedMaterial.BaseColor(texture:MaterialParameters.Texture(baseResource))}
            
        let entity = ModelEntity(
            mesh: .generateBox(width: 0.5, height:1, depth: 0.001),
            materials: [myMaterial])
        let anchor = AnchorEntity(.image(group: "AR Resources", name: cardData[0].pattern))
        
        // Retrieve the current transformation of the model entity
        var transform = entity.transform
        // // Set the rotation of the entity
        transform.rotation = simd_quatf(angle: .pi, axis: [0,1,0])
        
        entity.setParent(anchor)
        arView.scene.anchors.append(anchor)
        // Move the modelEntity to its new transformed position
        entity.move(to: transform, relativeTo: entity.parent, duration: 6.0)
//        }
        
        // kartu 2
        var myMaterial2 = PhysicallyBasedMaterial()
        if let baseResource2 = try? TextureResource.load(named: cardData[1].imageName) {
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
