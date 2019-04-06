//
//  ViewController.swift
//  CapacitacaoIOS-Firebase®
//
//  Created by ALUNO on 05/04/19.
//  Copyright © 2019 Aluno. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnSingUp(_ sender: Any) {
        Auth.auth().createUser(withEmail: txtEmail.text!, password: txtPassword.text!) { (result, error) in
            
            guard let user = result?.user
                else {
                    print(error!)
                    return
            }
            
            
            
            print(user.email!)
            print("LOG - CADASTRO EFETUADO COM SUCESSO")
        }
    }
    @IBAction func txtSingIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { (result, error) in
            
            guard let user = result?.user
                else {
                    print(error!)
                    return
            }
            
            print(user.email!)
            print("LOG - LOGIN EFETUADO COM SUCESSO")
            
            Analytics.setUserProperty("sim", forName: "Entrou")
            Analytics.logEvent("Login", parameters: ["NomeUsuario": self.txtEmail.text!])
            
            self.performSegue(withIdentifier: "showTableView", sender: nil)
            
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showTableView" {
//            if view = segue.destination as! TableViewController {
//
//            }
//        }
//    }
}

