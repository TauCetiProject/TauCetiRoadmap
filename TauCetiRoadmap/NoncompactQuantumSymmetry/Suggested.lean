/-
Copyright (c) 2026.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.RepresentationTheory.Symmetric.TensorAction.Basic
import TauCeti.LinearAlgebra.Matrix.SpecialOrthogonalGroup.Basic
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
open scoped Pointwise

namespace TauCetiRoadmap.NoncompactQuantumSymmetry

/-- Topological irreducibility uses closed native invariant subrepresentations. -/
def IsTopologicallyIrreducible {G H : Type*} [Group G] [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] (π : ContRepresentation ℂ G H) : Prop :=
  Nontrivial H ∧ ∀ W : Subrepresentation π.toRepresentation,
    IsClosed (W : Set H) → W = ⊥ ∨ W = ⊤

/-- The compact multiplicity condition, independent of group-orbit continuity.
In M0 the supplied subgroup K is compact. -/
def HasFiniteKMultiplicities {G H : Type*} [Group G] [TopologicalSpace G]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (π : ContRepresentation ℂ G H) (K : Subgroup G) : Prop :=
  ∀ (d : ℕ) (τ : ContRepresentation ℂ K (EuclideanSpace ℂ (Fin d))),
    Representation.IsIrreducible τ.toRepresentation →
    TauCeti.ContRepresentation.IsUnitary τ →
    (∀ v, Continuous fun k : K => τ k v) →
    FiniteDimensional ℂ (ContIntertwiningMap τ (π.restrict K.subtype))

/-- Admissibility in the strongly continuous M0 scope. The native representation
carrier itself only asserts continuity of each linear operator. -/
def IsAdmissible {G H : Type*} [Group G] [TopologicalSpace G]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (π : ContRepresentation ℂ G H) (K : Subgroup G) : Prop :=
  (∀ v, Continuous fun g : G => π g v) ∧ HasFiniteKMultiplicities π K

theorem isAdmissible_iff {G H : Type*} [Group G] [TopologicalSpace G]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (π : ContRepresentation ℂ G H) (K : Subgroup G) :
    IsAdmissible π K ↔
      (∀ v, Continuous fun g : G => π g v) ∧ HasFiniteKMultiplicities π K := Iff.rfl

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

/-- A normalized measurable multiplier with an explicit cocycle law, in the convention
`U g * U h = ω g h • U (g * h)`. Forgetting measurability gives a `TauCeti.FactorSet G Circle`
for the trivial action (README Layer P.3), whose extension carries the algebra of `E_ω`. -/
structure BorelMultiplier (G : Type*) [Group G] [MeasurableSpace G] where
  value : G → G → Circle
  measurable : Measurable fun p : G × G => value p.1 p.2
  normalized_left : ∀ g, value 1 g = 1
  normalized_right : ∀ g, value g 1 = 1
  cocycle : ∀ g h k, value g h * value (g * h) k = value h k * value g (h * k)

/-- M1.BorelRealization: a jointly Borel action of a Polish group on a standard
Borel space admits a compatible Polish topology making the same action continuous.
No topology on X, original continuous action, local compactness or transitivity is assumed.
The unchanged measurable-space instance is the Borel structure of the output topology,
so the identity is an equivariant native `MeasurableEquiv`. This is a theorem target;
the Vaught-transform/strong-Choquet realization proof is owned by M1. -/
theorem exists_polishTopology_continuousSMul
    (G X : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [PolishSpace G]
    [MeasurableSpace G] [BorelSpace G] [MeasurableSpace X] [StandardBorelSpace X]
    [MulAction G X] [MeasurableSMul₂ G X] :
    ∃ t : TopologicalSpace X,
      @PolishSpace X t ∧ @BorelSpace X t ‹MeasurableSpace X› ∧
        @ContinuousSMul G X inferInstance ‹TopologicalSpace G› t := by
  sorry

/-- A covariant system on a jointly measurable native action and an arbitrary
complete Hilbert space. Polish/separable hypotheses belong to the later induction
and disintegration theorems, not this data interface. -/
structure CovariantPVM (G X H : Type*) [Group G] [TopologicalSpace G]
    [MeasurableSpace G] [MeasurableSpace X] [MulAction G X] [MeasurableSMul₂ G X]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H] where
  representation : ContRepresentation ℂ G H
  isUnitary : TauCeti.ContRepresentation.IsUnitary representation
  continuous_orbit : ∀ v, Continuous fun g : G => representation g v
  projections : TauCetiRoadmap.SelfAdjointSpectralTheory.ProjValMeasure X H
  covariance : ∀ g (B : Set X) (hB : MeasurableSet B),
    ∃ hImage : MeasurableSet (g • B),
      ∀ x, representation g (projections.proj B hB x) =
        projections.proj (g • B) hImage (representation g x)

section Induction

variable (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [LocallyCompactSpace G] [SecondCountableTopology G] [T2Space G]
    [MeasurableSpace G] [BorelSpace G]
    (H : Subgroup G) [IsClosed (H : Set G)]
    (X : Type*) [TopologicalSpace X] [MeasurableSpace X] [BorelSpace X] [PolishSpace X]
    [MulAction G X] [ContinuousSMul G X]
    (K : Type*) [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    [TopologicalSpace.SeparableSpace K]

/-- Genuine M1 input data, on an actual homogeneous space. The equivariant homeomorphism
identifies the base with the native left-coset space, so it also fixes its quotient topology.
An abstract closed embedding H→G is handled by its native image subgroup.
The standard-Borel selector and quasi-invariant measure existence are M1 targets;
this data structure takes their concrete witnesses as inputs. -/
structure InducedModelData (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [LocallyCompactSpace G] [SecondCountableTopology G] [T2Space G]
    [MeasurableSpace G] [BorelSpace G] (H : Subgroup G) [IsClosed (H : Set G)]
    (X : Type*) [TopologicalSpace X] [MeasurableSpace X] [BorelSpace X] [PolishSpace X]
    [MulAction G X] [ContinuousSMul G X]
    (K : Type*) [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    [TopologicalSpace.SeparableSpace K] where
  quotientEquiv : (G ⧸ H) ≃ₜ X
  quotientEquiv_smul : ∀ (g : G) (q : G ⧸ H), quotientEquiv (g • q) = g • quotientEquiv q
  measure : Measure X
  measure_sigmaFinite : SigmaFinite measure
  measure_ne_zero : measure ≠ 0
  quasiInvariant : ∀ g : G, measure.map (fun x => g • x) ≪ measure
  sectionMap : X → G
  measurableSection : Measurable sectionMap
  section_rightInverse : ∀ x, quotientEquiv (QuotientGroup.mk (sectionMap x)) = x
  fiberRepresentation : ContRepresentation ℂ H K
  fiber_isUnitary : TauCeti.ContRepresentation.IsUnitary fiberRepresentation
  fiber_continuous_orbit : ∀ v, Continuous fun h : H => fiberRepresentation h v

variable {G H X K}

/-- The actual homogeneous quotient projection. -/
def InducedModelData.quotientProjection (d : InducedModelData G H X K) (g : G) : X :=
  d.quotientEquiv (QuotientGroup.mk g)

/-- The projection has precisely the native left-coset fibers. -/
theorem InducedModelData.quotientProjection_eq_iff
    (d : InducedModelData G H X K) (g h : G) :
    d.quotientProjection g = d.quotientProjection h ↔ g⁻¹ * h ∈ H := by
  exact d.quotientEquiv.injective.eq_iff.trans QuotientGroup.eq

/-- Continuity gives the Borel quotient projection without a second measurable-action field. -/
theorem InducedModelData.quotientProjection_measurable (d : InducedModelData G H X K) :
    Measurable d.quotientProjection :=
  (d.quotientEquiv.continuous.comp QuotientGroup.continuous_mk).measurable

/-- The given Borel section is an actual right inverse of the homogeneous projection. -/
theorem InducedModelData.quotientProjection_section (d : InducedModelData G H X K) (x : X) :
    d.quotientProjection (d.sectionMap x) = x := d.section_rightInverse x

/-- Transitivity follows from the actual quotient identification, with no extra action axiom. -/
theorem InducedModelData.transitive (d : InducedModelData G H X K) (x y : X) :
    ∃ g : G, g • x = y := by
  obtain ⟨g, hg⟩ := MulAction.exists_smul_eq G (d.quotientEquiv.symm x)
    (d.quotientEquiv.symm y)
  refine ⟨g, ?_⟩
  have := congrArg d.quotientEquiv hg
  simpa [d.quotientEquiv_smul] using this

/-- The section formula belongs to the actual subgroup because both representatives
have the same native left coset. Isotropy is derived, not part of the input data. -/
def InducedModelData.isotropy (d : InducedModelData G H X K) (g : G) (x : X) : H :=
  ⟨(d.sectionMap x)⁻¹ * (g * d.sectionMap (g⁻¹ • x)), by
    apply QuotientGroup.eq.mp
    apply d.quotientEquiv.injective
    rw [d.section_rightInverse]
    change x = d.quotientEquiv (g • QuotientGroup.mk (d.sectionMap (g⁻¹ • x)))
    rw [d.quotientEquiv_smul, d.section_rightInverse]
    simp⟩

/-- The coercion is the actual section formula, in the pinned multiplication order. -/
theorem InducedModelData.isotropy_coe (d : InducedModelData G H X K) (g : G) (x : X) :
    (d.isotropy g x : G) = (d.sectionMap x)⁻¹ * g * d.sectionMap (g⁻¹ • x) := by
  simp [InducedModelData.isotropy, mul_assoc]

/-- The section factorization follows from the definition. -/
theorem InducedModelData.sectionFactor (d : InducedModelData G H X K) (g : G) (x : X) :
    g * d.sectionMap (g⁻¹ • x) = d.sectionMap x * (d.isotropy g x : G) := by
  rw [d.isotropy_coe]
  group

/-- Joint Borel measurability follows from the Borel section and continuous native action. -/
theorem InducedModelData.measurableIsotropy (d : InducedModelData G H X K) :
    Measurable fun p : G × X => d.isotropy p.1 p.2 := by
  apply Measurable.subtype_mk
  exact (d.measurableSection.comp measurable_snd).inv.mul
    (measurable_fst.mul (d.measurableSection.comp
      ((continuous_fst.inv.smul continuous_snd).measurable)))

/-- The isotropy cocycle is a consequence, rather than an independent input axiom. -/
theorem InducedModelData.isotropy_cocycle (d : InducedModelData G H X K) (g h : G) (x : X) :
    d.isotropy (g * h) x = d.isotropy g x * d.isotropy h (g⁻¹ • x) := by
  apply Subtype.ext
  simp only [Subgroup.coe_mul, d.isotropy_coe, mul_inv_rev, mul_smul]
  group

/-- Change of Borel section changes isotropy by the stated H-valued coboundary.
The algebraic identity needs no extra continuity or independent cocycle-law axiom. -/
theorem InducedModelData.isotropy_change_section
    (d d' : InducedModelData G H X K) (b : X → H)
    (hs : ∀ x, d'.sectionMap x = d.sectionMap x * (b x : G)) (g : G) (x : X) :
    d'.isotropy g x = (b x)⁻¹ * d.isotropy g x * b (g⁻¹ • x) := by
  apply Subtype.ext
  simp only [Subgroup.coe_mul, Subgroup.coe_inv, d'.isotropy_coe, d.isotropy_coe, hs]
  group

/-- Native RN derivative of the actual pushforward. No arbitrary density or cocycle field. -/
def InducedModelData.rnDerivative (d : InducedModelData G H X K) (g : G) (x : X) : ENNReal :=
  (d.measure.map (fun y => g • y)).rnDeriv d.measure x

/-- The change-of-variables identity specifies the direction of the pushforward.
Its proof uses native RN integration and the measurable native action. -/
theorem InducedModelData.rn_change (d : InducedModelData G H X K) (g : G)
    (f : X → ENNReal) (hf : Measurable f) :
    ∫⁻ x, d.rnDerivative g x * f x ∂d.measure = ∫⁻ x, f (g • x) ∂d.measure := by
  let _ := d.measure_sigmaFinite
  have hg : Measurable fun x : X => g • x :=
    (continuous_const.smul continuous_id).measurable
  have : SigmaFinite (d.measure.map (fun x : X => g • x)) :=
    (Homeomorph.smul g).measurableEmbedding.sigmaFinite_map
  simp only [InducedModelData.rnDerivative]
  rw [lintegral_rnDeriv_mul (d.quasiInvariant g) hf.aemeasurable,
    lintegral_map hf hg]

/-- The RN chain rule for the native derivative, with equality almost everywhere for each
pair of group elements. The proof transports native RN derivatives through the measurable action
and uses the native sigma-finite RN chain rule. -/
theorem InducedModelData.rn_cocycle (d : InducedModelData G H X K) (g h : G) :
    ∀ᵐ x ∂d.measure,
      d.rnDerivative (g * h) x = d.rnDerivative g x * d.rnDerivative h (g⁻¹ • x) := by
  let := d.measure_sigmaFinite
  let μg := d.measure.map (fun x : X => g • x)
  let μh := d.measure.map (fun x : X => h • x)
  let μgh := d.measure.map (fun x : X => (g * h) • x)
  have hg : Measurable fun x : X => g • x :=
    (Homeomorph.smul g).measurable
  have hh : Measurable fun x : X => h • x :=
    (Homeomorph.smul h).measurable
  have hgi : Measurable fun x : X => g⁻¹ • x :=
    (Homeomorph.smul g⁻¹).measurable
  let : SigmaFinite μg := (Homeomorph.smul g).measurableEmbedding.sigmaFinite_map
  let : SigmaFinite μh := (Homeomorph.smul h).measurableEmbedding.sigmaFinite_map
  let : SigmaFinite μgh := (Homeomorph.smul (g * h)).measurableEmbedding.sigmaFinite_map
  have hcomp : μh.map (fun x : X => g • x) = μgh := by
    dsimp [μh, μgh]
    rw [Measure.map_map hg hh]
    congr 1
    funext x
    exact (mul_smul g h x).symm
  have hinv : μg.map (fun x : X => g⁻¹ • x) = d.measure := by
    dsimp [μg]
    rw [Measure.map_map hgi hg]
    simp only [Function.comp_def, inv_smul_smul, Measure.map_id']
  have hinvcomp : μgh.map (fun x : X => g⁻¹ • x) = μh := by
    rw [← hcomp, Measure.map_map hgi hg]
    simp only [Function.comp_def, inv_smul_smul, Measure.map_id']
  have hback : d.measure ≪ μg := by
    have hac := (Homeomorph.smul g).measurableEmbedding.absolutelyContinuous_map
      (d.quasiInvariant g⁻¹)
    change (d.measure.map (fun x : X => g⁻¹ • x)).map (fun x : X => g • x) ≪ μg at hac
    rw [Measure.map_map hg hgi] at hac
    simpa only [Function.comp_def, smul_inv_smul, Measure.map_id'] using hac
  have hac : μgh ≪ μg := by
    rw [← hcomp]
    exact (Homeomorph.smul g).measurableEmbedding.absolutelyContinuous_map
      (d.quasiInvariant h)
  have htransport := (Homeomorph.smul g⁻¹).measurableEmbedding.rnDeriv_map μgh μg
  change (fun x : X => (μgh.map (fun y : X => g⁻¹ • y)).rnDeriv
    (μg.map (fun y : X => g⁻¹ • y)) (g⁻¹ • x)) =ᵐ[μg] μgh.rnDeriv μg at htransport
  rw [hinv, hinvcomp] at htransport
  filter_upwards [hback htransport, Measure.rnDeriv_mul_rnDeriv hac] with x hx hchain
  change μgh.rnDeriv d.measure x = μg.rnDeriv d.measure x * μh.rnDeriv d.measure (g⁻¹ • x)
  change μgh.rnDeriv μg x * μg.rnDeriv d.measure x = μgh.rnDeriv d.measure x at hchain
  rw [← hchain, ← hx, mul_comm]

/-- The general L² carrier does not require an induction datum. -/
abbrev inducedHilbertSpace (X K : Type*) [MeasurableSpace X]
    [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    (μ : Measure X) := MeasureTheory.Lp K 2 μ

/-- Section-model formula on functions; the one RN square root is the entire scalar factor.
The action on L² classes, membership and strong continuity are the next construction target. -/
def InducedModelData.sectionAction (d : InducedModelData G H X K) (g : G) (F : X → K)
    (x : X) : K :=
  (Real.sqrt (d.rnDerivative g x).toReal : ℂ) •
    d.fiberRepresentation (d.isotropy g x) (F (g⁻¹ • x))

/-- Construct the native strongly continuous unitary representation from the section formula.
The formula is asserted on actual L² representatives, almost everywhere, so this target
includes well-definedness on classes, L² membership, bounded linearity and the group law.
Input data above is kept distinct from the resulting induced representation. -/
theorem InducedModelData.exists_inducedRepresentation (d : InducedModelData G H X K) :
    ∃ U : ContRepresentation ℂ G (inducedHilbertSpace X K d.measure),
      TauCeti.ContRepresentation.IsUnitary U ∧
      (∀ v, Continuous fun g : G => U g v) ∧
      ∀ g (F : inducedHilbertSpace X K d.measure),
        ∀ᵐ x ∂d.measure, (U g F) x = d.sectionAction g F x := by
  sorry

end Induction

/-- Native circle-valued continuous characters with the compact-open topology. -/
abbrev NCharacter (N : Type*) [Group N] [TopologicalSpace N] := PontryaginDual N

/-- Additive spacetime is given its multiplicative type tag for native PontryaginDual. -/
abbrev TranslationCharacter := PontryaginDual (Multiplicative (Fin 4 → ℝ))

section DualAction

variable {N H : Type*} [Group N] [TopologicalSpace N]
    [Group H] [TopologicalSpace H] [MulDistribMulAction H N] [ContinuousSMul H N]

/-- Pullback by the inverse native automorphism action on the normal subgroup. -/
def dualAction (h : H) (χ : NCharacter N) : NCharacter N :=
  { toFun := fun n => χ (h⁻¹ • n)
    map_one' := by simp
    map_mul' := by intro n m; simp [smul_mul']
    continuous_toFun := χ.continuous.comp (continuous_const_smul _) }

/-- The native dual MulAction, derived from pullback; no redundant action-law fields. -/
instance dualMulAction : MulAction H (NCharacter N) where
  smul := dualAction
  one_smul χ := by
    apply PontryaginDual.ext
    intro n
    change χ ((1 : H)⁻¹ • n) = χ n
    simp
  mul_smul g h χ := by
    apply PontryaginDual.ext
    intro n
    change χ ((g * h)⁻¹ • n) = χ (h⁻¹ • (g⁻¹ • n))
    simp [mul_inv_rev, mul_smul]

@[simp] theorem dual_smul_apply (h : H) (χ : NCharacter N) (n : N) :
    (h • χ) n = χ (h⁻¹ • n) := rfl

variable [ContinuousSMul H (NCharacter N)]

/-- The native joint-continuity class gives continuity of each dual orbit. -/
theorem dual_continuous_orbit (χ : NCharacter N) :
    Continuous fun h : H => h • χ := continuous_id.smul continuous_const

/-- The actual native stabilizer of a character is closed, with no orbit-datum wrapper. -/
theorem dual_stabilizer_closed (χ : NCharacter N) :
    IsClosed (MulAction.stabilizer H χ : Set H) :=
  isClosed_eq (dual_continuous_orbit χ) continuous_const

/-- The N-coordinate formula for M2's genuine extension to the actual semidirect stabilizer. -/
def extendedCharacterValue (χ : NCharacter N) (n : N)
    (_h : MulAction.stabilizer H χ) : Circle := χ n

/-- Genuine native continuous little-group representation on the selected character's
actual closed stabilizer on any complete complex Hilbert fiber; M2's measurable classification later assumes separability. -/
structure GenuineLittleGroupData (N H : Type*) [Group N] [TopologicalSpace N]
    [Group H] [TopologicalSpace H] [MulDistribMulAction H N] [ContinuousSMul H N]
    [ContinuousSMul H (NCharacter N)] (χ : NCharacter N)
    (K : Type*) [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    where
  representation : ContRepresentation ℂ (MulAction.stabilizer H χ) K
  isUnitary : TauCeti.ContRepresentation.IsUnitary representation
  continuous_orbit : ∀ v, Continuous fun h : MulAction.stabilizer H χ => representation h v

end DualAction

/- Twisted little-group constructions take `BorelMultiplier H` directly.
Its algebraic/measurable carrier is general; Hausdorff lcsc Borel hypotheses
are supplied to the topological reconstruction/induction theorems. -/

/- Compact-finite predicates, submodules and their elementary algebraic API are
owned by AutomorphicFormsOnReductiveGroups §2.1, specialized to the restricted
representation as specified in README M0. These representative signatures omit
the shared supplier declarations; no unavailable Suggested module is imported. -/

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
  fin_cases μ <;> fin_cases ν <;>
    norm_num [deSitterTranslationGenerator, deSitterGenerator,
      lorentzAmbientIndex, deSitterSignature, Matrix.sub_mul, Matrix.mul_sub, Matrix.add_mul, Matrix.mul_add,
      Matrix.single_mul_single_same, Matrix.single_mul_single_of_ne,
      Matrix.single_neg, sub_eq_add_neg]

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

noncomputable section
open scoped BigOperators
namespace TauCetiRoadmap.NoncompactQuantumSymmetry.FiniteYoungProposed

variable {n d : ℕ} {H : Type*} [AddCommGroup H] [Module ℂ H]

/-- Literal finite Specht coefficient sum, in the native operator module. -/
def youngMatrixUnit (U : Representation ℂ (Equiv.Perm (Fin n)) H)
    (D : Representation ℂ (Equiv.Perm (Fin n)) (Fin d → ℂ))
    (i j : Fin d) : H →ₗ[ℂ] H :=
  ((d : ℂ) / (Nat.factorial n : ℂ)) •
    ∑ σ : Equiv.Perm (Fin n), (D (σ⁻¹) (Pi.single i 1) j) • U σ

/-- The completed carrier may be infinite dimensional; only the Specht carrier is finite. -/
theorem youngMatrixUnit_comp (U : Representation ℂ (Equiv.Perm (Fin n)) H)
    (D : Representation ℂ (Equiv.Perm (Fin n)) (Fin d → ℂ))
    [D.IsIrreducible] (i j k l : Fin d) :
    (youngMatrixUnit U D i j).comp (youngMatrixUnit U D k l) =
      if j = k then youngMatrixUnit U D i l else 0 := by
  sorry

/-- One minimal matrix-unit range is the actual Specht-intertwiner multiplicity carrier. -/
theorem mem_youngRange_iff_intertwiner
    (U : Representation ℂ (Equiv.Perm (Fin n)) H)
    (D : Representation ℂ (Equiv.Perm (Fin n)) (Fin d → ℂ))
    [D.IsIrreducible] (i : Fin d) (x : H) :
    x ∈ LinearMap.range (youngMatrixUnit U D i i) ↔
      ∃ T : Representation.IntertwiningMap D U, T (Pi.single i 1) = x := by
  sorry

section Hilbert
variable {K : Type*} [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]

/-- Isometric native permutation operators make each finite coefficient sum bounded. -/
theorem youngMatrixUnit_continuous
    (U : Representation ℂ (Equiv.Perm (Fin n)) K)
    (hU : ∀ σ, Isometry (U σ))
    (D : Representation ℂ (Equiv.Perm (Fin n)) (Fin d → ℂ)) (i j : Fin d) :
    Continuous (youngMatrixUnit U D i j) := by
  sorry

/-- A bounded idempotent's range is closed; this is the actual Hilbert multiplicity subspace. -/
theorem youngMatrixUnit_closedRange
    (U : Representation ℂ (Equiv.Perm (Fin n)) K)
    (hU : ∀ σ, Isometry (U σ))
    (D : Representation ℂ (Equiv.Perm (Fin n)) (Fin d → ℂ))
    [D.IsIrreducible] (i : Fin d) :
    IsClosed (LinearMap.range (youngMatrixUnit U D i i) : Set K) := by
  sorry
/-- The finite Gram-rank step for actual measurable projection fields on a fixed carrier.
V4.0's measurable Gram–Schmidt and projected fundamental sections provide these inputs. -/
theorem measurable_projectedGram_rank
    {X : Type*} [MeasurableSpace X] [MeasurableSpace K] [BorelSpace K]
    [SecondCountableTopology K] (r : ℕ) (P : X → K →L[ℂ] K)
    (hP : ∀ v, Measurable fun x => P x v)
    (s : Fin r → X → K) (hs : ∀ i, Measurable (s i)) :
    Measurable fun x => Matrix.rank
      (fun i j : Fin r => inner ℂ (P x (s i x)) (P x (s j x))) := by
  sorry
end Hilbert

/-- The actual native arbitrary-module permutation convention on pure tensors.
M6.TensorCoherence separately owns its isometric extension to the completed left-comb carrier. -/
theorem permutation_algebraic_tprod {E : Type*} [AddCommGroup E] [Module ℂ E]
    (n : ℕ) (σ : Equiv.Perm (Fin n)) (v : Fin n → E) :
    PiTensorProduct.reindexRepresentation ℂ E (Fin n) σ
      (PiTensorProduct.tprod ℂ v) =
      PiTensorProduct.tprod ℂ (fun i => v (σ.symm i)) := by
  change PiTensorProduct.reindex ℂ (fun _ : Fin n => E) σ
    (PiTensorProduct.tprod ℂ v) = _
  exact PiTensorProduct.reindex_tprod (R := ℂ) (s := fun _ : Fin n => E) σ v

end TauCetiRoadmap.NoncompactQuantumSymmetry.FiniteYoungProposed
