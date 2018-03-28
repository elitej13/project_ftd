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

    private var game: Game = Game()
    
    override func sceneDidLoad() {
        game.Add_Children(GameScene: self)
    }
   
    func touchDown(atPoint pos : CGPoint) {
        game.touchDown(atPoint: pos)
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
        //Update Game
        game.Update();     
        
        self.lastUpdateTime = currentTime
    }
}
