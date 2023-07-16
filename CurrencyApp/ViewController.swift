//
//  ViewController.swift
//  CurrentCurrency
//
//  Created by Özgün Can Beydili on 16.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculateB: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!
    
    let url = URL(string: "https://api.currencyapi.com/v3/latest?apikey=cur_live_wlXfwWuhcWjdW84STfHawkDzS2M7NqA2JARriOZP")
    
    var amount : Double = 0.0
    var result : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let keyboardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(keyboardGestureRecognizer)
    }
    
    @objc func closeKeyboard(){
        view.endEditing(true)
    }

    @IBAction func calculateButton(_ sender: Any) {
        let fromCurrency = fromTextField.text!.uppercased()
        let toCurrency = toTextField.text!.uppercased()
        if let money = Double(amountTextField.text ?? "0") {
            amount = money
        }

        getCurrency(url: url!, currency: fromCurrency){ fromValue in
            self.getCurrency(url: self.url!, currency: toCurrency){ toValue in
                self.result = self.amount * (toValue / fromValue)
                let output = "\(String(self.amount)) \(fromCurrency) = \(String(self.result)) \(toCurrency)"
                DispatchQueue.main.async{
                    self.resultLabel.text = output
                    self.calculateB.isEnabled = false
                }
            }
        }
    }
    
    @IBAction func clearButton(_ sender: Any) {
        calculateB.isEnabled = true
        fromTextField.text = ""
        toTextField.text = ""
        amountTextField.text = ""
        resultLabel.text = "Result:"
    }
    
    func getCurrency(url: URL, currency: String, completion: @escaping (Double) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                UIAlertController(title: "Error!", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
            } else if let data = data{
                do{
                    let currencyDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
                    
                    if let data = currencyDictionary?["data"] as? [String:Any]{
                        if let code = data[currency] as? [String:Any]{
                            let value = code["value"] as! Double
                            completion(value)
                        }
                    }
                } catch{
                    UIAlertController(title: "Error!", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                }
            }
        }.resume()
    }
}
