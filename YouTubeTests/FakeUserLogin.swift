//
//  FakeUserLogin.swift
//  YouTube
//
//  Created by Markim Shaw on 10/11/16.
//  Copyright © 2016 Markim Shaw. All rights reserved.
//

import Foundation

@testable import YouTube

struct FakeUserLogin:LoginProtocol {
    var firstLogin:Bool
    var loginWasCalled:Bool
    func login(information:LoginInformation) -> Bool {
        if firstLogin == true {
            return true
        } else {
            
        }
        return false
    }
}
