require 'json'
require 'pp'
@m=30
file = File.read('user.json')
#data_hash = JSON.parse(file)
obj = JSON.parse(file)
#puts obj['picture_masters']['user']['age']
if obj.has_key? 'Error'
      raise "web service error"
   end
obj.each do |key, value|
    #puts key
    if key=='picture_masters'
    	value.each do |key2, value2|
    	    if key2.is_a?(Hash)
    	      key2.each do |key3, value3|
    	    	if key3=='user'
    	    	    value3.each do |key4, value4|
    	    		  if key4=='age'
    	    			if (value4.to_i) > @m
    	    				puts value3
    	    			end
    	    		  end
    	    		end
    	    	end
    	      end
    	    end
    	end
    end
end
    
    
