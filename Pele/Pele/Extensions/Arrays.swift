//
//  Arrays.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/1/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    func filterUniques() -> Array {
        return reduce(into: []) { result, element in
            if !result.contains(element) {
                result.append(element)
            }
        }
    }
}
