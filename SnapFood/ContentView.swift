//
//  ContentView.swift
//  SnapFood
//
//  Created by Claudio Tendean on 01/06/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 1
    @State var selectedBottom = 1
    var body: some View {
        ZStack{
            VStack{
                // Head Title
                HeadTitle()
                
                // TopTaps
                TopTabs(selectedTab: self.$selectedTab)
                
                // Scroll Food
                ScrollFood()
                
                // Bottom Tabs
                BottomTabs(selectedBottom: self.$selectedBottom)
                Spacer()
            }
        }
    }
}

struct HeadTitle : View {
    var body: some View {
        HStack{
            Text("Favorite Dessert")
                .font(
                    .system(
                        size: 28,
                        weight: .semibold,
                        design: .default))
            Spacer()
        }
        .padding([.leading, .trailing], 30)
        .padding(.bottom, 40)
    }
}

struct TopTabs : View {
    @Binding var selectedTab : Int
    var body: some View {
        VStack{
            VStack{
                HStack(spacing: 0){
                    // Tab 1
                    VStack{
                        Button(action: {
                            self.selectedTab = 1
                        }){
                            Text("All")
                                .font(.headline)
                                .foregroundColor(selectedTab == 1 ? Color.green : Color.secondary)
                        }
                        Rectangle()
                            .fill(Color.green)
                            .frame(height: 5)
                            .opacity(selectedTab == 1 ? 100 : 0)
                    }
                    .frame(height: 20)
                    
                    // Tab 2
                    VStack{
                        Button(action: {
                            self.selectedTab = 2
                        }){
                            Text("Cookbooks")
                                .font(.headline)
                                .foregroundColor(selectedTab == 2 ? Color.green : Color.secondary)
                        }
                        Rectangle()
                            .fill(Color.green)
                            .frame(height: 5)
                            .opacity(selectedTab == 2 ? 100 : 0)
                    }
                    .frame(height: 20)
                    
                    // Tab 3
                    VStack{
                        Button(action: {
                            self.selectedTab = 3
                        }){
                            Text("Recently")
                                .font(.headline)
                                .foregroundColor(selectedTab == 3 ? Color.green : Color.secondary)
                        }
                        Rectangle()
                            .fill(Color.green)
                            .frame(height: 5)
                            .opacity(selectedTab == 3 ? 100 : 0)
                    }
                    .frame(height: 20)
                }
                .padding(.bottom, 10)
                .padding(.top, 25)
                .border(Color.gray, width: 1)
            }.padding(.bottom, 30)
        }
    }
}

struct Food : View {
    var imgFood : String = ""
    var foodTitle : String = ""
    var foodChef : String = ""
    
    var body: some View {
        VStack{
            Image(self.imgFood)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(20)
                .clipped()
            
            HStack{
                Text("50 min")
                    .font(.headline)
                Text("234 cal")
                    .font(.headline)
                HStack{
                    Text("Rating")
                        .font(.headline)
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    }
                }
                Spacer()
            }.frame(height: 30)
            
            HStack{
                Image("Profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading){
                    Text(self.foodTitle)
                        .font(.system(
                            size: 20,
                            weight: .bold,
                            design: .rounded))
                    Text(self.foodChef)
                        .font(.system(
                            size: 14,
                            weight: .bold,
                            design: .rounded))
                        .foregroundColor(Color.secondary)
                }
                Spacer()
            }
        }.padding(.bottom, 30)
    }
}

struct ScrollFood : View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                Food(
                    imgFood: "dessert1",
                    foodTitle: "Ice Cream",
                    foodChef: "Chef Claudio")
                Food(
                    imgFood: "dessert2",
                    foodTitle: "Mochi",
                    foodChef: "Chef Rezy")
                Food(
                    imgFood: "dessert3",
                    foodTitle: "Banana Choclate",
                    foodChef: "Chef Tendean")
                Food(
                    imgFood: "dessert4",
                    foodTitle: "Puding",
                    foodChef: "Chef Claudio")
            }
            .padding([.leading, .trailing], 30)
            .padding(.bottom, 20)
        }
    }
}

struct BottomTabs : View {
    @Binding var selectedBottom : Int
    var body: some View {
        HStack {
            // Bottom Tabs 1
            VStack{
                Button(action: {self.selectedBottom = 1}) {
                    VStack{
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 25, height: 23)
                            .foregroundColor(self.selectedBottom == 1 ? Color.green : Color.secondary)
                        Text("Favorite")
                            .font(.system(
                                size: 9,
                                weight: .medium,
                                design: .default))
                            .foregroundColor(self.selectedBottom == 1 ? Color.green : Color.secondary)
                    }
                }
            }
            
            Spacer()
            // Bottom Tabs 2
            VStack{
                Button(action: {self.selectedBottom = 2}) {
                    VStack{
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 25, height: 23)
                            .foregroundColor(self.selectedBottom == 2 ? Color.green : Color.secondary)
                        Text("Search")
                            .font(.system(
                                size: 9,
                                weight: .medium,
                                design: .default))
                            .foregroundColor(self.selectedBottom == 2 ? Color.green : Color.secondary)
                    }
                }
            }
            
            Spacer()
            // Bottom Tabs 3
            VStack{
                Button(action: {self.selectedBottom = 3}) {
                    VStack{
                        Image(systemName: "camera")
                            .resizable()
                            .frame(width: 25, height: 23)
                            .foregroundColor(self.selectedBottom == 3 ? Color.green : Color.secondary)
                        Text("Photo")
                            .font(.system(
                                size: 9,
                                weight: .medium,
                                design: .default))
                            .foregroundColor(self.selectedBottom == 3 ? Color.green : Color.secondary)
                    }
                }
            }
            
            Spacer()
            // Bottom Tabs 4
            VStack{
                Button(action: {self.selectedBottom = 4}) {
                    VStack{
                        Image(systemName: "cart")
                            .resizable()
                            .frame(width: 25, height: 23)
                            .foregroundColor(self.selectedBottom == 4 ? Color.green : Color.secondary)
                        Text("Shooping")
                            .font(.system(
                                size: 9,
                                weight: .medium,
                                design: .default))
                            .foregroundColor(self.selectedBottom == 4 ? Color.green : Color.secondary)
                    }
                }
            }
            
            Spacer()
            // Bottom Tabs 5
            VStack{
                Button(action: {self.selectedBottom = 5}) {
                    VStack{
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 25, height: 23)
                            .foregroundColor(self.selectedBottom == 5 ? Color.green : Color.secondary)
                        Text("Profile")
                            .font(.system(
                                size: 9,
                                weight: .medium,
                                design: .default))
                            .foregroundColor(self.selectedBottom == 5 ? Color.green : Color.secondary)
                    }
                }
            }
        }.padding([.leading, .trailing], 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
