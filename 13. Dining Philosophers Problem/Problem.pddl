(define (problem Dining_Philosopher_problem)
    (:domain Dining_Philosopher)
    (:objects
        Ph1 Ph2 Ph3 Ph4 Ph5     - philosopher
        F1 F2 F3 F4 F5          - fork
    )

    (:init
        (left_fork Ph1 F1)
        (right_fork Ph1 F2)
        (left_fork Ph2 F2)
        (right_fork Ph2 F3)
        (left_fork Ph3 F3)
        (right_fork Ph3 F4)
        (left_fork Ph4 F4)
        (right_fork Ph4 F5)
        (left_fork Ph5 F5)
        (right_fork Ph5 F1)

        (thinking Ph1)          ; every philosopher starts thinking
        (thinking Ph2)
        (thinking Ph3)
        (thinking Ph4)
        (thinking Ph5)

        (free F1)               ; every fork is on the table
        (free F2)
        (free F3)
        (free F4)
        (free F5)
    )

    (:goal (and
        (eaten Ph1)
        (eaten Ph2)
        (eaten Ph3)
        (eaten Ph4)
        (eaten Ph5)
    ))
)
