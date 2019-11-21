//
//  NumberFieldViewModel.swift
//  Pele
//
//  Created by Kamiar Coffey on 10/31/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

/*
 Thanks to superpuccio for the code to create a numerical text field from UITextField
 https://stackoverflow.com/questions/57822749/how-to-create-swiftui-textfield-that-accepts-only-numbers-and-a-single-dot
 */

class NumericalFieldViewModel: ObservableObject {
    @Published var text: String = ""
    private var subCancellable: AnyCancellable!
    private var validCharSet = CharacterSet(charactersIn: "1234567890.")

    init() {
        subCancellable = $text.sink { val in
            //check if the new string contains any invalid characters
            if val.rangeOfCharacter(from: self.validCharSet.inverted) != nil {
                //clean the string (do this on the main thread to avoid overlapping with the current ContentView update cycle)
                DispatchQueue.main.async {
                    self.text = String(self.text.unicodeScalars.filter {
                        self.validCharSet.contains($0)
                    })
                }
            }
        }
    }

    deinit {
        subCancellable.cancel()
    }
}

struct NumberTextField: View {
    private class NumberFieldViewModel: ObservableObject {
        @Published var text: String = ""
        private var subCancellable: AnyCancellable!
        private var validCharSet = CharacterSet(charactersIn: "1234567890")

        init() {
            subCancellable = $text.sink { val in
                if val.rangeOfCharacter(from: self.validCharSet.inverted) != nil {
                    DispatchQueue.main.async {
                        self.text = String(self.text.unicodeScalars.filter {
                            self.validCharSet.contains($0)
                        })
                    }
                }
            }
        }

        deinit {
            subCancellable.cancel()
        }
    }

    @ObservedObject private var viewModel = NumberFieldViewModel()

    var body: some View {
        TextField("", text: $viewModel.text)
    }
}

