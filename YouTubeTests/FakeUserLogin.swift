//
//  FakeUserLogin.swift
//  YouTube
//
//  Created by Markim Shaw on 10/11/16.
//  Copyright © 2016 Markim Shaw. All rights reserved.
//

import Foundation
import KeychainSwift

@testable import YouTube

class FakeUserLogin:LoginProtocol {
    var firstLogin:Bool
    var loginWasCalled:Bool
    init(){
        self.firstLogin = false
        self.loginWasCalled = false
    }
    func login(information:LoginInformation) -> Bool{
        self.loginWasCalled = true
        if information.username != "" && information.password != "" {
            return true
        }
        return false
    }
}
