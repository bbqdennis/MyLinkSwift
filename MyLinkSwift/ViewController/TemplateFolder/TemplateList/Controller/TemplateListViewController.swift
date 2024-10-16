//
//  TemplateListViewController.swift
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 16/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

import UIKit

class TemplateListViewController: CMHKBaseViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Declare
    let layerModel = TemplateListModel()
    let layerView = TemplateListView()
    var tableView = UITableView()

    // MARK: Setup
    private func setup() {
        
        setupSelf()
        setupNavigationBar()
        setupLayerModel()
        setupLayerView()
        setupTableView()
    }
    
    private func setupSelf() {
        
        self.view.backgroundColor = UIColor.white
    }
    
    private func setupNavigationBar() {
        
        self.title = "TemplateListView"
    }
    
    private func setupLayerModel() {
        
        layerModel.initModelData()
    }
    
    private func setupLayerView() {
        
        layerView.frame = view.bounds
        view.addSubview(layerView)
    }
    
    private func setupTableView() {
        
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        
        tableView.register(TemplateTableCell.self, forCellReuseIdentifier: "TemplateTableCell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TemplateTableCell", for: indexPath)
        //cell.textLabel?.text = "This is row \(tableData[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return layerModel.tableDataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TemplateTableCell.height()
    }
}
