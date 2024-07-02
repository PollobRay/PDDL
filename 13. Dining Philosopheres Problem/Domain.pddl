(define (domain Dining_Philosopher)

    (:requirements :strips :negative-preconditions :equality)

    (:predicates 
        (left_fork ?ph ?fork)
        (right_fork ?ph ?fork)
        (take_left_fork ?ph)
        (take_right_fork ?ph)
        (eaten ?ph)
        (thinking ?ph)
        (eating ?ph)
        (occupied_fork ?fork)
    )

    (:action think
        :parameters (?ph)
        :precondition (and 
            (not (take_left_fork ?ph))
            (not (take_right_fork ?ph))
            (not (thinking ?ph))
            (not (eating ?ph))
        )
        :effect (and 
            (thinking ?ph)
        )
    )

    (:action stop_think
        :parameters (?ph)
        :precondition (thinking ?ph )
        :effect (not (thinking ?ph) )
    )
    
    (:action eat 
        :parameters (?ph ?right_fork ?left_fork)
        :precondition (and 
            (not (thinking ?ph))
            (not (eating ?ph))
            (not (eaten ?ph))
            (left_fork ?ph ?left_fork)
            (right_fork ?ph ?right_fork)
            (not (occupied_fork ?left_fork))
            (not (occupied_fork ?right_fork))
        )
        :effect (and 
            (take_left_fork ?ph)
            (take_right_fork ?ph)
            (occupied_fork ?left_fork)
            (occupied_fork ?right_fork)
            (eating ?ph)
        )
    )

    (:action end_eat
        :parameters (?ph ?right_fork ?left_fork)
        :precondition (and 
            (left_fork ?ph ?left_fork)
            (right_fork ?ph ?right_fork)
            (occupied_fork ?left_fork)
            (occupied_fork ?right_fork)
            (take_left_fork ?ph)
            (take_right_fork ?ph)
            (eating ?ph)
        )
        :effect (and 
            (not (occupied_fork ?left_fork))
            (not (occupied_fork ?right_fork))
            (not (take_left_fork ?ph))
            (not (take_right_fork ?ph))
            (not (eating ?ph))
            (eaten ?ph)
        )
    )
    
    
    


)