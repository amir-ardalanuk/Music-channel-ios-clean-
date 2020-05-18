//
//  HomeCourseDataSource.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 5/14/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import UIKit
import RxSwift

protocol HomeCourseDataSourceDelegate {
    func cellSize(collection:UICollectionView)->CGSize
    func cellConfig(collection:UICollectionView, index:IndexPath,item:BaseCourseModel)->UICollectionViewCell
}

class HomeCourseDataSource: NSObject , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var page = 1
    var pageCount = 6
    
    private var list = [BaseCourseModel]()
    private var delegate: HomeCourseDataSourceDelegate!
    private var showList = [BaseCourseModel]()
    
    var selected = PublishSubject<BaseCourseModel>()

    override init() {
        super.init()
    }
    
    func setDelegate(delegate : HomeCourseDataSourceDelegate) {
        self.delegate = delegate
    }
    
    func updateList(_ list : [CourseModel]){
        self.list = Array(list.prefix(6))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.delegate.cellConfig(collection: collectionView,
                                        index: indexPath,
                                        item: list[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return delegate.cellSize(collection: collectionView)
    }
    
}
