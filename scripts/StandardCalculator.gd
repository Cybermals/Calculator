extends CanvasLayer


func _ready():
	#Enable event processing
	set_process_input(true)
	
	
func _input(event):
	#Enter key?
	if event.is_action("ui_accept"):
		#Solve the current equation and display the result
	    var equ = get_node("Screen").get_text()
	    var result = solve(equ)
	    get_node("Screen").set_text(str(result))


func _on_0_pressed():
	#Add 0 to the end of the equation
	get_node("Screen").append_at_cursor("0")


func _on_1_pressed():
	#Add 1 to the end of the equation
	get_node("Screen").append_at_cursor("1")


func _on_2_pressed():
	#Add 2 to the end of the equation
	get_node("Screen").append_at_cursor("2")


func _on_3_pressed():
	#Add 3 to the end of the equation
	get_node("Screen").append_at_cursor("3")


func _on_4_pressed():
	#Add 4 to the end of the equation
	get_node("Screen").append_at_cursor("4")


func _on_5_pressed():
	#Add 5 to the end of the equation
	get_node("Screen").append_at_cursor("5")


func _on_6_pressed():
	#Add 6 to the end of the equation
	get_node("Screen").append_at_cursor("6")


func _on_7_pressed():
	#Add 7 to the end of the equation
	get_node("Screen").append_at_cursor("7")


func _on_8_pressed():
	#Add 8 to the end of the equation
	get_node("Screen").append_at_cursor("8")


func _on_9_pressed():
	#Add 9 to the end of the equation
	get_node("Screen").append_at_cursor("9")


func _on_period_pressed():
	#Add . to the end of the equation
	get_node("Screen").append_at_cursor(".")


func _on_add_pressed():
	#Add + to the end of the equation
	get_node("Screen").append_at_cursor("+")


func _on_subtract_pressed():
	#Add - to the end of the equation
	get_node("Screen").append_at_cursor("-")


func _on_multiply_pressed():
	#Add 0 to the end of the equation
	get_node("Screen").append_at_cursor("*")


func _on_divide_pressed():
	#Add / to the end of the equation
	get_node("Screen").append_at_cursor("/")


func _on_solve_pressed():
	#Solve the current equation and display the result
	var equ = get_node("Screen").get_text()
	var result = solve(equ)
	get_node("Screen").set_text(str(result))


func _on_clear_pressed():
	#Clear current equation
	get_node("Screen").set_text("")
	
	
func solve(equ):
	#Note: This is a recursive expression parser function.
	
	#Create an array to hold parts of the equation and an
	#accumulator to hold the result
	var parts
	var accum = 0
	
	#Does the equation contain any subtractions?
	if "-" in equ:
		#Split the equaation at each "-" and solve each part
		parts = equ.split("-")
		accum = solve(parts[0])
		
		for i in range(parts.size() - 1):
			accum -= solve(parts[i + 1])
			
		return accum
		
	#Does the equation contain any additions?
	if "+" in equ:
		#Split the equaation at each "+" and solve each part
		parts = equ.split("+")
		accum = solve(parts[0])
		
		for i in range(parts.size() - 1):
			accum += solve(parts[i + 1])
			
		return accum
		
	#Does the equation contain any divisions?
	if "/" in equ:
		#Split the equaation at each "/" and solve each part
		parts = equ.split("/")
		accum = solve(parts[0])
		
		for i in range(parts.size() - 1):
			accum /= solve(parts[i + 1])
			
		return accum
		
	#Does the equation contain any multiplications?
	if "*" in equ:
		#Split the equaation at each "*" and solve each part
		parts = equ.split("*")
		accum = solve(parts[0])
		
		for i in range(parts.size() - 1):
			accum *= solve(parts[i + 1])
			
		return accum
		
	#If the equation contains no operators, simply parse it
	#as a float.
	return float(equ)
	

