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
        
    func updateUIViewController(_ uiViewController: CreatablesExampleViewController, context: Context) { }
}

class CreatablesExampleViewController: UIViewController, CreatablesExampleDelegate {

    private let viewModel = CreatablesExampleViewModel()
    private let tableView = UITableView()
    private var views: [RLTViewCreatable] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.delegate = self
        try? viewModel.fetchData()
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "CreatablesExampleTableViewCell", bundle: .main), forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func didFetch(creatables: [RLTViewCreatable]) {
        views = creatables
        tableView.reloadData()
    }
}

extension CreatablesExampleViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return views.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CreatablesExampleTableViewCell else {
            return UITableViewCell()
        }
        views[indexPath.row].embed(in: cell, on: self)
        return cell
    }
}
