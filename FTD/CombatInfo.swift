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
    
    public var ShieldActive: Bool
    public var EnemyShieldActive: Bool

    public var PlayerHealth: Int
    public var EnemyHealth: Int

    var MissileCount: Int

    var ShieldTimer: Int
    var MissileTimer: Int
    var LaserTimer: Int

    var ShieldDelay: Int
    var MissileDelay: Int
    var LaserDelay: Int


    init() {
        ShieldActive = true
        EnemyShieldActive = true

        ShieldTimer = 60
        MissileTimer = 120
        LaserTimer = 60
        
        ShieldDelay = 60
        MissileDelay = 120
        LaserDelay = 60
        
        PlayerHealth = 100
        EnemyHealth = 100

        MissileCount = 5
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
        ShieldTimer = ShieldDelay
    }
    func ResetMissileTimer() {
        MissileTimer = MissileDelay
    }
    func ResetLaserTimer() {
        LaserTimer = LaserDelay
    }

    func GetPlayerHealthProgress() {
        return 1.0 - (Double(PlayerHealth) / Double(100.0))
    }
    func GetEnemyHealthProgress() {
        return 1.0 - (Double(EnemyHealth) / Double(100.0))
    }

    func DistributeBuffs(shield: Int, laser: Int, missile: Int) {
        ShieldDelay = 60 - (shield * 15)
        MissileDelay = 120 - (missile * 30)
        LaserDelay = 60 - (laser * 15)

        if ShieldTimer > ShieldDelay {
            ShieldTimer = ShieldDelay
        }
        if MissileTimer > MissileDelay {
            MissileTimer = MissileDelay
        }
        if LaserTimer > LaserDelay {
            LaserTimer = LaserDelay
        }
    }

    func UseMissile()->Bool {
        if MissileCount > 0 {
            MissileCount -= 1
            return true
        }
        return false
    }

}

