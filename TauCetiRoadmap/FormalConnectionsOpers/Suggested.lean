import Mathlib.Algebra.LieRinehartAlgebra.Defs
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.LinearAlgebra.TensorProduct.Map
import Mathlib.LinearAlgebra.Quotient.Defs
import Mathlib.GroupTheory.Coset.Defs
import Mathlib.GroupTheory.SemidirectProduct
import Mathlib.LinearAlgebra.RootSystem.WeylGroup
import Mathlib.LinearAlgebra.RootSystem.Base
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import Mathlib.Basic.Complex.Basic
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.Data.Matrix.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Basic
import Mathlib.CategoryTheory.Groupoid.Grpd.Basic
import Mathlib.CategoryTheory.Action
import Mathlib.CategoryTheory.Groupoid
import Mathlib.CategoryTheory.InducedCategory
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.Algebra.MvPolynomial.Eval
import TauCeti.Algebra.AlgebraicGroup.PointsFunctor
import TauCeti.Algebra.AlgebraicGroup.Tangent.Lie.Basic
import TauCeti.Algebra.AlgebraicGroup.ProjectiveGeneralLinear.Basic

/-!
These are suggested forms, not an exhaustive checklist. The README is the
definitive specification. Native Hopf points, derivations, Kähler differentials,
Lie–Rinehart and groupoid carriers are used directly. Proof placeholders denote
construction targets, not implemented results. The algebraic cotangent examples
below do not substitute for the Tate continuous cotangent construction in F7–F8.
-/

noncomputable section
namespace TauCetiRoadmap.FormalConnectionsOpers
open CategoryTheory
open scoped TensorProduct
universe u

section Relative
variable (R : Type u) [CommRing R]
-- Select the coefficientwise algebra action so the native differential quotient
-- sees the explicit R→R((t))→R((t)) scalar tower used by this quotient.
local instance : Algebra R (HahnSeries ℤ R) := HahnSeries.instAlgebra

/-- F1 packages the native Laurent derivative after proving its product rule. -/
def formalDerivation : Derivation R (LaurentSeries R) (LaurentSeries R) := by sorry

theorem formalDerivation_apply (f : LaurentSeries R) :
    formalDerivation R f = LaurentSeries.derivative R f := by sorry

/-- A coordinate has an invertible linear coefficient, also over nonreduced rings. -/
structure Coordinate where
  parameter : PowerSeries R
  constant_zero : PowerSeries.constantCoeff parameter = 0
  linear_unit : IsUnit (PowerSeries.coeff 1 parameter)

def coordinateSubstitution :
    (φ : Coordinate R) → LaurentSeries R ≃ₐ[R] LaurentSeries R := by sorry

theorem coordinateSubstitution_parameter (φ : Coordinate R) :
    coordinateSubstitution R φ (HahnSeries.single 1 1) =
      (φ.parameter : LaurentSeries R) := by sorry

/-- F1: the dt-trivialized quotient, extended to complete modules in the README. -/
abbrev ContinuousDifferentials :=
  KaehlerDifferential R (LaurentSeries R) ⧸
    LinearMap.ker (formalDerivation R).liftKaehlerDifferential

def continuousDifferentialsEquiv :
    ContinuousDifferentials R ≃ₗ[LaurentSeries R] LaurentSeries R := by sorry
end Relative

section Connections
variable (k A M : Type u) [CommRing k] [CommRing A] [Algebra k A]
  [AddCommGroup M] [Module k M] [Module A M] [IsScalarTower k A M]

/-- The vector-field / Lie–Rinehart presentation: operators are k-linear and
connection linearity in vector fields is over A. README F2 compares this with
CR.1.3's ordinary form carrier only when Ω¹_A/k is finite projective. -/
structure Connection where
  along : Derivation k A A →ₗ[A] (M →ₗ[k] M)
  leibniz : ∀ (ξ : Derivation k A A) (a : A) (m : M),
    along ξ (a • m) = a • along ξ m + ξ a • m

/-- Flatness of this vector-field / Lie–Rinehart presentation, using the native
commutator. For ordinary form connections integrability means zero curvature;
the equivalence with this bracket criterion requires finite-projective Ω¹_A/k,
as specified in README F2.1–F2.3. -/
def Connection.IsFlat (conn : Connection k A M) : Prop :=
  ∀ ξ η, conn.along ⁅ξ, η⁆ = ⁅conn.along ξ, conn.along η⁆

/-- Horizontal maps form the actual Hom sets of the flat-connection category. -/
structure HorizontalMap {N : Type u} [AddCommGroup N] [Module k N]
    [Module A N] [IsScalarTower k A N]
    (conn : Connection k A M) (conn' : Connection k A N) where
  map : M →ₗ[A] N
  horizontal : ∀ ξ m, map (conn.along ξ m) = conn'.along ξ (map m)
end Connections

section HopfLoops
variable (k H R : Type u) [CommRing k] [CommRing H] [HopfAlgebra k H]
  [CommRing R] [Algebra k R]

/-- Native convolution points, not a new abstract loop-group carrier. -/
abbrev LoopPoints :=
  TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k (LaurentSeries R))

abbrev PositiveLoopPoints :=
  TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k (PowerSeries R))

/-- F3 includes jet truncation and its proalgebraic presentation. -/
def congruenceSubgroup :
    (N : ℕ) → Subgroup (PositiveLoopPoints k H R) := by sorry

/-- F3's coefficient inclusion from positive to Laurent loop points. -/
def positiveLoopInclusion : PositiveLoopPoints k H R →* LoopPoints k H R := by sorry

theorem positiveLoopInclusion_injective :
    Function.Injective (positiveLoopInclusion k H R) := by sorry

theorem congruenceSubgroup_antitone : Antitone (congruenceSubgroup k H R) := by sorry

/-- The inclusion is the actual coefficient inclusion on every Hopf coordinate. -/
theorem positiveLoopInclusion_apply (g : PositiveLoopPoints k H R) (x : H) :
    (positiveLoopInclusion k H R g).ofConv x =
      HahnSeries.ofPowerSeries ℤ R (g.ofConv x) := by sorry

/-- Kernel of the N-jet map, expressed in native power-series coefficients. -/
theorem mem_congruenceSubgroup_iff (N : ℕ) (g : PositiveLoopPoints k H R) :
    g ∈ congruenceSubgroup k H R N ↔
      ∀ x : H, ∀ n < N, PowerSeries.coeff n (g.ofConv x) =
        if n = 0 then algebraMap k R (Coalgebra.counit (R := k) x) else 0 := by sorry


/-- Native Lie algebra of points: the coefficient algebra acts through the counit. -/
abbrev TangentLoop :=
  Derivation k H (TauCeti.Bialgebra.CounitAlgebra k H (LaurentSeries R))

example : LieAlgebra k (TangentLoop k H R) := inferInstance

/-- F3 constructs dlog on actual Hopf loop points by tangent translation. -/
def logarithmicDerivative : LoopPoints k H R → TangentLoop k H R := by sorry

def loopAdjoint : LoopPoints k H R →*
    (TangentLoop k H R ≃ₗ[k] TangentLoop k H R) := by sorry

def formalGauge (g : LoopPoints k H R) (A : TangentLoop k H R) :
    TangentLoop k H R :=
  loopAdjoint k H R g A - logarithmicDerivative k H R g

theorem logarithmicDerivative_mul (g h : LoopPoints k H R) :
    logarithmicDerivative k H R (h * g) = logarithmicDerivative k H R h +
      loopAdjoint k H R h (logarithmicDerivative k H R g) := by sorry
end HopfLoops

section MatrixGauge
variable (R : Type u) [CommRing R] (n : ℕ)
abbrev ConnectionMatrix := Matrix (Fin n) (Fin n) (LaurentSeries R)

def matrixDerivative (A : ConnectionMatrix R n) : ConnectionMatrix R n :=
  fun i j => LaurentSeries.derivative R (A i j)

/-- Left gauge convention fixed throughout the specification. -/
def matrixGauge (g : (ConnectionMatrix R n)ˣ) (A : ConnectionMatrix R n) :
    ConnectionMatrix R n :=
  (g : ConnectionMatrix R n) * A * (↑g⁻¹ : ConnectionMatrix R n) -
    matrixDerivative R n (g : ConnectionMatrix R n) *
      (↑g⁻¹ : ConnectionMatrix R n)

theorem matrixGauge_comp (g h : (ConnectionMatrix R n)ˣ)
    (A : ConnectionMatrix R n) :
    matrixGauge R n h (matrixGauge R n g A) = matrixGauge R n (h * g) A := by sorry

/-- A separate object type prevents action/groupoid instances on bare matrices. -/
structure MatrixConnection where
  coefficient : ConnectionMatrix R n

@[instance_reducible]
def matrixGaugeAction : MulAction ((ConnectionMatrix R n)ˣ) (MatrixConnection R n) where
  smul g A := ⟨matrixGauge R n g A.coefficient⟩
  one_smul := by sorry
  mul_smul := by sorry

attribute [local instance] matrixGaugeAction

abbrev MatrixConnectionGroupoid :=
  ActionCategory ((ConnectionMatrix R n)ˣ) (MatrixConnection R n)

example : Groupoid (MatrixConnectionGroupoid R n) := inferInstance
end MatrixGauge

section RankOne
variable (R : Type u) [CommRing R] [Algebra ℚ R]

def operMatrix (q : LaurentSeries R) : ConnectionMatrix R 2 :=
  !![0, q; 1, 0]

/-- Native PGL₂ scheme points, including nonreduced coefficient algebras. -/
abbrev PGL2LoopPoints := TauCeti.HopfAlgebra.points
  (H := TauCeti.ProjectiveGeneralLinear.coordinateHopfAlgebra 2 ℚ)
  (CommAlgCat.of ℚ (LaurentSeries R))

structure AdjointConnection where
  coefficient : ConnectionMatrix R 2
  trace_zero : Matrix.trace coefficient = 0

def pgl2Gauge : PGL2LoopPoints R → AdjointConnection R → AdjointConnection R := by sorry

@[instance_reducible]
def pgl2GaugeAction : MulAction (PGL2LoopPoints R) (AdjointConnection R) where
  smul := pgl2Gauge R
  one_smul := by sorry
  mul_smul := by sorry

attribute [local instance] pgl2GaugeAction

abbrev AdjointConnectionGroupoid := ActionCategory (PGL2LoopPoints R) (AdjointConnection R)

def operObject (q : LaurentSeries R) : AdjointConnectionGroupoid R :=
  (ActionCategory.objEquiv _ _) ⟨operMatrix R q, by simp [operMatrix, Matrix.trace]⟩

/-- Native induced groupoid: PGL₂ arrows, without spurious GL₂ scalar stabilizers. -/
abbrev RankOneIsomonodromy :=
  InducedCategory (AdjointConnectionGroupoid R) (operObject R)

example : Groupoid (RankOneIsomonodromy R) := inferInstance

def isomonodromyHomEquiv (q q' : RankOneIsomonodromy R) :
    (q ⟶ q') ≃ {g : PGL2LoopPoints R //
      pgl2Gauge R g (ActionCategory.back (operObject R q)) =
        ActionCategory.back (operObject R q')} := by sorry

/-- F5's coefficientwise noninjectivity witness works over every ℚ-algebra. -/
theorem regular_noninjectivity :
    ∃ g : (ConnectionMatrix R 2)ˣ,
      matrixGauge R 2 g (operMatrix R 0) = operMatrix R 1 := by sorry
/-- The DS cotangent/gauge representative in the fixed rank-one normalization. -/
def cotangentMatrix (q eps : LaurentSeries R) : ConnectionMatrix R 2 :=
  let half : LaurentSeries R := HahnSeries.C (algebraMap ℚ R (1 / 2))
  let d := LaurentSeries.derivative R
  !![-half * d eps, q * eps - half * d (d eps); eps, half * d eps]

def infinitesimalMatrixGauge (X A : ConnectionMatrix R 2) : ConnectionMatrix R 2 :=
  X * A - A * X - matrixDerivative R 2 X

def kdVOperator (q eps : LaurentSeries R) : LaurentSeries R :=
  let half : LaurentSeries R := HahnSeries.C (algebraMap ℚ R (1 / 2))
  let d := LaurentSeries.derivative R
  2 * q * d eps + d q * eps - half * d (d (d eps))

/-- Left gauge label X has -Pq; the Hamiltonian cotangent label maps to -X. -/
theorem cotangentMatrix_gauge (q eps : LaurentSeries R) :
    infinitesimalMatrixGauge R (cotangentMatrix R q eps) (operMatrix R q) =
      !![0, -(kdVOperator R q eps); 0, 0] := by sorry

def rankOneOper (q : LaurentSeries R) : RankOneIsomonodromy R := q

/-- The two distinct oper coefficients have a genuine native PGL₂ gauge arrow. -/
theorem regular_oper_noninjectivity [Nontrivial R] :
    rankOneOper R 0 ≠ rankOneOper R 1 ∧
      Nonempty (rankOneOper R 0 ⟶ rankOneOper R 1) := by
  constructor
  · change (0 : LaurentSeries R) ≠ 1
    exact zero_ne_one
  · sorry
end RankOne

section Functions
variable (k : Type u) [CommRing k] (ℓ : ℕ)

abbrev CoefficientIndex (N : ℕ) := Fin ℓ × {j : ℤ // -(N : ℤ) ≤ j}
abbrev StageFunctions (N : ℕ) := MvPolynomial (CoefficientIndex ℓ N) k

/-- Restriction from a larger pole-bound stage sends its newly allowed coefficient to zero. -/
def stageRestriction (N : ℕ) :
    StageFunctions k ℓ (N + 1) →ₐ[k] StageFunctions k ℓ N := by sorry

theorem stageRestriction_X (N : ℕ) (i : Fin ℓ) (j : ℤ)
    (h : -((N + 1 : ℕ) : ℤ) ≤ j) :
    stageRestriction k ℓ N (MvPolynomial.X (i, ⟨j, h⟩)) =
      if hj : -(N : ℤ) ≤ j then MvPolynomial.X (i, ⟨j, hj⟩) else 0 := by sorry

/-- The inverse limit is a subalgebra of the native product of polynomial algebras. -/
def compatibleFunctions : Subalgebra k ((N : ℕ) → StageFunctions k ℓ N) := by sorry

theorem mem_compatibleFunctions_iff (f : (N : ℕ) → StageFunctions k ℓ N) :
    f ∈ compatibleFunctions k ℓ ↔
      ∀ N, stageRestriction k ℓ N (f (N + 1)) = f N := by sorry

abbrev PuncturedOperFunctions := compatibleFunctions k ℓ
abbrev RegularOperFunctions := StageFunctions k ℓ 0

/-- F5's inverse-limit topology, with every polynomial stage discrete. -/
@[instance_reducible]
def puncturedOperTopology : TopologicalSpace (PuncturedOperFunctions k ℓ) := by
  letI (N : ℕ) : TopologicalSpace (StageFunctions k ℓ N) := ⊥
  exact TopologicalSpace.induced Subtype.val inferInstance

/-- Projection to a closed pole-bound stage of the native inverse-limit carrier. -/
def stageProjection (N : ℕ) :
    PuncturedOperFunctions k ℓ →ₐ[k] StageFunctions k ℓ N := by sorry

theorem stageProjection_apply (N : ℕ) (f : PuncturedOperFunctions k ℓ) :
    stageProjection k ℓ N f = (f : (M : ℕ) → StageFunctions k ℓ M) N := by sorry

def restrictRegular : PuncturedOperFunctions k ℓ →ₐ[k] RegularOperFunctions k ℓ :=
  stageProjection k ℓ 0

/-- Each Laurent coefficient is a compatible function, including its zero restriction
on stages where that negative coefficient is excluded. -/
def operCoefficient :
    (i : Fin ℓ) → (j : ℤ) → PuncturedOperFunctions k ℓ := by sorry

theorem operCoefficient_stage (N : ℕ) (i : Fin ℓ) (j : ℤ) :
    stageProjection k ℓ N (operCoefficient k ℓ i j) =
      if hj : -(N : ℤ) ≤ j then MvPolynomial.X (i, ⟨j, hj⟩) else 0 := by sorry

variable (R : Type*) [CommRing R] [Algebra k R]

/-- A common pole bound for the finite tuple of oper coordinates. -/
def AdmissiblePoleBound (q : Fin ℓ → LaurentSeries R) (N : ℕ) : Prop :=
  ∀ i j, j < -(N : ℤ) → (q i).coeff j = 0

theorem exists_admissiblePoleBound (q : Fin ℓ → LaurentSeries R) :
    ∃ N, AdmissiblePoleBound ℓ R q N := by sorry

theorem AdmissiblePoleBound.mono (q : Fin ℓ → LaurentSeries R) (N M : ℕ)
    (hN : AdmissiblePoleBound ℓ R q N) (hNM : N ≤ M) :
    AdmissiblePoleBound ℓ R q M := by sorry

def stageEvaluation (q : Fin ℓ → LaurentSeries R) (N : ℕ) :
    StageFunctions k ℓ N →ₐ[k] R :=
  MvPolynomial.aeval (fun ix => (q ix.1).coeff ix.2)

theorem stageEvaluation_X (q : Fin ℓ → LaurentSeries R) (N : ℕ)
    (i : Fin ℓ) (j : ℤ) (hj : -(N : ℤ) ≤ j) :
    stageEvaluation k ℓ R q N (MvPolynomial.X (i, ⟨j, hj⟩)) = (q i).coeff j := by
  simp [stageEvaluation]

/-- The primitive compatibility target from which arbitrary-stage independence follows. -/
theorem stageEvaluation_comp_stageRestriction (q : Fin ℓ → LaurentSeries R) (N : ℕ)
    (hN : AdmissiblePoleBound ℓ R q N) :
    (stageEvaluation k ℓ R q N).comp (stageRestriction k ℓ N) =
      stageEvaluation k ℓ R q (N + 1) := by sorry

/-- F5 constructs evaluation from any common admissible bound and proves
independence of that bound; the coefficient embedding is fixed by Algebra k R. -/
def operEvaluation (q : Fin ℓ → LaurentSeries R) :
    PuncturedOperFunctions k ℓ →ₐ[k] R :=
  let N := Classical.choose (exists_admissiblePoleBound ℓ R q)
  (stageEvaluation k ℓ R q N).comp (stageProjection k ℓ N)

theorem operEvaluation_at_bound (q : Fin ℓ → LaurentSeries R) (N : ℕ)
    (hN : AdmissiblePoleBound ℓ R q N) :
    operEvaluation k ℓ R q =
      (stageEvaluation k ℓ R q N).comp (stageProjection k ℓ N) := by sorry

theorem stageEvaluation_independent (q : Fin ℓ → LaurentSeries R) (N M : ℕ)
    (hN : AdmissiblePoleBound ℓ R q N) (hM : AdmissiblePoleBound ℓ R q M) :
    (stageEvaluation k ℓ R q N).comp (stageProjection k ℓ N) =
      (stageEvaluation k ℓ R q M).comp (stageProjection k ℓ M) := by
  rw [← operEvaluation_at_bound k ℓ R q N hN,
    ← operEvaluation_at_bound k ℓ R q M hM]

theorem operEvaluation_coefficient (q : Fin ℓ → LaurentSeries R) (i : Fin ℓ) (j : ℤ) :
    operEvaluation k ℓ R q (operCoefficient k ℓ i j) = (q i).coeff j := by sorry

theorem operEvaluation_regular (q : Fin ℓ → LaurentSeries R)
    (h0 : AdmissiblePoleBound ℓ R q 0) :
    operEvaluation k ℓ R q =
      (stageEvaluation k ℓ R q 0).comp (restrictRegular k ℓ) :=
  operEvaluation_at_bound k ℓ R q 0 h0

/-- This open stage kernel certifies continuity when the coefficient algebra R is discrete. -/
theorem stageKernel_le_evaluationKernel (q : Fin ℓ → LaurentSeries R) (N : ℕ)
    (hN : AdmissiblePoleBound ℓ R q N) :
    RingHom.ker (stageProjection k ℓ N) ≤ RingHom.ker (operEvaluation k ℓ R q) := by
  intro f hf
  change stageProjection k ℓ N f = 0 at hf
  change operEvaluation k ℓ R q f = 0
  rw [operEvaluation_at_bound k ℓ R q N hN]
  change stageEvaluation k ℓ R q N (stageProjection k ℓ N f) = 0
  rw [hf, map_zero]

variable (S : Type*) [CommRing S] [Algebra k S]

/-- F4's DS-coordinate identification supplies the tuple; F5 evaluation is natural
under native coefficientwise Hahn-series base change, including Artinian targets. -/
theorem operEvaluation_natural (q : Fin ℓ → LaurentSeries R) (φ : R →ₐ[k] S) :
    operEvaluation k ℓ S (fun i => (q i).map φ) =
      φ.comp (operEvaluation k ℓ R q) := by sorry
end Functions

section Poisson
variable (k A : Type u) [CommRing k] [CommRing A] [Algebra k A]

/-- A genuine Poisson bracket specified by its equations. -/
structure PoissonBracket where
  bracket : A →ₗ[k] A →ₗ[k] A
  alternating : ∀ a, bracket a a = 0
  jacobi : ∀ a b c, bracket a (bracket b c) +
    bracket b (bracket c a) + bracket c (bracket a b) = 0
  leibniz : ∀ a b c, bracket a (b * c) = bracket a b * c + b * bracket a c

def PoissonBracket.hamiltonian :
    (P : PoissonBracket k A) → A → Derivation k A A := by sorry

theorem PoissonBracket.hamiltonian_apply (P : PoissonBracket k A) (a b : A) :
    PoissonBracket.hamiltonian k A P a b = P.bracket a b := by sorry

/-- First the genuine anchor on the native algebraic differentials. -/
def cotangentAnchor :
    (P : PoissonBracket k A) → KaehlerDifferential k A →ₗ[A] Derivation k A A := by sorry

theorem cotangentAnchor_d (P : PoissonBracket k A) (a b : A) :
    cotangentAnchor k A P (KaehlerDifferential.D k A a) b = P.bracket a b := by sorry

/-- F7 packages the Koszul bracket, with local structures placed directly on the native differential module.
The full Tate instance and its topology are distinct targets of the README. -/
def cotangentBracket :
    (P : PoissonBracket k A) → KaehlerDifferential k A → KaehlerDifferential k A → KaehlerDifferential k A := by sorry

@[instance_reducible]
def cotangentLieRing (P : PoissonBracket k A) : LieRing (KaehlerDifferential k A) where
  __ := (inferInstance : AddCommGroup (KaehlerDifferential k A))
  bracket := cotangentBracket k A P
  add_lie := by sorry
  lie_add := by sorry
  lie_self := by sorry
  leibniz_lie := by sorry

/-- On exact Kähler differentials the cotangent Koszul bracket restricts to the differential of
  the Poisson bracket. This pins the sign convention used by the connection module. -/
theorem cotangentLieRing_exact_forms (P : PoissonBracket k A) (a b : A) :
    letI := cotangentLieRing k A P
    ⁅KaehlerDifferential.D k A a, KaehlerDifferential.D k A b⁆
      = KaehlerDifferential.D k A (P.bracket a b) := by sorry

@[instance_reducible]
def cotangentLieAlgebra (P : PoissonBracket k A) :
    letI := cotangentLieRing k A P
    LieAlgebra k (KaehlerDifferential k A) := by
  letI := cotangentLieRing k A P
  exact { (inferInstance : Module k (KaehlerDifferential k A)) with lie_smul := by sorry }

@[instance_reducible]
def cotangentLieRingModule (P : PoissonBracket k A) :
    letI := cotangentLieRing k A P
    LieRingModule (KaehlerDifferential k A) A := by
  letI := cotangentLieRing k A P
  exact { bracket := fun α a => cotangentAnchor k A P α a
          add_lie := by sorry
          lie_add := by sorry
          leibniz_lie := by sorry }

theorem cotangentLieRinehartRing (P : PoissonBracket k A) :
    letI := cotangentLieRing k A P
    letI := cotangentLieRingModule k A P
    LieRinehartRing A (KaehlerDifferential k A) := by sorry

theorem cotangentLieRinehartAlgebra (P : PoissonBracket k A) :
    letI := cotangentLieRing k A P
    letI := cotangentLieRingModule k A P
    letI := cotangentLieRinehartRing k A P
    letI := cotangentLieAlgebra k A P
    LieRinehartAlgebra k A (KaehlerDifferential k A) := by sorry

/-- A coisotropic ideal is weaker than a Poisson ideal. -/
def IsCoisotropic (P : PoissonBracket k A) (I : Ideal A) : Prop :=
  ∀ a ∈ I, ∀ b ∈ I, P.bracket a b ∈ I
end Poisson

section NativeAlgebroid
variable (k A L : Type u) [CommRing k] [CommRing A] [Algebra k A]
  [LieRing L] [Module A L] [LieRingModule L A] [LieRinehartRing A L]
  [LieAlgebra k L] [LieRinehartAlgebra k A L]

/-- F8 must prove its constructed algebroid satisfies these native hypotheses. -/
example : LieRinehartAlgebra.Hom (AlgHom.id k A) L (Derivation k A A) :=
  LieRinehartAlgebra.anchor k A L

example (x : L) (a : A) : LieRinehartAlgebra.anchor k A L x a = ⁅x, a⁆ := rfl
end NativeAlgebroid

/-! ## F2 elementary operators and actual principal-parts quotient
These are characteristic-free ordinary algebraic targets. The existing `Connection`
above is the vector-field presentation, not CR.1.3's ordinary form carrier. -/
section OrdinaryOperators
variable (k : Type u) {A M N P : Type u} [CommRing k] [CommRing A] [Algebra k A]
  [AddCommGroup M] [Module k M] [Module A M] [IsScalarTower k A M]
  [AddCommGroup N] [Module k N] [Module A N] [IsScalarTower k A N]
  [AddCommGroup P] [Module k P] [Module A P] [IsScalarTower k A P]

/-- Multiplication by an actual scalar, restricted to the base ring. -/
def scalarOperator (a : A) : M →ₗ[k] M :=
  (a • (LinearMap.id : M →ₗ[A] M)).restrictScalars k

/-- The shared sign/order is D(a m) - a D(m). -/
def commutatorWith (a : A) (D : M →ₗ[k] N) : M →ₗ[k] N :=
  D.comp (scalarOperator k a) - (scalarOperator k a).comp D

theorem commutatorWith_apply (a : A) (D : M →ₗ[k] N) (m : M) :
    commutatorWith k a D m = D (a • m) - a • D m := rfl

/-- At-most order, including zero operators and arbitrary commutative base rings. -/
def IsDifferentialOperator : ℕ → (M →ₗ[k] N) → Prop
  | 0, D => ∀ (a : A) (m : M), D (a • m) = a • D m
  | n + 1, D => ∀ a : A, IsDifferentialOperator n (commutatorWith k a D)

theorem differentialOperator_order_zero (D : M →ₗ[k] N) :
    IsDifferentialOperator (A := A) k 0 D ↔
      ∀ (a : A) (m : M), D (a • m) = a • D m := Iff.rfl

theorem differentialOperator_mono (n m : ℕ) (h : n ≤ m) (D : M →ₗ[k] N)
    (hD : IsDifferentialOperator (A := A) k n D) :
    IsDifferentialOperator (A := A) k m D := by sorry

theorem differentialOperator_comp (m n : ℕ) (D : M →ₗ[k] N) (E : N →ₗ[k] P)
    (hD : IsDifferentialOperator (A := A) k m D)
    (hE : IsDifferentialOperator (A := A) k n E) :
    IsDifferentialOperator (A := A) k (m + n) (E.comp D) := by sorry

/-- The two tensor factors carry the actual left/right scalar difference. -/
def principalPartsDelta (a : A) : A ⊗[k] M →ₗ[k] A ⊗[k] M :=
  TensorProduct.map (scalarOperator k (M := A) a) LinearMap.id -
    TensorProduct.map LinearMap.id (scalarOperator k (M := M) a)

/-- Actual (n+1)-fold difference relations; no admitted replacement carrier. -/
def principalPartsRelations (n : ℕ) : Submodule A (A ⊗[k] M) :=
  Submodule.span A {z | ∃ (a : Fin (n + 1) → A) (b : A) (m : M),
    z = (List.ofFn a).foldr (fun c v => principalPartsDelta k c v) (b ⊗ₜ[k] m)}

abbrev PrincipalParts (n : ℕ) := (A ⊗[k] M) ⧸ principalPartsRelations k (A := A) (M := M) n

/-- The actual universal jet is the quotient class of 1 tensor m. -/
def principalJet (n : ℕ) : M →ₗ[k] PrincipalParts k (A := A) (M := M) n :=
  ((principalPartsRelations k (A := A) (M := M) n).mkQ.restrictScalars k).comp
    (TensorProduct.mk k A M 1)

/-- Its inverse is the universal factorization target; n is retained inside the Pi. -/
def principalPartsHomEquiv : (n : ℕ) →
    ((PrincipalParts k (A := A) (M := M) n →ₗ[A] N) ≃
      {D : M →ₗ[k] N // IsDifferentialOperator (A := A) k n D}) := by sorry

theorem principalPartsHomEquiv_apply (n : ℕ)
    (f : PrincipalParts k (A := A) (M := M) n →ₗ[A] N) :
    (principalPartsHomEquiv k n f).val =
      (f.restrictScalars k).comp (principalJet k n) := by sorry

/-- The order transition is tied to the named quotient and universal jets. -/
def principalPartsTransition : (n m : ℕ) → n ≤ m →
    PrincipalParts k (A := A) (M := M) m →ₗ[A]
      PrincipalParts k (A := A) (M := M) n := by sorry

theorem principalPartsTransition_jet (n m : ℕ) (h : n ≤ m) (x : M) :
    principalPartsTransition k (A := A) n m h (principalJet k (A := A) m x) =
      principalJet k (A := A) n x := by sorry
end OrdinaryOperators

/-! ## F3A polynomial/formal interfaces on the same native Hopf points -/
section PolynomialLoops
variable (k H R : Type u) [CommRing k] [CommRing H] [HopfAlgebra k H]
  [CommRing R] [Algebra k R]

abbrev PolynomialLoopPoints :=
  TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k (LaurentPolynomial R))

abbrev PositivePolynomialLoopPoints :=
  TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k (Polynomial R))

/-- Defined native value-algebra pushforward; no independent group law. -/
def polynomialPositiveInclusion :
    PositivePolynomialLoopPoints k H R →* PolynomialLoopPoints k H R :=
  TauCeti.AlgHom.mapValue (H := H) ((Polynomial.toLaurentAlg :
    Polynomial R →ₐ[R] LaurentPolynomial R).restrictScalars k)

/-- The invertible formal parameter used by native Laurent evaluation. -/
def formalParameterUnit : (LaurentSeries R)ˣ where
  val := HahnSeries.single 1 1
  inv := HahnSeries.single (-1) 1
  val_inv := by simp [HahnSeries.single_mul_single]
  inv_val := by simp [HahnSeries.single_mul_single]

/-- The actual Laurent-polynomial coefficient inclusion, not an admitted map. -/
def polynomialCoefficientInclusion : LaurentPolynomial R →ₐ[R] LaurentSeries R :=
  { LaurentPolynomial.eval₂ (algebraMap R (LaurentSeries R))
      (formalParameterUnit R) with
    commutes' := by
      intro r
      change LaurentPolynomial.eval₂ (algebraMap R (LaurentSeries R))
        (formalParameterUnit R) (LaurentPolynomial.C r) = _
      exact LaurentPolynomial.eval₂_C _ _ r }

theorem polynomialCoefficientInclusion_coeff (f : LaurentPolynomial R) (j : ℤ) :
    (polynomialCoefficientInclusion R f).coeff j = f.coeff j := by sorry

def polynomialLoopToFormal : PolynomialLoopPoints k H R →* LoopPoints k H R :=
  TauCeti.AlgHom.mapValue (H := H)
    { (polynomialCoefficientInclusion R).toRingHom with
      commutes' := by
        intro a
        change (polynomialCoefficientInclusion R)
          (algebraMap k (LaurentPolynomial R) a) = algebraMap k (LaurentSeries R) a
        simp [polynomialCoefficientInclusion, LaurentPolynomial.algebraMap_apply,
          HahnSeries.algebraMap_apply', PowerSeries.algebraMap_apply] }

def positivePolynomialToFormal :
    PositivePolynomialLoopPoints k H R →* PositiveLoopPoints k H R :=
  TauCeti.AlgHom.mapValue (H := H) ((Polynomial.coeToPowerSeries.algHom R).restrictScalars k)

theorem polynomialFormal_inclusion_square :
    (polynomialLoopToFormal k H R).comp (polynomialPositiveInclusion k H R) =
      (positiveLoopInclusion k H R).comp (positivePolynomialToFormal k H R) := by sorry

abbrev PolynomialGrassmannianPoints :=
  PolynomialLoopPoints k H R ⧸ (polynomialPositiveInclusion k H R).range

abbrev FormalGrassmannianPoints :=
  LoopPoints k H R ⧸ (positiveLoopInclusion k H R).range

/-- A defined coset map: positive subgroups are not assumed normal. -/
def polynomialFormalCosetMap :
    PolynomialGrassmannianPoints k H R → FormalGrassmannianPoints k H R :=
  Quotient.map' (polynomialLoopToFormal k H R) (by sorry)

theorem polynomialFormalCosetMap_mk (g : PolynomialLoopPoints k H R) :
    polynomialFormalCosetMap k H R
      (Quotient.mk (QuotientGroup.leftRel (polynomialPositiveInclusion k H R).range) g) =
    Quotient.mk (QuotientGroup.leftRel (positiveLoopInclusion k H R).range)
      (polynomialLoopToFormal k H R g) := rfl

/-- Evaluation is a native point map; the specified Borel is an actual subgroup input. -/
def polynomialEvaluationZero :
    PositivePolynomialLoopPoints k H R →* TauCeti.HopfAlgebra.points (H := H)
      (CommAlgCat.of k R) :=
  TauCeti.AlgHom.mapValue (H := H) ((Polynomial.aeval (R := R) (0 : R)).restrictScalars k)

def polynomialIwahori (B : Subgroup (TauCeti.HopfAlgebra.points (H := H)
    (CommAlgCat.of k R))) : Subgroup (PositivePolynomialLoopPoints k H R) :=
  B.comap (polynomialEvaluationZero k H R)

theorem mem_polynomialIwahori (B : Subgroup (TauCeti.HopfAlgebra.points (H := H)
    (CommAlgCat.of k R))) (g : PositivePolynomialLoopPoints k H R) :
    g ∈ polynomialIwahori k H R B ↔ polynomialEvaluationZero k H R g ∈ B := Iff.rfl
end PolynomialLoops

/-- The actual native reductive predicate includes smoothness and geometric connectedness.
This selected signature uses small-universe complex algebras; F3A states the natural
functor comparison in general universes. No arbitrary loop group is assumed reductive. -/
theorem polynomialFormalCosetMap_bijective
    (H : TauCeti.FiniteTypeCommHopfAlgCat ℂ)
    (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (R : Type) [CommRing R] [Algebra ℂ R] :
    Function.Bijective (polynomialFormalCosetMap ℂ H R) := by sorry

/-! ## Full cocharacter action: native opposite action is explicitly inverted -/
section ExtendedWeyl
variable {ι X Y : Type u} [AddCommGroup X] [Module ℤ X]
  [AddCommGroup Y] [Module ℤ Y]

/-- Conversion of the native contravariant coweight hom to the ordinary action.
The complete root pairing is retained as data, inside the admitted Pi. -/
def cocharacterAction : (P : RootPairing ι ℤ X Y) →
    P.weylGroup →* MulAut (Multiplicative Y) := by sorry

theorem cocharacterAction_apply (P : RootPairing ι ℤ X Y)
    (w : P.weylGroup) (y : Y) :
    cocharacterAction P w (Multiplicative.ofAdd y) =
      Multiplicative.ofAdd (RootPairing.Equiv.coweightEquiv (w : RootPairing.Aut P)⁻¹ y) := by sorry

abbrev ExtendedWeyl (P : RootPairing ι ℤ X Y) :=
  SemidirectProduct (Multiplicative Y) P.weylGroup (cocharacterAction P)

def corootLattice (P : RootPairing ι ℤ X Y) : AddSubgroup Y :=
  AddSubgroup.closure (Set.range P.coroot)

def dominantCocharacters (P : RootPairing ι ℤ X Y) (base : P.Base) : Set Y :=
  {y | ∀ i ∈ base.support, 0 ≤ P.root' i y}
end ExtendedWeyl
end TauCetiRoadmap.FormalConnectionsOpers
