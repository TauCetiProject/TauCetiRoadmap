# Roadmap: compact groups, part II — invariant metrics, Banach density, products, abelian Fourier theory and global forms

**Summary.** This roadmap continues
[representations of compact groups and the Peter-Weyl theorem](../CompactGroups/README.md)
(the *base roadmap* below). The base roadmap builds normalized Haar measure and
averaging (its Layer 0), unitarizability (Layer 1), complete reducibility (Layer 2),
matrix coefficients (Layer 3), Schur orthogonality (Layer 4), the Peter–Weyl theorem
(Layer 5), characters of compact groups (Layer 6) and the engine case SU(2) with its
symmetric-power classification. Part II builds on these.
The comparison targets concern invariant metrics, G-finite vectors in Banach
representations, metrizability, duals of arbitrary products, compact abelian
Fourier bases, global forms with their torus characters and unitary conjugacy of SU(2) actions.

## Scope and ownership

**Where the base roadmap stops.** The Haar-through-Peter–Weyl and SU(2) constructions
belong to the base roadmap, Layers 0–6 and its engine case, and nothing of the base
roadmap is planned again here. Their implemented statements are inputs, not construction targets:
Haar averaging and bi-invariance; Gram averaging and unitarization; orthogonal
complete reducibility; matrix coefficients, their star-algebra, Schur orthogonality,
convolution and uniform/L² density; the native irreducible skeleton and identified
Peter–Weyl basis; trace characters and the central L² character basis;
Frobenius–Schur forms and structure maps; and SU(2) classification and Weyl integration.
The base roadmap's “What is not consumable, and is a build item here” comparison
targets own the forgetful correspondence with finite-dimensional algebraic
representations, its character comparison, the identification of continuous and
algebraic intertwiners, and finite-dimensional irreducibility comparison.
The exact native interfaces are listed below. §0.1 adds only tensor and dual
compatibility of that correspondence, preserving its underlying maps.

This roadmap owns field-general orbit finiteness and compact strongly continuous
Banach density. AutomorphicFormsOnReductiveGroups §2.1 owns the complete locally
convex extension and consumes this Banach theorem. SmoothBanachRepresentations
§4.1 owns the real and complex smooth-topology comparison;
AutomorphicFormsOnReductiveGroups §2.7 supplies the complex smooth result. Neither is an analytic input.
Completed/OrthogonalL2Bases Part B owns generic weighted L² basis assembly;
CharacterTheory Layers 0–4 own finite-group character theory.

LieGroups Layers 2 and 4–5 supply automatic smoothness, Lie integration and
covering groups. The compact structure theory is LieGroups': its Layer 5A owns the
Ad-invariant inner product, the orthogonal splitting of the Lie algebra into its
center and its semisimple derived algebra, and the negative-definite Killing form;
its Layer 6 owns maximal tori, the Weyl group, and (compact real roots and the Weyl
comparison) the root characters, the Cartan subalgebra, root multiplicity one and
the comparison with Mathlib's `LieAlgebra.IsKilling.rootSystem`; its Layer 7
(compact semisimple integration) owns the compact simply connected cover of a
compact connected semisimple group and the finiteness of its fundamental group.
SymplecticGeometry/ConvexityToric T1 owns the 2π-normalized period and weight
dictionary of a compact torus, the integer pairing of characters with coroots and
the finite-index lattice comparison under a central isogeny. §6.5 owns the
compact-group equality of the cocharacter and coroot lattices for a simply
connected compact semisimple group, proved using Lie integration and the pinned
highest-weight modules. Layer 6 also owns the closed derived subgroup and the commuting
product, the finite central cover with the descent of characters, the dominance
comparison, the classification of irreducible representations by dominant
characters and the formal-character basis of the Weyl invariants. The rest of
LieGroups Layer 7, the group complexification and the equivalence between
continuous and holomorphic representations, is not a premise here.

TopologicalKTheory T6 owns the representation ring R(G) of a compact Lie group,
with its ring structure, restriction maps and naturality, and it consumes §2.1 of
this roadmap. So that the supply runs in one direction, this roadmap constructs no
Grothendieck ring of representations and no target here uses that carrier: Layer 6
states its results on formal characters in the integral group algebra of the
character group of a maximal torus.

OperatorTheory/OperatorIdeals Part C owns the generic Hilbert–Schmidt theory, and
the base roadmap's Layer 5 keeps the step that a continuous kernel on a compact
space gives a Hilbert–Schmidt integral operator, as an input to the compactness of
the Haar convolution operator. §0.2 differs from that step in two respects: it is
stated for a general compact space with a finite Borel measure, not only for Haar
convolution, and it proves the exact norm identity and the adjoint comparison.
LieHighestWeight Layers 7 and 9 own the algebraic universal-enveloping center
and reductive trace-form comparison; CharacteristicClasses §C5.1 owns compact invariant
polynomial restriction. Neither is a premise for group-character descent.
BanachSpaceTheory B5 owns the equivalence between separability of a complete
real or complex inner-product space and countability of a Hilbert-basis index.
Layer 3 owns its Peter–Weyl application and compact-group countability criteria.

## Conventions

G is a compact Hausdorff topological group, with its Borel sigma algebra where
measure is used. Haar measure μ is normalized to μ(G)=1. All analytic
representations are complex. A finite-dimensional continuous representation is
`ContRepresentation ℂ G V` together with continuity of its parameter map;
the bundle itself only records continuity of each linear operator. A Banach
action instead carries continuity of each orbit map, with completeness of V.
No countability, separability, connectedness or Lie structure is implicit.

The inner product is conjugate-linear in its first slot. A coefficient is
c(v,w)(g)=⟨π(g)v,w⟩; the trace is χ(g)=tr(π(g)), so the diagonal coefficient
sum is conjugate χ. Thus the coefficient of the scalar circle action at i,
with v=w=1, is −i, whereas its trace and its Fourier character vector are i.
The Peter–Weyl coefficient basis of the circle is indexed by −n for scalar
action n. A general Gram form is h(v,w)=⟨v,Tw⟩; self-adjointness also gives
h(v,w)=⟨Tv,w⟩.

Permutations compose right to left: στ applies τ first. A permutation σ of
n letters acts on ℂⁿ through the matrix `n_σ` with `n_σ e_j = e_{σ(j)}`, so
that `σ ↦ n_σ` is a homomorphism and conjugation by `n_σ⁻¹` sends
`diag(t_1, …, t_n)` to `diag(t_{σ(1)}, …, t_{σ(n)})`.

An irreducible representation has V≠0 and no proper nonzero invariant subspace.
For finite-dimensional V all subspaces are closed, so this agrees with
`Representation.IsIrreducible`. On infinite-dimensional spaces topological
irreducibility uses closed invariant subspaces and is a different condition.

**Checks.**

- For the trivial group on V=0 the invariant-subspace lattice has one element:
  the condition that only the trivial subspaces are invariant holds, but
  irreducibility is false.
- The trivial action on ℂ is irreducible, with dimension 1; the trivial action
  on ℂ² has an invariant line and is reducible.
- For the S₃ standard unitary representation, a three-cycle acts by rotation
  through 2π/3. Its diagonal coefficient at e₁ is −1/2; at the identity it is 1.
  A zero coefficient vector gives 0 for every group element.

## Exact supplier contracts

### From Mathlib

- `ContRepresentation`, `ContRepresentation.toRepresentation` and
  `ContIntertwiningMap` in `Mathlib/RepresentationTheory/Continuous/Basic.lean`:
  actions by continuous linear operators, with parameter continuity added explicitly.
- `LinearMap.continuous_of_finiteDimensional` in
  `Mathlib/Topology/Algebra/Module/FiniteDimension.lean`: linear maps with
  finite-dimensional Hausdorff domain are continuous.
- `Representation.IsIrreducible` in `Mathlib/RepresentationTheory/Irreducible.lean`:
  `IsSimpleOrder` of the subrepresentation lattice, including nontriviality.
- `Representation.IsIrreducible.finrank_eq_one_of_isMulCommutative` in
  `Mathlib/RepresentationTheory/Irreducible.lean`: a finite-dimensional
  irreducible representation of a commutative monoid over an algebraically
  closed field has dimension 1. This algebraic input requires no topology,
  compactness or continuity.
- `HilbertBasis`, its coordinate isometry and Parseval in
  `Mathlib/Analysis/InnerProductSpace/l2Space.lean`; `ContinuousMap.toLp_denseRange`
  in `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean`.
- `Summable.countable_support_ennreal` in
  `Mathlib/Topology/Algebra/InfiniteSum/ENNReal.lean`: a nonnegative family with
  finite total mass has countable support. Apply it to squared basis coordinates.
- `PontryaginDual` and its compact-open topology in
  `Mathlib/Topology/Algebra/PontryaginDual.lean`, including discreteness for compact
  domain; `Circle.eq_one_of_forall_pow_mem_centeredArc_pi_div_two` for finite
  coordinate dependence. `AddMonoidAlgebra` is the carrier of the formal
  characters of Layer 6.
- `LieAlgebra.IsKilling.rootSystem` in `Mathlib/Algebra/Lie/Weights/RootSystem.lean`:
  the root system of a finite-dimensional Killing Lie algebra with a splitting
  Cartan subalgebra. Layer 6 uses it for the complexified derived pair of a
  compact connected Lie group.
- `RootPairing.Base.toCoweightBasis` and
  `RootPairing.Base.toCoweightBasis_apply` in
  `Mathlib/LinearAlgebra/RootSystem/Base.lean`, with
  `Module.Basis.dualBasis_apply_self` in `Mathlib/LinearAlgebra/Dual/Basis.lean`:
  the simple coroots form a basis, whose dual fundamental weights take
  values 1 and 0 on the corresponding and other simple coroots.

### From Tau Ceti

Paths in this list are below `TauCeti/RepresentationTheory/` unless given in full.

- `TauCeti/Geometry/Hodge/Conjugation.lean`:
  `TauCeti.Hodge.complexificationConjugation`,
  `TauCeti.Hodge.complexificationConjugation_toEquiv_tmul` and
  `LinearMap.map_eigenspace_baseChange` supply conjugation on ℂ⊗ℝV,
  its semilinearity and involution, and the conjugate-eigenvalue comparison
  for real-linear maps. Layer 6 restricts this existing map to simultaneous
  torus weight spaces.
- `Compact/Haar.lean`: `TauCeti.haarProb`, `TauCeti.haarProb_def`,
  `TauCeti.haarProb_apply_univ` and the probability, Haar and bi-invariance instances.
  `Compact/Averaging.lean`: `TauCeti.haarAverage`, for complete normed targets.
- `Compact/Unitarizable.lean`: `ContRepresentation.gramOperator` and
  `ContRepresentation.isUnitarizable`, the Haar-averaged Gram operator and
  its self-adjoint, positive-definite and invariant form, for a representation
  of a compact group (with its Borel structure) on a complete inner-product
  space over ℝ or ℂ whose parameter map is continuous in the operator-norm
  topology; no finite-dimensional hypothesis enters. `Compact/UnitaryModel.lean`:
  `ContRepresentation.exists_isUnitary_congr`, which in finite dimension
  conjugates such a representation by a continuous linear automorphism into
  one that is unitary for the given inner product.
- `Continuous/Intertwining.lean`: `ContRepresentation.intertwiningMapEquiv`,
  `ContRepresentation.intertwiningMapEquiv_id`,
  `ContRepresentation.intertwiningMapEquiv_comp` and
  `ContRepresentation.nonempty_equiv_iff` identify continuous and algebraic
  intertwiners and equivalences for finite-dimensional Hausdorff complex
  representations, preserving underlying maps, identities and composition.
  `FDRep/Basic.lean`: `FDRep.ofShrink`, `FDRep.ofShrinkEquiv` and
  `FDRep.character_ofShrink` give the universe-compatible algebraic object,
  its equivalence with the original action and preservation of its character.
  For trivial ℂ the Hom comparison fixes 2I and 3I and their composite 6I;
  shrinking the C₃ character preserves its value ω at a generator.
- `Continuous/TensorProduct.lean`: `ContRepresentation.tprod` and
  `ContRepresentation.continuous_tprod` give the tensor product of two
  continuous representations, acting by π(g)⊗ρ(g), and its continuity. They are
  stated on inner-product spaces, and no character identity for this carrier is
  supplied. `Continuous/LinHom.lean`: `ContRepresentation.linHom`,
  `ContRepresentation.continuous_linHom` and
  `ContRepresentation.character_linHom` give the action
  T↦ρ(g)∘T∘π(g⁻¹) on continuous linear maps between normed spaces, its
  continuity for a topological group, and its character
  `χ_π(g⁻¹)·χ_ρ(g)` in finite dimension; `Continuous/Character.lean`:
  `ContRepresentation.character_trivial` gives the constant character of a
  trivial action. With ρ the trivial line the action is the dual
  f↦f∘π(g⁻¹) with character g↦χ_π(g⁻¹): for the C₃ character with value ω
  this is `ω⁻¹·1=ω²`.
- `Compact/Finite.lean`: `TauCeti.integral_haarProb` and
  `ContRepresentation.inner_gramOperator_eq_inv_mul_sum`: for a finite
  discrete group, the normalized Haar integral is `|G|⁻¹Σ_g` and the
  unitarizing Gram form is `⟪v,Tw⟫=|G|⁻¹Σ_g⟪π(g)v,π(g)w⟫`.
- `Continuous/Unitary/Basic.lean`: `ContRepresentation.IsUnitary`;
  `Continuous/Unitary/Equivalence.lean`:
  `ContRepresentation.exists_linearIsometryEquiv_congr_eq`, which replaces an
  equivalence between unitary representations over an algebraically closed
  field, with finite-dimensional irreducible source, by a linear isometry
  transporting one action onto the other;
  `Continuous/OrthogonalDecomposition.lean`:
  `ContRepresentation.IsUnitary.exists_orthogonal_irreducible_decomposition`;
  `Continuous/Schur.lean`:
  `ContRepresentation.exists_eq_smul_one_of_isIrreducible`.
- `Continuous/MatrixCoefficient.lean` and `Compact/MatrixCoefficient.lean`:
  `ContRepresentation.matrixCoeff` and `ContRepresentation.matrixCoeffLp`;
  `Compact/SchurOrthogonality.lean`:
  `ContRepresentation.schur_orthogonality_self` and
  `ContRepresentation.schur_orthogonality_basis`, with unitary irreducible hypotheses.
- `Compact/Convolution.lean`, `Compact/ApproximateIdentity.lean`,
  `Compact/EigenspaceRepresentation.lean`, `Compact/RepresentativeDensity.lean`:
  the continuous-kernel convolution, approximate identities and noncircular density route;
  in particular `TauCeti.representativeStarSubalgebra_dense` and its point-separation corollary.
- `Continuous/Integrated/Basic.lean`:
  `ContRepresentation.integratedOperatorL1`,
  `ContRepresentation.integratedOperatorL1_toL1`,
  `ContRepresentation.norm_integratedOperatorL1_le`,
  `ContRepresentation.comp_integratedOperatorL1` and
  `ContRepresentation.tendsto_integratedOperatorL1_apply`. These supply the L¹
  action, Bochner formula, uniform-bound estimate, left covariance and strong
  approximate-identity convergence. For a multiplicative G, use the additive
  tag `Additive G` and transport the action to `Multiplicative (Additive G)`.
  The group need not be commutative; the measure is Borel and inner regular
  on compact sets. Covariance uses left invariance and a complete target;
  convergence uses mass-one weights, a uniform L¹ bound and concentration
  at the identity, with no second countability or separability hypothesis.
- `Compact/PeterWeyl.lean`: `TauCeti.IrrepModel`, `TauCeti.IsIrrepSkeleton`,
  `TauCeti.IrrepClass`, `TauCeti.stdPeterWeylBasis` and `TauCeti.coe_stdPeterWeylBasis`.
  The index for G in universe u is in universe u; there is no countability restriction.
- `Compact/Character/Basis.lean`: `TauCeti.characterBasis` and
  `TauCeti.coe_characterBasis` on the native central L² subspace; these use trace
  characters, with the inverse-map comparison to conjugate coefficient blocks.
- `Compact/FrobeniusSchur/InvariantForm.lean` and `StructureMap.lean`:
  `ContRepresentation.frobeniusSchurIndicator_eq_one_iff`,
  `ContRepresentation.frobeniusSchurIndicator_eq_neg_one_iff` and
  `ContRepresentation.frobeniusSchurIndicator_eq_one_iff_exists_structureMap`.
- `SU2/TorusConjugacy.lean`: `TauCeti.SU2.exists_isConj_torusHom`;
  `SU2/Weight.lean`: `TauCeti.SU2.symPower_torusHom_weightBasis`, with weights
  2i−d for 0≤i≤d. These give the kernel computation in Layer 7 directly.
- `SU2/Exhaustion.lean`: `TauCeti.SU2.symPowerModel` and
  `TauCeti.SU2.existsUnique_nonempty_equiv_symPower`;
  `SU2/Weyl/Character.lean` and `Integration.lean`: the global weight sum,
  sine quotient with nonzero denominator, endpoint values and
  `TauCeti.SU2.weyl_integration_formula`. Unitarize the monomial model before
  applying coefficient formulas; its Euclidean coordinates are not unitary for n≥2.
- `Compact/FourierPeterWeyl.lean`: `TauCeti.fourierPeterWeylIndexEquiv` and
  `TauCeti.peterWeylFamily_fourierIrrepModel`, including the sign −n.
  `TauCeti.fourierPontryaginDualEquiv` supplies the single-circle dual.

- `TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/Basic.lean`:
  `ContinuousLinearMap.hilbertSchmidtEnergy`, the sum of the squared norms of the
  images of a Hilbert basis, with values in `ℝ≥0∞`, and
  `ContinuousLinearMap.hilbertSchmidtNorm`, its square root, which is 0 on an
  operator of infinite energy; `…/HilbertSchmidt/Columns.lean`:
  `HilbertBasis.columnOperator`; `Compact/Convolution.lean`:
  `TauCeti.convolutionOperator`, the Haar convolution operator of a continuous
  kernel on L². These are the carriers of §0.2. The pins have no integral operator
  of a continuous kernel on a general compact space.
- `TauCeti/Geometry/Lie/Subgroup/Torus.lean`: `TauCeti.Lie.IsTorus` (a compact,
  connected, commutative subgroup), `TauCeti.Lie.IsMaximalTorus` (maximal among
  these; neither closedness nor a Lie structure is part of the definition),
  `TauCeti.Lie.exists_isMaximalTorus` and
  `TauCeti.Lie.IsTorus.nonempty_continuousMulEquiv_pi_circle`, which identifies a
  torus of a Lie group with a finite product of circles indexed by the dimension
  of its Lie algebra; `TauCeti/Geometry/Lie/Subgroup/Weyl/Finite.lean`:
  `TauCeti.Lie.IsMaximalTorus.finite_normalizerQuotient`, finiteness of
  `W = N_K(T)/T` for a compact Lie group. Used in §§6.1, 6.2 and 6.4. The pins
  have no root characters, positive system or conjugacy theorem for maximal tori.
- `TauCeti/Algebra/Lie/Weights/WeightLattice.lean` and `Integrality.lean`:
  `TauCeti.integralWeightLattice` and `TauCeti.exists_int_apply_coroot`, the
  integral weights of a Cartan subalgebra and the integrality of the weights of a
  finite-dimensional module on coroots.
  `TauCeti/Algebra/Lie/HighestWeight/Basic.lean`, `Verma.lean`,
  `FiniteDimensional.lean` and `Existence.lean`: `TauCeti.IsDominantIntegral`
  (natural-number values on the simple coroots of a base),
  `TauCeti.irreducibleQuotient`,
  `TauCeti.finiteDimensional_irreducibleQuotient_of_isDominantIntegral` and
  `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`.
  `TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.lean`:
  `TauCeti.exists_isCompl_of_isKilling`.
  `TauCeti/Algebra/Lie/Weights/FormalCharacter.lean` and
  `TauCeti/Algebra/Lie/HighestWeight/OrbitSum.lean`: `TauCeti.formalCharacter`,
  `TauCeti.formalCharacter_tensor`, `TauCeti.formalCharacter_coeff_weylGroup_smul`
  and `TauCeti.formalCharacter_eq_orbitSum_add_lower`. All of these are stated for
  a finite-dimensional Killing Lie algebra over a field of characteristic zero
  with a Cartan subalgebra acting triangularizably and a base of
  `LieAlgebra.IsKilling.rootSystem`; §§6.5–6.8 apply them to the complexified
  derived pair.

### From named roadmaps

LieGroups Layers 0 and 2–5 supply the exponential, automatic smoothness,
differentiation, integration of homomorphisms from simply connected groups and
universal covering homomorphisms. LieGroups Layer 5A supplies the Ad-invariant
inner product, the splitting `𝔨 = 𝔷 ⊕ [𝔨,𝔨]` and the negative-definite Killing form
of the derived algebra. LieGroups Layer 6 supplies conjugacy of maximal tori and
of every element into a maximal torus, the Weyl group with its action on the
torus, and, in its target on compact real roots and the Weyl comparison, the
splitting `𝔱 = 𝔷 ⊕ 𝔱_ss`, the root characters with `dχ_α = iα`, the Cartan
subalgebra `𝔱_ss ⊗ ℂ` of the complexified derived algebra, root multiplicity one
and the identification with `LieAlgebra.IsKilling.rootSystem`, under which the
Weyl group acts through the root reflections and fixes the center. LieGroups
Layer 7, in its target on compact semisimple integration, supplies the compact
simply connected cover of a compact connected semisimple group with finite
covering kernel. SymplecticGeometry/ConvexityToric T1 supplies the 2π-normalized
period and weight dictionary of a compact torus (characters identified by
`(1/i)dχ`, with integer values on `(2π)⁻¹ ker exp`), the integer pairing of
characters with coroots and the finite-index lattice comparison under a central
isogeny. The semisimple highest-weight theory is consumed through the Mathlib
and Tau Ceti declarations listed above; §6.5 combines it with Lie integration
and the period dictionary to prove the simply connected compact cocharacter
comparison.
BanachSpaceTheory B5 supplies: for every complete real or complex inner-product
space with a Hilbert basis indexed by I, separability is equivalent to
countability of I. Layer 3 applies the complex case to the native Peter–Weyl basis.
OperatorTheory/OperatorIdeals Part C supplies Hilbert–Schmidt operators and their
compactness for Layer 0. The base roadmap (RepresentationTheory, CompactGroups) supplies
its Layers 0–6 and its engine case through the Tau Ceti declarations listed above:
Layer 0 Haar averaging and bi-invariance, Layers 1–2 unitarization and complete
reducibility, Layers 3–4 matrix coefficients and Schur orthogonality, Layer 5 the
Peter–Weyl basis and density, Layer 6 characters, and the engine case the SU(2)
classification and Weyl integration. Its “What is not consumable, and is a build
item here” comparison targets supply the continuous-to-algebraic correspondence,
character compatibility and finite-dimensional irreducibility comparison;
§0.1 consumes these together with the pinned Hom and shrinking maps.
No supplier is required to construct Haar,
unitarization, Peter–Weyl or the SU(2) classification a second time.

## How to read the build

Layer 0 compares the continuous representation interfaces and continuous kernels.
Layer 1 classifies invariant metrics; Layer 2 proves Banach orbit-finite density;
Layer 3 relates countability and metrizability; Layer 4 handles arbitrary products;
Layer 5 identifies abelian Fourier bases; Layer 6 constructs global-form descent
and the formal-character basis of the Weyl invariants; Layer 7 classifies unitary SU(2) actions. Layers 1,
2 and 4 are independent beyond their named native inputs. The README carries
all targets and Checks; `Suggested.lean` carries headline acceptance statements.

## Layer 0: comparisons with the base theory

### 0.1 Tensor and dual compatibility

For finite-dimensional continuous complex representations, use the base
roadmap's continuous-to-algebraic correspondence and the pinned intertwiner
and shrinking maps. The continuous tensor product V⊗W is the pinned
`ContRepresentation.tprod`; it is stated for inner-product spaces, so V and W
are taken on inner-product models here (a unitarized model, or a Euclidean
coordinate model; either is equivalent to the given representation by the
identity or a coordinate map, and `ContRepresentation.nonempty_equiv_iff`
carries the equivalence to the algebraic images). The
continuous dual V* is the pinned `ContRepresentation.linHom` from V into
`ContRepresentation.trivial` on the line ℂ, with action f↦f∘π(g⁻¹); neither
carrier is constructed again. Construct the tensor comparison from the algebraic image
of V⊗W to the tensor product of the algebraic images of V and W, and the dual
comparison from the algebraic image of V* to the dual of the algebraic image
of V. After transport through the shrinking equivalences, the former sends
v⊗w to v⊗w and the latter sends a functional to the same functional.
Prove naturality and compatibility with tensor associativity, the trivial-line
unit and evaluation and coevaluation. These are deductions from the usual
finite-dimensional tensor and dual maps and automatic continuity; the new
obligation is their compatibility with the supplied correspondence.

- For intertwiners A:V→V' and B:W→W', the tensor comparison identifies the
  image of A⊗B with the tensor product of their images, and the dual comparison
  identifies the image of A*:V'*→V* with the dual of the image of A.
- The associativity and unit comparison diagrams commute on pure tensors;
  evaluation V*⊗V→ℂ and coevaluation ℂ→V⊗V* are preserved, including their
  two contraction identities.
- The tensor action `ContRepresentation.tprod` has trace character χ_Vχ_W,
  by the algebraic tensor character identity applied to its underlying
  representation. The dual character g↦χ_V(g⁻¹) is not a target: it is
  `ContRepresentation.character_linHom` with
  `ContRepresentation.character_trivial` on the line.

*Needs:* CompactGroups' “What is not consumable, and is a build item here”
comparison targets; `ContRepresentation.intertwiningMapEquiv`,
`ContRepresentation.nonempty_equiv_iff`;
`FDRep.ofShrink`, `FDRep.ofShrinkEquiv`, `FDRep.character_ofShrink`;
`ContRepresentation.tprod`, `ContRepresentation.continuous_tprod`,
`ContRepresentation.linHom`, `ContRepresentation.continuous_linHom`,
`ContRepresentation.character_linHom`, `ContRepresentation.character_trivial`;
Mathlib finite-dimensional tensors, duals, `FDRep` character identities and
`LinearMap.continuous_of_finiteDimensional`.

**Checks.**

- For trivial ℂ, the supplied Hom map fixes 2I and 3I and their composite 6I;
  their tensor product also acts by 6 on 1⊗1, excluding a rescaled comparison.
- For the C₃ character with value ω at a generator, shrinking preserves ω,
  the tensor square has trace ω² and the dual has trace ω⁻¹=ω²;
  replacing the dual by the original action would give ω instead.
- On ℂ² with dual basis e₁*,e₂*, evaluation sends e₁*⊗e₂ to 0 and
  e₁*⊗e₁ to 1; coevaluation sends 1 to e₁⊗e₁*+e₂⊗e₂*, and contracting
  with e₁ returns e₁. On V=0 coevaluation is zero and the contraction
  is the unique map 0→0, its identity.

### 0.2 Continuous kernels and Hilbert–Schmidt operators

For every compact Hausdorff X with a finite regular Borel measure μ and continuous
complex kernel k on X×X, compare the integral operator
`A_k f(x)=∫ k(x,y)f(y) dμ(y)` from L²(μ) to itself with the Hilbert–Schmidt
operator of k: prove that its energy `ContinuousLinearMap.hilbertSchmidtEnergy`
in every Hilbert basis of L²(μ) is `∫|k|² d(μ×μ)`, which is finite, and hence
`‖A_k‖²_HS=∫|k|² d(μ×μ)` for `ContinuousLinearMap.hilbertSchmidtNorm`. The
identity is stated for the energy first because the pinned norm is 0 on an
operator of infinite energy. This is a deduction from
OperatorTheory/OperatorIdeals Part C, specifically OI-C01–OI-C11, and the
finite-rank kernel identity: finite sums of `a(x)conj(b(y))` are uniformly
dense in C(X×X) by complex Stone–Weierstrass, hence L²-dense among continuous
kernels for finite μ. Their operator Hilbert–Schmidt norms equal their kernel
L² norms by finite-sum expansion and Parseval; completeness extends this
isometry. No separable L² basis or standard Borel assumption enters this route.

- The map from continuous kernels to Hilbert–Schmidt operators is complex-linear
  and sends `k*(x,y)=conj k(y,x)` to the adjoint of A_k.
- Kernels equal almost everywhere give the same operator; the norm identity
  identifies the kernel of the map with continuous kernels vanishing μ×μ-a.e.
- For normalized Haar measure and `k(x,y)=f(xy⁻¹)`, A_k is the native
  `TauCeti.convolutionOperator` of f; translation invariance gives `‖A_k‖²_HS=‖f‖²₂`.

*Needs:* Tau Ceti `ContinuousLinearMap.hilbertSchmidtEnergy`,
`ContinuousLinearMap.hilbertSchmidtNorm` and `TauCeti.convolutionOperator`;
OperatorTheory/OperatorIdeals Part C OI-C01–OI-C11; Mathlib complex
Stone–Weierstrass, Fubini and Parseval; native compact convolution for the specialization.

**Checks.**

- On two points of mass 1/2 each, k=1 gives the averaging projection with
  squared Hilbert–Schmidt norm 1, equal to the kernel integral 4·1/4=1.
- For k=0 both norms are 0; for μ=0 even k=1 gives A_k=0 and both norms 0.
  Thus injectivity on continuous functions needs full support.
- For the same two-point measure and k(1,2)=i, all other entries zero,
  A_k has matrix entry i/2, its adjoint has entry −i/2 at (2,1), and
  both squared norms are 1/4, distinguishing adjoint from transpose.

### Examples

For C₃, normalized character pairings are 1 on the diagonal and
(1+ω+ω²)/3=0 off the diagonal. For SU(2), χ₀(1)=1 and χ₁(1)=2;
Weyl integration of 1 gives (1/(2π))·4·(π/2)=1. These are normalization
Checks of the supplied theory, not additional admitted theorems.

### Dependencies

The native finite-dimensional compact theory; the base roadmap's (CompactGroups)
“What is not consumable, and is a build item here” comparison targets; the
pinned Hom, equivalence and shrinking comparisons
(`ContRepresentation.intertwiningMapEquiv`,
`ContRepresentation.nonempty_equiv_iff`, `FDRep.ofShrink`,
`FDRep.ofShrinkEquiv`, `FDRep.character_ofShrink`); the pinned continuous tensor
and Hom carriers with their continuity and characters
(`ContRepresentation.tprod`, `ContRepresentation.continuous_tprod`,
`ContRepresentation.linHom`, `ContRepresentation.continuous_linHom`,
`ContRepresentation.character_linHom`, `ContRepresentation.character_trivial`);
Mathlib finite-dimensional tensors, duals, `FDRep` character identities and
topology, and complex Stone–Weierstrass, Fubini and Parseval; the pinned
Hilbert–Schmidt energy and norm and `TauCeti.convolutionOperator`; and
OperatorTheory/OperatorIdeals Part C.

## Layer 1: invariant Hermitian metrics

### 1.1 Gram operators and invariant forms

Fix a finite-dimensional unitary complex representation π with its given inner
product, conjugate-linear in the first variable. Represent every Hermitian form
h by the unique self-adjoint continuous linear Gram operator T with
`h(v,w)=⟪v,Tw⟫`. Prove the representation and uniqueness, and that positive
definiteness of h is equivalent to `re⟪v,Tv⟫>0` for every v≠0. Invariance
`h(π(g)v,π(g)w)=h(v,w)` is equivalent to `Tπ(g)=π(g)T` for every g.
Prove these comparisons and their transport under unitary intertwiners. The
map `v↦h(v,−)` into the complex linear dual is conjugate-linear; construct
the comparison by the stated Gram operators with that scalar convention.

- The Gram correspondence is real-linear on Hermitian forms and
  self-adjoint operators, with both inverse identities.
- Positive forms correspond exactly to strictly positive Gram operators.
- For a unitary action, invariant forms correspond exactly to commuting Gram
  operators, compatibly with transport by unitary intertwiners.

These comparisons are deductions from finite-dimensional Riesz representation
and nondegeneracy of the inner product, with the displayed scalar convention.

*Needs:* Mathlib finite-dimensional inner-product duality and adjoints;
native unitary actions for the invariance comparison.

**Checks.**

- On ℂ, T=2I gives h(1,i)=2i, while putting the scalar in the wrong
  conjugate-linear slot would give −2i.
- T=0 gives h(1,1)=0 and is not positive definite; T=2I gives 2>0.
- On trivial ℂ², diag(1,2) commutes with the action and gives
  h(e₁,e₁)=1, h(e₂,e₂)=2. For the action swapping the axes, this form
  is not invariant: h(πe₁,πe₁)=2≠1.

### 1.2 Scalar metrics on irreducibles

The signature `positive_selfIntertwiner_existsUnique_scalar` states the scalar
classification for any group and any finite-dimensional irreducible complex
`ContRepresentation`, with a self-adjoint, strictly positive self-intertwiner;
it requires neither compactness nor parameter continuity. It is a deduction
from Knapp, Corollary 4.9, p.240, and the native scalar Schur theorem. For irreducible π, apply scalar Schur to T. Self-adjointness
makes its scalar real and positivity makes it strictly positive. Prove that the
invariant positive Hermitian forms are exactly `c⟪−,−⟫` with a unique real c>0.
For two such forms, construct the identity-times-`1/√c` equivariant isometry
from the first metric to the second when `h₂=c h₁`, and prove both metric and
inverse identities. Consume the native
`ContRepresentation.exists_linearIsometryEquiv_congr_eq` theorem and
compare its normalization with this particular scalar map. For an initially
nonunitary representation, use native unitarization's Gram conjugacy to transport this
classification; no extra choice of an inner-product instance is implicit.

- The positive scalar is unique, since an irreducible space is nonzero.
- If h₂=c h₁, the specified map c^(-1/2)I is an equivariant isometry
  from the h₁ space to the h₂ space, with inverse c^(1/2)I.
- Gram conjugacy transports this classification to a nonunitary model
  equipped with its chosen unitarization.

*Needs:* §1.1; `ContRepresentation.exists_eq_smul_one_of_isIrreducible`;
native unitarization and unitary-intertwiner comparison for transport.

**Checks.**

- On irreducible ℂ, T=2I gives exactly c=2; c=1 fails on the vector 1.
- If h₂=4h₁, h₂(v/2,v/2)=h₁(v,v), and multiplication by 2 is the inverse.
- Trivial ℂ² with T=diag(1,2) is not scalar and fails irreducibility;
  on V=0 every scalar gives the same operator, also excluded by irreducibility.

### 1.3 Multiplicity-space metrics

The following multiplicity-space classification is a blockwise deduction from
Knapp, Proposition 4.8 and Corollary 4.9, p.240: the Hom space between inequivalent
irreducibles is zero and each diagonal irreducible Hom space is ℂ. For a supplied finite unitary decomposition `V≃⊕_i(S_i⊗ℂ^{m_i})`, with the S_i
pairwise inequivalent unitary irreducibles and m_i>0, construct the *-algebra
identification of the commuting operators with `∏_i Matrix (Fin m_i) (Fin m_i) ℂ`.
Pin it by `T|_(S_i⊗ℂ^{m_i})=id_(S_i)⊗A_i`. Prove addition, multiplication,
complex scalars, adjoints and both inverse-map identities; for units prove
compatibility with operator and matrix inversion. Invariant positive metrics
correspond exactly to positive-definite Hermitian A_i. Under a decomposition
change `d'=(⊕_i(id⊗U_i))d`, with each U_i unitary, so that `d'` reads the
new multiplicity coordinates `m'=U_i m` of a vector with old coordinates m,
prove `A_i'=U_i A_i U_i†` (since `h=m†A_i n=m'†U_i A_i U_i†n'`), and prove
compatibility with reindexing. For the trivial representation
on ℂ², the Gram operator diag(1,2) gives an invariant positive metric that is
not a scalar multiple of the standard one. Thus scalar uniqueness uses the
irreducibility hypothesis; repeated copies retain their full matrix freedom.

- The block map is a *-algebra isomorphism: it preserves sums, products,
  complex scalars, adjoints and units, and commutes with inversion on units.
- Its positive cone consists of positive-definite Hermitian blocks, and
  both inverse maps preserve positivity.
- Changing multiplicity bases by U_i sends A_i to U_i A_i U_i†;
  reindexing merely reindexes the blocks.

*Needs:* §1.1; native unitary complete reducibility and scalar Schur;
finite-dimensional tensor products and matrix adjoints. The chosen unitary
isotypic tensor decomposition and its comparison are constructed here.

**Checks.**

- For S⊕S, diag(1,2) in the multiplicity algebra gives two different
  metric scales; swapping copies changes it to diag(2,1), excluding a scalar-only commutant.
- For S⊕S with U=diag(1,i) and A=[[1,1],[1,2]], the new block is
  U A U†=[[1,−i],[i,2]]; the opposite conjugation U†AU gives [[1,i],[−i,2]].
  Both are positive-definite Hermitian with the same spectrum, so only this
  off-diagonal sign fixes the direction; the coordinate swap, being
  self-adjoint, cannot.
- In M₂(ℂ), E₁₂E₂₁=E₁₁ and E₂₁E₁₂=E₂₂; the block map preserves this
  order. Also E₁₂†=E₂₁, distinguishing adjoint from entrywise conjugation.
- On V=0 the index is empty and the product algebra has one element;
  the unique form is vacuously positive definite. For one copy of an
  irreducible the product is ℂ and its positive cone is the positive reals.

For finite discrete groups the unitarizing form is the pinned group average
`|G|⁻¹ Σ_g⟪π(g)v,π(g)w⟫`, by
`ContRepresentation.inner_gramOperator_eq_inv_mul_sum` and
`TauCeti.integral_haarProb`; it is cited, not proved here. The unnormalized
sum is |G| times that form, with |G|≥1.

### Examples

The C₃ average is one third of the unnormalized sum; for the trivial action both give h and 3h respectively.

### Dependencies

Native unitarization, unitary-intertwiner comparison
(`ContRepresentation.exists_linearIsometryEquiv_congr_eq`), complete
reducibility and scalar Schur; for finite groups,
`ContRepresentation.inner_gramOperator_eq_inv_mul_sum` and
`TauCeti.integral_haarProb`; finite-dimensional Hermitian linear algebra.

## Layer 2: G-finite vectors in Banach representations

### 2.1 G-finite vectors in Banach representations

For a compact Hausdorff topological group G, a complete complex normed space E
and a representation by continuous linear automorphisms, assume explicitly
that g↦π(g)v is continuous for every v. First define `IsGFinite` for a representation ρ of any group on a module over any
field k: the k-span of {ρ(g)v | g∈G} is finite dimensional. Construct
`gFiniteSubmodule`, the submodule of G-finite vectors of ρ, whose underlying
set is exactly {v | IsGFinite ρ v}; its closure under zero, addition and
scalars is proved from the orbit-span inclusions below, and no topology enters
this definition.

- The orbit span of v+w lies in the sum of the two orbit spans, so two G-finite
  vectors have G-finite sum; scalar multiplication preserves G-finiteness.
- For every g, ρ(g)v has the same orbit-span dimension as v, so this submodule
  is invariant under the action.
- An equivariant k-linear map sends the orbit span into the image of that span,
  hence maps the G-finite submodule into the G-finite submodule of its target.

AutomorphicFormsOnReductiveGroups §2.1 names the closure and equivariance
facts gFinite_add, gFinite_smul and gFinite_map; they are API of the
submodule here and are not separate acceptance statements.

Uniform boundedness on compact orbit maps gives a constant C_π≥1 with
‖π(g)‖≤C_π for all g, without operator-norm continuity; choosing C_π≥1 also
covers E=0. Use `ContRepresentation.integratedOperatorL1` from the supplier
contract with `Additive G` and Haar probability. Send a continuous weight f
into L¹ by `ContinuousMap.toLp` at exponent 1. Compare this class with the
integrable-function class in `ContRepresentation.integratedOperatorL1_toL1`;
its image acts by `T_f v=∫f(g)π(g)v dμ_G`. Consume the native norm bound and
covariance, whose additive argument −h+g becomes h⁻¹g. The native compact
approximate identities have mass 1, L¹ norm 1 and shrinking support, so
`ContRepresentation.tendsto_integratedOperatorL1_apply` applies.

Prove `gFiniteSubmodule_dense`, the density of the G-finite submodule as a
subset of E, by integrated representative functions. For a finite sum p of matrix
coefficients, left translates span a finite-dimensional space; covariance
makes T_p v G-finite. Given v and ε>0, retain an approximate-identity
kernel u with ‖T_u v−v‖<ε/2 and a representative function p with
C_π‖p−u‖₁‖v‖<ε/2, treating v=0 separately. Keep their actual
finite-orbit-span witnesses; these estimates prove density of the submodule. Prove the
naturality under bounded equivariant maps, by commuting such maps with the
Bochner integral, and uniform-on-compact-vector-sets convergence: for each
compact Q⊆E and ε>0, eventually ‖T_u v−v‖<ε for every v∈Q. Deduce this
from the native strong convergence, the uniform operator bound and a finite ε-net. Use nets for
arbitrary compact groups. The vector-valued Bochner integral and its
separable-compact-image measurability follow from continuity, compactness and Bochner integration;
no separability of the whole E is imposed.

The density theorem and the compact-set refinement are deductions from
`TauCeti.representativeStarSubalgebra_dense`, the integrated-action declarations
in the supplier contract and the displayed error estimates; no Banach density
statement is attributed to a source restricted to norm-continuous actions.
The proof order is the field-general orbit-span construction, native uniform
Peter–Weyl density, integrated representative functions, then Banach density.
AutomorphicFormsOnReductiveGroups §2.1 consumes this theorem for its complete
locally convex extension; no locally convex or smooth-vector result is a premise.


*Needs:* Native Haar probability, compact approximate identities,
`TauCeti.representativeStarSubalgebra_dense`,
`ContRepresentation.integratedOperatorL1`,
`ContRepresentation.norm_integratedOperatorL1_le`,
`ContRepresentation.comp_integratedOperatorL1` and
`ContRepresentation.tendsto_integratedOperatorL1_apply`; Mathlib Bochner
integration and uniform boundedness.

**Checks.**

- Zero has orbit-span dimension 0; a nonzero vector in any trivial representation has orbit-span dimension 1, including over 𝔽₂.
- For rotations on C(S¹), a nonzero Fourier monomial has orbit-span dimension 1; a sum of the distinct modes 0 and 1 has dimension 2.
- Every nonidentity rotation has operator distance 2 from identity on C(S¹), although each orbit map is continuous; trigonometric polynomials are dense.
- For the shift action of ℤ on ℓ²(ℤ), the point mass has infinitely many independent translates. This is outside the compact-group theorem.
- On the left regular action of S₃ with normalized Haar, the weight f equal to
  6 at t and 0 elsewhere gives T_f=π(t). For h=(12), t=(23), covariance gives π(ht) with
  ht=(123) (composing right to left); reversing the order gives (132), a different operator.
- For the trivial action, T_f v=(∫f)v. Kernels of mass 1 fix v, and kernels of mass 2 send v to 2v; the normalization cannot be dropped.

### Examples

For v=0 take the zero approximant. For v≠0 choose errors ε/2 and ε/(2C_π‖v‖), giving total error less than ε. C_π≥1 on a nonzero space because π(1)=I.

### Dependencies

Native Haar integration, the L¹ integrated action (`ContRepresentation.integratedOperatorL1` and its bound, covariance and convergence), approximate identities and uniform Peter–Weyl density; Mathlib Bochner integration and uniform boundedness.

## Layer 3: countability and metrizability

### 3.1 countability and metrizability

For compact Hausdorff G prove the equivalence of: G is second countable; G is
metrizable; the native complex unitary dual `TauCeti.IrrepClass ℂ G` is countable;
and `Lp ℂ 2 (haarProb G)` is separable. These are consequences of the native Peter–Weyl theorem, with
no countability hypothesis in its general Peter–Weyl theorem. Prove invariance
under topological group isomorphism and transport to every irreducible skeleton.

In the second-countable case, compact metrizability makes C(G,ℂ) separable;
its dense map into L² makes L² separable. The Peter–Weyl Hilbert basis then
has countable index. Each irreducible has positive finite dimension, so this
index is countable exactly when the unitary dual is countable. In the reverse
direction, countably many irreducible models give the continuous homomorphism
`g↦(π(g))_π` into a countable product of finite-dimensional unitary groups.
Prove injectivity using the native Peter–Weyl theorem's point-separating matrix coefficients. Compactness
and the Hausdorff target make this a topological embedding; the product is
metrizable. Consume the existing countable-product and compact metrization APIs,
and apply BanachSpaceTheory B5's Hilbert-basis criterion: a complete complex
inner-product space with a Hilbert basis indexed by I is separable iff I is
countable. Applied to the Peter–Weyl index of triples (π,i,j), it gives exactly
the separability-to-dual-countability step above.
Use `Summable.countable_support_ennreal` for the support of each expansion. The metrization criterion
is downstream of general Peter–Weyl.

For every index type J, let G_J=∏_(j∈J) Circle with its product topology and
normalized Haar measure, taken on the Borel sigma algebra of the full product
topology, including for uncountable J. Construct the continuous one-dimensional characters
χ_j(z)=z_j, prove they are pairwise distinct, and prove their complex-valued
L² classes form an orthonormal family. For j≠k compute
`∫ conj(χ_j)χ_k=0` by Haar translation in one coordinate, and hence
`‖χ_j−χ_k‖₂=√2`. Thus uncountable J gives an uncountable unitary dual,
nonseparable L² and a nonmetrizable compact group. For countable J the product
is metrizable and all four conditions hold, including the empty product.
For every G and every individual L² vector, prove that only countably many
Peter–Weyl coefficients, and hence isotypic blocks, are nonzero, using the
finite sum of squared norms. This per-vector statement holds even when the
whole dual is uncountable.

The signatures are `secondCountable_iff_countable_irrepClass` and
`separable_L2_iff_countable_irrepClass`; the circle-product statement is their
instance at `G_J` and is not a separate signature.
The four-way criterion is a deduction from the native Peter–Weyl basis and the
preceding metric argument. Etingof §37.1, p.199, and Theorem 37.5, p.202,
cover the countable-base setting only.


*Needs:* Native Peter–Weyl basis and separation; BanachSpaceTheory B5; Mathlib compact metrization, countable products and Summable.countable_support_ennreal.

**Checks.**

- The zero Hilbert space has empty basis index and is separable; ℓ²(ℕ) has countable basis and is separable.
- In ℓ²(J), two distinct coordinate vectors have squared distance 2. Uncountable J therefore gives a nonseparable space.
- The empty circle product is a one-point group with one character and one-dimensional Haar L²; for J=ℕ the dual is countable.
- For the empty product the Borel sigma algebra is {∅,G}; on Circle² each open arc cylinder is measurable; on uncountable Circle^J the complement of the identity tuple is open and Borel, but is not in the coordinate cylinder sigma algebra because it depends on every coordinate.
- For uncountable J, χ_j and χ_k have pairing 0 for j≠k and squared distance 2; any single χ_j has support of size 1 in the Fourier expansion.

### Examples

The uncountable product has nonseparable L², yet each individual L² expansion has countably many nonzero coefficients; finite total squared norm excludes uncountably many positive terms.

### Dependencies

Native Peter–Weyl basis and separation; BanachSpaceTheory B5; Mathlib compact metrization, countable products and Summable.countable_support_ennreal.

## Layer 4: characters of arbitrary products

### 4.1 characters of arbitrary products

For an arbitrary family of compact Hausdorff abelian groups G_i, use the
product topology on G=∏_i G_i and native `PontryaginDual` with its compact-open
topology. Construct the canonical topological group isomorphism

`Multiplicative (⨁ i, Additive (PontryaginDual G_i)) ≃ₜ* PontryaginDual G`.

The direct sum has the **discrete** topology. It is not given the subspace
topology from the product of the coordinate duals. On a finitely supported
family (χ_i), the forward map sends x to `∏_i χ_i(x_i)`; the inverse restricts
χ along the continuous coordinate inclusions `ι_i:G_i→G`, which are identity
in all other coordinates. Prove these restrictions have finite support and
both maps are inverse homomorphisms. The maps have the following API.

- Restriction to coordinate j sends a finite product to its j-th character,
  including the trivial character at every coordinate outside the support.
- Applying the reconstructed character to x gives exactly the product of its
  coordinate evaluations, proving both inverse-map identities and uniqueness.
- Index equivalences reindex these evaluations; pullback along a family of
  continuous homomorphisms composes each character and cannot enlarge support.


Own the finite-coordinate lemma first for arbitrary families of topological
groups, without compactness or commutativity assumptions on the factors.
Continuity of χ at 1 gives a basic identity cylinder restricting only finitely
many coordinates and mapped into `Circle.centeredArc (π/2)`. The subgroup
whose restricted coordinates are 1 lies in that cylinder. All positive powers
of each of its elements still lie there; use native
`Circle.eq_one_of_forall_pow_mem_centeredArc_pi_div_two` to show χ is 1 on
this tail subgroup. Decompose x into its finitely supported coordinate part
and a tail element. This proves the finite product formula and the exact
support characterization, with no countability or sequential argument.
Conversely finite products of coordinate characters are continuous. For
compact factors, consume Mathlib's existing discreteness instance for the
Pontryagin dual of a compact group; the product is compact by Tychonoff.
The algebraic isomorphism is therefore a topological one. This elementary
construction precedes its Peter–Weyl applications and requires no general
Pontryagin biduality theorem.

For G=Circle^J deduce that every character has a unique finite integer
multi-index n and is `z↦∏_j z_j^(n_j)`, giving the discrete dual
`Multiplicative (J →₀ ℤ)`. Consume native
`TauCeti.fourierPontryaginDualEquiv` and `AddCircle.homeomorphCircle` at period
2π for the single-circle computation. This input is independent of the product
theorem. Include the empty index type and negative exponents.
For J=ℕ, the coordinate-restriction tuples of the characters χ_n(z)=z_n
converge coordinatewise to the all-trivial tuple in the product of the discrete
coordinate duals. The characters do not converge to 1 in the compact-open dual
of Circle^ℕ, which is discrete. They also do not converge pointwise to 1 on Circle^ℕ:
evaluate them on the constant tuple −1. Prove these topology distinctions.

This is Conway, *A Course in Functional Analysis*, second edition, VII.9,
Exercise 11, with the maps and topologies fixed explicitly.
The signatures `character_finite_coordinates`, `exists_productDualEquiv` and
`circleProduct_character` pin the finite-coordinate factorization and evaluation maps.

*Needs:* Mathlib PontryaginDual, the small-arc power lemma, direct sums and Tychonoff; Tau Ceti single-circle dual.

**Checks.**

- The empty product has one character, corresponding to the zero direct sum; both evaluations are 1.
- On Circle², exponents (1,−1) at (i,−1) give i·(−1)⁻¹=−i; restriction recovers the two exponents.
- For S₃×C₃, the product of the sign character and the standard C₃ character takes value −ω at a transposition and a generator. The finite-coordinate lemma does not require commutative factors.
- On Circle^ℕ, coordinate characters restrict to 1 eventually at each fixed coordinate, but evaluate to −1 at the constant tuple −1 and stay nontrivial in the discrete compact-open dual.

### Examples

Finite support gives continuous products even for an uncountable index. Giving that direct sum the product-subspace topology would make coordinate characters converge, contradicting discreteness.

### Dependencies

Mathlib PontryaginDual, the small-arc power lemma, direct sums and Tychonoff; Tau Ceti single-circle dual.

## Layer 5: compact abelian Fourier theory

### 5.1 compact abelian Fourier theory

For every compact Hausdorff abelian group G, identify the native unitary dual
`TauCeti.IrrepClass ℂ G` with `PontryaginDual G`. Apply Mathlib's
`Representation.IsIrreducible.finrank_eq_one_of_isMulCommutative` to the
underlying finite-dimensional complex irreducible representation to obtain
dimension 1. Its unitary scalar action is a continuous circle-valued character,
independent of the unit vector used to read it. Conversely a continuous
circle character acts on ℂ by scalar multiplication and is irreducible.
Prove these constructions inverse on unitary-equivalence classes, with the
scalar-action formula on each native irreducible model.

For χ in `PontryaginDual G`, define `compactCharacter` as the continuous function c_χ given by g↦(χ(g):ℂ).
Identify the representative-function star-algebra with the finite complex
linear span of the c_χ. Its API is:

- Pointwise multiplication gives c_χ c_ψ=c_(χψ).
- Complex conjugation sends c_χ to c_(χ⁻¹).
- The trivial character gives the constant 1; evaluation at g agrees with χ(g).

Deduce point separation and uniform density
from the native Peter–Weyl theorem. This is the compact abelian specialization
of that construction; it uses neither the general LCA Fourier-inversion
engine nor Pontryagin biduality.

Construct
a Hilbert basis b of Haar L² indexed by `PontryaginDual G`
with the exact equation
`b χ = ContinuousMap.toLp 2 (TauCeti.haarProb G) ℂ c_χ`.
The normalized Haar measure makes these vectors have norm 1. Fix the
comparison with the native Peter–Weyl basis explicitly: its coefficient
`g↦⟪π(g)v,w⟫` is conjugate-linear in π(g)v, so the character vector c_χ
corresponds to the one-dimensional scalar representation χ⁻¹, not χ.
Reindex the standard basis using that inverse-character correspondence
and the unique row/column indices. Prove orthonormality, completeness and
agreement with the displayed continuous representatives under this reindexing.

For f in Haar L², identify the basis coordinate with
`f̂(χ)=∫_G conj(χ(g)) f(g) d(haarProb G)`; prove integrability and
independence of the a.e. representative. Obtain Parseval
`Σ_χ |f̂(χ)|²=‖f‖₂²` and the unconditional L² expansion
`f=Σ_χ f̂(χ) c_χ` from this same Hilbert basis. No pointwise or uniform
convergence of the Fourier expansion is asserted. Transport Layer 3 through
the irreducible-class/character bijection to obtain
`MetrizableSpace G ↔ Countable (PontryaginDual G)`, with its second-countable
and separable-L² equivalents. Include the trivial group and arbitrary
uncountable duals; every individual expansion has countable support.

These are Conway VII.9, Exercises 8–10. The headline signatures are
`exists_irrepClass_characterEquiv`, `compactCharacter_span_dense` and
`exists_characterBasis`; the first identifies the scalar action and the last
identifies each individual basis vector.


*Needs:* Native Peter–Weyl; Layers 3–4;
Mathlib `Representation.IsIrreducible.finrank_eq_one_of_isMulCommutative`,
HilbertBasis and continuous character operations.

**Checks.**

- For the trivial group there is one character with value 1; its L² norm is 1 and it spans the one-dimensional space.
- A C₃ character on ℂ has dimension 1. The zero representation has dimension
  0 and is not irreducible; trivial ℂ² has dimension 2 and an invariant line,
  so neither is an input to the dimension-one theorem.
- At i on Circle, the scalar action χ has coefficient −i and Fourier vector i. Inverting the character in the coefficient index gives i.
- On C₃, χ and χ² are distinct and have pairing (1+ω+ω²)/3=0; each diagonal pairing is 1.
- For f=c_χ+2c_ψ with χ≠ψ, its two Fourier coordinates are 1 and 2 and both sides of Parseval are 5; zero has empty support and norm 0.

### Examples

On any circle product the Fourier index is a finitely supported integer family. Expansion is in L² and does not assert pointwise convergence.

### Dependencies

Native Peter–Weyl; Layers 3–4;
Mathlib `Representation.IsIrreducible.finrank_eq_one_of_isMulCommutative`,
HilbertBasis and continuous character operations.

## Layer 6: global forms and formal characters

The preceding analytic results hold for all compact Hausdorff groups. This layer assumes K is a compact **connected finite-dimensional real Lie**
group, T a maximal torus of K (`TauCeti.Lie.IsMaximalTorus`) and `W=N_K(T)/T`,
finite by `TauCeti.Lie.IsMaximalTorus.finite_normalizerQuotient`. Representations are
finite-dimensional continuous complex representations, with continuity of the
parameter map explicit as in the standing conventions. Use [LieGroups Layer 2](../LieGroups/README.md#layer-2-the-closed-subgroup-cartan-theorem)
for automatic smoothness and Layers 3–4 for differentiation and integration. The
compact structure theory is LieGroups Layer 5A, the compact real roots of its
Layer 6 and the compact semisimple integration of its Layer 7; the period
dictionary is SymplecticGeometry/ConvexityToric T1. The semisimple highest-weight
modules, their one-dimensional top lines and the orbit-sum expansion of their
formal characters are the pinned declarations `TauCeti.irreducibleQuotient`,
`TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`
and `TauCeti.formalCharacter_eq_orbitSum_add_lower`. Neither the
Weyl character formula nor its Haar/Fourier applications is a premise. No
Borel–Weil, flag cohomology, generic algebraic-group classification, HC isomorphism
or Grothendieck ring of representations is an input.

### 6.1 Torus weight spaces and formal characters

Let `X=Additive (PontryaginDual T)` be the actual character group (native
`PontryaginDual`, whose carrier is `ContinuousMonoidHom T Circle`), not the full
real dual Lie algebra and not an automatically simply connected weight lattice.
For a finite-dimensional continuous complex representation V of T, define the
χ-weight space by π(t)v=χ(t)v for every t∈T, and prove from the commuting
unitaries of a unitarization that the nonzero weight spaces are finitely many
and form an internal direct sum equal to V. Define the formal character of V as
the element `Σ_χ dim(V_χ)·e^χ` of `AddMonoidAlgebra ℤ X`, written ℤ[X]. Prove
that it is additive on direct sums, multiplicative on tensor products, sends the
dual to the image under `e^χ ↦ e^(−χ)`, and determines V up to equivalence; and
that every element of ℤ[X] with nonnegative coefficients is the formal character
of a representation, namely of the direct sum of the characters with those
multiplicities. Prove the trace formula `tr π(t)=Σ_χ dim(V_χ)·χ(t)` and the
uniqueness of its coefficients by the orthogonality of characters of Layer 5.

- The distinct nonzero weight spaces form a finite internal direct sum equal to
  the whole module; an irreducible representation of T is one weight space of
  dimension 1.
- The formal character is additive, multiplicative on tensor products and
  compatible with duals; equal formal characters give equivalent representations.
- The trace is the sum of the characters with their weight-space dimensions, and
  these dimensions are determined by the trace through Fourier orthogonality.

*Needs:* Layer 5's character classification and orthogonality; native
unitarization; Mathlib `AddMonoidAlgebra`; §0.1's tensor and dual comparisons.

**Checks.**

- On Circle, z↦z⁻¹ has a one-dimensional weight −1, not +1;
  at z=i its trace is −i.
- The trivial action on ℂ² has weight 0 of multiplicity 2, formal character
  `2e⁰` and trace 2; the zero module has no nonzero weight space, formal
  character 0 and trace 0.
- On Circle write t for `e^χ` with χ(z)=z. Then `t·t⁻¹=1` is the formal character
  of the tensor product of the standard character with its dual; at z=i the two
  traces are i and −i, with product 1, excluding a duality that fixes t.
- The element `−e⁰` has a negative coefficient and is the formal character of no
  representation, unlike `e⁰`, the formal character of trivial ℂ.

### 6.2 Characters and the period lattice

The character group X of T is free of finite rank `r = dim T`: the pinned
`TauCeti.Lie.IsTorus.nonempty_continuousMulEquiv_pi_circle` identifies T with a
product of r circles, and `circleProduct_character` of §4.1 identifies the
characters of that product with integer r-tuples. The 2π-normalized period and
weight dictionary of T is ConvexityToric T1 and is not proved again here; this
subsection fixes the notation in which Layer 6 reads it. For χ∈X write
`ℓ_χ = (1/i)dχ`, a real linear functional on the Lie algebra 𝔱 of T, so that
`χ(exp X)=exp(i ℓ_χ(X))`; ConvexityToric T1 states that χ ↦ ℓ_χ identifies X with
the functionals taking values in 2πℤ on `ker exp_T`. Write λ_χ for the
complex-linear extension of the differential `i·ℓ_χ` to 𝔱 ⊗ ℂ. The condition
`ℓ_χ(ker exp_T)⊆2πℤ` reads `λ_χ(H) ∈ 2πiℤ` whenever `exp H = 1`, which is the
analytic integrality of λ_χ in Knapp's terminology (Knapp, Proposition 4.58,
pp.264–265), so χ ↦ λ_χ is an injective group homomorphism from X onto the
analytically integral forms.

- The differential of χ is `i·ℓ_χ`, imaginary-valued on 𝔱; λ_χ is real-valued on i𝔱.
- χ ↦ ℓ_χ and χ ↦ λ_χ are additive, and tensoring adds and dualizing negates them.
- A real functional ℓ on 𝔱 is ℓ_χ for some χ iff `ℓ(ker exp_T)⊆2πℤ`, by
  ConvexityToric T1.

*Needs:* §6.1; §4.1's `circleProduct_character`; Tau Ceti
`TauCeti.Lie.IsTorus.nonempty_continuousMulEquiv_pi_circle`; ConvexityToric T1's
period and weight dictionary; LieGroups Layer 0 for the exponential.

**Checks.**

- On Circle with `exp θ = e^(iθ)` and χ(z)=zⁿ, `ℓ_χ(θ)=nθ`, the kernel of exp is
  2πℤ and `ℓ_χ(2π)=2πn`, in 2πℤ, in agreement with the integer
  `α_χ(λ)/(2π)` of ConvexityToric T1.
- The functional 1/2 gives exp(iπ)=−1 at the period 2π and is not ℓ_χ for a
  circle character.
- For χ(z)=z⁻¹ and θ=π/2, `χ(exp θ)=exp(−iπ/2)=−i`; taking ℓ_χ itself as the
  differential, without the factor i, would give the positive real `exp(−π/2)`.
- For the trivial torus r=0 and X=0; for `Circle²` the character `z₁z₂⁻¹` has
  the tuple (1,−1) and value `i·(−1)⁻¹=−i` at (i,−1).

### 6.3 Real complexification and opposite weights

For a real finite-dimensional continuous T-module, use its scalar extension
ℂ⊗ℝV. Use `TauCeti.Hodge.complexificationConjugation` and
`LinearMap.map_eigenspace_baseChange` to restrict the existing conjugation
to the simultaneous torus weight spaces, giving a conjugate-linear map
on its complexification sending the χ-weight space bijectively to the
χ⁻¹-weight space, with its involution and dimension equations. This
proves opposite multiplicities without assuming semisimple root theory; the
compact adjoint application uses the zero-weight space 𝔱 ⊗ ℂ identified by
LieGroups Layer 6 (compact real roots). This is a deduction from the real scalar extension formula
`c(z⊗v)=conj(z)⊗v` and |χ(t)|=1.

- The restriction has the inherited laws c(zv)=conj(z)c(v) and c²=id;
  it intertwines the complexified real group action.
- It restricts to inverse semilinear bijections between the χ and χ⁻¹
  weight spaces, so their complex dimensions agree.
- On the zero-weight space it is a real structure, with fixed space equal
  to the original real invariant vectors.

*Needs:* §6.1's weight spaces; Mathlib scalar extension;
`TauCeti.Hodge.complexificationConjugation` and
`LinearMap.map_eigenspace_baseChange`.
The adjoint specialization additionally needs LieGroups Layer 6 (compact real roots).

**Checks.**

- For the real rotation plane let v=e₁−i e₂. Its weight is +1 and
  c(v)=e₁+i e₂ has weight −1; both spaces have complex dimension 1.
- c(iv)=−i c(v), whereas a complex-linear map would give +i c(v);
  these differ since v≠0.
- c(c(v))=v. On the trivial real line c(1)=1 and c(i)=−i; its weight
  0 is fixed as a label, but conjugation is not the identity on its whole complexification.

### 6.4 The left Weyl action

Pin the left Weyl action by `(w·χ)(t)=χ(n⁻¹tn)` for n representing w;
it is independent of the representative modulo T. On the integral group
algebra send `e^χ` to `e^(w·χ)`, with fixed subring `ℤ[X]^W`.

This is the action induced by conjugation of T by its normalizer, on the
normalizer quotient whose finiteness is the pinned
`TauCeti.Lie.IsMaximalTorus.finite_normalizerQuotient`; LieGroups Layer 6
identifies it with the Weyl group of the root system.

- Changing n by an element of T leaves the character unchanged because T
  is abelian; hence the action factors through W.
- The identity fixes every character and (w₁w₂)·χ=w₁·(w₂·χ), with this order.
- The induced action on ℤ[X] preserves products and 1; the fixed elements
  form a subring and have a ℤ-basis of distinct-weight orbit sums.

*Needs:* §6.1's actual characters; Tau Ceti `TauCeti.Lie.IsMaximalTorus` and
`TauCeti.Lie.IsMaximalTorus.finite_normalizerQuotient`; Mathlib `AddMonoidAlgebra`.

**Checks.**

- For the identity normalizer element, 1·χ=χ and e⁰ stays 1.
- For SU(3), with s₁=(12), s₂=(23) realized by the permutation matrices of
  the Conventions (`n_σ e_j = e_{σ(j)}`, composition right to left, each
  multiplied by `diag(−1,1,1)`, which is diagonal and so commutes with T, to
  have determinant 1), `n_σ⁻¹ t n_σ` is
  `diag(t_{σ(1)}, t_{σ(2)}, t_{σ(3)})`, so `σ·e_i = e_{σ(i)}`: the coordinate
  character e₁ satisfies (s₁s₂)·e₁=e₂ but (s₂s₁)·e₁=e₃. Reversed
  multiplication would exchange these values, and the realization
  `n_σ e_j = e_{σ⁻¹(j)}` would give (s₁s₂)·e₁=e₃ instead.
- The SU(3) wall weight (1,1,0) is fixed by s₁; its orbit has three
  distinct weights, so its orbit sum has three terms rather than six.

### 6.5 The finite central cover and the dominance comparison

Write 𝔨 for the Lie algebra of K, 𝔷 for its center, 𝔨_der for its derived
algebra, 𝔱 for the Lie algebra of T, 𝔱' = 𝔱 ∩ 𝔨_der, `𝔤' = 𝔨_der ⊗ ℂ` and
`𝔥 = 𝔱' ⊗ ℂ`. The following are supplied and are not targets here. LieGroups
Layer 5A: `𝔨 = 𝔷 ⊕ 𝔨_der`, with 𝔨_der semisimple and its Killing form negative
definite. LieGroups Layer 6 (compact real roots and the Weyl comparison):
`𝔱 = 𝔷 ⊕ 𝔱'` (its `t_ss` is 𝔱'), 𝔥 is a Cartan subalgebra of the complex
semisimple Lie algebra 𝔤', the nonzero weights of T on 𝔨 ⊗ ℂ are root characters
ξ_α (its `χ_α`) with one-dimensional root spaces and `dξ_α = iα_ℝ` for its real
root α_ℝ, the roots vanish on 𝔷, and the resulting root system with its coroots
and Weyl group is `LieAlgebra.IsKilling.rootSystem` of (𝔤', 𝔥). From here on α
denotes the complex root attached to ξ_α, as in Knapp: in the notation of §6.2
it is `λ_(ξ_α)`, equal to `iα_ℝ` on 𝔱', and its coroot in 𝔥 is
`H_α = −i·α_ℝ∨` for the real coroot α_ℝ∨ ∈ 𝔱' of LieGroups Layer 6, since
`(iα_ℝ)(−iα_ℝ∨) = α_ℝ(α_ℝ∨) = 2`. LieGroups Layer 7 (compact semisimple integration):
the simply connected cover of a compact connected semisimple Lie group is
compact and its covering kernel is finite. ConvexityToric T1: `ℓ_χ(α_ℝ∨) ∈ ℤ` for
every χ∈X and every root α, and the finite-index comparison of the period
lattices under a central isogeny, with the real coroots lying in the
2π-normalized period lattice.

The targets of this subsection are the following.

- For every simply connected compact connected semisimple Lie group S with
  maximal torus T_S, prove `Y = Q∨`, where `Y = (2π)⁻¹ ker exp_(T_S)` and Q∨
  is the integer span of the real coroots. One route integrates each fundamental
  highest-weight module of the complexified Lie algebra to S using LieGroups
  Layer 4. Its top line is stable under the torus: its Cartan stability gives
  stability under exponentials, and the torus exponential is surjective.
  Restriction to that line is a continuous circle character, whose differential
  is the fundamental weight; compactness makes its scalar values unitary.
  By ConvexityToric T1 its real functional takes integer values on Y.
  Under λ ↦ (1/i)λ|_(Lie T_S), these weights are dual to the simple
  real coroot basis, so every
  y∈Y has integer coordinates in that basis and lies in Q∨. The reverse
  inclusion follows from the coroot periods `exp(2πα_ℝ∨)=1` of T1.
  This proves the equality without using the compact-group classification
  of §6.6 (Knapp, Theorem 5.107 and its proof, p.334).
- Prove that the connected Lie subgroup K_der of K with Lie algebra 𝔨_der is
  closed, and that multiplication `Z(K)^0 × K_der → K` is a surjective
  homomorphism of commuting factors (Knapp, Theorem 4.29, pp.250–251). K_der is
  then a compact connected semisimple Lie group; write `p : K_der,sc → K_der` for
  its simply connected cover, compact with finite kernel by LieGroups Layer 7.
- Construct the smooth covering homomorphism q:Z(K)^0×K_der,sc→K,
  q(z,s)=z·p(s), with finite central kernel F, its quotient topology and
  derivative isomorphism. Let T_sc be the maximal torus of K_der,sc with Lie
  algebra 𝔱'. Prove that q maps the covering torus `Z(K)^0 × T_sc` onto T with
  kernel F, so that pullback is an injection X*(T)→X*(Z(K)^0)⊕X*(T_sc) whose
  image consists precisely of the characters trivial on F; the descent
  argument is Knapp, proof of Theorem 5.110, pp.335–336.
- The dominance comparison. Fix a base b of the root system of (𝔤', 𝔥). For
  χ∈X the restriction of λ_χ to 𝔥 has the value
  `λ_χ(H_α) = (i·ℓ_χ)(−i·α_ℝ∨) = ℓ_χ(α_ℝ∨)` on each coroot, an integer by
  ConvexityToric T1, so it lies in
  `TauCeti.integralWeightLattice`. Prove that χ is dominant in Knapp's sense
  (`⟨λ_χ,α⟩ ≥ 0` for every positive root α, for the negative of the invariant
  form; Knapp, p.335) iff the restriction of λ_χ to 𝔥 satisfies
  `TauCeti.IsDominantIntegral` for b, using `λ_χ(H_α) = 2⟨λ_χ,α⟩/|α|²`, the form
  in which Knapp states integrality (Proposition 4.59, p.265). Dominance depends only on 𝔱'.

Read on lattices, these targets and the period dictionary give the following
comparisons. For K_der,sc the map χ ↦ λ_χ restricted to 𝔥 is a bijection from
X*(T_sc) onto the weight lattice P_der of (𝔤', 𝔥): by ConvexityToric T1 the
character lattice is the integral dual of the cocharacter lattice, which is Q∨ by
the preceding simply connected target, and the integral dual of Q∨ is P_der (the statement
of Knapp, Theorem 5.107, p.334). Under a finite covering of compact connected
groups the character lattice of the quotient has index the kernel order in that
of the cover, by ConvexityToric T1 (the statement of Knapp, Proposition 4.67,
p.267); for q this is the condition of triviality on F.

Do not treat the covering factors as direct factors of K. Dominance is imposed
only on the derived coordinate; the zero-root case retains the full central
character. The pullback and descent APIs preserve addition, tensor products,
duals and intertwiners, and their composites are identity.

- The cover q maps (z,s) to z·p(s), has finite central kernel, and
  induces an isomorphism of the quotient by that kernel with K.
- Its derivative identifies the center and derived summands with the Lie
  algebra of K; restriction to the covering torus is onto T.
- Pullback identifies X*(T) with the characters of the covering torus
  trivial on F; it preserves addition and inversion and detects equality.
- χ is dominant for the positive system of b iff the restriction of λ_χ to 𝔥
  is dominant integral for b; dominance is read on 𝔱' alone.

*Needs:* LieGroups Layers 0 and 4–5 for the exponential, integration and
covering groups; LieGroups Layer 5A, Layer 6 (maximal tori; compact real roots
and the Weyl comparison) and Layer 7 (compact semisimple integration);
ConvexityToric T1; §6.2's notation; Mathlib
`LieAlgebra.IsKilling.rootSystem`, `RootPairing.Base.toCoweightBasis` and
`Module.Basis.dualBasis_apply_self`; Tau Ceti `TauCeti.integralWeightLattice`,
`TauCeti.IsDominantIntegral`, `TauCeti.irreducibleQuotient` and
`TauCeti.finiteDimensional_irreducibleQuotient_of_isDominantIntegral`.

**Checks.**

- For SU(2), put H_R=diag(i,−i). Then exp(2πH_R)=I and
  exp(πH_R)=−I, so Y=ℤH_R=Q∨. The fundamental character pairs to 1
  with H_R and to 1/2 with H_R/2, excluding the larger lattice.
  In SO(3), exp(πH_R)=1 under the covering Lie-algebra identification,
  so Y=(1/2)ℤH_R strictly contains Q∨=ℤH_R; the fundamental SU(2)
  character does not descend. Simply connectedness is essential.
- For the trivial semisimple group, the torus has dimension 0 and
  Y=Q∨=0; there are no fundamental weights and both inclusions hold.
- For Circle, the center/derived Lie dimensions are 1+0=1 and q is
  Circle×{1}→Circle with kernel of size 1; the semisimple cover is {1}, not ℝ.
- For SO(3), the simply connected derived cover is SU(2) and q has
  kernel {±I}, of size 2; its derivative is an isomorphism in dimension 3.
- For U(2), q(z,A)=zA has kernel {(1,I),(−1,−I)} and Lie dimensions
  1+3=4. A pair (q,a) of central exponent and SU(2) weight is trivial on
  this kernel iff (−1)^(q−a)=1, so (1,1) descends and (0,1) does not.
- For SU(2), 𝔰𝔲(2) ⊗ ℂ = 𝔰𝔩₂(ℂ) and 𝔥 = ℂ·H with H = diag(1,−1). The
  roots are ±α with α(diag(iθ,−iθ)) = 2iθ, imaginary on 𝔱, and α(H) = 2,
  real on i𝔱; using ℓ_χ in place of i·ℓ_χ would make the roots real on 𝔱,
  contradicting `dξ_α = iα_ℝ`. Here α_ℝ∨ = diag(i,−i) and `H = −i·α_ℝ∨`. The character z ↦ zⁿ has λ(diag(iθ,−iθ)) = inθ and
  λ(H) = n = ⟨λ,α^∨⟩, is dominant iff n ≥ 0, and is then the highest
  weight of Symⁿ. The functional with λ(H) = 1/2 has value iπ on
  diag(2πi,−2πi), whose exponential is I, so it is neither analytically
  integral nor a weight.
- For U(2), 𝔲(2) = iℝ·I ⊕ 𝔰𝔲(2) and 𝔲(2) ⊗ ℂ = 𝔤𝔩₂(ℂ) is reductive but
  not semisimple, its Killing form vanishing on I; the root system is that of
  𝔰𝔩₂(ℂ) only and the central line carries no root. The character
  t₁ᵃt₂ᵇ has derived coordinate λ(H) = a−b and central coordinate a+b, so
  the pair (q,a') of the preceding Check is (a+b, a−b) with q−a' = 2b even;
  (1,1) is (a,b) = (1,0) and (0,1) is realized by no integer pair.
- For a torus K = T = Circle^r the derived algebra is 0, the root system is
  empty, every character is dominant, and χ ↦ λ_χ identifies X = ℤ^r with
  the forms taking 2πiℤ-values on the kernel (2πi ℤ)^r of exp; the functional
  with λ(2πi e₁) = πi is excluded. For SO(3) the analytically integral forms
  have index 2 in those of SU(2), namely even λ(H), matching the first Check
  of §6.6.

### 6.6 Highest-weight representations and descent

For each dominant element χ of X, take the irreducible highest-weight module
`TauCeti.irreducibleQuotient` for the pair (𝔤', 𝔥) and the base b of §6.5 with
highest weight the restriction of λ_χ to 𝔥, finite-dimensional by
`TauCeti.finiteDimensional_irreducibleQuotient_of_isDominantIntegral` and §6.5's
dominance comparison, restrict it to 𝔨_der, integrate it to K_der,sc by LieGroups Layer 4,
and use the specified central-torus character of χ. The
covering-product action is the actual map
`(z,s)↦χ(z)·ρ_λ(s)`. Compute its restriction to F; the actual X condition
makes it the identity. Descend through q, proving continuity and smoothness from
the quotient/local-cover charts, not an unproved abstract representation of K.
(Knapp, Theorem 5.110, pp.335–336.) Construct and prove the descent on intertwiners, tensor and dual maps, unique
factorization and the top weight line. Prove irreducibility and uniqueness by
the derivative/connected-group stable-subspace dictionary. Conversely pull
back an irreducible K-module, use Schur for the central torus, and restrict to
the semisimple derived factor, whose derived module over 𝔤' has a unique
dominant integral highest weight by
`TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`. There is exactly one dominant χ ∈ X whose
restriction to Z(K)^0 is the scalar central character of this representation
and whose differential λ_χ restricted to 𝔥 is its derived highest weight.
For existence, the derived top weight line is preserved by the covering torus:
its character is the product of that scalar central character and the derived
highest-weight character. It is trivial on F because the pulled-back action
factors through K, so §6.5 descends it to a character of T. For uniqueness,
the two conditions determine its pullback to the covering torus, and pullback
along the surjection onto T is injective. This uses both summands of the
highest weight (Knapp, proof of Theorem 5.110, p.336).
State all differentiability,
Lie-to-group invariant-subspace and intertwiner comparisons at this cut.
A Lie-algebra central functional can be arbitrary; it integrates only when the
actual periods and the finite kernel conditions hold.

- Pullback along q and descent of an action trivial on F are inverse on
  representations and their equivariant linear maps.
- The descended top weight is the specified element of X; dominant elements
  classify irreducibles up to equivalence, including the central character.
- Descent preserves direct sums, tensor products and duals. A subspace is
  invariant under a connected group iff it is invariant under its differential;
  the analogous equivalence holds for intertwiners.

*Needs:* §§6.2 and 6.5; Tau Ceti `TauCeti.irreducibleQuotient`,
`TauCeti.finiteDimensional_irreducibleQuotient_of_isDominantIntegral` and
`TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`;
LieGroups Layer 6 (compact real roots) for their hypotheses on (𝔤', 𝔥);
LieGroups Layers 0, 2–4 for exponentials, automatic smoothness,
differentiation and integration; native scalar Schur.

**Checks.**

- SU(2) weights 1 and 2 have −I eigenvalues −1 and +1; only weight 2
  descends through SU(2)→SO(3). Merely having an integral Lie weight is insufficient.
- For a circle, every integer n gives z↦z^n; n=−1 gives −i at i,
  retaining inverse central characters even when the root system is empty.
- On K=T=Circle the derived Cartan is 0. The dominant characters χ₀(z)=1
  and χ₁(z)=z both restrict differentially to 0 there, but at i their values
  are 1 and i. Fixing the central character to 1 selects χ₀; fixing it to z
  selects χ₁, so the derived highest weight alone cannot specify a lift.
- For U(2), highest weights (1,0) and (2,1) both have derived coordinate 1,
  but their scalar central actions are z and z³. At z=i these are i and −i;
  the central exponents 1 and 3 distinguish the standard module from its
  determinant twist, and both satisfy the parity condition q−a=0 mod 2.
- On the U(2) covering product the standard module (q,a)=(1,1) and its
  dual (−1,1) both have kernel scalar +1. Their tensor product has scalar
  1·1=1; the intertwiner 2I descends to 2I and pulls back to 2I.

### 6.7 Restriction to the maximal torus

For a finite-dimensional continuous representation V of K write ch(V) for the
formal character in ℤ[X] of its restriction to T (§6.1). Prove the following.

- ch(V) lies in the fixed subring `ℤ[X]^W` of §6.4, the normalizer permuting the
  weight spaces; ch is additive on direct sums and multiplicative on tensor
  products.
- Two representations with the same ch are equivalent: every element of K is
  conjugate into T (LieGroups Layer 6), so the trace character is determined by
  its restriction to T, and native compact character orthogonality separates
  inequivalent representations.
- For the irreducible representation V_χ of §6.6 with dominant highest character
  χ, `ch(V_χ) = m_χ + Σ_μ c_μ m_μ`, where m_μ is the sum of the distinct elements
  of the orbit W·μ, each once, the sum runs over the dominant μ≠χ with the same
  restriction to Z(K)^0 as χ and with `λ_χ − λ_μ` a nonnegative integer
  combination of positive roots, and the c_μ are natural numbers. This is the
  pinned `TauCeti.formalCharacter_eq_orbitSum_add_lower` for the derived module,
  transported along χ ↦ λ_χ restricted to 𝔥, which is injective on characters
  with a fixed restriction to Z(K)^0 and equivariant for W by LieGroups Layer 6.
- The formal characters ch(V_χ), χ dominant, form a ℤ-basis of `ℤ[X]^W`
  (Knapp, Theorem 5.110, pp.335–336, for the classification). The orbit sums
  m_μ, μ dominant, form a ℤ-basis of `ℤ[X]^W`, every W-orbit in X containing
  exactly one dominant element, and the expansion of the preceding target is
  unitriangular on each finite set of dominant characters below a given one.
  Each such set has fixed central character and bounded semisimple weights; no
  ordering of arbitrary central real directions is used.

This is integral spanning by virtual combinations; it asserts neither that each
invariant element of ℤ[X] with nonnegative coefficients has nonnegative
coordinates in the irreducible basis nor that every Lie dominant weight
integrates to K.

*Needs:* §§6.1, 6.2, 6.4, 6.5 and 6.6; Tau Ceti
`TauCeti.formalCharacter_eq_orbitSum_add_lower` and
`TauCeti.formalCharacter_coeff_weylGroup_smul`; LieGroups Layer 6's conjugacy
of every element into a maximal torus and its Weyl comparison; native compact
character orthogonality.

**Checks.**

- For the trivial group X=0 and `ℤ[X]^W=ℤ`, with basis the formal character 1
  of trivial ℂ; for Circle W is trivial and the basis of `ℤ[t,t⁻¹]` is the
  powers tⁿ, n∈ℤ, with t⁻¹ the formal character of z↦z⁻¹.
- For SU(2), χ₂=t²+1+t⁻² is the sum of the leading orbit t²+t⁻²
  and the zero-weight orbit 1, each with coefficient 1.
- At the wall λ=0 the character and orbit sum are both 1, not 2.
  The invariant t²+t⁻² equals χ₂−χ₀, so nonnegative torus coefficients
  do not imply nonnegative irreducible coefficients.

### 6.8 Classical global forms

For a torus W is trivial and all
irreducibles are its actual characters. For the trivial group X=0 and `ℤ[X]^W=ℤ`.
For SU(2) all highest integers n≥0 occur, whereas for SO(3) only even SU(2) highest
integers descend. The positive torus character `e²+e⁻²=chi_(Sym²)−1` is
virtual but not a positive SU(2) character, testing the positive-cone distinction. For U(n), n>0, use the actual covering
`S¹×SU(n)→U(n), (z,A)↦zA`, with kernel `(z,z⁻¹I)` for zⁿ=1. A central exponent
q and derived highest coefficients a_i descend exactly when
`q≡Σ_(i=1)^(n−1) i a_i (mod n)`. Compare this with the full integer tuple
λ, where q=Σλ_i and a_i=λ_i−λ_(i+1). This is a congruence,
not an independent central/derived lattice split. The formal characters of the
exterior powers 1,…,n and of the inverse determinant generate `ℤ[X]^W` as a ring
for U(n); include n=1, and treat U(0)
as trivial without a purported injective scalar-circle inclusion. Other global
forms need not admit all fundamental modules, and their `ℤ[X]^W` need not be a
polynomial ring on a purported independent set of fundamental characters.

- For U(n), n>0, identify the actual integral character lattice through
  the finite-kernel congruence, with its sum and difference coordinates.
- For U(n), `ℤ[X]^W` is the ring of symmetric Laurent polynomials in
  t₁,…,t_n; the formal characters of the exterior powers and of the inverse
  determinant generate it over ℤ.
- For SO(3), pullback identifies its irreducibles with even SU(2) highest
  weights, preserving dimension and tensor multiplication.

*Needs:* §§6.5–6.7; native SU(2) weights; the pinned highest-weight
declarations named in §§6.6–6.7, applied to `𝔰𝔩_n(ℂ)`; Mathlib exterior
powers. Identify the i-th exterior power's top weight with the i-th fundamental
weight and its torus character with the i-th elementary symmetric polynomial.
For the Laurent statement, multiply a symmetric Laurent polynomial by a
sufficient power of the determinant monomial to make all exponents nonnegative,
then apply the fundamental theorem of symmetric polynomials.

**Checks.**

- For U(3), λ=(2,1,−1) gives q=2 and (a₁,a₂)=(1,2), with
  a₁+2a₂=5≡2 modulo 3. For the fundamental weight (1,0), q=0 fails:
  a primitive cube root ζ acts by ζ⁻¹≠1 on the covering kernel.
- For U(1) the congruence modulo 1 imposes no condition and `ℤ[X]^W` is
  ℤ[t,t⁻¹]; for U(0) it is ℤ, with no scalar-circle injection.
- For U(2), exterior-square character t₁t₂ times determinant-inverse
  character (t₁t₂)⁻¹ is 1; a polynomial ring without the inverse loses this identity.

### 6.9 Recognizing genuine U(2) weight characters

For a finitely supported
function `f:ℤ²→ℕ`, the signature `u2_weight_character_iff` states that f is the diagonal-torus weight-multiplicity
function of a finite-dimensional continuous complex U(2) representation iff the following two conditions hold (deduced from Knapp, Theorem 5.110, pp.335–336, and the native SU(2) weight strings):

```
f(a,b)=f(b,a)                         for all a,b∈ℤ,
f(a,b)≥f(a+1,b−1)                    whenever a≥b.
```

Finite support is a hypothesis, not a consequence of these two conditions.
Use this layer's actual character lattice and the engine's SU(2) strings;
retain every central degree `a+b`, including negative determinant twists.
For each dominant pair `a≥b`, construct
`L_(a,b)=det^b⊗Sym^(a−b)(ℂ²)` restricted to U(2), and prove its weights
are `(a−j,b+j)`, `0≤j≤a−b`, each with multiplicity 1. Equivalently descend
`z^(a+b)⊗Sym^(a−b)` through `S¹×SU(2)→U(2)`: the kernel element
`(−1,−I)` acts trivially since `(a+b)−(a−b)=2b` is even.
Prove irreducibility, the actual comparison of these two constructions,
and exhaustion using the preceding global existence/descent theorem.

Recover the multiplicity of L_(a,b) by the outward difference
`m_(a,b)=f(a,b)−f(a+1,b−1)` for a≥b. First prove the inequality makes
this a nonnegative integer; finite support makes the list finite.
Telescope on each fixed-sum, fixed-parity weight string to prove that
`⊕_(a≥b) L_(a,b)^(⊕m_(a,b))` has weight function f. Construct the
representation and its weight-space comparison, and prove uniqueness up
to equivalence from the multiplicity formula. Prove the dimension identity `Σ f=Σ_(a≥b)m_(a,b)(a−b+1)`.
For instance multiplicities `1,2,1` at `(2,0),(1,1),(0,2)` give
`Sym²(ℂ²)⊕det`. The Weyl-invariant function supported with value 1 at
`(1,−1),(−1,1)` fails the inequality at `(0,0)` and is only the virtual
character `det⁻¹⊗Sym²(ℂ²)−1`. This criterion identifies the genuine
positive cone in rank 2; it does not infer positivity from Weyl invariance.


The trace formulation in `u2_weight_character_iff` quantifies over every
unitary diagonal matrix, identifies its trace with the prescribed finite
Laurent sum, and allows n=0. Diagonal entries have modulus 1, so every
negative integer power is taken at a nonzero scalar.

- The outward differences give nonnegative multiplicities exactly under the
  stated symmetry and inequality; reconstructed torus weights equal f.
- These multiplicities determine the continuous representation up to
  equivalence, and their dimension sum equals the total weight multiplicity.
- The construction permits arbitrary integer determinant twists; finite
  support, rather than a bound on either weight, makes the direct sum finite.

*Needs:* §§6.5–6.6's U(2) descent and exhaustion; §6.1's torus-weight
uniqueness; native SU(2) weight strings and finite-dimensional complete
reducibility. The basis theorem of §6.7 is not needed for this criterion.

**Checks.**

- Weights (2,0),(1,1),(0,2) of multiplicities 1,2,1 have outward
  differences 1,1; they give Sym²⊕det and dimension 3+1=4.
- The singleton (−1,−1) of multiplicity 1 gives det⁻¹ of dimension 1;
  at diag(i,−1) its trace is i, rather than the determinant value −i.
- Weights (1,−1),(−1,1) alone fail 0≥1 at (0,0); the virtual
  irreducible multiplicity there is −1, so no genuine representation realizes them.
- The zero weight function gives dimension 0 and trace 0 on every diagonal
  matrix; both inequalities hold as 0=0 and 0≥0.

### Examples

The U(2) criterion is a deduction from the global highest-weight classification and the explicit SU(2) strings, not an assertion that Weyl-invariant positive weights alone form a representation.

### Dependencies

§0.1's tensor and dual comparisons; §4.1's `circleProduct_character`; Layer 5's character classification and orthogonality; native compact characters, unitarization, complete reducibility and SU(2) classification; the pinned torus, root-system and highest-weight declarations of the supplier contracts, and `TauCeti.Hodge.complexificationConjugation` with `LinearMap.map_eigenspace_baseChange`; Mathlib `AddMonoidAlgebra`; LieGroups Layers 0, 2–5, 5A, 6 and 7 (compact semisimple integration); ConvexityToric T1; the compact cocharacter, finite-cover and dominance targets of this layer.

## Layer 7: unitary SU(2) actions and embeddings

### 7.1 unitary SU(2) actions and embeddings

The signatures `su2_multiplicities_and_faithfulness` and
`exists_su2_of_multiplicities` state uniqueness of the character multiplicities,
their realization and the faithful-action criterion on the native SU(2) carrier.

For every
  n≥0 classify continuous group homomorphisms SU(2)→U(n), with conjugacy by
  U(n), using the preceding complex symmetric-power irreducibles. Construct the
  bijection with finitely supported multiplicities m_d∈ℕ satisfying
  `Σ_(d≥0)(d+1)m_d=n`: its representative is the orthogonal direct sum of
  m_d copies of a fixed unitary model of Sym^d(ℂ²), transported to ℂⁿ by a
  unitary basis. Prove independence of that basis, exhaustiveness and uniqueness.
  In particular an invertible complex intertwiner between two unitary models
  can be replaced by a unitary intertwiner using its positive polar factor.
  These are complex representation multiplicities, including for irreducibles
  of real or quaternionic type; no real-dimension count replaces d+1.

  Prove `(-I)·v=(-1)^d v` on Sym^d(ℂ²). For d≥1 compute its
  group kernel using `TauCeti.SU2.exists_isConj_torusHom` and
  `TauCeti.SU2.symPower_torusHom_weightBasis`: a kernel element is conjugate
  to diag(z,z⁻¹), and all its weights z^(2i−d) equal 1. For d≥1 the weights
  at i=0 and i=1 give z²=1, so z=±1. At z=−1 every weight is (−1)^d;
  conjugating either scalar matrix leaves it fixed. Thus the kernel is {I}
  for odd d and {±I} for positive
  even d; Sym^0 has kernel all of SU(2). Prove the kernel of the direct sum is
  the intersection of these kernels. Consequently the homomorphism is faithful
  iff m_d>0 for some odd d. A faithful continuous homomorphism here is a
  topological embedding by compactness of SU(2) and the Hausdorff target;
  compare it with a smooth Lie-group embedding as a separate target.
  Use LieGroups Layer 2 for automatic smoothness and Layer 3 for exponential
  naturality, and Layer 0 for the local inverse of exp. If the differential kills X,
  the homomorphism kills exp(tX) for every real t; injectivity and the local
  inverse force X=0. Translation gives an immersion everywhere, and the
  compact topological embedding gives a smooth embedding. Conversely a
  smooth embedding is injective. This route requires no simplicity theorem.

  Identify these multiplicity lists with partitions of n, whose part d+1
  occurs m_d times. Embeddings correspond precisely to partitions containing
  an even part. Prove finiteness and the cardinal
  identity `#(embedding conjugacy classes)=p(n)-p_odd(n)`, where p(n) counts
  all partitions and p_odd(n) counts partitions with all parts odd, with the
  empty partition included. For n=0 and n=1 the only homomorphism is trivial
  and there are no embeddings; for n=2,3,4 the numbers of embedding classes
  are respectively 1,1,3. This is a deduction from the symmetric-power classification and the displayed kernel computation.

*Needs:* Native SU(2) classification and torus formulas; native unitary intertwiner comparison; LieGroups Layers 0, 2 and 3 for the smooth embedding comparison only.

**Checks.**

- For n=0 and n=1 the only action is trivial, and there are 0 embedding classes.
- For n=2,3,4 the counts p(n)−p_odd(n) are 2−1=1, 3−2=1 and 5−2=3.
- On a torus element with z=i, Sym¹ has eigenvalues −i,i and Sym² has
  eigenvalues −1,1,−1; neither is the identity. At z=−1 the respective
  eigenvalues are −1,−1 and 1,1,1, distinguishing odd and even d.
- Sym⁰ has kernel all of SU(2); Sym¹ has kernel {I}; Sym² has kernel {±I}. Thus even representation dimension, not even highest weight, detects a faithful irreducible.
- For Sym¹⊕Sym¹, the kernel is {I}∩{I}={I} and dimension is 4; its multiplicity is complex multiplicity 2, including the quaternionic type of Sym¹.

### Examples

Partitions containing an even part give precisely the faithful actions. Compactness makes these injective continuous maps topological embeddings.

### Dependencies

Native SU(2) classification and torus formulas; native unitary intertwiner comparison; LieGroups Layers 0, 2 and 3 for the smooth embedding comparison only.

## Downstream consumers

AutomorphicFormsOnReductiveGroups §2.1 consumes Banach G-finite density and supplies
the locally convex extension. It records that contract as the supplier gap
(gap:banach-gfinite-density): the predicate `IsGFinite`, the submodule
`gFiniteSubmodule` with its closure and equivariance facts, which it names
gFinite_add, gFinite_smul and gFinite_map, and the density theorem
`gFiniteSubmodule_dense`, stated there as density of the submodule as a subset
of the Banach space, which is the statement of §2.1 here. SmoothBanachRepresentations §4.1 consumes compact-finite
approximation for the real as well as complex smooth topology, building on
AutomorphicFormsOnReductiveGroups §2.7 for the complex case. TopologicalKTheory T6
consumes the same density theorem for its equivariant section spaces and owns
the representation ring R(G); the basis theorem of §6.7 is stated on formal
characters, so a consumer placed after TopologicalKTheory reads it on that ring.

## References

- A. W. Knapp, *Lie Groups Beyond an Introduction*, digital second edition (2021),
  author-distributed version: Proposition 4.8 and Corollary 4.9 p.240;
  Theorem 4.29 pp.250–251;
  Propositions 4.58–4.59 pp.264–265; Proposition 4.67 p.267;
  Theorem 5.107 p.334;
  Theorem 5.110 and its proof pp.335–336.
  [Legal author edition](https://www.math.stonybrook.edu/~aknapp/download/Beyond2.pdf).
- P. Etingof, *Lie Groups and Lie Algebras II*, MIT 18.755 (Spring 2024),
  Lecture 11, §37, pp.199–203. This source assumes a countable base.
  [Institutional notes](https://ocw.mit.edu/courses/18-755-lie-groups-and-lie-algebras-ii-spring-2024/mit18_755_s24_lec11.pdf).
- J. B. Conway, *A Course in Functional Analysis*, second edition, Springer (1990),
  VII.9, Exercises 8–11, DOI 10.1007/978-1-4757-4383-8.
  Locator-only citation (uncertified).
