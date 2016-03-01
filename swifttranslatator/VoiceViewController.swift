//
//  VoiceViewController.swift
//  swifttranslatator
//
//  Created by Derek Cacciotti on 2/4/16.
//  Copyright © 2016 Derek Cacciotti. All rights reserved.
//

import UIKit
import Polyglot


class VoiceViewController: UIViewController, ISSpeechRecognitionDelegate, ISSpeechSynthesisDelegate  {
    let translator = Polyglot(clientId: "translatorswift", clientSecret: "KqbAaNwUAL+B6CxpqKKtRhy2dYLvckUhXCzlc748D7M=")
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var outp:String!
    
    
    @IBOutlet weak var resultlabel: UILabel!
    
    
    @IBOutlet weak var restartButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.defaults.objectForKey("output") as! String)
        
        outp = defaults.objectForKey("output") as! String
        print(outp)
        resultlabel.hidden = true
        restartButton.hidden = true
        
        
        var recoginzer:ISSpeechRecognition = ISSpeechRecognition()
        recoginzer.delegate = self
        
        
    
    

        
        
        recoginzer.listenWithHandler { (error, result, success) -> Void in
            if error == nil
            {
                //print(error)
            }
            else
            {
                print(result.text)
            }
            
            self.translator.toLanguage  = Language(rawValue: self.outp)!
            
            self.translator.translate(result.text, callback: { (translation) -> (Void) in
                print(translation)
                
                self.resultlabel.text = translation
                
                var synth:ISSpeechSynthesis = ISSpeechSynthesis(text: translation)
                try! synth.speak()
                self.restartButton.hidden = false
                self.resultlabel.hidden = false

                
            })
            //self.TranslateandSpeak(result.text)
        }
        
        
        
        
        
        
        
        
        
    }
    
    func recognitionCancelledByUser(speechRecognition: ISSpeechRecognition!) {
        let alert = UIAlertController(title: "Cancel", message: "You have cancelled the translation", preferredStyle: .Alert)
        let next = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(next)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    func recognition(speechRecognition: ISSpeechRecognition!, didGetRecognitionResult result: ISSpeechRecognitionResult!) {
        //TranslateandSpeak(result.text)
    }
    func recognitionDidFinishRecording(speechRecognition: ISSpeechRecognition!) {
        print(speechRecognition)
    
    }
    
    // this is called whhen the restart button is pressed
    @IBAction func restartpressed(sender: AnyObject) {
        var recoginzer:ISSpeechRecognition = ISSpeechRecognition()
        recoginzer.delegate = self
        
        recoginzer.listenWithHandler { (error, result, success) -> Void in
           if error == nil
           {
             //print(error)
            }
            else
           {
                print(result.text)
            }
            
            self.translator.toLanguage  = Language(rawValue: self.outp)!
            
            self.translator.translate(result.text, callback: { (translation) -> (Void) in
                print(translation)
                
                self.resultlabel.text = translation
                
                var synth:ISSpeechSynthesis = ISSpeechSynthesis(text: translation)
                try! synth.speak()
                self.restartButton.hidden = false
                self.resultlabel.hidden = false
                
                
            })
            //self.TranslateandSpeak(result.text)
        }
        

    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
