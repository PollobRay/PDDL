;Header and description

(define (domain BLOCKS)
    (:requirements :strips )
    (:predicates
        (on ?x ?y)      ; is x on y
        (ontable ?x)    ;is x on table
        (handempty)     ;is robot hand empty
        (holding ?x)       ; robot is holding x
        (clear ?x)      ; is x on top of stack or nothing is above of x
    )

    (:action pick-up ;pick up from table
        :parameters (?x)
        :precondition 
        (and (clear ?x) (ontable ?x) (handempty)    ; x must be ontable, clear and robot hand free
        )
        :effect 
        (and (not (ontable ?x)) ; x is now not on table
            (not (clear ?x))    ; x is now not clear
            (not (handempty))   ; robot hand is now not empty
            (holding ?x)       ; robot is now holding x
        )
    )
    
    (:action put-down       ; put down on table from robot hand
        :parameters (?x)
        :precondition (holding ?x)      ; only applicable when ROBOT is holding x
        :effect 
        (and (not (holding ?x))         ; now robot is not hodling x
            (clear ?x)
            (handempty)
            (ontable ?x)
        )
    )

   (:action stack                   ; put down x on y
       :parameters (?x ?y)
       :precondition 
       (and (holding ?x)            ; robot must hold x
          (clear ?y)                ; y must be clear to put x on it 
       )
       :effect 
       (and (not (holding ?x))
            (not (clear ?y))
            (clear ?x)
            (handempty)
            (on ?x ?y)              ; now x is on y
       ) 
   )
    
    (:action unstack                ; pick up x from y
        :parameters (?x ?y)
        :precondition 
        (and  (on ?x ?y)            ; x must be on y
            (clear ?x)
            (handempty)
        )
        :effect 
        (and (holding ?x)
            (clear ?y)
            (not (clear ?x))
            (not (handempty))
            (not (on ?x ?y))
        )
    )
)