<!--tauceti-status:v1 {"roadmap":"ClassicalArithmeticCompletion","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"power-residue symbols, Gauss and Jacobi sum identities, primary elements, and the cubic, quartic, Eisenstein and general reciprocity laws","state":"partial"},{"id":"Layer 2","remaining":"the k-kernel, recurrences and generating functions, Christol's theorem and Cobham's theorems","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"3cb5c2e7b7df382d1d6b336ef9b0a96d01fb50ca28df21e7fd017ea6414a4d33","roadmap":"ClassicalArithmeticCompletion","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1"}-->
# Status: ClassicalArithmeticCompletion

This file documents the status of the ClassicalArithmeticCompletion roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0, the integer congruence interface, is done. Layers 1 and 2 have only their opening items: elementary unit-group and character facts, automata and automatic sequences, and Cartier operators. None of the principal milestones has been started: higher reciprocity, Christol and Cobham, the Diophantine classifications, the Smyth and Dobrowolski bounds and the Fröhlich–Taylor theory. For Layers 3 to 7, nothing the README names is in the library yet.

### Named results

- **The Chinese remainder theorem at non-coprime moduli** — for arbitrary integers m and n, including zero and negative moduli, x ≡ a (mod m) and x ≡ b (mod n) are simultaneously solvable exactly when a ≡ b modulo gcd(m, n) ([`Int.exists_modEq_and_modEq_iff_modEq_gcd`](https://taucetiproject.org/docs/TauCeti/Data/Int/ChineseRemainder.html#Int.exists_modEq_and_modEq_iff_modEq_gcd)).
- **The structure of the units modulo a power of two** — the group (ℤ/2^(e+2))ˣ is ℤ/2 × ℤ/2^e, with −1 and 5 as the explicit generators ([`TauCeti.ZMod.unitsTwoPowEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/ZMod/UnitsTwoPow.html#TauCeti.ZMod.unitsTwoPowEquiv)).
- **Principal units modulo odd prime powers are squares** — a unit modulo p^(k+1) that is congruent to 1 modulo an odd prime p is a square. More generally, it has a unique n-th root in the principal units for n prime to p ([`ZMod.isSquare_of_unitsMap_eq_one`](https://taucetiproject.org/docs/TauCeti/Data/ZMod/PrincipalUnits.html#ZMod.isSquare_of_unitsMap_eq_one)).
- **Strong multiplicity one for Dirichlet characters** — two primitive characters that agree at all but finitely many primes have the same level and agree everywhere ([`DirichletCharacter.IsPrimitive.apply_eq_of_eventually_apply_prime_eq`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DirichletCharacter/PrimeValues.html#DirichletCharacter.IsPrimitive.apply_eq_of_eventually_apply_prime_eq)).
- **Eventually periodic sequences are automatic** — they are k-automatic in every base k ([`TauCeti.isAutomatic_of_eventually_periodic`](https://taucetiproject.org/docs/TauCeti/Computability/AutomaticSequence.html#TauCeti.isAutomatic_of_eventually_periodic)).

### Notable definitions and infrastructure

- **The squarefree part of a rational number** ([`Rat.squarefreePart`](https://taucetiproject.org/docs/TauCeti/Data/Rat/SquarefreePart.html#Rat.squarefreePart)) — the canonical signed squarefree integer representing a rational square class. Uniqueness, constancy on square classes and the odd-valuation description of its prime divisors are all proved. It is the carrier for the primitive quadratic character of a square class.
- **k-automatic sequences** ([`TauCeti.IsAutomatic`](https://taucetiproject.org/docs/TauCeti/Computability/AutomaticSequence.html#TauCeti.IsAutomatic)) — these are built on deterministic automata with output, together with products, output maps and comparison to Mathlib's acceptors. This is the language that Eilenberg's kernel criterion, Christol's theorem and Cobham's theorems will be stated in.
- **Cartier operators on Laurent series** — the coefficient decimations Λ_r, with the decomposition [f = ∑ X^r (Λ_r f)^q](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Cartier.html#LaurentSeries.sum_single_mul_contract_pow_card) over a field with q elements, compatibility with multiplication by q-th powers, and the degree bound on polynomials. These are the algebraic half of Christol's theorem. They landed as `contract` rather than the README's `cartier`.

### Roadmap coverage

Layer 0 (§0.1) is done. Layer 1 is partial: §§1.1, 1.2, 1.8, 1.18, 1.18a, 1.28 and 1.37 are in. So are a supporting character of the units modulo 2^(n+3) that detects complex conjugation, and the fact that a cyclotomic level ≡ 2 mod 4 can be halved. Everything from power-residue symbols through the cubic, quartic, Eisenstein and general reciprocity laws remains. Layer 2 is partial: automata (§2.8), automatic sequences (§2.33) and the Cartier operators (§2.10) are in, but the k-kernel, recurrences, Euler numbers, Farey sequences, Christol and Cobham are not. Layers 3 through 7 are untouched: no declaration the README names for them appears in the library.

## The frontier

- **The k-kernel and Eilenberg's criterion** (§§2.9, 2.50) — the next step on the automatic-sequence side, and the remaining structural input to Christol's theorem (§2.75). The automata and Cartier operators it needs are now in place.
- **The remaining primitive-character facts in Layer 1** — primitivity of χ₄, χ₈, χ₈′ and the Legendre character, products at coprime levels, and the Kronecker character of a fundamental discriminant (§§1.4–1.7). Also the conductor results: a primitive conductor is never twice an odd number, and the 2-adic bounds (§§1.9, 1.21, 1.32). The two-power unit structure and the squarefree part now supply their inputs.
- **The primitive quadratic character of a rational square class** (§1.51) — the squarefree part is ready to serve as its carrier.
- **The n-th power residue symbol** (§§1.23, 1.33, 1.41) — the gateway to every reciprocity law in Layer 1. Nothing towards it has landed.
- **Smith normal form for rectangular integer matrices** (§§3.3, 3.22, 3.40) — the natural entry point to Layer 3. Its existence and uniqueness for square matrices of nonzero determinant are already in the library as inputs.
