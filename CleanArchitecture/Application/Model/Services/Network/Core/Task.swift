//
//  Task.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/16/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import Alamofire

enum HTTPTask {
    case requestPlain
    case requestParameters(params: Parameters, encoding: ParameterEncoding)
}
