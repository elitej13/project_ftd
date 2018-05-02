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
    
    public var ShieldActive: Bool

    init() {
        ShieldTimer = 60
        MissileTimer = 120
        LaserTimer = 60
        
        ShieldDelay = 60
        MissileDelay = 120
        LaserDelay = 60
        
        ShieldActive = true
    }

    func Update() {
        if ShieldTimer > 0 {
            ShieldTimer -= 1;
        }
        if MissileTimer > 0 {
            MissileTimer -= 1;
        }
        if LaserTimer > 0 {
            LaserTimer -= 1;
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

    func GetShieldProgress()->Double {
        return 1.0 - (Double(ShieldTimer) / Double(ShieldDelay))
    }
    func GetMissileProgress()->Double {
        return 1.0 - (Double(MissileTimer) / Double(MissileDelay))
    }
    func GetLaserProgress()->Double {
        return 1.0 - (Double(LaserTimer) / Double(LaserDelay))
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

