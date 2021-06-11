//
//  TaskCell.swift
//  TestCloud
//
//  Created by Tuan Le on 11/06/2021.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var lblNameTask: UILabel!
    @IBOutlet weak var lblDescTask: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
