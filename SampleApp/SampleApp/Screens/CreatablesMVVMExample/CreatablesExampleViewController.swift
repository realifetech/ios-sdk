//
//  CreatablesExampleViewController.swift
//  SampleApp
//
//  Created by YOU-HSUAN YU on 2022/5/25.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import SwiftUI
import UIKit
import RealifeTech

struct CreatablesViewExample: UIViewControllerRepresentable {

    typealias UIViewControllerType = CreatablesExampleViewController

    func makeUIViewController(context: Context) -> CreatablesExampleViewController {
        return CreatablesExampleViewController()
    }
        
    func updateUIViewController(_ uiViewController: CreatablesExampleViewController, context: Context) {
    }
}

class CreatablesExampleViewController: UIViewController, CreatablesExampleDelegate {

    private let viewModel = CreatablesExampleViewModel()
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.delegate = self
        viewModel.fetchCADataModels()
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CreatablesExampleTableViewCell", bundle: .main), forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func didLoadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension CreatablesExampleViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CreatablesExampleTableViewCell,
              let dataModels = viewModel.dataModels
        else {
            return UITableViewCell()
        }
        // Integrators can setup different views by different dataType
        switch dataModels[indexPath.row] {
        case .banner(let bannerDataModel):
            cell.setupBannerView(bannerDataModel)
        /*
         case .button(let buttonDataModel):
            cell.setupButtonView(buttonDataModel)
        */
        }
        return cell
    }
}
