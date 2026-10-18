/-
Copyright (c) 2026.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Analysis.InnerProductSpace.LinearPMap
import Mathlib.Topology.Algebra.PontryaginDual
import Mathlib.Data.Matrix.Basis
import TauCeti.LinearAlgebra.Matrix.SpecialOrthogonalGroup.Basic
import Mathlib.RepresentationTheory.Irreducible
import TauCeti.RepresentationTheory.Continuous.Unitary.Basic
import TauCeti.RepresentationTheory.Continuous.Subrepresentation
import TauCeti.LinearAlgebra.CliffordAlgebra.RealForm.ThreeOne
import TauCetiRoadmap.OperatorTheory.SelfAdjointSpectralTheory.Suggested

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms only. The README is the definitive specification.
-/

noncomputable section

open MeasureTheory

namespace TauCetiRoadmap.NoncompactQuantumSymmetry

/-- Topological irreducibility uses closed native invariant subrepresentations. -/
def IsTopologicallyIrreducible {G H : Type*} [Group G] [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] (π : ContRepresentation ℂ G H) : Prop :=
  Nontrivial H ∧ ∀ W : Subrepresentation π.toRepresentation,
    IsClosed (W : Set H) → W = ⊥ ∨ W = ⊤

/-- Admissibility asks for finite compact multiplicity spaces on genuine finite-dimensional
unitary models. Strong continuity is explicit on those models as well as on π. -/
def IsAdmissible {G H : Type*} [Group G] [TopologicalSpace G]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (π : ContRepresentation ℂ G H) (K : Subgroup G) : Prop :=
  ∀ (d : ℕ) (τ : ContRepresentation ℂ K (EuclideanSpace ℂ (Fin d))),
    Representation.IsIrreducible τ.toRepresentation →
    TauCeti.ContRepresentation.IsUnitary τ →
    (∀ v, Continuous fun k : K => τ k v) →
    FiniteDimensional ℂ (ContIntertwiningMap τ (π.restrict K.subtype))

/-- Strong continuity of vector orbits passes to the native restricted representation. -/
theorem strongContinuous_subrepresentation {G H : Type*} [Group G]
    [TopologicalSpace G] [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (π : ContRepresentation ℂ G H) (hπ : ∀ v, Continuous fun g : G => π g v)
    (W : Submodule ℂ H) (hW : ∀ g, ∀ v ∈ W, π g v ∈ W) :
    ∀ v, Continuous fun g : G => TauCeti.ContRepresentation.subrepresentation π W hW g v := by
  intro v
  apply continuous_induced_rng.2
  change Continuous fun g : G => π g (v : H)
  exact hπ v

/-- The same proved transport, directly on the native invariant-subrepresentation carrier. -/
theorem strongContinuous_native_subrepresentation {G H : Type*} [Group G]
    [TopologicalSpace G] [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (π : ContRepresentation ℂ G H) (hπ : ∀ v, Continuous fun g : G => π g v)
    (σ : Subrepresentation π.toRepresentation) :
    ∀ v, Continuous fun g : G =>
      TauCeti.ContRepresentation.subrepresentation π σ.toSubmodule
        (fun g _ hv => σ.apply_mem_toSubmodule g hv) g v :=
  strongContinuous_subrepresentation π hπ σ.toSubmodule
    (fun g _ hv => σ.apply_mem_toSubmodule g hv)

/-- Coordinates for M3's proper Galilei group, using the native rotation carrier.
The group/topology and covered-group constructions remain README targets. -/
structure GalileiCoordinates where
  rotation : Matrix.specialOrthogonalGroup (Fin 3) ℝ
  boost : Fin 3 → ℝ
  displacement : Fin 3 → ℝ
  time : ℝ

/-- Left spacetime composition: the second time multiplies the first boost. -/
def galileiCompose (g h : GalileiCoordinates) : GalileiCoordinates where
  rotation := g.rotation * h.rotation
  boost := g.boost + (g.rotation : Matrix (Fin 3) (Fin 3) ℝ).mulVec h.boost
  displacement := g.displacement +
    (g.rotation : Matrix (Fin 3) (Fin 3) ℝ).mulVec h.displacement + h.time • g.boost
  time := g.time + h.time

/-- The real additive cocycle; its mass-m circle pushout is exp(i*m*τ/ℏ). -/
def galileiMassCocycle (g h : GalileiCoordinates) : ℝ :=
  dotProduct g.boost
      ((g.rotation : Matrix (Fin 3) (Fin 3) ℝ).mulVec h.displacement) +
    (h.time / 2) * dotProduct g.boost g.boost

/-- The native rotation carrier preserves the Euclidean pairing in the mass cocycle. -/
theorem galileiRotation_dotProduct
    (R : Matrix.specialOrthogonalGroup (Fin 3) ℝ) (u v : Fin 3 → ℝ) :
    dotProduct ((R : Matrix (Fin 3) (Fin 3) ℝ).mulVec u)
      ((R : Matrix (Fin 3) (Fin 3) ℝ).mulVec v) = dotProduct u v := by
  have hR : (R : Matrix (Fin 3) (Fin 3) ℝ).transpose * R = 1 :=
    (Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).mp
      (Matrix.mem_specialOrthogonalGroup_iff.mp R.property).1
  simpa only [Matrix.mulVec_mulVec, hR, Matrix.one_mulVec, dotProduct_comm]
    using (Matrix.dotProduct_transpose_mulVec (R : Matrix (Fin 3) (Fin 3) ℝ) v
      ((R : Matrix (Fin 3) (Fin 3) ℝ).mulVec u)).symm

/-- Rotation preservation of the native dot product supplies the cocycle identity. -/
theorem galileiMassCocycle_cocycle (g h k : GalileiCoordinates) :
    galileiMassCocycle g h + galileiMassCocycle (galileiCompose g h) k =
      galileiMassCocycle h k + galileiMassCocycle g (galileiCompose h k) := by
  simp only [galileiMassCocycle, galileiCompose, Submonoid.coe_mul,
    Matrix.mulVec_add, Matrix.mulVec_smul, ← Matrix.mulVec_mulVec,
    add_dotProduct, dotProduct_add, dotProduct_smul]
  simp only [galileiRotation_dotProduct]
  rw [dotProduct_comm ((g.rotation : Matrix (Fin 3) (Fin 3) ℝ).mulVec h.boost) g.boost]
  ring

/-- Time reversal fixes spatial translations and reverses boosts/time. -/
def galileiTimeReverse (g : GalileiCoordinates) : GalileiCoordinates where
  rotation := g.rotation
  boost := -g.boost
  displacement := g.displacement
  time := -g.time

/-- Time reversal respects the native coordinate composition used in M3. -/
theorem galileiTimeReverse_compose (g h : GalileiCoordinates) :
    galileiTimeReverse (galileiCompose g h) =
      galileiCompose (galileiTimeReverse g) (galileiTimeReverse h) := by
  simp [galileiTimeReverse, galileiCompose, Matrix.mulVec_neg,
    neg_smul, smul_neg, add_comm]

/-- The chosen time-reversal lift is involutive on spacetime coordinates. -/
theorem galileiTimeReverse_involutive (g : GalileiCoordinates) :
    galileiTimeReverse (galileiTimeReverse g) = g := by
  cases g
  simp [galileiTimeReverse]

/-- The central coordinate must reverse with the cocycle under time reversal. -/
theorem galileiMassCocycle_timeReverse (g h : GalileiCoordinates) :
    galileiMassCocycle (galileiTimeReverse g) (galileiTimeReverse h) =
      -galileiMassCocycle g h := by
  simp [galileiMassCocycle, galileiTimeReverse, neg_dotProduct]
  ring

/-- A normalized measurable multiplier with an explicit cocycle law. -/
structure BorelMultiplier (G : Type*) [Group G] [MeasurableSpace G] where
  value : G → G → Circle
  measurable : Measurable fun p : G × G => value p.1 p.2
  normalized_left : ∀ g, value 1 g = 1
  normalized_right : ∀ g, value g 1 = 1
  cocycle : ∀ g h k, value g h * value (g * h) k = value h k * value g (h * k)

/-- Covariance data for an existing normalized SAST PVM. -/
structure CovariantPVM (G X H : Type*) [Group G] [TopologicalSpace G]
    [MeasurableSpace G] [MeasurableSpace X]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H] where
  representation : ContRepresentation ℂ G H
  isUnitary : TauCeti.ContRepresentation.IsUnitary representation
  continuous_orbit : ∀ v, Continuous fun g : G => representation g v
  action : G → X → X
  measurableAction : Measurable fun p : G × X => action p.1 p.2
  action_one : ∀ x, action 1 x = x
  action_mul : ∀ g₁ g₂ x, action (g₁ * g₂) x = action g₁ (action g₂ x)
  projections : TauCetiRoadmap.SelfAdjointSpectralTheory.ProjValMeasure X H
  covariance : ∀ g (B : Set X) (hB : MeasurableSet B),
    ∃ hImage : MeasurableSet (action g '' B),
      ∀ x, representation g (projections.proj B hB x) =
        projections.proj (action g '' B) hImage (representation g x)

/-- The measurable quotient-space carrier for the induced Hilbert model. -/
def inducedHilbertSpace (X K : Type*) [MeasurableSpace X]
    [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    (μ : Measure X) := MeasureTheory.Lp K 2 μ

/-- Native circle-valued continuous characters with the compact-open topology. -/
abbrev NCharacter (N : Type*) [Group N] [TopologicalSpace N] := PontryaginDual N

/-- Additive spacetime is given its multiplicative type tag for native PontryaginDual. -/
abbrev TranslationCharacter := PontryaginDual (Multiplicative (Fin 4 → ℝ))

/-- The dual action is exactly precomposition by the inverse base automorphism.
The bundled character and compact-open topology are native; the continuity and action
laws below are explicit compatibility witnesses for the supplied base action. -/
structure DualActionData (N H : Type*) [Group N] [TopologicalSpace N]
    [Group H] [TopologicalSpace H] where
  baseAction : H →* MulAut N
  continuous_baseAction : Continuous fun p : H × N => baseAction p.1 p.2
  act : H → NCharacter N → NCharacter N
  act_apply : ∀ h χ n, act h χ n = χ (baseAction h⁻¹ n)
  act_one : ∀ χ, act 1 χ = χ
  act_mul : ∀ h₁ h₂ χ, act (h₁ * h₂) χ = act h₁ (act h₂ χ)
  continuous_action : Continuous fun p : H × NCharacter N => act p.1 p.2

/-- Joint compact-open continuity gives every individual dual orbit's continuity. -/
theorem DualActionData.continuous_orbit {N H : Type*} [Group N] [TopologicalSpace N]
    [Group H] [TopologicalSpace H] (d : DualActionData N H) (χ : NCharacter N) :
    Continuous fun h => d.act h χ :=
  d.continuous_action.comp (continuous_id.prodMk continuous_const)

/-- A Mackey datum names a point of N̂, its actual dual orbit action, and the closed
stabilizer of that point. Untwisted split-semidir­ect-product little groups are genuine;
projective data require a separately specified global twist/extension. -/
structure MackeyOrbitDatum (N H : Type*) [Group N] [TopologicalSpace N]
    [Group H] [TopologicalSpace H] where
  dualAction : DualActionData N H
  character : NCharacter N
  stabilizerPredicate : H → Prop
  stabilizer_subgroup : Subgroup H
  stabilizer_mem_iff : ∀ h, h ∈ stabilizer_subgroup ↔ stabilizerPredicate h
  stabilizer_closed : IsClosed {h : H | stabilizerPredicate h}
  fixes_character_iff : ∀ h, stabilizerPredicate h ↔ dualAction.act h character = character

/-- The circle-valued formula in the N coordinate for the genuine extension.
M2 constructs the actual semidirect-product character and proves its group law. -/
def MackeyOrbitDatum.extendedCharacterValue {N H : Type*} [Group N] [TopologicalSpace N]
    [Group H] [TopologicalSpace H] (d : MackeyOrbitDatum N H)
    (n : N) (_h : d.stabilizer_subgroup) : Circle := d.character n

/-- Genuine continuous little-group representation on the closed stabilizer. -/
structure GenuineLittleGroupData (N H : Type*) [Group N] [TopologicalSpace N]
    [Group H] [TopologicalSpace H] (K : Type*) [NormedAddCommGroup K]
    [InnerProductSpace ℂ K] [CompleteSpace K] where
  orbit : MackeyOrbitDatum N H
  representation : ContRepresentation ℂ orbit.stabilizer_subgroup K
  isUnitary : TauCeti.ContRepresentation.IsUnitary representation
  continuous_orbit : ∀ v, Continuous fun h : orbit.stabilizer_subgroup => representation h v

/-- A normalized multiplier input for the twisted little-group construction.
A twisted representation and its extension/transport compatibility are M1–M2 targets. -/
structure LittleGroupMultiplierData (H : Type*) [Group H] [MeasurableSpace H] where
  multiplier : BorelMultiplier H

/-- K-finiteness is the actual finite-dimensional orbit span, in the native module carrier.
M0 builds its submodule and the admissible smooth/analytic-vector comparison. -/
def IsKFinite {G H : Type*} [Group G] [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] (π : ContRepresentation ℂ G H)
    (K : Subgroup G) (v : H) : Prop :=
  FiniteDimensional ℂ (Submodule.span ℂ (Set.range fun k : K => π (k : G) v))

/-- The sum of two finite orbit spans is finite-dimensional. -/
theorem IsKFinite.add {G H : Type*} [Group G] [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] (π : ContRepresentation ℂ G H)
    (K : Subgroup G) {v w : H} (hv : IsKFinite π K v) (hw : IsKFinite π K w) :
    IsKFinite π K (v + w) := by
  sorry

/-- Ambient de Sitter signature, with the positive coordinate at index four. -/
def deSitterSignature (a : Fin 5) : ℝ := if a = 4 then 1 else -1

/-- Native matrix units pin the generator and commutator signs. -/
def deSitterGenerator (a b : Fin 5) : Matrix (Fin 5) (Fin 5) ℝ :=
  Matrix.single a b (deSitterSignature b) - Matrix.single b a (deSitterSignature a)

/-- Retain ambient coordinates 0,1,2,4; tangent time is the last coordinate. -/
def lorentzAmbientIndex (μ : Fin 4) : Fin 5 :=
  ⟨if μ.val < 3 then μ.val else 4, by split <;> omega⟩

/-- Contract at the negative radius axis three, before introducing R scaling. -/
def deSitterTranslationGenerator (μ : Fin 4) : Matrix (Fin 5) (Fin 5) ℝ :=
  deSitterGenerator (lorentzAmbientIndex μ) 3

/-- The positive commutator sign follows from the chosen negative radius axis.
Scaling each translation generator by 1/R gives R^(-2) times this Lorentz generator. -/
theorem deSitter_translation_commutator (μ ν : Fin 4) :
    deSitterTranslationGenerator μ * deSitterTranslationGenerator ν -
        deSitterTranslationGenerator ν * deSitterTranslationGenerator μ =
      deSitterGenerator (lorentzAmbientIndex μ) (lorentzAmbientIndex ν) := by
  sorry

/-- Lorentz mass square for the pinned signature `(-,-,-,+)`. -/
def lorentzMassSquared (p : Fin 4 → ℝ) : ℝ :=
  -p 0 ^ 2 - p 1 ^ 2 - p 2 ^ 2 + p 3 ^ 2

/-- The native Hermitian model, rather than a private Pauli-coordinate convention, carries
this pinned mass square to the determinant. -/
theorem lorentzMassSquared_eq_native_hermitian_det (p : Fin 4 → ℝ) :
    (TauCeti.realCliffordThreeOneVectorEquivHermitian p :
      Matrix (Fin 2) (Fin 2) ℂ).det = (lorentzMassSquared p : ℂ) := by
  rw [TauCeti.realCliffordThreeOneVectorEquivHermitian_det,
    TauCeti.realCliffordForm_three_one_apply]
  simp only [lorentzMassSquared, Complex.ofReal_add, Complex.ofReal_sub,
    Complex.ofReal_neg, Complex.ofReal_pow]
  ring

end TauCetiRoadmap.NoncompactQuantumSymmetry
