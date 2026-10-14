(define (domain map_coloring)
    (:requirements :strips :typing :negative-preconditions :universal-preconditions)
    ; typing: objects are declared as regions or colors
    ; negative-preconditions: used for (not ...) in preconditions and goal
    ; universal-preconditions: used for (forall ...) in the precondition

    (:types region color)

    (:predicates
        (adjacent ?x - region ?y - region)  ; x is adjacent to y
        (clear ?x - region)                 ; x is not colored yet
        (colored ?x - region ?c - color)    ; x is colored with c
    )

    (:action make_color                     ; color the current region with rcolor
        :parameters (?current - region ?rcolor - color)
        :precondition (and
            (clear ?current)                ; a region is colored only once
            (forall (?x - region)           ; no adjacent region already has rcolor
                (imply (adjacent ?current ?x)
                    (not (colored ?x ?rcolor))
                )
            )
        )
        :effect (and
            (colored ?current ?rcolor)
            (not (clear ?current))
        )
    )
)
