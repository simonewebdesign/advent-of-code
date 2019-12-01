(ns app.core)

(defn foo
  "I don't do a whole lot."
  [x]
  (println x "Hello, World!"))

(defn calc-fuel
  "Fuel required to launch a given module is based on its mass. Specifically, to finalc the fuel required for a module, take its mass, divide by three, round down, and subtract 2."
  [mass]
  (- (int (Math/floor (/ mass 3))) 2))

(defn get-fuels
  "Parse input.txt"
  []
  (map
    read-string
    (clojure.string/split-lines
      (slurp "input.txt"))))

(defn sum-fuels
  "Sums all the values in input.txt"
  [fuels]
  (reduce + fuels))

(defn get-calc-and-sum
  []
  (sum-fuels (map calc-fuel (get-fuels))))
