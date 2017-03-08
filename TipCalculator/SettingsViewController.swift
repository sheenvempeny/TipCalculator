//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by sheen vempeny on 3/7/17.
//  Copyright © 2017 sheen vempeny. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

     @IBOutlet weak var txtMin:UITextField!
     @IBOutlet weak var txtMid:UITextField!
     @IBOutlet weak var txtMax:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

       
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         self.load()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func done(button: UIButton) {
        // this is intentionally blank
        self.save()
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func close(button: UIButton) {
        // this is intentionally blank
         self.dismiss(animated: true, completion: nil)
    }
    
    func load(){
        
        self.txtMin.text = String(SettingsController.sharedInstance.minTip)
        self.txtMid.text = String(SettingsController.sharedInstance.midTip)
        self.txtMax.text = String(SettingsController.sharedInstance.maxTip)
        
    }
    
    
    func save(){
        
        SettingsController.sharedInstance.minTip = Int(self.txtMin.text!)
        SettingsController.sharedInstance.midTip = Int(self.txtMid.text!)
        SettingsController.sharedInstance.maxTip = Int(self.txtMax.text!)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
