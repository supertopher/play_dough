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

   context "markdown" do
    it "should return proper html for basic markdown" do
      markdown("### Comment Error Handling").should == "<h3>Comment Error Handling</h3>\n"
    end

    it "should return proper html for complex markdown with syntax highlighting from pigment" do
      long_result = "<table class=\"highlighttable\"><tr><td class=\"linenos\"><div class=\"linenodiv\"><pre> 1\n 2\n 3\n 4\n 5\n 6\n 7\n 8\n 9\n10</pre></div></td><td class=\"code\"><div class=\"highlight\"><pre><span class=\"nx\">$</span><span class=\"p\">(</span><span class=\"kd\">function</span><span class=\"p\">(){</span>\n  <span class=\"nx\">$</span><span class=\"p\">(</span><span class=\"s1\">&#39;.comment_submit&#39;</span><span class=\"p\">).</span><span class=\"nx\">click</span><span class=\"p\">(</span><span class=\"kd\">function</span><span class=\"p\">(</span><span class=\"nx\">event</span><span class=\"p\">){</span>\n    <span class=\"k\">if</span> <span class=\"p\">(</span><span class=\"nx\">$</span><span class=\"p\">(</span><span class=\"s1\">&#39;#comment_body&#39;</span><span class=\"p\">).</span><span class=\"nx\">val</span><span class=\"p\">()</span> <span class=\"o\">===</span> <span class=\"s2\">&quot;&quot;</span><span class=\"p\">)</span>\n    <span class=\"p\">{</span>\n      <span class=\"nx\">event</span><span class=\"p\">.</span><span class=\"nx\">preventDefault</span><span class=\"p\">();</span>\n      <span class=\"nx\">$</span><span class=\"p\">(</span><span class=\"s2\">&quot;.new_comment_form&quot;</span><span class=\"p\">).</span><span class=\"nx\">append</span><span class=\"p\">(</span>\n       <span class=\"s2\">&quot;&lt;h3 class=&#39;error&#39;&gt;Please enter a comment.&lt;/h3&gt;&quot;</span><span class=\"p\">)</span>\n    <span class=\"p\">}</span>\n  <span class=\"p\">})</span>\n<span class=\"p\">});</span>\n</pre></div>\n</td></tr></table>\n<h3>Thanks Zee!</h3>\n\n<p><img src=\"https://www.filepicker.io/api/file/jeNGVzQo6QIg0BKTnHpA/convert?w=300&amp;h=300\" alt=\"Sexy Zee\"></p>\n"
      markdown("``` javascript\r\n$(function(){\r\n  $('.comment_submit').click(function(event){\r\n    if ($('#comment_body').val() === \"\")\r\n    {\r\n      event.preventDefault();\r\n      $(\".new_comment_form\").append(\r\n       \"<h3 class='error'>Please enter a comment.</h3>\")\r\n    }\r\n  })\r\n});\r\n```\r\n### Thanks Zee!\r\n![Sexy Zee](https://www.filepicker.io/api/file/jeNGVzQo6QIg0BKTnHpA/convert?w=300&h=300)\r\n\r\n").should == long_result
    end
   end
 end