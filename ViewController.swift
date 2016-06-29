//
//  ViewController.swift
//  learn05
//
//  Created by 20141105063T on 16/6/29.
//  Copyright © 2016年 20141105063T. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lableResult: UILabel!
    
    //第一操作
    var firstOperand: Double = 0.0
    //第二操作
    var secondOperand: Double = 0.0
    //标记是否输入了小数点
    var decimalPointFlag: Bool = false
    //是否输入第二操作数
    var isSecond: Bool = false
    //操作符
    var operatorFlag: String = ""
    @IBAction func buttonTap(sender: UIButton) {
        //lableResult 中默认是0,如果开始输入数字,则先清除0
        if lableResult.text == "0" || (isSecond && secondOperand == 0.0) {
            
            lableResult.text = ""
        }
        //将用户录入的数添加到lableResult中
        lableResult.text = lableResult.text! + sender.titleLabel!.text!
        
        if isSecond {
            // secondOperand = (lableResult.text! as NSString).doubleValue
            secondOperand = NSString(string: lableResult.text!).doubleValue
        }else {
            //将lableResult中的字符串转化为双精度数
            // firstOperand = (lableResult.text! as NSString).doubleValue
            firstOperand = NSString(string: lableResult.text!).doubleValue
        }
        print(firstOperand)
    }
    @IBAction func decimalPointTap() {
        
        if !decimalPointFlag {
            lableResult.text = lableResult.text! + "."
            if isSecond {
                secondOperand = (lableResult.text! as NSString).doubleValue
            }else {
                firstOperand = (lableResult.text! as NSString).doubleValue
            }
            
            decimalPointFlag = !decimalPointFlag
        }
    }
    
    @IBAction func operatorTap(sender: UIButton) {
        if firstOperand != 0 {
            isSecond = true
            decimalPointFlag = false
            switch sender.titleLabel!.text! {
            case "+":
                operatorFlag = "+"
            case "-":
                operatorFlag = "-"
            case "*":
                operatorFlag = "*"
            case "÷":
                operatorFlag = "/"
            default:
                operatorFlag = " "
            }
        }
    }
    @IBAction func resultTap(sender: UIButton) {
        //确保第二操作数有值
        if isSecond {
            //除数不能为0
            if operatorFlag == "/" && secondOperand == 0 {
                print("Error: 除数不能为0")
                return
            }
            
            var result: Double = 0.0
            switch operatorFlag {
            case "+":
                result = firstOperand + secondOperand
            case "-":
                result = firstOperand - secondOperand
            case  "*":
                result = firstOperand * secondOperand
            case  "/":
                result = firstOperand / secondOperand
            default :
                result = 0.0
            }
            
            lableResult.text = result.description
            print("第一操作: \(firstOperand)")
            print("操作符: \(operatorFlag)")
            print("第二操作: \(secondOperand)")
            print("结果: \(result)")
            
        }
        
    }
    @IBAction func clear(sender: UIButton) {
        
        //lable对象显示0
        lableResult.text = "0"
        
        //第一操作数清零
        firstOperand = 0.0
        
        //第二操作数清零
        secondOperand = 0.0
        
        //小数点标记设置为假
        decimalPointFlag = false
        
        //第二操作数标记设置为假
        isSecond = false
        
        //操作清空
        operatorFlag = ""
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

