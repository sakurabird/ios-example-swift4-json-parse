//
//  TableViewCell.swift
//  ExamJsonToTable
//
//  Created by Sakura on 2017/12/23.
//  Copyright © 2017年 Sakura. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

  // MARK: - outlets
  
  @IBOutlet weak var color: UILabel!
  @IBOutlet weak var category: UILabel!
  @IBOutlet weak var type: UILabel!
  @IBOutlet weak var hex: UILabel!
  @IBOutlet weak var rgba1: UILabel!
  @IBOutlet weak var rgba2: UILabel!
  @IBOutlet weak var rgba3: UILabel!
  @IBOutlet weak var rgba4: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
