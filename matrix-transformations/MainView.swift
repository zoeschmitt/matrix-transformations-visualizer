//
//  ContentView.swift
//  matrix-transformations
//
//  Created by Zoe Schmitt on 7/22/22.
//

import SwiftUI

struct MainView: View {
    @State private var plane = Plane()
//    private var transformations: [String: Binding<Double>] = ["X Axis Rotate": $plane.xAxisRotate]
    var body: some View {
        VStack {
            Spacer()

            ZStack {
                Color(.blue)
            }
            .frame(width: 100 * plane.xScale, height: 100 * plane.yScale, alignment: .top)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .offset(x: plane.xOffset, y: plane.yOffset)
            .rotation3DEffect(.degrees(plane.xAxisRotate), axis: (x: plane.xAxisRotate, y: 0.0, z: 0.0))
            .rotation3DEffect(.degrees(plane.yAxisRotate), axis: (x: 0.0, y: plane.yAxisRotate, z: 0.0))
            .rotation3DEffect(.degrees(plane.zAxisRotate), axis: (x: 0.0, y:0.0, z: plane.zAxisRotate))

            Spacer()



            VStack {
                VStack(alignment: .leading) {

                    HStack {
                        Text("X Axis Rotate")
                        Spacer()
                        Text("\(Int(plane.xAxisRotate))°")
                    }
                    .foregroundColor(.secondary)
                    Slider(
                        value: $plane.xAxisRotate,
                        in: 0...50
                    )
                }
                VStack(alignment: .leading) {

                    Text("Y Axis Rotate \(Int(plane.yAxisRotate))")
                        .foregroundColor(.secondary)
                    Slider(
                        value: $plane.yAxisRotate,
                        in: 0...50
                    )
                }
                VStack(alignment: .leading) {

                    Text("Z Axis Rotate \(Int(plane.zAxisRotate))")
                        .foregroundColor(.secondary)
                    Slider(
                        value: $plane.zAxisRotate,
                        in: 0...50
                    )
                }
                VStack(alignment: .leading) {

                    Text("X Scale \(Int(plane.xScale))")
                        .foregroundColor(.secondary)
                    Slider(
                        value: $plane.xScale,
                        in: 0...3
                    )
                }
                VStack(alignment: .leading) {

                    Text("Y Scale \(Int(plane.yScale))")
                        .foregroundColor(.secondary)
                    Slider(
                        value: $plane.yScale,
                        in: 0...3
                    )
                }
                VStack(alignment: .leading) {

                    Text("X Offset \(Int(plane.xOffset))")
                        .foregroundColor(.secondary)
                    Slider(
                        value: $plane.xOffset,
                        in: 0...50
                    )
                }
                VStack(alignment: .leading) {

                    Text("Y Offset \(Int(plane.yOffset))")
                        .foregroundColor(.secondary)
                    Slider(
                        value: $plane.yOffset,
                        in: 0...50
                    )
                }

            }
            .padding()
            .background(Color.black.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .padding()
            .ignoresSafeArea()

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
