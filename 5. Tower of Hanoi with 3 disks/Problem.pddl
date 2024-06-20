(define (problem Tower_of_Hanoi_3disk_problem) 
    (:domain Tower_of_Hanoi_3disk)
    (:requirements :strips)   
    (:objects 
        disk1 disk2 disk3        
        tower1 tower2 tower3   
    )

    (:init

        (on disk3 tower1)  ;disk3 on tower 1
        (on disk2 disk3)    ; disk2 on disk3
        (on disk1 disk2)    ; disk1 on disk2
        (clear disk1)

        (clear tower2)
        (clear tower3)

        (small disk1 disk2)
        (small disk1 disk3)
        (small disk2 disk3)

        (small disk1 tower1)
        (small disk1 tower2)
        (small disk1 tower3)
        (small disk2 tower1)
        (small disk2 tower2)
        (small disk2 tower3)
        (small disk3 tower1)
        (small disk3 tower1)
        (small disk3 tower3)

    )

    (:goal (and
        (on disk3 tower3)
        (on disk2 disk3)
        (on disk1 disk2)
    ))
)
