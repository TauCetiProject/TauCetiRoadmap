import Mathlib.Analysis.Complex.UpperHalfPlane.Measure
import Mathlib.Analysis.Complex.UpperHalfPlane.Metric
import Mathlib.Analysis.Quaternion
import Mathlib.GroupTheory.Commensurable
import Mathlib.LinearAlgebra.Matrix.ProjectiveSpecialLinearGroup
import Mathlib.MeasureTheory.Group.FundamentalDomain
import Mathlib.NumberTheory.NumberField.DedekindZeta
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.Topology.Algebra.ConstMulAction

/-!
# Kleinian groups and arithmetic volume: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These declarations pin the model of hyperbolic 3-space, its measure and
distance, the quaternionic Moebius action, the Kleinian predicate, covolume, the Bianchi
groups, and the shape of Humbert's formula and of Thurston's question.

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

/-- The topology on `PSL(2, ℂ)`, the quotient topology from `SL(2, ℂ)`. Discreteness of a
subgroup is stated against it, as in `FuchsianOrbifolds`. -/
instance : TopologicalSpace PSL(2, ℂ) := by
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

/-- A Kleinian action: free and properly discontinuous by isometries, so that the quotient
is a manifold. Discreteness and torsion freeness are consequences. -/
def IsKleinian (Γ : Subgroup PSL(2, ℂ)) : Prop := by
  sorry

theorem isKleinian_iff_discrete_and_torsionFree (Γ : Subgroup PSL(2, ℂ)) :
    IsKleinian Γ ↔ (DiscreteTopology Γ ∧ ∀ g : Γ, g ≠ 1 → ¬ IsOfFinOrder g) := by
  sorry

/-- The index law, a corollary of Tau Ceti's general `covolume_eq_card_mul_covolume`, not a
second proof of it. -/
theorem covolume_eq_index_mul_covolume {Γ Δ : Subgroup PSL(2, ℂ)} (h : Δ ≤ Γ) :
    covolume Δ H3 volume = (Γ.relIndex Δ : ℝ≥0∞) * covolume Γ H3 volume := by
  sorry

/-- Cofiniteness, in the shape of `Fuchsian.Covolume.isCofinite_iff_covolume_ne_top`. -/
def IsCofinite (Γ : Subgroup PSL(2, ℂ)) : Prop := covolume Γ H3 volume ≠ ⊤

/-! ## Layer 3: Bianchi groups -/

/-- The Bianchi group `PSL(2, O_F)` of an imaginary quadratic field, through `O_F → ℂ`. -/
def bianchi (F : Type) [Field F] [NumberField F] : Subgroup PSL(2, ℂ) := by
  sorry

/-- The principal congruence subgroup of level `I`. Torsion freeness for the two named
levels is what makes the quotient a manifold rather than an orbifold. -/
def bianchiGamma (F : Type) [Field F] [NumberField F] (I : Ideal (RingOfIntegers F)) :
    Subgroup PSL(2, ℂ) := by
  sorry

/-! ## Layer 4: Humbert's formula and the two special values -/

/-- Catalan's constant. Mathlib has no name for it, so this roadmap introduces one;
identifying it with `DirichletCharacter.LFunction` at the character mod `4` and `s = 2` is a
target of layer 4. -/
noncomputable def catalan : ℝ := ∑' n : ℕ, (-1) ^ n / ((2 * n + 1 : ℝ) ^ 2)

/-- `L(2, χ₋₃)`, written out for the same reason. -/
noncomputable def lchi3 : ℝ := ∑' n : ℕ, (1 / ((3 * n + 1 : ℝ) ^ 2) - 1 / ((3 * n + 2 : ℝ) ^ 2))

/-- **Humbert's formula**, milestone 4b:
`covolume (PSL(2, O_F)) = |d_F|^(3/2) * ζ_F 2 / (4 π²)`. -/
theorem covolume_bianchi (F : Type) [Field F] [NumberField F] :
    (covolume (bianchi F) H3 volume).toReal =
      |(discr F : ℝ)| ^ ((3 : ℝ) / 2) * (dedekindZeta F 2).re / (4 * Real.pi ^ 2) := by
  sorry

/-- The Gaussian Bianchi group `PSL(2, ℤ[i])`. -/
def bianchiGaussian : Subgroup PSL(2, ℂ) := by
  sorry

/-- The Eisenstein Bianchi group `PSL(2, ℤ[ω])`. -/
def bianchiEisenstein : Subgroup PSL(2, ℂ) := by
  sorry

/-- Milestone 4a for `ℚ(i)`: the covolume is Catalan's constant over three. -/
theorem covolume_bianchiGaussian :
    (covolume bianchiGaussian H3 volume).toReal = catalan / 3 := by
  sorry

/-- Milestone 4a for `ℚ(ω)`: the covolume is `√3 · L(2, χ₋₃) / 8`. -/
theorem covolume_bianchiEisenstein :
    (covolume bianchiEisenstein H3 volume).toReal = Real.sqrt 3 * lchi3 / 8 := by
  sorry

/-! ## Layer 5: the set of volumes, and Thurston's question -/

/-- The volumes of finite-volume hyperbolic `3`-manifolds. -/
def hyperbolicVolumes : Set ℝ := by
  sorry

theorem hyperbolicVolumes_nonempty : hyperbolicVolumes.Nonempty := by
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

/-- The finite approximation of layer 5, for a denominator bound `N`: what *is* provable
about the ratio of the two arithmetic volumes. -/
def NoSmallRationalRatio (N : ℕ) : Prop :=
  ∀ q : ℚ, q.den < N → catalan / 3 ≠ (q : ℝ) * (Real.sqrt 3 * lchi3 / 8)

end TauCetiRoadmap.KleinianGroups
