//
//  CalculatorViewController.swift
//  TIpCalculator
//
//  Created by Nguyen Nam Long on 1/29/17.
//  Copyright © 2017 Nguyen Nam Long. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var screenLabel: UILabel!
    @IBOutlet weak var clearBt: UIButton!
    @IBOutlet weak var pointButton: UIButton!
    @IBOutlet weak var zeroBt: UIButton!
    @IBOutlet weak var oneBt: UIButton!
    @IBOutlet weak var twoBt: UIButton!
    @IBOutlet weak var threeBt: UIButton!
    @IBOutlet weak var fourBt: UIButton!
    @IBOutlet weak var fiveBt: UIButton!
    @IBOutlet weak var sixBt: UIButton!
    @IBOutlet weak var sevenBt: UIButton!
    @IBOutlet weak var eightBt: UIButton!
    @IBOutlet weak var nineBt: UIButton!
    @IBOutlet weak var nextBt: UIButton!
    @IBOutlet weak var settingBarItem: UIBarButtonItem!
    
    @IBOutlet var numberPadView: UIView!
    
    var tipModel = Singleton.Instance.Tipmodel
    var billAmount:Double = 0
    var count:Double = 0

    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenLabel.text = ""
        if let colorString = defaults.object(forKey: "Color") as? String {
            Singleton.Instance.Color.convertStringToColor(name: colorString)
        }
        
        if let isDarkMode = defaults.object(forKey: "IsDarkMode") as? Bool {
            Singleton.Instance.Color.darkMode = isDarkMode
        }
        setup()


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onInput(_ sender: UIButton) {
        
        let formmatter = NumberFormatter()
        formmatter.numberStyle = .decimal
        var temp:Double = 1
        
        switch sender.titleLabel!.text! {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            if pointButton.isEnabled {
                
                billAmount = billAmount * 10 + Double((sender.titleLabel?.text)!)!
                if billAmount > 1000000000 {
                    zeroBt.isEnabled = false
                    oneBt.isEnabled = false
                    twoBt.isEnabled = false
                    threeBt.isEnabled = false
                    fourBt.isEnabled = false
                    fiveBt.isEnabled = false
                    sixBt.isEnabled = false
                    sevenBt.isEnabled = false
                    eightBt.isEnabled = false
                    nineBt.isEnabled = false
                    pointButton.isEnabled = false
                }
                
            } else {
                count += 1
                for _ in 1...Int(count) {
                    temp *= 0.1
                }
                billAmount = billAmount + temp * Double(sender.titleLabel!.text!)!
                if(count == 3) {
                    zeroBt.isEnabled = false
                    oneBt.isEnabled = false
                    twoBt.isEnabled = false
                    threeBt.isEnabled = false
                    fourBt.isEnabled = false
                    fiveBt.isEnabled = false
                    sixBt.isEnabled = false
                    sevenBt.isEnabled = false
                    eightBt.isEnabled = false
                    nineBt.isEnabled = false
                }
            }
            screenLabel.text = "\(Singleton.Instance.currencySymbol)\(formmatter.string(from: NSNumber(value: billAmount))!)"
            
        case "." :
            pointButton.isEnabled = false
            screenLabel.text = "\(Singleton.Instance.currencySymbol)\(formmatter.string(from: NSNumber(value: billAmount))!)" + "."
            if billAmount > 0 {
                
            }
            
        case "clear":
            screenLabel.text = "0"
            count = 0
            billAmount = 0
            pointButton.isEnabled = true
            zeroBt.isEnabled = true
            oneBt.isEnabled = true
            twoBt.isEnabled = true
            threeBt.isEnabled = true
            fourBt.isEnabled = true
            fiveBt.isEnabled = true
            sixBt.isEnabled = true
            sevenBt.isEnabled = true
            eightBt.isEnabled = true
            nineBt.isEnabled = true
            
            
            
        default: break
        }
        Singleton.Instance.Tipmodel.billAmount = self.billAmount
        print(Singleton.Instance.Tipmodel.billAmount)
        
    }
    
    func setup() {
        screenLabel.backgroundColor =  Singleton.Instance.Color.screenColor
        numberPadView.backgroundColor = Singleton.Instance.Color.numberPadColor
        screenLabel.textColor = Singleton.Instance.Color.colorConfig.normal
        settingBarItem.tintColor = Singleton.Instance.Color.numberColor
        navigationController?.navigationBar.barTintColor = Singleton.Instance.Color.numberPadColor
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Singleton.Instance.Color.numberColor]
        navigationController?.navigationItem.backBarButtonItem?.tintColor = Singleton.Instance.Color.numberColor
        
        
        numberPadView.backgroundColor = Singleton.Instance.Color.numberPadColor
        
        
        let numberColor = Singleton.Instance.Color.numberColor
        zeroBt.setTitleColor(numberColor, for: .normal)
        oneBt.setTitleColor(numberColor, for: .normal)
        twoBt.setTitleColor(numberColor, for: .normal)
        threeBt.setTitleColor(numberColor, for: .normal)
        fourBt.setTitleColor(numberColor, for: .normal)
        fiveBt.setTitleColor(numberColor, for: .normal)
        sixBt.setTitleColor(numberColor, for: .normal)
        sevenBt.setTitleColor(numberColor, for: .normal)
        eightBt.setTitleColor(numberColor, for: .normal)
        nineBt.setTitleColor(numberColor, for: .normal)
        pointButton.setTitleColor(numberColor, for: .normal)
        clearBt.setTitleColor(numberColor, for: .normal)
        nextBt.setTitleColor(numberColor, for: .normal)
        
        let disableColor = Singleton.Instance.Color.disableColor
        zeroBt.setTitleColor(disableColor, for: .disabled)
        oneBt.setTitleColor(disableColor, for: .disabled)
        twoBt.setTitleColor(disableColor, for: .disabled)
        threeBt.setTitleColor(disableColor, for: .disabled)
        fourBt.setTitleColor(disableColor, for: .disabled)
        fiveBt.setTitleColor(disableColor, for: .disabled)
        sixBt.setTitleColor(disableColor, for: .disabled)
        sevenBt.setTitleColor(disableColor, for: .disabled)
        eightBt.setTitleColor(disableColor, for: .disabled)
        nineBt.setTitleColor(disableColor, for: .disabled)
        pointButton.setTitleColor(disableColor, for: .disabled)

        
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier! {
        case "result":
            print("result")

            
        default:
            print("default")
        }
    }
 

}
