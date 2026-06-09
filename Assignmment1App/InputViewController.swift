//
//  InputViewController.swift
//  Assignmment1App
//
//  Created by Tanish Aggarwal on 2026-06-08.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var deviceTextField: UITextField!
    @IBOutlet weak var versionTextField: UITextField!
    @IBOutlet weak var deviceLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deviceTextField.delegate = self
            versionTextField.delegate = self
        outputLabel.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        // Show alert first, then update labels
        
        if deviceTextField.text == "" || versionTextField.text == "" {
               
               // 2. SHOW error alert
               let alert = UIAlertController(
                   title: "Error",
                   message: "Please fill in all fields.",
                   preferredStyle: .alert
               )
               alert.addAction(UIAlertAction(title: "OK", style: .default))
               present(alert, animated: true)
               
               return  // stop here, don't update labels
           }
        
                let alert = UIAlertController(
                    title: "Confirm",
                    message: "Are you sure you want to submit?",
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "Yes", style: .default) { _ in
                    self.outputLabel.text = "Device: \(self.deviceTextField.text!) | Version: \(self.versionTextField.text!)"
                })
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                present(alert, animated: true)
            }

            // Dismiss keyboard when Return is tapped
            func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                return textField.resignFirstResponder()
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
