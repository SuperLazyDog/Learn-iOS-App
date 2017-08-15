//
//  TableViewViewController.swift
//  MyApp
//
//  Created by 徐伟达 on 2017/8/16.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit

let session_Title = ["A", "B", "C"]
let session0 = [1, 2, 3]
let session1 = [4]
let session2 = [5, 6, 7, 8, 9]
let tableData = [session0, session1, session2]
class TableViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //------------------------------------------------------------------------
    //                       Table View Data Source
    //------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData[section].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let cellData = tableData[indexPath.section][indexPath.row]
        cell.textLabel?.text = String(cellData)
        cell.detailTextLabel?.text = "test"
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return session_Title.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return session_Title[section]
    }
    //------------------------------------------------------------------------
    //                       Table View Delegata
    //------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellSection = session_Title[indexPath.section]
        let cellText = tableData[indexPath.section][indexPath.row]
        print("\(cellSection) \(cellText)")
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
