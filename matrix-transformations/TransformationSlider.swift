//
//  TransformationSlider.swift
//  matrix-transformations
//
//  Created by Zoe Schmitt on 7/22/22.
//

import SwiftUI

struct TransformationSlider: View {
    @Binding var transformation: Double
    var name: String
    var range: ClosedRange<Double>

    var body: some View {
        VStack(alignment: .leading) {

            HStack {
                Text(name)
                Spacer()
                Text("\(Int(transformation))°")
            }
            .foregroundColor(.secondary)
            Slider(
                value: $transformation,
                in: range
            )
        }
    }
}

struct TransformationSlider_Previews: PreviewProvider {
    static var previews: some View {
        TransformationSlider(transformation: .constant(10), name: "X Axis Offset", range: 0...10)
    }
}
