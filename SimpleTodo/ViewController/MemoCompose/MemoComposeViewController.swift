//
//  MemoComposeViewController.swift
//  SimpleTodo
//
//  Created by 이재섭(Lee, JaeSeob) on 20/01/2020.
//  Copyright © 2020 leftydev. All rights reserved.
//

import UIKit

class MemoComposeViewController: UIViewController {

    @IBOutlet weak var contentView: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func dismiss(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
    }
    
}
