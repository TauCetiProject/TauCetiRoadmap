import Mathlib

/-!
# Lie groups and the Lie algebra correspondence: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

Mathlib has the *class* of Lie groups (`LieGroup I n G`), the Lie algebra of a Lie group as
left-invariant derivations (`LeftInvariantDerivation I G`, a `LieAlgebra ℝ`), the abstract adjoint
`LieAlgebra.ad`, the Banach-algebra and matrix exponentials (`NormedSpace.exp`, `Matrix.exp` lemmas),
the circle exponential (`Circle.exp`), the concrete matrix groups, and the covering-space and
enveloping-algebra API (see `README.md` for the file-by-file map). It has **no Lie-group exponential
map, no one-parameter subgroups, no `Ad`, no closed-subgroup theorem, no Lie functor, no BCH, no
Frobenius/Lie's-third integration, and none of the compact/reductive structure theory** (maximal tori,
Weyl integration, complexification, Borel-Weil, Iwasawa).

The design follows the three deliverables of `README.md`: **A** the Lie functor from groups to algebras
(`lieExp`, `oneParameterSubgroup`, `Ad`, `IsEmbeddedLieSubgroup`, `lieMap`, `bch`); **B** integrating
algebras to groups (`lieSubalgebraOfSubgroup`, Lie's third theorem, the equivalence of categories,
simply-connected covers, `UniversalEnvelopingAlgebra`); **C** the structure theory (`IsMaximalTorus`,
torus exhaustion, `weylGroup`, Weyl integration, `Complexification`, `borelWeilSpace`,
`iwasawaDecomposition`). Manifold signatures are kept conservative: because a norm on the abstract Lie
algebra and a group structure on an as-yet-unbuilt complexification are fragile, the smoothness and
complexification milestones are stated over matrix/normed groups or as existence statements, matching
`README.md`. The general smooth-manifold theorems carry the finite-dimensional real Lie group context
(`[FiniteDimensional ℝ E]`) their proofs require; the structure theory of Deliverable C adds the compact,
connected, or real-reductive hypotheses each result uses. `README.md` remains the definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.LieGroups

open scoped Manifold ContDiff Pointwise
open MeasureTheory

universe u v w

/-! ## A. The Lie functor: from groups to algebras -/

/-! ### Layer 0: the exponential map and one-parameter subgroups

Throughout Deliverable A, `G` is a real, finite-dimensional, `C^∞` Lie group: a `Group G` that is a
`C^∞` manifold on a model `I : ModelWithCorners ℝ E H` with smooth multiplication and inversion. Its
Lie algebra is Mathlib's `LeftInvariantDerivation I G`. -/

section LieGroup

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
  [Group G] [LieGroup I ∞ G]

/-- The evaluation `LeftInvariantDerivation.evalAt (1 : G)` realizes a left-invariant derivation as a
point derivation at `1`, a linear map `𝔤 →ₗ[ℝ] PointDerivation I (1 : G)`. This is the first half of the
identification of `𝔤` with `T₁G`; its inverse builds a left-invariant vector field from a tangent
vector and checks that its derivation is smooth and left-invariant. -/
noncomputable def evalAtOne (I : ModelWithCorners ℝ E H) (G : Type w) [TopologicalSpace G]
    [ChartedSpace H G] [IsManifold I ∞ G] [Group G] [LieGroup I ∞ G] :
    LeftInvariantDerivation I G →ₗ[ℝ] PointDerivation I (1 : G) := sorry

/-- Point derivations at `1` are the tangent space `T₁G`. For a finite-dimensional `C^∞` real manifold
the derivations at a point coincide with the tangent vectors (`Geometry/Manifold/DerivationBundle.lean`
records that this fails in general), so this equivalence is where finite-dimensionality enters. -/
noncomputable def pointDerivationTangentEquiv (I : ModelWithCorners ℝ E H) (G : Type w)
    [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G] [Group G] [LieGroup I ∞ G] :
    PointDerivation I (1 : G) ≃ₗ[ℝ] TangentSpace I (1 : G) := sorry

/-- The Lie algebra `𝔤 = Lie(G)` is Mathlib's `LeftInvariantDerivation I G`; at the identity it is the
tangent space `T₁G`. The equivalence is `evalAtOne` (into point derivations) followed by
`pointDerivationTangentEquiv`; the content is that `evalAtOne` is a bijection, so `finrank ℝ 𝔤 =
finrank ℝ E` is available only after this is established. -/
noncomputable def lieAlgebraTangentEquiv (I : ModelWithCorners ℝ E H) (G : Type w) [TopologicalSpace G]
    [ChartedSpace H G] [IsManifold I ∞ G] [Group G] [LieGroup I ∞ G] :
    LeftInvariantDerivation I G ≃ₗ[ℝ] TangentSpace I (1 : G) := sorry

/-- **The exponential map** `lieExp : 𝔤 → G`, the time-one flow of the left-invariant vector field `X`
(equivalently the unique one-parameter subgroup with velocity `X` at `0`). A **new** object; on `Rˣ`,
matrix groups, and the circle it must coincide with `NormedSpace.exp`, `Matrix.exp`, `Circle.exp`.
Its smoothness and local-diffeomorphism-at-`0` property are stated in `README.md` (Layer 0); they
require a norm on `𝔤`, transported through `lieAlgebraTangentEquiv`, and are not pinned here. -/
noncomputable def lieExp : LeftInvariantDerivation I G → G := sorry

theorem lieExp_zero : lieExp (I := I) (0 : LeftInvariantDerivation I G) = (1 : G) := sorry

/-- **One-parameter subgroup homomorphism law**: `t ↦ lieExp (t • X)` is a homomorphism `(ℝ, +) → G`.
This is the defining property of `lieExp` and of the one-parameter subgroups. -/
theorem lieExp_add_smul (X : LeftInvariantDerivation I G) (s t : ℝ) :
    lieExp ((s + t) • X) = lieExp (s • X) * lieExp (t • X) := sorry

/-- **One-parameter subgroups** as smooth homomorphisms `ℝ → G`. Every continuous homomorphism `ℝ → G`
arises this way for a unique `X`, giving the bijection `Hom_cont(ℝ, G) ≃ 𝔤`. -/
noncomputable def oneParameterSubgroup (X : LeftInvariantDerivation I G) : ℝ → G :=
  fun t => lieExp (t • X)

/-- **One-parameter subgroups** (previously prose-only): every continuous one-parameter subgroup
`φ : ℝ → G` is `t ↦ lieExp (t • X)` for a unique `X ∈ 𝔤` — the content of the bijection
`Hom_cont(ℝ, G) ≃ 𝔤`. -/
theorem oneParameterSubgroup_existsUnique (φ : ℝ → G) (hcont : Continuous φ)
    (hhom : ∀ s t : ℝ, φ (s + t) = φ s * φ t) :
    ∃! X : LeftInvariantDerivation I G, ∀ t : ℝ, φ t = lieExp (I := I) (t • X) := sorry

end LieGroup

/-! ### Layer 0 (worked shadow): the exponential of the units of a Banach algebra

`Rˣ` is a Lie group (`LieGroup 𝓘(𝕜, R) n Rˣ`), with `Lie(Rˣ) ≅ R` and `lieExp = NormedSpace.exp`. Over
a Banach algebra the exponential and its one-parameter-subgroup law are Mathlib-native and norm-based. -/

section BanachExp

variable {R : Type u} [NormedRing R] [NormedAlgebra ℝ R] [CompleteSpace R]

/-- On `Rˣ`, the abstract `lieExp` is `NormedSpace.exp`, which lands in the units. This is the
coincidence lemma grounding `lieExp`; here the resulting unit is pinned, with `(expUnits x : R)` the
Banach-algebra exponential. -/
noncomputable def expUnits (x : R) : Rˣ := sorry

theorem expUnits_coe (x : R) : (expUnits x : R) = NormedSpace.exp x := sorry

theorem exp_add_smul (x : R) (s t : ℝ) :
    NormedSpace.exp ((s + t) • x) = NormedSpace.exp (s • x) * NormedSpace.exp (t • x) := sorry

end BanachExp

/-! ### Layer 1: the adjoint representations `Ad` and `ad` -/

section Adjoint

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
  [Group G] [LieGroup I ∞ G]

/-- **The group adjoint** `Ad : G → (𝔤 ≃ₗ⁅ℝ⁆ 𝔤)`, the differential at `1` of conjugation `x ↦ g x g⁻¹`;
a Lie-algebra automorphism, and `Ad : G →* (𝔤 ≃ₗ⁅ℝ⁆ 𝔤)` a smooth representation (the adjoint
representation). Its differential at `1` is Mathlib's `LieAlgebra.ad ℝ 𝔤` (`ad = d(Ad)`, the geometric
meaning of the bracket; see `README.md`, Layer 1). On matrix groups `Ad g X = g X g⁻¹`. -/
noncomputable def Ad (g : G) :
    LeftInvariantDerivation I G ≃ₗ⁅ℝ⁆ LeftInvariantDerivation I G := sorry

/-- `Ad` is a group homomorphism into the Lie-algebra automorphisms. -/
theorem Ad_mul (g h : G) : (Ad (I := I) (g * h)).toLinearEquiv
    = (Ad (I := I) h).toLinearEquiv.trans (Ad (I := I) g).toLinearEquiv := sorry

/-- **The conjugation formula** `g · lieExp X · g⁻¹ = lieExp (Ad g X)`. -/
theorem conj_lieExp (g : G) (X : LeftInvariantDerivation I G) :
    g * lieExp X * g⁻¹ = lieExp (Ad g X) := sorry

end Adjoint

/-- **The adjoint-exponential shadow** on the units of a Banach algebra: conjugation commutes with the
exponential, `u · exp x · u⁻¹ = exp (u x u⁻¹)`, the matrix-group form of `Ad g (lieExp X) = lieExp (Ad g X)`
and, differentiated, of `Ad (lieExp X) = exp (ad X)`. -/
theorem exp_conj_units {R : Type u} [NormedRing R] [NormedAlgebra ℝ R] [CompleteSpace R]
    (u : Rˣ) (x : R) :
    (u : R) * NormedSpace.exp x * (↑u⁻¹ : R) = NormedSpace.exp ((u : R) * x * (↑u⁻¹ : R)) := sorry

/-! ### Layer 2: the closed-subgroup (Cartan) theorem -/

section ClosedSubgroup

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
  [Group G] [LieGroup I ∞ G]

/-- **The Lie subalgebra of a subgroup** `Lie(H) = {X | ∀ t, lieExp (t • X) ∈ H}`, a Lie subalgebra of
`𝔤` for any subgroup `H`. -/
def lieSubalgebraOfSubgroup (K : Subgroup G) : LieSubalgebra ℝ (LeftInvariantDerivation I G) := sorry

end ClosedSubgroup

/-- **Embedded-Lie-subgroup data**: a model and a `LieGroup` structure on `↥K` (over its subspace
topology) making the inclusion a smooth embedding — recorded as a structure because the instance
existential is large; `IsEmbeddedLieSubgroup` is its `Nonempty`. The embedding condition is the
standard characterization "topological embedding + injective differential everywhere" (via
`mfderiv`), so no bespoke smooth-embedding predicate is needed. -/
structure EmbeddedLieSubgroupData
    {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type v} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
    [Group G] [LieGroup I ∞ G] (K : Subgroup G) where
  (E' : Type u) [normed : NormedAddCommGroup E'] [nsp : NormedSpace ℝ E']
  [fd : FiniteDimensional ℝ E']
  (H' : Type v) [htop : TopologicalSpace H']
  (I' : ModelWithCorners ℝ E' H')
  [charted : ChartedSpace H' K]
  [mfd : IsManifold I' ∞ K]
  [lie : LieGroup I' ∞ K]
  smooth_incl : ContMDiff I' I ∞ ((↑) : K → G)
  embedding : Topology.IsEmbedding ((↑) : K → G)
  immersion : ∀ k : K, Function.Injective (mfderiv I' I ((↑) : K → G) k)

section ClosedSubgroup

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
  [Group G] [LieGroup I ∞ G]

/-- **`IsEmbeddedLieSubgroup K`**: `K` carries a smooth structure making the inclusion a smooth
embedding and `K` a Lie group. The `Lie(K) = lieSubalgebraOfSubgroup K` identification is the
companion theorem once the subgroup's own Lie algebra is comparable along `mfderiv` of the
inclusion. -/
def IsEmbeddedLieSubgroup (K : Subgroup G) : Prop :=
  Nonempty (EmbeddedLieSubgroupData I K)

/-- **The closed-subgroup (Cartan) theorem**: a closed subgroup of a Lie group is an embedded Lie
subgroup. The theorem that makes every closed matrix group a Lie group. -/
theorem isEmbeddedLieSubgroup_of_isClosed (K : Subgroup G) (hK : IsClosed (K : Set G)) :
    IsEmbeddedLieSubgroup (I := I) K := sorry

/-- **Cartan's automatic-smoothness corollary**: every continuous homomorphism of Lie groups is smooth,
so "Lie group homomorphism" may be stated as "continuous homomorphism". -/
theorem contMDiff_of_continuous_monoidHom
    {E' : Type u} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    {H' : Type v} [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'}
    {G' : Type w} [TopologicalSpace G'] [ChartedSpace H' G'] [IsManifold I' ∞ G']
    [Group G'] [LieGroup I' ∞ G'] (φ : G →* G') (hφ : Continuous φ) :
    ContMDiff I I' ∞ (φ : G → G') := sorry

end ClosedSubgroup

/-! ### Layer 3: the Lie functor and Baker-Campbell-Hausdorff -/

section LieFunctor

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
  [Group G] [LieGroup I ∞ G]
  {E' : Type u} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
  {H' : Type v} [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'}
  {G' : Type w} [TopologicalSpace G'] [ChartedSpace H' G'] [IsManifold I' ∞ G']
  [Group G'] [LieGroup I' ∞ G']

/-- **The Lie functor on morphisms**: `lieMap φ = d(φ)_1`, a Lie-algebra homomorphism, for a smooth
homomorphism `φ : G →* G'`. -/
noncomputable def lieMap (φ : G →* G') (hφ : ContMDiff I I' ∞ (φ : G → G')) :
    LeftInvariantDerivation I G →ₗ⁅ℝ⁆ LeftInvariantDerivation I' G' := sorry

/-- **Naturality against the exponential**: `φ (lieExp X) = lieExp (lieMap φ X)`. -/
theorem lieMap_lieExp (φ : G →* G') (hφ : ContMDiff I I' ∞ (φ : G → G'))
    (X : LeftInvariantDerivation I G) :
    φ (lieExp X) = lieExp (lieMap φ hφ X) := sorry

/-- **Faithfulness on connected groups**: two smooth homomorphisms out of a connected `G` with equal
differentials at `1` are equal. -/
theorem monoidHom_eq_of_lieMap_eq [ConnectedSpace G] (φ ψ : G →* G')
    (hφ : ContMDiff I I' ∞ (φ : G → G')) (hψ : ContMDiff I I' ∞ (ψ : G → G'))
    (h : lieMap φ hφ = lieMap ψ hψ) : φ = ψ := sorry

end LieFunctor

/-- **Baker-Campbell-Hausdorff** over a Banach algebra. `bch x y` is the local logarithm of
`exp x · exp y` in the exponential chart at `0`: for `x, y` small it is the unique small element whose
exponential is `exp x · exp y`, expanded as the BCH Lie series `x + y + ½⁅x,y⁆ + ⋯` in the commutator.
The characterization `exp x · exp y = exp (bch x y)` alone does not determine `bch` without the
smallness/log-uniqueness that pins it inside the chart, so the endpoint and first-order laws below are
part of the target. Stated on the normed arena where convergence is concrete; transported to the
abstract `lieExp` by a chart. -/
noncomputable def bch {R : Type u} [NormedRing R] [NormedAlgebra ℝ R] [CompleteSpace R] (x y : R) : R :=
  sorry

theorem exp_mul_exp_eq_exp_bch {R : Type u} [NormedRing R] [NormedAlgebra ℝ R] [CompleteSpace R]
    (x y : R) (hx : ‖x‖ < Real.log 2 / 2) (hy : ‖y‖ < Real.log 2 / 2) :
    NormedSpace.exp x * NormedSpace.exp y = NormedSpace.exp (bch x y) := sorry

/-- Left endpoint law: `bch 0 y = y`. -/
theorem bch_zero_left {R : Type u} [NormedRing R] [NormedAlgebra ℝ R] [CompleteSpace R] (y : R) :
    bch 0 y = y := sorry

/-- Right endpoint law: `bch x 0 = x`. -/
theorem bch_zero_right {R : Type u} [NormedRing R] [NormedAlgebra ℝ R] [CompleteSpace R] (x : R) :
    bch x 0 = x := sorry

/-- The first-order term of `bch`: `bch x y = x + y + ½⁅x,y⁆` up to third order in `(x, y)`, pinned here
as the commutator second-order part. `commutatorPart x y = ⁅x, y⁆ = x * y - y * x`, so that
`bch x y - (x + y) - (2⁻¹ : ℝ) • commutatorPart x y` is `O(‖(x,y)‖³)`. -/
def commutatorPart {R : Type u} [NormedRing R] (x y : R) : R := x * y - y * x

/-! ## B. Integrating algebras to groups -/

/-! ### Layer 4: Frobenius, Lie's third theorem, and the equivalence of categories -/

section Integration

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
  [Group G] [LieGroup I ∞ G]

end Integration

/-- **Immersed-Lie-subgroup data**: a connected Lie group `X` with an injective smooth immersive
homomorphism onto `K`. The carrier is a **separate type** with its own (leaf) topology — genuinely
finer than the subspace topology in general (irrational winding), which is exactly why `↥K` with its
subtype topology cannot carry this structure and a bare `Subgroup G` cannot express it. -/
structure ImmersedLieSubgroupData
    {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type v} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
    [Group G] [LieGroup I ∞ G] (K : Subgroup G) where
  (X : Type w) [grp : Group X] [xtop : TopologicalSpace X]
  (E' : Type u) [normed : NormedAddCommGroup E'] [nsp : NormedSpace ℝ E']
  [fd : FiniteDimensional ℝ E']
  (H' : Type v) [htop : TopologicalSpace H']
  (I' : ModelWithCorners ℝ E' H')
  [charted : ChartedSpace H' X]
  [mfd : IsManifold I' ∞ X]
  [lie : LieGroup I' ∞ X]
  [conn : ConnectedSpace X]
  toHom : X →* G
  injective : Function.Injective toHom
  range_eq : MonoidHom.range toHom = K
  smooth : ContMDiff I' I ∞ (toHom : X → G)
  immersion : ∀ x : X, Function.Injective (mfderiv I' I (toHom : X → G) x)

section Integration

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
  [Group G] [LieGroup I ∞ G]

/-- **`IsImmersedLieSubgroup K`**: `K` is the image of a connected immersed Lie subgroup. -/
def IsImmersedLieSubgroup (K : Subgroup G) : Prop :=
  Nonempty (ImmersedLieSubgroupData I K)

/-- **The subalgebra ↔ immersed-subgroup correspondence** (Frobenius): every Lie subalgebra `𝔥 ≤ 𝔤` is
the Lie algebra of a connected immersed Lie subgroup, unique up to immersed-subgroup equivalence. Stated
as existence of an immersed Lie subgroup with the given Lie subalgebra (the leaf through `1` of the
involutive left-invariant distribution `x ↦ d(L_x)_1 𝔥`). -/
theorem exists_immersedLieSubgroup_lieSubalgebra
    (𝔥 : LieSubalgebra ℝ (LeftInvariantDerivation I G)) :
    ∃ K : Subgroup G, IsImmersedLieSubgroup (I := I) K ∧ lieSubalgebraOfSubgroup K = 𝔥 := sorry

end Integration

/-- **Lie's third theorem**: every finite-dimensional real Lie algebra is `Lie(G)` for a
simply-connected Lie group `G`. Stated as existence of a Lie group whose left-invariant derivations are
Lie-isomorphic to `L`. -/
theorem exists_simplyConnected_lieGroup (L : Type u) [LieRing L] [LieAlgebra ℝ L] [Module.Finite ℝ L] :
    ∃ (E : Type u) (_ : NormedAddCommGroup E) (_ : NormedSpace ℝ E) (_ : FiniteDimensional ℝ E)
      (H : Type u) (_ : TopologicalSpace H) (I : ModelWithCorners ℝ E H)
      (G : Type u) (_ : TopologicalSpace G) (_ : ChartedSpace H G) (_ : IsManifold I ∞ G)
      (_ : Group G) (_ : LieGroup I ∞ G),
      SimplyConnectedSpace G ∧ Nonempty (LeftInvariantDerivation I G ≃ₗ⁅ℝ⁆ L) := sorry

/-- **The equivalence of categories** (morphism half): for **simply-connected** `G`, `lieMap` is a
bijection `Hom(G, G') ≃ Hom(𝔤, 𝔤')`. Existence integrates a Lie-algebra homomorphism (simple connectedness
+ the local BCH group law); uniqueness is `monoidHom_eq_of_lieMap_eq`. -/
theorem exists_monoidHom_of_lieHom
    {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
    [Group G] [LieGroup I ∞ G] [ConnectedSpace G] [SimplyConnectedSpace G]
    {E' : Type u} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    {H' : Type v} [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'}
    {G' : Type w} [TopologicalSpace G'] [ChartedSpace H' G'] [IsManifold I' ∞ G']
    [Group G'] [LieGroup I' ∞ G']
    (f : LeftInvariantDerivation I G →ₗ⁅ℝ⁆ LeftInvariantDerivation I' G') :
    ∃ (φ : G →* G') (hφ : ContMDiff I I' ∞ (φ : G → G')), lieMap φ hφ = f := sorry

/-! ### Layer 5: simply-connected covers and the enveloping algebra -/

/-- **The simply-connected (universal) cover** of a connected Lie group: a simply-connected Lie group
`G̃` with a covering homomorphism `p : G̃ →* G` inducing a Lie-algebra isomorphism. Stated as existence. -/
theorem exists_universalCover
    {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
    [Group G] [LieGroup I ∞ G] [ConnectedSpace G] :
    ∃ (Gt : Type w) (_ : TopologicalSpace Gt) (_ : ChartedSpace H Gt) (_ : IsManifold I ∞ Gt)
      (_ : Group Gt) (_ : LieGroup I ∞ Gt) (p : Gt →* G),
      SimplyConnectedSpace Gt ∧ IsCoveringMap (p : Gt → G) := sorry

/-- **The universal enveloping algebra of `Lie(G)`** is Mathlib's `UniversalEnvelopingAlgebra ℝ 𝔤`, the
left-invariant differential operators on `G`. PBW is `../LieHighestWeight/README.md`'s target; here we
pin the object (its universal property is `UniversalEnvelopingAlgebra.lift`). -/
noncomputable example
    {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
    [Group G] [LieGroup I ∞ G] :
    Type _ := UniversalEnvelopingAlgebra ℝ (LeftInvariantDerivation I G)

/-! ## C. The structure of compact and reductive Lie groups -/

/-! ### Layer 6: maximal tori, the Weyl group, and Weyl integration -/

section Structure

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
  [Group G] [LieGroup I ∞ G]

/-- **A torus** is a compact connected abelian subgroup; **`IsMaximalTorus T`** is a torus maximal
under inclusion. The body is purely topological-group-theoretic: Cartan's closed-subgroup theorem
(Layer 3) upgrades a maximal torus to an embedded Lie subgroup, so no smooth structure needs to be
carried in the predicate. -/
def IsMaximalTorus (T : Subgroup G) : Prop :=
  (IsCompact (T : Set G) ∧ IsConnected (T : Set G) ∧ ∀ x ∈ T, ∀ y ∈ T, x * y = y * x) ∧
    ∀ T' : Subgroup G,
      (IsCompact (T' : Set G) ∧ IsConnected (T' : Set G) ∧ ∀ x ∈ T', ∀ y ∈ T', x * y = y * x) →
      T ≤ T' → T' = T

/-- **Torus exhaustion** for a compact connected group: every element lies in some maximal torus. On
`U(n)` this is the spectral theorem. -/
theorem exists_mem_maximalTorus [CompactSpace G] [ConnectedSpace G] (g : G) :
    ∃ T : Subgroup G, IsMaximalTorus T ∧ g ∈ T := sorry

/-- **Conjugacy of maximal tori** for a compact connected group (stated as conjugacy of the underlying
sets). -/
theorem isConj_of_isMaximalTorus [CompactSpace G] [ConnectedSpace G]
    {S T : Subgroup G} (hS : IsMaximalTorus S) (hT : IsMaximalTorus T) :
    ∃ g : G, (S : Set G) = (fun x => g * x * g⁻¹) '' (T : Set G) := sorry

/-- Consequently `lieExp` is **surjective** for compact connected `G`. -/
theorem lieExp_surjective [CompactSpace G] [ConnectedSpace G] :
    Function.Surjective (lieExp (I := I) (G := G)) := sorry

/-- **The Weyl group** `weylGroup T = N_G(T) / T`, a finite group acting faithfully on `T`. In the
reductive case it is isomorphic to `RootPairing.weylGroup` of the root system. Now a real
definition: the quotient of the normalizer by `T` (the `Group` instance is automatic, since
`T.subgroupOf T.normalizer` is normal by `Subgroup.normal_in_normalizer`); purely group-theoretic,
so it is also usable for the Layer-8 Bruhat statement. -/
abbrev weylGroup (T : Subgroup G) : Type w :=
  ↥(Subgroup.normalizer T) ⧸ Subgroup.subgroupOf T (Subgroup.normalizer T)

noncomputable instance (T : Subgroup G) : Group (weylGroup T) :=
  inferInstanceAs
    (Group (↥(Subgroup.normalizer T) ⧸ Subgroup.subgroupOf T (Subgroup.normalizer T)))

theorem finite_weylGroup [CompactSpace G] [ConnectedSpace G] (T : Subgroup G) (hT : IsMaximalTorus T) :
    Finite (weylGroup T) := sorry

/-- **`Ad` of a torus element preserves `Lie(T)`** — the first link in the Weyl-density chain. -/
theorem ad_lieSubalgebraOfSubgroup_le (T : Subgroup G) (t : T) :
    (lieSubalgebraOfSubgroup (I := I) T).toSubmodule ≤
      (lieSubalgebraOfSubgroup (I := I) T).toSubmodule.comap
        ((Ad (I := I) ((t : G)⁻¹)).toLinearEquiv.toLinearMap - LinearMap.id) := sorry

/-- **The Weyl density**, a genuine definition rather than a free parameter:
`D(t) = |det_ℝ((Ad(t⁻¹) − 1) on 𝔤 / Lie(T))|`, pinned by `weylDensity_eq_det` below; equal to the
positive-root form `∏_{α>0} |1 − α(t)⁻¹|²` once the root system is attached (companion identity). -/
noncomputable def weylDensity (T : Subgroup G) (t : T) : ℝ :=
  |LinearMap.det
      (Submodule.mapQ _ _
        ((Ad (I := I) ((t : G)⁻¹)).toLinearEquiv.toLinearMap - LinearMap.id)
        (ad_lieSubalgebraOfSubgroup_le (I := I) T t))|

/-- The density is continuous (with measurability as the corollary the integral needs). -/
theorem weylDensity_continuous (T : Subgroup G) [CompactSpace G] :
    Continuous (weylDensity (I := I) T) := sorry

/-- **The general Weyl integration formula**: for a continuous class function `f` on a compact
connected `G` with maximal torus `T`, `∫_G f dμ_G = |W|⁻¹ ∫_T f · D dμ_T` with `D = weylDensity`
(equal to `∏_{α>0} |1 - α(t)⁻¹|²`). Reduces integration over `G` to `T`; the general form of the
`SU(2)` formula of `../CompactGroups/README.md`. The measures are **pinned as normalized Haar** —
with free `μG`, `μT`, and density the formula would be false (`f = 1`, density `0`) — and the
density is the genuine `weylDensity` above. Continuous class functions are the honest first
statement; the `Integrable` generalization is a corollary once the density's boundedness is known. -/
theorem weyl_integration_formula [CompactSpace G] [ConnectedSpace G]
    [MeasurableSpace G] [BorelSpace G]
    (T : Subgroup G) (hT : IsMaximalTorus T) [MeasurableSpace T] [BorelSpace T]
    (μG : MeasureTheory.Measure G) [μG.IsHaarMeasure] [MeasureTheory.IsProbabilityMeasure μG]
    (μT : MeasureTheory.Measure T) [μT.IsHaarMeasure] [MeasureTheory.IsProbabilityMeasure μT]
    (f : G → ℝ) (hf : ∀ g x : G, f (x * g * x⁻¹) = f g) (hf_cont : Continuous f) :
    ∫ g, f g ∂μG
      = (Nat.card (weylGroup T) : ℝ)⁻¹
        * ∫ t, f (t : G) * weylDensity (I := I) T t ∂μT := sorry

end Structure

/-! ### Layer 7: complexification and real forms

Because the complexification `G_ℂ` is not yet built, its group and complex-Lie-group structure is
carried by the existential rather than assumed on an opaque carrier. -/

section Complexification

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
  [Group G] [LieGroup I ∞ G]

/-- **The complexification** `G_ℂ` of a compact (or real reductive) Lie group: a complex Lie group with
`Lie(G_ℂ) = 𝔤 ⊗_ℝ ℂ` and `G` a maximal compact subgroup, universal among homomorphisms of `G` into
complex Lie groups. Stated as existence of a complex Lie group with a continuous homomorphism from `G`.
On the classical groups `(U(n))_ℂ = GL_n(ℂ)`, `(SU(n))_ℂ = SL_n(ℂ)`. -/
theorem exists_complexification [CompactSpace G] [ConnectedSpace G] :
    ∃ (Ec : Type u) (_ : NormedAddCommGroup Ec) (_ : NormedSpace ℂ Ec)
      (Hc : Type v) (_ : TopologicalSpace Hc) (Ic : ModelWithCorners ℂ Ec Hc)
      (Gc : Type w) (_ : TopologicalSpace Gc) (_ : ChartedSpace Hc Gc) (_ : IsManifold Ic ∞ Gc)
      (_ : Group Gc) (_ : LieGroup Ic ∞ Gc) (ι : G →* Gc),
      Continuous (ι : G → Gc) ∧ Function.Injective ι ∧
      -- The universal property: every continuous homomorphism of `G` into a complex Lie group
      -- factors uniquely and smoothly through `ι`. Without it (or the `Lie(G_ℂ) = 𝔤 ⊗ ℂ`
      -- condition) the bare existential is vacuous — the trivial group satisfies it.
      ∀ (Ec' : Type u) (_ : NormedAddCommGroup Ec') (_ : NormedSpace ℂ Ec')
        (Hc' : Type v) (_ : TopologicalSpace Hc') (Ic' : ModelWithCorners ℂ Ec' Hc')
        (Gc' : Type w) (_ : TopologicalSpace Gc') (_ : ChartedSpace Hc' Gc')
        (_ : IsManifold Ic' ∞ Gc') (_ : Group Gc') (_ : LieGroup Ic' ∞ Gc')
        (φ : G →* Gc'), Continuous (φ : G → Gc') →
        ∃! ψ : Gc →* Gc', ContMDiff Ic Ic' ∞ (ψ : Gc → Gc') ∧ ψ.comp ι = φ := sorry

/-- **Reps of compact `G` ↔ holomorphic reps of `G_ℂ`** (Weyl's unitary trick at the group level): every
finite-dimensional representation of a compact `G` extends to a holomorphic representation of `G_ℂ`.
Representations land in the invertible operators `GL(V) = (V →L[ℂ] V)ˣ` (a group), not in all of
`V →L[ℂ] V`. Stated as extendability of a continuous representation along a homomorphism into a complex
Lie group; the holomorphy of the extension is the accompanying milestone in `README.md`. -/
theorem exists_holomorphic_extension [CompactSpace G] [ConnectedSpace G]
    {V : Type u} [NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V]
    {Ec : Type u} [NormedAddCommGroup Ec] [NormedSpace ℂ Ec]
    {Hc : Type v} [TopologicalSpace Hc] {Ic : ModelWithCorners ℂ Ec Hc}
    {Gc : Type w} [TopologicalSpace Gc] [ChartedSpace Hc Gc] [IsManifold Ic ∞ Gc]
    [Group Gc] [LieGroup Ic ∞ Gc] (ι : G →* Gc) (hι : Continuous (ι : G → Gc))
    (hινj : Function.Injective ι)
    -- `Gc` must actually be the complexification: an injective continuous `ι` alone is not enough
    -- (embed `U(1)` in `SL₂(ℂ)`: its weight-one character extends to no holomorphic character of
    -- `SL₂(ℂ)`). The universal property is consumed as a hypothesis, matching the conclusion of
    -- `exists_complexification`.
    (huniv : ∀ (Ec' : Type u) (_ : NormedAddCommGroup Ec') (_ : NormedSpace ℂ Ec')
      (Hc' : Type v) (_ : TopologicalSpace Hc') (Ic' : ModelWithCorners ℂ Ec' Hc')
      (Gc' : Type w) (_ : TopologicalSpace Gc') (_ : ChartedSpace Hc' Gc')
      (_ : IsManifold Ic' ∞ Gc') (_ : Group Gc') (_ : LieGroup Ic' ∞ Gc')
      (φ : G →* Gc'), Continuous (φ : G → Gc') →
      ∃! ψ : Gc →* Gc', ContMDiff Ic Ic' ∞ (ψ : Gc → Gc') ∧ ψ.comp ι = φ)
    (ρ : G →* (V →L[ℂ] V)ˣ) (hρ : Continuous (ρ : G → (V →L[ℂ] V)ˣ)) :
    ∃ ρc : Gc →* (V →L[ℂ] V)ˣ,
      ρc.comp ι = ρ ∧
      -- Holomorphy of the extension, stated on the underlying operator-valued map against the
      -- complex model: this (with `Gc` a genuine complexification, carried by the hypotheses
      -- rather than an inner existential) is what removes the `Gc := G, ι := id` vacuity.
      ContMDiff Ic 𝓘(ℂ, V →L[ℂ] V) ∞ (fun g : Gc => ((ρc g : (V →L[ℂ] V)ˣ) : V →L[ℂ] V)) := sorry

end Complexification

/-! ### Layer 8: Borel-Weil, flag manifolds, and Bruhat

Stated for an abstract complex reductive group `Gc` with a Borel subgroup `B`; the identification of `Gc`
as `G_ℂ` is Layer 7's, and the target module `L(λ)` is `../LieHighestWeight/README.md`'s. -/

/-- **The flag manifold** `G_ℂ / B`, a compact complex manifold; here the underlying `Gc`-homogeneous
coset space. -/
def flagManifold (Gc : Type w) [Group Gc] (B : Subgroup Gc) : Type w := Gc ⧸ B

/-- **A Tits system (BN-pair)** on `(B, T)` with simple reflections `S ⊆ N(T)/T`: the elementary
group-theoretic axioms (generation, involutive generators, the exchange inclusion, and
non-normalization) from which the Bruhat decomposition follows. This is the bundled datum standing
in for "complex reductive `Gc`, Borel `B ⊇ T` maximal" — for such groups the axioms hold, but they
are statable with no reductive API, which is what lets the decomposition below be a true theorem
rather than a milestone shape. -/
structure IsTitsSystem {Gc : Type w} [Group Gc] (B T : Subgroup Gc)
    (S : Set (weylGroup T)) : Prop where
  t_le_b : T ≤ B
  closure_eq_top :
    Subgroup.closure ((B : Set Gc) ∪ (Subgroup.normalizer (T : Set Gc) : Set Gc)) = ⊤
  gen_weyl : Subgroup.closure S = ⊤
  sq_one : ∀ s ∈ S, s * s = 1
  exchange : ∀ s ∈ S, ∀ ns nw : ↥(Subgroup.normalizer (T : Set Gc)),
    (QuotientGroup.mk ns :
        ↥(Subgroup.normalizer (T : Set Gc))
          ⧸ Subgroup.subgroupOf T (Subgroup.normalizer (T : Set Gc))) = s →
    ({((ns : ↥(Subgroup.normalizer (T : Set Gc))) : Gc)} : Set Gc) * (B : Set Gc)
        * {((nw : ↥(Subgroup.normalizer (T : Set Gc))) : Gc)}
      ⊆ (B : Set Gc) * {((ns : Gc) : Gc) * ((nw : Gc) : Gc)} * (B : Set Gc)
        ∪ (B : Set Gc) * {((nw : Gc) : Gc)} * (B : Set Gc)
  not_le : ∀ s ∈ S, ∀ ns : ↥(Subgroup.normalizer (T : Set Gc)),
    (QuotientGroup.mk ns :
        ↥(Subgroup.normalizer (T : Set Gc))
          ⧸ Subgroup.subgroupOf T (Subgroup.normalizer (T : Set Gc))) = s →
    ¬ ((fun x => ((ns : Gc) : Gc) * x * (((ns : Gc) : Gc))⁻¹) '' (B : Set Gc) ⊆ (B : Set Gc))

/-- **The Bruhat decomposition** `G_ℂ = ⨆_{w ∈ W} B w B` for a Tits system: every element lies in
some double coset `B w B`, with `W = N(T)/T` and `rep` a genuine section. The Tits-system
hypothesis is what makes this true (with a bare `T ≤ B` the union can be a proper subgroup — take
`B = T` self-normalizing); disjointness over `W` and the cell-dimension formula `dim BwB/B = ℓ(w)`
remain in `README.md`. -/
theorem bruhat_decomposition {Gc : Type w} [Group Gc] (B T : Subgroup Gc)
    (S : Set (weylGroup T)) (hBN : IsTitsSystem B T S)
    (rep : weylGroup T → Gc)
    (hrep : ∀ w : weylGroup T, ∃ n : ↥(Subgroup.normalizer (T : Set Gc)),
      (QuotientGroup.mk n :
          ↥(Subgroup.normalizer (T : Set Gc))
            ⧸ Subgroup.subgroupOf T (Subgroup.normalizer (T : Set Gc))) = w ∧
      rep w = ((n : ↥(Subgroup.normalizer (T : Set Gc))) : Gc)) :
    ∀ g : Gc, ∃ w : weylGroup T, g ∈ (B : Set Gc) * ({rep w} : Set Gc) * (B : Set Gc) := sorry

/-- **The Borel-Weil theorem**: for a dominant integral weight given by a character `lam : B →* ℂˣ` of
the Borel, the space of holomorphic sections of the line bundle `L_λ = G_ℂ ×_B ℂ_{-λ}` over `G_ℂ / B`
is, as a `G_ℂ`-representation, the irreducible `L(λ)` of `../LieHighestWeight/README.md`. The Borel and
line-bundle conventions are fixed in `README.md`, since the opposite Borel or the character `-λ` realizes
the dual `L(λ)^*`. `borelWeilSpace lam` is that section space; the milestone (in `README.md`) is its
isomorphism with `L(λ)`. A new object. -/
def borelWeilSpace {Gc : Type w} [Group Gc] (B : Subgroup Gc) (lam : B →* ℂˣ) : Type w := sorry

noncomputable instance {Gc : Type w} [Group Gc] (B : Subgroup Gc) (lam : B →* ℂˣ) :
    AddCommGroup (borelWeilSpace B lam) := sorry

noncomputable instance {Gc : Type w} [Group Gc] (B : Subgroup Gc) (lam : B →* ℂˣ) :
    Module ℂ (borelWeilSpace B lam) := sorry

/-- The `Gc`-action on holomorphic sections by left translation. -/
noncomputable def borelWeilRep {Gc : Type w} [Group Gc] (B : Subgroup Gc) (lam : B →* ℂˣ) :
    Representation ℂ Gc (borelWeilSpace B lam) := sorry

/-- **The algebraic induced-function model** of the section space (a real definition): the
`B`-equivariant functions `f (g b) = lam(b)⁻¹ f g`, the space `L_λ`-sections live in once
holomorphy is imposed. -/
def borelWeilSpaceAlg {Gc : Type w} [Group Gc] (B : Subgroup Gc) (lam : B →* ℂˣ) :
    Submodule ℂ (Gc → ℂ) where
  carrier := {f | ∀ (g : Gc) (b : B), f (g * (b : Gc)) = (((lam b)⁻¹ : ℂˣ) : ℂ) * f g}
  add_mem' := by
    intro f₁ f₂ h₁ h₂ g b
    simp [h₁ g b, h₂ g b, mul_add]
  zero_mem' := by intro g b; simp
  smul_mem' := by
    intro c f hf g b
    simp only [Pi.smul_apply, hf g b, smul_eq_mul]
    ring

/-- **The Borel-Weil anti-vacuity pin**: `borelWeilSpace` embeds `Gc`-equivariantly into the
algebraic model, with the translation action `(g · f) x = f (g⁻¹ x)` on the target. This ties the
opaque holomorphic-section carrier to a concrete space (an opaque carrier alone could be
discharged by any representation whatsoever). The **summit** — finite-dimensionality,
irreducibility, and the identification with `../LieHighestWeight`'s `L(λ)` — additionally needs
`Gc` reductive, `B` a Borel, and `lam` dominant; those hypotheses are not yet expressible here, so
per the second review pass the summit statements stay in `README.md` rather than being pinned
falsely over arbitrary `(Gc, B, lam)`. -/
theorem borelWeilSpace_embeds {Gc : Type w} [Group Gc] (B : Subgroup Gc) (lam : B →* ℂˣ) :
    ∃ ψ : borelWeilSpace B lam →ₗ[ℂ] ↥(borelWeilSpaceAlg B lam),
      Function.Injective ψ ∧
      ∀ (g : Gc) (f : borelWeilSpace B lam) (x : Gc),
        (ψ (borelWeilRep B lam g f) : Gc → ℂ) x = (ψ f : Gc → ℂ) (g⁻¹ * x) := sorry

/-! ### Layer 9: the Cartan, Iwasawa, and KAK decompositions

These decompositions are false for arbitrary subgroups of an arbitrary Lie group: they hold only for a
real reductive `G` and a genuine Iwasawa triple / restricted-root chamber. The predicates below carry
that structure, and the theorems consume it rather than assert a factorization for bare subgroups. -/

section RealReductive

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
  [Group G] [LieGroup I ∞ G]

/-- **A Cartan involution datum** for `G`: a smooth involutive automorphism `θ` with compact fixed
set, **together with the reductivity of `𝔤`** (center and derived algebra complementary, derived
algebra semisimple). The reductivity fields are essential and not implied by the involution data:
the Euclidean motion group carries the involution `(v, k) ↦ (−v, k)` with compact fixed group
`O(n)` yet has a noncentral translation radical. -/
structure CartanInvolution (I : ModelWithCorners ℝ E H) (G : Type w) [TopologicalSpace G]
    [ChartedSpace H G] [IsManifold I ∞ G] [Group G] [LieGroup I ∞ G] where
  θ : G ≃* G
  smooth : ContMDiff I I ∞ (θ : G → G)
  involutive : ∀ g : G, θ (θ g) = g
  compact_fixed : IsCompact {g : G | θ g = g}
  reductive_compl :
    IsCompl (LieAlgebra.center ℝ (LeftInvariantDerivation I G)).toSubmodule
      (LieAlgebra.derivedSeries ℝ (LeftInvariantDerivation I G) 1).toSubmodule
  derived_semisimple :
    LieAlgebra.IsSemisimple ℝ ↥(LieAlgebra.derivedSeries ℝ (LeftInvariantDerivation I G) 1)

/-- **`IsRealReductive I G`**: `G` carries a Cartan involution datum (with `𝔤 = 𝔨 ⊕ 𝔭` the
`±1`-eigenspace decomposition of its differential). -/
def IsRealReductive (I : ModelWithCorners ℝ E H) (G : Type w) [TopologicalSpace G]
    [ChartedSpace H G] [IsManifold I ∞ G] [Group G] [LieGroup I ∞ G] : Prop :=
  Nonempty (CartanInvolution I G)

/-- **Iwasawa data** for `G`: a Cartan involution, `K` its fixed subgroup, a maximal abelian
`𝔞 ⊆ 𝔭` (the `−1`-eigenspace of `dθ = lieMap θ`), `A = lieExp 𝔞`, a closed nilpotent `N` normalized
by `𝔞` completing the Lie-algebra Iwasawa decomposition `𝔤 = 𝔨 ⊕ 𝔞 ⊕ 𝔫`, and the closed positive
chamber (a cone in `𝔞` recording the positivity choice; its full restricted-root characterization
is the companion target once the restricted root system is attached). Bundled as a structure —
none of this is expressible on bare subgroups, which is what left the previous predicates opaque. -/
structure IwasawaData (I : ModelWithCorners ℝ E H) (G : Type w) [TopologicalSpace G]
    [ChartedSpace H G] [IsManifold I ∞ G] [Group G] [LieGroup I ∞ G] where
  cartan : CartanInvolution I G
  K : Subgroup G
  K_eq_fixed : (K : Set G) = {g : G | cartan.θ g = g}
  𝔞 : Submodule ℝ (LeftInvariantDerivation I G)
  𝔞_in_p : ∀ X ∈ 𝔞, lieMap cartan.θ.toMonoidHom cartan.smooth X = -X
  𝔞_abelian : ∀ X ∈ 𝔞, ∀ Y ∈ 𝔞, ⁅X, Y⁆ = 0
  𝔞_maximal : ∀ 𝔞' : Submodule ℝ (LeftInvariantDerivation I G),
    (∀ X ∈ 𝔞', lieMap cartan.θ.toMonoidHom cartan.smooth X = -X) →
    (∀ X ∈ 𝔞', ∀ Y ∈ 𝔞', ⁅X, Y⁆ = 0) → 𝔞 ≤ 𝔞' → 𝔞' = 𝔞
  A : Subgroup G
  A_eq : (A : Set G) = lieExp (I := I) '' 𝔞
  N : Subgroup G
  N_closed : IsClosed (N : Set G)
  N_connected : IsConnected (N : Set G)
  /-- `N` is globally the exponential of its Lie algebra — with connectedness, this is what rules
  out discrete counterfeits (e.g. `ℤ` inside `ℝ`) whose Lie algebra satisfies the complement
  fields while the global factorization fails. -/
  N_exp : (N : Set G)
    = lieExp (I := I) '' ((lieSubalgebraOfSubgroup (I := I) N).toSubmodule : Set (LeftInvariantDerivation I G))
  /-- `lieExp` is injective on `𝔞` (global uniqueness of the `A`-factor). -/
  A_exp_injOn : Set.InjOn (lieExp (I := I)) (𝔞 : Set (LeftInvariantDerivation I G))
  N_normalized : ∀ X ∈ 𝔞, ∀ Y ∈ (lieSubalgebraOfSubgroup (I := I) N).toSubmodule,
    ⁅X, Y⁆ ∈ (lieSubalgebraOfSubgroup (I := I) N).toSubmodule
  iwasawa_disjoint : Disjoint (lieSubalgebraOfSubgroup (I := I) K).toSubmodule 𝔞
  iwasawa_compl :
    IsCompl ((lieSubalgebraOfSubgroup (I := I) K).toSubmodule ⊔ 𝔞)
      (lieSubalgebraOfSubgroup (I := I) N).toSubmodule
  chamber : Set (LeftInvariantDerivation I G)
  chamber_subset : chamber ⊆ (𝔞 : Set (LeftInvariantDerivation I G))
  chamber_cone : ∀ X ∈ chamber, ∀ Y ∈ chamber, X + Y ∈ chamber
  chamber_smul : ∀ X ∈ chamber, ∀ c : ℝ, 0 ≤ c → c • X ∈ chamber
  /-- The chamber is a **full** cone: it spans `𝔞` (an empty or lower-dimensional cone would
  trivialize the KAK factorization below). That it also meets every restricted-Weyl orbit is the
  companion condition, stated once the restricted root system is attached. -/
  chamber_span : Submodule.span ℝ chamber = 𝔞

/-- **`IsIwasawaTriple K A N`**: `(K, A, N)` are the subgroups of some Iwasawa datum. The
existential wrapper keeps the consuming decomposition theorems' signatures stable. -/
def IsIwasawaTriple (K A N : Subgroup G) : Prop :=
  ∃ D : IwasawaData I G, D.K = K ∧ D.A = A ∧ D.N = N

/-- **`IsPositiveRestrictedChamber Aplus`**: `Aplus` is the `lieExp` image of the closed positive
chamber of some Iwasawa datum. -/
def IsPositiveRestrictedChamber (Aplus : Set G) : Prop :=
  ∃ D : IwasawaData I G, Aplus = lieExp (I := I) '' D.chamber

/-- **The Iwasawa decomposition** `G = KAN`: for a real reductive `G` and an Iwasawa triple `(K, A, N)`,
the multiplication `K × A × N → G` is a diffeomorphism. Stated as existence and uniqueness of the
factorization `g = k a n`. -/
theorem iwasawaDecomposition (hG : IsRealReductive I G)
    (K A N : Subgroup G) (hKAN : IsIwasawaTriple (I := I) K A N) :
    ∀ g : G, ∃! p : K × A × N, g = (p.1 : G) * (p.2.1 : G) * (p.2.2 : G) := sorry

/-- **The KAK (Cartan) decomposition** `G = K · closure(A⁺) · K`: for a real reductive `G`, maximal
compact `K`, and the positive restricted chamber, every `g` factors as `k₁ a k₂` with `a` in the
exponential of the chamber — with `K` and the chamber drawn from the **same** Iwasawa datum (with
independent `K`/`Aplus` arguments the statement would relate unrelated witnesses, and an empty
chamber would falsify it; `chamber_span` in the datum rules that out). Uniqueness up to the
restricted Weyl group and the restricted root system are in `README.md`. -/
theorem kakDecomposition (D : IwasawaData I G) :
    ∀ g : G, ∃ (k₁ k₂ : D.K) (a : G),
      a ∈ lieExp (I := I) '' D.chamber ∧ g = (k₁ : G) * a * (k₂ : G) := sorry

/-- **The global Cartan (polar) decomposition** `G = K · exp 𝔭` (summit pin, previously
README-only): for a Cartan involution datum, every `g` factors uniquely as `k · lieExp X` with
`θ k = k` and `X` in the `−1`-eigenspace `𝔭` of `dθ`. -/
theorem cartan_polar_decomposition (D : CartanInvolution I G) (g : G) :
    ∃! p : {k : G // D.θ k = k} ×
        {X : LeftInvariantDerivation I G // lieMap D.θ.toMonoidHom D.smooth X = -X},
      g = (p.1 : G) * lieExp (I := I) (p.2 : LeftInvariantDerivation I G) := sorry

end RealReductive

end TauCetiRoadmap.RepresentationTheory.LieGroups
