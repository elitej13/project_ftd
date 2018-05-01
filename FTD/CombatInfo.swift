//
//  Combat.swift
//  FTD
//
//  Created by Josh Hess on 3/27/18.
//  Copyright © 2018 Ephemerality. All rights reserved.
//

import SpriteKit
import GameplayKit

class CombatInfo {
    
    var ShieldTimer: Int
    var MissileTimer: Int
    var LaserTimer: Int

    var ShieldDelay: Int
    var MissileDelay: Int
    var LaserDelay: Int

    init() {
        ShieldTimer = 60
        MissileTimer = 120
        LaserTimer = 60
    }

    func Update() {
        if ShieldTimer > 0 {
            ShieldTimer--;
        }
        if MissileTimer > 0 {
            MissileTimer--;
        }
        if LaserTimer > 0 {
            LaserTimer--;
        }
    }

    func IsShieldReady()->Bool {
        return ShieldTimer <= 0 ? true : false
    }
    func IsMissileReady()->Bool {
        return MissileTimer <= 0 ? true : false
    }
    func IsLaserReady()->Bool {
        return LaserTimer <= 0 ? true : false
    }

    func GetShieldProgress()->Float {
        return 1f - Float(ShieldTimer / ShieldDelay)
    }
    func GetMissileProgress()->Float {
        return 1f - Float(MissileTimer / MissileDelay)
    }
    func GetLaserProgress()->Float {
        return 1f - Float(LaserTimer / LaserDelay)
    }
    
    func ResetShieldTimer() {
        ShieldTimer = ShieldDelay;
    }
    func ResetMissileTimer() {
        MissileTimer = MissileDelay;
    }
    func ResetLaserTimer() {
        LaserTimer = LaserDelay;
    }

}

