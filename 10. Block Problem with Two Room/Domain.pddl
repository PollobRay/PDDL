;Header and description

(define (domain BLOCKS)
    (:requirements :strips :equality :conditional-effects :negative-preconditions :disjunctive-preconditions)
    (:constants 
        Table1      ; Table1 at room1
        Table2      ; Table2 at room2
    )
    (:predicates
        (at ?x ?room)    ;to check which room it consists
        (on ?x ?y)      ; is x on y
        (handempty)     ;is robot hand empty
        (holding ?x)       ; robot is holding x
        (clear ?x)      ; is x on top of stack or nothing is above of x
        (at_room ?r)                ;which room robot is now
    )

    (:action pick-up 
        :parameters (?obj ?from ?room)
        :precondition 
        (and 
              (at_room ?room)       ;robot must at the room
              (at ?obj ?room)       ;obj must at the room
              (at ?from ?room)      ;from must at the room
              (on ?obj ?from)       ;obj must on the from
              (handempty)           ; robot hand must empty
              (clear ?obj)          ;obj must clear 
              (not (= ?obj Table1)) ;obj must not Table1
              (not (= ?obj Table2)) ;obj must not Table2
        )
        :effect 
        (and 
              (not (at ?obj ?room))       ;obj is not at the room
              (not (on ?obj ?from))       ;obj is not on the from
              (not (handempty))           ; robot hand is not empty
              (holding ?obj)              ; robot is not holding obj
              (not (clear ?obj))          ; obj is not clear now
              (when (not (or (= ?from Table1) (= ?from Table2))) (clear ?from)) ;when from  is not Table then clear it
        )
    )
    
    (:action put-down       
        :parameters (?obj ?to ?room)
        :precondition (and 
                (at_room ?room)     ;robot must at room
                (at ?to ?room)      ; to must at room 
                (holding ?obj)      ; robot must holding obj
                (clear ?to)         ; to must be clear
        )      
        :effect (and 
                (at ?obj ?room)     ; obj is now at room
                (on ?obj ?to)       ; obj is on to
                (clear ?obj)        ; obj is now clear
                (handempty)         ; robot hand is not empty
                (not (holding ?obj))    ;robot is not holding obj
                (when (not (or (= ?to Table1) (= ?to Table2))) (not (clear ?to))) ;when to is not table then clear to
        )
    )

   (:action move
       :parameters (?from_room ?to_room)
       :precondition (at_room ?from_room)   ;robot must at from_room
       :effect 
       (and 
           (not (at_room ?from_room))
           (at_room ?to_room)
       ) 
   )
)