# Roadmap: Abhyankar's lemma for a regular divisor

**Summary.** This roadmap proves Abhyankar's lemma for a regular divisor (Stacks, Lemmas 58.31.5
(0EYG) and 58.31.6 (0EYH); SGA 1, Exposé XIII, §5): a finite étale cover of the complement of a
regular effective Cartier divisor `D` that is tamely ramified along `D` is, étale locally on the
base, a finite disjoint union of root extractions `x^e = f` of a local equation `f` of `D`, and its
normalization over the base is finite locally free with regular reduced preimage of `D`. On the way
it builds ramification of finite separable extensions with respect to a discrete valuation ring
(More on Algebra, Sections 15.113 and 15.116), unramified and tamely ramified covers in codimension
one (Section 58.31), and extension of covers unramified in codimension one across a regular divisor
(Lemmas 58.31.2 (0H2W) and 58.31.3 (0EYE)). Mathlib has discrete valuation rings, ramification
indices of ideals, `AdjoinRoot`, Eisenstein polynomials, scheme normalization and étale
morphisms; Tau Ceti has finite étale schemes over a base, codimension-one points with discrete
valuation ring stalks, effective Cartier divisors, and tame ramification of local fields. Neither has
ramification in codimension one of a cover or Abhyankar's lemma.

| Layer | Title | What it delivers |
|---|---|---|
| [0](#layer-0-extensions-of-a-discrete-valuation-ring) | Extensions of a discrete valuation ring | unramified, tamely and totally ramified extensions, Kummer extensions, Abhyankar's lemma for discrete valuation rings |
| [1](#layer-1-ramification-in-codimension-one) | Ramification in codimension one | unramified and tamely ramified covers in codimension one, the affine form, base change |
| [2](#layer-2-extension-across-a-regular-divisor) | Extension across a regular divisor | extension of covers unramified in codimension one across a regular complement and a regular divisor |
| [3](#layer-3-abhyankars-lemma) | Abhyankar's lemma | standard tamely ramified covers, splitting of finite étale covers, Abhyankar's lemma, the normalization |

```text
Mathlib + Tau Ceti → Layer 0 → Layer 1 → Layer 2 → Layer 3
LocalPurity §§2.1–2.2 (0BMA, 0BQ5/0EY3, 0EY7) ──→ Layer 2
ModularCurves §4D (strict henselisation) ───────→ Layer 3
SchemeAndStackFoundations §0.14 (henselian finite algebras) ──→ Layer 3
PurityOfBranchLocus §0.3 (0AFS) ────────────────→ Layer 3 §3.3
```

The end theorems are `finiteEtale_extend_of_regular_divisor` (0EYE, §2.2),
`abhyankar_regularDivisor` (0EYG, §3.3) and `abhyankar_normalization` (0EYH, §3.4).

## Scope and ownership

**This roadmap owns** the Stacks notions of an unramified, tamely ramified and totally ramified
finite separable extension with respect to a discrete valuation ring, their characterization by
Kummer extensions and their base change (More on Algebra, Sections 15.113 and 15.116); Kummer
extensions of a discrete valuation ring and Abhyankar's lemma for discrete valuation rings;
"unramified, resp. tamely ramified, over `X` in codimension one" for a finite étale cover of a dense
open (Section 58.31) and its base change (Lemma 58.31.1 (0EYD)); the extension results 58.31.2
(0H2W) and 58.31.3 (0EYE), with regularity of a local ring from a regular quotient by a
nonzerodivisor (Algebra, Lemma 10.106.7 (00NU)); standard tamely ramified covers (Example 58.31.4
(0EYF)); strict henselisation of a quotient and regularity of a strict henselisation (Algebra,
Lemma 10.156.4 (05WS); More on Algebra, Lemma 15.46.10 (06LN)); splitting of finite étale covers
étale locally (Étale Morphisms, Lemma 41.18.3 (04HN)); and Abhyankar's lemma for a regular divisor
with the structure of the normalization (0EYG, 0EYH).

**Owned elsewhere and consumed here.** Each object has one owner; this roadmap uses it and builds
no second carrier.

- *Finite étale covers of punctured spectra and local purity*: [LocalPurity](../LocalPurity/README.md)
  §2.1 (`IsLocalRing.purityHolds_of_isRegularLocalRing`, Stacks 0BMA (1)) and §2.2
  (`spread_from_localScheme`, Stacks 0BQ5 and 0EY3; `finiteEtale_extend_of_purity`, Stacks 0EY7;
  `finiteEtale_extend_of_regular_codimTwo`).
- *Finite étale schemes over a base*: Tau Ceti `TauCeti.FiniteEtaleScheme S` (module
  `TauCeti.AlgebraicGeometry.FiniteEtale.Basic`), Stacks' `FÉt_S` (Section 58.5 (0BL6)), equivalent
  to Mathlib's `(@IsFinite ⊓ @Etale).Over ⊤ S`.
- *Codimension-one points and discrete valuation ring stalks*: Tau Ceti
  `TauCeti.AlgebraicGeometry.CodimensionOnePoint` (module
  `TauCeti.AlgebraicGeometry.Scheme.CodimensionOnePoint`) and the instance
  `TauCeti.AlgebraicGeometry.CodimensionOnePoint.isDiscreteValuationRing_stalk` for a regular stalk.
- *Effective Cartier divisors*: Tau Ceti `AlgebraicGeometry.Scheme.IdealSheafData.IsEffectiveCartier`.
  A *regular divisor* is an ideal sheaf `I` with `I.IsEffectiveCartier` whose subscheme
  `I.subscheme` has every stalk a regular local ring.
- *Regular local rings*: Mathlib `IsRegularLocalRing`, `IsRegularRing`; Tau Ceti
  `TauCeti.IsRegularLocalRing.isDomain` (00NP) and
  `TauCeti.IsRegularLocalRing.quotient_span_singleton` (00NQ for one element);
  [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §4.13 `IsRegular.isNormal`
  (Lemma 10.157.5 (0567)).
- *Regularity of prime localizations*: [PurityOfBranchLocus](../PurityOfBranchLocus/README.md)
  §0.3 (Stacks 0AFS), used for normality of the root algebra in §3.3.
- *Henselization and strict henselisation of a local ring*: SchemeAndStackFoundations §0.12
  (`Henselization.algebra`) and [ModularCurves](../ModularCurves/README.md) §4D, which owns the
  strict henselisation `R → R^{sh}` with respect to a separable closure of the residue field
  (Algebra, Definition 10.155.3 (04GQ)) with the properties of Lemma 10.155.2 (04GP): it is
  strictly henselian, a filtered colimit of étale `R`-algebras, with maximal ideal `𝔪 R^{sh}`.
- *Finite algebras over henselian local rings*: SchemeAndStackFoundations §0.14
  (`henselian_local_finite_algebras`), used to show that the finite local root algebra in §3.3 is
  henselian; its residue field is unchanged, so it is strictly henselian.
- *Descent of morphisms of finitely presented algebras along filtered colimits*: Mathlib
  `CommRingCat.isFinitelyPresentable_under` (parts (2)–(3) of Algebra, Lemma 10.127.8 (05N9)).
- *Normalization and étale base change*: Mathlib `Scheme.Hom.normalization` and the
  `@[stacks 03GV]` instance `IsIso (f.normalizationPullback g)` for smooth `g`.
- *Tame ramification of extensions of nonarchimedean local fields*: Tau Ceti `TauCeti.IsTamelyRamified`
  ([LocalFieldsRamification](../LocalFieldsRamification/README.md) Layer 3). §0.3 compares.
- *Abhyankar's lemma for composita of function fields*: Tau Ceti
  `TauCeti.Place.ramificationIdx_restrict_sup` ([AlgebraicCurves](../AlgebraicCurves/README.md)
  Layer 8). It is a statement about ramification indices of places; §3.3 is the scheme-theoretic
  local structure theorem, and neither implies the other.

Purity of the branch locus is [PurityOfBranchLocus](../PurityOfBranchLocus/README.md). Abhyankar's
lemma for normal crossings divisors, the tame fundamental group and logarithmic structures are not
in this roadmap.

## Conventions

1. Rings are commutative. Schemes and morphisms are Mathlib's `Scheme` and `Scheme.Hom` in a fixed
   universe `u`. Hypotheses such as Noetherian, normal and regular are written on the statement
   that uses them, never folded into a definition.
2. **Statement form.** Every target is stated in Mathlib's and Tau Ceti's vocabulary, against the
   pinned libraries, and that statement is the target. Where the Stacks Project states the same
   result in a different form, the target cites the tag, carries `@[stacks XXXX]`, and an
   accompanying statement in the form of the tag is proved equivalent. Targets with no Stacks
   counterpart are marked *API*.
3. Ramification indices are Mathlib's `Ideal.ramificationIdx`; "`e` prime to the residue
   characteristic, or the residue characteristic is zero" is written "`e` is invertible in the
   residue field".
4. A *standard tamely ramified cover* of `Spec A` along `f` is `A[x]/(x^e − f)`
   (`AdjoinRoot (X ^ e − C f)`) with `A` Noetherian, `f` a nonzerodivisor, `A/fA` reduced and
   `e ≥ 1` invertible in `A` (Stacks, Example 58.31.4 (0EYF)). A finite disjoint union of covers is
   a finite product of algebras.
5. Names: ring-level statements live in the `Algebra` and `IsDiscreteValuationRing` namespaces;
   scheme-level statements in `AlgebraicGeometry`. The suggested forms are in
   `TauCetiRoadmap.AbhyankarLemma`.

## Layer 0: extensions of a discrete valuation ring

### 0.1 Unramified, tamely and totally ramified extensions

Let `A` be a discrete valuation ring with fraction field `K`, `L/K` a finite separable extension,
and `B` the integral closure of `A` in `L`, with maximal ideals `𝔪_1, …, 𝔪_n`, ramification indices
`e_i` and residue degrees `f_i` (Stacks, Remark 15.113.6 (09E8); `[L : K] = Σ e_i f_i` is Mathlib's
`Ideal.sum_ramification_inertia`). Define (Stacks, Definition 15.113.7 (09E9)):

- `Algebra.IsUnramifiedWRT A L`: every `e_i = 1` and every `κ(𝔪_i)/κ_A` is separable;
- `Algebra.IsTamelyRamifiedWRT A L`: every `κ(𝔪_i)/κ_A` is separable and every `e_i` is invertible
  in `κ_A`;
- `Algebra.IsTotallyRamifiedWRT A L`: `n = 1` and `κ(𝔪_1) = κ_A`.

For a finite separable `K`-algebra `L = ∏ L_j` the three notions are required of every factor
`L_j` (Stacks, Section 58.31 (0BSE), last sentence of the definition). API:
`IsUnramifiedWRT.isTamelyRamifiedWRT`, `isTamelyRamifiedWRT_of_charZero` (assuming the **residue
field** `κ_A` has characteristic zero), and `isUnramifiedWRT_iff_etale`: `L` is unramified with
respect to `A` iff `B` is étale over `A`.
*Needs:* Mathlib `IsDiscreteValuationRing`, `integralClosure`, `Ideal.ramificationIdx`,
`Ideal.sum_ramification_inertia`, `Algebra.IsSeparable`, `Algebra.Etale`; Tau Ceti
`TauCeti.ramificationIndex`.

**Checks.**
- `test_gaussian_two`: `ℚ(i)` is not tamely ramified with respect to `ℤ_(2)` (`e = 2`, residue
  characteristic 2).
- `test_cyclotomic_three`: `ℚ(ζ_3)` is tamely and totally ramified with respect to `ℤ_(3)`, `e = 2`.
- `test_gaussian_five`: `ℚ(i)` is unramified with respect to `ℤ_(5)`, with two maximal ideals.

### 0.2 Kummer extensions of a discrete valuation ring

Let `A` be a discrete valuation ring with uniformizer `π` and `n ≥ 2`, and `K_1 = K[π^{1/n}] =
K[X]/(X^n − π)`. Prove `kummer_dvr` (Stacks, Lemma 15.116.2 (09EV)): (1) `[K_1 : K] = n`; (2) the
integral closure `A_1` of `A` in `K_1` is `A[X]/(X^n − π)`; (3) `A_1` is a discrete valuation ring;
(4) its ramification index over `A` is `n`; (5) `K_1` is totally ramified with respect to `A`;
(6) if `n` is invertible in `κ_A`, then `K_1/K` is tamely ramified and every intermediate field of
`K_1/K` is `K[π^{1/d}]` for a divisor `d` of `n`.
*Needs:* §0.1; Mathlib `AdjoinRoot`, `Polynomial.IsEisensteinAt`, `IntermediateField`; Tau Ceti
`TauCeti.isEisensteinAt_X_pow_sub_C_of_irreducible`.

**Checks.**
- `test_kummer_three`: for `A = ℤ_(3)`, `π = 3`, `n = 2`, the integral closure is `ℤ_(3)[√3]`, a
  discrete valuation ring with ramification index `2`.
- `test_kummer_wild`: for `A = ℤ_(2)`, `π = 2`, `n = 2`, clauses (1)–(5) hold and `ℚ(√2)` is not
  tamely ramified with respect to `ℤ_(2)`.

### 0.3 Abhyankar's lemma for discrete valuation rings

In the notation of Stacks, Remark 15.116.1 (09EM): `A ⊂ B` is an extension of discrete valuation
rings with fraction fields `K ⊂ L` and ramification index `e`, `K_1/K` is finite, `A_1` is the
integral closure of `A` in `K_1`, and `L_1 = (L ⊗_K K_1)_red` is a finite product of fields. Let
`B_1` be the integral closure of `B` in `L_1`, with maximal ideals `𝔪_{ij}` over the maximal
ideals `𝔪_i` of `A_1`. The reduction is essential when `K_1/K` is inseparable: the unreduced
tensor product can contain nilpotents and is not a product of fields.

Define the relative `𝔪_B`-adic formal-smoothness predicate for a map of discrete valuation rings
`A → B` as in Stacks, Definition 15.38.1 (07EA): give `B` its `𝔪_B`-adic topology and `A` the
discrete topology; for every **discrete** `A`-algebra `C` with square-zero ideal `J` and every
continuous `A`-algebra map `B → C/J`, require a continuous lift `B → C`. Prove
`adicFormallySmooth_lift_adic`, the corresponding lifting theorem for a complete adic test ring
`C` when `J` is closed and some power of `J` lies in an ideal of definition (Stacks, Lemma
15.38.5 (07EA)); this stronger test-ring form follows
from, but is not the definition of, adic formal smoothness.
Prove `adicFormallySmooth_iff_unramified` (Stacks, Lemma 15.113.5 (09E7)): this predicate holds
iff the ramification index is one and `Algebra.IsTranscendentalSeparable κ_A κ_B` holds, including
separable residue extensions that are not algebraic. Ordinary `Algebra.FormallySmooth` does not
express this adic property, and `IsAdicComplete` or `AdicCompletion` alone does not supply the
lifting theorem.

Prove `abhyankar_dvr` (Stacks, Lemma 15.116.4 (0BRM)): if the residue characteristic of `A` is
zero, or it is `p` with `p ∤ e` and `κ_B/κ_A` separable, and `e` divides the ramification index of
`A ⊂ (A_1)_{𝔪_i}`, then `(A_1)_{𝔪_i} ⊂ (B_1)_{𝔪_{ij}}` is adically formally smooth for every
`j`. Prove `abhyankar_dvr_unramified` (*API*) from the comparison above: each such extension has
ramification index one and separable residue extension. Prove
`isTamelyRamifiedWRT_iff_isTamelyRamified`: for a finite extension `L/K` of nonarchimedean local
fields with valuation ring `𝒪_K`, `Algebra.IsTamelyRamifiedWRT 𝒪_K L ↔ TauCeti.IsTamelyRamified K L`.
*Needs:* §§0.1–0.2; Mathlib `IsDiscreteValuationRing`, `Ideal.ramificationIdx`,
`Algebra.IsSeparable`, `Algebra.IsTranscendentalSeparable`; Tau Ceti
`TauCeti.IsTamelyRamified`.

### 0.4 Kummer characterization and tame base change

Prove `isTamelyRamifiedWRT_iff_exists_kummer` (Stacks, Lemma 15.116.7 (0EXW)), all three clauses:
`L` is tamely ramified with respect to `A` iff there are `e ≥ 1` invertible in `κ_A` and an
extension `L'/K[π^{1/e}]` unramified with respect to `A[π^{1/e}]` containing `L`, iff there is
`e_0` such that this holds with `e = d e_0` for every `d` invertible in `κ_A`. Prove
`IsUnramifiedWRT.baseChange` and `IsTamelyRamifiedWRT.baseChange` (Stacks, Lemma 15.116.9 (0EXY)):
for an extension of discrete valuation rings `A ⊂ A'` with fraction fields `K ⊂ K'` and `L/K`
finite separable, `L ⊗_K K' = ∏ L'_i` is a finite product of fields, and each `L'_i` is
unramified, resp. tamely ramified, with respect to `A'` when `L` is with respect to `A`.
*Needs:* §§0.1–0.3; Mathlib `integralClosure`, `Algebra.IsSeparable`.

## Layer 1: ramification in codimension one

### 1.1 Unramified and tamely ramified covers in codimension one

Let `X` be locally Noetherian, `U ⊆ X` a dense open and `V : TauCeti.FiniteEtaleScheme U` such
that for every codimension-one point `ξ ∉ U` the stalk `𝒪_{X,ξ}` is a discrete valuation ring with
fraction field `K_ξ`. Then `V ×_U Spec K_ξ = Spec L_ξ` with `L_ξ` finite separable over `K_ξ`.
Define `IsUnramifiedInCodimOne X U V` and `IsTamelyRamifiedInCodimOne X U V`: for every such `ξ`,
`L_ξ` is unramified, resp. tamely ramified, with respect to `𝒪_{X,ξ}` (§0.1) (Stacks, Section 58.31
(0BSE), the definition preceding Lemma 58.31.1). Define the affine form along a principal divisor,
`Algebra.IsTamelyRamifiedAlong R S a`, for a finite `R`-algebra `S` and `a ∈ R`: for every prime `Q`
of `S` minimal over `aS` lying over a prime minimal over `aR`, the residue extension is separable and
the ramification index of `Q` over `R` is invertible in the residue field below; and
`Algebra.IsUnramifiedAlong R S a` with ramification index one in place of invertible. Prove the
equivalence `isTamelyRamifiedInCodimOne_spec_iff`: for `R` Noetherian, `a` a nonzerodivisor with
`R/aR` reduced, and `S` the integral closure of `R` in a finite étale `R_a`-algebra `S_a`, `Spec S_a`
is tamely ramified over `Spec R` in codimension one iff `Algebra.IsTamelyRamifiedAlong R S a`;
likewise for unramified. Prove `IsUnramifiedInCodimOne.baseChange` and
`IsTamelyRamifiedInCodimOne.baseChange` (Stacks, Lemma 58.31.1 (0EYD)): for `g : X' ⟶ X` of locally
Noetherian schemes satisfying the four hypotheses of that lemma, both properties pass to the
base change of `V` over `U' = g⁻¹ U`.
*Needs:* §0.1; Tau Ceti `FiniteEtaleScheme`, `CodimensionOnePoint`, `isDiscreteValuationRing_stalk`;
Mathlib `Scheme.Hom.normalization`, `IsIntegralClosure`.

**Checks.**
- `test_square_root_tame`: over `ℤ[1/2]`, `Spec ℤ[1/2][x, t, t⁻¹]/(x² − t) → Spec ℤ[1/2][t, t⁻¹]` is
  tamely ramified over `𝔸¹_{ℤ[1/2]}` in codimension one and not unramified.
- `test_artin_schreier_wild`: over `𝔽_p[t]`, `y^p − y = 1/t` defines a finite étale cover of
  `D(t)` that is not tamely ramified in codimension one at `t = 0`.

## Layer 2: extension across a regular divisor

### 2.1 Extension across a regular complement

Prove `finiteEtale_extend_of_regular_complement` (Stacks, Lemma 58.31.2 (0H2W)): for `X` locally
Noetherian, `U` a dense open, `V : TauCeti.FiniteEtaleScheme U` with `IsUnramifiedInCodimOne X U V`,
and `𝒪_{X,x}` a regular local ring for every `x ∉ U`, `V` is the restriction of a finite étale
scheme over `X`. The proof extends `V` across each codimension-one generic point of `X ∖ U` by
`isUnramifiedWRT_iff_etale` (§0.1) and LocalPurity §2.2 `spread_from_localScheme`, then across the
remaining points, whose local rings are regular of dimension `≥ 2`, by LocalPurity §2.2
`finiteEtale_extend_of_regular_codimTwo`.
*Needs:* §§0.1, 1.1; LocalPurity §2.2; Tau Ceti `FiniteEtaleScheme`, `CodimensionOnePoint`.

### 2.2 Extension across a regular divisor

Prove `IsRegularLocalRing.of_quotient_nonZeroDivisor` and its regular-sequence form
`IsRegularLocalRing.of_quotient_isRegular` (Stacks, Lemma 10.106.7 (00NU)): a Noetherian local
ring `R` with a nonzerodivisor `x ∈ 𝔪` such that `R ⧸ Ideal.span {x}` is a regular local ring is
a regular local ring; more generally the same holds for a regular sequence `x_1, …, x_r` in `𝔪`
(Mathlib `RingTheory.Sequence.IsRegular`) with `R/(x_1, …, x_r)` regular local. The proof: `x`
and lifts of minimal generators of the maximal ideal of `R/xR` generate `𝔪` with `dim R` elements,
since `dim R/xR = dim R − 1` for a nonzerodivisor `x ∈ 𝔪`. Prove `finiteEtale_extend_of_regular_divisor` (Stacks, Lemma 58.31.3 (0EYE)): for `D` a regular
divisor (Scope and ownership) on a locally Noetherian `X` and a finite étale scheme `V` over
`X ∖ D` unramified over `X` in codimension one, `V` is the restriction of a finite étale scheme
over `X`; `X ∖ D` is dense, and regularity of `𝒪_{X,x}` for `x ∈ D` is
`IsRegularLocalRing.of_quotient_nonZeroDivisor`.
*Needs:* §2.1; Tau Ceti `IsEffectiveCartier`; Mathlib `RingTheory.Sequence.IsRegular`,
`ringKrullDim`, `IsRegularLocalRing`.

**Checks.**
- `test_cusp_quotient`: for `R = k⟦x, y⟧/(y² − x³)` and the nonzerodivisor `x`, `R/xR ≅ k[y]/(y²)`
  is not regular, and `R` is not regular local.

## Layer 3: Abhyankar's lemma

### 3.1 Standard tamely ramified covers

For `A` Noetherian, `f ∈ A` a nonzerodivisor with `A/fA` reduced and `e ≥ 1` invertible in `A`,
define `standardTameCover A f e := AdjoinRoot (X^e − C f)` (Convention 4) and
`IsFiniteProductOfStandardTameCovers A C f`: `C` is `A`-isomorphic to a finite product of
`standardTameCover A f e_i` with each `e_i ≥ 1` invertible in `A`. Prove the assertions of Stacks,
Example 58.31.4 (0EYF): `standardTameCover_free` (free of rank `e`), `standardTameCover_etale_away`
(étale over `A_f`), `dvr_of_minimal_over` (`A_𝔭` is a discrete valuation ring with uniformizer `f`
for `𝔭` minimal over `f`) and `standardTameCover_isTamelyRamifiedAlong` (via
`isTamelyRamifiedWRT_iff_exists_kummer`, §0.4). Prove `standardTameCover_isIntegralClosure`
(*API*, the omitted step of 58.31.6): if `A/fA` is regular, then `standardTameCover A f e` is the
integral closure of `A` in its localization at `f`, `x` is a nonzerodivisor in it with quotient
`A/fA`, and its localizations at primes over `(f)` are regular.
*Needs:* §§0.1–0.4, 1.1, 2.2; Mathlib `AdjoinRoot`,
`Algebra.Etale`, `Module.Free`, `IsIntegralClosure`.

**Checks.**
- `test_standard_cover_kummer`: for `A = ℤ_(3)[t]`, `f = t`, `e = 2`, the cover is free of rank 2,
  étale over `A_t`, and it is the integral closure of `A` in its localization at `t`.
- `test_standard_cover_inseparable`: for `A = 𝔽_2[t]`, `f = t`, `e = 2`, the exponent is not
  invertible, and `A_t[x]/(x² − t)` is not étale over `A_t` (the derivative `2x` vanishes).

### 3.2 Strict henselisation and splitting of finite étale covers

For a local ring `R` and its strict henselisation `R → R^{sh}` (ModularCurves §4D), prove
`strictHenselization_quotient` (Algebra, Lemma 10.156.4 (05WS)): for an ideal `I ⊆ 𝔪_R`,
`R^{sh}/IR^{sh}` is a strict henselisation of `R/I`; and `isRegularLocalRing_iff_strictHenselization`
(More on Algebra, Lemma 15.46.10 (06LN)): for `R` Noetherian, `R` is regular iff its henselisation
is regular iff its strict henselisation is regular.
Prove `finiteEtale_split_etaleLocally` (Stacks, Lemma 41.18.3 (04HN)): for `f : X ⟶ S` finite étale
and `s : S`, there are an étale `φ : U ⟶ S`, `u : U` with `φ u = s`, and a finite decomposition of
the base change of `X` to `U` into open and closed subschemes each mapping isomorphically to `U`.
Prove the local form used in §3.3, `finiteEtale_split_of_strictlyHenselian`: over a strictly
henselian local ring every finite étale algebra is a finite product of copies of the base.
*Needs:* Tau Ceti `FiniteEtaleScheme`; ModularCurves §4D (strict henselisation);
SchemeAndStackFoundations §0.12 (henselisation); Mathlib `HenselianLocalRing`, `IsSepClosed`,
`Algebra.Etale`, `IsRegularLocalRing`, `AdicCompletion`.

### 3.3 Abhyankar's lemma

Prove `abhyankar_regularDivisor` (Stacks, Lemma 58.31.5 (0EYG)): let `X` be locally Noetherian, `D` a
regular divisor and `V` a finite étale scheme over `X ∖ D` that is tamely ramified over `X` in
codimension one; then for every `x : X` there are an étale `φ : Spec A ⟶ X` and `u` with `φ u = x`
such that `D` pulls back to `V(f)` for a nonzerodivisor `f` with `A/fA` regular, and the base
change of `V` to `Spec A_f` is isomorphic over `Spec A_f` to the restriction of a finite disjoint
union of `Spec (standardTameCover A f e_i)`. Prove its affine form `Algebra.abhyankar_standardCover`:
for `R` Noetherian, `a ∈ R` a nonzerodivisor with `R/aR` regular, `S` a finite `R`-algebra, étale
over `R_a`, equal to the integral closure of `R` in `S_a`, with `Algebra.IsTamelyRamifiedAlong R S a`,
every prime of `R` containing `a` has an étale neighbourhood `R → R'` over which `R' ⊗_R S`
satisfies `IsFiniteProductOfStandardTameCovers R' (R' ⊗_R S) a`. The proof follows Stacks: reduce
to `𝒪_{X,x}`
strictly henselian using the strict henselisation of ModularCurves §4D (`A^{sh}/fA^{sh}` is the
strict henselisation of `A/fA` by `strictHenselization_quotient`, and it is regular by
`isRegularLocalRing_iff_strictHenselization`, §3.2),
`IsTamelyRamifiedInCodimOne.baseChange` (§1.1), and Mathlib's descent of morphisms between
finitely presented algebras along filtered colimits
(`CommRingCat.isFinitelyPresentable_under`); then `A` is a regular local domain and `f` is prime;
with `e` the product of the ramification indices, `A' = A[x]/(x^e − f)` is regular and strictly
henselian. Its regularity follows by applying §2.2 at the primes over `f`; its strict
henselianity uses SchemeAndStackFoundations §0.14 for finite algebras over a henselian local ring,
and the unchanged separably closed residue field. Abhyankar's lemma for discrete valuation rings
(§0.3) makes the base change unramified in codimension one; §2.2 extends it to a finite étale,
hence split (§3.2), cover of `Spec A'`; and `kummer_dvr` (6) (§0.2) identifies the function field
of each component with `K[f^{1/n}]` for `n ∣ e`.

The root-algebra identification needs a separate bridge before asserting `n ∈ Aˣ`. Prove
`rootAlgebra_regular` and `rootAlgebra_isNormal` in this regular-local setting for every `n ≥ 1`,
without assuming `n` is a unit: the root `y` is a nonzerodivisor, the quotient by `y` is `A/fA`,
and every maximal localization is regular by §2.2. Apply PurityOfBranchLocus §0.3 (0AFS) to
pass regularity to every prime localization, then SchemeAndStackFoundations §4.13 (0567) for
normality. The resulting finite normal `A`-algebra and the normalization `S` have the same
localization over `A_f` and the same total ring of fractions,
so uniqueness of integral closure identifies them. Their localization over `A_f` is étale;
the monogenic étaleness criterion and derivative `n y^{n-1}` make `n` a unit in the root algebra
localized at `f`. Its finite free positive-rank map from `A_f` is faithfully flat, so units
descend and `n ∈ A_fˣ`. Since `f` is prime and `n ∉ (f)` (the tame ramification index is prime
to the residue characteristic at `(f)`),
`n ∈ A_fˣ` forces `n ∈ Aˣ`. This establishes the required standard-cover exponent condition,
rather than assuming it from the DVR classification alone.
*Needs:* §§0.2–0.4, 1.1, 2.2, 3.1, 3.2; ModularCurves §4D;
PurityOfBranchLocus §0.3; SchemeAndStackFoundations §§0.14, 4.13; Mathlib
`CommRingCat.isFinitelyPresentable_under`.

### 3.4 The normalization

Prove `abhyankar_normalization` (Stacks, Lemma 58.31.6 (0EYH)): in the situation of §3.3 the
normalization `π : Y' → X` of `X` in `V` (Mathlib `Scheme.Hom.normalization`) is finite locally
free, its restriction to `X ∖ D` is `V`, `D' = (π⁻¹ D)_red` is an effective Cartier divisor on `Y'`,
and `D'` is regular; moreover, étale locally on `X`, `Y' → X` is a finite disjoint union of
`Spec A[x]/(x^e − f) → Spec A` with `A` Noetherian, `f` a nonzerodivisor with `A/fA` regular and
`e ≥ 1` invertible in `A`. Normalization commutes with étale base change by Mathlib's `@[stacks 03GV]`
instance `IsIso (f.normalizationPullback g)` for smooth `g`, and `standardTameCover_isIntegralClosure`
(§3.1) gives the local model.
Prove `abhyankar_affine_iff_scheme` (*API*): for `X = Spec R` and `D = V(a)`, the scheme form of
§3.3 and its affine form are equivalent after identifying the finite normalization with
`Spec S`, where `S` is the integral closure of `R` in the finite étale algebra of the cover over
`R_a`. Use `isTamelyRamifiedInCodimOne_spec_iff` (§1.1) and the finiteness and affine
identification established in this section; §3.3 alone does not supply either of them.
*Needs:* §§3.1, 3.3; Mathlib `Scheme.Hom.normalization`, `Scheme.Hom.normalizationPullback`,
`IsIntegralClosure`; Tau Ceti `IsEffectiveCartier`.

**Checks.**
- `test_abhyankar_charZero`: over a field of characteristic zero, every finite étale cover of
  `𝔸² ∖ {x = 0}` is tamely ramified over `𝔸²` in codimension one, and §3.3 applies.
- `test_abhyankar_wild`: over `𝔽_p`, the Artin–Schreier cover `y^p − y = 1/x` of `𝔸¹ ∖ {0}` is not
  tamely ramified at `x = 0`, and is not étale locally a disjoint union of standard tamely ramified
  covers.

## Stacks alignment

*Exact*: the tag's hypotheses and conclusion, in Mathlib's and Tau Ceti's vocabulary. *Adapted*:
same mathematics in an equivalent packaging, with the difference stated at the target and the
equivalence a target. *API*: no Stacks counterpart.

| § | Target | Stacks | Class |
| --- | --- | --- | --- |
| 0.1 | `IsUnramifiedWRT`, `IsTamelyRamifiedWRT`, `IsTotallyRamifiedWRT` | 15.113.7 (09E9) | exact |
| 0.1 | `isUnramifiedWRT_iff_etale` | — | API (equivalence) |
| 0.2 | `kummer_dvr` | 15.116.2 (09EV) | exact |
| 0.3 | `adicFormallySmooth`, `adicFormallySmooth_lift_adic` | 15.38.1, 15.38.5 (07EA) | exact |
| 0.3 | `adicFormallySmooth_iff_unramified` | 15.113.5 (09E7) | exact |
| 0.3 | `abhyankar_dvr` | 15.116.4 (0BRM) | exact |
| 0.3 | `abhyankar_dvr_unramified`, `isTamelyRamifiedWRT_iff_isTamelyRamified` | — | API |
| 0.4 | `isTamelyRamifiedWRT_iff_exists_kummer` | 15.116.7 (0EXW) | exact |
| 0.4 | `.baseChange` | 15.116.9 (0EXY) | exact |
| 1.1 | `IsUnramifiedInCodimOne`, `IsTamelyRamifiedInCodimOne` | Section 58.31 (0BSE) | exact |
| 1.1 | `IsTamelyRamifiedAlong`, `isTamelyRamifiedInCodimOne_spec_iff` | Section 58.31 (0BSE) | adapted (affine) + equivalence |
| 1.1 | `.baseChange` | 58.31.1 (0EYD) | exact |
| 2.1 | `finiteEtale_extend_of_regular_complement` | 58.31.2 (0H2W) | exact |
| 2.2 | `IsRegularLocalRing.of_quotient_nonZeroDivisor`, `of_quotient_isRegular` | 10.106.7 (00NU) | exact |
| 2.2 | `finiteEtale_extend_of_regular_divisor` | 58.31.3 (0EYE) | exact |
| 3.1 | `standardTameCover` and its properties | 58.31.4 (0EYF) | exact |
| 3.1 | `standardTameCover_isIntegralClosure` | — | API (step of 0EYH) |
| 3.2 | `strictHenselization_quotient` | 10.156.4 (05WS) | exact |
| 3.2 | `isRegularLocalRing_iff_strictHenselization` | 15.46.10 (06LN) | exact |
| 3.2 | `finiteEtale_split_etaleLocally` | 41.18.3 (04HN) | exact |
| 3.3 | `abhyankar_regularDivisor` | 58.31.5 (0EYG) | exact |
| 3.3 | `Algebra.abhyankar_standardCover` | 58.31.5 (0EYG) | adapted (affine) + equivalence |
| 3.4 | `abhyankar_normalization` | 58.31.6 (0EYH) | exact |
| 3.4 | `abhyankar_affine_iff_scheme` | — | API (equivalence) |

## Provenance

This section is secondary; it maps targets to an existing formalization and prescribes nothing.
The repository https://github.com/tdupu/pcfawd-formalization (Apache-2.0; T. Dupuy, T. Tucker,
Z. Wang; Lean 4, Mathlib, no `sorry`) contains a development of much of this material, built for
the "PCF all the way down" theorem. Paths are under `lean/Pcf/Stacks/`.

| § | Existing declarations | Files |
| --- | --- | --- |
| 0.1 | `IsTamelyRamifiedOver` (09E9) | `Abhyankar/Scheme/Defs.lean`, `Abhyankar/TameRamification.lean` |
| 0.2 | the 09EV clauses | `Abhyankar/KummerDVR.lean`, `KummerClauses.lean`, `KummerIntermediateEquiv.lean` |
| 0.3 | `maximalIdeal_eq_span_root_of_dvd_and_isSeparable`, `formallyUnramified_dvrRoot_of_dvd` (0BRM) | `Abhyankar/DVRAbhyankarDivisible.lean` |
| 1.1 | `IsTamelyRamifiedInCodimensionOne` (0BSE); 0EYD after strict henselization | `Abhyankar/Scheme/Defs.lean`, `Abhyankar/Tame/StrictBaseChangeTame.lean` |
| 2.2 | 0EYE | `Abhyankar/Tag0EYE.lean` |
| 3.1–3.2 | standard covers, `hasSplitCoverAt_of_finite_etale` (04HN, affine) | `Abhyankar/StandardCover*.lean`, `Abhyankar/Scheme/FiniteEtaleSplitting.lean` |
| 3.3–3.4 | `abhyankarLemma_scheme` (0EYG), `abhyankarLemma_normalization` (0EYH) | `Abhyankar/Scheme/Tag0EYG.lean`, `Abhyankar/Scheme/Tag0EYH.lean` |

Its strict henselisation is a colimit model of its own.

## References

- The Stacks Project, Chapters 10 (Algebra), 15 (More on Algebra), 41 (Étale Morphisms) and 58
  (Fundamental Groups of Schemes), https://stacks.math.columbia.edu.
- A. Grothendieck, *Revêtements étales et groupe fondamental* (SGA 1), Exposé X, Lemme 3.6
  (Abhyankar's lemma for a discrete valuation ring); Exposé XIII, §5, Propositions 5.2 and 5.5
  (Abhyankar's lemma for normal crossings divisors).
