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
                context("login button"){
                    it("should have a button"){
                        expect(self.loginView.loginButton).toNot(beNil())
                    }
                    it("should have a button target"){
                        expect(self.loginView.loginButton.allTargets).toNot(beNil())
                    }
                }
                
                it("should have a field to enter text for username"){
                    expect(self.loginView.usernameField).toNot(beNil())
                }
                it("should have a field to enter text for password"){
                    expect(self.loginView.passwordField).toNot(beNil())
                }
                it("should have a LoginProtocol object which is used to handle login logic"){
                    expect(self.loginView.login).toNot(beNil())
                }
            }
        }
        
        describe("When the app first launches"){
            var userlogin:FakeUserLogin!
            var fakeUsernameTextField:UITextField!
            var fakePasswordTextField:UITextField!
            beforeEach {
                userlogin = FakeUserLogin()
                fakeUsernameTextField = UITextField()
                fakePasswordTextField = UITextField()
                
                self.loginView.login = userlogin
                self.loginView.passwordField = fakePasswordTextField
                self.loginView.usernameField = fakeUsernameTextField
            }
            context("when user is logging in for the first time"){
                context("when the user tries to log in without entering a username"){
                    it("should display alert view controller asking for username"){
                        //Arrange : set up the fake user login
                        fakeUsernameTextField.text = ""
                        fakePasswordTextField.text = "abc123"
                        
                        //Act : pass user login information without a username when button is pressed
                        waitUntil(action: {
                            done in
                            self.loginView.loginButton.sendActions(for: UIControlEvents.touchUpInside)
                            done()
                        })
                        //Assert
                        expect(self.loginView.presentedViewController).to(beAnInstanceOf(UIAlertController.self))
                    }
                    
                
                }
                context("when the uers tries to log in without a password"){
                    it("should save login information") {
                        //Arrange
                        fakeUsernameTextField.text = "Markim"
                        fakePasswordTextField.text = "Shaw"
                        //Act & Assert
                        expect(self.loginView.login.login(information: (fakeUsernameTextField.text!, fakePasswordTextField.text!))).to(beTruthy())
                    }
                    it("should launch a new view"){
                        
                    }
                }
                
            }
        }
    }
    
}
