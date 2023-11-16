//
//  GameQuizViewController.swift
//  Aircrafts
//
//  Created by Diyorbek Xikmatullayev on 03/10/23.
//

import UIKit

class GameQuizViewController: UIViewController {
    
    let mg: CGFloat = 10
    let hd = UIScreen.main.bounds.height*1/3
    lazy var x = (hd - 5*mg)/4
    var a = 0
    
    var brainQuiz = QuizBrain()
    
    private let scoreLabel: UILabel = {
     let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.font = UIFont(name: "Avenir-Black", size: 26)
        return label
    }()
    
    private let backroundImage: UIImageView = {
     let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "aircraftbackroundimage")
        return image
    }()

    private let questionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground.withAlphaComponent(0.1)
        label.numberOfLines = 10
        label.textAlignment = .center
        label.font = UIFont(name: "Futura-Bold", size: 20)
        label.layer.cornerRadius = 12
        return label
    }()
    
    private let imageView2: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "image1")
        image.layer.cornerRadius = 20
        return image
    }()
    
    private let trueButton: UIButton = {
        let button = UIButton()
        button.setTitle("TRUE", for: .normal)
        button.tintColor = .black
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 3
        button.setTitleColor(.gray, for: .normal)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Rockwell-BoldItalic", size: 23)
        return button
    }()
    
    private let falseButton: UIButton = {
        let button = UIButton()
        button.setTitle("FALSE", for: .normal)
        button.tintColor = .black
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 3
        button.setTitleColor(.gray, for: .normal)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Rockwell-BoldItalic", size: 23)
        return button
    }()
    
    private let progressQuiz: UIProgressView = {
        let progress = UIProgressView()
        progress.progress = 0.0
        progress.progressViewStyle = .default
        progress.progressTintColor = UIColor.green
        progress.backgroundColor = UIColor.black.withAlphaComponent(0.09)
        return progress
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backroundImage)
        view.addSubview(questionLabel)
        view.addSubview(imageView2)
        view.addSubview(progressQuiz)
        view.addSubview(scoreLabel)
        view.addSubview(trueButton)
        view.addSubview(falseButton)
        
        progressQuiz.progress = brainQuiz.getProgress()
        
        imageView2.image = brainQuiz.getImage()
        
        questionLabel.text = brainQuiz.getTextQuestion()
        questionLabel.textColor = brainQuiz.getColor()
        scoreLabel.text = "score: \(brainQuiz.getScore())"
       
        trueButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        falseButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(didTapLeftButton))
        navigationItem.leftBarButtonItem = leftBarButton
        leftBarButton.tintColor = .black
        
    }
    
    @objc func didTapLeftButton() {
        navigationController?.popViewController(animated: true)
    }
    
     
      @objc private func didTapButton(_ sender: UIButton) {
          let usersAnswer = sender.titleLabel?.text ?? "TRUE"
          sender.tintColor = .black 
          let rightAnswer = brainQuiz.checkAnswer(userAniswer: usersAnswer)
          
          if rightAnswer  {
              sender.backgroundColor = UIColor.green
          } else {
              sender.backgroundColor = UIColor.red
              let generator = UIImpactFeedbackGenerator(style: .heavy)
              generator.impactOccurred()
          }
          
          trueButton.isEnabled = false
          falseButton.isEnabled = false
          
          if brainQuiz.nextQuestion() {
              let alert = UIAlertController(title: "END OF QUIZ", message: "DO YOU WANT TO TRY AGAIN", preferredStyle: .alert)
              let yesAction = UIAlertAction(title: "YES", style: .default) { _ in
                  self.brainQuiz.score = 0
                  Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.progressUpdate), userInfo: nil, repeats: false)
                 
              }
              
              let noAction = UIAlertAction(title: "NO", style: .cancel) { _ in
                  self.navigationController?.popViewController(animated: true)
              }
              
              alert.addAction(yesAction)
              alert.addAction(noAction)
              present(alert, animated: true)
          } else {
               Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(progressUpdate), userInfo: nil, repeats: false)
          }
         
      }
    
    @objc func progressUpdate() {
        progressQuiz.progress = brainQuiz.getProgress()
        
        imageView2.image = brainQuiz.getImage()
        
        questionLabel.text = brainQuiz.getTextQuestion()
        questionLabel.textColor = brainQuiz.getColor()
        scoreLabel.text = "score: \(brainQuiz.getScore())"
        
        trueButton.backgroundColor = .white
        falseButton.backgroundColor = .white
        
        trueButton.isEnabled = true
        falseButton.isEnabled = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backroundImage.frame = view.bounds
        
        questionLabel.frame = CGRect(x: 20,
                                     y: 150,
                                     width: view.width - 40,
                                     height: 150)
        
        imageView2.frame = CGRect(x: 20,
                                 y: questionLabel.bottom + 20,
                                 width: view.width - 40,
                                 height: 250)
        
        progressQuiz.frame = CGRect(x: 30,
                                    y: view.bottom - 100,
                                    width: view.width - 60,
                                    height: 25)
        
        scoreLabel.frame = CGRect(x: 35,
                                  y: questionLabel.top - 80,
                                  width: view.width - 80,
                                  height: 70)
        
        trueButton.frame = CGRect(x: 40,
                                  y: imageView2.bottom + 20,
                                  width: view.width - 80,
                                  height: 45)
        
        falseButton.frame = CGRect(x: 40,
                                   y: trueButton.bottom + 10,
                                   width: view.width - 80,
                                   height: 45)
        
    }


}
