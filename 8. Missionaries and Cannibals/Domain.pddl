(define (domain missionaries_cannibals_domain)
    (:requirements :strips :negative-preconditions :fluents :adl)
    (:predicates
        (stayed ?x ?side)           ; x stayed at side 1 or side 2
        (boat ?side)                ; boat is in side 1 or side 2 
        (missionary ?x)             ; x is a missionary              
        (cannibal ?x)               ; x is a cannibal
        (is_side1 ?x)
        (is_side2 ?x)
        
        (value3 ?x)
        (value2 ?x)
        (value1 ?x)
        (value0 ?x)

        (transfer ?x ?y)
    )

    
    (:action move_two_miss_s1_to_s2_m31
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (missionary ?x)
                        (missionary ?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value3 ?missionaries_in_side1)
                        (value1 ?cannibals_in_side1)
                        (transfer ?x ?y)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to)
                        (not (value3 ?missionaries_in_side1)) 
                        (value1 ?missionaries_in_side1)
                       
        )
    )

    (:action move_two_miss_s1_to_s2_m22
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (missionary ?x)
                        (missionary ?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value2 ?missionaries_in_side1)
                        (value2 ?cannibals_in_side1)
                        (transfer ?x ?y)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to)
                        (not (value2 ?missionaries_in_side1)) 
                        (value0 ?missionaries_in_side1)
                       
        )
    )

    (:action move_two_miss_s2_to_s1_m01
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (missionary ?x)
                        (missionary ?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value0 ?missionaries_in_side1)    
                        (value1 ?cannibals_in_side1) 
                        (transfer ?x ?y)

        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value0 ?missionaries_in_side1) )
                        (value2 ?missionaries_in_side1) 
        )
    )

    (:action move_two_miss_s2_to_s1_m02
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (missionary ?x)
                        (missionary ?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value0 ?missionaries_in_side1)    
                        (value2 ?cannibals_in_side1)  
                        (transfer ?x ?y) 

        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value0 ?missionaries_in_side1) )
                        (value2 ?missionaries_in_side1) 
        )
    )

     (:action move_two_miss_s2_to_s1_m11
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (missionary ?x)
                        (missionary ?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value1 ?missionaries_in_side1)    
                        (value1 ?cannibals_in_side1)
                        (transfer ?x ?y)  

        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value1 ?missionaries_in_side1) )
                        (value3 ?missionaries_in_side1) 
        )
    )
     
    (:action move_two_cann_s1_to_s2_c33
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (cannibal ?x)
                        (cannibal?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value3 ?missionaries_in_side1)
                        (value3 ?cannibals_in_side1)
                        (transfer ?x ?y)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value3 ?cannibals_in_side1))
                        (value1 ?cannibals_in_side1)
        )
    )

    (:action move_two_cann_s1_to_s2_c32
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (cannibal ?x)
                        (cannibal?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value3 ?missionaries_in_side1)
                        (value2 ?cannibals_in_side1)
                        (transfer ?x ?y)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value2 ?cannibals_in_side1))
                        (value0 ?cannibals_in_side1)
        )
    )

    (:action move_two_cann_s1_to_s2_c03
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (cannibal ?x)
                        (cannibal?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value0 ?missionaries_in_side1)
                        (value3 ?cannibals_in_side1)
                        (transfer ?x ?y)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value3 ?cannibals_in_side1))
                        (value1 ?cannibals_in_side1)
        )
    )

    (:action move_two_cann_s1_to_s2_c02
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (cannibal ?x)
                        (cannibal?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value0 ?missionaries_in_side1)
                        (value2 ?cannibals_in_side1)
                        (transfer ?x ?y)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value2 ?cannibals_in_side1))
                        (value0 ?cannibals_in_side1)
        )
    )

    (:action move_two_cann_s2_to_s1_cc30
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (cannibal ?x)
                        (cannibal ?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value3 ?missionaries_in_side1)
                        (value0 ?cannibals_in_side1)
                        (transfer ?x ?y)
                       
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value0 ?cannibals_in_side1))
                        (value2 ?cannibals_in_side1)
        )
    )

    (:action move_two_cann_s2_to_s1_cc31
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (cannibal ?x)
                        (cannibal ?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value3 ?missionaries_in_side1)
                        (value1 ?cannibals_in_side1)
                        (transfer ?x ?y)
                       
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value1 ?cannibals_in_side1))
                        (value3 ?cannibals_in_side1)
        )
    )

    (:action move_two_cann_s2_to_s1_cc00
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (cannibal ?x)
                        (cannibal ?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value0 ?missionaries_in_side1)
                        (value0 ?cannibals_in_side1)
                        (transfer ?x ?y)
                       
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value0 ?cannibals_in_side1))
                        (value2 ?cannibals_in_side1)
        )
    )

    (:action move_two_cann_s2_to_s1_cc01
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (cannibal ?x)
                        (cannibal ?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value0 ?missionaries_in_side1)
                        (value1 ?cannibals_in_side1)
                        (transfer ?x ?y)
                       
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value1 ?cannibals_in_side1))
                        (value3 ?cannibals_in_side1)
        )
    )

    (:action move_one_miss_one_cann_s1_to_s2_mc11
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (missionary ?x)
                        (cannibal ?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value1 ?missionaries_in_side1)
                        (value1 ?cannibals_in_side1)             
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value1 ?missionaries_in_side1))
                        (value0 ?missionaries_in_side1)
                        (not (value1 ?cannibals_in_side1) )
                        (value0 ?cannibals_in_side1)   
        )
    )

    (:action move_one_miss_one_cann_s1_to_s2_mc22
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (missionary ?x)
                        (cannibal ?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value2 ?missionaries_in_side1)
                        (value2 ?cannibals_in_side1)             
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value2 ?missionaries_in_side1))
                        (value1 ?missionaries_in_side1)
                        (not (value2 ?cannibals_in_side1) )
                        (value1 ?cannibals_in_side1)   
        )
    )

    (:action move_one_miss_one_cann_s1_to_s2_mc33
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (missionary ?x)
                        (cannibal ?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value3 ?missionaries_in_side1)
                        (value3 ?cannibals_in_side1)             
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value3 ?missionaries_in_side1))
                        (value2 ?missionaries_in_side1)
                        (not (value3 ?cannibals_in_side1) )
                        (value2 ?cannibals_in_side1)   
        )
    )

    (:action move_one_miss_one_cann_s2_to_s1_mc00
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (missionary ?x)
                        (cannibal ?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value0 ?missionaries_in_side1)
                        (value0 ?cannibals_in_side1)             
        )            
        
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value0 ?missionaries_in_side1)) 
                        (value1 ?missionaries_in_side1)
                        (not (value0 ?cannibals_in_side1) )
                        (value1 ?cannibals_in_side1) 
        )
    )

    (:action move_one_miss_one_cann_s2_to_s1_mc11
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (missionary ?x)
                        (cannibal ?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value1 ?missionaries_in_side1)
                        (value1 ?cannibals_in_side1)             
        )            
        
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value1 ?missionaries_in_side1)) 
                        (value2 ?missionaries_in_side1)
                        (not (value1 ?cannibals_in_side1) )
                        (value2 ?cannibals_in_side1) 
        )
    )

    (:action move_one_miss_one_cann_s2_to_s1_mc22
        :parameters (?x ?y ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (missionary ?x)
                        (cannibal ?y)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (stayed ?y ?from)         ; y must stay at 'from'
                        (value2 ?missionaries_in_side1)
                        (value2 ?cannibals_in_side1)             
        )            
        
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (not (stayed ?y ?from))
                        (stayed ?x ?to)
                        (stayed ?y ?to) 
                        (not (value2 ?missionaries_in_side1)) 
                        (value3 ?missionaries_in_side1)
                        (not (value2 ?cannibals_in_side1) )
                        (value3 ?cannibals_in_side1) 
        )
    )

    (:action move_one_miss_s1_to_s2_m11
        :parameters (?x ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (missionary ?x)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (value1 ?missionaries_in_side1)
                        (value1 ?cannibals_in_side1)  
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (stayed ?x ?to)
                        (not (value1 ?missionaries_in_side1))
                        (value0 ?missionaries_in_side1)
        )
    )

    (:action move_one_miss_s1_to_s2_m32
        :parameters (?x ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (missionary ?x)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (value3 ?missionaries_in_side1)
                        (value2 ?cannibals_in_side1)  
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (stayed ?x ?to)
                        (not (value3 ?missionaries_in_side1))
                        (value2 ?missionaries_in_side1)
        )
    )

    (:action move_one_miss_s2_to_s1_m01
        :parameters (?x ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (missionary ?x)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (value0 ?missionaries_in_side1)
                        (value1 ?cannibals_in_side1)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (stayed ?x ?to)
                        (not (value0 ?missionaries_in_side1))
                        (value1 ?missionaries_in_side1)
        )
    )
     
    (:action move_one_miss_s2_to_s1_m22
        :parameters (?x ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (missionary ?x)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (value2 ?missionaries_in_side1)
                        (value2 ?cannibals_in_side1)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (stayed ?x ?to)
                        (not (value2 ?missionaries_in_side1))
                        (value3 ?missionaries_in_side1)
        )
    )

    (:action move_one_cann_s1_to_s2_c01
        :parameters (?x ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (cannibal ?x)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (value0 ?missionaries_in_side1)
                        (value1 ?cannibals_in_side1)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (stayed ?x ?to)
                        (not (value1 ?cannibals_in_side1))
                        (value0 ?cannibals_in_side1)
        )
    )

    (:action move_one_cann_s1_to_s2_c02
        :parameters (?x ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (cannibal ?x)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (value0 ?missionaries_in_side1)
                        (value2 ?cannibals_in_side1)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (stayed ?x ?to)
                        (not (value2 ?cannibals_in_side1))
                        (value1 ?cannibals_in_side1)
        )
    )
     
    (:action move_one_cann_s1_to_s2_c03
        :parameters (?x ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (cannibal ?x)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (value0 ?missionaries_in_side1)
                        (value3 ?cannibals_in_side1)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (stayed ?x ?to)
                        (not (value3 ?cannibals_in_side1))
                        (value2 ?cannibals_in_side1)
        )
    )

    (:action move_one_cann_s1_to_s2_c33
        :parameters (?x ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (cannibal ?x)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (value3 ?missionaries_in_side1)
                        (value3 ?cannibals_in_side1)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (stayed ?x ?to)
                        (not (value3 ?cannibals_in_side1))
                        (value2 ?cannibals_in_side1)
        )
    )

     (:action move_one_cann_s1_to_s2_c32
        :parameters (?x ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (cannibal ?x)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (value3 ?missionaries_in_side1)
                        (value2 ?cannibals_in_side1)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (stayed ?x ?to)
                        (not (value2 ?cannibals_in_side1))
                        (value1 ?cannibals_in_side1)
        )
    )

     (:action move_one_cann_s1_to_s2_c31
        :parameters (?x ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side1 ?from)
                        (is_side2 ?to)
                        (cannibal ?x)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (value3 ?missionaries_in_side1)
                        (value1 ?cannibals_in_side1)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (stayed ?x ?to)
                        (not (value1 ?cannibals_in_side1))
                        (value0 ?cannibals_in_side1)
        )
    )

    (:action move_one_cann_s2_to_s1_c00
        :parameters (?x ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (cannibal ?x)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (value0 ?missionaries_in_side1)
                        (value0 ?cannibals_in_side1)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (stayed ?x ?to)
                        (not (value0 ?cannibals_in_side1))
                        (value1 ?cannibals_in_side1)
        )
    )

    (:action move_one_cann_s2_to_s1_c01
        :parameters (?x ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (cannibal ?x)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (value0 ?missionaries_in_side1)
                        (value1 ?cannibals_in_side1)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (stayed ?x ?to)
                        (not (value1 ?cannibals_in_side1))
                        (value2 ?cannibals_in_side1)
        )
    )

    (:action move_one_cann_s2_to_s1_c02
        :parameters (?x ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (cannibal ?x)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (value0 ?missionaries_in_side1)
                        (value2 ?cannibals_in_side1)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (stayed ?x ?to)
                        (not (value2 ?cannibals_in_side1))
                        (value3 ?cannibals_in_side1)
        )
    )

    (:action move_one_cann_s2_to_s1_c30
        :parameters (?x ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (cannibal ?x)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (value3 ?missionaries_in_side1)
                        (value0 ?cannibals_in_side1)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (stayed ?x ?to)
                        (not (value0 ?cannibals_in_side1))
                        (value1 ?cannibals_in_side1)
        )
    )

    (:action move_one_cann_s2_to_s1_c31
        :parameters (?x ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (cannibal ?x)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (value3 ?missionaries_in_side1)
                        (value1 ?cannibals_in_side1)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (stayed ?x ?to)
                        (not (value1 ?cannibals_in_side1))
                        (value2 ?cannibals_in_side1)
        )
    )

    (:action move_one_cann_s2_to_s1_c32
        :parameters (?x ?from ?to ?missionaries_in_side1 ?cannibals_in_side1)
        :precondition (and 
                        (boat ?from)              ; boat must be at 'from'
                        (is_side2 ?from)
                        (is_side1 ?to)
                        (cannibal ?x)
                        (stayed ?x ?from)         ; x must stay at 'from'
                        (value3 ?missionaries_in_side1)
                        (value2 ?cannibals_in_side1)
        )
        :effect (and 
                        (not (boat ?from))
                        (boat ?to)
                        (not (stayed ?x ?from))
                        (stayed ?x ?to)
                        (not (value2 ?cannibals_in_side1))
                        (value3 ?cannibals_in_side1)
        )
    )
)
