<!--tauceti-status:v1 {"roadmap":"DerivedModuleAlgebra","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
# Status: DerivedModuleAlgebra

This file documents the status of the DerivedModuleAlgebra roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The integral-power inputs are well advanced: homogeneous and multiplicative polynomial laws and the augmentation theory are done, and Roby's divided-power algebra has its grading, universal law, representability and base change. The Koszul complex and the tower `lim`/`lim¹` foundations are nearly complete. Nothing has begun on K-injective replacements, the cotangent complex, derived limits, completion or effectivity, and of Matlis duality only the existence of injective hulls is in place.

### Named results

**Roby representability** — for any modules `M` and `N`, composition with the universal law [identifies linear maps `Γ^d_R(M) → N` with homogeneous degree-`d` polynomial laws `M → N`](https://taucetiproject.org/docs/TauCeti/RingTheory/DividedPowerAlgebra/Representability.html#DividedPowerAlgebra.homogeneousLawEquiv), with no flatness or projectivity of `M`.

**Base change of divided powers** — for every commutative `R`-algebra `S`, flat or not, [`S ⊗_R Γ_R(M) ≅ Γ_S(S ⊗_R M)` as `S`-algebras](https://taucetiproject.org/docs/TauCeti/RingTheory/DividedPowerAlgebra/BaseChange.html#DividedPowerAlgebra.baseChangeEquiv), restricting to an isomorphism on each [homogeneous piece](https://taucetiproject.org/docs/TauCeti/RingTheory/DividedPowerAlgebra/BaseChange.html#DividedPowerAlgebra.baseChangeHomogeneousEquiv).

**The grading of the divided power algebra** — `Γ_R(M)` is the [internal direct sum](https://taucetiproject.org/docs/TauCeti/RingTheory/DividedPowerAlgebra/Grading.html#DividedPowerAlgebra.isInternal_homogeneousSubmodule) of its degree-`d` pieces over any commutative ring, with directness proved without dividing by factorials.

**Koszul acyclicity for regular sequences** — the Koszul complex of a weakly regular sequence [has no homology in positive degrees](https://taucetiproject.org/docs/TauCeti/RingTheory/KoszulComplex/Regular.html#TauCeti.koszulComplex.exactAt_of_isWeaklyRegular), and its [zeroth homology is `R/(xᵢ)`](https://taucetiproject.org/docs/TauCeti/RingTheory/KoszulComplex/Basic.html#TauCeti.koszulComplex.homologyZeroEquivSpan), so it is a finite free resolution of the quotient.

**Mittag-Leffler towers have vanishing `lim¹`** — [the Stacks criterion](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/Tower/MittagLeffler.html#TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler) for towers of modules. The hypothesis is needed: the multiplication-by-`p` tower has [`lim¹ ≅ ℤ_p/ℤ`](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/Tower/Padic.html#TauCeti.ModuleTower.limOneMultiplicationTowerEquiv).

### Notable definitions and infrastructure

- The [universal homogeneous law `γ_d : M → Γ^d_R(M)`](https://taucetiproject.org/docs/TauCeti/RingTheory/DividedPowerAlgebra/UniversalLaw.html#DividedPowerAlgebra.gamma), which every Roby statement is phrased through. It is paired with [coefficients of polynomial laws](https://taucetiproject.org/docs/TauCeti/RingTheory/PolynomialLaw/Coeff.html#PolynomialLaw.coeff) at a generic combination, which determine a law and are what make representability provable.
- [Multiplicative polynomial laws](https://taucetiproject.org/docs/TauCeti/RingTheory/PolynomialLaw/Multiplicative.html#PolynomialLaw.IsMultiplicative), tested after every scalar extension, with degree-one multiplicative laws [identified with algebra maps](https://taucetiproject.org/docs/TauCeti/RingTheory/PolynomialLaw/Multiplicative.html#PolynomialLaw.algHomEquiv). This is the target side of the Roby algebra.
- [Existence of injective envelopes](https://taucetiproject.org/docs/TauCeti/Algebra/Module/Injective/Envelope/Existence.html#TauCeti.exists_isInjectiveEnvelope), also inside any given injective module. This is the hull construction that both Matlis duality targets start from.

### Roadmap coverage

§0.DP.1 and §0.DP.3 are done. §0.DP.2 is partial: the homogeneous pieces, grading, universal law, representability and base change are proved, but the tensor map `Γ^d(M) ⊗ Γ^d(N) → Γ^d(M ⊗ N)`, the Roby algebra of multiplicative laws and the free-module comparison with symmetric tensors are not. §0.K.1 is done except for the tensor identification `K(x, y) ≅ K(x) ⊗ K(y)`. §1.T.1 is done in the `ModuleCat` tower interface: `lim`, `lim¹`, Mittag-Leffler and its vanishing criterion, the six-term sequence, and a Milnor sequence for towers of complexes, which the library contains from outside this roadmap's own pull requests. The integral adapter `CompactCoefficients.Tower` and its comparisons have not been built. §1.M.2 has only hull existence. As before, the library's first-quadrant bicomplex spectral sequence lacks the `E₂` identification, edge maps and five-term sequence that §S.1 asks for. §0.I.1, §§0.1–0.25, §§1.1–1.E.1 and §1.M.1 are untouched.

## The frontier

- **Koszul tensor identification** (§0.K.1) — prove `K(x, y) ≅ K(x) ⊗ K(y)` for concatenated sequences, with the sign `d(v ⊗ w) = dv ⊗ w + (−1)^deg(v) v ⊗ dw`. This is the last piece of the section.
- **The tensor map on `Γ^d`** (§0.DP.2) — construct `Γ^d(M) ⊗ Γ^d(N) → Γ^d(M ⊗ N)` from the law `(m, n) ↦ γ_d(m ⊗ n)`, with its naturality. Representability and base change, its stated prerequisites, are both in place.
- **The Roby algebra of multiplicative laws** (§0.DP.2) — put the internal product on `Γ^d_R(R)` and identify its algebra maps with multiplicative degree-`d` laws. This needs the tensor map; multiplicative laws are already done. The comparison with symmetric tensors for free modules comes after it.
- **Matlis duality inputs** (§1.M.2) — with hulls available, what remains is the `R̂`-action on `𝔪`-power-torsion modules, the duality between Artinian and finite `R̂`-modules with biduality, and the completion adjunction.
- **The integral tower adapter** (§1.T.1) — build `CompactCoefficients.Tower` and its `lim`/`lim¹` comparisons with the module interface, compatible with the six-term and Milnor maps that downstream consumers use.
