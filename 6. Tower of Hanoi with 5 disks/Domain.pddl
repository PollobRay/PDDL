(define (domain Tower_of_Hanoi_3disk)
    (:requirements :strips )
    (:predicates
        (clear ?disk)
        (on ?disk1 ?tower)      ; disk1 is on tower/disk
        (small ?disk1 ?disk2)   ; disk1 is small compare to disk2/tower
    )

    (:action move
        :parameters (?disk ?fromTower ?toTower )
        :precondition (and  
            (small ?disk ?toTower)
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