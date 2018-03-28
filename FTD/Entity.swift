//
//  Entity.swift
//  FTD
//
//  Created by Josh Hess on 3/27/18.
//  Copyright © 2018 Ephemerality. All rights reserved.
//

import SpriteKit
import GameplayKit

class Entity {

    var Sprite:SKSpriteNode
    var Actions:[SKAction]
    
    init(image: SKImage, x:CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        Sprite = SKSpriteNode(texture: SKTexture(image: image), x:x, y:y, w:w, h:h)
        Actions = [SKAction]()
    }
    func Update() {
        for act in Actions{
            Sprite.run(act)
        }
    }
    
}