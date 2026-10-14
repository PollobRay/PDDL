(define (domain Dining_Philosopher)

    (:requirements :strips :typing)

    (:types philosopher fork)

    (:predicates
        (left_fork ?ph - philosopher ?f - fork)     ; f is the left fork of ph
        (right_fork ?ph - philosopher ?f - fork)    ; f is the right fork of ph
        (free ?f - fork)                            ; f is on the table, not in use
        (thinking ?ph - philosopher)                ; ph is thinking
        (eating ?ph - philosopher)                  ; ph is eating (holding both forks)
        (eaten ?ph - philosopher)                   ; ph has finished a meal
    )

    (:action eat                                    ; stop thinking, take both forks and eat
        :parameters (?ph - philosopher ?left - fork ?right - fork)
        :precondition (and
            (thinking ?ph)
            (left_fork ?ph ?left)
            (right_fork ?ph ?right)
            (free ?left)
            (free ?right)
        )
        :effect (and
            (not (thinking ?ph))
            (not (free ?left))
            (not (free ?right))
            (eating ?ph)
        )
    )

    (:action end_eat                                ; put both forks back and think again
        :parameters (?ph - philosopher ?left - fork ?right - fork)
        :precondition (and
            (eating ?ph)
            (left_fork ?ph ?left)
            (right_fork ?ph ?right)
        )
        :effect (and
            (not (eating ?ph))
            (free ?left)
            (free ?right)
            (thinking ?ph)
            (eaten ?ph)
        )
    )
)
