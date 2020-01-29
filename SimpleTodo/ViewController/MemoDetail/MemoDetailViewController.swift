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
    
    var deleteHandler: ((IndexPath) -> Void)?
    var editHandler: ((Memo, IndexPath) -> Void)?
    
    // view가 로드 되었을때 (viewDidLoad는 한번만 호출된다)
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Detail viewDidLoad")
        setupUI()
    }
    
    // view가 나타나기전에
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Detail viewWillAppear")
    }
    
    // view가 나타났을때
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Detail viewDidAppear")
    }
    
    // view가 없어지기전에
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Detail viewWillDisappear")
    }
    
    // view가 없어졌을때
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Detail viewDidDisappear")
    }
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func pop(_ sender: UIBarButtonItem) {
        guard let memo = memo, let indexPath = indexPath else { return }
        editHandler?(memo, indexPath)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteMemo(_ sender: UIBarButtonItem) {
        guard let indexPath = indexPath else { return }
        deleteHandler?(indexPath)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editMemo(_ sender: UIBarButtonItem) {
        guard let memo = memo else { return }
        
        if let naviVC = storyboard?.instantiateViewController(withIdentifier: MemoComposeViewController.reuseIdentifier) as? UINavigationController, let composeVC = naviVC.viewControllers.first as? MemoComposeViewController {
            composeVC.addHandler = { memo in
                self.memo = memo
                self.tableView.reloadData()
            }
            
            composeVC.configure(with: memo)
            
            self.present(naviVC, animated: true, completion: nil)
        }
    }
    
    func configure(with memo: Memo, at indexPath: IndexPath) {
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
