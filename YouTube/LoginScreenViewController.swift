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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
