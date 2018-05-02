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
    
    var Select_Actions = [SKAction]()
    var Shield_Actions = [SKAction]()

    var Laser_Actions = [SKAction]()
    var Missile_Actions = [SKAction]()

    var ELaser_Actions = [SKAction]()
    var EMissile_Actions = [SKAction]()

    var Active: (isActive: Bool, isCrew: Bool, crew: Entity, room: Room)

    var Ship: SKSpriteNode
    var Shield: SKSpriteNode
    var EnemyShip: SKSpriteNode
    var EnemyShield: SKSpriteNode
    var Laser: SKSpriteNode
    var Missile: SKSpriteNode
    var EnemyLaser: SKSpriteNode
    var EnemyMissile: SKSpriteNode
    var Background: SKSpriteNode
    var Selection: SKSpriteNode

    var UI: CombatUI?
    var Inf: CombatInfo
    var Master: Game
    
    init(game: Game) {
        Master = game
        Inf = CombatInfo()

        let base = #imageLiteral(resourceName: "floor")
        let pilot_ico = #imageLiteral(resourceName: "pilot_icon")
        let shield_ico = #imageLiteral(resourceName: "shield_icon")
        let engineer_ico = #imageLiteral(resourceName: "engineer_icon")
        let laser_ico = #imageLiteral(resourceName: "laser_icon")
        let missile_ico = #imageLiteral(resourceName: "missile_icon")
        let size = CGSize(width: base.size.width, height: base.size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        base.draw(in: CGRect(x:0, y:0, width: base.size.width, height: base.size.height));
        pilot_ico.draw(in: CGRect(x:base.size.width / 4, y:base.size.height / 4, width: base.size.width / 2, height: base.size.height / 2));
        let pilotRoom:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        base.draw(in: CGRect(x:0, y:0, width: base.size.width, height: base.size.height));
        shield_ico.draw(in: CGRect(x:base.size.width / 4, y:base.size.height / 4, width: base.size.width / 2, height: base.size.height / 2));
        let shieldRoom:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        base.draw(in: CGRect(x:0, y:0, width: base.size.width, height: base.size.height));
        engineer_ico.draw(in: CGRect(x:base.size.width / 4, y:base.size.height / 4, width: base.size.width / 2, height: base.size.height / 2));
        let engineerRoom:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        base.draw(in: CGRect(x:0, y:0, width: base.size.width, height: base.size.height));
        laser_ico.draw(in: CGRect(x:base.size.width / 4, y:base.size.height / 4, width: base.size.width / 2, height: base.size.height / 2));
        let laserRoom:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        base.draw(in: CGRect(x:0, y:0, width: base.size.width, height: base.size.height));
        missile_ico.draw(in: CGRect(x:base.size.width / 4, y:base.size.height / 4, width: base.size.width / 2, height: base.size.height / 2));
        let missileRoom:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        Rooms.append(Room(type: Room.Name.PILOT, image: pilotRoom, x: 120, y: 0, w: 80, h: 80))
        Rooms.append(Room(type: Room.Name.SHIELD, image: shieldRoom, x: 40, y: 40, w: 80, h: 80))
        Rooms.append(Room(type: Room.Name.ENGINE, image: engineerRoom, x: 40, y: -40, w: 80, h: 80))
        Rooms.append(Room(type: Room.Name.LASER, image: laserRoom, x: -40, y:-40, w: 80, h: 80))
        Rooms.append(Room(type: Room.Name.MISSILE, image: missileRoom, x: -40, y: 40, w: 80, h: 80))
        
        Crew.append(Entity(image: #imageLiteral(resourceName: "crew"), x: -100, y: 50, room: Rooms[0]))
        Crew.append(Entity(image: #imageLiteral(resourceName: "crew"), x: 0, y: 50, room: Rooms[1]))
        Crew.append(Entity(image: #imageLiteral(resourceName: "crew"), x: 100, y: 50, room: Rooms[2]))
        
        Ship = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Ship")))
        Ship.position = CGPoint(x: -150, y: 0)
        Ship.size = CGSize(width: 500, height: 350)
        Ship.zPosition = 1
        Shield = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Shield_faded")))
        Shield.position = CGPoint(x: -150, y: 0)
        Shield.size = CGSize(width: 500, height: 480)
        Shield.zPosition = 5
        
        EnemyShip = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "enemy_ship_one")))
        EnemyShip.position = CGPoint(x: 250, y: 0)
        EnemyShip.size = CGSize(width: 200, height: 300)
        EnemyShip.zPosition = 1
        EnemyShield = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Shield_faded")))
        EnemyShield.position = CGPoint(x: 250, y: 0)
        EnemyShield.size = CGSize(width: 300, height: 320)
        EnemyShield.zPosition = 5

        //Begins at -150, +-150
        //Goes to 250, 0
        Laser = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "laser")))
        Laser.position = CGPoint(x: -160, y: -150)
        Laser.size = CGSize(width: 100, height: 24)
        Laser.zPosition = 6
        Missile = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "missile")))
        Missile.position = CGPoint(x: -150, y: 150)
        Missile.size = CGSize(width: 100, height: 32)
        Missile.zPosition = 4
        
        //Begins at 250+-30, 0
        //Goes to -100, 0
        EnemyLaser = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "laser")))
        EnemyLaser.position = CGPoint(x: 250, y: 0)
        EnemyLaser.size = CGSize(width: 100, height: 24)
        EnemyLaser.zPosition = 6
        EnemyMissile = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "missile")))
        EnemyMissile.position = CGPoint(x: 250, y: 0)
        EnemyMissile.size = CGSize(width: 100, height: 32)
        EnemyMissile.zPosition = 4
        
        Background = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "galaxy_pinkblack")))
        Background.position = CGPoint(x: 0, y: 0)
        Background.zPosition = 0
        Selection = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "frame")))
        Selection.position = CGPoint(x: -500, y: -500)
        Selection.size = CGSize(width: 16, height: 16)
        Selection.zPosition = 4
        
        Active = (isActive: false, isCrew: false, crew: Crew[0], room: Rooms[0])
    }
    
    func Add_Children(GameScene:SKScene) {
        UI = CombatUI(master: self, inf: Inf)
        UI!.Add_Children(GameScene: GameScene)
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
        GameScene.addChild(Shield)
        GameScene.addChild(EnemyShip)
        GameScene.addChild(EnemyShield)
        GameScene.addChild(Laser)
        GameScene.addChild(Missile)
        GameScene.addChild(EnemyLaser)
        GameScene.addChild(EnemyMissile)

        Laser.run(SKAction.fadeOut(withDuration: 0))
        Missile.run(SKAction.fadeOut(withDuration: 0))
        EnemyLaser.run(SKAction.fadeOut(withDuration: 0))
        EnemyMissile.run(SKAction.fadeOut(withDuration: 0))
    }
    func Update() {
        Inf.Update()
        UI?.Update()

        for ent in Crew {
            ent.Update()
        }
        for act in Select_Actions {
            Selection.run(act)
        }
        if !Inf.ShieldActive && Inf.IsShieldReady() {
            ToggleShield()
        }
        for act in Shield_Actions {
            Shield.run(act)
            Shield_Actions.remove(at: 0)
        }

        for act in Laser_Actions {
            if !Laser.hasActions() {
                Laser.run(act)
                Laser_Actions.remove(at: 0)
                break
            }else {
                break
            }
        }
        for act in Missile_Actions {
            if !Missile.hasActions() {
                Missile.run(act)
                Missile_Actions.remove(at: 0)
                break
            }else {
                break
            }
        }
        for act in ELaser_Actions {
            if !EnemyLaser.hasActions() {
                EnemyLaser.run(act)
                ELaser_Actions.remove(at: 0)
                break
            }else {
                break
            }
        }
        for act in EMissile_Actions {
            if !EnemyMissile.hasActions() {
                EnemyMissile.run(act)
                EMissile_Actions.remove(at: 0)
                break
            }else {
                break
            }
        }
    }
    //Touch input
    func touchDown(atPoint pos: CGPoint) {
        //First check for UI input
        if UI!.touchDown(atPoint: pos) {
            return
        }

        //Then check for entity or room touches
        if let ent = Get_Crew_At_Pos(pos: pos) {
            //Move selection to crew and mark as active
            Active.isActive = true
            Active.isCrew = true
            Active.crew = ent
            Move_Seletion_Frame(node: ent.Sprite)
        }
        else if let room = Get_Room_At_Pos(pos: pos) {
            if Active.isActive {
                if Active.isCrew {
                    //Move crew to room and redist buffs
                    Active.crew.Move_To_Room(room: room)
                    Active.isActive = false
                    Move_Seletion_Frame_Off_Screen()
                    Inf.DistributeBuffs(shield: Rooms[1].GetCount(), laser: Rooms[3].GetCount(), missile: Rooms[4].GetCount())
                }else {
                    Active.isCrew = false
                    Active.room = room
                    Move_Seletion_Frame(node: room.Sprite)
                }
            }else {
                //Move selection to room and set as active
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
    //Essentially Deselecting the selection frame
    func Move_Seletion_Frame_Off_Screen() {
        let move = SKAction.move(to: CGPoint(x: -1000, y: -1000) , duration: 0.01)
        Select_Actions.append(move)
    }
    //Queues an action to move selection for the update loop
    func Move_Seletion_Frame(node: SKSpriteNode) {
        let move = SKAction.move(to: node.position , duration: 0.01)
        let scale = SKAction.scale(to: node.size, duration: 0.01)
        Select_Actions.append(move)
        Select_Actions.append(scale)
    }
    //Checks if a point is within a sprite node
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
    //Translates a point to a crew entity
    func Get_Crew_At_Pos(pos: CGPoint)->Entity?{
        for e in Crew {
            if(Is_In_Bounds(node: e.Sprite, pos: pos)) {
                return e;
            }
        }
        return nil;
    }
    //Translates a point to a room entity
    func Get_Room_At_Pos(pos: CGPoint)->Room?{
        for r in Rooms {
            if(Is_In_Bounds(node: r.Sprite, pos: pos)) {
                return r;
            }
        }
        return nil;
    }
    //Toggles the players shield state via fadein/fadeout
    func ToggleShield() {
        if Inf.ShieldActive {
            Inf.ShieldActive = false
            let fade = SKAction.fadeOut(withDuration: 0.5)
            Shield_Actions.append(fade)
        }
        else {
            Inf.ShieldActive = true
            let fade = SKAction.fadeIn(withDuration: 0.5)
            Shield_Actions.append(fade)
        }
        print("Shield status \(Inf.ShieldActive)")
    }
    func FireMissile() {
        if Inf.UseMissile() {
            //Begins at -150, +-150
            //Goes to 250, 0
            let resetPos = SKAction.move(to: CGPoint(x: -155, y: 150), duration: 0)
            let fadein = SKAction.fadeIn(withDuration: 0)
            let shoot = SKAction.move(to: CGPoint(x: 250, y: -10), duration: 1)
            let fadeout = SKAction.fadeOut(withDuration: 0.1)
            Missile_Actions.append(SKAction.sequence([resetPos, fadein, shoot, fadeout]))
        }
        print("Missile fired")
    }
    func FireLaser() {
        print("Laser fired")
    }
    func HitEnemy(isLaser: Bool) {
        
    }
}

