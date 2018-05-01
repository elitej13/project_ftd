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

    public enum STATE {
        case OVERWORLD
        case COMBAT
        case STORY
        case SHOP
        case EXIT
    }
    var Scene: SKScene?
    var State: STATE
    var CombatScreen: Combat?
    var OverworldScreen: Overworld?
    init() {
        State = STATE.COMBAT
    }
    func Change_State(New:STATE) {
        switch New {
        case STATE.OVERWORLD:
            Scene!.removeAllChildren()
            OverworldScreen.Add_Children(GameScene: Scene!)
            break
        case STATE.COMBAT:
            Scene!.removeAllChildren()
            CombatScreen.Add_Children(GameScene: Scene!)
            break
        case STATE.STORY:
            break
        case STATE.SHOP:
            break
        case STATE.EXIT:
            break
        }
    }
    func Add_Children(GameScene:SKScene) {
        Scene = GameScene
        CombatScreen = Combat(game: self)
        OverworldScreen = Overworld(game: self)
        Change_State(New:STATE.OVERWORLD)
    }
    func Update() {
        switch State {
        case STATE.OVERWORLD:
            break
        case STATE.COMBAT:
            CombatScreen.Update()
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
