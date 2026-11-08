module

public import Mathlib
public import TauCeti.Analysis.InnerProductSpace.ProjValMeasure.Basic

/-!
# Noncompact quantum symmetry: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs, with simple definitions on native carriers.
The stated headlines are Wigner reconstruction, equivariant Polish realization, the
strongly continuous unitary induced representation on the actual L² carrier, and
Mackey's imprimitivity theorem for transitive systems on a separable Hilbert space,
with Tau Ceti's `TauCeti.ProjValMeasure` as the projection-valued measure. Automatic
continuity of Borel homomorphisms of Polish groups and the Polishness of
second-countable locally compact groups are supplied by OperatorAlgebraDynamics
D1.BorelPrefix, and the degree-one and degree-two Whitehead lemmas consumed by P.4 are
Tau Ceti's `LieModule.Cohomology.exists_eq_lie_of_d₁₂_eq_zero` and
`LieModule.Cohomology.exists_d₁₂_eq`; none of these is stated here.

The following further headlines are not statable on the pinned carriers:
* P.2–P.4's unitary/antiunitary quotient-topology and locally continuous extension
  classification, smoothing and differentiation/integration comparisons require the
  strong-operator graded projective group and locally smooth extension/cohomology carriers.
* P.5's common position/momentum core comparison requires closed unbounded operators
  and their spectral calculus; P.6's completed permutation-sector decomposition requires
  completed Hilbert tensor powers and their continuous permutation action.
* M0a's GCR/factor-type-I equivalence needs C*-representation spectra, primitive ideals
  with hull-kernel topology and spatial type-I factor representations. M0's compact-type,
  analytic-vector and admissibility comparisons need the compatible smooth and analytic
  vector modules and completed compact-isotypic Hilbert tensor decomposition.
* M1's measured subgroup, tensor and stages comparisons need measurable Hilbert fields
  and their direct integrals, which neither library has. Graded imprimitivity also needs
  antiunitary field morphisms between such fields.
* M2's ordinary and twisted orbit/little-group classification needs the measurable
  irreducible dual and induced equivalence-class carriers; fixed-twist type-I and
  parameterized irreducible refinement need twisted group C*-algebras, measurable
  multiplicity fields and central disintegration. Its derived-operator comparison needs
  closed unbounded field operators and their direct integrals.
* M3's Euclidean/Galilei/Bargmann exhaustion and generator comparisons need their
  topological covering/central-extension groups, induced-dual models and closed generators.
* M4's Lorentz and full graded Poincaré classifications, Plancherel theorem, Riesz
  endpoint comparisons and localization results need the unitary-dual Hilbert models as
  data (the massive, helicity and Lorentz representations, which the induced-model theorem
  below supplies only existentially), the unitary dual with its measure classes and the
  measurable spectral transforms. The covariant position measure itself is a
  `TauCeti.ProjValMeasure`; it is not the missing carrier.
* M5's de Sitter dual and restriction theorems need those noncompact Hilbert models and
  their Fell topology. Deformation-to-the-normal-cone and all-sequence contraction,
  including massless dilation, need the deformation groupoid C*-algebra, continuous fields
  and identified contraction carriers. Its conformal/radial and affine-kinematic
  comparisons need the completed induced models and integrated group/cover realizations.
  M5.KinematicClassification's eleven-case normal-form theorem is omitted: its statement
  is an SO(3)-equivariant graded isomorphism classification of the ten-dimensional
  bracket family, whose Lie-algebra structure (the Jacobi law of the displayed bracket)
  is itself an M5 target, and the scalar rescaling of the parameters (a,b,c) alone is
  algebra on bare real numbers, not a headline.
* M6's irreducible pair tables, exchange, finite-tree recoupling/pentagon and Young-field
  decomposition need completed Hilbert tensors, joint irreducible kernels and measurable
  multiplicity fields. Scalar cocycle calculations, finite coefficient sums and
  algebraic pure-tensor formulas do not state these theorems.
-/

@[expose] public section

noncomputable section

open MeasureTheory
open scoped Pointwise

namespace TauCetiRoadmap.NoncompactQuantumSymmetry

/-! ## Layer 1: P — projective symmetry prerequisites -/

/-- Transition probability of two complex rays, using nonzero representatives.
The normalization makes the value independent of their lengths and phases. -/
def rayTransitionProbability {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] (p q : Projectivization ℂ H) : ℝ :=
  ‖inner ℂ p.rep q.rep‖ ^ 2 / (‖p.rep‖ ^ 2 * ‖q.rep‖ ^ 2)

/-- A transition-probability-preserving ray bijection is induced by a unitary or
antiunitary operator (Wigner's theorem, README P.1). -/
theorem wigner_reconstruction (H : Type*) [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] [Nontrivial H]
    (Φ : Projectivization ℂ H ≃ Projectivization ℂ H)
    (hΦ : ∀ p q, rayTransitionProbability (Φ p) (Φ q) = rayTransitionProbability p q) :
    (∃ U : H ≃ₗᵢ[ℂ] H, ∀ p,
      Φ p = Projectivization.map U.toLinearEquiv.toLinearMap U.injective p) ∨
    (∃ U : H ≃ₗᵢ⋆[ℂ] H, ∀ p,
      Φ p = Projectivization.map U.toLinearEquiv.toLinearMap U.injective p) := by
  sorry

/-! ## Layer 4: M1 — realization and induced representations -/

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
  fiber_isUnitary : ∀ h, Isometry (fiberRepresentation h)
  fiber_continuous_orbit : ∀ v, Continuous fun h : H => fiberRepresentation h v

variable {G H X K}

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

/-- Native RN derivative of the actual pushforward. No arbitrary density or cocycle field. -/
def InducedModelData.rnDerivative (d : InducedModelData G H X K) (g : G) (x : X) : ENNReal :=
  (d.measure.map (fun y => g • y)).rnDeriv d.measure x

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
    ∃ U : ContRepresentation ℂ G (MeasureTheory.Lp K 2 d.measure),
      (∀ g, Isometry (U g)) ∧
      (∀ v, Continuous fun g : G => U g v) ∧
      ∀ g (F : MeasureTheory.Lp K 2 d.measure),
        ∀ᵐ x ∂d.measure, (U g F) x = d.sectionAction g F x := by
  sorry

end Induction

/-- A system of imprimitivity based on a measurable `G`-space `X` (README M1.Core): a strongly
continuous unitary representation `U` of `G` on a complex Hilbert space `E` and a normalized,
countably additive projection-valued measure `P` on the measurable sets of `X`, with
`U g ∘ P(B) = P(g • B) ∘ U g` for every `g` and measurable `B`, that is
`U g P(B) (U g)⁻¹ = P(g • B)`. Isometric operators of a group representation are onto, hence
unitary. No topology on `X` and no separability of `E` is assumed here. -/
structure SystemOfImprimitivity (G X E : Type*) [Group G] [TopologicalSpace G]
    [MeasurableSpace G] [MeasurableSpace X] [MulAction G X] [MeasurableSMul G X]
    [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E] where
  /-- The group representation. -/
  rep : ContRepresentation ℂ G E
  /-- Each `rep g` is isometric. -/
  rep_isometry : ∀ g, Isometry (rep g)
  /-- Strong continuity: every orbit map is continuous. -/
  rep_continuous_orbit : ∀ v, Continuous fun g : G => rep g v
  /-- The normalized projection-valued measure on the measurable sets of `X`. -/
  pvm : TauCeti.ProjValMeasure X E
  /-- Covariance `U g ∘ P(B) = P(g • B) ∘ U g`. -/
  covariant : ∀ (g : G) (B : Set X) (hB : MeasurableSet B),
    (rep g).comp (pvm.proj B hB) = (pvm.proj (g • B) (hB.const_smul g)).comp (rep g)

/-- **Mackey's imprimitivity theorem** (README M1.Core), transitive case. Let `G` be a
Hausdorff second-countable locally compact group, `H` a closed subgroup and `X` a Polish
`G`-space identified with `G ⧸ H` by an equivariant homeomorphism `e`. Every system of
imprimitivity based on `X` on a separable Hilbert space `E` is unitarily equivalent to an
induced system: there are a separable Hilbert space `K`, induced-model data `d` on the same
identification `e` (a quasi-invariant measure, a measurable section and a strongly continuous
unitary representation of `H` on `K`) and a unitary `W : E ≃ L²(X, d.measure; K)` carrying
`U g` to the section action of `d` and `P(B)` to multiplication by the indicator of `B`. -/
theorem SystemOfImprimitivity.exists_induced
    {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [LocallyCompactSpace G] [SecondCountableTopology G] [T2Space G]
    [MeasurableSpace G] [BorelSpace G] {H : Subgroup G} [IsClosed (H : Set G)]
    {X : Type*} [TopologicalSpace X] [MeasurableSpace X] [BorelSpace X] [PolishSpace X]
    [MulAction G X] [ContinuousSMul G X]
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
    [TopologicalSpace.SeparableSpace E]
    (e : (G ⧸ H) ≃ₜ X) (he : ∀ (g : G) (q : G ⧸ H), e (g • q) = g • e q)
    (S : SystemOfImprimitivity G X E) :
    ∃ (K : Type) (_ : NormedAddCommGroup K) (_ : InnerProductSpace ℂ K) (_ : CompleteSpace K)
      (_ : TopologicalSpace.SeparableSpace K) (d : InducedModelData G H X K)
      (W : E ≃ₗᵢ[ℂ] MeasureTheory.Lp K 2 d.measure),
      d.quotientEquiv = e ∧
      (∀ (g : G) (F : MeasureTheory.Lp K 2 d.measure),
        ∀ᵐ x ∂d.measure, (W (S.rep g (W.symm F)) : X → K) x = d.sectionAction g F x) ∧
      ∀ (B : Set X) (hB : MeasurableSet B) (F : MeasureTheory.Lp K 2 d.measure),
        (W (S.pvm.proj B hB (W.symm F)) : X → K) =ᵐ[d.measure] B.indicator F := by
  sorry

end TauCetiRoadmap.NoncompactQuantumSymmetry
