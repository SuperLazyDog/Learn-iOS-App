//
//  ViewController.swift
//  PopMenuDemo
//
//  Created by Weida Xu on 2017/8/8.
//  Copyright © 2017年 Weida Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //1.创建tableView对象
    //lazy var tableView : UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //setUpUI();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

/*
 extension ViewController {} 相当于OC中的类别，可以把一些方法放在里面，不能写属性
 */
// MARK:-初始化UI的扩展
extension ViewController{
    ///初始化UI
    func setUpUI(tableView : UITableView) {
        //2设置tableView的frame
        tableView.frame = view.bounds
        //3.添加到控制器view
        view.addSubview(tableView)
        //4设置数据源
        tableView.dataSource = self
        //5设置代理
        tableView.delegate = self
    }
}


/*
 extension ViewController {} 相当于OC中的类别，可以把一些方法放在里面，不能写属性
 */

// MARK: tableView的数据源和代理的扩展  (这里相当于OC中的 #pragma 书签)
extension ViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1创建cell
        let identifier : String = "identifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            //在swift中使用枚举类型方式 1>枚举类型.具体类型  2> .具体类型
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier)
        }
        //2设置数据
        
        cell?.textLabel?.text = "swiftTableView"
        cell?.detailTextLabel?.text = "\(indexPath.row)>"
        
        //3返回cell
        
        return cell!//在这个地方返回的cell一定不为nil，可以强制解包
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MyLog(message: indexPath.row)
    }
}

