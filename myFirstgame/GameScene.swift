//
//  GameScene.swift
//  myFirstgame
//
//  Created by SUMBUL on 2.04.2019.
//  Copyright © 2019 SUMBUL. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var backgraound = SKSpriteNode()
    var tree = SKSpriteNode()
    var bird = SKSpriteNode()
    var box  = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var gameStarted = false
    var originalPosition :CGPoint!
    var score = 0
    var scoreLabel = SKLabelNode()
    
    
    enum ColliderType: UInt32 {
        case Bird = 1
        case Box = 2
    }

    
    
    override func didMove(to view: SKView) {
        //physicsBody
      
        let texture2 = SKTexture(imageNamed:"backGraund.png")
        backgraound = SKSpriteNode(texture:  texture2 )
        backgraound.position=CGPoint(x: 0, y: 0)
        backgraound.size = CGSize(width: self.frame.width  ,height:  self.frame.height  )
        backgraound.zPosition = 1
        self.addChild(backgraound)
        
        let texture = SKTexture(imageNamed: "tree.png")
        tree = SKSpriteNode(texture: texture )
        tree.position = CGPoint(x: -460, y: -250)
        tree.size = CGSize(width: self.frame.width / 4, height: self.frame.height / 4 )
        tree.zPosition = 2
        self.addChild(tree)
        
        let texture3 = SKTexture(imageNamed: "bird.png")
        bird = SKSpriteNode(texture: texture3)
        bird.position = CGPoint(x: -460, y:-180)
        bird.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 10)
        bird.zPosition = 2
        bird.physicsBody = SKPhysicsBody(circleOfRadius: texture3.size().height / 12)
        physicsBody = SKPhysicsBody (edgeLoopFrom: frame)
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.1
        bird.physicsBody?.affectedByGravity = false
        originalPosition = bird.position
        
        
        bird.physicsBody!.contactTestBitMask = ColliderType.Bird.rawValue
        bird.physicsBody!.categoryBitMask = ColliderType.Bird.rawValue
        bird.physicsBody!.collisionBitMask = ColliderType.Box.rawValue
        
        
        self.addChild(bird)
        
        
        
        let texture4 = SKTexture(imageNamed: "box.png")
        
        let size = CGSize(width: texture4.size().width / 8 , height: texture4.size().height / 8)
        box = SKSpriteNode(texture: texture4)
        box.position = CGPoint(x: 222,y: -240)
        box.size = CGSize(width: self.frame.width / 8, height: self.frame.height / 8)
        box.zPosition=2
        box.physicsBody = SKPhysicsBody(rectangleOf:size)
        box.physicsBody?.isDynamic = true
        box.physicsBody?.affectedByGravity = true
        box.physicsBody?.allowsRotation = true
        box.physicsBody!.collisionBitMask = ColliderType.Bird.rawValue
        
        self.addChild(box)
        
        
        let texture5 = SKTexture(imageNamed: "box.png")
        box2 = SKSpriteNode(texture: texture5)
        box2.position = CGPoint(x: 290,y: 200)
        box2.size = CGSize(width: self.frame.width / 8, height: self.frame.height / 8)
        box2.zPosition=2
        box2.physicsBody = SKPhysicsBody (rectangleOf: size)
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody!.collisionBitMask = ColliderType.Bird.rawValue
        
        self.addChild(box2)
        
        
        
        
        let texture6 = SKTexture(imageNamed: "box.png")
        box3 = SKSpriteNode(texture: texture6)
        box3.position = CGPoint(x: 350,y: -240)
        box3.size = CGSize(width: self.frame.width / 8, height: self.frame.height / 8)
        box3.zPosition=2
        box3.physicsBody = SKPhysicsBody (rectangleOf: size )
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody!.collisionBitMask = ColliderType.Bird.rawValue
        
        self.addChild(box3)
        
    scoreLabel.fontName = "Helvetica"
    scoreLabel.fontSize = 60
    scoreLabel.text = "0"
    scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 4)
    scoreLabel.zPosition = 3
    self.addChild(scoreLabel)
}

func didBegin(_ contact: SKPhysicsContact) {
    if contact.bodyB.collisionBitMask  == ColliderType.Bird.rawValue || contact.bodyA.collisionBitMask == ColliderType.Bird.rawValue {
        
        score = score + 1
        scoreLabel.text = String(score)
        
    }
}
   
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes (at: touchLocation )
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                                
                            }
                        }
                    }
                }
                
                
            }
            
        }
        
        
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes (at: touchLocation )
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                                
                            }
                        }
                    }
                }
                
                
            }
            
        }
        
      
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes (at: touchLocation )
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                               
                                let dx = -(touchLocation.x - originalPosition.x)
                                let dy = -(touchLocation.y - originalPosition.y)
                                let impulse = CGVector(dx: dx , dy: dy )
                                bird.physicsBody?.applyImpulse(impulse)
                                bird.physicsBody?.affectedByGravity = true
                                gameStarted = true
                                
                            }
                        }
                    }
                }
                
                
            }
            
        }
        
        
        
        
        
        
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
        if let birdPhysicsBody = bird.physicsBody {
            if birdPhysicsBody.velocity.dx <= 0.1 && birdPhysicsBody.velocity.dy <= 0.1 && birdPhysicsBody.angularVelocity <= 0.1 && gameStarted == true {
                
                bird.physicsBody?.affectedByGravity = false
                bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird.physicsBody?.angularVelocity = 0
                bird.zRotation = 0
                bird.position = originalPosition
                
                score = 0
                scoreLabel.text = String(score)
                score = 0
                scoreLabel.text = String(score)
                gameStarted = false
                
                
                
            }
        }
        
        
        
    }
}
