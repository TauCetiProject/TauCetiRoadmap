# Roadmap: general lemmas from the formalisation of Grothendieck's working notes

**Summary.** Twenty-seven small results that Mathlib and Tau Ceti lack, each needed by a Lean proof
of a statement in Alexandre Grothendieck's working notes (Montpellier fonds), in Bourbaki drafts or
in Daniel Quillen's notebooks. Every target has been formalised once (all but 1.7, 2.10, 2.11, 5.5
and 5.6 against Mathlib `715a03a9`, 2026-10-12), and the code is CC0. It is cited below as a source,
**not** as the specification: contributors write each target to Tau Ceti's conventions, in the
generality stated, and reuse the native declarations named in the ownership table.

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
| 1.7 | `commutatorElement`, `Commute.commutatorElement_pow_left` | Mathlib | `(u v) ^ n` when `⁅v, u⁆` commutes with `u` and `v` | Quillen1971-11 |
| 2.1 | `Module.Flat.pi` (Tau Ceti, `RingTheory/Flat/Pi.lean`) | Tau Ceti | `Flat.pi_iff`, `prod_iff`, `prod` | Folder22 |
| 2.2 | `TensorProduct.piRightHom`, `Module.FinitePresentation` | DerivedModuleAlgebra, #1034 (module API) | bijectivity for `M` finitely presented | Folder22 |
| 2.3 | `Module.FinitePresentation`, `IsNoetherianRing` | DerivedModuleAlgebra, #1034 | the characterisation of Noetherian rings | — |
| 2.4 | `Basis.equivFun`, `LinearMap.rTensor` | Mathlib | membership in the range in coordinates | Folder153 |
| 2.5 | `Ideal.primaryComponent` (`Algebra/Module/Torsion/PrimaryComponent.lean`), `Module.Injective` | Mathlib | injectivity of the primary component | Folder21 |
| 2.6 | `IsAdicComplete` | #1034 (completion API) | completeness for a nilpotent ideal | Folder39 |
| 2.7 | `TauCeti.Units.coe_inv_mem_adjoin` | Tau Ceti | the subalgebra form, as a corollary | — |
| 2.8 | `KaehlerDifferential.mapBaseChange`, `Algebra.H1Cotangent`, `Algebra.FormallySmooth` | DerivedModuleAlgebra | the split first fundamental sequence | Folder22 |
| 2.9 | `Submodule.span`, `Module.Free` | Mathlib | rational multiples of an indivisible element | Folder44 |
| 2.10 | `Module.Baer`, `Module.Baer.injective`, `Module.Baer.of_divisible` (over `ℤ`) | Mathlib | divisible = injective over a PID; quotients | Bourbaki397 |
| 2.11 | `Module.Flat`, `IsSMulRegular`, `Submodule.IsAssociatedPrime` | Mathlib | associated primes of `F ⧸ pF` lie over `p` | Bourbaki355 |
| 3.1 | `Derivation.leibniz_pow`, `Derivation.leibniz_zpow` (fields) | Mathlib | finite products; integer powers of units in a ring | Folder2 |
| 3.2 | `Derivation` Lie bracket, `LinearMap.mulLeft` | Mathlib | the commutator with left multiplication | Folder93 |
| 4.1 | `ContinuousMap.curry`, `ContinuousMap.uncurry` | Mathlib | the exponential law for `X` preregular, `Y` locally compact | Bourbaki288 |
| 4.2 | `NoetherianSpace`, `QuasiSober`, `isOpen_of_stableUnderGeneralization_of_isConstructible` (prime spectra) | Mathlib | the statement for Noetherian quasi-sober spaces | Folder42 |
| 5.1 | `Monoid`, `MonoidHom` | Mathlib | right zeros of finite monoids | Folder158 |
| 5.2 | `exteriorPower` bases, `Matrix.det` | Mathlib | the Cauchy–Binet formula | Folder1 |
| 5.3 | Cauchy–Schwarz, `inner_mul_le_norm_mul_norm` | Mathlib | Lagrange's identity, the Binet–Cauchy identity | Folder1 |
| 5.4 | `Ring.choose` (binomial rings), `Polynomial` | Mathlib | the `ℤ`-basis of integer-valued polynomials | — |
| 5.5 | `Matrix.trace`, `IsIdempotentElem` | Mathlib | traces of odd powers of `P - Q` | Quillen1983-10 |
| 5.6 | `Algebra.GrothendieckGroup`, `Localization` | Mathlib | fractions and common denominators | Quillen1971-4 |

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

7. `mul_pow_of_commute_commutatorElement`: in a group, if `d = ⁅v, u⁆ = v u v⁻¹ u⁻¹` commutes with
   `u` and with `v`, then `(u v) ^ n = u ^ n v ^ n d ^ (n choose 2)` for every `n : ℕ`; and
   `mul_pow_prime_of_commute_commutatorElement`: for an odd prime `p` with `d ^ p = 1`, `(u v) ^ p =
   u ^ p v ^ p`, since `p ∣ p choose 2`. This is the class-two case of the Hall–Petrescu formula,
   and elementary; it is stated with Mathlib's `commutatorElement` (scoped notation `⁅v, u⁆`).
   *Needs:* `commutatorElement`, `Commute`, `Nat.choose`.
   **Checks.**
   - `n = 2`: `(u v)² = u (v u) v = u d u v v = u² v² d`, and `2 choose 2 = 1`; with `⁅u, v⁆` in
     place of `⁅v, u⁆` the formula would give `d⁻¹`, false in the quaternion group `Q₈`
     (`u = i`, `v = j`, `d = -1`, `(i j)² = k² = -1`, `i² j² = 1`).
   - `n = 0, 1`: exponents `0 choose 2 = 1 choose 2 = 0`, both sides `1` and `u v`; `n = 3`:
     exponent `3`, as `(u v)³ = u³ v³ d³` in the Heisenberg group over `ℤ`.
   - `p = 2` is excluded: in `Q₈`, `d = -1` has `d² = 1` but `(i j)² = -1 ≠ 1 = i² j²`.

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
10. `Module.Baer.of_isPrincipalIdealRing`: over a commutative principal ideal ring `R`, a module
    on which every `r ≠ 0` acts surjectively satisfies Baer's criterion;
    `Module.injective_iff_forall_smul_surjective`: over a principal ideal domain, a module is
    injective iff it is divisible; `Module.Injective.quotient`: over a principal ideal domain,
    every quotient of an injective module is injective. Mathlib proves the first only over `ℤ`
    (`Module.Baer.of_divisible`). The injectivity statements carry `[Small.{v} R]` for a module in
    universe `v`, as `Module.Baer.of_injective` does.
    *Needs:* `Module.Baer`, `Module.Baer.injective`, `Module.Baer.of_injective`,
    `IsPrincipalIdealRing`, `Submodule.mkQ`.
    **Checks.**
    - `ℚ ⁄ ℤ` is divisible, hence injective over `ℤ`; `ℤ` is not, since `2 • ·` misses `1`.
    - The quotient `ℚ → ℚ ⁄ ℤ` of the injective `ℤ`-module `ℚ` is injective, as stated.
    - `IsDomain` cannot be dropped: over the principal ideal ring `ℤ ⁄ 4`, the module `ℤ ⁄ 4` is
      injective (Baer's criterion on the ideals `0`, `(2)`, `(1)`) but `2 • ·` is not surjective,
      and its quotient `ℤ ⁄ 2` is not injective (the map `(2) → ℤ ⁄ 2`, `2 ↦ 1`, does not extend).
11. `Module.Flat.isSMulRegular_quotient_smul_top`: if `F` is flat over `A`, `p` is a prime of `A`
    and `a ∉ p`, then `a` is a nonzerodivisor on `F ⁄ pF`, because `F ⁄ pF ≃ (A ⁄ p) ⊗ F` and `a`
    is regular on the domain `A ⁄ p`. `Submodule.IsAssociatedPrime.comap_eq_of_flat`: for
    `A → B` and a `B`-module `F` flat over `A`, every associated prime `P` of the `B`-module
    `F ⁄ (pB)F` satisfies `P ∩ A = p`. Associated primes are Mathlib's
    (`Submodule.IsAssociatedPrime`, with the radical of the colon), so no Noetherian hypothesis
    is needed. *Needs:* `Module.Flat`, `IsSMulRegular`, `quotTensorEquivQuotSMul`,
    `Submodule.IsAssociatedPrime`, `Ideal.map`, `Ideal.comap`.
    **Checks.**
    - `A = B = F = ℤ`, `p = (2)`, `a = 3`: `3` acts as `1` on `ℤ ⁄ 2`, regular; the only
      associated prime of `ℤ ⁄ 2` is `(2)`, lying over `(2)`.
    - Primality is needed: `p = (4)`, `a = 2 ∉ p`, and `2 · 2 = 0` in `ℤ ⁄ 4`. Flatness is needed:
      `F = ℤ ⁄ 2`, `p = (0)`, `a = 2` kills `F ⁄ pF = ℤ ⁄ 2`; and `A = ℤ`, `B = F = ℤ ⁄ 4`,
      `p = (0)` gives the associated prime `(2)` of `ℤ ⁄ 4`, over `(2) ≠ (0)`.
    - The conclusion is `P ∩ A = p`, not `P = pB`: for `A = ℤ`, `B = F = ℤ[i]`, `p = (5)`,
      `ℤ[i] ⁄ 5 ≅ 𝔽₅ × 𝔽₅` has the two associated primes `(2 + i)`, `(2 - i)`, neither equal to
      `5ℤ[i]`, both over `(5)`.

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
5. `Matrix.trace_sub_pow_odd_of_isIdempotentElem`: for idempotent square matrices `P`, `Q` over a
   commutative ring, `tr ((P - Q) ^ (2k + 1)) = tr P - tr Q` for every `k : ℕ`, with no hypothesis
   on `2`. A route that does not divide by `2`: `C = (P - Q)²` commutes with `P` and `Q`,
   `(P - Q) C = (P - Q) - (P Q P - Q P Q)`, and `tr (D P Q P) = tr (D Q P Q)` whenever `D` commutes
   with `P` and `Q`. The analogue for orthogonal projections on a Hilbert space with `P - Q` trace
   class, where the common value is an index, is in Avron–Seiler–Simon (1994); the finite matrix
   identity over a ring is elementary. *Needs:* `Matrix.trace` and its cyclicity,
   `IsIdempotentElem`.
   **Checks.**
   - Over `ℤ`, `P = [[1, 0], [0, 0]]`, `Q = [[0, 0], [1, 1]]`: `P - Q = [[1, 0], [-1, -1]]` has
     trace `0 = 1 - 1`, and `(P - Q)² = 1`, so every odd power is `P - Q`; the even power has
     trace `2`, so the statement fails for even exponents.
   - Idempotence is needed: `P = (2)`, `Q = (0)` (size one) give `tr P³ = 8 ≠ 2`.
   - Over `𝔽₂` (where the anticommutation proof divides by `2`), `P = 1`, `Q = 0` of size one give
     `1 = 1 - 0` for every exponent, and the example above reduces mod `2` with trace `0`.
6. `Algebra.GrothendieckGroup.exists_eq_of_div_of`: every element of the Grothendieck group of a
   commutative monoid `M` is `of a / of b` with `a b : M`;
   `Algebra.GrothendieckGroup.exists_eq_div_of_and_eq_div_of`: two elements have a common
   denominator, `x = of a / of c` and `y = of b / of c`. The criterion
   `of a = of b ↔ ∃ c, c a = c b` is Mathlib's `Submonoid.LocalizationMap.eq_iff_exists` for the
   top submonoid, and is not restated. The additive Grothendieck group gets the same statements
   with differences.
   *Needs:* `Algebra.GrothendieckGroup`, `Algebra.GrothendieckGroup.of`,
   `Submonoid.LocalizationMap.surj`.
   **Checks.**
   - `M = (ℕ, ·)`: `0` absorbs, the group is trivial, and `of 2 = of 3` with `c = 0`; so the
     common-denominator statement cannot be strengthened to `of` injective without cancellation.
   - `M = (ℕ, +)` in the additive form: the group is `ℤ`, and `-3 = of 0 - of 3`; `x = 1`,
     `y = -2` have the common denominator `c = 2`: `1 = 3 - 2`, `-2 = 0 - 2`.
   - `M = ({1, e}, ·)` with `e² = e`: the group is trivial, and `of e = of 1` with `c = e`.

Source files: `MonoidRightZero`, `MatrixDetFinTwoCauchyBinet`, `SingularValuesSigmaTwo` (for 5.3),
`PolynomialIntegerValued`.

## Ordering

Any target can be taken alone. The only dependency is 1.3 → 1.4; in 2.11 the second statement
uses the first. Small targets first: 1.1, 1.2,
1.5, 2.1, 2.6, 2.7, 3.1, 3.2 are each under forty lines in the first formalisation.

## References

- É. Lucas, « Théorie des fonctions numériques simplement périodiques », *Amer. J. Math.* 1 (1878).
- P.-J. Cahen, J.-L. Chabert, *Integer-valued polynomials*, AMS (1997).
- The Stacks Project, tags 059K, 08XW, 00TH.
- J. Avron, R. Seiler, B. Simon, « The index of a pair of projections », *J. Funct. Anal.* 120
  (1994), 220–237, doi:10.1006/jfan.1994.1031.

## Provenance

The lemmas were needed by the Lean proofs of the Grothendieck edition (grothendieck.commutator.io),
written by Claude Opus 5.5 (claude-opus-5-5) under Michel Hua's direction in October 2026. They were
proposed to Mathlib as pull requests and closed on 11–22 October 2026 under Mathlib's policy on AI
contributions. Their origin establishes provenance, not ownership: the owners are those of the
table above. This roadmap was drafted with the same model and read and revised by its human author.
