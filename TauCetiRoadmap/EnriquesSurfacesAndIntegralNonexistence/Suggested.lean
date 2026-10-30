import Mathlib
import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.Quadratic
import TauCeti.LinearAlgebra.IntegralLattice.Examples
import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.D8Plus.Basic
import TauCeti.LinearAlgebra.IntegralLattice.Orthogonal.Sum
import TauCeti.LinearAlgebra.IntegralLattice.Scaling

/-!
# EnriquesSurfacesAndIntegralNonexistence: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: the positive-cone decomposition in the
Enriques numerical lattice, the dyadic representative comparison, and the two native
discriminant groups with their isotropic classes. The pins are
Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and
Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

The numerical-lattice isometry of an Enriques surface is not statable at these pins:
the geometric Enriques predicate and numerical surface Picard quotient are missing.
General effective-divisor reducibility lacks the Enriques divisor/intersection
interface. The characteristic-dependent fundamental-group computation lacks the
Enriques finite-étale-cover interface. Characteristic-zero lifting after a finite Witt
extension lacks Enriques deformation and polarized-algebraization interfaces.
The canonical-cover, Picard-descent and Enriques-to-Jacobian comparison theorems
lack relative surface Picard spaces, canonical torsors and genus-one surface models.
The configuration exclusions and the restricted-configuration result in arbitrary
characteristic lack those surface and fibre carriers. The W₂ lifting criterion and
miniversal deformation theorem lack Enriques deformation functors. Finite-field
and integral nonexistence lack the Enriques predicate and its algebraic-space family
stack. None is replaced here by an abstract predicate or a bounded substitute.

Curve intersection uses negative root squares. The native discriminant quadratic
map is half the full norm modulo the integers.
-/

namespace TauCetiRoadmap.EnriquesSurfacesAndIntegralNonexistence

open TauCeti

/-! ## Layer 1: half-fibres, canonical coverings and exceptionality -/

/-- The native integral model `U ⊕ E₈(−1)` for the Enriques numerical lattice. -/
noncomputable def enriquesNumericalLattice :
    IntegralLattice ((Fin 2 → ℚ) × (Fin 8 → ℚ)) :=
  IntegralLattice.hyperbolicPlane.orthogonalSum (-IntegralLattice.d8PlusLattice)

/-- Every positive-square integral class in one positive cone of `U ⊕ E₈(−1)`
splits into two nonzero nonnegative-square classes in that cone's closure
(Lang, On Enriques surfaces in characteristic p. I, Theorem 4.2). -/
theorem positive_cone_decomposition (h d : enriquesNumericalLattice)
    (hh : 0 < enriquesNumericalLattice.integralForm h h)
    (hd : 0 < enriquesNumericalLattice.integralForm d d)
    (hdh : 0 < enriquesNumericalLattice.integralForm d h) :
    ∃ d₁ d₂ : enriquesNumericalLattice,
      d = d₁ + d₂ ∧ d₁ ≠ 0 ∧ d₂ ≠ 0 ∧
      0 ≤ enriquesNumericalLattice.integralForm d₁ d₁ ∧
      0 ≤ enriquesNumericalLattice.integralForm d₂ d₂ ∧
      0 < enriquesNumericalLattice.integralForm d₁ h ∧
      0 < enriquesNumericalLattice.integralForm d₂ h := by sorry

/-! ## Layer 3: point counts, dyadic twists and integral Picard constancy -/

/-- The eight rational representatives `(−1)^e 2^a 5^b` of dyadic square classes. -/
def dyadicRepresentative (e a b : Fin 2) : ℚ :=
  (-1) ^ e.val * 2 ^ a.val * 5 ^ b.val

/-- Every nonzero dyadic number has exactly one of the eight specified square classes. -/
theorem dyadic_square_classes (x : ℚ_[2]) (hx : x ≠ 0) :
    ∃! t : Fin 2 × Fin 2 × Fin 2,
      IsSquare (x / (dyadicRepresentative t.1 t.2.1 t.2.2 : ℚ_[2])) := by sorry

/-! ## Layer 6: ten-curve lattices and the I₄* exclusion -/

/-- The first Gram matrix, in the order `(C₁,…,C₈,R,F)` of README 6.1. -/
def firstGram : Matrix (Fin 10) (Fin 10) ℤ := !![
  -2,1,0,0,0,0,0,0,0,0;
  1,-2,1,0,0,0,0,0,0,0;
  0,1,-2,1,0,0,0,0,0,0;
  0,0,1,-2,1,0,0,0,1,0;
  0,0,0,1,-2,1,0,0,0,0;
  0,0,0,0,1,-2,1,1,0,0;
  0,0,0,0,0,1,-2,0,0,0;
  0,0,0,0,0,1,0,-2,0,0;
  0,0,0,1,0,0,0,0,-2,1;
  0,0,0,0,0,0,0,0,1,0]

/-- The second Gram matrix, the orthogonal sum `D₈(−1) ⊕ U`, in README 6.1. -/
def secondGram : Matrix (Fin 10) (Fin 10) ℤ := !![
  -2,1,0,0,0,0,0,0,0,0;
  1,-2,1,0,0,0,0,0,0,0;
  0,1,-2,1,0,0,0,0,0,0;
  0,0,1,-2,1,0,0,0,0,0;
  0,0,0,1,-2,1,0,0,0,0;
  0,0,0,0,1,-2,1,1,0,0;
  0,0,0,0,0,1,-2,0,0,0;
  0,0,0,0,0,1,0,-2,0,0;
  0,0,0,0,0,0,0,0,0,1;
  0,0,0,0,0,0,0,0,1,0]

/-- Specialize the native Gram-lattice constructor to the first integer matrix. -/
noncomputable def firstLattice : IntegralLattice (Fin 10 → ℚ) :=
  IntegralLattice.ofGramMatrix (Pi.basisFun ℚ (Fin 10)) firstGram (by
    apply Matrix.IsSymm.ext
    intro i j
    fin_cases i <;> fin_cases j <;> decide)

/-- Specialize the native Gram-lattice constructor to the second integer matrix. -/
noncomputable def secondLattice : IntegralLattice (Fin 10 → ℚ) :=
  IntegralLattice.ofGramMatrix (Pi.basisFun ℚ (Fin 10)) secondGram (by
    apply Matrix.IsSymm.ext
    intro i j
    fin_cases i <;> fin_cases j <;> decide)

/-- The first ten-curve lattice has discriminant group `(ℤ/2)²`. -/
theorem firstLattice_discriminant_group :
    Nonempty (firstLattice.DiscriminantGroup ≃+ (ZMod 2 × ZMod 2)) := by sorry

/-- Zero and the two spinor classes are exactly the isotropic discriminant classes
of the first ten-curve lattice, which is even, in the native half-norm convention. -/
theorem firstLattice_isotropic_card :
    ∃ hL : firstLattice.IsEven, Nat.card {x : firstLattice.DiscriminantGroup //
      firstLattice.discriminantQuadraticMap hL x = 0} = 3 := by sorry

/-- The second ten-curve lattice has discriminant group `(ℤ/2)²`. -/
theorem secondLattice_discriminant_group :
    Nonempty (secondLattice.DiscriminantGroup ≃+ (ZMod 2 × ZMod 2)) := by sorry

/-- Zero and the two spinor classes are exactly the isotropic discriminant classes
of the second ten-curve lattice, which is even, in the native half-norm convention. -/
theorem secondLattice_isotropic_card :
    ∃ hL : secondLattice.IsEven, Nat.card {x : secondLattice.DiscriminantGroup //
      secondLattice.discriminantQuadraticMap hL x = 0} = 3 := by sorry

end TauCetiRoadmap.EnriquesSurfacesAndIntegralNonexistence
