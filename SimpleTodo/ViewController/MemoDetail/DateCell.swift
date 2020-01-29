//
//  DateCell.swift
//  SimpleTodo
//
//  Created by 이재섭(Lee, JaeSeob) on 23/01/2020.
//  Copyright © 2020 leftydev. All rights reserved.
//

import UIKit

class DateCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with date: Date) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "Ko_kr")
        
//        self.dateLabel.text = "\(date)"
        self.dateLabel.text = formatter.string(from: date)

    }
    
    func configure(with memo: Memo?) {
        guard let memo = memo else { return }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "Ko_kr")
//        formatter.string(from: memo.date)
        
//        self.dateLabel.text = "\(memo.date)"
        self.dateLabel.text = formatter.string(from: memo.date)
    }
}
