//
//  ViewController.swift
//  TipCalculator
//
//  Created by sheen vempeny on 3/6/17.
//  Copyright © 2017 sheen vempeny. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var lblBillCurrency:UILabel!
    @IBOutlet weak var txtFieldBill:UITextField!
    @IBOutlet weak var txtFieldTip:UILabel!
    @IBOutlet weak var txtFieldNewBill:UILabel!
    @IBOutlet weak var segCntl:UISegmentedControl!
    
    var tipUpdater:TipUpdator = TipUpdator()

    deinit{
        
        NotificationCenter.default.removeObserver(self)
        
    }
    
    func updateUIColors(){
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.lightGray.cgColor, UIColor.darkGray.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateUIColors()
        
    }
    @IBAction func tipChanged(segCntl:UISegmentedControl){
        self.txtFieldNewBill.resignFirstResponder()
        SettingsController.sharedInstance.selTipIndex =
        segCntl.selectedSegmentIndex
        self.tipUpdater.updateValues()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.updateUI()
        self.txtFieldNewBill.perform(#selector(becomeFirstResponder), with: nil, afterDelay: 3)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.txtFieldNewBill.text = String(SettingsController.sharedInstance.lastBillAmount())
        tipUpdater.txtNewBill = self.txtFieldNewBill
        tipUpdater.txtTip = self.txtFieldTip
        tipUpdater.txtFieldBill = self.txtFieldBill
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.saveAppData(notification:)), name: Notification.Name("saveAppData"), object: nil)
    }

    func saveAppData(notification:NSNotification){
        
        SettingsController.sharedInstance.saveLastBillAmount(amount: Float(self.txtFieldNewBill.text!)!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateUI(){
        
        let selIndex:Int = SettingsController.sharedInstance.selTipIndex
        let minVal = SettingsController.sharedInstance.minTip
        let maxVal = SettingsController.sharedInstance.maxTip
        let midVal = SettingsController.sharedInstance.midTip
        
        self.segCntl.setTitle(String(format: "%d%@", minVal!,"%"), forSegmentAt: 0)
         self.segCntl.setTitle(String(format: "%d%@", midVal!,"%"), forSegmentAt: 1)
         self.segCntl.setTitle(String(format: "%d%@", maxVal!,"%"), forSegmentAt: 2)
        
        self.segCntl.selectedSegmentIndex = selIndex
        self.tipUpdater.updateValues()
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol
        self.lblBillCurrency.text = currencySymbol
    }
    
    

}

