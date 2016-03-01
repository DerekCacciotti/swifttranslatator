//
//  ViewController.swift
//  swifttranslatator
//
//  Created by Derek Cacciotti on 2/3/16.
//  Copyright © 2016 Derek Cacciotti. All rights reserved.
//

import UIKit
import Polyglot
import ChameleonFramework


class ViewController: UIViewController, UITextFieldDelegate {
    
    
    
    
    @IBOutlet weak var translationtextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    let translator = Polyglot(clientId: "translatorswift", clientSecret: "KqbAaNwUAL+B6CxpqKKtRhy2dYLvckUhXCzlc748D7M=")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabel.hidden = true
        let defaults = NSUserDefaults.standardUserDefaults()
       var outp = defaults.objectForKey("output") as! String
        defaults.synchronize()
        
        translator.toLanguage = Language(rawValue: outp)!
        print(outp)
        translationtextField.delegate = self
     
        
        // design stuff
        
        self.navigationController?.navigationBar.barTintColor = UIColor.flatMintColorDark()
        self.navigationController?.navigationBar.tintColor = UIColor.flatWhiteColor()
        
       
        
    }
    
    @IBAction func Translatetapped(sender: AnyObject) {
        resultLabel.hidden = false
        Translate(translationtextField.text!)
    }
    
    
    
    
    func Translate(str:String)
    {
        translator.translate(str) { (translation) -> (Void) in
            self.resultLabel.text = "\(str) means \(translation)"
        }
    }
    
    
    
    // text field delegate 
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clearTapped(sender: AnyObject) {
        translationtextField.text = ""
        resultLabel.text = ""
    }

}

