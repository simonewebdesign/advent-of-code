(ns app.core)

(defn calc-fuel
  "Fuel required to launch a given module is based on its mass.
   Specifically, to finalc the fuel required for a module, take its mass,
   divide by three, round down, and subtract 2."
  [mass]
  (- (int (Math/floor (/ mass 3))) 2))

(defn get-fuels
  "Parse input.txt"
  []
  (map
    read-string
    (clojure.string/split-lines
      (slurp "input.txt"))))

(defn get-calc-and-sum
  []
  (reduce + (map calc-fuel (get-fuels))))
