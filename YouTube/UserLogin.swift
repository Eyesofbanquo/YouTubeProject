//
//  UserLogin.swift
//  YouTube
//
//  Created by Markim Shaw on 10/11/16.
//  Copyright © 2016 Markim Shaw. All rights reserved.
//

import Foundation
import KeychainSwift


class UserLogin:LoginProtocol {
    let keychain:KeychainSwift = KeychainSwift()
    var firstLogin:Bool
    init(){
        self.firstLogin = false
    }
    func login(information:LoginInformation) -> Bool{
        if information.username != "" && information.password != "" {
            //If the password is already stored then return true. If not already stored, then store the password then return true
            if keychain.get(information.username) != nil {
                return true
            } else {
                keychain.set(information.password, forKey: information.username)
                return true
            }
        }
        
        return false
    }
}

