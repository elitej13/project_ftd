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
    var Waypoints = [SKSpriteNode]()
    var Lines = [SKShapeNode]()
    var Background: SKSpriteNode
    var Selection: SKSpriteNode
    var Title: SKLabelNode
    var SelectLBL: SKLabelNode
    var Node: Int = -1
    var Master: Game;
    
    init(game: Game) {
        Master = game
        Background = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "galaxy_red")))
        Background.position = CGPoint(x: 0, y: -100)
        Background.zPosition = 0
        Selection = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Shield_faded")))
        Selection.position = CGPoint(x: 0, y: 500)
        Selection.size = CGSize(width: 32, height: 32)
        Selection.zPosition = 5
        
        Waypoints.append(SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "waypoint"))))
        Waypoints.append(SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "waypoint"))))
        Waypoints.append(SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "waypoint"))))
        Waypoints.append(SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "waypoint"))))
        Waypoints.append(SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "waypoint"))))
        Waypoints.append(SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "waypoint"))))
        Waypoints.append(SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "waypoint"))))
        
        Waypoints[0].position = CGPoint(x: -150, y: 0)
        Waypoints[1].position = CGPoint(x: -50, y: 30)
        Waypoints[2].position = CGPoint(x: -50, y: -30)
        Waypoints[3].position = CGPoint(x: 50, y: 40)
        Waypoints[4].position = CGPoint(x: 50, y: 0)
        Waypoints[5].position = CGPoint(x: 50, y: -40)
        Waypoints[6].position = CGPoint(x: 150, y: 0)
        
        Lines.append(SKShapeNode())
        Lines.append(SKShapeNode())
        Lines.append(SKShapeNode())
        Lines.append(SKShapeNode())
        Lines.append(SKShapeNode())
        Lines.append(SKShapeNode())
        Lines.append(SKShapeNode())
        Lines.append(SKShapeNode())
        Lines.append(SKShapeNode())
        
        var path0 = UIBezierPath()
        path0.move(to: Waypoints[0].position)
        path0.addLine(to: Waypoints[1].position)
        Lines[0].path = path0.cgPath
        Lines[0].strokeColor = UIColor.black
        Lines[0].lineWidth = 4
        Lines[0].zPosition = 3
        
        path0 = UIBezierPath()
        path0.move(to: Waypoints[0].position)
        path0.addLine(to: Waypoints[2].position)
        Lines[1].path = path0.cgPath
        Lines[1].strokeColor = UIColor.black
        Lines[1].lineWidth = 4
        Lines[1].zPosition = 3
        
        path0 = UIBezierPath()
        path0.move(to: Waypoints[1].position)
        path0.addLine(to: Waypoints[3].position)
        Lines[2].path = path0.cgPath
        Lines[2].strokeColor = UIColor.black
        Lines[2].lineWidth = 4
        Lines[2].zPosition = 3
        
        path0 = UIBezierPath()
        path0.move(to: Waypoints[1].position)
        path0.addLine(to: Waypoints[4].position)
        Lines[3].path = path0.cgPath
        Lines[3].strokeColor = UIColor.black
        Lines[3].lineWidth = 4
        Lines[3].zPosition = 3
        
        path0 = UIBezierPath()
        path0.move(to: Waypoints[2].position)
        path0.addLine(to: Waypoints[4].position)
        Lines[4].path = path0.cgPath
        Lines[4].strokeColor = UIColor.black
        Lines[4].lineWidth = 4
        Lines[4].zPosition = 3
        
        path0 = UIBezierPath()
        path0.move(to: Waypoints[2].position)
        path0.addLine(to: Waypoints[5].position)
        Lines[5].path = path0.cgPath
        Lines[5].strokeColor = UIColor.black
        Lines[5].lineWidth = 4
        Lines[5].zPosition = 3
        
        path0 = UIBezierPath()
        path0.move(to: Waypoints[3].position)
        path0.addLine(to: Waypoints[6].position)
        Lines[6].path = path0.cgPath
        Lines[6].strokeColor = UIColor.black
        Lines[6].lineWidth = 4
        Lines[6].zPosition = 3
        
        path0 = UIBezierPath()
        path0.move(to: Waypoints[4].position)
        path0.addLine(to: Waypoints[6].position)
        Lines[7].path = path0.cgPath
        Lines[7].strokeColor = UIColor.black
        Lines[7].lineWidth = 4
        Lines[7].zPosition = 3
        
        path0 = UIBezierPath()
        path0.move(to: Waypoints[5].position)
        path0.addLine(to: Waypoints[6].position)
        Lines[8].path = path0.cgPath
        Lines[8].strokeColor = UIColor.black
        Lines[8].lineWidth = 4
        Lines[8].zPosition = 3
        
        Waypoints[0].size = CGSize(width: 24, height: 24)
        Waypoints[1].size = CGSize(width: 24, height: 24)
        Waypoints[2].size = CGSize(width: 24, height: 24)
        Waypoints[3].size = CGSize(width: 24, height: 24)
        Waypoints[4].size = CGSize(width: 24, height: 24)
        Waypoints[5].size = CGSize(width: 24, height: 24)
        Waypoints[6].size = CGSize(width: 24, height: 24)
        
        Waypoints[0].zPosition = 4
        Waypoints[1].zPosition = 4
        Waypoints[2].zPosition = 4
        Waypoints[3].zPosition = 4
        Waypoints[4].zPosition = 4
        Waypoints[5].zPosition = 4
        Waypoints[6].zPosition = 4
        
        Title = SKLabelNode(text: "Sector 01")
        Title.position = CGPoint(x: 0, y: 170)
        Title.fontColor = SKColor.black
        Title.fontName = "Marion-Bold"
        Title.fontSize = 50
        Title.zPosition = 6
        
        SelectLBL = SKLabelNode(text: "")
        SelectLBL.position = CGPoint(x: 0, y: 125)
        SelectLBL.fontColor = SKColor.black
        SelectLBL.fontName = "Marion"
        SelectLBL.fontSize = 40
        SelectLBL.zPosition = 6
    }
    
    func Add_Children(GameScene:SKScene) {
        GameScene.addChild(Background)
        GameScene.addChild(Selection)
        GameScene.addChild(SelectLBL)
        GameScene.addChild(Title)
        for node in Waypoints {
            GameScene.addChild(node)
        }
        for line in Lines {
            GameScene.addChild(line)
        }
    }
    func Update() {
        for act in Actions {
            Selection.run(act)
        }
    }
    func touchDown(atPoint pos : CGPoint) {
        var i: Int = 0
        for node in Waypoints {
            if Is_In_Bounds(node: node, pos: pos) {
                if Node == i {
                    Master.Change_State(New: Game.STATE.COMBAT)
                }
                else {
                    Node = i
                    Move_Seletion_Frame(node: node)
                    SelectLBL.text = "Area \(i)"
                }
                break
            }
            i += 1
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
    //Essentially Deselecting the selection frame
    func Move_Seletion_Frame_Off_Screen() {
        let move = SKAction.move(to: CGPoint(x: -1000, y: -1000) , duration: 0.01)
        Actions.append(move)
    }
    //Queues an action to move selection for the update loop
    func Move_Seletion_Frame(node: SKSpriteNode) {
        let move = SKAction.move(to: node.position , duration: 0.01)
        let scale = SKAction.scale(to: node.size, duration: 0.01)
        Actions.append(move)
        Actions.append(scale)
    }


}


