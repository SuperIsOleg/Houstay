//
//  ImagesCell.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 3.12.22.
//

import UIKit

class ImagesCell: UICollectionViewCell {
    static var reuseIdentifier = String(describing: ImagesCell.self)
    
    private let appartmentImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = R.color.white500()
        
        self.addSubview(appartmentImageView)
        appartmentImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    internal func setImage(to appartmentImage: String) {
        self.appartmentImageView.image = UIImage(named: appartmentImage)
    }
}
