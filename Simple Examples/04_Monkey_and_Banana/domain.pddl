;; =============================================================
;; Problem 4 : Monkey and Banana
;; Level     : Basic
;; A monkey must push a box under hanging bananas, climb the
;; box and grab the bananas.
;; =============================================================
(define (domain monkey-banana)
  (:requirements :strips :typing)

  (:types location)

  (:predicates
    (monkey-at ?l - location)   ; monkey is at location ?l
    (box-at ?l - location)      ; box is at location ?l
    (banana-at ?l - location)   ; bananas hang above location ?l
    (on-floor)                  ; monkey stands on the floor
    (on-box)                    ; monkey stands on the box
    (has-banana)                ; monkey holds the bananas
  )

  ;; Walk from one place to another (only while on the floor)
  (:action go
    :parameters (?from - location ?to - location)
    :precondition (and (monkey-at ?from) (on-floor))
    :effect (and (monkey-at ?to)
                 (not (monkey-at ?from)))
  )

  ;; Push the box; monkey and box move together
  (:action push
    :parameters (?from - location ?to - location)
    :precondition (and (monkey-at ?from) (box-at ?from) (on-floor))
    :effect (and (monkey-at ?to) (box-at ?to)
                 (not (monkey-at ?from)) (not (box-at ?from)))
  )

  ;; Climb on the box (monkey must be where the box is)
  (:action climb
    :parameters (?l - location)
    :precondition (and (monkey-at ?l) (box-at ?l) (on-floor))
    :effect (and (on-box)
                 (not (on-floor)))
  )

  ;; Grab the bananas (only reachable from on top of the box)
  (:action grasp
    :parameters (?l - location)
    :precondition (and (monkey-at ?l) (banana-at ?l) (on-box))
    :effect (has-banana)
  )
)
