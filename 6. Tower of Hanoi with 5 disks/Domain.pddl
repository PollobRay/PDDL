(define (domain Tower_of_Hanoi_5disk)
    (:requirements :strips)
    (:predicates
        (clear ?x)              ; nothing is on top of disk/tower x
        (on ?disk ?x)           ; disk is on tower/disk x
        (smaller ?disk ?x)      ; disk is smaller than disk/tower x
    )

    (:action move               ; move disk from fromTower to toTower (a tower or a disk)
        :parameters (?disk ?fromTower ?toTower)
        :precondition (and
            (smaller ?disk ?toTower)    ; can only be put on a larger disk or an empty tower
            (on ?disk ?fromTower)
            (clear ?disk)
            (clear ?toTower)
        )
        :effect (and
            (on ?disk ?toTower)
            (not (on ?disk ?fromTower))
            (clear ?fromTower)
            (not (clear ?toTower))
        )
    )
)
