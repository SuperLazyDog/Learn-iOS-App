//
//  TableViewCell.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/30.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
	var sampleData = 0
	@IBOutlet weak var testButton: UIButton!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
