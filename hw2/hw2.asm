.data
	EXIT : .asciiz "Exiting...\n"
	NewLine : .asciiz  "\n"
	Size: .asciiz "      size =  "
	Space: .asciiz  " "
	Coma: .asciiz  ","
	LongestText: .asciiz  "\nLongest:  "
	zero: .byte 48
	
	#For File I/O
	fin: .asciiz  "inputs.txt"   	#input file
	fout: .asciiz  "outputs.txt"  	 #output file
	buff: .space 1024			#buffer
	
	#For Input Array
	.align 2
	arr: .space  100 # 25 Integers
		
	#For Output Arrays
	.align 2
	longest: .space  100 # 25 Integers
	.align 2
	temp: .space  100 # 25 Integers

.text
	main:
		lb $s3,Space
		lb $s4,Coma
		lb $s5,zero		
		li $s2,0
		jal FileReadOpen # opens input file
		jal FileWriteOpen #opens output file
	Again:		
		sub $sp, $sp,4
		sw $s2, 0($sp) 
		li $t0,0 #for Array Memory Address
		li $s0,0 #Array Size
		li $s1,0 #Array Index idx
		li $t1,0 # for multiplication
		li $t2,0 
		jal FileRead # reads input file
		
		li $t0,0 #Reset Array Memory Address
		li $t1,0 #for LongestArray Memory Address
		li $t2,0 # LongestArray Size
		li $t3,0 # LongestArray Index
		li $t4,0 #Max Size
		li $t5,0 #temp address
		li $t6,0 # Temp Size
		li $t7,0 # Temp Index	
		jal FindLongestSub #finds longest increasing subsequence
		li  $v0, 4
		la  $a0, LongestText # Prints Text
		syscall
		move $t1 , $zero # Reset Longest Array Address
		jal PrintLongest #prints longest
		
		li $t0,0 #Reset Array Memory Address
		li $s0,0 #Array Size
		lb $s3,Space
		li $t1,0 #for LongestArray Memory Address
		li $t3,0 # LongestArray Index
		li $t4,0 
		li $t5,10 #divider
		li $t6,0 #kalan
		li $t7,0 # bölüm	
		jal CopyBuff # copies to buffer
		jal FileWrite # prints buffer in file
		
		lw $s2, 0($sp) 
		add $sp, $sp,4
		add $s2, $s2,1
		blt $s2,6,Again
		jal FileReadClose # closes input file
		jal FileWriteClose # closes output file
		j Exit # Ends program
		
	
	FileWriteOpen:
		li   $v0, 13       # system call for open file
		la   $a0, fout      # board file name
		li   $a1, 9       # Open for append
		li   $a2, 0		
		syscall            # open a file (file descriptor returned in $v0)
		move $s7, $v0      # save the file descriptor 
		jr $ra
		
	CopyBuff:
		lw $t4,longest($t1)
		add $t1,$t1,4 #next address
		add $t3,$t3,1 # next index
		blt  $t4,$t5,Adder
		
		div $t4, $t5 # dividing by 10
		mfhi $t6 # remainder to $t2 kalan
		mflo $t7 # quotient to $t0 tam
		blt $t7,$t5,less
		div $t7, $t5  # do this if the number has 3 digits
		mfhi $t8 # remainder to $t8 kalan
		mflo $t9 # quotient to $t9 tam
		add $t8,$t8,48 #int to char
		add $t9,$t9,48  #int to char
		sb $t9,buff($t0) # save to buff
		add $t0,$t0,1
		sb $t8,buff($t0) # save to buff
		add $t0,$t0,1
		add $t6,$t6,48 #int to char
		sb $t6,buff($t0) # save to buff
		add $t0,$t0,1
		blt $t3,$t2,CopyBuff
		jr $ra
	less:	
		add $t7,$t7,48 #int to char
		add $t6,$t6,48 #int to char
		sb $t7,buff($t0)# save to buff
		add $t0,$t0,1
		sb $t6,buff($t0)# save to buff
		add $t0,$t0,1
		sb $s3,buff($t0)# save to buff
		add $t0,$t0,1
		blt $t3,$t2,CopyBuff
		jr $ra
	Adder: 
		add $t4,$t4,48 # int to char
		sb $t4,buff($t0)# save to buff
		add $t0,$t0,1
		sb $s3,buff($t0)# save to buff
		add $t0,$t0,1
		blt $t3,$t2,CopyBuff
		jr $ra
	
	FileWrite:	
		li   $v0, 15       # system call for write to file
		move $a0, $s7      # file descriptor 
		la $a1,   LongestText    # address of buffer from which to write
		li   $a2, 11      # hardcoded buffer length
		syscall            # write to file
		
		li   $v0, 15       # system call for write to file
		move $a0, $s7      # file descriptor 
		la $a1,   buff    # address of buffer from which to write
		move   $a2, $t0      # hardcoded buffer length
		syscall            # write to file
		
		li   $v0, 15       # system call for write to file
		move $a0, $s7      # file descriptor 
		la $a1,   Size    # address of buffer from which to write
		li   $a2,14      # hardcoded buffer length
		syscall            # write to file
		
		li   $v0, 15       # system call for write to file
		move $a0, $s7      # file descriptor 
		add $t2,$t2,48
		move $t0,$zero
		sb $t2,buff($t0)
		la $a1,  buff   # address of buffer from which to write
		li   $a2, 1      # hardcoded buffer length
		syscall            # write to file
		jr $ra
		
	FileRead:	
		li   $v0, 14       # system call for read from file
		move $a0, $s6      # file descriptor 
		la   $a1, buff   # address of buffer to which to read
		li   $a2, 1     # hardcoded buffer length
		syscall            # read from file
		lb $t2,buff
		blt  $t2,$s5,Help # if input < 48 do Help 
		mul $t1,$t1,10 	# multiply by 10
		sub  $t2,$t2,48 # char to int
		add $t1,$t1,$t2 
		j FileRead
	
	Help:
		sw $t1,arr($t0)	# save array
		add $t0,$t0,4 #next address
		add $s0,$s0,1 # increase size
		li $t1,0
		beq $t2,$s4,FileRead # if input == ',' do FileRead
		jr $ra
		
	FindLongestSub:
		blt $s1,$s0,CheckArray #  if(array index < array  length)
		bgt $t6,$t2,CopyTempArray #if(temp array size > maxSize)
		j print
	CopyTempArray:
         	move $t4,$t6 #maxSize = temp size;
         	sub $sp, $sp,4  #Reserve Memory Address From Stack
		sw  $ra, 0($sp) 
		li $t3,0 #Reset Longest index
		li $t1,0 #Reset Longest Address
		sub $sp, $sp,4
		sw  $t5, 0($sp)
		li $t5,4 #Reset Temp Address
		move $t2 , $zero #Reset Longest Array Size
		jal CopyToLongest #To Copy Temp Array To Longest Array
		lw $t5, 0($sp)
		add $sp, $sp,4 #Free Memory Address From Stack
		lw  $ra, 0($sp)
		add $sp, $sp,4
	print:
           	sub $sp, $sp,12 #Reserve Memory Address From Stack
		sw  $ra, 0($sp)
		sw  $t5, 4($sp)
		li $t5,4 #Reset Temp Address
		sw  $t7, 8($sp)
		li $t7,0 #Reset Temp index
		jal PrintConsole
		lw  $t7, 8($sp)		
		lw  $t5, 4($sp)
		lw  $ra, 0($sp)
		add $sp, $sp,12 #Free Memory Address From Stack
		jr $ra #return
	CheckArray:
		seq  $s2,$t6,$zero #temp size  == 0
		lw $t8,arr($t0)
		lw $t9,temp($t5)		
		sgt $s3,$t8,$t9 # arr[array index] > temp[tempp size-1]
		or $s2,$s2,$s3  # temp size  == 0 || array[array index] > temp[tempp size-1]
		beqz $s2,Req #if(temp size == 0 ||  array[array index] > temp[tempp size-1])
		add $t5,$t5,4 # temp next address
		sw  $t8,temp($t5) #temp[temp size ]=array[array index]
		add $t6,$t6,1 # temp size+1
		add $t7,$t7,1 # temp index+1
		
		add $s1,$s1,1 # array index+1
		add $t0,$t0,4 # array next address
	
		sub $sp, $sp,4  #Reserve Memory Address From Stack
		sw  $ra, 0($sp)
		jal FindLongestSub #calculateLongest(arr, idx+1, temp);
		lw  $ra, 0($sp)
		add $sp, $sp,4 #Free Memory Address From Stack
		
		sub $t0,$t0,4 # array prev address
		sub $s1,$s1,1 # array prev index
		
		sw $zero,temp($t5) #temp[temp size-1]=0
		sub $t5,$t5,4 #temp prev address
		sub $t6,$t6,1 #temp size-1
		sub $t7,$t7,1 #temp index-1
		
	Req: 
		add $s1,$s1,1 # array index+1
		add $t0,$t0,4 # array next address
		sub $sp, $sp,4  #Reserve Memory Address From Stack
		sw  $ra, 0($sp)
	   	jal FindLongestSub 
	   	lw  $ra, 0($sp)
	   	add $sp, $sp,4 #Free Memory Address From Stack
		sub $t0,$t0,4 # array prev address
		sub $s1,$s1,1 # array prev index
		jr $ra #return
		
	PrintConsole:
		li  $v0, 1
		lw  $a0, temp($t5) #Print Array Element  
		syscall
		add $t5,$t5,4 # Increase Memory Location to Next Element
		li  $v0, 4
		la  $a0, Space #Print Space
		syscall
		add $t7,$t7,1 #increase Array Index
		blt  $t7, $t6, PrintConsole  # If( ArrayIndex < ArraySize)
		#Else
		li  $v0, 4
		la  $a0, Size #Print Size Message
		syscall
		li  $v0, 1
		la  $a0, ($t6) #Print Size 
		syscall
		li  $v0, 4
		la  $a0, NewLine #Print NewLine
		syscall
		jr $ra # Return
	
	PrintLongest:
		li  $v0, 1
		lw  $a0, longest($t1) #Print Array Element  
		syscall
		add $t1,$t1,4 # Increase Memory Location to Next Element
		li  $v0, 4
		la  $a0, Space  #Print Space
		syscall
		add $t3,$t3,1 #increase Array Index
		blt  $t3, $t4, PrintLongest  # If( ArrayIndex < ArraySize)
		#Else
		li  $v0, 4
		la  $a0, Size #Print Size Message
		syscall
		li  $v0, 1
		la  $a0, ($t2) #Print Size 
		syscall
		#Print NewLine
		li  $v0, 4
		la  $a0, NewLine
		syscall
		# Return
		jr $ra		
	CopyToLongest:
		lw $t8,temp($t5)
		sw  $t8,longest($t1)		
		# Increase Memory Location to Next Element
		add $t5,$t5,4
		add $t1,$t1,4
		#increase  Index
		add $t2,$t2,1
		add $t7,$t7,1
		blt $t2,$t6,CopyToLongest # if longest size <= temp size do CopyToLongest
		#Return
		jr $ra
		
	Exit:
		#Print '\n'
		li  $v0, 4
		la  $a0, NewLine
		syscall 
		#Print Exit Message
		li  $v0, 4
		la  $a0, EXIT
		syscall
		#Close Program
		li $v0, 10
		syscall
	FileReadOpen:
		li   $v0, 13       # system call for open file
		la   $a0, fin      # board file name
		li   $a1, 0        # Open for reading
		li   $a2, 0
		syscall            # open a file (file descriptor returned in $v0)
		move $s6, $v0      # save the file descriptor 
		jr $ra
	FileReadClose:
		li   $v0, 16       # system call for close file
		move $a0, $s6      # file descriptor to close
		syscall   
		jr $ra
	FileWriteClose:
		li   $v0, 16       # system call for close file
		move $a0, $s7      # file descriptor to close
		syscall   
		jr $ra	
