//
//  ViewController.swift
//  Learn Operation
//
//  Created by Anton Medovnik on 30.03.2023.
//

import UIKit


class ViewController: UIViewController {
    
    var array = [Int] ()
    
    @IBOutlet weak var labelOne: UILabel!
    
    @IBOutlet weak var labelTwo: UILabel!
    

    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFoure: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    
    @IBOutlet weak var labelSix: UILabel!
    
    @IBOutlet weak var labelSeven: UILabel!
    
    let operationQueue = OperationQueue()
    
    @IBAction func printAllNumbers(_ sender: UIButton) {
       
        
        array.removeAll()
        
        let operationaAdd1and2 = BlockOperation {
            self.array.append(1)
            self.array.append(2)
       
        }
        let operationaAdd3 = BlockOperation {
            self.array.append(3)
    
          
        }
        let operationaAdd4and5 = BlockOperation {
            self.array.append(4)
            self.array.append(5)
         
          
        }
        let operationaAdd6And7 = BlockOperation {
            self.array.append(6)
            self.array.append(7)
          
          }
        
       
        let printaArrayOperation = BlockOperation {
            for item in self.array {
            sleep(1)
            print(item)
            }
        }
        
        
        func showAllDatainLabels () {
            OperationQueue.main.addOperation {
                self.labelOne.text = String ("\(self.array[0])")
                self.labelTwo.text = String ("\(self.array[1])")
                self.labelThree.text = String ("\(self.array[2])")
                self.labelFoure.text = String ("\(self.array[3])")
                self.labelFive.text = String ("\(self.array[4])")
                self.labelSix.text = String ("\(self.array[5])")
                self.labelSeven.text = String ("\(self.array[6])")
            }
            
        }
        
        operationaAdd3.addDependency(operationaAdd1and2)
        operationaAdd4and5.addDependency(operationaAdd3)
        operationaAdd6And7.addDependency(operationaAdd4and5)
        printaArrayOperation.addDependency(operationaAdd6And7)
        
        operationQueue.addOperation(operationaAdd1and2)
        operationQueue.addOperation(operationaAdd3)
        operationQueue.addOperation(operationaAdd4and5)
        operationQueue.addOperation(operationaAdd6And7)
        operationQueue.addOperation(printaArrayOperation)
        
        showAllDatainLabels()
        
        
    }
    
 
  override func viewDidLoad() {
    super.viewDidLoad()
 
    
  }
    
    
    
    
    
 
  
 
}

