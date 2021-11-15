//
//  ViewController.swift
//  Swift Practice # 114 Upload Data To Firestore
//
//  Created by Dogpa's MBAir M1 on 2021/11/15.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


class ViewController: UIViewController {
    
    @IBOutlet weak var selectDatePicker: UIDatePicker!
    
    @IBOutlet weak var prictTextField: UITextField!
    
    @IBOutlet weak var categoryTextField: UITextField!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var sentDataButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sentDataButton.layer.cornerRadius = sentDataButton.frame.height / 2
    }


    @IBAction func sentData(_ sender: UIButton) {
        print(selectDatePicker.date)
        
        if selectDatePicker.date != nil , Int(prictTextField.text!) != nil, titleTextField.text != "" , categoryTextField.text != "" {
            let db = Firestore.firestore()
            
            let moneyData : [String:Any] = [
                "date1": selectDatePicker.date,
                "price": Int(prictTextField.text!),
                "category": categoryTextField.text!
            ]
            
            do {
                try db.collection("moneybook").document("\(titleTextField.text!)").setData(moneyData)
            } catch let error {
                print("Error writing city to Firestore: \(error)")
            }
            titleTextField.text = ""
            categoryTextField.text = ""
            prictTextField.text = ""
        }else{
            let alert = UIAlertController(title: "輸入未完整", message: "請檢查", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "了解", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }

        
    }
        
    
    
    
    
}

