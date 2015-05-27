
order = {'customer1' =>{'rice'=>1,'noodles'=>1},'customer2'=>{'rice'=>3,'noodles'=>2},'customer3'=>{'rice'=>4,'noodles'=>2},'customer4'=>{'rice'=>3,'noodles'=>0}}
menu= Hash["rice" => 40,"noodles" => 65]
@cost=0
@costr=0
@costn=0
 
order.each do |key, value|
  value.each do |key2, value2|
  	if key2=='rice'
     @costr=(value2* menu['rice'])
    else
    @costn=(value2* menu['noodles'])
    end
   end
   @cost = @costn + @costr
   puts "TOTAL COST OF CUSTOMER #{key} is #{@cost}"
end
