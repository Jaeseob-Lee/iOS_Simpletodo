//
//  MemoCell.swift
//  SimpleTodo
//
//  Created by 이재섭(Lee, JaeSeob) on 20/01/2020.
//  Copyright © 2020 leftydev. All rights reserved.
//

import UIKit

class MemoCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with content: String) {
        self.contentLabel.text = content
    }
}
