//
//  Game.swift
//  FTD
//
//  Created by Josh Hess on 3/27/18.
//  Copyright © 2018 Ephemerality. All rights reserved.
//

import SpriteKit
import GameplayKit

class Game {

    var Crew = [Entity]()
    var Rooms = [Room]()
    var Selection: SKSpriteNode

    init() {
        Crew.append(Entity(image: #imageLiteral(resourceName: "waypoint_node"), x: -100, y: 50, w: 32, h: 64))
        Crew.append(Entity(image: #imageLiteral(resourceName: "waypoint_node"), x: -100, y: 50, w: 32, h: 64))
        Crew.append(Entity(image: #imageLiteral(resourceName: "waypoint_node"), x: -100, y: 50, w: 32, h: 64))

        Rooms.append(Room(type: Room.Name.PILOT, image: #imageLiteral(resourceName: "galaxy"), x: 150, y: 0, w: 100, h: 100))
        Rooms.append(Room(type: Room.Name.SHIELD, image: #imageLiteral(resourceName: "galaxy"), x: 50, y: 50, w: 100, h: 100))
        Rooms.append(Room(type: Room.Name.LASER, image: #imageLiteral(resourceName: "galaxy"), x: 50, y: -50, w: 100, h: 100))
        Rooms.append(Room(type: Room.Name.ENGINE, image: #imageLiteral(resourceName: "galaxy"), x: -50, y:-50, w: 100, h: 100))
        Rooms.append(Room(type: Room.Name.UTILITY, image: #imageLiteral(resourceName: "galaxy"), x: -50, y: 50, w: 100, h: 100))
    }

    func Add_Children(GameScene:SKScene) {
        for ent in Crew {
            GameScene.addChild(ent.Sprite)
        }
        for room in Rooms {
            GameScene.addChild(room.Sprite)
        }
    }
    func Update() {
        for ent in Crew {
            ent.Update()
        }
    }
    func Is_In_Bounds(node: SPSpriteNode, pos: CGPoint)->Bool {
        let x0 = node.position.x
        let y0 = node.position.y
        let x1 = x0 + node.size.width
        let y1 = y0 + node.size.height
        let betweenX:Bool = (pos.x > x0 && pos.x < x1) || (pos.x > x1 && pos.x < x0)
        let betweenY:Bool = (pos.y > y0 && pos.y < y1) || (pos.y > y1 && pos.y < y0)
        return betweenX && betweenY
    }
    func Is_In_Bounds(a: CGPoint, b: CGPoint, pos: CGPoint)->Bool {
        let betweenX:Bool = (pos.x > a.x && pos.x < b.x) || (pos.x > b.x && pos.x < a.x)
        let betweenY:Bool = (pos.y > a.y && pos.y < b.y) || (pos.y > b.y && pos.y < a.y)
        return betweenX && betweenY
    }
    func Get_Crew_At_Pos(pos: CGPoint)->Entity?{
        for e in Crew {
            if(Is_In_Bounds(node: e.Sprite, pos: pos)) {
                return e;
            }
        }
        return nil;
    }
    func Get_Room_At_Pos(pos: CGPoint)->Room?{
        for r in Room {
            if(Is_In_Bounds(node: r.Sprite, pos: pos)) {
                return r;
            }
        }
        return nil;
    }






}
