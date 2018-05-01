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
    var Inf: CombatInf
    let WIDTH_BTN = 100

    var Shield_BTN: SKSpriteNode
    var Missile_BTN: SKSpriteNode
    var Laser_BTN: SKSpriteNode
    
    var Shield_PRG: SKSpriteNode
    var Missile_PRG: SKSpriteNode
    var Laser_PRG: SKSpriteNode

    var Shield_LBL: SKLabelNode
    var Missile_LBL: SKLabelNode
    var Laser_LBL: SKLabelNode

    init(master: Combat, inf: CombatInf) {
        Master = master
        Inf = inf
        
        Shield_BTN = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "galaxy_pinkblack")))
        Shield_BTN.position = CGPoint(x: -200, y: -100)
        Shield_BTN.size = CGSize(width: WIDTH_BTN, height: 50)
        Shield_BTN.zPosition = 3
        
        Missile_BTN = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "galaxy_pinkblack")))
        Missile_BTN.position = CGPoint(x: 0, y: -100)
        Missile_BTN.size = CGSize(width: WIDTH_BTN, height: 50)
        Missile_BTN.zPosition = 3

        Laser_BTN = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "galaxy_pinkblack")))
        Laser_BTN.position = CGPoint(x: 200, y: -100)
        Laser_BTN.size = CGSize(width: WIDTH_BTN, height: 50)
        Laser_BTN.zPosition = 3
        

        Shield_PRG = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "galaxy_pinkblack")))
        Shield_PRG.position = CGPoint(x: -200, y: -100)
        Shield_PRG.size = CGSize(width: WIDTH_BTN, height: 50)
        Shield_PRG.zPosition = 4
        
        Missile_PRG = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "galaxy_pinkblack")))
        Missile_PRG.position = CGPoint(x: 0, y: -100)
        Missile_PRG.size = CGSize(width: WIDTH_BTN, height: 50)
        Missile_PRG.zPosition = 4

        Laser_PRG = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "galaxy_pinkblack")))
        Laser_PRG.position = CGPoint(x: 200, y: -100)
        Laser_PRG.size = CGSize(width: WIDTH_BTN, height: 50)
        Laser_PRG.zPosition = 4


        Shield_LBL = SKLabelNode(text: "Shields")
        Shield_LBL.position = CGPoint(x: -200, y: -100)
        Shield_LBL.fontColor = SKColor.black
        Shield_LBL.fontName = "Marion-Bold"
        Shield_LBL.fontSize = 30
        Shield_LBL.zPosition = 5
        
        Missile_LBL = SKLabelNode(text: "Missiles")
        Missile_LBL.position = CGPoint(x: 0, y: -100)
        Missile_LBL.fontColor = SKColor.black
        Missile_LBL.fontName = "Marion"
        Missile_LBL.fontSize = 30
        Missile_LBL.zPosition = 5

        Laser_LBL = SKLabelNode(text: "Lasers")
        Laser_LBL.position = CGPoint(x: 200, y: -100)
        Laser_LBL.fontColor = SKColor.black
        Laser_LBL.fontName = "Marion"
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
    }

    func Update() {
        Shield_PRG.size.width = CGFloat(WIDTH_BTN * Inf.GetShieldProgress())
        Missile_PRG.size.width = CGFloat(WIDTH_BTN * Inf.GetMissileProgress())
        Laser_PRG.size.width = CGFloat(WIDTH_BTN * Inf.GetLaserProgress())
    }

    func touchDown(atPoint pos: CGPoint)->Bool {
        if Is_In_Bounds(node: Shield_BTN, pos: pos) {
            if Inf.IsShieldReady() {
                Master.ToggleShield()
                return true
            }
        }
        if Is_In_Bounds(node: Missile_BTN, pos: pos) {
            if Inf.IsMissileReady() {
                Master.FireMissile()
                return true
            }
        }
        if Is_In_Bounds(node: Laser_BTN, pos: pos) {
            if Inf.IsLaserReady() {
                Master.FireLaster()
                return true
            }
        }
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

