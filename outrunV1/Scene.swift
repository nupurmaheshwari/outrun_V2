import SpriteKit
import ARKit

class Scene: SKScene {
      
    var lol:Int = 0
    let zombiesLabel = SKLabelNode(text: "100")
    var creationTime : TimeInterval = 0
    var points = 100 {
        didSet{
            self.zombiesLabel.text = "Points: \(points)"
        }
    }
    
    var zombieCount = 0
    
    let killSound = SKAction.playSoundFileNamed("zombie", waitForCompletion: false)

    
    override func didMove(to view: SKView) {
        zombiesLabel.fontSize = 26
        zombiesLabel.fontName = "AvenirNextCondensed-Regular"
        zombiesLabel.color = .white
        zombiesLabel.position = CGPoint(x: 95, y: 36)
        addChild(zombiesLabel)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        lol += 1
        
        if lol % 60 == 0 {
            points -= 1
        }

        
        if currentTime > creationTime {
            createZombieAnchor()
            creationTime = currentTime + TimeInterval(randomFloat(min: 20.0, max: 30.0))
        }
    }

    
    func randomFloat(min: Float, max: Float) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
    
    func createZombieAnchor() {
    
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
        // Define 360º in radians
        let _360degrees = 2.0 * Float.pi
        
        // Create a rotation matrix in the X-axis
        let rotateX = simd_float4x4(SCNMatrix4MakeRotation(_360degrees * randomFloat(min: 0.4, max: 0.6), 1, 0, 0))
        
        // Create a rotation matrix in the Y-axis
        let rotateY = simd_float4x4(SCNMatrix4MakeRotation(_360degrees * randomFloat(min: 0.4, max: 0.6), 0, 1, 0))
        
        // Combine both rotation matrices
        let rotation = simd_mul(rotateX, rotateY)
        
        // Create a translation matrix in the Z-axis with a value between 1 and 2 meters
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -1 - randomFloat(min: 0.0, max: 1.0)
        
        // Combine the rotation and translation matrices
        let transform = simd_mul(rotation, translation)
        
        // Create an anchor
        let anchor = ARAnchor(transform: transform)
        
        zombieCount += 1
        
        // Add the anchor
        sceneView.session.add(anchor: anchor)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get the first touch
        guard let touch = touches.first else {
            return
        }
        // Get the location in the AR scene
        let location = touch.location(in: self)
        
        // Get the nodes at that location
        let hit = nodes(at: location)
        
        // Get the first node (if any)
        if let node = hit.first {
            // Check if the node is a zombie (remember that labels are also a node)
            if node.name == "zombie" {
                let fadeOut = SKAction.fadeOut(withDuration: 0.5)
                let remove = SKAction.removeFromParent()
                
                // Group the fade out and sound actions
                let groupKillingActions = SKAction.group([fadeOut, killSound])
                // Create an action sequence
                let sequenceAction = SKAction.sequence([groupKillingActions, remove])
                
                points += 100
                
                // Excecute the actions
                node.run(sequenceAction)
            }
            
            else if node.name == "box" {
                 let fadeOut = SKAction.fadeOut(withDuration: 0.5)
                 let remove = SKAction.removeFromParent()
                 
                 // Group the fade out and sound actions
                 let groupKillingActions = SKAction.group([fadeOut])
                 // Create an action sequence
                 let sequenceAction = SKAction.sequence([groupKillingActions, remove])
                 
                 points += 10
                 
                 // Excecute the actions
                 node.run(sequenceAction)
             }
            
        }
    }
}
