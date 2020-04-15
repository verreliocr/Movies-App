//
//  ListMovieViewController.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import UIKit

class ListMovieViewController: UIViewController {
    
    let presenter: IListMoviePresenter
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    
    init(presenter: IListMoviePresenter) {
        self.presenter = presenter
        super.init(nibName: "ListMovieViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    private func setupNavBar() {
        self.title = presenter.getTitlePage()
    }
    
    private func setupTableView() {
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register([MovieItemTableCell.self])
    }

}

extension ListMovieViewController: IListMovieView {
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
    
    func reloadView() {
        DispatchQueue.main.async { [unowned self] in
            self.tableView.reloadData()
        }
    }
}

extension ListMovieViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: MovieItemTableCell = tableView.dequeueReusableCell() {
            cell.bind(imageUrl: presenter.getImageURL(at: indexPath.row),
                      title: presenter.getTitleMovie(at: indexPath.row),
                      rate: presenter.getRate(at: indexPath.row),
                      overview: presenter.getOverview(at: indexPath.row))
            
            cell.didTapExpand = { [weak self] in
                self?.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter.willDisplayCell(at: indexPath.row)
    }
}
