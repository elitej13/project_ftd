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
    var Active: (isActive: Bool, isCrew: Bool, crew: Entity, room: Room)
    var Ship: SKSpriteNode
    var Background: SKSpriteNode

    init() {
        Rooms.append(Room(type: Room.Name.PILOT, image: #imageLiteral(resourceName: "floor"), x: 150, y: 0, w: 100, h: 100))
        Rooms.append(Room(type: Room.Name.SHIELD, image: #imageLiteral(resourceName: "floor"), x: 50, y: 50, w: 100, h: 100))
        Rooms.append(Room(type: Room.Name.LASER, image: #imageLiteral(resourceName: "floor"), x: 50, y: -50, w: 100, h: 100))
        Rooms.append(Room(type: Room.Name.ENGINE, image: #imageLiteral(resourceName: "floor"), x: -50, y:-50, w: 100, h: 100))
        Rooms.append(Room(type: Room.Name.UTILITY, image: #imageLiteral(resourceName: "floor"), x: -50, y: 50, w: 100, h: 100))
        
        Crew.append(Entity(image: #imageLiteral(resourceName: "crew"), x: -100, y: 50, w: 16, h: 16, room: Rooms[0]))
        Crew.append(Entity(image: #imageLiteral(resourceName: "crew"), x: 0, y: 50, w: 16, h: 16, room: Rooms[1]))
        Crew.append(Entity(image: #imageLiteral(resourceName: "crew"), x: 100, y: 50, w: 16, h: 16, room: Rooms[2]))
        
        Background = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "galaxy")))
        Background.position = CGPoint(x: 0, y: 0)
        Background.zPosition = 0
        
        Ship = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Ship")))
        Ship.position = CGPoint(x: -200, y: 0)
        Ship.size = CGSize(width: 350, height: 300)
        Ship.zPosition = 1
        
        Selection = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "waypoint_node")))
        Selection.position = CGPoint(x: -200, y: -200)
        Selection.size = CGSize(width: 16, height: 16)
        Selection.zPosition = 4

        Active = (isActive: false, isCrew: false, crew: Crew[0], room: Rooms[0])
    }

    func Add_Children(GameScene:SKScene) {
        for ent in Crew {
            GameScene.addChild(ent.Sprite)
        }
        for room in Rooms {
            GameScene.addChild(room.Sprite)
        }
        //Background.size = CGSize(width: GameScene.size.width, height: GameScene.size.height)
        GameScene.addChild(Background)
        GameScene.addChild(Selection)
        GameScene.addChild(Ship)
    }
    func Update() {
        for ent in Crew {
            ent.Update()
        }
    }
    func touchDown(atPoint pos : CGPoint) {
        if let ent = Get_Crew_At_Pos(pos: pos) {
            //Show info
            Active.isActive = true
            Active.isCrew = true
            Active.crew = ent
        }
        else if let room = Get_Room_At_Pos(pos: pos) {
            if Active.isActive {
                if Active.isCrew {
                    Active.crew.Move_To_Room(room: room)
                }else {
                    Active.isCrew = false
                    Active.room = room
                }
            }else {
                Active.isActive = true
                Active.isCrew = false
                Active.room = room
            }
        }
        else {
            //Void selection
            Active.isActive = false
        }
    }
    func Is_In_Bounds(node: SKSpriteNode, pos: CGPoint)->Bool {
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
        for r in Rooms {
            if(Is_In_Bounds(node: r.Sprite, pos: pos)) {
                return r;
            }
        }
        return nil;
    }






}
