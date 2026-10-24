import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.Basic.Complex.Basic
import Mathlib.Tactic.NormNum

/-!
These are suggested forms, not an exhaustive checklist. README.md is the
 definitive specification.

Native algebra of the complex point-operator sector after grading is folded
modulo four. The modules and point operators are explicit inputs; no geometric
Floer complex or point-square relation is assumed to have been constructed.
The geometric construction and its coefficient/degree comparisons are in README.
-/

noncomputable section

universe u v w

namespace TauCetiRoadmap.InstantonFloerTheory

variable {V : Type u} {W : Type v} {U : Type w}
variable [AddCommGroup V] [Module ℂ V]
variable [AddCommGroup W] [Module ℂ W]
variable [AddCommGroup U] [Module ℂ U]

/-- The actual native +2 eigenspace, over ℂ and on the supplied module. -/
abbrev plusSector (mu : Module.End ℂ V) : Submodule ℂ V :=
  mu.eigenspace 2

@[simp] theorem mem_plusSector (mu : Module.End ℂ V) (x : V) :
    x ∈ plusSector mu ↔ mu x = (2 : ℂ) • x :=
  Module.End.mem_eigenspace_iff

/-- Restrict an actual intertwiner; its source and target operators are retained. -/
def restrictToPlus (mu : Module.End ℂ V) (nu : Module.End ℂ W)
    (f : V →ₗ[ℂ] W) (hf : nu.comp f = f.comp mu) :
    plusSector mu →ₗ[ℂ] plusSector nu where
  toFun x := ⟨f x, by
    apply (mem_plusSector nu (f x)).2
    have h : nu (f x) = f (mu x) := DFunLike.congr_fun hf (x : V)
    rw [h, (mem_plusSector mu x).1 x.property, map_smul]⟩
  map_add' x y := by
    apply Subtype.ext
    exact map_add f (x : V) (y : V)
  map_smul' c x := by
    apply Subtype.ext
    exact map_smul f c (x : V)

@[simp] theorem restrictToPlus_coe (mu : Module.End ℂ V) (nu : Module.End ℂ W)
    (f : V →ₗ[ℂ] W) (hf : nu.comp f = f.comp mu) (x : plusSector mu) :
    ((restrictToPlus mu nu f hf x : plusSector nu) : W) = f (x : V) := rfl

/-- Composition on sectors follows composition of supplied intertwining maps. -/
theorem restrictToPlus_comp (mu : Module.End ℂ V) (nu : Module.End ℂ W)
    (xi : Module.End ℂ U) (f : V →ₗ[ℂ] W) (g : W →ₗ[ℂ] U)
    (hf : nu.comp f = f.comp mu) (hg : xi.comp g = g.comp nu)
    (hgf : xi.comp (g.comp f) = (g.comp f).comp mu) :
    restrictToPlus mu xi (g.comp f) hgf =
      (restrictToPlus nu xi g hg).comp (restrictToPlus mu nu f hf) := by
  ext x
  rfl

/-- The complex polynomial used once the geometric point-square relation is proved. -/
def plusProjection (mu : Module.End ℂ V) : Module.End ℂ V :=
  (4 : ℂ)⁻¹ • (mu + (2 : ℂ) • LinearMap.id)

/-- Its action on the +2 sector is already an ordinary linear-algebra identity. -/
theorem plusProjection_on_sector (mu : Module.End ℂ V) (x : plusSector mu) :
    plusProjection mu (x : V) = (x : V) := by
  have hx : mu (x : V) = (2 : ℂ) • (x : V) :=
    (mem_plusSector mu x).1 x.property
  calc
    plusProjection mu (x : V) =
        (4 : ℂ)⁻¹ • ((2 : ℂ) • (x : V) + (2 : ℂ) • (x : V)) := by
      simp only [plusProjection, LinearMap.smul_apply, LinearMap.add_apply,
        LinearMap.id_apply, hx]
    _ = (x : V) := by
      rw [← add_smul, smul_smul]
      norm_num

end TauCetiRoadmap.InstantonFloerTheory
