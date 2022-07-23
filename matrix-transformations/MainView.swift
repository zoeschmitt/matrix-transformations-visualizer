//
//  ContentView.swift
//  matrix-transformations
//
//  Created by Zoe Schmitt on 7/22/22.
//

import SwiftUI

struct MainView: View {
    @State private var plane = Plane()

    var body: some View {
        VStack {
            Spacer()

            ZStack {
                Color.black.opacity(0.1)
                    .frame(width: 120, height: 120, alignment: .top)
                    .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                ZStack {
                    Color.black.opacity(0.1)
                    Color(.blue)
                }
                .frame(width: 120 * plane.xScale, height: 120 * plane.yScale, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .offset(x: plane.xOffset, y: plane.yOffset)
                .rotation3DEffect(.degrees(plane.xAxisRotate), axis: (x: plane.xAxisRotate, y: 0.0, z: 0.0))
                .rotation3DEffect(.degrees(plane.yAxisRotate), axis: (x: 0.0, y: plane.yAxisRotate, z: 0.0))
                .rotation3DEffect(.degrees(plane.zAxisRotate), axis: (x: 0.0, y:0.0, z: plane.zAxisRotate))
                .onTapGesture {
                    withAnimation(.interactiveSpring()) {
                        plane = Plane()
                    }
                }
            }

            Spacer()



            VStack {
                TransformationSlider( transformation: $plane.xAxisRotate,  name: "X Axis Rotate", range: 0...50, degree: true)
                TransformationSlider( transformation: $plane.yAxisRotate,  name: "Y Axis Rotate", range: 0...50, degree: true)
                TransformationSlider( transformation: $plane.zAxisRotate,  name: "Z Axis Rotate", range: 0...100, degree: true)
                TransformationSlider( transformation: $plane.xScale,  name: "X Scale", range: 0...3)
                TransformationSlider( transformation: $plane.yScale,  name: "Y Scale", range: 0...3)
                TransformationSlider( transformation: $plane.xOffset,  name: "X Offset", range: -100...100)
                TransformationSlider( transformation: $plane.yOffset,  name: "Y Offset", range: -100...100)
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
