//
//  ContentView.swift
//  BeautyFy
//
//  Created by Anjan Kumar Majumder on 11/21/19.
//  Copyright © 2019 anjan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    init() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }

    @EnvironmentObject var userdata: UserData

    var body: some View {
        NavigationView {
            List {
                VStack(spacing: 10) {
                    Text("MakeUp Models")
                    ScrollView(.horizontal, content: {
                        HStack(spacing: 10) {
                            ForEach(userdata.makeUpModels) { model in
                                MakeUpCellView(status: model).gesture(TapGesture().onEnded({ _ in
                                    self.userdata.inputMakeUp = model.image
                                    print("I am taped: \(model.image)")
                                }))
                            }
                        }.padding(.leading, 10)
                    })
                }

                VStack(spacing: 10) {
                    Text("No MakeUp Models")
                    ScrollView(.horizontal, content: {
                        HStack(spacing: 10) {
                            ForEach(userdata.noMakeUpModels) { model in
                                MakeUpCellView(status: model).gesture(TapGesture().onEnded({ _ in
                                    self.userdata.inputNoMakeUp = model.image
                                    print("I am taped: \(model.image)")
                                }))
                            }
                        }.padding(.leading, 10)
                    })
                }
                
                Spacer()
                
                VStack(spacing: 10) {
                    Text("Outputs")
                    HStack(spacing: 10) {
                        Spacer()
                        MakeUpOutputFrameView(makeUpImage: userdata.inputMakeUp, noMakeUpImage: userdata.inputNoMakeUp, frameSize: 256)
                        Spacer()
                    }
                }
                
            }
            .padding(.leading, -20)
            .padding(.trailing, -20)
            .navigationBarTitle(Text("Models"))
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
