//
//  Coodinator.swift
//  FlashChat
//
//  Created by Igor Costa Nascimento on 07/02/25.
//

import Foundation
import UIKit


protocol Coordinator: AnyObject{
    var navigationController: UINavigationController {get set}
    var coordinators:[Coordinator] {get set}
    func start()
}
