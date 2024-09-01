//
//  ContentView.swift
//  mvvm-case
//
//  Created by Luiz Correa on 01/09/2024.
//

import SwiftUI



struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    
    var body: some View {
        VStack {
            ProfileDataView()
            ActionView()
        }
        .animation(.easeInOut, value: viewModel.isFollowing)
        .environmentObject(viewModel) //avoid to reply each viewmodel
    }
    
}

struct ProfileDataView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        Image(viewModel.user.picture)
            .resizable()
            .frame(width: 250, height: 250)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .padding(.bottom, 10)
        
        
        Text(viewModel.user.name)
            .font(.system(size: 50, weight: .bold))
        
        Text(viewModel.user.nick)
            .font(.system(size: 23, weight: .regular))
            .foregroundStyle(.gray)
        
        Text(viewModel.userFollowers)
            .font(.system(size: 80, weight: .light))
            .padding(viewModel.isFollowing ? 40 : 25)
    }
}

struct ActionView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            Button{
                viewModel.followToogle()
            } label: {
                Label(!viewModel.isFollowing ? "follow" : "unfollow", systemImage: "person.crop.circle.fill.badge.plus")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(!viewModel.isFollowing ? .blue : .orange)
            
            Button{} label: {
                Label("enviar mensagem", systemImage: "paperplane.fill")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(!viewModel.isFollowing)
        }
        .padding(20)
    }
}

#Preview {
    ProfileView()
}
