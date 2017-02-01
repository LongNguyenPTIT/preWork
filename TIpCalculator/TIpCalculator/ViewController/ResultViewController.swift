//
//  ResultViewController.swift
//  TIpCalculator
//
//  Created by Nguyen Nam Long on 1/29/17.
//  Copyright © 2017 Nguyen Nam Long. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var billAmountTextLabel: UILabel!
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var tipRateTextLabel: UILabel!
    @IBOutlet weak var tipRateLabel: UILabel!
    @IBOutlet weak var percentageSlider: UISlider!
    @IBOutlet weak var tipAmountTextLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalTextLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitBillButton: UIButton!
    @IBOutlet weak var peopleTextLabel: UILabel!
    @IBOutlet weak var peopleTextField: UITextField!
    @IBOutlet weak var costPerPersonTextLabel: UILabel!
    @IBOutlet weak var costPerPersonLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var splitTheBillView: UIView!
    @IBOutlet var screenView: UIView!
    @IBOutlet weak var backBarItem: UIBarButtonItem!
    
    var tipModel = Singleton.Instance.Tipmodel
    var colorModel = Singleton.Instance.Color
    var currentSymbol = Singleton.Instance.currencySymbol
    var currentCode = Singleton.Instance.currencyCode
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backBarItem.tintColor = colorModel.numberColor
        billAmountLabel.text = "\(currentSymbol) \(tipModel.billAmount)"
        splitTheBillView.isHidden = true
        
        
        if let tipPercent = UserDefaults.standard.object(forKey: "TipPercent") as? Int {
            tipModel.tipPercent = tipPercent
            percentageSlider.value = Float(tipModel.tipPercent)
        } else {
            tipModel.tipPercent = Int(percentageSlider.value)
        }
    
        peopleTextField.text = String(tipModel.people)
        calculateEverything(tipPercentage: tipModel.tipPercent)
        setupColor()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onBack(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onSplitBill(_ sender: UIButton) {
        if splitBillButton.isSelected {
            splitBillButton.isSelected = false
            splitTheBillView.isHidden = true
        } else {
            splitBillButton.isSelected = true
            splitTheBillView.isHidden = false
        }
    }
    
    @IBAction func onPeople(_ sender: AnyObject) {
        if let item = Int(peopleTextField.text!) {
            if item == 0 {
                let alertMess = UIAlertController(title: "Error", message: "the person must than 0", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertMess.addAction(okAction)
                self.present(alertMess, animated: true, completion: { 
                    self.peopleTextField.text = ""
                })
                
            }else {
                tipModel.people = item
                costPerPersonLabel.text = "\(tipModel.totalPerPerson) \(currentCode)"
            }
        }
    }
    
    @IBAction func onTipPercent(_ sender: UISlider) {
        let percent = Int(sender.value)
        tipModel.tipPercent = percent
        calculateEverything(tipPercentage: tipModel.tipPercent)
    }
    
    
    func calculateEverything(tipPercentage: Int) {
        tipRateLabel.text = "\(tipPercentage)%"
        tipAmountLabel.text = "\(currentSymbol) \(tipModel.tipAmount)"
        totalLabel.text = " \(tipModel.totalAmount) \(currentCode)"
        costPerPersonLabel.text = " \(tipModel.totalPerPerson) \(currentCode)"
        
    }
    
    func setupColor() {
        bottomView.backgroundColor = colorModel.numberPadColor
        let color = colorModel.colorConfig.normal
        billAmountLabel.textColor = color
        tipRateLabel.textColor = color
        tipAmountLabel.textColor = color
        totalLabel.textColor = color
        costPerPersonLabel.textColor = color
        splitBillButton.backgroundColor = color
        percentageSlider.thumbTintColor = color
        percentageSlider.minimumTrackTintColor = colorModel.disableColor
        screenView.backgroundColor = colorModel.screenColor
        splitTheBillView.backgroundColor = screenView.backgroundColor
        
        
        if(colorModel.darkMode) {
            billAmountTextLabel.textColor = UIColor.white
            tipRateTextLabel.textColor = UIColor.white
            tipAmountTextLabel.textColor = UIColor.white
            totalTextLabel.textColor = UIColor.white
            peopleTextLabel.textColor = UIColor.white
            costPerPersonTextLabel.textColor = UIColor.white

        } else {
            billAmountTextLabel.textColor = UIColor.black
            tipRateTextLabel.textColor = UIColor.black
            tipAmountTextLabel.textColor = UIColor.black
            totalTextLabel.textColor = UIColor.black
            peopleTextLabel.textColor = UIColor.black
            costPerPersonTextLabel.textColor = UIColor.black
        }
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
