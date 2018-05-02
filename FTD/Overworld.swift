//
//  Overworld.swift
//  FTD
//
//  Created by Josh Hess on 3/27/18.
//  Copyright © 2018 Ephemerality. All rights reserved.
//

import SpriteKit
import GameplayKit

class Overworld {
    
    var Actions = [SKAction]()
    var Background: SKSpriteNode
    var Selection: SKSpriteNode
    var Waypoints = [SKSpriteNode]()
    var Master: Game;
    
    init(game: Game) {
        Master = game
        Background = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "galaxy_red")))
        Background.position = CGPoint(x: 0, y: 0)
        Background.zPosition = 0
        
        Selection = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "frame")))
        Selection.position = CGPoint(x: -500, y: -500)
        Selection.size = CGSize(width: 16, height: 16)
        Selection.zPosition = 4
        
        Waypoints.append(SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "waypoint"))))
        Waypoints.append(SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "waypoint"))))
        Waypoints.append(SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "waypoint"))))
        Waypoints.append(SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "waypoint"))))
        Waypoints[0].position = CGPoint(x: -100, y: 0)
        Waypoints[1].position = CGPoint(x: 0, y: 30)
        Waypoints[2].position = CGPoint(x: 0, y: -30)
        Waypoints[3].position = CGPoint(x: 100, y: 0)
        Waypoints[0].size = CGSize(width: 16, height: 16)
        Waypoints[1].size = CGSize(width: 16, height: 16)
        Waypoints[2].size = CGSize(width: 16, height: 16)
        Waypoints[3].size = CGSize(width: 16, height: 16)
        Waypoints[0].zPosition = 4
        Waypoints[1].zPosition = 4
        Waypoints[2].zPosition = 4
        Waypoints[3].zPosition = 4
    }
    
    func Add_Children(GameScene:SKScene) {
        GameScene.addChild(Background)
        GameScene.addChild(Selection)
        for node in Waypoints {
            GameScene.addChild(node)
        }
    }
    func Update() {
        for act in Actions {
            Selection.run(act)
        }
    }
    func touchDown(atPoint pos : CGPoint) {
        for node in Waypoints {
            if Is_In_Bounds(node: node, pos: pos) {
                Master.Change_State(New: Game.STATE.COMBAT)
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
    func Move_Seletion_Frame(x: CGFloat, y: CGFloat, duration: TimeInterval) {
        Actions.append(SKAction.move(to: CGPoint(x: x, y: y) , duration: duration))
    }


}


