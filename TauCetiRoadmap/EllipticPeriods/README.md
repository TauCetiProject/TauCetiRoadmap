# Roadmap: elliptic functions, periods and complex multiplication

**Summary.** Build the complex-analytic theory of a lattice `Λ ⊂ ℂ` that the transcendence of
elliptic periods needs, on Mathlib's `PeriodPair` and Weierstrass `℘`: elliptic functions and
their Laurent algebra, the Weierstrass `ζ` function, the dictionary with Mathlib's Eisenstein
series `E₂, E₄, E₆`, the period matrix and the period field `ℚ(ω₁, ω₂, η₁, η₂)`, and complex
multiplication of lattices. Prove the unconditional bounds: the period field has transcendence
degree at most `4`; when `g₂, g₃` are algebraic it is at least `2` (Chudnovsky's theorem, derived
from DiophantineApproximationAndTranscendence's `nesterenko`) and, with complex multiplication, at
most `2`, so exactly `2` in the CM case. Without algebraic invariants the lower bound fails: for
`Λ = π·ℤ[i]` the period field is `ℚ(π, i)`, of transcendence degree `1`. The `σ` function, the
quasi-period map and Legendre's relation are consumed from ModularCurvesPartII.

Suggested home: `TauCeti/Analysis/SpecialFunctions/Elliptic/` (mirroring Mathlib's
`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`) for Layers 0–2 and 4, and
`TauCeti/NumberTheory/Transcendental/EllipticPeriods/` for Layers 3 and 5.

## Scope and ownership

**In scope.** Everything is a statement about a lattice `Λ = ℤω₁ + ℤω₂`, given as a Mathlib
`PeriodPair L`, and about the functions `℘ = L.weierstrassP`, `ζ`, and the numbers built from
them. This roadmap owns:

- the elliptic-function API of a `PeriodPair` (Layer 1): Liouville, the residue and order
  balance over a period parallelogram, even elliptic functions as rational functions of `℘` and
  the descent of their coefficients, `4X³ − g₂X − g₃ = 4∏(X − e_i)`, the Laurent expansion of
  `℘` and the polynomiality of `G_{2k}` in `g₂, g₃`;
- the Weierstrass `ζ` function as a series, the quasi-period map `quasiPeriod` read off from it,
  their identification with `σ′/σ` and `latticeQuasiPeriod`, and the homogeneity of `G_k` for all
  `k` under `Λ ↦ cΛ` (Layers 0 and 2);
- the dictionary between the lattice invariants `g₂, g₃, η(1)` of `ℤ + ℤτ` and Mathlib's
  `ModularForm.E₄`, `ModularForm.E₆`, `EisensteinSeries.E2` (Layer 2);
- the period matrix, the period field and its transcendence degree (Layers 3, 5);
- complex multiplication of a lattice, as an analytic property `HasCM`, and the CM relation
  between quasi-periods (Layer 4).

**Out of scope, with owner.**

- *Weierstrass curves as algebraic objects, isogenies, `End(E)` and the predicate
  `HasGeometricCM`*: [EllipticCurves](../EllipticCurves/README.md), which excludes complex
  uniformisation and leaves Mathlib's `℘` unconsumed. Nothing here uses its isogenies.
- *Nesterenko's theorem* (three of `q, E₂(τ), E₄(τ), E₆(τ)` algebraically independent):
  [DiophantineApproximationAndTranscendence](../DiophantineApproximationAndTranscendence/README.md)
  §5.6, theorem `nesterenko`. Layer 5 consumes it and proves nothing about modular values.
- *The residue theorem on null-homologous cycles and winding numbers of polygonal curves*:
  [ContourIntegration](../../Completed/ContourIntegration/README.md), implemented in Tau Ceti
  (`TauCeti.Contour.classicalResidueTheorem_nullHomologous`, `TauCeti.Contour.residue`).
- *The `σ` function, the quasi-period map `latticeQuasiPeriod` and Legendre's relation; the
  Laurent leading terms of `℘` and `℘′`, the half-period values and `g₂³ − 27g₃² ≠ 0`; the
  homotheties of `g₂`, `g₃` and `℘`*: ModularCurvesPartII §§1.4a, 1.1 and 1.3, consumed here
  (Exact supplier contracts); this roadmap constructs none of them.
- *Complex tori `ℂ/Λ` and their maps*: [ComplexTori](../ComplexTori/README.md); abelian-variety
  uniformisation and the analytic–algebraic `Hom` comparison: AbelianSchemesAndArithmeticModuli,
  A5.1, with ModularCurvesPartII's Weierstrass specialisation. The multiplier ring of a rank-two
  lattice (Layer 4) is the analytic specialisation kept here.
- *Algebraic complex multiplication* (`EndOver`, `CMAction`, `HasGeometricCM`):
  [EllipticCurves](../EllipticCurves/README.md); CM reciprocity and higher-dimensional CM periods:
  ComplexMultiplicationAndExplicitReciprocity. `HasCM L` here is the lattice property; an adapter
  to `HasGeometricCM` is proved once the geometric comparison exists.
- *Realisations, the de Rham–Betti comparison and determinant lines*: ComplexComparisonPartII
  (Layer C5), MotivesAndAlgebraicCycles (§2.6, and §§6.7–6.9 for formal periods), and
  PeriodsAndSpecialValues (PS.0.1, with the elliptic example PS.0.5). Layer 3's period matrix is
  numerical; its geometric interpretation consumes those contracts. Orientation: here forms are
  rows and cycles columns; PeriodsAndSpecialValues' integration matrix has cycles as rows, and
  Deligne's comparison is its inverse.

The boundary in one sentence: if a statement is about a lattice in `ℂ` and functions or
numbers attached to it, it is here; if it is about a Weierstrass equation over a field, it is
in EllipticCurves; if it is about modular values, it is in DiophantineApproximationAndTranscendence.

## Standing conventions

- **The object is a `PeriodPair`.** No new lattice structure. Statements that depend only on
  the lattice are proved invariant under change of `PeriodPair` with the same `lattice` (for `℘`
  and `G_k` in Layer 0, then `quasiPeriod_congr`, `periodField_congr`).
- **Orientation.** A `PeriodPair` is unoriented. A basis is *positive* when
  `0 < (L.ω₂ / L.ω₁).im`; this hypothesis is written out where needed, never wrapped in a
  predicate. `ofUpperHalfPlane τ = (1, τ)` is positive.
- **Quasi-periods.** `ζ(z) = 1/z + ∑'_{l ≠ 0} (1/(z − l) + 1/l + z/l²)` (DLMF 23.2.5), so
  `ζ′ = −℘` and `ζ` is odd; `ζ = σ′/σ` with ModularCurvesPartII's `latticeSigma`.
  `quasiPeriod L l = ζ(ω₁/2 + l) − ζ(ω₁/2)`, read at the base point `ω₁/2 ∉ Λ`
  (`ω₁_div_two_notMem_lattice`); for `l ∈ Λ` it is `latticeQuasiPeriod` at `l`, and
  `ζ(z + l) = ζ(z) + η(l)` for `z ∉ Λ`: the quasi-period of the *full* period `l`. DLMF writes
  the lattice as `2ω₁ℤ + 2ω₃ℤ` and `η_j = ζ(ω_j)`, so its `η_j` is half of `η(2ω_j)` here.
- **Legendre** (ModularCurvesPartII, `latticeQuasiPeriod_legendre`). For a positive basis,
  `η(ω₁) ω₂ − η(ω₂) ω₁ = 2πi` (DLMF 23.2.14 in full-period form). Reversing the basis changes
  the sign. In matrix form: the period matrix `P = [[ω₁, ω₂], [η(ω₁), η(ω₂)]]` has
  `det P = −2πi`.
- **Scaling.** `c • L = (cω₁, cω₂)` for `c : ℂˣ`. Then `G_k(cΛ) = c⁻ᵏ G_k(Λ)`,
  `℘_{cΛ}(cz) = c⁻² ℘_Λ(z)`, `ζ_{cΛ}(cz) = c⁻¹ ζ_Λ(z)`, `η_{cΛ}(cl) = c⁻¹ η_Λ(l)`.
- **Algebraic.** "Algebraic" is `IsAlgebraic ℚ` inside `ℂ`; "algebraic invariants" is the pair
  of hypotheses `IsAlgebraic ℚ L.g₂`, `IsAlgebraic ℚ L.g₃`, written out. Transcendence degrees
  are `Algebra.trdeg ℚ` of an `IntermediateField ℚ ℂ`; since `ℚ̄/ℚ` is algebraic this is the
  transcendence degree over `ℚ̄` of the compositum with `ℚ̄`, which is how the literature states
  it.
- **Complex multiplication.** `HasCM L` means `∃ α : ℂ, α.im ≠ 0 ∧ ∀ l ∈ L.lattice, α * l ∈
  L.lattice`. It depends only on the lattice and is invariant under scaling. A *multiplier* is
  any `α` with `α * l ∈ L.lattice` for all `l ∈ L.lattice`, real or not.
- **Junk values.** As in Mathlib, `℘`, `ζ` take junk values at lattice points; statements about
  values carry `z ∉ L.lattice`, and identities between elliptic functions hold
  `∀ᶠ z in Filter.codiscrete ℂ`.

## Exact supplier contracts

### From Mathlib

- **Lattices and `℘`.** `PeriodPair` (fields `ω₁ ω₂ : ℂ`, `indep : LinearIndependent ℝ ![ω₁, ω₂]`),
  `PeriodPair.lattice : Submodule ℤ ℂ`, `latticeBasis`, `IsZLattice ℝ L.lattice`,
  `ω₁_div_two_notMem_lattice`; `PeriodPair.weierstrassP` (scoped notation `℘[L]`), its
  periodicity `weierstrassP_add_coe`, evenness, `meromorphic_weierstrassP`,
  `order_weierstrassP` (double poles at the lattice), `analyticOnNhd_weierstrassP`, the power
  series `hasFPowerSeriesOnBall_weierstrassP`; `derivWeierstrassP` with periodicity and
  oddness; `PeriodPair.G n = ∑' l, l⁻ⁿ`, `G_eq_zero_of_odd`, `g₂ = 60 G 4`, `g₃ = 140 G 6`, and
  `derivWeierstrassP_sq : ℘′(z)² = 4℘(z)³ − g₂℘(z) − g₃` off the lattice
  (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`).
- **Eisenstein series.** `ModularForm.E₄`, `ModularForm.E₆` (normalised, constant term `1`),
  `EisensteinSeries.G2 τ = ∑'_{m, symmetric} ∑'_n (mτ + n)⁻²` and
  `EisensteinSeries.E2 = (2ζ(2))⁻¹ • G2`, with the transformation of `G2`
  (`Mathlib/NumberTheory/ModularForms/EisensteinSeries/E2/`), the `q`-expansions, Ramanujan's
  formulae (`RamanujanFormula.lean`), `Function.Periodic.qParam`; the zeta values
  `riemannZeta_two`, `riemannZeta_four` and `riemannZeta_two_mul_nat` (for `ζ(6)`).
- **Transcendence vocabulary.** `IsAlgebraic`, `Transcendental`, `AlgebraicIndependent`,
  `Algebra.trdeg`, `IsTranscendenceBasis`, `trdeg_le_cardinalMk`,
  `isTranscendenceBasis_of_le_trdeg_of_finite`, `IntermediateField.adjoin`, `FinTrdeg`,
  `ringKrullDim`, `MvPolynomial.aeval`, `RingHom.ker`.
- **Meromorphic functions.** `Meromorphic`, `MeromorphicAt`, `meromorphicOrderAt`,
  `Filter.codiscrete`, Liouville (`Differentiable.apply_eq_apply_of_bounded`),
  `ZSpan.fundamentalDomain`.

### From Tau Ceti

- **Residues** (built by [ContourIntegration](../../Completed/ContourIntegration/README.md),
  Layers 2–3). The residue `TauCeti.Contour.residue`
  (`TauCeti/Analysis/Contour/Residue/Basic.lean`) and the residue theorem
  `TauCeti.Contour.classicalResidueTheorem_nullHomologous`
  (`TauCeti/Analysis/Contour/Residue/Cycle.lean`), segment winding numbers
  (`TauCeti/Analysis/Contour/Winding/Number/Segment/`).
- **Dimension.** The dimension–transcendence-degree comparison `TauCeti.ringKrullDim_eq_toNat_trdeg`
  (`TauCeti/RingTheory/KrullDimension/FiniteType.lean`) used by
  DiophantineApproximationAndTranscendence.

### From ModularCurvesPartII

- §1.4a: `latticeSigma`, the quasi-period map `latticeQuasiPeriod : Λ → ℂ` with
  `(σ′/σ)(z + λ) − (σ′/σ)(z) = η(λ)`, `latticeSigma_quasiPeriod` and
  `latticeQuasiPeriod_legendre` (`η(ω₁)ω₂ − η(ω₂)ω₁ = 2πi` for a positive basis).
- §1.1: the Laurent leading terms of `℘` and `℘′`, the distinct half-period values and
  `g₂³ − 27g₃² ≠ 0`.
- §1.3: `g₂(uΛ) = u⁻⁴g₂(Λ)`, `g₃(uΛ) = u⁻⁶g₃(Λ)` and the reindexing of the `℘` series under
  `z ↦ uz`.

The dependence is one-way: ModularCurvesPartII's lattice analysis first, this roadmap after it;
its uniformisation, Weierstrass coordinates and level structures consume nothing from here. Here
`quasiPeriod L` (2.2) is defined from `ζ` and proved equal to `latticeQuasiPeriod` on `Λ` (2.3),
so the two names denote one map, written `η`.

### From DiophantineApproximationAndTranscendence

- §5.6, `nesterenko`: for `τ` in the upper half-plane, three of
  `![Function.Periodic.qParam 1 τ, EisensteinSeries.E2 τ, ModularForm.E₄ τ, ModularForm.E₆ τ]`
  are algebraically independent over `ℚ`. Consumed by 5.1 only.
- §5.6, `eisenstein_values_at_i`: `E₂(i) = 3/π` and `E₆(i) = 0`. Used in the Checks of 2.4
  and 5.4.

## How to read the build

`README.md` is normative. `Suggested.lean` states the headline theorems and the definitions their
statements need; the API around each definition and the Checks are fixed here. Each target `k.n`
gives its contract, a *Needs:* line (earlier targets as `k.n`, and the suppliers above) and a
Checks list; each layer ends with Examples and its Dependencies.

What is built here: neither library has the Weierstrass `ζ` or the quasi-periods, an
elliptic-function theory on `PeriodPair` (Liouville, residue balance, the structure theorem and
its descent, the Laurent recursion), the connection between `PeriodPair.G` and the modular-forms
library (Mathlib's `Weierstrass.lean` leaves it open; Layer 2 supplies it), the period matrix and
period field, or complex multiplication for lattices.

The order is the dependency order: ModularCurvesPartII (§§1.1, 1.3, 1.4a) → Layer 0 → Layer 1 →
Layer 2 → Layer 3 → Layer 4 → Layer 5. Within Layer 1, the residue balance (1.3) precedes the
structure theorem (1.4), and the Laurent algebra (1.6) precedes the descent (1.7); within Layer 2,
Legendre (2.3) precedes the dictionary for `η(τ)` (2.4); within Layer 4, the algebraicity of
`℘(p)` follows `exists_weierstrassP_mul_eq` (4.2) and precedes the quasi-period relation (4.3).
Layer 5 needs Layers 2–4 and DiophantineApproximationAndTranscendence §5.6. Every item below is a
target.

## Layer 0: period pairs — scaling and the upper half-plane

### 0.1 Scaling

The action `SMul ℂˣ PeriodPair` (defined in `Suggested.lean`), with the lattice of `c • L` equal
to `c · L.lattice`, the laws of a `MulAction ℂˣ PeriodPair`, and `G_smul` for all `k`. The cases
`g₂`, `g₃` and `℘` are ModularCurvesPartII §1.3 and are not restated.

*Needs:* Mathlib `PeriodPair`, `PeriodPair.G`.

**Checks.**

- `(2 : ℂˣ) • L` has `G 4` divided by `16`.
- For odd `k` both sides of `G_smul` are `0` (`G_eq_zero_of_odd`).
- `(−1 : ℂˣ) • L` has the lattice `−Λ = Λ`, and `G_smul` gives `G k` multiplied by `(−1)ᵏ`,
  consistent with the vanishing for odd `k`.

### 0.2 Lattice invariance

`℘` and every `G_k` depend only on `L.lattice` (immediate from the definitions as sums over the
lattice; state them so that later layers never unfold).

*Needs:* Mathlib `PeriodPair.weierstrassP`, `PeriodPair.G`.

**Checks.**

- `L` and the pair `(ω₂, ω₁)` obtained by exchanging the periods (0.3) have the same `℘` and the
  same `G k`.
- For `L = ofUpperHalfPlane I`, `I • L` has the same lattice (0.3, Checks), so lattice
  invariance and `G_smul` at `c = I`, `k = 6` give `G 6 = −G 6`: `g₃ = 0`.
- At `c = I`, `k = 4`, the same argument gives `G 4 = G 4`, no constraint: `g₂ ≠ 0` is
  compatible (1.5, Checks).

### 0.3 The upper half-plane

`ofUpperHalfPlane τ = (1, τ)`; every positive `L` has the lattice of
`L.ω₁ • ofUpperHalfPlane (L.ω₂ / L.ω₁)`, and the pair `(ω₂, ω₁)` obtained by exchanging the
periods has the same lattice as `L`.

*Needs:* 0.1; Mathlib `UpperHalfPlane`.

**Checks.**

- `ofUpperHalfPlane I` and `I • ofUpperHalfPlane I` have the same lattice.
- `ofUpperHalfPlane τ` is positive: `(τ / 1).im = τ.im > 0`; the exchanged pair `(τ, 1)` is
  not, since `(1/τ).im < 0`.
- For positive `L`, `L.ω₁ • ofUpperHalfPlane (L.ω₂ / L.ω₁)` is the pair `(ω₁, ω₂)` itself.

### Examples

- `(2 : ℂˣ) • L` has `G 4` divided by `16` (0.1, Checks).
- `ofUpperHalfPlane I` and `I • ofUpperHalfPlane I` have the same lattice (0.3, Checks), hence
  `g₃(ℤ[i]) = 0` (0.2, Checks).

### Dependencies

Mathlib only. Within the layer, 0.3 uses the action of 0.1, and the Checks of 0.2 use 0.1 and
0.3.

## Layer 1: elliptic functions for a period pair

### 1.1 Elliptic functions and their closure

`IsEllipticFunction L f := Meromorphic f ∧ ∀ l ∈ L.lattice, Function.Periodic f l`. Elliptic
functions form a subfield of the meromorphic functions modulo codiscrete equality, closed under
`deriv`; `℘`, `℘′` are elliptic.

*Needs:* Mathlib `Meromorphic`, `meromorphic_weierstrassP`, `weierstrassP_add_coe`,
`derivWeierstrassP` and its periodicity.

**Checks.**

- `℘`, `℘′` and `z ↦ ℘(2z)` are elliptic for `L`; a constant is elliptic.
- `ζ` (Layer 2) and `z ↦ z` are not elliptic.
- `℘′²` is elliptic, as a product of elliptic functions.

### 1.2 Liouville

An elliptic function without poles is constant (`IsEllipticFunction.exists_eq_const`), from
boundedness on the compact closure of `ZSpan.fundamentalDomain L.basis`.

*Needs:* 1.1; Mathlib `Differentiable.apply_eq_apply_of_bounded`, `ZSpan.fundamentalDomain`.

**Checks.**

- A constant is entire and elliptic: the conclusion holds trivially.
- `℘` is elliptic and not constant; it has double poles at the lattice (`order_weierstrassP`),
  so the hypothesis `Differentiable ℂ f` is needed.
- `z ↦ z` is entire and not constant; it is not periodic, so the elliptic hypothesis is needed.

### 1.3 Residue balance

For elliptic `f`, the residues (`TauCeti.Contour.residue`) at the poles in a translate
`z₀ + ZSpan.fundamentalDomain L.basis` whose boundary avoids the poles sum to `0`: integrate over
the boundary parallelogram with Tau Ceti's residue theorem; opposite sides cancel by periodicity.
Consequences: no elliptic function has a single simple pole modulo `Λ`; applied to `f′/f`, zeros
and poles balance (`IsEllipticFunction.finsum_meromorphicOrderAt_eq_zero`), so a nonconstant
elliptic function takes every value equally often; `℘ − c` has exactly two zeros modulo `Λ`
counted with multiplicity.

*Needs:* 1.1; Tau Ceti `TauCeti.Contour.residue`,
`TauCeti.Contour.classicalResidueTheorem_nullHomologous`, segment winding numbers
(ContourIntegration Layers 2–3); Mathlib `meromorphicOrderAt`, `ZSpan.fundamentalDomain`.

**Checks.**

- `f = ℘ − e₁`, with `e₁ = ℘(ω₁/2)`: a pole of order `2` at `0` and a double zero at `ω₁/2`
  (where `℘′` vanishes), so the orders sum to `−2 + 2 = 0`.
- `f ≡ 1` has every order `0`; `f ≡ 0` has every order `⊤` and is excluded by the hypothesis
  `hne`.
- `ζ` has a single simple pole modulo `Λ`, of residue `1` (2.1), and is not elliptic (1.1,
  Checks), as the balance requires.

### 1.4 Structure

Every even elliptic function is `P(℘)/Q(℘)` codiscretely
(`IsEllipticFunction.exists_eq_div_weierstrassP`), and every elliptic function is
`R₁(℘) + ℘′ R₂(℘)`; odd ones are `℘′ R(℘)`.

*Needs:* 1.2, 1.3; Mathlib `Polynomial`, `order_weierstrassP`. (Silverman, AEC, ch. VI.)

**Checks.**

- `℘′²` is even and equals `4℘³ − g₂℘ − g₃` (`derivWeierstrassP_sq`): `P = 4X³ − g₂X − g₃`,
  `Q = 1`.
- `℘′` is odd, of the form `℘′ R(℘)` with `R = 1`.
- The evenness hypothesis is needed: `℘′` is elliptic and not codiscretely equal to any
  `P(℘)/Q(℘)`, which is even, since `℘′` is odd and not `0`.

### 1.5 The half-period values

Consumed from ModularCurvesPartII §1.1: distinct values `e₁, e₂, e₃` at the half-periods and
`g₂³ − 27g₃² ≠ 0`. Added here: `4X³ − g₂X − g₃ = 4∏(X − e_i)` and
`g₂³ − 27g₃² = 16∏_{i<j}(e_i − e_j)²`.

*Needs:* ModularCurvesPartII §1.1; Mathlib `derivWeierstrassP_sq`, `derivWeierstrassP` and its
oddness. (DLMF 23.3.4.)

**Checks.**

- For `Λ = ℤ[i]`, `g₃ = 0` and `g₂ ≠ 0`; for `Λ = ℤ[e^{2πi/3}]`, `g₂ = 0` and `g₃ ≠ 0`.
- For `Λ = ℤ[i]`, `℘(iz) = −℘(z)` (0.2 and ModularCurvesPartII §1.3) gives the value `0` at
  `(1 + i)/2` and opposite values `±e` at `1/2` and `i/2`, so
  `4X³ − g₂X − g₃ = 4X(X − e)(X + e)` with `g₂ = 4e²`.
- With these roots `16∏_{i<j}(e_i − e_j)² = 16 · e² · 4e² · e² = 64e⁶ = g₂³`, as the discriminant
  identity requires when `g₃ = 0`.

### 1.6 Laurent algebra

`℘(z) = z⁻² + ∑_{k≥1} (2k+1) G_{2k+2} z^{2k}` near `0` (`hasSum_weierstrassP_laurent`, from
Mathlib's power series of `℘ − z⁻²` at `0`); with `c_k = (2k+1)G_{2k+2}`: `c₁ = g₂/20`,
`c₂ = g₃/28`, and for `n ≥ 3`, `(2n+3)(n−2) c_n = 3 ∑_{k=1}^{n−2} c_k c_{n−1−k}`, from
`℘″ = 6℘² − g₂/2` (derivative of `derivWeierstrassP_sq`). Hence
`G_mem_adjoin : G_{2k} ∈ ℚ[g₂, g₃]` for `k ≥ 2`.

*Needs:* Mathlib `hasFPowerSeriesOnBall_weierstrassP`, `derivWeierstrassP_sq`,
`Algebra.adjoin`. (DLMF 23.9.5.)

**Checks.**

- `c₃ = g₂²/1200` and `c₄ = 3g₂g₃/6160`.
- `G 2` is Mathlib's junk `0` (the sum is not absolutely summable) and appears in no statement.
- `G_mem_adjoin` at `k = 2, 3, 4`: `G₄ = g₂/60`, `G₆ = g₃/140`, `G₈ = c₃/7 = g₂²/8400`.

### 1.7 Descent

If the Laurent coefficients at `0` of an even elliptic `f` lie in a subfield `K ⊆ ℂ` containing
`g₂, g₃`, then `P` and `Q` in the structure theorem can be taken in `K[X]`. No hypothesis on the
poles of `f` is made. Proof: fix the degrees of a solution over `ℂ`. For `P, Q` of those degrees,
`h = f · Q(℘) − P(℘)` is elliptic with total pole order modulo `Λ` bounded in terms of the poles
of `f` and the degrees alone, so by the zero–pole balance `h = 0` as soon as finitely many of its
Laurent coefficients at `0` vanish. Those coefficients are `K`-linear in the coefficients of
`P, Q` (by the Laurent algebra). The system has a nonzero solution over `ℂ`, hence one over `K`,
and every nonzero solution has `Q ≠ 0` because `℘` is not constant.

*Needs:* 1.3, 1.4, 1.6.

**Checks.**

- The descent applies to `℘(2z)`, whose rational expression is the duplication formula
  `℘(2z) = ((℘² + g₂/4)² + 2g₃℘)/(4℘³ − g₂℘ − g₃)`, with coefficients in `ℚ(g₂, g₃)`.
- `f = ℘` has Laurent coefficients `1` and the `c_k`, in `K = ℚ(g₂, g₃)` by 1.6, and `P = X`,
  `Q = 1` is a solution in `K[X]`.
- For `f = ℘′²` the solution is `P = 4X³ − g₂X − g₃`, `Q = 1` (1.4, Checks), whose coefficients
  lie in `K` only because `K` contains `g₂, g₃`.

### Examples

- `c₃ = g₂²/1200` and `c₄ = 3g₂g₃/6160` (1.6, Checks; DLMF 23.9.5).
- The duplication formula `℘(2z) = ((℘² + g₂/4)² + 2g₃℘)/(4℘³ − g₂℘ − g₃)` has coefficients in
  `ℚ(g₂, g₃)` (1.7, Checks).
- For `Λ = ℤ[e^{2πi/3}]`, `g₂ = 0` and `g₃ ≠ 0` (1.5, Checks).

### Dependencies

Layer 0; ModularCurvesPartII §1.1; Mathlib `Weierstrass.lean`; Tau Ceti `TauCeti.Contour`
(ContourIntegration Layers 2–3). (Silverman, AEC, ch. VI; DLMF 23.9.5.) Within the layer, 1.3
precedes 1.4, and 1.6 precedes 1.7.

## Layer 2: the Weierstrass ζ function, quasi-periods, Legendre, Eisenstein

### 2.1 The Weierstrass `ζ` function

`weierstrassZeta L` as in the conventions: locally uniform convergence off `Λ` (the summand is
`O(|l|⁻³)` on compacts, as Mathlib does for `℘`), meromorphy with simple poles of residue `1` at
`Λ` (`meromorphic_weierstrassZeta`), oddness (`weierstrassZeta_neg`),
`hasDerivAt_weierstrassZeta : ζ′ = −℘` off `Λ`, the Laurent expansion
`ζ(z) = 1/z − ∑_{k≥1} G_{2k+2} z^{2k+1}`, the scaling `ζ_{cΛ}(cz) = c⁻¹ ζ_Λ(z)` and the
dependence of `ζ` on `L.lattice` only.

*Needs:* Layer 0; 1.6; Mathlib `PeriodPair.weierstrassP`; Tau Ceti `TauCeti.Contour.residue`.
(DLMF 23.2.5.)

**Checks.**

- The summand `1/(z − l) + 1/l + z/l²` equals `z²/(l²(z − l))`, hence `O(|l|⁻³)` on compacts.
- The scaling at `c = −1`, with `−Λ = Λ`, is the oddness `ζ(−z) = −ζ(z)`.
- Differentiating the Laurent expansion gives `−z⁻² − 3G₄z² − ⋯`, which is `−℘` by 1.6.

### 2.2 Quasi-periods

`quasiPeriod L l = ζ(ω₁/2 + l) − ζ(ω₁/2)`. For `l ∈ Λ`, `z ↦ ζ(z + l) − ζ(z)` has derivative
`0` on the connected open set `ℂ ∖ Λ` (by `hasDerivAt_weierstrassZeta` and the periodicity of
`℘`), so it is constant there, equal to its value at `ω₁/2`:
`weierstrassZeta_add_coe : ζ(z + l) = ζ(z) + quasiPeriod L l` for `z ∉ Λ`. Hence
`quasiPeriod_add`, `η(ω) = 2ζ(ω/2)` for `ω ∈ Λ ∖ 2Λ` (oddness at `z = −ω/2`),
`quasiPeriod_smul`, `quasiPeriod_congr`.

*Needs:* 2.1; Mathlib `weierstrassP_add_coe`, `ω₁_div_two_notMem_lattice`.

**Checks.**

- `quasiPeriod L 0 = 0` from the definition.
- For `L = ofUpperHalfPlane I`, `ζ(iz) = −iζ(z)` (from `iΛ = Λ` and homogeneity), so
  `η(i) = −i η(1)`.
- `η(−l) = −η(l)` for `l ∈ Λ`, from `quasiPeriod_add` at `l' = −l` and `quasiPeriod L 0 = 0`.

### 2.3 Compatibility with ModularCurvesPartII

`ζ = σ′/σ` off `Λ`, hence `quasiPeriod L l` equals `latticeQuasiPeriod` at `l` for every `l ∈ Λ`.
Not statable in Suggested.lean until ModularCurvesPartII's `latticeSigma` exists at the pins; the
identification is fixed here only. Through this identity Legendre is
ModularCurvesPartII's `latticeQuasiPeriod_legendre`, not reproved; its corollaries used here:
`η(ω₁), η(ω₂)` are not both `0`, and `ω ↦ η(ω)` is not `ℂ`-linear on `Λ`.

*Needs:* 2.2; ModularCurvesPartII §1.4a (`latticeSigma`, `latticeQuasiPeriod`,
`latticeSigma_quasiPeriod`, `latticeQuasiPeriod_legendre`). (DLMF 23.2.12–23.2.14.)

**Checks.**

- For `L = ofUpperHalfPlane I`, Legendre gives `η(1) = π`: with `η(i) = −iη(1)` (2.2, Checks),
  `η(1) · i − η(i) · 1 = 2iη(1) = 2πi`.
- Reversing the basis flips the sign of the Legendre determinant.
- If `η(l) = c l` for all `l ∈ Λ`, the left side of Legendre would be `c ω₁ω₂ − c ω₂ω₁ = 0`:
  this is why `ω ↦ η(ω)` is not `ℂ`-linear.

### 2.4 The Eisenstein dictionary

For `τ` in the upper half-plane and `L = ofUpperHalfPlane τ`: `g₂ = (4π⁴/3) E₄(τ)`
(`g₂_ofUpperHalfPlane`), `g₃ = (8π⁶/27) E₆(τ)` (`g₃_ofUpperHalfPlane`), from `G_k = 2ζ(k)E_k` and
`ζ(4) = π⁴/90`, `ζ(6) = π⁶/945`; and `η(1) = G₂(τ) = (π²/3) E₂(τ)` with Mathlib's `G2`
(`quasiPeriod_ofUpperHalfPlane_one`). Prove the last one row by row: the series for
`ζ(z+1) − ζ(z)` has summands `O(|l|⁻³)`, so it may be grouped by rows `l = mτ + n`; in each row
the terms `1/(z+1−l) − 1/(z−l)` telescope to `0` over symmetric partial sums, leaving
`∑'_n (mτ+n)⁻²`, which is Mathlib's `e2Summand m τ` (with `e2Summand 0 τ = 2ζ(2)`); the outer sum
is absolutely convergent, hence equal to the symmetric sum defining `G2`. Then
`η(τ) = τ G₂(τ) − 2πi` by Legendre. By scaling, for any positive `L` with `τ = ω₂/ω₁`:
`g₂ = ω₁⁻⁴(4π⁴/3)E₄(τ)`, `g₃ = ω₁⁻⁶(8π⁶/27)E₆(τ)`, `η(ω₁) = ω₁⁻¹(π²/3)E₂(τ)` (the scaled
dictionary).

*Needs:* 0.1, 0.3, 2.2, 2.3; Mathlib `EisensteinSeries.G2`, `E2`, `ModularForm.E₄`, `E₆`,
`riemannZeta_two`, `riemannZeta_four`, `riemannZeta_two_mul_nat` (for `ζ(6)`). (DLMF 23.8.5;
Silverman, ATAEC, ch. I.)

**Checks.**

- `η(1) = π` for `L = ofUpperHalfPlane I` (2.3, Checks) matches Mathlib-side `E₂(i) = 3/π`
  (DiophantineApproximationAndTranscendence's `eisenstein_values_at_i`): `(π²/3)(3/π) = π`.
- `G₂(−1/τ) = τ²G₂(τ) − 2πiτ` is recovered from Legendre and agrees with Mathlib's `G2`
  transformation (`D2`).
- The constants: `G₄ = 2ζ(4)E₄ = (π⁴/45)E₄` and `60 · π⁴/45 = 4π⁴/3`; `G₆ = 2ζ(6)E₆ =
  (2π⁶/945)E₆` and `140 · 2/945 = 8/27`.

### Examples

- For `ℤ[i]`, `η(1) = π` and `η(i) = −iπ` (2.2 and 2.3, Checks), and `(π²/3)E₂(i) = π` (2.4,
  Checks).
- `g₂(ℤ + ℤτ) = 60 · (π⁴/45) E₄(τ) = (4π⁴/3) E₄(τ)` (2.4, Checks).
- In DLMF's half-period convention, `η₁ω₃ − η₃ω₁ = πi/2` (DLMF 23.2.14); with full periods
  `2ω_j` and `η(2ω_j) = 2η_j` it is the Legendre relation `2πi` of the conventions.

### Dependencies

Layers 0–1; ModularCurvesPartII §1.4a; Tau Ceti
`TauCeti.Contour.classicalResidueTheorem_nullHomologous`; Mathlib `EisensteinSeries.G2`, `E2`,
`ModularForm.E₄`, `E₆`, `riemannZeta_two`, `riemannZeta_four`, `riemannZeta_two_mul_nat` (for
`ζ(6)`). (DLMF 23.2.5–23.2.14, 23.8.5; Silverman, ATAEC, ch. I.) Within the layer, 2.3 precedes
the dictionary for `η(τ)` in 2.4.

## Layer 3: the period matrix and the period field

### 3.1 Period matrix

`periodMatrix L = !![ω₁, ω₂; η(ω₁), η(ω₂)]`, a numerical `2 × 2` matrix. With `x = ℘(z)`,
`y = ℘′(z)`, `dx/y = dz` and `x dx/y = ℘ dz = −dζ`, so its rows are the periods of `dx/y` and of
`−x dx/y` on `γ₁, γ₂` (forms in rows, cycles in columns); the differential `x dx/y` itself has
periods `−η(ω₁), −η(ω₂)`. Its identification with a de Rham–Betti comparison belongs to
ComplexComparisonPartII and PeriodsAndSpecialValues, and is not built here.
`det_periodMatrix : det P = −2πi` for a positive basis (Legendre). Change of basis of the same
lattice by `γ ∈ GL₂(ℤ)` multiplies `P` on the right by `γ`.

*Needs:* 2.2, 2.3.

**Checks.**

- For `L = ofUpperHalfPlane I`, `periodMatrix L = !![1, i; π, −iπ]` (Layer 2 checks), with
  determinant `1 · (−iπ) − i · π = −2πi`.
- For `L` and the pair `(ω₂, ω₁)` the determinants are opposite: for `(i, 1)` the matrix is
  `!![i, 1; −iπ, π]`, of determinant `+2πi`.
- The exchange of the periods is the change of basis by `γ = !![0, 1; 1, 0]`, of determinant
  `−1`, as the sign change requires.

### 3.2 Period field

`periodField L = ℚ(Λ ∪ η(Λ))`, equal to `ℚ(ω₁, ω₂, η(ω₁), η(ω₂))` (`periodField_eq_adjoin`),
lattice-invariant (`periodField_congr`), containing `2πi` (`two_pi_I_mem_periodField`); hence `π`
is algebraic over it.

*Needs:* 2.2 (`quasiPeriod_add`, `quasiPeriod_congr`), 3.1; Mathlib `IntermediateField.adjoin`.

**Checks.**

- For `L` and the pair `(ω₂, ω₁)` the period fields are equal.
- For `L = ofUpperHalfPlane I`, `periodField L = ℚ(i, π)` has transcendence degree `1`; so the
  lower bound of Layer 5 needs its algebraic-invariants hypothesis, and with it shows that
  `g₂(ℤ[i])` is transcendental.
- For `L = ofUpperHalfPlane I`, `2πi = 2 · i · π` lies in `ℚ(i, π)`, as
  `two_pi_I_mem_periodField` requires.

### 3.3 Upper bound

`trdeg_periodField_le : trdeg ≤ 4` (four generators).

*Needs:* 3.2; Mathlib `Algebra.trdeg`, `trdeg_le_cardinalMk`.

**Checks.**

- `trdeg (periodField L) = trdeg ℚ(ω₁, ω₂, η(ω₁), π)` (Legendre solves for `η(ω₂)`).
- For `Λ = ℤ[i]`, `trdeg = 1 ≤ 4` (3.2, Checks).
- For `Λ = π·ℤ[i]`, the period field is `ℚ(π, i)` (Summary), of transcendence degree `1`.

### 3.4 Zariski closure

`periodIdeal L`, the kernel of evaluation `ℚ[X₁₁, X₁₂, X₂₁, X₂₂] → ℂ` at `P`, is prime, and
`ringKrullDim_periodIdeal : dim ℚ[X]/periodIdeal = trdeg (periodField L)`, through Tau Ceti's
`TauCeti.ringKrullDim_eq_toNat_trdeg`. Equivalences (`trdeg_periodField_eq_four_iff`): `trdeg = 4` iff
the four entries are algebraically independent iff `periodIdeal L = ⊥` iff `ω₁, ω₂, η(ω₁), π`
are algebraically independent.

*Needs:* 3.1, 3.2, 3.3; Tau Ceti `TauCeti.ringKrullDim_eq_toNat_trdeg`; Mathlib `MvPolynomial.aeval`,
`RingHom.ker`, `isTranscendenceBasis_of_le_trdeg_of_finite`.

**Checks.**

- For `L = ofUpperHalfPlane I`, `X₁₁ − 1`, `X₁₂² + 1` and `X₂₂ + X₁₂X₂₁` lie in `periodIdeal L`,
  and the quotient has dimension `1`, the transcendence degree of `ℚ(i, π)`.
- For a positive basis, the determinant `X₁₁X₂₂ − X₁₂X₂₁` is not in `periodIdeal L`: its value
  is `−2πi ≠ 0` (3.1).
- `periodIdeal L = ⊥` fails for every lattice with complex multiplication and algebraic
  invariants, since then `trdeg ≤ 2` (4.4).

### 3.5 Homotheties

`trdeg_periodField_smul`: scaling by an algebraic `c` preserves the transcendence degree.
`isAlgebraic_of_smul`: if `L` and `c • L` both have algebraic invariants then `c` is algebraic
(one of `g₂, g₃` is nonzero by ModularCurvesPartII §1.1's `g₂³ − 27g₃² ≠ 0`, and `c⁴` or `c⁶` is
a ratio of algebraic numbers). So the transcendence degree is an invariant of the curve
`y² = 4x³ − g₂x − g₃` over `ℚ̄`, not of the chosen lattice.

*Needs:* 2.2 (`quasiPeriod_smul`), 3.2; ModularCurvesPartII §1.1 and §1.3.

**Checks.**

- At `c = I` and `L = ofUpperHalfPlane I`, `c • L` has the same lattice (0.3, Checks), hence the
  same period field.
- Both cases of the proof occur: for `ℤ[i]`-type lattices `g₃ = 0` and `c⁴` is the ratio of the
  `g₂`, for `ℤ[e^{2πi/3}]`-type lattices `g₂ = 0` and `c⁶` is the ratio of the `g₃` (1.5,
  Checks).
- The hypotheses on `c • L` are needed: for `L` with `g₂ = 1`, `g₃ = 0` (5.4, Checks) and
  `c = π`, `g₂(π • L) = π⁻⁴` is transcendental, and so is `c`.

### Examples

- For `ℤ[i]`, `periodMatrix = !![1, i; π, −iπ]`, with determinant `−2πi` (3.1, Checks).
- For `ℤ[i]`, the period field is `ℚ(i, π)`, of transcendence degree `1` (3.2, Checks).
- For `π·ℤ[i]`, the period field is `ℚ(π, i)` (Summary; 3.3, Checks).

### Dependencies

Layers 0–2; Tau Ceti `TauCeti.ringKrullDim_eq_toNat_trdeg`.

## Layer 4: complex multiplication

### 4.1 CM lattices

`HasCM L`; `hasCM_iff`: `HasCM L ↔ τ = ω₂/ω₁` satisfies a nonzero integer quadratic equation (`τ`
is imaginary quadratic); the multiplier ring `{α | αΛ ⊆ Λ}` is a subring of `ℂ`, equal to `ℤ`
without CM and to an order in `ℚ(τ)` with CM; every nonzero multiplier is an algebraic integer of degree
`≤ 2` with `[Λ : αΛ] = |α|²`, and a real multiplier is an integer; `HasCM.smul`, `HasCM`
lattice-invariant.

*Needs:* Layer 0.

**Checks.**

- `HasCM (ofUpperHalfPlane I)` with `α = i`.
- `ofUpperHalfPlane τ` has CM for `τ = i√2` but not for `τ = iπ` (`hasCM_iff`).
- `α = 1/2` is not a multiplier of any lattice: `ω₁/2 ∉ Λ` (`ω₁_div_two_notMem_lattice`).

### 4.2 `℘(αz)` is rational in `℘(z)`

For a multiplier `α ≠ 0` and algebraic invariants, `℘(αz) = P(℘(z))/Q(℘(z))` with `P, Q` with
algebraic coefficients (`exists_weierstrassP_mul_eq`): `℘(αz)` is even and `Λ`-elliptic, its
Laurent coefficients `α⁻², α^{2k}c_k` lie in `K = ℚ(g₂, g₃, α)` (1.6), and the Layer 1 descent
(1.7) gives `P, Q ∈ K[X]`; `K` is algebraic over `ℚ` since `g₂, g₃` and `α` are. Consequence,
derived from it: `℘(p)` is algebraic for every `p ∈ α⁻¹Λ ∖ Λ`. Near such `p`, `℘` is analytic
while `℘(αz)` has a pole, so `Q(℘(p)) = 0`, and `Q ≠ 0` has algebraic coefficients.

*Needs:* 1.6, 1.7, 4.1.

**Checks.**

- For `α = 2`, `exists_weierstrassP_mul_eq` is the duplication formula of Layer 1 (1.7, Checks).
- For `α = 2`, the points `p` are the half-periods, and `℘(p) = e_i` are the roots of
  `Q = 4X³ − g₂X − g₃`, algebraic.
- For `α = 1`, `P = X` and `Q = 1`.

### 4.3 The CM quasi-period relation

`exists_quasiPeriod_mul`. For every multiplier `α` and algebraic invariants there is an algebraic
`b` with `η(αl) = ᾱ η(l) + b l` for all `l ∈ Λ`. For real `α`, an integer, take `b = 0`
(additivity of `η`). For non-real `α`: `φ(z) = ζ(αz) − aζ(z) − bz` is elliptic for the unique
`(a, b)` killing its periods (solvable by Legendre); the residue balance over a period
parallelogram (`|α|²` poles of `ζ(αz)` with residue `1/α`, one of `ζ` with residue `a`) gives
`a = |α|²/α = ᾱ`; `φ` is odd with simple poles at `α⁻¹Λ`, so it equals
`(1/α) ∑_p c_p ℘′(z)/(℘(z) − ℘(p))` over representatives `p` of `(α⁻¹Λ ∖ Λ)/(Λ, ±)`, with
`c_p = 1` or `1/2` at `2`-torsion (the difference is odd, elliptic, with at most a simple pole
modulo `Λ`, hence `0`); comparing the `z¹` Laurent coefficients, `b` lies in
`ℚ(g₂, g₃, α, ℘(p))`, which is algebraic by the previous item.

*Needs:* 1.3, 1.4, 2.2, 2.3, 4.2.

**Checks.**

- For `Λ = ℤ[i]`, `α = i`: `η(i) = −iη(1)`, i.e. `b = 0`.
- For `α = 2`, the quasi-period relation is `η(2l) = 2η(l)`.
- For `α = i`, `|α|²/α = 1/i = −i = ᾱ`.

### 4.4 Upper bound with CM

`trdeg_periodField_le_two_of_hasCM`. For a non-real multiplier `α`, writing `αω₁ = mω₁ + nω₂`
(`n ≠ 0` since `α` is not real), the relation and Legendre give `ω₂ = (α − m)ω₁/n`,
`η(ω₁) = (2πin + bω₁²)/((α − ᾱ)ω₁)`, `η(ω₂) = ((ᾱ − m)η(ω₁) + bω₁)/n`: the period field is
algebraic over `ℚ(ω₁, π)`, so `trdeg ≤ 2`.

*Needs:* 2.3, 3.2, 4.3.

**Checks.**

- For `ℤ[i]`, `α = i`, `(ω₁, ω₂) = (1, i)`: `m = 0`, `n = 1`, and `ω₂ = (i − 0) · 1/1 = i`.
- With `b = 0` (4.3, Checks), `η(ω₁) = 2πi/(2i) = π`, as in 2.3, Checks.
- `η(ω₂) = (−i − 0)π = −iπ`, as in 2.2, Checks.

### Examples

- `ofUpperHalfPlane (i√2)` has complex multiplication and `ofUpperHalfPlane (iπ)` has not (4.1,
  Checks).
- For `α = 2`, `exists_weierstrassP_mul_eq` is the duplication formula and the quasi-period
  relation is `η(2l) = 2η(l)` (4.2 and 4.3, Checks).
- For `ℤ[i]` and `α = i`, the formulas of 4.4 return `η(1) = π` and `η(i) = −iπ` (4.4, Checks).

### Dependencies

Layers 1–3. Within the layer, the algebraicity of `℘(p)` in 4.2 follows
`exists_weierstrassP_mul_eq` and precedes the quasi-period relation of 4.3.

## Layer 5: lower bounds — Chudnovsky from Nesterenko

### 5.1 Chudnovsky's theorem

`chudnovsky`. Let `L` have algebraic invariants and `l ∈ Λ ∖ {0}`. Then `l/π` and `η(l)/π` are
algebraically independent over `ℚ`. It consumes DiophantineApproximationAndTranscendence §5.6's
`nesterenko`, the single owner of that statement. Proof: reduce to `l` primitive
(`η(nl) = nη(l)`) and complete it to a positive basis `(l, ω)`, `τ = ω/l`; by the scaled
Eisenstein dictionary, `E₄(τ) = (3g₂/4)(l/π)⁴`, `E₆(τ) = (27g₃/8)(l/π)⁶`,
`E₂(τ) = 3(l/π)(η(l)/π)`, so `ℚ(E₂, E₄, E₆) ⊆ ℚ̄(l/π, η(l)/π)`; Nesterenko gives
`trdeg ℚ(q, E₂, E₄, E₆) ≥ 3`, hence `trdeg ℚ(E₂, E₄, E₆) ≥ 2`. This is Chudnovsky's ICM 1978
report, §2.A, Theorem 3 (`π/ω` and `η/ω` algebraically independent for any period `ω` and its
quasi-period `η`), under the report's standing hypothesis (§0) that `g₂, g₃` are algebraic.

*Needs:* 0.3, 2.2, 2.4 (the scaled dictionary); DiophantineApproximationAndTranscendence §5.6
(`nesterenko`).

**Checks.**

- The proof of `chudnovsky` uses only `trdeg ≥ 2` of `ℚ(E₂, E₄, E₆)`, not the transcendence of
  `q`; `E₆(i) = 0` is compatible (for `ℤ[i]` the dictionary gives `g₃ = 0`).
- The hypothesis `l ≠ 0` is needed: at `l = 0` both entries are `0`.
- The algebraic-invariants hypotheses are needed: for `π·ℤ[i]` and `l = π`, `l/π = 1` is
  algebraic.

### 5.2 Without algebraic invariants

`two_le_trdeg_adjoin_invariants`. For every `L` and `l ∈ Λ ∖ {0}`,
`2 ≤ trdeg ℚ(g₂, g₃, l/π, η(l)/π)`; `chudnovsky` is the case of algebraic `g₂, g₃`. Same proof:
the three displayed identities put `E₂, E₄, E₆` in `ℚ(g₂, g₃, l/π, η(l)/π)` with no hypothesis on
`g₂, g₃`. (Chudnovsky, ICM 1978, §2.A, display (4), stated as the case of Theorem 3 without
algebraic invariants; Waldschmidt, arXiv math/0502582, §3, the statement following Theorem 3.1.)

*Needs:* 5.1 (its proof); 0.3, 2.2, 2.4; DiophantineApproximationAndTranscendence §5.6
(`nesterenko`).

**Checks.**

- For `L = ofUpperHalfPlane I` and `l = 1`, where `g₃ = 0` and `η(1)/π = 1` (1.5 and 2.3,
  Checks), it says that `g₂(ℤ[i])` and `π` are algebraically independent.
- For algebraic `g₂, g₃`, `trdeg ℚ(g₂, g₃, l/π, η(l)/π) = trdeg ℚ(l/π, η(l)/π)`, so the statement
  is `chudnovsky`.
- For `π·ℤ[i]` and `l = π`, where `chudnovsky` does not apply, `l/π = 1` and `η(π)/π = 1/π`
  (scaling, `η_{πΛ}(π) = π⁻¹η_Λ(1) = 1`), and `g₃ = 0`: it says that `g₂(π·ℤ[i])` and `π` are
  algebraically independent.

### 5.3 Lower bound

`two_le_trdeg_periodField`: `2 ≤ trdeg` for every `L` with algebraic invariants (`ω₁/π,
η(ω₁)/π` lie in `periodField L(i)`, and adjoining `i` does not change the transcendence degree).
This is Chudnovsky's first result, ICM 1978, §2.A, Theorem 1: `#{ω₁, ω₂, η₁, η₂} ≥ 2`, where
`#S` is the maximal number of algebraically independent elements of `S` (§0).

*Needs:* 3.2, 5.1.

**Checks.**

- For `π·ℤ[i]`, `trdeg = 1` (Summary): the algebraic-invariants hypotheses are needed.
- For `ℤ[i]`, `trdeg = 1` (3.2, Checks), so `g₂(ℤ[i])` is transcendental.
- `ω₁/π` and `η(ω₁)/π` lie in `periodField L(i)` because `π = 2πi/(2i)` and
  `2πi ∈ periodField L` (3.2).

### 5.4 The CM case

`trdeg_periodField_eq_two_of_hasCM`: `trdeg = 2`. With `ringKrullDim_periodIdeal`: the Zariski
closure of the period matrix has dimension `2`, the dimension of the CM torus (the CM case
attributed to Chudnovsky by Bost–Charles, §2.2.2).

*Needs:* 3.4, 4.4, 5.3.

**Checks.**

- A CM example: `L₀ = ofUpperHalfPlane I` has `g₃ = 0` (from `iΛ = Λ` and `G₆(iΛ) = −G₆(Λ)`), so
  `g₂ ≠ 0`; with `c⁴ = g₂(L₀)`, `c • L₀` has `g₂(c • L₀) = c⁻⁴g₂(L₀) = 1`, `g₃ = 0`, CM by `i`,
  and `trdeg = 2`.
- `E₆(i) = 0` (`eisenstein_values_at_i`) and `g₃(L₀) = (8π⁶/27)E₆(i)` (2.4) agree with
  `g₃(L₀) = 0`.
- `L₀` itself has CM but `trdeg = 1` (3.2, Checks): the algebraic-invariants hypotheses are
  needed.

### 5.5 Corollaries

With CM and algebraic invariants, `ω₁` and `π` are algebraically independent (Chudnovsky, ICM
1978, §2.A, Corollary 2, stated for CM curves only; with the Chowla–Selberg formula it gives
`Γ(1/4)` and `Γ(1/3)` each algebraically independent of `π`, *ibid.*, (9)); for
`c • ofUpperHalfPlane I` or `c • ofUpperHalfPlane ρ` (`ρ = e^{2πi/3}`) with algebraic invariants,
`c` and `π` are algebraically independent.

*Needs:* 5.4.

**Checks.**

- The corollary fails without algebraic invariants: `ofUpperHalfPlane I` has CM and `ω₁ = 1`.
- `c • L₀` of 5.4, Checks, has algebraic invariants, so `c` and `π` are algebraically
  independent.
- For `ofUpperHalfPlane ρ`, `g₂ = 0` (1.5, Checks), so the scalings `c` with `c⁶ = g₃` give
  algebraic invariants `g₂ = 0`, `g₃ = 1`.

### Examples

- `c • ofUpperHalfPlane I` with `c⁴ = g₂(ℤ[i])` has `g₂ = 1`, `g₃ = 0`, CM by `i`, and period
  field of transcendence degree `2` (5.4, Checks).
- `g₂(ℤ[i])` and `π` are algebraically independent (5.2, Checks).
- `Γ(1/4)` and `π` are algebraically independent, and so are `Γ(1/3)` and `π` (Chudnovsky, ICM
  1978, §2.A, (9); Waldschmidt, arXiv math/0502582, §3, Theorem 3.1).

### Dependencies

Layers 2–4; DiophantineApproximationAndTranscendence §5.6 (`nesterenko`) for the unconditional
statements only. Within the layer, 5.2 repeats the proof of 5.1, and 5.3–5.5 follow 5.1.

## Downstream consumers

- EllipticIntegrals defers the lattice functions, the quasi-periods and the lattice form of
  Legendre's relation to the lattice roadmaps, this one among them (its Scope, under the old name
  GrothendieckPeriodConjecture).
- EllipticCurvePeriodsAndModularParametrizations (open) expects the Eisenstein dictionary (2.4)
  and lattice invariance (0.2) from here; the `g₂, g₃` scaling and `Δ ≠ 0` it also asks for are
  ModularCurvesPartII §§1.3 and 1.1.

ModularCurvesPartII's lattice analysis consumes nothing from here (Exact supplier contracts).

## Research context

Not targets. The elliptic case of Grothendieck's period conjecture (transcendence degree `4`
without complex multiplication) is open; nothing in this roadmap assumes or formalises it.
Bost–Charles state the conjecture in torsor form (Conjecture 2.12) and note that the CM case is
known, by Chudnovsky; what they prove is in codimension `1`, for abelian varieties and products of
curves (Corollaries 3.9 and 3.10), and gives no algebraic-independence statement for elliptic
periods.

Schneider's theorem (1937), that a nonzero period of a lattice with algebraic `g₂, g₃` is
transcendental, follows from the Schneider–Lang criterion for meromorphic functions of finite order (Lang,
*Introduction to Transcendental Numbers*, 1966, Ch. IV §1, Theorem 1; Waldschmidt, *Diophantine
Approximation on Linear Algebraic Groups*, Theorem 4.1 states the entire case and its footnote 10
the meromorphic one); no roadmap owns
that form of the criterion (LinearFormsInLogarithms 5.7 covers `ℂ^{d₀} × (ℂˣ)^{d₁}` only).
Grothendieck's notes name it as the first visible case of the conjecture for curves without complex
multiplication (Montpellier fonds, folder 18, pp. 10–12, https://grothendieck.umontpellier.fr/18.pdf).

## References

- J.-B. Bost and F. Charles, « Some remarks concerning the Grothendieck period conjecture »,
  *J. reine angew. Math.* 714 (2016), 175–208; arXiv:1307.1045. Numbering of arXiv v2: §2.2.2,
  Conjecture 2.12 (citing Grothendieck 1966, note (10), p. 102), and the remark following it
  attributing the CM elliptic case to Chudnovsky [Chu80], the ICM 1978 report below;
  Propositions 2.13–2.14; Theorem 3.1, Corollary 3.4, Theorem 3.8, Corollaries 3.9–3.10.
  (zbMATH 1337.14009.)
- Y. André, *Une introduction aux motifs (motifs purs, motifs mixtes, périodes)*, Panoramas et
  Synthèses 17, SMF, 2004, ch. 23 (the torsor of periods and Grothendieck's conjecture).
  (zbMATH 1060.14001.)
- A. Grothendieck, « On the de Rham cohomology of algebraic varieties », *Publ. Math. IHÉS* 29
  (1966), 95–103, note (10) (the conjecture as cited by Bost–Charles). (zbMATH 0145.17602.)
- G. V. Chudnovsky, « Algebraic independence of constants connected with the exponential and
  the elliptic functions », *Dopovidi Akad. Nauk Ukr. RSR, Ser. A* 1976, no. 8, 697–700
  (two of `g₂, g₃, ω/π, η/π` are algebraically independent). (zbMATH 0337.10024.)
- G. V. Chudnovsky, « Algebraic independence of values of exponential and elliptic
  functions », *Proc. ICM Helsinki 1978*, vol. 1, 339–350 (1980) — the reference Bost–Charles
  give for the CM case. §0: `g₂, g₃` algebraic throughout; §2.A (pp. 343–344), Theorem 1
  (`#{ω₁, ω₂, η₁, η₂} ≥ 2`), Corollary 2 (with CM, `ω` and `π` algebraically independent),
  Theorem 3 (`π/ω`, `η/ω` algebraically independent), display (4) (arbitrary invariants:
  `#{g₂, g₃, π/ω, η/ω} ≥ 2`); a survey without proofs, which are in the 1976 note above and in
  its reference [7], *Bull. SMF* (then to appear). (zbMATH 0431.10019.)
- G. V. Chudnovsky, *Contributions to the theory of transcendental numbers*, Math. Surveys and
  Monographs 19, AMS, 1984 (full proofs; not consulted for the locators above).
  (zbMATH 0594.10024.)
- Yu. V. Nesterenko, « Modular functions and transcendence questions », *Sb. Math.* 187 (1996),
  1319–1348, Theorem 1 and Corollary 3. (zbMATH 0898.11031.)
- M. Waldschmidt, « Transcendence of periods: the state of the art », *Pure Appl. Math. Q.* 2
  (2006), 435–463, §3 (Chudnovsky's theorem in the form used in Layer 5; Nesterenko's theorem).
  (zbMATH 1220.11090.) French original, « Transcendance de périodes : état des connaissances »,
  arXiv:math/0502582, §3: Theorem 3.1 (`Γ(1/4)` and `π`, `Γ(1/3)` and `π`, algebraically
  independent), deduced from the statement following it (two of `g₂, g₃, ω/π, η/π`
  algebraically independent, for any invariants), and Theorem 3.4 (Nesterenko).
- J. H. Silverman, *The Arithmetic of Elliptic Curves*, GTM 106, ch. VI; *Advanced Topics in the
  Arithmetic of Elliptic Curves*, GTM 151, 1994, ch. I. (zbMATH 0911.14015 for GTM 151.)
- NIST DLMF, §§23.2, 23.3, 23.8, 23.9 (Weierstrass `ζ`, quasi-periods, Legendre's relation, the
  discriminant 23.3.4, series for `η`, the Laurent recursion 23.9.5).
