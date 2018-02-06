//
//  GameScene.swift
//  FTD
//
//  Created by Josh Hess on 2/5/18.
//  Copyright © 2018 Ephemerality. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    
    
    private var lastUpdateTime : TimeInterval = 0
    private var background: SKSpriteNode?
    private var node: SKSpriteNode?
    
    override func sceneDidLoad() {
        init_overworld()
    }
    
    func init_overworld() {
        background = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "galaxy")))
        node = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "waypoint_node")))
        node?.size.width = 100
        node?.size.height = 100
        
        
        self.addChild(background!)
        self.addChild(node!)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
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
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
}
