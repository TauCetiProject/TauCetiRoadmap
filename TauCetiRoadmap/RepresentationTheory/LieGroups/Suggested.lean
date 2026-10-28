import Mathlib
import TauCeti.Geometry.Lie.Tangent.LieEquiv
import TauCeti.Geometry.Lie.Exponential.Basic
import TauCeti.Geometry.Lie.Adjoint.Derivation
import TauCeti.Geometry.Lie.Adjoint.Exponential.Basic
import TauCeti.Geometry.Lie.Functor
import TauCeti.Geometry.Lie.Subgroup.LieAlgebra
import TauCeti.Geometry.Lie.Exponential.BCH
import TauCeti.Geometry.Lie.Exponential.Units.Basic
import TauCeti.Algebra.Lie.Derivation.Basic
import TauCeti.Algebra.Octonion.Basic
import TauCeti.Algebra.Octonion.Derivation
import TauCeti.Topology.Algebra.Group.Heisenberg
import TauCeti.Algebra.Lie.Heisenberg
import TauCeti.RepresentationTheory.Compact.Circle
import TauCeti.AlgebraicTopology.UniversalCover.RealProjective.FundamentalGroup.Classification
import TauCeti.AlgebraicTopology.UniversalCover.Torus.FundamentalGroup
import TauCeti.RepresentationTheory.Compact.UnitaryModel
import TauCeti.RepresentationTheory.Continuous.OrthogonalDecomposition

/-!
# Lie groups and the Lie algebra correspondence: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.
Layer5N's separate `BanachNonintegrabilityTargets.lean` illustrates its native C¹-loop,
central-cocycle, quotient-coordinate and actual tangent-Lie obstruction interfaces. It imports
this file; this file does not import that companion.

Mathlib supplies the `LieGroup` class, `LeftInvariantDerivation`, `GroupLieAlgebra`, `LieAlgebra.ad`,
Banach/matrix/circle exponentials, concrete matrix groups, and the covering/enveloping APIs. The Tau
Ceti modules imported above additionally supply the actual derivation-based Lie exponential, adjoint,
Lie map, subgroup Lie-algebra carrier and local BCH germ. This file states roadmap interfaces and
remaining constructions; it does not claim those native modules are absent.

The design follows the three deliverables of `README.md`: **A** the Lie functor from groups to algebras
(`TauCeti.lieExp`, `TauCeti.oneParameterSubgroup`, `Ad`, `IsEmbeddedLieSubgroup`, `lieMap`, `bch`); **B** integrating
algebras to groups (`lieSubalgebraOfSubgroup`, Lie's third theorem, the equivalence of categories,
simply-connected covers, `UniversalEnvelopingAlgebra`); **C** the structure theory (`IsMaximalTorus`,
torus exhaustion, `weylGroup`, Weyl integration, `Complexification`, `holomorphicEquivariantFunctionSpace`,
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
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

/-- The evaluation `LeftInvariantDerivation.evalAt (1 : G)` realizes a left-invariant derivation as a
point derivation at `1`, a linear map `𝔤 →ₗ[ℝ] PointDerivation I (1 : G)`. This is the first half of the
identification of `𝔤` with `T₁G`; its inverse builds a left-invariant vector field from a tangent
vector and checks that its derivation is smooth and left-invariant. -/
noncomputable def evalAtOne (I : ModelWithCorners ℝ E H) (G : Type w) [TopologicalSpace G]
    [ChartedSpace H G] [IsManifold I ∞ G] [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G] :
    LeftInvariantDerivation I G →ₗ[ℝ] PointDerivation I (1 : G) := LeftInvariantDerivation.evalAt 1

/-- Point derivations at `1` are the tangent space `T₁G`. For a finite-dimensional `C^∞` real manifold
the derivations at a point coincide with the tangent vectors (`Geometry/Manifold/DerivationBundle.lean`
records that this fails in general), so this equivalence is where finite-dimensionality enters. -/
noncomputable def pointDerivationTangentEquiv (I : ModelWithCorners ℝ E H) (G : Type w)
    [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G] [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G] :
    PointDerivation I (1 : G) ≃ₗ[ℝ] TangentSpace I (1 : G) :=
  pointDerivationEquivTangentSpace (I := I) 1 BoundarylessManifold.isInteriorPoint

/-- The Lie algebra `𝔤 = Lie(G)` is Mathlib's `LeftInvariantDerivation I G`; at the identity it is the
tangent space `T₁G`. The equivalence is `evalAtOne` (into point derivations) followed by
`pointDerivationTangentEquiv`; the content is that `evalAtOne` is a bijection, so `finrank ℝ 𝔤 =
finrank ℝ E` is available only after this is established. -/
noncomputable def lieAlgebraTangentEquiv (I : ModelWithCorners ℝ E H) (G : Type w) [TopologicalSpace G]
    [ChartedSpace H G] [IsManifold I ∞ G] [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G] :
    LeftInvariantDerivation I G ≃ₗ[ℝ] TangentSpace I (1 : G) :=
  leftInvariantDerivationEquivGroupLieAlgebra (I := I) (G := G) BoundarylessManifold.isInteriorPoint

/-- The native exponential `lieExp : 𝔤 → G`, defined by the time-one invariant integral curve.
This wrapper reuses `_root_.lieExp`. Under the same finite-dimensional real `LieGroup I ∞ G`,
`T2Space` and boundaryless hypotheses, consume `_root_.contMDiff_lieExp` and
`_root_.isLocalDiffeomorphAt_lieExp_zero`; their native statements already use the canonical
normed model on the derivation algebra. The matrix/unit/circle comparisons and continuous
one-parameter-subgroup classification retain their separate README scopes. -/
noncomputable def lieExp [T2Space G] [BoundarylessManifold I G]
    (X : LeftInvariantDerivation I G) : G := _root_.lieExp X

theorem lieExp_zero [T2Space G] [BoundarylessManifold I G] :
    lieExp (I := I) (0 : LeftInvariantDerivation I G) = (1 : G) := _root_.lieExp_zero

/-- The native one-parameter subgroup law. -/
theorem lieExp_add_smul [T2Space G] [BoundarylessManifold I G]
    (X : LeftInvariantDerivation I G) (s t : ℝ) :
    lieExp ((s + t) • X) = lieExp (s • X) * lieExp (t • X) := _root_.lieExp_add_smul X s t

/-- **One-parameter subgroups** as smooth homomorphisms `ℝ → G`. Every continuous homomorphism `ℝ → G`
arises this way for a unique `X`, giving the bijection `Hom_cont(ℝ, G) ≃ 𝔤`. -/
noncomputable def oneParameterSubgroup [T2Space G] [BoundarylessManifold I G]
    (X : LeftInvariantDerivation I G) : ℝ → G := fun t => _root_.oneParameterSubgroup X (Multiplicative.ofAdd t)

/-- **One-parameter subgroups**: every continuous one-parameter subgroup
`φ : ℝ → G` is `t ↦ lieExp (t • X)` for a unique `X ∈ 𝔤` — the content of the bijection
`Hom_cont(ℝ, G) ≃ 𝔤`. -/
theorem oneParameterSubgroup_existsUnique (φ : ℝ → G) (hcont : Continuous φ)
    (hhom : ∀ s t : ℝ, φ (s + t) = φ s * φ t) :
    ∃! X : LeftInvariantDerivation I G, ∀ t : ℝ, φ t = lieExp (I := I) (t • X) := sorry

end LieGroup

/-! ### Layer 0 (worked shadow): the exponential of the units of a Banach algebra

For finite-dimensional real normed R, the derivation-based `Lie(Rˣ) ≃ R` and abstract
`lieExp` comparison use native Units.Compatibility. For complete normed algebras the unit
exponential and its norm-based/tangent one-parameter identities have their general hypotheses. -/

section BanachExp

variable {R : Type u} [NormedRing R] [NormedAlgebra ℝ R] [CompleteSpace R]

/-- The norm-based unit exponential for a complete real normed algebra. Its comparison
with the abstract derivation-based `lieExp` uses finite-dimensional R, as specified above.
The coercion `(expUnits x : R)` is the Banach-algebra exponential. -/
noncomputable def expUnits (x : R) : Rˣ := by
  letI : NormedAlgebra ℚ R := NormedAlgebra.restrictScalars ℚ ℝ R
  exact TauCeti.expUnit x

theorem expUnits_coe (x : R) : (expUnits x : R) = NormedSpace.exp x := by
  letI : NormedAlgebra ℚ R := NormedAlgebra.restrictScalars ℚ ℝ R
  exact TauCeti.expUnit_coe x

theorem exp_add_smul (x : R) (s t : ℝ) :
    NormedSpace.exp ((s + t) • x) = NormedSpace.exp (s • x) * NormedSpace.exp (t • x) := sorry

end BanachExp

/-! ### Layer 1: the adjoint representations `Ad` and `ad` -/

section Adjoint

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

/-- **The group adjoint** `Ad : G → (𝔤 ≃ₗ⁅ℝ⁆ 𝔤)`, the differential at `1` of conjugation `x ↦ g x g⁻¹`;
a Lie-algebra automorphism, and `Ad : G →* (𝔤 ≃ₗ⁅ℝ⁆ 𝔤)` a smooth representation (the adjoint
representation). Its differential at `1` is Mathlib's `LieAlgebra.ad ℝ 𝔤` (`ad = d(Ad)`, the geometric
meaning of the bracket; see `README.md`, Layer 1). On matrix groups `Ad g X = g X g⁻¹`. -/
noncomputable def Ad (g : G) :
    LeftInvariantDerivation I G ≃ₗ⁅ℝ⁆ LeftInvariantDerivation I G := TauCeti.Lie.Ad g

/-- `Ad` is a group homomorphism into the Lie-algebra automorphisms. -/
theorem Ad_mul (g h : G) :
    Ad (I := I) (g * h) = (Ad (I := I) h).trans (Ad (I := I) g) := by
  change TauCeti.Lie.Ad (g * h) = (TauCeti.Lie.Ad h).trans (TauCeti.Lie.Ad g)
  exact TauCeti.Lie.Ad_mul g h

/-- **The conjugation formula** `g · lieExp X · g⁻¹ = lieExp (Ad g X)`. -/
theorem conj_lieExp (g : G) (X : LeftInvariantDerivation I G) :
    g * lieExp X * g⁻¹ = lieExp (Ad g X) := by
  simpa [lieExp, Ad] using TauCeti.Lie.conj_lieExp g X

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
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

/-- The native carrier is the LieSpan generated by directions `X` whose entire one-parameter subgroup lies in `K`. For closed `K`, the closed-subgroup theorem identifies this carrier with the embedded subgroup's Lie algebra. For arbitrary, possibly nonclosed `K`, equality with `{X | ∀ t, lieExp (t • X) ∈ K}` is a separate Layer 2 construction and is not the native definition. -/
noncomputable def lieSubalgebraOfSubgroup (K : Subgroup G) : LieSubalgebra ℝ (LeftInvariantDerivation I G) :=
  TauCeti.Lie.lieSubalgebraOfSubgroup K

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
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

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
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]
  {E' : Type u} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
  {H' : Type v} [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'}
  {G' : Type w} [TopologicalSpace G'] [ChartedSpace H' G'] [IsManifold I' ∞ G']
  [Group G'] [LieGroup I' ∞ G'] [T2Space G'] [BoundarylessManifold I' G']

/-- **The Lie functor on morphisms**: `lieMap φ = d(φ)_1`, a Lie-algebra homomorphism, for a smooth
homomorphism `φ : G →* G'`. -/
noncomputable def lieMap (φ : G →* G') (hφ : ContMDiff I I' ∞ (φ : G → G')) :
    LeftInvariantDerivation I G →ₗ⁅ℝ⁆ LeftInvariantDerivation I' G' :=
  _root_.lieMap ⟨φ, hφ⟩

/-- **Naturality against the exponential**: `φ (lieExp X) = lieExp (lieMap φ X)`. -/
theorem lieMap_lieExp (φ : G →* G') (hφ : ContMDiff I I' ∞ (φ : G → G'))
    (X : LeftInvariantDerivation I G) :
    φ (lieExp X) = lieExp (lieMap φ hφ X) := by
  let h := (⟨φ, hφ⟩ : ContMDiffMonoidMorphism I I' ∞ G G')
  change φ (_root_.lieExp X) = _root_.lieExp (_root_.lieMap h X)
  exact _root_.map_lieExp h X

/-- **Faithfulness on connected groups**: two smooth homomorphisms out of a connected `G` with equal
differentials at `1` are equal. -/
theorem monoidHom_eq_of_lieMap_eq [ConnectedSpace G] (φ ψ : G →* G')
    (hφ : ContMDiff I I' ∞ (φ : G → G')) (hψ : ContMDiff I I' ∞ (ψ : G → G'))
    (h : lieMap φ hφ = lieMap ψ hψ) : φ = ψ := sorry

end LieFunctor

/-- **Baker-Campbell-Hausdorff** over a Banach algebra. This is the function-valued degreewise Dynkin
Lie series `bch x y`, not the native local BCH germ. Prove convergence on the stated norm neighborhood,
agreement with the local germ there, the endpoint/associativity laws where defined, and a cubic
remainder bound. The characterization `exp x · exp y = exp (bch x y)` alone does not pin the series;
retain the smallness/log-uniqueness and coefficient estimates. Transport the local identification to
abstract `lieExp` by a chart. -/
noncomputable def bch {R : Type u} [NormedRing R] [NormedAlgebra ℝ R] [CompleteSpace R] :
    (x : R) → (y : R) → R := by
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
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

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
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

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
    [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G] [ConnectedSpace G] [SimplyConnectedSpace G]
    {E' : Type u} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    {H' : Type v} [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'}
    {G' : Type w} [TopologicalSpace G'] [ChartedSpace H' G'] [IsManifold I' ∞ G']
    [Group G'] [LieGroup I' ∞ G'] [T2Space G'] [BoundarylessManifold I' G']
    (f : LeftInvariantDerivation I G →ₗ⁅ℝ⁆ LeftInvariantDerivation I' G') :
    ∃ (φ : G →* G') (hφ : ContMDiff I I' ∞ (φ : G → G')), lieMap φ hφ = f := sorry

/-! ### Layer 5: simply-connected covers and the enveloping algebra -/

/-- **The simply-connected (universal) cover** of a connected Lie group: a simply-connected Lie group
`G̃` with a covering homomorphism `p : G̃ →* G` inducing a Lie-algebra isomorphism. Stated as existence. -/
theorem exists_universalCover
    {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
    [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G] [ConnectedSpace G] :
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
    [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G] :
    Type _ := UniversalEnvelopingAlgebra ℝ (LeftInvariantDerivation I G)

/-! ## C. The structure of compact and reductive Lie groups -/

/-! ### Layer 6: maximal tori, the Weyl group, and Weyl integration -/

section Structure

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

/-- **A torus** is a compact connected abelian subgroup; **`IsMaximalTorus T`** is a torus maximal
under inclusion. The body is purely topological-group-theoretic: Cartan's closed-subgroup theorem
(Layer 2) upgrades a maximal torus to an embedded Lie subgroup, so no smooth structure needs to be
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
statement; the weighted conjugation pushforward identity below supplies the L1 integrability
comparison and extension. Boundedness of the density does not justify unweighted restriction to T. -/
theorem weyl_integration_formula [CompactSpace G] [ConnectedSpace G]
    [MeasurableSpace G] [BorelSpace G]
    (T : Subgroup G) (hT : IsMaximalTorus T) [MeasurableSpace T] [BorelSpace T]
    (μG : MeasureTheory.Measure G) [μG.IsHaarMeasure] [MeasureTheory.IsProbabilityMeasure μG]
    (μT : MeasureTheory.Measure T) [μT.IsHaarMeasure] [MeasureTheory.IsProbabilityMeasure μT]
    (f : G → ℝ) (hf : ∀ g x : G, f (x * g * x⁻¹) = f g) (hf_cont : Continuous f) :
    ∫ g, f g ∂μG
      = (Nat.card (weylGroup T) : ℝ)⁻¹
        * ∫ t, f (t : G) * weylDensity (I := I) T t ∂μT := sorry

/-- The weighted conjugation pushforward, with actual conjugation and quotient measure.
This identity, rather than boundedness of D, supplies the weighted L1 restriction law. -/
theorem weyl_conjugation_pushforward [CompactSpace G] [ConnectedSpace G]
    [MeasurableSpace G] [BorelSpace G]
    (T : Subgroup G) (hT : IsMaximalTorus T)
    [MeasurableSpace T] [BorelSpace T]
    [MeasurableSpace (G ⧸ T)] [BorelSpace (G ⧸ T)]
    (muG : Measure G) [muG.IsHaarMeasure] [IsProbabilityMeasure muG]
    (muT : Measure T) [muT.IsHaarMeasure] [IsProbabilityMeasure muT]
    (muQ : Measure (G ⧸ T))
    (hmuQ : muQ = Measure.map (QuotientGroup.mk : G → G ⧸ T) muG)
    (hq : Measurable (QuotientGroup.mk : G → G ⧸ T))
    (conjMap : (G ⧸ T) × T → G) (hconj : Measurable conjMap)
    (hconj_eq : ∀ (g : G) (t : T),
      conjMap (QuotientGroup.mk g, t) = g * (t : G) * g⁻¹) :
    Measure.map conjMap
      ((muQ.prod muT).withDensity (fun p =>
        ENNReal.ofReal (weylDensity (I := I) T p.2 /
          (Nat.card (weylGroup T) : ℝ)))) = muG := by
  sorry


end Structure

/-! ### Layer 7: complexification and real forms

The complexification carrier records the group and complex-Lie-group structure as part of its
existence data, rather than assuming an instance on an unrelated opaque carrier. -/

section Complexification

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

/-- **The complexification** `G_ℂ` of a compact connected Lie group: a complex Lie group with
`Lie(G_ℂ) = 𝔤 ⊗_ℝ ℂ` and `G` a maximal compact subgroup, universal among homomorphisms of `G` into
complex Lie groups. Stated as existence of a complex Lie group with a continuous homomorphism from `G`.
On the classical groups `(U(n))_ℂ = GL_n(ℂ)`, `(SU(n))_ℂ = SL_n(ℂ)`. -/
theorem exists_complexification [CompactSpace G] [ConnectedSpace G] :
    ∃ (Ec : Type u) (_ : NormedAddCommGroup Ec) (_ : NormedSpace ℂ Ec)
      (_ : FiniteDimensional ℂ Ec) (Hc : Type v) (_ : TopologicalSpace Hc) (Ic : ModelWithCorners ℂ Ec Hc)
      (Gc : Type w) (_ : TopologicalSpace Gc) (_ : ChartedSpace Hc Gc) (_ : IsManifold Ic ∞ Gc)
      (_ : Group Gc) (_ : LieGroup Ic ∞ Gc) (ι : G →* Gc),
      Continuous (ι : G → Gc) ∧ Function.Injective ι ∧
      -- The universal property: every continuous homomorphism of `G` into a complex Lie group
      -- factors uniquely and smoothly through `ι`. Without it (or the `Lie(G_ℂ) = 𝔤 ⊗ ℂ`
      -- condition) the bare existential is vacuous — the trivial group satisfies it.
      ∀ (Ec' : Type u) (_ : NormedAddCommGroup Ec') (_ : NormedSpace ℂ Ec') (_ : FiniteDimensional ℂ Ec')
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
    {Ec : Type u} [NormedAddCommGroup Ec] [NormedSpace ℂ Ec] [FiniteDimensional ℂ Ec]
    {Hc : Type v} [TopologicalSpace Hc] {Ic : ModelWithCorners ℂ Ec Hc}
    {Gc : Type w} [TopologicalSpace Gc] [ChartedSpace Hc Gc] [IsManifold Ic ∞ Gc]
    [Group Gc] [LieGroup Ic ∞ Gc] (ι : G →* Gc) (hι : Continuous (ι : G → Gc))
    (hινj : Function.Injective ι)
    -- `Gc` must actually be the complexification: an injective continuous `ι` alone is not enough
    -- (embed `U(1)` in `SL₂(ℂ)`: its weight-one character extends to no holomorphic character of
    -- `SL₂(ℂ)`). The universal property is consumed as a hypothesis, matching the conclusion of
    -- `exists_complexification`.
    (huniv : ∀ (Ec' : Type u) (_ : NormedAddCommGroup Ec') (_ : NormedSpace ℂ Ec') (_ : FiniteDimensional ℂ Ec')
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

/-! ### Layer 7E: actual compact symmetric quotient comparison interfaces

These are nonexhaustive data and transport targets on native groups, quotients,
root pairings, isometries and Lie algebras. The README constructs the four specific
applications and proves their hypotheses. No arbitrary group is asserted exceptional.
The admitted transports below retain their full function families. -/

/-- Exact isotropy map and central generator, including its actual image and kernel.
The four README constructions specialize this to the stated Clifford covers. -/
structure IsotropyKernelComparison {C : Type u} [Group C]
    {G : Type v} [Group G] (H : Subgroup G) (iota : C →* G) (z : C) (n : ℕ) where
  image_eq : iota.range = H
  generator_order : orderOf z = n
  kernel_eq : iota.ker = Subgroup.zpowers z

/-- A metric model is compared with the literal nonnormal coset carrier. Its action
law pins the comparison, rather than allowing an unrelated homeomorphism and action. -/
structure QuotientMetricRealization {G : Type u} [Group G] [TopologicalSpace G]
    (H : Subgroup G) (M : Type v) [MetricSpace M] where
  quotientModel : (G ⧸ H) ≃ₜ M
  action : G →* (M ≃ᵢ M)
  action_eq : ∀ (g x : G),
    action g (quotientModel (QuotientGroup.mk x)) =
      quotientModel (QuotientGroup.mk (g * x))
  kernel_eq_center : action.ker = Subgroup.center G

/-- Descent of the actual isometric action through its proved ineffective center.
This is a whole homomorphism-valued construction, not a new isometry-group axiom. -/
noncomputable def effectiveMetricAction {G : Type u} [Group G] [TopologicalSpace G]
    {H : Subgroup G} {M : Type v} [MetricSpace M]
    (D : QuotientMetricRealization H M) :
    (G ⧸ Subgroup.center G) →* (M ≃ᵢ M) :=
  QuotientGroup.lift (Subgroup.center G) D.action D.kernel_eq_center.ge

theorem effectiveMetricAction_mk {G : Type u} [Group G] [TopologicalSpace G]
    {H : Subgroup G} {M : Type v} [MetricSpace M]
    (D : QuotientMetricRealization H M) (g : G) :
    effectiveMetricAction D (QuotientGroup.mk g) = D.action g := by
  rfl

theorem effectiveMetricAction_injective {G : Type u} [Group G] [TopologicalSpace G]
    {H : Subgroup G} {M : Type v} [MetricSpace M]
    (D : QuotientMetricRealization H M) :
    Function.Injective (effectiveMetricAction D) := by
  exact (QuotientGroup.injective_lift_iff (Subgroup.center G) D.action
    D.kernel_eq_center.ge).2 D.kernel_eq_center.symm

/-- Actual finite root datum and common torus comparison. The root subset determines
its reflection subgroup, and the normalizer test uses the actual Weyl permutation. -/
structure IsotropyRootNormalizerComparison
    {G : Type u} [Group G] (T H : Subgroup G)
    {ι V W : Type*} [AddCommGroup V] [Module ℝ V]
    [AddCommGroup W] [Module ℝ W]
    (P : RootPairing ι ℝ V W) (Psi : Set ι) where
  torus_le_isotropy : T ≤ H
  weylEquiv : weylGroup T ≃* P.weylGroup
  subsystemWeyl : Subgroup P.weylGroup
  subsystemWeyl_eq : subsystemWeyl =
    Subgroup.closure {w | ∃ i ∈ Psi, w = RootPairing.weylGroup.ofIdx P i}
  normalizes_iff : ∀ n : Subgroup.normalizer (T : Set G),
    (n : G) ∈ Subgroup.normalizer (H : Set G) ↔
      ∀ i, i ∈ Psi ↔
        P.weylGroupToPerm (weylEquiv (QuotientGroup.mk n)) i ∈ Psi

/-- Tangent Lie triples with an actual inclusion in the ambient Lie algebra,
bracket-span isotropy, a direct-sum comparison and faithful isotropy action. -/
structure SymmetricTangentLieData (L : Type u) [LieRing L] [LieAlgebra ℝ L]
    (P : Type v) [NormedAddCommGroup P] [InnerProductSpace ℝ P]
    [FiniteDimensional ℝ P] where
  isotropy : LieSubalgebra ℝ L
  tangentInclusion : P →ₗ[ℝ] L
  decomposition : (isotropy × P) ≃ₗ[ℝ] L
  decomposition_eq : ∀ Z X, decomposition (Z, X) = (Z : L) + tangentInclusion X
  isotropy_eq_span : isotropy.toSubmodule =
    Submodule.span ℝ {Z | ∃ X Y : P, Z = ⁅tangentInclusion X, tangentInclusion Y⁆}
  isotropy_action_faithful : ∀ Z : isotropy,
    (∀ X : P, ⁅(Z : L), tangentInclusion X⁆ = 0) → Z = 0
  curvature : P →ₗ[ℝ] P →ₗ[ℝ] P →ₗ[ℝ] P
  curvature_eq : ∀ X Y Z,
    tangentInclusion (curvature X Y Z) =
      -⁅⁅tangentInclusion X, tangentInclusion Y⁆, tangentInclusion Z⁆

/-- The curvature-preserver extension is a whole family over the actual orthogonal
map and its Lie-triple identity. Its construction uses bracket-span and faithfulness. -/
noncomputable def extendTangentLieIsometry
    {L : Type u} [LieRing L] [LieAlgebra ℝ L]
    {P : Type v} [NormedAddCommGroup P] [InnerProductSpace ℝ P]
    [FiniteDimensional ℝ P] (D : SymmetricTangentLieData L P) :
    (A : P ≃ₗᵢ[ℝ] P) →
    (hA : ∀ X Y Z, A (D.curvature X Y Z) =
      D.curvature (A X) (A Y) (A Z)) →
    {F : L ≃ₗ⁅ℝ⁆ L // ∀ X, F (D.tangentInclusion X) = D.tangentInclusion (A X)} := by
  sorry

section SymmetricMetricTangent

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {HG : Type v} [TopologicalSpace HG] {I : ModelWithCorners ℝ E HG}
  {G : Type w} [Group G] [TopologicalSpace G] [ChartedSpace HG G]
  [IsManifold I ∞ G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]
  {F : Type u} [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  {HM : Type v} [TopologicalSpace HM] (J : ModelWithCorners ℝ F HM)
  {M : Type w} [MetricSpace M] [ChartedSpace HM M] [IsManifold J ∞ M]
  {P : Type u} [NormedAddCommGroup P] [InnerProductSpace ℝ P]
  [FiniteDimensional ℝ P]

/-- The actual metric quotient, native group Lie algebra and tangent triple model
are compared by the differential of the orbit map. The given distance is the one
whose isometries occur in the quotient action. -/
structure SymmetricMetricTangentComparison (H : Subgroup G)
    (D : QuotientMetricRealization H M)
    (S : SymmetricTangentLieData (LeftInvariantDerivation I G) P) where
  tangentEquiv : P ≃ₗ[ℝ] TangentSpace J (D.quotientModel (QuotientGroup.mk (1 : G)))
  orbit_smooth : ContMDiff I J ∞
    (fun g : G => D.action g (D.quotientModel (QuotientGroup.mk (1 : G))))
  orbit_derivative : ∀ X : P,
    mfderiv I J
      (fun g : G => D.action g (D.quotientModel (QuotientGroup.mk (1 : G)))) 1
      (lieAlgebraTangentEquiv I G (S.tangentInclusion X)) = tangentEquiv X

end SymmetricMetricTangent

/-! ## Layer 7G₂: compact automorphisms of the positive division octonions

The lower positive Cayley-double algebra and its native derivations are supplied in the
LieHighestWeight Layer8 prototype. These signatures use its actual real carrier, unit,
product, trace and norm as inputs; they do not model the nonassociative algebra with
`AlgEquiv`. -/
namespace CompactG2

open scoped TensorProduct Matrix.Norms.Elementwise

/-- A coherence bundle only: native nonassociative ring and normed additive structures
share one additive parent. It adds neither associativity nor an admitted algebra dictionary. -/
class CayleyNormedRing (A : Type*) extends NonAssocRing A, NormedAddCommGroup A

/-- Reuse actual compatible native records. The norm and metric are unchanged; the normed
additive parent is transported to the ring parent using the supplied record equality. -/
def CayleyNormedRing.ofCompatibleParents (A : Type*)
    (r : NonAssocRing A) (n : NormedAddCommGroup A)
    (h : r.toAddCommGroup = n.toAddCommGroup) : CayleyNormedRing A := by
  let n' : NormedAddCommGroup A :=
    { n with
      toAddCommGroup := r.toAddCommGroup
      dist_eq := by
        intro x y
        have hn := n.dist_eq x y
        rw [← h] at hn
        exact hn }
  exact { r, n' with }

/-- The compatibility constructor retains the given native product, unit and ring operations. -/
theorem CayleyNormedRing.ofCompatibleParents_ring (A : Type*)
    (r : NonAssocRing A) (n : NormedAddCommGroup A)
    (h : r.toAddCommGroup = n.toAddCommGroup) :
    (CayleyNormedRing.ofCompatibleParents A r n h).toNonAssocRing = r := rfl


/-- The compatibility constructor also retains the entire native normed additive record,
not only the native ring. Proof fields are transported, while its norm and metric are unchanged. -/
theorem CayleyNormedRing.ofCompatibleParents_normed (A : Type*)
    (r : NonAssocRing A) (n : NormedAddCommGroup A)
    (h : r.toAddCommGroup = n.toAddCommGroup) :
    (CayleyNormedRing.ofCompatibleParents A r n h).toNormedAddCommGroup = n := by
  cases n
  cases h
  rfl

/-- Transport the supplied actual normed-space dictionary along normed-parent retention.
This preserves its scalar action; it neither constructs nor admits an unrelated Module. -/
@[instance_reducible]
def CayleyNormedRing.ofCompatibleParents_normedSpace (A : Type*)
    (r : NonAssocRing A) (n : NormedAddCommGroup A)
    (h : r.toAddCommGroup = n.toAddCommGroup)
    (s : letI : NormedAddCommGroup A := n; NormedSpace ℝ A) :
    letI : NormedAddCommGroup A :=
      (CayleyNormedRing.ofCompatibleParents A r n h).toNormedAddCommGroup
    NormedSpace ℝ A := by
  cases n
  cases h
  exact s

/-- Both native projections have literally the same additive operations and laws. -/
theorem cayleyNormedRing_additive_parent_eq (A : Type*) [C : CayleyNormedRing A] :
    C.toNonAssocRing.toAddCommGroup = C.toNormedAddCommGroup.toAddCommGroup := rfl

/-- Finite-dimensional automorphisms carry the topology induced by their actual bounded maps. -/
noncomputable instance linearEquivOperatorTopology {A : Type*} [CayleyNormedRing A] [NormedSpace ℝ A] [FiniteDimensional ℝ A] :
    TopologicalSpace (A ≃ₗ[ℝ] A) :=
  TopologicalSpace.induced
    (fun e : A ≃ₗ[ℝ] A => e.toLinearMap.toContinuousLinearMap) inferInstance

/-- The fixed ordered quaternion-pair product used by the lower owner's Cayley coordinates. -/
noncomputable def pairMul (x y : Quaternion ℝ × Quaternion ℝ) : Quaternion ℝ × Quaternion ℝ :=
  let (a,b) := x
  let (c,d) := y
  (a * c - Star.star d * b, d * a + b * Star.star c)

noncomputable def pairTrace (x : Quaternion ℝ × Quaternion ℝ) : ℝ := 2 * x.1.re
noncomputable def pairNormSq (x : Quaternion ℝ × Quaternion ℝ) : ℝ :=
  Quaternion.normSq x.1 + Quaternion.normSq x.2

/-- The exact positive Cayley-pair carrier supplied by LieHighestWeight Layer 8. -/
structure PositivePairCoordinates (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A] where
  coord : A ≃ₗ[ℝ] (Quaternion ℝ × Quaternion ℝ)
  coord_one : coord 1 = (1, 0)
  coord_mul : ∀ x y : A, coord (x * y) = pairMul (coord x) (coord y)
  trace : A →ₗ[ℝ] ℝ
  trace_pair : ∀ x, trace x = pairTrace (coord x)
  normSq : A → ℝ
  normSq_pair : ∀ x, normSq x = pairNormSq (coord x)
  norm_eq : ∀ x, ‖x‖ ^ 2 = normSq x

/-- Unit imaginary vectors for the actual trace and norm of the positive real algebra. -/
abbrev UnitImaginary (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A] (P : PositivePairCoordinates A) :=
  {u : A // P.trace u = 0 ∧ P.normSq u = 1}

/-- The Euclidean product on imaginary vectors, with the fixed `-Re(vw)` convention. -/
noncomputable def inner {A : Type*} [CayleyNormedRing A] [NormedSpace ℝ A] (P : PositivePairCoordinates A) (v w : A) : ℝ :=
  -((pairMul (P.coord v) (P.coord w)).1.re)

/-- The full (possibly disconnected) group of real-linear product automorphisms. -/
def productAutGroup (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A] : Subgroup (A ≃ₗ[ℝ] A) where
  carrier := {f | f 1 = 1 ∧ ∀ x y : A, f (x * y) = f x * f y}
  one_mem' := ⟨rfl, fun _ _ => rfl⟩
  mul_mem' := by
    intro f g hf hg
    constructor
    · change f (g 1) = 1
      rw [hg.1, hf.1]
    · intro x y
      change f (g (x * y)) = f (g x) * f (g y)
      rw [hg.2, hf.2]
  inv_mem' := by
    intro f hf
    constructor
    · change f.symm 1 = 1
      apply f.injective
      rw [LinearEquiv.apply_symm_apply, hf.1]
    · intro x y
      change f.symm (x * y) = f.symm x * f.symm y
      apply f.injective
      rw [LinearEquiv.apply_symm_apply, hf.2,
        LinearEquiv.apply_symm_apply, LinearEquiv.apply_symm_apply]

section GroupApi
variable {A : Type*} [CayleyNormedRing A] [NormedSpace ℝ A]

@[simp] theorem productAut_map_one (g : productAutGroup A) :
    (g.1 : A ≃ₗ[ℝ] A) 1 = 1 := g.property.1

@[simp] theorem productAut_map_mul (g : productAutGroup A) (x y : A) :
    (g.1 : A ≃ₗ[ℝ] A) (x * y) = (g.1 : A ≃ₗ[ℝ] A) x * (g.1 : A ≃ₗ[ℝ] A) y :=
  g.property.2 x y

section NativeDerivations
variable [SMulCommClass ℝ A A] [IsScalarTower ℝ A A]

/-- The actual Tau Ceti derivation transport, not a private replacement. -/
noncomputable def productAut_onDerivations (g : productAutGroup A) :
    TauCeti.derivationLieAlgebra ℝ A ≃ₗ⁅ℝ⁆ TauCeti.derivationLieAlgebra ℝ A :=
  TauCeti.derivationLieAlgebraCongr g.1 g.property.2

end NativeDerivations
end GroupApi

theorem productAut_preserves_trace
    (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A]
    (P : PositivePairCoordinates A) (g : productAutGroup A) :
    ∀ x, P.trace ((g.1 : A →ₗ[ℝ] A) x) = P.trace x := sorry

theorem productAut_preserves_norm
    (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A]
    (P : PositivePairCoordinates A) (g : productAutGroup A) :
    ∀ x, ‖(g.1 : A →ₗ[ℝ] A) x‖ = ‖x‖ := sorry

theorem productAutGroup_closed (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A] [SMulCommClass ℝ A A] [IsScalarTower ℝ A A]
    [FiniteDimensional ℝ A] (P : PositivePairCoordinates A) :
    IsClosed ((productAutGroup A : Set (A ≃ₗ[ℝ] A))) := sorry

theorem productAutGroup_compact (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A] [SMulCommClass ℝ A A] [IsScalarTower ℝ A A]
    [FiniteDimensional ℝ A] (P : PositivePairCoordinates A) :
    IsCompact (Set.univ : Set (productAutGroup A)) := sorry

def pointStabilizer {A : Type*} [CayleyNormedRing A] [NormedSpace ℝ A] (P : PositivePairCoordinates A)
    (u : UnitImaginary A P) : Subgroup (productAutGroup A) where
  carrier := {g | (g.1 : A →ₗ[ℝ] A) u.1 = u.1}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- A Cayley frame records the actual product, trace, inner product, and positive norm data. -/
structure CayleyFrame (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A] (P : PositivePairCoordinates A) where
  u : A
  v : A
  z : A
  trace_u : P.trace u = 0
  trace_v : P.trace v = 0
  trace_z : P.trace z = 0
  inner_one_u : inner P 1 u = 0
  inner_one_v : inner P 1 v = 0
  trace_uv : P.trace (u * v) = 0
  inner_one_uv : inner P 1 (u * v) = 0
  inner_one_z : inner P 1 z = 0
  inner_u_v : inner P u v = 0
  inner_u_uv : inner P u (u * v) = 0
  inner_v_uv : inner P v (u * v) = 0
  inner_u_z : inner P u z = 0
  inner_v_z : inner P v z = 0
  inner_uv_z : inner P (u * v) z = 0
  norm_u : P.normSq u = 1
  norm_v : P.normSq v = 1
  norm_uv : P.normSq (u * v) = 1
  norm_z : P.normSq z = 1

theorem exists_productAut_sending_frame
    (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A]
    (P : PositivePairCoordinates A) (frame₁ frame₂ : CayleyFrame A P) :
    ∃ g : productAutGroup A,
      (g.1 frame₁.u, g.1 frame₁.v, g.1 frame₁.z) =
        (frame₂.u, frame₂.v, frame₂.z) := sorry

/-- A local section is smooth in ambient finite-dimensional coordinates. `ContDiffOn` is only
asserted on an open subset of the vector space `A`, never on the sphere or automorphism subtype. -/
structure CayleyOrbitChart {A : Type*} [CayleyNormedRing A] [NormedSpace ℝ A] [FiniteDimensional ℝ A] (P : PositivePairCoordinates A)
    (u₀ : UnitImaginary A P) where
  neighborhood : Set (UnitImaginary A P)
  isOpen_neighborhood : IsOpen neighborhood ∧ u₀ ∈ neighborhood
  sectionMap : neighborhood → productAutGroup A
  section_sends_base : ∀ x, (sectionMap x).1 u₀.1 = x.1.1
  ambientDomain : Set A
  ambientDomain_open : IsOpen ambientDomain
  neighborhood_in_domain : ∀ x ∈ neighborhood, x.1 ∈ ambientDomain
  sectionExtension : A → (A →L[ℝ] A)
  sectionExtension_eq : ∀ x (hx : x ∈ neighborhood),
    sectionExtension x.1 = (sectionMap ⟨x, hx⟩).1.toContinuousLinearMap
  sectionExtension_smooth : ContDiffOn ℝ ⊤ sectionExtension ambientDomain

theorem exists_smooth_local_Cayley_section
    (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A]
    [FiniteDimensional ℝ A] (P : PositivePairCoordinates A) (u₀ : UnitImaginary A P) :
    Nonempty (CayleyOrbitChart P u₀) := sorry

/-- Actual action on the chosen unit-imaginary vector; the two arguments are retained. -/
noncomputable def orbitMap
    {A : Type*} [CayleyNormedRing A] [NormedSpace ℝ A]
    (P : PositivePairCoordinates A) (u₀ : UnitImaginary A P) :
    productAutGroup A → UnitImaginary A P := fun g =>
  ⟨(g.1 : A ≃ₗ[ℝ] A) u₀.1, by
    constructor
    · exact (productAut_preserves_trace A P g u₀.1).trans u₀.2.1
    · have hnorm := productAut_preserves_norm A P g u₀.1
      calc
        P.normSq ((g.1 : A ≃ₗ[ℝ] A) u₀.1) =
            ‖(g.1 : A ≃ₗ[ℝ] A) u₀.1‖ ^ 2 := (P.norm_eq _).symm
        _ = ‖u₀.1‖ ^ 2 := congrArg (fun r : ℝ => r ^ 2) hnorm
        _ = P.normSq u₀.1 := P.norm_eq _
        _ = 1 := u₀.2.2⟩

def orbitPreimage
    {A : Type*} [CayleyNormedRing A] [NormedSpace ℝ A]
    (P : PositivePairCoordinates A) (u₀ : UnitImaginary A P)
    (U : Set (UnitImaginary A P)) :=
  {g : productAutGroup A // orbitMap P u₀ g ∈ U}

/-- The standard principal-bundle chart as an equivalence of actual fibers. The fiber over a
point is a torsor, not a group. -/
noncomputable def localOrbitTrivialization
    {A : Type*} [CayleyNormedRing A] [NormedSpace ℝ A]
    [FiniteDimensional ℝ A]
    (P : PositivePairCoordinates A) (u₀ : UnitImaginary A P)
    (C : CayleyOrbitChart P u₀) :
    orbitPreimage P u₀ C.neighborhood ≃
      (C.neighborhood × pointStabilizer P u₀) where
  toFun g :=
    let x : C.neighborhood := ⟨orbitMap P u₀ g.1, g.2⟩
    (x, ⟨(C.sectionMap x)⁻¹ * g.1, by sorry⟩)
  invFun p :=
    ⟨(C.sectionMap p.1) * p.2.1, by sorry⟩
  left_inv := by intro g; sorry
  right_inv := by intro p; sorry

/-- Ambient coordinate of a product automorphism as a bounded linear map. -/
noncomputable def autCoordinate {A : Type*} [CayleyNormedRing A] [NormedSpace ℝ A]
    [FiniteDimensional ℝ A] (g : productAutGroup A) : A →L[ℝ] A :=
  g.1.toContinuousLinearMap

noncomputable def orbitCoordinates {A : Type*} [CayleyNormedRing A] [NormedSpace ℝ A]
    [FiniteDimensional ℝ A] (P : PositivePairCoordinates A) (u₀ : UnitImaginary A P)
    {U : Set (UnitImaginary A P)} (g : orbitPreimage P u₀ U) :
    A × (A →L[ℝ] A) := ⟨(orbitMap P u₀ g.1).1, autCoordinate g.1⟩

noncomputable def productCoordinates {A : Type*} [CayleyNormedRing A] [NormedSpace ℝ A]
    [FiniteDimensional ℝ A] (P : PositivePairCoordinates A) (u₀ : UnitImaginary A P)
    (C : CayleyOrbitChart P u₀) (p : C.neighborhood × pointStabilizer P u₀) :
    A × (A →L[ℝ] A) := ⟨p.1.1.1, autCoordinate p.2.1⟩

/-- Forward and inverse coordinate maps have ambient extensions that are smooth on open domains.
This is the finite-dimensional-chart regularity statement for the local principal bundle. -/
structure LocalOrbitAmbientSmoothness
    {A : Type*} [CayleyNormedRing A] [NormedSpace ℝ A]
    [FiniteDimensional ℝ A] (P : PositivePairCoordinates A) (u₀ : UnitImaginary A P)
    (C : CayleyOrbitChart P u₀) where
  forwardDomain : Set (A × (A →L[ℝ] A))
  forwardDomain_open : IsOpen forwardDomain
  forwardExtension : A × (A →L[ℝ] A) → A × (A →L[ℝ] A)
  forward_smooth : ContDiffOn ℝ ⊤ forwardExtension forwardDomain
  forwardCoordinates_in_domain : ∀ g : orbitPreimage P u₀ C.neighborhood,
    orbitCoordinates P u₀ g ∈ forwardDomain
  inverseDomain : Set (A × (A →L[ℝ] A))
  inverseDomain_open : IsOpen inverseDomain
  inverseExtension : A × (A →L[ℝ] A) → A × (A →L[ℝ] A)
  inverse_smooth : ContDiffOn ℝ ⊤ inverseExtension inverseDomain
  inverseCoordinates_in_domain : ∀ x : C.neighborhood × pointStabilizer P u₀,
    productCoordinates P u₀ C x ∈ inverseDomain
  forward_agrees : ∀ g : orbitPreimage P u₀ C.neighborhood,
    forwardExtension (orbitCoordinates P u₀ g) =
      productCoordinates P u₀ C (localOrbitTrivialization P u₀ C g)
  inverse_agrees : ∀ x : C.neighborhood × pointStabilizer P u₀,
    inverseExtension (productCoordinates P u₀ C x) =
      orbitCoordinates P u₀ ((localOrbitTrivialization P u₀ C).symm x)

theorem exists_localOrbitAmbientSmoothness
    (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A]
    [FiniteDimensional ℝ A] (P : PositivePairCoordinates A) (u₀ : UnitImaginary A P)
    (C : CayleyOrbitChart P u₀) : Nonempty (LocalOrbitAmbientSmoothness P u₀ C) := sorry

theorem pointStabilizer_equiv_SU3
    (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A]
    (P : PositivePairCoordinates A) (u : UnitImaginary A P) :
    Nonempty (pointStabilizer P u ≃* Matrix.specialUnitaryGroup (Fin 3) ℂ) := sorry

/-- First columns live in Euclidean `WithLp 2` on `Fin 3`, not the sup-norm Pi space. -/
abbrev UnitComplexColumn := {x : EuclideanSpace ℂ (Fin 3) // ‖x‖ = 1}

noncomputable def standardFirstColumn : UnitComplexColumn :=
  ⟨EuclideanSpace.single 0 (1 : ℂ), by simp⟩

noncomputable def su3_firstColumn
    (g : Matrix.specialUnitaryGroup (Fin 3) ℂ) : UnitComplexColumn :=
  ⟨WithLp.toLp 2 (fun i : Fin 3 => (g.1 : Matrix (Fin 3) (Fin 3) ℂ) i 0), by sorry⟩

def standardColumnStabilizer : Subgroup (Matrix.specialUnitaryGroup (Fin 3) ℂ) where
  carrier := {g | su3_firstColumn g = standardFirstColumn}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

theorem standardColumnStabilizer_equiv_su2 :
    Nonempty (standardColumnStabilizer ≃* Matrix.specialUnitaryGroup (Fin 2) ℂ) := sorry

/-- Each first-column fiber is a torsor for the standard stabilizer. The chosen `g₀` is a
basepoint witness; this equivalence is intentionally not multiplicative. -/
theorem exists_su3_sending_column (x : UnitComplexColumn) :
    ∃ g₀ : Matrix.specialUnitaryGroup (Fin 3) ℂ, su3_firstColumn g₀ = x := sorry

noncomputable def su3ColumnFiberEquiv
    (x : UnitComplexColumn) (g₀ : Matrix.specialUnitaryGroup (Fin 3) ℂ)
    (hg₀ : su3_firstColumn g₀ = x) :
    {g : Matrix.specialUnitaryGroup (Fin 3) ℂ // su3_firstColumn g = x} ≃
      standardColumnStabilizer where
  toFun g := ⟨g₀⁻¹ * g.1, by sorry⟩
  invFun h := ⟨g₀ * h.1, by sorry⟩
  left_inv := by intro g; sorry
  right_inv := by intro h; sorry

structure SU3FirstColumnChart (basePoint : UnitComplexColumn) where
  neighborhood : Set UnitComplexColumn
  isOpen_neighborhood : IsOpen neighborhood ∧ basePoint ∈ neighborhood
  sectionMap : neighborhood → Matrix.specialUnitaryGroup (Fin 3) ℂ
  section_firstColumn : ∀ x, su3_firstColumn (sectionMap x) = x.1
  ambientDomain : Set (EuclideanSpace ℂ (Fin 3))
  ambientDomain_open : IsOpen ambientDomain
  neighborhood_in_domain : ∀ x ∈ neighborhood, x.1 ∈ ambientDomain
  sectionExtension : EuclideanSpace ℂ (Fin 3) → Matrix (Fin 3) (Fin 3) ℂ
  sectionExtension_eq : ∀ x (hx : x ∈ neighborhood),
    sectionExtension x.1 = (sectionMap ⟨x, hx⟩).1
  sectionExtension_smooth : ContDiffOn ℝ ⊤ sectionExtension ambientDomain

theorem exists_su3_firstColumn_local_section (x₀ : UnitComplexColumn) :
    Nonempty (SU3FirstColumnChart x₀) := sorry

theorem su3_connected_simplyConnected :
    SimplyConnectedSpace (Matrix.specialUnitaryGroup (Fin 3) ℂ) := sorry

theorem productAut_connected_simplyConnected
    (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A]
    [FiniteDimensional ℝ A] (P : PositivePairCoordinates A) :
    IsConnected (Set.univ : Set (productAutGroup A)) ∧
      SimplyConnectedSpace (productAutGroup A) := sorry

/-- Actual comparison datum from a positive real pair carrier to the native split Zorn
`TauCeti.Octonion ℂ`. Its maps are unital and multiplicative on the native tensor product; the
last field records the complex-linear extension of real conjugation and does not identify it with
tensor `Star.star` (which conjugates the coefficient). -/
structure PositivePairSplitComparison (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A] [Star A]
    [SMulCommClass ℝ A A] [IsScalarTower ℝ A A] (P : PositivePairCoordinates A) where
  conjugation_pair : ∀ x : A,
    P.coord (Star.star x) = (Star.star (P.coord x).1, -(P.coord x).2)
  toNative : ℂ ⊗[ℝ] A ≃ₗ[ℂ] TauCeti.Octonion ℂ
  map_one : toNative 1 = 1
  map_mul : ∀ x y, toNative (x * y) = toNative x * toNative y
  map_trace : ∀ (z : ℂ) (x : A),
    TauCeti.Octonion.trace (toNative (z ⊗ₜ[ℝ] x)) = z * (P.trace x : ℂ)
  map_real_conjugation : ∀ (z : ℂ) (x : A),
    toNative (z ⊗ₜ[ℝ] Star.star x) =
      z • TauCeti.Octonion.conj (toNative ((1 : ℂ) ⊗ₜ[ℝ] x))

/-- The actual complexified derivation comparison, conditioned on the explicit positive-pair to
native split-octonion comparison and finite-dimensional Leibniz-kernel base-change construction. -/
theorem compactDerivation_complexification_equiv_split
    (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A]
    [Star A]
    [SMulCommClass ℝ A A] [IsScalarTower ℝ A A] [FiniteDimensional ℝ A]
    (P : PositivePairCoordinates A) (C : PositivePairSplitComparison A P) :
    Nonempty ((ℂ ⊗[ℝ] TauCeti.derivationLieAlgebra ℝ A) ≃ₗ⁅ℂ⁆
      TauCeti.derivationLieAlgebra ℂ (TauCeti.Octonion ℂ)) := sorry

/-- Negative definiteness of the actual Killing form on the positive-pair derivations. -/
theorem compactDerivation_killing_negative
    (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A]
    [SMulCommClass ℝ A A] [IsScalarTower ℝ A A] [FiniteDimensional ℝ A]
    (P : PositivePairCoordinates A)
    (D : TauCeti.derivationLieAlgebra ℝ A) (hD : D ≠ 0) :
    LinearMap.trace ℝ (TauCeti.derivationLieAlgebra ℝ A)
      ((LieAlgebra.ad ℝ (TauCeti.derivationLieAlgebra ℝ A) D) ∘ₗ
        (LieAlgebra.ad ℝ (TauCeti.derivationLieAlgebra ℝ A) D)) < 0 := sorry

theorem productAut_imaginary_action_faithful
    (A : Type*) [CayleyNormedRing A] [NormedSpace ℝ A]
    [SMulCommClass ℝ A A] [IsScalarTower ℝ A A] [FiniteDimensional ℝ A]
    (P : PositivePairCoordinates A)
    (decomposition : ∀ x : A, ∃ r : ℝ, ∃ v : A,
      P.trace v = 0 ∧ x = r • (1 : A) + v) :
    ∀ g h : productAutGroup A,
      (∀ v, P.trace v = 0 → (g.1 : A →ₗ[ℝ] A) v = (h.1 : A →ₗ[ℝ] A) v) → g = h := sorry

end CompactG2

/-! ### Layer 8: Borel-Weil, flag manifolds, and Bruhat

Stated for an abstract complex reductive group `Gc` with a Borel subgroup `B`; the identification of `Gc`
as `G_ℂ` is Layer 7's, and the target module `L(λ)` is `../LieHighestWeight/README.md`'s.

The abstract Bruhat decomposition of a BN-pair is native at the pinned Tau Ceti: `TauCeti.TitsSystem`
has Weyl quotient `N ⧸ (B ∩ N)`, and `TauCeti.TitsSystem.existsUnique_mem_bruhatCell` proves existence
and uniqueness of the cell. The Layer 8 application, a `TauCeti.TitsSystem` on `G_ℂ` with
`subgroupB = B`, `subgroupN = N_{G_ℂ}(T)` and `B ∩ N_{G_ℂ}(T) = T`, so that its Weyl quotient is
`weylGroup T`, is not statable here: the pins have no complex reductive group carrier with its Borel
subgroup and maximal torus. -/

/-- **The flag manifold** `G_ℂ / B`, a compact complex manifold; here the underlying `Gc`-homogeneous
coset space. -/
def flagManifold (Gc : Type w) [Group Gc] (B : Subgroup Gc) : Type w := Gc ⧸ B

/-- Input data for the holomorphic equivariant-function model. The carrier is an explicitly embedded
complex Lie subgroup and the character is holomorphic. This data alone does not certify that the
subgroup is a Borel subgroup or that the character is dominant integral; those are separate Layer 8
hypotheses for the nonzero Borel-Weil theorem. -/
structure HolomorphicSubgroupCharacterInput
    {Gc : Type w} [Group Gc] [TopologicalSpace Gc]
    {E : Type u} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    {H : Type v} [TopologicalSpace H] (I : ModelWithCorners ℂ E H)
    [ChartedSpace H Gc] [IsManifold I ∞ Gc] [LieGroup I ∞ Gc] where
  B : Type w
  [groupB : Group B]
  [topologyB : TopologicalSpace B]
  EB : Type u
  [normedEB : NormedAddCommGroup EB]
  [spaceEB : NormedSpace ℂ EB]
  [finiteEB : FiniteDimensional ℂ EB]
  HB : Type v
  [topologyHB : TopologicalSpace HB]
  JB : ModelWithCorners ℂ EB HB
  [chartedB : ChartedSpace HB B]
  [manifoldB : IsManifold JB ∞ B]
  [lieGroupB : LieGroup JB ∞ B]
  inclusion : B →* Gc
  inclusion_injective : Function.Injective inclusion
  inclusion_smooth : ContMDiff JB I ∞ (inclusion : B → Gc)
  inclusion_embedding : Topology.IsEmbedding (inclusion : B → Gc)
  inclusion_immersion : ∀ b : B, Function.Injective (mfderiv JB I (inclusion : B → Gc) b)
  inclusion_closed : IsClosed (Set.range inclusion)
  chi : B →* ℂˣ
  chi_holomorphic : ContMDiff JB 𝓘(ℂ, ℂ) ∞ (fun b => (chi b : ℂ))

/-- The holomorphic equivariant-function carrier is a subspace cut out by holomorphy and the right
subgroup-equivariance law. The line-bundle identification is a separate construction target; this
subspace is not by itself a nonvanishing or classification theorem. -/
def holomorphicEquivariantFunctionSpace {Gc : Type w} [Group Gc] [TopologicalSpace Gc]
    {E : Type u} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℂ E H}
    [ChartedSpace H Gc] [IsManifold I ∞ Gc] [LieGroup I ∞ Gc]
    (D : HolomorphicSubgroupCharacterInput (I := I) (Gc := Gc)) : Submodule ℂ (Gc → ℂ) where
  carrier := {f | ContMDiff I 𝓘(ℂ, ℂ) ∞ f ∧
    ∀ (g : Gc) (b : D.B), f (g * D.inclusion b) = (((D.chi b)⁻¹ : ℂˣ) : ℂ) * f g}
  add_mem' := by
    intro f₁ f₂ h₁ h₂
    constructor
    · exact h₁.1.add h₂.1
    · intro g b
      change f₁ (g * D.inclusion b) + f₂ (g * D.inclusion b) =
        (((D.chi b)⁻¹ : ℂˣ) : ℂ) * (f₁ g + f₂ g)
      rw [h₁.2 g b, h₂.2 g b, mul_add]
  zero_mem' := by
    constructor
    · exact contMDiff_const
    · intro g b
      simp
  smul_mem' := by
    intro c f hf
    constructor
    · exact ContMDiff.const_smul hf.1 c
    · intro g b
      change c * f (g * D.inclusion b) =
        (((D.chi b)⁻¹ : ℂˣ) : ℂ) * (c * f g)
      rw [hf.2 g b]
      ring

/-- The `Gc`-action on holomorphic sections by left translation. -/
noncomputable def leftTranslationOnEquivariantFunctions {Gc : Type w} [Group Gc] [TopologicalSpace Gc]
    {E : Type u} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℂ E H}
    [ChartedSpace H Gc] [IsManifold I ∞ Gc] [LieGroup I ∞ Gc]
    (D : HolomorphicSubgroupCharacterInput (I := I) (Gc := Gc)) : Representation ℂ Gc ↥(holomorphicEquivariantFunctionSpace (I := I) (Gc := Gc) D) := by
  sorry

/-- **The algebraic induced-function model** of the section space (a real definition): the
`B`-equivariant functions `f (g b) = chi(b)⁻¹ f g`; holomorphy is imposed in
`holomorphicEquivariantFunctionSpace`. -/
def equivariantFunctionSubmodule {Gc : Type w} [Group Gc] [TopologicalSpace Gc]
    {E : Type u} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℂ E H}
    [ChartedSpace H Gc] [IsManifold I ∞ Gc] [LieGroup I ∞ Gc]
    (D : HolomorphicSubgroupCharacterInput (I := I) (Gc := Gc)) : Submodule ℂ (Gc → ℂ) where
  carrier := {f | ∀ (g : Gc) (b : D.B),
    f (g * D.inclusion b) = (((D.chi b)⁻¹ : ℂˣ) : ℂ) * f g}
  add_mem' := by
    intro f₁ f₂ h₁ h₂ g b
    simp [h₁ g b, h₂ g b, mul_add]
  zero_mem' := by intro g b; simp
  smul_mem' := by
    intro c f hf g b
    simp only [Pi.smul_apply, hf g b, smul_eq_mul]
    ring

/-- Inclusion into the algebraic equivariant-function model is the concrete compatibility comparison.
The nonzero highest-weight theorem requires a connected complex reductive group, an actual positive
Borel, and a dominant integral character of the actual group; it remains a separate target. -/
theorem holomorphicEquivariantFunctions_embed {Gc : Type w} [Group Gc] [TopologicalSpace Gc]
    {E : Type u} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℂ E H}
    [ChartedSpace H Gc] [IsManifold I ∞ Gc] [LieGroup I ∞ Gc]
    (D : HolomorphicSubgroupCharacterInput (I := I) (Gc := Gc)) :
    ∃ ψ : ↥(holomorphicEquivariantFunctionSpace (I := I) (Gc := Gc) D) →ₗ[ℂ] ↥(equivariantFunctionSubmodule (I := I) (Gc := Gc) D),
      Function.Injective ψ ∧
      ∀ (g : Gc) (f : ↥(holomorphicEquivariantFunctionSpace (I := I) (Gc := Gc) D)) (x : Gc),
        (ψ (leftTranslationOnEquivariantFunctions (I := I) (Gc := Gc) D g f) : Gc → ℂ) x = (ψ f : Gc → ℂ) (g⁻¹ * x) := by
  sorry

/-! ### Layer 9: the Cartan, Iwasawa, and KAK decompositions

These decompositions are false for arbitrary subgroups of an arbitrary Lie group: they hold only for a
real reductive `G` and a genuine Iwasawa triple / restricted-root chamber. The predicates below carry
that structure, and the theorems consume it rather than assert a factorization for bare subgroups. -/

section RealReductive

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G] [IsManifold I ∞ G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

/-- A global matrix-cover input; no polar/KAK conclusion is a field.
The finite-dimensional closed subgroup structure, finite covering and
compatible involution are the global input to the decomposition theorems. -/
structure FiniteCartanMatrixModel (G : Type w) [TopologicalSpace G] [Group G]
    (theta : G ≃* G) where
  n : ℕ
  H : Subgroup (Matrix.GeneralLinearGroup (Fin n) ℝ)
  closed : IsClosed (H : Set (Matrix.GeneralLinearGroup (Fin n) ℝ))
  star_stable : ∀ h ∈ H, star h ∈ H
  finite_components : Finite (ConnectedComponents H)
  cover : G →* H
  continuous_cover : Continuous (cover : G → H)
  surjective_cover : Function.Surjective cover
  covering : IsCoveringMap (cover : G → H)
  finite_kernel : Finite cover.ker
  compact_preimage_fixed : ∀ g : G,
    star (((cover g : H) : Matrix.GeneralLinearGroup (Fin n) ℝ)) *
      (((cover g : H) : Matrix.GeneralLinearGroup (Fin n) ℝ)) = 1 → theta g = g
  central_kernel : ∀ z ∈ cover.ker, ∀ g : G, z * g = g * z
  theta_compatible : ∀ g : G,
    ((cover (theta g) : H) : Matrix.GeneralLinearGroup (Fin n) ℝ) =
      star ((((cover g : H) : Matrix.GeneralLinearGroup (Fin n) ℝ))⁻¹)

/-- **A Cartan involution datum** for `G`: a smooth involutive automorphism `θ`, a specified global
finite-cover matrix model, compact fixed subgroup, and explicit reductive Lie-algebra splitting. The
matrix model is transpose-stable by construction, so the recorded reductivity fields are part of the
chosen Cartan datum and theorems must prove/consume them from their stated source. Compactness of the
fixed group alone is not a reductivity criterion: the Euclidean motion example with
`(v,k) ↦ (−v,k)` has compact fixed `O(n)` and a translation radical. -/
structure CartanInvolution (I : ModelWithCorners ℝ E H) (G : Type w) [TopologicalSpace G]
    [ChartedSpace H G] [IsManifold I ∞ G] [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G] where
  θ : G ≃* G
  smooth : ContMDiff I I ∞ (θ : G → G)
  involutive : ∀ g : G, θ (θ g) = g
  global_model : FiniteCartanMatrixModel G θ
  compact_fixed : IsCompact {g : G | θ g = g}
  reductive_compl :
    IsCompl (LieAlgebra.center ℝ (LeftInvariantDerivation I G)).toSubmodule
      (LieAlgebra.derivedSeries ℝ (LeftInvariantDerivation I G) 1).toSubmodule
  derived_semisimple :
    LieAlgebra.IsSemisimple ℝ ↥(LieAlgebra.derivedSeries ℝ (LeftInvariantDerivation I G) 1)

/-- **`IsRealReductive I G`**: `G` carries a Cartan involution datum (with `𝔤 = 𝔨 ⊕ 𝔭` the
`±1`-eigenspace decomposition of its differential). -/
def IsRealReductive (I : ModelWithCorners ℝ E H) (G : Type w) [TopologicalSpace G]
    [ChartedSpace H G] [IsManifold I ∞ G] [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G] : Prop :=
  Nonempty (CartanInvolution I G)

/-- Iwasawa data separates the arbitrary closed, connected exponential complement `N` used by KAN from the root-generated subgroup `Nplus` used for the canonical chamber/KAK. Store root spaces, restricted weights and the positive subsystem determining `Nplus` and the chamber; prove `𝔤 = 𝔨 ⊕ 𝔞 ⊕ Lie(Nplus)`, the normalizer orbit, and split-center lineality. Do not force arbitrary `N` to be root-generated. A closed spanning cone without restricted-root data is not a positive chamber. -/
structure IwasawaData (I : ModelWithCorners ℝ E H) (G : Type w) [TopologicalSpace G]
    [ChartedSpace H G] [IsManifold I ∞ G] [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G] where
  cartan : CartanInvolution I G
  K : Subgroup G
  K_eq_fixed : (K : Set G) = {g : G | cartan.θ g = g}
  𝔞 : Submodule ℝ (LeftInvariantDerivation I G)
  /-- Actual restricted weights on the selected maximal abelian subspace. -/
  restrictedRoots : Set (𝔞 →ₗ[ℝ] ℝ)
  positiveRestrictedRoots : Set (𝔞 →ₗ[ℝ] ℝ)
  positiveRoots_subset : positiveRestrictedRoots ⊆ restrictedRoots
  restrictedRoots_neg : ∀ α, α ∈ restrictedRoots ↔ -α ∈ restrictedRoots
  positiveRoots_nonzero : ∀ α ∈ positiveRestrictedRoots, α ≠ 0
  positiveRoots_sign_choice : ∀ α ∈ restrictedRoots, α = 0 ∨
    α ∈ positiveRestrictedRoots ∨ -α ∈ positiveRestrictedRoots
  positiveRoots_no_opposites : ∀ α ∈ positiveRestrictedRoots,
    -α ∉ positiveRestrictedRoots
  positiveRoots_additive : ∀ α ∈ positiveRestrictedRoots, ∀ β ∈ positiveRestrictedRoots,
    α + β ∈ restrictedRoots → α + β ∈ positiveRestrictedRoots
  /-- The restricted root space for α is the simultaneous eigenspace of ad(H). -/
  restrictedRootSpace : (α : 𝔞 →ₗ[ℝ] ℝ) → Submodule ℝ (LeftInvariantDerivation I G)
  restrictedRootSpace_eq : ∀ α ∈ restrictedRoots,
    (restrictedRootSpace α : Set (LeftInvariantDerivation I G)) =
      {X | ∀ H : 𝔞, ⁅(H : LeftInvariantDerivation I G), X⁆ = (α H) • X}
  restrictedRoots_exact : ∀ α, α ∈ restrictedRoots ↔ α ≠ 0 ∧
    ∃ X : LeftInvariantDerivation I G, X ≠ 0 ∧
      ∀ H : 𝔞, ⁅(H : LeftInvariantDerivation I G), X⁆ = (α H) • X
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
  chamber_root_inequalities : ∀ X (hX : X ∈ (𝔞 : Set (LeftInvariantDerivation I G))),
    X ∈ chamber ↔ ∀ α ∈ positiveRestrictedRoots, 0 ≤ α ⟨X, hX⟩
  /-- Canonical root-generated subgroup, distinct from the arbitrary KAN complement `N`. -/
  Nplus : Subgroup G
  Nplus_closed : IsClosed (Nplus : Set G)
  Nplus_connected : IsConnected (Nplus : Set G)
  Nplus_positiveRootGeneration :
    (lieSubalgebraOfSubgroup (I := I) Nplus).toSubmodule =
      Submodule.span ℝ (⋃ α ∈ positiveRestrictedRoots, restrictedRootSpace α)
  chamber_subset : chamber ⊆ (𝔞 : Set (LeftInvariantDerivation I G))
  chamber_cone : ∀ X ∈ chamber, ∀ Y ∈ chamber, X + Y ∈ chamber
  chamber_smul : ∀ X ∈ chamber, ∀ c : ℝ, 0 ≤ c → c • X ∈ chamber
  /-- The closed positive restricted-root chamber spans `𝔞`.
  Normalizer orbit coverage is required separately by `chamber_normalizer_cover`. -/
  chamber_span : Submodule.span ℝ chamber = 𝔞
  /-- Closed in the canonical tangent-space topology. -/
  chamber_closed : IsClosed ((lieAlgebraTangentEquiv I G) '' chamber)
  /-- Derived from the actual restricted-root positive chamber, not an arbitrary cone. -/
  chamber_normalizer_cover : ∀ X ∈ 𝔞, ∃ k : K,
    (∀ Y ∈ 𝔞, Ad (I := I) (k : G) Y ∈ 𝔞) ∧
    Ad (I := I) (k : G) X ∈ chamber
  /-- The whole split central direction is lineality. -/
  chamber_split_center : ∀ X ∈ chamber,
    ∀ Z ∈ (LieAlgebra.center ℝ (LeftInvariantDerivation I G)).toSubmodule,
      Z ∈ 𝔞 → X + Z ∈ chamber

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
independent `K`/`Aplus` arguments would relate unrelated witnesses). The actual normalizer
coverage and split-center conditions of the same datum are used. Uniqueness up to the
restricted Weyl group and the restricted root system are in `README.md`. -/
theorem kakDecomposition (D : IwasawaData I G) :
    ∀ g : G, ∃ (k₁ k₂ : D.K) (a : G),
      a ∈ lieExp (I := I) '' D.chamber ∧ g = (k₁ : G) * a * (k₂ : G) := sorry

/-- **The global Cartan (polar) decomposition** `G = K · exp 𝔭`: for a Cartan involution datum, every `g` factors uniquely as `k · lieExp X` with
`θ k = k` and `X` in the `−1`-eigenspace `𝔭` of `dθ`. -/
theorem cartan_polar_decomposition (D : CartanInvolution I G) (g : G) :
    ∃! p : {k : G // D.θ k = k} ×
        {X : LeftInvariantDerivation I G // lieMap D.θ.toMonoidHom D.smooth X = -X},
      g = (p.1 : G) * lieExp (I := I) (p.2 : LeftInvariantDerivation I G) := sorry

end RealReductive


/-! ## Compact-normalizer application: actual word, period and matrix data

The README constructs coherent pinned representatives before proving the explicit
braid/square hypotheses recorded here. This conditional algebraic interface does
not replace that compact-form/pinning construction by an opaque predicate. -/

namespace CompactNormalizerLifts
noncomputable section CompactNormalizerApplication
open scoped BigOperators

section Tits
variable {ι M V G : Type*} [AddCommGroup M] [Module ℝ M]
  [AddCommGroup V] [Module ℝ V] [Group G]
  (P : RootPairing ι ℝ M V) (b : P.Base) (T : Subgroup G)

def alternatingWord (i j : b.support) (m : ℕ) : List b.support :=
  List.ofFn fun k : Fin m => if k.val % 2 = 0 then i else j

def corootLattice : AddSubgroup V := AddSubgroup.closure (Set.range P.coroot)

def doubleMap : V →+ V where
  toFun v := v+v
  map_zero' := by simp
  map_add' := by intros; abel

def normalizerProjection : (Subgroup.normalizer (T : Set G)) →* weylGroup T :=
  QuotientGroup.mk' (T.subgroupOf (Subgroup.normalizer (T : Set G)))

/-- Every field is an actual map or equation. Coherent pinning and all these
equations must be constructed by the README, not postulated for arbitrary lifts. -/
structure Input where
  torusParam : Multiplicative V →* G
  torusParam_range : torusParam.range = T
  periods : AddSubgroup V
  period_eq : ∀ v, torusParam (Multiplicative.ofAdd v) = 1 ↔ v ∈ periods
  coroot_period : corootLattice P ≤ periods
  simple_coroot_span : AddSubgroup.closure
    (Set.range fun i : b.support => P.coroot i.val) = corootLattice P
  matrix : CoxeterMatrix b.support
  coxeter : CoxeterSystem matrix P.weylGroup
  simple_eq : ∀ i, coxeter.simple i = RootPairing.weylGroup.ofIdx P i.val
  weylComparison : weylGroup T ≃* P.weylGroup
  weylFinite : Finite P.weylGroup
  n : b.support → (Subgroup.normalizer (T : Set G))
  lift_simple : ∀ i, weylComparison (normalizerProjection T (n i)) = coxeter.simple i
  square : ∀ i, ((n i : (Subgroup.normalizer (T : Set G))) : G)^2 =
    torusParam (Multiplicative.ofAdd ((1/2 : ℝ) • P.coroot i.val))
  braid : ∀ i j, ((alternatingWord P b i j (matrix i j)).map fun k => (n k : G)).prod =
    ((alternatingWord P b j i (matrix i j)).map fun k => (n k : G)).prod
  conjugation : ∀ i v, (n i : G) * torusParam (Multiplicative.ofAdd v) * (n i : G)⁻¹ =
    torusParam (Multiplicative.ofAdd (P.coreflection i.val v))

def generated (D : Input P b T) : Subgroup G :=
  Subgroup.closure (Set.range fun i => (D.n i : G))

theorem generated_le_normalizer (D : Input P b T) : generated P b T D ≤ (Subgroup.normalizer (T : Set G)) := by sorry

def intoNormalizer (D : Input P b T) : generated P b T D →* (Subgroup.normalizer (T : Set G)) where
  toFun g := ⟨g.val, generated_le_normalizer P b T D g.property⟩
  map_one' := rfl
  map_mul' _ _ := rfl

def weylProjection (D : Input P b T) : generated P b T D →* P.weylGroup :=
  D.weylComparison.toMonoidHom.comp ((normalizerProjection T).comp (intoNormalizer P b T D))

def doublePeriodIntersection (D : Input P b T) : AddSubgroup (corootLattice P) :=
  (D.periods.map (doubleMap (V := V))).comap (corootLattice P).subtype

/-- The half-period values are literal; membership and normal-form laws are proofs. -/
def halfPeriod (D : Input P b T) : Multiplicative (corootLattice P) →*
    (weylProjection P b T D).ker where
  toFun q := ⟨⟨D.torusParam (Multiplicative.ofAdd ((1/2 : ℝ) • (q.toAdd : V))),
    by sorry⟩, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

/-- Honest whole-Pi quotient/kernel comparison retaining every actual input record. -/
noncomputable def kernelEquiv : (P : RootPairing ι ℝ M V) → (b : P.Base) →
    (T : Subgroup G) → (D : Input P b T) →
    Multiplicative ((corootLattice P) ⧸ doublePeriodIntersection P b T D) ≃*
      (weylProjection P b T D).ker := by sorry

theorem halfPeriod_eq_one_iff (D : Input P b T) (q : corootLattice P) :
    halfPeriod P b T D (Multiplicative.ofAdd q) = 1 ↔
      (q : V) ∈ D.periods.map (doubleMap (V := V)) := by sorry

theorem weylProjection_surjective (D : Input P b T) :
    Function.Surjective (weylProjection P b T D) := by sorry

theorem generated_finite [Finite ι] (D : Input P b T) : Finite (generated P b T D) := by sorry

/-- Faithful left regular permutation values, distinct from the possibly unfaithful adjoint. -/
def regularPermutation (D : Input P b T) : generated P b T D →*
    Equiv.Perm (generated P b T D) where
  toFun g := Equiv.mulLeft g
  map_one' := by ext; simp
  map_mul' := by intros; ext; simp [mul_assoc]

theorem regularPermutation_injective (D : Input P b T) :
    Function.Injective (regularPermutation P b T D) := by sorry
/-- Native linearization of the actual left action, not a new representation engine. -/
noncomputable def regularLinear (D : Input P b T) :
    Representation ℝ (generated P b T D) (MonoidAlgebra ℝ (generated P b T D)) :=
  Representation.leftRegular ℝ (generated P b T D)

theorem regularLinear_injective (D : Input P b T) :
    Function.Injective (regularLinear P b T D) := by sorry
end Tits

section SU2
abbrev SU2 := Matrix.specialUnitaryGroup (Fin 2) ℂ

def su2Diagonal (z : ℂ) (hz : star z*z=1) : SU2 :=
  ⟨!![z,0;0,star z], by sorry⟩

def su2Torus : Subgroup SU2 where
  carrier := {g | ∃ z : ℂ, ∃ hz : star z*z=1, g = su2Diagonal z hz}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

def su2J : SU2 := ⟨!![0,-1;1,0], by sorry⟩

theorem su2J_square : (su2J : Matrix (Fin 2) (Fin 2) ℂ)^2 = -1 := by sorry
theorem su2J_normalizes : su2J ∈ (Subgroup.normalizer (su2Torus : Set SU2)) := by sorry
theorem su2_coset_square (t : su2Torus) :
    (((t : SU2)*su2J : SU2) : Matrix (Fin 2) (Fin 2) ℂ)^2 = -1 := by sorry

theorem su2_no_section : ¬ ∃ s : weylGroup su2Torus →* (Subgroup.normalizer (su2Torus : Set SU2)),
    (normalizerProjection su2Torus).comp s = MonoidHom.id _ := by sorry
end SU2

section SOBlocks
open scoped Matrix
abbrev PlaneIndex (r : ℕ) := Fin r × Fin 2
abbrev OddIndex (r : ℕ) := Sum (PlaneIndex r) Unit
abbrev SOEven (r : ℕ) := Matrix.specialOrthogonalGroup (PlaneIndex r) ℝ
abbrev SOOdd (r : ℕ) := Matrix.specialOrthogonalGroup (OddIndex r) ℝ

def evenSignedMatrix {r : ℕ} (σ : Equiv.Perm (Fin r)) (ε : Fin r → ℤˣ) :
    Matrix (PlaneIndex r) (PlaneIndex r) ℝ := fun a b =>
  if a.1=σ b.1 ∧ a.2=b.2 then if b.2=0 then 1 else ((ε b.1 : ℤ) : ℝ) else 0

def oddSignedMatrix {r : ℕ} (σ : Equiv.Perm (Fin r)) (ε : Fin r → ℤˣ) :
    Matrix (OddIndex r) (OddIndex r) ℝ := fun a b => match a,b with
  | .inl i,.inl j => evenSignedMatrix σ ε i j
  | .inr _,.inr _ => (((∏ i, ε i : ℤˣ) : ℤ) : ℝ)
  | _,_ => 0

def rotationMatrix {r : ℕ} (θ : Fin r → ℝ) :
    Matrix (PlaneIndex r) (PlaneIndex r) ℝ := fun a b =>
  if a.1=b.1 then
    if a.2=b.2 then Real.cos (θ b.1)
    else if a.2=0 then -Real.sin (θ b.1) else Real.sin (θ b.1)
  else 0

def oddRotationMatrix {r : ℕ} (θ : Fin r → ℝ) :
    Matrix (OddIndex r) (OddIndex r) ℝ := fun a b => match a,b with
  | .inl i,.inl j => rotationMatrix θ i j
  | .inr _,.inr _ => 1
  | _,_ => 0

def evenTorus (r : ℕ) : Subgroup (SOEven r) where
  carrier := {g | ∃ θ : Fin r → ℝ, g.val = rotationMatrix θ}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
def oddTorus (r : ℕ) : Subgroup (SOOdd r) where
  carrier := {g | ∃ θ : Fin r → ℝ, g.val = oddRotationMatrix θ}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

def evenComplement (r : ℕ) : Subgroup (SOEven r) where
  carrier := {g | ∃ σ : Equiv.Perm (Fin r), ∃ ε : Fin r → ℤˣ,
    ∏ i, ε i = 1 ∧ g.val = evenSignedMatrix σ ε}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
def oddComplement (r : ℕ) : Subgroup (SOOdd r) where
  carrier := {g | ∃ σ : Equiv.Perm (Fin r), ∃ ε : Fin r → ℤˣ,
    g.val = oddSignedMatrix σ ε}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

theorem evenComplement_le_normalizer (r : ℕ) : evenComplement r ≤ (Subgroup.normalizer ((evenTorus r) : Set (SOEven r))) := by sorry
theorem oddComplement_le_normalizer (r : ℕ) : oddComplement r ≤ (Subgroup.normalizer ((oddTorus r) : Set (SOOdd r))) := by sorry

theorem even_complement (r : ℕ) :
    ((evenTorus r).subgroupOf (Subgroup.normalizer ((evenTorus r) : Set (SOEven r)))).IsComplement'
      ((evenComplement r).subgroupOf (Subgroup.normalizer ((evenTorus r) : Set (SOEven r)))) := by sorry
theorem odd_complement (r : ℕ) :
    ((oddTorus r).subgroupOf (Subgroup.normalizer ((oddTorus r) : Set (SOOdd r)))).IsComplement'
      ((oddComplement r).subgroupOf (Subgroup.normalizer ((oddTorus r) : Set (SOOdd r)))) := by sorry
end SOBlocks

end CompactNormalizerApplication
end CompactNormalizerLifts

/-! ### Layer 6A: finite real fields and a central-circle obstruction

These interfaces supplement the definitive construction order in README 6A. The
coordinate formulas precede the geometric classification; the native algebraic FTA
endpoint is not used as a premise. Data operations below have literal native
formulas, or have their full determining operands inside the admitted Pi family.
-/

open scoped Matrix.Norms.Operator

namespace GeometricFiniteExtension

section FieldCoordinates
variable {F : Type u} [Field F] [Algebra ℝ F] {n : ℕ}

/-- Coordinates are finite real vectors; no normed-field structure on F is assumed. -/
noncomputable def coordinateMul (b : Module.Basis (Fin (n+1)) ℝ F)
    (x y : Fin (n+1) → ℝ) : Fin (n+1) → ℝ :=
  b.equivFun (b.equivFun.symm x * b.equivFun.symm y)

noncomputable def coordinateInv (b : Module.Basis (Fin (n+1)) ℝ F)
    (x : Fin (n+1) → ℝ) : Fin (n+1) → ℝ :=
  b.equivFun ((b.equivFun.symm x)⁻¹)

noncomputable def multiplicationMatrix (b : Module.Basis (Fin (n+1)) ℝ F)
    (x : Fin (n+1) → ℝ) : Matrix (Fin (n+1)) (Fin (n+1)) ℝ :=
  Algebra.leftMulMatrix b (b.equivFun.symm x)

theorem multiplicationMatrix_det_ne_zero (b : Module.Basis (Fin (n+1)) ℝ F)
    (x : Fin (n+1) → ℝ) (hx : x ≠ 0) :
    (multiplicationMatrix b x).det ≠ 0 := by sorry

theorem coordinateInv_adjugate (b : Module.Basis (Fin (n+1)) ℝ F)
    (x : Fin (n+1) → ℝ) (hx : x ≠ 0) :
    coordinateInv b x = ((multiplicationMatrix b x).det)⁻¹ •
      (Matrix.mulVec (multiplicationMatrix b x).adjugate (b.equivFun (1 : F))) := by sorry

theorem contDiff_coordinateMul (b : Module.Basis (Fin (n+1)) ℝ F) :
    ContDiff ℝ ∞ (fun p : (Fin (n+1) → ℝ) × (Fin (n+1) → ℝ) =>
      coordinateMul b p.1 p.2) := by sorry

theorem contDiffOn_coordinateInv (b : Module.Basis (Fin (n+1)) ℝ F) :
    ContDiffOn ℝ ∞ (coordinateInv b) {x | x ≠ 0} := by sorry

/-- Actual native units, identified with the open nonzero coordinate set. -/
noncomputable def unitsCoordinates (b : Module.Basis (Fin (n+1)) ℝ F) :
    Fˣ ≃ {x : Fin (n+1) → ℝ // x ≠ 0} where
  toFun a := ⟨b.equivFun (a : F), by sorry⟩
  invFun x := Units.mk0 (b.equivFun.symm x.1) (by sorry)
  left_inv := by sorry
  right_inv := by sorry

/-- The actual coordinate-induced topology, not a second field/algebra dictionary. -/
noncomputable def unitsTopology (b : Module.Basis (Fin (n+1)) ℝ F) : TopologicalSpace Fˣ :=
  TopologicalSpace.induced (unitsCoordinates b) inferInstance

/-- The canonical subgroup of nonzero real scalars; it does not depend on a basis. -/
def realScalarUnits (F : Type u) [Field F] [Algebra ℝ F] : Subgroup Fˣ :=
  (Units.map (algebraMap ℝ F).toMonoidHom).range

/-- Abelian native units make the native quotient an actual group. -/
instance realScalarUnits_normal : (realScalarUnits F).Normal := inferInstance

abbrev ProjectiveUnits (F : Type u) [Field F] [Algebra ℝ F] :=
  Fˣ ⧸ realScalarUnits F

/-- The quotient-to-line map uses the actual representative, not an unrelated equivalence. -/
noncomputable def quotientToProjectivization (F : Type u) [Field F] [Algebra ℝ F] :
    ProjectiveUnits F → Projectivization ℝ F :=
  Quotient.lift (fun a : Fˣ => Projectivization.mk ℝ (a : F) a.ne_zero) (by sorry)

/-- Its inverse uses the same native projective representative made into a unit. -/
noncomputable def projectivizationToQuotient (F : Type u) [Field F] [Algebra ℝ F] :
    Projectivization ℝ F → ProjectiveUnits F :=
  Projectivization.lift
    (fun a : {x : F // x ≠ 0} => QuotientGroup.mk' (realScalarUnits F) (Units.mk0 a.1 a.2))
    (by sorry)

theorem quotient_projectivization_inverse (a : ProjectiveUnits F) :
    projectivizationToQuotient F (quotientToProjectivization F a) = a := by sorry

theorem projectivization_quotient_inverse (p : Projectivization ℝ F) :
    quotientToProjectivization F (projectivizationToQuotient F p) = p := by sorry

theorem realScalarUnits_isClosed (b : Module.Basis (Fin (n+1)) ℝ F) :
    letI : TopologicalSpace Fˣ := unitsTopology b
    IsClosed (realScalarUnits F : Set Fˣ) := by sorry

/-- Whole family: the topology and actual homeomorphism retain F and b.
The underlying forward map is pinned by the following line-comparison theorem. -/
noncomputable def quotientProjectiveHomeomorph :
    ∀ (F : Type u) [Field F] [Algebra ℝ F] (n : ℕ) (b : Module.Basis (Fin (n+1)) ℝ F),
      letI : TopologicalSpace Fˣ := unitsTopology b
      ProjectiveUnits F ≃ₜ TauCeti.RealProjectiveSpace n := by sorry

/-- Pinned comparison to the actual antipodal sphere quotient, via the native
projectivization carrier; AT4.6 constructs its ratio charts and normalization map. -/
noncomputable def projectivizationSphereEquiv :
    ∀ (F : Type u) [Field F] [Algebra ℝ F] (n : ℕ) (b : Module.Basis (Fin (n+1)) ℝ F),
      Projectivization ℝ F ≃ TauCeti.RealProjectiveSpace n := by sorry

/-- The actual Euclidean coordinate vector, deliberately not the finite-Pi sup norm. -/
noncomputable def euclideanCoordinates (b : Module.Basis (Fin (n+1)) ℝ F) (x : F) :
    EuclideanSpace ℝ (Fin (n+1)) := WithLp.toLp 2 (b.equivFun x)

theorem euclideanCoordinates_ne_zero (b : Module.Basis (Fin (n+1)) ℝ F)
    (x : F) (hx : x ≠ 0) : euclideanCoordinates b x ≠ 0 := by sorry

/-- Unit-sphere membership is proved from hx using norm_smul; the vector is defined. -/
noncomputable def normalizedCoordinates (b : Module.Basis (Fin (n+1)) ℝ F)
    (x : F) (hx : x ≠ 0) : Metric.sphere (0 : EuclideanSpace ℝ (Fin (n+1))) 1 :=
  ⟨‖euclideanCoordinates b x‖⁻¹ • euclideanCoordinates b x, by sorry⟩

theorem projectivizationSphereEquiv_mk (b : Module.Basis (Fin (n+1)) ℝ F)
    (x : F) (hx : x ≠ 0) :
    projectivizationSphereEquiv F n b (Projectivization.mk ℝ x hx) =
      TauCeti.RealProjectiveSpace.mk n (normalizedCoordinates b x hx) := by sorry

theorem quotientProjectiveHomeomorph_line (b : Module.Basis (Fin (n+1)) ℝ F)
    (a : ProjectiveUnits F) :
    quotientProjectiveHomeomorph F n b a =
      projectivizationSphereEquiv F n b (quotientToProjectivization F a) := by sorry

/-- Actual early compact-abelian application, before any complexification or FTA endpoint. -/
theorem projectiveUnits_is_torus (b : Module.Basis (Fin (n+1)) ℝ F) :
    letI : TopologicalSpace Fˣ := unitsTopology b
    ∃ r : ℕ, Nonempty (ProjectiveUnits F ≃ₜ* (Fin r → Circle)) := by sorry

/-- The based fundamental-group comparison forbids every torus rank, including zero. -/
theorem realProjective_not_torus (n : ℕ) (hn : 2 ≤ n) (r : ℕ) :
    ¬ Nonempty (TauCeti.RealProjectiveSpace n ≃ₜ (Fin r → Circle)) := by sorry

/-- This application uses the native RP and product-circle fundamental group maps,
not an algebraic field-classification premise. -/
theorem coordinate_rank_le_two (b : Module.Basis (Fin (n+1)) ℝ F) : n+1 ≤ 2 := by sorry

end FieldCoordinates

/-- The nontrivial-field boundary d=0 is impossible. -/
theorem finrank_pos (F : Type u) [Field F] [Algebra ℝ F] [FiniteDimensional ℝ F] :
    0 < Module.finrank ℝ F := by sorry

/-- The geometric proof uses the actual quotient and the based fundamental-group
obstruction from 6A.2. Native Real.nonempty_algEquiv_or is only an endpoint comparison. -/
theorem finrank_eq_one_or_two (F : Type u) [Field F] [Algebra ℝ F]
    [FiniteDimensional ℝ F] :
    Module.finrank ℝ F = 1 ∨ Module.finrank ℝ F = 2 := by sorry

theorem dimension_one_scalar_equiv (F : Type u) [Field F] [Algebra ℝ F]
    [FiniteDimensional ℝ F] (hd : Module.finrank ℝ F = 1) :
    Nonempty (ℝ ≃ₐ[ℝ] F) := by sorry

/-- Quadratic completion constructs j and the basis (1,j); it does not assume an embedding into C. -/
theorem dimension_two_complex_structure (F : Type u) [Field F] [Algebra ℝ F]
    [FiniteDimensional ℝ F] (hd : Module.finrank ℝ F = 2) :
    ∃ j : F, j*j = -1 ∧ LinearIndependent ℝ (![1,j] : Fin 2 → F) := by sorry

theorem dimension_two_complex_equiv (F : Type u) [Field F] [Algebra ℝ F]
    [FiniteDimensional ℝ F] (hd : Module.finrank ℝ F = 2) :
    ∃ e : ℂ ≃ₐ[ℝ] F, ∀ x y : ℝ, e ⟨x,y⟩ = algebraMap ℝ F x + algebraMap ℝ F y * e Complex.I :=
  by sorry

theorem geometric_finite_real_extension (F : Type u) [Field F] [Algebra ℝ F]
    [FiniteDimensional ℝ F] :
    Nonempty (F ≃ₐ[ℝ] ℝ) ∨ Nonempty (F ≃ₐ[ℝ] ℂ) := by sorry

/-- These are geometric-proof corollaries through the native irreducible field quotient
and the real-dimension tower formula, not uses of native isAlgClosed C. -/
theorem real_irreducible_degree (p : Polynomial ℝ) (hp : Irreducible p) :
    p.natDegree=1 ∨ p.natDegree=2 := by sorry

theorem complex_polynomial_has_root (p : Polynomial ℂ) (hp : 0 < p.natDegree) :
    ∃ z : ℂ, p.eval z=0 := by sorry

end GeometricFiniteExtension

namespace HeisenbergCircleObstruction

local instance : Fact ((0:ℝ)<1) := ⟨by norm_num⟩

abbrev H := TauCeti.HeisenbergGroup ℝ

/-- The source matrix coordinates (a,c,b) are native (x,y,z). -/
def unitriangularMatrix (h : H) : Matrix (Fin 3) (Fin 3) ℝ :=
  !![1,h.x,h.z; 0,1,h.y; 0,0,1]

noncomputable def unitriangular : H →* Matrix.GeneralLinearGroup (Fin 3) ℝ where
  toFun h := ⟨unitriangularMatrix h, unitriangularMatrix h⁻¹, by sorry, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

theorem unitriangular_injective : Function.Injective unitriangular := by sorry

def centralReal (t : ℝ) : H := ⟨0,0,t⟩

/-- Literal period-one central integer lattice, not the full real center. -/
def periodLattice : Subgroup H where
  carrier := {h | h.x=0 ∧ h.y=0 ∧ ∃ m : ℤ, h.z=(m:ℝ)}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

theorem periodLattice_le_center : periodLattice ≤ Subgroup.center H := by sorry

instance periodLattice_normal : periodLattice.Normal :=
  Subgroup.normal_of_le_center periodLattice_le_center

theorem periodLattice_isClosed : IsClosed (periodLattice : Set H) := by sorry

theorem periodLattice_discrete : DiscreteTopology periodLattice := by sorry

abbrev Q := H ⧸ periodLattice

def projection : H →* Q := QuotientGroup.mk' periodLattice

/-- A space map. The multiplication law below records the actual cocycle. -/
noncomputable def quotientCoordinates : Q ≃ₜ ℝ × ℝ × AddCircle (1:ℝ) where
  toFun := Quotient.lift (fun h : H => (h.x,h.y,(h.z : AddCircle (1:ℝ)))) (by sorry)
  invFun p := projection ⟨p.1,p.2.1,(AddCircle.equivIco (1:ℝ) 0 p.2.2).1⟩
  left_inv := by sorry
  right_inv := by sorry
  continuous_toFun := by sorry
  continuous_invFun := by sorry

theorem quotientCoordinates_projection (h : H) :
    quotientCoordinates (projection h) = (h.x,h.y,(h.z : AddCircle (1:ℝ))) := by rfl

theorem quotientCoordinates_mul (a b : Q) :
    quotientCoordinates (a*b) =
      ((quotientCoordinates a).1+(quotientCoordinates b).1,
       (quotientCoordinates a).2.1+(quotientCoordinates b).2.1,
       (quotientCoordinates a).2.2+(quotientCoordinates b).2.2+
         (((quotientCoordinates a).1*(quotientCoordinates b).2.1:ℝ):AddCircle (1:ℝ))) := by sorry

/-- The chosen half-open representative defines the same quotient element for every lift.
Only the proof fields are admitted; the central-circle values are literal. -/
noncomputable def centralCircle : Multiplicative (AddCircle (1:ℝ)) →* Q where
  toFun c := projection (centralReal (AddCircle.equivIco (1:ℝ) 0 (Multiplicative.toAdd c)).1)
  map_one' := by sorry
  map_mul' := by sorry

theorem centralCircle_lift (t : ℝ) :
    centralCircle (Multiplicative.ofAdd (t : AddCircle (1:ℝ))) = projection (centralReal t) := by sorry

/-- Native Fourier evaluation pins the derivative normalization used below. -/
theorem central_fourier_parameter (k : ℤ) (t : ℝ) :
    (TauCeti.fourierChar (1:ℝ) k (Multiplicative.ofAdd (t : AddCircle (1:ℝ))) : ℂ) =
      Complex.exp ((((2*Real.pi:ℝ):ℂ)*Complex.I*(k:ℂ)) * (t:ℂ)) := by sorry

theorem centralCircle_continuous : Continuous centralCircle := by sorry

theorem centralCircle_injective : Function.Injective centralCircle := by sorry

theorem centralCircle_range : centralCircle.range = Subgroup.center Q := by sorry

theorem central_half_ne_one :
    centralCircle (Multiplicative.ofAdd ((1/2:ℝ):AddCircle (1:ℝ))) ≠ 1 := by sorry

/-- Coordinate homomorphism into the additive plane, written multiplicatively. -/
def horizontal : Q →* Multiplicative (ℝ × ℝ) :=
  QuotientGroup.lift periodLattice
    { toFun := fun h : H => Multiplicative.ofAdd (h.x,h.y)
      map_one' := by sorry
      map_mul' := by sorry } (by sorry)

theorem horizontal_surjective : Function.Surjective horizontal := by sorry

theorem horizontal_ker : horizontal.ker = centralCircle.range := by sorry

/-- These paths have the native Heisenberg tangent generators X,Y,Z, respectively. -/
def generatorPath (j : Fin 3) (t : ℝ) : Q :=
  projection (if j=0 then ⟨t,0,0⟩ else if j=1 then ⟨0,t,0⟩ else ⟨0,0,t⟩)

theorem generatorPath_commutator (s t : ℝ) :
    generatorPath 0 s * generatorPath 1 t * (generatorPath 0 s)⁻¹ * (generatorPath 1 t)⁻¹ =
      generatorPath 2 (s*t) := by sorry

section Matrices
variable {m : ℕ}

/-- Actual matrix derivative in a real normed coordinate model, retaining both operands. -/
noncomputable def infinitesimalMatrix (ρ : Q →* Matrix.GeneralLinearGroup (Fin m) ℂ)
    (j : Fin 3) : Matrix (Fin m) (Fin m) ℂ :=
  fderiv ℝ (fun t : ℝ => (ρ (generatorPath j t) : Matrix (Fin m) (Fin m) ℂ)) 0 1

noncomputable def centralWeightSpace (ρ : Q →* Matrix.GeneralLinearGroup (Fin m) ℂ)
    (k : ℤ) : Submodule ℂ (Fin m → ℂ) where
  carrier := {v | ∀ c : Multiplicative (AddCircle (1:ℝ)),
    Matrix.mulVec (ρ (centralCircle c) : Matrix (Fin m) (Fin m) ℂ) v = (TauCeti.fourierChar 1 k c : ℂ) • v}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

theorem centralWeightSpace_isInternal (ρ : Q →* Matrix.GeneralLinearGroup (Fin m) ℂ)
    (hρ : Continuous ρ) : DirectSum.IsInternal (centralWeightSpace ρ) := by sorry

theorem centralWeightSpace_finite_support (ρ : Q →* Matrix.GeneralLinearGroup (Fin m) ℂ)
    (hρ : Continuous ρ) : Set.Finite {k : ℤ | centralWeightSpace ρ k ≠ ⊥} := by sorry

theorem centralWeightSpace_invariant (ρ : Q →* Matrix.GeneralLinearGroup (Fin m) ℂ)
    (k : ℤ) (g : Q) (v : Fin m → ℂ) (hv : v ∈ centralWeightSpace ρ k) :
    Matrix.mulVec (ρ g : Matrix (Fin m) (Fin m) ℂ) v ∈ centralWeightSpace ρ k := by sorry

theorem infinitesimal_preserves_weight (ρ : Q →* Matrix.GeneralLinearGroup (Fin m) ℂ)
    (hρ : Continuous ρ) (k : ℤ) (j : Fin 3) (v : Fin m → ℂ) (hv : v ∈ centralWeightSpace ρ k) :
    (infinitesimalMatrix ρ j).mulVecLin v ∈ centralWeightSpace ρ k := by sorry

/-- Native restriction of the actual differentiated endomorphism. -/
noncomputable def weightDerivative (ρ : Q →* Matrix.GeneralLinearGroup (Fin m) ℂ)
    (hρ : Continuous ρ) (k : ℤ) (j : Fin 3) : Module.End ℂ (centralWeightSpace ρ k) :=
  (infinitesimalMatrix ρ j).mulVecLin.restrict (infinitesimal_preserves_weight ρ hρ k j)

theorem weightDerivative_commutator (ρ : Q →* Matrix.GeneralLinearGroup (Fin m) ℂ)
    (hρ : Continuous ρ) (k : ℤ) :
    weightDerivative ρ hρ k 0 * weightDerivative ρ hρ k 1 -
      weightDerivative ρ hρ k 1 * weightDerivative ρ hρ k 0 = weightDerivative ρ hρ k 2 := by sorry

/-- Period 1 and Fourier action +k fix +2*pi*i*k; no matrix-coefficient sign reversal. -/
theorem weightDerivative_center (ρ : Q →* Matrix.GeneralLinearGroup (Fin m) ℂ)
    (hρ : Continuous ρ) (k : ℤ) :
    weightDerivative ρ hρ k 2 = (((2*Real.pi:ℝ):ℂ) * Complex.I * (k:ℂ)) •
      (1 : Module.End ℂ (centralWeightSpace ρ k)) := by sorry

theorem weight_trace_equation (ρ : Q →* Matrix.GeneralLinearGroup (Fin m) ℂ)
    (hρ : Continuous ρ) (k : ℤ) :
    (((2*Real.pi:ℝ):ℂ)*Complex.I*(k:ℂ)) *
      (Module.finrank ℂ (centralWeightSpace ρ k):ℂ) = 0 := by sorry

theorem nonzero_weight_is_zero (ρ : Q →* Matrix.GeneralLinearGroup (Fin m) ℂ)
    (hρ : Continuous ρ) (k : ℤ) (hk : centralWeightSpace ρ k ≠ ⊥) : k=0 := by sorry

theorem matrix_representation_kills_center (ρ : Q →* Matrix.GeneralLinearGroup (Fin m) ℂ)
    (hρ : Continuous ρ) (c : Multiplicative (AddCircle (1:ℝ))) : ρ (centralCircle c) = 1 := by sorry

theorem matrix_representation_factors_horizontal (ρ : Q →* Matrix.GeneralLinearGroup (Fin m) ℂ)
    (hρ : Continuous ρ) :
    ∃! σ : Multiplicative (ℝ×ℝ) →* Matrix.GeneralLinearGroup (Fin m) ℂ,
      Continuous σ ∧ ρ = σ.comp horizontal := by sorry

end Matrices

/-- Whole arbitrary finite-dimensional carrier, using an actual continuous-linear basis
transport from the matrix theorem; no irreducibility or unitarity hypothesis on π. -/
theorem representation_kills_center {V : Type u} [NormedAddCommGroup V] [NormedSpace ℂ V]
    [FiniteDimensional ℂ V] (π : ContRepresentation ℂ Q V) (hπ : Continuous π)
    (c : Multiplicative (AddCircle (1:ℝ))) :
    π (centralCircle c) = (1 : V →L[ℂ] V) := by sorry

theorem representation_factors_horizontal {V : Type u} [NormedAddCommGroup V]
    [NormedSpace ℂ V] [FiniteDimensional ℂ V]
    (π : ContRepresentation ℂ Q V) (hπ : Continuous π) :
    ∃! σ : ContRepresentation ℂ (Multiplicative (ℝ×ℝ)) V,
      Continuous σ ∧ ∀ g : Q, π g = σ (horizontal g) := by sorry

theorem no_faithful_continuous_matrix_representation (m : ℕ)
    (ρ : Q →* Matrix.GeneralLinearGroup (Fin m) ℂ) (hρ : Continuous ρ) :
    ¬ Function.Injective ρ := by sorry

end HeisenbergCircleObstruction

end TauCetiRoadmap.RepresentationTheory.LieGroups
