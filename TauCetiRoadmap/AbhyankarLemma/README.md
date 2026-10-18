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
SchemeAndStackFoundations §0.17 (00NU) ─────────→ Layers 2, 3
ModularCurves §4D (strict henselization) ───────→ Layer 3
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
(0H2W) and 58.31.3 (0EYE); standard tamely ramified covers (Example 58.31.4 (0EYF)); splitting of
finite étale covers étale locally (Étale Morphisms, Lemma 41.18.3 (04HN)); and Abhyankar's lemma
for a regular divisor with the structure of the normalization (0EYG, 0EYH).

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
  `TauCeti.IsRegularLocalRing.isDomain` (00NP);
  [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §0.17
  `IsRegularLocalRing.of_quotient_nonZeroDivisor` (Algebra, Lemma 10.106.7 (00NU)) and §4.13
  `IsRegular.isNormal` (Lemma 10.157.5 (0567)).
- *Strict henselization of a local ring, its quotients and regularity*:
  [ModularCurves](../ModularCurves/README.md) §4D (`StrictHenselization.algebra R Ω` with
  `existsUnique_lift`, Algebra, Definition 10.155.3 (04GQ) and Lemma 10.155.9 (04GT);
  `exists_quotient_equiv`, Lemma 10.156.4 (05WS); `isRegularLocalRing_iff`, More on Algebra, Lemma
  15.46.10 (06LN)).
- *Descent of morphisms of finitely presented algebras along filtered colimits*: Mathlib
  `CommRingCat.isFinitelyPresentable_under` (parts (2)–(3) of Algebra, Lemma 10.127.8 (05N9)).
- *Normalization and étale base change*: Mathlib `Scheme.Hom.normalization` and the
  `@[stacks 03GV]` instance `IsIso (f.normalizationPullback g)` for smooth `g`.
- *Tame ramification of extensions of nonarchimedean local fields*: Tau Ceti `TauCeti.IsTamelyRamified`
  ([LocalFieldsRamification](../LocalFieldsRamification/README.md) Layer 3). §0.1 compares.
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
`IsUnramifiedWRT.isTamelyRamifiedWRT`, `isTamelyRamifiedWRT_of_charZero`, and
`isUnramifiedWRT_iff_etale`: `L` is unramified with respect to `A` iff `B` is étale over `A`. Prove
`isTamelyRamifiedWRT_iff_exists_kummer` (Stacks, Lemma 15.116.7 (0EXW)), all three clauses: `L` is
tamely ramified with respect to `A` iff there are `e ≥ 1` invertible in `κ_A` and an extension
`L'/K[π^{1/e}]` unramified with respect to `A[π^{1/e}]` containing `L`, iff there is `e_0` such that
this holds with `e = d e_0` for every `d` invertible in `κ_A`. Prove `IsUnramifiedWRT.baseChange` and
`IsTamelyRamifiedWRT.baseChange` (Stacks, Lemma 15.116.9 (0EXY)): for an extension of discrete
valuation rings `A ⊂ A'` with fraction fields `K ⊂ K'` and `L/K` finite separable,
`L ⊗_K K' = ∏ L'_i` is a finite product of fields, and each `L'_i` is unramified, resp. tamely
ramified, with respect to `A'` when `L` is with respect to `A`. Prove
`isTamelyRamifiedWRT_iff_isTamelyRamified`: for a finite extension `L/K` of nonarchimedean local
fields with valuation ring `𝒪_K`, `Algebra.IsTamelyRamifiedWRT 𝒪_K L ↔ TauCeti.IsTamelyRamified K L`.
*Needs:* Mathlib `IsDiscreteValuationRing`, `integralClosure`, `Ideal.ramificationIdx`,
`Ideal.sum_ramification_inertia`, `Algebra.IsSeparable`, `Algebra.Etale`; Tau Ceti
`TauCeti.IsTamelyRamified`, `TauCeti.ramificationIndex`.

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

In the notation of Stacks, Remark 15.116.1: `A ⊂ B` an extension of discrete valuation rings with
fraction fields `K ⊂ L` and ramification index `e`, `K_1/K` finite, `A_1` the integral closure of
`A` in `K_1` with maximal ideals `𝔪_i`, `B_1` the integral closure of `B` in `K_1 ⊗_K L` with
maximal ideals `𝔪_{ij}` over `𝔪_i`. Prove `abhyankar_dvr` (Stacks, Lemma 15.116.4 (0BRM)): if the
residue characteristic of `A` is `0`, or it is `p` with `p ∤ e` and `κ_B/κ_A` separable, and `e`
divides the ramification index of `A ⊂ (A_1)_{𝔪_i}`, then `(A_1)_{𝔪_i} ⊂ (B_1)_{𝔪_{ij}}` is formally
smooth in the `𝔪_{ij}`-adic topology for every `j`. Prove the consequence
`abhyankar_dvr_unramified` (*API*): under the same hypotheses each `(A_1)_{𝔪_i} → (B_1)_{𝔪_{ij}}` is an
extension of discrete valuation rings with ramification index one and separable residue extension.
*Needs:* §§0.1–0.2; Mathlib `Algebra.FormallySmooth`, `IsAdicComplete`, `AdicCompletion`.

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

Prove `finiteEtale_extend_of_regular_divisor` (Stacks, Lemma 58.31.3 (0EYE)): for `D` a regular
divisor (Scope and ownership) on a locally Noetherian `X` and a finite étale scheme `V` over `X ∖ D` unramified
over `X` in codimension one, `V` is the restriction of a finite étale scheme over `X`; `X ∖ D` is
dense, and regularity of `𝒪_{X,x}` for `x ∈ D` is SchemeAndStackFoundations §0.17
`IsRegularLocalRing.of_quotient_nonZeroDivisor` (00NU).
*Needs:* §2.1; SchemeAndStackFoundations §0.17; Tau Ceti `IsEffectiveCartier`.

## Layer 3: Abhyankar's lemma

### 3.1 Standard tamely ramified covers

For `A` Noetherian, `f ∈ A` a nonzerodivisor with `A/fA` reduced and `e ≥ 1` invertible in `A`,
define `standardTameCover A f e := AdjoinRoot (X^e − C f)` (Convention 4) and
`IsFiniteProductOfStandardTameCovers A C f`: `C` is `A`-isomorphic to a finite product of
`standardTameCover A f e_i` with each `e_i ≥ 1` invertible in `A`. Prove the assertions of Stacks,
Example 58.31.4 (0EYF): `standardTameCover_free` (free of rank `e`), `standardTameCover_etale_away`
(étale over `A_f`), `dvr_of_minimal_over` (`A_𝔭` is a discrete valuation ring with uniformizer `f`
for `𝔭` minimal over `f`) and `standardTameCover_isTamelyRamifiedAlong` (via
`isTamelyRamifiedWRT_iff_exists_kummer`, §0.1). Prove `standardTameCover_isIntegralClosure`
(*API*, the omitted step of 58.31.6): if `A/fA` is regular, then `standardTameCover A f e` is the
integral closure of `A` in its localization at `f`, `x` is a nonzerodivisor in it with quotient
`A/fA`, and its localizations at primes over `(f)` are regular.
*Needs:* §§0.1–0.2, 1.1; SchemeAndStackFoundations §0.17 (00NU); Mathlib `AdjoinRoot`,
`Algebra.Etale`, `Module.Free`, `IsIntegralClosure`.

**Checks.**
- `test_standard_cover_kummer`: for `A = ℤ_(3)[t]`, `f = t`, `e = 2`, the cover is free of rank 2,
  étale over `A_t`, and it is the integral closure of `A` in its localization at `t`.
- `test_standard_cover_inseparable`: for `A = 𝔽_2[t]`, `f = t`, `e = 2`, the exponent is not
  invertible, and `A_t[x]/(x² − t)` is not étale over `A_t` (the derivative `2x` vanishes).

### 3.2 Splitting of finite étale covers

Prove `finiteEtale_split_etaleLocally` (Stacks, Lemma 41.18.3 (04HN)): for `f : X ⟶ S` finite étale
and `s : S`, there are an étale `φ : U ⟶ S`, `u : U` with `φ u = s`, and a finite decomposition of
the base change of `X` to `U` into open and closed subschemes each mapping isomorphically to `U`.
Prove the local form used in §3.3, `finiteEtale_split_of_strictlyHenselian`: over a strictly
henselian local ring every finite étale algebra is a finite product of copies of the base.
*Needs:* Tau Ceti `FiniteEtaleScheme`; ModularCurves §4D (strictly henselian local rings); Mathlib
`HenselianLocalRing`, `IsSepClosed`, `Algebra.Etale`.

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
satisfies `IsFiniteProductOfStandardTameCovers R' (R' ⊗_R S) a`. For `X = Spec R` and `D = V(a)`
the two forms are equivalent, with `S` the integral closure of `R` in `Γ(V, 𝒪_V)`, by
`isTamelyRamifiedInCodimOne_spec_iff` (§1.1). The proof follows Stacks: reduce to `𝒪_{X,x}`
strictly henselian using ModularCurves §4D (`A^{sh}/fA^{sh}` is the strict henselization of `A/fA`,
05WS; it is regular, 06LN), `IsTamelyRamifiedInCodimOne.baseChange` (§1.1) and Mathlib's descent
of morphisms between finitely presented algebras along filtered colimits
(`CommRingCat.isFinitelyPresentable_under`); then `A` is a regular local domain and `f` is prime;
with `e` the product of the ramification indices, `A' = A[x]/(x^e − f)` is regular and strictly
henselian; Abhyankar's lemma for discrete valuation rings (§0.3) makes the base change unramified
in codimension one; §2.2 extends it to a finite étale, hence split (§3.2), cover of `Spec A'`; and
`kummer_dvr` (6) (§0.2) identifies the function field of each component with `K[f^{1/n}]` for
`n ∣ e` invertible in `A`.
*Needs:* §§0.2, 0.3, 1.1, 2.2, 3.1, 3.2; ModularCurves §4D; Mathlib
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
| 0.1 | `isTamelyRamifiedWRT_iff_exists_kummer` | 15.116.7 (0EXW) | exact |
| 0.1 | `.baseChange` | 15.116.9 (0EXY) | exact |
| 0.1 | `isUnramifiedWRT_iff_etale`, `isTamelyRamifiedWRT_iff_isTamelyRamified` | — | API (equivalences) |
| 0.2 | `kummer_dvr` | 15.116.2 (09EV) | exact |
| 0.3 | `abhyankar_dvr` | 15.116.4 (0BRM) | exact |
| 0.3 | `abhyankar_dvr_unramified` | — | API |
| 1.1 | `IsUnramifiedInCodimOne`, `IsTamelyRamifiedInCodimOne` | Section 58.31 (0BSE) | exact |
| 1.1 | `IsTamelyRamifiedAlong`, `isTamelyRamifiedInCodimOne_spec_iff` | Section 58.31 (0BSE) | adapted (affine) + equivalence |
| 1.1 | `.baseChange` | 58.31.1 (0EYD) | exact |
| 2.1 | `finiteEtale_extend_of_regular_complement` | 58.31.2 (0H2W) | exact |
| 2.2 | `finiteEtale_extend_of_regular_divisor` | 58.31.3 (0EYE) | exact |
| 3.1 | `standardTameCover` and its properties | 58.31.4 (0EYF) | exact |
| 3.1 | `standardTameCover_isIntegralClosure` | — | API (step of 0EYH) |
| 3.2 | `finiteEtale_split_etaleLocally` | 41.18.3 (04HN) | exact |
| 3.3 | `abhyankar_regularDivisor` | 58.31.5 (0EYG) | exact |
| 3.3 | `Algebra.abhyankar_standardCover` | 58.31.5 (0EYG) | adapted (affine) + equivalence |
| 3.4 | `abhyankar_normalization` | 58.31.6 (0EYH) | exact |

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

Its strict henselization is a colimit model without the universal property of ModularCurves §4D.

## References

- The Stacks Project, Chapters 10 (Algebra), 15 (More on Algebra), 41 (Étale Morphisms) and 58
  (Fundamental Groups of Schemes), https://stacks.math.columbia.edu.
- A. Grothendieck, *Revêtements étales et groupe fondamental* (SGA 1), Exposé X, Lemme 3.6
  (Abhyankar's lemma for a discrete valuation ring); Exposé XIII, §5, Propositions 5.2 and 5.5
  (Abhyankar's lemma for normal crossings divisors).
