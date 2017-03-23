//
//  TipUpdator.swift
//  TipCalculator
//
//  Created by sheen vempeny on 3/6/17.
//  Copyright © 2017 sheen vempeny. All rights reserved.
//

import Foundation
import UIKit

extension Float {
    var asLocaleCurrency:String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = NSLocale.current
        let num:NSNumber = NSNumber(value: self)
        return formatter.string(from: num)!
    }
    
    
}

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
        var txtBill:String? = self.txtFieldBill.text
        if(txtBill != nil &&  txtBill != "" && (txtBill?.characters.count)! > 1){
            
            let billAmnt:Float? = Float((txtBill)!)
            if(billAmnt != nil){
                amount = billAmnt!
            }
        }
        
        let tipVal = SettingsController.sharedInstance.tipValue()
        let newTip = (amount * Float(tipVal)/100.0)
        txtTip.text = newTip.asLocaleCurrency
        let newBill = amount + newTip
        txtNewBill.text = newBill.asLocaleCurrency
        
    }
    
    
}
