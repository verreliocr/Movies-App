//
//  DetailMovieViewController.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import UIKit
import WebKit

class DetailMovieViewController: UIViewController {
    
    let presenter: IDetailMoviePresenter
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UIButton!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    init(presenter: IDetailMoviePresenter) {
        self.presenter = presenter
        super.init(nibName: "DetailMovieViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = presenter.getTitlePage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

}

extension DetailMovieViewController: IDetailMovieView {
    func reloadView() {
        if let url = presenter.getImageURL() {
            posterImageView.setImage(url: url, placeholder: nil)
        }
        
        titleLabel.text = presenter.getTitleMovie()
        ratingLabel.setTitle(presenter.getRate(), for: .normal)
        genreLabel.text = presenter.getGenre()
        releaseDateLabel.text = presenter.getReleaseDate()
        overviewLabel.text = presenter.getOverview()
        
        if let url = URL(string: "https://www.youtube.com/embed/\(presenter.getYoutubeKey())") {
            webView.load(URLRequest(url: url))
            webView.isHidden = false
        }else{
            webView.isHidden = true
        }
    }
    
    func handleError(type: ErrorType, retryAction: @escaping (() -> Void)) {
        switch type {
        case .noConnection:
            showOfflineAlert(retryAction: {
                retryAction()
            })
        case .serverError:
            showMaintenanceAlert(retryAction: {
                retryAction()
            })
        }
    }
    
    func showLoading(_ show: Bool) {
        loadingView.isHidden = !show
    }
}
