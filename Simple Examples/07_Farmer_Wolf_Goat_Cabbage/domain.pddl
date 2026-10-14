;; =============================================================
;; Problem 7 : Farmer, Wolf, Goat and Cabbage (river crossing)
;; Level     : Intermediate
;; The boat carries the farmer plus at most one passenger.
;; Never leave the wolf alone with the goat, or the goat alone
;; with the cabbage.
;;
;; We use plain STRIPS (no negative preconditions), so each
;; "safe" situation is written as a separate action variant.
;; The rule: the bank the farmer LEAVES must stay safe.
;; =============================================================
(define (domain river-crossing)
  (:requirements :strips :typing)

  (:types bank)

  (:predicates
    (farmer-at ?b - bank)
    (wolf-at ?b - bank)
    (goat-at ?b - bank)
    (cabbage-at ?b - bank)
    (opposite ?b1 - bank ?b2 - bank)  ; ?b2 is across the river from ?b1
  )

  ;; ---- farmer crosses alone ----------------------------------
  ;; safe if the goat is already on the other bank
  (:action cross-alone-goat-away
    :parameters (?from - bank ?to - bank)
    :precondition (and (opposite ?from ?to) (farmer-at ?from)
                       (goat-at ?to))
    :effect (and (farmer-at ?to) (not (farmer-at ?from)))
  )
  ;; safe if the goat stays, but wolf and cabbage are both away
  (:action cross-alone-goat-alone
    :parameters (?from - bank ?to - bank)
    :precondition (and (opposite ?from ?to) (farmer-at ?from)
                       (goat-at ?from) (wolf-at ?to) (cabbage-at ?to))
    :effect (and (farmer-at ?to) (not (farmer-at ?from)))
  )

  ;; ---- farmer takes the goat (always safe: wolf+cabbage ok) ---
  (:action cross-with-goat
    :parameters (?from - bank ?to - bank)
    :precondition (and (opposite ?from ?to) (farmer-at ?from)
                       (goat-at ?from))
    :effect (and (farmer-at ?to) (goat-at ?to)
                 (not (farmer-at ?from)) (not (goat-at ?from)))
  )

  ;; ---- farmer takes the wolf (goat must not stay with cabbage)
  (:action cross-with-wolf-goat-away
    :parameters (?from - bank ?to - bank)
    :precondition (and (opposite ?from ?to) (farmer-at ?from)
                       (wolf-at ?from) (goat-at ?to))
    :effect (and (farmer-at ?to) (wolf-at ?to)
                 (not (farmer-at ?from)) (not (wolf-at ?from)))
  )
  (:action cross-with-wolf-cabbage-away
    :parameters (?from - bank ?to - bank)
    :precondition (and (opposite ?from ?to) (farmer-at ?from)
                       (wolf-at ?from) (cabbage-at ?to))
    :effect (and (farmer-at ?to) (wolf-at ?to)
                 (not (farmer-at ?from)) (not (wolf-at ?from)))
  )

  ;; ---- farmer takes the cabbage (wolf must not stay with goat)
  (:action cross-with-cabbage-goat-away
    :parameters (?from - bank ?to - bank)
    :precondition (and (opposite ?from ?to) (farmer-at ?from)
                       (cabbage-at ?from) (goat-at ?to))
    :effect (and (farmer-at ?to) (cabbage-at ?to)
                 (not (farmer-at ?from)) (not (cabbage-at ?from)))
  )
  (:action cross-with-cabbage-wolf-away
    :parameters (?from - bank ?to - bank)
    :precondition (and (opposite ?from ?to) (farmer-at ?from)
                       (cabbage-at ?from) (wolf-at ?to))
    :effect (and (farmer-at ?to) (cabbage-at ?to)
                 (not (farmer-at ?from)) (not (cabbage-at ?from)))
  )
)
