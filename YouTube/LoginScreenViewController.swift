//
//  LoginScreenViewController.swift
//  YouTube
//
//  Created by Markim Shaw on 10/11/16.
//  Copyright © 2016 Markim Shaw. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    @IBOutlet weak var loginButton:UIButton!
    @IBOutlet weak var usernameField:UITextField!
    @IBOutlet weak var passwordField:UITextField!

    var login:LoginProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up login object
        self.login = UserLogin()
        
        self.loginButton.addTarget(self, action: #selector(self.loginButtonPressed(_:)), for: .touchUpInside)
        print(self.loginButton.allTargets)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(_ sender:UIButton){
        //When this button is pressed, prompt the login
        //If the login information is valid then call for a transition.
        //If login information is invalid, then display alert view
        guard let usernameText = usernameField.text else { return }
        guard let passwordText = passwordField.text else { return }
        
        let loginStatus = self.login.login(information: (username: usernameText, password: passwordText))
        if loginStatus {
            //present next view
        } else {
            //display dialog
            let alertController = UIAlertController(title: "Login failed", message: "Default Message", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
