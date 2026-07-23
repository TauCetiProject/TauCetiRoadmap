import Mathlib

/-!
# Modular curves, following Katz–Mazur: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap (the conventions, the layer-by-layer build plan Layers 0–7, the worked
examples, and the references) is in `README.md`. Mathlib has the scheme substrate (`Scheme`,
`Spec`/`Proj`, fibre products, the morphism-property library — étale, smooth with relative
dimension, proper, finite, flat with rank, descent — ideal sheaves, and group objects
`Grp_`/`CommGrp_`) and the complete equation-level theory of elliptic curves
(`WeierstrassCurve`, `Affine.Point`, division polynomials). It has **no** elliptic curve as a
scheme over a base, **no** group-scheme structure or isogenies, **no** relative Cartier
divisors or scheme quotients, **no** Drinfeld level structures, **no** moduli formalism
`Ell/R`, and **no** modular curves. We build these in
`TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/` and `TauCeti/AlgebraicGeometry/ModularCurve/`,
following Katz–Mazur (*Arithmetic Moduli of Elliptic Curves*, whose result numbering is the
coordinate system) with Loeffler's notes as the companion spine — cited for the mathematics,
not as the specification. This roadmap absorbs the scheme-facing elliptic-curve layer that the
elliptic-curves roadmap deliberately defers, and owes it the function-field comparison
contract (`README.md` §Layer 2).

`sorry` is allowed in this human-owned roadmap library — these are goals, not proofs.
Following the roadmap-writing guide, the Layer-1 entry points statable against pinned Mathlib
are seeded below (`projModel` and its structure morphism, section, properness, smoothness, and
points dictionary); nothing is a `Prop`-typed placeholder. The layers whose central objects
are new *types* — relative Cartier divisors and quotients (Layer 0), the bundled elliptic
curve over a base with its group structure (Layer 1), isogenies and `E[N]` (Layer 2),
Drinfeld structures (Layer 3), `Ell/R` and moduli problems (Layer 4), and the modular curves
(Layers 5–7) — need the very API those layers introduce; they are specified in `README.md`
and built there, not pinned here as `sorry`-typed junk types.

## Provenance (migrate and complete from existing work)

The AINTLIB modular-curves project (revisions pinned in `README.md` §Provenance) carries the
program a long way: the `Y₁(N)` naive-representability headline `gammaOneNaive_representable`
is complete and axiom-clean on its `main` branch, and the active branch holds the elliptic
curve over a base (locally-Weierstrass record, chart-built group law, points dictionary), the
Katz–Mazur endomorphism/degree material, subgroup quotients, `μ_N`, level structures, the
`Ell/R` formalism with the Weierstrass atlas and rigidifier torsors, and the Drinfeld and
regularity streams in progress. It is material to migrate and complete, never the standard.
-/

namespace TauCetiRoadmap.ModularCurves

open AlgebraicGeometry CategoryTheory

open scoped Classical

/-! ## Layer 0: scheme-theoretic prerequisites (what KM silently assume)

Relative effective Cartier divisors in the curve case (KM 1.1–1.2, with the finite-locally-free
characterisation KM 1.2.3 as the definition of record and the invertible-ideal-sheaf
form a flagged off-critical-path comparison), finite locally free group schemes with
`(ℤ/N)_S`, `μ_N`, and Cartier duality, quotients (invariants, free actions, torsors,
Hopf-invariant quotients of curves by finite subgroups), the finite étale dictionary, and
faithfully flat descent. All new API at Mathlib generality, specified in `README.md` §Layer 0
and built there, not pinned here. -/

/-! ## Layer 1: elliptic curves over a base scheme (KM 2.1; DR II.1)

The projective model of a Weierstrass curve, as a scheme: `Proj` of the homogenised cubic,
proper, smooth of relative dimension `1` when elliptic, with its zero section and its points
dictionary against Mathlib's `Affine.Point`. These entry points are statable against pinned
Mathlib and are seeded below. The bundled `EllipticCurve S` — smooth proper with section,
Zariski-locally Weierstrass, with its commutative group-scheme structure built on charts and
its uniqueness theorem — is specified in `README.md` §Layer 1. -/

/-- **The projective model of a Weierstrass curve** (KM 2.2-shape; the scheme of the elliptic
curve): `Proj R[X, Y, Z] / (Y²Z + a₁XYZ + a₃YZ² − X³ − a₂X²Z − a₄XZ² − a₆Z³)`. The
elliptic-curve condition is not needed for the scheme itself, only for its smoothness. -/
noncomputable def projModel {R : Type u} [CommRing R] (W : WeierstrassCurve R) :
    Scheme.{u} :=
  sorry

/-- **The structure morphism** `projModel W ⟶ Spec R`. -/
noncomputable def projModelOver {R : Type u} [CommRing R] (W : WeierstrassCurve R) :
    projModel W ⟶ Spec (CommRingCat.of R) :=
  sorry

/-- **The projective model is proper** over the base — the Weierstrass cubic is a closed
subscheme of `ℙ²_R` (KM 2.1's properness clause, with no ellipticity hypothesis). -/
theorem isProper_projModelOver {R : Type u} [CommRing R] (W : WeierstrassCurve R) :
    IsProper (projModelOver W) :=
  sorry

/-- **The projective model of an elliptic curve is smooth of relative dimension `1`**
(KM 2.1): ellipticity (`IsUnit W.Δ`) is exactly fibrewise nonsingularity of the cubic. -/
theorem smoothOfRelativeDimension_one_projModelOver {R : Type u} [CommRing R]
    (W : WeierstrassCurve R) [W.IsElliptic] :
    SmoothOfRelativeDimension 1 (projModelOver W) :=
  sorry

/-- **The zero section** `[0 : 1 : 0]` of the projective model. -/
noncomputable def projModelZero {R : Type u} [CommRing R] (W : WeierstrassCurve R) :
    Spec (CommRingCat.of R) ⟶ projModel W :=
  sorry

/-- The zero section is a section of the structure morphism. -/
theorem projModelZero_comp {R : Type u} [CommRing R] (W : WeierstrassCurve R) :
    projModelZero W ≫ projModelOver W = 𝟙 (Spec (CommRingCat.of R)) :=
  sorry

/-- **The points dictionary** (KM 2.1; the Layer-1 bridge): over a field, sections of the
structure morphism of the projective model are exactly Mathlib's point group
`W.toAffine.Point` — the point at infinity corresponding to `projModelZero`. Every fibrewise
statement in Layers 2–7 is checked against the equation-level theory through this
equivalence; once Layer 1's group structure exists, it upgrades to a group isomorphism. -/
noncomputable def projModelPointsEquiv {K : Type u} [Field K] (W : WeierstrassCurve K) :
    {g : Spec (CommRingCat.of K) ⟶ projModel W //
      g ≫ projModelOver W = 𝟙 (Spec (CommRingCat.of K))} ≃ W.toAffine.Point :=
  sorry

/-! ## Layer 2: isogenies, torsion, quotients, and the Weil pairing (KM Ch. 1–2)

`[N]` finite locally free of rank `N²` with `E[N] := ker [N]` (KM 2.3.1), rigidity, the
hom-group and `End_S(E)`, degree as rank, the Abel-free dual `φ̂ := [tr φ] − φ` with
`φ̂ ∘ φ = [deg φ]` (KM 2.6.2.2), quotients `E/C` by finite locally free subgroups, the Weil
pairing `e_N : E[N] ×_S E[N] ⟶ μ_N` (KM 2.8) with its normalisation pinned against the
field-level pairing, and the function-field comparison contract with the elliptic-curves
roadmap. All need Layer 1's bundled object; specified in `README.md` §Layer 2. -/

/-! ## Layer 3: Drinfeld level structures (KM Ch. 1, 3)

Full sets of sections (KM 1.3.5–1.3.7) and their closed-subscheme representability
(KM 1.6.1–1.6.2), exact order `N` with the exact-order locus (KM 1.4), cyclic subgroups
(KM 1.4.1, Ch. 6), the three structures `[Γ(N)]`, `[Γ₁(N)]`, `[Γ₀(N)]` (KM 3.1–3.4) over an
arbitrary base, and the naive ⟺ Drinfeld equivalences over `ℤ[1/N]` (KM 1.4.4, 3.7).
Specified in `README.md` §Layer 3. -/

/-! ## Layer 4: the moduli formalism (KM Ch. 4)

The category `Ell/R`, moduli problems as contravariant functors, relative representability,
rigidity, and the representability scholium (KM 4.7.0) — with the Weierstrass atlas
`Spec R[a₁, …, a₆][Δ⁻¹]` and the Legendre/level-3/level-4 rigidifier torsors as the descent
covers, and no stacks anywhere (`README.md` conventions). Specified in `README.md` §Layer 4. -/

/-! ## Layer 5: representability over `ℤ[1/N]` (KM Ch. 3–4; Loeffler §§3.3–3.4, 3.8)

Tate normal form and the universal Tate curve `Spec ℤ[A, B][Δ⁻¹]`; `Y₁(N)` for `N ≥ 4`
representable, smooth and affine over `ℤ[1/N]` (the provenance's completed axiom-clean
headline, to migrate); `Y(N)` for `N ≥ 3` via rigidity (KM 2.7.2) and the closed full-level
locus through the KM 4.7.0 engine, with the `GL₂(ℤ/N)`-action; and the twisted curve
**`Y(ρ)`** (Buzzard, *Formalizing Fermat* Lecture 8) — `V_ρ` by Galois descent of the
constant group scheme, the symplectic-`Isom` moduli problem against the Weil pairing,
`yRho_representable` over `ℚ`, and the field-points description the FLT `3`–`5` switch
consumes. Specified in `README.md` §Layer 5. -/

/-! ## Layer 6: Drinfeld representability over `ℤ`, `Γ_H`, and coarse spaces (KM 3.6, Ch. 7–8)

Relative representability of the Drinfeld problems over `ℤ` (the exact-order locus as the
relative representing object), `[Γ_H]`-problems (KM 7.1.3), and coarse moduli by the
KM 8.1.1/8.1.5 quotient: the `j`-line `Y(1) = Spec ℤ[j]` and `Y₀(N) = Y(N)/Borel` —
coarse-only, since the Borel contains `−1` and rigidity fails (Loeffler 3.8.3) — with the
coarse universal property and KM 8.1.7's no-base-change caveat recorded. Specified in
`README.md` §Layer 6. -/

/-! ## Layer 7: the First Main Theorem — regularity (KM Ch. 5–6)

KM 5.1.1: `[Γ(N)]`, `[Γ₁(N)]`, `[bal. Γ₁(N)]`, `[Γ₀(N)]` are relatively representable,
finite flat over `Ell/ℤ`, **regular of dimension two**, and finite étale over `Ell/ℤ[1/N]`.
The regularity clause is gated on deformation-theoretic vocabulary (universal formal
deformations, Serre–Tate/Drinfeld homogeneity at supersingular points) that this roadmap
builds in order; `README.md` §Layer 7 stages the waves. -/

end TauCetiRoadmap.ModularCurves
