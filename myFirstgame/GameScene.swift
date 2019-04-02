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
    
    
    
    override func didMove(to view: SKView) {
        
        let texture2 = SKTexture(imageNamed:"backGraund.png")
        backgraound = SKSpriteNode(texture:  texture2 )
        backgraound.position=CGPoint(x: 0, y: 0)
        backgraound.size = CGSize(width: self.frame.width ,height:  self.frame.height  )
        backgraound.zPosition = 1
        self.addChild(backgraound)
        
        let texture = SKTexture(imageNamed: "tree.png")
        tree = SKSpriteNode(texture: texture )
        tree.position = CGPoint(x: -460, y: -189)
        tree.size = CGSize(width: self.frame.width / 4, height: self.frame.height / 4 )
        tree.zPosition = 2
        self.addChild(tree)
        
        let texture3 = SKTexture(imageNamed: "bird.png")
        bird = SKSpriteNode(texture: texture3)
        bird.position = CGPoint(x: -460, y:-140)
        bird.size = CGSize(width: self.frame.width / 10,height: self.frame.height/11)
        bird.zPosition = 2
        self.addChild(bird)
        
        let texture4 = SKTexture(imageNamed: "box.png")
        box = SKSpriteNode(texture: texture4)
        box.position = CGPoint(x: 222,y: -256)
        box.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 10)
        box.zPosition=2
        self.addChild(box)
        
        
        let texture5 = SKTexture(imageNamed: "box.png")
        box2 = SKSpriteNode(texture: texture5)
        box2.position = CGPoint(x: 290,y: -179)
        box2.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 10)
        box2.zPosition=2
        self.addChild(box2)
        let texture6 = SKTexture(imageNamed: "box.png")
        box3 = SKSpriteNode(texture: texture6)
        box3.position = CGPoint(x: 350,y: -256)
        box3.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 10)
        box3.zPosition=2
        self.addChild(box3)
        
        
        
    
        
        
        
        
        
        
        
    }
    
    
 
   
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
