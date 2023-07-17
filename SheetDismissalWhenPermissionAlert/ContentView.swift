//
//  ContentView.swift
//  SheetDismissalWhenPermissionAlert
//
//  Created by Tobias Kreß on 14.07.23.
//

import SwiftUI

struct ContentView: View {
  @Environment(\.scenePhase) var scenePhase
  
  @State var showSheet: Bool = false
  @State var showSheet2: Bool = false
  @State var shouldShowSheet2: Bool = false

  var body: some View {
    VStack {
      Button {
        showSheet = true
      } label: {
        Text("Show sheet 1")
      }
    }
    .padding()
    .sheet(isPresented: $showSheet, onDismiss: {
      if shouldShowSheet2 {
        showSheet2 = true
      }
    }) {
      VStack {
        Text("Sheet 1")
        Button {
          showSheet = false
          shouldShowSheet2 = true
        } label: {
          Text("Show sheet 2")
        }
      }
    }
    .sheet(isPresented: $showSheet2) {
      Text("Sheet 2")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
