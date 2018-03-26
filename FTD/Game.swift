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







}
