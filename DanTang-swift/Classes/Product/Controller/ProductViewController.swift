//
//  ProductViewController.swift
//  DanTang-swift
//
//  Created by FeiYu on 2018/2/27.
//  Copyright © 2018年 FeiYu. All rights reserved.
//

import UIKit
let collectionCellID = "YMCollectionViewCell"
class ProductViewController: GFBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    var products = [Product]()
    weak var collectionView : UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupCollectionView()
        weak var weakSelf = self
        GFNetworkTool.shareNetworkTool.loadProductData { (product) in
            weakSelf!.products = product
            weakSelf!.collectionView!.reloadData()
        }
    }
    
    //设置collectionView
    private func setupCollectionView(){
        let collectionView = UICollectionView.init(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.backgroundColor = view.backgroundColor
        collectionView.dataSource = self
        let nib = UINib.init(nibName: String.init(describing: ProductCollectionViewCell.self), bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: collectionCellID)
        view.addSubview(collectionView)
        self.collectionView = collectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! ProductCollectionViewCell
        cell.product = products[indexPath.item]
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (KMainWidth - 20) / 2, height: 245)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
