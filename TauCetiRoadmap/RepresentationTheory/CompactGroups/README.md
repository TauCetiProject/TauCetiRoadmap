# Roadmap: representations of compact groups and the Peter-Weyl theorem

**Summary.** This roadmap develops the representation theory of a compact topological group `G`
from Haar averaging. It fixes the Haar probability measure, proves that finite-dimensional
continuous representations are unitarizable and completely reducible, and studies their matrix
coefficients in `C(G)` and `L²(G)`: the Schur orthogonality relations, the Peter-Weyl theorem
(uniform density of the representative functions, the Hilbert basis of normalized matrix
coefficients, and the decomposition of `L²(G)` into blocks `End(V_π)`), and the character theory
(orthonormality, the character basis of the class functions, isotypic projectors and the
Frobenius-Schur indicator). The group `SU(2)` with its maximal torus is the worked engine: its
irreducibles are the symmetric powers `Symⁿ(ℂ²)`, their characters are given by the Weyl character
formula, and integration of class functions reduces to the torus by the Weyl integration formula.
The end theorems are the Peter-Weyl basis (Layer 5), the character basis of the class functions
(Layer 6), and the classification and integration formula for `SU(2)` (engine case).

## Scope and ownership

This roadmap owns Layers 0-6 and the engine case below: the Haar probability measure of a compact
group and averaging against it, unitarizability, complete reducibility, matrix coefficients and
the representative ring, Schur orthogonality, convolution operators on `L²(G)`, the Peter-Weyl
theorem with the isotypic decomposition of `L²(G)`, characters, class functions, isotypic
projectors, the Frobenius-Schur indicator, and the representation theory of `SU(2)` (torus
conjugacy, classification, Weyl character and integration formulas). Representations are
finite-dimensional, except in §1.2 and §4.2, which hold for representations on complete inner
product spaces, and the regular representations of `G` and `G × G` on `L²(G)` in Layer 5.

Already in the library: Tau Ceti at the pin proves every target of Layers 0-6 and of the engine
case. The section "From Tau Ceti" below names the declaration that realizes each one, and
`Suggested.lean` pins the headline theorems. The layers state the mathematics those declarations
meet; other roadmaps cite them by layer.

Left to other roadmaps:

- **Finite groups.** The character theory of finite groups is
  [RepresentationTheory/CharacterTheory](../CharacterTheory/README.md)'s. Specializing the theory
  here to a finite discrete group is a worked example below, not a second development.
- **Hilbert-basis assembly.** The passage from an orthonormal system with dense span to a
  `HilbertBasis` is [Completed/OrthogonalL2Bases](../../../Completed/OrthogonalL2Bases/README.md)
  §B2 ("Orthogonality relation → `HilbertBasis`"); here it is Mathlib's
  `HilbertBasis.mkOfOrthogonalEqBot`.
- **Hilbert-Schmidt operators.** The Hilbert-Schmidt operator API and "Hilbert-Schmidt implies
  compact" are [OperatorTheory/OperatorIdeals](../../OperatorTheory/OperatorIdeals/README.md)
  Part C's; they give one of the two routes to compactness of convolution operators in §5.1.
- **Compact Lie groups.** Maximal tori, the Weyl group and the Weyl integration formula of a general
  compact connected Lie group are [LieGroups](../LieGroups/README.md) Layer 6's ("maximal tori, the
  Weyl group, and Weyl integration"); its `SU(2)` case is this roadmap's engine.
- **Lie-algebra reality types.** The description of the Frobenius-Schur type through opposition
  and invariant forms on the Lie-algebra side is [LieHighestWeight](../LieHighestWeight/README.md)
  Layer 5's ("opposition and invariant forms").

## Conventions

- **The group.** `G` is a topological group with `[Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G]`, and `[MeasurableSpace G] [BorelSpace G]` wherever the
  measure enters. No separation axiom is assumed except where stated: point separation (§5.2)
  asks `[T1Space G]`. An indiscrete group is compact, and its continuous functions are the
  constants.
- **Scalars.** Representations are over `ℂ`. Tau Ceti states the theory over `RCLike 𝕜` and adds
  `[IsAlgClosed 𝕜]` wherever Schur's lemma is used (§§2.3, 4.1, 5.3-5.5, 6.2-6.4); this README
  reads `𝕜 = ℂ`. Over `ℝ` the first orthogonality relation fails (Check in §4.1).
- **Representations.** A continuous representation is Mathlib's `ContRepresentation ℂ G V`, a
  structure wrapping `G →* (V →L[ℂ] V)`, together with the hypothesis `Continuous π` that
  `g ↦ π g` is continuous into `V →L[ℂ] V`. Mathlib's structure records no continuity in `g`, so
  every statement that needs it carries `Continuous π` (Checks in §§1.2 and 2.2). Representation
  spaces are `[NormedAddCommGroup V] [InnerProductSpace ℂ V] [FiniteDimensional ℂ V]`.
  Irreducibility is `Representation.IsIrreducible π.toRepresentation`; in finite dimension every
  subspace is closed, so this is also topological irreducibility. Equivalence is Mathlib's
  `ContRepresentation.Equiv` and intertwiners are `ContIntertwiningMap`.
- **Inner products and matrix coefficients.** Mathlib's inner product is conjugate-linear in its
  first argument. The matrix coefficient of `π` at `(v, w)` is `g ↦ ⟪π g v, w⟫`, and in an
  orthonormal basis `(e_i)` the coefficient `π_ij` is `g ↦ ⟪π g e_j, e_i⟫`. The `L²` pairing is
  `⟪F, H⟫ = ∫ conj(F g) · H g dμ_G`. The placement of the conjugation in Schur orthogonality
  follows from these choices (Checks in §§3.1 and 4.1).
- **The measure.** `μ_G` is `TauCeti.haarProb G = (Measure.haar univ)⁻¹ • Measure.haar`, and the
  `L²` space is `Lp ℂ 2 μ_G`. This Hilbert space need not be separable (Check in §0.1); no result
  here assumes it is.
- **`SU(2)`.** `TauCeti.SU2` is `Matrix.specialUnitaryGroup (Fin 2) ℂ`, with Tau Ceti's
  topological-group and compactness instances (`TauCeti/Topology/Algebra/UnitaryGroup.lean`) and
  its Borel structure (`TauCeti/RepresentationTheory/SU2/Borel.lean`). The torus element is
  `TauCeti.SU2.torusExp θ = diag(e^{iθ}, e^{-iθ})`.

## Exact supplier contracts

### From Mathlib

- **Haar measure.** `MeasureTheory.Measure.haar` (`MeasureTheory/Measure/Haar/Basic.lean`); its
  uniqueness among probability measures `MeasureTheory.Measure.isHaarMeasure_eq_of_isProbabilityMeasure`
  (`MeasureTheory/Measure/Haar/Unique.lean`); finiteness on a compact space
  `CompactSpace.isFiniteMeasure` (`MeasureTheory/Measure/Typeclasses/Finite.lean`); the translation
  and inversion identities `MeasureTheory.integral_mul_left_eq_self`,
  `MeasureTheory.integral_mul_right_eq_self` and `MeasureTheory.integral_inv_eq_self`
  (`MeasureTheory/Group/Integral.lean`).
- **Representations.** `ContRepresentation`, `ContIntertwiningMap` and `ContRepresentation.Equiv`
  (`RepresentationTheory/Continuous/Basic.lean`); `FDRep` and `FDRep.finrank_hom_simple_simple`
  (`RepresentationTheory/FDRep.lean`); `Representation.IsIrreducible`
  (`RepresentationTheory/Irreducible.lean`); `Representation.character`, `Representation.char_conj`
  and `Representation.char_orthonormal` (`RepresentationTheory/Character.lean`), the last the
  finite-group character relation.
- **Hilbert spaces.** `HilbertBasis`, `HilbertBasis.mkOfOrthogonalEqBot` and
  `HilbertBasis.tsum_inner_mul_inner` (`Analysis/InnerProductSpace/l2Space.lean`); `IsHilbertSum`;
  `MeasureTheory.Lp`, `ContinuousMap.toLp` and `ContinuousMap.toLp_denseRange`
  (`MeasureTheory/Function/ContinuousMapDense.lean`).
- **Compact operators.** `IsCompactOperator` and `ContinuousLinearMap.finite_dimensional_eigenspace`
  (`Analysis/InnerProductSpace/Spectrum.lean`): on a complete space, a compact operator has
  finite-dimensional eigenspaces at every nonzero eigenvalue.
- **The circle.** `fourierBasis`, `orthonormal_fourier` and `span_fourier_closure_eq_top`
  (`Analysis/Fourier/AddCircle.lean`).
- **`SU(2)`.** `Matrix.specialUnitaryGroup` (`LinearAlgebra/UnitaryGroup.lean`).

### From Tau Ceti

Paths are under `TauCeti/RepresentationTheory/` unless stated otherwise.

| Section | Declarations |
| --- | --- |
| §0.1 | `TauCeti.haarProb`, `TauCeti.haarProb_def`, `TauCeti.isMulRightInvariant_haarProb`, `TauCeti.isInvInvariant_haarProb`, `TauCeti.eq_haarProb_of_isHaarMeasure_of_isProbabilityMeasure` (`Compact/Haar.lean`) |
| §1.1 | `ContRepresentation.IsUnitary`, `ContRepresentation.isUnitary_iff_norm_map` (`Continuous/Unitary/Basic.lean`) |
| §1.2 | `ContRepresentation.gramOperator`, `ContRepresentation.isUnitarizable`, `ContRepresentation.gramOperator_eq_one` (`Compact/Unitarizable.lean`) |
| §2.1 | `ContRepresentation.IsUnitary.orthogonal_mem_invtSubmodule` (`Continuous/InvariantComplement.lean`) |
| §2.2 | `ContRepresentation.IsUnitary.exists_orthogonal_irreducible_decomposition` (`Continuous/OrthogonalDecomposition.lean`), `Representation.isSemisimpleRepresentation_of_continuous` (`Compact/Semisimple.lean`) |
| §2.3 | `ContRepresentation.eq_zero_of_isEmpty_equiv`, `ContRepresentation.exists_eq_smul_one_of_isIrreducible` (`Continuous/Schur.lean`) |
| §2.4 | `ContRepresentation.intertwiningMapEquiv`, `ContRepresentation.nonempty_equiv_iff` (`Continuous/Intertwining.lean`); `FDRep.ofShrink`, `FDRep.ofShrinkEquiv`, `FDRep.character_ofShrink` (`FDRep/Basic.lean`) |
| §3.1 | `ContRepresentation.matrixCoeff` (`Continuous/MatrixCoefficient.lean`), `ContRepresentation.matrixCoeffLp` (`Compact/MatrixCoefficient.lean`), `ContRepresentation.matrixCoeff_tprod` (`Continuous/TensorProduct.lean`) |
| §3.2 | `TauCeti.representativeSubmodule`, `TauCeti.representativeStarSubalgebra` (`Continuous/Representative.lean`) |
| §4.1-4.3 | `ContRepresentation.schur_orthogonality_self`, `ContRepresentation.schur_orthogonality_basis`, `ContRepresentation.schur_orthogonality` (`Compact/SchurOrthogonality.lean`) |
| §5.1 | `TauCeti.convolutionOperator`, `TauCeti.isCompactOperator_convolutionOperator`, `TauCeti.isSelfAdjoint_convolutionOperator`, `TauCeti.finiteDimensional_eigenspace_convolutionOperator` (`Compact/Convolution.lean`); `TauCeti.convolutionEigenspaceRepresentation` (`Compact/EigenspaceRepresentation.lean`); `TauCeti.exists_isMollifier` (`Compact/ApproximateIdentity.lean`) |
| §5.2 | `TauCeti.representativeStarSubalgebra_dense`, `TauCeti.representativeStarSubalgebra_separatesPoints`, `TauCeti.dense_image_toLp_representativeSubmodule` (`Compact/RepresentativeDensity.lean`) |
| §5.3-5.4 | `TauCeti.IrrepModel`, `TauCeti.IsIrrepSkeleton`, `TauCeti.peterWeylBasis`, `TauCeti.coe_peterWeylBasis`, `TauCeti.stdPeterWeylBasis`, `TauCeti.coe_stdPeterWeylBasis` (`Compact/PeterWeyl.lean`) |
| §5.5 | `TauCeti.peterWeylBlock`, `TauCeti.finrank_peterWeylBlock`, `TauCeti.isHilbertSum_peterWeylBlock`, `TauCeti.peterWeylBlockAveraging_eq_starProjection` (`Compact/IsotypicBlock/Basic.lean`); `TauCeti.peterWeylTraceEquiv`, `TauCeti.peterWeylTraceEquiv_biRegularLp` (`Compact/TraceCoefficient/HilbertSum.lean`) |
| §6.1 | `ContRepresentation.character`, `ContRepresentation.character_conj` (`Continuous/Character.lean`), `ContRepresentation.characterLp` (`Compact/Character/Basic.lean`) |
| §6.2 | `ContRepresentation.character_orthonormal_self`, `ContRepresentation.character_orthonormal_distinct` (`Compact/Character/Basic.lean`) |
| §6.3 | `TauCeti.classFunctionLp` (`TauCeti/MeasureTheory/Group/Conjugation.lean`), `ContRepresentation.characterLp_mem_classFunctionLp` (`Compact/ClassFunctionLp.lean`), `TauCeti.characterBasis`, `TauCeti.stdCharacterBasis`, `TauCeti.coe_stdCharacterBasis` (`Compact/Character/Basis.lean`) |
| §6.4 | `ContRepresentation.isotypicProjector`, `ContRepresentation.isotypicProjector_apply`, `ContRepresentation.range_isotypicProjector`, `ContRepresentation.isotypicProjector_idempotent` (`Compact/Character/IsotypicProjection.lean`) |
| §6.5 | `ContRepresentation.frobeniusSchurIndicator` (`Compact/FrobeniusSchur/Basic.lean`), `ContRepresentation.frobeniusSchurIndicator_trichotomy` (`Compact/FrobeniusSchur/Trichotomy.lean`), `ContRepresentation.frobeniusSchurIndicator_eq_one_iff`, `ContRepresentation.frobeniusSchurIndicator_eq_neg_one_iff` (`Compact/FrobeniusSchur/InvariantForm.lean`) |
| §E.1 | `TauCeti.SU2.torusExp` (`SU2/Basic.lean`), `TauCeti.SU2.exists_isConj_torusExp` (`SU2/TorusConjugacy.lean`) |
| §E.2 | `TauCeti.SU2.symPowerModel`, `TauCeti.SU2.isIrreducible_symPowerModel`, `TauCeti.SU2.existsUnique_nonempty_equiv_symPower` (`SU2/Exhaustion.lean`) |
| §E.3 | `TauCeti.SU2.character_symPower_torusExp` (`SU2/SymmetricPower.lean`), `TauCeti.SU2.character_symPower_torusExp_eq_sin_div_sin`, `TauCeti.SU2.character_symPower_torusExp_of_sin_eq_zero` (`SU2/Weyl/Character.lean`) |
| §E.4 | `TauCeti.SU2.weyl_integration_formula`, `TauCeti.SU2.integral_character_symPower_mul_conj` (`SU2/Weyl/Integration.lean`), `TauCeti.SU2.weyl_integration_formula_normalized` (`SU2/Weyl/Orthogonality.lean`) |

Other roadmaps cite some of these objects by short names, which correspond as follows:

| Short name cited elsewhere | Tau Ceti declaration |
| --- | --- |
| `haarProb` | `TauCeti.haarProb` |
| `schur_orthogonality` | `ContRepresentation.schur_orthogonality` |
| `character_orthonormal` | `ContRepresentation.character_orthonormal_self` and `ContRepresentation.character_orthonormal_distinct` |
| `su2Irrep n` | `TauCeti.SU2.symPowerModel n` |
| `weyl_integration_formula` | `TauCeti.SU2.weyl_integration_formula` |

### From TauCetiRoadmap.OperatorIdeals

Part C, the Hilbert-Schmidt operator API and the theorem that a Hilbert-Schmidt operator is
compact, for the Hilbert-Schmidt route in §5.1. The Arzelà-Ascoli route of §5.1 does not use it.

## How to read the build

The order is the dependency order. Layer 0 fixes the Haar probability measure and the averaging
identities; Layer 1 averages an inner product into an invariant one; Layer 2 uses unitarity for
invariant complements and Schur's lemma; Layer 3 defines matrix coefficients (it needs Layer 0 for
`L²`); Layer 4 averages rank-one operators into intertwiners (Layers 0-3). Layer 5 builds the
convolution operators, proves uniform density of the representative ring, and assembles the
Peter-Weyl basis from Layer 4's orthonormal system and that density; Layer 6 restricts Layer 5 to
characters and class functions. The `SU(2)` engine consumes Layer 0's measure, Layer 2's Schur
lemma and Layer 6's characters with their orthonormality; no layer of 0-6 consumes it. Layers 0-2
form a self-contained first unit (unitarizability and complete reducibility), and each of Layers
3-6 consumes the layers before it. The finite-group and circle specializations of the worked
examples fix the normalizations.

---

## Layer 0: normalized Haar measure and averaging

### 0.1 The Haar probability measure

Define the Haar probability measure `TauCeti.haarProb G` of a compact group as Mathlib's Haar
measure divided by its total mass, `(Measure.haar univ)⁻¹ • Measure.haar`
(`TauCeti.haarProb_def`). The total mass is finite by `CompactSpace.isFiniteMeasure` and nonzero
because Haar measure charges the nonempty open set `univ`. Prove that it is a Haar measure and a
probability measure, that it is right-invariant and inversion-invariant as well as left-invariant
(a compact group is unimodular), and that every Haar probability measure on `G` equals it (Knapp,
§IV.2, pp. 239-240; Bump, Ch. 1). *Needs:* Mathlib `Measure.haar`,
`isHaarMeasure_eq_of_isProbabilityMeasure`, `CompactSpace.isFiniteMeasure`.

- `TauCeti.haarProb G` is a probability measure, and a left-invariant Haar measure.
- It is invariant under right translations and under `g ↦ g⁻¹` (`TauCeti.isInvInvariant_haarProb`).
- A Haar measure that is a probability measure equals `TauCeti.haarProb G`
  (`TauCeti.eq_haarProb_of_isHaarMeasure_of_isProbabilityMeasure`), so no result depends on the
  compact set on which `Measure.haar` is normalized.

**Checks.**
- For `G = ZMod 2` with the discrete topology, total mass `1` and translation invariance give
  `haarProb {0} = haarProb {1} = 1/2`; a measure normalized on the compact set `{0}` would give
  total mass `2`.
- For the unit circle, an arc of angle `α ∈ [0, 2π]` has measure `α/(2π)`; arc-length measure is
  invariant but has total mass `2π`, and is excluded by mass one.
- For the trivial group, `haarProb` is the Dirac mass at `1`. On `ZMod 2`, the Dirac mass at `0` is
  a probability measure but not translation-invariant (translating by `1` gives the Dirac mass at
  `1`), so the Haar hypothesis of the uniqueness theorem is needed.
- `L²(G)` need not be separable: for `G = (ZMod 2)^ℝ` with the product topology, the coordinate
  characters `x ↦ (−1)^(x_t)`, `t ∈ ℝ`, are orthonormal (Layer 6), so any two are at distance `√2`,
  and there are uncountably many.

### 0.2 Averaging

For a continuous `F : G → E` into a complete normed space, the average `∫ g, F g ∂μ_G` is
invariant under `F ↦ F(g₀ · _)`, `F ↦ F(_ · g₀)` and `F ↦ F(_⁻¹)`, and the average of a constant
is that constant. These are Mathlib's `integral_mul_left_eq_self`, `integral_mul_right_eq_self`
and `integral_inv_eq_self` applied to `μ_G`; integrability holds because a continuous function on a
compact space of finite measure is integrable. *Needs:* §0.1; Mathlib's integral identities.

**Checks.**
- On the circle, the average of `z ↦ zⁿ` is `1` for `n = 0` and `0` otherwise: invariance under
  `z ↦ z₀ z` multiplies the average by `z₀ⁿ`, and some `z₀` has `z₀ⁿ ≠ 1` when `n ≠ 0`.
- On `Equiv.Perm (Fin 3)`, the indicators of a 3-cycle `σ` and of `σ⁻¹` have the same average
  `1/6`, as inversion invariance requires.
- The average of the constant `c` is `c`, not `c` times the total mass of an unnormalized Haar
  measure.

### Examples

For a finite discrete group, `μ_G` is the uniform measure `|G|⁻¹` on each point; for the circle it
is normalized arc length.

### Dependencies

Mathlib Haar measure, its uniqueness, finiteness on compact spaces and the integral identities;
Tau Ceti `Compact/Haar.lean`.

## Layer 1: unitarizability (Weyl's unitarian trick)

### 1.1 Unitary representations

Define `ContRepresentation.IsUnitary π` as `∀ g v w, ⟪π g v, π g w⟫ = ⟪v, w⟫`. *Needs:* Mathlib
`ContRepresentation`.

- `π` is unitary exactly when every `π g` preserves norms
  (`ContRepresentation.isUnitary_iff_norm_map`).
- For a unitary `π`, every matrix coefficient is bounded by `‖v‖ ‖w‖` (Cauchy-Schwarz).

**Checks.**
- The circle character `z ↦ (multiplication by zⁿ)` on `ℂ` is unitary, since `|zⁿ| = 1`.
- `ZMod 2` acting on `ℂ²` by `M = [[1, 1], [0, −1]]` (an involution) is not unitary for the
  standard inner product: `M e₂ = (1, −1)` has norm `√2`.
- The trivial representation on any `V` is unitary.

### 1.2 Unitarizability

For a continuous representation `π` on a complete inner product space `V`, the averaged form
`⟨v, w⟩_G = ∫ g, ⟪π g v, π g w⟫ ∂μ_G` is a `G`-invariant inner product. Lean fixes one inner
product on `V`, so represent the averaged form by its Gram operator
`ContRepresentation.gramOperator π hπ`, the operator `S` with `⟪S v, w⟫ = ⟨v, w⟩_G`. Prove that
there is a self-adjoint `S : V →L[ℂ] V` with `0 < re ⟪S v, v⟫` for `v ≠ 0` and
`(π g)† ∘ S ∘ π g = S` for every `g` (`ContRepresentation.isUnitarizable`; Knapp, Prop. 4.6,
p. 240). For finite-dimensional `V`, conjugating `π` by `S^(1/2)` gives a unitary representation
equivalent to `π`, so the following layers may assume unitarity. *Needs:* §0.1-0.2, §1.1,
`Continuous π`.

- `S` is self-adjoint and positive definite, and `S = 1` when `π` is already unitary
  (`ContRepresentation.gramOperator_eq_one`).

**Checks.**
- For `M = [[1, 1], [0, −1]]` on `ℂ²`, `S = (1 + MᴴM)/2 = [[1, 1/2], [1/2, 3/2]]`, of determinant
  `5/4`, and `Mᴴ S M = S`. The reversed average `(1 + M Mᴴ)/2 = [[3/2, −1/2], [−1/2, 1]]` is not
  invariant: conjugating it by `M` gives `[[3/2, 2], [2, 7/2]]`.
- For the trivial representation, and for any unitary one, `S = 1`.
- Continuity is needed. Take a nonzero homomorphism `φ` from `Circle` to the additive group `ℝ`
  (one exists, since `Circle` modulo its torsion subgroup is a nonzero `ℚ`-vector space; none is
  continuous, see below). Then `z ↦ e^{φ(z)}` on `ℂ` is a
  `ContRepresentation`, and invariance `|e^{φ(z)}|² s = s` with `s > 0` forces `φ = 0`, so it is not
  unitarizable. For a continuous `φ` the image is a compact subgroup of `ℝ`, hence `0`.

### Examples

The averaged Gram operator of `M` above; the unitary representations of the circle on `ℂ`.

### Dependencies

Layer 0; Mathlib `ContinuousLinearMap.adjoint`; Tau Ceti `Continuous/Unitary/Basic.lean` and
`Compact/Unitarizable.lean`.

## Layer 2: complete reducibility

### 2.1 Invariant complements

For a unitary `π` and a `G`-invariant subspace `U ⊆ V`, the orthogonal complement `Uᗮ` is
`G`-invariant (`ContRepresentation.IsUnitary.orthogonal_mem_invtSubmodule`; Knapp, (4.5), p. 239).
No topology on `G` is used. *Needs:* §1.1.

**Checks.**
- For the swap of coordinates on `ℂ²` and `U = ℂ(e₁ + e₂)`, `Uᗮ = ℂ(e₁ − e₂)`, which the swap
  maps to `−(e₁ − e₂) ∈ Uᗮ`.
- Without unitarity the statement fails: for `M = [[1, 1], [0, −1]]`, `U = ℂe₁` is invariant but
  `Uᗮ = ℂe₂` is not, since `M e₂ = (1, −1)`.
- For `U = 0` and `U = V` the complements are `V` and `0`.

### 2.2 Complete reducibility

Prove that a unitary representation on a finite-dimensional `V` is an orthogonal internal direct
sum of finitely many irreducible subrepresentations, whose dimensions add up to `dim V`
(`ContRepresentation.IsUnitary.exists_orthogonal_irreducible_decomposition`; Knapp, Cor. 4.7,
p. 240), by induction on dimension through §2.1. With §1.2 this gives semisimplicity of every
finite-dimensional representation of a compact group whose matrix coefficients `g ↦ f(ρ g v)` are
continuous (`Representation.isSemisimpleRepresentation_of_continuous`). For a finite group this is
Maschke's theorem. *Needs:* §1.2, §2.1.

**Checks.**
- For `V = 0` the decomposition is the empty family; for the trivial representation on `ℂ²` it is
  two orthogonal lines.
- Without unitarity the blocks need not be orthogonal: for `M` above, the invariant lines are `ℂe₁`
  and `ℂ(1, −2)`, and `⟪e₁, (1, −2)⟫ = 1`.
- Continuity is needed for semisimplicity: with `φ` as in §1.2, `z ↦ [[1, φ(z)], [0, 1]]` fixes the
  line `ℂe₁` and has no invariant complement, since it maps `(a, 1)` to `(a + φ(z), 1)`.

### 2.3 Schur's lemma for continuous intertwiners

For irreducible `π, ρ`, a continuous intertwiner `π → ρ` is zero when `π` and `ρ` are inequivalent
(`ContRepresentation.eq_zero_of_isEmpty_equiv`), and over `ℂ` a continuous self-intertwiner of an
irreducible `π` is a scalar (`ContRepresentation.exists_eq_smul_one_of_isIrreducible`) (Knapp,
Prop. 4.8 and Cor. 4.9, p. 240). *Needs:* irreducibility; `[IsAlgClosed ℂ]` for the scalar part.

**Checks.**
- The circle characters `zᵐ` and `zⁿ` on `ℂ` with `m ≠ n` admit only the zero intertwiner:
  `T zᵐ = zⁿ T` for all `z` forces `T = 0`.
- The self-intertwiners of the two-dimensional representation of `Equiv.Perm (Fin 3)` are the
  scalars.
- Over `ℝ` the scalar part fails: the rotation representation of `ZMod 3` on `ℝ²` is irreducible
  over `ℝ` and commutes with the rotation by a right angle, which is not a scalar.

### 2.4 Comparison with algebraic representations

For finite-dimensional continuous representations `π, ρ`, forgetting continuity is a linear
equivalence from the continuous intertwiners `π → ρ` onto the intertwiners of the underlying
representations (`ContRepresentation.intertwiningMapEquiv`), and `π, ρ` are continuously
equivalent exactly when the underlying representations are equivalent
(`ContRepresentation.nonempty_equiv_iff`); every linear map between finite-dimensional spaces is
continuous. The underlying representation of `π` is carried into Mathlib's category `FDRep ℂ G`
by `FDRep.ofShrink`, with an equivalence back (`FDRep.ofShrinkEquiv`) and the same character
(`FDRep.character_ofShrink`), so `FDRep` statements such as Schur's lemma
`FDRep.finrank_hom_simple_simple` apply. Topological and algebraic irreducibility agree because
every subspace of a finite-dimensional space is closed. These are the comparison targets that
other roadmaps cite as this roadmap's "What is not consumable, and is a build item here"; the other
items of that list are the hypothesis `Continuous π` and the `SU(2)` instances (Conventions) and
vector-valued averaging (§0.2). *Needs:* Mathlib `ContRepresentation`, `FDRep`.

**Checks.**
- For the trivial representations on `ℂ` and `ℂ²`, the intertwiners on both sides are all linear
  maps `ℂ → ℂ²`, a space of dimension `2`.
- The regular representation of `ZMod 2` on `ℂ²` is equivalent to the sum of the trivial and sign
  characters by `(x, y) ↦ ((x + y)/2, (x − y)/2)`, as algebraic and hence as continuous
  representations.
- `FDRep.ofShrink` of the two-dimensional representation of `Equiv.Perm (Fin 3)` has dimension `2`
  and character `2, 0, −1`.

### Examples

The decomposition of the regular representation of `ZMod 2` on `ℂ²` into the lines `ℂ(1, 1)` and
`ℂ(1, −1)`.

### Dependencies

Layer 1; Mathlib `FDRep`; Tau Ceti `Continuous/InvariantComplement.lean`,
`Continuous/OrthogonalDecomposition.lean`, `Compact/Semisimple.lean`, `Continuous/Schur.lean`,
`Continuous/Intertwining.lean` and `FDRep/Basic.lean`.

## Layer 3: matrix coefficients

### 3.1 Matrix coefficients

Define `ContRepresentation.matrixCoeff π hπ v w : C(G, ℂ)` as `g ↦ ⟪π g v, w⟫`, continuous
because `π` is, and its class `ContRepresentation.matrixCoeffLp π hπ v w` in `Lp ℂ 2 μ_G`.
*Needs:* §0.1, `Continuous π`.

- The coefficient is conjugate-linear in `v` and linear in `w`.
- Right translation acts on `v`: the coefficient at `g g₀` is the coefficient of `(π g₀ v, w)`
  at `g`. For unitary `π`, left translation acts on `w`: the coefficient at `g₀ g` is the
  coefficient of `(v, π g₀⁻¹ w)` at `g`; and the conjugate of the coefficient of `(v, w)` is the
  coefficient of `(w, v)` composed with inversion.
- The product of a coefficient of `π` and one of `ρ` is a coefficient of `π ⊗ ρ`
  (`ContRepresentation.matrixCoeff_tprod`).

**Checks.**
- For the circle character `π z = zⁿ` on `ℂ` and `v = w = 1`, the coefficient is
  `conj(zⁿ) = z⁻ⁿ`: the model `n` contributes the Fourier mode `−n`. The model `g ↦ ⟪w, π g v⟫`
  would give `zⁿ`.
- For a one-dimensional `χ`, `v = i` and `w = 1`, the coefficient is `−i · conj(χ g)`; the model
  `g ↦ ⟪w, π g v⟫`, linear in `v`, would give `i · χ g`.
- For the two-dimensional representation of `Equiv.Perm (Fin 3)` as symmetries of a triangle, the
  coefficient `π_11` at a 3-cycle is `cos(2π/3) = −1/2`. The coefficient with `v = 0` is the zero
  function.

### 3.2 The representative ring

Define `TauCeti.representativeSubmodule ℂ G` as the span in `C(G, ℂ)` of all matrix coefficients
of all finite-dimensional continuous representations, and `TauCeti.representativeStarSubalgebra
ℂ G` as the same set with its structure of a `StarSubalgebra`: it contains the constants (trivial
representation), is closed under products (tensor products) and under conjugation (the
conjugate representation). That `𝓡(G)` separates points is a consequence of Peter-Weyl (§5.2), not
an input. *Needs:* §3.1.

**Checks.**
- For the circle, the representative ring is the span of the `zⁿ`, `n ∈ ℤ`: the trigonometric
  polynomials.
- For an indiscrete group, `C(G, ℂ)` is the constants and so is the representative ring.
- The span of the coefficients of one nontrivial irreducible is not a subalgebra: on the circle,
  `ℂ · z` does not contain `z²`.

### Examples

The coefficients of the two-dimensional representation of `Equiv.Perm (Fin 3)`, and their products
as coefficients of its tensor square.

### Dependencies

Layers 0-1; Mathlib `ContinuousMap.toLp`; Tau Ceti `Continuous/MatrixCoefficient.lean`,
`Compact/MatrixCoefficient.lean`, `Continuous/TensorProduct.lean` and `Continuous/Representative.lean`.

## Layer 4: Schur orthogonality in L²(G)

### 4.1 One irreducible

For a unitary irreducible `π` of dimension `d`, prove
`⟪matrixCoeffLp π hπ v₁ w₁, matrixCoeffLp π hπ v₂ w₂⟫ = d⁻¹ · conj⟪v₁, v₂⟫ · ⟪w₁, w₂⟫`
(`ContRepresentation.schur_orthogonality_self`; Knapp, Cor. 4.10(b), p. 241; Bump, Ch. 2), by
averaging the rank-one operator `u ↦ ⟪v₂, u⟫ v₁` into a self-intertwiner, which is the scalar
`d⁻¹ · trace` by §2.3. In an orthonormal basis `(e_i)` this reads
`⟪π_ij, π_kl⟫ = d⁻¹ · δ_jl · δ_ik` (`ContRepresentation.schur_orthogonality_basis`), where the
placement of the conjugation is invisible. *Needs:* §0.2, §2.3, §3.1, `[IsAlgClosed ℂ]`.

**Checks.**
- For a one-dimensional `χ`, `v₁ = i` and `v₂ = w₁ = w₂ = 1`: the left side is
  `∫ (i χ) · conj χ = i`, the formula gives `conj(conj(i)) = i`, and the placement
  `⟪v₁, v₂⟫ · conj⟪w₁, w₂⟫` would give `−i`.
- For the two-dimensional representation of `Equiv.Perm (Fin 3)` and `v = w = e₁`, the values of
  `π_11` on the six elements are `1, −1/2, −1/2, 1, −1/2, −1/2`, so `⟪π_11, π_11⟫ = 3/6 = 1/2 = d⁻¹`.
- Algebraic closure is needed: for the rotation representation of `ZMod 3` on `ℝ²`,
  `⟪π_11, π_22⟫` is the average of `cos²` over the angles `0, 2π/3, 4π/3`, that is `1/2`, while
  `d⁻¹ · δ_jl · δ_ik` with `(i, j, k, l) = (1, 1, 2, 2)` is `0`.

### 4.2 Inequivalent irreducibles

For irreducible `π` on a finite-dimensional space and `ρ` on a complete space, with `ρ` unitary
and no equivalence between them, every matrix coefficient of `π` is `L²`-orthogonal to every
matrix coefficient of `ρ` (`ContRepresentation.schur_orthogonality`;
Knapp, Cor. 4.10(a), p. 241), by averaging into an intertwiner and §2.3. Algebraic closure is not
needed. *Needs:* §0.2, §2.3, §3.1.

**Checks.**
- For `ZMod 2`, the trivial and sign characters give `⟪1, sgn⟫ = (1 − 1)/2 = 0`.
- Inequivalence is needed: a nonzero coefficient has positive norm, so it is not orthogonal to
  itself.
- For the circle, `⟪z⁻ᵐ, z⁻ⁿ⟫ = 0` for `m ≠ n`.

### 4.3 The orthonormal system

For a family of pairwise inequivalent unitary irreducibles with orthonormal bases, the normalized
coefficients `√(dim V_π) · π_ij` form an orthonormal system in `L²(G)` indexed by
`Σ π, Fin (dim V_π) × Fin (dim V_π)`; this is §4.1 and §4.2 together (Knapp, p. 242). *Needs:*
§4.1-4.2.

**Checks.**
- For the circle with the characters `zⁿ`, the system is `{z⁻ⁿ}`, the Fourier system up to the
  index change `n ↦ −n`.
- For `Equiv.Perm (Fin 3)` the system has `1 + 1 + 4 = 6` elements, the order of the group.
- Without the factor `√(dim V_π)` the two-dimensional block would have norm `1/√2`.

### Examples

The orthogonality tables of the coefficients of `Equiv.Perm (Fin 3)`.

### Dependencies

Layers 0-3; Tau Ceti `Compact/SchurOrthogonality.lean`.

## Layer 5: the Peter-Weyl theorem

### 5.1 Convolution operators

Define `TauCeti.convolutionOperator k : Lp ℂ 2 μ_G →L[ℂ] Lp ℂ 2 μ_G` for a kernel `k ∈ C(G, ℂ)`,
`(k * f)(x) = ∫ y, k(x y⁻¹) f(y) ∂μ_G`; the value is a continuous function. Prove that it is a
compact operator (`TauCeti.isCompactOperator_convolutionOperator`), self-adjoint when
`k(g⁻¹) = conj(k g)` (`TauCeti.isSelfAdjoint_convolutionOperator`), and that its eigenspaces at
nonzero eigenvalues are finite-dimensional
(`TauCeti.finiteDimensional_eigenspace_convolutionOperator`, from Mathlib's
`ContinuousLinearMap.finite_dimensional_eigenspace`), invariant under right translation, and
carry continuous finite-dimensional representations whose functions are representative
(`TauCeti.convolutionEigenspaceRepresentation`). Prove that mollifiers exist (nonnegative
continuous kernels, invariant under inversion, of mass one and supported in a given neighbourhood
of `1`; `TauCeti.exists_isMollifier`) and that convolution with them approximates every
`f ∈ C(G)` uniformly as the neighbourhood shrinks. Compactness has two routes: the image of the
unit ball is a bounded equicontinuous family in `C(G)` (Arzelà-Ascoli), or a continuous kernel
gives a Hilbert-Schmidt operator, which is compact by OperatorIdeals Part C (Knapp, proof of
Thm 4.20, pp. 245-247; Bump, Ch. 3). *Needs:* §0.2, §3.2; Mathlib `IsCompactOperator`; for the
second route, OperatorIdeals Part C.

**Checks.**
- On the circle, `zᵐ * zⁿ = δ_mn · zⁿ`: `∫ (x y⁻¹)ᵐ yⁿ dy = xᵐ ∫ y^(n−m) dy`.
- For `k = 1`, `k * f` is the constant `∫ f dμ_G`: convolution by `1` is the projection onto
  the constants, of rank one.
- Self-adjointness needs the symmetry of `k`: on `ZMod 3` with `k` the indicator of an element
  `g ≠ 0`,
  `k * f = f(g⁻¹ ·)/3`, a multiple of a translation, which is not self-adjoint; `k` plus the
  indicator of `g⁻¹` gives a self-adjoint operator.

### 5.2 Density of representative functions

Prove that the representative `*`-subalgebra is uniformly dense in `C(G, ℂ)`
(`TauCeti.representativeStarSubalgebra_dense`; Bump, Ch. 4; Bröcker-tom Dieck, Ch. III): convolve
`f` with a mollifier, and write the convolution, through the spectral decomposition of the compact
self-adjoint operator of §5.1, as a uniform limit of representative functions. Hausdorffness is
not used. Deduce that `𝓡(G)` is dense in `L²(G)` (`TauCeti.dense_image_toLp_representativeSubmodule`,
with `ContinuousMap.toLp_denseRange`; Knapp, Thm 4.20, p. 245) and, for `[T1Space G]`, that it
separates points (`TauCeti.representativeStarSubalgebra_separatesPoints`). *Needs:* §5.1.

**Checks.**
- For the circle this is the density of trigonometric polynomials, Mathlib's
  `span_fourier_closure_eq_top`.
- For an indiscrete two-point group, density holds (everything is constant) and separation fails;
  the group is not `T1`.
- For `ZMod 2` the representative ring is all of `C(G, ℂ) = ℂ²`, spanned by the characters `1`
  and `sgn`.

### 5.3 Skeletons of the unitary dual

Define `TauCeti.IrrepModel ℂ G`, a model of a finite-dimensional irreducible unitary continuous
representation on the standard space `EuclideanSpace ℂ (Fin dim)`, with the fields `dim`, `rep`,
`continuous_rep`, `isUnitary` and `isIrreducible`. Define `TauCeti.IsIrrepSkeleton models` for a
family `models : ι → IrrepModel ℂ G`: distinct members are inequivalent, and every continuous
unitary irreducible representation on a standard space is carried onto some member by a linear
isometry. A skeleton exists: the representatives of the classes of models up to unitary
equivalence, `TauCeti.IrrepClass.model`. *Needs:* §2.3, §1.1.

**Checks.**
- For the circle, the characters `zⁿ`, `n ∈ ℤ`, are a skeleton; omitting one of them breaks
  exhaustion.
- Listing the same character twice breaks pairwise inequivalence.
- A discontinuous unitary character of the circle (as in §1.2, `z ↦ e^{iφ(z)}`) is not a model,
  since `continuous_rep` fails; without that field the index set would contain the uncountably
  many `e^{itφ}`, `t ∈ ℝ`, against the countable Fourier basis.

### 5.4 The Peter-Weyl basis

Prove that for a skeleton `models`, the normalized coefficients
`√(dim) · matrixCoeffLp (models i).rep (e_a) (e_b)` form a Hilbert basis of `L²(G)` indexed by
`Σ i, Fin (models i).dim × Fin (models i).dim` (`TauCeti.peterWeylBasis`, with its elements given
by `TauCeti.coe_peterWeylBasis`; Knapp, Cor. 4.21, p. 247), assembled by
`HilbertBasis.mkOfOrthogonalEqBot` from §4.3 and §5.2. Unconditionally, the basis on the chosen
representatives is `TauCeti.stdPeterWeylBasis ℂ G` (`TauCeti.coe_stdPeterWeylBasis`). Parseval is
Mathlib's `HilbertBasis.tsum_inner_mul_inner`. *Needs:* §4.3, §5.2, §5.3.

**Checks.**
- For the circle the index set is in bijection with `ℤ` and the basis is the Fourier basis, the
  model `n` giving the mode `−n` (Tau Ceti `Compact/FourierPeterWeyl.lean`).
- For a finite group the basis has `Σ (dim V_π)² = |G|` elements: `1 + 1 + 4 = 6` for
  `Equiv.Perm (Fin 3)`.
- The theorem pins the elements, not only the existence of a basis: `TauCeti.coe_peterWeylBasis`
  rules out an arbitrary Hilbert basis with the same index set.

### 5.5 The isotypic decomposition

Define the block `TauCeti.peterWeylBlock model ⊆ L²(G)` as the span of the `L²` coefficients of a
model. Prove that it has dimension `dim²` (`TauCeti.finrank_peterWeylBlock`), that `L²(G)` is the
Hilbert sum of the blocks of a skeleton (`TauCeti.isHilbertSum_peterWeylBlock`), that the
orthogonal projection onto a block is convolution with `dim · conj(Σ_i π_ii)`, where `Σ_i π_ii`
is the sum of the diagonal coefficients of the model (its character, §6.1)
(`TauCeti.peterWeylBlockAveraging_eq_starProjection`), and that the isometry
`TauCeti.peterWeylTraceEquiv` onto the Hilbert sum of the spaces `End(V_π)` intertwines the
two-sided translation representation of `G × G` with `T ↦ π g ∘ T ∘ π h⁻¹` on each summand
(`TauCeti.peterWeylTraceEquiv_biRegularLp`). This regroups the basis of §5.4 by model (Knapp,
Cor. 4.21, p. 247). *Needs:* §5.4.

**Checks.**
- For `Equiv.Perm (Fin 3)` the blocks have dimensions `1, 1, 4`, summing to `6 = dim L²(G)`.
- For the circle the block of the model `n` is the line `ℂ · z⁻ⁿ`, and the projection is
  convolution with `conj(zⁿ) = z⁻ⁿ`, which by the first Check of §5.1 keeps the mode `−n` only.
- For the trivial model the projection is convolution with `1`, the projection onto the constants.

### Examples

The circle, where the Peter-Weyl basis is the Fourier basis and each block is a line; finite
groups, where the decomposition is that of the group algebra into matrix blocks.

### Dependencies

Layers 0-4; Mathlib `HilbertBasis.mkOfOrthogonalEqBot`, `ContinuousMap.toLp_denseRange`,
`ContinuousLinearMap.finite_dimensional_eigenspace`; Tau Ceti `Compact/Convolution.lean`,
`Compact/ApproximateIdentity.lean`, `Compact/EigenspaceRepresentation.lean`,
`Compact/RepresentativeDensity.lean`, `Compact/PeterWeyl.lean`, `Compact/IsotypicBlock/Basic.lean`
and `Compact/TraceCoefficient/HilbertSum.lean`; OperatorIdeals Part C for the Hilbert-Schmidt
route.

## Layer 6: characters of compact groups

### 6.1 Characters

Define the character `ContRepresentation.character π hπ : C(G, ℂ)`, `g ↦ trace (π g)`, and its
class `ContRepresentation.characterLp π hπ` in `L²(G)`. It is a class function
(`ContRepresentation.character_conj`), its value at `1` is `dim V`, and in an orthonormal basis it
is the sum of the diagonal coefficients `π_ii` (Knapp, (4.11)-(4.15), pp. 242-243). *Needs:* §3.1.

**Checks.**
- For the two-dimensional representation of `Equiv.Perm (Fin 3)` the character is `2, 0, −1` on
  the identity, the transpositions and the 3-cycles.
- For the circle character `π z = zⁿ` the character is `zⁿ`, while its matrix coefficient with
  `v = w = 1` is `z⁻ⁿ` (§3.1): the character is the trace, not a coefficient.
- The character of the trivial representation on `ℂ²` is the constant `2`.

### 6.2 Orthonormality of characters

Prove `⟪χ_π, χ_π⟫ = 1` for a unitary irreducible `π`
(`ContRepresentation.character_orthonormal_self`) and `⟪χ_π, χ_ρ⟫ = 0` for unitary `π` when every
continuous intertwiner `ρ → π` vanishes (`ContRepresentation.character_orthonormal_distinct`)
(Knapp, Cor. 4.16, p. 243), by summing §4.1 and §4.2 over the diagonal. For a finite group this is
Mathlib's `Representation.char_orthonormal`. *Needs:* §4.1-4.2, §6.1.

**Checks.**
- For the two-dimensional representation of `Equiv.Perm (Fin 3)`,
  `⟪χ, χ⟫ = (4 + 3·0 + 2·1)/6 = 1`.
- Irreducibility is needed: the trivial representation on `ℂ²` has `⟪χ, χ⟫ = 4`.
- For the circle, `⟪zᵐ, zⁿ⟫ = δ_mn`.

### 6.3 Class functions and the character basis

The class functions in `L²(G)` are `TauCeti.classFunctionLp ℂ ℂ 2 μ_G`, the closed subspace of
classes fixed by every conjugation `f ↦ f(h · h⁻¹)`; conjugation invariance holds almost
everywhere, as befits classes of functions. Characters belong to it
(`ContRepresentation.characterLp_mem_classFunctionLp`). Prove that for a skeleton, the characters
of the models form a Hilbert basis of the class functions (`TauCeti.characterBasis`, and
unconditionally `TauCeti.stdCharacterBasis ℂ G` with its elements given by
`TauCeti.coe_stdCharacterBasis`): a class function orthogonal to every character is orthogonal to
every block of §5.5, hence zero. *Needs:* §5.5, §6.2.

**Checks.**
- For an abelian group every `L²` class is a class function, and the character basis and the
  Peter-Weyl basis consist of the same functions, indexed through `n ↦ −n` for the circle, where
  both are the Fourier basis.
- For `Equiv.Perm (Fin 3)` the class functions have dimension `3`, the number of conjugacy classes,
  and the basis has the three irreducible characters.
- The indicator of one transposition of `Equiv.Perm (Fin 3)` is not a class function: conjugating
  by another transposition moves it to the indicator of the third.

### 6.4 Isotypic projectors

For a finite-dimensional unitary continuous `ρ` and an irreducible `σ`, define
`ContRepresentation.isotypicProjector ρ hρ σ hσ`, the self-intertwiner
`v ↦ ∫ g, dim σ · conj(χ_σ g) · ρ g v ∂μ_G` (`ContRepresentation.isotypicProjector_apply`), and
prove that its range is the `σ`-isotypic component of `ρ`
(`ContRepresentation.range_isotypicProjector`) and that it is idempotent. *Needs:* §6.2, §2.2.

**Checks.**
- For the trivial `σ` the projector is `∫ ρ g dμ_G`, the projection onto the invariant vectors.
- For the swap representation of `ZMod 2` on `ℂ²` and `σ` the sign character, the projector is
  `(1 − swap)/2`, onto `ℂ(1, −1)`; for `σ` trivial it is `(1 + swap)/2`.
- The factor `dim σ` is needed: without it, for `σ` the two-dimensional representation of
  `Equiv.Perm (Fin 3)` acting on itself, the operator would be half the identity.

### 6.5 The Frobenius-Schur indicator

Define `ContRepresentation.frobeniusSchurIndicator π hπ = ∫ g, χ_π(g²) ∂μ_G`. Prove that for a
unitary irreducible `π` it is `1`, `0` or `−1`
(`ContRepresentation.frobeniusSchurIndicator_trichotomy`), that it is `1` exactly when `π` has a
nondegenerate invariant symmetric bilinear form
(`ContRepresentation.frobeniusSchurIndicator_eq_one_iff`) and `−1` exactly when it has a
nondegenerate invariant alternating one (`ContRepresentation.frobeniusSchurIndicator_eq_neg_one_iff`)
(Bröcker-tom Dieck, Ch. II). *Needs:* §6.2, §2.3.

**Checks.**
- The trivial representation has indicator `1`; the circle character `zⁿ` with `n ≠ 0` has
  indicator `∫ z²ⁿ = 0`.
- The two-dimensional representation of `Equiv.Perm (Fin 3)` has indicator
  `(2 + 3·2 + 2·(−1))/6 = 1`: squares of transpositions are `1`, squares of 3-cycles are 3-cycles.
- The defining representation of `SU(2)` has indicator `−1`: `χ₁(g²) = χ₂(g) − χ₀(g)` on the torus,
  whose average is `0 − 1`.

### Examples

The character tables of `ZMod n` and `Equiv.Perm (Fin 3)` read as Hilbert bases of their class
functions; the indicators `1, 0, −1` of `Equiv.Perm (Fin 3)`, the circle and `SU(2)`.

### Dependencies

Layers 0-5; Mathlib `Representation.character`; Tau Ceti `Continuous/Character.lean`,
`Compact/Character/Basic.lean`, `Compact/ClassFunctionLp.lean`, `Compact/Character/Basis.lean`,
`Compact/Character/IsotypicProjection.lean`, `Compact/FrobeniusSchur/` and
`TauCeti/MeasureTheory/Group/Conjugation.lean`.

## Engine case: `SU(2)` and the maximal torus

### E.1 The torus and torus conjugacy

Define `TauCeti.SU2.torusExp θ = diag(e^{iθ}, e^{-iθ})`, which parametrizes the maximal torus. Prove
that every element of `SU(2)` is conjugate to some `torusExp θ`
(`TauCeti.SU2.exists_isConj_torusExp`; Knapp, Thm 4.36, p. 255; Bump, Ch. 16), by unitary
diagonalization. *Needs:* Mathlib `Matrix.specialUnitaryGroup`.

**Checks.**
- `torusExp 0 = 1` and `torusExp π = −1`.
- The trace of `torusExp θ` is `2 cos θ`, so `torusExp θ` and `torusExp (−θ)` are conjugate (by
  `[[0, 1], [−1, 0]] ∈ SU(2)`), and `θ ∈ [0, π]` meets every conjugacy class exactly once.
- `torusExp (π/2) = diag(i, −i)` has order `4`.

### E.2 Classification of the irreducibles

Define `TauCeti.SU2.symPowerModel n`, the representation of `SU(2)` on `Symⁿ(ℂ²)` carried to
`EuclideanSpace ℂ (Fin (n + 1))` by the weight basis (Knapp, §IV.1, Example 4, p. 235). Prove
that it is irreducible (`TauCeti.SU2.isIrreducible_symPowerModel`) and that every
finite-dimensional irreducible continuous representation of `SU(2)` is equivalent to the
representation on `Symᵈ(ℂ²)` for exactly one `d`
(`TauCeti.SU2.existsUnique_nonempty_equiv_symPower`).
Peter-Weyl alone does not identify the irreducibles. Exhaustion has two routes: by highest
weights, or by characters (the characters of the `Symᵈ(ℂ²)` span a uniformly dense subspace of
the continuous class functions, so a further irreducible would have a character orthogonal to
every class function, against §6.2). *Needs:* §2.3, §6.1-6.2, §E.1.

**Checks.**
- `n = 0` is the trivial representation and `n = 1` the defining one, of character
  `2 cos θ` on the torus.
- `Symⁿ(ℂ²)` has dimension `n + 1`.
- For `n = 2` at `θ = π/2`, the weights give `e^{iπ} + 1 + e^{−iπ} = −1`, the sum of the
  eigenvalues `−1, 1, −1` of `Sym²` of `diag(i, −i)`.

### E.3 Characters on the torus

Prove that the character of `Symⁿ(ℂ²)` at `torusExp θ` is `Σ_{k=0}^{n} e^{i(n−2k)θ}`
(`TauCeti.SU2.character_symPower_torusExp`), equal to `sin((n+1)θ)/sin θ` when `sin θ ≠ 0`
(`TauCeti.SU2.character_symPower_torusExp_eq_sin_div_sin`, the Weyl character formula; Knapp,
pp. 314-315 and Thm 5.113, p. 338) and to `(n+1) cosⁿ θ` when `sin θ = 0`, that is `n + 1` at
`θ = 0` and `(−1)ⁿ (n+1)` at `θ = π` (`TauCeti.SU2.character_symPower_torusExp_of_sin_eq_zero`).
*Needs:* §E.1-E.2, §6.1.

**Checks.**
- For `n = 1` at `θ = π/3`: `sin(2π/3)/sin(π/3) = 1 = 2 cos(π/3)`.
- At `θ = 0` the quotient is `0/0`, and the value is the dimension `n + 1`; at `θ = π` it is
  `(−1)ⁿ (n+1)`, for `n = 1` the trace `−2` of `−1`.
- The characters `χ_n` are orthonormal on `[0, π]` for the Weyl measure `(2π)⁻¹ · 4 sin²θ dθ`, not
  for the Haar measure `dθ/(2π)` of the torus on `[0, 2π]`: there
  `⟪χ₀, χ₂⟫ = ∫₀^{2π} (e^{2iθ} + 1 + e^{−2iθ}) dθ/(2π) = 1`.

### E.4 The Weyl integration formula

Prove that for a continuous class function `f` on `SU(2)`,
`∫ f dμ_SU(2) = (2π)⁻¹ ∫₀^π f(torusExp θ) · 4 sin²θ dθ` (`TauCeti.SU2.weyl_integration_formula`;
Knapp, Thm 8.60, p. 550, with `|W| = 2` and `|D|² = 4 sin²θ`; Bump, Ch. 17). The factor
`4 sin²θ = |e^{iθ} − e^{−iθ}|²` is the squared Weyl denominator, and the density has total mass `1`
(`TauCeti.SU2.weyl_integration_formula_normalized`). Deduce `∫ χ_m · conj χ_n dμ = δ_mn` for the
characters of the symmetric powers (`TauCeti.SU2.integral_character_symPower_mul_conj`), which is
`(2/π) ∫₀^π sin((m+1)θ) sin((n+1)θ) dθ = δ_mn` on the torus. *Needs:* §0.1, §E.1-E.3.

**Checks.**
- `f = 1`: `(2π)⁻¹ ∫₀^π 4 sin²θ dθ = (2π)⁻¹ · 2π = 1`; the normalization `π⁻¹` would give `2`.
- `f = χ₁ = 2 cos θ`: `(4/π) [sin³θ / 3]₀^π = 0`, the average of the character of a nontrivial
  irreducible.
- `f = |χ₁|²`: `(8/π) ∫₀^π sin²θ cos²θ dθ = (8/π)(π/8) = 1`, the norm of an irreducible character.

### Examples

The orthonormality of the `SU(2)` characters computed on the torus, and the density
`(2/π) sin²θ` of the trace angle under Haar measure.

### Dependencies

Layers 0, 2 and 6; Mathlib `Matrix.specialUnitaryGroup`; Tau Ceti `TauCeti/RepresentationTheory/SU2/`
and `TauCeti/Topology/Algebra/UnitaryGroup.lean`.

---

## Worked examples

- **Finite groups recover [CharacterTheory](../CharacterTheory/README.md).** For a finite group
  with the discrete topology, `μ_G` is the uniform measure, `L²(G)` is `G → ℂ` with
  `⟪F, H⟫ = |G|⁻¹ Σ conj(F g) H g`, §2.2 specializes to Maschke's theorem,
  `ContRepresentation.schur_orthogonality_self` to the orthogonality relations of the matrix
  coefficients of a finite group, `ContRepresentation.character_orthonormal_self` and
  `ContRepresentation.character_orthonormal_distinct` to Mathlib's `Representation.char_orthonormal`,
  and the Peter-Weyl basis to `Σ_π (dim V_π)² = |G|`, the decomposition of `ℂ[G]` into the blocks
  `End(V_π)`. The two relations differ: for the two-dimensional representation of
  `Equiv.Perm (Fin 3)` and `v = w = e₁`, Schur orthogonality gives `⟪π_11, π_11⟫ = 1/2`, while the
  character relation gives `⟪χ, χ⟫ = 1`. Each theorem, specialized to `ZMod n` or
  `Equiv.Perm (Fin 3)`, reduces to the finite-group statement without new hypotheses; Tau Ceti
  records these specializations in `TauCeti/RepresentationTheory/Compact/Finite.lean`.
- **The circle and Fourier series.** For the circle, every irreducible is one-dimensional, the
  Peter-Weyl basis is Mathlib's `fourierBasis` up to the index change `n ↦ −n` (Tau Ceti
  `Compact/FourierPeterWeyl.lean`), the density of §5.2 is `span_fourier_closure_eq_top`, and the
  character orthonormality of §6.2 is `orthonormal_fourier`.
- **`SU(2)`.** The symmetric powers are the irreducibles, their characters on the torus are
  `sin((n+1)θ)/sin θ` where `sin θ ≠ 0`, and their orthonormality follows from the Weyl integration formula; this
  agrees with the general §6.2.

## Downstream consumers

Roadmaps on main that consume this one include [LieGroups](../LieGroups/README.md) (Layers 5A, 6
and 7: Haar probability, character orthonormality, Peter-Weyl and the `SU(2)` case of Weyl
integration); [CharacterTheory](../CharacterTheory/README.md)
(Layer 5, the isotypic decomposition, compared on finite groups);
[AmenableGroups](../../AmenableGroups/README.md) (Layer 0);
[RandomMatrices](../../RandomMatrices/README.md) (Layer 0 and §E.4);
[PseudodifferentialOperators](../../PseudodifferentialOperators/README.md) (Layers 0-3);
[TopologicalKTheory](../../TopologicalKTheory/README.md) (Layers 0 and 5);
[DeligneWeightsAndPurity](../../DeligneWeightsAndPurity/README.md) (Layers 0, 5, 6 and the engine
case); [CharacteristicClasses](../../CharacteristicClasses/README.md) and
[GeneralizedCohomology](../../GeneralizedCohomology/README.md) (Layer 0);
[BordismFormalGroups](../../BordismFormalGroups/README.md) (Layers 1-2);
[QuantumGroups](../../QuantumGroups/README.md) (Peter-Weyl and the engine case);
[CompactQuantumMetricSpaces](../../CompactQuantumMetricSpaces/README.md) (Layers 0-5).

## References

- A. W. Knapp, *Lie Groups Beyond an Introduction*, 2nd ed., Progress in Mathematics 140,
  Birkhäuser (2002): Haar measure on compact groups (§IV.2, pp. 239-240), unitarizability and
  complete reducibility (Prop. 4.6, Cor. 4.7, p. 240), Schur's lemma (Prop. 4.8, Cor. 4.9, p. 240),
  Schur orthogonality (Cor. 4.10, p. 241), characters (pp. 242-243, Cor. 4.16), the Peter-Weyl
  theorem (Lemmas 4.17-4.19, Thm 4.20, Cor. 4.21, pp. 244-247), torus conjugacy (Thm 4.36,
  p. 255), the `SU(2)` characters (pp. 314-315), the Weyl character formula (Thm 5.113, p. 338)
  and the Weyl integration formula (Thm 8.60, p. 550).
- D. Bump, *Lie Groups*, 2nd ed., Springer GTM 225 (2013): Haar measure (Ch. 1), Schur
  orthogonality (Ch. 2), compact operators (Ch. 3), the Peter-Weyl theorem (Ch. 4), tori and
  maximal tori (Chs. 15-16) and the Weyl integration formula (Ch. 17).
- T. Bröcker, T. tom Dieck, *Representations of Compact Lie Groups*, Springer GTM 98 (1985):
  elementary representation theory, including real and quaternionic representations (Ch. II),
  representative functions and the Peter-Weyl theorem (Ch. III), and the maximal torus (Ch. IV).
