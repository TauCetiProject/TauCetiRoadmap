# Roadmap: general lemmas from the formalisation of Grothendieck's working notes

**Summary.** Thirty-one small results that Mathlib lacks, each needed by a Lean proof of a
statement in Alexandre Grothendieck's working notes (Montpellier fonds) or in his Bourbaki
drafts. They were proposed to Mathlib as pull requests in October 2026 and closed under Mathlib's
policy on AI-generated contributions. Tau Ceti welcomes AI contributions, so this roadmap
specifies them for Tau Ceti instead. Every target has already been formalised once, against Mathlib
`715a03a9` (2026-10-12), and the code is CC0. It is cited below as a source, **not** as the
specification: contributors should write each target to Tau Ceti's conventions, in the right
generality, and reuse Mathlib's API rather than copying proofs.

Each layer is a separate area, close to an existing Mathlib file. The layers do not depend on one
another except where stated, so a contributor can take any target on its own.

Source of the first formalisation, one file per closed PR (CC0):
<https://github.com/Commutator-IO/grothendieck-project/tree/370d4bf/lean/Grothendieck/Upstream>.

## Scope and ownership

**In scope.** The statements below, in the generality stated, with the API lemmas each one needs.

**Out of scope.** The statements from the notes that use these lemmas: they stay in the edition's
repository. Nothing here attributes a result to Grothendieck. Most targets are standard, with
references given; the few that are not are marked « no printed source found ».

## What Mathlib already has (consume)

- `Polynomial.hasseDeriv`, `Nat.Prime.dvd_choose_pow`, Lucas's theorem (`Choose.choose_modEq_choose_mod_mul_choose_div`), `Polynomial.expand`.
- `Module.Flat`, `Module.FinitePresentation`, `IsAdicComplete`, `Module.primaryComponent`.
- `CategoryTheory.Adjunction`, `Idempotents.Karoubi`, `Monad.MonadicRightAdjoint` (Beck),
  `ReedyStructure` (`Mathlib/AlgebraicTopology/Reedy/Basic.lean`), `SemiSimplexCategory`.
- `ContinuousMap.curry` and `uncurry` with their continuity under `LocallyCompactSpace`.
- `Matrix.det`, `exteriorPower` bases, `LinearMap.singularValues`
  (`Mathlib/Analysis/InnerProductSpace/SingularValues.lean`).

These names were checked against Mathlib `715a03a9`. Tau Ceti pins Mathlib `6b7abb3c76`; a
target's claimant checks there that it is still missing.

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
   IsUnit (P.eval a)`.
6. `Matrix.det_pascal`: the symmetric Pascal matrix `(choose (i + j) i)` has determinant one,
   through `choose_mul_transpose_choose` (Vandermonde's convolution).

Source files: `HasseDerivXPowMul`, `ChoosePrimePowSubOne`, `PolynomialIsCoprimeX`,
`DetPascalMatrix`.

### Layer 2: modules, flatness, finite presentation

1. `Module.Flat.pi_iff`, `pi`, `prod_iff`, `prod`: finite and binary products of flat modules are flat.
2. `Module.FinitePresentation.piRightHom_bijective`: for `M` finitely presented, `M ⊗ Π i, N i →
   Π i, M ⊗ N i` is bijective (Stacks 059K).
3. `isNoetherianRing_iff_forall_finitePresentation`: a ring is Noetherian iff every finitely
   generated module is finitely presented.
4. `TensorProduct.mem_range_rTensor_iff_equivFinsuppOfBasisRight`: membership in the range of
   `rTensor`, in the coordinates of a basis of `M`.
5. `Module.primaryComponent.injective`: over a Noetherian ring, the `I`-primary component of an
   injective module is injective (Stacks 08XW).
6. `IsAdicComplete.of_isNilpotent`: a module is `I`-adically complete when `I` is nilpotent.
7. `Subalgebra.isUnit_of_isIntegral_of_isUnit`: over an Artinian ring, an element of a
   subalgebra `B ⊆ A` that is integral and a unit in `A` is a unit in `B`.
8. `IsCoprime.exists_isUnit_add_mul`: a semilocal ring has stable range one (Bass 1964).
9. `KaehlerDifferential.exists_retraction_mapBaseChange`: for `A` formally smooth over `R`, the first
   fundamental sequence `B ⊗ Ω[A⁄R] → Ω[B⁄R]` has a retraction.
10. `rat_smul_mem_iff`: rational multiples of an indivisible element of a lattice.

Source files: `FlatProdPi`, `FinitePresentationPiRightHomBijective`,
`IsNoetherianRingIffFinitePresentation`, `TensorProductMemRangeRTensorBasis`,
`PrimaryComponentInjective`, `IsAdicCompleteOfIsNilpotent`, `SubalgebraIsUnitOfIsIntegral`,
`SemilocalStableRange`, `FormallySmoothMapBaseChange`, `RatSmulMemIndivisible`.

### Layer 3: derivations

1. `Derivation.leibniz_prod`, `leibniz_zpow_units`: the Leibniz rule for finite products and for
   integer powers of units.
2. `Derivation.lie_mulLeft`: the commutator of a derivation with left multiplication.

Source files: `DerivationLeibnizProd`, `DerivationLieMulLeft`.

### Layer 4: category theory

1. `Adjunction.idempotent_tfae`: the equivalent conditions for an idempotent adjunction. The fixed
   subcategories `fixedLeft`, `fixedRight`, the equivalence `fixedEquiv` between them, and the
   reflection `fixedLeftAdjunction`.
2. `Idempotents.karoubiUniversalAdditive`: with values in an additive Karoubian category, additive
   functors on `C` and on its Karoubi envelope are equivalent.
3. `Monad.isEquivalence_comparison_iff`: Beck's (co)monadicity theorem as an iff.
4. `ReedyStructure.ofWellFounded`: direct categories through well-foundedness, and the direct Reedy
   structure on `SemiSimplexCategory` (`reedyStructure`, `len_lt_of_not_identities`). The closing
   review on Mathlib asked that the structure on the semi-simplex category be **restricted from
   one on the full simplex category**. Follow that design, not the source file's.

Source files: `AdjunctionIdempotent`, `KaroubiAdditiveFunctors`, `MonadicityIff`,
`SemiSimplexCategoryReedy`.

### Layer 5: topology

1. `ContinuousMap.continuous_curry_of_r1Space`, `continuous_uncurry_of_r1Space`,
   `curryOfR1Space`: the exponential law `C(X × Y, Z) ≃ₜ C(X, C(Y, Z))` for the compact-open
   topology when `X` is preregular (`R1Space`) and `Y` locally compact. This extends Mathlib's
   statement, which needs `X` locally compact as well.
2. `NoetherianSpace.isOpen_of_stableUnderGeneralization`: in a Noetherian quasi-sober space, a set
   `E` stable under generalisation is open as soon as every `x ∈ E` has an open neighbourhood `W`
   with `W ∩ closure {x} ⊆ E`. Mathlib has this only for prime spectra, under a constructibility
   hypothesis.

Source files: `CurryR1Space`, `NoetherianIsOpenOfStableUnderGeneralization`.

### Layer 6: finite monoids and linear algebra

1. `Monoid.exists_forall_mul_eq_self_iff_of_finite`: a finite monoid has a right zero iff any two
   principal right ideals meet and every morphism to a group is trivial. Neither condition can be
   dropped: a nontrivial finite group, and `{1, a, b}` with `a`, `b` left zeros. No printed source
   found.
2. `Matrix.det_mul_eq_sum_powersetCard`: the Cauchy–Binet formula, through exterior powers.
3. `Finset.sum_sum_mul_sub_mul_sq`, `sum_sum_norm_mul_sub_mul_sq_le`: Lagrange's identity and the
   Binet–Cauchy identity.
4. `sum_singularValues_add_le`: Ky Fan's inequality for the sums of the largest singular values, and
   `sum_powersetCard_two_prod_singularValues_add_le` for the second elementary symmetric function.
   Depends on 3.
5. `Polynomial.intValuedBasis`: the binomial polynomials `X.choose n` form a `ℤ`-basis of the
   integer-valued polynomials (Pólya 1915; Cahen–Chabert 1997, ch. I).

Source files: `MonoidRightZero`, `MatrixDetFinTwoCauchyBinet`,
`SingularValuesSigmaTwo` (which also holds 6.3), `PolynomialIntegerValued`.

## Ordering

Any target can be taken alone. The only dependencies are 1.3 → 1.4 and 6.3 → 6.4. Small
targets first: 1.1, 1.2, 1.5, 2.1, 2.6, 3.1, 3.2 are each under forty lines in the first
formalisation.

## References

- É. Lucas, « Théorie des fonctions numériques simplement périodiques », *Amer. J. Math.* 1 (1878).
- H. Bass, « K-theory and stable algebra », *Publ. Math. IHÉS* 22 (1964).
- P.-J. Cahen, J.-L. Chabert, *Integer-valued polynomials*, AMS (1997).
- The Stacks Project, tags 059K, 08XW.

## Provenance

The lemmas were needed by the Lean proofs of the Grothendieck edition (grothendieck.commutator.io),
written by Claude Opus 5.5 (claude-opus-5-5) under Michel Hua's direction in October 2026. Mathlib
closed the pull requests on 11–22 October 2026 under its policy on AI contributions. One review
remark (Joël Riou, on the Reedy structure) is carried into Layer 4.4. This roadmap was drafted with
the same model and must be read and revised by its human author before submission.
