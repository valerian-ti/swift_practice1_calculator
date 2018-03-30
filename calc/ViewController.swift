//
//  ViewController.swift
//  calc
//
//  Created by mac on 28/03/2018.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var numberz:Double = 0 //variable for storing our actual label value
    var prevNumberz:Double = 0 // var for doing math
    var doMath = false
    var operation = 0 // info for operand's tag
    
    
    @IBOutlet weak var label: UILabel!
    
    
    
    @IBOutlet weak var borderButton: UIButton!
    
    
    @IBOutlet weak var Image: UIImageView!
    @IBAction func tmButn(_ sender: Any)
    {
        if (Image.isHidden)
        {
            Image.isHidden = false;
        }
        else
        {
            Image.isHidden = true
        }
    }
    // pressing the AC button
    @IBAction func cleanAllButton(_ sender: UIButton)
    {
        label.text="0"
        doMath = false
        numberz = 0
        prevNumberz = 0
        operation = 0
        
    }
    
    // pressing number buttons
    @IBAction func numbers(_ sender: UIButton)
    {
        
        // check if operand buttons were pressed or 1st type
        //clearing label
        if doMath == true || label.text == "0"
        {
            label.text = ""
            doMath = false
        }
        
          //positive number
           if (label.text?.count)! < 9 && numberz >= 0
           { //maximum amount of label positive output is 9
             label.text = label.text! + String(sender.tag-1)
            // while we're pressing the batnz label caption equals the tag of the button minus 1 - in int, so we transform this to String
                numberz = numberz * 10
                numberz = numberz + Double(sender.tag-1)
            
            }
        // letting print negative numbers
             if (label.text?.count)! < 10 && numberz < 0
             { //maximum amount of label output is 9 but we always can display "-" symbol
                
            label.text = label.text! + String(sender.tag-1) // while we're pressing the batnz label caption equals the tag of the button minus 1 - in int, so we transform this to String
                numberz = numberz * 10
                numberz = numberz + Double(sender.tag-1)
             }
    }
    
    
    @IBAction func operandButnz(_ sender: Any)
    {
        
        // if we're pressing plus or minus operator
        if (sender as AnyObject).tag == 15
        { // plus-minus operator
            
            if numberz < 0 //negative number
            {
               label.text = label.text!.replacingOccurrences(of: "-",  with: "") // deleting "-" in label text
                
            }
            else if numberz > 0
            { // adding minus
                label.text = "-" + label.text!
                
            }
            
            numberz *= -1 // inverting number
        }
        
        
        // pressed operands for first time
            
            else if (sender as AnyObject).tag == 11
            { //divide
                label.text = "÷";
                operation = (sender as AnyObject).tag
                doMath = true
                prevNumberz = numberz
            }
            else if (sender as AnyObject).tag == 12
            { //multiply
                label.text = "x";
                operation = (sender as AnyObject).tag
                doMath = true
                prevNumberz = numberz
            }
            else if (sender as AnyObject).tag == 13
            { //minus
                label.text = "-";
                operation = (sender as AnyObject).tag
                doMath = true
                prevNumberz = numberz
            }
            else if (sender as AnyObject).tag == 14
            { //plus
                label.text = "+";
                operation = (sender as AnyObject).tag
                doMath = true
                prevNumberz = numberz
            
            }
            else if (sender as AnyObject).tag == 16
            { //percent
                label.text = "%";
                operation = (sender as AnyObject).tag
                doMath = true
                prevNumberz = numberz
                
            }
           
            else if (sender as AnyObject).tag == 18
            { //equals
                numberz = Double(label.text!)!
                if operation == 11
                {  //performing divide
                    if prevNumberz != 0
                    {// cannot divide by 0
                         label.text = String((round)(prevNumberz / numberz))
                    }
                    else
                    {
                        label.text = "0"
                    }
                }
                    
                else if operation == 12
                { // multiply
                    label.text = String((round)(numberz * prevNumberz))
                }
                
                else if operation == 13
                { // minus
                    label.text = String((round)(prevNumberz - numberz))
                }
                
                else if operation == 14
                { // plus
                    label.text = String((round)(numberz + prevNumberz))
                }
                else if operation == 16
                { // percent
                    label.text = String((round)(prevNumberz / 100 * numberz))
                }
                
          
            numberz = Double(label.text!)!
            doMath = false
            operation = 0
           }
       

     }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
      //  borderButton.layer.borderWidth = 3.5;
       // borderButton.layer.borderColor = UIColor.green.cgColor       // Do any additional setup af ter loading the view, typically from a nib.
        label.text="0" // setting up the starting value
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

