//
//  DetailView.swift
//  Case2
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation
import UIKit

protocol DetailViewProtocol {
    var presenter: DetailPresenterProtocol? {get set}
    
    func update(with apiDetail:Promo)
    func update(with error:String)
}

class DetailViewController: UIViewController, DetailViewProtocol {
    
    private let imageView: UIImageView = UIImageView()
    
    private let stackView: UIStackView = UIStackView()
    private let nameLabel: UILabel = UILabel()
    private let detailLabel: UILabel = UILabel()
    
    private var link: String = "";
    
    var presenter: DetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        presenter?.viewDidLoad()
    }
    
    func update(with apiDetail: Promo) {
        nameLabel.textColor = .black
        nameLabel.text = "Name: \(apiDetail.name)"
        presenter?.getImagePromo(imageView: imageView)
        detailLabel.textColor = .black
        detailLabel.text = "Detail: \(apiDetail.detail)"
        link = "\(apiDetail.detail)"
    }
    
    func update(with error: String) {
        nameLabel.textColor = .black
        nameLabel.text = error
    }
}

extension DetailViewController {
    @objc func linkLabelTapped(_ sender: UITapGestureRecognizer) {
        UIApplication.shared.open(URL(string: link)!)
    }
    
    func style() {
        view.backgroundColor = .white
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        imageView.contentMode = .scaleAspectFit
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Dummy"
        nameLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.text = "Dummy"
        detailLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        detailLabel.lineBreakMode = .byWordWrapping
        detailLabel.numberOfLines = 0
        detailLabel.isUserInteractionEnabled = true
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.linkLabelTapped(_:)))
        detailLabel.addGestureRecognizer(labelTap)
    }
    
    func layout() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(detailLabel)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
