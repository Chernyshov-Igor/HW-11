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
    private lazy var fourthStackView =  createVerticalStackView()
    private lazy var fivethStackView = createVerticalStackView()

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

        firstPointFirstStackView.addArrangedSubview(picMain)
        firstPointTwoStackView.addArrangedSubview(firstEmptyOneStackView)
        firstPointTwoStackView.addArrangedSubview(myName)
        firstPointTwoStackView.addArrangedSubview(statusButton)
        firstPointTwoStackView.addArrangedSubview(onlineLabel)
        firstPointTwoStackView.addArrangedSubview(firstEmptyTwoStackView)

        parentStackView.addArrangedSubview(secondStackView)
        secondStackView.addArrangedSubview(bigButton)

        parentStackView.addArrangedSubview(thirdStackView)
        thirdStackView.addArrangedSubview(storyButton)
        thirdStackView.addArrangedSubview(noteButton)
        thirdStackView.addArrangedSubview(photoButton)
        thirdStackView.addArrangedSubview(clipButton)


        parentStackView.addArrangedSubview(fourthStackView)
        fourthStackView.addHorizontalSeparators(color: .gray)
        fourthStackView.addArrangedSubview(cityButton)
        fourthStackView.addArrangedSubview(subsButton)
        fourthStackView.addArrangedSubview(workButton)
        fourthStackView.addArrangedSubview(giftButton)
        fourthStackView.addArrangedSubview(infoButton)

        parentStackView.addArrangedSubview(fivethStackView)

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
        statusButton.contentHorizontalAlignment = .left
        myName.bottomAnchor.constraint(equalTo: statusButton.topAnchor).isActive = true
        myName.leftAnchor.constraint(equalTo: firstPointTwoStackView.leftAnchor).isActive = true
        onlineLabel.topAnchor.constraint(equalTo: statusButton.bottomAnchor).isActive = true
        onlineLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        onlineLabel.addTrailing(image: picOnline!)

        bigButton.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 10).isActive = true
        bigButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        firstPointFirstStackView.widthAnchor.constraint(equalToConstant: 130).isActive = true

        thirdStackView.distribution = .equalSpacing
        thirdStackView.translatesAutoresizingMaskIntoConstraints = false

        storyButton.widthAnchor.constraint(equalTo: thirdStackView.widthAnchor, multiplier: 0.25).isActive = true
        noteButton.widthAnchor.constraint(equalTo: thirdStackView.widthAnchor, multiplier: 0.25).isActive = true
        photoButton.widthAnchor.constraint(equalTo: thirdStackView.widthAnchor, multiplier: 0.25).isActive = true
        clipButton.widthAnchor.constraint(equalTo: thirdStackView.widthAnchor, multiplier: 0.25).isActive = true

        let fourthButtons = [cityButton, subsButton, workButton, giftButton, infoButton]
        fourthButtons.forEach {
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        fourthButtons.forEach {
            $0.imageView?.trailingAnchor.constraint(equalTo: $0.titleLabel!.leadingAnchor, constant: -10).isActive = true
        }

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

        return stackView
    }

    private let picMain: UIImageView = {
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

    let picCam = UIImage(named: "camera")!
    let picNote = UIImage(named: "note")!
    let picPhoto = UIImage(named: "photo")!
    let picClip = UIImage(named: "clip")!

    private lazy var storyButton = createVerticalButton(image: picCam, title: Strings.storyButton)
    private lazy var noteButton = createVerticalButton(image: picNote, title: Strings.noteButton)
    private lazy var photoButton = createVerticalButton(image: picPhoto, title: Strings.photoButton)
    private lazy var clipButton = createVerticalButton(image: picClip, title: Strings.clipButton)

    private func createVerticalButton(image: UIImage, title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.tintColor = Color.systemBlue
        button.setImage(image, for: .normal)
        button.setTitle(title, for: .normal)
        button.alignTextBelow()
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.imageView?.contentMode = .center
        button.titleLabel?.contentMode = .center

        return button
    }

    private func createHorizontalButton(image: UIImage, title: String, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.tintColor = color
        button.setImage(image, for: .normal)
        button.setTitle(title, for: .normal)
        button.contentHorizontalAlignment = .left

        return button
    }

    let picCity = UIImage(named: "house")
    let picSubs = UIImage(named: "waves")
    let picWork = UIImage(named: "case")
    let picGift = UIImage(named: "snow")
    let picInfo = UIImage(named: "exclamation")

    let picOnline = UIImage(named: "online")

    private lazy var cityButton = createHorizontalButton(image: picCity!, title: Strings.cityButton, color: Color.onlineLabel)
    private lazy var subsButton = createHorizontalButton(image: picSubs!, title: Strings.subsButton, color: Color.onlineLabel)
    private lazy var workButton = createHorizontalButton(image: picWork!, title: Strings.workButton, color: Color.systemBlue)
    private lazy var giftButton = createHorizontalButton(image: picGift!, title: Strings.giftButton, color: Color.giftButton)
    private lazy var infoButton = createHorizontalButton(image: picInfo!, title: Strings.infoButton, color: Color.infoButton)

//    MARK: - enum

    enum Metric {
        static let stackViewSpasing: CGFloat = 23
    }

    enum Color {
        static let background = UIColor(red: 25, green: 25, blue: 27)
        static let systemBlue = UIColor(red: 115, green: 170, blue: 227)
        static let onlineLabel = UIColor(red: 126, green: 126, blue: 128)
        static let bigButton = UIColor(red: 44, green: 45, blue: 46)
        static let giftButton = UIColor(red: 112, green: 90, blue: 224)
        static let infoButton = UIColor(red: 225, green: 226, blue: 231)
    }

    enum Strings {
        static let myName = "Чернышов Игорь"
        static let statusBut = "Установить статус"
        static let onlinelabel = "online "
        static let bigButton = "Редактировать"
        static let storyButton = "История"
        static let noteButton = "Запись"
        static let photoButton = "Фото"
        static let clipButton = "Клип"
        static let workButton = "Указать место работы"
        static let giftButton = "Получить подарок >"
        static let infoButton = "Подробная информация"
        static let cityButton = "Город: Москва"
        static let subsButton = "35 подписчиков"
    }
}

//    MARK: - extensions

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }
}

extension UIButton {
    func alignTextBelow(spacing: CGFloat = 6.0) {
        guard let image = self.imageView?.image else {
            return
        }

        guard let titleLabel = self.titleLabel else {
            return
        }

        guard let titleText = titleLabel.text else {
            return
        }

        let titleSize = titleText.size(withAttributes: [
            NSAttributedString.Key.font: titleLabel.font
        ])

        titleEdgeInsets = UIEdgeInsets(top: spacing, left: -image.size.width, bottom: -image.size.height, right: 0)
        imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: (-titleSize.width + spacing))
    }
}

extension UIStackView {
    func addHorizontalSeparators(color : UIColor) {
        var i = self.arrangedSubviews.count
        while i >= 0 {
            let separator = createSeparator(color: color)
            insertArrangedSubview(separator, at: i)
            separator.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
            i -= 1
        }
    }

    private func createSeparator(color : UIColor) -> UIView {
        let separator = UIView()
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.backgroundColor = color
        return separator
    }
}

extension UILabel {
    func addTrailing(image: UIImage) {
        let attachment = NSTextAttachment()
        attachment.image = image

        let attachmentString = NSAttributedString(attachment: attachment)
        let string = NSMutableAttributedString(string: self.text!, attributes: [:])

        string.append(attachmentString)
        self.attributedText = string
    }
}
