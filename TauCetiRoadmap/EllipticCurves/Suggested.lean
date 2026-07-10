import Mathlib

/-!
# Elliptic curves following Silverman: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap (the conventions, the layer-by-layer build plan Layers 0–5, the worked
examples, and the references) is in `README.md`. Mathlib has the Weierstrass model
(`WeierstrassCurve R`, `WeierstrassCurve.IsElliptic`, `WeierstrassCurve.j`, `VariableChange`,
`baseChange`), the group law on `WeierstrassCurve.Affine.Point`, the division polynomials and
elliptic divisibility sequences, reduction over a DVR, and the analytic `℘`-function of a
`PeriodPair` (`Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`). It has **no** isogenies,
**no** Weil pairing, **no** finiteness or count of `E(𝔽_q)` and hence **no** Hasse bound, **no**
uniformisation isomorphism `ℂ/Λ ≅ E(ℂ)` (the `℘`-function is not even linked to
`WeierstrassCurve`), **no** Tate curve, **no** twists, and **no** Tate's algorithm. We build these
in `TauCeti/AlgebraicGeometry/EllipticCurve/`, following Silverman (AEC/ATAEC).

`sorry` is allowed in this human-owned roadmap library — these are goals, not proofs. Following
the roadmap-writing guide, objects with a genuine type are pinned as `def … := sorry` (the Weil
pairing, the quadratic twist), and only statements are `theorem … := sorry`; nothing is a
`Prop`-typed placeholder. The Layer 0 objects (the isogeny type, the dual isogeny, the invariant
differential, the formal group) and the Layer 4 objects (the Kodaira type, the conductor exponent,
the Tate-curve isomorphism) are new *types* whose honest signatures need the very API those layers
introduce; they are specified in `README.md` and built there, not pinned here as `sorry`-typed
junk types.

## Provenance (migrate and clean from existing sorry-free work)

The Hasse bound is proved `sorry`-free and axiom-clean in the AINTLIB `HasseWeil` project
(`HasseWeil/HasseBound.lean`); the complex-uniformisation `℘`-side is in progress in
WilliamCoram/LeanBridge (branch `work`, the bijectivity of `φ` open); the quadratic twist,
`j_quadraticTwist`, `quadraticTwistPointEquiv`, and split-after-unramified-twist are FLT #1088;
the Tate curve is FLT #1069/#1085/#1099; and `E[N] ≅ (ℤ/N)²` has a scheme-theoretic proof in the
AINTLIB modular-curves development (`torsion_geometricFibre_rank_two`), restated here over
`WeierstrassCurve`. See `README.md` §Provenance for the file map. These are the source of proofs
to migrate, not the specification.
-/

namespace TauCetiRoadmap.EllipticCurves

open scoped Classical

/-! ## Layer 0: isogenies (AEC III.4)

The isogeny type, the dual isogeny, the invariant differential, and the formal group are new
objects specified in `README.md` §Layer 0. The one milestone statable against the existing point
group is the surjectivity of multiplication-by-`n`: over an algebraically closed field, `[n]` is a
surjective isogeny (AEC III.4.10), the counting input to `E[N] ≅ (ℤ/N)²`. -/

/-- **Multiplication-by-`n` is surjective on `E(\bar K)`** (AEC III.4.10): an isogeny of curves is
surjective on points over an algebraically closed field. Here `n • ·` is the `n`-fold sum in the
point group. The kernel is `E[n]`, whose structure is `torsion_addEquiv_prod` below. -/
theorem smul_surjective {K : Type*} [Field K] [IsAlgClosed K] (W : WeierstrassCurve K)
    [W.IsElliptic] (n : ℕ) [NeZero n] :
    Function.Surjective (fun P : W.toAffine.Point => n • P) :=
  sorry

/-! ## Layer 1: torsion and the Weil pairing (AEC III.6–8)

`E[N]` is the `ℤ`-module `N`-torsion of the point group, `Submodule.torsionBy ℤ (E.Point) N`. -/

/-- **`E[N] ≅ (ℤ/N)²`** (AEC III.6.4): over an algebraically closed field `K` in which `N` is
invertible (`(N : K) ≠ 0`, i.e. `char K ∤ N`), the `N`-torsion is free of rank `2` over `ℤ/N`.
This is the "N-torsion" milestone. -/
theorem torsion_addEquiv_prod {K : Type*} [Field K] [IsAlgClosed K] (W : WeierstrassCurve K)
    [W.IsElliptic] (N : ℕ) [NeZero N] (hN : (N : K) ≠ 0) :
    Nonempty (Submodule.torsionBy ℤ W.toAffine.Point (N : ℤ) ≃+ (ZMod N × ZMod N)) :=
  sorry

/-- **The Weil pairing** `e_N : E[N] × E[N] → μ_N` (AEC III.8.1), pinned here as a `K`-valued
pairing on the `N`-torsion whose values are `N`-th roots of unity (`weilPairing_pow_eq_one`). Its
defining properties — bilinear, alternating, nondegenerate, Galois-equivariant, and compatible
with isogenies via the dual — are specified in `README.md` §Layer 1; nondegeneracy is seeded as
`weilPairing_nondegenerate`. -/
noncomputable def weilPairing {K : Type*} [Field K] [IsAlgClosed K] (W : WeierstrassCurve K)
    [W.IsElliptic] (N : ℕ) :
    Submodule.torsionBy ℤ W.toAffine.Point (N : ℤ) →
      Submodule.torsionBy ℤ W.toAffine.Point (N : ℤ) → K :=
  sorry

/-- The **Weil pairing is `μ_N`-valued**: `e_N(P, Q)^N = 1` (AEC III.8.1(a)). -/
theorem weilPairing_pow_eq_one {K : Type*} [Field K] [IsAlgClosed K] (W : WeierstrassCurve K)
    [W.IsElliptic] (N : ℕ) [NeZero N]
    (P Q : Submodule.torsionBy ℤ W.toAffine.Point (N : ℤ)) :
    weilPairing W N P Q ^ N = 1 :=
  sorry

/-- The **Weil pairing is nondegenerate** (AEC III.8.1(d)): if `e_N(P, Q) = 1` for every `Q`, then
`P = 0`. With bilinearity and the `μ_N`-valuedness this makes `e_N` a perfect pairing. -/
theorem weilPairing_nondegenerate {K : Type*} [Field K] [IsAlgClosed K] (W : WeierstrassCurve K)
    [W.IsElliptic] (N : ℕ) [NeZero N] (hN : (N : K) ≠ 0)
    (P : Submodule.torsionBy ℤ W.toAffine.Point (N : ℤ)) :
    (∀ Q, weilPairing W N P Q = 1) → P = 0 :=
  sorry

/-! ## Layer 2: elliptic curves over finite fields — the Hasse bound (AEC V.1) -/

/-- **`E(𝔽_q)` is finite** — a prerequisite Mathlib lacks (needed even for the count to make
sense). -/
theorem finite_point {K : Type*} [Field K] [Finite K] (W : WeierstrassCurve K) [W.IsElliptic] :
    Finite W.toAffine.Point :=
  sorry

/-- **The Hasse bound** (AEC V.1.1) — the headline: `|#E(𝔽_q) − (q + 1)| ≤ 2√q`. Writing
`a_q = q + 1 − #E(𝔽_q)` for the trace of Frobenius, this is `a_q² ≤ 4q`, from
`deg(1 − φ_q) = #E(𝔽_q)`, positivity of the degree form, and Cauchy–Schwarz on it (AEC V.1.2). The
count `Nat.card W.toAffine.Point` includes the point at infinity, so it is `#E(𝔽_q)` projectively;
`Nat.card K = q`. -/
theorem hasse_bound {K : Type*} [Field K] [Finite K] (W : WeierstrassCurve K) [W.IsElliptic] :
    |(Nat.card W.toAffine.Point : ℝ) - (Nat.card K + 1)| ≤ 2 * Real.sqrt (Nat.card K) :=
  sorry

/-! ## Layer 3: elliptic curves over `ℂ` — complex uniformisation (AEC VI)

Mathlib's `℘` is a function of a `PeriodPair`; it is **not** linked to `WeierstrassCurve`, and the
uniformisation isomorphism is absent. `L.lattice : Submodule ℤ ℂ` is the period lattice, and
`ℂ ⧸ L.lattice` its quotient torus. -/

/-- **A lattice uniformises a curve** (AEC VI.3.6): the period lattice `Λ = L.lattice` gives an
elliptic curve `y² = 4x³ − g₂x − g₃` over `ℂ` and a group isomorphism `ℂ/Λ ≅ E(ℂ)` via
`z ↦ (℘(z), ℘'(z))`. Seeded as the existence of the curve and of the group isomorphism; the map is
`℘` (see `README.md`), built on Mathlib's `derivWeierstrassP_sq`. -/
theorem exists_isElliptic_addEquiv_quotient_lattice (L : PeriodPair) :
    ∃ (W : WeierstrassCurve ℂ) (_ : W.IsElliptic),
      Nonempty ((ℂ ⧸ L.lattice) ≃+ W.toAffine.Point) :=
  sorry

/-- **Uniformisation** (AEC VI.5.1): *every* elliptic curve over `ℂ` is a complex torus — for
`W : WeierstrassCurve ℂ` with `[W.IsElliptic]` there is a period pair `L` and a group isomorphism
`ℂ/L.lattice ≅ W(ℂ)`. The converse of `exists_isElliptic_addEquiv_quotient_lattice`, whose input is
the surjectivity of `j`. -/
theorem exists_periodPair_addEquiv (W : WeierstrassCurve ℂ) [W.IsElliptic] :
    ∃ L : PeriodPair, Nonempty ((ℂ ⧸ L.lattice) ≃+ W.toAffine.Point) :=
  sorry

/-! ## Layer 4: local fields, the Tate curve, and Tate's algorithm (AEC VII, ATAEC IV–V)

The Kodaira type (an enumerated type), the conductor exponent, the Néron component group, and the
Tate-curve isomorphism `\bar K^× / q^ℤ ≅ E_q(\bar K)` are new objects specified in `README.md`
§Layer 4 and built there on Mathlib's reduction theory; they are not pinned here as `sorry`-typed
types. -/

/-! ## Layer 5: twists (AEC X.2, X.5) -/

/-- **The quadratic twist** `E^d` of `E` by `d ∈ K` (AEC X.5), a new `WeierstrassCurve K` with the
same `j`-invariant (`j_quadraticTwist`) that becomes isomorphic to `E` over `K(√d)`
(`quadraticTwistPointEquiv`). Pinned as a `def` (a genuine curve-valued object); its `Δ`/`c₄`/`c₆`
effect, the involution `(E^d)^d ≅ E`, and ellipticity preservation are part of its basic theory
(`README.md` §Layer 5). -/
noncomputable def quadraticTwist {K : Type*} [Field K] (W : WeierstrassCurve K) (d : K) :
    WeierstrassCurve K :=
  sorry

/-- **`j` is a twist invariant**: `j(E^d) = j(E)` (AEC X.5.4). -/
theorem j_quadraticTwist {K : Type*} [Field K] (W : WeierstrassCurve K) (d : K) [W.IsElliptic]
    [(quadraticTwist W d).IsElliptic] :
    (quadraticTwist W d).j = W.j :=
  sorry

/-- **The twist point-isomorphism** (AEC X.5.2): over any extension `L/K` in which `d` becomes a
square (a witness `s` with `s² = d`), the quadratic twist `E^d` is group-isomorphic to `E`. Over
`K(√d)` the isomorphism is Galois-anti-equivariant, which is what distinguishes `E^d` from `E`
over `K`. -/
theorem quadraticTwistPointEquiv {K : Type*} [Field K] (W : WeierstrassCurve K) (d : K)
    {L : Type*} [Field L] [Algebra K L] (s : L) (hs : s ^ 2 = algebraMap K L d) :
    Nonempty (((quadraticTwist W d).baseChange L).toAffine.Point ≃+
      (W.baseChange L).toAffine.Point) :=
  sorry

end TauCetiRoadmap.EllipticCurves
