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

Research context, not a target: for a lattice with algebraic invariants and no complex
multiplication, the transcendence degree is expected to be `4`; this is the elliptic case of
Grothendieck's period conjecture (Bost–Charles 2016, Conjecture 2.12). Grothendieck asked the
question in his notes (Montpellier fonds, folder 13, 1965, pp. 47–48, the full faithfulness of
the de Rham–Betti realisation), and folder 18 (from 1969 to about 1972), pp. 10–12, states it in
torsor form and asks for an elliptic curve whether the transcendence degree of the comparison
point is `4` or `2`. Nothing in this roadmap assumes or formalises the conjecture.

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
- *Supplied by ModularCurvesPartII, and consumed here; this roadmap constructs none of them.*
  §1.4a: `latticeSigma`, the quasi-period map `latticeQuasiPeriod : Λ → ℂ` with
  `(σ′/σ)(z + λ) − (σ′/σ)(z) = η(λ)`, `latticeSigma_quasiPeriod` and
  `latticeQuasiPeriod_legendre` (`η(ω₁)ω₂ − η(ω₂)ω₁ = 2πi` for a positive basis). §1.1: the
  Laurent leading terms of `℘` and `℘′`, the distinct half-period values and
  `g₂³ − 27g₃² ≠ 0`. §1.3: `g₂(uΛ) = u⁻⁴g₂(Λ)`, `g₃(uΛ) = u⁻⁶g₃(Λ)` and the reindexing of the
  `℘` series under `z ↦ uz`. The dependence is one-way: ModularCurvesPartII's lattice analysis
  first, this roadmap after it; its uniformisation, Weierstrass coordinates and level structures
  consume nothing from here. Here `quasiPeriod L` (Layer 2) is defined from `ζ` and proved equal
  to `latticeQuasiPeriod` on `Λ`, so the two names denote one map, written `η`; `legendre`
  denotes `latticeQuasiPeriod_legendre`.
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

## What Mathlib and Tau Ceti already have (consume)

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
  formulae (`RamanujanFormula.lean`), `Function.Periodic.qParam`.
- **Transcendence vocabulary.** `IsAlgebraic`, `Transcendental`, `AlgebraicIndependent`,
  `Algebra.trdeg`, `IsTranscendenceBasis`, `trdeg_le_cardinalMk`,
  `isTranscendenceBasis_of_le_trdeg_of_finite`, `IntermediateField.adjoin`, `FinTrdeg`,
  `ringKrullDim`.
- **Meromorphic functions.** `Meromorphic`, `MeromorphicAt`, `meromorphicOrderAt`,
  `Filter.codiscrete`, Liouville (`Differentiable.apply_eq_apply_of_bounded`),
  `ZSpan.fundamentalDomain`.
- **Tau Ceti.** The residue `TauCeti.Contour.residue` and the residue theorem
  `TauCeti.Contour.classicalResidueTheorem_nullHomologous`
  (`TauCeti/Analysis/Contour/Residue/Cycle.lean`), segment winding numbers
  (`TauCeti/Analysis/Contour/Winding/Number/Segment/`); the dimension–transcendence-degree
  comparison `ringKrullDim_eq_toNat_trdeg` used by DiophantineApproximationAndTranscendence.

## What is missing (build here)

Neither library has the Weierstrass `ζ` or the quasi-periods, an elliptic-function theory on
`PeriodPair` (Liouville, residue balance, the structure theorem and its descent, the Laurent
recursion), the connection between `PeriodPair.G` and the modular-forms library (Mathlib's
`Weierstrass.lean` leaves it open; Layer 2 supplies it), the period matrix and period field, or
complex multiplication for lattices.

## The build, in layers

The order is the dependency order. Every item below is a target.

### Layer 0: period pairs — scaling and the upper half-plane

- **Scaling.** The action `SMul ℂˣ PeriodPair` (defined in `Suggested.lean`), with the lattice of
  `c • L` equal to `c · L.lattice`, the laws of a `MulAction ℂˣ PeriodPair`, and `G_smul` for all
  `k`. The cases `g₂`, `g₃` and `℘` are ModularCurvesPartII §1.3 and are not restated.
- **Lattice invariance.** `℘` and every `G_k` depend only on `L.lattice` (immediate from the
  definitions as sums over the lattice; state them so that later layers never unfold).
- **The upper half-plane.** `ofUpperHalfPlane τ = (1, τ)`; every positive `L` has the lattice of
  `L.ω₁ • ofUpperHalfPlane (L.ω₂ / L.ω₁)`, and the pair `(ω₂, ω₁)` obtained by exchanging the
  periods has the same lattice as `L`.
- *Checks.* `(2 : ℂˣ) • L` has `G 4` divided by `16`; `ofUpperHalfPlane I` and
  `I • ofUpperHalfPlane I` have the same lattice.
- *Needs:* Mathlib only.

### Layer 1: elliptic functions for a period pair

`IsEllipticFunction L f := Meromorphic f ∧ ∀ l ∈ L.lattice, Function.Periodic f l`.

- **Closure.** Elliptic functions form a subfield of the meromorphic functions modulo
  codiscrete equality, closed under `deriv`; `℘`, `℘′` are elliptic.
- **Liouville.** An elliptic function without poles is constant
  (`IsEllipticFunction.exists_eq_const`), from boundedness on the compact closure of
  `ZSpan.fundamentalDomain L.basis`.
- **Residue balance.** For elliptic `f`, the residues (`TauCeti.Contour.residue`) at the poles
  in a translate `z₀ + ZSpan.fundamentalDomain L.basis` whose boundary avoids the poles sum to
  `0`: integrate over the boundary parallelogram with Tau Ceti's residue theorem; opposite sides
  cancel by periodicity. Consequences: no elliptic function has a single simple pole modulo
  `Λ`; applied to `f′/f`, zeros and poles balance
  (`IsEllipticFunction.finsum_meromorphicOrderAt_eq_zero`), so a nonconstant elliptic function
  takes every value equally often; `℘ − c` has exactly two zeros modulo `Λ` counted with
  multiplicity.
- **Structure.** Every even elliptic function is `P(℘)/Q(℘)` codiscretely
  (`IsEllipticFunction.exists_eq_div_weierstrassP`), and every elliptic function is
  `R₁(℘) + ℘′ R₂(℘)`; odd ones are `℘′ R(℘)`.
- **The half-period values.** Consumed from ModularCurvesPartII §1.1: distinct values
  `e₁, e₂, e₃` at the half-periods and `g₂³ − 27g₃² ≠ 0`. Added here:
  `4X³ − g₂X − g₃ = 4∏(X − e_i)` and `g₂³ − 27g₃² = 16∏_{i<j}(e_i − e_j)²`.
- **Laurent algebra.** `℘(z) = z⁻² + ∑_{k≥1} (2k+1) G_{2k+2} z^{2k}` near `0`
  (`hasSum_weierstrassP_laurent`, from Mathlib's power series of `℘ − z⁻²` at `0`); with
  `c_k = (2k+1)G_{2k+2}`: `c₁ = g₂/20`, `c₂ = g₃/28`, and for `n ≥ 3`,
  `(2n+3)(n−2) c_n = 3 ∑_{k=1}^{n−2} c_k c_{n−1−k}`, from `℘″ = 6℘² − g₂/2` (derivative of
  `derivWeierstrassP_sq`). Hence `G_mem_adjoin : G_{2k} ∈ ℚ[g₂, g₃]` for `k ≥ 2`.
- **Descent.** If the Laurent coefficients at `0` of an even elliptic `f` lie in a subfield
  `K ⊆ ℂ` containing `g₂, g₃`, then `P` and `Q` in the structure theorem can be taken in `K[X]`.
  No hypothesis on the poles of `f` is made. Proof: fix the degrees of a solution over `ℂ`. For
  `P, Q` of those degrees, `h = f · Q(℘) − P(℘)` is elliptic with total pole order modulo `Λ`
  bounded in terms of the poles of `f` and the degrees alone, so by the zero–pole balance `h = 0`
  as soon as finitely many of its Laurent coefficients at `0` vanish. Those coefficients are
  `K`-linear in the coefficients of `P, Q` (by the Laurent algebra). The system has a nonzero
  solution over `ℂ`, hence one over `K`, and every nonzero solution has `Q ≠ 0` because `℘` is
  not constant.
- *Checks.* `℘`, `℘′` and `z ↦ ℘(2z)` are elliptic for `L`; `ζ` (Layer 2) and `z ↦ z` are not;
  a constant is elliptic. `c₃ = g₂²/1200` and `c₄ = 3g₂g₃/6160`; `G 2` is Mathlib's junk `0`
  (the sum is not absolutely summable) and appears in no statement; for `Λ = ℤ[i]`, `g₃ = 0` and
  `g₂ ≠ 0`; for `Λ = ℤ[e^{2πi/3}]`, `g₂ = 0` and `g₃ ≠ 0`. The descent applies to `℘(2z)`, whose
  rational expression is the duplication formula
  `℘(2z) = ((℘² + g₂/4)² + 2g₃℘)/(4℘³ − g₂℘ − g₃)`, with coefficients in `ℚ(g₂, g₃)`.
- *Needs:* Layer 0; ModularCurvesPartII §1.1; Mathlib `Weierstrass.lean`; Tau Ceti
  `TauCeti.Contour` (ContourIntegration Layers 2–3). (Silverman, AEC, ch. VI; DLMF 23.9.5.)

### Layer 2: the Weierstrass ζ function, quasi-periods, Legendre, Eisenstein

- **`ζ`.** `weierstrassZeta L` as in the conventions: locally uniform convergence off `Λ`
  (the summand is `O(|l|⁻³)` on compacts, as Mathlib does for `℘`), meromorphy with simple poles
  of residue `1` at `Λ` (`meromorphic_weierstrassZeta`), oddness (`weierstrassZeta_neg`),
  `hasDerivAt_weierstrassZeta : ζ′ = −℘` off `Λ`, the Laurent expansion
  `ζ(z) = 1/z − ∑_{k≥1} G_{2k+2} z^{2k+1}`, the scaling `ζ_{cΛ}(cz) = c⁻¹ ζ_Λ(z)` and the
  dependence of `ζ` on `L.lattice` only.
- **Quasi-periods.** `quasiPeriod L l = ζ(ω₁/2 + l) − ζ(ω₁/2)`. For `l ∈ Λ`,
  `z ↦ ζ(z + l) − ζ(z)` has derivative `0` on the connected open set `ℂ ∖ Λ` (by
  `hasDerivAt_weierstrassZeta` and the periodicity of `℘`), so it is constant there, equal to its
  value at `ω₁/2`: `weierstrassZeta_add_coe : ζ(z + l) = ζ(z) + quasiPeriod L l` for `z ∉ Λ`.
  Hence `quasiPeriod_add`, `η(ω) = 2ζ(ω/2)` for `ω ∈ Λ ∖ 2Λ` (oddness at `z = −ω/2`),
  `quasiPeriod_smul`, `quasiPeriod_congr`.
- **Compatibility with ModularCurvesPartII** (`weierstrassZeta_eq_logDeriv_latticeSigma`):
  `ζ = σ′/σ` off `Λ`, hence `quasiPeriod L l` equals `latticeQuasiPeriod` at `l` for every
  `l ∈ Λ`. Through this identity Legendre is ModularCurvesPartII's `latticeQuasiPeriod_legendre`,
  not reproved; its corollaries used here: `η(ω₁), η(ω₂)` are not both `0`, and `ω ↦ η(ω)` is
  not `ℂ`-linear on `Λ`.
- **The Eisenstein dictionary.** For `τ` in the upper half-plane and `L = ofUpperHalfPlane τ`:
  `g₂ = (4π⁴/3) E₄(τ)` (`g₂_ofUpperHalfPlane`), `g₃ = (8π⁶/27) E₆(τ)` (`g₃_ofUpperHalfPlane`),
  from `G_k = 2ζ(k)E_k` and `ζ(4) = π⁴/90`, `ζ(6) = π⁶/945`; and `η(1) = G₂(τ) = (π²/3) E₂(τ)`
  with Mathlib's `G2` (`quasiPeriod_ofUpperHalfPlane_one`). Prove the last one row by row: the
  series for `ζ(z+1) − ζ(z)` has summands `O(|l|⁻³)`, so it may be grouped by rows `l = mτ + n`;
  in each row the terms `1/(z+1−l) − 1/(z−l)` telescope to `0` over symmetric partial sums,
  leaving `∑'_n (mτ+n)⁻²`, which is Mathlib's `e2Summand m τ` (with `e2Summand 0 τ = 2ζ(2)`); the
  outer sum is absolutely convergent, hence equal to the symmetric sum defining `G2`. Then
  `η(τ) = τ G₂(τ) − 2πi` by Legendre. By scaling, for any positive `L` with `τ = ω₂/ω₁`:
  `g₂ = ω₁⁻⁴(4π⁴/3)E₄(τ)`, `g₃ = ω₁⁻⁶(8π⁶/27)E₆(τ)`, `η(ω₁) = ω₁⁻¹(π²/3)E₂(τ)` (the scaled
  dictionary).
- *Checks.* `quasiPeriod L 0 = 0` from the definition. For `L = ofUpperHalfPlane I`,
  `ζ(iz) = −iζ(z)` (from `iΛ = Λ` and homogeneity), so `η(i) = −i η(1)`, and Legendre gives
  `η(1) = π`, matching Mathlib-side `E₂(i) = 3/π` (DiophantineApproximationAndTranscendence's
  `eisenstein_values_at_i`); `G₂(−1/τ) = τ²G₂(τ) − 2πiτ` is recovered from Legendre and agrees
  with Mathlib's `G2` transformation (`D2`); reversing the basis flips the sign of the Legendre
  determinant.
- *Needs:* Layers 0–1; ModularCurvesPartII §1.4a; Tau Ceti
  `TauCeti.Contour.classicalResidueTheorem_nullHomologous`; Mathlib `EisensteinSeries.G2`, `E2`,
  `ModularForm.E₄`, `E₆`, `riemannZeta_two`, `riemannZeta_four`, `riemannZeta_two_mul_nat` (for
  `ζ(6)`). (DLMF 23.2.5–23.2.14, 23.8.5; Silverman, ATAEC, ch. I.)

### Layer 3: the period matrix and the period field

- **Period matrix.** `periodMatrix L = !![ω₁, ω₂; η(ω₁), η(ω₂)]`, a numerical `2 × 2` matrix.
  With `x = ℘(z)`, `y = ℘′(z)`, `dx/y = dz` and `x dx/y = ℘ dz = −dζ`, so its rows are the periods
  of `dx/y` and of `−x dx/y` on `γ₁, γ₂` (forms in rows, cycles in columns); the differential
  `x dx/y` itself has periods `−η(ω₁), −η(ω₂)`. Its identification with a de Rham–Betti
  comparison belongs to ComplexComparisonPartII and PeriodsAndSpecialValues, and is not built
  here. `det_periodMatrix : det P = −2πi` for a positive basis (Legendre). Change of basis of the
  same lattice by `γ ∈ GL₂(ℤ)` multiplies `P` on the right by `γ`.
- **Period field.** `periodField L = ℚ(Λ ∪ η(Λ))`, equal to
  `ℚ(ω₁, ω₂, η(ω₁), η(ω₂))` (`periodField_eq_adjoin`), lattice-invariant
  (`periodField_congr`), containing `2πi` (`two_pi_I_mem_periodField`); hence `π` is algebraic
  over it.
- **Upper bound.** `trdeg_periodField_le : trdeg ≤ 4` (four generators).
- **Zariski closure.** `periodIdeal L`, the kernel of evaluation `ℚ[X₁₁, X₁₂, X₂₁, X₂₂] → ℂ` at
  `P`, is prime, and
  `ringKrullDim_periodIdeal : dim ℚ[X]/periodIdeal = trdeg (periodField L)`, through Tau Ceti's
  `ringKrullDim_eq_toNat_trdeg`. Equivalences (`trdeg_periodField_eq_four_iff`): `trdeg = 4` iff
  the four entries are algebraically independent iff `periodIdeal L = ⊥` iff `ω₁, ω₂, η(ω₁), π`
  are algebraically independent.
- **Homotheties.** `trdeg_periodField_smul`: scaling by an algebraic `c` preserves the
  transcendence degree. `isAlgebraic_of_smul`: if `L` and `c • L` both have algebraic
  invariants then `c` is algebraic (one of `g₂, g₃` is nonzero by ModularCurvesPartII §1.1's
  `g₂³ − 27g₃² ≠ 0`, and `c⁴` or `c⁶` is a ratio of algebraic numbers). So the transcendence
  degree is an invariant of the curve `y² = 4x³ − g₂x − g₃` over `ℚ̄`, not of the chosen lattice.
- *Checks.* `trdeg (periodField L) = trdeg ℚ(ω₁, ω₂, η(ω₁), π)` (Legendre solves for
  `η(ω₂)`); for `L` and the pair `(ω₂, ω₁)` the period fields are equal and the determinants
  opposite. For `L = ofUpperHalfPlane I`, `periodMatrix L = !![1, i; π, −iπ]` (Layer 2 checks),
  with determinant `−2πi`, and `periodField L = ℚ(i, π)` has transcendence degree `1`; so the
  lower bound of Layer 5 needs its algebraic-invariants hypothesis, and with it shows that
  `g₂(ℤ[i])` is transcendental.
- *Needs:* Layers 0–2; Tau Ceti `ringKrullDim_eq_toNat_trdeg`.

### Layer 4: complex multiplication

- **CM lattices.** `HasCM L`; `hasCM_iff`: `HasCM L ↔ τ = ω₂/ω₁` satisfies a nonzero integer
  quadratic equation (`τ` is imaginary quadratic); the multiplier ring
  `{α | αΛ ⊆ Λ}` is a subring of `ℂ`, equal to `ℤ` without CM and to an order in `ℚ(τ)` with
  CM; every multiplier is an algebraic integer of degree `≤ 2` with `[Λ : αΛ] = |α|²`, and a real
  multiplier is an integer; `HasCM.smul`, `HasCM` lattice-invariant.
- **`℘(αz)` is rational in `℘(z)`.** For a multiplier `α ≠ 0` and algebraic invariants,
  `℘(αz) = P(℘(z))/Q(℘(z))` with `P, Q` with algebraic coefficients
  (`exists_weierstrassP_mul_eq`): `℘(αz)` is even and `Λ`-elliptic, its Laurent coefficients
  `α⁻², α^{2k}c_k` lie in `K = ℚ(g₂, g₃, α)` (Layer 1, Laurent algebra), and the Layer 1 descent
  gives `P, Q ∈ K[X]`; `K` is algebraic over `ℚ` since `g₂, g₃` and `α` are. Consequence,
  derived from it: `℘(p)` is algebraic for every `p ∈ α⁻¹Λ ∖ Λ`. Near such `p`, `℘` is analytic
  while `℘(αz)` has a pole, so `Q(℘(p)) = 0`, and `Q ≠ 0` has algebraic coefficients.
- **The CM quasi-period relation** (`exists_quasiPeriod_mul`). For every multiplier `α` and
  algebraic invariants there is an algebraic `b` with `η(αl) = ᾱ η(l) + b l` for all `l ∈ Λ`.
  For real `α`, an integer, take `b = 0` (additivity of `η`). For non-real `α`:
  `φ(z) = ζ(αz) − aζ(z) − bz` is elliptic for the unique `(a, b)` killing its periods (solvable
  by Legendre); the residue balance over a period parallelogram (`|α|²` poles of `ζ(αz)` with
  residue `1/α`, one of `ζ` with residue `a`) gives `a = |α|²/α = ᾱ`; `φ` is odd with simple poles
  at `α⁻¹Λ`, so it equals `(1/α) ∑_p c_p ℘′(z)/(℘(z) − ℘(p))` over representatives `p` of
  `(α⁻¹Λ ∖ Λ)/(Λ, ±)`, with `c_p = 1` or `1/2` at `2`-torsion (the difference is odd, elliptic,
  with at most a simple pole modulo `Λ`, hence `0`); comparing the `z¹` Laurent coefficients, `b`
  lies in `ℚ(g₂, g₃, α, ℘(p))`, which is algebraic by the previous item.
- **Upper bound with CM** (`trdeg_periodField_le_two_of_hasCM`). For a non-real multiplier `α`,
  writing `αω₁ = mω₁ + nω₂` (`n ≠ 0` since `α` is not real), the relation and Legendre give
  `ω₂ = (α − m)ω₁/n`, `η(ω₁) = (2πin + bω₁²)/((α − ᾱ)ω₁)`, `η(ω₂) = ((ᾱ − m)η(ω₁) + bω₁)/n`:
  the period field is algebraic over `ℚ(ω₁, π)`, so `trdeg ≤ 2`.
- *Checks.* `HasCM (ofUpperHalfPlane I)` with `α = i`, and `ofUpperHalfPlane τ` has CM for
  `τ = i√2` but not for `τ = iπ` (`hasCM_iff`). For `Λ = ℤ[i]`, `α = i`: `η(i) = −iη(1)`, i.e.
  `b = 0`. For `α = 2`, `exists_weierstrassP_mul_eq` is the duplication formula of Layer 1 and the
  quasi-period relation is `η(2l) = 2η(l)`.
- *Needs:* Layers 1–3.

### Layer 5: lower bounds — Chudnovsky from Nesterenko

- **Chudnovsky's theorem** (`chudnovsky`). Let `L` have algebraic invariants and
  `l ∈ Λ ∖ {0}`. Then `l/π` and `η(l)/π` are algebraically independent over `ℚ`. It consumes
  DiophantineApproximationAndTranscendence §5.6's `nesterenko`, the single owner of that
  statement. Proof: reduce to `l` primitive (`η(nl) = nη(l)`) and
  complete it to a positive basis `(l, ω)`, `τ = ω/l`; by the scaled Eisenstein dictionary,
  `E₄(τ) = (3g₂/4)(l/π)⁴`, `E₆(τ) = (27g₃/8)(l/π)⁶`, `E₂(τ) = 3(l/π)(η(l)/π)`, so
  `ℚ(E₂, E₄, E₆) ⊆ ℚ̄(l/π, η(l)/π)`; Nesterenko gives `trdeg ℚ(q, E₂, E₄, E₆) ≥ 3`, hence
  `trdeg ℚ(E₂, E₄, E₆) ≥ 2`.
- **Lower bound** (`two_le_trdeg_periodField`): `2 ≤ trdeg` for every `L` with algebraic
  invariants (`ω₁/π, η(ω₁)/π` lie in `periodField L(i)`, and adjoining `i` does not change the
  transcendence degree).
- **The CM case** (`trdeg_periodField_eq_two_of_hasCM`): `trdeg = 2`. With
  `ringKrullDim_periodIdeal`: the Zariski closure of the period matrix has dimension `2`, the
  dimension of the CM torus (the CM case attributed to Chudnovsky by Bost–Charles, §2.2.2).
- **Corollaries.** With CM and algebraic invariants, `ω₁` and `π` are algebraically independent;
  for `c • ofUpperHalfPlane I` or `c • ofUpperHalfPlane ρ` (`ρ = e^{2πi/3}`) with algebraic
  invariants, `c` and `π` are algebraically independent.
- *Checks.* A CM example: `L₀ = ofUpperHalfPlane I` has `g₃ = 0` (from `iΛ = Λ` and
  `G₆(iΛ) = −G₆(Λ)`), so `g₂ ≠ 0`; with `c⁴ = g₂(L₀)`, `c • L₀` has
  `g₂(c • L₀) = c⁻⁴g₂(L₀) = 1`, `g₃ = 0`, CM by `i`, and `trdeg = 2`. The proof of `chudnovsky`
  uses only `trdeg ≥ 2` of `ℚ(E₂, E₄, E₆)`, not the transcendence of `q`; `E₆(i) = 0` is
  compatible (for `ℤ[i]` the dictionary gives `g₃ = 0`).
- *Needs:* Layers 2–4; DiophantineApproximationAndTranscendence §5.6 (`nesterenko`) for the
  unconditional statements only.

## Ordering

ModularCurvesPartII (§§1.1, 1.3, 1.4a) → Layer 0 → Layer 1 → Layer 2 → Layer 3 → Layer 4 →
Layer 5. Within Layer 1, the residue balance precedes the structure theorem, and the Laurent
algebra precedes the descent; within Layer 2, Legendre precedes the dictionary for `η(τ)`;
within Layer 4, the algebraicity of `℘(p)` follows `exists_weierstrassP_mul_eq` and precedes the
quasi-period relation. Layer 5 needs Layers 2–4 and DiophantineApproximationAndTranscendence §5.6.

## Research context

Not targets. The elliptic case of Grothendieck's period conjecture (transcendence degree `4`
without complex multiplication) is open; Bost–Charles (2016, §2) relate the torsor form of the
conjecture to the statements `GPCᵏ` in each codimension, and prove `GPC¹` for abelian varieties
and products of curves (§3). The established CM case, `trdeg = 2` (Layer 5), is used downstream,
for instance by Kawabe (arXiv:2303.05030, §2.3) for CM Kummer surfaces.

The classical transcendence results below Layer 5 are not owned here. Schneider's theorem (1937),
that a nonzero period of a lattice with algebraic `g₂, g₃` is transcendental, follows from the
Schneider–Lang criterion for meromorphic functions of finite order applied to `℘` (Waldschmidt,
*Diophantine Approximation on Linear Algebraic Groups*, Theorem 4.1). LinearFormsInLogarithms
owns only the criterion for `ℂ^{d₀} × (ℂˣ)^{d₁}` (its target 5.7) and lists the meromorphic form
and its elliptic analogues as out of scope; no roadmap owns them. Grothendieck names Schneider's
theorem as the first visible case of the period conjecture (folder 18, p. 11: « contient le th.
de Schneider », for curves without complex multiplication).

## References

- J.-B. Bost and F. Charles, « Some remarks concerning the Grothendieck period conjecture »,
  *J. reine angew. Math.* 714 (2016), 175–208; arXiv:1307.1045. §2.2.2, Conjecture 2.12
  (numbering of arXiv v2), and the remark following it attributing the CM elliptic case to
  Chudnovsky. (zbMATH 1337.14009.)
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
  give for the CM case. (zbMATH 0431.10019.)
- G. V. Chudnovsky, *Contributions to the theory of transcendental numbers*, Math. Surveys and
  Monographs 19, AMS, 1984. (zbMATH 0594.10024.)
- Yu. V. Nesterenko, « Modular functions and transcendence questions », *Sb. Math.* 187 (1996),
  1319–1348, Theorem 1 and Corollary 3. (zbMATH 0898.11031.)
- M. Waldschmidt, « Transcendence of periods: the state of the art », *Pure Appl. Math. Q.* 2
  (2006), 435–463, §3 (Chudnovsky's theorem in the form used in Layer 5; Nesterenko's theorem).
  (zbMATH 1220.11090.)
- J. H. Silverman, *The Arithmetic of Elliptic Curves*, GTM 106, ch. VI; *Advanced Topics in the
  Arithmetic of Elliptic Curves*, GTM 151, 1994, ch. I. (zbMATH 0911.14015 for GTM 151.)
- NIST DLMF, §§23.2, 23.8, 23.9 (Weierstrass `ζ`, quasi-periods, Legendre's relation, series
  for `η`, the Laurent recursion 23.9.5).

## Provenance

Greenfield, on Mathlib's `PeriodPair`. The question that motivates it is Grothendieck's, in the
Montpellier folders cited in the summary; the established statements are those of the
transcendence literature cited above.
