//
//  LoginProtocol.swift
//  YouTube
//
//  Created by Markim Shaw on 10/11/16.
//  Copyright © 2016 Markim Shaw. All rights reserved.
//

import Foundation

typealias LoginInformation = (username:String, password:String)

protocol LoginProtocol {
    func login(information:LoginInformation) -> Bool
}
