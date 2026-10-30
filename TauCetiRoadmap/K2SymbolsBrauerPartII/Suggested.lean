import Mathlib
import TauCeti.NumberTheory.HilbertSymbol.Basic

/-!
# K₂ symbols and Brauer groups, part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems that are statable against the pinned APIs: the field-generic
conic/Hilbert comparison and the real criterion on all field elements.

The symbol-algebra central-simplicity and proper-degree matrix-corner theorems
lack the specified symbol-algebra carrier at the pins. The algebra/Brauer
dictionary, K₂ norm-residue and invariant comparisons,
all-place reciprocity on K₂, the adic Tate symbol and coefficient diagram,
conditional and global adic torsion, the global-field Picard sequence,
the S-integer dictionaries and finite étale Chern comparison
are not statable at the pins: they lack the classical/Milnor K₂ carrier and its
comparison with K-spectra and finite K-groups. The all-weight coefficient dictionary
also lacks the coherent integer-weight finite/adic twist and field étale/Galois
comparison carriers. The arbitrary-DVR residue/localization comparison lacks
the support-purity and finite-twist cohomology carriers. S-integer coefficient
reduction lacks the finite/adic étale twist cohomology carriers. The native root
pairing and its tensor lift do exist; their routine universal-property API stays
in README.md.
-/

namespace TauCetiRoadmap.K2SymbolsBrauerPartII

/-! ## Layer 3: local norm-residue and Hilbert symbols -/

/-- The total conic-solubility sign: one exactly when `r * x² + s * y² = 1`
has a solution. This definition also applies when a coefficient is zero. -/
noncomputable def conicSymbol (F : Type*) [Field F] (r s : F) : ℤˣ := by
  classical
  exact if ∃ x y : F, r * x ^ 2 + s * y ^ 2 = 1 then 1 else -1

/-- Over the reals, failure of solubility is equivalent to both coefficients
being nonpositive. On units this specializes to the usual negative quadrant. -/
theorem conicSymbol_real_eq_neg_one_iff (r s : ℝ) :
    conicSymbol ℝ r s = -1 ↔ r ≤ 0 ∧ s ≤ 0 := by
  sorry

/-- On nonzero coefficients over every field of characteristic different from two,
the conic sign equals the pinned norm-equation Hilbert symbol, including the split
quadratic case. No local-field hypothesis or generic bilinearity is asserted. -/
theorem conicSymbol_eq_hilbertSymbol {F : Type*} [Field F]
    (h2 : (2 : F) ≠ 0) (r s : Fˣ) :
    conicSymbol F (r : F) (s : F) = TauCeti.hilbertSymbol r s := by
  sorry

end TauCetiRoadmap.K2SymbolsBrauerPartII
