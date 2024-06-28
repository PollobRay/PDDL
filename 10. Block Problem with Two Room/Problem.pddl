(define (problem BLOCKS-5-0) 
    (:domain BLOCKS)
    (:objects
        room1 room2
        A B C 
        D E F 
    )
    (:init
        (handempty)         ; robot hand is empty
        (at_room room1)     ;inialy robot in room1
        (clear Table1)      ;Table1 is clear
        (clear Table2)      ;Table2 is clear
        (at Table1 room1)   ;Table1 is in room1
        (at Table2 room2)   ;Table2 is in room2

        (at A room1)        ; A in room1
        (at B room1)        ; B in room1
        (at C room1)        ; C in room1
        (at D room2)        ; D in room2
        (at E room2)        ; E in room2
        (at F room2)        ; F in room2

        (on B Table1)
        (on C Table1)
        (on A B)
        (clear A)
        (clear C)

        (on D Table2)
        (on E Table2)
        (on F E)
        (clear D)
        (clear F)
    )
    (:goal (and
        (handempty)

        (at D room1)        ; D in room1
        (at E room1)        ; E in room1
        (at F room1)        ; F in room1
        (at A room2)        ; A in room2
        (at B room2)        ; B in room2
        (at C room2)        ; C in room2

        (on F Table1)
        (on E F)
        (on D E)
        (clear D)

        (on C Table2)
        (on B C)
        (on A B)
        (clear A)
    ))
)
