import Mathlib
import TauCeti.LinearAlgebra.CliffordAlgebra.RealForm.Basic
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.Kernel
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.Surjectivity
import TauCeti.RepresentationTheory.Spin.OddStructure
import TauCeti.RepresentationTheory.Spin.Irreducible
import TauCeti.LinearAlgebra.CliffordAlgebra.ReflectionLift
import TauCeti.LinearAlgebra.CliffordAlgebra.PBW
import TauCeti.LinearAlgebra.CliffordAlgebra.StandardBivector
import TauCeti.LinearAlgebra.CliffordAlgebra.Quadratic.Lie.LeftRegular
import TauCeti.Algebra.Lie.GeneralLinear.Fock
import TauCeti.LinearAlgebra.CliffordAlgebra.BottPeriodicity
import TauCeti.LinearAlgebra.CliffordAlgebra.Dimension
import TauCeti.LinearAlgebra.CliffordAlgebra.Vectors
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.DoubleCover
import TauCeti.RepresentationTheory.Spin.Dimension
import TauCeti.RepresentationTheory.Spin.Polarization.TypeD.HighestWeight
import TauCeti.RepresentationTheory.Spin.Exceptional.Three.Group
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.LowRank.Six
import TauCeti.LinearAlgebra.CliffordAlgebra.EightPeriodicity
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.Real.Basic
import TauCeti.Algebra.Lie.GeneralLinear.CAR.Decomposition

/-!
# Clifford algebras, the Pin and Spin groups, and spin representations: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

Mathlib has the Clifford algebra `CliffordAlgebra Q` with its universal property (`lift`), the
`ℤ/2`-grading `evenOdd Q`, the even subalgebra, `involute`/`reverse`, the module isomorphism
`CliffordAlgebra.equivExterior`, and -- unusually -- the groups `lipschitzGroup`, `pinGroup`,
`spinGroup` with their `Group` instances and the twisted-conjugation lemmas
`spinGroup.conjAct_smul_range_ι` (see `README.md` for the file-by-file map). It has **no double-cover
theorem** (nothing says `Spin(V) → SO(V)` is onto with kernel `{±1}`), **no spin module** (`⋀·W` is
never made a Clifford module), **no `𝔰𝔬(V) ≅ ⋀²V`**, **no spin/half-spin representation**, **no
highest-weight identification**, **no exceptional isomorphisms**, **no Bott-periodic real
classification**, **no triality**, **no Lie-algebra action through the Clifford algebra** (the
quadratic realization of `𝔰𝔬(V, Q)` exists for no form, so no homomorphism `𝔤 → 𝔰𝔬(V, Q)` makes a
Clifford module a `𝔤`-module), and **no Kostant `ρ`-decomposition corollary** (`Cliff(𝔤, B) ≅ ⋀𝔤`
under left multiplication by the quadratic lift of the adjoint representation is isotypic).

Tau Ceti's native orthogonal carriers, vector-range equivalence, Pin/Spin actions and
surjectivity/kernel interfaces are consumed below; the preceding absence claims describe
Mathlib alone. The design follows the layers of `README.md`: the two gradings and the filtration
(`CliffordAlgebra.filtration`, `CliffordAlgebra.filtrationGradedEquiv`), the complex structure theorem,
the native Pin/Spin
interfaces (`TauCeti.QuadraticMap.orthogonalGroup`, `CliffordAlgebra.ιRangeEquiv`,
`CliffordAlgebra.pinToOrthogonal`, `CliffordAlgebra.spinToSpecialOrthogonal` and their
surjectivity/kernel specializations), the Lie algebra `⋀²V`
(`soEquivBivector`), the spin modules (`TauCeti.spinAction`, `TauCeti.spinRep`, `TauCeti.spinPlus`), the low-dimensional
isomorphisms (`spin3_equiv_sl2`, `spin6_equiv_sl4`), the real forms and Bott periodicity
(`realCliffordForm`, `cliff_bott`, `spinPQ`), triality (`trialityAut`), and Lie
algebras acting through the Clifford algebra and Kostant's isotypy corollary (`cliffordBivector`,
`soEquivQuadratic`, `cliffordInducedRep`, `adjointSO`, `kostant_isotypic`, `kostant_multiplicity`,
and the CAR worked instance `traceQuadraticForm`, `glCliffordHom`, `car_isotypic`,
`car_simple_highestWeight`). `README.md` remains the definitive document.
-/

/-! Exact native interfaces consumed by the inventory and full layers. These checks expose
the actual hypotheses; they are not an imported-proof-closure or whole-roadmap acceptance. -/
#check CliffordAlgebra.filtration
#check CliffordAlgebra.filtration_mul
#check CliffordAlgebra.filtrationGradedEquiv
#check CliffordAlgebra.associatedGradedEquivExterior
#check CliffordAlgebra.finrank_eq_two_pow
#check TauCeti.ExteriorAlgebra.finrank_eq_two_pow
#check CliffordAlgebra.ι_injective
#check CliffordAlgebra.ιRangeEquiv
#check TauCeti.QuadraticMap.orthogonalGroup
#check TauCeti.QuadraticMap.specialOrthogonalGroup
#check CliffordAlgebra.pinToOrthogonal
#check CliffordAlgebra.spinToSpecialOrthogonal
#check CliffordAlgebra.spinToSpecialOrthogonal_surjective
#check CliffordAlgebra.card_ker_spinToSpecialOrthogonal
#check CliffordAlgebra.spinDoubleCover
#check CliffordAlgebra.ker_spinToSpecialOrthogonal_eq_bot_of_subsingleton
#check CliffordAlgebra.spinToSpecialOrthogonal_bijective_of_subsingleton
#check CliffordAlgebra.instSubsingletonSpinGroup
#check CliffordAlgebra.lipschitzGroup_eq_bot
#check CliffordAlgebra.bivector
#check CliffordAlgebra.bivector_lie_ι
#check CliffordAlgebra.bivectorLieRing
#check CliffordAlgebra.bivectorLieAlgebra
#check CliffordAlgebra.bivectorEquivSo
#check CliffordAlgebra.bivectorEquivSo_apply_ιMulti_mulVec
#check TauCeti.SpinPolarizationData
#check TauCeti.SpinPolarizationData.ofNondegenerate
#check TauCeti.SpinPolarizationData.finrank_W_eq_of_finrank_eq_two_mul
#check TauCeti.SpinPolarizationData.finrank_W_eq_of_finrank_eq_two_mul_add_one
#check TauCeti.spinAction
#check TauCeti.spinRep
#check TauCeti.pinRep
#check TauCeti.spinPlus
#check TauCeti.spinMinus
#check TauCeti.spinPlus_invariant
#check TauCeti.spinMinus_invariant
#check TauCeti.spinPlusSubrep
#check TauCeti.spinMinusSubrep
#check TauCeti.spinRep_isIrreducible_of_odd
#check CliffordAlgebra.span_spinGroup_eq_even
#check CliffordAlgebra.span_spinGroup_eq_even_of_isSquare
#check CliffordAlgebra.nonempty_algEquiv_matrix_of_finrank_eq_two_mul
#check CliffordAlgebra.nonempty_algEquiv_matrix_prod_of_finrank_eq_two_mul_add_one
#check CliffordAlgebra.nonempty_algEquiv_even_matrix_of_finrank_eq_two_mul_add_one
#check TauCeti.SpinPolarizationData.evenCliffordEquivProdEnd
#check TauCeti.finrank_spinPlus
#check TauCeti.finrank_spinMinus
#check TauCeti.SpinPolarizationData.isHighestWeightVector_typeDSpinPlusLieRep_exteriorBasis_univ_of_even
#check TauCeti.SpinPolarizationData.isHighestWeightVector_typeDSpinMinusLieRep_exteriorBasis_univ_of_odd
#check TauCeti.SpinPolarizationData.isHighestWeightVector_typeDSpinPlusLieRep_exteriorBasis_univ_erase_last_of_odd
#check TauCeti.SpinPolarizationData.isHighestWeightVector_typeDSpinMinusLieRep_exteriorBasis_univ_erase_last_of_even
#check TauCeti.nonempty_spinGroup_mulEquiv_specialLinearGroup_of_finrank_eq_three
#check CliffordAlgebra.range_spinGroup_toUnits_ne_evenUnitaryGroup_of_six_le_finrank
#check TauCeti.realCliffordBottEquiv
#check TauCeti.nonempty_realCliffordEightPeriodicityEquiv
#check CliffordAlgebra.realCliffordSpinGroup
#check CliffordAlgebra.soEquivQuadratic
#check CliffordAlgebra.soEquivQuadratic_lie_ι
#check CliffordAlgebra.quadraticLieSubalgebra
#check CliffordAlgebra.cliffordInducedRep
#check CliffordAlgebra.cliffordInducedRep_apply
#check CliffordAlgebra.cliffordDerivationRep
#check TauCeti.LieAlgebra.adjointSO
#check TauCeti.LieAlgebra.adjointSO_apply
#check TauCeti.LieAlgebra.killingQuadraticForm
#check TauCeti.LieAlgebra.killingQuadraticForm_apply
#check CliffordAlgebra.adjointCliffordHom
#check CliffordAlgebra.adjointCliffordHom_lie_ι
#check CliffordAlgebra.kostantLieRingModule
#check CliffordAlgebra.kostantLieModule
#check CliffordAlgebra.kostant_lie_def
#check TauCeti.traceQuadraticForm
#check TauCeti.traceQuadraticForm_apply
#check TauCeti.polarBilin_traceQuadraticForm
#check TauCeti.glCliffordHom
#check TauCeti.glCliffordHom_single
#check TauCeti.glCliffordHom_lie_ι
#check TauCeti.glCliffordHom_normalOrdering
#check TauCeti.carLieRingModule
#check TauCeti.carLieModule
#check TauCeti.car_lie_def
#check TauCeti.exists_isGlHighestWeightVector_glHalfStaircase_car
#check TauCeti.isIsotypicOfType_glIrreducible_car
#check TauCeti.nonempty_lieModuleEquiv_directSum_glIrreducible_car
#check TauCeti.finrank_glIrreducible_glHalfStaircase

namespace TauCetiRoadmap.RepresentationTheory.SpinRepresentations

/-- The full normalized real Clifford cover, with concrete membership. Native `pinGroup`
retains only norm +1. Group closure is a Layer7 target; the indefinite orthogonal covering
and topology statements require the finite-dimensional nondegenerate hypotheses in README. -/
def normalizedRealCliffordCover {M : Type*} [AddCommGroup M] [Module ℝ M]
    (Q : QuadraticForm ℝ M) : Subgroup (CliffordAlgebra Q)ˣ where
  carrier := {x | x ∈ lipschitzGroup Q ∧
    ((x : CliffordAlgebra Q) * star (x : CliffordAlgebra Q) = 1 ∨
     (x : CliffordAlgebra Q) * star (x : CliffordAlgebra Q) = -1)}
  one_mem' := by simp
  mul_mem' := by sorry
  inv_mem' := by sorry


open CliffordAlgebra
open scoped Classical DirectSum Quaternion TensorProduct

-- Mathlib deliberately keeps the commutator Lie structure on associative rings local.
-- This roadmap uses it throughout for Clifford algebras, endomorphisms, and matrices.
attribute [local instance 100] LieRing.ofAssociativeRing

universe u v

variable {R : Type u} [CommRing R] {M : Type v} [AddCommGroup M] [Module R M]

/-! ### The Clifford algebra, its universal property, and the two gradings

The universal property (`CliffordAlgebra.lift`), the `ℤ/2`-grading (`CliffordAlgebra.evenOdd`,
`gradedAlgebra`), the even subalgebra, and `involute`/`reverse` are **consumed** from Mathlib. The
degree filtration and its associated-graded exterior-algebra equivalence are consumed from Tau Ceti
below, with their actual quotient carriers and multiplication comparison. -/

/-! Consume native `CliffordAlgebra.filtration`, its degree-quotient
`CliffordAlgebra.filtrationGradedEquiv`, and the full algebra equivalence
`CliffordAlgebra.associatedGradedEquivExterior`. The quotient API uses the actual
word-filtration `GradedPiece`, canonically the preceding-step quotient. These are
native constructions; no local admitted filtration or graded-equivalence alias is introduced. -/

/-- The existing multiplicativity target follows from the stronger native equality. -/
theorem filtration_mul_le (Q : QuadraticForm R M) (i j : ℕ) :
    CliffordAlgebra.filtration Q i * CliffordAlgebra.filtration Q j ≤
      CliffordAlgebra.filtration Q (i + j) := by
  exact (CliffordAlgebra.filtration_mul Q i j).le

/-- The total dimension: `dim (Cliff Q) = 2 ^ dim M`, matching `∑ₖ (dim M).choose k`. -/
theorem finrank_cliffordAlgebra (Q : QuadraticForm R M) [Invertible (2 : R)]
    [Nontrivial R] [Module.Free R M] [Module.Finite R M] :
    Module.finrank R (CliffordAlgebra Q) = 2 ^ Module.finrank R M := by
  exact CliffordAlgebra.finrank_eq_two_pow Q

/-! ### The structure theorem (over an algebraically closed field, here `ℂ`) -/

/-- **Even dimension**: `Cliff(V, Q) ≅ M_{2^l}(ℂ)` for `Q` nondegenerate on a `2l`-dimensional `V`. -/
theorem cliffordAlgebra_equiv_matrix_of_even {V : Type v} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (l : ℕ)
    (hV : Module.finrank ℂ V = 2 * l) :
    Nonempty (CliffordAlgebra Q ≃ₐ[ℂ] Matrix (Fin (2 ^ l)) (Fin (2 ^ l)) ℂ) := by
  exact CliffordAlgebra.nonempty_algEquiv_matrix_of_finrank_eq_two_mul hQ hV

/-- **Odd dimension**: `Cliff(V, Q) ≅ M_{2^l}(ℂ) × M_{2^l}(ℂ)` for `Q` nondegenerate on a
`(2l+1)`-dimensional `V`; the two factors are the source of the two `Pin` restrictions. -/
theorem cliffordAlgebra_equiv_matrix_prod_of_odd {V : Type v} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (l : ℕ)
    (hV : Module.finrank ℂ V = 2 * l + 1) :
    Nonempty (CliffordAlgebra Q ≃ₐ[ℂ]
      Matrix (Fin (2 ^ l)) (Fin (2 ^ l)) ℂ × Matrix (Fin (2 ^ l)) (Fin (2 ^ l)) ℂ) := by
  exact CliffordAlgebra.nonempty_algEquiv_matrix_prod_of_finrank_eq_two_mul_add_one hQ hV

/-! ### The native Pin and Spin actions and their double-cover interfaces

Consume `TauCeti.QuadraticMap.orthogonalGroup` and `specialOrthogonalGroup` directly.
The native `CliffordAlgebra.ιRangeEquiv`, `pinToOrthogonal` and
`spinToSpecialOrthogonal` use `[Invertible (2 : R)]` over the standing commutative
ring/module carriers, without nondegeneracy, finite-generation or freeness assumptions.
The surjectivity and kernel specializations below keep their stated finite-dimensional,
nondegenerate and positive-dimension hypotheses. -/

/-- **The double cover, surjectivity** (Cartan-Dieudonné: every isometry is a product of reflections),
for finite-dimensional `V` over `ℂ` (algebraically closed) with nondegenerate `Q`.
For a general field with2 invertible and the same dimension/nondegeneracy hypotheses,
consume native `CliffordAlgebra.range_spinToSpecialOrthogonal_eq_ker_spinorNorm`,
whose spinor-norm codomain is `Multiplicative (TauCeti.SquareClassGroup K)`.
The literal unit-square quotient is compared by `TauCeti.multiplicativeSquareClassEquiv`;
exactness at SO does not assert surjectivity onto every square class. -/
theorem spinToSpecialOrthogonal_surjective {V : Type v} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) :
    Function.Surjective (CliffordAlgebra.spinToSpecialOrthogonal Q) := by
  exact CliffordAlgebra.spinToSpecialOrthogonal_surjective Q hQ

/-- **The double cover, kernel `{±1}`**: `1 → ℤ/2 → Spin(V) → SO(V) → 1`. The positive-dimension
hypothesis is essential: for `V = 0` the spin group and `SO(0)` are both trivial and the kernel has
cardinality `1`. -/
theorem card_ker_spinToSpecialOrthogonal {V : Type v} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (hV : 0 < Module.finrank ℂ V)
    (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) :
    Nat.card (MonoidHom.ker (CliffordAlgebra.spinToSpecialOrthogonal Q)) = 2 := by
  exact CliffordAlgebra.card_ker_spinToSpecialOrthogonal hV Q hQ

/-! ### The Lie algebra `𝔰𝔬(V) ≅ ⋀²V` inside the Clifford algebra -/

/-- **The bivector Lie ring**: the bracket on `⋀[R]^2 (Fin n → R)` transported from the Clifford
**commutator** through the **half-normalized** embedding
`w₁ ∧ w₂ ↦ ⅟2 • (ι w₁ · ι w₂ - ι w₂ · ι w₁)` into the even Clifford algebra of the standard form
(the `⅟2` is forced by the action pin below: the raw commutator's adjoint action carries an extra
factor of two, and transporting the bracket through the raw embedding while pinning the halved
action would not be a Lie homomorphism). Defining the bracket on the Clifford side is what keeps
`soEquivBivector` below a faithful statement — a bracket transported backwards from `so` would make
the Lie equivalence tautological. `[Invertible (2 : R)]` is required for the normalization (and the
equivalence itself is **false in characteristic 2**: for `n = 1`, `⋀²(𝔽₂) = 0` while
`so(1, 𝔽₂) ≅ 𝔽₂`). Scoped instances: roadmap-local. -/
noncomputable scoped instance bivectorLieRing (n : ℕ) (R : Type u) [CommRing R]
    [Invertible (2 : R)] : LieRing (⋀[R]^2 (Fin n → R)) := CliffordAlgebra.bivectorLieRing (QuadraticMap.weightedSumSquares R (1 : Fin n → R))

noncomputable scoped instance bivectorLieAlgebra (n : ℕ) (R : Type u) [CommRing R]
    [Invertible (2 : R)] : LieAlgebra R (⋀[R]^2 (Fin n → R)) := CliffordAlgebra.bivectorLieAlgebra (QuadraticMap.weightedSumSquares R (1 : Fin n → R))

/-- **Bivectors are `𝔰𝔬(V)`** — as **Lie algebras**, with the Clifford-commutator bracket of
`bivectorLieRing` on the left: a `LinearEquiv` would be pure rank-counting (`n(n-1)/2` on both
sides) and carry none of the content that bivectors under the Clifford commutator *are* `𝔰𝔬`.
The normalization is fixed by the action (`soEquivBivector_wedge_mulVec` below), not by a
hard-coded `½`. Stated for the standard form here; the bracket of a bivector with `ι v` is the
differential of the conjugation action that defines the double cover. -/
noncomputable def soEquivBivector (n : ℕ) (R : Type u) [CommRing R] [Invertible (2 : R)] :
    ⋀[R]^2 (Fin n → R) ≃ₗ⁅R⁆ ↥(LieAlgebra.Orthogonal.so (Fin n) R) := CliffordAlgebra.bivectorEquivSo n R

/-- **The action-normalization pin** for `soEquivBivector`: the image of `u ∧ v` (embedded with the
`⅟2` normalization of `bivectorLieRing`, whose Clifford adjoint action is then exactly
`x ↦ polar(v, x) • u - polar(u, x) • v` with `polar(u, x) = 2 ∑ᵢ uᵢ xᵢ` for the standard form) acts
by that formula. This pins which Lie equivalence `soEquivBivector` is (any automorphism of `so`
composed with it would otherwise also satisfy the bare equivalence), and fixes the `⅟2`-vs-raw
embedding choice consistently with the bracket transport. -/
theorem soEquivBivector_wedge_mulVec (n : ℕ) (R : Type u) [CommRing R] [Invertible (2 : R)]
    (u v x : Fin n → R) :
    ((soEquivBivector n R (exteriorPower.ιMulti R 2 ![u, v]) : Matrix (Fin n) (Fin n) R)).mulVec x
      = (2 * ∑ i, v i * x i) • u - (2 * ∑ i, u i * x i) • v := by
  exact CliffordAlgebra.bivectorEquivSo_apply_ιMulti_mulVec n R u v x

/-! ### The spin and half-spin representations (over `ℂ`) -/

/-- A maximal isotropic subspace is supplied by the native polarization existence theorem. -/
theorem exists_maximalIsotropic {V : Type v} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (l : ℕ) (hV : Module.finrank ℂ V = 2 * l) :
    ∃ W : Submodule ℂ V, Module.finrank ℂ W = l ∧ ∀ x ∈ W, Q x = 0 := by
  let P := TauCeti.SpinPolarizationData.ofNondegenerate Q hQ
  refine ⟨P.W, P.finrank_W_eq_of_finrank_eq_two_mul hV, ?_⟩
  intro x hx
  exact P.isotropic_W ⟨x, hx⟩

/-! Use the native `TauCeti.SpinPolarizationData`, `TauCeti.spinAction`, `TauCeti.spinRep`,
`TauCeti.spinPlus` and `TauCeti.spinMinus` directly. The polarization includes the actual
`decompositionEquiv`, the polar `pairingEquiv`, and `lineCoordinate` whose square is Q.
Its native action equations pin creation, contraction and the odd parity scaling, so there is
no separate admitted model or unspecified intertwiner. The group-level irreducibility bridge is
`CliffordAlgebra.span_spinGroup_eq_even`, consumed by `TauCeti`'s native group theorems. -/

/-- The even exterior-parity summand is Spin-invariant when the polarization has no odd line.
This is the even-dimensional hypothesis; it cannot be omitted in odd dimensions above one. -/
theorem spinPlus_invariant {V : Type v} [AddCommGroup V] [Module ℂ V] (Q : QuadraticForm ℂ V)
    (P : TauCeti.SpinPolarizationData Q) (hline : P.line = ⊥) (g : spinGroup Q) :
    (TauCeti.spinPlus Q P).map (TauCeti.spinRep Q P g) ≤ TauCeti.spinPlus Q P := by
  exact TauCeti.spinPlus_invariant P hline g

/-- The exterior-algebra dimension is the native finite-dimensional theorem. -/
theorem finrank_exteriorAlgebra {W : Type v} [AddCommGroup W] [Module ℂ W]
    [FiniteDimensional ℂ W] :
    Module.finrank ℂ (ExteriorAlgebra ℂ W) = 2 ^ Module.finrank ℂ W := by
  exact TauCeti.ExteriorAlgebra.finrank_eq_two_pow

/-- The dimension corollary on the same native polarization carrier. -/
theorem finrank_spinRep {V : Type v} [AddCommGroup V] [Module ℂ V] (Q : QuadraticForm ℂ V)
    (P : TauCeti.SpinPolarizationData Q) [FiniteDimensional ℂ P.W] (l : ℕ)
    (hW : Module.finrank ℂ P.W = l) :
    Module.finrank ℂ (ExteriorAlgebra ℂ P.W) = 2 ^ l := by
  rw [TauCeti.ExteriorAlgebra.finrank_eq_two_pow, hW]

/-- Odd-dimensional GROUP irreducibility consumes the native even-Clifford span and
odd-volume surjectivity proof, not just simplicity for the full Clifford algebra. -/
theorem spinRep_isIrreducible_of_odd {V : Type v} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (Q : QuadraticForm ℂ V)
    (P : TauCeti.SpinPolarizationData Q) (l : ℕ) (hV : Module.finrank ℂ V = 2 * l + 1) :
    (TauCeti.spinRep Q P).IsIrreducible := by
  exact TauCeti.spinRep_isIrreducible_of_odd P l hV

/-! ### The fundamental representations of `Bₗ` and `Dₗ`

The highest-weight identification is a **Lie-algebra** statement (`S` as a `LieModule ℂ 𝔰𝔬(V) S` via the
native abstract realization `CliffordAlgebra.soEquivQuadratic` for Q), stated against [`../LieHighestWeight`](../LieHighestWeight/README.md) and
[`../RootSystems`](../RootSystems/README.md); those objects are not yet in Mathlib, so only the dimension
milestones are pinned here. For Cartan Hᵢ=Nᵢ−1/2, choose positive roots eᵢ±eⱼ (i<j),
and eᵢ in type B. The top wedge has weight ωₗ=½(1,…,1). In type D (l≥2), S⁺ is even
exterior parity: for even l its highest weight is ωₗ and S⁻ has ωₗ₋₁; for odd l these
assignments reverse. The other highest wedge omits the last basis vector. Keep the so(2)
weights −1/2 on S⁺ and +1/2 on S⁻ and rank0 separate. These half-integral weights lie outside
the lattice generated by vector weights ±eᵢ, hence outside every tensor power of the standard module. The
Lie module is constructed algebraically from `spinAction` and the native quadratic realization;
the differential of the actual group representation is compared with it in a separate branch,
not used to construct the highest-weight theorem. -/

/-- The half-spin representation of `𝔰𝔬(2l)` has dimension `2^{l-1}`. The intended domain is
`1 ≤ l`, carried explicitly. At `l=0`, exterior parity still gives `S⁺=ℂ` and `S⁻=0`;
the equal positive-half-spin dimension formula is not asserted for both parts. -/
theorem finrank_spinPlus {V : Type v} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (Q : QuadraticForm ℂ V) (P : TauCeti.SpinPolarizationData Q) (l : ℕ) (hl : 1 ≤ l)
    (hW : Module.finrank ℂ P.W = l) :
    Module.finrank ℂ (TauCeti.spinPlus Q P) = 2 ^ (l - 1) := by
  have hWne : P.W ≠ ⊥ := by
    intro h
    have hz : Module.finrank ℂ P.W = 0 := by rw [h]; simp
    omega
  simpa only [hW] using TauCeti.finrank_spinPlus P hWne

/-! ### The low-dimensional exceptional isomorphisms -/

/-- **`Spin₃ ≅ SL₂`** (type `B₁ = A₁`); the `2`-dimensional spin representation is the standard
representation of `SL₂`. Over `ℝ` this is `Spin(3) ≅ SU(2)`. The isomorphism needs three steps:
`even Cliff(V, Q) ≅ M₂(ℂ)`; identify the image of the actual generated `spinGroup Q` with the
determinant-one subgroup using its norm and vector-preservation comparison; and prove that image
is exactly `SL₂`, both directions. Native `spinGroup Q` is the generated Spin carrier, not all even
unitary Clifford elements. Its positive-dimensional nondegenerate membership characterization
includes evenness, the native norm/`star` condition and preservation of the vector image. This
`Spin₃` target identifies that actual carrier with `SL₂(ℂ)`; the topology and differential
refinements are owned separately in README's concrete Spin comparison branches. -/
theorem spin3_equiv_sl2 {V : Type v} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (hV : Module.finrank ℂ V = 3) :
    Nonempty (spinGroup Q ≃* Matrix.SpecialLinearGroup (Fin 2) ℂ) := by
  exact TauCeti.nonempty_spinGroup_mulEquiv_specialLinearGroup_of_finrank_eq_three hQ hV

/-- **`Spin₆ ≅ SL₄`** (type `D₃ = A₃`); `S⁺ ≅ ℂ⁴` is standard and `S⁻ ≅ (ℂ⁴)*` is its dual
under the chosen group isomorphism. The even Clifford algebra is
`End(S⁺) × End(S⁻) ≅ M₄(ℂ) × M₄(ℂ)`. With reversal-compatible duality, reversal exchanges
its two dual blocks. Norm one alone gives `GL₄(ℂ)`; the additional vector-preservation
condition in native Spin membership cuts this to `SL₄(ℂ)`. Prove that one half-spin projection
restricted to the actual Spin subgroup is faithful and onto `SL₄`. The intermediate
`Spin₄ ≅ SL₂ × SL₂` and `Spin₅ ≅ Sp₄` retain their complete membership/image comparisons.
The isomorphism is required for every nondegenerate complex form of dimension6. -/
theorem spin6_equiv_sl4 {V : Type v} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (hV : Module.finrank ℂ V = 6) :
    Nonempty (spinGroup Q ≃* Matrix.SpecialLinearGroup (Fin 4) ℂ) := sorry

/-! ### Real Clifford algebras, Bott periodicity, and `Spin(p, q)` -/

/- The four real base entries and their generator formulas are the implemented native
TauCeti.realCliffordOneZeroEquivProd, realCliffordZeroOneEquivComplex,
realCliffordZeroTwoEquivQuaternion and realCliffordOneOneEquivMatrix, with their
`_ι` lemmas. The Bott recurrence below consumes the native realCliffordBottEquiv on the same forms. -/

/-- **Bott periodicity** `Cliff(p+1, q+1) ≅ Cliff(p, q) ⊗ M₂(ℝ)`, built from `CliffordAlgebra.equivEven`
and `CliffordAlgebra.prodEquiv`; together with the recurrences for `Cliff(p,0)` and `Cliff(0,q)`
and the base entries above, this gives the mod-`8` classification indexed by `(q-p) mod 8`.

Lawson-Michelsohn, *Spin Geometry*, Theorem I.4.1: this statement is their (4.3), the two
recurrences are their (4.1) and (4.2), the eight-step consequence is Theorem I.4.3 (4.11)-(4.12)
with `Cl(8,0) = Cl(0,8) = M₁₆(ℝ)` at (4.14), and the resulting tables are Tables I and II of §I.4.
Their `Cl(r,s)` is this file's `Cliff(s, r)`: they set `Cl(1,0) = ℂ` and `Cl(0,1) = ℝ ⊕ ℝ` at (4.0),
the opposite index order to the base entries above. -/
theorem cliff_bott (p q : ℕ) :
    Nonempty (CliffordAlgebra (TauCeti.realCliffordForm (p + 1) (q + 1)) ≃ₐ[ℝ]
      TensorProduct ℝ (CliffordAlgebra (TauCeti.realCliffordForm p q)) (Matrix (Fin 2) (Fin 2) ℝ)) := ⟨TauCeti.realCliffordBottEquiv p q⟩

/-- **The native real spin group `Spin(p, q)`**. In positive dimension its orthogonal
image is the determinant-one, norm-sign-one subgroup; in definite signature this
is all of SO, while in indefinite signature it is the identity component.
The compact `Spin(n) = spinPQ n 0`; compare the negative-sign compact model explicitly. -/
abbrev spinPQ (p q : ℕ) := spinGroup (TauCeti.realCliffordForm p q)

/-! ### Triality for `Spin₈` -/

/-- **Triality**: an order-three automorphism of `Spin₈` (`V = ℂ⁸`, type `D₄`) whose action on
representations has the oriented pullback cycle V∘t≅S⁺, S⁺∘t≅S⁻, S⁻∘t≅V. Here S⁺ and S⁻
are the native half-spin subrepresentations (each8-dimensional), not the16-dimensional full
`TauCeti.spinRep Q P`; l=4 assigns weights ω₄ and ω₃ respectively. Stage one
(cheaper) is representation-level: the order-three symmetry of the `D₄` Dynkin diagram from
[`../RootSystems`](../RootSystems/README.md) permutes the three highest weights. Stage two, this group
automorphism, lifts that diagram symmetry to the simply connected group and depends on an
integration/classification theorem for simply connected semisimple groups. -/
noncomputable def trialityAut {V : Type v} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (hV : Module.finrank ℂ V = 8) :
    spinGroup Q ≃* spinGroup Q := sorry

/-- **Triality has exact order three.** The nontriviality conjunct excludes the identity.
The full oriented representation cycle is specified in the `trialityAut` docstring above
and README Layer8 Stage2. That comparison and outerness are separate required targets:
permuting the three nonisomorphic representations rules out an inner automorphism. -/
theorem trialityAut_order_three {V : Type v} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (hV : Module.finrank ℂ V = 8) :
    (trialityAut Q hQ hV).trans ((trialityAut Q hQ hV).trans (trialityAut Q hQ hV))
      = MulEquiv.refl (spinGroup Q) ∧
    trialityAut Q hQ hV ≠ MulEquiv.refl (spinGroup Q) := sorry

/-- Nonidentity order three alone does not prove outerness. Pin the actual not-inner target. -/
theorem trialityAut_not_inner {V : Type v} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate)
    (hV : Module.finrank ℂ V = 8) :
    ¬ ∃ g : spinGroup Q, ∀ x : spinGroup Q, trialityAut Q hQ hV x = g * x * g⁻¹ := sorry

-- The `Spin₈`-invariant trilinear form `V ⊗ S⁺ ⊗ S⁻ → ℂ` permuted by triality (the octonion
-- multiplication as the triality form) is the concrete outcome; see the triality section of `README.md`.

/-! ### Lie algebras acting through the Clifford algebra, and Kostant's isotypy corollary

The bivector realization freed from the standard form, the machine it powers (every Clifford module
is a `𝔤`-module along `θ : 𝔤 →ₗ⁅K⁆ 𝔰𝔬(V, Q)`), the adjoint embedding of a Lie algebra with an
invariant nondegenerate symmetric form, and Kostant's isotypy corollary. **Two different
`𝔤`-actions on `Cliff(𝔤, B)` live here, and only one is isotypic**: the commutator action
`x • c = ⁅q(x), c⁆` (`cliffordDerivationRep`) is the exterior extension of the adjoint
representation and is **not** isotypic (`⋀𝔰𝔩₂ ≅ 1 ⊕ V(2) ⊕ V(2) ⊕ 1`), while the **left-regular**
action `x • c = q(x) · c` is `L(ρ)`-isotypic; every isotypy and multiplicity statement below is
about the left-regular module. Isotypicity is stated in Mathlib's `LieModule` vocabulary (the name
`L(ρ)` lives in `../LieHighestWeight` and is not imported, so it is prose here); the highest weight
itself is pinned only in the `gl_N` worked instance, where the Cartan and Borel are concrete. The
carrier is the Clifford algebra itself; `CliffordAlgebra.equivExterior` and
`finrank_cliffordAlgebra` identify it with `⋀𝔤` of dimension `2^d`. Kostant's full
`ρ`-decomposition `C(𝔤) ≅ End(V_ρ) ⊗ C(P)` is also a required construction target.
README Layer9 specifies E,I,P, normalized Chevalley quantization, the scalar-square form Q_P,
the image A, its ordinary commutant B and the corrected odd-rank center comparison.
No full primitive theorem is inferred from these corollaries or from the native CAR example.
Independent of the exceptional isomorphisms, the real forms, and triality. -/

/-- **The quadratic element of a pair of vectors**: `⅟2 • ⁅ι Q a, ι Q b⁆` in `CliffordAlgebra Q`
(the commutator bracket is the `LieRing.ofAssociativeRing` instance), the abstract-form counterpart
of the half-normalized embedding `bivectorLieRing`. The defining property is
`cliffordBivector_lie_ι` below, not the formula; it lies in `even Q` and in `filtration Q 2`. -/
noncomputable def cliffordBivector (Q : QuadraticForm R M) [Invertible (2 : R)] (a b : M) :
    CliffordAlgebra Q := CliffordAlgebra.bivector Q a b

/-- **The action-normalization pin**, the abstract statement of the formula that
`soEquivBivector_wedge_mulVec` pins for the standard form: the quadratic element of `(a, b)`
brackets with a generator by the infinitesimal rotation
`x ↦ polar Q b x • a - polar Q a x • b`. This one identity forces the `⅟2` and fixes every scalar
downstream (the factors of two live exactly here, so the pin is an equation, not prose). -/
theorem cliffordBivector_lie_ι (Q : QuadraticForm R M) [Invertible (2 : R)] (a b x : M) :
    ⁅cliffordBivector Q a b, CliffordAlgebra.ι Q x⁆
      = CliffordAlgebra.ι Q
          (QuadraticMap.polar Q b x • a - QuadraticMap.polar Q a x • b) := by
  exact CliffordAlgebra.bivector_lie_ι Q a b x

/-- **Quadratic elements form a Lie subalgebra** of `CliffordAlgebra Q` under the commutator: the
span of the `cliffordBivector Q a b`, closed under bracket by the polarization identities,
contained in `even Q` and in `filtration Q 2`. Unlike `bivectorLieRing` (a transported
bracket on `⋀²`), this is a `LieSubalgebra` of the Clifford algebra itself, so no scoped instances
are needed. -/
noncomputable def quadraticLieSubalgebra (Q : QuadraticForm R M) [Invertible (2 : R)] :
    LieSubalgebra R (CliffordAlgebra Q) := CliffordAlgebra.quadraticLieSubalgebra Q

/-- **The quadratic realization for an abstract form**: for nondegenerate `Q` on a
finite-dimensional space over a field with `2` invertible, the skew-adjoint endomorphisms of the
polar form (Mathlib's `skewAdjointLieSubalgebra`, the abstract `𝔰𝔬(V, Q)`; never a private
synonym) are Lie-isomorphic to the quadratic elements of the Clifford algebra. The normalization
is pinned by `soEquivQuadratic_lie_ι` below, matching `soEquivBivector`'s convention, so over the standard
form this and `soEquivBivector` realize the same formula. -/
noncomputable def soEquivQuadratic {K : Type u} [Field K] {V : Type v} [AddCommGroup V]
    [Module K V] [FiniteDimensional K V] [Invertible (2 : K)] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) :
    ↥(skewAdjointLieSubalgebra (QuadraticMap.polarBilin Q))
      ≃ₗ⁅K⁆ ↥(quadraticLieSubalgebra Q) := CliffordAlgebra.soEquivQuadratic Q hQ

/-- **The pin for `soEquivQuadratic`**: the quadratic element realizing a skew-adjoint `f`
brackets with `ι Q x` to give `ι Q (f x)`. Together with `cliffordBivector_lie_ι` this fixes the
equivalence (any automorphism of `𝔰𝔬` composed with it would break this identity). -/
theorem soEquivQuadratic_lie_ι {K : Type u} [Field K] {V : Type v} [AddCommGroup V]
    [Module K V] [FiniteDimensional K V] [Invertible (2 : K)] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate)
    (f : ↥(skewAdjointLieSubalgebra (QuadraticMap.polarBilin Q))) (x : V) :
    ⁅(soEquivQuadratic Q hQ f : CliffordAlgebra Q), CliffordAlgebra.ι Q x⁆
      = CliffordAlgebra.ι Q ((f : Module.End K V) x) := by
  exact CliffordAlgebra.soEquivQuadratic_lie_ι Q hQ f x

/-- **Every Clifford module is a `𝔤`-module**: a Lie algebra homomorphism
`θ : 𝔤 →ₗ⁅K⁆ 𝔰𝔬(V, Q)` composed with the quadratic realization and a Clifford action
`ρ : CliffordAlgebra Q →ₐ[K] Module.End K S` (an `AlgHom`, a Lie homomorphism via
`AlgHom.toLieHom`) makes `S` a `𝔤`-module. The two instances that matter here: `ρ = TauCeti.spinAction Q P`
(the spin module) and `ρ = Algebra.lmul K (CliffordAlgebra Q)` (the left-regular module,
Kostant's setting). Pinned by `cliffordInducedRep_apply`. -/
noncomputable def cliffordInducedRep {K : Type u} [Field K] {V : Type v} [AddCommGroup V]
    [Module K V] [FiniteDimensional K V] [Invertible (2 : K)] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) {L : Type*} [LieRing L] [LieAlgebra K L]
    (θ : L →ₗ⁅K⁆ ↥(skewAdjointLieSubalgebra (QuadraticMap.polarBilin Q)))
    {S : Type*} [AddCommGroup S] [Module K S]
    (ρ : CliffordAlgebra Q →ₐ[K] Module.End K S) :
    L →ₗ⁅K⁆ Module.End K S := CliffordAlgebra.cliffordInducedRep Q hQ θ ρ

/-- The pin for `cliffordInducedRep`: it is the composite it claims to be. -/
theorem cliffordInducedRep_apply {K : Type u} [Field K] {V : Type v} [AddCommGroup V]
    [Module K V] [FiniteDimensional K V] [Invertible (2 : K)] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) {L : Type*} [LieRing L] [LieAlgebra K L]
    (θ : L →ₗ⁅K⁆ ↥(skewAdjointLieSubalgebra (QuadraticMap.polarBilin Q)))
    {S : Type*} [AddCommGroup S] [Module K S]
    (ρ : CliffordAlgebra Q →ₐ[K] Module.End K S) (x : L) :
    cliffordInducedRep Q hQ θ ρ x = ρ ↑(soEquivQuadratic Q hQ (θ x)) := by
  exact CliffordAlgebra.cliffordInducedRep_apply Q hQ θ ρ x

/-- **The commutator (derivation) action** `x • c = ⁅q(θ x), c⁆` on the Clifford algebra, named
apart from the left-regular action because the two must never be conflated: under
`CliffordAlgebra.equivExterior` this one is the exterior extension of the action on `V`, and for
`θ = ad` it is **not** isotypic (`⋀𝔰𝔩₂ ≅ 1 ⊕ V(2) ⊕ V(2) ⊕ 1`, the `README.md` worked
non-example). Every isotypy statement below is about the left-regular action, not this one. -/
noncomputable def cliffordDerivationRep {K : Type u} [Field K] {V : Type v} [AddCommGroup V]
    [Module K V] [FiniteDimensional K V] [Invertible (2 : K)] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) {L : Type*} [LieRing L] [LieAlgebra K L]
    (θ : L →ₗ⁅K⁆ ↥(skewAdjointLieSubalgebra (QuadraticMap.polarBilin Q))) :
    L →ₗ⁅K⁆ Module.End K (CliffordAlgebra Q) := CliffordAlgebra.cliffordDerivationRep Q hQ θ

/-- **The adjoint embedding**: for a Lie algebra with a symmetric invariant bilinear form `B`
(`LinearMap.BilinForm.lieInvariant`; the trace form of a faithful representation, not necessarily
the Killing form), `ad x` is skew-adjoint, giving `ad : 𝔤 →ₗ⁅K⁆ 𝔰𝔬(𝔤, B)`. The codomain is
stated against the polar form of `B.toQuadraticMap` (which is `B + B.flip = 2 • B` for symmetric
`B`, Mathlib's `LinearMap.BilinMap.polarBilin_toQuadraticMap`; skew-adjointness for `B` and
`2 • B` agree), so it composes directly with `cliffordInducedRep`. Pinned by `adjointSO_apply`. -/
noncomputable def adjointSO {K : Type u} [Field K] {L : Type*} [LieRing L] [LieAlgebra K L]
    (B : LinearMap.BilinForm K L) (hsymm : B.IsSymm) (hinv : B.lieInvariant L) :
    L →ₗ⁅K⁆ ↥(skewAdjointLieSubalgebra
      (QuadraticMap.polarBilin (LinearMap.BilinMap.toQuadraticMap B))) := TauCeti.LieAlgebra.adjointSO B hinv

theorem adjointSO_apply {K : Type u} [Field K] {L : Type*} [LieRing L] [LieAlgebra K L]
    (B : LinearMap.BilinForm K L) (hsymm : B.IsSymm) (hinv : B.lieInvariant L) (x y : L) :
    (adjointSO B hsymm hinv x : Module.End K L) y = ⁅x, y⁆ := by
  exact TauCeti.LieAlgebra.adjointSO_apply B hinv x y

/-- **Rank is the Cartan dimension**: `LieAlgebra.rank ℂ L = finrank ℂ H` for a Cartan subalgebra
`H` of a Killing-semisimple `L` over `ℂ`. Absent from Mathlib (`rank` is defined via the nilpotency
degree of a generic element); the multiplicity exponents of Kostant's corollary below are stated in
`rank`, so this pin connects them to the weight theory. -/
theorem rank_eq_finrank_cartan (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] (H : LieSubalgebra ℂ L)
    [H.IsCartanSubalgebra] :
    LieAlgebra.rank ℂ L = Module.finrank ℂ H := sorry

/-- **The parity bookkeeping** `d = l + 2 · #Δ⁺`: the dimension of a Killing-semisimple `L` is the
rank plus twice the number of positive roots (root spaces are lines, `finrank_rootSpace_eq_one`).
Stated additively so no truncated subtraction appears; it makes the divisions in the exponents
`2^{(d-l)/2}` and `2^{(d+l)/2}` below exact. -/
theorem finrank_eq_rank_add_two_mul_card_isPos (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] (H : LieSubalgebra ℂ L)
    [H.IsCartanSubalgebra] [LieModule.IsTriangularizable ℂ H L]
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Module.finrank ℂ L
      = LieAlgebra.rank ℂ L
        + 2 * (Finset.univ.filter fun i : H.root => base.IsPos i).card := sorry

/-- **The Killing quadratic form** `x ↦ κ(x, x)` of a Killing-semisimple `𝔤` over `ℂ`, the form of
Kostant's setting, pinned by `killingQuadraticForm_apply` and nondegenerate by `IsKilling`. -/
noncomputable def killingQuadraticForm (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] : QuadraticForm ℂ L := TauCeti.LieAlgebra.killingQuadraticForm ℂ L

theorem killingQuadraticForm_apply (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] (x : L) :
    killingQuadraticForm L x = killingForm ℂ L x x := by
  exact TauCeti.LieAlgebra.killingQuadraticForm_apply ℂ L x

/-- **The adjoint quadratic lift** `𝔤 →ₗ⁅ℂ⁆ Cliff(𝔤, κ)`: the composite of `adjointSO` for the
Killing form with the quadratic realization, as a Lie algebra homomorphism into the Clifford
algebra under its commutator bracket. Pinned by `adjointCliffordHom_lie_ι`, the same shape as
`cliffordBivector_lie_ι`; the `gl_N` worked instance `glCliffordHom` below is its trace-form
sibling. -/
noncomputable def adjointCliffordHom (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] :
    L →ₗ⁅ℂ⁆ CliffordAlgebra (killingQuadraticForm L) := CliffordAlgebra.adjointCliffordHom ℂ L

/-- The relation `⁅q(x), ι y⁆ = ι ⁅x, y⁆`: bracketing a generator with the adjoint quadratic lift
is the adjoint action, basis-free. -/
theorem adjointCliffordHom_lie_ι (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] (x y : L) :
    ⁅adjointCliffordHom L x, CliffordAlgebra.ι (killingQuadraticForm L) y⁆
      = CliffordAlgebra.ι (killingQuadraticForm L) ⁅x, y⁆ := by
  exact CliffordAlgebra.adjointCliffordHom_lie_ι ℂ L x y

/-- **Kostant's setting, packaged**: `Cliff(𝔤, κ)` as a `𝔤`-module under **left multiplication**
by the adjoint quadratic lift, `⁅x, c⁆ = adjointCliffordHom L x * c` (pinned by
`kostant_lie_def`). This is the left-regular action, the isotypic one; the commutator action is
`cliffordDerivationRep` and is a different module. `CliffordAlgebra.equivExterior` identifies the
carrier with `⋀𝔤`. Scoped instances: roadmap-local, following the `bivectorLieRing` precedent. -/
noncomputable scoped instance kostantLieRingModule (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] :
    LieRingModule L (CliffordAlgebra (killingQuadraticForm L)) := CliffordAlgebra.kostantLieRingModule ℂ L

noncomputable scoped instance kostantLieModule (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] :
    LieModule ℂ L (CliffordAlgebra (killingQuadraticForm L)) := CliffordAlgebra.kostantLieModule ℂ L

theorem kostant_lie_def (L : Type u) [LieRing L] [LieAlgebra ℂ L] [FiniteDimensional ℂ L]
    [LieAlgebra.IsKilling ℂ L] (x : L) (c : CliffordAlgebra (killingQuadraticForm L)) :
    ⁅x, c⁆ = adjointCliffordHom L x * c := by
  exact CliffordAlgebra.kostant_lie_def (K := ℂ) (L := L) x c

/-- **Kostant's isotypy corollary** (B. Kostant, Adv. Math. 125 (1997)): for Killing-semisimple
`𝔤` over `ℂ`, any two simple submodules of the left-regular `Cliff(𝔤, κ)` are isomorphic.
Nonvacuous because the carrier is finite-dimensional (`finrank_cliffordAlgebra`), so simple
submodules exist. In the vocabulary of `../LieHighestWeight` the common simple constituent is
`L(ρ)`, the irreducible of highest weight the half-sum of positive roots; that name is prose here,
and this statement carries the content without it. -/
theorem kostant_isotypic (L : Type u) [LieRing L] [LieAlgebra ℂ L] [FiniteDimensional ℂ L]
    [LieAlgebra.IsKilling ℂ L]
    (S₁ S₂ : LieSubmodule ℂ L (CliffordAlgebra (killingQuadraticForm L)))
    (h₁ : LieModule.IsIrreducible ℂ L S₁) (h₂ : LieModule.IsIrreducible ℂ L S₂) :
    Nonempty (S₁ ≃ₗ⁅ℂ,L⁆ S₂) := sorry

/-- **The multiplicity, as a pinned decomposition equivalence** (the summit of the layer):
`Cliff(𝔤, κ)` is a direct sum of `2^{(d+l)/2}` copies of one simple of dimension `2^{(d-l)/2}`,
`d = dim 𝔤`, `l = rank 𝔤`. The divisions are exact by `finrank_eq_rank_add_two_mul_card_isPos`,
and the bookkeeping check against `finrank_cliffordAlgebra` is `2^{(d-l)/2} · 2^{(d+l)/2} = 2^d =
dim Cliff(𝔤, κ)`. -/
theorem kostant_multiplicity (L : Type u) [LieRing L] [LieAlgebra ℂ L] [FiniteDimensional ℂ L]
    [LieAlgebra.IsKilling ℂ L] :
    ∃ S : LieSubmodule ℂ L (CliffordAlgebra (killingQuadraticForm L)),
      LieModule.IsIrreducible ℂ L S ∧
      Module.finrank ℂ S = 2 ^ ((Module.finrank ℂ L - LieAlgebra.rank ℂ L) / 2) ∧
      Nonempty ((CliffordAlgebra (killingQuadraticForm L)) ≃ₗ⁅ℂ,L⁆
        ⨁ _ : Fin (2 ^ ((Module.finrank ℂ L + LieAlgebra.rank ℂ L) / 2)), S) := sorry

/-- **The spin-module variant**: the **full spinor module** `⋀·W` of `Cliff(𝔤, κ)` (the spin module; in
positive even dimension this is `S⁺ ⊕ S⁻`, with each half-spin summand half the dimension;
at dimension0 use `S⁺=ℂ` and `S⁻=0`, as specified in `README.md`), restricted to `𝔤` along the adjoint quadratic lift. Real
body: the composite of `adjointCliffordHom` with `TauCeti.spinAction` through `AlgHom.toLieHom`. -/
noncomputable def kostantSpinRep (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L]
    (P : TauCeti.SpinPolarizationData (killingQuadraticForm L)) :
    L →ₗ⁅ℂ⁆ Module.End ℂ (ExteriorAlgebra ℂ P.W) :=
  ((TauCeti.spinAction (killingQuadraticForm L) P).toLieHom).comp (adjointCliffordHom L)

/-- The full spinor module is isotypic over `𝔤` with multiplicity `2^{⌊l/2⌋}`: a minimal invariant
subspace of dimension `2^{(d-l)/2}` whose dimension divides the whole with quotient `2^{⌊l/2⌋}`.
Stated with plain `Submodule` invariance because the module structure depends on the polarization
data `P`, which an instance cannot carry. -/
theorem kostantSpinRep_multiplicity (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L]
    (P : TauCeti.SpinPolarizationData (killingQuadraticForm L)) :
    ∃ S₀ : Submodule ℂ (ExteriorAlgebra ℂ P.W),
      (∀ x : L, S₀.map (kostantSpinRep L P x) ≤ S₀) ∧ S₀ ≠ ⊥ ∧
      (∀ N' : Submodule ℂ (ExteriorAlgebra ℂ P.W), N' < S₀ →
        (∀ x : L, N'.map (kostantSpinRep L P x) ≤ N') → N' = ⊥) ∧
      Module.finrank ℂ S₀ = 2 ^ ((Module.finrank ℂ L - LieAlgebra.rank ℂ L) / 2) ∧
      Module.finrank ℂ (ExteriorAlgebra ℂ P.W)
        = 2 ^ (LieAlgebra.rank ℂ L / 2) * Module.finrank ℂ S₀ := sorry

/-! #### The worked instance: `gl_N` on `M_N(ℂ)` (the CAR algebra)

`𝔤 = gl_N = Matrix (Fin N) (Fin N) ℂ` is reductive, not Killing-semisimple, so its invariant form
is the **trace form** `⟨X, Y⟩ = tr (X * Y)` and its highest weight carries a half-integral central
component; the reductive highest-weight vocabulary lives in `../LieHighestWeight` and is cited in
prose only. The generators `d_ab = ι (Matrix.single a b 1)` satisfy the CAR relations
`d_ab d_cd + d_cd d_ab = 2 δ_bc δ_ad` (`polarBilin_traceQuadraticForm`), the normal-ordered
quadratics `F_ij = ½ Σ_k d_ik d_kj` are a Lie homomorphism (`glCliffordHom`), and the left-regular
module `Cliff(M_N)` (dimension `2^{N²}`, the fermionic Fock space `⋀(M_N)` via `equivExterior`) is
isotypic with `2^{N(N+1)/2}` simple summands of dimension `2^{N(N-1)/2}`, each generated by a
highest weight vector of weight `ν = (N - 1/2, …, 1/2)`. This is Panyushev's Prop. 2.4 and
Ex. 2.5(1), the decomposition behind the CAR-matrix analysis of Shlyakhtenko (arXiv:2606.28648);
`V* ⊗ L(ν) ≅ ⨁_t L(ν - ε_t)` is then the dual-standard Pieri rule of `../LieHighestWeight`. -/

/-- **The trace form on `N × N` matrices** as a quadratic form, `Q X = tr (X * X)`; the Killing
form of `gl_N` is degenerate, the trace form of the standard faithful representation is not, which
is why the layer is stated for an invariant form rather than the Killing form. -/
noncomputable def traceQuadraticForm (N : ℕ) :
    QuadraticForm ℂ (Matrix (Fin N) (Fin N) ℂ) := TauCeti.traceQuadraticForm ℂ (Fin N)

/-- Definitional pin for `traceQuadraticForm`. -/
theorem traceQuadraticForm_apply (N : ℕ) (X : Matrix (Fin N) (Fin N) ℂ) :
    traceQuadraticForm N X = Matrix.trace (X * X) := by
  exact TauCeti.traceQuadraticForm_apply X

/-- **The CAR normalization, pinned as an equation**: the polar form of the trace quadratic form
is `2 tr (X * Y)`, so the generators anticommute by `d_ab d_cd + d_cd d_ab = 2 δ_bc δ_ad`. The
factors of two live exactly here. -/
theorem polarBilin_traceQuadraticForm (N : ℕ) (X Y : Matrix (Fin N) (Fin N) ℂ) :
    QuadraticMap.polarBilin (traceQuadraticForm N) X Y = 2 * Matrix.trace (X * Y) := by
  exact TauCeti.polarBilin_traceQuadraticForm X Y

/-- **The normal-ordered embedding** `E_ij ↦ F_ij = ½ Σ_k d_ik d_kj` as a Lie algebra
homomorphism `gl_N →ₗ⁅ℂ⁆ Cliff(M_N)`: the relations `[F_ij, F_kl] = δ_jk F_il - δ_li F_kj` are
the `gl_N` relations, carried by the bracket property. Pinned by `glCliffordHom_single` (the
formula) and `glCliffordHom_lie_ι` (the action on generators). -/
noncomputable def glCliffordHom (N : ℕ) :
    Matrix (Fin N) (Fin N) ℂ →ₗ⁅ℂ⁆ CliffordAlgebra (traceQuadraticForm N) := TauCeti.glCliffordHom (K := ℂ) (n := Fin N)

/-- The formula `F_ij = ½ Σ_k d_ik d_kj` on the elementary matrices (`Matrix.single i j 1` is
`E_ij`). -/
theorem glCliffordHom_single (N : ℕ) (i j : Fin N) :
    glCliffordHom N (Matrix.single i j 1)
      = (2⁻¹ : ℂ) • ∑ k : Fin N,
          CliffordAlgebra.ι (traceQuadraticForm N) (Matrix.single i k 1)
            * CliffordAlgebra.ι (traceQuadraticForm N) (Matrix.single k j 1) := by
  have hsingle (a b : Fin N) :
      @Matrix.single (Fin N) (Fin N) ℂ
          (Classical.decEq (Fin N)) (Classical.decEq (Fin N)) inferInstance a b (1 : ℂ)
        = Matrix.single a b 1 := by
    exact congrArg
      (fun d : DecidableEq (Fin N) =>
        @Matrix.single (Fin N) (Fin N) ℂ d d inferInstance a b (1 : ℂ))
      (Subsingleton.elim (Classical.decEq (Fin N)) (instDecidableEqFin N))
  simpa only [glCliffordHom, traceQuadraticForm, TauCeti.carGenerator_def, hsingle] using!
    (TauCeti.glCliffordHom_single (K := ℂ) (n := Fin N) i j)

/-- **The relation `[F_ij, d_kl] = δ_jk d_il - δ_li d_kj`, basis-free**: bracketing with a
generator is the adjoint action of `gl_N` on `M_N`. The `gl_N` instance of
`cliffordBivector_lie_ι`/`adjointCliffordHom_lie_ι`, and the compatibility that gives the Fock
space the correct infinitesimal action. -/
theorem glCliffordHom_lie_ι (N : ℕ) (X Y : Matrix (Fin N) (Fin N) ℂ) :
    ⁅glCliffordHom N X, CliffordAlgebra.ι (traceQuadraticForm N) Y⁆
      = CliffordAlgebra.ι (traceQuadraticForm N) ⁅X, Y⁆ := by
  exact TauCeti.glCliffordHom_lie_ι (K := ℂ) (n := Fin N) X Y

/-- **The normal-ordering constant**: `F_ij` differs from the antisymmetrized quadratic element by
the scalar `(N/2) δ_ij`. Summed against a diagonal matrix this is the central character
`X ↦ (N/2) tr X`, the source of the half-integral central component of the highest weight `ν`
below: the reductive answer is not the semisimple `ρ` alone. -/
theorem glCliffordHom_normalOrdering (N : ℕ) (i j : Fin N) :
    glCliffordHom N (Matrix.single i j 1)
      = (2⁻¹ : ℂ) • ∑ k : Fin N,
          cliffordBivector (traceQuadraticForm N) (Matrix.single i k 1) (Matrix.single k j 1)
        + algebraMap ℂ (CliffordAlgebra (traceQuadraticForm N))
            (if i = j then (N : ℂ) / 2 else 0) := by
  have hsingle (a b : Fin N) :
      @Matrix.single (Fin N) (Fin N) ℂ
          (Classical.decEq (Fin N)) (Classical.decEq (Fin N)) inferInstance a b (1 : ℂ)
        = Matrix.single a b 1 := by
    exact congrArg
      (fun d : DecidableEq (Fin N) =>
        @Matrix.single (Fin N) (Fin N) ℂ d d inferInstance a b (1 : ℂ))
      (Subsingleton.elim (Classical.decEq (Fin N)) (instDecidableEqFin N))
  by_cases hij : i = j
  · simpa only [glCliffordHom, cliffordBivector, traceQuadraticForm,
      Fintype.card_fin, hsingle, ite_eq_left hij] using!
      (TauCeti.glCliffordHom_normalOrdering (K := ℂ) (n := Fin N) i j)
  · simpa only [glCliffordHom, cliffordBivector, traceQuadraticForm,
      Fintype.card_fin, hsingle, ite_eq_right hij] using!
      (TauCeti.glCliffordHom_normalOrdering (K := ℂ) (n := Fin N) i j)

/-- **The CAR module**: `Cliff(M_N)` as a `gl_N`-module under left multiplication by
`glCliffordHom` (pinned by `car_lie_def`); `equivExterior` identifies the carrier with the
fermionic Fock space `⋀(M_N)` of dimension `2^{N²}`. Scoped instances: roadmap-local. -/
noncomputable scoped instance carLieRingModule (N : ℕ) :
    LieRingModule (Matrix (Fin N) (Fin N) ℂ) (CliffordAlgebra (traceQuadraticForm N)) := TauCeti.carLieRingModule (K := ℂ) (n := Fin N)

noncomputable scoped instance carLieModule (N : ℕ) :
    LieModule ℂ (Matrix (Fin N) (Fin N) ℂ) (CliffordAlgebra (traceQuadraticForm N)) := TauCeti.carLieModule (K := ℂ) (n := Fin N)

theorem car_lie_def (N : ℕ) (X : Matrix (Fin N) (Fin N) ℂ)
    (c : CliffordAlgebra (traceQuadraticForm N)) :
    ⁅X, c⁆ = glCliffordHom N X * c := by
  exact TauCeti.car_lie_def (K := ℂ) (n := Fin N) X c

/-! The old three admitted CAR corollaries are consumed through their actual native endpoints.
The README retains the full concrete submodule/matrix-unit statements and their comparison:
named-type isotypy identifies any two simple submodules, a coordinate summand in the native
decomposition produces the old existential simple submodule, and unfolding the actual
highest-vector/half-staircase definitions gives the old matrix-unit equations, including N=0.
These are comparisons on the same left-regular carrier, not three missing generic CAR theorems. -/
end TauCetiRoadmap.RepresentationTheory.SpinRepresentations

/-! Zero-rank Clifford and exterior algebra interfaces.
No field, characteristic or finite-dimensional premise is needed for a subsingleton module.
These bounded results do not supply the positive-rank spin/classification theorems. -/
namespace TauCetiRoadmap.RepresentationTheory.SpinRepresentations.ZeroRank
universe u v
variable {R : Type u} {M : Type v} [CommRing R] [AddCommGroup M] [Module R M] [Subsingleton M]

/-- The universal map sends every zero-rank Clifford generator to zero. -/
noncomputable def scalarProjection (Q : QuadraticForm R M) : CliffordAlgebra Q →ₐ[R] R :=
  CliffordAlgebra.lift Q ⟨0, by
    intro m
    have hm : m = 0 := Subsingleton.elim _ _
    simp [hm]⟩

/-- On a subsingleton module, Clifford algebra and scalar ring are actual algebras. -/
noncomputable def cliffordEquivScalars (Q : QuadraticForm R M) : CliffordAlgebra Q ≃ₐ[R] R :=
  AlgEquiv.ofAlgHom (scalarProjection Q) (Algebra.ofId R (CliffordAlgebra Q))
    (by ext)
    (by
      apply CliffordAlgebra.hom_ext
      ext m
      have hm : m = 0 := Subsingleton.elim _ _
      simp [hm])

/-- In rank zero the entire Clifford algebra lies in its even subalgebra. -/
theorem even_eq_top (Q : QuadraticForm R M) : CliffordAlgebra.even Q = ⊤ := by
  apply top_unique
  intro a _
  rw [← (cliffordEquivScalars Q).symm_apply_apply a]
  exact (CliffordAlgebra.even Q).algebraMap_mem _

/-- The even algebra in rank zero is the scalar algebra, with no second factor. -/
noncomputable def evenEquivScalars (Q : QuadraticForm R M) : CliffordAlgebra.even Q ≃ₐ[R] R :=
  AlgEquiv.ofAlgHom ((scalarProjection Q).comp (CliffordAlgebra.even Q).val)
    (Algebra.ofId R (CliffordAlgebra.even Q))
    (by ext)
    (by
      apply DFunLike.ext
      intro a
      apply Subtype.ext
      exact (cliffordEquivScalars Q).symm_apply_apply (a : CliffordAlgebra Q))

/-- Positive exterior degree vanishes in the zero-rank Fock carrier. -/
theorem exteriorPower_succ_eq_bot (k : ℕ) : ExteriorAlgebra.exteriorPower R (k+1) M = ⊥ := by
  have hi : (ExteriorAlgebra.ι R : M →ₗ[R] ExteriorAlgebra R M) = 0 := by
    ext m
    have hm : m = 0 := Subsingleton.elim _ _
    simp [hm]
  simp [ExteriorAlgebra.exteriorPower, hi]

end TauCetiRoadmap.RepresentationTheory.SpinRepresentations.ZeroRank
