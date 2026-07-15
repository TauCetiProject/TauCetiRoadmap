import Mathlib

/-!
# Elliptic curves: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap (the conventions, the layer-by-layer build plan Layers 0–7, the worked
examples, and the references) is in `README.md`. Mathlib has the Weierstrass model
(`WeierstrassCurve R`, `WeierstrassCurve.IsElliptic`, `WeierstrassCurve.j`, `VariableChange`,
`baseChange`), the group law on `WeierstrassCurve.Affine.Point`, the division polynomials and
elliptic divisibility sequences, reduction over a DVR, heights and the `L`-function definition, and
the scheme-theoretic substrate (`AlgebraicGeometry`, `Proj`). It has **no** scheme attached to a
`WeierstrassCurve`, **no** isogenies, **no** Weil pairing, **no** finiteness or count of `E(𝔽_q)`
and hence **no** Hasse bound, **no** Néron models, **no** Tate curve, **no** twists, **no** Tate's
algorithm, and neither the **Mordell–Weil** theorem nor **Selmer/Sha**. We build these in
`TauCeti/AlgebraicGeometry/EllipticCurve/`, on the scheme of a Weierstrass curve (Layer 0, ported
from the modular curves project), with AEC/ATAEC cited for the mathematics, not as the specification.

`sorry` is allowed in this human-owned roadmap library — these are goals, not proofs. Following
the roadmap-writing guide, objects with a genuine type are pinned as `def … := sorry` (the Weil
pairing, the quadratic twist), and only statements are `theorem … := sorry`; nothing is a
`Prop`-typed placeholder. The layers whose central objects are new *types* — the scheme of a
Weierstrass curve (Layer 0), the isogeny type, the dual isogeny, the invariant differential and the
formal group (Layer 1), the Néron model, the Kodaira type and the Tate-curve isomorphism (Layer 4),
and the Selmer/Sha groups (Layer 7) — need the very API those layers introduce; they are specified
in `README.md` and built there, not pinned here as `sorry`-typed junk types.

## Provenance (migrate and clean from existing sorry-free work)

The scheme of a Weierstrass curve is ported from the AINTLIB modular curves project (`projModel`,
`projModel_points`, the `EllipticCurve S` group scheme; its moduli superstructure is out of scope).
The Hasse bound is proved `sorry`-free and axiom-clean in the AINTLIB `HasseWeil` project
(`HasseWeil/HasseBound.lean`). The twist layer (`quadraticTwistOf` and its invariants,
`quadraticTwist`, `quadraticTwistPointEquiv`, and `exists_quadraticTwist_hasSplitMultiplicativeReduction`)
exists in FLT as several thousand lines of AI-generated Lean; the plan is to bring it **into Tau
Ceti first** rather than to consume it from FLT, and the Layer 5 seeds use its names so the two line
up. `E[N] ≅ (ℤ/N)²` has a scheme-theoretic proof in the AINTLIB modular-curves development
(`torsion_geometricFibre_rank_two`), restated here over `WeierstrassCurve`. Mordell–Weil follows
Michael Stoll's AI-assisted formalisation. These are sources of proofs to migrate, not the
specification.
-/

namespace TauCetiRoadmap.EllipticCurves

open scoped Classical

/-! ## Layer 0: the elliptic curve as a scheme

The foundation, ported from the modular curves project's elliptic-curve-as-group-scheme
development: the scheme `projModel W` (`Proj` of the Weierstrass cubic), smooth and proper of genus
`1` with its section, the bridge `projModel_points` identifying its `K`-points with
`W.toAffine.Point`, and the group-scheme structure against which isogenies (Layer 1), the Néron
model (Layer 4), and general twists (Layer 5) are defined. These are new constructions needing the
`AlgebraicGeometry` API and the ported machinery, not pinned here as `sorry`-typed types; they are
specified in `README.md` §Layer 0. (Its moduli / `Y(N)` superstructure is out of scope.) -/

/-! ## Layer 1: isogenies, the invariant differential, and formal groups (AEC III.4–5, IV)

An isogeny is a finite surjective morphism of the group schemes (Layer 0) fixing `O` — the same
notion as an isogeny of abelian varieties, so no bespoke equation-level definition to reconcile
later. The dual isogeny, the invariant differential, and the formal group are specified in
`README.md` §Layer 1. The one milestone statable against the existing point group is the
surjectivity of multiplication-by-`n`: over a separably closed field, `[n]` is surjective on points
(AEC III.4.10), the counting input to `E[N] ≅ (ℤ/N)²`. -/

/-- **Multiplication-by-`n` is surjective on `E(Kˢᵉᵖ)`** (AEC III.4.10) over a separably closed
field. Here `n • ·` is the `n`-fold sum in the point group; the kernel is `E[n]`, whose structure
is `torsion_addEquiv_prod` below. -/
theorem smul_surjective {K : Type*} [Field K] [IsSepClosed K] (W : WeierstrassCurve K)
    [W.IsElliptic] (n : ℕ) [NeZero n] :
    Function.Surjective (fun P : W.toAffine.Point => n • P) :=
  sorry

/-! ## Layer 2: torsion, the Weil pairing, and the Tate module (AEC III.6–8)

`E[N]` is the `ℤ`-module `N`-torsion of the point group, `Submodule.torsionBy ℤ (E.Point) N`. -/

/-- **`E[N] ≅ (ℤ/N)²`** (AEC III.6.4): over a separably closed field `K` in which `N` is invertible
(`(N : K) ≠ 0`, i.e. `char K ∤ N`), the `N`-torsion is free of rank `2` over `ℤ/N`. This is the
"N-torsion" milestone. -/
theorem torsion_addEquiv_prod {K : Type*} [Field K] [IsSepClosed K] (W : WeierstrassCurve K)
    [W.IsElliptic] (N : ℕ) [NeZero N] (hN : (N : K) ≠ 0) :
    Nonempty (Submodule.torsionBy ℤ W.toAffine.Point (N : ℤ) ≃+ (ZMod N × ZMod N)) :=
  sorry

/-- **The Weil pairing** `e_N : E[N] × E[N] → μ_N` (AEC III.8.1), over **any** field — no closure
hypothesis. Pinned as an additive **bilinear** map (`→+ →+`, i.e. linear in both variables) into
`Additive (rootsOfUnity N K)`, so `ℤ`-bilinearity and the `μ_N`-valued codomain are part of the
type. It is alternating and, over a separably closed field, nondegenerate
(`weilPairing_nondegenerate`); the load-bearing API is **functoriality under change of field**
(`README.md` §Layer 2). -/
noncomputable def weilPairing {K : Type*} [Field K] (W : WeierstrassCurve K) [W.IsElliptic]
    (N : ℕ) [NeZero N] :
    Submodule.torsionBy ℤ W.toAffine.Point (N : ℤ) →+
      Submodule.torsionBy ℤ W.toAffine.Point (N : ℤ) →+ Additive (rootsOfUnity N K) :=
  sorry

/-- The **Weil pairing is nondegenerate** over a separably closed field (AEC III.8.1(d)): if
`e_N(P, Q) = 0` for every `Q`, then `P = 0`. Bilinearity and the `μ_N`-valued codomain are already
in the type of `weilPairing`, so together this makes `e_N` a perfect pairing. (`[NeZero N]` is kept
only because the `weilPairing` definition needs it as an instance; `hN` supplies the invertibility
nondegeneracy actually requires.) -/
theorem weilPairing_nondegenerate {K : Type*} [Field K] [IsSepClosed K] (W : WeierstrassCurve K)
    [W.IsElliptic] (N : ℕ) [NeZero N] (hN : (N : K) ≠ 0)
    (P : Submodule.torsionBy ℤ W.toAffine.Point (N : ℤ)) :
    (∀ Q, weilPairing W N P Q = 0) → P = 0 :=
  sorry

/-! ## Layer 3: elliptic curves over finite fields — the Hasse bound (AEC V.1) -/

/-- **`E(𝔽_q)` is finite** — a prerequisite Mathlib lacks (needed even for the count to make
sense). -/
theorem finite_point {K : Type*} [Field K] [Finite K] (W : WeierstrassCurve K) [W.IsElliptic] :
    Finite W.toAffine.Point :=
  sorry

/-- **The Hasse bound** (AEC V.1.1) — the headline. With `a_q := q + 1 − #E(𝔽_q)` the trace of
Frobenius, the natural formalisation goal is the integer inequality `a_q² ≤ 4q` (the real form
`|#E − (q+1)| ≤ 2√q` follows), from `deg(1 − φ_q) = #E(𝔽_q)`, positivity of the degree form, and
Cauchy–Schwarz on it (AEC V.1.2). `Nat.card W.toAffine.Point` counts the projective points (with
the point at infinity); `Nat.card K = q`. -/
theorem hasse_bound {K : Type*} [Field K] [Finite K] (W : WeierstrassCurve K) [W.IsElliptic] :
    ((Nat.card W.toAffine.Point : ℤ) - ((Nat.card K : ℤ) + 1)) ^ 2 ≤ 4 * (Nat.card K : ℤ) :=
  sorry

/-! ## Layer 4: local fields — reduction, Néron models, the Tate curve, Tate's algorithm (AEC VII, ATAEC IV–V)

The Néron model (now a genuine scheme, well-defined because of Layer 0), the Kodaira type (an
enumerated type), the conductor exponent, the component group, and the Tate-curve isomorphism
`\bar K^× / q^ℤ ≅ E_q(\bar K)` are new objects specified in `README.md` §Layer 4 and built there on
Layer 0 and Mathlib's reduction theory; they are not pinned here as `sorry`-typed types. -/

/-! ## Layer 5: twists (AEC X.2–5)

A general twist is a torsor — a smooth projective curve `K`-isomorphic to `E` only over `Kˢᵉᵖ`,
which need not have a rational point — so the honest theory needs the scheme (Layer 0); the
classification is `H¹(Gal, Aut E)`, reducing to `K^×/(K^×)²` for `j ≠ 0, 1728` (`README.md` §Layer
5). The seeds below are the concrete quadratic case: the exact shapes of the `sorry`-free FLT
quadratic-twist development (`ImperialCollegeLondon/FLT` #1088) — several thousand lines of AI Lean,
to be brought into Tau Ceti first — so porting it is a transcription rather than a re-derivation. A
quadratic twist is a twist by a **quadratic** `x² − t x + n` (trace `t`, norm `n`), with
discriminant `D = t² − 4n` — equivalently, by a separable quadratic extension `L/K`.
`Algebra.IsQuadraticExtension` is not yet in Mathlib (FLT is upstreaming it), so the extension form
uses the proxy `Module.finrank K L = 2`; the Galois character of the point isomorphism uses FLT's
`quadraticCharacter`, so it is stated in `README.md` §Layer 5 rather than seeded here. -/

/-- **The quadratic twist** `E_{t,n}` by the quadratic `x² − t x + n` (FLT `quadraticTwistOf`),
over any `CommRing`. Its discriminant is `D⁶ · Δ(E)` with `D = t² − 4n` (`Δ_quadraticTwistOf`), so
it is elliptic exactly when `D` is a unit, with the same `j`-invariant. This is the primitive the
whole layer (and FLT's split-reduction theorem) is built from. -/
noncomputable def quadraticTwistOf {A : Type*} [CommRing A] (E : WeierstrassCurve A) (t n : A) :
    WeierstrassCurve A :=
  sorry

/-- **The twist discriminant** `Δ(E_{t,n}) = (t² − 4n)⁶ · Δ(E)` (FLT `Δ_quadraticTwistOf`) — the
identity behind ellipticity and the reduction behaviour (`c₄ ↦ D²c₄`, `c₆ ↦ D³c₆` likewise). -/
theorem Δ_quadraticTwistOf {A : Type*} [CommRing A] (E : WeierstrassCurve A) (t n : A) :
    (quadraticTwistOf E t n).Δ = (t ^ 2 - 4 * n) ^ 6 * E.Δ :=
  sorry

/-- **The twist of an elliptic curve is elliptic** when `D = t² − 4n ≠ 0` (FLT
`isElliptic_quadraticTwistOf`). -/
theorem isElliptic_quadraticTwistOf {A : Type*} [CommRing A] (E : WeierstrassCurve A) (t n : A)
    [E.IsElliptic] (hD : t ^ 2 - 4 * n ≠ 0) :
    (quadraticTwistOf E t n).IsElliptic :=
  sorry

/-- **`j` is a twist invariant**: `j(E_{t,n}) = j(E)` (AEC X.5.4; FLT `j_quadraticTwistOf`). -/
theorem j_quadraticTwistOf {A : Type*} [CommRing A] (E : WeierstrassCurve A) (t n : A)
    [E.IsElliptic] [(quadraticTwistOf E t n).IsElliptic] :
    (quadraticTwistOf E t n).j = E.j :=
  sorry

/-- **The canonical quadratic twist by a separable quadratic extension** `L/K` (FLT
`quadraticTwist`): twist by the trace and norm of a generator of `L/K`, a `WeierstrassCurve K`
independent of the generator. `Module.finrank K L = 2` is the Mathlib proxy for
`Algebra.IsQuadraticExtension K L`. -/
noncomputable def quadraticTwist {K : Type*} [Field K] (E : WeierstrassCurve K) (L : Type*)
    [Field L] [Algebra K L] [Algebra.IsSeparable K L] (hL : Module.finrank K L = 2) :
    WeierstrassCurve K :=
  sorry

/-- **`j` is preserved by the extension twist**: `j(Eᴸ) = j(E)` (FLT `j_quadraticTwist`). -/
theorem j_quadraticTwist {K : Type*} [Field K] (E : WeierstrassCurve K) (L : Type*) [Field L]
    [Algebra K L] [Algebra.IsSeparable K L] (hL : Module.finrank K L = 2) [E.IsElliptic]
    [(quadraticTwist E L hL).IsElliptic] :
    (quadraticTwist E L hL).j = E.j :=
  sorry

/-- **The twist point-isomorphism** `Eᴸ(M) ≅ E(M)` over any field `M ⊇ L` (FLT
`quadraticTwistPointEquiv`): after base change to `M` the twist becomes group-isomorphic to `E`.
The isomorphism is **Galois anti-equivariant** — for `σ ∈ Gal(M/K)` it intertwines the `σ`-action
with `χ(σ)·σ`, `χ` the quadratic character of `L/K` (FLT `quadraticTwistPointEquiv_galois`, the
datum that defines the twist by Galois descent); stated in `README.md` §Layer 5. -/
noncomputable def quadraticTwistPointEquiv {K : Type*} [Field K] (E : WeierstrassCurve K)
    [E.IsElliptic] (L : Type*) [Field L] [Algebra K L] [Algebra.IsSeparable K L]
    (hL : Module.finrank K L = 2) (M : Type*) [Field M] [Algebra K M] [Algebra L M]
    [IsScalarTower K L M] :
    ((quadraticTwist E L hL).baseChange M).toAffine.Point ≃+ (E.baseChange M).toAffine.Point :=
  sorry

/-- **Quadratic twist to split multiplicative reduction** — FLT #1088's headline
(`exists_quadraticTwist_hasSplitMultiplicativeReduction`): over the fraction field `K` of a
discrete valuation ring `R`, a curve with multiplicative but **non-split** reduction acquires
**split** multiplicative reduction after a separable quadratic twist. Consumes Mathlib's reduction
classes (`WeierstrassCurve.HasMultiplicativeReduction`, `HasSplitMultiplicativeReduction`,
`WeierstrassCurve.minimal`) refined in Layer 4; the concrete FLT-facing deliverable. -/
theorem exists_quadraticTwist_hasSplitMultiplicativeReduction {R : Type*} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] {K : Type*} [Field K] [Algebra R K] [IsFractionRing R K]
    (E : WeierstrassCurve K) [E.IsElliptic] [E.HasMultiplicativeReduction R]
    (h : ¬ E.HasSplitMultiplicativeReduction R) :
    ∃ (L : Type*) (_ : Field L) (_ : Algebra K L) (_ : Algebra.IsSeparable K L)
      (hL : Module.finrank K L = 2),
      ((quadraticTwist E L hL).minimal R).HasSplitMultiplicativeReduction R :=
  sorry

/-! ## Layer 6: the Mordell–Weil theorem (AEC VIII) -/

/-- **The Mordell–Weil theorem** (AEC VIII.6.7): over a number field `K`, the group of points
`E(K)` is finitely generated. `AddGroup.FG` is finite generation as an abelian group; its free rank
is the **rank** of `E/K` and its torsion subgroup is finite (Nagell–Lutz, `README.md` §Layer 6). The
proof is weak Mordell–Weil (finiteness of `E(K)/mE(K)`, from the finiteness of the `m`-Selmer group
of Layer 7) plus the theory of heights, by descent. -/
theorem mordellWeil {K : Type*} [Field K] [NumberField K] (W : WeierstrassCurve K) [W.IsElliptic] :
    AddGroup.FG W.toAffine.Point :=
  sorry

/-! ## Layer 7: Selmer groups and Sha (AEC X.4)

The `m`-descent sequence `0 → E(K)/mE(K) → Selₘ(E/K) → Ш(E/K)[m] → 0`, the finiteness of the
`m`-Selmer group `Selₘ(E/K)` (which is what makes weak Mordell–Weil effective), and the
Shafarevich–Tate group `Ш(E/K)` are specified in `README.md` §Layer 7. Their clean formulation
rests on **continuous Galois cohomology**, still settling in Mathlib, so they are not pinned here;
the layer refactors onto that API once it lands. -/

end TauCetiRoadmap.EllipticCurves
