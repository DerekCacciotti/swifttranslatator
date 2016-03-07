//
//  VoiceViewController.swift
//  swifttranslatator
//
//  Created by Derek Cacciotti on 2/4/16.
//  Copyright © 2016 Derek Cacciotti. All rights reserved.
//

import UIKit
import Polyglot
import AVFoundation

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
                
                if self.translator.toLanguage.rawValue == "ar"
                {
                    let utterance = AVSpeechUtterance(string: self.resultlabel.text!)
                    utterance.voice = AVSpeechSynthesisVoice(language: "ar-SA")
                    
                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speakUtterance(utterance)
                }
                
                else if self.translator.toLanguage.rawValue == "zh-CHS"
                {
                    
                    let utterance = AVSpeechUtterance(string: self.resultlabel.text!)
                    utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")
                    
                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speakUtterance(utterance)
                }
                
                else if self.translator.toLanguage.rawValue == "zh-CHT"
                {
                    
                    let utterance = AVSpeechUtterance(string: self.resultlabel.text!)
                    utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
                    
                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speakUtterance(utterance)
                }
                    
                else if self.translator.toLanguage.rawValue == "el"
                {
                    let utterance = AVSpeechUtterance(string: self.resultlabel.text!)
                    utterance.voice = AVSpeechSynthesisVoice(language: "el-GR")
                    
                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speakUtterance(utterance)
                }
                    
                    
                else if self.translator.toLanguage.rawValue == "he"
                {
                    let utterance = AVSpeechUtterance(string: self.resultlabel.text!)
                    utterance.voice = AVSpeechSynthesisVoice(language: "he-IL")
                    
                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speakUtterance(utterance)
                }
                
                else if self.translator.toLanguage.rawValue == "ja"
                {
                    let utterance = AVSpeechUtterance(string: self.resultlabel.text!)
                    utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
                    
                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speakUtterance(utterance)
                }
                    
                else if self.translator.toLanguage.rawValue == "ko"
                {
                    let utterance = AVSpeechUtterance(string: self.resultlabel.text!)
                    utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                    
                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speakUtterance(utterance)
                }
                
                else if self.translator.toLanguage.rawValue == "ru"
                {
                    let utterance = AVSpeechUtterance(string: self.resultlabel.text!)
                    utterance.voice = AVSpeechSynthesisVoice(language: "ru-RU")
                    
                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speakUtterance(utterance)
                }
                
                    
                else if self.translator.toLanguage.rawValue == "th"
                {
                    let utterance = AVSpeechUtterance(string: self.resultlabel.text!)
                    utterance.voice = AVSpeechSynthesisVoice(language: "th-TH")
                    
                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speakUtterance(utterance)
                }
                    



                

                
                    
                
                                   
                else
                {
                    print("doesnt match param")
                }


                
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
    
    // this is called when the restart button is pressed
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
                if translation.isEmpty
                {
                    print("nil")
                }
                
                self.resultlabel.text = translation
                
                var synth:ISSpeechSynthesis = ISSpeechSynthesis(text: translation)
                try! synth.speak()
                self.restartButton.hidden = false
                self.resultlabel.hidden = false
                //self.speakNonAlphaLanugues(self.resultlabel.text!, lang: self.translator.toLanguage)
                
                
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
