//
//  ViewController.swift
//  HW-11
//
//  Created by Игорь Чернышов on 05.02.2022.
//

import UIKit

class ViewController: UIViewController {

//     MARK: - Create stackView()

    private lazy var parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Metric.stackViewSpasing

        return stackView
    }()

    private lazy var firstStackView = createHorisontalStackView()

    private lazy var firstPointFirstStackView = createHorisontalStackView()
    private lazy var firstPointTwoStackView = createVerticalStackView()
    private lazy var firstEmptyOneStackView = createVerticalStackView()
    private lazy var firstEmptyTwoStackView = createVerticalStackView()

    private lazy var secondStackView =  createHorisontalStackView()
    private lazy var thirdStackView =  createHorisontalStackView()
    private lazy var fourthStackView =  createHorisontalStackView()


//     MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupLayout()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = Color.background
    }

    private func setupHierarchy() {
        view.addSubview(parentStackView)

        parentStackView.addArrangedSubview(firstStackView)

        firstStackView.addArrangedSubview(firstPointFirstStackView)
        firstStackView.addArrangedSubview(firstPointTwoStackView)

        firstPointFirstStackView.addArrangedSubview(ivOne)
        firstPointTwoStackView.addArrangedSubview(firstEmptyOneStackView)
        firstPointTwoStackView.addArrangedSubview(myName)
        firstPointTwoStackView.addArrangedSubview(statusButton)
        firstPointTwoStackView.addArrangedSubview(onlineLabel)
        firstPointTwoStackView.addArrangedSubview(firstEmptyTwoStackView)

        parentStackView.addArrangedSubview(secondStackView)
        secondStackView.addArrangedSubview(bigButton)

        parentStackView.addArrangedSubview(thirdStackView)
        parentStackView.addArrangedSubview(fourthStackView)
    }

    private func setupLayout() {
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.clipsToBounds = true

        parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 23).isActive = true
        parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -23).isActive = true
        parentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        parentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true

        firstStackView.topAnchor.constraint(equalTo: parentStackView.topAnchor, constant: 0).isActive = true
        firstStackView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        firstPointTwoStackView.leftAnchor.constraint(equalTo: firstPointFirstStackView.rightAnchor, constant: 10).isActive = true

        statusButton.centerYAnchor.constraint(equalTo: firstPointFirstStackView.centerYAnchor).isActive = true
        statusButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        statusButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        statusButton.leftAnchor.constraint(equalTo: firstStackView.rightAnchor, constant: -275).isActive = true
        myName.bottomAnchor.constraint(equalTo: statusButton.topAnchor).isActive = true
        myName.leftAnchor.constraint(equalTo: firstPointTwoStackView.leftAnchor).isActive = true
        onlineLabel.topAnchor.constraint(equalTo: statusButton.bottomAnchor).isActive = true
        onlineLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        bigButton.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 10).isActive = true
        bigButton.heightAnchor.constraint(equalToConstant: 40).isActive = true




        firstPointFirstStackView.widthAnchor.constraint(equalToConstant: 130).isActive = true
    }

//    MARK: - Private func

    private func createHorisontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing

        return stackView
    }

    private func createVerticalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
//        stackView.distribution = .fillEqually

        return stackView
    }

    private let ivOne: UIImageView = {
        let image = UIImageView(image: .init(named: "Sova"))
        image.clipsToBounds = true
        image.layer.cornerRadius = 65

        return image
    }()

    private lazy var myName: UILabel = {
        let label = UILabel()
        label.text = Strings.myName
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left

        return label
    }()

    private lazy var statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Strings.statusBut, for: .normal)
        button.tintColor = Color.systemBlue

        return button
    }()

    private lazy var onlineLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.onlinelabel
        label.textColor = Color.onlineLabel
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left

        return label
    }()

    private lazy var bigButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Strings.bigButton, for: .normal)
        button.tintColor = .white
        button.backgroundColor = Color.bigButton
        button.clipsToBounds = true
        button.layer.cornerRadius = 10

        return button
    }()


//    MARK: - enum

    enum Metric {
        static let stackViewSpasing: CGFloat = 23
    }

    enum Color {
        static let background = UIColor(red: 25, green: 25, blue: 27)
        static let systemBlue = UIColor(red: 115, green: 170, blue: 227)
        static let onlineLabel = UIColor(red: 126, green: 126, blue: 128)
        static let bigButton = UIColor(red: 44, green: 45, blue: 46)
    }

    enum Strings {
        static let myName = "Чернышов Игорь"
        static let statusBut = "Установить статус"
        static let onlinelabel = "online 􀟜"
        static let bigButton = "Редактировать"
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }
}

