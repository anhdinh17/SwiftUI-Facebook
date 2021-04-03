//
//  ContentView.swift
//  Facebook
//
//  Created by Anh Dinh on 3/31/21.
//

import SwiftUI

struct ContentView: View {
    
    let stories = ["story1","story2","story3"]
    
    // this text binds w/ the one in textField
    @Binding var text: String
    
    let facebookBlue = UIColor(red: 23/255.0,
                               green: 120/255.0,
                               blue: 242/255.0,
                               alpha: 1)
    
    var body: some View {
        VStack{
            HStack{
                Text("Facebook")
                    .font(.system(size: 48, weight: .bold, design: .default))
                    .foregroundColor(Color(facebookBlue))
                
                Spacer() // fill the space btw Text and image
                
                Image(systemName: "person.circle")
                    .resizable() // make the image to fill the size of the frame
                    .frame(width: 38, height: 38, alignment: .center)
                    .foregroundColor(Color(.secondaryLabel))
            }
            .padding() // padding for Hstack
            
            TextField("Search...", text: $text)
                .padding(7)
                .background(Color(.systemGray5))
                .cornerRadius(13)
                .padding(.horizontal,15)
            
            ZStack{ // stack up on each other
                Color(.secondarySystemBackground)
                
                ScrollView(.vertical){
                    VStack{
                        
                        ScrollView(.horizontal){
                            HStack(spacing: 4){
                                ForEach(stories, id: \.self){name in
                                    Image(name)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 140, height: 200, alignment: .center)
                                        .background(Color.red)
                                        .clipped()
                                }
                                
                            }
                            .padding()
                        }
                        
                        FBPost(name: "person1",
                               imageName: "person1",
                               post: "Hey guys, I just made a new website called Facebook, come and check it out to see if you like it")
                        FBPost(name: "person2",
                               imageName: "person2",
                               post: "I finally traveled to Europe last week and go to Ireland Shore")
                        FBPost(name: "person3",
                               imageName: "person3",
                               post: "The weather was so good that we dicided to go out and took some photos")
                        Spacer()
                        
                    }
                }
            }
            
            Spacer() // bump the HStack to the top
        }
    }
}

struct FBPost: View {
    
    let name: String
    let imageName: String
    let post: String
    
    var body: some View{
        // Whole Vstack is the post
        VStack{
            // Profile pic, Name, posted Time
            HStack{
                Image(imageName)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(25)
                VStack{
                    // xài 2 HStack để đẩy text left cho thẳng hàng
                    HStack{
                        Text(name)
                            .foregroundColor(Color.blue)
                            .font(.system(size: 18, weight: .semibold, design: .default))
                        Spacer() // Đẩy text left
                    }
                    HStack{
                        Text("12 Minutes Ago")
                            .foregroundColor(Color(.secondaryLabel))
                        Spacer() // Đẩy text left
                    }
                }
                Spacer()
            }
            
            // Text of the post
            HStack{
                Text(post)
                    .font(.system(size: 24, weight: .regular, design: .default))
                    .multilineTextAlignment(.leading)
                    // fixedSize is to wrap all the texts
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
            
            // Buttons
            HStack{
                Button(action: {
                    
                }, label: {
                    Text("Like")
                })
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Comment")
                })
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Share")
                })
            }
            .padding()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: .constant(""))
    }
}
