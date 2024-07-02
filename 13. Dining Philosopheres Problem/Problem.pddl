(define (problem Dining_Philosopher_roblem) 
    (:domain Dining_Philosopher)
    (:objects 
        Ph1 Ph2 Ph3 Ph4 Ph5     ; Philosopher
        F1 F2 F3 F4 F5          ; Fork
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

        (not (take_left_fork Ph1))
        (not (take_right_fork Ph1))
        (not (take_left_fork Ph2))
        (not (take_right_fork Ph2))
        (not (take_left_fork Ph3))
        (not (take_right_fork Ph3))
        (not (take_left_fork Ph4))
        (not (take_right_fork Ph4))
        (not (take_left_fork Ph5))
        (not (take_right_fork Ph5))

        (not (eaten Ph1))
        (not (eaten Ph2))
        (not (eaten Ph3))
        (not (eaten Ph4))
        (not (eaten Ph5))

        (not (thinking Ph1))
        (not (thinking Ph2))
        (not (thinking Ph3))
        (not (thinking Ph4))
        (not (thinking Ph5))

        (not (eating Ph1))
        (not (eating Ph2))
        (not (eating Ph3))
        (not (eating Ph4))
        (not (eating Ph5))

        (not (occupied_fork F1))
        (not (occupied_fork F2))
        (not (occupied_fork F3))
        (not (occupied_fork F4))
        (not (occupied_fork F5))
    )

    (:goal (and
        (eaten Ph1)
        (eaten Ph2)
        (eaten Ph3)
        (eaten Ph4)
        (eaten Ph5)
    ))
)
