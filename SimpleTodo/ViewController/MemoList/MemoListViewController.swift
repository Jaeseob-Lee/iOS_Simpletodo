//
//  MemoListViewController.swift
//  SimpleTodo
//
//  Created by 이재섭(Lee, JaeSeob) on 17/01/2020.
//  Copyright © 2020 leftydev. All rights reserved.
//

import UIKit

class MemoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func addMemo(_ sender: UIBarButtonItem) {
        if let naviVC = storyboard?.instantiateViewController(withIdentifier: "MemoComposeViewController") as? UINavigationController, let composeVC = naviVC.viewControllers.first as? MemoComposeViewController {
            self.present(naviVC, animated: true, completion: nil)
        }
    }

}

extension MemoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension MemoListViewController: UITableViewDelegate {
    
}
