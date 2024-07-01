(define (problem Jealous_Husband_prob) 
    (:domain Jealous_Husband)
    (:objects 
        men1 men2 men3
        women1 women2 women3
        side1 side2 
    )

    (:init
       (pair men1 women1)
       (pair men2 women2)
       (pair men3 women3)

       (movable men1 men2)
       (movable men1 men3)
       (movable men2 men1)
       (movable men2 men3)
       (movable men3 men1)
       (movable men3 men2)
       (movable women1 women2)
       (movable women1 women3)
       (movable women2 women1)
       (movable women2 women3)
       (movable women3 women1)
       (movable women3 women2)
       (movable men1 women1)
       (movable women1 men1)
       (movable men2 women2)
       (movable women2 men2)
       (movable men3 women3)
       (movable women3 men3)

       (boat_side side1)
       (at men1 side1)
       (at men2 side1)
       (at men3 side1)
       (at women1 side1)
       (at women2 side1)
       (at women3 side1)
       
       (men men1)
       (men men2)
       (men men3)
       (women women1)
       (women women2)
       (women women3)

       (side side1)
       (side side2)
    )

    (:goal (and
    (boat_side side2)
       (at men1 side2)
       (at men2 side2)
       (at men3 side2)
       (at women1 side2)
       (at women2 side2)
       (at women3 side2)
    ))
)
