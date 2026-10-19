<!--tauceti-status:v1 {"roadmap":"QuadraticFormInvariants","to_sha":"03de080239e2f6ccee2f6e054e65c5445c50cf1e","ts":"2026-10-16T00:44:45Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"the invariant dictionary as a Layer 3 docstring: O'Meara, Serre's epsilon, Lam's s and c, with the Wall caution","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","remaining":"the Hilbert product formula, inherited from Class Field Theory's general Hilbert reciprocity","state":"partial"},{"id":"Layer 7","remaining":"base-change naturality of iota for every 2-torsion Brauer class, not only quaternion symbols","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"the finite dyadic acceptance example for every unit class over a finite extension of Q_2","state":"partial"}],"readme_sha":"1998a1018a9c779037c84025ce946b08225fb84e074bac2e79b62e89184ec925","roadmap":"QuadraticFormInvariants","to_sha":"03de080239e2f6ccee2f6e054e65c5445c50cf1e"}-->
# Status: QuadraticFormInvariants

This file documents the status of the QuadraticFormInvariants roadmap up until `03de080` (2026-10-16T00:44:45Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Six of the ten layers are done: the diagonal calculus, Witt theory, quaternion algebras, the Witt ring, the Brauer-valued invariants with the `I²` homomorphism, and the Stiefel-Whitney classes. The relative Stiefel-Whitney formula holds in degree two. Four small gaps remain. These are the general Hilbert product formula, base change of `ι` beyond quaternion symbols, the invariant-dictionary docstring of Layer 3, and the full finite dyadic acceptance example.

### Named results

- **The relative Stiefel-Whitney formula in degree two** (Kahn, Théorème 2) — for a quadratic extension `L/K` and `a ∈ Lˣ`, `w₂(Tr_*⟨a⟩) = w₂(Tr_*⟨1⟩) + N^{Ev}((a)) + w₁(Tr_*⟨1⟩) ∪ cor(a)`, stated on the trace forms themselves and on any diagonal presentations of them (`sw2Class_formClass_traceTransfer_smul_sq`).
- **The value of the Evens norm on a Kummer class** (Kahn, Lemme II.2.1; Serre, Théorème 1′) — for `L = K(√d)`, `N^{Ev}((a)) = (Tr a) ∪ (−d·N a) + (2) ∪ (d)`, and simply `(2) ∪ (d)` when `Tr a = 0`. The proof is Serre's argument in explicit `2 × 2` `Pin⁺` matrices (`galoisEvens2_kummerClass`).
- **The comparison isomorphism `Br(K) ≅ H²(G_K, (Kˢ)ˣ)`** — on 2-torsion it carries `[(a,b)]` to `(a) ∪ (b)` ([`TauCeti.brauerCohomologyEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/CrossedProduct/Comparison.html#TauCeti.brauerCohomologyEquiv)). It yields the cup-norm theorem: `(a) ∪ (b) = 0` exactly when `b = x² − a y²` is solvable ([`TauCeti.cup_kummerClass_eq_zero_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisCohomology/MuTwo/CupNorm.html#TauCeti.cup_kummerClass_eq_zero_iff)).
- **The local classification** (Serre IV Thm 7) — over a nonarchimedean local field with `2 ≠ 0`, regular forms are classified by dimension, discriminant and Hasse invariant, with a unique anisotropic quaternary form ([`QuadraticForm.equivalent_of_finrank_eq_four_of_anisotropic`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/QuadraticForm/AnisotropicQuaternary.html#QuadraticForm.equivalent_of_finrank_eq_four_of_anisotropic)).
- **Lam's comparison of the Clifford and Hasse invariants** (Lam V.3.20) — `c(q)` is `s(q)` times powers of `[(−1, d)]` and `[(−1,−1)]` fixed by the dimension ([`TauCeti.RegularFormClass.cliffordInvariant_eq_hasseInvariant_mul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Clifford.html#TauCeti.RegularFormClass.cliffordInvariant_eq_hasseInvariant_mul)). In cohomology this reads `ι(c(q)) = w₂(q) + C(n−1,2)·((−1) ∪ w₁(q)) + C(n+1,4)·((−1) ∪ (−1))` (`brauer2EquivH2_cliffordInvariant`).

### Notable definitions and infrastructure

- **The Clifford homomorphism on `I²`**. The Clifford invariant is additive once one summand lies in `I²`, sends `⟨⟨a,b⟩⟩` to `[(a,b)]`, and vanishes on `I³`. So it descends to `I²/I³ → Br(K)[2]` (`cliffordHomI2Bar`).
- **The `Pin⁺` model of the plane**. The model uses `2 × 2` matrices with `e₁² = e₂² = +1`, so `C₂ ≀ C₂` lifts to `D₁₆` and not to `Q₁₆`. Galois acts on the section lift only through the sign of `√2`, and that sign produces the `(2) ∪ (d)` term ([`TauCeti.pinLift_mul_map_mul_inv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/Matrix/PinPlusPlane/GaloisAction.html#TauCeti.pinLift_mul_map_mul_inv)).
- **Explicit `𝔽₂` cocycle classes**. A continuous 2-cocycle written by hand has a class in `H²`, and the cup of two homomorphism classes is the class of the product cocycle ([`TauCeti.ContCohomology.cup11_homClass`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/TrivialF2/Inhomogeneous.html#TauCeti.ContCohomology.cup11_homClass)). Every cochain-level computation in Layer 9 is read through these classes.

### Roadmap coverage

- **Done:** Layers 0, 1, 2, 4, 5 and 8.
  - Layer 0 now includes the comparison with Serre's contiguous orthogonal bases.
  - Layer 1 now includes Witt decomposition of a degenerate form, with all summands unique.
  - Layer 5 now includes the `I²` homomorphism and its descent to `I²/I³`.
  - Layer 8 now includes the exact Clifford comparison, restriction along `L/K`, and the `ℚ₂` tables of `w₁` and `w₂`.
- **Partial, each missing one item:**
  - Layer 3 lacks the invariant dictionary as a docstring of its own. The conventions, including the Wall caution, are recorded so far only in the Brauer-valued files.
  - Layer 6 has the `8 × 8` Hilbert-symbol table over `ℚ₂`. It lacks the product formula.
  - Layer 7 proves base change of `ι` on quaternion symbols, but not for every 2-torsion class.
  - Layer 9 has both degree-two results. Its finite dyadic acceptance example is worked out only over `ℚ₂(√5)`, for eight coefficients.

## The frontier

- **The finite dyadic acceptance example**: evaluate the two Layer 9 identities over a finite extension of `ℚ₂` for every unit class, not just the eight coefficients worked out over `ℚ₂(√5)`.
- **The Hilbert product formula**: apply the sign dictionary to Class Field Theory's Hilbert reciprocity. That roadmap proves it only when a square root of `b` lies in a cyclotomic extension, which covers rational `b` and so all of `ℚ`. The general statement waits on it.
- **Base-change naturality of `ι`**: extend it from quaternion symbols to all of `Br(K)[2]`. This needs the full crossed-product comparison to commute with scalar extension.
- **The Layer 3 invariant dictionary**: a Brauer-free docstring mapping O'Meara's `∏_{i≤j}`, Serre's `ε`, Lam's `s` and Lam's `c`, with the Wall caution.
