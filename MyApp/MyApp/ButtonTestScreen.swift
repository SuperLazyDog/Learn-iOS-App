//
//  ButtonTestScreen.swift
//  MyApp
//
//  Created by 徐伟达 on 2017/5/9.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit

class ButtonTestScreen: UIViewController, LayerSet, UITextFieldDelegate, UIGestureRecognizerDelegate {
    //------------------------------------------------------------------------
    //                               プロパティ
    //------------------------------------------------------------------------
    //-------------------------------------------------------------------
    //                 　　　　　ローカルプロパティ
    //-------------------------------------------------------------------
    let valueStr: String = "Value: "
    //-------------------------------------------------------------------
    //                 　　　　　　　UI
    //-------------------------------------------------------------------
    //stepper
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var clearValueButton: UIButton!
    @IBOutlet weak var valueStepper: UIStepper!
    @IBOutlet weak var changeValueLabel: UILabel!
    //switch
    @IBOutlet weak var isBlackLabel: UILabel!
    @IBOutlet weak var isBlackSwitch: UISwitch!
    
    //slider
    @IBOutlet weak var originBackgroundImageView: UIImageView!
    @IBOutlet weak var newBackgoundImageView: UIImageView!
    
    //textField
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testTextField: UITextField!
    //------------------------------------------------------------------------
    //                                 関数
    //------------------------------------------------------------------------
    //-------------------------------------------------------------------
    //              　　　　　　 ViewController関数
    //-------------------------------------------------------------------
    //------------------------------------------------------
    //                     viewDidLoad
    //------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let okButton = UIButton(type: .custom)
        okButton.frame = CGRect(x: 100, y: 100, width: 120, height: 120)
        //------------------------------------------------------------------------
        //                       　コードでボタンを追加
        //------------------------------------------------------------------------
        //let bkgImage = UIImage(named: "maru")
        /*okButton.setBackgroundImage(#imageLiteral(resourceName: "Image-2"), for: .normal)
         okButton.setImage(#imageLiteral(resourceName: "Image-1"), for: .highlighted)
         okButton.setTitle("OK", for: .normal)
         okButton.setTitleColor(UIColor.black, for: .normal)
         okButton.addTarget(self, action: #selector(ok(_:)), for: .touchUpInside)
         okButton.isHidden = false
         view.addSubview(okButton)*/
        //------------------------------------------------------------------------
        //                       　   初期UI処理
        //------------------------------------------------------------------------
        //stepper
        setBorder(valueLabel, cgBlack, normalWidthInIphone)
        setRadioCorner(clearValueButton, clearValueButton.layer.frame.width/6)
        setBorder(clearValueButton, cgBlack, normalWidthInIphone)
        valueLabel.text = valueStr + String(Int(valueStepper.value))
        setBorder(changeValueLabel, cgBlack, normalWidthInIphone)
        //switch
        setBorder(isBlackLabel, cgBlack, normalWidthInIphone)
        isBlackSwitch.isOn = false
        //textField
        setBorder(testLabel, cgBlack, normalWidthInIphone)
        testTextField.delegate = self
        originTextViewRect = testTextField.frame
        
    }
    //------------------------------------------------------
    //               didReceiveMemoryWarning
    //------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //-------------------------------------------------------------------
    //                 　　　　　カスタマイズ関数
    //-------------------------------------------------------------------
    //------------------------------------------------------
    //                    ローカル関数
    //------------------------------------------------------
    //------------------------------------------------------
    //                   ボタン機能関数
    //------------------------------------------------------
    func ok(_ sender: UIButton) {
        print("OK")
    }
    //-------------------------------------------------------------------
    //              　　　　　　     ボタン関数
    //-------------------------------------------------------------------
    @IBAction func clearValueBut(_ sender: UIButton, forEvent event: UIEvent) {
        valueStepper.value = 0.0
        valueLabel.text = valueStr + "0"
    }
    @IBAction func valueStp(_ sender: UIStepper, forEvent event: UIEvent) {
        valueLabel.text = valueStr + String(Int(sender.value))
    }
    
    @IBAction func isBlackSwc(_ sender: UISwitch, forEvent event: UIEvent) {
        if sender.isOn {
            valueLabel.backgroundColor = UIColor.black
        }else {
            valueLabel.backgroundColor = UIColor(red: 243/255, green: 208/255, blue: 78/255, alpha: 1)
        }
    }
    @IBAction func setBackgroundImageSlider(_ sender: UISlider, forEvent event: UIEvent) {
        newBackgoundImageView.alpha = CGFloat(sender.value)
        originBackgroundImageView.alpha = CGFloat(1.0 - sender.value)
    }
    
    //-------------------------------------------------------------------
    //                 　　　UITextFieldDelegate関数
    //-------------------------------------------------------------------
    var originTextViewRect: CGRect! = nil
    //textFieldShouldBeginEditing
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.frame = CGRect(x: textField.layer.frame.minX, y: UIScreen.main.bounds.midY - textField.layer.frame.height, width: textField.layer.frame.width, height: textField.layer.frame.height)
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    var count = 0
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("characteristics have benn changed")
        /*valueStepper.value += valueStepper.stepValue
        changeValueLabel.text = String(count)
        textField.returnKeyType = UIReturnKeyType(rawValue: count) ?? .default
        count += 1*/
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    @IBAction func test(_ sender: UITapGestureRecognizer) {
        print("taped")
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
