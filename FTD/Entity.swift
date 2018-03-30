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

    public var Sprite:SKSpriteNode
    var Actions:[SKAction]
    public var Present_Room: Room
    
    init(image: UIImage, x:CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, room: Room) {
        Sprite = SKSpriteNode(texture: SKTexture(image: image))
        Sprite.position = CGPoint(x:x, y:y)
        Sprite.zPosition = 3
        Sprite.size = CGSize(width:w, height:h)
        Actions = [SKAction]()
        Present_Room = room
        Present_Room.Add_Crew(crew: self)
    }
    func Update() {
        for act in Actions{
            Sprite.run(act)
        }
    }
    func Move(x: CGFloat, y: CGFloat, d: Double) {
        let hMove = SKAction.moveTo(x: x, duration: d)
        let vMove = SKAction.moveTo(y: y, duration: d)
        Actions.append(hMove)
        Actions.append(vMove)
    }
    func Move_To_Room(room: Room) {
        //TODO: Remove buffs
        Present_Room.Remove_Crew_Member(crew: self)
        //TODO: Add in buffs
        Present_Room = room
        Present_Room.Add_Crew(crew: self)
    }
}
