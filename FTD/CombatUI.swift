//
//  CombatUI.swift
//  FTD
//
//  Created by Josh Hess on 3/27/18.
//  Copyright © 2018 Ephemerality. All rights reserved.
//

import SpriteKit
import GameplayKit

class CombatUI {
    
    var Master: Combat
    var Inf: CombatInfo
    let WIDTH_BTN = 130
    let HEIGHT_BTN = 35

    var Enemy_Health_BRD: SKSpriteNode
    var Player_Health_BRD: SKSpriteNode

    var Enemy_Health_PRG: SKSpriteNode
    var Player_Health_PRG: SKSpriteNode

    var Shield_BTN: SKSpriteNode
    var Missile_BTN: SKSpriteNode
    var Laser_BTN: SKSpriteNode
    
    var Shield_PRG: SKSpriteNode
    var Missile_PRG: SKSpriteNode
    var Laser_PRG: SKSpriteNode

    var Shield_LBL: SKLabelNode
    var Missile_LBL: SKLabelNode
    var Laser_LBL: SKLabelNode

    init(master: Combat, inf: CombatInfo) {
        Master = master
        Inf = inf
        
        Enemy_Health_BRD = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Frame_BTN")))
        Enemy_Health_BRD.position = CGPoint(x: 300, y: 175)
        Enemy_Health_BRD.size = CGSize(width: 200, height: 25)
        Enemy_Health_BRD.zPosition = 3

        Player_Health_BRD = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Frame_BTN")))
        Player_Health_BRD.position = CGPoint(x: -300, y: -175)
        Player_Health_BRD.size = CGSize(width: 200, height: 25)
        Player_Health_BRD.zPosition = 3


        Enemy_Health_PRG = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Frame_PRG")))
        Enemy_Health_PRG.position = CGPoint(x: 300, y: 175)
        Enemy_Health_PRG.size = CGSize(width: 200, height: 25)
        Enemy_Health_PRG.zPosition = 4

        Player_Health_PRG = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Frame_PRG")))
        Player_Health_PRG.position = CGPoint(x: -300, y: 175)
        Player_Health_PRG.size = CGSize(width: 200, height: 25)
        Player_Health_PRG.zPosition = 4


        Shield_BTN = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Frame_BTN")))
        Shield_BTN.position = CGPoint(x: -300, y: -175)
        Shield_BTN.size = CGSize(width: WIDTH_BTN, height: HEIGHT_BTN)
        Shield_BTN.zPosition = 3
        
        Missile_BTN = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Frame_BTN")))
        Missile_BTN.position = CGPoint(x: -150, y: -175)
        Missile_BTN.size = CGSize(width: WIDTH_BTN, height: HEIGHT_BTN)
        Missile_BTN.zPosition = 3

        Laser_BTN = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Frame_BTN")))
        Laser_BTN.position = CGPoint(x: 0, y: -175)
        Laser_BTN.size = CGSize(width: WIDTH_BTN, height: HEIGHT_BTN)
        Laser_BTN.zPosition = 3
        

        Shield_PRG = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Frame_PRG")))
        Shield_PRG.position = CGPoint(x: -300, y: -175)
        Shield_PRG.size = CGSize(width: WIDTH_BTN, height: HEIGHT_BTN)
        Shield_PRG.zPosition = 4
        
        Missile_PRG = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Frame_PRG")))
        Missile_PRG.position = CGPoint(x: -150, y: -175)
        Missile_PRG.size = CGSize(width: WIDTH_BTN, height: HEIGHT_BTN)
        Missile_PRG.zPosition = 4

        Laser_PRG = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Frame_PRG")))
        Laser_PRG.position = CGPoint(x: 0, y: -175)
        Laser_PRG.size = CGSize(width: WIDTH_BTN, height: HEIGHT_BTN)
        Laser_PRG.zPosition = 4


        Shield_LBL = SKLabelNode(text: "Shields")
        Shield_LBL.position = CGPoint(x: -300, y: -185)
        Shield_LBL.fontColor = SKColor.black
        Shield_LBL.fontName = "Marion-Bold"
        Shield_LBL.fontSize = 30
        Shield_LBL.zPosition = 5
        
        Missile_LBL = SKLabelNode(text: "Missiles")
        Missile_LBL.position = CGPoint(x: -150, y: -185)
        Missile_LBL.fontColor = SKColor.black
        Missile_LBL.fontName = "Marion-Bold"
        Missile_LBL.fontSize = 30
        Missile_LBL.zPosition = 5

        Laser_LBL = SKLabelNode(text: "Lasers")
        Laser_LBL.position = CGPoint(x: 0, y: -185)
        Laser_LBL.fontColor = SKColor.black
        Laser_LBL.fontName = "Marion-Bold"
        Laser_LBL.fontSize = 30
        Laser_LBL.zPosition = 5
    }

    func Add_Children(GameScene:SKScene) {
        GameScene.addChild(Shield_BTN)
        GameScene.addChild(Missile_BTN)
        GameScene.addChild(Laser_BTN)

        GameScene.addChild(Shield_PRG)
        GameScene.addChild(Missile_PRG)
        GameScene.addChild(Laser_PRG)

        GameScene.addChild(Shield_LBL)
        GameScene.addChild(Missile_LBL)
        GameScene.addChild(Laser_LBL)

        GameScene.addChild(Enemy_Health_BRD)
        GameScene.addChild(Player_Health_PRG)

        GameScene.addChild(Enemy_Health_BRD)
        GameScene.addChild(Player_Health_PRG)
    }

    func Update() {
        Shield_PRG.size.width = CGFloat(Double(WIDTH_BTN) * Inf.GetShieldProgress())
        Missile_PRG.size.width = CGFloat(Double(WIDTH_BTN) * Inf.GetMissileProgress())
        Laser_PRG.size.width = CGFloat(Double(WIDTH_BTN)  * Inf.GetLaserProgress())
    }

    func touchDown(atPoint pos: CGPoint)->Bool {
        if Is_In_Bounds(node: Shield_BTN, pos: pos) {
            if Inf.IsShieldReady() {
                Master.ToggleShield()
                Inf.ResetShieldTimer()
                return true
            }
        }
        if Is_In_Bounds(node: Missile_BTN, pos: pos) {
            if Inf.IsMissileReady() {
                Master.FireMissile()
                Inf.ResetMissileTimer()
                return true
            }
        }
        if Is_In_Bounds(node: Laser_BTN, pos: pos) {
            if Inf.IsLaserReady() {
                Master.FireLaser()
                Inf.ResetLaserTimer()
                return true
            }
        }
        return false
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

}

