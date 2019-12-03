(ns app.core)

(defn calc-fuel
  "Fuel required to launch a given module is based on its mass.
   Specifically, to finalc the fuel required for a module, take its mass,
   divide by three, round down, and subtract 2."
  [mass]
  (- (int (Math/floor (/ mass 3))) 2))

(defn accumulate-fuel
  ""
  [mass]
  (loop [acc 0
         res mass]
    (let [fuel (calc-fuel res)]
      (if (> fuel 0)
        (recur (+ acc fuel) fuel) acc))))
  ; (if (> (calc-fuel mass) 0))
  ;   (reduce + (calc-fuel)))


  ; (if (> (calc-fuel mass) 0)
  ;   (+ (accumulate-fuel mass))
  ;   0))

  ; (reduce
  ;   (fn [acc i]
  ;     (+ acc (calc-fuel mass)))
  ;   0
  ;   (if (> mass 0)
  ;     (accumulate-fuel mass)
  ;     0)))

  ; (if (<= (calc-fuel mass) 0)
  ;   0
  ;   (accumulate-fuel mass)))

  ; (reduce
  ;   (fn [acc i]
  ;     (if > i 0
  ;       (accumulate=))
  ;   ))

  ; (if (<= mass 0)
  ;   mass
  ;   (calc-fuel)))

(defn get-fuels
  "Parse input.txt"
  []
  (map
    read-string
    (clojure.string/split-lines
      (slurp "input.txt"))))

(defn get-calc-and-sum
  []
  (reduce + (map accumulate-fuel (get-fuels))))
