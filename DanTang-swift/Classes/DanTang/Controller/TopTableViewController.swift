//
//  TopTableViewController.swift
//  DanTang-swift
//
//  Created by FeiYu on 2018/2/28.
//  Copyright © 2018年 FeiYu. All rights reserved.
//

import UIKit
import ESPullToRefresh
let homeCellID = "homeCellID"
class TopTableViewController: UITableViewController {
   
    
     var type = Int()
    /// 首页列表数据
    var items = [HomeItem]()
    var offset = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = GFGlobalColor()
        setupTableView()
        weak var weakSelf = self
        offset = 0;
        //下拉刷新
        tableView.es.addPullToRefresh {
            weakSelf!.offset = 0;
            weakSelf!.loadHomeData()
        }
        tableView.es.addInfiniteScrolling {
            weakSelf!.offset += 20;
            weakSelf!.loadHomeDataNext()
        }

        //获取首页数据
        GFNetworkTool.shareNetworkTool.loadHomeInfo(id: type, offset: offset) { (homeItems) in
            weakSelf!.items = homeItems
            self.tableView.reloadData()
        }
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @objc func loadHomeData(){
        //获取首页数据
        weak var weakSelf = self
        GFNetworkTool.shareNetworkTool.loadHomeInfo(id: type, offset:offset) { (homeItems) in
           
            weakSelf!.items = homeItems
            weakSelf!.tableView.reloadData()
            /// 如果你的刷新事件成功，设置completion自动重置footer的状态
            self.tableView.es.stopPullToRefresh(ignoreDate: true)
        }
    }
    @objc func loadHomeDataNext(){
        //获取首页数据
        weak var weakSelf = self
        GFNetworkTool.shareNetworkTool.loadHomeInfo(id: type, offset:offset) { (homeItems) in
            
             weakSelf!.items = weakSelf!.items + homeItems
            weakSelf!.tableView.reloadData()
            /// 如果你的刷新事件成功，设置completion自动重置footer的状态
            self.tableView.es.stopLoadingMore()
        }
    }
    func setupTableView(){
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        tableView.rowHeight = 160
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsetsMake( kTitlesViewH, 0, tabBarController!.tabBar.height - kTitlesViewH  , 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
        tableView.backgroundColor = GFGlobalColor();
        let nib = UINib.init(nibName: String(describing: HomeTableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: homeCellID)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.homeItem = items[indexPath.row]
        detailVC.title = "攻略详情"
        navigationController?.pushViewController(detailVC, animated: true)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var homeCell = tableView.dequeueReusableCell(withIdentifier: homeCellID)
//        homeCell = Bundle.main.loadNibNamed("HomeTableViewCell", owner: nil, options: nil)!.last as! HomeTableViewCell
        let homeCell = tableView.dequeueReusableCell(withIdentifier: homeCellID) as! HomeTableViewCell
        homeCell.selectionStyle = .none
        homeCell.homeItem = items[indexPath.row]
        return homeCell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
