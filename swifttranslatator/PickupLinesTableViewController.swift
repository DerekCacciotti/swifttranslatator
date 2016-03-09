//
//  PickupLinesTableViewController.swift
//  swifttranslatator
//
//  Created by Derek Cacciotti on 3/9/16.
//  Copyright © 2016 Derek Cacciotti. All rights reserved.
//

import UIKit
import Polyglot
import AVFoundation

class PickupLinesTableViewController: UITableViewController, ISSpeechSynthesisDelegate {
    
    var pickuplinesarray = ["I'm not a photographer, but I can picture me and you together.", "I wanna live in your socks so I can be with you every step of the way.", "is your daddy a Baker? Because you've got some nice buns!"]
    
    let defaults = NSUserDefaults.standardUserDefaults()
    let translator = Polyglot(clientId: "translatorswift", clientSecret: "KqbAaNwUAL+B6CxpqKKtRhy2dYLvckUhXCzlc748D7M=")
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        var outp = defaults.objectForKey("output") as! String
        translator.toLanguage = Language(rawValue: outp)!
        self.navigationController!.title = "Useful pick up lines "
        
        let tapgesure = UITapGestureRecognizer(target: self, action: "handleTap")
        self.view.addGestureRecognizer(tapgesure)
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pickuplinesarray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.lineBreakMode = .ByWordWrapping
        cell.textLabel?.numberOfLines = 4
        cell.textLabel?.text = pickuplinesarray[indexPath.row]

         //Configure the cell...
        
        

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        translator.translate(pickuplinesarray[indexPath.row]) { (translation) -> (Void) in
            
            if self.translator.toLanguage.rawValue == "ar"
            {
                let utterance = AVSpeechUtterance(string: translation)
                utterance.voice = AVSpeechSynthesisVoice(language: "ar-SA")
                
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speakUtterance(utterance)
            }
                
            else if self.translator.toLanguage.rawValue == "zh-CHS"
            {
                
                let utterance = AVSpeechUtterance(string: translation)
                utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")
                
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speakUtterance(utterance)
            }
                
            else if self.translator.toLanguage.rawValue == "zh-CHT"
            {
                
                let utterance = AVSpeechUtterance(string: translation)
                utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
                
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speakUtterance(utterance)
            }
                
            else if self.translator.toLanguage.rawValue == "el"
            {
                let utterance = AVSpeechUtterance(string: translation)
                utterance.voice = AVSpeechSynthesisVoice(language: "el-GR")
                
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speakUtterance(utterance)
            }
                
                
            else if self.translator.toLanguage.rawValue == "he"
            {
                let utterance = AVSpeechUtterance(string: translation)
                utterance.voice = AVSpeechSynthesisVoice(language: "he-IL")
                
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speakUtterance(utterance)
            }
                
            else if self.translator.toLanguage.rawValue == "ja"
            {
                let utterance = AVSpeechUtterance(string: translation)
                utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
                
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speakUtterance(utterance)
            }
                
            else if self.translator.toLanguage.rawValue == "ko"
            {
                let utterance = AVSpeechUtterance(string: translation)
                utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speakUtterance(utterance)
            }
                
            else if self.translator.toLanguage.rawValue == "ru"
            {
                let utterance = AVSpeechUtterance(string: translation)
                utterance.voice = AVSpeechSynthesisVoice(language: "ru-RU")
                
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speakUtterance(utterance)
            }
                
                
            else if self.translator.toLanguage.rawValue == "th"
            {
                let utterance = AVSpeechUtterance(string: translation)
                utterance.voice = AVSpeechSynthesisVoice(language: "th-TH")
                
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speakUtterance(utterance)
            }
            else
            {
                
                var synth:ISSpeechSynthesis = ISSpeechSynthesis(text: translation)
                try! synth.speak()
            }
            
            
            
            //var synth:ISSpeechSynthesis = ISSpeechSynthesis(text: translation)
            //try! synth.speak()
            
        }
        
        
        

    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
