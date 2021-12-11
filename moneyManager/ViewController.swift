//
//  ViewController.swift
//  moneyManager
//
//  Created by John Linnehan on 12/5/21.
//

import UIKit
import AVFoundation
import UserNotifications
class ViewController: UIViewController {

    var TransactionItems = transactionItems()
    
    
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var acknowledgeButton: UIButton!
    @IBOutlet weak var balExplanationLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    //var transactionArray = ["1000", "2000", "3000"]
    //var transactionArray: [transactionItem] = []
    var transactionArray: [transactionItem] = []
    var transArray: [String] = []
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var bal = 0.00
    var bal1 = 0.00
    var tooMuch = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        balanceLabel.text = "\(bal)"
//        var newElement = transactionItem(amount: "0000")  //, date: Date())
        //transArray.append("Test")
        errorLabel.isHidden = true
        acknowledgeButton.isHidden = true
        tableView.dataSource = self
        tableView.delegate = self
        if tooMuch {
            ui()
        }
            
    }
    
    
    var audioPlayer: AVAudioPlayer!
    func playSound(name: String) {
            if let sound = NSDataAsset(name: name) {
                do {
                    try audioPlayer = AVAudioPlayer(data: sound.data)
                    audioPlayer.play()
                } catch {
                    print("😡 ERROR: \(error.localizedDescription)could not initialize AVAudioPlayer Object.")
                }
                
            } else {
                print("😡 ERROR: could not read data from file sound0.")
            }
        }
    
    @IBAction func viewTransactionsPressed(_ sender: UIButton) {
    }
    
    @IBAction func depositButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func withdrawalButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func unwindFromDepositSave(segue: UIStoryboardSegue) {
        let source = segue.source as! DepositViewController
//        let newIndexPath = IndexPath(row: TransactionItems.transactionsArray.count, section: 0)
        //TransactionItems.transactionsArray.append(source.amountTextField.text)
        let newIndexPath = IndexPath(row: transArray.count, section: 0)
        transArray.append(source.sendItem)
        bal += Double(source.sendItem)!
        var rbal = roundMe(num: bal)
        balanceLabel.text = "\(rbal)"
//        TransactionItems.transactionsArray.append(source.transactionItem)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
        tableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
        playSound(name: "sound0")
    }
    
    @IBAction func unwindFromWithdrawalSave(segue: UIStoryboardSegue) {
        let source = segue.source as! WithdrawalViewController
//        let newIndexPath = IndexPath(row: TransactionItems.transactionsArray.count, section: 0)
        //TransactionItems.transactionsArray.append(source.amountTextField.text)
        
        let newIndexPath = IndexPath(row: transArray.count, section: 0)
        transArray.append("-" + source.sendItem)
        bal -= Double(source.sendItem)!
        var rbal = roundMe(num: bal)
        balanceLabel.text = "\(rbal)"
//        if rbal < 0.0 {
//            rbal = over(rbal: rbal)
//            tooMuch = true
//            accountLabel.text = "Error: Insufficient Funds"
//        }
        //balanceLabel.text = "\(rbal)"
//        TransactionItems.transactionsArray.append(source.transactionItem)
        if tooMuch == false {
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            tableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
            playSound(name: "sound1")
        } else {
            playSound(name: "sound1")
            accountLabel.text = "Error: Insufficient Funds"

        }
        
    }
    
    func roundMe(num: Double) -> Double {
        var returnVal = Double(round(100*bal) / 100)
        return returnVal
    }

    func over(rbal: Double) -> Double{
        return bal
    }
    
    func ui() {
//        errorLabel.isHidden = false
//        acknowledgeButton.isHidden = false
//        balExplanationLabel.isHidden = true
        accountLabel.text = "Error: Insufficient Funds"

    }
    
    @IBAction func acknowledgeButtonPressed(_ sender: UIButton) {
        errorLabel.isHidden = true
        acknowledgeButton.isHidden = true
        balExplanationLabel.isHidden = false
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //cell.textLabel?.text = "\(transactionArray[indexPath.row].date)"
        cell.textLabel?.text = transArray[indexPath.row]
        return cell
    }
    
    
}

