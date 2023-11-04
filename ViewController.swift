//
//  ViewController.swift
//  classWorkTableView
//
//  Created by Асет Тагвай on 04.11.2023.
//

import UIKit
import SnapKit

struct Sections {
    let sectionTitle : String
    let date: String
    let flag: Bool
    let left: String
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 190/255, blue: 1, alpha: 1)
        
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
    }
    private lazy var tableView : UITableView = {
        let tv = UITableView()
        tv.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tv.backgroundColor = .none
        return tv
    }()
    
    private var sections: [Sections] = [
        Sections(sectionTitle: "Test Competition", date: "21.09.2023", flag: true, left: "Completed"),
        Sections(sectionTitle: "Test Competition 2", date: "23.09.2023", flag: false, left: "6 days left"),
        Sections(sectionTitle: "Test Competition 3", date: "25.09.2023", flag: true, left: "7 days left"),
        Sections(sectionTitle: "Test Competition 4", date: "27.09.2023", flag: true, left: "Completed"),
        Sections(sectionTitle: "Test Competition 5", date: "29.09.2023", flag: false, left: "Completed"),
        Sections(sectionTitle: "Test Competition 6", date: "01.10.2023", flag: false, left: "1 day left"),
        Sections(sectionTitle: "Test Competition 7", date: "03.10.2023", flag: true, left: "11 days left"),
        Sections(sectionTitle: "Test Competition 8", date: "05.10.2023", flag: false, left: "Completed"),
        Sections(sectionTitle: "Test Competition 9", date: "07.10.2023", flag: true, left: "13 days left"),
        Sections(sectionTitle: "Test Competition 10", date: "09.10.2023", flag: false, left: "Completed"),
        Sections(sectionTitle: "Test Competition 11", date: "22.09.2023", flag: true, left: "2 days left"),
        Sections(sectionTitle: "Test Competition 12", date: "24.09.2023", flag: false, left: "Completed"),
        Sections(sectionTitle: "Test Competition 13", date: "26.09.2023", flag: true, left: "4 days left"),
        Sections(sectionTitle: "Test Competition 14", date: "28.09.2023", flag: false, left: "Completed"),
        Sections(sectionTitle: "Test Competition 15", date: "30.09.2023", flag: true, left: "7 days left"),
        Sections(sectionTitle: "Test Competition 16", date: "02.10.2023", flag: false, left: "Completed"),
        Sections(sectionTitle: "Test Competition 17", date: "04.10.2023", flag: false, left: "11 days left"),
        Sections(sectionTitle: "Test Competition 18", date: "06.10.2023", flag: true, left: "Completed"),
        Sections(sectionTitle: "Test Competition 19", date: "08.10.2023", flag: false, left: "13 days left"),
        
    ]

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {fatalError("TableView couldn't dequeue CustomCell in VC")}
        
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true
        
        cell.configure(with: sections[indexPath.section].sectionTitle,
                       and: sections[indexPath.section].date,
                       and: sections[indexPath.section].flag,
                       and: sections[indexPath.section].left)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .none
        return view
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
         return 20
    }
    
    func setupUI(){
        setupView()
        setupConstraints()
    }
    func setupView(){
        view.addSubview(tableView)
        
    }
    func setupConstraints(){
        tableView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.center.equalToSuperview()
         }
    }
}
