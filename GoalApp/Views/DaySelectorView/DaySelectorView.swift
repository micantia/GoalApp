//
//  DaySelectorView.swift
//  GoalApp
//
//  Created by Micantia on 10/9/20.
//

import UIKit

class DaySelectorView: UIView {

    var dayModels: [DayCellModel] = []
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DayCollectionViewCell.self,
                                forCellWithReuseIdentifier: DayCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    var onDaySelected: ((Int) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    func setup(dayModels: [DayCellModel], selectedIndex: Int) {
        self.dayModels = dayModels
        let selectedIndex = IndexPath(item: selectedIndex, section: 0)
        collectionView.reloadData()
        DispatchQueue.main.async {
            self.collectionView.selectItem(at: selectedIndex, animated: false, scrollPosition: .right)
            self.collectionView.scrollToItem(at: selectedIndex, at: .right, animated: false)
        }
    }
}

extension DaySelectorView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onDaySelected?(dayModels[indexPath.row].dayNumber)
    }
}

extension DaySelectorView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dayModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCollectionViewCell.reuseIdentifier, for: indexPath) as! DayCollectionViewCell
        cell.setup(with: dayModels[indexPath.row])
        return cell
    }
}

extension DaySelectorView: UICollectionViewDelegateFlowLayout {

}
