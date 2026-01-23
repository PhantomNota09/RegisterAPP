//
//  ViewController.swift
//  RegisterAPP
//
//  Created by Surya Rayala on 1/20/26.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    
    // var receivedNameText: String?
    // var receivedEmailText: String?
    
    var receivedLoginResponse: LoginResponse?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let response = receivedLoginResponse else { return }
        NameLabel.text = "Logged In User Name: \(response.loggedInUserName ?? "")"
        EmailLabel.text = "Logged In Email: \(response.loggedInUserEmail ?? "")"
    }
}
