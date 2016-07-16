//
//  GlobalVars.swift
//  SOSOS
//
//  Created by Jonas Bauer on 7/16/16.
//  Copyright © 2016 Jonas Bauer. All rights reserved.
//

import Foundation

internal enum Age {
    case Egg
    case Child
    case Adult
}
internal let defaults = NSUserDefaults.standardUserDefaults()

internal var actualAge : Age = .Egg

internal var nameOfPet = ""
internal var daysAlive : NSDate?
internal var weight = 0.0
internal var hungerOfPet = 3
internal var happiness = 3.0
internal var money = 100
internal var spentMoney = 0