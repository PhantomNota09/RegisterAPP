//
//  InfoVC.swift
//  RegisterAPP
//
//  Created by Surya Rayala on 1/20/26.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet weak var countryInputTF: UITextField!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var countryCodeTF: UITextField!
    
    @IBAction func nextButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNumberTF.delegate = self
        phoneNumberTF.keyboardType = .numberPad
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        phoneNumberTF.becomeFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UITextFieldDelegate

extension InfoVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard textField == phoneNumberTF else {
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
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        guard allowedCharacters.isSuperset(of: characterSet) else {
            return false
        }
        
        return updatedText.count <= 10
    }
}

