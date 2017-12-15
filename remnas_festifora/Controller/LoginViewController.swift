//
//  LoginViewController.swift
//  remnas_festifora
//
//  Created by Raditia Madya on 18/11/17.
//  Copyright © 2017 Universitas Gadjah Mada. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var actionButton: UIButton!
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if user.text != "" && password.text != "" {
            
            Auth.auth().signIn(withEmail: user.text!, password: password.text!, completion: { (user, error) in
                if user != nil {
                    
                    //login succesfull
                    self.performSegue(withIdentifier: "segue", sender: self)
                }
                else {
                    if let myError = error?.localizedDescription {
                        print(myError)
                    }
                    else {
                        print("ERROR")
                    }
                }
            })
        }
            
        else {
            
            Auth.auth().createUser(withEmail: user.text!, password: password.text!, completion: { (user, error) in
                if user != nil {
                    
                    self.performSegue(withIdentifier: "segue", sender: self)
                }
                else {
                    if let myError = error?.localizedDescription {
                        print(myError)
                    }
                    else {
                        print("ERROR")
                    }
                }
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
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
