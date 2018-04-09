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

    enum STATE {
        case OVERWORLD
        case COMBAT
        case STORY
        case SHOP
        case EXIT
    }
    var Scene:SKScene
    var State:STATE
    var CombatScreen:Combat

    init() {
        State = STATE.COMBAT
        CombatScreen = Combat()
    }

    func Add_Children(GameScene:SKScene) {
        Scene = GameScene
        Combat.Add_Children(GameScene: GameScene)
    }
    func Update() {
        switch State {
        case STATE.OVERWORLD:
            break
        case STATE.COMBAT:
            Combat.Update()
            break
        case STATE.STORY:
            break
        case STATE.SHOP:
            break
        case STATE.EXIT:
            break
        }
    }
    func touchDown(atPoint pos : CGPoint) {
    }

}
