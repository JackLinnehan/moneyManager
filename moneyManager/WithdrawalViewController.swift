//
//  WithdrawalViewController.swift
//  moneyManager
//
//  Created by John Linnehan on 12/5/21.
//

import UIKit
import AVFoundation

class WithdrawalViewController: UIViewController {

    var sendItem: String!
    
    
    @IBOutlet weak var amountTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        amountTextField.text = sendItem
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        sendItem = amountTextField.text
    }
    


    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresenting = presentingViewController is UINavigationController
        if isPresenting {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
        
        @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
            
        }

}

extension WithdrawalViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        amountTextField.endEditing(true)
        return true
    }
}
