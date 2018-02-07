//
//  FirstViewController.swift
//  Proyecto_SQL
//
//  Created by usuario1 on 25/1/18.
//  Copyright © 2018 usuario1. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    var  message : String = ""
    @IBOutlet var button: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func guardar(_ sender: Any) {
        let request = NSMutableURLRequest(url: NSURL(string: "http://iesayala.ddns.net/sirdanielrm/proyectoAdd.php")! as URL)
        request.httpMethod = "POST"
        let postString = "art=\(textField1.text!)&can=\(textField2.text!)&disc=\(textField3.text!)"
        //let postString = ""
        /*if !textField1.isEqual("") && !textField2.isEqual("") && !textField3.isEqual("") {
            let postString = "art=\(textField1.text!)&can=\(textField2.text!)&disc=\(textField3.text!)"
        }*/
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                self.message = "Error 1"
                return
            }
            
            print("response = \(response)")
            
            
            // resultado (valor del echo de php)
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            if ((responseString?.isEqual(to: "1")))! {
                self.message = "Añadido"
                
            }
            else {
                self.message = ""
                
            }
            
            print("responseString = \(responseString)")
        }
        task.resume()
        let alert = UIAlertController(title: "Registro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        
        
        print("ffff \(self.message)")
        textField1.text=""
        textField2.text = ""
        textField3.text = ""
        textField1.becomeFirstResponder()
    }
    
}

