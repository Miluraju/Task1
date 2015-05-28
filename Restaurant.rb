class Restaurant
@@menu
@order
@cost
  def initialize(menu)
  @cost=0
  @@menu=menu
  end


  def change_menu 
	menu=Hash.new
	input=""
	while input!="y"
		puts "enter menu item"
		item = gets.chomp 
		puts "enter item price"
		cost = gets.chomp 
		menu[item] = cost
		puts"enter y if completed entering todays menu"
		input = gets.chomp 
	end
	@@menu=menu
  end



 def show_menu
 	puts "The menu Items are \n"
 	puts @@menu
 end


 def enter_order
    order=Hash.new	
    input=""
    while input!="y"
    	puts "enter menu item"
   		item = gets.chomp 
   		if @@menu.has_key?(item)
   	 		puts "enter item quantity"
    		quantity = gets.chomp 
    		order[item] = quantity
   		else
    		puts "item not present"
   		end
  		puts"enter y if order closed"
  		input = gets.chomp 
  	end
 	@order=order
 	puts @order
 end
  

 def bill_amount
 	puts "item  quantity \n"
   	@order.each do |item, quantity|
   	@cost= @cost.to_i + quantity.to_i* @@menu[item].to_i
   	puts "#{item}  #{quantity} \n"
    end
    puts "TOTAL COST OF CUSTOMER  is #{@cost}"
 end
 
end
	

qmenu = Restaurant.new("rice" => 40,"noodles" => 65)
choice=0
while choice!="5"
	puts " 1.Change the menu \n 2.Show menu \n 3.Give order for customer \n 4.Print bill \n 5.Exit \n Enter your choice : "
	choice = gets.chomp
	case choice
		when '1'
			qmenu.change_menu
		when '2'
  			qmenu.show_menu
		when '3'
  			qmenu.enter_order
		when '4'
  			qmenu.bill_amount
 		when '5'
  			puts "Exiting"
  			exit 
		end
end