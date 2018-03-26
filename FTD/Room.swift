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
        if(present_crew.count < 4) {
            var x = Sprite.position.x
            var y = Sprite.position.y
            x = (present_crew.count == 0 || present_crew.count == 2) ? x - 20 : x + 20;
            y = (present_crew.count > 1) ? y - 20 : y + 20
            crew.Move(x: x, y: y, d: 0.25)
            present_crew.append(crew)
        }
    }
    func Remove_Crew_Member(crew: Entity) {
        var tmp = [Entity]()
        for e in present_crew {
            if e !== crew {
                tmp.append(e)
            }
        }
        present_crew.removeAll()
        for e in tmp {
            Add_Crew(crew: e)
        }
    }







}
