/-
Representative native point/rank interfaces, not an exhaustive checklist.
The README is definitive. These formulas do not implement the Schubert scheme,
its section ring, Frobenius splitting or the general Demazure constructions.
-/
import Mathlib.RingTheory.Grassmannian
import Mathlib.LinearAlgebra.Basis.Flag
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Tactic

noncomputable section

namespace TauCetiRoadmap.SchubertGeometry

universe u v w

variable {k : Type u} [Field k]
variable {M : Type v} [AddCommGroup M] [Module k M]

/-- Combinatorial pivot positions are actual zero-based Fin indices.
A one-based source position p_i corresponds to this index plus one.
The later Schubert-index theorem assumes StrictMono p; forming this count
for an arbitrary list does not certify that hypothesis. -/
def pivotCount {n r : ℕ} (p : Fin r → Fin n) (j : Fin (n + 1)) : ℕ :=
  (Finset.univ.filter fun i => (p i).castSucc < j).card

/-- Rank equalities on the native quotient-rank Grassmannian.
Its toSubmodule is the kernel/subspace, so subspace rank r uses quotient
rank n-r. The subspace-rank equality is retained explicitly here; the
field-specialized rank-at-stalk comparison is the existing MC0G interface. -/
def HasExactPivotRanks {n r : ℕ} (b : Module.Basis (Fin n) k M)
    (p : Fin r → Fin n)
    (U : Module.Grassmannian k M (n - r)) : Prop :=
  Module.finrank k U.toSubmodule = r ∧
    ∀ j : Fin (n + 1),
      Module.finrank k (U.toSubmodule ⊓ b.flag j : Submodule k M) = pivotCount p j

/-- The associated closed rank inequalities on the SAME native points.
The scheme is the universal determinantal incidence construction of the
existing flag/Grassmannian suppliers; a set of points is not that scheme. -/
def HasSchubertRankBounds {n r : ℕ} (b : Module.Basis (Fin n) k M)
    (p : Fin r → Fin n)
    (U : Module.Grassmannian k M (n - r)) : Prop :=
  Module.finrank k U.toSubmodule = r ∧
    ∀ j : Fin (n + 1),
      pivotCount p j ≤ Module.finrank k (U.toSubmodule ⊓ b.flag j : Submodule k M)

theorem exactPivotRanks_imply_bounds {n r : ℕ}
    (b : Module.Basis (Fin n) k M) (p : Fin r → Fin n)
    (U : Module.Grassmannian k M (n - r))
    (h : HasExactPivotRanks b p U) : HasSchubertRankBounds b p U := by
  refine ⟨h.1, ?_⟩
  intro j
  exact le_of_eq (h.2 j).symm

/-- The actual kernel/subspace incidence relation. Quotient ranks are not
confused with subspace ranks when using this in a partial flag. -/
def KernelIncidence {q₁ q₂ : ℕ}
    (U : Module.Grassmannian k M q₁)
    (V : Module.Grassmannian k M q₂) : Prop :=
  U.toSubmodule ≤ V.toSubmodule

theorem kernelIncidence_refl {q : ℕ} (U : Module.Grassmannian k M q) :
    KernelIncidence U U := le_refl _

theorem kernelIncidence_trans {q₁ q₂ q₃ : ℕ}
    {U : Module.Grassmannian k M q₁} {V : Module.Grassmannian k M q₂}
    {W : Module.Grassmannian k M q₃}
    (hUV : KernelIncidence U V) (hVW : KernelIncidence V W) :
    KernelIncidence U W := hUV.trans hVW

/-- Explicitly consume the existing native equality principle on the
quotient carrier; no second Grassmannian is introduced. -/
example {q : ℕ} {U V : Module.Grassmannian k M q}
    (h : U.toSubmodule = V.toSubmodule) : U = V :=
  Module.Grassmannian.ext h

/-- The flag transported by a linear equivalence is the existing native
Basis.flag map, used for changing the ambient coordinate model. -/
example {n : ℕ} (b : Module.Basis (Fin n) k M)
    {M' : Type w} [AddCommGroup M'] [Module k M']
    (e : M ≃ₗ[k] M') (j : Fin (n + 1)) :
    (b.map e).flag j = (b.flag j).map e.toLinearMap :=
  Module.Basis.flag_map b e j

/-- A selected Plücker coordinate on an ACTUAL column-frame matrix.
Its determinant/change-of-frame and scheme/section interpretations consume
GG's minor algebra and the universal Plücker supplier; they are not a
second polynomial straightening theory. All frame and index inputs occur
in this explicit formula. -/
def pluckerCoordinate {n r : ℕ} (A : Matrix (Fin n) (Fin r) k)
    (p : Fin r → Fin n) : k :=
  (A.submatrix p id).det

end TauCetiRoadmap.SchubertGeometry
