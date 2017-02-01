//
//  SettingViewController.swift
//  TIpCalculator
//
//  Created by Nguyen Nam Long on 2/1/17.
//  Copyright © 2017 Nguyen Nam Long. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var tipPercentTextLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var colorTextLabel: UILabel!
    @IBOutlet weak var darkModeTextLabel: UILabel!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var screenView: UIView!
    @IBOutlet weak var percentageControl: UISlider!
    
    @IBOutlet weak var backBarButton: UIBarButtonItem!
    
    
    
    
    
    let defaults = UserDefaults.standard
    var colorModel = ColorModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let percentage = defaults.object(forKey: "TipPercent") as? Int {
            tipPercentLabel.text = "\(percentage)%"
            percentageControl.value = Float(percentage)
        } else {
            tipPercentLabel.text = "\(percentageControl.value)%"
        }
        colorModel.darkMode = Singleton.Instance.Color.darkMode
        colorModel.colorConfig = Singleton.Instance.Color.colorConfig
        darkModeSwitch.isOn = colorModel.darkMode
        
        setup()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onColor(_ sender: UIButton) {
        colorModel.convertStringToColor(name: (sender.titleLabel?.text)!)
        setup()
        
        
    }
    
    @IBAction func onDarkMode(_ sender: UISwitch) {
        colorModel.darkMode = sender.isOn
        setup()
    }

    @IBAction func onTip(_ sender: UISlider) {
        tipPercentLabel.text = "\(Int(percentageControl.value))%"
    }
    
    @IBAction func onSave(_ sender: UIButton) {
        Singleton.Instance.Color = colorModel
        defaults.set(Int(percentageControl.value), forKey: "TipPercent")
        defaults.set(colorModel.colorConfig.name, forKey: "Color")
        defaults.set(colorModel.darkMode, forKey: "IsDarkMode")
        
        defaults.synchronize()
        _ = self.navigationController?.popViewController(animated: true)
//        saveButton.isEnabled = false
    }
    @IBAction func onBack(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func setup() {
        if(colorModel.darkMode) {
            tipPercentTextLabel.textColor = UIColor.white
            colorTextLabel.textColor = UIColor.white
            darkModeTextLabel.textColor = UIColor.white
            screenView.backgroundColor = colorModel.numberPadColor
            backBarButton.tintColor = UIColor.white
            saveButton.titleLabel?.textColor = UIColor.white
            navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
            
        } else {
            tipPercentTextLabel.textColor = UIColor.black
            colorTextLabel.textColor = UIColor.black
            darkModeTextLabel.textColor = UIColor.black
            screenView.backgroundColor = UIColor.white
            saveButton.titleLabel?.textColor = UIColor.black
            backBarButton.tintColor = UIColor.black
            navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black]
        }
        
        navigationController?.navigationBar.barTintColor = colorModel.colorConfig.normal
        
        navigationController?.navigationItem.backBarButtonItem?.title = "Back"
        
        tipPercentLabel.textColor = colorModel.colorConfig.normal
        backgroundView.backgroundColor = colorModel.colorConfig.normal
        saveButton.backgroundColor = colorModel.colorConfig.normal
        percentageControl.thumbTintColor = colorModel.colorConfig.normal
        percentageControl.minimumTrackTintColor = colorModel.disableColor
        saveButton.isEnabled = true
        
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
