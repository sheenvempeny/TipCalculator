//
//  SettingsController.swift
//  TipCalculator
//
//  Created by sheen vempeny on 3/6/17.
//  Copyright © 2017 sheen vempeny. All rights reserved.
//

import Foundation

class SettingsController{
    
    private let goodMinVal:Int = 10
    private let goodMidVal:Int = 20
    private let goodMaxVal:Int = 30
    
    static let sharedInstance : SettingsController = {
        let instance = SettingsController()
        return instance
    }()
    
    private func saveAppQuitTime(){
        
        let defaults:UserDefaults = UserDefaults.standard
        defaults.set(NSDate(), forKey: "appQuitDate")
    }
    
    private func appQuitTime() -> NSDate?{
        
        let defaults:UserDefaults = UserDefaults.standard
        let date:NSDate? = defaults.value(forKey: "appQuitDate") as? NSDate
        return date
    }
    
    private func isAppQuitInTenMin() -> Bool{
    
    let otherDate = self.appQuitTime()
        if(otherDate == nil){
            return false
        }
        
    var intervall:Int = NSDate().compare(otherDate as! Date).rawValue
    intervall = intervall/60
        
        if(intervall <= 10){
            return true
        }
        
        return false
    }
    
    func saveLastBillAmount(amount:Float){
        
        self.saveAppQuitTime()
        let defaults:UserDefaults = UserDefaults.standard
        defaults.set(amount, forKey: "lastBillAmount")
    }
    
    func lastBillAmount() -> Float {
        
        if(self.isAppQuitInTenMin() == false){
            return 0.0
        }
        
        let defaults:UserDefaults = UserDefaults.standard
        let midVal = defaults.float(forKey: "lastBillAmount")
        return midVal
    }
    
    func tipValue() -> Int {
        
        var returnVal:Int = 0
        switch self.selTipIndex {
        case 0:
            returnVal = self.minTip
            break
        case 1:
            returnVal = self.midTip
            break
        case 2:
            returnVal = self.maxTip
            break
  
        default:
            break
        }
        
        return returnVal
    }
    
    var minTip:Int!{
        get{
            return self.minTipValue()
        }
        set{
            self.setMinTipValue(min: newValue)
        }
    }
    
    var maxTip:Int!{
        
        get{
            return self.maxTipValue()
        }
        set{
           self.setMaxTipValue(max: newValue)
        }
    }
    
    var midTip:Int!{
        
        get{
            return self.midTipValue()
        }
        set{
            self.setMidTipValue(mid: newValue)
        }
    }
    
    var selTipIndex:Int{
        
        get{
            return self.selIndexTip()
        }
        set{
            
            setSelIndexTip(index: newValue)
        }
    }
    
    private func setSelIndexTip(index:Int) -> Void{
        let defaults:UserDefaults = UserDefaults.standard
        defaults.set(index, forKey: "slectedTipIndex")
    }
    
    private func selIndexTip() -> Int{
        let defaults:UserDefaults = UserDefaults.standard
        let tipIndex = defaults.integer(forKey: "slectedTipIndex")
            
        return tipIndex
    }

    
    private func midTipValue() -> Int{
        let defaults:UserDefaults = UserDefaults.standard
        var midVal = defaults.integer(forKey: "midTip")
        midVal = midVal == 0 ? goodMidVal : midVal
        return midVal
    }
    private func setMidTipValue(mid:Int) -> Void{
        let defaults:UserDefaults = UserDefaults.standard
        let newMid = mid == 0 ? goodMidVal : mid
        defaults.set(newMid, forKey: "midTip")
    }

    private func maxTipValue() -> Int{
        let defaults:UserDefaults = UserDefaults.standard
        var maxVal = defaults.integer(forKey: "maxTip")
        maxVal = maxVal == 0 ? goodMaxVal : maxVal
        return maxVal
    }
    private func setMaxTipValue(max:Int) -> Void{
        let defaults:UserDefaults = UserDefaults.standard
        let newMax = max == 0 ? goodMaxVal : max
        defaults.set(newMax, forKey: "maxTip")
    }
    
    private func minTipValue() -> Int{
        let defaults:UserDefaults = UserDefaults.standard
        var minVal = defaults.integer(forKey: "minTip")
        minVal = minVal == 0 ? goodMinVal : minVal
        return minVal
    }
    private func setMinTipValue(min:Int) -> Void{
        let defaults:UserDefaults = UserDefaults.standard
        let newMin = min == 0 ? goodMinVal : min
        defaults.set(newMin, forKey: "minTip")
    }
}
