//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Oniel Rosario on 11/30/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var myView: UIView!
    var myColor: UIColor!
    var currentRed: Double!
    var currentBlue: Double!
    var currentGreen: Double!
    var currentStepper: Double!
    
    var color: Crayon!
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redSliderValue: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenSliderValue: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueSliderValue: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var alphaStepperValue: UILabel!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentRed = color.red / Double(255)
        currentGreen = color.green / 255.0
        currentBlue = color.blue / 255.0
        currentStepper = 1
        let myColor = UIColor.init(displayP3Red: CGFloat(currentRed), green: CGFloat(currentGreen), blue: CGFloat(currentBlue), alpha: CGFloat(currentStepper))
        setUpColor(color: myColor)
        
        //labels
        colorName.text = color.name
        redSliderValue.text = String(format: "%.1f", currentRed)
        greenSliderValue.text = String(format: "%.1f", currentGreen)
        blueSliderValue.text = String(format: "%.1f", currentBlue)
        alphaStepperValue.text = "\(Double(currentStepper!))"
        
        
        
        //sliders
        redSlider.maximumValue = 1
        redSlider.minimumValue = 0
        redSlider.value = Float(currentRed)
        
        greenSlider.maximumValue = 1
        greenSlider.minimumValue = 0
        greenSlider.value = Float(currentGreen)
        
        blueSlider.maximumValue = 1
        blueSlider.minimumValue = 0
        blueSlider.value = Float(currentBlue)
        
        //stepper
        alphaStepper.maximumValue = 1
        alphaStepper.minimumValue = 0
        alphaStepper.value = currentStepper
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        switch sender {
        case redSlider:
            currentRed = Double(sender.value)
            redSliderValue.text = String(format: "%.1f", sender.value)
            self.myView.backgroundColor = UIColor.init(displayP3Red: CGFloat(currentRed), green: CGFloat(currentGreen), blue: CGFloat(currentBlue), alpha: CGFloat(currentStepper))
        case greenSlider:
            currentGreen = Double(sender.value)
            self.myView.backgroundColor = UIColor.init(displayP3Red: CGFloat(currentRed), green: CGFloat(currentGreen), blue: CGFloat(currentBlue), alpha: CGFloat(currentStepper))
            greenSliderValue.text = String(format: "%.1f", sender.value)
        case blueSlider:
            currentBlue = Double(sender.value)
            self.myView.backgroundColor = UIColor.init(displayP3Red: CGFloat(currentRed), green: CGFloat(currentGreen), blue: CGFloat(currentBlue), alpha: CGFloat(currentStepper))
            blueSliderValue.text = String(format: "%.1f", sender.value)
        default:
            break
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        currentStepper = sender.value
        alphaStepperValue.text = Double(sender.value).description
        self.myView.backgroundColor = UIColor.init(displayP3Red: CGFloat(currentRed), green: CGFloat(currentGreen), blue: CGFloat(currentBlue), alpha: CGFloat(currentStepper))
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        currentRed = color.red / Double(255)
        currentGreen = color.green / 255.0
        currentBlue = color.blue / 255.0
        currentStepper = 1
        let myColor = UIColor.init(displayP3Red: CGFloat(currentRed), green: CGFloat(currentGreen), blue: CGFloat(currentBlue), alpha: CGFloat(currentStepper))
        setUpColor(color: myColor)
        
        colorName.text = color.name
        redSliderValue.text = String(format: "%.1f", currentRed)
        greenSliderValue.text = String(format: "%.1f", currentGreen)
        blueSliderValue.text = String(format: "%.1f", currentBlue)
        alphaStepperValue.text = "\(Double(currentStepper!))"
        
        
        redSlider.value = Float(currentRed)
        greenSlider.value = Float(currentGreen)
        blueSlider.value = Float(currentBlue)
        alphaStepper.value = currentStepper
    }
    
    private func setUpColor(color: UIColor) {
        view.backgroundColor = color
    }
}
