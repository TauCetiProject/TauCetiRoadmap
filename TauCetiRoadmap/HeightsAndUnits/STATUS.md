<!--tauceti-status:v1 {"roadmap":"HeightsAndUnits","to_sha":"9fc5d5a87d00cb696e606ccdae66420cc837c05e","ts":"2026-10-19T21:24:00Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"minima form of 2.1, minorGcd identity and invariance, geometric half, integral kernel basis, Bombieri-Vaaler sup-norm adapters","state":"partial"},{"id":"Layer 3","remaining":"reduced fundamental system bounded by the regulator, which needs Minkowski's second theorem from GoN","state":"partial"},{"id":"Layer 4","state":"done"}],"readme_sha":"85f7adf029e6c37cf2f857702ebe8ac077c2df9921a58f96098fb3acdf4029cb","roadmap":"HeightsAndUnits","to_sha":"9fc5d5a87d00cb696e606ccdae66420cc837c05e"}-->
# Status: HeightsAndUnits

This file documents the status of the HeightsAndUnits roadmap up until `9fc5d5a` (2026-10-19T21:24:00Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The height estimates (Layers 0 and 1) and the whole `S`-unit layer are done. The `S`-unit theorem, the `S`-logarithmic lattice and the `S`-regulator are all proved. Layer 3 lacks only the regulator form of its reduced fundamental system. Layer 2 has its lattice-basis lemma, but its minor-gcd half and the integral kernel basis have not begun.

### Named results

- **The determinant formula for the `S`-regulator**: for any fundamental system of `S`-units and any omitted infinite place, the `S`-regulator is the absolute determinant of the matrix of weighted logarithms. It specialises to the classical regulator at `S = ∅` and to `∏ log p` over `ℚ` ([`regulator_eq_abs_det`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/SUnits/Regulator.html#TauCeti.NumberField.SUnit.regulator_eq_abs_det)).
- **Hadamard's bound for the regulator**: every fundamental system bounds the regulator by `(2d)^r` times the product of the absolute logarithmic heights of its members ([`regulator_le_prod_absLogHeight₁`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Units/Regulator/Height.html#TauCeti.NumberField.Units.regulator_le_prod_absLogHeight₁)).
- **A fundamental system of controlled height**: from any independent family of units, some fundamental system has product of heights at most `r!/(2^{r−1} d^r)` times the product of the family's ℓ¹ log-norms ([`exists_fundSystem_prod_absLogHeight₁_le_of_isMaxRank`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Units/FundamentalSystem.html#TauCeti.NumberField.Units.exists_fundSystem_prod_absLogHeight₁_le_of_isMaxRank)). At `ℚ(√2)` the reduced constant is attained ([`absLogHeight₁_one_add_eq_regulator_div_two`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/WorkedExamples/Sqrt2/Units.html#TauCeti.NumberField.Sqrt2.absLogHeight₁_one_add_eq_regulator_div_two)).
- **Kronecker's theorem for projective tuples**: a tuple of algebraic numbers has absolute height one exactly when every ratio of its coordinates is zero or a root of unity ([`absoluteProjectiveTupleHeight_eq_one_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/Kronecker.html#TauCeti.absoluteProjectiveTupleHeight_eq_one_iff)). The ineffective height gap at bounded degree comes with it ([`exists_pos_forall_le_absLogHeight₁`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/Kronecker.html#TauCeti.exists_pos_forall_le_absLogHeight₁)).
- **The height of an `S`-unit** (Bombieri–Gubler 1.5.10): the height of an `S`-integer is carried by the infinite places and the places of `S`, and this identity characterises the `S`-integers ([`mulHeight₁_eq_of_mem_unit`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/SInteger.html#NumberField.mulHeight₁_eq_of_mem_unit)).

### Notable definitions and infrastructure

- **The `S`-units modulo torsion as a lattice**: the `S`-logarithmic embedding induces an isomorphism from the `S`-units modulo torsion onto a full lattice ([`logEmbeddingEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/SUnits/Lattice.html#TauCeti.NumberField.SUnit.logEmbeddingEquiv)). It is the reason fundamental systems and lattice bases are the same thing.
- **The affine height** [`mulHeightAff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/Affine.html#Height.mulHeightAff): the height of `(1, x)`. Because it is deliberately not scaling-invariant, it is the height in which values of linear forms and determinants can be bounded ([`mulHeight₁_det_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/LinearForm.html#Matrix.mulHeight₁_det_le)).
- **A lattice basis of controlled gauge** (Cassels V, Lemma 8): from any independent lattice vectors there is a basis whose gauges are bounded by theirs, with the `max 1 ((i+1)/2)` loss when the gauges increase ([`exists_basis_gauge_le`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/GaugeBasis.html#ZLattice.exists_basis_gauge_le)). Both the reduced fundamental system and the future kernel basis go through it.

### Roadmap coverage

Layers 0, 1 and 4 are done. That covers the affine height and its value and Arakelov bounds; projective and subspace Northcott instances; Kronecker and the gap; and for `S`-units the height identity, the rank `rank K + #S` with a fundamental system, the lattice, the quotient equivalence, the `S`-regulator and its determinant formula. Layer 3 is done except the regulator form of 3.3's reduced bound: the dictionary with the logarithmic embedding, the height-one-is-torsion statements, Hadamard's bound and the volume `2^r/r!` of the ℓ¹ log-ball are all in. Layer 2 is partial. The general basis lemma, the factorial identity `n!/2^{n−1}`, the covolume of the integral points of a rational subspace ([`covolume_intLattice`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/Arakelov/Covolume.html#Submodule.covolume_intLattice)) and the sharpness of Siegel's exponent are proved. The minima form, the minor gcd with its identity and `GL_m(ℤ)` invariance, the geometric half, the integral kernel basis and the Bombieri–Vaaler adapters are not.

## The frontier

- **The reduced fundamental system against the regulator (3.3)**: the bound `∏ h(ε_i) ≤ (r!)²/(2^{r−1} d^r) · regulator K`. It needs Minkowski's second theorem for `logBall` on the transported unit lattice. That theorem and successive minima for convex bodies belong to GeometryOfNumbersAndQuadraticArithmetic, which is still an open roadmap proposal.
- **The minima form of the basis lemma (2.1)**: restate the increasing-family basis lemma in terms of `successiveMin`, blocked on the same GoN vocabulary.
- **The minor gcd (2.2)**: `minorGcd A`, the identity `minorGcd A · subspaceHeight (ker A) = √det(A Aᵀ)`, and its `GL_m(ℤ)` invariance. The covolume step and the coprimality of Plücker coordinates of a saturated basis are already in place. None of this needs GoN.
- **The integral kernel basis (2.2)**: a `ℤ`-basis of `ker A` with product of sup norms at most `k!/2^{k−1} · √det(A Aᵀ)/minorGcd A`. It needs the minor gcd, the geometric half (GoN's Minkowski upper bound against DAT's cube-slice volume) and the minima form.
- **Bombieri–Vaaler in the sup norm**: the adapters of DAT's `siegelKernelBasis` for Theorems 1 and 2. They wait on that DAT result, which does not appear in the source here.
