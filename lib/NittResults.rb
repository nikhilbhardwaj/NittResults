require "NittResults/version"
require 'selenium-webdriver'

module NittResults
    def fetch_results(start_rollno,end_rollno)
        #fetch the results page
        browser = Selenium::WebDriver.for :firefox
        browser.get("http://www.nitt.edu/prm/nitreg/ShowRes.aspx")

        #loop over the given roll numbers
        (start_rollno..end_rollno).each do |rollno|
            #fill in the roll no and click the button
            element = browser.find_element(:name => 'TextBox1')
            element.clear
            button = browser.find_element(:id => "Button1")
            element.send_keys(rollno)
            # Fixed the selection thing that exists for even semester results
            button.click
	    valid_roll_no = browser.find_elements(:id,"Dt1").size
	    if valid_roll_no > 0
	      select = browser.find_element(:id,"Dt1")
	      select.find_elements(:tag_name, "option").each do |option|
	        option.click if option.text == "NOV-2012 (REGULAR EXAM)"
	      end
	    end
            #get the data and store it in the database
            #i'm storing in a text files for now
            rows = browser.find_elements(:css => ".DataGridItem, .DataGridAlternatingItem")

            #writing stuff to the file
            #TODO : Parse and write to the database instead
            if !rows.empty?
                student_name = browser.find_element(:id => "LblName").text
                gpa = browser.find_element(:id => "LblGPA").text
                File.open(rollno.to_s,'w') do |f|
                    f.puts(student_name)
                    rows.each { |r| f.puts(r.text) }
                    f.puts("GPA : #{gpa}")
                end
            end
        end

        #cleanup
        browser.quit
    end
end
