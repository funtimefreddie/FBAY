namespace :auction_end do
  desc "send emails to bidders following expired auction"
  task send_emails: :environment do
      Item.email_bidders      
      # puts "please working"
  end

end
