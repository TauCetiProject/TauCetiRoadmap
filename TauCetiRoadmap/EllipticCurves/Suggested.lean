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
`baseChange`), the group law on `WeierstrassCurve.Affine.Point` — proved through the coordinate
ring `Affine.CoordinateRing` and function field `Affine.FunctionField`, with the injective
class-group map `Point.toClass` — the division polynomials and elliptic divisibility sequences,
reduction over a DVR, and heights and the `L`-function definition. It has **no** theory of places
of the function field, **no** isogenies, **no** Weil pairing, **no** finiteness or count of
`E(𝔽_q)` and hence **no** Hasse bound, **no** Tate curve, **no** twists, **no** Tate's algorithm,
and neither the **Mordell–Weil** theorem nor **Selmer/Sha**. We build these in
`TauCeti/AlgebraicGeometry/EllipticCurve/`, on the function field of a Weierstrass curve and its
places (Layer 0), with an isogeny defined as a function-field embedding, backwards, its
pointedness `φ(O₁) = O₂` expressed as integrality over the coordinate rings (Layer 1) —
D. Angdinata's definition, in its integral-closure form, statable against today's Mathlib and
**seeded verbatim below** (`Isogeny`). No schemes anywhere, and AEC/ATAEC cited for the
mathematics, not as the specification.

`sorry` is allowed in this human-owned roadmap library — these are goals, not proofs. Following
the roadmap-writing guide, objects with a genuine type are pinned as `def … := sorry` (the Weil
pairing, the quadratic twist, the Frobenius isogeny), the `Isogeny` structure and its `degree`
are **defined outright** (their Mathlib vocabulary exists), and only statements are
`theorem … := sorry`; nothing is a `Prop`-typed placeholder. The layers whose central objects
are new *types* — the places of the
function field (Layer 0), the hom-group, the dual isogeny, the invariant differential and the
formal group (Layer 1), the Kodaira type and the Tate-curve isomorphism (Layer 4), and the
Selmer/Sha groups (Layer 7) — need the very API those layers introduce; they are specified in
`README.md` and built there, not pinned here as `sorry`-typed junk types.

## Provenance (migrate and clean from existing sorry-free work)

The isogeny layer coordinates with D. Angdinata's in-flight mathlib work (the isogeny and
Weil-pairing development the definition above comes from, and the division-polynomial
upstreaming); the AINTLIB modular-curves scheme development is, after the function-field pivot,
a strategy library and feasibility evidence rather than a port source (`README.md` §Provenance).
The Hasse bound is proved `sorry`-free in the AINTLIB `HasseWeil` project, as the capstone
`hasse_bound` of `HasseWeil/WeilPairing/HasseBound.lean` (the sibling `HasseWeil/HasseBound.lean`
is the conditional skeleton, not the capstone; revision pins and the axiom audit are in
`README.md` §Provenance). The twist layer (`quadraticTwistOf` and its invariants,
`quadraticTwist`, `quadraticTwistPointEquiv`, and `exists_quadraticTwist_hasSplitMultiplicativeReduction`)
exists in FLT as several thousand lines of AI-generated Lean; the plan is to bring it **into Tau
Ceti first** rather than to consume it from FLT, and the Layer 5 seeds use its names so the two line
up. `E[N] ≅ (ℤ/N)²` has a scheme-theoretic proof in the AINTLIB modular-curves development
(`torsion_geometricFibre_rank_two`), restated here over `WeierstrassCurve`. Mordell–Weil follows
Michael Stoll's AI-assisted formalisation (repository, revision, and licence pinned in `README.md`
§Provenance). These are sources of proofs to migrate, not the specification.
-/

namespace TauCetiRoadmap.EllipticCurves

open scoped Classical

/-! ## Layer 0: the function field, places, and divisors

The foundation. Mathlib already has the coordinate ring `Affine.CoordinateRing` (an integral
domain), the function field `Affine.FunctionField` (its fraction field), and the injective
class-group map `Point.toClass`. This layer builds the **places** of the function field — the
place at infinity `W.infinityPlace`, the place of an affine point, `inducedPlace` along a
`K`-algebra map, degrees — the point–place dictionary (`W.toAffine.Point` ↔ the degree-`1`
places), and the divisor calculus (`div f`, `deg (div f) = 0`), specified in `README.md`
§Layer 0; the types are new API and are built there, not pinned here. The milestone statable
against today's Mathlib is that `toClass` is onto the class group: -/

/-- **The point group is the ideal class group** (AEC III.3.4–5): for an elliptic `W`, Mathlib's
`Point.toClass` — injective upstream (`toClass_injective`) — is also **surjective**, so
`W.toAffine.Point ≃+ Additive (ClassGroup W.toAffine.CoordinateRing)`. This is the Layer-0
divisor anchor: the class group is the degree-`0` divisor class group of the function field in
disguise, so the principal-divisor characterisation (`Σ nᵢ Pᵢ` is principal iff `deg = 0` and
`Σ [nᵢ] Pᵢ = O`) rides on the group law Mathlib already proved, with no Riemann–Roch anywhere. -/
theorem toClass_surjective {K : Type*} [Field K] (W : WeierstrassCurve K) [W.IsElliptic] :
    Function.Surjective <| WeierstrassCurve.Affine.Point.toClass (W := W.toAffine) :=
  sorry

/-! ## Layer 1: isogenies, the dual, the invariant differential, and formal groups (AEC II.2, III.4–6, IV)

An isogeny `φ : W₁ → W₂` is an `F`-algebra map of function fields, backwards, with the
pointedness `φ(O₁) = O₂` expressed as integrality over the coordinate rings — no places in the
definition, so the structure is seeded verbatim below (D. Angdinata's definition, in its
integral-closure form), with its degree defined outright and its automatic finiteness,
positivity, and Frobenius seeded. Such a map is automatically injective and finite, so `deg φ`
is `Module.finrank`, separability is that of the field extension, and multiplicativity of
`deg` under composition is the tower formula — field theory Mathlib already has. The
hom-group (zero adjoined) and the quadraticity of the degree, the dual isogeny with
`φ̂ ∘ φ = [deg φ]`, `deg [n] = n²` via the division polynomials, and the invariant
differential `ω` in `Ω[W.FunctionField⁄K]` with `φ^* = KaehlerDifferential.map` are specified
in `README.md` §Layer 1 and built there. The milestone statable against the existing point
group is the surjectivity of multiplication-by-`n`: over a separably closed field, `[n]` is
surjective on points for `n` invertible in `K` (AEC III.4.10), the counting input to
`E[N] ≅ (ℤ/N)²`. -/

open WeierstrassCurve in
/-- **An isogeny of elliptic curves, as a function-field embedding backwards**
(AEC II.2.4-shape; D. Angdinata's definition, in its integral-closure form). `toFun` is the
contravariant map on function fields; `map_zero` makes `W₁.FunctionField` a
`W₂.CoordinateRing`-algebra through `toFun` and demands that `W₁.CoordinateRing` be integral
over it — functions with poles only at `O₂` pull back to functions with poles only at `O₁`,
which is exactly `φ(O₁) = O₂`, with no places API in the statement. An `Isogeny` is
automatically nonzero (`toFun` is a map of fields) and finite
(`Isogeny.finite_functionField`), so "isogeny" means *nonzero* isogeny by construction; the
hom-group adjoining zero is `README.md` §Layer 1. -/
structure Isogeny {F : Type*} [Field F] (W₁ W₂ : Affine F) where
  /-- The contravariant function-field map. -/
  toFun : W₂.FunctionField →ₐ[F] W₁.FunctionField
  /-- `φ(O₁) = O₂`: the coordinate ring of `W₁` is integral over that of `W₂`. -/
  map_zero :
    letI : Algebra W₂.CoordinateRing W₁.FunctionField :=
      (toFun.toRingHom.comp (algebraMap W₂.CoordinateRing W₂.FunctionField)).toAlgebra
    ∀ x : W₁.CoordinateRing,
      algebraMap W₁.CoordinateRing W₁.FunctionField x ∈
        integralClosure W₂.CoordinateRing W₁.FunctionField

namespace Isogeny

variable {F : Type*} [Field F] {W₁ W₂ : WeierstrassCurve.Affine F}

/-- **The degree of an isogeny** (AEC II.2.4(a)-shape): the rank
`[W₁.FunctionField : W₂.FunctionField]` of the function-field extension along `toFun`.
Multiplicativity under composition is the finrank tower formula; `deg [n] = n²` and
`deg π_q = q` are the Layer 1/3 milestones. -/
noncomputable def degree (φ : Isogeny W₁ W₂) : ℕ :=
  letI : Algebra W₂.FunctionField W₁.FunctionField := φ.toFun.toRingHom.toAlgebra
  Module.finrank W₂.FunctionField W₁.FunctionField

/-- **Automatic finiteness** (AEC II.2.4(a)): both function fields have transcendence degree
`1` over `F`, so `W₁.FunctionField` is a finite module over the image of `toFun` — with no
properness input. This is what makes `degree` honest (`finrank` of an infinite extension
reads `0`) and "nonconstant" free. -/
theorem finite_functionField (φ : Isogeny W₁ W₂) :
    letI : Algebra W₂.FunctionField W₁.FunctionField := φ.toFun.toRingHom.toAlgebra
    Module.Finite W₂.FunctionField W₁.FunctionField :=
  sorry

/-- The degree of an isogeny is positive — finiteness plus nontriviality of the field
extension. -/
theorem degree_pos (φ : Isogeny W₁ W₂) : 0 < φ.degree :=
  sorry

end Isogeny

/-- **The Frobenius isogeny** of a Weierstrass curve over a finite field (AEC II.2.11):
`toFun = (· ^ q)` with `q = #F` — an `F`-algebra map because `c ^ q = c` on `F` — whose
`map_zero` is the integrality of the coordinates over their `q`-th powers. Purely
inseparable; Layer 3's engine, inducing `(x, y) ↦ (x^q, y^q)` on points. -/
noncomputable def frobeniusIsogeny {F : Type*} [Field F] [Finite F]
    (W : WeierstrassCurve.Affine F) : Isogeny W W :=
  sorry

/-- **`deg π_q = q`** (AEC II.2.11(c)): the Frobenius isogeny has degree `#F` — the first
computed degree, and the input to `deg (1 − π_q) = #E(𝔽_q)` (Layer 3). -/
theorem degree_frobeniusIsogeny {F : Type*} [Field F] [Finite F]
    (W : WeierstrassCurve.Affine F) : (frobeniusIsogeny W).degree = Nat.card F :=
  sorry

/-- **Multiplication-by-`n` is surjective on `E(Kˢᵉᵖ)`** (AEC III.4.10) over a separably closed
field, for `n` **invertible in `K`** (`(n : K) ≠ 0`, i.e. `char K ∤ n` — which also forces
`n ≠ 0`). The invertibility is what makes `[n]` separable (`[n]^*ω = n·ω`, Layer 1), and only a
separable isogeny is surjective on `Kˢᵉᵖ`-points: over an imperfect separably closed field
(e.g. `𝔽_p(t)ˢᵉᵖ`) the fibres of an inseparable `[n]` live in a purely inseparable extension, so
the bare `n ≠ 0` claim is false as stated. (Over `[IsAlgClosed K]` every `n ≠ 0` works, but the
separably closed statement is the one the torsion count consumes.) Here `n • ·` is the `n`-fold
sum in the point group; the kernel is `E[n]`, whose structure is `torsion_linearEquiv_prod`
below. -/
theorem smul_surjective {K : Type*} [Field K] [IsSepClosed K] (W : WeierstrassCurve K)
    [W.IsElliptic] (n : ℕ) (hn : (n : K) ≠ 0) :
    Function.Surjective (fun P : W.toAffine.Point => n • P) :=
  sorry

/-! ## Layer 2: torsion, the Weil pairing, and the Tate module (AEC III.6–8)

`E[N]` is the `ℤ`-module `N`-torsion of the point group, `Submodule.torsionBy ℤ (E.Point) N`. -/

attribute [local instance] AddSubgroup.torsionBy.zmodModule in
/-- **`E[N] ≅ (ℤ/N)²`** (AEC III.6.4): over a separably closed field `K` in which `N` is invertible
(`(N : K) ≠ 0`, i.e. `char K ∤ N`), the `N`-torsion is a **free `ZMod N`-module of rank `2`** —
stated as a `ZMod N`-linear equivalence with `ZMod N × ZMod N`, since freeness-plus-rank-two is
the form the Tate module and the Galois representation (`README.md` §Layer 2) consume. The
carrier `AddSubgroup.torsionBy A (N : ℤ)` is Mathlib's `A[N]`, reducibly the
`Submodule.torsionBy ℤ A (N : ℤ)` used by `weilPairing` below; its `ZMod N`-module structure is
`AddSubgroup.torsionBy.zmodModule` (a plain `def` upstream, hence the local-instance attribute).
The statement is wrapped in `Nonempty` because the equivalence — a choice of basis — is
noncanonical; and it is no stronger than its `≃+` form, since an additive equivalence of
`ZMod N`-modules is automatically `ZMod N`-linear. This is the "N-torsion" milestone. -/
theorem torsion_linearEquiv_prod {K : Type*} [Field K] [IsSepClosed K] (W : WeierstrassCurve K)
    [W.IsElliptic] (N : ℕ) [NeZero N] (hN : (N : K) ≠ 0) :
    Nonempty (AddSubgroup.torsionBy W.toAffine.Point (N : ℤ) ≃ₗ[ZMod N] ZMod N × ZMod N) :=
  sorry

/-- **The Weil pairing** `e_N : E[N] × E[N] → μ_N` (AEC III.8.1), over **any** field — no closure
hypothesis. Pinned as an additive **bilinear** map (`→+ →+`, i.e. linear in both variables) into
`Additive (rootsOfUnity N K)`, so `ℤ`-bilinearity and the `μ_N`-valued codomain are part of the
type. It is alternating and, over a separably closed field with `N` invertible in `K`,
nondegenerate
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
the point at infinity); `Nat.card K = q`. ⚠ `finite_point` above is a **required companion**, not
a nicety: `Nat.card` of an infinite type is `0`, which would make this inequality false rather
than vacuous, so the bound is only the honest count together with `finite_point` — any proof
necessarily establishes it. -/
theorem hasse_bound {K : Type*} [Field K] [Finite K] (W : WeierstrassCurve K) [W.IsElliptic] :
    ((Nat.card W.toAffine.Point : ℤ) - ((Nat.card K : ℤ) + 1)) ^ 2 ≤ 4 * (Nat.card K : ℤ) :=
  sorry

/-! ## Layer 4: local fields — reduction, Tate's algorithm, the Tate curve (AEC VII, ATAEC IV–V)

The reduction filtration `0 → E₁(K) → E₀(K) → Ẽ_ns(k) → 0` on the points of a minimal equation,
the Kodaira type (an enumerated type, defined as the output of Tate's algorithm), the conductor
exponent, the local index `c_p`, and the Tate-curve isomorphism `Kˢᵉᵖ^× / qᶻ ≅ E_q(Kˢᵉᵖ)` are
new objects specified in `README.md` §Layer 4 and built there on Layers 0–1 and Mathlib's
reduction theory; they are not pinned here as `sorry`-typed types. Néron models are **out of
scope**: they are schemes, and belong to the future scheme-facing roadmap (`README.md`). -/

/-! ## Layer 5: twists (AEC X.2, X.5)

These are twists of the **pointed** curve `(E, O)`: elliptic curves over `K` that become
isomorphic to `E` over `Kˢᵉᵖ` as pointed curves, classified by `H¹(Gal(Kˢᵉᵖ/K), Aut (E, O))` —
over `Kˢᵉᵖ` every isomorphism of pointed Weierstrass curves is a change of variables, so
`Aut (E, O)` is the stabiliser of the base-changed curve in Mathlib's `VariableChange` group and
the descent is cocycle-level, with no schemes. A pointed twist keeps its rational point, hence has a Weierstrass model — this
is a different theory from the **genus-one torsors** (no rational point, classified by
`H¹(Gal, E(Kˢᵉᵖ))`), which belong to the Weil–Châtelet/Sha circle of `README.md` §Layer 7. For
`j ≠ 0, 1728`, `Aut (E, O) ≅ {±1}` and the twists are the quadratic twists: for `char K ≠ 2`
classified by `K^×/(K^×)²`, in characteristic `2` by the Artin–Schreier group `K/℘(K)`
(`README.md` §Layer 5). The seeds below are the concrete quadratic case: the exact shapes of the
`sorry`-free FLT quadratic-twist development (`ImperialCollegeLondon/FLT` #1088) — several
thousand lines of AI Lean, to be brought into Tau Ceti first — so porting it is a transcription
rather than a re-derivation, and the construction is characteristic-free. A quadratic twist is a
twist by a **quadratic** `x² − t x + n` (trace `t`, norm `n`), with discriminant `D = t² − 4n` —
equivalently, by a separable quadratic extension `L/K`, carried by the
`Algebra.IsQuadraticExtension K L` typeclass (in pinned Mathlib, and used directly by FLT). The
Galois character of the point isomorphism uses FLT's `quadraticCharacter`, so it is stated in
`README.md` §Layer 5 rather than seeded here. -/

/-- **The quadratic twist** `E_{t,n}` by the quadratic `x² − t x + n` (FLT `quadraticTwistOf`),
over any `CommRing`. Its discriminant is `D⁶ · Δ(E)` with `D = t² − 4n` (`Δ_quadraticTwistOf`), so
it is elliptic exactly when `D` is **invertible** — seeded below over a field, where that is
`D ≠ 0`, exactly as FLT states it — with the same `j`-invariant. This is the primitive the
whole layer (and FLT's split-reduction theorem) is built from. -/
noncomputable def quadraticTwistOf {A : Type*} [CommRing A] (E : WeierstrassCurve A) (t n : A) :
    WeierstrassCurve A :=
  sorry

/-- **The twist discriminant** `Δ(E_{t,n}) = (t² − 4n)⁶ · Δ(E)` (FLT `Δ_quadraticTwistOf`) — the
identity behind ellipticity and the reduction behaviour (`c₄_quadraticTwistOf`: `c₄ ↦ D²c₄`;
`c₆_quadraticTwistOf`: `c₆ ↦ D³c₆`). -/
theorem Δ_quadraticTwistOf {A : Type*} [CommRing A] (E : WeierstrassCurve A) (t n : A) :
    (quadraticTwistOf E t n).Δ = (t ^ 2 - 4 * n) ^ 6 * E.Δ :=
  sorry

/-- **The twist of an elliptic curve is elliptic** when `D = t² − 4n ≠ 0`, over a **field** —
exactly as FLT states it (`isElliptic_quadraticTwistOf`). Over a mere `CommRing` the conclusion
needs `IsUnit D`, not `D ≠ 0` (`Δ ↦ D⁶Δ`, and `D⁶ · unit` is a unit only when `D` is: take
`A = ℤ`, `D = 2`); nonzero-implies-unit is what the field supplies. The invariant identities
above stay ring-level. -/
theorem isElliptic_quadraticTwistOf {K : Type*} [Field K] (E : WeierstrassCurve K) (t n : K)
    [E.IsElliptic] (hD : t ^ 2 - 4 * n ≠ 0) :
    (quadraticTwistOf E t n).IsElliptic :=
  sorry

/-- **`j` is a twist invariant**: `j(E_{t,n}) = j(E)` (AEC X.5.4; FLT `j_quadraticTwistOf`), over
a field, the twist's ellipticity an explicit hypothesis — FLT's exact shape. -/
theorem j_quadraticTwistOf {K : Type*} [Field K] (E : WeierstrassCurve K) (t n : K)
    [E.IsElliptic] (h : (quadraticTwistOf E t n).IsElliptic) :
    (quadraticTwistOf E t n).j = E.j :=
  sorry

/-- **The canonical quadratic twist by a separable quadratic extension** `L/K` (FLT
`quadraticTwist`): twist by the trace and norm of a generator of `L/K`, a `WeierstrassCurve K`
independent of the generator. `Algebra.IsQuadraticExtension K L` (in pinned Mathlib) is the
quadratic-extension hypothesis, exactly as FLT states it. -/
noncomputable def quadraticTwist {K : Type*} [Field K] (E : WeierstrassCurve K) (L : Type*)
    [Field L] [Algebra K L] [Algebra.IsQuadraticExtension K L] [Algebra.IsSeparable K L] :
    WeierstrassCurve K :=
  sorry

/-- **`j` is preserved by the extension twist**: `j(Eᴸ) = j(E)` (FLT `j_quadraticTwist`). FLT
*derives* the twist's ellipticity as an instance (`instance : (E.quadraticTwist L).IsElliptic`),
so its statement carries no hypothesis; the instance binder here stands in for that until the
port brings the construction. -/
theorem j_quadraticTwist {K : Type*} [Field K] (E : WeierstrassCurve K) (L : Type*) [Field L]
    [Algebra K L] [Algebra.IsQuadraticExtension K L] [Algebra.IsSeparable K L] [E.IsElliptic]
    [(quadraticTwist E L).IsElliptic] :
    (quadraticTwist E L).j = E.j :=
  sorry

/-- **The twist point-isomorphism** `Eᴸ(M) ≅ E(M)` over any field `M ⊇ L` (FLT
`quadraticTwistPointEquiv`): after base change to `M` the twist becomes group-isomorphic to `E`.
The isomorphism is **Galois anti-equivariant** — for `σ ∈ Gal(M/K)` it intertwines the `σ`-action
with `χ(σ)·σ`, `χ` the quadratic character of `L/K` (FLT `quadraticTwistPointEquiv_galois`, the
datum that defines the twist by Galois descent); stated in `README.md` §Layer 5. -/
noncomputable def quadraticTwistPointEquiv {K : Type*} [Field K] (E : WeierstrassCurve K)
    [E.IsElliptic] (L : Type*) [Field L] [Algebra K L] [Algebra.IsQuadraticExtension K L]
    [Algebra.IsSeparable K L] (M : Type*) [Field M] [DecidableEq M] [Algebra K M] [Algebra L M]
    [IsScalarTower K L M] :
    ((quadraticTwist E L).baseChange M).toAffine.Point ≃+ (E.baseChange M).toAffine.Point :=
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
    ∃ (L : Type*) (_ : Field L) (_ : Algebra K L) (_ : Algebra.IsQuadraticExtension K L)
      (_ : Algebra.IsSeparable K L),
      ((quadraticTwist E L).minimal R).HasSplitMultiplicativeReduction R :=
  sorry

/-! ## Layer 6: the Mordell–Weil theorem (AEC VIII) -/

/-- **The Mordell–Weil theorem** (AEC VIII.6.7): over a number field `K`, the group of points
`E(K)` is finitely generated. `AddGroup.FG` is finite generation as an abelian group; its free rank
is the **rank** of `E/K` and its torsion subgroup is finite (Nagell–Lutz, `README.md` §Layer 6).
The proof is weak Mordell–Weil — `E(K)/2E(K)` finite by the Kummer (`x − θ`) argument, whose
finiteness input is the `S`-class group and `S`-unit theorems of number fields, **not** Layer 7's
elliptic-curve Selmer group — plus the theory of heights, by descent (`README.md` §Layer 6; this
is also how the existing formalisation proves it, there under a short-normal-form hypothesis that
the port removes by variable change). Statement-named per Mathlib convention — the name describes
the conclusion, matching the existing formalisation's `fg_point_of_numberField`, and
"Mordell–Weil" lives here in the docstring. -/
theorem fg_point_of_numberField {K : Type*} [Field K] [NumberField K] (W : WeierstrassCurve K)
    [W.IsElliptic] : AddGroup.FG W.toAffine.Point :=
  sorry

/-! ## Layer 7: Selmer groups and Sha (AEC X.4)

The `m`-descent sequence `0 → E(K)/mE(K) → Selₘ(E/K) → Ш(E/K)[m] → 0`, the finiteness of the
`m`-Selmer group `Selₘ(E/K)` (the **effective refinement** of Layer 6's weak Mordell–Weil — a
computable bound on the rank, not its prerequisite), and the Shafarevich–Tate group `Ш(E/K)` are
specified in `README.md` §Layer 7. Pinned Mathlib already has the cohomological substrate
(continuous cohomology of topological groups, `groupCohomology` with its low-degree API and long
exact sequence, nonabelian `H¹`); what gates this layer is the **Galois-specific packaging** on
top — profinite Galois modules with the finite-level comparison, the Kummer connecting map for
`[m]`, inflation–restriction there, and the local conditions at the places of `K` — listed
precisely in `README.md` §Layer 7. Nothing is pinned here; the layer states its objects against
that API once it exists. -/

end TauCetiRoadmap.EllipticCurves
