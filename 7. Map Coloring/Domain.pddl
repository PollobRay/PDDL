(define (domain map_coloring)
    (:requirements :strips :typing :negative-preconditions)
    ;Typing allows the definition of types for objects within the domain
    ; negative-precondition used for (not ) predicate
    (:predicates
        (adjacent ?x - region ?y - region)    ; is x adjacent to y
        (clear ?x - region )                  ; is x not color yet
        (color ?c - color ?x - region)        ; color c is printed on x
        )
    (:action make_color
        :parameters (
            ?current - region ?rcolor - color
        )
        :precondition (and 
            (forall (?x - region)  ;This quantifies over all regions 
                (imply (adjacent ?current ?x)
                    (not (color ?rcolor ?x))
                )
            )
        )
        :effect (and 
            (color ?rcolor ?current)
            (not (clear ?current))
        )
    ) 
) 
