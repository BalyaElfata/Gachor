import SwiftUI
import RealityKit

class CustomCard: Entity, HasModel, HasCollision {
    required init(material: PhysicallyBasedMaterial) {
        super.init()
        self.model = ModelComponent(
            mesh: .generateBox(size: [0.9, 1.3, 0.001]), // Card Size
            materials: [material]
        )
        self.generateCollisionShapes(recursive: true) // enable interactions with model entity
    }

    required init() {
        fatalError("init() has not been implemented")
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let cardData = CardModel.getCardData()
        
        for card in cardData {
            // Custom texture for Model Entity
            var myMaterial = PhysicallyBasedMaterial()
            if let baseResource = try? TextureResource.load(named: card.imageName) {
                let baseColor = MaterialParameters.Texture(baseResource)
                myMaterial.baseColor = PhysicallyBasedMaterial.BaseColor(texture: baseColor)
            }
            
            let entity = CustomCard(material: myMaterial) // Model Entity
            
            let anchor = AnchorEntity(.image(group: "AR Resources", name: card.pattern)) // Anchor Entity
            entity.setParent(anchor)
            
            arView.installGestures([.rotation, .scale], for: entity) // add rotation and scale to entity
            
            // Add tap gesture recognizer to the ARView
            let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
            arView.addGestureRecognizer(tapGesture)
            
            arView.scene.anchors.append(anchor)
            
            // Retrieve the current transformation of the model entity
            var transform = entity.transform
            // Set the rotation of the entity
            transform.rotation = simd_quatf(angle: .pi, axis: [0, 1, 0])
            
            // Apply the rotation animation with repeat count set to infinity
            entity.move(to: transform, relativeTo: entity.parent, duration: 3.0, timingFunction: .easeInOut)
        }
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject {
        @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
            guard let arView = gestureRecognizer.view as? ARView else { return }
            let tapLocation = gestureRecognizer.location(in: arView)
            
            // Perform hit test to check if an entity is tapped
            if arView.entity(at: tapLocation) != nil {
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
                
                // Play sound when entity is tapped
                Sounds.playSound(sound: "powerup2", type: "wav")
                
            }}
    }
}
