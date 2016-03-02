//
//  SettingsViewController.swift
//  swifttranslatator
//
//  Created by Derek Cacciotti on 2/4/16.
//  Copyright © 2016 Derek Cacciotti. All rights reserved.
//

import UIKit
import Polyglot

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var Enginputswitch: UISwitch!
    
    @IBOutlet weak var Spaninputswitch: UISwitch!

    @IBOutlet weak var freninputswich: UISwitch!
    
    @IBOutlet weak var enoutputlangugeswitch: UISwitch!
    
    @IBOutlet weak var spanishoutputswitch: UISwitch!
    
    @IBOutlet weak var frenchoutputswtch: UISwitch!
    
    @IBOutlet weak var SaveButton: UIBarButtonItem!
    
    @IBOutlet weak var langpicker: UIPickerView!
    
    
    var outputlang:Language!
    
    var supportedlangs:[String] = ["Arabic",
    "Bulgarian",
    "Catalan",
    "Chinese (Simplified)",
    "Chinese (Traditional)",
    "Czech",
    "Danish",
    "Dutch",
    "English",
    "Estonian",
    "Finnish",
    "French",
    "German",
    "Greek",
    "Haitian Creole",
    "Hebrew",
    "Hindi",
    "Hmong Daw",
    "Hungarian",
    "Indonesian",
    "Italian",
    "Japanese",
    "Korean",
    "Latvian",
    "Lithuanian",
    "Malay",
    "Maltese",
    "Norwegian",
    "Persian",
    "Polish",
    "Portuguese",
    "Romanian",
    "Russian",
    "Slovak",
    "Slovenian",
    "Spanish",
    "Swedish",
    "Thai",
    "Turkish",
    "Ukrainian",
    "Urdu",
    "Vietnamese",
    "Welsh",]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
        
        langpicker.hidden = true
       
        
        self.navigationItem.setRightBarButtonItem(SaveButton, animated: true)
        // default
       outputlang = Language.English
    }
    
    override func viewDidAppear(animated: Bool) {
        
        self.navigationController?.navigationBar.barTintColor = UIColor.flatSkyBlueColorDark()
        self.navigationController?.navigationBar.tintColor = UIColor.flatWhiteColor()
        self.navigationController?.navigationItem.title = "Settings"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Savetapped(sender: AnyObject) {
             // save
        print("saved")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        //defaults.setObject(inputlang.rawValue, forKey: "input")
        defaults.setObject(outputlang.rawValue, forKey: "output")
        
        defaults.synchronize()
    }
    
    // this method will fire when the set output languge button is tapped
    @IBAction func setoutlangbuttontapped(sender: AnyObject) {
        langpicker.hidden = false
    }
    
    
    
    
    
    // UIPickerView Delegate and DataSource methods 
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return supportedlangs.count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // this returns the name of the element inside the picker view.
        return supportedlangs[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(supportedlangs[row] as String)
        
        let strvalue = supportedlangs[row] as String
        
        // switch statement to determine the actuall languge value 
        
        switch(strvalue)
        {
            case "English":
            outputlang = Language.English
            case "Spanish":
            outputlang = Language.Spanish
            case "French":
            outputlang = Language.French
        case "Arabic":
            outputlang = Language.Arabic // issue
            case "Polish":
            outputlang = Language.Polish
        case "Bulgarian":
            outputlang = Language.Bulgarian // issue
            case "Catalan":
            outputlang = Language.Catalan
            case  "Chinese (Simplified)":
            outputlang = Language.ChineseSimplified // issue
            case  "Chinese (Traditional)":
            outputlang = Language.ChineseTraditional // issue
            case "Czech":
            outputlang = Language.Czech
        case "Danish":
            outputlang = Language.Danish
        case "Dutch":
            outputlang = Language.Dutch
            case "Estonian":
            outputlang = Language.Estonian
            case "Finnish":
            outputlang = Language.Finnish
            case "German":
            outputlang = Language.German
            case "Greek":
            outputlang = Language.Greek // issue
            case "Haitian Creole":
            outputlang = Language.HaitianCreole
            case "Hebrew":
            outputlang = Language.Hebrew // issue
            case "Hindi":
            outputlang = Language.Hindi // isssue 
            case "Hmong Daw":
            outputlang = Language.HmongDaw
            case "Hungarian":
            outputlang = Language.Hungarian
            case "Indonesian":
            outputlang = Language.Indonesian
            case "Italian":
            outputlang = Language.Italian
        case "Japanese":
            outputlang = Language.Japanese // issue
            case "Korean":
            outputlang = Language.Korean // issue
            case "Latvian":
            outputlang = Language.Latvian
        case "Lithuanian":
            outputlang = Language.Lithuanian
            
            
            
            
            
        default:
            print("Error")
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
