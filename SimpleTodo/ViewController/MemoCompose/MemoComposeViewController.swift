//
//  MemoComposeViewController.swift
//  SimpleTodo
//
//  Created by 이재섭(Lee, JaeSeob) on 20/01/2020.
//  Copyright © 2020 leftydev. All rights reserved.
//

import UIKit

class MemoComposeViewController: UIViewController {

    @IBOutlet weak var contentView: UITextView!
    
    private var memo: Memo?
    
    // ((넘길 데이터) -> Void)?
    var addHandler: ((Memo) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.text = memo?.content
    }
    
    @IBAction func dismiss(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        guard let content = contentView.text, content.count > 0 else {
            let controller = UIAlertController(title: "알림", message: "메모를 입력해주세요", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller, animated: true, completion: nil)
            return
        }
        
        let memo = Memo(content: content, date: Date())
        
        addHandler?(memo)
        
        dismiss(animated: true, completion: nil)
    }
    
    func configure(with memo: Memo) {
        self.memo = memo
    }
}
