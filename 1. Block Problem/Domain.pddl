; Blocks World: a robot hand stacks and unstacks blocks on a table

(define (domain BLOCKS)
    (:requirements :strips)
    (:predicates
        (on ?x ?y)          ; x is on y
        (ontable ?x)        ; x is on the table
        (handempty)         ; robot hand is empty
        (holding ?x)        ; robot is holding x
        (clear ?x)          ; nothing is on top of x
    )

    (:action pick-up        ; pick up x from the table
        :parameters (?x)
        :precondition (and
            (clear ?x)      ; x must be clear,
            (ontable ?x)    ; on the table,
            (handempty)     ; and the robot hand must be empty
        )
        :effect (and
            (not (ontable ?x))  ; x is no longer on the table
            (not (clear ?x))    ; x is no longer clear
            (not (handempty))   ; robot hand is no longer empty
            (holding ?x)        ; robot is now holding x
        )
    )

    (:action put-down       ; put x down on the table from the robot hand
        :parameters (?x)
        :precondition (holding ?x)  ; robot must be holding x
        :effect (and
            (not (holding ?x))      ; robot is no longer holding x
            (clear ?x)
            (handempty)
            (ontable ?x)
        )
    )

    (:action stack          ; put x down on y
        :parameters (?x ?y)
        :precondition (and
            (holding ?x)    ; robot must be holding x
            (clear ?y)      ; y must be clear to put x on it
        )
        :effect (and
            (not (holding ?x))
            (not (clear ?y))
            (clear ?x)
            (handempty)
            (on ?x ?y)      ; x is now on y
        )
    )

    (:action unstack        ; pick up x from y
        :parameters (?x ?y)
        :precondition (and
            (on ?x ?y)      ; x must be on y
            (clear ?x)
            (handempty)
        )
        :effect (and
            (holding ?x)
            (clear ?y)
            (not (clear ?x))
            (not (handempty))
            (not (on ?x ?y))
        )
    )
)
