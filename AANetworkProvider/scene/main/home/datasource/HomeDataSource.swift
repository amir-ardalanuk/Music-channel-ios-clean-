//
//  HomeDataSource.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 5/14/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import UIKit
import RxSwift
class HomeDataSource: NSObject , UITableViewDataSource,UITableViewDelegate {
    
    private var list = [ChannelSectionModel]()
    var selected = PublishSubject<ChannelSectionModel>()
    
    override init() {
        super.init()
    }
    
    func updateList(_ list : [ChannelSectionModel]){
        self.list = list
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = list[indexPath.row]
        let cell : ChannelSectionCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.config(data: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard list.count < indexPath.row else {
            return
        }
        selected.onNext(list[indexPath.row])
    }
    
    
}
