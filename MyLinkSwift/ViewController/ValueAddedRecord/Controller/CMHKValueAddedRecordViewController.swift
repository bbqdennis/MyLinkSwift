//
//  CMHKValueAddedRecordViewController.swift
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 16/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

import UIKit

class CMHKValueAddedRecordViewController: CMHKBaseViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Declare
    let layerModel = CMHKValueAddedRecordListModel()
    let layerView = CMHKValueAddedRecordListView()
    var tableView = UITableView()
    
    // MARK: Setup
    private func setup() {
        
        setupSelf()
        setupNavigationBar()
        setupLayerModel()
        setupLayerView()
        setupTableView()
        setupTableViewHeader()
    }
    
    private func setupSelf() {
        
        self.view.backgroundColor = CMHKColorManager.lightGrey()
        self.title = CMHKLocalizeHelper.getCMHKLocalizedString("valueaddedrecord_value_added_record")
        //self.addNevigationLargeTitle(titleStr: CMHKLocalizeHelper.getCMHKLocalizedString("valueaddedrecord_value_added_record"))
    }
    
    private func setupNavigationBar() {
        
    }
    
    private func setupLayerModel() {
        
        layerModel.initModelData()
    }

    private func setupLayerView() {
        
        layerView.frame = view.bounds
        view.addSubview(layerView)
    }
    
    private func setupTableView() {
        
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
        tableView.separatorColor = UIColor.clear
        
        tableView.register(CMHKValueAddedRecordTableCell.self, forCellReuseIdentifier: kCMHKValueAddedRecordTableCellReuseIdentifier)
        tableView.register(CMHKValueAddedRecordTableCell.self, forCellReuseIdentifier: kCMHKValueAddedRecordTableCellHeaderReuseIdentifier)
        tableView.register(CMHKValueAddedRecordTableCell.self, forCellReuseIdentifier: kCMHKValueAddedRecordTableCellFooterReuseIdentifier)
        view.addSubview(tableView)
    }
    
    private func setupTableViewHeader() {
        
        tableView.tableHeaderView = CMHKBaseView(frame: layerView.topHeaderView.bounds)
        tableView.tableHeaderView?.addSubview(layerView.topHeaderView)
    }
    
    // MARK: Helper
    
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
        
        let aCMHKValueAddedRecordViewModel: CMHKValueAddedRecordViewModel = layerModel.getCellViewModel(indexPath:indexPath)
        let cell: CMHKValueAddedRecordTableCell  = tableView.dequeueReusableCell(withIdentifier: aCMHKValueAddedRecordViewModel.reuseIdentifier, for: indexPath) as! CMHKValueAddedRecordTableCell
        cell.cellView.renewContent(topic: aCMHKValueAddedRecordViewModel.topicString, description: aCMHKValueAddedRecordViewModel.descriptionString)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return layerModel.tableDataArray.count
    }
    /*
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100.0
    }
 */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (layerModel.tableDataArray[section] as! NSMutableArray).count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CMHKValueAddedRecordTableCell.height()
    }
}
