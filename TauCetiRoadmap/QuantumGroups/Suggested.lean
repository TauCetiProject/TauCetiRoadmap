/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Algebra.Coalgebra.Comodule.MatrixCoefficient.Matrix
import TauCeti.Algebra.Coalgebra.Subcomodule.Basic

/-!
# Quantum groups: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: the von Neumann bicommutant theorem,
weighted Schur orthogonality, the
algebraic compact-type characterization, rank-one PBW and domain, the polynomial
center, signed finite-simple classification, finite complete reducibility and
local finiteness versus integrability.

The following headlines are not statable at the pins without heavy constructions:
* Layer 0: the analytic foundation comparisons need the adjointable-operator,
  interior tensor, C*-category, positive diagram completion and full left
  Hilbert-algebra constructions. Native GNS and module carriers are used directly;
  the modular comparison still needs the full Hilbert-algebra and weight carriers.
* Layer 1: classical multiplier/tensor comparison and compact Haar existence and
  uniqueness need the completed minimal C*-tensor functor and the analytic
  compact-quantum-group carrier.
* Layer 2: arbitrary-Hilbert complete reducibility and analytic Peter–Weyl density
  need free Hilbert C*-modules, their multiplier coactions and analytic CQGs.
* Layer 3: the dense Hopf core, Plancherel completion, modular/Kac comparison and
  unitary pivotal comparison need that analytic CQG, its Haar GNS completion,
  and the full left Hilbert algebra and unitary tensor-category carriers.
* Layer 4: universal/reduced completion and coamenability criteria need the
  constructed C*-completions and their comparison maps.
* Layers 5–7: the SUq(2)/free orthogonal universal presentations, Tannaka–Krein and
  commutative reconstruction, fusion, Haar laws, dimensions and coamenability
  need the universal C*-algebras, analytic CQGs and rigid C*-fiber functors.
* Layer 8: tensor/dual Clebsch–Gordan and spherical comparisons need the constructed
  Hopf-module monoidal/rigid structures and actual ladder-module family; the
  compact comparison additionally needs analytic SUq(2), and the classical
  comparison needs the integral ladder family and its Lie-module specialization.
  These constructions are README targets, not admitted data here.
-/

open scoped TensorProduct ComplexOrder
open Module
namespace TauCetiRoadmap.QuantumGroups

universe u v w

/-! ## Layer 0: Operator closures -/

/-- The weak operator closure of a unital star subalgebra is its double commutant,
without a separability hypothesis on the Hilbert space (Hiai, Section 1.2). -/
theorem weakClosure_eq_bicommutant (H : Type u) [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (B : StarSubalgebra ℂ (H →L[ℂ] H)) :
    closure (ContinuousLinearMapWOT.ofCLM '' (B : Set (H →L[ℂ] H))) =
      ContinuousLinearMapWOT.ofCLM ''
        Set.centralizer (Set.centralizer (B : Set (H →L[ℂ] H))) := by
  sorry

/-! ## Layer 3: The Hopf star core and weighted orthogonality -/

section HopfCore

variable {A : Type u} [Ring A] [HopfAlgebra ℂ A] [StarRing A] [StarModule ℂ A]

/-- Star compatibility supplements the native Hopf algebra, without another carrier. -/
class StarCompatibleHopf : Prop where
  comul_star : ∀ a : A, Coalgebra.comul (R := ℂ) (star a) =
    star (Coalgebra.comul (R := ℂ) a)

variable {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
  [TauCeti.Comodule ℂ A H]
variable {ι : Type w} [Fintype ι] [DecidableEq ι]

/-- Haar invariance on the core is stated by actual slice equations. -/
structure AlgebraicHaar where
  functional : A →ₗ[ℂ] ℂ
  normalized : functional 1 = 1
  left_invariant : ∀ a : A,
    (TensorProduct.rid ℂ A) ((TensorProduct.map (LinearMap.id) functional)
      (Coalgebra.comul (R := ℂ) a)) = functional a • (1 : A)
  right_invariant : ∀ a : A,
    (TensorProduct.lid ℂ A) ((TensorProduct.map functional (LinearMap.id))
      (Coalgebra.comul (R := ℂ) a)) = functional a • (1 : A)
  positive : ∀ a : A, 0 ≤ functional (star a * a)

/-- The matrix Ft is the pre-antipode F̃ in the README, rather than its transpose F. -/
theorem schur_orthogonality [StarCompatibleHopf (A := A)]
    [IsSimpleOrder (TauCeti.Subcomodule ℂ A H)]
    (h : AlgebraicHaar (A := A)) (b : OrthonormalBasis ι ℂ H)
    (hu : TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis ∈ unitary (Matrix ι ι A)) :
    ∃ Ft : Matrix ι ι ℂ, Ft.PosDef ∧ Matrix.trace Ft = Matrix.trace Ft⁻¹ ∧
      (∀ i j k l,
        h.functional (star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis i j) *
          TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis k l) =
          (if j = l then Ft⁻¹ i k / Matrix.trace Ft⁻¹ else 0)) ∧
      (∀ i j k l,
        h.functional (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis i j *
          star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis k l)) =
          (if i = k then Ft j l / Matrix.trace Ft else 0)) := by
  sorry

end HopfCore

/-! ## Layer 4: Algebraic compact type -/

/-- Coefficients of all finite unitary native comodules, in coordinate bases. -/
def unitaryCoefficientSet (A : Type u) [Ring A] [HopfAlgebra ℂ A] [StarRing A] : Set A :=
  {a | ∃ (n : ℕ) (ρ : TauCeti.Comodule ℂ A (Fin n → ℂ)),
    letI := ρ
    let U := TauCeti.Comodule.coefficientMatrix (C := A) (Pi.basisFun ℂ (Fin n))
    U ∈ unitary (Matrix (Fin n) (Fin n) A) ∧ ∃ i j, a = U i j}

/-- A Hopf star algebra has a normalized positive invariant integral exactly when
it is spanned by finite unitary coefficients (Timmermann, Theorem 3.2.12). -/
theorem compactType_iff (A : Type u) [Ring A] [Nontrivial A] [HopfAlgebra ℂ A]
    [StarRing A] [StarModule ℂ A] [StarCompatibleHopf (A := A)] :
    Nonempty (AlgebraicHaar (A := A)) ↔
      Submodule.span ℂ (unitaryCoefficientSet A) = ⊤ := by
  sorry

/-! ## Layer 8: Generic rank-one representations -/

noncomputable section GenericRankOne

/-- The four generators E, F, K and its inverse in the rank-one presentation. -/
inductive SL2Generator
  | E | F | K | Kinv
  deriving DecidableEq

/-- Q8: actual equations in the free complex algebra. -/
inductive QuantumSL2Relation (q : ℂ) :
    FreeAlgebra ℂ SL2Generator → FreeAlgebra ℂ SL2Generator → Prop
  | kkInv : QuantumSL2Relation q
      (FreeAlgebra.ι ℂ .K * FreeAlgebra.ι ℂ .Kinv) 1
  | kInvK : QuantumSL2Relation q
      (FreeAlgebra.ι ℂ .Kinv * FreeAlgebra.ι ℂ .K) 1
  | ke : QuantumSL2Relation q
      (FreeAlgebra.ι ℂ .K * FreeAlgebra.ι ℂ .E)
      (q ^ 2 • (FreeAlgebra.ι ℂ .E * FreeAlgebra.ι ℂ .K))
  | kf : QuantumSL2Relation q
      (FreeAlgebra.ι ℂ .K * FreeAlgebra.ι ℂ .F)
      ((q⁻¹) ^ 2 • (FreeAlgebra.ι ℂ .F * FreeAlgebra.ι ℂ .K))
  | ef : QuantumSL2Relation q
      (FreeAlgebra.ι ℂ .E * FreeAlgebra.ι ℂ .F)
      (FreeAlgebra.ι ℂ .F * FreeAlgebra.ι ℂ .E +
        (q - q⁻¹)⁻¹ • (FreeAlgebra.ι ℂ .K - FreeAlgebra.ι ℂ .Kinv))

/-- The quotient is defined for all q. At zero the E,F generators vanish;
at q=±1 the totalized inverse yields a commutative quotient. The generic
PBW/Hopf/representation targets in the README state their parameter hypotheses. -/
abbrev QuantumSL2 (q : ℂ) := RingQuot (QuantumSL2Relation q)

/-- The image of a generator in the defining algebra quotient. -/
def quantumSL2Generator (q : ℂ) (g : SL2Generator) : QuantumSL2 q :=
  RingQuot.mkAlgHom ℂ (QuantumSL2Relation q) (FreeAlgebra.ι ℂ g)

/-- The Laurent generator is an actual unit of the quotient. -/
def quantumSL2KUnit (q : ℂ) : (QuantumSL2 q)ˣ where
  val := quantumSL2Generator q .K
  inv := quantumSL2Generator q .Kinv
  val_inv := by
    simpa [quantumSL2Generator] using
      (RingQuot.mkAlgHom_rel ℂ (QuantumSL2Relation.kkInv (q := q)))
  inv_val := by
    simpa [quantumSL2Generator] using
      (RingQuot.mkAlgHom_rel ℂ (QuantumSL2Relation.kInvK (q := q)))

/-- The rank-one Casimir FE + (qK + q⁻¹K⁻¹)/(q − q⁻¹)². -/
def quantumSL2Casimir (q : ℂ) : QuantumSL2 q :=
  quantumSL2Generator q .F * quantumSL2Generator q .E +
    ((q - q⁻¹) ^ 2)⁻¹ •
      (q • quantumSL2Generator q .K + q⁻¹ • quantumSL2Generator q .Kinv)

/-- The rank-one quotient admits the coproduct with the prescribed generator values. -/
theorem quantumSL2Comul_exists (q : ℂ) (hq : q ≠ 0) :
    ∃ Δ : QuantumSL2 q →ₐ[ℂ] (QuantumSL2 q) ⊗[ℂ] QuantumSL2 q,
    Δ (quantumSL2Generator q .K) =
      quantumSL2Generator q .K ⊗ₜ[ℂ] quantumSL2Generator q .K ∧
    Δ (quantumSL2Generator q .E) =
      quantumSL2Generator q .E ⊗ₜ[ℂ] 1 +
        quantumSL2Generator q .K ⊗ₜ[ℂ] quantumSL2Generator q .E ∧
    Δ (quantumSL2Generator q .F) =
      quantumSL2Generator q .F ⊗ₜ[ℂ] quantumSL2Generator q .Kinv +
        1 ⊗ₜ[ℂ] quantumSL2Generator q .F := by
  sorry

/-- The ordered Laurent monomials F^a K^b E^c form a basis of the generic quotient. -/
theorem quantumSL2PBW_exists (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1) :
    ∃ b : Module.Basis (ℕ × ℤ × ℕ) ℂ (QuantumSL2 q), ∀ a z c,
      b (a, z, c) = quantumSL2Generator q .F ^ a *
        ((quantumSL2KUnit q) ^ z : (QuantumSL2 q)ˣ) *
        quantumSL2Generator q .E ^ c := by
  sorry

/-- The generic rank-one quotient is a domain, including nontriviality. -/
theorem quantumSL2_domain (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1) : IsDomain (QuantumSL2 q) := by
  sorry

/-- Every central element is a unique polynomial in the Casimir, and conversely. -/
theorem quantumSL2_center (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1) (z : QuantumSL2 q) :
    (∀ x, Commute z x) ↔ ∃! p : Polynomial ℂ,
      Polynomial.eval₂ (algebraMap ℂ (QuantumSL2 q)) (quantumSL2Casimir q) p = z := by
  sorry

/-- Every finite-dimensional complex module over generic U_q(sl₂) is semisimple. -/
theorem quantumSL2_finite_semisimple (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1)
    (V : Type u) [AddCommGroup V] [Module ℂ V] [Module (QuantumSL2 q) V]
    [IsScalarTower ℂ (QuantumSL2 q) V] [FiniteDimensional ℂ V] :
    IsSemisimpleModule (QuantumSL2 q) V := by
  sorry

/-- Symmetric integer quantum numbers; generic q makes the denominator nonzero. -/
def quantumInteger (q : ℂ) (r : ℤ) : ℂ := (q ^ r - q ^ (-r)) / (q - q⁻¹)

/-- Each finite simple has a signed highest-weight ladder basis, without assuming
that K was diagonalizable in the input module. -/
theorem quantumSL2_simple_classification (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1)
    (V : Type u) [AddCommGroup V] [Module ℂ V] [Module (QuantumSL2 q) V]
    [IsScalarTower ℂ (QuantumSL2 q) V] [FiniteDimensional ℂ V]
    [IsSimpleModule (QuantumSL2 q) V] :
    ∃ (m : ℕ) (ε : ℂ) (b : Module.Basis (Fin (m + 1)) ℂ V),
      (ε = 1 ∨ ε = -1) ∧ ∀ j : Fin (m + 1),
      quantumSL2Generator q .K • b j = (ε * q ^ ((m : ℤ) - 2 * j.val)) • b j ∧
      quantumSL2Generator q .F • b j =
        (if h : j.val < m then quantumInteger q (j.val + 1) • b ⟨j.val + 1, by omega⟩
         else 0) ∧
      quantumSL2Generator q .E • b j =
        (if h : 0 < j.val then (ε * quantumInteger q ((m : ℤ) - j.val + 1)) •
          b ⟨j.val - 1, by omega⟩ else 0) := by
  sorry

/-- Local finiteness means that each cyclic U_q-submodule is finite-dimensional
as a complex vector space, with the restricted scalar action. -/
def QuantumSL2LocallyFinite (q : ℂ) (V : Type u) [AddCommGroup V]
    [Module ℂ V] [Module (QuantumSL2 q) V] [IsScalarTower ℂ (QuantumSL2 q) V] : Prop :=
  ∀ v : V, FiniteDimensional ℂ ((Submodule.span (QuantumSL2 q) {v}).restrictScalars ℂ)

/-- Signed integral weights mean algebraic spanning by K-eigenvectors of weights ±q^z. -/
def QuantumSL2SignedWeights (q : ℂ) (V : Type u) [AddCommGroup V]
    [Module ℂ V] [Module (QuantumSL2 q) V] : Prop :=
  Submodule.span ℂ {v : V | ∃ (z : ℤ) (ε : ℂ), (ε = 1 ∨ ε = -1) ∧
    quantumSL2Generator q .K • v = (ε * q ^ z) • v} = ⊤

/-- Local finiteness is equivalent to signed integral weights and local nilpotence
of both ladder operators, for arbitrary algebraic modules. -/
theorem quantumSL2_locallyFinite_iff (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1)
    (V : Type u) [AddCommGroup V] [Module ℂ V] [Module (QuantumSL2 q) V]
    [IsScalarTower ℂ (QuantumSL2 q) V] :
    QuantumSL2LocallyFinite q V ↔ QuantumSL2SignedWeights q V ∧
      (∀ v : V, ∃ n : ℕ, quantumSL2Generator q .E ^ n • v = 0) ∧
      (∀ v : V, ∃ n : ℕ, quantumSL2Generator q .F ^ n • v = 0) := by
  sorry

/-- Arbitrary locally finite modules are semisimple; their simple submodules are
finite-dimensional and hence are the signed ladders of the classification theorem. -/
theorem quantumSL2_locallyFinite_semisimple (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1)
    (V : Type u) [AddCommGroup V] [Module ℂ V] [Module (QuantumSL2 q) V]
    [IsScalarTower ℂ (QuantumSL2 q) V] (hV : QuantumSL2LocallyFinite q V) :
    IsSemisimpleModule (QuantumSL2 q) V := by
  sorry

end GenericRankOne

end TauCetiRoadmap.QuantumGroups
