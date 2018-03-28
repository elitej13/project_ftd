//
//  Room.swift
//  FTD
//
//  Created by Josh Hess on 3/27/18.
//  Copyright © 2018 Ephemerality. All rights reserved.
//

import SpriteKit
import GameplayKit

class Room {

    enum Name {
        case LASER
        case SHIELD
        case ENGINE
        case UTILITY
        case PILOT
    }

    var name : Name
    var present_crew = [Entity]()
    var Sprite:SKSpriteNode

    init(type: Name, image: UIImage, x:CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        Sprite = SKSpriteNode(texture: SKTexture(image: image))
        Sprite.position = CGPoint(x:x - 200, y:y)
        Sprite.zPosition = 2
        Sprite.size = CGSize(width:w, height:h)
        name = type
    }

    func Add_Crew(crew: Entity) {

    }







}
