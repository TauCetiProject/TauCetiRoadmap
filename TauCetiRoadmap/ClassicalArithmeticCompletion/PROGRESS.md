# Progress log: ClassicalArithmeticCompletion

An append-only record of what landed on the ClassicalArithmeticCompletion roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"8e902e129a86611dc568e8544a5b8ba8ce31fbcd","prs":[18365,18416,18427,18500,18951,18960,19274,19409],"roadmap":"ClassicalArithmeticCompletion","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1"}-->
## ClassicalArithmeticCompletion: 2026-10-18 to 2026-10-21 (`8e902e1` to `273ea28`)

The roadmap's first window closed Layer 0 and laid foundations in Layers 1 and 2. Layer 0's single target, the [Chinese remainder theorem for non-coprime moduli](https://taucetiproject.org/docs/TauCeti/Data/Int/ChineseRemainder.html#Int.exists_modEq_and_modEq_iff_modEq_gcd), is proved for all integer moduli, zero and negative ones included: two congruences x ≡ a (mod m) and x ≡ b (mod n) have a common solution exactly when a ≡ b modulo gcd(m, n).

In the residue layer, the units modulo a power of two now have [explicit generators](https://taucetiproject.org/docs/TauCeti/RingTheory/ZMod/UnitsTwoPow.html#TauCeti.ZMod.unitsTwoPowEquiv), with −1 and 5 splitting the group as ℤ/2 × ℤ/2^e. For an odd prime p, a unit modulo a power of p that is congruent to 1 modulo p is [a square](https://taucetiproject.org/docs/TauCeti/Data/ZMod/PrincipalUnits.html#ZMod.isSquare_of_unitsMap_eq_one). Two [primitive Dirichlet characters that agree at almost all primes](https://taucetiproject.org/docs/TauCeti/NumberTheory/DirichletCharacter/PrimeValues.html#DirichletCharacter.IsPrimitive.apply_eq_of_eventually_apply_prime_eq) have the same level and are equal. And there is now [the squarefree part of a rational number](https://taucetiproject.org/docs/TauCeti/Data/Rat/SquarefreePart.html#Rat.squarefreePart), with its uniqueness, its invariance on square classes, and the fact that a prime divides it exactly when the valuation is odd. These pieces sit at the very start of a long layer whose reciprocity laws have not been started.

For Layer 2, the window added deterministic automata with output and [k-automatic sequences](https://taucetiproject.org/docs/TauCeti/Computability/AutomaticSequence.html#TauCeti.IsAutomatic), the eventually periodic ones among them (TauCeti#18960). It also added the Cartier operators on Laurent series, including the decomposition [f = ∑ X^r (Λ_r f)^q](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Cartier.html#LaurentSeries.sum_single_mul_contract_pow_card) over a field with q elements. These are the two ingredients Christol's theorem will need. Christol's theorem itself has not been started.
