//
//  AppsSearchController.swift
//  app-AppStoreFake
//
//  Created by Walter Luis Deonísio Junior on 01/09/20.
//

import UIKit

class AppsSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    // MARK: - Properties
    fileprivate let cellId: String = "AppsSearchController"
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    fileprivate var timer: Timer?
    var viewModel = AppsSearchViewModel()
    
    fileprivate lazy var enterSearchTermLabel: UILabel = {
       let label = UILabel()
        label.text = "Please enter of your app name above..."
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        setupSearchBar()
        
        viewModel.appsSearchDidUpdate = appsSearchDidUpdate
    }

    // MARK: - Methods
    func appsSearchDidUpdate() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.collectionView.refreshControl?.endRefreshing()
        }
    }
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    @objc fileprivate func getApp() {
        print("App tapped")
        showAlertUpdateContentController()
    }
    
    func showAlertUpdateContentController() {
        let contentUpdateViewController = ContentUpdateAlertCollectionView()
        let navBar = UINavigationController(rootViewController: contentUpdateViewController)
        navBar.modalPresentationStyle = .formSheet
        self.present(navBar, animated: true, completion: nil)
    }
    
    // MARK: - UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.viewModel.fetchApps(searchTerm: searchText)
        })
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SearchResultCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        cell.appResult = viewModel.appsResult[indexPath.item]
        cell.getButton.addTarget(self, action: #selector(getApp), for: .touchUpInside)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = viewModel.count != 0
        return viewModel.count
    }
}
