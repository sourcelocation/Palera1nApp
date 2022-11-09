//
//  ForegroundLinearGradient.swift
//  Palera1nApp
//
//  Created by Lakhan Lothiyi on 08/11/2022.
//

import Foundation
import SwiftUI

extension Text {
    public func foregroundLinearGradient(
        colors: [Color],
        startPoint: UnitPoint,
        endPoint: UnitPoint) -> some View
    {
        self.overlay {

            LinearGradient(
                colors: colors,
                startPoint: startPoint,
                endPoint: endPoint
            )
            .mask(
                self

            )
        }
    }
}
