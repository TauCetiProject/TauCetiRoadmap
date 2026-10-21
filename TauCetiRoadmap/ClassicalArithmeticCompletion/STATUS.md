<!--tauceti-status:v1 {"roadmap":"ClassicalArithmeticCompletion","to_sha":"f91b6396a35d847a87a0d37519325918356bc0fc","ts":"2026-10-21T20:08:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"power-residue symbols, primary elements, Gauss and Jacobi sums, Stickelberger, and the cubic, quartic and Eisenstein reciprocity laws","state":"partial"},{"id":"Layer 2","remaining":"recurrences, Euler and Eulerian numbers, Farey sequences, k-kernels, and Christol and Cobham","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"3cb5c2e7b7df382d1d6b336ef9b0a96d01fb50ca28df21e7fd017ea6414a4d33","roadmap":"ClassicalArithmeticCompletion","to_sha":"f91b6396a35d847a87a0d37519325918356bc0fc"}-->
# Status: ClassicalArithmeticCompletion

This file documents the status of the ClassicalArithmeticCompletion roadmap up until `f91b639` (2026-10-21T20:08:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 is done. Layers 1 and 2 have their first elementary milestones: unit groups modulo prime powers, Dirichlet characters, square classes, automata and Cartier operators. None of the named summits has begun: higher reciprocity, Christol and Cobham. Layers 3–7 are untouched.

### Named results

- **The Chinese remainder theorem at non-coprime moduli.** Two integer congruences x ≡ a (mod m) and x ≡ b (mod n) are simultaneously solvable exactly when a ≡ b modulo gcd(m, n). No sign or nonzero assumption is placed on the moduli, and a zero modulus means equality ([`Int.exists_modEq_and_modEq_iff_modEq_gcd`](https://taucetiproject.org/docs/TauCeti/Data/Int/ChineseRemainder.html#Int.exists_modEq_and_modEq_iff_modEq_gcd)).
- **The structure of the units modulo a power of two.** (ℤ/2^(e+2))ˣ is isomorphic to ℤ/2 × ℤ/2^e, with −1 and 5 as explicit generators ([`TauCeti.ZMod.unitsTwoPowEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/ZMod/UnitsTwoPow.html#TauCeti.ZMod.unitsTwoPowEquiv)).
- **Principal units are squares at odd primes.** For odd p, every unit modulo p^(k+1) that is congruent to 1 modulo p is a square ([`ZMod.isSquare_of_unitsMap_eq_one`](https://taucetiproject.org/docs/TauCeti/Data/ZMod/PrincipalUnits.html#ZMod.isSquare_of_unitsMap_eq_one)). More generally it has a unique n-th root in that subgroup whenever n is prime to p.
- **A Dirichlet character is determined by almost all of its prime values.** Characters that agree at all but finitely many primes have the same conductor and primitive character, and they are equal at a common level ([`DirichletCharacter.eq_of_eventually_apply_prime_eq`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DirichletCharacter/PrimeValues.html#DirichletCharacter.eq_of_eventually_apply_prime_eq)).
- **The Cartier decomposition of a Laurent series.** Over a field with q elements, f = Σ_{r<q} X^r (Λ_r f)^q ([`LaurentSeries.sum_single_mul_contract_pow_card`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Cartier.html#LaurentSeries.sum_single_mul_contract_pow_card)). A companion rule passes multiplication by q-th powers through the operators. This is the algebraic engine of Christol's theorem.

### Notable definitions and infrastructure

- **The squarefree part of a rational number** ([`Rat.squarefreePart`](https://taucetiproject.org/docs/TauCeti/Data/Rat/SquarefreePart.html#Rat.squarefreePart)). It gives each rational square class a canonical signed squarefree integer, together with uniqueness, invariance under squares and the prime-divisor criterion through odd valuations. It is what the Kronecker characters of square classes later in Layer 1 will be indexed by.
- **k-automatic sequences** ([`TauCeti.IsAutomatic`](https://taucetiproject.org/docs/TauCeti/Computability/AutomaticSequence.html#TauCeti.IsAutomatic)). These are built on deterministic automata with output reading base-k digits least significant first. They are closed under maps and pairing, and they include every eventually periodic sequence. This is the carrier for Christol and Cobham.

### Roadmap coverage

Layer 0 is done: its single milestone, compatible CRT for arbitrary integer moduli, is proved. Layer 1 is partial. Of its roughly seventy-five sections, the following are in place:

- the units modulo 2^n (1.1);
- odd principal units as squares (1.2);
- characters agreeing at almost all primes (1.8);
- the squarefree-part block (1.18, 1.18a, 1.28, 1.37).

The power-residue symbols, primary elements, Gauss and Jacobi sum identities, Stickelberger, and the cubic, quartic and Eisenstein reciprocity laws were not found in the library. Layer 2 is partial: deterministic automata with output (2.8), the Cartier operators (2.10) and the k-automatic sequence API (2.33) are in place. The Cartier operators are realised as residue-class exponent components with a positive modulus, not under the README's `LaurentSeries.cartier` name. A search found nothing else in the layer, including the minimal polynomial of a linear recurrence, the Euler and Eulerian numbers, the Farey sequence, k-kernels, Christol and Cobham. A keyword search of the library found nothing yet for Layers 3–7 (matrix and polynomial arithmetic, Diophantine equations, number-field presentations, small-height algebraic numbers, Galois modules), so they are reported untouched.

## The frontier

- **The rest of Layer 1's character table.** The primitivity of χ₄, χ₈ and χ₈′ and of the Legendre character, products of primitive characters, and the Kronecker character of a square class are the next steps. The squarefree part and the unit-group structure modulo 2^n are now available as inputs.
- **The d-th power criterion in a cyclic group (1.3).** This is self-contained, and it is the entry point to the power-residue symbols that higher reciprocity rests on.
- **The k-kernel and Christol's theorem.** The automata, automatic sequences and Cartier decomposition are in place. What remains is the k-kernel characterisation of automaticity (2.9) and then Christol's theorem itself.
- **Linear recurrences (2.1–2.3).** This covers the minimal polynomial of a linearly generated sequence and the uniqueness of exponential-polynomial closed forms. It depends only on Mathlib's `LinearRecurrence`.
- **Integer normal forms (Layer 3).** Rectangular Hermite and Smith normal forms are next, building on the square Smith normal form that Tau Ceti already supplies.
