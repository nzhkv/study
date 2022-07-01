//
//  SecondViewController.swift
//  LoginApp
//
//  Created by Nikolay Zhukov on 01.07.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var welcomeText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.png")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        welcomeText.text = "Welcome"
        welcomeText.textColor = .white
    }
    

    @IBAction func exitButton(_ sender: Any) {
        dismiss(animated: true)
    }
    

}
