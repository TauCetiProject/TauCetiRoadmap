# Roadmap: general lemmas from the formalisation of Grothendieck's working notes

**Summary.** Twenty-two small results that Mathlib and Tau Ceti lack, each needed by a Lean proof of
a statement in Alexandre Grothendieck's working notes (Montpellier fonds) or in his Bourbaki
drafts. Every target has been formalised once, against Mathlib `715a03a9` (2026-10-12), and the
code is CC0. It is cited below as a source, **not** as the specification: contributors write each
target to Tau Ceti's conventions, in the generality stated, and reuse the native declarations
named in the ownership table.

The layers do not depend on one another except where stated, so a contributor can take any target
on its own.

Source of the first formalisation (CC0):
<https://github.com/Commutator-IO/grothendieck-project/tree/370d4bf/lean/Grothendieck/Upstream>.

## Scope and ownership

**In scope.** The statements below, in the generality stated, with the API lemmas each one needs.

**Out of scope.** The statements from the notes that use these lemmas: they stay in the edition's
repository, which is the consumer named in the table (« — » when the edition's proof
inlines the statement). Nothing here attributes a result to
Grothendieck.

**Owned elsewhere, and consumed here.**

- *Bass stable range, and stable range one for semilocal rings*, with the commutative
  finite-maximal-spectrum specialisation `IsCoprime.exists_isUnit_add_mul`:
  [AlgebraicKTheory](../AlgebraicKTheory/README.md), A4. The edition's folder 79 consumes it from
  there.
- *Singular values, Ky Fan's inequality* `Kₖ(A + B) ≤ Kₖ(A) + Kₖ(B)`, *the variational principle and
  triangle majorization*: [OperatorTheory/Majorization](../OperatorTheory/Majorization/README.md),
  MAJ-A26–A31. The bound on the second elementary symmetric function of the singular values of
  `u + v`, used by the edition's folder 1, is to be proposed to that roadmap, in its conventions.
- *Idempotent adjunctions, Karoubi envelopes and Beck's theorem, the semi-simplex category*:
  [HomotopyTheoryOfCategories](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1521),
  Layer 0 and 8.4.
- *The cotangent complex and its low-degree terms*: [DerivedModuleAlgebra](../DerivedModuleAlgebra/README.md),
  §§0.4, 0.7–0.8. Layer 2.8 and Layer 3 below are stated on Mathlib's native carriers
  (`KaehlerDifferential`, `Algebra.H1Cotangent`, `Derivation`) and use no derived object.
- *The p-adic Mahler basis*: PadicMeasuresIwasawaAlgebras and #854. Layer 5.4 is the algebraic
  statement over `ℤ`, not the p-adic one.

## Ownership and consumers

For each target: the native declarations it reuses, the roadmap that owns the surrounding API when
it is not this one, what this roadmap adds, and the consumer in the edition (`lean/Grothendieck/`
of the repository above). Checked against the pins of this repository: Mathlib
`f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`.

| Target | Reuses | Surrounding API owned by | Adds | Consumer |
| --- | --- | --- | --- | --- |
| 1.1 | `Nat.Prime.dvd_choose_pow`, Lucas (`Choose.choose_modEq_choose_mod_mul_choose_div`) | Mathlib | the converse, `p ^ e ∣ n` from the binomial coefficients | Folder136 |
| 1.2 | Lucas | Mathlib | `(p ^ a - 1).choose k` mod `p` | Folder136 |
| 1.3–1.4 | `Polynomial.hasseDeriv`, `Polynomial.expand` | Mathlib | the characteristic-`p` kernel of the Hasse derivatives, `X ^ (p ^ e)`-linearity | Folder93 |
| 1.5 | `Polynomial.isCoprime_X_sub_C_of_isUnit_sub` | Mathlib | the converse direction, an `iff` | Folder93 |
| 1.6 | `Matrix.det`, `Nat.add_choose_eq` (Vandermonde) | Mathlib | the symmetric Pascal determinant | Folder153 |
| 2.1 | `Module.Flat.pi` (Tau Ceti, `RingTheory/Flat/Pi.lean`) | Tau Ceti | `Flat.pi_iff`, `prod_iff`, `prod` | Folder22 |
| 2.2 | `TensorProduct.piRightHom`, `Module.FinitePresentation` | DerivedModuleAlgebra, #1034 (module API) | bijectivity for `M` finitely presented | Folder22 |
| 2.3 | `Module.FinitePresentation`, `IsNoetherianRing` | DerivedModuleAlgebra, #1034 | the characterisation of Noetherian rings | — |
| 2.4 | `Basis.equivFun`, `LinearMap.rTensor` | Mathlib | membership in the range in coordinates | Folder153 |
| 2.5 | `Ideal.primaryComponent` (`Algebra/Module/Torsion/PrimaryComponent.lean`), `Module.Injective` | Mathlib | injectivity of the primary component | Folder21 |
| 2.6 | `IsAdicComplete` | #1034 (completion API) | completeness for a nilpotent ideal | Folder39 |
| 2.7 | `TauCeti.Units.coe_inv_mem_adjoin` | Tau Ceti | the subalgebra form, as a corollary | — |
| 2.8 | `KaehlerDifferential.mapBaseChange`, `Algebra.H1Cotangent`, `Algebra.FormallySmooth` | DerivedModuleAlgebra | the split first fundamental sequence | Folder22 |
| 2.9 | `Submodule.span`, `Module.Free` | Mathlib | rational multiples of an indivisible element | Folder44 |
| 3.1 | `Derivation.leibniz_pow`, `Derivation.leibniz_zpow` (fields) | Mathlib | finite products; integer powers of units in a ring | Folder2 |
| 3.2 | `Derivation` Lie bracket, `LinearMap.mulLeft` | Mathlib | the commutator with left multiplication | Folder93 |
| 4.1 | `ContinuousMap.curry`, `ContinuousMap.uncurry` | Mathlib | the exponential law for `X` preregular, `Y` locally compact | Bourbaki288 |
| 4.2 | `NoetherianSpace`, `QuasiSober`, `isOpen_of_stableUnderGeneralization_of_isConstructible` (prime spectra) | Mathlib | the statement for Noetherian quasi-sober spaces | Folder42 |
| 5.1 | `Monoid`, `MonoidHom` | Mathlib | right zeros of finite monoids | Folder158 |
| 5.2 | `exteriorPower` bases, `Matrix.det` | Mathlib | the Cauchy–Binet formula | Folder1 |
| 5.3 | Cauchy–Schwarz, `inner_mul_le_norm_mul_norm` | Mathlib | Lagrange's identity, the Binet–Cauchy identity | Folder1 |
| 5.4 | `Ring.choose` (binomial rings), `Polynomial` | Mathlib | the `ℤ`-basis of integer-valued polynomials | — |

Every « Adds » entry was searched for at both pins, by name and by statement, and is missing there.
Three are close to existing declarations, listed under « Reuses »: 1.5 (one direction is in
Mathlib), 3.1 (Mathlib has `leibniz_zpow` over fields) and 2.7 (a corollary of Tau Ceti's
`Units.coe_inv_mem_adjoin`).

## Conventions (pinned)

- Mathlib naming. Where a target generalises an existing Mathlib lemma, the new statement takes the
  existing name's pattern with a hypothesis suffix (`_of_r1Space`, `_of_finite`), and the old
  lemma is not touched.
- Characteristic `p` statements use `[Fact p.Prime] [CharP R p]`.

## The build, in layers

### Layer 1: Hasse derivatives and binomial coefficients in characteristic `p`

1. `Nat.pow_dvd_iff_forall_dvd_choose`: `p ^ e ∣ n ↔ ∀ k, 0 < k → k < p ^ e → p ∣ n.choose k`
   (`p` prime, `n ≠ 0`). It follows from Lucas's theorem (Lucas 1878).
2. `Nat.choose_pow_sub_one_modEq_neg_one_pow`: `(p ^ a - 1).choose k ≡ (-1) ^ k [ZMOD p]`, and
   `not_dvd_choose_pow_sub_one`.
3. `Polynomial.forall_hasseDeriv_eq_zero_iff_exists_expand`: in characteristic `p`, the Hasse
   derivatives of orders `0 < k < p ^ e` all vanish on `f` iff `f = expand (p ^ e) g` for some `g`.
4. `Polynomial.hasseDeriv_X_pow_mul`, `hasseDeriv_expand_mul`: for `k < p ^ e`, the Hasse derivatives
   are linear over `X ^ (p ^ e)`. Depends on 3.
5. `Polynomial.isCoprime_X_sub_C_iff_isUnit_sub` and `isCoprime_X_iff`: `IsCoprime P (X - C a) ↔
   IsUnit (P.eval a)`, completing Mathlib's `isCoprime_X_sub_C_of_isUnit_sub`.
6. `Matrix.det_pascal`: the symmetric Pascal matrix `(choose (i + j) i)` has determinant one,
   through `choose_mul_transpose_choose` (Vandermonde's convolution).

Source files: `HasseDerivXPowMul`, `ChoosePrimePowSubOne`, `PolynomialIsCoprimeX`,
`DetPascalMatrix`.

### Layer 2: modules, flatness, finite presentation

1. `Module.Flat.pi_iff`, `prod_iff`, `prod`: a finite product of modules, and a binary product, is
   flat iff each factor is. The instance for finite products is Tau Ceti's `Module.Flat.pi`.
2. `Module.FinitePresentation.piRightHom_bijective`: for `M` finitely presented, `M ⊗ Π i, N i →
   Π i, M ⊗ N i` is bijective (Stacks 059K).
3. `isNoetherianRing_iff_forall_finitePresentation`: a ring is Noetherian iff every finitely
   generated module is finitely presented.
4. `TensorProduct.mem_range_rTensor_iff_equivFinsuppOfBasisRight`: membership in the range of
   `rTensor`, in the coordinates of a basis of `M`.
5. `Ideal.primaryComponent.injective`: over a Noetherian ring, the `I`-primary component of an
   injective module is injective (Stacks 08XW).
6. `IsAdicComplete.of_isNilpotent`: a module is `I`-adically complete when `I` is nilpotent.
7. `Subalgebra.isUnit_of_isIntegral_of_isUnit`: over an Artinian ring, an element of a subalgebra
   `B ⊆ A` that is integral and a unit in `A` is a unit in `B`. Derive it from
   `TauCeti.Units.coe_inv_mem_adjoin`.
8. `KaehlerDifferential.exists_retraction_mapBaseChange`: for `R → A → B` with `B` formally smooth
   over `A`, the first fundamental sequence map `B ⊗[A] Ω[A⁄R] → Ω[B⁄R]` has a retraction. More
   generally, the conclusion holds when `Algebra.H1Cotangent A B` vanishes and `Ω[B⁄A]` is
   projective (Stacks 00TH, Lemma 10.138.9). With the hypothesis on `A ⁄ R` instead, the statement
   is false: `R = k`, `A = k[t]`, `B = k` with `t ↦ 0` gives `k dt → 0`.
9. `rat_smul_mem_iff`: rational multiples of an indivisible element of a lattice.

Source files: `FlatProdPi`, `FinitePresentationPiRightHomBijective`,
`IsNoetherianRingIffFinitePresentation`, `TensorProductMemRangeRTensorBasis`,
`PrimaryComponentInjective`, `IsAdicCompleteOfIsNilpotent`, `SubalgebraIsUnitOfIsIntegral`,
`FormallySmoothMapBaseChange`, `RatSmulMemIndivisible`.

### Layer 3: derivations

1. `Derivation.leibniz_prod`, `leibniz_zpow_units`: the Leibniz rule for finite products, and for
   integer powers of units in a ring, extending Mathlib's `leibniz_zpow` over fields.
2. `Derivation.lie_mulLeft`: the commutator of a derivation with left multiplication.

Source files: `DerivationLeibnizProd`, `DerivationLieMulLeft`.

### Layer 4: topology

1. `ContinuousMap.continuous_curry_of_r1Space`, `continuous_uncurry_of_r1Space`,
   `curryOfR1Space`: the exponential law `C(X × Y, Z) ≃ₜ C(X, C(Y, Z))` for the compact-open
   topology when `X` is preregular (`R1Space`) and `Y` locally compact. This extends Mathlib's
   statement, which needs `X` locally compact as well.
2. `NoetherianSpace.isOpen_of_stableUnderGeneralization`: in a Noetherian quasi-sober space, a set
   `E` stable under generalisation is open as soon as every `x ∈ E` has an open neighbourhood `W`
   with `W ∩ closure {x} ⊆ E`. Mathlib has this only for prime spectra, under a constructibility
   hypothesis.

Source files: `CurryR1Space`, `NoetherianIsOpenOfStableUnderGeneralization`.

### Layer 5: finite monoids and linear algebra

1. `Monoid.exists_forall_mul_eq_self_iff_of_finite`: a finite monoid has a right zero iff any two
   principal right ideals meet and every morphism to a group is trivial. Neither condition can be
   dropped: a nontrivial finite group, and `{1, a, b}` with `a`, `b` left zeros.
2. `Matrix.det_mul_eq_sum_powersetCard`: the Cauchy–Binet formula, through exterior powers.
3. `Finset.sum_sum_mul_sub_mul_sq`, `sum_sum_norm_mul_sub_mul_sq_le`: Lagrange's identity and the
   Binet–Cauchy identity.
4. `Polynomial.intValuedBasis`: the binomial polynomials `X.choose n`, written with Mathlib's
   `Ring.choose`, form a `ℤ`-basis of the polynomials over `ℚ` that take integer values on `ℤ`
   (Pólya 1915; Cahen–Chabert 1997, ch. I).

Source files: `MonoidRightZero`, `MatrixDetFinTwoCauchyBinet`, `SingularValuesSigmaTwo` (for 5.3),
`PolynomialIntegerValued`.

## Ordering

Any target can be taken alone. The only dependency is 1.3 → 1.4. Small targets first: 1.1, 1.2,
1.5, 2.1, 2.6, 2.7, 3.1, 3.2 are each under forty lines in the first formalisation.

## References

- É. Lucas, « Théorie des fonctions numériques simplement périodiques », *Amer. J. Math.* 1 (1878).
- P.-J. Cahen, J.-L. Chabert, *Integer-valued polynomials*, AMS (1997).
- The Stacks Project, tags 059K, 08XW, 00TH.

## Provenance

The lemmas were needed by the Lean proofs of the Grothendieck edition (grothendieck.commutator.io),
written by Claude Opus 5.5 (claude-opus-5-5) under Michel Hua's direction in October 2026. They were
proposed to Mathlib as pull requests and closed on 11–22 October 2026 under Mathlib's policy on AI
contributions. Their origin establishes provenance, not ownership: the owners are those of the
table above. This roadmap was drafted with the same model and read and revised by its human author.
