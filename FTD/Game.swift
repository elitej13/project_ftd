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

    init() {
        Crew.Append(Entity(#imageLiteral(resourceName: "waypoint_node"), -100, 50, 32, 64))
        Crew.Append(Entity(#imageLiteral(resourceName: "waypoint_node"), 0, 50, 32, 64))
        Crew.Append(Entity(#imageLiteral(resourceName: "waypoint_node"), 100, 50, 32, 64))

        Rooms.Append(Room(Room.Name.PILOT, #imageLiteral(resourceName: "galaxy"), 150, 0, 100, 100)) 
        Rooms.Append(Room(Room.Name.SHIELD, #imageLiteral(resourceName: "galaxy"), 50, 50, 100, 100))
        Rooms.Append(Room(Room.Name.LASER, #imageLiteral(resourceName: "galaxy"), 50, -50, 100, 100))
        Rooms.Append(Room(Room.Name.ENGINE, #imageLiteral(resourceName: "galaxy"), -50, -50, 100, 100))
        Rooms.Append(Room(Room.Name.UTILITY, #imageLiteral(resourceName: "galaxy"), -50, 50, 100, 100))
    }

    func Add_Children(GameScene:SKScene) {
        for ent in Entities {
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







}