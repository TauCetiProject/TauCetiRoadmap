# Roadmap: periods of elliptic curves and the Grothendieck period conjecture (elliptic case)

**Summary.** Build the complex-analytic theory of a lattice `Λ ⊂ ℂ` that the transcendence of
elliptic periods needs, on Mathlib's `PeriodPair` and Weierstrass `℘`: elliptic functions and
their Laurent algebra, the Weierstrass `ζ` function and the quasi-periods `η`, Legendre's
relation, the dictionary with Mathlib's Eisenstein series `E₂, E₄, E₆`, the period matrix and
the period field `ℚ(ω₁, ω₂, η₁, η₂)`, and complex multiplication of lattices. Prove the
unconditional bounds: the period field has transcendence degree at most `4`, at most `2` with
complex multiplication, and at least `2` always (Chudnovsky's theorem, derived from
Nesterenko's theorem, which DiophantineApproximationAndTranscendence proves), so exactly `2` in
the CM case. State the remaining case, transcendence degree `4` without complex
multiplication, as a `def … : Prop`: this is the elliptic case of the Grothendieck period
conjecture in the form of Bost–Charles, Conjecture 2.12.

The question first appears in Grothendieck's notes in 1965 (Montpellier fonds, folder 13,
pp. 47–48: is the de Rham–Betti realisation fully faithful over algebraic extensions of `ℚ`?).
Folder 18 (from 1969 to about 1972), pp. 10–12, states it in torsor form, the transcendence
degree of the field of periods being the dimension of the torsor that carries them, and asks for
an elliptic curve whether the transcendence degree of the comparison point is `dim G`, that is
`4` for `G = GL₂` without complex multiplication, or `2`, and whether its locus generates `G`.
The statement specified here is the refereed one, Bost–Charles 2016.

Suggested home: `TauCeti/Analysis/SpecialFunctions/Elliptic/` (mirroring Mathlib's
`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`) for Layers 0–2 and 4, and
`TauCeti/NumberTheory/Transcendental/EllipticPeriods/` for Layers 3, 5 and 6.

## Scope and ownership

**In scope.** Everything is a statement about a lattice `Λ = ℤω₁ + ℤω₂`, given as a Mathlib
`PeriodPair L`, and about the functions `℘ = L.weierstrassP`, `ζ`, and the numbers built from
them. This roadmap owns:

- the elliptic-function API of a `PeriodPair` (Layer 1): Liouville, the residue and order
  balance over a period parallelogram, even elliptic functions as rational functions of `℘`,
  `g₂³ − 27g₃² ≠ 0`, the Laurent expansion of `℘` and the polynomiality of `G_{2k}` in
  `g₂, g₃`;
- the Weierstrass `ζ` function, the quasi-period homomorphism `η : Λ → ℂ`, Legendre's relation
  and the homogeneity of all lattice functions under `Λ ↦ cΛ` (Layers 0 and 2);
- the dictionary between the lattice invariants `g₂, g₃, η(1)` of `ℤ + ℤτ` and Mathlib's
  `ModularForm.E₄`, `ModularForm.E₆`, `EisensteinSeries.E2` (Layer 2);
- the period matrix, the period field and its transcendence degree (Layers 3, 5);
- complex multiplication of a lattice and the CM relation between quasi-periods (Layer 4);
- the statement of the conjecture, its equivalent forms and consequences (Layer 6).

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
- *The Weierstrass `σ` function and the analytic uniformisation `ℂ/Λ ≅ W_Λ(ℂ)`*: the
  ModularCurves part II roadmap (§§1.1–1.4a). Its `latticeQuasiPeriod` is the `quasiPeriod` of
  Layer 2 (both are defined by `ζ(z + l) − ζ(z)`, `ζ = σ′/σ`), and its
  `latticeQuasiPeriod_legendre` is `legendre` here, with the same orientation convention.
- *Algebraic de Rham cohomology and the de Rham–Betti comparison of a variety*: the
  ComplexComparison part II roadmap. See the last section.

The boundary in one sentence: if a statement is about a lattice in `ℂ` and functions or
numbers attached to it, it is here; if it is about a Weierstrass equation over a field, it is
in EllipticCurves; if it is about modular values, it is in DiophantineApproximation.

## What Mathlib and Tau Ceti already have (consume)

- **Lattices and `℘`.** `PeriodPair` (fields `ω₁ ω₂ : ℂ`, `indep : LinearIndependent ℝ ![ω₁, ω₂]`),
  `PeriodPair.lattice : Submodule ℤ ℂ`, `latticeBasis`, `IsZLattice ℝ L.lattice`,
  `ω₁_div_two_notMem_lattice`; `PeriodPair.weierstrassP` (scoped notation `℘[L]`), its
  periodicity `weierstrassP_add_coe`, evenness, `meromorphic_weierstrassP`,
  `order_weierstrassP` (double poles at the lattice), `analyticOnNhd_weierstrassP`, the power
  series `hasFPowerSeriesOnBall_weierstrassP`; `derivWeierstrassP` with periodicity and
  oddness; `PeriodPair.G n = ∑' l, l⁻ⁿ`, `G_eq_zero_of_odd`, `g₂ = 60 G 4`, `g₃ = 140 G 6`, and
  `derivWeierstrassP_sq : ℘′(z)² = 4℘(z)³ − g₂℘(z) − g₃` off the lattice
  (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`; its TODO asks for the
  connection with the modular-forms library, which Layer 2 supplies).
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
  comparison `ringKrullDim_eq_toNat_trdeg` used by DiophantineApproximation.

Tau Ceti has no Weierstrass `ζ`, no quasi-periods, no elliptic-function theory on `PeriodPair`
and no CM for lattices; Mathlib has none of these either.

## Conventions (pinned)

- **The object is a `PeriodPair`.** No new lattice structure. Statements that depend only on
  the lattice are proved invariant under change of `PeriodPair` with the same `lattice`
  (`weierstrassP_congr`, `quasiPeriod_congr`, `periodField_congr`).
- **Orientation.** A `PeriodPair` is unoriented. A basis is *positive* when
  `0 < (L.ω₂ / L.ω₁).im`; this hypothesis is written out where needed, never wrapped in a
  predicate. `ofUpperHalfPlane τ = (1, τ)` is positive.
- **Quasi-periods.** `ζ(z) = 1/z + ∑'_{l ≠ 0} (1/(z − l) + 1/l + z/l²)` (DLMF 23.2.5), so
  `ζ′ = −℘` and `ζ` is odd. `η(l)` is defined by `ζ(z + l) = ζ(z) + η(l)` for `z ∉ Λ`: the
  quasi-period of the *full* period `l`. ⚠ DLMF writes the lattice as `2ω₁ℤ + 2ω₃ℤ` and
  `η_j = ζ(ω_j)`, so its `η_j` is half of `η(2ω_j)` here.
- **Legendre.** For a positive basis, `η(ω₁) ω₂ − η(ω₂) ω₁ = 2πi` (DLMF 23.2.14 in full-period
  form; Bost–Charles' sign conventions are irrelevant here). Reversing the basis changes the
  sign. In matrix form: the period matrix `P = [[ω₁, ω₂], [η(ω₁), η(ω₂)]]` has
  `det P = −2πi`.
- **Scaling.** `c • L = (cω₁, cω₂)` for `c : ℂˣ`. Then `G_k(cΛ) = c⁻ᵏ G_k(Λ)`,
  `℘_{cΛ}(cz) = c⁻² ℘_Λ(z)`, `ζ_{cΛ}(cz) = c⁻¹ ζ_Λ(z)`, `η_{cΛ}(cl) = c⁻¹ η_Λ(l)`.
- **Algebraic.** "Algebraic" is `IsAlgebraic ℚ` inside `ℂ`; "algebraic invariants" is the pair
  of hypotheses `IsAlgebraic ℚ L.g₂`, `IsAlgebraic ℚ L.g₃`, written out. Transcendence degrees
  are `Algebra.trdeg ℚ` of an `IntermediateField ℚ ℂ`; since `ℚ̄/ℚ` is algebraic this is the
  transcendence degree over `ℚ̄` of the compositum with `ℚ̄`, which is how the literature states
  it.
- **Complex multiplication.** `HasCM L` means `∃ α : ℂ, α.im ≠ 0 ∧ ∀ l ∈ L.lattice, α * l ∈
  L.lattice`. It depends only on the lattice and is invariant under scaling.
- **Junk values.** As in Mathlib, `℘`, `ζ` take junk values at lattice points; statements about
  values carry `z ∉ L.lattice`, and identities between elliptic functions hold
  `∀ᶠ z in Filter.codiscrete ℂ`.

## The build, in layers

The order is the dependency order. Every item below is a target.

### Layer 0: period pairs — scaling and the upper half-plane

- **Scaling.** The action `SMul ℂˣ PeriodPair` (defined in `Suggested.lean`), with
  `lattice_smul : (c • L).lattice = c · L.lattice`, `G_smul`, `g₂_smul`, `g₃_smul`,
  `weierstrassP_smul`, `derivWeierstrassP_smul`, and `smul_smul`, `one_smul`.
- **Lattice invariance.** `weierstrassP_congr`, `G_congr`: `℘` and `G_k` depend only on
  `L.lattice` (immediate from the definitions as sums over the lattice; state them so that
  later layers never unfold).
- **The upper half-plane.** `ofUpperHalfPlane τ = (1, τ)`; every positive `L` is
  `L.ω₁ • ofUpperHalfPlane (L.ω₂ / L.ω₁)` up to equality of lattices (`eq_smul_ofUpperHalfPlane`),
  and `L.swap` (exchange of `ω₁, ω₂`) has the same lattice.
- *Checks.* `(2 : ℂˣ) • L` has `g₂` divided by `16`; `ofUpperHalfPlane I` and
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
  (`exists_eq_div_weierstrassP`), and every elliptic function is `R₁(℘) + ℘′ R₂(℘)`; odd ones
  are `℘′ R(℘)`. When the Laurent coefficients of `f` at `0` lie in a subfield `K ⊆ ℂ`
  containing `g₂, g₃`, and the poles of `f` sit at points `p` with `℘(p)` algebraic over `K`,
  the rational functions can be taken with coefficients algebraic over `K`
  (state it as: the linear system on coefficients has a nonzero solution over `K̄ ∩ ℂ`, since
  its solution space over `ℂ` is the base change of that over `K`).
- **The half-period values.** `℘′(ω/2) = 0` for `ω ∈ Λ ∖ 2Λ`; the three values
  `e₁, e₂, e₃` at `ω₁/2, ω₂/2, (ω₁+ω₂)/2` are distinct (each is a double zero of `℘ − e_i`),
  `4X³ − g₂X − g₃ = 4∏(X − e_i)`, and
  `discriminant_ne_zero : g₂³ − 27g₃² ≠ 0` (it is `16∏_{i<j}(e_i − e_j)²`).
- **Laurent algebra.** `℘(z) = z⁻² + ∑_{k≥1} (2k+1) G_{2k+2} z^{2k}` near `0`
  (`hasSum_weierstrassP_laurent`, from Mathlib's power series of `℘ − z⁻²` at `0`); with
  `c_k = (2k+1)G_{2k+2}`: `c₁ = g₂/20`, `c₂ = g₃/28`, and for `n ≥ 3`,
  `(2n+3)(n−2) c_n = 3 ∑_{k=1}^{n−2} c_k c_{n−1−k}`, from `℘″ = 6℘² − g₂/2` (derivative of
  `derivWeierstrassP_sq`). Hence `G_mem_adjoin : G_{2k} ∈ ℚ[g₂, g₃]` for `k ≥ 2`.
- *Checks.* `c₃ = g₂²/1200` and `c₄ = 3g₂g₃/6160`; `G 2` is Mathlib's junk `0` (the sum is not
  absolutely summable) and appears in no statement; for `Λ = ℤ[i]`, `g₃ = 0` and `g₂ ≠ 0`; for
  `Λ = ℤ[e^{2πi/3}]`, `g₂ = 0` and `g₃ ≠ 0`.
- *Needs:* Layer 0; Mathlib `Weierstrass.lean`; Tau Ceti `TauCeti.Contour` (ContourIntegration
  Layers 2–3). (Silverman, AEC, ch. VI; DLMF §23.3.)

### Layer 2: the Weierstrass ζ function, quasi-periods, Legendre, Eisenstein

- **`ζ`.** `weierstrassZeta L` as in Conventions: locally uniform convergence off `Λ`
  (the summand is `O(|l|⁻³)` on compacts, as Mathlib does for `℘`), meromorphy with simple poles
  of residue `1` at `Λ`, oddness, `hasDerivAt_weierstrassZeta : ζ′ = −℘` off `Λ`, the Laurent
  expansion `ζ(z) = 1/z − ∑_{k≥1} G_{2k+2} z^{2k+1}`, `weierstrassZeta_smul`,
  `weierstrassZeta_congr`.
- **Quasi-periods.** `quasiPeriod L l` (defined at the base point `ω₁/2`), with
  `weierstrassZeta_add_coe` (any base point off `Λ`), additivity on `Λ` (`quasiPeriod_add`), so
  `η` restricts to an additive map `L.lattice →+ ℂ` (`quasiPeriodHom`), `η(−l) = −η(l)`,
  `η(ω) = 2ζ(ω/2)` for `ω ∈ Λ ∖ 2Λ`, `quasiPeriod_smul`, `quasiPeriod_congr`.
- **Legendre's relation** (`legendre`). For a positive basis,
  `η(ω₁)ω₂ − η(ω₂)ω₁ = 2πi`. Integrate `ζ` over the boundary of the parallelogram with vertices
  `−(ω₁+ω₂)/2 + {0, ω₁, ω₁+ω₂, ω₂}`: no lattice point on it, only `0` inside, winding number `1`
  for a positive basis; pairs of opposite sides give `η(ω₁)ω₂` and `−η(ω₂)ω₁`; the residue is
  `1`. Corollary: `η(ω₁), η(ω₂)` are not both `0`, and `ω ↦ η(ω)` is not `ℂ`-linear on `Λ`.
- **The Eisenstein dictionary.** For `τ` in the upper half-plane and `L = ofUpperHalfPlane τ`:
  `g₂ = (4π⁴/3) E₄(τ)`, `g₃ = (8π⁶/27) E₆(τ)` (from `G_k = 2ζ(k)E_k` and
  `ζ(4) = π⁴/90`, `ζ(6) = π⁶/945`), and `η(1) = G₂(τ) = (π²/3) E₂(τ)` with Mathlib's `G2`
  (`quasiPeriod_ofUpperHalfPlane_one`). Prove the last one row by row: the series for
  `ζ(z+1) − ζ(z)` has summands `O(|l|⁻³)`, so it may be grouped by rows `l = mτ + n`; in each row
  the terms `1/(z+1−l) − 1/(z−l)` telescope to `0` over symmetric partial sums, leaving
  `∑'_n (mτ+n)⁻²`, which is Mathlib's `e2Summand m τ` (with `e2Summand 0 τ = 2ζ(2)`); the outer
  sum is absolutely convergent, hence equal to the symmetric sum defining `G2`. Then
  `η(τ) = τ G₂(τ) − 2πi` by Legendre. By scaling, for any positive `L` with
  `τ = ω₂/ω₁`: `g₂ = ω₁⁻⁴(4π⁴/3)E₄(τ)`, `g₃ = ω₁⁻⁶(8π⁶/27)E₆(τ)`,
  `η(ω₁) = ω₁⁻¹(π²/3)E₂(τ)` (`eisenstein_dictionary`).
- *Checks.* At `τ = i`, `η(i) = −i η(1)` (from `iΛ = Λ` and homogeneity) and Legendre give
  `η(1) = π`, matching Mathlib-side `E₂(i) = 3/π` (DiophantineApproximation's
  `eisenstein_values_at_i`); `G₂(−1/τ) = τ²G₂(τ) − 2πiτ` is recovered from Legendre and agrees
  with Mathlib's `G2` transformation (`D2`); reversing the basis flips the sign of the Legendre
  determinant.
- *Needs:* Layers 0–1; Tau Ceti `TauCeti.Contour.classicalResidueTheorem_nullHomologous`;
  Mathlib `EisensteinSeries.G2`, `E2`, `ModularForm.E₄`, `E₆`, `riemannZeta_two`,
  `riemannZeta_four`, `riemannZeta_two_mul_nat` (for `ζ(6)`). (DLMF 23.2.5–23.2.14, 23.8.5; Silverman, ATAEC, ch. I.)

### Layer 3: the period matrix and the period field

- **Period matrix.** `periodMatrix L = !![ω₁, ω₂; η(ω₁), η(ω₂)]`: the comparison isomorphism
  between Betti and de Rham `H¹`, in the bases `(γ₁, γ₂)` and `(dx/y, x dx/y)` read through the
  uniformisation. `det_periodMatrix : det P = −2πi` for a positive basis (Legendre), the
  elliptic form of the normalisation of the Tate motive: on `H² = ℚ(−1)` the period is `2πi`.
  Change of basis of the same lattice by `γ ∈ GL₂(ℤ)` multiplies `P` on the right by `γ`.
- **Period field.** `periodField L = ℚ(Λ ∪ η(Λ))`, equal to
  `ℚ(ω₁, ω₂, η(ω₁), η(ω₂))` (`periodField_eq_adjoin`), lattice-invariant
  (`periodField_congr`), containing `2πi` (`two_pi_I_mem_periodField`); hence `π` is algebraic
  over it.
- **Upper bound.** `trdeg_periodField_le : trdeg ≤ 4` (four generators).
- **Zariski closure.** `periodIdeal L`, the kernel of evaluation `ℚ[X₁₁, X₁₂, X₂₁, X₂₂] → ℂ` at
  `P`, is prime, and
  `ringKrullDim_periodIdeal : dim ℚ[X]/periodIdeal = trdeg (periodField L)`. This is the
  dimension of the Zariski closure of the comparison point, the `Z_X` of Bost–Charles
  restricted to `H¹`.
- **Homotheties.** `trdeg_periodField_smul`: scaling by an algebraic `c` preserves the
  transcendence degree. `isAlgebraic_of_smul`: if `L` and `c • L` both have algebraic
  invariants then `c` is algebraic (one of `g₂, g₃` is nonzero by `discriminant_ne_zero`, and
  `c⁴` or `c⁶` is a ratio of algebraic numbers). So the transcendence degree is an invariant of
  the curve `y² = 4x³ − g₂x − g₃` over `ℚ̄`, not of the chosen lattice.
- *Checks.* `trdeg (periodField L) = trdeg ℚ(ω₁, ω₂, η(ω₁), π)` (Legendre solves for
  `η(ω₂)`); for `L` and `L.swap` the period fields are equal and the determinants opposite.
- *Needs:* Layers 0–2; Tau Ceti `ringKrullDim_eq_toNat_trdeg`.

### Layer 4: complex multiplication

- **CM lattices.** `HasCM L`; `hasCM_iff`: `HasCM L ↔ τ = ω₂/ω₁` satisfies a nonzero integer
  quadratic equation (`τ` is imaginary quadratic); the multiplier ring
  `{α | αΛ ⊆ Λ}` is a subring of `ℂ`, equal to `ℤ` without CM and to an order in `ℚ(τ)` with
  CM; every multiplier is an algebraic integer of degree `≤ 2` with `[Λ : αΛ] = |α|²`;
  `HasCM.smul`, `HasCM` lattice-invariant.
- **`℘(αz)` is rational in `℘(z)`.** For `α ≠ 0` with `αΛ ⊆ Λ` and algebraic invariants,
  `℘(αz) = P(℘(z))/Q(℘(z))` with `P, Q` with algebraic coefficients
  (`exists_weierstrassP_mul_eq`): `℘(αz)` is even and `Λ`-elliptic (Layer 1, structure), its
  Laurent coefficients lie in `ℚ(g₂, g₃, α)` (Layer 1, Laurent algebra), and the descent of the
  linear system applies. Consequently `℘(p)` is algebraic for every `p ∈ α⁻¹Λ ∖ Λ`.
- **The CM quasi-period relation** (`exists_quasiPeriod_mul`). For non-real `α` with
  `αΛ ⊆ Λ` and algebraic invariants there is an algebraic `b` with
  `η(αl) = ᾱ η(l) + b l` for all `l ∈ Λ`. Proof: `φ(z) = ζ(αz) − aζ(z) − bz` is elliptic for the
  unique `(a, b)` killing its periods (solvable by Legendre); the residue balance over a period
  parallelogram (`|α|²` poles of `ζ(αz)` with residue `1/α`, one of `ζ` with residue `a`) gives
  `a = |α|²/α = ᾱ`; `φ` is odd with simple poles at `α⁻¹Λ`, so it equals
  `(1/α) ∑_p c_p ℘′(z)/(℘(z) − ℘(p))` over representatives `p` of `(α⁻¹Λ ∖ Λ)/(Λ, ±)`, with
  `c_p = 1` or `1/2` at `2`-torsion (the difference is odd, elliptic, with at most a simple pole
  modulo `Λ`, hence `0`); comparing the `z¹` Laurent coefficients, `b` lies in
  `ℚ(g₂, g₃, α, ℘(p))`, which is algebraic.
- **Upper bound with CM** (`trdeg_periodField_le_two_of_hasCM`). Writing `αω₁ = mω₁ + nω₂`
  (`n ≠ 0`), the relation and Legendre give `ω₂ = (α − m)ω₁/n`,
  `η(ω₁) = (2πin + bω₁²)/((α − ᾱ)ω₁)`, `η(ω₂) = ((ᾱ − m)η(ω₁) + bω₁)/n`: the period field is
  algebraic over `ℚ(ω₁, π)`, so `trdeg ≤ 2`.
- *Checks.* For `Λ = ℤ[i]`, `α = i`: `η(i) = −iη(1)`, i.e. `b = 0`. For `α ∈ ℤ` the relation
  holds with `b = 0` and is the additivity of `η`; the hypothesis `α.im ≠ 0` is what makes `n ≠ 0`.
- *Needs:* Layers 1–3.

### Layer 5: lower bounds — Chudnovsky from Nesterenko

- **The bridge** (`chudnovsky_of_nesterenko`). Assume Nesterenko's statement
  (`NesterenkoStatement`, literally the statement of DiophantineApproximation's `nesterenko`).
  Let `L` have algebraic invariants and `l ∈ Λ ∖ {0}`. Then `l/π` and `η(l)/π` are
  algebraically independent over `ℚ`. Proof: reduce to `l` primitive (`η(nl) = nη(l)`) and
  complete it to a positive basis `(l, ω)`, `τ = ω/l`; by the scaled Eisenstein dictionary,
  `E₄(τ) = (3g₂/4)(l/π)⁴`, `E₆(τ) = (27g₃/8)(l/π)⁶`, `E₂(τ) = 3(l/π)(η(l)/π)`, so
  `ℚ(E₂, E₄, E₆) ⊆ ℚ̄(l/π, η(l)/π)`; Nesterenko gives `trdeg ℚ(q, E₂, E₄, E₆) ≥ 3`, hence
  `trdeg ℚ(E₂, E₄, E₆) ≥ 2`. The bridge is a theorem now, independent of the status of
  `nesterenko`.
- **Chudnovsky's theorem** (`chudnovsky`), unconditional: the bridge applied to
  DiophantineApproximation §5.6 `nesterenko`.
- **Lower bound** (`two_le_trdeg_periodField`): `2 ≤ trdeg` for every `L` with algebraic
  invariants (`ω₁/π, η(ω₁)/π` lie in `periodField L(i)`, and adjoining `i` does not change the
  transcendence degree).
- **The CM case** (`trdeg_periodField_eq_two_of_hasCM`): `trdeg = 2`. With
  `ringKrullDim_periodIdeal`: the Zariski closure of the period matrix has dimension `2`, the
  dimension of the CM torus. This is the case of Bost–Charles' Conjecture 2.12 they attribute to
  Chudnovsky.
- **Corollaries.** With CM, `ω₁` and `π` are algebraically independent; for `L = c · ℤ[i]` or
  `c · ℤ[e^{2πi/3}]` with algebraic invariants, `c` and `π` are algebraically independent.
- *Checks.* The bridge uses only `trdeg ≥ 2` of `ℚ(E₂, E₄, E₆)`, not the transcendence of `q`;
  `E₆(i) = 0` is compatible (for `ℤ[i]` the dictionary gives `g₃ = 0`).
- *Needs:* Layers 2–4; DiophantineApproximationAndTranscendence §5.6 (`nesterenko`) for the
  unconditional statements only.

### Layer 6: the conjecture

- **Statement.** `EllipticPeriodConjecture : Prop`: for every `L` with algebraic invariants and
  `¬ HasCM L`, `trdeg (periodField L) = 4`. Never assumed except as an explicit hypothesis.
- **Equivalent forms, proved.**
  `ellipticPeriodConjecture_iff_algebraicIndependent` (the four numbers
  `ω₁, ω₂, η(ω₁), η(ω₂)` are algebraically independent); the Zariski-closure form (the
  `periodIdeal` has height `0`, i.e. is `⊥`: no polynomial relation over `ℚ` among the entries of
  the period matrix, for non-CM `L`); the form with `π`: `ω₁, ω₂, η(ω₁), π` algebraically
  independent; the form for one lattice in each homothety class (by `trdeg_periodField_smul`
  and `isAlgebraic_of_smul`).
- **Consequences, proved.** `EllipticPeriodConjecture.trdeg_eq`: under the conjecture,
  `trdeg = if HasCM L then 2 else 4` (Layers 4–5 for the CM half);
  `EllipticPeriodConjecture.algebraicIndependent_pi`.
- **The hypothesis is needed** (`exists_hasCM_g₂_eq_one`, `not_forall_trdeg_periodField_eq_four`):
  `L₀ = ofUpperHalfPlane I` has `g₃ = 0` (from `iΛ = Λ` and `G₆(iΛ) = −G₆(Λ)`), so `g₂ ≠ 0`;
  with `c⁴ = g₂(L₀)`, `c⁻¹ • L₀` has `g₂ = 1`, `g₃ = 0`, CM by `i`, and `trdeg ≤ 2` (Layer 4 only).
- *Checks.* The conjecture is consistent with every theorem above: `2 ≤ trdeg ≤ 4`,
  `trdeg ≤ 2` with CM. The variant "for all `L`" is false (previous item); the variant without
  algebraic invariants is false (`ofUpperHalfPlane τ` with `τ` algebraic of degree `3` has no
  CM, and its periods `1, τ` are algebraic, so `trdeg ≤ 2`).
- *Needs:* Layers 3–5.

## Ordering

Layer 0 → Layer 1 → Layer 2 → Layer 3 → Layer 4 → Layer 5 → Layer 6. Within Layer 1, the residue
balance precedes the structure theorem; within Layer 2, Legendre precedes the dictionary for
`η(τ)`. Layer 5's bridge needs only Layers 2–4; its unconditional corollaries need
DiophantineApproximation §5.6. Layer 6's non-example needs only Layer 4.

## Roadmap for a roadmap: the de Rham–Betti formulation

*This section is a roadmap-for-a-roadmap: it sketches the general statement beyond this entry,
and contributors should not work from it now — take targets from Layers 0–6 above.*

- **Elliptic curves over `ℚ̄` as varieties.** Identify `periodMatrix` with the comparison
  isomorphism `H¹_dR(E/ℚ̄) ⊗ ℂ ≅ H¹_B(E(ℂ), ℚ) ⊗ ℂ` for `E : y² = 4x³ − g₂x − g₃`; this needs
  algebraic de Rham cohomology and the comparison (ComplexComparison part II) and the analytic
  uniformisation (ModularCurves part II §§1.2–1.4), and the existence of a lattice with given
  algebraic `g₂, g₃` (surjectivity of `j`). Then state the conjecture for every
  `E : WeierstrassCurve ℚ̄` with `[E.IsElliptic]` and identify `HasCM` with EllipticCurves'
  `HasGeometricCM`.
- **The torsor of periods.** For a smooth projective `X/ℚ̄`, Bost–Charles' Conjecture 2.12
  (`Z_X = Ω_X^mot`) and the weaker conjectures `GPC^k(X)`; for `X = E`, identification of
  `Ω_E^mot` with a torsor under `GL₂` (no CM) or the CM torus, which turns Conjecture 2.12 into
  `EllipticPeriodConjecture` and Layer 5's CM theorem.
- **Full faithfulness.** Grothendieck's 1965 question: full faithfulness of
  `M ↦ (T_dR(M), T_B(M), φ)` over algebraic extensions of `ℚ`, its reduction to `ℚ̄`, and its
  group form `V^G = V ∩ g(V̄)`; in rank one (the Tate motives `ℚ(n)`) it holds because `π` is
  transcendental: a de Rham–Betti morphism `ℚ(0) → ℚ(n)` with `n ≠ 0` would make `(2πi)^n`
  algebraic. `det_periodMatrix` is the elliptic instance of the period it uses: `∧²H¹(E) ≅ ℚ(−1)`
  has period `−2πi`.
- **Higher dimension.** Abelian varieties (Wüstholz's analytic subgroup theorem, `GPC¹` for
  abelian varieties, Bost–Charles §3), and André's generalised period conjecture for 1-motives.

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
- NIST DLMF, §§23.2, 23.3, 23.8 (Weierstrass `ζ`, quasi-periods, Legendre's relation, series
  for `η`).

## Provenance

None: this is a greenfield development. The statement of the conjecture follows Bost–Charles;
the elliptic formulation (lattice with algebraic invariants, `trdeg ∈ {2, 4}`) is the one used in
the transcendence literature cited above.
