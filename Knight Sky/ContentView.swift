//
//  ContentView.swift
//  Knight Sky
//
//  Created by Tom Bastable on 27/04/2024.
//

import SwiftUI
import SceneKit

extension Color {
    static let customDarkGray = Color(red: 24 / 255, green: 27 / 255, blue: 30 / 255)
}

struct ContentView: View {
    
    @ObservedObject var viewModel = ARViewModel.shared
    
    var body: some View {
        
        //*******
        //REFACTOR THIS MESS - DONE FOR SPEEDY PROTOTYPE
        //*******
        ZStack {
            
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)
                .onAppear(perform: {
                    LocationManager.shared.requestLocationAuthorization()
                })
            
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Button() {
                        withAnimation {
                            viewModel.passthrough.toggle()
                        }
                    } label: {
                        Image(systemName: "cube.transparent")
                            .padding()
                            .background(.gray.opacity(0.3))
                            .clipShape(.circle)
                            .tint(.white)
                    }
                    .padding(.trailing, 15)
                }
                Spacer()
            }
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.black)
                .opacity(viewModel.showDetail ? 0.6 : 0.0)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    ZStack {
                        
                        VStack {
                            Text(viewModel.object.rawValue)
                                .font(.system(size: 40, weight: .bold))
                                .foregroundStyle(.white)
                            Text(viewModel.object.subtitle)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.orange)
                            
                        }
                        .offset(y: -20)
                        SceneKitContainerView(planet: $viewModel.object)
                            .frame(height: 300)
                            .offset(y: 150)
                            .zIndex(1)
                        HStack {
                            
                            Spacer()
                            Button() {
                                withAnimation {
                                    viewModel.showDetail.toggle()
                                }
                            } label: {
                                Image(systemName: "xmark")
                                    .padding()
                                    .background(.gray.opacity(0.3))
                                    .clipShape(.circle)
                                    .tint(.white)
                            }
                            .zIndex(2)
                            .padding(.trailing, 15)
                        }
                        .offset(y: -40)
                        
                    }
                    .zIndex(1)
                    // Use Spacer() to push the view to the bottom
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 20) {
                                        // Each VStack represents a piece of information
                                        VStack(alignment: .leading) {
                                            Text("Distance from Earth")
                                                .font(.headline)
                                                .foregroundStyle(.white.opacity(0.5))
                                            Text(viewModel.object.distanceFromEarth)
                                                .foregroundStyle(.orange)
                                        }
                                        .padding()
                                        .cornerRadius(10)
                                        
                                        VStack(alignment: .leading) {
                                            Text("Diameter")
                                                .font(.headline)
                                                .foregroundStyle(.white.opacity(0.5))
                                            Text(viewModel.object.diameter)
                                                .foregroundStyle(.orange)
                                        }
                                        .padding()
                                        .cornerRadius(10)
                                        
                                        VStack(alignment: .leading) {
                                            Text("Day Length")
                                                .font(.headline)
                                                .foregroundStyle(.white.opacity(0.5))
                                            Text(viewModel.object.dayLength)
                                                .foregroundStyle(.orange)
                                        }
                                        .padding()
                                        .cornerRadius(10)
                                        
                                        VStack(alignment: .leading) {
                                            Text("Average Temperature")
                                                .font(.headline)
                                                .foregroundStyle(.white.opacity(0.5))
                                            Text(viewModel.object.averageTemperature)
                                                .foregroundStyle(.orange)
                                        }
                                        .padding()
                                        .cornerRadius(10)
                                    }
                                    .padding()
                                }
                        .offset(y: 100)
                        
                        Text("Overview")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundStyle(.white)
                            .offset(y: 65)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 30)
                        ScrollView {
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ullamcorper vestibulum nibh non posuere. Etiam dignissim felis sit amet dui sollicitudin varius in facilisis eros. Quisque et sapien non arcu laoreet cursus id vitae odio. Cras malesuada arcu eu mauris rutrum, vitae viverra tortor volutpat. Nulla ut risus ac magna volutpat malesuada. Duis iaculis iaculis luctus. Cras et magna orci. Integer hendrerit, quam sed imperdiet iaculis, felis odio posuere sem, nec maximus erat libero quis purus. Praesent mi eros, fringilla egestas placerat quis, dictum et ipsum. Duis vitae feugiat justo.Quisque volutpat vehicula pellentesque. Donec massa tellus, malesuada ac consequat at, ultricies sit amet arcu. In bibendum felis vel vehicula dictum. Nunc a porttitor lorem. Donec ut luctus sem, ut blandit tortor. Proin quis nisl nunc. Cras at eros et dolor facilisis cursus id id enim.Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aenean blandit magna ac bibendum pretium. Quisque cursus ligula eget suscipit ultricies. Maecenas egestas, ipsum placerat euismod sagittis, nisl risus feugiat leo, in convallis mi nisl a nisl. Donec enim eros, tristique non quam quis, pretium semper justo. Proin laoreet, velit sit amet porttitor tincidunt, lorem orci rutrum eros, non lobortis urna sapien eu diam. Duis efficitur arcu sit amet nisi laoreet rhoncus.Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce orci nulla, ornare vitae lorem eu, dapibus lacinia libero. Suspendisse eget pharetra sem. Nam sagittis lorem velit, quis mollis orci tristique eu. Nullam eget eleifend tellus. Mauris et leo id lectus tempor congue sit amet nec purus. Mauris cursus orci at porttitor aliquam. Aliquam blandit libero et augue tincidunt, non consequat elit maximus. Maecenas vulputate sapien ut felis ullamcorper fringilla. Suspendisse pulvinar felis eget suscipit faucibus. Integer urna nibh, malesuada vitae quam sit amet, placerat tempus massa. Curabitur quis erat in mauris interdum imperdiet vel sagittis ligula. Suspendisse potenti. Phasellus ultricies tincidunt magna molestie ullamcorper.Sed gravida bibendum vehicula. Mauris porta at purus vitae sodales. Proin ac vestibulum lacus. Aliquam in placerat risus. Phasellus consectetur convallis lectus ut efficitur. Sed lacinia lacus vel efficitur venenatis. Nunc ut libero porttitor, lobortis enim vel, rutrum libero. Duis id tristique odio, in sagittis ligula. Pellentesque ac tincidunt arcu. Quisque faucibus eleifend purus, nec tincidunt dolor varius vitae. Phasellus tempor gravida mollis.")
                                .foregroundStyle(.white.opacity(0.6))
                                .font(.system(size: 13))
                                .padding(.horizontal, 30)
                        }
                        .padding(.top, 55)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.customDarkGray)
                    .clipShape(.rect(cornerRadius: 20))
                }
                // Control the offset based on the showDetails state
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.clear) // Optional: dimming background
                .offset(y: viewModel.showDetail ? 0 : 1000)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
