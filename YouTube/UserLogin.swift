//
//  UserLogin.swift
//  YouTube
//
//  Created by Markim Shaw on 10/11/16.
//  Copyright © 2016 Markim Shaw. All rights reserved.
//

import Foundation

struct UserLogin:LoginProtocol {
    var firstLogin:Bool
    func login(information:LoginInformation) -> Bool {
        
        if firstLogin == true {
            
            return true
        } else {
            
        }
        return false
    }
}

