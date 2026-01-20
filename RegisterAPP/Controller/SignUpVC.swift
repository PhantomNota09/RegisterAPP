//
//  SignUpVC.swift
//  RegisterAPP
//
//  Created by Surya Rayala on 1/20/26.
//

import UIKit

class SignUpVC: UIViewController {
    
    // Text fields
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up name text field
        nameTF.delegate = self
    }

    @IBAction func signUpButton(_ sender: Any)
    {
        // Check validation
        if let errorMessage = validateLogin() {
            showAlert(title: "Validation Failed", message: errorMessage)
            return
        }
        
        navigateToHome()
    }
    
    func validateLogin() -> String? {
        // Empty checks
        guard let name = nameTF.text, !name.isEmpty
        else {
            return "Name cannot be empty"
        }
        guard let email = emailTF.text, !email.isEmpty
        else {
            return "Email cannot be empty"
        }
        guard let password = passwordTF.text, !password.isEmpty
        else {
            return "Password cannot be empty"
        }
        guard let confirmPassword = confirmPasswordTF.text, !confirmPassword.isEmpty
        else {
            return "Confirm password cannot be empty"
        }
        
        // Name validation
        if name.count < 2 {
            return "Name must be at least 2 characters"
        }
        if name.count > 50 {
            return "Name must be less than 50 characters"
        }
        
        // Email validation
        if !email.contains("@") || !email.contains(".") {
            return "Please enter a valid email address"
        }
        
        // Password length
        if password.count < 6 {
            return "Password must be at least 6 characters"
        }
        if password.count > 20 {
            return "Password must be less than 20 characters"
        }
        
        // Password match
        if password != confirmPassword {
            return "Passwords do not match"
        }
        
        // All valid
        return nil
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func navigateToHome() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        if let homeVC = vc { self.navigationController?.pushViewController(homeVC, animated: true)
        }
    }
}

// MARK: - UITextFieldDelegate
extension SignUpVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard textField == nameTF
        else {
            return true
        }
        
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText)
        else {
            return false
        }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        if string.isEmpty {
            return true
        }
        
        let allowedCharacters = CharacterSet.letters.union(CharacterSet(charactersIn: " "))
        let characterSet = CharacterSet(charactersIn: string)
        guard allowedCharacters.isSuperset(of: characterSet)
        else {
            return false
        }
        
        if currentText.isEmpty && string == " " {
            return false
        }
        
        if string == " " && currentText.suffix(1) == " " {
            return false
        }
        
        return updatedText.count <= 30
    }
}
