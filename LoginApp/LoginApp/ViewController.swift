//
//  ViewController.swift
//  LoginApp
//
//  Created by Nikolay Zhukov on 01.07.2022.
//

import UIKit

class ViewController: UIViewController {

    let user = "user"
    let password = "1234"
    
    @IBOutlet weak var TextFieldUser: UITextField!
    @IBOutlet weak var textFieldPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if TextFieldUser.text == user && textFieldPass.text == password {
        performSegue(withIdentifier: "goSecondView", sender: nil)
        } else {
            let alertController = UIAlertController(title: "Ошибка", message: "Неправильное имя или пароль", preferredStyle: .alert)
            
            let cancelButton = UIAlertAction(title: "Заново", style: .cancel, handler: nil)
            alertController.addAction(cancelButton)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    


}

