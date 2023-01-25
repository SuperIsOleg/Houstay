//
//  NoResultView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 25.01.23.
//

import UIKit

class NoResultView: UIView {
    
    private var noResultImage: UIImageView {
        let imageView = UIImageView()
        imageView.image = R.image.folder()
        return imageView
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = R.color.white500()

    }
}

