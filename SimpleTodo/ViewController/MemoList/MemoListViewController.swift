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
    
    var memos: [Memo] = []
    
    // view가 로드 되었을때 (viewDidLoad는 한번만 호출된다)
    override func viewDidLoad() {
        super.viewDidLoad()
        print("List viewDidLoad")
        setupUI()
        loadAll()
    }
    
    // view가 나타나기전에
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("List viewWillAppear")
    }
    
    // view가 나타났을때
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("List viewDidAppear")
    }
    
    // view가 없어지기전에
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("List viewWillDisappear")
    }
    
    // view가 없어졌을때
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("List viewDidDisappear")
    }
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func addMemo(_ sender: UIBarButtonItem) {
        if let naviVC = storyboard?.instantiateViewController(withIdentifier: MemoComposeViewController.reuseIdentifier) as? UINavigationController, let composeVC = naviVC.viewControllers.first as? MemoComposeViewController {
            composeVC.addHandler = { memo in
                self.memos.insert(memo, at: 0)
                self.saveAll()
                self.tableView.reloadData()
            }
            self.present(naviVC, animated: true, completion: nil)
        }
    }
    
    func saveAll() {
        let data = memos.map { memo in
            [
                "content" : memo.content,
                "insertDate" : memo.date
            ]
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: UserDefaultsKey.memoList)
        userDefaults.synchronize()
    }
    
    func loadAll() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: UserDefaultsKey.memoList) as? [[String : Any]] else {
            return
        }
        
        memos = data.map { memo in
            let content = memo["content"] as? String ?? ""
            let insertDate = memo["insertDate"] as? Date ?? Date()
            
            return Memo(content: content, date: insertDate)
        }
    }
    
}

extension MemoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemoCell.reuseIdentifier, for: indexPath) as? MemoCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: memos[indexPath.row].content)
        
        return cell
    }
    
}

extension MemoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: MemoDetailViewController.reuseIdentifier) as? MemoDetailViewController {
//            detailVC.memo = memos[indexPath.row]
            detailVC.configure(with: memos[indexPath.row], at: indexPath)
            
            detailVC.deleteHandler = { indexPath in
                self.memos.remove(at: indexPath.row)
                self.saveAll()
                self.tableView.reloadData()
            }
            
            detailVC.editHandler = { memo, indexPath in
                self.memos[indexPath.row] = memo
                self.saveAll()
                self.tableView.reloadData()
            }
            
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
}
