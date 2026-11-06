import Mathlib
import TauCeti.NumberTheory.HilbertSymbol.Basic

/-!
# K₂ symbols and Brauer groups, part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems that are statable against the pinned APIs: the cyclic symbol
algebra by its universal presentation with its central simplicity and degree,
its splitting over any extension containing a root of `a`, its proper-degree
matrix corner, the field-generic conic/Hilbert comparison and the real criterion
on all field elements.

The algebra/Brauer dictionary, K₂ norm-residue and invariant comparisons,
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

open scoped TensorProduct

namespace TauCetiRoadmap.K2SymbolsBrauerPartII

/-! ## Layer 2: cyclic symbol algebras -/

/-- The three defining relations of the cyclic symbol algebra on the free algebra
on two generators `X = ι 0` and `Y = ι 1`: `X ^ m = a`, `Y ^ m = b` and `Y * X = ζ * (X * Y)`.
The relation `comm` fixes the generator order of README §2.1 (`YX = ζXY`). -/
inductive SymbolRel (F : Type*) [Field F] (m : ℕ) (ζ a b : F) :
    FreeAlgebra F (Fin 2) → FreeAlgebra F (Fin 2) → Prop
  | xpow : SymbolRel F m ζ a b (FreeAlgebra.ι F 0 ^ m) (algebraMap F _ a)
  | ypow : SymbolRel F m ζ a b (FreeAlgebra.ι F 1 ^ m) (algebraMap F _ b)
  | comm : SymbolRel F m ζ a b (FreeAlgebra.ι F 1 * FreeAlgebra.ι F 0)
      (algebraMap F _ ζ * (FreeAlgebra.ι F 0 * FreeAlgebra.ι F 1))

/-- The cyclic symbol algebra `A_ζ(a,b)` of README §2.1, as the `F`-algebra presented by
the three relations `SymbolRel`. Its universal property is the presentation; the finite
free model with basis `e_{i,j}` of §2.1 is isomorphic to it, and the `m²` monomials
`X^i Y^j` form a basis (Weibel, III.6.9). -/
abbrev SymbolAlgebra (F : Type*) [Field F] (m : ℕ) (ζ a b : F) : Type _ :=
  RingQuot (SymbolRel F m ζ a b)

/-- README §2.2: for `m ≥ 2` invertible in `F`, `ζ` a primitive `m`-th root of unity and
units `a`, `b`, the symbol algebra is central simple over `F` of degree `m`, that is of
dimension `m²` (Weibel, III.6.9, pp.240–241). -/
theorem symbolAlgebra_isCentralSimple {F : Type*} [Field F] (m : ℕ) (hm : 2 ≤ m)
    (hmF : IsUnit (m : F)) {ζ : F} (hζ : IsPrimitiveRoot ζ m) (a b : Fˣ) :
    Algebra.IsCentral F (SymbolAlgebra F m ζ a b) ∧ IsSimpleRing (SymbolAlgebra F m ζ a b) ∧
      Module.finrank F (SymbolAlgebra F m ζ a b) = m ^ 2 := by
  sorry

/-- README §2.2: over any field extension `L` of `F` containing an `m`-th root `α` of `a`,
the diagonal-and-shift representation (`X v_i = α ζ^(-i) v_i`, `Y` the forward shift with
wrap factor `b`) splits the symbol algebra: `L ⊗_F A_ζ(a,b) ≃ Mat_m(L)`. No root of `b`
is required. -/
theorem symbolAlgebra_split {F : Type*} [Field F] (m : ℕ) (hm : 2 ≤ m)
    (hmF : IsUnit (m : F)) {ζ : F} (hζ : IsPrimitiveRoot ζ m) (a b : Fˣ)
    (L : Type*) [Field L] [Algebra F L] (α : L) (hα : α ^ m = algebraMap F L (a : F)) :
    Nonempty ((L ⊗[F] SymbolAlgebra F m ζ a b) ≃ₐ[L] Matrix (Fin m) (Fin m) L) := by
  sorry

/-- README §2.3: for a root `α` of `T^m - a` in the separable closure with
`d = [F(α):F]` the degree of its minimal polynomial, `d` divides `m`, `c = α^d` lies in `F`
with `c^(m/d) = a`, and `A_ζ(a,b)` is the `(m/d) × (m/d)` matrix algebra over the degree-`d`
symbol algebra `A_(ζ^(m/d))(c,b)`; at `d = 1` the inner algebra is the degree-one
presentation, which is `F`. -/
theorem symbolAlgebra_matrix_corner {F : Type*} [Field F] (m : ℕ) (hm : 2 ≤ m)
    (hmF : IsUnit (m : F)) {ζ : F} (hζ : IsPrimitiveRoot ζ m) (a b : Fˣ)
    (α : SeparableClosure F) (hα : α ^ m = algebraMap F (SeparableClosure F) (a : F)) :
    (minpoly F α).natDegree ∣ m ∧
      ∃ c : F, algebraMap F (SeparableClosure F) c = α ^ (minpoly F α).natDegree ∧
        c ^ (m / (minpoly F α).natDegree) = (a : F) ∧
        Nonempty (SymbolAlgebra F m ζ a b ≃ₐ[F]
          Matrix (Fin (m / (minpoly F α).natDegree)) (Fin (m / (minpoly F α).natDegree))
            (SymbolAlgebra F (minpoly F α).natDegree (ζ ^ (m / (minpoly F α).natDegree))
              c b)) := by
  sorry

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
