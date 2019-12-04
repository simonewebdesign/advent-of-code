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


(defn to-int
  [x]
  (Integer/valueOf x))


(defn get-fuels
  "Parse input.txt"
  []
  (map
    read-string     ; this works but it is unsafe, to-int above should be safer
    (clojure.string/split-lines
      (slurp "input.txt"))))

(defn get-calc-and-sum
  []
  (reduce + (map accumulate-fuel (get-fuels))))
