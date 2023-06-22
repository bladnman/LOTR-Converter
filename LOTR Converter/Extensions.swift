//
//  Extrnsions.swift
//  LOTR Converter
//
//  Created by Matt Maher on 6/21/23.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
