class Restaurant
  def initialize(menu)
  @cost=0
  @menu=menu
  @customerorder=Hash.new
  @order
  end


def add_menu 
	input=""
	while input!="y"
    puts "enter menu item"
    item = gets.chomp
    if @menu.has_key?(item)
      puts "item already present"
      puts "enter item new price"
      cost = gets.chomp 
    else    
    puts "enter item price"
    cost = gets.chomp 
    end
    @menu[item]=cost
		puts"enter y if completed entering todays menu"
		input = gets.chomp 
	end
end



def delete_menu
  puts "The menu Item to be deleted :"
  item = gets.chomp 
  if @menu.has_key?(item)
     @menu.delete(item)
  else
     puts "no such item" 
  end     
  puts @menu
end

 def show_menu
 	puts "The menu Items are \n"
 	puts @menu
 end


 def enter_order
    order=Hash.new
    #customerorder=Hash.new
    input=""
    puts "enter customer name :"
      customer = gets.chomp 
    while input!="y"
    	puts "enter menu item"
   		item = gets.chomp 
   		if @menu.has_key?(item)
   	 		puts "enter item quantity"
    		quantity = gets.chomp 
    		order[item] = quantity
   		else
    		puts "item not present"
   		end
  		puts"enter y if order closed"
  		input = gets.chomp 
  	end
    @customerorder[customer]=order
 	  @order=@customerorder
 	  puts @order
  
 end
  

 def bill_amount
  puts "Name of the customer:"
  name = gets.chomp
  if @order.has_key?(name)
 	  puts "item  quantity \n"
   	@order[name].each do |item, quantity|
   	@cost= @cost.to_i + quantity.to_i* @menu[item].to_i
   	puts "#{item}  #{quantity} \n"
    end
    puts "TOTAL COST OF CUSTOMER  is #{@cost}"
  else
    puts "no customer"
  end  
 end
end	

qmenu = Restaurant.new("rice" => 40,"noodles" => 65)
choice=0
while choice!="6"
	puts " 1.Change the menu \n 2. delete item \n 3.Show menu \n 4.Give order for customer \n 5.Print bill \n 6.Exit \n Enter your choice : "
	choice = gets.chomp
	case choice
		when '1'
			qmenu.add_menu
    when '2'
      qmenu.delete_menu  
		when '3'
  			qmenu.show_menu
		when '4'
  			qmenu.enter_order
		when '5'
  			qmenu.bill_amount
 		when '6'
  			puts "Exiting"
  			exit 
	end
end
