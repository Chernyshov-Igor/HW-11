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

    private lazy var firstStackView = createHorisontalStackView(height: Metric.heightFirstStackView)

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
    }

    private func setupLayout() {
        parentStackView.translatesAutoresizingMaskIntoConstraints = false

        parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 23).isActive = true
        parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -23).isActive = true
        parentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        parentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
    }

//    MARK: - Private func

    private func createHorisontalStackView(height: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.heightAnchor.constraint(equalToConstant: height).isActive = true

        return stackView
    }

    private func createVerticalStackView(height: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.heightAnchor.constraint(equalToConstant: height).isActive = true

        return stackView
    }
//    MARK: - enum

    enum Metric {
        static let stackViewSpasing: CGFloat = 23
        static let heightFirstStackView: CGFloat = 160
    }

    enum Color {
        static let background = UIColor(red: 25, green: 25, blue: 27)
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

