/*
*     Copyright 2016 IBM Corp.
*     Licensed under the Apache License, Version 2.0 (the "License");
*     you may not use this file except in compliance with the License.
*     You may obtain a copy of the License at
*     http://www.apache.org/licenses/LICENSE-2.0
*     Unless required by applicable law or agreed to in writing, software
*     distributed under the License is distributed on an "AS IS" BASIS,
*     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*     See the License for the specific language governing permissions and
*     limitations under the License.
*/


import UIKit

public var responseText: String?

class ViewController: UIViewController {

    @IBOutlet var textField: UITextView!
    @IBOutlet var swictButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.updateMessage), name: "action", object: nil)

    }

    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    @IBAction func switchstateChanged(sender: UISwitch) {
        
        if sender.on{
            
            textField.text = "started Registration \n"
            appDelegate.registerForPush()
        }
        else{
            textField.text = "";
            textField.text = "Unregister Push"
            appDelegate.unRegisterPush()
        }
    }
    
    func updateMessage () {
        
        var responseLabelText = self.textField.text
        responseLabelText = "\(responseLabelText) \n Response Text: \(responseText) \n\n"
       
        dispatch_async(dispatch_get_main_queue(), {
            self.textField.text = responseLabelText
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

