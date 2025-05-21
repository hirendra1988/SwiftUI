//
//  FocusStateDemoView.swift
//  FocusStateView
//
//  Created by Hirendra Sharma on 06/07/24.
//

import SwiftUI

struct FocusStateDemoView: View {
    
    enum Field: Hashable {
        case name
        case email
        case comment
    }

    @State private var name: String = ""
    @State private var email: String = ""
    @State private var comment: String = ""
    @FocusedValue(\.commentFocusedValue) var commentVal
    @FocusState private var selectedField: Field?

    var body: some View {
        VStack {
            
            
            VStack {
                Text(commentVal ?? "Not focused")
            } .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 100)
                .padding()
                .background(.yellow)
            
            Text("👋Help us improve")
                .font(.system(.largeTitle, design: .rounded, weight: .black))

            TextField("Name", text: $name)
                .padding()
                .border(.gray, width: 1)
                .focused($selectedField, equals: .name)
                .focusedValue(\.commentFocusedValue, name)
                .submitLabel(.next)

            TextField("Email", text: $email)
                .padding()
                .border(.gray, width: 1)
                .focused($selectedField, equals: .email)
                .focusedValue(\.commentFocusedValue, email)
                .submitLabel(.next)

            TextField("Any comment?", text: $comment)
                .padding()
                .border(.gray, width: 1)
                .focused($selectedField, equals: .comment)
                .focusedValue(\.commentFocusedValue, comment)
                .submitLabel(.join)

            Button("Submit") {
                selectedField = nil
            }
            .controlSize(.extraLarge)
            .buttonStyle(.borderedProminent)

        }
        .padding()
        .onChange(of: selectedField) { oldValue, newValue in
            print(newValue ?? "No field is selected")
        }
        .onSubmit {
            switch selectedField {
            case .name:
                selectedField = .email
            case .email:
                selectedField = .comment
            default:
                print("Creating account…")
            }
        }
    }
}

struct FocusObjectDemoView: View {
    
    enum Field: Hashable {
        case name
        case email
        case comment
    }

    @StateObject private var viewModel: FormViewModel = FormViewModel()
    @FocusState private var selectedField: Field?

    var body: some View {
        VStack {
            
            Text("👋Help us improve")
                .font(.system(.largeTitle, design: .rounded, weight: .black))

            TextField("Name", text: $viewModel.name)
                .padding()
                .border(.gray, width: 1)
                .focused($selectedField, equals: .name)
                .focusedObject(viewModel)

            TextField("Email", text: $viewModel.email)
                .padding()
                .border(.gray, width: 1)
                .focused($selectedField, equals: .email)
                .focusedObject(viewModel)

            TextField("Any comment?", text: $viewModel.comment)
                .padding()
                .border(.gray, width: 1)
                .focused($selectedField, equals: .comment)
                .focusedObject(viewModel)

            Button("Submit") {
                selectedField = nil
            }
            .controlSize(.extraLarge)
            .buttonStyle(.borderedProminent)
            
            CommentPreview()

        }
        .padding()
        .onChange(of: selectedField) { oldValue, newValue in
            print(newValue ?? "No field is selected")
        }
    }
}

#Preview {
    FocusStateDemoView()
}

struct CommentPreview: View {

    @FocusedObject var viewModel: FormViewModel?

    var body: some View {
        VStack {
            Text(viewModel?.name ?? "Not focused")
            Text(viewModel?.email ?? "Not focused")
            Text(viewModel?.comment ?? "Not focused")
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 100)
        .padding()
        .background(.yellow)
    }
}


struct CommentFocusedKey: FocusedValueKey {
    typealias Value = String
}

extension FocusedValues {
    var commentFocusedValue: CommentFocusedKey.Value? {
        get { self[CommentFocusedKey.self] }
        set { self[CommentFocusedKey.self] = newValue }
    }
}

