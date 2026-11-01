import Mathlib
import TauCeti.GroupTheory.Coxeter.Geometric

/-!
# Enriques surfaces: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: general Coxeter geometric faithfulness,
its T246 realization and the full image of the mod-two T246 reflection action.

The remaining headlines are not statable at the pins with a few simple definitions.
Layer 1's canonical K3 cover, Picard specialization and integral numerical-lattice
isometry need the Enriques predicate, surface numerical quotient and specialization
maps. Its coefficient comparisons additionally need integral étale cycle maps.
Layer 2's hyperelliptic classification and double-plane theorem need half-fibres,
complete linear systems and their resolved presentation carrier. Layer 3's equivalence
needs that presentation groupoid. Layer 4's Reye-family theorem needs the universal
web degeneracy family and its parameter quotient. Layer 5's normal-closure and
integral overlattice comparisons need the geometric Reye lattice and its marking
adapter; the statable representation headlines below are retained.
Layer 6's nodal automorphism and curve-transitivity theorems need the Reye open locus
and its surface action. Its unnodal lifting criterion, very-general automorphism
theorem and algebraic generic-open theorem need canonical-cover markings, Hodge
isometries, period families and relative Jacobian deformations. Layer 7's model
counts need the source's presentation equivalence relation and its comparison with
the intrinsic groupoid. No formal placeholder for any of these objects is introduced.
-/

namespace TauCetiRoadmap.EnriquesSurfaces

/-! ## Layer 5: the two lattices and the faithful reflection action -/

/-- The standard real geometric representation of any Coxeter system is faithful,
including systems with infinite exponents or degenerate or indefinite standard form
(Davis, second edition, Corollary D.1.2). -/
theorem coxeterGeometricFaithful {I W : Type*} [Group W] {M : CoxeterMatrix I}
    (cs : CoxeterSystem M W) : Function.Injective cs.geometricRepresentation := by
  sorry

/-- The T246 graph has chain 1--9 and the extra edge 0--4. -/
def reyeAdjacent (i j : Fin 10) : Prop :=
  (i.val > 0 ∧ j.val > 0 ∧ (i.val + 1 = j.val ∨ j.val + 1 = i.val)) ∨
  (i = 0 ∧ j = 4) ∨ (i = 4 ∧ j = 0)

/-- Adjacency in this finite graph is decidable. -/
instance reyeAdjacentDecidable (i j : Fin 10) : Decidable (reyeAdjacent i j) := by
  unfold reyeAdjacent
  infer_instance

/-- Coxeter exponents are 1 on the diagonal, 3 on edges and 2 elsewhere. -/
def reyeCoxeterEntry : Matrix (Fin 10) (Fin 10) ℕ :=
  fun i j ↦ if i = j then 1 else if reyeAdjacent i j then 3 else 2

/-- The abstract T246 Coxeter matrix, with its actual entries. -/
def reyeDiagram : CoxeterMatrix (Fin 10) where
  M := reyeCoxeterEntry
  isSymm := by decide +kernel
  diagonal i := by simp [reyeCoxeterEntry]
  off_diagonal i j h := by
    simp only [reyeCoxeterEntry, h, ite_false]
    split_ifs <;> decide

/-- The simple-root coordinates of the Reye lattice modulo twice that lattice. -/
abbrev ReyeReduction := Fin 10 → ZMod 2

/-- Half the even integral norm modulo two; each unoriented edge occurs once. -/
def reyeQuadratic (x : ReyeReduction) : ZMod 2 :=
  (∑ i, x i) + ∑ i, ∑ j,
    if i.val < j.val ∧ reyeAdjacent i j then x i * x j else 0

/-- The polar pairing of the half-norm quadratic form. -/
def reyePolar (x y : ReyeReduction) : ZMod 2 :=
  reyeQuadratic (x + y) - reyeQuadratic x - reyeQuadratic y

/-- The positive T246 root form: diagonal two, minus one along an edge. -/
def reyeRealPairing (x y : Fin 10 → ℝ) : ℝ :=
  2 * (∑ i, x i * y i) - ∑ i, ∑ j,
    if i.val < j.val ∧ reyeAdjacent i j then x i * y j + x j * y i else 0

/-- The actual T246 simple reflections extend to a faithful real representation. -/
theorem reyeGeometricFaithful :
    ∃ ρ : reyeDiagram.Group →* Module.End ℝ (Fin 10 → ℝ),
      Function.Injective ρ ∧
      ∀ i x, ρ (reyeDiagram.toCoxeterSystem.simple i) x =
        x - reyeRealPairing x (Pi.single i 1) • Pi.single i 1 := by
  sorry

/-- The mod-two simple reflections generate exactly the quadratic isometries
fixing the polar radical pointwise, including the nontrivial shear subgroup. -/
theorem reyeReductionImage :
    ∃ ρ : reyeDiagram.Group →* Module.End (ZMod 2) ReyeReduction,
      (∀ i x, ρ (reyeDiagram.toCoxeterSystem.simple i) x =
        x + reyePolar x (Pi.single i 1) • Pi.single i 1) ∧
      ∀ g : ReyeReduction ≃ₗ[ZMod 2] ReyeReduction,
        ((∀ x, reyeQuadratic (g x) = reyeQuadratic x) ∧
          ∀ x, (∀ y, reyePolar x y = 0) → g x = x) ↔
        ∃ w, ∀ x, ρ w x = g x := by
  sorry

end TauCetiRoadmap.EnriquesSurfaces
