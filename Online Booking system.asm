.MODEL SMALL
new_line macro c
    MOV DL,c
    MOV AH,2    ;line print
    INT 21H 
    MOV DL,13
    MOV AH,2
    INT 21H 
endm    
   
.STACK 100H

.DATA

; declare variables here 

;payment
;payment
total_seat db "Total seat number of your is: $"
booked_seats_msg db 'Each Ticket Price is 450tk only.$'
total_payment_msg db 'Total amount to pay: $'
choose_payment_msg db 'Choose your payment method:$'
bkash_msg db '1. Bkash$'
rocket_msg db '2. Rocket$'
mobile_banking_msg db '3. Mobile Banking$'
enter_choice_msg db 'Enter your choice: $'
bkash_account_msg db 'Enter your Bkash account number: $'
rocket_account_msg db 'Enter your Rocket account number: $'
mobile_account_msg db 'Enter your Mobile Banking account number: $'
invalid_choice_msg db 'Invalid choice. Try again.$'
payment_success_msg db '*** Payment successful!Thank you for your booking. Have a safe journey ***$'
design1             db '**************************************************************************$'
invalid_account_msg db 'Invalid account number. Try again.$' 

total_payment dw 0 ; Variable to store total payment

bus_pay db "Which Bus Ticket You want to make payment $"

;--------------------------------------------------------
msg_cncl db "Which Bus Ticket You want to Cancel $"
g1      db '-------------------------------------------$' 
go_back db '****   press   5.Go back to main menu  ****$' 
end db     '****   press   6.To Exit               ****$'  
g2      db '-------------------------------------------$' 
M1 DB '        ****Welcome to Our ONLINE TICKET BOOKING SYSTEM****            $'
enter_msg DB ,'Enter your Choise $'  
M2 db "        **********************************************************$" 
M3 DB "        *********            PRESS 1 FOR BUS             *********$"
M4 DB "        *********           PRESS 2 FOR TRAIN            *********$" 
M5 db "        **********************************************************$" 

;bus menu


bus_menu1       DB '****   press   1.Available Buses  ****$'
bus_menu2       DB '****   press   2.Book Seat        ****$'
bus_menu3       DB '****   press   3.Seat Status      ****$'  
bus_menu4       DB '****   press   4.Payment          ****$'
bus_menu5       DB '****   press   5.Cancel seat      ****$'
;bus name
bus1            DB '****           1. GreenLine       ****$'
bus2            DB '****           2. Hanif           ****$'
bus3            DB '****           3. Shyamoli        ****$'
bus4            DB '****           4. Shohagh         ****$' 

select_bus db  'Which Bus Ticket Do You Want to Book (1-4): $'

;seat_status
seat db "Seat No: $"
seat_status_check db "which Bus seat status you wanna check?(1-4): $"

;all Array 
seat_status_GreenLine     Db 6 dup(0,1,2,3,4,5)
seat_status_Hanif     Db 6 dup(0,1,2,3,4,5) 
seat_status_Shyamoli     Db 6 dup(0,1,2,3,4,5) 
seat_status_Shohagh     Db 6 dup(0,1,2,3,4,5)  
  
book_arr_Hanif      db 6 dup(0) 
book_arr_GreenLine      db 6 dup(0)
book_arr_Shyamoli      db 6 dup(0)
book_arr_Shohagh      db 6 dup(0)

;book seat
available_seat db "Availables seat are Below$"  
bookmsg db "Enter Seat No that You want to book: $" 
more_book      db 'Do you want to book another seat? (Y/N): $'   
booked_msg     db 'Seat successfully booked!$'
invalid_msg    db 'Invalid seat number. Try again.$'
already_msg    db 'This seat is already booked. Try another.$'

;cancel part
cancel  db '****   press   5.Go back to main menu   ****$'
your_booking_msg    db 13,10,"Your Booked Seat Numbers:",13,10,"$"
cancel_prompt       db 13,10,"Enter seat number to cancel: $"
cancel_success      db 13,10,"Ticket cancelled successfully!",13,10,"$"
more_cancel         db 13,10,"Do you want to cancel another ticket? (Y/N): $"
not_booked_msg      db 13,10,"This seat is not booked!",13,10,"$"

;train menu


train1          DB '1. Suborno Express$'
train2          DB '2. Mohanagar Provati$'
train3          DB '3. Sonar Bangla$'
train4          DB '4. Turna Nishita$'  
;----------------
train_menu1       DB '****   press   1.Available Train  ****$'
train_menu2       DB '****   press   2.Book Seat        ****$'
train_menu3       DB '****   press   3.Seat Status      ****$'  
train_menu4       DB '****   press   4.Payment          ****$'
train_menu5       DB '****   press   5.Cancel seat      ****$'
;----------------------------------------------------------
select_train db  'Which Train Ticket Do You Want to Book (1-4): $'

;seat_status
seat_train db "Seat No: $"
seat_status_check_train db "which Train seat status you wanna check?(1-4): $"

;all Array 
seat_status_SE     Db 6 dup(0,1,2,3,4,5)
seat_status_MP     Db 6 dup(0,1,2,3,4,5) 
seat_status_SB     Db 6 dup(0,1,2,3,4,5) 
seat_status_TN     Db 6 dup(0,1,2,3,4,5)  
  
book_arr_SE      db 6 dup(0) 
book_arr_MP      db 6 dup(0)
book_arr_SB      db 6 dup(0)
book_arr_TN      db 6 dup(0)



.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
;SHOW WLCM MSG
lea dx,M1
mov ah,9
int 21h 

new_line 10

;ASK FOR ENTER PRESS 1 OR 2

lea dx,M2
mov ah,9
int 21h

new_line 10


lea dx,M3
mov ah,9
int 21h   

new_line 10

lea dx,M4
mov ah,9
int 21h 

new_line 10

lea dx,M5
mov ah,9
int 21h 

new_line 10


; Show "Enter your Choice" message
lea dx, enter_msg
mov ah, 9
int 21h

; Wait for user input
mov ah, 1
int 21h     ; AL now contains the user's choice (e.g., '1' or '2')  
sub al,30h

cmp al,1
je BUS
jmp Train



BUS: 
    menu:
        new_line 10
        lea dx,bus_menu1
        mov ah, 9
        int 21h
        
        new_line 10   
        lea dx, bus_menu2
        mov ah, 9
        int 21h 
         new_line 10   
        lea dx, bus_menu3
        mov ah, 9
        int 21h 
        
        new_line 10   
        lea dx, bus_menu4
        mov ah, 9
        int 21h
        
        new_line 10   
        lea dx, bus_menu5
        mov ah, 9
        int 21h
        new_line 10
        
        lea dx, enter_msg
        mov ah, 9
        int 21h  
        
        
        mov ah,1
        int 21h
        sub al,30h
        
        cmp al,1
        je bus_name
        cmp al,2
        je book_seat
        cmp al,3
        je Seatstatus
        cmp al,4
        je payment
        cmp al,5
        je cancel_booking
        
        bus_name:
        new_line 10
        lea dx, bus1
        mov ah, 9
        int 21h
        
        new_line 10
        lea dx, bus2
        mov ah, 9
        int 21h 
        
        new_line 10
        lea dx, bus3
        mov ah, 9
        int 21h
        
        new_line 10
        lea dx, bus4
        mov ah, 9
        int 21h
        
        ;msg to go main menu or exit
        
        new_line 10 
        new_line 10
        new_line 10
        lea dx, g1
        mov ah, 9
        int 21h  
        new_line 10
        lea dx, go_back
        mov ah, 9
        int 21h
        new_line 10
        lea dx, end
        mov ah, 9
        int 21h 
        new_line 10
        lea dx, g2
        mov ah, 9
        int 21h
              
        ;again user input for exit or go back main menu
        new_line 10  
        lea dx,enter_msg 
        mov ah, 9
        int 21h  
        mov ah,1  
        int 21h 
        sub al,30h  
        
        
        cmp al,5
        je menu
        
        jmp exit 
      ;------------------------------------------------------
    book_seat:
        new_line 10 
        lea dx , select_bus
        mov ah,9
        int 21h 
       
        mov ah,1
        int 21h
        sub al,30h
        mov ah,0
        cmp al,1                                 
        je greenline
        cmp al,2                                 
        je hanif
        cmp al,3                                 
        je Shyamoli
        cmp al,4                              
        je Shohagh 
                                                                        
        greenline:
            new_line 10                                                                       
            lea dx , available_seat
            mov ah,9
            int 21h 
            new_line 10 
        
        show_seats:
            ; Display available seats
            mov cx,6
            mov si,0
        show_loop:
            cmp seat_status_GreenLine[si], 0
            je skip_seat
        
            new_line 10      ;--------------> here print all the availabe seat no
            lea dx,seat ;"Seat No: $"
            mov ah,9
            int 21h
        
            mov al, seat_status_GreenLine[si]
            add al, 30h
            mov dl, al
            mov ah,2
            int 21h
        
        skip_seat:
            inc si
            loop show_loop
        
            ; Max 3 seat booking allowed
            mov cx, 3      ; booking count limit
            xor bx, bx     ; booking counter = 0
        
        booking_loop:
            new_line 10
            lea dx, bookmsg
            mov ah, 9
            int 21h
        
            ; Get user input
            mov ah,1
            int 21h
            sub al,30h       ; convert to number (1..5 )
            mov ah,0
                    
            mov si, ax
        
            ; validate input
            cmp si, 0
            jle invalid_seat
            cmp si, 5
            jg invalid_seat
        
            ; check if already booked
            cmp seat_status_GreenLine[si], 0
            je already_booked
        
            ; mark as booked
            mov seat_status_GreenLine[si], 0
            mov book_arr_GreenLine[si],al
        
            new_line 10
            lea dx, booked_msg
            mov ah, 9
            int 21h
        
            inc bx           ; one booking done
        
            ; check if 3 seats booked
            cmp bx, 3
            je goto_menu
        
            ; ask user for more
            new_line 10
            lea dx , more_book
            mov ah,9
            int 21h
        
            mov ah,1
            int 21h
            cmp al,'Y'
            je booking_loop
            cmp al,'y'
            je booking_loop
        
            jmp goto_menu
        
        invalid_seat:
            new_line 10
            lea dx, invalid_msg
            mov ah, 9
            int 21h
            jmp booking_loop
        
        already_booked:
            new_line 10
            lea dx, already_msg
            mov ah, 9
            int 21h
            jmp booking_loop
        
        goto_menu:
            ;msg to go main menu or exit
            new_line 10 
            new_line 10
            new_line 10
            lea dx, g1
            mov ah, 9
            int 21h  
            new_line 10
            lea dx, cancel
            mov ah, 9
            int 21h
            new_line 10
            lea dx, end
            mov ah, 9
            int 21h 
            new_line 10
            lea dx, g2
            mov ah, 9
            int 21h
                  
            ;again user input for exit or go back main menu
            new_line 10  
            lea dx,enter_msg 
            mov ah, 9
            int 21h  
            mov ah,1  
            int 21h 
            sub al,30h  
            
            cmp al,5
            je menu
            
            jmp exit  
            
         hanif:
            new_line 10 
            lea dx , available_seat
            mov ah,9
            int 21h 
            new_line 10 
        
        show_seats_h:
            ; Display available seats
            mov cx,6
            mov si,0
        show_loop_h:
            cmp seat_status_Hanif[si], 0
            je skip_seat_h
        
            new_line 10      ;--------------> here print all the availabe seat no
            lea dx,seat ;"Seat No: $"
            mov ah,9
            int 21h
        
            mov al, seat_status_Hanif[si]
            add al, 30h
            mov dl, al
            mov ah,2
            int 21h
        
        skip_seat_h:
            inc si
            loop show_loop_h
        
            ; Max 3 seat booking allowed
            mov cx, 3      ; booking count limit
            xor bx, bx     ; booking counter = 0
        
        booking_loop_h:
            new_line 10
            lea dx, bookmsg
            mov ah, 9
            int 21h
        
            ; Get user input
            mov ah,1
            int 21h
            sub al,30h       ; convert to number (1..5 )
            mov ah,0
                    
            mov si, ax
        
            ; validate input
            cmp si, 0
            jl invalid_seat_h
            cmp si, 5
            jg invalid_seat_h
        
            ; check if already booked
            cmp seat_status_Hanif[si], 0
            je already_booked_h
        
            ; mark as booked
            mov book_arr_Hanif[si],al
            mov seat_status_Hanif[si], 0
        
            new_line 10
            lea dx, booked_msg
            mov ah, 9
            int 21h
        
            inc bx           ; one booking done
        
            ; check if 3 seats booked
            cmp bx, 3
            je goto_menu_h
        
            ; ask user for more
            new_line 10
            lea dx , more_book
            mov ah,9
            int 21h
        
            mov ah,1
            int 21h
            cmp al,'Y'
            je booking_loop_h
            cmp al,'y'
            je booking_loop_h
        
            jmp goto_menu_h
        
        invalid_seat_h:
            new_line 10
            lea dx, invalid_msg
            mov ah, 9
            int 21h
            jmp booking_loop_h
        
        already_booked_h:
            new_line 10
            lea dx, already_msg
            mov ah, 9
            int 21h
            jmp booking_loop_h
        
        goto_menu_h:
            ;msg to go main menu or exit
            new_line 10 
            new_line 10
            new_line 10
            lea dx, g1
            mov ah, 9
            int 21h  
            new_line 10
            lea dx, cancel
            mov ah, 9
            int 21h
            new_line 10
            lea dx, end
            mov ah, 9
            int 21h 
            new_line 10
            lea dx, g2
            mov ah, 9
            int 21h
                  
            ;again user input for exit or go back main menu
            new_line 10  
            lea dx,enter_msg 
            mov ah, 9
            int 21h  
            mov ah,1  
            int 21h 
            sub al,30h  
            
            cmp al,5
            je menu
            
            jmp exit 
            
      Shyamoli:
            new_line 10 
            lea dx , available_seat
            mov ah,9
            int 21h 
            new_line 10 
        
        show_seats_s:
            ; Display available seats
            mov cx,6
            mov si,0
        show_loop_s:
            cmp seat_status_Shyamoli[si], 0
            je skip_seat_s
        
            new_line 10      ;--------------> here print all the availabe seat no
            lea dx,seat ;"Seat No: $"
            mov ah,9
            int 21h
        
            mov al, seat_status_Shyamoli[si]
            add al, 30h
            mov dl, al
            mov ah,2
            int 21h
        
        skip_seat_s:
            inc si
            loop show_loop_s
        
            ; Max 3 seat booking allowed
            mov cx, 3      ; booking count limit
            xor bx, bx     ; booking counter = 0
        
        booking_loop_s:
            new_line 10
            lea dx, bookmsg
            mov ah, 9
            int 21h
        
            ; Get user input
            mov ah,1
            int 21h
            sub al,30h       ; convert to number (1..5 )
            mov ah,0
                    
            mov si, ax
        
            ; validate input
            cmp si, 0
            jl invalid_seat_s
            cmp si, 5
            jg invalid_seat_s
        
            
            ; check if already booked
            cmp seat_status_Shyamoli[si], 0
            je already_booked_s
        
            ; mark as booked
            mov book_arr_Shyamoli[si], al
            mov seat_status_Shyamoli[si], 0
        
            new_line 10
            lea dx, booked_msg
            mov ah, 9
            int 21h
        
            inc bx           ; one booking done
        
            ; check if 3 seats booked
            cmp bx, 3
            je goto_menu_s
        
            ; ask user for more
            new_line 10
            lea dx , more_book
            mov ah,9
            int 21h
        
            mov ah,1
            int 21h
            cmp al,'Y'
            je booking_loop_s
            cmp al,'y'
            je booking_loop_s
        
            jmp goto_menu_s
        
        invalid_seat_s:
            new_line 10
            lea dx, invalid_msg
            mov ah, 9
            int 21h
            jmp booking_loop_s
        
        already_booked_s:
            new_line 10
            lea dx, already_msg
            mov ah, 9
            int 21h
            jmp booking_loop_s
        
        ;cancel:
;            new_line 10
;            lea dx,cancel
;            mov ah,
        
        goto_menu_s:
            ;msg to go main menu or exit
            new_line 10 
            new_line 10
            new_line 10
            lea dx, g1
            mov ah, 9
            int 21h  
            new_line 10
            lea dx, cancel
            mov ah, 9
            int 21h
            new_line 10
            lea dx, end
            mov ah, 9
            int 21h 
            new_line 10
            lea dx, g2
            mov ah, 9
            int 21h
                  
            ;again user input for exit or go back main menu
            new_line 10  
            lea dx,enter_msg 
            mov ah, 9
            int 21h  
            mov ah,1  
            int 21h 
            sub al,30h  
            
            cmp al,5
            je menu
            
            jmp exit 
            
        Shohagh  :
            new_line 10 
            lea dx , available_seat
            mov ah,9
            int 21h 
            new_line 10 
        
        show_seats_sh:
            ; Display available seats
            mov cx,6
            mov si,0
        show_loop_sh:
            cmp seat_status_Shohagh[si], 0
            je skip_seat_s
        
            new_line 10      ;--------------> here print all the availabe seat no
            lea dx,seat ;"Seat No: $"
            mov ah,9
            int 21h
        
            mov al, seat_status_Shohagh[si]
            add al, 30h
            mov dl, al
            mov ah,2
            int 21h
        
        skip_seat_sh:
            inc si
            loop show_loop_sh
        
            ; Max 3 seat booking allowed
            mov cx, 3      ; booking count limit
            xor bx, bx     ; booking counter = 0
        
        booking_loop_sh:
            new_line 10
            lea dx, bookmsg
            mov ah, 9
            int 21h
        
            ; Get user input
            mov ah,1
            int 21h
            sub al,30h       ; convert to number (1..5 )
            mov ah,0
                    
            mov si, ax
        
            ; validate input
            cmp si, 0
            jl invalid_seat_sh
            cmp si, 5
            jg invalid_seat_sh
        
            ; check if already booked
            cmp seat_status_Shohagh[si], 0
            je already_booked_sh
        
            ; mark as booked
            mov book_arr_Shohagh[si], al
            mov seat_status_Shohagh[si], 0
        
            new_line 10
            lea dx, booked_msg
            mov ah, 9
            int 21h
        
            inc bx           ; one booking done
        
            ; check if 3 seats booked
            cmp bx, 3
            je goto_menu_sh
        
            ; ask user for more
            new_line 10
            lea dx , more_book
            mov ah,9
            int 21h
        
            mov ah,1
            int 21h
            cmp al,'Y'
            je booking_loop_sh
            cmp al,'y'
            je booking_loop_sh
        
            jmp goto_menu_sh
        
        invalid_seat_sh:
            new_line 10
            lea dx, invalid_msg
            mov ah, 9
            int 21h
            jmp booking_loop_sh
        
        already_booked_sh:
            new_line 10
            lea dx, already_msg
            mov ah, 9
            int 21h
            jmp booking_loop_sh
        
        goto_menu_sh:
            ;msg to go main menu or exit
            new_line 10 
            new_line 10
            new_line 10
            lea dx, g1
            mov ah, 9
            int 21h  
            new_line 10
            lea dx, cancel
            mov ah, 9
            int 21h
            new_line 10
            lea dx, end
            mov ah, 9
            int 21h 
            new_line 10
            lea dx, g2
            mov ah, 9
            int 21h
                  
            ;again user input for exit or go back main menu
            new_line 10  
            lea dx,enter_msg 
            mov ah, 9
            int 21h  
            mov ah,1  
            int 21h 
            sub al,30h  
            
            cmp al,5
            je menu
            
            jmp exit 
          


        Seatstatus: ; feature of seat status 

         
       
        
        payment:;----------------------------------------------------- 
                       new_line 10
                        lea dx,bus_pay
                         mov ah,9
                         int 21h
                        new_line 10
                        lea dx, bus1
                        mov ah, 9
                        int 21h
                        
                        new_line 10
                        lea dx, bus2
                        mov ah, 9
                        int 21h 
                        
                        new_line 10
                        lea dx, bus3
                        mov ah, 9
                        int 21h
                        
                        new_line 10
                        lea dx, bus4
                        mov ah, 9
                        int 21h 
                        
                        new_line 10
                        
                        lea dx, enter_msg
                        mov ah, 9
                        int 21h 
                        
                        mov ah,1
                        int 21h
                        sub al,30h        ;user input
                        
                        cmp al,1
                        je Greenline_payment 
                        
                        cmp al,3
                        je Shyamoli_payment
                        
            ;---------------------------------------------------------------------------------------------            
                
                Greenline_payment:
                    
                ; Display the total seats booked
                new_line 10
                lea dx, booked_seats_msg
                mov ah, 9
                int 21h 
                
                new_line 10
                lea dx,total_seat  ; msg each ticket price
                mov ah,9
                int 21h 
            
                ; Calculate total payment
                mov cx, 0          ; Initialize seat count
                mov si, 0          ; Start from the first seat
                mov bx, 450        ; Per seat price
            
                ; Count booked seats for GreenLine
            count_seats:
                cmp si, 6          ; Check if all seats are processed
                je calculate_total
                cmp book_arr_GreenLine[si], 0
                je skip_count
                inc cx             ; Increment seat count if booked
            skip_count:
                inc si
                jmp count_seats
            
            calculate_total:
                mov ax, cx         ; Move seat count to AX
                mul bx             ; Multiply by 450 (per seat price)
                mov total_payment, ax ; Store total payment
                
                new_line 10
                add cx,30h
                mov dx,cx ; print total seat number
                mov ah,2
                int 21h
                ; Display total payment
                new_line 10
                lea dx, total_payment_msg
                mov ah, 9
                int 21h
                mov ax, total_payment
                call print_number   ; Print the total payment amount
            
                ; Display payment method options
                new_line 10
                lea dx, choose_payment_msg
                mov ah, 9
                int 21h
                new_line 10
                lea dx, bkash_msg
                mov ah, 9
                int 21h
                new_line 10
                lea dx, rocket_msg
                mov ah, 9
                int 21h
                new_line 10
                lea dx, mobile_banking_msg
                mov ah, 9
                int 21h
            
                ; Get user choice
                new_line 10
                lea dx, enter_choice_msg
                mov ah, 9
                int 21h
                mov ah, 1
                int 21h
                sub al, 30h         ; Convert ASCII to number
                cmp al, 1
                je bkash_payment
                cmp al, 2
                je rocket_payment
                cmp al, 3
                je mobile_banking_payment
                jmp invalid_payment
            
            bkash_payment:
                ; Process Bkash payment
                new_line 10
                lea dx, bkash_account_msg
                mov ah, 9
                int 21h
                call get_account_number
                jmp payment_success
            
            rocket_payment:
                ; Process Rocket payment
                new_line 10
                lea dx, rocket_account_msg
                mov ah, 9
                int 21h
                call get_account_number
                jmp payment_success
            
            mobile_banking_payment:
                ; Process Mobile Banking payment
                new_line 10
                lea dx, mobile_account_msg
                mov ah, 9
                int 21h
                call get_account_number
                jmp payment_success
            
            invalid_payment:
                ; Handle invalid payment choice
                new_line 10
                lea dx, invalid_choice_msg
                mov ah, 9
                int 21h
                jmp payment
            
            payment_success:
                ; Display payment success message
                new_line 10
                lea dx, design1
                mov ah,9
                int 21h
                
                new_line 10
                
                lea dx, payment_success_msg
                mov ah, 9
                int 21h 
                
                new_line 10
                lea dx, design1
                mov ah,9
                int 21h
                
                jmp exit
            
            get_account_number:
                ; Get and validate account number
                mov cx, 11          ; Account number length
                mov si, 0
            get_account_loop:
                mov ah, 1
                int 21h
                sub al, 30h         ; Convert ASCII to number
                cmp al, 0
                jl invalid_account
                cmp al, 9
                jg invalid_account
                inc si
                loop get_account_loop
                ret
            
            invalid_account:
                ; Handle invalid account number
                new_line 10
                lea dx, invalid_account_msg
                mov ah, 9
                int 21h
                jmp get_account_number
                
                
                ;----------------------------------------------------
             Shyamoli_payment:
                ; Display the total seats booked
                new_line 10
                lea dx, booked_seats_msg
                mov ah, 9
                int 21h
                new_line 10
                
                lea dx,total_seat
                mov ah,9            ;msg each ticket price
                int 21h 
                
                ; Calculate total payment
                mov cx, 0          ; Initialize seat count
                mov si, 0          ; Start from the first seat
                mov bx, 450        ; Per seat price
            
                ; Count booked seats for Shyamoli
            count_seats_s:
                cmp si, 6          ; Check if all seats are processed
                je calculate_total_s
                cmp book_arr_Shyamoli[si], 0
                je skip_count_s
                inc cx             ; Increment seat count if booked
            skip_count_s:
                inc si
                jmp count_seats_s
            
            calculate_total_s:
                mov ax, cx         ; Move seat count to AX
                mul bx             ; Multiply by 450 (per seat price)
                mov total_payment, ax ; Store total payment
                
                 new_line 10
                add cx,30h
                mov dx,cx     ; print total seat number
                mov ah,2
                int 21h
                ; Display total payment
                new_line 10
                lea dx, total_payment_msg
                mov ah, 9
                int 21h
                mov ax, total_payment
                call print_number   ; Print the total payment amount
            
                ; Display payment method options
                new_line 10
                lea dx, choose_payment_msg
                mov ah, 9
                int 21h
                new_line 10
                lea dx, bkash_msg
                mov ah, 9
                int 21h
                new_line 10
                lea dx, rocket_msg
                mov ah, 9
                int 21h
                new_line 10
                lea dx, mobile_banking_msg
                mov ah, 9
                int 21h
            
                ; Get user choice
                new_line 10
                lea dx, enter_choice_msg
                mov ah, 9
                int 21h
                mov ah, 1
                int 21h
                sub al, 30h         ; Convert ASCII to number
                cmp al, 1
                je bkash_payment_s
                cmp al, 2
                je rocket_payment_s
                cmp al, 3
                je mobile_banking_payment_s
                jmp invalid_payment_s
            
            bkash_payment_s:
                ; Process Bkash payment
                new_line 10
                lea dx, bkash_account_msg
                mov ah, 9
                int 21h
                call get_account_number
                jmp payment_success_s
            
            rocket_payment_s:
                ; Process Rocket payment
                new_line 10
                lea dx, rocket_account_msg
                mov ah, 9
                int 21h
                call get_account_number
                jmp payment_success_s
            
            mobile_banking_payment_s:
                ; Process Mobile Banking payment
                new_line 10
                lea dx, mobile_account_msg
                mov ah, 9
                int 21h
                call get_account_number
                jmp payment_success_s
            
            invalid_payment_s:
                ; Handle invalid payment choice
                new_line 10
                lea dx, invalid_choice_msg
                mov ah, 9
                int 21h
                jmp Shyamoli_payment
            
            payment_success_s:
                ; Display payment success message
                new_line 10
                lea dx, design1
                mov ah, 9
                int 21h
            
                new_line 10
            
                lea dx, payment_success_msg
                mov ah, 9
                int 21h
            
                new_line 10
                lea dx, design1
                mov ah, 9
                int 21h
            
                jmp exit
                        
  
            print_number:
                ; Print AX as a decimal number
                push ax
                push bx
                push cx
                push dx
            
                xor cx, cx
            print_loop:
                mov dx, 0
                mov bx, 10
                div bx
                push dx
                inc cx
                test ax, ax
                jnz print_loop
            
            print_digits:
                pop dx
                add dl, '0'
                mov ah, 2
                int 21h
                loop print_digits
            
                pop dx
                pop cx
                pop bx
                pop ax
                ret
 
          ;--------------------------------------------------------------------------
        cancel_booking:
             new_line 10
             lea dx,msg_cncl
             mov ah,9
             int 21h
          
            new_line 10
            lea dx, bus1
            mov ah, 9
            int 21h
            
            new_line 10
            lea dx, bus2
            mov ah, 9
            int 21h 
            
            new_line 10
            lea dx, bus3
            mov ah, 9
            int 21h
            
            new_line 10
            lea dx, bus4
            mov ah, 9
            int 21h 
            
            new_line 10
            
            lea dx, enter_msg
            mov ah, 9
            int 21h
            
            mov ah,1
            int 21h
            sub al,30h
            mov bl,al
            new_line 10
            
            cmp bl,1
            je cancel_ticket_GreenLine
            cmp bl,2
            je cancel_ticket_Hanif
            cmp bl,3
            je cancel_ticket_Shyamoli
            cmp bl,4
            je cancel_ticket_Shohagh 
             
         
             cancel_ticket_Shyamoli: ;------------------
                mov cx, 6
                mov si,0
                
             show_booked_seats_loop3:
                cmp book_arr_Shyamoli[si], 0
                je skip_booked_seat3
            
                new_line 10
                lea dx, seat ; "Seat No: $"
                mov ah, 9
                int 21h
            
                mov al, book_arr_Shyamoli[si]       ; <-- this is the fix
                add al, 30h
                mov dl, al
                mov ah, 2
                int 21h
            
        skip_booked_seat3:
                inc si
                loop show_booked_seats_loop3
                    
        cancel_loop3:
            new_line 10
            lea dx, cancel_prompt ; "Enter seat no to cancel: $"
            mov ah, 9
            int 21h
        
            mov ah, 1
            int 21h
            sub al, 30h
            mov ah, 0
            mov si, ax
        
            ; Validate seat range
            cmp si, 0
            jl invalid_cancel3
            cmp si, 5
            jg invalid_cancel3
        
            ; Check if seat was booked
            cmp book_arr_Shyamoli[si], 0
            je not_booked3
        
            ; Cancel booking
            mov book_arr_Shyamoli[si], 0
            
            mov seat_status_Shyamoli[si], al
        
            new_line 10
            lea dx, cancel_success
            mov ah, 9
            int 21h
        
            ; Ask if user wants to cancel more
            new_line 10
            lea dx, more_cancel
            mov ah, 9
            int 21h
        
            mov ah, 1
            int 21h
            cmp al, 'Y'
            je cancel_loop3
            cmp al, 'y'
            je cancel_loop3
        
            jmp for_main_menu3
        
        invalid_cancel3:
            new_line 10
            lea dx, invalid_msg
            mov ah, 9
            int 21h
            jmp cancel_loop3
        
        not_booked3:
            new_line 10
            lea dx, not_booked_msg
            mov ah, 9
            int 21h
            jmp cancel_loop3
        
        ;msg to go main menu or exit
        for_main_menu3:
        
        new_line 10 
        new_line 10
        new_line 10
        lea dx, g1
        mov ah, 9
        int 21h  
        new_line 10
        lea dx, go_back
        mov ah, 9
        int 21h
        new_line 10
        lea dx, end
        mov ah, 9
        int 21h 
        new_line 10
        lea dx, g2
        mov ah, 9
        int 21h
              
        ;again user input for exit or go back main menu
        new_line 10  
        lea dx,enter_msg 
        mov ah, 9
        int 21h  
        mov ah,1  
        int 21h 
        sub al,30h  
        
        
        cmp al,5
        je menu
        
        jmp exit 
                
        cancel_ticket_GreenLine:
        
            mov cx, 6
                mov si,0
                
             show_booked_seats_loop1:
                cmp book_arr_GreenLine[si], 0
                je skip_booked_seat1
            
                new_line 10
                lea dx, seat ; "Seat No: $"
                mov ah, 9
                int 21h
            
                mov al, book_arr_GreenLine[si]       ; <-- this is the fix
                add al, 30h
                mov dl, al
                mov ah, 2
                int 21h
            
        skip_booked_seat1:
                inc si
                loop show_booked_seats_loop1
                    
        cancel_loop1:
            new_line 10
            lea dx, cancel_prompt ; "Enter seat no to cancel: $"
            mov ah, 9
            int 21h
        
            mov ah, 1
            int 21h
            sub al, 30h
            mov ah, 0
            mov si, ax
        
            ; Validate seat range
            cmp si, 0
            jl invalid_cancel1
            cmp si, 5
            jg invalid_cancel1
        
            ; Check if seat was booked
            cmp book_arr_GreenLine[si], 0
            je not_booked1
        
            ; Cancel booking
            mov book_arr_GreenLine[si], 0
            
            mov seat_status_GreenLine[si], al
        
            new_line 10
            lea dx, cancel_success
            mov ah, 9
            int 21h
        
            ; Ask if user wants to cancel more
            new_line 10
            lea dx, more_cancel
            mov ah, 9
            int 21h
        
            mov ah, 1
            int 21h
            cmp al, 'Y'
            je cancel_loop1
            cmp al, 'y'
            je cancel_loop1
        
            jmp for_main_menu1
        
        invalid_cancel1:
            new_line 10
            lea dx, invalid_msg
            mov ah, 9
            int 21h
            jmp cancel_loop1
        
        not_booked1:
            new_line 10
            lea dx, not_booked_msg
            mov ah, 9
            int 21h
            jmp cancel_loop1
        
        ;msg to go main menu or exit
        for_main_menu1:
        
        new_line 10 
        new_line 10
        new_line 10
        lea dx, g1
        mov ah, 9
        int 21h  
        new_line 10
        lea dx, go_back
        mov ah, 9
        int 21h
        new_line 10
        lea dx, end
        mov ah, 9
        int 21h 
        new_line 10
        lea dx, g2
        mov ah, 9
        int 21h
              
        ;again user input for exit or go back main menu
        new_line 10  
        lea dx,enter_msg 
        mov ah, 9
        int 21h  
        mov ah,1  
        int 21h 
        sub al,30h  
        
        
        cmp al,5
        je menu
        
        jmp exit 
        
        
        cancel_ticket_Hanif:
        cancel_ticket_Shohagh:
        

;===========================================================================
       train:
       
        menu_t:
        
        new_line 10
        lea dx,train_menu1
        mov ah, 9
        int 21h
        
        new_line 10   
        lea dx, train_menu2
        mov ah, 9
        int 21h 
         new_line 10   
        lea dx, train_menu3
        mov ah, 9
        int 21h 
        
        new_line 10   
        lea dx, train_menu4
        mov ah, 9
        int 21h
        
        new_line 10   
        lea dx, train_menu5
        mov ah, 9
        int 21h
        new_line 10
        lea dx, enter_msg
        mov ah, 9
        int 21h  
        
        
        mov ah,1
        int 21h
        sub al,30h
        
        cmp al,1
        je train_name
        cmp al,2
        je book_seat_train
        cmp al,3
        je Seatstatus_train
        cmp al,4
        je payment_train
        cmp al,5
        je cancel_booking_train
        
        train_name:
        new_line 10
        lea dx, train1
        mov ah, 9
        int 21h
        
        new_line 10
        lea dx, train2
        mov ah, 9
        int 21h 
        
        new_line 10
        lea dx, train3
        mov ah, 9
        int 21h
        
        new_line 10
        lea dx, train4
        mov ah, 9
        int 21h
        
        ;msg to go main menu or exit
        
        new_line 10 
        new_line 10
        new_line 10
        lea dx, g1
        mov ah, 9
        int 21h  
        new_line 10
        lea dx, go_back
        mov ah, 9
        int 21h
        new_line 10
        lea dx, end
        mov ah, 9
        int 21h 
        new_line 10
        lea dx, g2
        mov ah, 9
        int 21h
              
        ;again user input for exit or go back main menu
        new_line 10  
        lea dx,enter_msg 
        mov ah, 9
        int 21h  
        mov ah,1  
        int 21h 
        sub al,30h  
        
        
        cmp al,5
        je menu_t
        
        jmp exit
        
        ;---------------------------
        book_seat_train:
            
            new_line 10 
            lea dx , select_bus
            mov ah,9
            int 21h 
           
            mov ah,1
            int 21h
            sub al,30h
            mov ah,0
            cmp al,1                                 
            je SE
            cmp al,2                                 
            je MP
            
            SE:
            new_line 10                                                                       
            lea dx , available_seat
            mov ah,9
            int 21h 
            new_line 10 
        
        show_seats_se:
            ; Display available seats
            mov cx,6
            mov si,0
        show_loop_se:
            cmp seat_status_SE[si], 0
            je skip_seat_se
        
            new_line 10      ;--------------> here print all the availabe seat no
            lea dx,seat ;"Seat No: $"
            mov ah,9
            int 21h
        
            mov al,seat_status_SE[si]
            add al,30h
            mov dl,al
            mov ah,2
            int 21h
        
        skip_seat_se:
            inc si
            loop show_loop_se
        
            ; Max 3 seat booking allowed
            mov cx, 3      ; booking count limit
            xor bx, bx     ; booking counter = 0
        
        booking_loop_se:
            new_line 10
            lea dx, bookmsg
            mov ah, 9
            int 21h
        
            ; Get user input
            mov ah,1
            int 21h
            sub al,30h       ; convert to number (1..5 )
            mov ah,0
                    
            mov si, ax
        
            ; validate input
            cmp si, 0
            jle invalid_seat_se
            cmp si, 5
            jg invalid_seat_se
        
            ; check if already booked
            cmp seat_status_SE[si], 0
            je already_booked_se
        
            ; mark as booked
            mov seat_status_SE[si], 0
            mov book_arr_SE[si],al
        
            new_line 10
            lea dx, booked_msg
            mov ah, 9
            int 21h
        
            inc bx           ; one booking done
        
            ; check if 3 seats booked
            cmp bx, 3
            je goto_menu_t
        
            ; ask user for more
            new_line 10
            lea dx , more_book
            mov ah,9
            int 21h
        
            mov ah,1
            int 21h
            cmp al,'Y'
            je booking_loop_se
            cmp al,'y'
            je booking_loop_se
        
            jmp goto_menu_t
        
        invalid_seat_se:
            new_line 10
            lea dx, invalid_msg
            mov ah, 9
            int 21h
            jmp booking_loop_se
        
        already_booked_se:
            new_line 10
            lea dx, already_msg
            mov ah, 9
            int 21h
            jmp booking_loop_se
        
        goto_menu_t:
            ;msg to go main menu or exit
            new_line 10 
            new_line 10
            new_line 10
            lea dx, g1
            mov ah, 9
            int 21h  
            new_line 10
            lea dx, cancel
            mov ah, 9
            int 21h
            new_line 10
            lea dx, end
            mov ah, 9
            int 21h 
            new_line 10
            lea dx, g2
            mov ah, 9
            int 21h
                  
            ;again user input for exit or go back main menu
            new_line 10  
            lea dx,enter_msg 
            mov ah, 9
            int 21h  
            mov ah,1  
            int 21h 
            sub al,30h  
            
            cmp al,5
            je menu_t
            
            jmp exit  
            
            mp:
            
            
         
        
        Seatstatus_train:
        
        payment_train:       
        
        cancel_booking_train:
        
        
        
exit:
    mov ah, 4ch
    int 21h