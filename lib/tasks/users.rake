namespace :user do
  desc "Pick a random user as the winner"
  task :admin => :environment do
    admin_email = nil
    while !get_user_by_email
      get_user_by_email
    end
    @user.add_role :admin
    puts "Admin: #{@user.email}"

  end

  def get_user_by_email
    puts "Enter login to assign Admin role" unless @user

    @user ||= User.find_by_email(STDIN.gets.chomp)
  end
end