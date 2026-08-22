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
places (Layer 0), with an isogeny defined by a coordinate-ring pullback, backwards, its
pointedness `φ(O₁) = O₂` expressed as integrality over the coordinate rings (Layer 1) — the
coordinate-ring form of D. Angdinata's definition, statable against today's Mathlib and
**stated verbatim in `Suggested.lean` below** (`Isogeny`). No schemes anywhere, and AEC/ATAEC cited for the
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
upstreaming); the AINTLIB modular-curves scheme development is
a strategy library and feasibility evidence rather than a port source (`README.md` §Provenance).
The Hasse bound is proved `sorry`-free in the AINTLIB `HasseWeil` project, as the capstone
`hasse_bound` of `HasseWeil/WeilPairing/HasseBound.lean` (the sibling `HasseWeil/HasseBound.lean`
is the conditional skeleton, not the capstone; revision pins and the axiom audit are in
`README.md` §Provenance). The twist layer (`quadraticTwistOf` and its invariants,
`quadraticTwist`, `quadraticTwistPointEquiv`, and `exists_quadraticTwist_hasSplitMultiplicativeReduction`)
exists in FLT as several thousand lines of AI-generated Lean; the plan is to bring it **into Tau
Ceti first** rather than to consume it from FLT, and the Layer 5 statements use its names so the two line
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
`Σ [nᵢ] Pᵢ = O`) rides on the group law Mathlib already proved, with no Riemann–Roch anywhere.
⚠ *Mathlib-track*: proven in the shared upstream `CoordinateRing` split-out
(`Point.toClass_surjective`/`toClassEquiv`) — and there with **no** `IsElliptic` hypothesis,
so this is the weaker statement; dedupe on landing. -/
theorem toClass_surjective {K : Type*} [Field K] (W : WeierstrassCurve K) [W.IsElliptic] :
    Function.Surjective <| WeierstrassCurve.Affine.Point.toClass (W := W.toAffine) :=
  sorry

/-! ## Layer 1: isogenies, the dual, the invariant differential, and formal groups (AEC II.2, III.4–6, IV)

An isogeny `φ : W₁ → W₂` is an `F`-algebra map out of the target's affine coordinate ring
into the source's function field, backwards, with the pointedness `φ(O₁) = O₂` expressed as
integrality over the coordinate rings — no places in the definition, so the structure is
stated verbatim in `Suggested.lean` below (the coordinate-ring form of D. Angdinata's definition), with its
injectivity, fraction-field extension, degree, finiteness, positivity, point map, normality
input, and Frobenius. ⚠ *Mathlib-track*: the material of this section is proven
in the shared upstream development (`README.md` §Provenance) — in its function-field form,
which the extension `fieldPullback` identifies with this one — and is deduplicated when its
PRs land.
A conditioned map is injective (`pullback_injective`, the pole argument) with automatically
finite fraction-field extension, so `deg φ` is `Module.finrank`,
separability is that of the field extension, and multiplicativity of `deg` under composition
is the tower formula — field theory Mathlib already has; the induced point map goes through
the intermediate ring (the integral closure of `W₂.CoordinateRing` in `W₁.FunctionField`)
by ideal extension and relative norm, making it additive by construction. The hom-group
(carrier: `README.md` §Layer 1 — the zero map or a conditioned coordinate-ring
pullback, no `WithZero`; the zero is a formal tag, not a pullback, and the additive
structure is the group law's, not pointwise) and the quadraticity of the degree, the
`CMStructure`/`HasCM` on `End`, the dual isogeny with
`φ̂ ∘ φ = [deg φ]`, `deg [n] = n²` via the division polynomials, the invariant differential
`ω` in `Ω[W.FunctionField⁄K]` with `φ^* = KaehlerDifferential.map`, and the
separable-⟹-unramified milestone (`e_w = 1` at every place, which turns Layer 0's
`Σ e · f = deg` into the fibre count) are specified in `README.md` §Layer 1 and built there.
The milestone statable against the existing point
group is the surjectivity of multiplication-by-`n`: over a separably closed field, `[n]` is
surjective on points for `n` invertible in `K` (AEC III.4.10), the counting input to
`E[N] ≅ (ℤ/N)²`. -/

section Isogeny

open WeierstrassCurve.Affine

variable {F : Type*} [Field F]

/-- A contravariant pullback out of the target's affine coordinate ring into the source's
function field (⚠ *mathlib-track* throughout this section: the
shared upstream development proves these declarations in their function-field form, which
`Isogeny.fieldPullback` below identifies with this one; deduplicated when its PRs land). -/
abbrev CoordinatePullback (W₁ W₂ : WeierstrassCurve.Affine F) :=
  W₂.CoordinateRing →ₐ[F] W₁.FunctionField

/-- **The source point at infinity maps to the target point at infinity**: every affine
function of `W₁` is integral over the pulled-back coordinate ring of `W₂`. The integral
closure is the ring of functions regular away from the whole fibre over `O₂` — kernel points
included — and `W₁.CoordinateRing` consists of functions regular away from `O₁` (the full
ring of those is its normalization, equal to it exactly when the coordinate ring is
integrally closed), so the condition says exactly that `O₁` lies in that fibre.
No ellipticity or normality hypothesis is needed for that equivalence: the point at infinity
of *every* Weierstrass cubic is smooth in every characteristic
(`WeierstrassCurve.Projective.nonsingular_zero`) with `ord_O x = −2`.

⚠ The `Algebra W₂.CoordinateRing W₁.FunctionField` structure here is **`letI`-local only —
never a global `instance`.** `integralClosure` forces an `Algebra` structure into existence
(Mathlib has no `RingHom.IsIntegral`-relative API for it), but the structure depends on the
pullback: for `W₁ = W₂` every endomorphism induces its own, so a global registration would be a
genuine diamond. Confined to `letI` inside definition bodies, each declaration fixes its own
pullback and nothing leaks.

⚠ The cost is one rewrite, not zero: even at the identity pullback the local structure
is **not** definitionally the ambient one. The instance in play there is the localization
instance on `Algebra W.CoordinateRing W.FunctionField`, and elaborating `MapsInfinity` against
it fails with *"synthesized type class instance is not definitionally equal ... synthesized
`OreLocalization.instAlgebra`, inferred `(identityPullback W).toAlgebra`"* — the two are
propositionally but not definitionally equal (Mathlib's `toAlgebra_algebraMap` is the
general statement, itself proved by `algebra_ext`, not `rfl`). Proofs bridge the gap with a
single `Algebra.algebra_ext` rewrite, as `mapsInfinity_id` below does; the scalar actions
themselves do agree by `rfl`, and what does not line up is the dependent `Subalgebra` type
`integralClosure` lands in. This is an ergonomics cost, not evidence against the definition:
public statements stay phrased over the pullback ring map, never over an instance. -/
def CoordinatePullback.MapsInfinity {W₁ W₂ : WeierstrassCurve.Affine F}
    (pullback : CoordinatePullback W₁ W₂) : Prop :=
  letI := pullback.toRingHom.toAlgebra
  ∀ x : W₁.CoordinateRing,
    algebraMap W₁.CoordinateRing W₁.FunctionField x ∈
      integralClosure W₂.CoordinateRing W₁.FunctionField

/-- **The identity pullback**: the coordinate ring of `W` sitting inside its own function
field. -/
noncomputable def CoordinatePullback.id (W : WeierstrassCurve.Affine F) :
    CoordinatePullback W W :=
  IsScalarTower.toAlgHom F W.CoordinateRing W.FunctionField

/-- **The identity satisfies `MapsInfinity`** — proved, not asserted, because the proof
*is* the content of the `letI` note above: the ambient localization instance and
`(CoordinatePullback.id W).toRingHom.toAlgebra` are propositionally but not definitionally equal,
so one `Algebra.algebra_ext` rewrite is needed before `isIntegral_algebraMap` applies. -/
theorem CoordinatePullback.mapsInfinity_id (W : WeierstrassCurve.Affine F) :
    CoordinatePullback.MapsInfinity (CoordinatePullback.id W) := by
  unfold CoordinatePullback.MapsInfinity
  have h : (CoordinatePullback.id W).toRingHom.toAlgebra =
      (inferInstance : Algebra W.CoordinateRing W.FunctionField) := by
    apply Algebra.algebra_ext; intro x; rfl
  rw [h]
  exact fun _ ↦ isIntegral_algebraMap

/-- **The pullback data of an isogeny** (AEC II.2.4-shape, on D. Angdinata's definition). An `Isogeny` is automatically nonzero (`pullback_injective`, the
pole argument) and finite (`Isogeny.finiteDimensional`), so "isogeny" means *nonzero*
isogeny by construction; the hom carrier — the zero map or a conditioned pullback, no
`WithZero`, the zero a formal tag rather than a pullback — is `README.md` §Layer 1. -/
structure Isogeny (W₁ W₂ : WeierstrassCurve.Affine F) where
  /-- The contravariant map out of the target's affine coordinate ring. -/
  pullback : CoordinatePullback W₁ W₂
  /-- `φ(O₁) = O₂`, as integrality over the coordinate rings. -/
  mapsInfinity : pullback.MapsInfinity

namespace Isogeny

variable {W₁ W₂ : WeierstrassCurve.Affine F}

/-- **A conditioned pullback is injective** — hence an `Isogeny` is nonzero by construction:
the kernel is a prime of the one-dimensional domain `W₂.CoordinateRing`, and a maximal
kernel would make the image a finite extension of `F` (Zariski's lemma), forcing `x` —
which has a pole at `O₁` — to be integral over the constants, against `mapsInfinity`. No
smoothness, perfectness, or infinitude of `F` is used. -/
theorem pullback_injective (φ : Isogeny W₁ W₂) : Function.Injective φ.pullback :=
  sorry

/-- **The unique fraction-field extension of the pullback**: the function-field embedding
form of the isogeny — the shared upstream development's shape, through which its theorems
transfer to the coordinate-ring domain. Restriction and extension are inverse constructions,
and `MapsInfinity` is literally the same condition on both sides (same image subring). -/
noncomputable def fieldPullback (φ : Isogeny W₁ W₂) :
    W₂.FunctionField →ₐ[F] W₁.FunctionField :=
  IsFractionRing.liftAlgHom φ.pullback_injective

/-- Pure inseparability of an isogeny, read from its induced function-field extension. -/
def IsPurelyInseparable (φ : Isogeny W₁ W₂) : Prop :=
  _root_.IsPurelyInseparable φ.fieldPullback.fieldRange W₁.FunctionField

/-- Scalar extension of an isogeny. Layer 0.5 proves compatibility with pullbacks, composition,
duals, Frobenius twists and relative Frobenius. -/
noncomputable def baseChange (φ : Isogeny W₁ W₂)
    (L : Type*) [Field L] [Algebra F L] :
    Isogeny (W₁.baseChange L) (W₂.baseChange L) :=
  sorry

/-- Pure inseparability of an isogeny is preserved and reflected by arbitrary scalar extension;
no algebraicity hypothesis on `L/F` is required. -/
theorem isPurelyInseparable_baseChange_iff (φ : Isogeny W₁ W₂)
    (L : Type*) [Field L] [Algebra F L] :
    (φ.baseChange L).IsPurelyInseparable ↔ φ.IsPurelyInseparable :=
  sorry

/-- **The identity isogeny**, on `CoordinatePullback.mapsInfinity_id`. -/
noncomputable def id (W : WeierstrassCurve.Affine F) : Isogeny W W where
  pullback := CoordinatePullback.id W
  mapsInfinity := CoordinatePullback.mapsInfinity_id W

/-- **Composition of isogenies**: pull back along `ψ` into `K(W₂)`, then carry that across the
fraction field by `fieldPullback φ`. `MapsInfinity` for the composite is transitivity of
integrality (`Algebra.IsIntegral.trans`): `R(W₁)` is integral over `φ(R(W₂))` by `φ.mapsInfinity`,
and applying `fieldPullback φ` to `ψ.mapsInfinity` makes `φ(R(W₂))` integral over the composite
image of `R(W₃)`. Degree multiplicativity along this composite is the finrank tower formula
(`README.md` §Layer 1). -/
noncomputable def comp {W₃ : WeierstrassCurve.Affine F} (ψ : Isogeny W₂ W₃) (φ : Isogeny W₁ W₂) :
    Isogeny W₁ W₃ where
  pullback := φ.fieldPullback.comp ψ.pullback
  mapsInfinity := sorry

/-- **The degree of an isogeny** (AEC II.2.4(a)-shape): the dimension
of `W₁.FunctionField` over the fraction field of the pullback's image — the field range of
the extension `fieldPullback`. Multiplicativity under composition is the finrank tower
formula; `deg [n] = n²` and `deg π_q = q` are the Layer 1/3 milestones; the hom carrier's
zero map has degree `0` by convention (`README.md` §Layer 1). -/
noncomputable def degree (φ : Isogeny W₁ W₂) : ℕ :=
  Module.finrank φ.fieldPullback.fieldRange W₁.FunctionField

/-- **Automatic finiteness** (AEC II.2.4(a)): a nonconstant map of one-variable function
fields is finite, the inseparable case included — no properness input. This is what makes
`degree` honest (`finrank` of an infinite extension reads `0`) and "nonconstant" free.
⚠ *Mathlib-track*: proven in the shared upstream development as `Isogeny.finiteDimensional`. -/
theorem finiteDimensional (φ : Isogeny W₁ W₂) :
    Module.Finite φ.fieldPullback.fieldRange W₁.FunctionField :=
  sorry

/-- The degree of an isogeny is positive — finiteness plus nontriviality of the field
extension. -/
theorem degree_pos (φ : Isogeny W₁ W₂) : 0 < φ.degree :=
  sorry

/-- **The induced map on points** (⚠ *mathlib-track*: constructed upstream as
`Isogeny.toPointHom`, by extending ideals to the intermediate ring — the integral closure of
`W₂.CoordinateRing` in `W₁.FunctionField`, module-finite and integrally closed — taking
relative ideal norms down to `W₂.CoordinateRing`, and conjugating the resulting class-group
homomorphism by `Point.toClassEquiv`). Additive **by construction**: AEC III.4.8 is built in,
not a separate rigidity theorem. The normality input holds for elliptic `W₂` by
`isIntegrallyClosed_coordinateRing` below. -/
noncomputable def toPointHom [DecidableEq F] (φ : Isogeny W₁ W₂)
    [IsIntegrallyClosed W₂.CoordinateRing] : W₁.Point →+ W₂.Point :=
  sorry

end Isogeny

/-- **The coordinate ring of an elliptic curve is integrally closed** — smoothness of the
affine curve, in the form the point-map construction consumes (its `IsIntegrallyClosed`
input). For elliptic `W` the coordinate ring is in fact a Dedekind domain (Layer 0); this is
the normality half. -/
theorem isIntegrallyClosed_coordinateRing (W : WeierstrassCurve.Affine F) [W.IsElliptic] :
    IsIntegrallyClosed W.CoordinateRing :=
  sorry

/-- **The Frobenius isogeny** of a Weierstrass curve over a finite field (AEC II.2.11):
`pullback` the restriction of `(· ^ q)` to the coordinate ring, with `q = #F` — an
`F`-algebra map because `c ^ q = c` on `F` — whose
`MapsInfinity` is the integrality of the coordinates over their `q`-th powers. Purely
inseparable; Layer 3's engine, inducing `(x, y) ↦ (x^q, y^q)` on points. -/
noncomputable def frobeniusIsogeny [Finite F] (W : WeierstrassCurve.Affine F) :
    Isogeny W W :=
  sorry

/-- **`deg π_q = q`** (AEC II.2.11(c)): the Frobenius isogeny has degree `#F` — the first
computed degree, and the input to `deg (1 − π_q) = #E(𝔽_q)` (Layer 3). -/
theorem degree_frobeniusIsogeny [Finite F] (W : WeierstrassCurve.Affine F) :
    (frobeniusIsogeny W).degree = Nat.card F :=
  sorry

end Isogeny

/-- **Multiplication-by-`n` is surjective on `E(Kˢᵉᵖ)`** (AEC III.4.10) over a separably closed
field, for `n` **invertible in `K`** (`(n : K) ≠ 0`, i.e. `char K ∤ n` — which also forces
`n ≠ 0`). The invertibility is what makes `[n]` separable (`[n]^*ω = n·ω`, Layer 1), and only a
separable isogeny is surjective on `Kˢᵉᵖ`-points: over an imperfect separably closed field
(e.g. `𝔽_p(t)ˢᵉᵖ`) the fibres of an inseparable `[n]` live in a purely inseparable extension, so
the bare `n ≠ 0` claim is false as stated. (Over `[IsAlgClosed K]` every `n ≠ 0` works, but the
separably closed statement is the one the torsion count consumes.) Here `n • ·` is the `n`-fold
sum in the point group; the kernel is `E[n]`, whose structure is `torsion_addEquiv_prod`
below. -/
theorem smul_surjective {K : Type*} [Field K] [IsSepClosed K] (W : WeierstrassCurve K)
    [W.IsElliptic] (n : ℕ) (hn : (n : K) ≠ 0) :
    Function.Surjective (fun P : W.toAffine.Point ↦ n • P) :=
  sorry

/-! ## Layer 2: torsion, the Weil pairing, and the Tate module (AEC III.6–8)

`E[N]` is the `ℤ`-module `N`-torsion of the point group, `Submodule.torsionBy ℤ (E.Point) N`. -/

/-- **`E[N] ≃+ (ℤ/N)²`** (AEC III.6.4): over a separably closed field `K` in which `N` is
invertible (`(N : K) ≠ 0`, i.e. `char K ∤ N`), the `N`-torsion is additively equivalent to
`ZMod N × ZMod N` — stated as a bare `≃+`, with no `ZMod N`-module packaging: the
additive equivalence carries the same content, since a `≃+` between `ZMod N`-modules is
automatically `ZMod N`-linear, and it avoids installing the `AddSubgroup.torsionBy.zmodModule`
instance. The carrier `AddSubgroup.torsionBy A (N : ℤ)` is Mathlib's `A[N]`, reducibly the
`Submodule.torsionBy ℤ A (N : ℤ)` used by `weilPairing` below. The statement is wrapped in
`Nonempty` because the equivalence — a choice of basis — is noncanonical. This is the
"N-torsion" milestone. -/
theorem torsion_addEquiv_prod {K : Type*} [Field K] [IsSepClosed K] (W : WeierstrassCurve K)
    [W.IsElliptic] (N : ℕ) [NeZero N] (hN : (N : K) ≠ 0) :
    Nonempty (AddSubgroup.torsionBy W.toAffine.Point (N : ℤ) ≃+ ZMod N × ZMod N) :=
  sorry

/-- **The Weil pairing** `e_N : E[N] × E[N] → μ_N` (AEC III.8.1), over **any** field — no closure
hypothesis. Pinned as an additive **bilinear** map (`→+ →+`, i.e. linear in both variables) into
`Additive (rootsOfUnity N K)`, so `ℤ`-bilinearity and the `μ_N`-valued codomain are part of the
type. It is alternating and, over a separably closed field with `N` invertible in `K`,
nondegenerate
(`weilPairing_nondegenerate` and `weilPairing_self`); the primary consumer-facing API is
**compatibility with isogenies via the dual**, with change-of-field functoriality
near-definitional (`README.md` §Layer 2). -/
noncomputable def weilPairing {K : Type*} [Field K] (W : WeierstrassCurve K) [W.IsElliptic]
    (N : ℕ) [NeZero N] :
    Submodule.torsionBy ℤ W.toAffine.Point (N : ℤ) →+
      Submodule.torsionBy ℤ W.toAffine.Point (N : ℤ) →+ Additive (rootsOfUnity N K) :=
  sorry

/-- The **Weil pairing is nondegenerate** over a separably closed field (AEC III.8.1(c) — the
parts are (a) bilinear, (b) alternating, (c) nondegenerate, (d) Galois-equivariant, (e)
compatible in the level; adjointness under the dual is III.8.2): if
`e_N(P, Q) = 0` for every `Q`, then `P = 0`. Bilinearity and the `μ_N`-valued codomain are already
in the type of `weilPairing`, so together this makes `e_N` a perfect pairing. (`[NeZero N]` is kept
only because the `weilPairing` definition needs it as an instance; `hN` supplies the invertibility
nondegeneracy actually requires.) ⚠ AEC III.8 assumes `N` prime to `char K`, and that is not a
convenience: when `char K = p ∣ N` the point-valued pairing genuinely **degenerates** — for
ordinary `E`, `E[p](K̄) ≅ ℤ/p` while `μ_p(K̄) = {1}`, so it is identically trivial, and for
supersingular `E`, `E[p](K̄) = {O}` makes it vacuous. The perfect pairing in that case is
scheme-theoretic (finite flat group schemes, Cartier duality, Katz–Mazur §2.8) and is **not**
expressible in this `Submodule.torsionBy`/`rootsOfUnity` type; it belongs to the scheme-facing
roadmap. -/
theorem weilPairing_nondegenerate {K : Type*} [Field K] [IsSepClosed K] (W : WeierstrassCurve K)
    [W.IsElliptic] (N : ℕ) [NeZero N] (hN : (N : K) ≠ 0)
    (P : Submodule.torsionBy ℤ W.toAffine.Point (N : ℤ)) :
    (∀ Q, weilPairing W N P Q = 0) → P = 0 :=
  sorry

/-- The **Weil pairing is alternating** (AEC III.8.1(b)): `e_N(P, P) = 0` (written additively —
the root of unity `1`). Over any field, no closure hypothesis. Together with bilinearity this
gives skew-symmetry, and with the left-nondegeneracy above it makes the pairing nondegenerate
on both sides: left-nondegeneracy alone is only half the statement. -/
theorem weilPairing_self {K : Type*} [Field K] (W : WeierstrassCurve K)
    [W.IsElliptic] (N : ℕ) [NeZero N]
    (P : Submodule.torsionBy ℤ W.toAffine.Point (N : ℤ)) :
    weilPairing W N P P = 0 :=
  sorry

/-! ## Layer 3: elliptic curves over finite fields — the Hasse bound (AEC V.1) -/

/-- **`E(𝔽_q)` is finite** — a prerequisite Mathlib lacks (needed even for the count to make
sense). -/
theorem finite_point {K : Type*} [Field K] [Finite K] (W : WeierstrassCurve K) [W.IsElliptic] :
    Finite W.toAffine.Point :=
  sorry

/-- **The Frobenius trace** `a_q = #F + 1 − #E(F)` for an elliptic curve over a finite field.
Mathlib's vocabulary suffices, so this is **defined outright**: a convention to pin, not a
milestone. The Hasse bound above, the trace sequence of the zeta strand, and Layer 1's
ordinary-endomorphism-ring theorem all quantify over it, which is why it is named rather than
left inline. `Nat.card W.toAffine.Point` includes the point at infinity. ⚠ `[E.IsElliptic]` is
required: the bare point-count defect of an arbitrary Weierstrass cubic is a different quantity
and does not get this name, since what makes the defect a *trace* is the Layer-1 identity
`deg(1 − π_q) = #E(𝔽_q)`. -/
noncomputable def frobeniusTrace {F : Type*} [Field F] [Finite F] (E : WeierstrassCurve F)
    [E.IsElliptic] : ℤ :=
  (Nat.card F : ℤ) + 1 - Nat.card E.toAffine.Point

section Supersingular

variable {K : Type*} [Field K] (p : ℕ) [Fact p.Prime] [CharP K p]

/-- **Supersingularity**, defined **geometrically**: the `p`-torsion over a separable closure is
trivial (AEC V.3.1(i)). ⚠ This is deliberately *not* a congruence on the Frobenius trace. The
geometric condition is the one that makes sense over an arbitrary field of characteristic `p`,
where there is no `a_q` at all. It makes base-change invariance the natural theorem to prove, but
⚠ does **not** make that theorem definitional: the two sides use different separable closures and
different point types, as `isSupersingular_baseChange_iff` below records. The price is a dependency
on Layer 0.5's base change and Layer 2's torsion vocabulary, which is mild. The finite-field
criterion is `isSupersingular_iff_dvd_frobeniusTrace` below. -/
def IsSupersingular (W : WeierstrassCurve K) [W.IsElliptic] : Prop :=
  Submodule.torsionBy ℤ (W.baseChange (SeparableClosure K)).toAffine.Point (p : ℤ) = ⊥

/-- **Ordinariness**: not supersingular. Layer 1's theorem that `End(E)` is an order in `ℚ(π_q)`
is stated under this hypothesis. -/
def IsOrdinary (W : WeierstrassCurve K) [W.IsElliptic] : Prop :=
  ¬ IsSupersingular p W

end Supersingular

/-- **The finite-field criterion** (AEC V.4.1): over a finite field the geometric definition is
equivalent to `p` dividing the Frobenius trace, and it is this form the Hasse-era strands use.
⚠ `a_q = 0` is **not** an acceptable substitute: the two agree only for `q = p ≥ 5`, since over
`𝔽₂` and `𝔽₃` the Hasse interval is wide enough to contain supersingular curves with
`a_q ≠ 0`. -/
theorem isSupersingular_iff_dvd_frobeniusTrace {F : Type*} [Field F] [Finite F] (p : ℕ)
    [Fact p.Prime] [CharP F p] (E : WeierstrassCurve F) [E.IsElliptic] :
    IsSupersingular p E ↔ (p : ℤ) ∣ frobeniusTrace E :=
  sorry

/-- **Base-change invariance of supersingularity** — a theorem, ⚠ **not** a definitional
reduction. Its field extension is arbitrary, including transcendental extensions. The proof is
the five-step chain from `README.md` §Layer 3: characterize supersingularity by pure inseparability
of Verschiebung; identify Verschiebung after base change with the base change of Verschiebung;
use preservation and reflection of pure inseparability under arbitrary scalar extension; and
apply the characterization over `K` again. In particular, do not split into
algebraic/separable/purely-inseparable cases: those cases do not exhaust this signature. -/
theorem isSupersingular_baseChange_iff {K : Type*} [Field K] (p : ℕ) [Fact p.Prime] [CharP K p]
    (W : WeierstrassCurve K) [W.IsElliptic] (L : Type*) [Field L] [Algebra K L]
    [(W.baseChange L).IsElliptic] :
    IsSupersingular p (W.baseChange L) ↔ IsSupersingular p W :=
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

/-! ## Layer 4.5a: invariant theory over a Dedekind domain (AEC VIII.8)

The invariant-theory counterpart of Layer 4, over the fraction field `K` of a Dedekind domain
`O`. Every definition says "minimal at `v`" by applying Layer 4's DVR theory to
`Localization.AtPrime v.asIdeal` inside `K`, so the four localisation instances below are the
layer's first obligation: Mathlib has the discrete-valuation-ring instance, but relates that
localisation to an **abstract** fraction field only for `K = FractionRing O`. They are stated
`local` here because they are suggested forms for a milestone, not a global instance decision
this file is entitled to make. This section defines the invariants and proves the easy implication
from a global equation to a trivial obstruction class. The converse constructs one equation from
compatible local data; it belongs to Layer 4.5b and is asserted only for rings of integers of
number fields. -/

section GlobalModels

open IsDedekindDomain

variable (O : Type*) [CommRing O] [IsDedekindDomain O]
variable {K : Type*} [Field K] [Algebra O K] [IsFractionRing O K]

local instance (v : HeightOneSpectrum O) :
    IsDiscreteValuationRing (Localization.AtPrime v.asIdeal) :=
  IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain O v.ne_bot _

noncomputable local instance (v : HeightOneSpectrum O) :
    Algebra (Localization.AtPrime v.asIdeal) K :=
  IsLocalization.localizationAlgebraOfSubmonoidLe _ _ _ _
    v.asIdeal.primeCompl_le_nonZeroDivisors

local instance (v : HeightOneSpectrum O) : IsScalarTower O (Localization.AtPrime v.asIdeal) K :=
  IsLocalization.localization_isScalarTower_of_submonoid_le _ _ _ _
    v.asIdeal.primeCompl_le_nonZeroDivisors

local instance (v : HeightOneSpectrum O) : IsFractionRing (Localization.AtPrime v.asIdeal) K :=
  IsFractionRing.isFractionRing_of_isDomain_of_isLocalization v.asIdeal.primeCompl _ K

/-- **A globally minimal model**: minimal at every height-one prime of `O`. ⚠ Integrality over
`O` is deliberately **not** a conjunct — it is a theorem of this layer. Mathlib's
`[IsMinimal R W] : IsIntegral R W` gives it over each localisation, and descending to
`O = ⋂ᵥ Oᵥ` is a coefficient-by-coefficient valuation argument; adding it as a hypothesis would
hide that milestone. ⚠ `[W.IsElliptic]` throughout this section is not idle generality-shedding:
for a singular cubic `Δ = 0`, the product defining the minimal discriminant ideal loses its
finite support, and the obstruction exponents are not the nonnegative integers claimed. -/
def IsGlobalMinimal (W : WeierstrassCurve K) [W.IsElliptic] : Prop :=
  ∀ v : HeightOneSpectrum O, WeierstrassCurve.IsMinimal (Localization.AtPrime v.asIdeal) W

/-- **A semi-globally minimal model**: minimal at every height-one prime but one, and integral
at the exceptional prime `v₀`. ⚠ The integrality clause cannot be dropped — minimality away from
`v₀` says nothing about the denominators at `v₀`. ⚠ The **disjunct is load-bearing, not tidiness**:
a field is a Dedekind domain in Mathlib and its height-one spectrum is empty, so over a field the
bare existential is `False` while `IsGlobalMinimal` is vacuously `True` — the intended "every
global minimal model is semi-global" would fail at the degenerate base. ⚠ This is the **weak**
predicate: it permits any defect at `v₀`. The sharp one is `IsSharpSemiGlobalMinimalAt` below,
and the construction theorem at a supplied representative prime — over `𝓞 K` for a number
field, **not** an abstract Dedekind domain — is `README.md` §Layer 4.5b. -/
def IsSemiGlobalMinimal (W : WeierstrassCurve K) [W.IsElliptic] : Prop :=
  IsGlobalMinimal O W ∨
    ∃ v₀ : HeightOneSpectrum O,
      WeierstrassCurve.IsIntegral (Localization.AtPrime v₀.asIdeal) W ∧
        ∀ v : HeightOneSpectrum O, v ≠ v₀ →
          WeierstrassCurve.IsMinimal (Localization.AtPrime v.asIdeal) W

/-- **The local obstruction exponent**
`f_v = (v(Δ W) - v(Δ_min,v))/12`. It is integer-valued for an arbitrary rational equation;
local integrality is the hypothesis that makes it nonnegative. Keeping codomain `ℤ` avoids
silently truncating the defect of a nonintegral equation. -/
noncomputable def obstructionExponentAt (v : HeightOneSpectrum O)
    (W : WeierstrassCurve K) [W.IsElliptic] : ℤ :=
  sorry

/-- **A sharply semi-global model at `v₀`**: integral at the exceptional prime, minimal at every
other height-one prime, and of discriminant defect exactly `12` at `v₀`. ⚠ Integrality at `v₀`
is a separate conjunct; the discriminant valuation alone does not imply it, since a nonintegral
translation preserves the discriminant. -/
def IsSharpSemiGlobalMinimalAt (v₀ : HeightOneSpectrum O)
    (W : WeierstrassCurve K) [W.IsElliptic] : Prop :=
  WeierstrassCurve.IsIntegral (Localization.AtPrime v₀.asIdeal) W ∧
    (∀ v : HeightOneSpectrum O, v ≠ v₀ →
      WeierstrassCurve.IsMinimal (Localization.AtPrime v.asIdeal) W) ∧
    obstructionExponentAt O v₀ W = 1

/-- Local integrality is what makes the integer-valued obstruction exponent nonnegative. -/
theorem obstructionExponentAt_nonneg_of_isIntegral (v : HeightOneSpectrum O)
    (W : WeierstrassCurve K) [W.IsElliptic]
    (hW : WeierstrassCurve.IsIntegral (Localization.AtPrime v.asIdeal) W) :
    0 ≤ obstructionExponentAt O v W :=
  sorry

/-- Every sharply semi-global model is semi-global in the weak, consumer-facing sense. -/
theorem IsSharpSemiGlobalMinimalAt.isSemiGlobalMinimal (v₀ : HeightOneSpectrum O)
    (W : WeierstrassCurve K) [W.IsElliptic]
    (hW : IsSharpSemiGlobalMinimalAt O v₀ W) : IsSemiGlobalMinimal O W := by
  exact Or.inr ⟨v₀, hW.1, hW.2.1⟩

/-- **The minimal discriminant ideal** `𝔇_{E/K} = ∏ᵥ 𝔭ᵥ ^ v(Δ_min,ᵥ)`. Pinned as a `sorry`
rather than defined, because the valuation bookkeeping it needs — the local minimal
discriminant of §Layer 4 and the finiteness of the product — is the milestone. Its
model-independence is one statement; the comparison with a chosen model is the other, and it
⚠ **requires integrality**: for `W` integral over `O`, `𝔇_{E/K} = (Δ W)` iff `W` is globally
minimal. Without integrality the converse fails cheaply — translating a global minimal equation
by `r = 1/2` leaves `Δ` alone and destroys integrality. -/
noncomputable def minimalDiscriminantIdeal (W : WeierstrassCurve K) [W.IsElliptic] : Ideal O :=
  sorry

/-- **The positive Weierstrass defect class** `[𝔍_W] ∈ ClassGroup O` of an integral model, where
`𝔍_W = ∏ᵥ 𝔭ᵥ ^ fᵥ` and `fᵥ = (v(Δ W) − v(Δ_min,ᵥ))/12`. Milestones: the ideal identity
**`(Δ W) = 𝔇_{E/K} · 𝔍_W^{12}`** — ⚠ in that orientation, since the defect is what an integral
model carries *above* the minimal discriminant, so it multiplies `𝔇` up to the principal ideal
and not the other way round — and independence of the chosen integral model. A globally minimal
equation has trivial class. The difficult converse is the number-field construction in Layer
4.5b, not a general Dedekind-domain theorem supplied by this declaration. ⚠ Principality of
`𝔇_{E/K}` is a **different** condition and is not the obstruction: it can hold while
`[𝔍_W] ≠ 1`. This positive-defect convention is the inverse of the fractional ideal
`a_Δ` printed in AEC VIII.8; triviality is unchanged, but representative-prime statements use
this positive class. -/
noncomputable def weierstrassDefectClass (W : WeierstrassCurve O) [(W.baseChange K).IsElliptic] :
    ClassGroup O :=
  sorry

/-- **The Weierstrass class** of `E/K` in Silverman's orientation (AEC VIII.8), the class of the
fractional ideal `𝔞_Δ = 𝔍_W⁻¹`, inverse to the defect class `weierstrassDefectClass` this
roadmap and Sage compute in. Its triviality is equivalent, but its representative-prime
orientation is reversed. -/
noncomputable def weierstrassClass (W : WeierstrassCurve O)
    [(W.baseChange K).IsElliptic] : ClassGroup O :=
  (weierstrassDefectClass (K := K) O W)⁻¹

/-- **The curve-level global-minimality obstruction.** This choice-independent wrapper is the
public interface: consumers state the invariant directly on `E/K`, without first choosing an
integral equation. `globalMinimalityClass_eq_weierstrassDefectClass` compares it with every integral
model, and `globalMinimalityClass_variableChange` gives invariance under a `K`-isomorphism. -/
noncomputable def globalMinimalityClass (E : WeierstrassCurve K) [E.IsElliptic] : ClassGroup O :=
  sorry

/-- The curve-level obstruction agrees with the defect class of every integral model. -/
theorem globalMinimalityClass_eq_weierstrassDefectClass (W : WeierstrassCurve O)
    [(W.baseChange K).IsElliptic] :
    globalMinimalityClass (K := K) O (W.baseChange K) =
      weierstrassDefectClass (K := K) O W :=
  sorry

/-- Comparison with an integral model presented together with an isomorphism to the target
curve. This is the form downstream consumers use when their curve is not definitionally the
base change of the chosen integral equation. -/
theorem globalMinimalityClass_eq_weierstrassDefectClass_of_variableChange
    (W : WeierstrassCurve O) [(W.baseChange K).IsElliptic]
    (E : WeierstrassCurve K) [E.IsElliptic]
    (C : WeierstrassCurve.VariableChange K) (hC : C • (W.baseChange K) = E) :
    globalMinimalityClass O E = weierstrassDefectClass (K := K) O W :=
  sorry

/-- The global-minimality obstruction is invariant under an admissible change of variables. -/
theorem globalMinimalityClass_variableChange (E : WeierstrassCurve K) [E.IsElliptic]
    (C : WeierstrassCurve.VariableChange K) :
    globalMinimalityClass O (C • E) = globalMinimalityClass O E :=
  sorry

/-- **Semistability**: no height-one prime carries additive reduction, the reduction at `v`
being that of a local minimal model at `v`. ⚠ This is not potential good reduction, and neither
implies the other (`README.md` §Layer 4.5a). -/
def IsSemistable (W : WeierstrassCurve K) [W.IsElliptic] : Prop :=
  ∀ v : HeightOneSpectrum O,
    ¬ WeierstrassCurve.HasAdditiveReduction (Localization.AtPrime v.asIdeal)
        (W.minimal (Localization.AtPrime v.asIdeal))

end GlobalModels

/-- **The reduced minimal model** of a curve over `ℚ`: globally minimal over `ℤ`, with the
residual `r, s, t` freedom pinned by `a₁, a₃ ∈ {0, 1}` and `a₂ ∈ {−1, 0, 1}`. This
Layer-4.5a declaration is only the normal-form predicate; the existence-and-uniqueness theorem is
`existsUnique_reducedMinimal` in Layer 4.5b, after global equation construction. ⚠ It is a
**long** equation, and is not §Layer 8's canonical minimal-pair short equation; the two canonical
equations are different objects with different uses. -/
def IsReducedMinimal (W : WeierstrassCurve ℚ) [W.IsElliptic] : Prop :=
  IsGlobalMinimal ℤ W ∧
    (W.a₁ = 0 ∨ W.a₁ = 1) ∧ (W.a₂ = -1 ∨ W.a₂ = 0 ∨ W.a₂ = 1) ∧ (W.a₃ = 0 ∨ W.a₃ = 1)

/-! ## Layer 4.5b: global equation construction over number fields

This is the hard converse deliberately omitted from Layer 4.5a: Kraus's local and global
criteria, compatible auxiliary coefficients at primes above `2` and `3`, weak approximation for
one global `(r, s, t)`-transformation, and the verification that the resulting equation has the
prescribed local defects. The equivalence between trivial `globalMinimalityClass` and existence of
a global minimal equation is stated here only for `O = NumberField.RingOfIntegers K`. The
sharp construction takes a supplied prime representing the defect class and lying away from `6`.
Producing such a prime outside an arbitrary finite set is a separate external integration
corollary. Exact prerequisite contracts are in `README.md` §Layer 4.5b. -/

section GlobalEquationConstruction

open IsDedekindDomain

variable {K : Type*} [Field K] [NumberField K]

local instance (v : HeightOneSpectrum (NumberField.RingOfIntegers K)) :
    IsDiscreteValuationRing (Localization.AtPrime v.asIdeal) :=
  IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain
    (NumberField.RingOfIntegers K) v.ne_bot _

noncomputable local instance (v : HeightOneSpectrum (NumberField.RingOfIntegers K)) :
    Algebra (Localization.AtPrime v.asIdeal) K :=
  IsLocalization.localizationAlgebraOfSubmonoidLe _ _ _ _
    v.asIdeal.primeCompl_le_nonZeroDivisors

local instance (v : HeightOneSpectrum (NumberField.RingOfIntegers K)) :
    IsScalarTower (NumberField.RingOfIntegers K) (Localization.AtPrime v.asIdeal) K :=
  IsLocalization.localization_isScalarTower_of_submonoid_le _ _ _ _
    v.asIdeal.primeCompl_le_nonZeroDivisors

local instance (v : HeightOneSpectrum (NumberField.RingOfIntegers K)) :
    IsFractionRing (Localization.AtPrime v.asIdeal) K :=
  IsFractionRing.isFractionRing_of_isDomain_of_isLocalization v.asIdeal.primeCompl _ K

/-- The integrality and nonsingularity hypotheses for Kraus's local criterion. It records local
lifts of `c₄`, `c₆`, and `Δ = (c₄³ − c₆²) / 1728`, rather than hiding divisibility by `1728`
inside field division. -/
def IsKrausAdmissibleAt (c₄ c₆ : K)
    (v : HeightOneSpectrum (NumberField.RingOfIntegers K)) : Prop :=
  ∃ c₄' c₆' Δ' : Localization.AtPrime v.asIdeal,
    algebraMap _ K c₄' = c₄ ∧
      algebraMap _ K c₆' = c₆ ∧
      c₄' ^ 3 - c₆' ^ 2 = 1728 * Δ' ∧ Δ' ≠ 0

/-- The standard equation with prescribed invariants from which Kraus's local transforms start:
`[0, 0, 0, -c₄/48, -c₆/864]`. It need not itself be integral at primes above `2` or `3`. -/
def krausStandardModel (c₄ c₆ : K) : WeierstrassCurve K where
  a₁ := 0
  a₂ := 0
  a₃ := 0
  a₄ := -c₄ / 48
  a₆ := -c₆ / 864

/-- A valid Kraus witness at a prime above `3`: an integral `b₂` for which the
`(b₂/12, 0, 0)`-transform of the standard equation is locally integral. -/
def HasKrausThreeWitness (c₄ c₆ : K)
    (v : HeightOneSpectrum (NumberField.RingOfIntegers K)) : Prop :=
  ∃ b₂ : Localization.AtPrime v.asIdeal,
    WeierstrassCurve.IsIntegral (Localization.AtPrime v.asIdeal)
      (WeierstrassCurve.VariableChange.mk 1 (algebraMap _ K b₂ / 12) 0 0 •
        krausStandardModel c₄ c₆)

/-- A valid Kraus witness at a prime above `2`: integral `a₁` and `a₃` for which the
`(a₁²/12, a₁/2, a₃/2)`-transform of the standard equation is locally integral. The global
construction must choose `a₁` first and recompute `a₃` from that fixed lift. -/
def HasKrausTwoWitness (c₄ c₆ : K)
    (v : HeightOneSpectrum (NumberField.RingOfIntegers K)) : Prop :=
  ∃ a₁ a₃ : Localization.AtPrime v.asIdeal,
    WeierstrassCurve.IsIntegral (Localization.AtPrime v.asIdeal)
      (WeierstrassCurve.VariableChange.mk 1
          (algebraMap _ K a₁ ^ 2 / 12) (algebraMap _ K a₁ / 2)
          (algebraMap _ K a₃ / 2) • krausStandardModel c₄ c₆)

/-- **Kraus's local auxiliary criterion.** The pair must be locally integral and nonsingular;
at primes above `2` it must admit an `(a₁, a₃)` witness, at primes above `3` a `b₂` witness,
and away from `6` no further witness is required. -/
def KrausLocalCondition (c₄ c₆ : K)
    (v : HeightOneSpectrum (NumberField.RingOfIntegers K)) : Prop :=
  IsKrausAdmissibleAt c₄ c₆ v ∧
    if (2 : NumberField.RingOfIntegers K) ∈ v.asIdeal then
      HasKrausTwoWitness c₄ c₆ v
    else if (3 : NumberField.RingOfIntegers K) ∈ v.asIdeal then
      HasKrausThreeWitness c₄ c₆ v
    else True

/-- Kraus's nontrivial local theorem: the explicit auxiliary criterion is equivalent to
existence of a locally integral equation with the exact prescribed invariants. -/
theorem krausLocalCondition_iff_exists_integralModel (c₄ c₆ : K)
    (v : HeightOneSpectrum (NumberField.RingOfIntegers K)) :
    KrausLocalCondition c₄ c₆ v ↔
      ∃ W : WeierstrassCurve (Localization.AtPrime v.asIdeal),
        algebraMap _ K W.c₄ = c₄ ∧ algebraMap _ K W.c₆ = c₆ ∧
          WeierstrassCurve.IsElliptic (W.baseChange K) :=
  sorry

/-- Away from primes over `2` and `3`, local admissibility is sufficient for Kraus's condition.
The admissibility hypothesis is load-bearing: this theorem is false for an arbitrary pair. -/
theorem krausLocalCondition_of_not_dvd_six (c₄ c₆ : K)
    (v : HeightOneSpectrum (NumberField.RingOfIntegers K))
    (hInput : IsKrausAdmissibleAt c₄ c₆ v)
    (hSix : (6 : NumberField.RingOfIntegers K) ∉ v.asIdeal) :
    KrausLocalCondition c₄ c₆ v :=
  sorry

/-- Kraus's global condition is genuinely all the local conditions, before any coefficients are
patched. -/
def KrausGlobalCondition (c₄ c₆ : K) : Prop :=
  ∀ v : HeightOneSpectrum (NumberField.RingOfIntegers K),
    KrausLocalCondition c₄ c₆ v

/-- The global Kraus patch: compatible local conditions are equivalent to one integral equation
with the same exact invariants. The hard direction first CRT-patches `b₂`, then `a₁`, recomputes
the local `a₃` from that global `a₁`, and finally patches `a₃` (`README.md` §Layer 4.5b). -/
theorem krausGlobalCondition_iff_exists_integralModel (c₄ c₆ : K) :
    KrausGlobalCondition c₄ c₆ ↔
      ∃ W : WeierstrassCurve (NumberField.RingOfIntegers K),
        algebraMap _ K W.c₄ = c₄ ∧ algebraMap _ K W.c₆ = c₆ ∧
          WeierstrassCurve.IsElliptic (W.baseChange K) :=
  sorry

/-! **External integration contract.** An unconditional finite-avoidance corollary would require
the following general number-field declaration. Its ownership, proof, and analytic prerequisites
are outside this roadmap; the elliptic-curve theorem below instead starts from a supplied prime:

```lean
open scoped NumberField

namespace NumberField

theorem exists_primeIdeal_mk_eq_avoiding
    (K : Type*) [Field K] [NumberField K]
    (c : ClassGroup (𝓞 K))
    (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 K))) :
    ∃ v, v ∉ S ∧
      ClassGroup.mk0
        ⟨v.asIdeal,
          mem_nonZeroDivisors_iff_ne_zero.mpr v.ne_bot⟩ = c

end NumberField
```
-/

/-- Over a number field, triviality of the curve-level Weierstrass class is equivalent to
existence of one globally minimal equation in the curve's variable-change orbit. The difficult
direction is the global local-change patch of AEC VIII.8.2, not Layer 4.5a bookkeeping. -/
theorem globalMinimalityClass_eq_one_iff_exists_globalMinimalModel
    (E : WeierstrassCurve K) [E.IsElliptic] :
    globalMinimalityClass (NumberField.RingOfIntegers K) E = 1 ↔
      ∃ C : WeierstrassCurve.VariableChange K,
        IsGlobalMinimal (NumberField.RingOfIntegers K) (C • E) :=
  sorry

/-- Every elliptic Weierstrass equation over `ℚ` has a unique reduced minimal equation in its
variable-change orbit. The equation is unique; the change-of-variables witness need not be. -/
theorem existsUnique_reducedMinimal
    (E : WeierstrassCurve ℚ) [E.IsElliptic] :
    ∃! W : { W : WeierstrassCurve ℚ // W.IsElliptic },
      @IsReducedMinimal W.1 W.2 ∧
        ∃ C : WeierstrassCurve.VariableChange ℚ, C • E = W.1 :=
  sorry

/-- **Sharp construction at a supplied representative prime.** If `v₀` represents the positive
defect class and lies away from `6`, some equation in the curve's orbit has exact defect one there
and is minimal everywhere else. This is the elliptic-curve boundary: existence of a suitable
`v₀` outside an arbitrary finite set is an external integration corollary. -/
theorem exists_isSharpSemiGlobalMinimalAt_of_primeRepresentative
    (E : WeierstrassCurve K) [E.IsElliptic]
    (v₀ : HeightOneSpectrum (NumberField.RingOfIntegers K))
    (hv₀ :
      ClassGroup.mk0 ⟨v₀.asIdeal,
          mem_nonZeroDivisors_iff_ne_zero.mpr v₀.ne_bot⟩ =
        globalMinimalityClass (NumberField.RingOfIntegers K) E)
    (hSix : (6 : NumberField.RingOfIntegers K) ∉ v₀.asIdeal) :
    ∃ C : WeierstrassCurve.VariableChange K,
      IsSharpSemiGlobalMinimalAt (NumberField.RingOfIntegers K) v₀ (C • E) :=
  sorry

end GlobalEquationConstruction

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
(`README.md` §Layer 5). The declarations below are the concrete quadratic case: the exact shapes of the
`sorry`-free FLT quadratic-twist development (`ImperialCollegeLondon/FLT` #1088) — several
thousand lines of AI Lean, to be brought into Tau Ceti first — so porting it is a transcription
rather than a re-derivation, and the construction is characteristic-free. A quadratic twist is a
twist by a **quadratic** `x² − t x + n` (trace `t`, norm `n`), with discriminant `D = t² − 4n` —
equivalently, by a separable quadratic extension `L/K`, carried by the
`Algebra.IsQuadraticExtension K L` typeclass (in pinned Mathlib, and used directly by FLT). The
Galois character of the point isomorphism uses FLT's `quadraticCharacter`, so it is stated in
`README.md` §Layer 5 rather than stated here. -/

/-- **The quadratic twist** `E_{t,n}` by the quadratic `x² − t x + n` (FLT `quadraticTwistOf`),
over any `CommRing`. Its discriminant is `D⁶ · Δ(E)` with `D = t² − 4n` (`Δ_quadraticTwistOf`), so
it is elliptic exactly when `D` is **invertible** — stated below over a field, where that is
`D ≠ 0`, exactly as FLT states it — with the same `j`-invariant. This is the primitive notion the
whole layer (and FLT's split-reduction theorem) is built from. The body is **copied verbatim
from FLT's `quadraticTwistOf`** — pinned as a definition, not a `sorry`, so an
implementation cannot drift to a different twist normalization. -/
noncomputable def quadraticTwistOf {A : Type*} [CommRing A] (E : WeierstrassCurve A) (t n : A) :
    WeierstrassCurve A where
  a₁ := t * E.a₁
  a₂ := (t ^ 2 - 4 * n) * E.a₂ - n * E.a₁ ^ 2
  a₃ := (t ^ 2 - 4 * n) * t * E.a₃
  a₄ := (t ^ 2 - 4 * n) ^ 2 * E.a₄ - 2 * (t ^ 2 - 4 * n) * n * E.a₁ * E.a₃
  a₆ := (t ^ 2 - 4 * n) ^ 3 * E.a₆ - (t ^ 2 - 4 * n) ^ 2 * n * E.a₃ ^ 2

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
`quadraticTwist`): twist by the trace and norm of a generator of `L/K` — a noncomputable
choice, with the resulting `WeierstrassCurve K` **well-defined up to `K`-isomorphism**:
replacing the generator changes the coefficients by an admissible change of variables, and
FLT's `exists_smul_quadraticTwistBy_eq` is that independence-up-to-isomorphism statement.
`Algebra.IsQuadraticExtension K L` (in pinned Mathlib) is the quadratic-extension hypothesis,
exactly as FLT states it. -/
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
**split** multiplicative reduction after a separable quadratic twist. Note Mathlib's
`HasMultiplicativeReduction R` already **extends `IsMinimal R`**, so the hypothesis is about a
minimal equation; the conclusion minimises the twist explicitly (`.minimal R`), and the
apparent asymmetry between hypothesis and conclusion is exactly that. Consumes Mathlib's reduction
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
is also how the existing formalisation proves it: `fg_point_of_numberField` there already treats
an arbitrary Weierstrass curve, performing the reduction to short normal form **internally**, so
the port retains that variable-change reduction rather than eliminating a hypothesis).
Statement-named per Mathlib convention — the name describes
the conclusion, matching the existing formalisation's `fg_point_of_numberField`, and
"Mordell–Weil" lives here in the docstring. -/
theorem fg_point_of_numberField {K : Type*} [Field K] [NumberField K] (W : WeierstrassCurve K)
    [W.IsElliptic] : AddGroup.FG W.toAffine.Point :=
  sorry

/-! ## Layer 7: Selmer groups and Sha (AEC X.4)

The `m`-descent sequence `0 → E(K)/mE(K) → Selₘ(E/K) → Ш(E/K)[m] → 0`, the finiteness of the
`m`-Selmer group `Selₘ(E/K)` (the **effective refinement** of Layer 6's weak Mordell–Weil — a
computable bound on the rank, not its prerequisite), and the Shafarevich–Tate group `Ш(E/K)` are
specified in `README.md` §Layer 7. Pinned Mathlib has the *abelian* substrate this layer needs —
`groupCohomology` with its low-degree API and long exact sequence, Shapiro, Hilbert 90 for
**finite** extensions, and continuous cohomology of topological groups — and this layer's
coefficient modules (`E[m]`, `E(Kˢᵉᵖ)`, the Cassels/local-duality material) are all abelian, so
the continuous *nonabelian* `H¹` prerequisite belongs to Layer 5's twist classification, not
here (`Mathlib/CategoryTheory/Sites/NonabelianCohomology/H1.lean` is Čech-style cohomology of a
presheaf of groups, not continuous nonabelian cohomology of a profinite group on a discrete one).
What gates this layer is the **forced-discrete continuous-cohomology constructor** — the first
milestone of `README.md` §Layer 7, absent upstream — and then the **Galois-specific packaging**
on top: profinite Galois modules with the finite-level comparison, the Kummer connecting map for
`[m]`, inflation–restriction there, and the local conditions at the places of `K`, listed
precisely in `README.md` §Layer 7. Nothing is pinned here; the layer states its objects against
that API once it exists. -/

/-! ## Layer 8: selected `ℚ`-specific database adapters

This layer owns the minimal-pair model and its height, the abc quality, the Szpiro ratio with the
named Szpiro and abc statements and the implications between them, and bounded integral-point
search; it is not an exhaustive schema for a table of curves. Everything structural has a home in Layers 3, 4 and 4.5.
What is pinned here is the **convention**; the API is specified in `README.md` §Layer 8. The
entries that are not unconditionally meaningful carry their hypotheses rather than a junk value. -/

/-- **The height of an integral short equation** over `ℤ`. ⚠ This is the equation-level
function and asks only for `IsShortNF`; the minimal-pair condition is the separate predicate below, and it is
what upgrades this to an invariant of the curve. The carrier is the whole content: on a short
model over `ℚ` the expression is not an invariant at all, since `x = u²x'`, `y = u³y'` sends
`(a₄, a₆)` to `(a₄/u⁴, a₆/u⁶)` and the height to `H/|u|¹²`, so one curve has short rational
models of arbitrarily small height and bounded-height finiteness is false. ⚠ It does not take
the name `naiveHeight`: that name belongs to the curve-level invariant below, the height of the
minimal-pair model. The naïve `x`-height on *points* of §Layer 6 is a different quantity on a
different type, `WeierstrassCurve.Affine.Point.naiveHeight`; the namespace is what keeps the two
apart, and neither name is reserved against the other. -/
def shortEquationHeight (W : WeierstrassCurve ℤ) [W.IsShortNF] : ℕ :=
  max (4 * W.a₄.natAbs ^ 3) (27 * W.a₆.natAbs ^ 2)

/-- **The minimal-pair normal form for an integral short equation**: short, and no prime `ℓ` has
both `ℓ⁴ ∣ a₄` and `ℓ⁶ ∣ a₆` — the condition that kills the `(a₄, a₆) ↦ (u⁴a₄, u⁶a₆)` scaling
freedom and so makes the height above well defined on curves. This is the BHKSSW/LMFDB
convention (references), where such an `(A, B)` is a *minimal pair*.
⚠ Not DVR-minimality: at `2` and `3` a minimal-pair short equation need not be a minimal
Weierstrass equation, which is why the global minimal model of §Layer 4.5b is a long one. -/
def IsMinimalPairNF (W : WeierstrassCurve ℤ) : Prop :=
  W.IsShortNF ∧ ∀ ℓ : ℕ, ℓ.Prime → ¬ ((ℓ : ℤ) ^ 4 ∣ W.a₄ ∧ (ℓ : ℤ) ^ 6 ∣ W.a₆)

/-- **A bundled minimal-pair integral short model** of an elliptic curve over `ℚ`: the
integral equation, the minimal-pair condition, and the change of variables carrying its base
change to `E`.
⚠ The bundle is not canonical because its change-of-variables witness need not be unique; the
model equation, and hence its height, is unique by `minimalPairModel_unique`.
⚠ Distinct from §Layer 4.5a's `IsReducedMinimal`, which is a *long* equation; a database record
stores both. -/
structure MinimalPairModel (E : WeierstrassCurve ℚ) [E.IsElliptic] where
  /-- The integral short equation. -/
  model : WeierstrassCurve ℤ
  /-- It is short and a minimal pair. -/
  isMinimalPair : IsMinimalPairNF model
  /-- The change of variables realising the isomorphism over `ℚ`. -/
  variableChange : WeierstrassCurve.VariableChange ℚ
  /-- It carries the base-changed model to `E`. -/
  isomorphic : variableChange • (model.baseChange ℚ) = E

/-- **The height of a bundled minimal-pair equation.** Defined outright: the
minimal-pair field supplies the `IsShortNF` instance `shortEquationHeight` needs. -/
noncomputable def MinimalPairModel.height {E : WeierstrassCurve ℚ} [E.IsElliptic]
    (M : MinimalPairModel E) : ℕ :=
  letI : M.model.IsShortNF := M.isMinimalPair.1
  shortEquationHeight M.model

/-- **Existence** of a bundled minimal-pair short equation for the curve. -/
theorem exists_minimalPairModel (E : WeierstrassCurve ℚ) [E.IsElliptic] :
    Nonempty (MinimalPairModel E) :=
  sorry

/-- A fixed bundled minimal-pair integral short model, obtained from existence. Its observable
equation and height — not its change-of-variables witness — are independent of the classical
choice by `minimalPairModel_unique`. -/
noncomputable def minimalPairModel (E : WeierstrassCurve ℚ) [E.IsElliptic] :
    MinimalPairModel E :=
  Classical.choice (exists_minimalPairModel E)

/-- **Uniqueness**: the equation itself, not merely up to isomorphism. The residual freedom is
`(a₄, a₆) ↦ (u⁴a₄, u⁶a₆)` with `u = ±1`, and `u⁴ = u⁶ = 1`. Together with existence this is what
makes `MinimalPairModel.height` an invariant of the curve — and hence what makes ordering a
table of curves by height well founded. -/
theorem minimalPairModel_unique (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (M N : MinimalPairModel E) : M.model = N.model :=
  sorry

/-- **The naïve height of a curve over `ℚ`**, computed from its unique minimal-pair integral short
equation. This is curve-level API, unlike `MinimalPairModel.height`, which still takes a chosen
bundled model. -/
noncomputable def naiveHeight (E : WeierstrassCurve ℚ) [E.IsElliptic] : ℕ :=
  (minimalPairModel E).height

/-- Every minimal-pair short model computes the same curve height. -/
theorem naiveHeight_eq {E : WeierstrassCurve ℚ} [E.IsElliptic]
    (M : MinimalPairModel E) : naiveHeight E = M.height :=
  sorry

/-- The curve height is invariant under an admissible change of variables over `ℚ`. -/
theorem naiveHeight_variableChange (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (C : WeierstrassCurve.VariableChange ℚ) :
    naiveHeight (C • E) = naiveHeight E :=
  sorry

/-- There are only finitely many **minimal-pair integral short equations** of bounded height. ⚠ The
carrier is intentional: the analogous set of literal terms `E : WeierstrassCurve ℚ` is infinite,
since one isomorphism class has infinitely many rational equations. Finiteness of bounded-height
`ℚ`-isomorphism classes is a corollary of this minimal-pair-model statement. -/
theorem finite_minimalPairEquations_bounded_height (H : ℕ) :
    Set.Finite {W : WeierstrassCurve ℤ |
      IsMinimalPairNF W ∧ WeierstrassCurve.IsElliptic (W.baseChange ℚ) ∧
        max (4 * W.a₄.natAbs ^ 3) (27 * W.a₆.natAbs ^ 2) ≤ H} :=
  sorry

/-- **The abc quality** of a curve over `ℚ`: with `j/1728 = a/c` in lowest terms and `b = c − a`,
the ratio `log max(|a|,|b|,|c|) / log rad(a·b·c)`. ⚠ The hypothesis `j ∉ {0, 1728}` is carried as
an argument and is **not** to be dropped in favour of a total definition: at those two values
`a·b·c = 0`, so `rad 0 = 1` and the quotient evaluates to `0` by division by zero — a
meaningful-looking number where the invariant does not exist. The abc conjecture is not a target
of this roadmap and no bound on the quality is claimed. -/
noncomputable def abcQuality (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (_h : E.j ≠ 0 ∧ E.j ≠ 1728) : ℝ :=
  let a := (E.j / 1728).num
  let c := ((E.j / 1728).den : ℤ)
  let b := c - a
  Real.log (max (max a.natAbs b.natAbs) c.natAbs) /
    Real.log (UniqueFactorizationMonoid.radical (a * b * c).natAbs)

/-- **The integral points** of a Weierstrass model over `ℚ`. ⚠ `[IsIntegral ℤ W]` is **not**
decoration. Negation is `−(x, y) = (x, −y − a₁x − a₃)`, so on a general rational model the set is
not stable under `P ↦ −P`: on `y² + ½y = x³` the point `(0, 0)` is integral while
`−(0, 0) = (0, −½)` is not. With `a₁, a₃ ∈ ℤ` stability holds and is a milestone. ⚠ Likewise the
change-of-variables statement is not for an arbitrary integral change: a bijection on integral
points needs `u = ±1` with `r, s, t ∈ ℤ`. The set still depends on the model and not only on the
curve. ⚠ **Siegel's theorem is not a target**, so no `Finite` instance accompanies this
definition: asserting finiteness would need Thue–Siegel–Roth or Baker, which nothing in this
roadmap builds, and would be exactly the kind of gap the roadmap-writing guide forbids. -/
def integralPoints (W : WeierstrassCurve ℚ) [WeierstrassCurve.IsIntegral ℤ W] :
    Set W.toAffine.Point :=
  {P | ∃ (x y : ℤ) (h : W.toAffine.Nonsingular (x : ℚ) (y : ℚ)),
    P = WeierstrassCurve.Affine.Point.some (x : ℚ) (y : ℚ) h}

/-! ## Worked applications

Not a layer: constructions that consume the layers above. `README.md` §Worked examples states
their milestones. -/

/-- **The Frey–Hellegouarch curve** `y² = x(x − A)(x + B)` over any commutative ring. Defined
outright, since the content is the theory: `Δ = 16·A²B²(A + B)²` and `c₄ = 16·(A² + AB + B²)` as
ring identities, and ellipticity over a field of characteristic `≠ 2` exactly when `A`, `B` and
`A + B` are nonzero. The application — `p ≥ 5` prime, `a, b, c` nonzero pairwise coprime with
`aᵖ + bᵖ + cᵖ = 0`, `b` even and `aᵖ ≡ −1 (mod 4)`, `A = aᵖ` and `B = bᵖ` — is **semistability**
in the sense of §Layer 4.5a, with minimal discriminant `(a·b·c)^{2p}/2⁸` and **algorithmic
conductor ideal** `rad (a·b·c)`. ⚠ The normalisation is reached by permuting the triple and
negating **all three** entries, never by negating one: put the unique even entry in the `b`
position, then the two odd entries satisfy `a + c ≡ 0 (mod 4)`, so swapping them achieves the
congruence. ⚠ "Conductor" here is Layer 4's **algorithmic (Ogg) exponent**, which is `1` at each
bad prime of a semistable curve. The **arithmetic (Artin) conductor** is the same ideal but a
different theorem, needing the identification Layer 4 names as a separate project; that bridge
is what FLT and modularity arguments consume, and the roadmap does not blur the two. ⚠ Modularity
is not this roadmap's, and nothing here presupposes it. -/
def freyCurve {R : Type*} [CommRing R] (A B : R) : WeierstrassCurve R where
  a₁ := 0
  a₂ := B - A
  a₃ := 0
  a₄ := -(A * B)
  a₆ := 0

end TauCetiRoadmap.EllipticCurves
