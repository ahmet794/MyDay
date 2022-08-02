//
//  AddTaskView.swift
//  MyDay
//
//  Created by Ahmet Cihan on 25/07/2022.
//

import SwiftUI



struct AddTaskView: View {
    
    @State var textTask: String = ""
    @State var textDescription: String = ""
    @State var data: String = ""
    @State var time = Date()
    @Environment(\.dismiss) private var dismiss
    let didClose: () -> Void
    
    
    
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            HStack(alignment: .firstTextBaseline, spacing: 90) {
                taskName
                taskNameTxt
            }
            taskDescription
            HStack(alignment: .center, spacing: 55) {
                taskTime
                taskTimePicker
            }
            HStack (alignment: .firstTextBaseline, spacing: 40){
                addButton
                cancelButton
            }
        }
        .padding()
        .multilineTextAlignment(.trailing)
        .overlay(RoundedRectangle(cornerRadius: 16)
            .strokeBorder(.secondary, lineWidth: 4)
        )
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView {}
            .background(.white)
            .previewLayout(.sizeThatFits)

    }
}

private extension AddTaskView {
    
    var taskName: some View {
        
        HStack {
            Text("Task")
                    .font(
                        .system(size: 22, weight: .bold, design: .rounded)
                )
        }
    }
    
    var taskNameTxt: some View {
        HStack{
            TextField("Task Name", text: $textTask)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .font(.callout)
                .padding()
                .frame(width: 183, height: 40, alignment: .leading)
                .cornerRadius(40)}
    }

    var taskDescription: some View {
        HStack {
            Text("Task Description")
                .font(
                    .system(size: 15, weight: .bold, design: .rounded)
                )
            TextField("Enter Description", text: $textDescription)
                .textFieldStyle(.roundedBorder)
                .padding(25.0)
                .font(.callout)
                .frame(width: 202, height: 40, alignment: .center)
                .cornerRadius(40)
        }
    }
    
    var taskTime: some View {
        HStack {
            Text("Task Time")
                .font(
                    .system(size: 20, weight: .bold, design: .rounded)
                )
                .padding(.trailing)
        }
    }
    
    var taskTimePicker: some View {
        HStack{
            DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                .datePickerStyle(.graphical)
                .font(.callout)
                .frame(width: 110, height: 40, alignment: .trailing)
        }
    }

    var addButton: some View {
        Button("Add", role: .cancel){
            dismiss()
        }
        .padding(.trailing, 100.0)
        .font(.system(size: 25, design: .rounded))
    }

    var cancelButton: some View {
        Button("Cancel", role: .cancel){
            didClose()
        }
        .padding()
        .font(.system(size: 25, design: .rounded))
    }
}

struct RoundedCorners: View {
    var color: Color = .blue
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                let w = geometry.size.width
                let h = geometry.size.height

                // Make sure we do not exceed the size of the rectangle
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                path.closeSubpath()
            }
            .fill(self.color)
        }
    }
}

