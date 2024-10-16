//
//  SampleTableViewController.swift
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 15/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

import UIKit

class SampleListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let layerView = SampleListView()
    var tableView = UITableView()
    var tableData = ["Beach", "Clubs", "Chill", "Dance"]
    
    // MARK: Setup
    private func setup() {
        
        setupLayerView()
        setupTableView()
    }
    
    private func setupLayerView() {
        
        layerView.backgroundColor = UIColor.green
        layerView.frame = view.bounds
        view.addSubview(layerView)
    }
    
    private func setupTableView() {
        
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        
        tableView.register(SampleTableViewCell.self, forCellReuseIdentifier: "SampleTableViewCell")
        view.addSubview(tableView)
    }
    
    // MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Delegate
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleTableViewCell", for: indexPath)
        //cell.textLabel?.text = "This is row \(tableData[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SampleTableViewCell.height()
    }
}
