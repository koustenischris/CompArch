
// $a0 -> address of first element of array A
// $a1 -> number of elements in the array 
############################################################
BubbleSort: addi $sp,$sp,-16 
            sw $ra,0($sp)
            sw $a0,4($sp)
            sw $a1,8($sp)
            sw $s0,12($sp)
            
            move $s0,$a0
            addi $t0,$zero,-1 #t0 = i = 0
            addi $t1,$a1,-1 # $t1 = N-1
            addi $t2,$zero,1 # bool swapped = true
            OuterLoop:addi $t0,$t0,1 # ++i
                      beq $t2,$zero,ExitBubble # if(!swapped) break;
                      move $t2,$zero # bool swapped = false = 0  
                      slt $t3,$t0,$t1 # i< N-1 ?
                      beq $t3,$zero,ExitBubble # if not Exit
                      move $t3,$zero  # $t3 = j = 0
                      InnerLoop: sll $t4,$t3,2 # j = 4*j
                                 sub $t5,$t1,$t0 # N-i-1      
                                 slt $t5,$t3,$t5 # j < N-i-1 ?
                                 beq $t5,$zero,OuterLoop #if not return to OuterLoop with bigger i
                                 add $t5,$t4,$s0 # address A[j]
                                 move $a0,$t5 # 
                                 addi $t5,$t5,4 # address A[j+1]
                                 move $a1,$t5 #
                                 lw  $t7,0($a0) #A[j]
                                 lw  $t8,0($a1) # A[j+1]
                                 slt  $t6,$t8,$t7 # A[j] > A[j+1]
                                 addi $t3,$t3,1 # ++j 
                                 beq $t6,$zero,InnerLoop #if not repeat Inner loop  for bigger j
                                 jal Swap # else Swap
                                 addi $t2,$zero,1 #swapped = true
                                 j InnerLoop
ExitBubble:  lw $s0,12($sp)
             lw $a1,8($sp)
             lw $a0,4($sp)
             lw $ra,0($sp)
             addi $sp,$sp,16 
             jr $ra
       

#################################################################
CocktailSort: addi $sp,$sp,-16
              sw $ra,0($sp)
              sw $a0,4($sp)
              sw $a1,8($sp)
              sw $s0,12($sp)
              
              move $s0,$a0 # start address of array
              addi $t3,$a1,-1  # end = Ν-1
              addi $t0,$zero,1 # swapped = true
              move $t1,$zero # start = 0
              While: beq $t0,$zero,ExitWhile
                     move $t0,$zero # swapped = false
                     move $t2,$zero # index of first loop i = 0 
                     L1: sll $t4,$t2,2 # i = 4*i
                         slt $t5,$t2,$t3 # i < end ? 
                         beq $t5,$zero,ExitL1 #if not exit L1
                         add $t4,$t4,$s0 # $t4 = start of array + 4*i
                         la $a0,0($t4)    # address A[i]
                         la $a1,4($t4)    # address A[i+1]
                         lw $t6,0($a0)    # A[i]
                         lw $t7,0($a1)    # A[i+1]
                         slt $t4,$t7,$t6  # A[i+1] < A[i] ?
                         addi $t2,$t2,1   # ++i
                         beq $t4,$zero,L1 # if not repeat L1
                         jal Swap         # else Swap  
                         addi $t0,$t0,1   # swapped = true
                         j L1 
              ExitL1:  beq $t0,$zero,ExitWhile  #if(!swapped) break;
                       move $t0,$zero #if not set it false again
                       addi $t3,$t3,-1 # end--  
                       move $t2,$t3 # index of second loop j = end-1    
                     L2: sll $t4,$t2,2 # j = 4*j
                         slt $t5,$t1,$t2 # start < j ?
                         beq $t5,$zero,ExitL2 # if yes then exit L2           
                         addi $t2,$t2,-1 # --j
                         add $t4,$t4,$s0 # $t4 = start of array + 4*j
                         la $a0,0($t4)    # address A[j]
                         la $a1,4($t4)    # address A[j+1]
                         lw $t6,0($a0)   # A[j]
                         lw $t7,0($a1)   # A[j+1]
                         slt $t4,$t7,$t6  # A[j+1] < A[j] ?
                         beq $t4,$zero,L2 # if not repeat L2
                         jal Swap         # else Swap  
                         addi $t0,$t0,1   # swapped = true
                         j L2
               ExitL2: addi $t1,$t1,1
                       j While
ExitWhile: lw $ra,0($sp)
           lw $a0,4($sp)
           lw $a1,8($sp)
           lw $s0,12($sp)
           addi $sp,$sp,16
           jr $ra
########################################################################
InsertionSort:addi $sp,$sp,-4
              sw $ra,0($sp)
              addi $t0,$zero,1 # i
              LooP: sll $t1,$t0,2 # 4*i
                    slt $t2,$t0,$a1 # is i < N?
                    beq $t2,$zero,ExitInsertion #if not Exit
                    add $t1,$t1,$a0 # start of array + 4*i 
                    lw $t3,0($t1) # key 
                    addi $t4,$t0,-1 # j
                    WhilE: slt $t5,$t4,$zero#  is j < 0?
                           bne $t5,$zero,ExitWhilE #if yes exit while
                           sll $t5,$t4,2 # 4*j
                           add $t5,$t5,$a0  
                           lw $t6,0($t5) # A[j]
                           slt $t7,$t3,$t6 # key < A[j]? 
                           beq $t7,$zero,ExitWhilE # if not exit
                           sw $t6,4($t5)
                           addi $t4,$t4,-1 # --j
                           j WhilE
              ExitWhilE: sll $t5,$t4,2
                          add $t5,$t5,$a0
                          sw $t3,4($t5)
                          addi $t0,$t0,1
                          j LooP
ExitInsertion:lw $ra,0($sp)
              addi $sp,$sp,4
              jr $ra
#######################################################################
RecursiveInsertionSort: addi $sp,$sp,-20
                        sw $ra,0($sp)
                        sw $a0,4($sp)
                        sw $a1,8($sp) #
                        sw $s0,12($sp)
	                  sw $s1,16($sp)

                        slti $t0,$a1,1 # 1 > N 
                        bne $t0,$zero,ExitAndRestore
                        #move $s0,$a0 #s0 -> start of array address
                        move $s1,$a1 # s1-> N 

                        addi $a1,$a1,-1 # n-1 
                        jal RecursiveInsertionSort

                        sll $t0,$a1,2 # 4*(N-1)
                        add $t0,$a0,$t0 # A[N-1]
                        lw  $t3,0($t0) # nth
                        addi $t0,$a1,-1 # j = N-2
                        WHILE: slt $t4,$t0,$zero # is j<0?
                               bne $t4,$zero,Exit_2 #if yes then exit While 

                               sll $t4,$t0,2 # 4*j
                               add $t4,$t4,$a0 # start + 4*j = [j]
                               lw $t5,0($t4) # A[j]
                               slt $t6,$t3,$t5 # nth < A[j]?
                               beq $t6,$zero,Exit_2 # if not leave while

                               sw $t5,4($t4)
                               subi $t0,$t0,1
                               j WHILE
                        Exit_2: sll $t4,$t0,2 # 4*j 
                                add $t4,$a0,$t4 # &A[j]
                                sw $t3,4($t4) # nth = A[j+1]      
ExitAndRestore:lw $ra,0($sp)
               lw $a0,4($sp)
               lw $a1,8($sp)
               #lw $0,12($sp)
               lw $s1,16($sp)
               addi $sp,$sp,20
               jr $ra                         


Swap: addi $sp,$sp,-8
      sw $t1, 0($sp)
      sw $t2, 4($sp)
      #pushed to the stack 
      
      #swap
      lw $t1, 0($a0)
      lw $t2, 0($a1)
      sw $t1, 0($a1)
      sw $t2, 0($a0)

      #  all back to normal and pop 
      lw $t2,4($sp)
      lw $t1,0($sp) 
      addi $sp,$sp,8
      jr $ra

