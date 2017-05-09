//
//  ButtonTestScreen.swift
//  MyApp
//
//  Created by 徐伟达 on 2017/5/9.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit

class ButtonTestScreen: UIViewController, LayerSet {
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
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var clearValueButton: UIButton!
    @IBOutlet weak var valueStepper: UIStepper!
    //------------------------------------------------------------------------
    //                                 関数
    //------------------------------------------------------------------------
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
        setBorder(valueLabel, cgBlack, normalWidthInIphone)
        setRadioCorner(clearValueButton, clearValueButton.layer.frame.width/6)
        setBorder(clearValueButton, cgBlack, normalWidthInIphone)
        valueLabel.text = valueStr + String(Int(valueStepper.value))
    }
    //------------------------------------------------------
    //               didReceiveMemoryWarning
    //------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
