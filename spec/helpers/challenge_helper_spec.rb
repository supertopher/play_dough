 describe ChallengesHelper do
   context "day_of_week_name" do

     it "should return Monday for 1" do
       day_of_week_name(1).should == "Monday"
     end
          it "should return Tuesday for 2" do
       day_of_week_name(2).should == "Tuesday"
     end
          it "should return Wednesday for 3" do
       day_of_week_name(3).should == "Wednesday"
     end
          it "should return Thursday for 4" do
       day_of_week_name(4).should == "Thursday"
     end
          it "should return Friday for 5" do
       day_of_week_name(5).should == "Friday"
     end
          it "should return Saturday for 6" do
       day_of_week_name(6).should == "Saturday"
     end
     it "should return Sunday for 7" do
       day_of_week_name(7).should == "Sunday"
     end

   end
 end