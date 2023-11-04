//
//  CustomCell.swift
//  classWorkTableView
//
//  Created by Асет Тагвай on 04.11.2023.
//

import UIKit
import SnapKit

class CustomCell: UITableViewCell {

    private var clock = UIImageView(image: UIImage(named: "clock"))
    private var circle = UIImageView()
    
    private var detailIcon = UIImageView(image: UIImage(named: "3"))
    private var flag = Bool()
    
    static var identifier : String = "CustomCell"
    
    private var label: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 20, weight: .bold)
        lbl.textColor = .systemGray
        return lbl
    }()
    private var date: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 18)
        lbl.textColor = .systemGray3
        return lbl
    }()
    private var left: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 18)
        lbl.textColor = .black
        return lbl
    }()
    private var detail: UILabel = {
        let lbl = UILabel()
        lbl.text = "Detail"
        lbl.font = .systemFont(ofSize: 18)
        lbl.textColor = .black
        return lbl
    }()
    
    private var leftView : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private var subView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    
    func configure(with text: String, and date: String, and flag: Bool, and left : String){
        self.label.text = text
        self.date.text = date
        self.flag = flag
        self.left.text = left
        
        if(flag){
            leftView.backgroundColor = UIColor(red: 1/255, green: 154/255, blue: 206/255, alpha: 1)
            circle.image = UIImage(named: "1")
        }else{
            leftView.backgroundColor = UIColor(red: 253/255, green: 2/255, blue: 0, alpha: 1)
            circle.image = UIImage(named: "2")
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}

extension CustomCell {
    func setupUI(){
        setupView()
        setupConstraints()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        circle.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        clock.translatesAutoresizingMaskIntoConstraints = false
        self.left.translatesAutoresizingMaskIntoConstraints = false
        detail.translatesAutoresizingMaskIntoConstraints = false
        detailIcon.translatesAutoresizingMaskIntoConstraints = false
        leftView.translatesAutoresizingMaskIntoConstraints = false
    }
    func setupView(){
        contentView.addSubview(label)
        contentView.addSubview(date)
        contentView.addSubview(clock)
        contentView.addSubview(subView)
        subView.addSubview(detail)
        subView.addSubview(detailIcon)
        subView.addSubview(self.left)
        subView.addSubview(circle)
        contentView.addSubview(leftView)
        
    }
    func setupConstraints(){
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview().multipliedBy(0.65)
            make.top.equalToSuperview().offset(10)
        }
        date.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(15)
            make.centerX.equalToSuperview().multipliedBy(0.65)
        }
        clock.snp.makeConstraints { make in
            make.left.equalTo(label)
            make.centerY.equalTo(date)
            make.size.equalTo(20)
        }
        subView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4)
            make.width.equalToSuperview()
        }
        circle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().multipliedBy(0.2)
            make.size.equalTo(20)
        }
        self.left.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(circle.snp.right).offset(10)
        }
        detailIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().multipliedBy(1.1)
            make.size.equalTo(20)
        }
        detail.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(detailIcon.snp.right).offset(20)
        }
        leftView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview().dividedBy(30)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
        }

    }
}
