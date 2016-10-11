//
//  LoginScreenViewTest.swift
//  YouTube
//
//  Created by Markim Shaw on 10/11/16.
//  Copyright © 2016 Markim Shaw. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import YouTube
class LoginScreenViewTest: QuickSpec {
    
    var loginView:LoginScreenViewController!
    override func spec(){
        
        //Load the view (as a module) before each test
        beforeEach {
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.makeKeyAndVisible()
            let storyboard = UIStoryboard.init(name: R.Storyboard.Main.rawValue, bundle: nil)
            self.loginView = storyboard.instantiateViewController(withIdentifier: R.Storyboard.View.loginView.rawValue) as? LoginScreenViewController
            window.rootViewController = self.loginView
            
            expect(self.loginView.view).toNot(beNil())
        }
        
        describe("what the view should contain"){
            context("When loaded"){
                it("should have a button"){
                    //Assert
                    expect(self.loginView.loginButton).toNot(beNil())
                }
                it("should have a field to enter text for username"){
                    //Assert
                    expect(self.loginView.usernameField).toNot(beNil())
                }
                it("should have a field to enter text for password"){
                    expect(self.loginView.passwordField).toNot(beNil())
                }
            }
        }
        
        describe("When the app first launches"){
            context("when user has logged in before"){
                context("when the user enters a matching password"){}
                context("when the user enters a mismatching password"){}
            }
            context("when user is logging in for the first time"){
                it("should save login information") {}
            }
        }
    }
    
}
