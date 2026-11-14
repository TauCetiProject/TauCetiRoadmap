import Mathlib.Analysis.Complex.UpperHalfPlane.Measure
import Mathlib.Analysis.Complex.UpperHalfPlane.Metric
import Mathlib.Analysis.Quaternion
import Mathlib.GroupTheory.Commensurable
import Mathlib.LinearAlgebra.Matrix.ProjectiveSpecialLinearGroup
import Mathlib.MeasureTheory.Group.FundamentalDomain
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.Topology.Algebra.ConstMulAction
import Mathlib.Topology.Algebra.Group.Matrix
import Mathlib.Topology.Algebra.Group.Quotient

/-!
# Kleinian groups and arithmetic volume: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These declarations pin the model of hyperbolic 3-space, its measure and
distance, the quaternionic Moebius action, the Kleinian predicate, covolume, the Bianchi
groups, the two Bianchi covolumes, and the shape of Thurston's question. Humbert's general
formula is a roadmap-for-a-roadmap in the markdown, not a target, so it has no declaration
here.

Each declaration below is stated in the vocabulary its two-dimensional counterpart already
uses in Mathlib: `MeasureSpace` and `volume` with a `withDensity` description as in
`UpperHalfPlane.volume_def`, a `Dist` instance described by a `cosh` formula as in
`UpperHalfPlane.cosh_dist`, and `MeasureTheory.covolume`.

Fundamental polyhedra, the face-pairing criterion, and the log-sine integrals of layer 4 are
specified in the markdown rather than represented here.
-/

namespace TauCetiRoadmap.KleinianGroups

open MeasureTheory Matrix MulAction NumberField
open scoped MatrixGroups Quaternion ENNReal NNReal

/-! ## Layer 0: the space, its measure, and the action -/

/-- The upper half-space model of hyperbolic `3`-space. The carrier is `EuclideanSpace`, so
that `dist` on the ambient space is the Euclidean one the distance formula below uses and
the ambient `volume` is Lebesgue measure. As with `UpperHalfPlane`, this is a `def` and not
an `abbrev`, so that the subtype's own instances do not compete with the ones declared here.
The model is part of the API: theorems may mention the coordinates. -/
def H3 := {p : EuclideanSpace ℝ (Fin 3) // 0 < p 2}

namespace H3

/-- The underlying point of the ambient space. -/
def coe (p : H3) : EuclideanSpace ℝ (Fin 3) := p.1

instance : CoeOut H3 (EuclideanSpace ℝ (Fin 3)) := ⟨H3.coe⟩

/-- The height of a point, the analogue of `UpperHalfPlane.im`. -/
def height (p : H3) : ℝ := H3.coe p 2

theorem height_pos (p : H3) : 0 < p.height := p.2

instance : TopologicalSpace H3 := .induced H3.coe inferInstance

instance : MeasurableSpace H3 := .comap H3.coe inferInstance

/-- Hyperbolic volume, `dx dy dt / t ^ 3`, as a `MeasureSpace` instance so that `volume`
names it, exactly as `UpperHalfPlane` does in dimension two with `dx dy / y ^ 2`. No
Riemannian machinery is involved. -/
noncomputable instance : MeasureSpace H3 :=
  ⟨(volume.comap H3.coe).withDensity
    fun p ↦ ↑((1 / NNReal.mk p.height p.height_pos.le : ℝ≥0) ^ 3)⟩

/-- The density description of the volume, the analogue of `UpperHalfPlane.volume_def`. -/
theorem volume_def :
    (volume : Measure H3) = (volume.comap H3.coe).withDensity fun p ↦
      ↑((1 / NNReal.mk p.height p.height_pos.le : ℝ≥0) ^ 3) :=
  rfl

/-- Hyperbolic distance, by the same formula as `UpperHalfPlane.dist_eq`. -/
noncomputable instance : Dist H3 :=
  ⟨fun p q ↦ 2 * Real.arsinh (dist (H3.coe p) (H3.coe q) /
    (2 * Real.sqrt (p.height * q.height)))⟩

/-- The closed formula that defines the distance, the analogue of
`UpperHalfPlane.cosh_dist`. -/
theorem cosh_dist (p q : H3) :
    Real.cosh (dist p q) = 1 + dist (H3.coe p) (H3.coe q) ^ 2 / (2 * p.height * q.height) := by
  sorry

end H3

/-- The point `(x, y, t)` as the quaternion `x + y*i + t*j`; the action is defined on
quaternions and the coordinate formula is derived from it. -/
def toQuaternion (p : H3) : ℍ[ℝ] := by
  sorry

/-- The Moebius action of `SL(2,ℂ)` on the upper half-space, `q ↦ (a q + b) (c q + d)⁻¹`. -/
noncomputable instance : MulAction SL(2, ℂ) H3 := by
  sorry

/-- The action factors through the centre; this named homomorphism is the canonical
projective action, and no competing action is exported. -/
noncomputable def pslAction : PSL(2, ℂ) →* Equiv.Perm H3 := by
  sorry

/-- The projective action as a `MulAction`, derived from `pslAction`; covolume and
fundamental domains are stated for it. -/
noncomputable instance : MulAction PSL(2, ℂ) H3 := by
  sorry

theorem isometry_smul (g : PSL(2, ℂ)) (p q : H3) : dist (g • p) (g • q) = dist p q := by
  sorry

/-- `PSL(2, ℂ)` is Hausdorff, the analogue of Tau Ceti's `T2Space PSL(2, ℝ)`. The topology
itself is the quotient topology Mathlib already supplies; nothing here declares a competing
one. Discreteness of a subgroup is stated against it, as in `FuchsianOrbifolds`. -/
instance : T2Space PSL(2, ℂ) := by
  sorry

/-- Measurability of each translation, which the index law of layer 1 needs through Mathlib's
`Subgroup.instMeasurableConstSMul`. -/
instance : MeasurableConstSMul PSL(2, ℂ) H3 := by
  sorry

/-- Invariance of the volume, the analogue of the `SMulInvariantMeasure (GL (Fin 2) ℝ) ℍ`
instance in dimension two. -/
noncomputable instance : SMulInvariantMeasure PSL(2, ℂ) H3 volume := by
  sorry

/-- The slice `y = 0` of the half-space, carrying the upper half-plane. -/
def ofUpperHalfPlane (z : UpperHalfPlane) : H3 := by
  sorry

/-- On that slice the distance is Mathlib's `UpperHalfPlane.dist`: this roadmap and
`FuchsianOrbifolds` may not drift apart. -/
theorem dist_ofUpperHalfPlane (z w : UpperHalfPlane) :
    dist (ofUpperHalfPlane z) (ofUpperHalfPlane w) = dist z w := by
  sorry

/-! ## Layer 1: Kleinian groups and covolume -/

/-- A Kleinian action: free and properly discontinuous, so that the quotient is a manifold.
It is by isometries because every element of `PSL(2, ℂ)` is one (`isometry_smul`), so that
is not a condition. Discreteness and torsion freeness are consequences. -/
def IsKleinian (Γ : Subgroup PSL(2, ℂ)) : Prop :=
  ProperlyDiscontinuousSMul Γ H3 ∧ ∀ p : H3, stabilizer Γ p = ⊥

theorem isKleinian_iff_discrete_and_torsionFree (Γ : Subgroup PSL(2, ℂ)) :
    IsKleinian Γ ↔ (DiscreteTopology Γ ∧ ∀ g : Γ, g ≠ 1 → ¬ IsOfFinOrder g) := by
  sorry

/-- A discrete subgroup of `PSL(2, ℂ)` is countable, so that the index law below applies to
it. -/
theorem countable_of_discrete (Γ : Subgroup PSL(2, ℂ)) [DiscreteTopology Γ] : Countable Γ := by
  sorry

/-- The index law, Tau Ceti's `covolume_eq_card_mul_covolume` specialized to `H3` and not a
second proof of it, with that theorem's orientation and hypotheses: the index `[Γ : Δ]` is
`ENat.card (Γ ⧸ Δ.subgroupOf Γ)`, so that infinite index gives `⊤` rather than the
zero-totalized `Subgroup.index`, and `Γ` is countable with a fundamental domain. A discrete
subgroup satisfies both hypotheses, by `countable_of_discrete` and Tau Ceti's
`exists_isFundamentalDomain_of_properlyDiscontinuousSMul`. -/
theorem covolume_eq_index_mul_covolume {Γ Δ : Subgroup PSL(2, ℂ)} [Countable Γ]
    [HasFundamentalDomain Γ H3 volume] (h : Δ ≤ Γ) :
    covolume Δ H3 volume = ENat.card (Γ ⧸ Δ.subgroupOf Γ) * covolume Γ H3 volume := by
  sorry

/-- Cofiniteness, in the shape of Tau Ceti's Fuchsian `Subgroup.IsCofinite`: discrete, with
finite covolume. Discreteness is a field and not a consequence of the covolume condition,
since a nondiscrete group can have covolume `0`; positivity of the covolume is the theorem
`IsCofinite.covolume_pos` below, not part of the definition. -/
structure IsCofinite (Γ : Subgroup PSL(2, ℂ)) : Prop where
  discreteTopology : DiscreteTopology Γ
  covolume_ne_top : covolume Γ H3 volume ≠ ⊤

/-- The criterion in the shape of `Fuchsian.Covolume.isCofinite_iff_covolume_ne_top`. -/
theorem isCofinite_iff_covolume_ne_top {Γ : Subgroup PSL(2, ℂ)} [DiscreteTopology Γ] :
    IsCofinite Γ ↔ covolume Γ H3 volume ≠ ⊤ :=
  ⟨IsCofinite.covolume_ne_top, fun h ↦ ⟨inferInstance, h⟩⟩

/-- A cofinite group has positive covolume. -/
theorem IsCofinite.covolume_pos {Γ : Subgroup PSL(2, ℂ)} (hΓ : IsCofinite Γ) :
    0 < covolume Γ H3 volume := by
  sorry

/-! ## Layer 3: Bianchi groups -/

/-- The Bianchi group `PSL(2, O_F)` of an imaginary quadratic field `F`, a totally complex
number field of degree `2`, through the chosen embedding `ι : F →+* ℂ`. The embedding is
data, not an instance: the two complex embeddings of `F` give distinct, conjugate subgroups.
Nothing is stated for a general number field; `PSL(2, ℤ)` has infinite covolume on `H3`. -/
def bianchi (F : Type) [Field F] [NumberField F] [IsTotallyComplex F]
    [Fact (Module.finrank ℚ F = 2)] (ι : F →+* ℂ) : Subgroup PSL(2, ℂ) := by
  sorry

theorem isDiscrete_bianchi (F : Type) [Field F] [NumberField F] [IsTotallyComplex F]
    [Fact (Module.finrank ℚ F = 2)] (ι : F →+* ℂ) : DiscreteTopology (bianchi F ι) := by
  sorry

/-- The principal congruence subgroup of level `I`. Torsion freeness for the two named
levels is what makes the quotient a manifold rather than an orbifold. -/
def bianchiGamma (F : Type) [Field F] [NumberField F] [IsTotallyComplex F]
    [Fact (Module.finrank ℚ F = 2)] (ι : F →+* ℂ) (I : Ideal (RingOfIntegers F)) :
    Subgroup PSL(2, ℂ) := by
  sorry

/-- The Gaussian Bianchi group `PSL(2, ℤ[i])`. -/
def bianchiGaussian : Subgroup PSL(2, ℂ) := by
  sorry

/-- The Eisenstein Bianchi group `PSL(2, ℤ[ω])`. -/
def bianchiEisenstein : Subgroup PSL(2, ℂ) := by
  sorry

/-- The congruence subgroup `Γ(2 + i)` of `PSL(2, ℤ[i])`, `bianchiGamma` at the ideal
`(2 + i)` of norm `5`. -/
def gammaGaussian : Subgroup PSL(2, ℂ) := by
  sorry

/-- The congruence subgroup `Γ(3 + ω)` of `PSL(2, ℤ[ω])`, `bianchiGamma` at the ideal
`(3 + ω)` of norm `7`. -/
def gammaEisenstein : Subgroup PSL(2, ℂ) := by
  sorry

/-- `[PSL(2, ℤ[i]) : Γ(2 + i)] = 60`, the order of `PSL(2, 𝔽₅)`: reduction is onto
`SL(2, 𝔽₅)`, of order `120`, and `-1` is not in the kernel. -/
theorem index_gammaGaussian : gammaGaussian.relIndex bianchiGaussian = 60 := by
  sorry

/-- `[PSL(2, ℤ[ω]) : Γ(3 + ω)] = 168`, the order of `PSL(2, 𝔽₇)`. -/
theorem index_gammaEisenstein : gammaEisenstein.relIndex bianchiEisenstein = 168 := by
  sorry

/-- `Γ(2 + i)` is torsion free, so its quotient is a manifold. -/
theorem isKleinian_gammaGaussian : IsKleinian gammaGaussian := by
  sorry

/-- `Γ(3 + ω)` is torsion free, so its quotient is a manifold. -/
theorem isKleinian_gammaEisenstein : IsKleinian gammaEisenstein := by
  sorry

/-! ## Layer 4: the two Bianchi covolumes and their special values -/

/-- Catalan's constant. Mathlib has no name for it — its `catalan` is the Catalan *numbers*
`ℕ → ℕ` — so this roadmap introduces `catalanConstant`; identifying it with
`DirichletCharacter.LFunction` at the character mod `4` and `s = 2` is a target of layer 4. -/
noncomputable def catalanConstant : ℝ := ∑' n : ℕ, (-1) ^ n / ((2 * n + 1 : ℝ) ^ 2)

/-- `L(2, χ₋₃)`, written out for the same reason. -/
noncomputable def lchi3 : ℝ :=
  ∑' n : ℕ, (1 / ((3 * n + 1 : ℝ) ^ 2) - 1 / ((3 * n + 2 : ℝ) ^ 2))

/-- The volume of the manifold `Γ(2 + i) \ H3`, by integration over its explicit polyhedron:
`60` times the Bianchi covolume `catalanConstant / 3`. -/
theorem covolume_gammaGaussian :
    (covolume gammaGaussian H3 volume).toReal = 20 * catalanConstant := by
  sorry

/-- The volume of the manifold `Γ(3 + ω) \ H3`: `168` times the Bianchi covolume
`√3 · L(2, χ₋₃) / 8`. -/
theorem covolume_gammaEisenstein :
    (covolume gammaEisenstein H3 volume).toReal = 21 * Real.sqrt 3 * lchi3 := by
  sorry

/-- The covolume of `PSL(2, ℤ[i])` is Catalan's constant over three, from
`covolume_gammaGaussian` and the index `60` through the index law. This is Humbert's formula
at `d_F = -4`, but it is proved from the polyhedron, not from the general formula. -/
theorem covolume_bianchiGaussian :
    (covolume bianchiGaussian H3 volume).toReal = catalanConstant / 3 := by
  sorry

/-- The covolume of `PSL(2, ℤ[ω])` is `√3 · L(2, χ₋₃) / 8`, from
`covolume_gammaEisenstein` and the index `168`. This is Humbert's formula at `d_F = -3`. -/
theorem covolume_bianchiEisenstein :
    (covolume bianchiEisenstein H3 volume).toReal = Real.sqrt 3 * lchi3 / 8 := by
  sorry

/-! ## Layer 5: the set of volumes, and Thurston's question -/

/-- The volumes of finite-volume hyperbolic `3`-manifolds: `v` is one when some Kleinian
cofinite subgroup of `PSL(2, ℂ)` has real covolume `v`. The witness is the group, so
membership carries it, and `0` is excluded by `IsCofinite.covolume_pos`. -/
def hyperbolicVolumes : Set ℝ :=
  {v | ∃ Γ : Subgroup PSL(2, ℂ),
    IsKleinian Γ ∧ IsCofinite Γ ∧ (covolume Γ H3 volume).toReal = v}

/-- Nonempty, witnessed by `Γ(2 + i)`. -/
theorem hyperbolicVolumes_nonempty : hyperbolicVolumes.Nonempty := by
  sorry

/-- The volume of the manifold `Γ(2 + i) \ H3` is a hyperbolic volume; the Bianchi covolume
`catalanConstant / 3` itself is not, being an orbifold volume below Milley's bound. -/
theorem twenty_catalan_mem_hyperbolicVolumes : 20 * catalanConstant ∈ hyperbolicVolumes := by
  sorry

theorem eisenstein_mem_hyperbolicVolumes : 21 * Real.sqrt 3 * lchi3 ∈ hyperbolicVolumes := by
  sorry

/-- Closure under the degree of a finite cover, which is what the index law gives: a
finite-index subgroup of a Kleinian cofinite group is Kleinian and cofinite, with the index
times the covolume. Closure under every positive integer is not claimed; it would need an
index-`n` subgroup of a witness for every `n`. -/
theorem mul_index_mem_hyperbolicVolumes {Γ Δ : Subgroup PSL(2, ℂ)} (hΓ : IsKleinian Γ)
    (hΓ' : IsCofinite Γ) (h : Δ ≤ Γ) (hn : Δ.relIndex Γ ≠ 0) :
    (Δ.relIndex Γ : ℝ) * (covolume Γ H3 volume).toReal ∈ hyperbolicVolumes := by
  sorry

/-- Commensurable groups have rationally related volumes: the source of every known
rational relation, and what makes the question below non-trivial. -/
theorem rat_ratio_of_commensurable {Γ Δ : Subgroup PSL(2, ℂ)} (h : Subgroup.Commensurable Γ Δ)
    (hΓ : IsCofinite Γ) (hΔ : IsCofinite Δ) :
    ∃ q : ℚ, 0 < q ∧ (covolume Γ H3 volume).toReal = q * (covolume Δ H3 volume).toReal := by
  sorry

/-- **Thurston's question 23**, a statement and not a theorem: the volumes are not all
rationally related. This roadmap delivers the statement; the mathematics is open. -/
def ThurstonQuestion23 : Prop :=
  ∃ v ∈ hyperbolicVolumes, ∃ w ∈ hyperbolicVolumes, ∀ q : ℚ, v ≠ (q : ℝ) * w

/-- The finite approximation of layer 5, for a denominator bound `N`: no rational with
denominator below `N` is the ratio of the two manifold volumes. This predicate for every `N`
is `ThurstonQuestion23` itself for this pair, since a rational `q` is excluded by any
`N > q.den`, so the target is the one explicit bound below and nothing quantifies over `N`. -/
def NoSmallRationalRatio (N : ℕ) : Prop :=
  ∀ q : ℚ, q.den < N → 20 * catalanConstant ≠ (q : ℝ) * (21 * Real.sqrt 3 * lchi3)

/-- The explicit bound, from rigorous enclosures of `catalanConstant` and `lchi3`. -/
theorem noSmallRationalRatio_thousand : NoSmallRationalRatio 1000 := by
  sorry

end TauCetiRoadmap.KleinianGroups
