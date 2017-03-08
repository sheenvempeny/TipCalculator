//
//  TipUpdator.swift
//  TipCalculator
//
//  Created by sheen vempeny on 3/6/17.
//  Copyright © 2017 sheen vempeny. All rights reserved.
//

import Foundation
import UIKit

class TipUpdator:NSObject {
    
    weak var txtTip:UILabel!
    weak var txtNewBill:UILabel!
    weak var txtFieldBill:UITextField!{
        
        didSet{
            
            txtFieldBill.addTarget(self, action: #selector(TipUpdator.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        }
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        //your code
        updateValues()
    }
    
    func updateValues(){
        
        var amount:Float = 0
        if(self.txtFieldBill.text != ""){
           amount = Float(self.txtFieldBill.text!)!
        }
        
        let tipVal = SettingsController.sharedInstance.tipValue()
        let newTip = (amount * Float(tipVal)/100.0)
        txtTip.text = String(newTip)
        let newBill = amount + newTip
        txtNewBill.text = String(newBill)
        
    }
    
    
}
