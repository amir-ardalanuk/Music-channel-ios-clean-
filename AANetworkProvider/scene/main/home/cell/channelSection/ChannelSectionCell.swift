//
//  ChannelSectionCell.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 5/13/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import UIKit

class ChannelSectionCell: TableCell {
    
    
    @IBOutlet weak var sectionImage: UIImageView!
    @IBOutlet weak var sectionImageContainer: GradiantView!
    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var sectionDesc: UILabel!
    @IBOutlet weak var sectionCollection: UICollectionView!{
        didSet{
            self.sectionCollection.register(CourseCell.self)
            self.sectionCollection.register(SeriesCell.self)
            self.sectionCollection.register(CategoryCell.self)
            self.sectionCollection.dataSource = self.datasource
            self.sectionCollection.delegate = self.datasource
        }
    }
    
    var datasource = HomeCourseDataSource()
    var sectionType : ChannelSectionModel.ChannelType!
}


extension ChannelSectionCell : HomeCourseDataSourceDelegate {
    
    func cellConfig(collection: UICollectionView, index: IndexPath, item: BaseCourseModel) -> UICollectionViewCell {
        switch sectionType {
        case .newEpisode,.normal :
            let cell : CourseCell = collection.dequeueReusableCell(indexPath: index)
            cell.setType(type: CourseCell.CourseType(rawValue: self.sectionType.rawValue) ?? .normal )
            cell.config(course: item)
            return cell
        case .seri:
            let cell : SeriesCell = collection.dequeueReusableCell(indexPath: index)
            cell.config(course: item)
            return cell
        case .cateogory:
            let cell : CategoryCell = collection.dequeueReusableCell(indexPath: index)
            cell.config(category: CategoryeModel(id: item.title ?? "", title: item.title ?? "") )
            return cell
        default:return UICollectionViewCell()
        }
    }
    
    
    func cellSize(collection: UICollectionView) -> CGSize {
        var w : CGFloat = 0
        var h = collection.frame.size.height
        switch self.sectionType  {
        case .newEpisode,.normal :
            w = collection.frame.size.width / 2.2
        case .seri :
            w = collection.frame.size.width / 1.2
        case .cateogory:
            w = collection.frame.size.width /  2
            h = 85
        default:
            w = collection.frame.size.width
        }
        return CGSize(width: w, height: h)
    }
}


extension ChannelSectionCell{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(data:ChannelSectionModel){
        self.setDataModel(data)
        self.setupTheme(type: data.type)
        self.sectionType = data.type
        self.datasource.setDelegate(delegate: self)
        self.datasource.updateList(data.item)
        self.setupCollectionType(type: data.type)
        self.sectionCollection.reloadData()
    }
    
    func setDataModel(_ data:ChannelSectionModel){
        sectionTitle.text = data.title
        sectionDesc.text = data.desc
        if let imageURL = URL(string:data.imagePath ?? "") {
            self.sectionImage.kf.setImage(with: imageURL)
        }
    }
    
    func setupCollectionType(type : ChannelSectionModel.ChannelType){
        let layout = sectionCollection.collectionViewLayout as? UICollectionViewFlowLayout
        switch type {
        case .cateogory:
            layout?.scrollDirection = .vertical
        case .normal,.seri,.newEpisode:
            layout?.scrollDirection = .horizontal
        }
    }
    
    func setupTheme(type : ChannelSectionModel.ChannelType){
        switch type {
        case .newEpisode,.cateogory:
            newEpisodeStyle()
        case .normal,.seri:
            baseTheme()
        }
    }
    
    func newEpisodeStyle(){
        self.sectionImageContainer.isHidden = true
        self.sectionDesc.isHidden = true
        self.sectionTitle.textColor = #colorLiteral(red: 0.5843137255, green: 0.5960784314, blue: 0.6156862745, alpha: 1)
    }
    
    func baseTheme(){
        self.sectionImageContainer.isHidden = false
        self.sectionDesc.isHidden = false
        self.sectionTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
}

