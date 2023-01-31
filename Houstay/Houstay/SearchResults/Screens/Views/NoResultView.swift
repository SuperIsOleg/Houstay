//
//  NoResultView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 25.01.23.
//

import UIKit

class NoResultView: UIView {
    
    private let folderImages: UIImageView = {
       let imageView = UIImageView()
        imageView.image = R.image.folder()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let noResultLabel: UILabel = {
       let label = UILabel()
        label.text = R.string.localizable.searchNoResult()
        label.font = R.font.robotoRegular(size: 16)
        label.textColor = R.color.lnk50()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
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
        
        self.addSubview(folderImages)
        folderImages.snp.makeConstraints {
            $0.top.equalToSuperview().offset(160)
            $0.centerX.equalToSuperview()
        }
        
        self.addSubview(noResultLabel)
        noResultLabel.snp.makeConstraints {
            $0.top.equalTo(folderImages.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(50)
            $0.centerX.equalTo(folderImages)
        }

    }
}

