//
//  ArticleDetailsViewController.swift
//  VIP Project
//
//  Created by Victor on 22/08/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Kingfisher

protocol ArticleDetailsDisplayLogic: class {
    func displayArticle(viewModel: ArticleDetails.DisplayArticle.ViewModel)
}

class ArticleDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ArticleDetailsDisplayLogic {
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: ArticleDetailsBusinessLogic?
    var router: (NSObjectProtocol & ArticleDetailsRoutingLogic & ArticleDetailsDataPassing)?
    
    var article: Article?
    
    //MARK: - Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = ArticleDetailsInteractor()
        let presenter = ArticleDetailsPresenter()
        let router = ArticleDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    //MARK: - Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.register(ImageAndTitleTableViewCell.nib(), forCellReuseIdentifier: ImageAndTitleTableViewCell.identifier)
        tableView.register(ContentAndInfoTableViewCell.nib(), forCellReuseIdentifier: ContentAndInfoTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .clear
        tableView.backgroundColor = Colors.myLightGray
        
        loadArticle()
    }
    
    //MARK: - Requests
    
    func loadArticle() {
        let request = ArticleDetails.DisplayArticle.Request(article: self.router?.dataStore?.article)
        interactor?.loadArticle(request: request)
    }
    
    //MARK: - Displays
    
    func displayArticle(viewModel: ArticleDetails.DisplayArticle.ViewModel) {
        article = viewModel.article
        tableView.reloadData()
    }
    
    //MARK: - Table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: ImageAndTitleTableViewCell.identifier) as? ImageAndTitleTableViewCell {
                let url = URL(string: article?.urlToImage ?? "")
                let processor = DownsamplingImageProcessor(size: cell.iconImageView.bounds.size)
                cell.iconImageView.kf.indicatorType = .activity
                cell.iconImageView.kf.setImage(
                    with: url,
                    placeholder: UIImage(named: "placeholderImage"),
                    options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(1)),
                        .cacheOriginalImage
                    ])
                cell.titleLabel.text = article?.title
                return cell
            }
            return UITableViewCell()
        } else if indexPath.row == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: ContentAndInfoTableViewCell.identifier) as? ContentAndInfoTableViewCell {
                cell.byLineLabel.text = "by " + (article?.author ?? "N/A")
                cell.byLineLabel.sizeToFit()
                cell.contentLabel.text = article?.content
                cell.contentLabel.sizeToFit()
                cell.descriptionLabel.text = article?.description
                cell.descriptionLabel.sizeToFit()
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 330
        } else {
            return 600
        }
    }
}
