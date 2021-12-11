//
//  DepositViewController.swift
//  moneyManager
//
//  Created by John Linnehan on 12/5/21.
//

import UIKit
import AVFoundation

//private let dateFormatter: DateFormatter = {
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateStyle = .short
//    dateFormatter.timeStyle = .short
//    return dateFormatter
//}

class DepositViewController: UIViewController {

    var transactionItem: transactionItems! //String!
    var sendItem: String!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var amountTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //amountTextField.text = transactionItem
        amountTextField.delegate = self
//
//        if sendItem == nil {
//            sendItem = ""
//        }
        amountTextField.text = sendItem
      

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //transactionItem = transactionItems(amount: amountTextField.text!)
        //transactionItem.date = datePicker.date
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
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        //dateLabel.text = DateFormatter.string(from: sender.date)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
    }
    
}

extension DepositViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        amountTextField.endEditing(true)
        return true
    }
}
