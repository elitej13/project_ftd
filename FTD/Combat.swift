//
//  Combat.swift
//  FTD
//
//  Created by Josh Hess on 3/27/18.
//  Copyright © 2018 Ephemerality. All rights reserved.
//

import SpriteKit
import GameplayKit

class Combat {
    
    var Crew = [Entity]()
    var Rooms = [Room]()
    var Selection: SKSpriteNode
    var Actions = [SKAction]()
    var Active: (isActive: Bool, isCrew: Bool, crew: Entity, room: Room)
    var Ship: SKSpriteNode
    var EnemyShip: SKSpriteNode
    var Background: SKSpriteNode
    var UI: CombatUI?
    var Inf: CombatInfo
    var Master: Game
    
    init(game: Game) {
        Master = game
        Inf = CombatInfo()

        let base = #imageLiteral(resourceName: "floor")
        let pilotico = #imageLiteral(resourceName: "pilot_icon")
        let shieldico = #imageLiteral(resourceName: "shield")
        let engineerico = #imageLiteral(resourceName: "engineer")
        let size = CGSize(width: base.size.width, height: base.size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        base.draw(in: CGRect(x:0, y:0, width: base.size.width, height: base.size.height));
        pilotico.draw(in: CGRect(x:base.size.width / 4, y:base.size.height / 4, width: base.size.width / 2, height: base.size.height / 2));
        let pilotRoom:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        base.draw(in: CGRect(x:0, y:0, width: base.size.width, height: base.size.height));
        shieldico.draw(in: CGRect(x:base.size.width / 4, y:base.size.height / 4, width: base.size.width / 2, height: base.size.height / 2));
        let shieldRoom:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        base.draw(in: CGRect(x:0, y:0, width: base.size.width, height: base.size.height));
        engineerico.draw(in: CGRect(x:base.size.width / 4, y:base.size.height / 4, width: base.size.width / 2, height: base.size.height / 2));
        let engineerRoom:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        Rooms.append(Room(type: Room.Name.PILOT, image: pilotRoom, x: 120, y: 0, w: 80, h: 80))
        Rooms.append(Room(type: Room.Name.SHIELD, image: shieldRoom, x: 40, y: 40, w: 80, h: 80))
        Rooms.append(Room(type: Room.Name.LASER, image: #imageLiteral(resourceName: "floor"), x: 40, y: -40, w: 80, h: 80))
        Rooms.append(Room(type: Room.Name.ENGINE, image: engineerRoom, x: -40, y:-40, w: 80, h: 80))
        Rooms.append(Room(type: Room.Name.UTILITY, image: #imageLiteral(resourceName: "floor"), x: -40, y: 40, w: 80, h: 80))
        
        Crew.append(Entity(image: #imageLiteral(resourceName: "crew"), x: -100, y: 50, room: Rooms[0]))
        Crew.append(Entity(image: #imageLiteral(resourceName: "crew"), x: 0, y: 50, room: Rooms[1]))
        Crew.append(Entity(image: #imageLiteral(resourceName: "crew"), x: 100, y: 50, room: Rooms[2]))
        
        Background = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "galaxy_pinkblack")))
        Background.position = CGPoint(x: 0, y: 0)
        Background.zPosition = 0
        
        Ship = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Ship")))
        Ship.position = CGPoint(x: -150, y: 0)
        Ship.size = CGSize(width: 500, height: 350)
        Ship.zPosition = 1
        
        EnemyShip = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "enemy_ship_one")))
        EnemyShip.position = CGPoint(x: 250, y: 0)
        EnemyShip.size = CGSize(width: 200, height: 300)
        EnemyShip.zPosition = 1
        
        Selection = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "frame")))
        Selection.position = CGPoint(x: -500, y: -500)
        Selection.size = CGSize(width: 16, height: 16)
        Selection.zPosition = 4
        
        Active = (isActive: false, isCrew: false, crew: Crew[0], room: Rooms[0])
    }
    
    func Add_Children(GameScene:SKScene) {
        UI = CombatUI(master: self)
        for ent in Crew {
            GameScene.addChild(ent.Sprite)
        }
        for room in Rooms {
            GameScene.addChild(room.Sprite)
        }
        //Background.size = CGSize(width: GameScene.size.width, height: GameScene.size.height)
        GameScene.addChild(Background)
        GameScene.addChild(Selection)
        GameScene.addChild(EnemyShip)
        GameScene.addChild(Ship)
    }
    func Update() {
        CombatInfo.Update()
        CombatUI?.Update()

        for ent in Crew {
            ent.Update()
        }
        for act in Actions{
            Selection.run(act)
        }
    }
    func touchDown(atPoint pos: CGPoint) {
        //First check for UI input
        if UI.touchDown(atPoint: pos) {
            return
        }

        //Then check for entity or room presses
        if let ent = Get_Crew_At_Pos(pos: pos) {
            //Show info
            Active.isActive = true
            Active.isCrew = true
            Active.crew = ent
            Move_Seletion_Frame(node: ent.Sprite)
        }
        else if let room = Get_Room_At_Pos(pos: pos) {
            if Active.isActive {
                if Active.isCrew {
                    Active.crew.Move_To_Room(room: room)
                    Active.isActive = false
                    Move_Seletion_Frame_Off_Screen()
                }else {
                    Active.isCrew = false
                    Active.room = room
                    Move_Seletion_Frame(node: room.Sprite)
                }
            }else {
                Active.isActive = true
                Active.isCrew = false
                Active.room = room
                Move_Seletion_Frame(node: room.Sprite)
            }
        }
        else {
            //Void selection
            Active.isActive = false
            Move_Seletion_Frame_Off_Screen()
        }
    }
    func Move_Seletion_Frame_Off_Screen() {
        let move = SKAction.move(to: CGPoint(x: -1000, y: -1000) , duration: 0.01)
        Actions.append(move)
    }
    func Move_Seletion_Frame(node: SKSpriteNode) {
        let move = SKAction.move(to: node.position , duration: 0.01)
        let scale = SKAction.scale(to: node.size, duration: 0.01)
        Actions.append(move)
        Actions.append(scale)
    }
    func Is_In_Bounds(node: SKSpriteNode, pos: CGPoint)->Bool {
        let x0 = node.position.x - (node.size.width / 2)
        let y0 = node.position.y - (node.size.height / 2)
        let x1 = x0 + (node.size.width)
        let y1 = y0 + (node.size.height)
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


    func ToggleShield() {
        Inf.ShieldActive = !Inf.ShieldActive
        print("Shield status \(Inf.ShieldActive)")
    }
    func FireMissile() {
        print("Missile fired")
    }
    func FireLaser() {
        print("Laser fired")
    }
}

