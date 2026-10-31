/-
Suggested forms only; the README is definitive and this file is not an exhaustive checklist.
These native carrier lemmas construct links on their actual vertices. They do not
implement geometric realization, PL recognition, or the manifold comparison.
-/
module

public import Mathlib.AlgebraicTopology.SimplicialComplex.Basic
public import Mathlib.Data.Finset.Card
public import Mathlib.Data.Finset.Lattice.Lemmas

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.GeometricTopology

universe u
variable {ι : Type u}

local instance : DecidableEq ι := Classical.decEq ι

/-- Vertices outside the face that extend it to a face. -/
abbrev LinkVertex (K : AbstractSimplicialComplex ι) (σ : Finset ι) : Type u := by
  classical
  exact {v : ι // v ∉ σ ∧ insert v σ ∈ K.faces}

/-- The simplex link uses only its actual vertices and has nonempty faces. -/
noncomputable def simplexLink (K : AbstractSimplicialComplex ι) (σ : Finset ι) :
    AbstractSimplicialComplex (LinkVertex K σ) := by
  classical
  exact
    { faces := {τ : Finset (LinkVertex K σ) | τ.Nonempty ∧ σ ∪ τ.image Subtype.val ∈ K.faces}
      isRelLowerSet_faces := by
        intro τ hτ
        refine ⟨hτ.1, ?_⟩
        intro υ hυτ hυ
        refine ⟨hυ, ?_⟩
        apply (K.isRelLowerSet_faces hτ.2).2
        · exact Finset.union_subset_union_right (Finset.image_subset_image hυτ)
        · exact (Finset.image_nonempty.mpr hυ).mono (Finset.subset_union_right)
      singleton_mem := by
        intro v
        refine ⟨Finset.singleton_nonempty _, ?_⟩
        simpa only [Finset.image_singleton, Finset.union_singleton] using v.property.2 }

@[simp] theorem mem_simplexLink (K : AbstractSimplicialComplex ι) (σ : Finset ι)
    (τ : Finset (LinkVertex K σ)) :
    τ ∈ (simplexLink K σ).faces ↔ τ.Nonempty ∧ σ ∪ τ.image Subtype.val ∈ K.faces := by
  classical
  rfl

@[simp] theorem empty_not_mem_simplexLink (K : AbstractSimplicialComplex ι) (σ : Finset ι) :
    ∅ ∉ (simplexLink K σ).faces := by
  simp

/-- For a maximal face there are no possible link vertices. -/
theorem isEmpty_linkVertex_of_maximal (K : AbstractSimplicialComplex ι) (σ : Finset ι)
    (hmax : ∀ τ ∈ K.faces, σ ⊆ τ → τ = σ) : IsEmpty (LinkVertex K σ) := by
  classical
  refine ⟨fun v => ?_⟩
  have he := hmax _ v.property.2 (Finset.subset_insert _ _)
  have hv : (v : ι) ∈ insert (v : ι) σ := Finset.mem_insert_self _ _
  rw [he] at hv
  exact v.property.1 hv

/-- A complex with only vertices has no vertices in any vertex link. -/
theorem isEmpty_linkVertex_of_dimensionZero (K : AbstractSimplicialComplex ι)
    (hzero : ∀ τ ∈ K.faces, τ.card ≤ 1) (v : ι) :
    IsEmpty (LinkVertex K {v}) := by
  classical
  refine ⟨fun w => ?_⟩
  have hcard := hzero _ w.property.2
  have hbad : 2 ≤ 1 := by
    simpa only [Finset.card_insert_of_notMem w.property.1, Finset.card_singleton] using hcard
  omega

/-- The link of a maximal face has no native faces, including no empty face. -/
theorem faces_simplexLink_eq_empty_of_maximal (K : AbstractSimplicialComplex ι)
    (σ : Finset ι) (hmax : ∀ τ ∈ K.faces, σ ⊆ τ → τ = σ) :
    (simplexLink K σ).faces = ∅ := by
  classical
  apply Set.eq_empty_iff_forall_notMem.mpr
  intro τ hτ
  obtain ⟨v, _⟩ := (mem_simplexLink K σ τ).mp hτ |>.1
  exact (isEmpty_linkVertex_of_maximal K σ hmax).false v

#print axioms LinkVertex
#print axioms simplexLink
#print axioms mem_simplexLink
#print axioms empty_not_mem_simplexLink
#print axioms isEmpty_linkVertex_of_maximal
#print axioms isEmpty_linkVertex_of_dimensionZero
#print axioms faces_simplexLink_eq_empty_of_maximal

end TauCetiRoadmap.GeometricTopology
