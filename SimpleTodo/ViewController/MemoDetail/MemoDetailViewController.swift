//
//  MemoDetailViewController.swift
//  SimpleTodo
//
//  Created by 이재섭(Lee, JaeSeob) on 23/01/2020.
//  Copyright © 2020 leftydev. All rights reserved.
//

import UIKit

class MemoDetailViewController: UIViewController {
    
    enum CellType: Int {
        case content,
        date
    }

    @IBOutlet weak var tableView: UITableView!
    
    private var memo: Memo?
    private var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func pop(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteMemo(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func editMemo(_ sender: UIBarButtonItem) {
        
    }
    
    func configure(with memo: Memo, indexPath: IndexPath) {
        self.memo = memo
        self.indexPath = indexPath
    }
}

extension MemoDetailViewController: UITableViewDataSource {
    
    // Cell 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // Cell에 data를 넘겨주는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        switch CellType(rawValue: indexPath.row) {
        case .content:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentCell.reuseIdentifier, for: indexPath) as? ContentCell else {
            return UITableViewCell()
            }
            
            cell.configure(with: memo?.content ?? "")
            
            return cell
        
        case .date:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DateCell.reuseIdentifier, for: indexPath) as? DateCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: memo?.date ?? Date())
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension MemoDetailViewController: UITableViewDelegate {
    
}
