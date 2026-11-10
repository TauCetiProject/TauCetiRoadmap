# Roadmap: clifford bundles, spin structures, and Dirac geometry

**Summary.** Develop the geometric theory of real and complex Clifford modules, spin lifts,
spinor bundles and their compatible connections. The resulting library must
support the de Rham, signature and twisted spin Dirac operators, with their
metrics, gradings and curvature formulas pinned. This README is definitive.
`Suggested.lean` states the one geometric headline statable against the pinned
APIs, the rank-two Spin criterion of G4.4a, with G4.2's Spin structure as its
only definition. The pointwise algebra of Layers 1 and 2 is consumed from Tau
Ceti, and the module docstring of `Suggested.lean` lists the other geometric
headlines and the carrier each one lacks.

## Scope and ownership

The algebraic Clifford algebra, its real periodicity and the abstract spin
representations are supplied by
[SpinRepresentations L0–L4,L7,L9](../RepresentationTheory/SpinRepresentations/README.md)
and [OrthogonalSpinGroups L0–L2](../../Completed/OrthogonalSpinGroups/README.md).
Use Mathlib's `CliffordAlgebra`, `ExteriorAlgebra`, `CliffordAlgebra.equivExterior`,
`equivBaseChange`, `equivOfIsometry`, `prodEquiv`, `evenOdd`, `involute` and
`reverse`. Tau Ceti already has `TauCeti.spinAction`,
`SpinPolarizationData.cliffordEquivEnd`, its even/odd matrix classification,
half-spin actions and real algebraic eight-periodicity, and it already proves
the pointwise negative-metric theory on which G1–G2 rest: the
complexified Clifford adjoint, compatible spinor and multiplicity metrics,
Morita evaluation, the normalized scalar trace with its positivity, the
normalized Fock action and its metric, the frame-free real and normalized
complex volume elements, the chirality decomposition of every module, the
Hodge-star action of the volume, the graded tensor product of Clifford modules
and graded twists. These are listed by declaration under From Tau Ceti and are
not targets here. The pointwise exterior metric and Hodge stars are in the
library as well: Mathlib's Gram-determinant inner product and Hodge star on
exterior powers, and Tau Ceti's oriented Hodge star with its complex-linear
extension, the conjugate star and the Gram metric on complexified forms; so
are the smooth real Hodge star and codifferential of an oriented Riemannian
manifold. They are consumed, not planned; ComplexKahlerGeometry K5 is cited
only for complex- and bundle-valued forms and for the analysis. G1–G2 own only what lies beyond them: the Gram-determinant formula
for the Fock metric (G1.2), the agreement of the wedge-basis form on
complexified forms with the complexified Gram metric (G2.2),
the two-factor evaluation and restriction intertwiners in odd dimension (G1.4),
the forms-to-endomorphisms module equivalence (G2.2), and the associativity,
graded symmetry, unit, orientation, duality and Mathlib comparison laws of the
graded product (G2.3). They do not construct another abstract Fock
action, classification table or Bott-periodicity proof. Real algebraic
periodicity is distinct from the topological Bott theorem. G3 owns smooth Clifford
module and connection comparisons, G4 the geometric lift data, G5 associated
spinors and G6 the geometric Dirac and real analytic index comparisons. G4's
lift data and rank-two criterion are stated on Tau Ceti's principal bundles,
with their pullback and cocycle gluing, its orthonormal frame bundle and
orientation double cover, and its integral Thom and Euler classes. Numerable
and associated bundles, generic bundle descent, characteristic classes,
elliptic analysis and KO models remain with the named suppliers below.

## Conventions

Finite-dimensional Euclidean spaces and finite-rank real/complex bundles are
the fiber setting. Smooth bases are Hausdorff, second-countable boundaryless
manifolds, with orientation, compactness and completeness stated per theorem.
Spin structures on general bundles use paracompact Hausdorff numerable bases;
singular H¹/H² statements also require CW type. Ranks are fixed on each
connected component. Include ranks zero and one explicitly.

Use `Q(v)=−g(v,v)` for geometric Clifford multiplication, hence
`c(v)c(w)+c(w)c(v)=−2g(v,w)Id`. Mathlib's Clifford generators square to Q.
Use Mathlib's base-change tensor order for complexification:
`ℂ⊗_ℝCl_ℝ(V,−g) ≃ Cl_ℂ(ℂ⊗_ℝV,−g_ℂ)`, by
`(CliffordAlgebra.equivBaseChange ℂ Q).symm`; the geometric `V⊗_ℝℂ` model is
identified using the canonical tensor commutor. Give `V⊗_ℝℂ` the right-factor complex scalar action
`z • (v⊗ₜw)=v⊗ₜ(z • w)`. For this action, the commutor to `ℂ⊗_ℝV` is
ℂ-linear; it transports the complex structure rather than silently using the
native left-factor scalar action. Realize the right-factor action on a type
synonym, or by a local instance transported along `TensorProduct.comm`; install
no global `Module ℂ (V ⊗[ℝ] ℂ)` instance. The bilinear form `g_ℂ` is the complex-bilinear scalar extension of g;
for `Q(v)=−g(v,v)`, its base change satisfies
`(Q.baseChange ℂ)(w)=−g_ℂ(w,w)`. The positive Hermitian form on the
complexified vector space is induced by g and is a separate form. Hermitian
products follow Mathlib's convention of conjugate linearity in the first
argument. On `CliffordAlgebra (Q.baseChange ℂ)`, Mathlib's native
`CliffordAlgebra.star` is the complex-linear map `reverse ∘ involute`: it fixes
coefficient scalars and sends each real generator to its negative (`star_ι`).
Scalar conjugation on this carrier is written `κ_base`; it is Tau Ceti's
`CliffordAlgebra.complexConj`. The conjugate-linear negative-metric Clifford
involution is `*Cl_base = κ_base ∘ CliffordAlgebra.star`, Tau Ceti's
`CliffordAlgebra.conjStar`.
On the tensor carrier `ℂ⊗_ℝCl_ℝ(V,−g)`, enable locally the
`StarModule ℝ (CliffordAlgebra Q)` law
`CliffordAlgebra.starModule_of_trivialStar`; do not add a global
`Star` instance. Then the existing `TensorProduct` `Star` satisfies
`star (z⊗ₜa)=star z⊗ₜ reverse (involute a)` by
`TensorProduct.star_tmul` and `CliffordAlgebra.star_def`. Thus its action on
this carrier is `*Cl_tens = κ_tens ∘ (id⊗star_ℝ)`.
A *-representation satisfies `ρ(a^{*Cl_base})=ρ(a)†`, so `c(v)` is
skew-Hermitian. The complex-linear extension of the real
Hodge star on forms is separate from both.

For an oriented real 2ℓ-space and positively oriented orthonormal basis,
`Γ=i^ℓ c(e₁)…c(e_(2ℓ))`, S⁺ is its +1 eigenspace and S⁻ its −1 eigenspace.
An orthogonal complex structure J uses the orientation
`(u₁,Ju₁,…,u_ℓ,Ju_ℓ)`. Set `v^(1,0)=(v−iJv)/2` and
`v^(0,1)=(v+iJv)/2`; the normalized Fock action is
`c(v)=√2(ε(v^(1,0))−ι(v^(0,1)))`, where contraction uses g_ℂ.
This makes Γ exterior parity, with vacuum in S⁺.

Use `R(X,Y)=[∇_X,∇_Y]−∇_[X,Y]`, which is Tau Ceti's
`CovariantDerivative.curvatureOperator` for a covariant derivative on any vector
bundle, positive round-sphere curvature,
`D=Σ c(e_j)∇_(e_j)` and nonnegative rough Laplacian ∇*∇. The geometric
principal symbol has `σ_geom(D)(ξ)=c(ξ♯)`; the Fourier symbol of
`−i∂_j` is ξ_j and `σ_F(D)=i c(ξ♯)`. Thus the Fourier symbol of D² is
|ξ|²Id. The complex-linear Hodge star on complexified real forms is distinct
from the native complex-linear Clifford `star` and the conjugate-linear
`*Cl_base` and `*Cl_tens` defined above. Conjugate-linear Hermitian/Dolbeault stars have separate names.

**Checks.**

- For orthonormal tangent e₁,e₂ on the unit sphere, R(e₁,e₂)e₂=e₁ and
  R(e₁,e₂)e₁=−e₂; sectional curvature is +1 and on S² scalar curvature is 2.
- In a unit plane, c(e₁)²=c(e₂)²=−Id and their mixed sum is zero;
  Γ=i c(e₁)c(e₂) has square Id.
- For a scalar i and real generator e, the Hermitian Clifford adjoint gives
  i* = −i and e* = −e; the complex-linear native Clifford star instead fixes i.


## Exact supplier contracts

### From Mathlib

Use the native Clifford universal property and relations
`CliffordAlgebra.comp_ι_sq_scalar` and `CliffordAlgebra.ι_mul_ι_add_swap`
from `Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean`, the Clifford/exterior
module equivalence, scalar extension and graded tensor product named above.
G2.3 compares Tau Ceti's graded product action with `CliffordAlgebra.prodEquiv`
from `Mathlib/LinearAlgebra/CliffordAlgebra/Prod.lean`.

G1.2 and G2.2 use the Gram-determinant inner product on real exterior powers,
`exteriorPower.inner_ιMulti_ιMulti`, with the orthonormal wedge basis
`OrthonormalBasis.exteriorPower`, from
`Mathlib/Analysis/InnerProductSpace/ExteriorPower.lean` (finite-dimensional real
spaces only), the Hodge star `exteriorPower.hodgeStar` of a nondegenerate
bilinear form and a volume, from `Mathlib/LinearAlgebra/ExteriorPower/HodgeStar.lean`,
and the scalar-extension equivalence `ExteriorAlgebra.baseChangeEquiv` from
`Mathlib/LinearAlgebra/ExteriorAlgebra/BaseChange.lean`. G4.2 and G4.4a use
CW complexes `Topology.CWComplex` (with weak topology, closed cells and closure
finiteness, `Mathlib/Topology/CWComplex/Classical/Basic.lean`) and continuous
Riemannian bundles `IsContinuousRiemannianBundle`
(`Mathlib/Topology/VectorBundle/Riemannian.lean`).

G3–G6 use Mathlib's metric compatibility of a covariant derivative on a
Riemannian bundle, `CovariantDerivative.IsMetricCompatible`
(`X⟨σ,τ⟩=⟨∇_Xσ,τ⟩+⟨σ,∇_Xτ⟩`, in
`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/Metric.lean`), and
the Levi-Civita connection `CovariantDerivative.leviCivitaConnection` of a C¹
Riemannian metric on the tangent bundle of a C² manifold with
finite-dimensional model, which is metric-compatible and
torsion-free (`CovariantDerivative.isLeviCivitaConnection_leviCivitaConnection`)
and unique on differentiable vector fields
(`CovariantDerivative.IsLeviCivitaConnection.uniqueness`), in `LeviCivita.lean`
in that folder.

### From Tau Ceti

Use the spin representation and periodicity declarations named in Scope
and ownership and the compact-real covering and Lie projection declarations
listed in G4.1a–G4.1b. The latter use the native units-range topologies.

The pointwise algebra of Layers 1 and 2 is consumed from the following files
under `TauCeti/`; each subsection of those layers names the declarations it
uses and the convention they fix. All of them assume `Q(v)=−|v|²` where a
metric enters, and none assumes a module finite-dimensional or irreducible
unless its statement says so.

- G1.1: `LinearAlgebra/CliffordAlgebra/BaseChange.lean` (involutions, even
  part and grading under scalar extension), `RealForm/Orthonormal.lean` and
  `RealForm/OrthonormalBasis.lean` in the same folder (coordinate model
  `realCliffordForm 0 n` and the real classification table), `Neg.lean`
  (`CliffordAlgebra.equivNeg`), `Spin/Neg.lean` and `Spin/Real/Neg.lean`
  (`OrthonormalBasis.realSpinGroupEquiv`), `Spin/EvenUnitary.lean` and
  `Spin/LowRank/Zero.lean` (`CliffordAlgebra.evenUnitaryGroup` and rank zero).
- G1.2: `RepresentationTheory/Spin/Polarization/ComplexStructure.lean`,
  `Polarization/DegreeScaling.lean`, `Polarization/Fock/Basic.lean`
  (`TauCeti.AlmostComplexStructure.fockAction`) and
  `Polarization/Fock/Metric.lean`;
  `Geometry/Symplectic/Complex/HermitianForm.lean` for the Hermitian form on
  the (1,0)-part.
- G1.3: `LinearAlgebra/CliffordAlgebra/Complexification.lean`
  (`CliffordAlgebra.complexConj`, `CliffordAlgebra.conjStar`), `Star.lean`,
  `Hermitian/Basic.lean`, `Hermitian/Complex.lean`, `Hermitian/Spinor.lean`,
  `Hermitian/Multiplicity.lean` (`TauCeti.multiplicityMetric`),
  `Hermitian/Dual.lean` and `Dual.lean` (`AlgHom.cliffordReverseDual`) in that
  folder; `RingTheory/Morita/ModuleEnd.lean`
  (`TauCeti.isotypicTensorEquivOfBijective`) and
  `RingTheory/Semisimple/Multiplicity.lean` (`TauCeti.isotypicEval_tmul`);
  `LinearAlgebra/CliffordAlgebra/ScalarTrace/Basic.lean`
  (`CliffordAlgebra.scalarTrace`), `ScalarTrace/BaseChange.lean`,
  `ScalarTrace/Positivity.lean`, `ScalarTrace/Radical.lean`,
  `ScalarTrace/Representation.lean` and `OrthogonalBasis.lean`.
- G1.4: `LinearAlgebra/CliffordAlgebra/OddSplitting.lean`,
  `Even/EquivEven.lean`, `VolumeElement/EquivEven.lean`,
  `RepresentationTheory/Spin/Polarization/OddVolume.lean` and
  `RepresentationTheory/Spin/LineSign.lean`
  (`TauCeti.SpinPolarizationData.cliffordEquivEndProd`).
- G2.1: `LinearAlgebra/CliffordAlgebra/VolumeElement/Oriented.lean`
  (`CliffordAlgebra.volumeElement`), `VolumeElement/Complex.lean`
  (`CliffordAlgebra.complexVolume`), `VolumeElement/Eigenspace.lean`,
  `RingTheory/Morita/Eigenspace.lean`,
  `LinearAlgebra/Eigenspace/Separation.lean` and
  `RepresentationTheory/Spin/Polarization/Chirality.lean`.
- G2.2: `LinearAlgebra/ExteriorAlgebra/CliffordAction.lean`
  (`CliffordAlgebra.exteriorAction`),
  `LinearAlgebra/CliffordAlgebra/VolumeElement/HodgeStar.lean`,
  `VolumeElement/Dual.lean` and `ScalarTrace/Representation.lean`; and the
  pointwise Hodge package in `Analysis/InnerProductSpace/HodgeStar/`:
  `Basic.lean` (`Orientation.hodgeStar`, Mathlib's star for the inner product
  and the orientation volume, with `Orientation.inner_hodgeStar_apply`),
  `Isometry.lean` (`Orientation.wedgePairing_hodgeStar`, which is `α∧*β=⟨α,β⟩vol`,
  and `Orientation.hodgeStarIsometry`) and `Complex.lean`
  (`Orientation.complexHodgeStar`, defined as the scalar extension of the real
  star, `Orientation.complexWedgePairing_complexHodgeStar`, which is
  `α∧*β=B_ℂ(α,β)vol` for the bilinear extension B_ℂ of the Gram metric,
  `Orientation.sesqComplexification_complexHodgeStar` for the Gram metric
  `LinearMap.BilinForm.sesqComplexification` of complexified forms, and the
  conjugate star `Orientation.barHodgeStar`).
- G4.2–G4.4a: `Topology/FiberBundle/Principal.lean`
  (`TauCeti.PrincipalBundle`: a fibre bundle with model fibre a group, right
  action on the fibres and equivariant atlas trivializations; the fibres are
  torsors; its pullback along a continuous map,
  `TauCeti.PrincipalBundle.pullback`, and the equivariant trivialization of a
  continuous local section, `TauCeti.PrincipalBundle.trivializationOfSection`),
  `Topology/FiberBundle/GroupCocycle.lean` (the bundle
  `TauCeti.fiberBundleCoreOfGroupCocycle` glued from a continuous group-valued
  cocycle on an open cover, principal when the fibre is the group acting on
  itself, `TauCeti.principalBundle_fiberBundleCoreOfGroupCocycle`, and the
  equivariant homeomorphism `TauCeti.homeomorphOfCohomologous` between the
  bundles of cohomologous cocycles), `Topology/VectorBundle/OrthonormalFrame/Basic.lean`
  (`TauCeti.OrthonormalFrameBundle`: pairs of a base point and a linear isometric
  equivalence from the model space to the fibre, with the topology of pointwise
  convergence in the total space; Gram–Schmidt local frames, free and
  transitive right action and the reconstruction of the bundle,
  `TauCeti.OrthonormalFrameBundle.associatedHomeomorph`) and `Pullback.lean` in
  that folder (`TauCeti.OrthonormalFrameBundle.pullbackHomeomorph`),
  `Topology/VectorBundle/Orientation/Basic.lean` and `Cover.lean`
  (orientations `TauCeti.VectorBundleOrientation`, the orientation double cover
  `TauCeti.VectorBundleOrientationCover`, and orientability as the existence of
  a continuous section of that cover,
  `TauCeti.VectorBundleOrientation.nonempty_iff_exists_section`),
  `Orientation/OrthonormalFrame.lean` in that folder (the orientation
  `TauCeti.OrthonormalFrameBundle.toOrientationCover` carried by a frame; two
  frames carry the same orientation exactly when they differ by an orthogonal
  map of positive determinant,
  `TauCeti.OrthonormalFrameBundle.toOrientationCover_eq_toOrientationCover_iff`,
  and in positive rank the quotient by that relation,
  `TauCeti.OrthonormalFrameBundle.orientedRel`, is the double cover,
  `TauCeti.OrthonormalFrameBundle.orientationCoverHomeomorph`),
  `Geometry/Manifold/FiberBundle/Basic.lean` and `Principal.lean` in that folder
  for smooth lifts (the C^n fibre bundles `TauCeti.ContMDiffFiberBundle`, charted
  through `TauCeti.ManifoldTotalSpace`; a principal bundle is C^n exactly when
  its transition functions are, `TauCeti.PrincipalBundle.contMDiffFiberBundle_iff`),
  `LinearAlgebra/CliffordAlgebra/Spin/Real/Basic.lean`
  (`CliffordAlgebra.realCliffordSpinGroupZero`, the Spin group of the positive
  form `realCliffordForm n 0`), `LinearAlgebra/CliffordAlgebra/Spin/Action.lean`
  (`CliffordAlgebra.spinVectorAction`, conjugation `v↦g v g⁻¹`),
  `Topology/Algebra/CliffordAlgebra/Basic.lean` and `Spin/Compact.lean` in that
  folder (module topology of the Clifford algebra, subspace topology and
  compactness of the Spin group), and `Topology/VectorBundle/EulerClass.lean`
  (`TauCeti.thomPair`, the pair (E,E₀); `TauCeti.IsThomClass`, a class
  generating the cohomology of every fibre pair; `TauCeti.eulerClass`, the
  pullback along the zero section).
- G2.3: `LinearAlgebra/CliffordAlgebra/Prod.lean`
  (`AlgHom.cliffordProdTensor`), `VolumeElement/Prod.lean`
  (`CliffordAlgebra.complexProdTensor`), `VolumeElement/GradedModule.lean` and
  `LinearAlgebra/Eigenspace/TensorProduct/Involution.lean`.
- G3.4 and G6.4: the smooth forms `TauCeti.SmoothForm`, the exterior
  derivative `TauCeti.mextDerivₗ` and boundaryless Stokes
  (`TauCeti.integralTopForm_mextDeriv_eq_zero`) in
  `Geometry/Manifold/DifferentialForm/`, and manifold orientations
  `TauCeti.Manifold.Orientation`; for a smooth Riemannian metric and an
  orientation, `Geometry/Manifold/Riemannian/HodgeStar.lean` (the smooth real Hodge star
  `TauCeti.SmoothForm.hodgeStar`, with `α∧⋆β=⟨α,β⟩vol` and
  `TauCeti.SmoothForm.hodgeStar_hodgeStar`) and `Codifferential.lean` in that
  folder (`TauCeti.SmoothForm.codifferential`, d*=(−1)^(m(j+1)+1)⋆d⋆ on
  j-forms in dimension m, unchanged when the orientation is reversed,
  `TauCeti.SmoothForm.codifferential_neg_orientation`, and the formal adjoint of
  d on a boundaryless, Hausdorff, σ-compact base when one of the two forms has
  compact support,
  `TauCeti.SmoothForm.integralTopForm_inner_mextDeriv_eq_inner_codifferential`).
- G3–G6 connections and curvature, under
  `Geometry/Manifold/VectorBundle/CovariantDerivative/`:
  `LeviCivita/Regularity.lean`
  (`CovariantDerivative.instContMDiffCovariantDerivativeLeviCivitaConnection`:
  the Levi-Civita connection of a C^∞ metric on a C^∞ manifold is C^∞);
  `Curvature/Basic.lean` (`CovariantDerivative.curvatureOperator`, the
  curvature `R(X,Y)σ=∇_X∇_Yσ−∇_Y∇_Xσ−∇_[X,Y]σ` of a covariant derivative on
  any vector bundle, with Lee's sign; it is the R^E of G3.3 and G6.2, a
  complex bundle entering through its underlying real bundle);
  `Curvature/Tensor.lean` (`CovariantDerivative.curvatureTensor`, its pointwise
  tensor for a C^∞ connection on a finite-rank C^∞ bundle over a
  finite-dimensional Hausdorff manifold); `Curvature/Metric.lean`
  (`CovariantDerivative.IsMetricCompatible.inner_curvatureTensor_eq_neg`: the
  curvature endomorphisms of a metric-compatible connection are skew-adjoint);
  `Curvature/Bianchi.lean` (the first Bianchi identity
  `CovariantDerivative.curvatureTensor_cyclic_eq_zero` for a torsion-free
  connection, and pair interchange
  `CovariantDerivative.IsMetricCompatible.inner_curvatureTensor_swap_pairs`);
  `Curvature/Riemann.lean` (`CovariantDerivative.riemannCurvatureTensor`,
  `Rm(u,v,w,z)=⟨R(u,v)w,z⟩`, and the scalar curvature in an orthonormal basis,
  `CovariantDerivative.scalarCurvature_eq_sum_riemannCurvatureTensor`, which is
  `Σ_(j,k) Rm(e_k,e_j,e_j,e_k)`); and `Curvature/Scalar.lean`
  (`CovariantDerivative.scalarCurvature`, the metric trace of the Ricci tensor,
  and `Bundle.ContMDiffRiemannianMetric.scalarCurvature`, that of the
  Levi-Civita connection of a smooth metric).
- G5.0: `LinearAlgebra/CliffordAlgebra/Regular.lean`
  (`CliffordAlgebra.parityTwistedRightAction`), the parity-twisted right action
  on the regular module that is the fibre model of the external positive
  action.

### From the named roadmaps

The following contracts name the supplying sections and the structures consumed:

- [SmoothBundlesConnections B1–B5,B6.0](../SmoothBundlesConnections/README.md)
  owns smooth associated bundles, descent along principal projections, frame
  bundles, sums/tensors/duals, scalar extension, metrics, connections,
  curvature and parallel transport; the smooth principal-bundle atlas, with
  the smoothness of transitions, action and division, is Tau Ceti's (From Tau
  Ceti above). Use its actual Mathlib `FiberBundle`, `VectorBundle`, `ContMDiffVectorBundle`
  carriers, and its metric-parametrized L² sections. G3 adds Clifford algebra
  multiplication and module data to those bundles; G4 adds a spin lift of the
  oriented frame bundle. B3 supplies the invariant-vector parallel-section
  theorem used in G3.
- The Levi-Civita connection, its smoothness, the curvature operator and
  tensor, the first Bianchi identity, the curvature symmetries and the scalar
  curvature are the pinned declarations under From Mathlib and From Tau Ceti
  above. [RiemannianGeometry R1,R7](../RiemannianGeometry/README.md) supplies
  what lies beyond the pins: R1's orthonormal geodesic frames at a point
  (item 4: radially parallel, so `∇E_i(p)=0`; Tau Ceti's normal coordinate
  fields have vanishing covariant derivative at p but are not orthonormal away
  from it) for the normal-frame calculation of G6.2, and R7's real Weitzenböck
  comparison for G6.4. The metric uses Mathlib's `RiemannianBundle` and
  `IsContMDiffRiemannianBundle`.
- [DifferentialGeometry L0–L2,L5–L9](../DifferentialGeometry/README.md)
  is the plan for forms, exterior calculus, orientation, densities, integration,
  Stokes and de Rham comparison; the smooth forms, exterior derivative,
  manifold orientations and boundaryless Stokes theorem listed under From Tau
  Ceti are consumed from the pin, and DifferentialGeometry supplies the rest.
  [ComplexKahlerGeometry K5](../ComplexKahlerGeometry/README.md) supplies,
  beyond Tau Ceti's smooth real Hodge star and codifferential (From Tau Ceti
  above), the complex- and bundle-valued exterior-form bundles with the Gram
  metric tensored with a Hermitian metric, their formal adjoints, p=2 bundle
  Sobolev/distribution theory, Laplace-type regularity, Hodge theorem and
  compact resolvent. Its K1/K4
  complex/type and Hermitian bundle interfaces supply the almost-complex
  pointwise comparisons below.
- [CharacteristicClasses C1,C3.5](../CharacteristicClasses/README.md) owns
  mod2 cohomology, universal w₂ and its equality with the real spin-cover
  transition obstruction. G4.3 consumes that universal equality for lift
  existence; G4.4 constructs the H¹ torsor once a lift is given. [AlgebraicTopology Stages 2–6](../AlgebraicTopology/README.md)
  supplies cochains, cup/cross products and CW comparisons; SBC B6.0 supplies
  smooth good covers. On general paracompact bases keep Čech cohomology;
  identify it with singular cohomology on CW-type bases using C1's comparison.
- [TopologicalKTheory T1–T3,T6.4](../TopologicalKTheory/README.md) supplies the
  vector-bundle K-ring and products for G5's virtual spinor formula. Beyond
  Tau Ceti's principal-bundle mixin, pullback and cocycle gluing (From Tau
  Ceti above), its T6.4 supplies numerability, homotopy invariance of
  numerable principal bundles, bundle morphisms, associated bundles and
  extension of the structure group along continuous homomorphisms. Beyond Tau
  Ceti's orthonormal frame bundle and orientation double cover,
  CharacteristicClasses C1.0 supplies the positively oriented SO(n) principal
  subbundle of a given orientation, the metric-change transport of
  orthonormal frames and the rank-zero frame conventions, and C3.2 identifies
  w₁ with the class of the orientation double cover.
- [GeneralizedCohomology G5.5](../GeneralizedCohomology/README.md#g5-finite-duality-thom-spectra-and-rational-hurewicz)
  specifies the real Hilbert and finite-Clifford functional-calculus,
  regularity, stabilization and negative-Clifford family-index suppliers
  consumed by G5.0/G6.0. [TopologicalKTheory T7](../TopologicalKTheory/README.md#t7-real-k-theory-and-concrete-acceptance-calculations)
  specifies the real KO coefficients, graded Clifford-module quotient and
  ABS calibration used by G6.0. These constructions precede their Spin consumers.
- [PseudodifferentialOperators P1.0/P4–P6](../PseudodifferentialOperators/README.md)
  owns the differential-operator/formal-adjoint core, differential-operator/ΨDO
  identification, Sobolev mapping and elliptic estimates; K5a extends the
  fixed operators to bundle distributions.
  The cited contracts are [PDO P1.0 differential-operator core](../PseudodifferentialOperators/README.md#p10-differential-operator-core),
  [P4 differential-operator/ΨDO identification](../PseudodifferentialOperators/README.md#layer-4-composition-adjoints-and-global-bundles-p4),
  [P5 Sobolev mapping](../PseudodifferentialOperators/README.md#layer-5-sobolev-lp-and-hölder-mapping-estimates-p5),
  and [P6 ellipticity and parametrices](../PseudodifferentialOperators/README.md#layer-6-ellipticity-parametrices-and-fredholm-theory-p6),
  together with [ComplexKahlerGeometry K5a](../ComplexKahlerGeometry/README.md#k5-compact-hermitian-elliptic-theory-and-serre-duality)
  for general finite-rank Hermitian-bundle Sobolev/H¹/L² carriers, compactness,
  distributional pairings, Riesz transport and bundle-system regularity. G6 must prove
  the Dirac-specific domain/adjoint bridge stated below from these contracts.
  Numerical topological index formulas, the Hirzebruch signature theorem and
  the Â-genus formula are outside this roadmap.

## How to read the build

G1 fixes the metric Clifford dictionary, Morita evaluation and trace on their
Tau Ceti declarations and adds the Gram-metric and odd-factor comparisons; G2
does the same for chirality and adds the exterior and graded-product
comparisons. G3 constructs bundles and connections, G4
principal lifts, and G5 associated spinors. G6.1–G6.3 construct the complex
operator before G6.0's real analytic index; G6.7 then identifies its quaternionic
normalization. G5.3 compares its square roots with G4.4a's rank-two criterion. Each target lists its
statement and proof-route inputs; G labels remain the cross-roadmap locators.

| Former heading | Now |
| --- | --- |
| G1. Negative-metric Clifford modules and their positive metrics | Layer 1 |
| G2. Volume, chirality and exterior-form comparisons | Layer 2 |
| G3. Smooth Clifford bundles and compatible connections | Layer 3 |
| G4. Spin lifts, obstruction and classification | Layer 4 |
| G5. Spinor bundles, chiral products and rank-two roots | Layer 5 |
| G6. Dirac operators and curvature formulas | Layer 6 |

## Layer 1: Negative-metric Clifford modules and their positive metrics

Each subsection names the Tau Ceti declarations consumed under its id, with the
convention they fix, and states the comparison targets it keeps. Throughout, Q is
a real quadratic form with `Q(v)=−|v|²` on a finite-dimensional real inner
product space V, `Cl_ℂ` is `CliffordAlgebra (Q.baseChange ℂ)`, and a complex
Clifford module is a `Cl_ℂ`-module E with `IsScalarTower ℂ Cl_ℂ E`; an action
given as an algebra map into `Module.End ℂ E` is made a module by
`Module.compHom`.

### 1.1 Negative-metric and scalar-extension dictionary (G1.1)

Consume the following dictionary; this subsection keeps no target.

- Scalar extension. `CliffordAlgebra.ofBaseChangeAux_involute`,
  `CliffordAlgebra.ofBaseChangeAux_reverse`, `CliffordAlgebra.ofBaseChangeAux_star`,
  `CliffordAlgebra.ofBaseChangeAux_mem_even` and
  `CliffordAlgebra.ofBaseChangeAux_injective` give the compatibility of the real
  algebra's inclusion with the involutions and the even part;
  `CliffordAlgebra.toBaseChange_mem_baseChange_evenOdd_iff` matches the gradings
  of the two complexified carriers, and
  `QuadraticMap.Isometry.ofBaseChangeAux_map` is isometry naturality.
- Coordinate model. An orthonormal basis b indexed by `Fin n` gives the isometry
  `OrthonormalBasis.isometryEquivRealCliffordForm` from Q to
  `realCliffordForm 0 n`; the real classification of `CliffordAlgebra Q` by
  `dim V` modulo eight is
  `TauCeti.nonempty_algEquiv_cliffordAlgebra_realCliffordForm` with its eight
  residue-class companions.
- Compact Spin. `OrthonormalBasis.realSpinGroupEquiv` compares the Spin
  group of the positive form `realCliffordForm n 0` with `spinGroup Q` along b.
  It sends the positive-form bivector e_i e_j to −e_i e_j
  (`CliffordAlgebra.coe_spinGroupEquivNeg_apply_of_coe_eq_ι_mul_ι`), intertwines
  the two vector conjugation actions
  (`OrthonormalBasis.spinVectorAction_realSpinGroupEquiv`) and sends −1 to −1
  (`CliffordAlgebra.realCliffordSpinGroupEquivNeg_negOne`).
- Rank zero. On `CliffordAlgebra.evenUnitaryGroup` the geometric kernel is
  μ₂⊂Cl(0)=ℝ, of order two
  (`CliffordAlgebra.card_evenUnitaryGroup_of_subsingleton`), whereas the
  vector-generated Spin group is trivial
  (`CliffordAlgebra.range_spinGroup_toUnits_eq_bot_of_subsingleton`); in every
  rank the Spin units are the Lipschitz units of the even unitary group
  (`range_spinGroup_toUnits`).
- Over ℂ. `CliffordAlgebra.equivNeg` with u=i is the full-algebra map v↦i v from
  the positive to the negative complexified algebra. It sends a bivector to its
  negative (`CliffordAlgebra.equivNeg_ι_mul_ι`) and restricts on scalar-extended
  Spin elements to the real group comparison
  (`CliffordAlgebra.equivNeg_spinGroupBaseChange`). It is not the scalar
  extension of a real isomorphism of the full algebras when V≠0.

(Nicolaescu, Definition 12.1.10 and Corollary 12.1.14, pp. 626–627.)

**Checks.**

- A unit negative generator has square −1; multiplying a negative generator by i gives square +1, fixing the positive-to-negative map.
- For orthogonal unit e₁,e₂, the even comparison sends e₁e₂ to −e₁e₂; a sign-free comparison has the wrong conjugation action.
- At rank zero Cl=ℝ and the geometric kernel has two elements ±1, whereas native vector-generated Spin has one element.

### 1.2 Polarization and the Fock metric (G1.2)

Consume, for an orthogonal complex structure J on V:

- the polarization `TauCeti.AlmostComplexStructure.spinPolarizationData` of
  `Q.baseChange ℂ` by the i- and −i-eigenspaces W and W′ of J, with
  `v^(1,0)=(v−iJv)/2` and `v^(0,1)=(v+iJv)/2`
  (`TauCeti.AlmostComplexStructure.holomorphicPart`,
  `TauCeti.AlmostComplexStructure.antiholomorphicPart`);
- the normalized Fock action `TauCeti.AlmostComplexStructure.fockAction` on ΛW,
  `c(v)=√2(ε(v^(1,0))−ι(v^(0,1)))` with contraction against g_ℂ
  (`TauCeti.AlmostComplexStructure.fockAction_ι_one_tmul`), its vector square
  `c(v)²=−|v|²Id`
  (`TauCeti.AlmostComplexStructure.fockAction_ι_one_tmul_mul_self`) and the
  degree rescaling `T|_(Λ^pW)=2^(p/2)Id` intertwining it with the native action
  `ε(v^(1,0))−2ι(v^(0,1))` of `TauCeti.spinAction`
  (`TauCeti.AlmostComplexStructure.degreeScaling_comp_spinAction_eq_fockAction_comp`);
- the Hermitian form `h_ℂ(x,y)=g_ℂ(bar(x),y)` on W, with
  `h_ℂ(v^(1,0),w^(1,0))=(g(v,w)−i g(v,Jw))/2`
  (`TauCeti.AlmostComplexStructure.sesqComplexification_holomorphicPart_holomorphicPart`),
  so that Mathlib's conjugate-first form `g(v,w)−i g(v,Jw)` on (V,J) is twice the
  pullback of `h_ℂ|_W`;
- the Fock form H on ΛW, for which the increasing wedges of an h_ℂ-orthonormal
  basis of W are orthonormal, independent of that basis
  (`TauCeti.AlmostComplexStructure.toLinearMapₛₗ₂_exteriorAlgebra_eq`): creation
  and contraction are adjoint
  (`TauCeti.AlmostComplexStructure.toLinearMapₛₗ₂_wedge_left`,
  `TauCeti.AlmostComplexStructure.toLinearMapₛₗ₂_contract_left`), the normalized
  action is a *-representation for `*Cl_base`
  (`TauCeti.AlmostComplexStructure.toLinearMapₛₗ₂_fockAction_left`), and the
  native action is one for the pullback of H along T, which is `2^p H` in degree
  p (`TauCeti.AlmostComplexStructure.toLinearMapₛₗ₂_degreeScaling_of_mem_exteriorPower`).

The target kept here is the Gram-determinant formula for H. Prove that H is the
exterior Gram metric of `h_ℂ|_W`: `H(x₁∧…∧x_p, y₁∧…∧y_p)=det(h_ℂ(x_i,y_j))` for
all x_i, y_j in W, with distinct degrees orthogonal, on all of ΛW. The required
API includes:

- The formula holds in every degree, including degree zero (empty determinant 1) and the top degree, for every finite-dimensional W.
- The normalized Fock action is a *-representation for the Gram metric, and real vectors act skew-Hermitianly for it.

(Nicolaescu, Proposition 12.1.19, pp. 630–631, for the Fock action; §2.2.4,
the determinant pairing ΛʳB, p. 60, and (2.2.8), p. 61, for the Gram
determinant; Proposition 12.1.27, p. 634, for the compatible Hermitian metric
and its uniqueness up to a positive scalar.)

*Needs:* the declarations above.

**Checks.**

- In a unit J-plane, gℂ(v¹⁰,v⁰¹)=1/2 and the squared Hermitian norm of v¹⁰ is 1/2; omitting √2 gives the wrong vector square.
- On the orthonormal Fock basis (1,w), c(e₁) sends 1 to w and w to −1, while c(e₂) sends 1 to iw and w to i; both squares are −Id and the mixed sum is zero.
- T scales degrees zero and one by 1 and √2; its pulled-back squared norms are 1 and 2, excluding an isometric unrescaled intertwiner.
- For h_ℂ-orthonormal w₁,w₂ the Gram determinant of w₁∧w₂ is 1·1−0·0=1, equal to its squared H-norm; the squared norm of the antisymmetrized tensor w₁⊗w₂−w₂⊗w₁ is 2 and that of its half is 1/2, so neither tensor convention is H in degree two.

### 1.3 Adjoints, Morita evaluation and scalar trace (G1.3)

Consume the following; this subsection keeps no target.

- Adjoints. `κ_base` is `CliffordAlgebra.complexConj`, the unique
  conjugate-linear ring endomorphism of `Cl_ℂ` fixing the real vectors
  (`CliffordAlgebra.complexConj_unique`), and `*Cl_base` is
  `CliffordAlgebra.conjStar`, an involutive anti-automorphism
  (`CliffordAlgebra.conjStar_mul`, `CliffordAlgebra.conjStar_conjStar`) negating
  real vectors. On the tensor carrier it is the tensor-product star
  (`CliffordAlgebra.toBaseChange_conjStar`), with the real star-module law
  `CliffordAlgebra.starModule_of_trivialStar` enabled locally.
- Spinor metrics. For an algebra isomorphism `Cl_ℂ ≃ End_ℂ(S)`, which forces
  even dimension, S carries a positive definite Hermitian form with
  `ρ(a^{*Cl_base})=ρ(a)†` (`CliffordAlgebra.exists_sesqForm_map_eq_map_conjStar`),
  unique up to a positive real scalar
  (`CliffordAlgebra.existsUnique_pos_mul_of_surjective`). Compatibility with
  `*Cl_base` is equivalent to skew-adjointness of the real vectors
  (`CliffordAlgebra.adjoint_map_eq_map_conjStar_iff`).
- Evaluation. For S on which `Cl_ℂ` acts as all of `End_ℂ(S)` and every complex
  Clifford module E, with no finiteness or topology on E, evaluation
  `S⊗Hom_Cl(S,E) → E`, s⊗T↦T(s), is an isomorphism
  (`TauCeti.isotypicTensorEquivOfBijective`, `TauCeti.isotypicEval_tmul`). Its
  inverse in a basis of S is
  `TauCeti.isotypicTensorEquivOfBijective_symm_apply_basis`, it is natural in E
  (`TauCeti.isotypicEval_map_apply`), and for finite-dimensional E
  `dim E = dim S · dim Hom_Cl(S,E)`
  (`TauCeti.finrank_eq_finrank_mul_finrank_linearMap_of_bijective_lsmul`).
- Multiplicity metrics. For Hermitian S and E with skew-adjoint real vectors,
  `TauCeti.multiplicityMetric` is the positive definite form on `Hom_Cl(S,E)`
  with `⟨T s, U t⟩=⟨s,t⟩·m(T,U)` (`TauCeti.inner_map_map_eq_multiplicityMetric`),
  and evaluation carries the product form to the metric of E
  (`TauCeti.inner_isotypicTensorEquivOfBijective_eq`). Compatible metrics on a
  reducible E are therefore positive Hermitian forms on the multiplicity space,
  not single rescalings.
- Reverse dual. On S* the action is `(a·φ)(s)=φ(ρ(reverse(a))s)`
  (`AlgHom.cliffordReverseDual`), compatible with the Riesz-transported dual
  metric and `*Cl_base` (`AlgHom.dualMetric_cliffordReverseDual_left`); it is
  distinct from conjugate-linear Hermitian adjunction.
- Scalar trace. For every quadratic form over a ring in which 2 is invertible,
  `CliffordAlgebra.scalarTrace` is the degree-zero part under
  `CliffordAlgebra.equivExterior`, written τ. It satisfies τ(1)=1
  (`CliffordAlgebra.scalarTrace_one`), τ(ab)=τ(ba)
  (`CliffordAlgebra.scalarTrace_mul_comm`), invariance under involute and
  reverse (`CliffordAlgebra.scalarTrace_involute`,
  `CliffordAlgebra.scalarTrace_reverse`) and, over a field on a
  finite-dimensional space, `τ(a)=2^(−dim V)trace(L_a)`
  (`CliffordAlgebra.scalarTrace_eq_inv_two_pow_mul_trace_mulLeft`) and
  invariance under algebra equivalences
  (`CliffordAlgebra.scalarTrace_eq_of_algEquiv`). In an orthogonal basis
  `τ(reverse(e_I)e_J)=δ_(I,J)Π_(i∈I)b(e_i,e_i)`
  (`CliffordAlgebra.scalarTrace_reverse_basis_mul_basis`), degenerate forms
  included.
- Complexified trace. The trace of `Cl_ℂ` is the ℂ-linear extension of τ under
  `CliffordAlgebra.ofBaseChange` (`CliffordAlgebra.scalarTrace_ofBaseChange`,
  `CliffordAlgebra.scalarTrace_ofBaseChangeAux`) and
  `τ(a^{*Cl_base})=conj(τ(a))` (`CliffordAlgebra.scalarTrace_conjStar`).
- Positivity. For negative semidefinite Q, `τ(a^{*Cl_base}a)≥0`
  (`CliffordAlgebra.scalarTrace_conjStar_mul_self_nonneg`); its null set is the
  two-sided ideal generated by the radical
  (`CliffordAlgebra.scalarTrace_conjStar_mul_self_eq_zero_iff_mem_span_radical`),
  so the trace is faithful exactly when −Q is positive definite
  (`CliffordAlgebra.posDef_neg_iff_forall_scalarTrace_conjStar_mul_self_eq_zero`,
  `CliffordAlgebra.scalarTrace_conjStar_mul_self_eq_zero_iff`). The positive-form
  adjoint `κ_base∘reverse` has the same statements for positive semidefinite Q
  (`CliffordAlgebra.scalarTrace_complexConj_reverse_mul_self_nonneg`); the two
  conventions are not interchangeable.

(Nicolaescu, Corollary 12.1.22 and Remark 12.1.23, p. 632; Proposition 12.1.27, p. 634.)

**Checks.**

- For V=0, S=ℂ and E=ℕ→₀ℂ, a scalar intertwiner T is determined by T(1); evaluation sends 1⊗T to T(1), without a finite-dimensional E hypothesis.
- For E=0 the intertwiner space and tensor product are zero and evaluation is the unique equivalence 0≃0; for E=S the identity intertwiner evaluates s⊗Id to s.
- For the negative line a+be, e²=−1, normalized real regular trace is (2a)/2=a and τ(a* a)=a²+b²; at rank zero it is a and a². Thus τ(1)=1 in both ranks.
- For a=1+e₁+2e₂ with orthogonal negative unit generators, τ(a* a)=6; reversing the factors has the same scalar part. The unnormalized regular trace would give τ(1)=4.
- For a null generator e in a degenerate form, e≠0 but τ(reverse(e)e)=0; a positive unit generator gives 1 under reversal and −1 under native Clifford star. The two positivity conventions cannot be interchanged.
- Scalar conjugation and the Hermitian adjoint send i to −i, whereas native complex-linear Clifford star fixes i; on real e the negative adjoint sends e to −e.

### 1.4 Odd-dimensional factors (G1.4)

Consume, in oriented dimension n=2ℓ+1:

- the central element `ω_ℂ=i^(ℓ+1)e₁⋯e_n`, which is
  `CliffordAlgebra.complexVolume` (`CliffordAlgebra.complexVolume_mem_center`,
  `CliffordAlgebra.complexVolume_mul_self`), the idempotents (1±ω_ℂ)/2
  (`TauCeti.halfOneAdd`) and the splitting `CliffordAlgebra.equivEvenProd` of the
  algebra into two copies of its even part;
- the labels of the two irreducible modules: on an adapted spinor module with
  remainder-line coordinate λ, c(u)=λ·exterior-parity and ω_ℂ acts by iλ
  (`TauCeti.SpinPolarizationData.spinAction_complexVolume`), so λ=−i is the
  ω_ℂ=+1 module S₊ and λ=i the ω_ℂ=−1 module S₋
  (`TauCeti.SpinPolarizationData.spinAction_complexVolume_eq_one_iff`,
  `TauCeti.SpinPolarizationData.spinAction_complexVolume_eq_neg_one_iff`), the
  two components of `TauCeti.SpinPolarizationData.cliffordEquivEndProd`;
- the splitting of an arbitrary module E into the ±1 eigenspaces of ω_ℂ
  (`CliffordAlgebra.isCompl_eigenspace_complexVolume`), each preserved by the
  whole algebra (`CliffordAlgebra.smul_mem_eigenspace_complexVolume_of_odd`);
- the generator dictionary of `Cl_n≃Cl^even_(n+1)`: with V first and e₀ last,
  as in Mathlib's `CliffordAlgebra.EquivEven.Q'`, an even element goes to itself
  and an odd x to e₀x (`CliffordAlgebra.coe_toEven_of_mem_even`,
  `CliffordAlgebra.coe_toEven_of_mem_odd`); after complexification along
  `CliffordAlgebra.EquivEven.complexProdIsometryEquiv` the map ψ satisfies
  `ψ(ω_ℂ)=−Γ_(V⊕ℝ)` for the orientation (e₁,…,e_n,e₀)
  (`CliffordAlgebra.EquivEven.equivOfIsometry_toEven_complexVolume`) and
  `ψ(ω_ℂ)=Γ_(V⊕ℝ)` with e₀ first
  (`CliffordAlgebra.EquivEven.equivOfIsometry_toEven_complexVolume_of_cons`), and
  ω_ℂ acts through ψ by −μ on the μ-eigenspace of Γ_(V⊕ℝ)
  (`CliffordAlgebra.EquivEven.equivOfIsometry_toEven_complexVolume_smul`).

Two targets are kept. The required API includes:

- Two-factor evaluation. For every complex Clifford module E and each sign,
  evaluation `S_±⊗Hom_Cl(S_±,E) → E` is injective with image the ±1 eigenspace
  of ω_ℂ, and `Hom_Cl(S_∓,E^±)=0`; for finite-dimensional E,
  `dim E^± = 2^ℓ·dim Hom_Cl(S_±,E)`. Every module therefore has one multiplicity
  space for each factor.
- Restriction intertwiners. For the orientation (e₁,…,e_n,e₀) and a spinor
  module S of V⊕ℝ, the restriction along ψ of S⁻ is isomorphic to S₊ and that
  of S⁺ to S₋, by intertwiners unique up to a nonzero scalar; with e₀ first the two labels
  are interchanged.

Prove the first by applying G1.3's evaluation to each eigenspace, on which the
algebra acts through its quotient by (1∓ω_ℂ), identified with `End_ℂ(S_±)` by
the matching component of `cliffordEquivEndProd`. The second follows from the
first with the eigenvalue of ω_ℂ computed by the ψ-identity above and
`dim S^± = 2^ℓ = dim S_±`. This labels central factors; it is not an
even-dimensional chirality splitting of an ungraded odd irreducible module.

(Nicolaescu, Lemma 12.1.29 and Proposition 12.1.30, pp. 634–635.)

*Needs:* the declarations above; G1.3 evaluation; G2.1 for the half-spin spaces of V⊕ℝ.

**Checks.**

- In rank one c(e)=−i gives ω=i(−i)=1, while c(e)=i gives ω=−1; the labels distinguish the two factors.
- In the ordered plane (e₁,e₀), ψ(ie₁)=ie₀e₁=−ie₁e₀=−Γ, so the positive odd factor restricts the negative half-spin space.
- The projectors (1±ω)/2 act as (1,0) and (0,1) on the two factors; omitting either projector loses one summand.
- In rank one let E=S₊⊕S₊⊕S₋. Then E⁺ has dimension 2 and E⁻ dimension 1, with multiplicity spaces of dimensions 2 and 1; a single multiplicity space for both factors would give equal dimensions.

### Examples

The negative line, the polarized unit plane and the scalar rank-zero algebra
fix the normalization; G1.3 also tests an infinite-dimensional multiplicity module.

### Dependencies

Mathlib's Clifford and exterior algebras and the Tau Ceti declarations named
above; no roadmap supplier.
## Layer 2: Volume, chirality and exterior-form comparisons

Consume the pinned pointwise metric package: Mathlib's Gram metric on exterior
powers (`exteriorPower.inner_ιMulti_ιMulti`), the real Hodge star
`Orientation.hodgeStar`, characterized by `α∧*β=⟨α,β⟩vol`
(`Orientation.wedgePairing_hodgeStar`), its complex-linear extension
`Orientation.complexHodgeStar` and the Gram metric
`LinearMap.BilinForm.sesqComplexification` of complexified forms. This
finite-dimensional package precedes ComplexKahlerGeometry K5's bundle and
analytic Hodge theory and is independent of Clifford representations. G2 names
the Tau Ceti chirality declarations and keeps the comparisons with that package;
R7 retains its real-bundle Weitzenböck/star specialization on the same carrier.

### 2.1 Intrinsic chirality (G2.1)

Consume the following; this subsection keeps no target. V is oriented of
dimension n, with orientation o.

- The real volume element `CliffordAlgebra.volumeElement`, defined without a
  frame and equal to c(e₁)⋯c(e_n) for every positively oriented orthonormal
  basis (`CliffordAlgebra.volumeElement_eq`).
- The normalized complex volume Γ, `CliffordAlgebra.complexVolume`: it is
  `i^⌊(n+1)/2⌋` times the image of the real volume element, hence
  `Γ=i^ℓ c(e₁)…c(e_(2ℓ))` in dimension 2ℓ (`CliffordAlgebra.complexVolume_eq`),
  independent of the positively oriented frame, and it changes sign with the
  orientation (`CliffordAlgebra.complexVolume_neg_orientation`). For a real
  action ρ of `CliffordAlgebra Q` on a complex space in dimension 2ℓ, Γ acts as
  i^ℓ times ρ of the real volume element.
- Γ²=1 (`CliffordAlgebra.complexVolume_mul_self`), `Γ^{*Cl_base}=Γ`
  (`CliffordAlgebra.conjStar_complexVolume`), so ρ(Γ)†=ρ(Γ) in every
  *-representation, while the complex-linear star gives `star Γ=(−1)^ℓ Γ`
  (`CliffordAlgebra.star_complexVolume`).
- In even dimension Γ anticommutes with every vector
  (`CliffordAlgebra.complexVolume_mul_ι_of_even`) and Γa=(−1)^deg(a)aΓ for
  homogeneous a (`CliffordAlgebra.complexVolume_mul_eq_involute_mul`).
- Every complex Clifford module E, of any dimension, is the direct sum of the
  ±1 eigenspaces of Γ (`CliffordAlgebra.isCompl_eigenspace_complexVolume`) with
  projections (Id±Γ)/2
  (`CliffordAlgebra.projection_eigenspace_complexVolume_apply`); S⁺ and S⁻ are
  these eigenspaces of a spinor module.
- Through G1.3's evaluation the eigenspaces of E are `S⁺⊗Hom_Cl(S,E)` and
  `S⁻⊗Hom_Cl(S,E)` (`TauCeti.eigenspaceTensorEquivOfBijective`,
  `CliffordAlgebra.finrank_eigenspace_complexVolume_eq_mul_finrank_linearMap`).
- Naturality: an orientation-preserving isometry carries Γ to Γ
  (`CliffordAlgebra.map_complexVolume`) and an intertwiner along it maps
  eigenspaces to eigenspaces (`CliffordAlgebra.map_eigenspace_complexVolume`); an
  orientation-reversing one interchanges the labels.
- On the adapted Fock module, for the orientation `(u₁,Ju₁,…,u_ℓ,Ju_ℓ)`, Γ is
  exterior parity (`TauCeti.AlmostComplexStructure.fockAction_complexVolume`),
  with the even forms, containing the vacuum, as S⁺ and the odd forms as S⁻
  (`TauCeti.AlmostComplexStructure.eigenspace_fockAction_complexVolume_one`,
  `TauCeti.AlmostComplexStructure.eigenspace_fockAction_complexVolume_neg_one`).
- Rank zero: Γ=1 for the positive orientation
  (`CliffordAlgebra.complexVolume_positiveOrientation`) and Γ=−1 for the
  negative one, which interchanges the half-spin labels; the zero-frame carrier
  is unchanged.

(Nicolaescu, chirality discussion and Exercise 12.1.24, p. 632.)

**Checks.**

- On the Fock plane Γ=diag(1,−1); Γ²=Id, the positive space is the vacuum line and the negative space is the degree-one line. Both projections have rank one.
- Reversing the plane orientation changes Γ to diag(−1,1), interchanging the eigenspaces; the mixed relation Γc(e₁)+c(e₁)Γ is zero.
- For V=0 with its positive orientation the empty product is Id, S⁺=S and S⁻=0; for S=0 both eigenspaces are zero and remain complementary.
- On ℂ for the negative line, c(e)=i is skew-adjoint and squares to −1; c(e)=1 squares to +1 and is not an action of the negative form.

### 2.2 Hodge and exterior-module comparison (G2.2)

Consume:

- the Clifford action on forms, `c(v)=ε(v)−ι(v)`
  (`CliffordAlgebra.exteriorAction`, `CliffordAlgebra.exteriorAction_ι`), graded
  for exterior parity (`CliffordAlgebra.exteriorAction_mem_evenOdd`), and its
  complexification `CliffordAlgebra.baseChangeExteriorAction`;
- the action of the volume on a p-form in dimension 2ℓ,
  `Γω=i^(ℓ+p(p−1))*ω`, for the complex-linear star
  `Orientation.complexHodgeStar`
  (`CliffordAlgebra.baseChangeExteriorAction_complexVolume_of_eq_two_mul`), with
  the real statement `CliffordAlgebra.exteriorAction_volumeElement` valid for
  both orientations;
- the metric normalization: for a spinor module S with skew-adjoint real
  vectors, the inverse Chevalley map followed by ρ carries the form making the
  increasing wedges of an orthonormal frame orthonormal to the normalized
  Hilbert–Schmidt form `2^(−ℓ)tr(A†B)`
  (`CliffordAlgebra.inv_two_pow_mul_trace_adjoint_map_equivExterior_symm_mul`),
  so the ordinary Hilbert–Schmidt squared norm carries the factor 2^ℓ;
- conjugation by Γ is the grade involution
  (`CliffordAlgebra.complexVolume_mul_mul_complexVolume`), and the chirality of
  the reverse-dual module is `(−1)^ℓ Γ_S^transpose`
  (`AlgHom.cliffordReverseDual_complexVolume`), with its eigenspaces dual to
  those of S up to that sign
  (`AlgHom.cliffordReverseDualComplexVolumeEigenspaceEquiv`).

Two targets are kept. The complex-linear star needs no comparison:
`Orientation.complexHodgeStar` is by definition the scalar extension of
`Orientation.hodgeStar` (`Orientation.complexHodgeStar_tmul`). First, prove
that the wedge form above, the Hermitian form on `ExteriorAlgebra ℂ (ℂ⊗V)` for
which the increasing wedges of the complexified orthonormal frame
`e.toBasis.baseChange ℂ` are orthonormal, is the
Gram metric of complexified forms: under `ExteriorAlgebra.baseChangeEquiv`, its
restriction to degree k is `LinearMap.BilinForm.sesqComplexification` of the
Gram metric of `⋀[ℝ]^k V`, and distinct degrees are orthogonal. Second, for
a spinor module S of an even-dimensional V with `ρ : Cl_ℂ ≃ End_ℂ(S)`, define
the forms-to-endomorphisms map `Φ : Λ*V_ℂ → End_ℂ(S)` as the inverse of
`CliffordAlgebra.equivExterior` followed by ρ, with the identification of
`ℂ⊗Λ*V` and the exterior algebra of `ℂ⊗V` given by
`ExteriorAlgebra.baseChangeEquiv`. The required API includes:

- Φ is a ℂ-linear isomorphism, sends the increasing orthonormal wedge e_I to c(e_I), and intertwines the exterior Clifford action with left multiplication on End(S).
- Under `S⊗S* ≃ End(S)`, s⊗φ↦φ(·)s, with S* the linear dual, left multiplication is ρ⊗Id, so the chiral action is Γ_S⊗Id.
- Φ carries exterior parity to A↦Γ_S A Γ_S, which is Γ_S⊗Γ_S^transpose on S⊗S*; the second factor is the induced dual parity, not the reverse-dual chirality `(−1)^ℓ Γ_S^transpose`, and the chiral and parity decompositions of forms are different.

(Nicolaescu, Example 12.1.25, equation (12.1.1), p. 633.)

*Needs:* the declarations above; G1.3 reverse dual; G2.1; Mathlib's exterior-power Gram metric and `ExteriorAlgebra.baseChangeEquiv`; Tau Ceti's pointwise Hodge stars.

**Checks.**

- On an oriented unit plane, Γ1=i e₁₂ and Γe₁=i e₂; star-square is +1 on scalars and −1 on one-forms, yielding Γ²=1 in both cases.
- The plane Clifford identity maps to Id on a two-dimensional spinor space: its ordinary Hilbert–Schmidt squared norm is 2, while normalized squared norm is 1.
- On the plane S*, induced dual parity is diag(1,−1) but reverse-dual chirality is diag(−1,1); conflating them swaps the labels.
- On the plane, Φ(e₁)=c(e₁) is odd for exterior parity and Γ_S c(e₁) Γ_S=−c(e₁), whereas left multiplication by Γ_S sends c(e₁) to Γ_S c(e₁), which is not ±c(e₁); parity and chirality differ on one-forms.

### 2.3 Graded products and twists (G2.3)

Consume:

- the graded tensor action of an orthogonal sum,
  `c(v,w)=c₁(v)⊗Id+γ⊗c₂(w)` for a grading operator γ of the first module
  (`AlgHom.cliffordProdTensor`, `AlgHom.cliffordProdTensor_ι`), with the tensor
  grading again anticommuting with every vector
  (`AlgHom.map_mul_cliffordProdTensor_ι`);
- for oriented V of even dimension and W, the action
  `CliffordAlgebra.complexProdTensor` of the complexified Clifford algebra of
  V⊕W on E⊗F with γ=Γ_V, so `c(v,0)=c_V(v)⊗Id` and `c(0,w)=Γ_V⊗c_W(w)`
  (`CliffordAlgebra.complexProdTensor_ι_one_tmul_toLp`), and
  `Γ_(V⊕W)=Γ_V⊗Γ_W` for the ordered product orientation when W is also even
  (`CliffordAlgebra.complexProdTensor_complexVolume`);
- graded twists: for a graded module E with grading γ the twisting grading
  `γΓ` (`CliffordAlgebra.twistingGrading`) induces the grading of the
  multiplicity space, evaluation carries γ to `Γ_S⊗γ_W`
  (`CliffordAlgebra.isotypicEval_map_twistingGrading`), the even part of E is
  `S⁺⊗W⁺⊕S⁻⊗W⁻` and the odd part `S⁺⊗W⁻⊕S⁻⊗W⁺`
  (`CliffordAlgebra.eigenspaceTwistingGradingEquiv`), and for any involution
  γ_A on a complex space A the twist S⊗A has action c(v)⊗Id, tensor grading
  Γ_S⊗γ_A and intrinsic chirality Γ_S⊗Id
  (`CliffordAlgebra.map_lsmul_complexVolume_ι_smul`,
  `CliffordAlgebra.twistingGrading_map_lsmul_complexVolume_apply`);
- the eigenspaces of a tensor product of involutions,
  `Module.End.eigenspaceTensorMapEquiv`.

The targets kept are the laws of the graded product, for even-dimensional
oriented U, V, W with the negative-metric forms and complex Clifford modules
E, F, G. No ungraded algebra tensor product replaces it. The required API
includes:

- Half-spin decomposition: for the product chirality, the +1 eigenspace of E⊗F is `E⁺⊗F⁺⊕E⁻⊗F⁻` and the −1 eigenspace is `E⁺⊗F⁻⊕E⁻⊗F⁺`.
- Associativity: the associator `(E⊗F)⊗G ≃ E⊗(F⊗G)` intertwines the two product actions along the isometry `(U⊕V)⊕W ≃ U⊕(V⊕W)`.
- Graded symmetry: the Koszul swap `e⊗f↦(−1)^(|e||f|) f⊗e`, for e and f homogeneous for the chiralities, intertwines the product actions of V⊕W and W⊕V along the swap isometry, which preserves orientation, and carries Γ_V⊗Γ_W to Γ_W⊗Γ_V.
- Unit: for the zero space with its positive orientation and the module ℂ, the unitors `ℂ⊗F ≃ F` and `E⊗ℂ ≃ E` intertwine the actions.
- Orientation reversal: reversing the orientation of V replaces `c(0,w)` by `−Γ_V⊗c_W(w)`; Id⊗Γ_W intertwines the two product actions, and the product chirality changes sign.
- Duality: for finite-dimensional E and F with dim V=2ℓ, the canonical map `E*⊗F* → (E⊗F)*` intertwines the graded product of the reverse duals with the reverse dual of the graded product when ℓ is even; when ℓ is odd its composite with Id⊗Γ_(F*) does.
- Comparison with Mathlib: the product action is the composite of `CliffordAlgebra.prodEquiv` with the action of the graded tensor product of the two algebras, `(a⊗b)(e⊗f)=(−1)^(|b||e|) ρ₁(a)e⊗ρ₂(b)f` for homogeneous b and e.

Each law is checked on vectors, where both sides are given by the generator
formula for `c(v,w)`; the duality sign is G2.2's reverse-dual chirality
`(−1)^ℓ Γ^transpose`.

(Nicolaescu, Definition 2.2.42, p. 58, for the s-tensor product and its grading,
and p. 633 for the graded modules over one space as S⊗̂W; Lawson–Michelsohn,
Chapter I, §1, and Atiyah–Bott–Shapiro, §1, for the Clifford algebra of an
orthogonal sum as the graded tensor product, and Lawson–Michelsohn, Chapter I,
§5, for graded Clifford modules.)

*Needs:* the declarations above; G2.1–G2.2; Mathlib's graded tensor product; G1.3 evaluation.

**Checks.**

- On two Fock planes, ΓV⊗ΓW has eigenvalues (1,−1,−1,1); the two-plane sum has even and odd dimensions 2 and 2.
- The mixed generators cV⊗Id and ΓV⊗cW have anticommutator zero; omitting ΓV gives twice their nonzero product.
- For a purely odd one-dimensional twist A, tensor parity is −ΓS while intrinsic chirality is ΓS; a purely even line preserves ΓS.
- For odd f the Koszul swap sends c(v)e⊗f to (−1)^(|e|+1) f⊗c(v)e, equal to (Γ_W⊗c(v)) applied to (−1)^(|e|) f⊗e; the plain swap gives f⊗c(v)e against −f⊗c(v)e and is not an intertwiner.
- For the zero space with its negative orientation Γ=−1 and the product action on ℂ⊗F has c(0,w)=−c_W(w); the unitor then fails to intertwine, so the unit is the positive point.
- For V a plane, ℓ=1 and Γ_E^transpose=−Γ_(E*): the canonical map `E*⊗F* → (E⊗F)*` carries Γ_(E*)⊗c*(w) to minus the dual action of (0,w), and the correction Id⊗Γ_(F*) restores the sign.

### Examples

The Fock plane and its two-plane tensor square distinguish intrinsic chirality,
exterior parity and reverse-dual parity.

### Dependencies

G1, the Tau Ceti volume and graded-product declarations named above and the
pinned pointwise Gram metric and Hodge stars; no bundle elliptic theorem and no
roadmap supplier is needed.
## Layer 3: Smooth Clifford bundles and compatible connections

### 3.1 Clifford algebra bundles (G3.1)

The required API includes:

- Multiplication, unit, generator inclusion and adjoint are smooth bundle maps and commute with pullback.
- Equivariant algebra and module maps descend to associated bundles with the stated positive metric.

Construct the algebra bundle Cl(V,−g) and its complexification from the
orthonormal frame principal bundle by the supplier's isometry action.
Build smooth fiberwise unit/product, generator inclusion, grading, the
bundle extension of `*Cl_base`,
norm and local multiplication formulas. Use the exterior Gram norm
transported through the Chevalley map, and prove its basis-independence
and multiplication bounds rather than leaving the norm unspecified. Prove gluing, extensionality,
pullback along bundle maps, metric isometry naturality and the G1
complexification/even-algebra comparisons as smooth bundle maps. Apply
this to TM and T*M using the musical isometry and to pullback/normal bundles.
For a Lie group G with orthogonal ρ:G→O(V), unitary
μ:G→U(E) and intertwining equality
c(ρ(g)v)=μ(g)c(v)μ(g)^(−1), descend the algebra/module structures to
P×_GCl(V), P×_GV and P×_GE for any principal G-bundle P. Prove the
smooth generator/action/metric comparisons and functoriality; this includes
every associated construction satisfying the displayed intertwining law, with no compactness assumed of G.
Identify c with the corresponding tensor in V_ℂ*⊗E*⊗E, using finite-
dimensional Hom/tensor and scalar-extension maps. Prove the intertwining
equation is equivalent to that tensor being G-fixed, with the induced
tensor representation written explicitly.

(Nicolaescu, §12.1.5 and Example 12.1.33, pp. 636–637.)

*Needs:* G1.1–G1.3; SmoothBundlesConnections B1–B2; native isometry action.

**Checks.**

- For the trivial line bundle, every fiber has basis (1,e) with e²=−1 and Gram squared norm a²+b².
- The reflection e↦−e preserves this product and norm; e↦2e has square −4 and is not an isometric transition.
- For the zero vector bundle, the algebra bundle is the scalar line, not the zero bundle; its unit is 1.
- For the non-compact group G=ℝ acting on the plane by ρ(t)=rotation by 2t and on the Fock plane by μ(t)=diag(e^(−it),e^(it)), with c(e₁)=[[0,−1],[1,0]] and c(e₂)=[[0,i],[i,0]], both sides of the intertwining law at e₁ equal [[0,−e^(−2it)],[e^(2it),0]], so the descent applies; a definition requiring compactness would exclude it.

### 3.2 Hermitian Clifford modules (G3.2)

The required API includes:

- The vector-action equations and unital algebra-action presentation are equivalent.
- Module maps, isometries, sums, pullbacks and graded twists preserve their stated Clifford equations.

A Hermitian Clifford module is an existing smooth finite-rank Hermitian
vector bundle E with a smooth real-linear c:V→End_ℂ(E) satisfying the
concrete Clifford and skew-adjoint equalities. It comes with a unital
algebra-bundle action obtained by the Clifford universal property; prove
the two presentations equivalent. Define module maps, isometries, direct
sums, pullbacks, tensor twists and graded modules with anticommutation
equations, and supply local-frame change and smoothness APIs.

(Nicolaescu, Definition 12.1.64(a1), pp. 653–654.)

*Needs:* G3.1; SmoothBundlesConnections B1–B2 Hermitian bundles.

**Checks.**

- Over a point for the negative line, c(e)=i on ℂ has square −1 and adjoint −i; it defines a Hermitian Clifford module.
- The proposed c(e)=1 has square +1 and adjoint +1; it fails both required signs.
- The zero bundle is a module of rank zero: c(e)=0, Id=0 and both Clifford and skew-adjoint equations read 0=0.

### 3.3 Compatible connections (G3.3)

The required API includes:

- Clifford compatibility is equivalent to parallelness of the multiplication tensor.
- Compatible connections have the stated affine description and commute with tensor, dual and pullback constructions.

For a metric connection on V and a Hermitian connection on E, Clifford
compatibility is the actual Leibniz identity
`∇^E_X(c(v)s)=c(∇^V_Xv)s+c(v)∇^E_Xs`. Prove equivalence to ∇c=0,
affine/skew-adjoint description of compatible connections, induced
tensor/dual/pullback connections and curvature compatibility
`[R^E(X,Y),c(v)]=c(R^V(X,Y)v)`. In the principal associated construction,
use B3's invariant-vector parallel-section theorem on the invariant tensor
c. The principal connection must induce the prescribed V connection;
an arbitrary principal connection is not automatically Levi-Civita.

(Nicolaescu, Lemma 12.1.31, p. 636; Definition 12.1.64(a2), p. 653.)

*Needs:* G3.1–G3.2; SmoothBundlesConnections B3; the prescribed metric connection; Tau Ceti's `CovariantDerivative.curvatureOperator` for R^E and R^V.

**Checks.**

- For constant c(e)=i and the trivial connections, ∇(is)=i ds, equal to c(∇e)s+c(e)∇s.
- In the plane model with c(e₁)=[[0,−1],[1,0]], the skew-Hermitian connection coefficient B=diag(i,−i) has [B,c(e₁)]=[[0,−2i],[−2i,0]]≠0; Hermitian alone is insufficient.
- Flat compatible connections give Rᴱ=Rⱽ=0, so the curvature compatibility equation has both sides zero.

### 3.4 The exterior connection (G3.4)

The required API includes:

- The induced exterior connection respects the Clifford action and gives the local d and d* formulas.
- Musical and isometric pullback comparisons preserve the exterior metric and connection.

On exterior forms build the induced Levi-Civita connection, c=ε−ι,
Clifford compatibility and the local frame formulas `d=Σ ε(e^j)∇_(e_j)` and
`d*=−Σ ι(e_j)∇_(e_j)`, where d is `TauCeti.mextDerivₗ` and, on an oriented
base, d* is Tau Ceti's `TauCeti.SmoothForm.codifferential` for every
orientation; G6 then identifies its Dirac operator with d+d*. Pullback of a module
connection is general bundle functoriality; a pullback does not identify
tangent Dirac operators on manifolds of different dimensions.

(Nicolaescu, Proposition 12.2.1, p. 657.)

*Needs:* G2.2; G3.3; Mathlib's `CovariantDerivative.leviCivitaConnection` and its smoothness `CovariantDerivative.instContMDiffCovariantDerivativeLeviCivitaConnection`; SmoothBundlesConnections B2.1 and B3.3 for the exterior-power bundle and its induced connection; Tau Ceti's smooth forms, exterior derivative and codifferential.

**Checks.**

- On ℝ, d(f)=f′ dx and d*(h dx)=−h′; c(dx)(f,h)=(−h,f), giving D(f,h)=(−h′,f′).
- For f=x² and h=0, D²(f,0)=(−2,0), fixing the nonnegative Laplacian sign.
- On a point d=d*=D=0; pulling back to a line still has trivial pulled-back connection, without identifying the line tangent Dirac operator.

### Examples

Trivial line and plane bundles test the distinction between a Hermitian
connection and a Clifford-compatible one.

### Dependencies

G1–G2, SmoothBundlesConnections B1–B3, Mathlib's Levi-Civita connection with
Tau Ceti's smoothness instance and curvature operator, and Tau Ceti's smooth
forms and codifferential.
## Layer 4: Spin lifts, obstruction and classification

### 4.1 Topological and smooth frame adapters (G4.1)

The required API includes:

- The frame adapters intertwine the vector action and preserve determinant, central kernel and basis changes.
- The Lie differential is bijective and the transported covering has smooth local inverse sections.

#### G4.1a Topological frame adapters

For n≥1 consume the native
positive-form compact real covering
`CliffordAlgebra.isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom`
in `Topology/Algebra/CliffordAlgebra/Spin/Covering.lean`, with
`instCompactSpaceRealCliffordSpinGroupZero` from `Compact.lean` and the
supplied surjectivity/central two-element kernel. Native
`pathConnectedSpace_realCliffordSpinGroupZero_add_two` supplies
path-connectedness for n≥2 independently of this covering.
Consume `TauCeti.CliffordAlgebra.realCliffordSpinContinuousMulEquivUnitsRange`;
the canonical topological Spin-to-units-range comparison is already native.
For SO consume `TauCeti.QuadraticMap.isEmbedding_specialOrthogonalToGeneralLinear`,
`matrixSpecialOrthogonalEquivWeightedSumSquaresOne`, its forward/inverse
continuity theorems and
`mem_range_specialOrthogonalToGeneralLinear_realCliffordForm_iff`, and
`realCliffordForm_zero_eq_weightedSumSquares_one`.
Own their general oriented-orthonormal-basis conjugation and vector-action,
determinant and basis-change laws, and transport the native cover through
these topological frame adapters, using their native default topologies.
Include their compatibility with the native
continuous projection
`TauCeti.CliffordAlgebra.realCliffordSpinToSpecialOrthogonalRange` and
`realCliffordSpinToSpecialOrthogonalRange_surjective`. Prove the Spin(2) squaring-cover
identification. In rank1 prove Spin={±1} and SO={1}. Native Mathlib
Spin(0), generated by invertible vectors, is {1}; for geometric rank0
lift data consume G1.1's μ₂⊂Cl(0)=ℝ and construct μ₂→SO(0)={1},
keeping the native trivial group distinct. All lift/direct-sum formulas use that geometric branch.
This subsection precedes C3.5 and supplies its frame/rank0 adapters.

#### G4.1b Smooth refinement

Consume
`Geometry/Lie/CliffordAlgebra/Spin/Projection.lean`'s closed-subgroup
Lie structures on the Spin range in Clifford units and SO range in matrix
units, `realCliffordSpinToSpecialOrthogonalSmoothRange` and
`realCliffordSpinToSpecialOrthogonalRangeLieMap_eq_lieMap`.
Keep these native units-range carriers as the Lie and SBC B2 frame
structure-group carriers, using SBC B2's explicit
`Matrix.linftyOpNormedRing` and `Matrix.linftyOpTopologicalSpace`
instances on the general linear ambient group, as in the native Lie files.
Opening `Matrix.Norms.Operator` alone does not choose the topology.
Consume SBC B2's units-level identity homeomorphism from default Pi to
operator-induced GL topology and restrict it to the SO units range with
its induced subspace topology; use it to transport G4.1a's covering data.
Do not introduce second
smooth structures on the abstract Spin or matrix-submonoid SO carriers.
Consume `Differential.lean`'s
`TauCeti.CliffordAlgebra.realCliffordSpinToSpecialOrthogonalCoordinateLieHom_eq_bivectorEquivSo`;
prove bijectivity of the Lie differential by composing its coordinate
equivalences. Use
`leftInvariantDerivationLieEquivGroupLieAlgebra_lieMap` to identify
the manifold derivative at1; transport by translations and apply native
`TauCeti.isLocalDiffeomorph_of_mfderiv_eq` to prove local diffeomorphism.
Refine G4.1a's cover to a smooth covering with smooth evenly covered
local sections. Own smooth general-basis frame conjugation and the
smoothness of the composite of G1.1's negative-form comparison
from the positive Lie units range into the finite-dimensional ambient
`CliffordAlgebra (realCliffordForm 0 n)`, with its pinned
bivector/vector-action signs. A second negative-form Lie structure
is not an input to this composite.
SpinRepresentations L7 consumes native covering/connectivity for its
remaining simple-connectivity/universal-cover comparison. This smooth
refinement is independent of C3.5 and those topological conclusions.

(Nicolaescu, Proposition 12.1.42, pp. 640–641; Example 12.1.54, pp. 648–649.)

*Needs:* G1.1; native compact-real Spin covering and coordinate Lie differential; SmoothBundlesConnections B2.

**Checks.**

- The circle parameter z=i in Spin(2) maps to z²=−1; z=−1 maps to 1, giving kernel {1,−1}.
- In rank one the two Spin elements both map to the unique oriented frame; in rank zero the geometric μ₂ cover also has two points.
- The Spin(2) angle map θ↦2θ has derivative 2 and inverse differential 1/2; replacing it by derivative 1 loses the curvature-halving normalization.

### 4.2 Principal spin lifts (G4.2)

The required API includes:

- Equivalences of lifts commute with pullback and descent and preserve the map to the fixed frame bundle.
- Positive-square-root metric transport is smooth and composite metric changes agree up to the specified homotopy.

The carriers are Tau Ceti's principal bundles `TauCeti.PrincipalBundle`, with
their pullback `TauCeti.PrincipalBundle.pullback` and cocycle gluing
`TauCeti.fiberBundleCoreOfGroupCocycle`, and Tau Ceti's orthonormal frame bundle
`TauCeti.OrthonormalFrameBundle`, whose frames carry orientations by
`TauCeti.OrthonormalFrameBundle.toOrientationCover`. TopologicalKTheory T6.4
supplies numerability, bundle morphisms and associated bundles, and
CharacteristicClasses C1.0 the positively oriented SO(n) subbundle and the
metric-change transport of frames.
Use G4.1a's native Spin units range when n≥1 and G1.1's
μ₂=`evenUnitaryGroup (realCliffordForm 0 0)` when n=0 as the
topological structure group. Smooth bundles use G4.1b's Lie structure
for n≥1. For rank0 equip G1.1's same μ₂ subgroup of Cl(0)ˣ with
`TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed`'s
embedded Lie-subgroup data. Prove its Lie algebra is zero and its induced
topology discrete, giving the zero-dimensional smooth structure.
A spin structure on an
oriented metric V of rank n is a numerable principal Spin(n)-bundle P with an equivariant map P→Fr⁺_SO(V) over the
identity, inducing an isomorphism `P×_Spin SO(n)≃Fr⁺_SO(V)`.
For n≥1 this is the structure `SpinStructure` of `Suggested.lean`: a family P
with `TauCeti.PrincipalBundle` structure for `CliffordAlgebra.realCliffordSpinGroupZero n`
(identified with the units range by G4.1a's
`TauCeti.CliffordAlgebra.realCliffordSpinContinuousMulEquivUnitsRange`) and a
continuous map to `TauCeti.OrthonormalFrameBundle` over the identity, sending
p·g to the frame v↦(frame of p)(g v g⁻¹) (`CliffordAlgebra.spinVectorAction`).
It differs from the definition above in two clauses. It has no numerability
field; on the paracompact Hausdorff bases of the Conventions every principal
bundle is numerable. Its frame map lands in the full orthonormal frame bundle;
each fibre of P is a Spin(n)-torsor, so the image is one SO(n)-orbit of frames,
and the orientation of V is the one for which these frames are positive. The
isomorphism with the oriented frame bundle then follows, both fibres being
SO(n)-torsors. At n=0 the native group `CliffordAlgebra.realCliffordSpinGroupZero 0`
is trivial, so the geometric μ₂ branch is not this structure, and the Lean
structure requires n≠0. (Kirby, *The topology of 4-manifolds*, Chapter IV,
p. 33, for this principal description over CW complexes; Lawson–Michelsohn,
Chapter II, §1.)
Define equivalences, pullback and descent of Spin structures; prove
metric-change independence by composing the frame map with C1.0's transport
of orthonormal frames, the frame map B^(−1/2) of the unique positive
g-self-adjoint B with g'(u,v)=g(Bu,v), which commutes with the right
orthogonal action and has positive determinant, and so lifts Spin structures
for g to Spin structures for g'. Consume C1.0's smooth
dependence through the invertible Sylvester differential and its homotopy
comparison of composite metric changes; prove that the lift is natural under
pullback and bundle isometries and that composite metric changes of Spin
structures agree through homotopies in the contractible positive-metric
space, since noncommuting square roots need not compose literally.
A lift is data, not merely the proposition w₂(V)=0. For a smooth base
prove each continuous lift has the unique smooth structure transported
through its covering of the smooth oriented frame bundle.

(Nicolaescu, §12.2.3, pp. 668–669, for smooth tangent lifts.)

The paracompact-base generality uses the named numerable-bundle and Čech
descent suppliers; the cited smooth tangent-bundle statement alone does not
establish that extension.

*Needs:* G4.1a–G4.1b; Tau Ceti's principal bundles, cocycle gluing, orthonormal frame bundle and frame orientations; TopologicalKTheory T6.4; CharacteristicClasses C1.0; SmoothBundlesConnections B1–B2.

**Checks.**

- For g′=4g, B=4Id and B⁻¹ᐟ²=Id/2; a g-unit frame becomes g′-unit, whereas multiplication by 2 gives squared length 16.
- Over a point the lift is a Spin torsor with central automorphisms ±1, so a mere Boolean existence flag loses data.
- For the trivial oriented line over S¹, the connected and disconnected double covers are distinct lifts although both have w₂=0.

### 4.3 The spin obstruction (G4.3)

The required API includes:

- The lifted transition discrepancy defines the natural Čech obstruction class independently of the atlas.
- Vanishing is equivalent to existence of a lift, with singular comparison only on CW-type bases.

For smooth bases choose good-cover orthonormal transitions and local lifts
to Spin. For a general paracompact numerable base, consume C3.5's
atlas-refinement/local-lifting construction using locally finite shrinkings
and evenly covered neighborhoods; specialize it to the frame bundle. Use the locally constant Z/2 coefficient sheaf in its Čech groups.
Apply C3.5's universal cocycle construction and its independence,
naturality and w₂ comparison to this frame bundle. Identify the
pulled-back cocycle as the local triple-product discrepancy. Prove a spin
structure exists iff
this class vanishes, by correcting lifted transitions with a 1-cochain
and gluing. In the smooth setting use locally constant central cochains
and B1 descent. Identify singular w₂ on paracompact Hausdorff CW-type bases; do not assert
singular/Čech equality for arbitrary paracompact spaces.

(Nicolaescu, Proposition 12.2.25, p. 669, for tangent bundles on smooth manifolds.)

The paracompact-base generality uses the named numerable-bundle and Čech
descent suppliers; the cited smooth tangent-bundle statement alone does not
establish that extension.

*Needs:* G4.2; CharacteristicClasses C3.5; SmoothBundlesConnections B1/B6.0.

**Checks.**

- The oriented plane bundle over S² with Euler class 1 has w₂=1 and has no spin lift.
- TS² has Euler class 2, hence w₂=0; its lift exists even though its tangent bundle is not trivial.
- A trivial oriented bundle has transition lifts 1 and triple discrepancy 1, representing zero in additive Z/2 cohomology.

### 4.4 The torsor of lifts (G4.4)

The required API includes:

- Central twisting acts freely and transitively on lift classes, retaining relative gauge transformations.
- Ordered direct sums are associative and commute with pullback and metric transport, including geometric rank zero.

Given one lift, twist by a principal Z/2-bundle: on a common trivializing
cover multiply the Spin transition cocycle by the central ±1 cocycle and glue
by Tau Ceti's `TauCeti.fiberBundleCoreOfGroupCocycle`, which is principal, with
`TauCeti.homeomorphOfCohomologous` making the result independent of the
cocycle representatives on that cover and T6.4's refinement comparison
independent of the cover; −1 acts trivially on frames, so the frame map
descends. Prove this action is free
and transitive on equivalence classes, giving an H¹(X;Z/2) torsor, with
explicit relative gauge transformations and cocycle comparisons. Construct
product/direct-sum lifts using `(Spin(m)×Spin(n))/{(1,1),(−1,−1)}`
and the actual homomorphism to Spin(m+n). Pin the ordered orientations,
associativity, pullback and metric-change maps, and their low-rank central
kernels, using the μ₂ geometric branch whenever a rank is 0. The rank 0
frame bundle is C1's canonical oriented zero-frame bundle; retain any
additional rank-zero orientation sign as separate data in chirality and
characteristic comparisons. The rank 0 unit is the trivial μ₂ lift; an arbitrary rank 0 lift acts by its central
flat-line twist. This is a construction on supplied bundles, not an assertion
that every oriented bundle is spin.

(Nicolaescu, Remark 12.2.28 and Exercise 12.2.29, p. 669.)

The paracompact-base generality uses the named numerable-bundle and Čech
descent suppliers; the cited smooth tangent-bundle statement alone does not
establish that extension.

*Needs:* G4.2; Tau Ceti's cocycle gluing and cohomologous-cocycle homeomorphism; TopologicalKTheory T6.4 for numerability and associated bundles.

**Checks.**

- On S¹, H¹=Z/2: twisting twice by the nontrivial cover returns the initial lift, while one twist interchanges the two lifts.
- On T², H¹=(Z/2)² gives four lifts; changing only one generator produces a different lift.
- At rank zero the trivial μ₂ lift is the direct-sum unit; the nontrivial μ₂ lift on S¹ acts by a flat line with holonomy −1.

### 4.4a Skeletal frames and low-rank stabilization (G4.4a)

The required API includes:

- The skeletal quotient and principal lift classes are inverse natural comparisons, with difference given by the H¹ cocycle.
- Framed stabilization is an equivalence of lift groupoids; rank-two existence is integral divisibility of e by 2.

On a Hausdorff CW base X,
construct the following comparison with G4.2's actual lifts. In positive
rank, unrestricted orthonormal frames over X⁰ which admit extension to X¹,
modulo homotopy over X⁰, classify the orientations of V, the continuous
sections of Tau Ceti's orientation double cover
`TauCeti.VectorBundleOrientationCover`
(`TauCeti.VectorBundleOrientation.nonempty_iff_exists_section`), a frame
carrying its orientation by `TauCeti.OrthonormalFrameBundle.toOrientationCover`.
Their existence obstruction is w₁, the class of that cover
(CharacteristicClasses C3.2); when nonempty they form an
H⁰(X;Z/2) torsor. An identification with H⁰ requires a chosen orientation.

Fix an orientation and rank n≥3. Define skeletal Spin data to be positive
orthonormal frames over X¹ which admit extension to X², modulo homotopy
through frame sections over X¹. Extension is a property, not extra chosen
data. Allow the frames at vertices to move during the homotopy. Construct
an equivalence between this quotient and the isomorphism classes of
G4.2's Spin lifts. This quotient does not retain the lifts' H⁰(X;Z/2)
automorphisms. Consume SpinRepresentations Layer2's
`SpinCompactTopologyFoundation`: π₀Spin(n)=π₁Spin(n)=0 lets a lift admit a
Spin frame over X², and makes any two choices homotopic over X¹. Project
its restriction to obtain the skeletal class. Use AT8.9's actual cellular
obstruction/cochain machinery and the CW weak topology, including infinite
CW bases; no finiteness or global framing of V is assumed.

Identify each 2-cell's frame-extension loop under the Spin-cover
monodromy π₁SO(n)≃Z/2 with G4.3/C3.5's obstruction cocycle. Its class is
w₂(V). A fixed skeletal frame extends precisely when its obstruction
cochain vanishes; existence of some such frame is equivalent to w₂(V)=0.
For two extendible frames, choose paths between their vertex frames and
take the edge-loop monodromies. Prove these form a cellular 1-cocycle;
changing the vertex paths changes it by a coboundary. Homotopies with
moving vertex frames give precisely the same H¹ class. Identify this
difference and its free transitive action with G4.4's central-bundle twist.
Construct the inverse comparison using G4.3 to choose an initial lift and
G4.4 to correct its skeletal difference by twisting. Prove independence
of that choice and both inverse laws. Give pullback naturality for cellular
maps, skeletal restriction, cellular subdivision and metric-change
comparisons. The bijection with H¹ requires a chosen Spin structure.

For n=1,2 fix the standard framed positive trivial summand ε^(3−n).
Prove stabilization and reduction are inverse equivalences of Spin-lift
groupoids for V and V⊕ε^(3−n). Construct the block inclusions and identify
the actual pullback double cover
`Spin(3) ×_(SO(3)) SO(n) ≃ Spin(n)`; at n=1 it is μ₂ over the trivial
SO(1), and at n=2 it is the circle squaring cover. Apply the skeletal model
to this stabilized rank-three bundle. For rank two, an unstabilized frame
over X¹ extending to X² instead forces e(V)=0. Prove Spin existence iff
e(V) belongs to 2H²(X;Z), including torsion, using ρe=w₂ and the integral
coefficient exact sequence. This is
`nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul`: for a real
rank-two bundle with a continuous fibre metric over a Hausdorff CW complex and
an integral Thom class u (`TauCeti.IsThomClass`), a structure `SpinStructure`
exists iff `TauCeti.eulerClass` of u is twice an integral class. Divisibility
by two does not depend on the sign of u, and w₂ does not depend on the
orientation, so this is the condition for either orientation. For rank one an
orientation trivializes V, but its Spin lifts still form the H¹ torsor.
Rank zero retains G4.4's separate geometric μ₂ and orientation conventions.

Check the distinction on TS²: its Euler number is 2, it has a unique Spin
structure, and the radial stable framing TS²⊕ε¹≃ε³ from C7.3 supplies
skeletal data although TS² has no global frame. Match the edge differences
on S¹ and T² with G6.5's two circle lifts and four torus lifts, including
the lift defined by the Lie framing and their G4.4 twists.

(Kirby, *The topology of 4-manifolds*, Chapter IV, pp. 33–34, for the
skeletal and principal descriptions, stabilization and the H¹ torsor.)
The cellular cochains, moving-vertex homotopies and infinite-CW naturality
use AlgebraicTopology §8.9; the integral rank-two criterion uses
CharacteristicClasses C3.2's equality w₂=ρe and the coefficient exact sequence.

*Needs:* G4.2–G4.4; AlgebraicTopology §8.9; SpinRepresentations Layer 2; CharacteristicClasses C3.2 and C7.3 for w₁, the Euler comparison and the radial stable framing; Tau Ceti's orientation double cover and frame orientations; Tau Ceti's Thom and Euler classes for the rank-two statement.

**Checks.**

- TS² has e=2 and w₂=0: its stabilized bundle is trivial and it has one spin structure, but its unstabilized two-plane bundle has no global frame.
- For the trivial rank-three bundle on S¹, the two loop classes in SO(3) give two skeletal classes and two lifts; keeping only globally constant frames loses one.
- The plane bundle on S² with e=1 stabilizes with w₂=1 and has neither extendible skeletal data nor a spin lift.
- If H²(X;Z)=Z/2 and e is its nonzero class, 2H²=0 so no root exists; rational vanishing of e does not establish divisibility by 2.
- Reversing the orientation replaces u by −u and e by −e: on S² the plane bundle with e=1 gets e=−1, still not twice a class, and TS² gets −2=2·(−1), still twice a class; a criterion asking for e=2c with c≥0 in H²(S²;Z)=Z would wrongly exclude the reversed TS².

### Examples

TS², the two circle lifts and the four torus lifts distinguish lift data,
existence and a chosen trivialization.

### Dependencies

G1.1, the native covering/Lie projection, Tau Ceti's principal bundles, cocycle
gluing, orthonormal frame bundle and orientation double cover, TopologicalKTheory T6.4,
CharacteristicClasses C1/C3.2/C3.5/C7.3, AlgebraicTopology §8.9 and SpinRepresentations
Layer 2.
## Layer 5: Spinor bundles, chiral products and rank-two roots

### 5.0 Real regular Clifford spinors (G5.0)

The required API includes:

- The real regular bundle preserves its metric, parity and left Clifford action under spin transitions.
- The fixed external positive action is self-adjoint, odd and parallel and anticommutes with tangent multiplication.

Construct realCliffordSpinorBundle
for an oriented rank-n metric Spin bundle P as
P×_Spin(n)Cl(0,n), with Spin acting by left multiplication through
G1.1/G4.1's specified negative even-unitary comparison. Give its smooth
quotient/local-transition, vector-bundle, pullback, Spin-isometry,
metric-change and change-of-lift APIs. The ordered Clifford monomials
are an orthonormal real basis; prove the Spin action preserves this
positive metric and parity ε. In rank zero use the geometric μ₂ branch
with its scalar ±1 action and the separate rank-zero orientation sign σ.
Set ε_σ=σ Id on Cl(0,0)=ℝ: the positive point's real line is even
and the negative point's line is odd. Retain this signed grading in
pullback, stabilization and the Morita comparisons. Tangent Clifford multiplication c₋(v) is
left multiplication, odd and skew-adjoint. Identify this action through G3.1's
algebra-bundle comparison `P×_{Spin,Ad}Cl(0,n) ≃ Fr_SO×_{SO}Cl(0,n)`,
using G1.1's pinned vector-conjugation action.
Construct realCliffordSpinorPositiveRightAction of the fixed external
native Cl(n,0): on the model C₊(w)s=ε(s)·ι₋(w), multiplication
on the right by the negative Clifford vector after parity; the model is
Tau Ceti's `CliffordAlgebra.parityTwistedRightAction`, with its positive
relation, even-element equivariance and trace-pairing symmetry. This is
distinct from the tangent action c₋(v)s=ι₋(v)·s on the left.
Prove its positive Clifford relation, oddness,
self-adjointness, Spin-equivariance and anticommutation with the left
negative tangent action. It descends as an action of this fixed algebra
on every fibre and is parallel for the associated connection induced by any
supplied principal Spin connection. In particular, it is parallel for the
Levi-Civita lift constructed in G5.1.
Compare the external positive Clifford representation and its
parity-twisted right negative Clifford action with GeneralizedCohomology
G5.5's mixed-signature operator conventions. Positive and negative
odd generators are not identified by an algebra isomorphism.

The regular-module metric and parity follow from the ordered-monomial
Clifford/exterior identification and its adjoint identity (Nicolaescu,
§12.1.2, pp. 628–629, Exercise 12.1.15 and Example 12.1.18).
For the external action, write C₊(w)=R_(ι₋(w))ε: right multiplication
is skew-adjoint and anticommutes with ε, so their composite is
self-adjoint and has square |w|²Id. Even left Spin multiplication commutes
with both factors. SmoothBundlesConnections B2.1 and B3.3 then descend
these identities and their invariant tensors to the associated bundle
and connection. This derives the fixed positive action from G1.3 and
the stated suppliers; it is not an additional real-module theorem claimed
from the source's complex spinor construction.

*Needs:* G1.1/G1.3; G3.1/G3.3; G4.1–G4.4; SmoothBundlesConnections B2.1/B3.3; a principal Spin connection; GeneralizedCohomology G5.5 action conventions.

**Checks.**

- On Cl(0,1) with basis (1,e), C₊(e) has symmetric matrix [[0,1],[1,0]] and square Id; left c₋ has skew-symmetric matrix [[0,−1],[1,0]] and square −Id.
- On the same basis, C₊c₋+c₋C₊=0; untwisted right multiplication would have square −Id and fail the required positive action.
- At a signed rank-zero point the real fiber has dimension 1 and parity σ: σ=1 gives an even line and σ=−1 gives an odd line.

### 5.1 Complex spinor bundles (G5.1)

The required API includes:

- Spinor association commutes with spin-isometry pullback, orientation reversal and central-line twisting.
- The lifted connection is Clifford-compatible and preserves even-dimensional chirality.

Associate the irreducible complex Clifford module S to a chosen lift;
its Spin action is obtained by restriction along G1.1’s positive-to-negative
even-algebra comparison. Build S(V), its positive metric,
Clifford action and, in even dimension,
the G2 half-spin subbundles. Give local transition/rank formulas,
functoriality under spin isometries, pullback, orientation reversal and
change of spin structure by a flat central line. In odd dimension retain
the chosen Clifford factor for S(V), and also construct the faithful
ungraded module S_odd^+⊕S_odd^- from both ω-labeled factors, with its
metric and diagonal action/connection. This is the source's “complex
spinor module”; its factor labels are not an even-dimensional chiral
grading. The chosen-factor geometric spinor has half its rank. Lift the metric connection through the Lie
algebra isomorphism to the principal spin connection; construct its
compatible spinor connection and curvature formula. For TM use precisely
the Levi-Civita connection, and prove Γ parallel.

(Nicolaescu, §12.2.3 and Lemma 12.2.32, pp. 670–672.)

*Needs:* G1–G3; G4.1–G4.4; SmoothBundlesConnections B2–B3; for tangent bundles, Mathlib's `CovariantDerivative.leviCivitaConnection` with Tau Ceti's smoothness instance.

**Checks.**

- A rank-two spinor fiber has complex rank 2, with half-spin ranks (1,1); rank four gives (2,2).
- A rank-one chosen Clifford factor has complex rank 1; the faithful sum of both factors has rank 2 and is not a chiral splitting.
- Changing the circle lift changes spinor holonomy from +1 to −1 while preserving rank 1.

### 5.2 Bundle products (G5.2)

The required API includes:

- The graded bundle product realizes the actual spin-lift product and its virtual K-class.
- Its intertwiners preserve the ordered half-spin decomposition and rank-zero unit.

Prove the smooth bundle version of G2's graded tensor product for direct
sum spin lifts. On compact bases, in TopologicalKTheory T2's supplied K-ring derive
`[S⁺(V⊕W)]−[S⁻(V⊕W)]=([S⁺(V)]−[S⁻(V)])([S⁺(W)]−[S⁻(W)])`.
Keep actual spin structures and intertwiners in the bundle theorem; an
equality of ungraded ranks alone does not prove this formula.

(Lawson–Michelsohn, Chapter I, §1, and Atiyah–Bott–Shapiro, §1, for the
Clifford algebra of an orthogonal sum, and Lawson–Michelsohn, Chapter I, §5,
for its graded modules; the bundle statement follows by associated-bundle
transport, and the K-class identity is the ring law of TopologicalKTheory T2
applied to the graded isomorphism.)

*Needs:* G2.3; G4.4; G5.1; TopologicalKTheory T2.

**Checks.**

- Two rank-two spinor fibers have chiral ranks (1,1); their product has ranks (2,2), and virtual rank 0=0·0.
- A positive point has ranks (1,0), so tensoring preserves the ordered half-spin pair.
- A negative point has ranks (0,1); tensoring interchanges the pair and negates its virtual K-class.

### 5.3 Plane-bundle square roots (G5.3)

The required API includes:

- The square-root equivalence retains its root isomorphism and commutes with pullback and orientation reversal.
- The induced connection halves the plane curvature and has the displayed positive and negative spin characters.

For an oriented metric two-plane bundle let E=(V,J), J the positive
quarter-turn. Pin the spin parameter
`z=cos θ+sin θ e₁e₂` in Cl(V,−g), whose conjugation rotates V by
2θ. The corresponding positive-form units-range element is
`cos θ−sin θ e₁e₂` by G1.1's bivector sign. Thus E has
weight z². With the G1 Fock action and Γ=i c(e₁)c(e₂), S⁺ has weight
z^(−1) and S⁻ weight z. Thus `(S⁺)²≃E*`, `(S⁻)²≃E` and
`S⁻≃(S⁺)*`. Prove the equivalence of spin lifts with Hermitian line
square roots of E (including the root isomorphism), and construct the
connections with curvature halving. The labels must obey these explicit
characters; reversing the orientation interchanges them. In this convention the square root of E is S⁻, while S⁺ is its dual.

Compare this description with G4.4a's rank-two criterion. Under the
equivalence, a Spin lift of (V,J) is a Hermitian line L with a chosen
isomorphism `L⊗L≃E`, and the root isomorphism is retained as part of the
data, not only the isomorphism class of L. Prove that the two existence
statements agree: a root exists precisely when e(E)=2c₁(L) is solvable in
H²(X;Z), which is G4.4a's condition e(V)∈2H²(X;Z), and that the H¹(X;Z/2)
torsor of G4.4 acts on roots by tensoring with the flat real line bundle's
complexification: this changes the root isomorphism, and changes c₁(L) by
the integral Bockstein of the twisting class, which vanishes when H²(X;Z)
has no 2-torsion but not in general.

(Nicolaescu, Example 12.1.54, pp. 648–649, for the squaring cover.)

*Needs:* G1.2; G4.1–G4.4; G4.4a for the rank-two criterion; G5.1; TopologicalKTheory line-bundle classification.

**Checks.**

- At θ=π/2, z=i acts on E by −1 and on S⁺,S⁻ by −i,i; their squares both give −1, and their distinct characters fix the labels.
- On S² with e(E)=2, a root has Chern class 1 and its dual has class −1; S⁻ is the root of E.
- On S² with e(E)=1, the equation 2c₁(L)=1 has no integral solution, so no root or spin lift exists.
- On T² the trivial plane bundle has e=0 and four roots, all with c₁=0, differing by the four flat real lines complexified; a comparison that recorded only c₁(L) would count one.
- On ℝP³ with E trivial, the two roots are the trivial line and the complexified tautological real line, whose c₁ is the nonzero element of H²(ℝP³;Z)=Z/2; twisting does not preserve the isomorphism class of L there.

### Examples

The two plane characters and signed rank-zero lines fix products, duals
and the square-root label.

### Dependencies

G1–G3, G4.1–G4.4a and associated connections; TopologicalKTheory T2 for virtual classes
and GeneralizedCohomology G5.5 for mixed-signature conventions.
## Layer 6: Dirac operators and curvature formulas

### 6.0 Real Clifford-linear analytic index (G6.0)

The required API includes:

- The closed real realization preserves the common H¹ domain and the right Clifford module action.
- The index is invariant under the specified metric families, multiplicative and sign-reversing under orientation reversal.

On any boundaryless oriented
Riemannian Spin manifold M, use G5.1's Levi-Civita Spin connection on
G5.0's real regular Clifford bundle and define
realSpinDiracOperator=Σ c₋(e_j)∇_(e_j). Prove frame independence,
real locality/Leibniz/symbol/ellipticity and formal-adjoint integration,
ε-oddness and D C₊(w)=−C₊(w) D on the stated domains. For every
boundaryless M, export the real geometric principal symbol
`σ_geom(D)(ξ)=c₋(ξ♯)` and real `H^s_loc` elliptic regularity for every
real s, with the local symbol and complexification/restriction maps. Derive
this by complexifying the real regular bundle, applying G6.1 and
PDO P1.0/P4–P6 with K5a's complexified bundle-distribution/Sobolev
theory, and descending to its real fixed part. This is a local elliptic
statement for the first-order symbol and does not assert self-adjointness
or a global Fredholm index on noncompact M. This local branch does not
require compactness. On a closed base, identify the actual real H¹/L² carriers and construct
realSpinDiracClosedRealization by G6.1's closed-base H¹-domain and
adjoint theorem on the full complexification. Descend through K5a's
real bundle-Sobolev fixed-space comparison and G5.5's identity
`(D_C)†=(D†)_C` with equal domains. Prove self-adjointness, compact
resolvent and a finite-dimensional smooth kernel.
Consume G5.5's `realHilbertClosedFunctionalCalculus` on the scalar
real L² space first, before the finite-Clifford regular-module
comparison, and identify its resolvents and bounded transform.
Construct its actual right Hilbert Cl(0,n)-module completion using
`⟨s,t⟩_A=∫_M s(x)^{*_{Cl(0,n)}}t(x) dvol_g`, where the negative
Clifford adjoint is the real p=0 native Clifford star
`reverse∘involute` and is identified with G5.5's C*-adjoint through
`realMixedCliffordCStarModelEquiv`; every norm of a native Clifford
element here means the norm of its image in that designated C*-model.
The product is independent of Spin
frames since their left action is Clifford-unitary. Prove positivity and
the right-module laws `⟨sa,tb⟩_A=a*⟨s,t⟩_A b`,
`⟨s,t⟩_A*=⟨t,s⟩_A`. Define the module norm separately by
`‖s‖_A²=‖⟨s,s⟩_A‖`; prove completeness and countable generation. The
normalized scalar-coefficient trace gives the scalar real L² inner product,
and the resulting module norm is equivalent to (not asserted equal to) the
scalar L² norm. Prove compatibility with the connection and D's
domains/adjoint; D is right A-linear for this affiliated right
`A=Cl(0,n)` action, distinct from G5.0's parity-twisted external
positive `Cl(n,0)` action. Consume G5.5's
`realFiniteCliffordAdjointableComparison`,
`realFiniteCliffordCompactComparison` and
`realFiniteCliffordRegularOperatorComparison` to identify bounded
A-linear operators and their real adjoints with module-adjointable
operators, real-compact A-linear operators with K_A, and the closed
self-adjoint A-linear Dirac realization with a regular module operator.
Verify its A-invariant domain and transport its real-compact
resolvent to K_A before applying module functional calculus.
Use G5.5's real finite-Clifford module interface here;
Mathlib's complex CStarModule is not instantiated with A=Cl(0,n).
Consume `realFiniteCliffordContinuousFunctionalCalculus` for bounded
real self-adjoint operators and `realFiniteCliffordClosedFunctionalCalculus`
after the regular-operator comparison for D, with its equality of module
and real Hilbert functional calculi and matching bounded transforms.
Consume GeneralizedCohomology G5.5's
`realFiniteCliffordHilbertModuleStabilization`: write A=Cl(0,n),
Std_A=U_(0,n) graded-⊗ A and use its even A-unitary
L²(realCliffordSpinorBundle)⊕Std_A≃Std_A. U_(0,n) is the scalar
graded real Hilbert universe,
whereas Std_A is the right A-module. Transport compact operators
through K_A(Std_A)≃A graded-⊗K(U_(0,n)), retaining parity and the
specified essential-support/Fredholm functional-calculus comparison.
Prove independence of stabilization and finite-support choices.
Export realSpinDiracKernelModule with the external positive Clifford
action and parity.
Prove realSpinLichnerowiczFormula, D²=∇*∇+Scal/4, on the real
regular module. G6.2 states the connection-induced square formula for
Hermitian complex Clifford modules. Complexify the full real regular bundle
and its connection, apply that formula there, and descend the equality
through the injective real-to-complexification map. A single chosen
odd-dimensional irreducible factor cannot replace the full regular module. Use G5.1/SBC's associated-bundle curvature
for the real regular representation and the negative Clifford relations to
contract it to Scal/4. This works in every rank, including odd rank. A uniform positive scalar gap
on a closed base gives zero kernel and invertibility; the nonnegative
case gives parallel kernel. Prove Spin-isometry equivariance. For metric
families, use the canonical Levi-Civita connection and fixed bundle
identifications; prove a common H¹ domain and operator-norm continuity
H¹→L² before point-norm continuity of the bounded transform/classifier.
Do not assert choice-independence for arbitrary, unrelated Spin connections.
Construct F=D(1+D²)^(-1/2) as an odd self-adjoint real positive-Cl_n
Fredholm operator, with F²−1 compact and the specified Clifford
anticommutation. Its negative right-Cl(0,n)-linear realization is
affiliated to Cl(0,n) graded-⊗ K; through GeneralizedCohomology G5.5's
`realNegativeCliffordFamilyIndex n` and
`realMixedCliffordIndexClassification` in degree −n define realSpinDiracIndexClass in KO^(−n)=KO_n.
Use `realMixedCliffordBottTransport` and its Morita comparisons,
including n=0; the positive Cl(n,0) operator space in degree +n
does not classify this analytic class. Identify it with the finite
kernel-module quotient of TopologicalKTheory T7: paired nonzero
eigenspaces extend their action by D/|D| to Cl(n+1,0), through
G5.5's `realNegativeCliffordFamilyIndex` finite-kernel quotient and its
TopK-ABS identification, hence contribute zero. Prove metric and
auxiliary-choice independence for the canonical Levi-Civita operators,
graded external products and orientation reversal through these concrete
operators and paths. Pin `class(M̄)=−class(M)` and
`class(M×N)=class(M)·class(N)` using the ordered graded isomorphism
`Cl(0,m) graded-⊗ Cl(0,n) ≃ Cl(0,m+n)`. Calibrate the finite kernel
quotient explicitly. In degree zero the signed point kernel is the even real
line for ε_σ=+1 and the odd real line for ε_σ=−1, giving +1 and −1 in
KO⁰. A graded rank-one regular Cl(0,1) module gives η, and its graded
square gives η². In Cl(0,4), the graded regular module is one irreducible
of each volume sign; the irreducible whose raw negative volume acts by −1
on its even part is T7's a, and the other contributes −a, so the regular-
module sum is zero. In Cl(0,8), it is eight irreducibles of each volume
sign; the irreducible whose raw negative volume acts by +1 on its even
part is T7's b, and the other contributes −b, so the regular-module sum
is zero. Pin these raw volume actions and the graded quotient comparison
against T7 and SpinRepresentations before identifying these quotient
classes. Never use the ungraded regular-module multiplicity itself as an
index. For even n=2ℓ, prove the complexification formula
`c(realSpinDiracIndexClass)=ind_ℂ(D⁺_S)·u^ℓ` in `KU^(−n)`, where
`u∈KU^(−2)` is TopologicalKTheory T4's generator as pinned in T7.
Under complexification, identify
the regular bundle with `S(TM)⊗triv(S_model*)`: the Spin transition acts
by the left spin representation on `S(TM)` and trivially on the fixed
model-dual factor, which is not the geometric dual spinor bundle. Identify
the grading as `Γ_S⊗Γ_(S_model)^transpose`, using G2.2's induced
dual parity. The reverse-dual chirality is instead
`(−1)^ℓ Γ_(S_model)^transpose`. Retain the signed rank-zero convention.
Identify the operator as `D_S⊗Id` before
the Morita comparison. Remove the fixed multiplicity by the actual
even-dimensional Clifford Morita comparison, not by an ungraded kernel
count. For n≡2 mod 4 both the complexified KO class and
the chiral complex index vanish. Check signs and coefficients against
`c(a)=2u²` and `c(b)=u⁴`. Circle/tori acceptance cases include their real
η/mod-2 classes: the periodic circle is η, the antiperiodic circle is 0,
the Lie-framed T² is η², and a torus with an antiperiodic factor is 0.
TangentialBordism B3.0 owns the equality of this analytic class with
the geometric ABS/PT genus and its complexification/Â formula.

The geometric comparison uses Nicolaescu, Proposition 12.1.66, p. 655,
Theorem 12.1.67, p. 656, and the curvature contraction in the proof of
Theorem 12.2.33, pp. 672–673. The last calculation uses the Clifford
relations and curvature symmetries, so applies to the full complexified
regular module; its real equality follows by the injective real inclusion.
These passages supply the formal-adjoint and square identities. The closed
H¹ domain is G6.1's consequence of PDO P6 and ComplexKahlerGeometry K5a.
The real analytic class is then the application of GeneralizedCohomology
G5.5's real regular-operator comparison, closed functional calculus,
stabilization and negative-Clifford family-index classification to that
realization. Its finite-kernel calibration is the comparison with
TopologicalKTheory T7 specified above. The KO-valued construction is this
derivation from supplier targets, rather than a claim of a real analytic
index theorem in Nicolaescu or in ABS §§6 and 11.

*Needs:* G5.0/G5.1; G6.1–G6.3; GeneralizedCohomology G5.5; TopologicalKTheory T7; PDO P1.0/P4–P6; ComplexKahlerGeometry K5a.

**Checks.**

- The signed point classes are +1 and −1 in KO⁰; an unsigned kernel dimension would give +1 for both.
- The periodic circle gives η and the antiperiodic circle 0; their product gives η² or 0 according to whether both factors are periodic.
- For Cl(0,4), the two regular-module volume-sign contributions are a and −a, sum 0; for Cl(0,8) they are 8b and −8b, sum 0.
- For a constant scalar eigenvalue λ, the bounded transform is λ/√(1+λ²); at λ=0 it is 0 and at λ=1 it is 1/√2, with positive denominator in both cases.
- On the unit S² the real regular spin curvature is Rᴿ(e₁,e₂)=−L_(e₁e₂)/2, so its square-formula remainder is −L_((e₁e₂)²)/2=Id/2=Scal·Id/4; the same equality holds after full complexification.

### 6.1 Dirac operators and closed domains (G6.1)

The required API includes:

- The operator is frame-independent, local, elliptic and formally symmetric with the displayed symbols.
- On closed bases both minimal and maximal domains are H¹, and chiral indices are independent of Sobolev order.

On a Riemannian manifold with a Hermitian Clifford module E for TM, assume
the chosen connection ∇^E is Hermitian and satisfies the Levi–Civita
compatibility identity: for vector fields X,v and sections s,
`∇^E_X(c(v)s)=c(∇^LC_X v)s+c(v)∇^E_Xs`. This is a hypothesis on the
selected connection; an arbitrary Hermitian connection on E need not satisfy
this identity for the specified ∇^LC. Define D=Σc(e_j)∇^E_(e_j) on smooth
sections. Prove frame independence, first-order locality, Leibniz rule
D(fs)=c((df)♯)s+fDs, smoothness, pinned symbols and ellipticity. Prove formal
symmetry by integration by parts on compactly supported sections. On a closed
base, use P1.0 to view D as a differential operator, P6's local
distributional elliptic regularity and compact-base estimates, and K5a's
H¹(E)→L²(E) carriers to prove that the maximal domain
`{u∈L² : Du∈L² distributionally}` is H¹. The graph estimate and smooth
H¹-density show the minimal closure also has domain H¹. P1.0 supplies the
bilinear density transpose and formal adjoint; K5a extends D to bundle
distributions, and P4 identifies that action with the classical ΨDO action
used by P6's parametrix. Use K5a's density pairing, conjugate-linear
Riesz transport and formal-adjoint/L² comparison to identify it with the
sesquilinear Hilbert adjoint. Formal
symmetry then gives the unbounded self-adjoint closed realization. For every
real s, prove the elliptic regularity and Sobolev-order comparison
`Du∈H^s and u∈H^r ⇒ u∈H^(s+1)` for any r<s+1, and the corresponding
bounded map H^(s+1)→H^s using P5's mapping estimates. Rellich compactness
gives compact resolvent; elliptic regularity gives a smooth finite-dimensional
kernel, independent of the Sobolev order used. The full self-adjoint Dirac
index is zero.

On an oriented, even-dimensional Riemannian manifold, the Levi–Civita-compatible
identity implies compatibility with Clifford products. Prove the oriented
Clifford volume element is parallel; hence induced chirality Γ is parallel on
every Hermitian Clifford module. In any dimension, for any parallel
self-adjoint involution γ with `γc(v)=−c(v)γ`, prove Dγ=−γD and the chiral
block/domain theorem below. Let E⁺ and E⁻ be its +1 and −1 eigensubbundles.
Apply this to Clifford chirality where defined and to exterior-form parity.
For a twist, use the product grading `γ_E⊗γ_A`, where γ_E is a parallel
self-adjoint involution anticommuting with Clifford multiplication and γ_A
is a parallel self-adjoint involution (an orthogonal grading) on the twisting
bundle. With rows and columns ordered
(E⁺,E⁻), and D⁺:E⁺→E⁻, D⁻:E⁻→E⁺, use the single block convention
`D=[[0,D⁻],[D⁺,0]]`. Prove the formal L² adjoint identity between D⁺ and D⁻;
on a closed base, the same H¹-domain argument gives their unbounded L² realizations as adjoints
with H¹ domains. Distinguish these unbounded adjoints from the bounded Hilbert
adjoint of H¹→L². For D⁺, define the geometric principal-symbol triple over
`T^*M` with projection π:T*M→M:
`[π_{T^*M}^*E⁺,π_{T^*M}^*E⁻, ξ↦σ_geom(D⁺)(ξ)=c(ξ♯)|_{E⁺}]`.
This bundle map is homogeneous of degree 1 and invertible for ξ≠0. On a
closed base its exact-off-zero class lies in `K_c(T*M)`. For E=S with γ=Γ,
or E=S⊗W with γ=Γ⊗Id, on a closed even-dimensional spin manifold,
it corresponds under ♯ to G6.6's respective untwisted or twisted class
in `K_c(TM)`. For every (E,γ), the phase homotopy
`e^(iπt/2)c(ξ♯)` joins the geometric symbol to the Fourier symbol
`i c(ξ♯)`. On a closed base, prove the chiral Fredholm index of
H^(s+1)(E⁺)→H^s(E⁻) is independent of s.

(Nicolaescu, Definition 12.1.64 and Propositions 12.1.65–12.1.66, pp. 653–655, for the local operator and formal adjoint.)

*Needs:* G3.2–G3.3; G5.1 for spinors; PDO P1.0/P4–P6; ComplexKahlerGeometry K5a.

**Checks.**

- On ℝ with c(e)=i, D=i∂ and D(eⁱᵏˣ)=−k eⁱᵏˣ; D² has eigenvalue k². Thus σgeom(1)=i and σF(1)=−1.
- For a constant scalar function f, [D,f]=0; for f=x, [D,x]=c(e), excluding a zero symbol.
- On the periodic circle, a Fourier series with coefficients 1/k for k≥1 is in L² since Σ1/k² converges, but not in H¹ since Σk²/k² diverges; its derivative is not in L².
- For a chiral block with D⁺=2 and D⁻=2 the matrix sends (1,0) to (0,2); interchanging domain labels gives the wrong chiral direction.

### 6.2 The general square formula (G6.2)

The required API includes:

- Curvature contraction and the normal-frame square calculation give the rough Laplacian plus the stated endomorphism.
- The Bochner connection agrees with the specified Clifford-compatible connection.

Prove D²=∇*∇+Σ_(i<j)c(e_i)c(e_j)R^E(e_i,e_j), including the curvature
contraction and normal-frame calculation. This is the connection-induced
Dirac operator; an arbitrary first-order Dirac-type operator may carry an
additional zero-order term. Compare its Bochner connection with PDO P1's
canonical construction and its Laplace-type realization with K5.

(Nicolaescu, Theorem 12.1.67, p. 656.)

*Needs:* G3.3; G6.1; Tau Ceti's `CovariantDerivative.curvatureOperator` for R^E; RiemannianGeometry R1, item 4, orthonormal geodesic frames for the normal-frame calculation; PDO P1 Bochner connection.

**Checks.**

- On the flat line, D²=−∂² and the curvature sum is empty, giving the same rough Laplacian.
- With plane curvature Rᴱ(e₁,e₂)=B, the contraction is c(e₁)c(e₂)B; the ordered full sum has two equal terms and needs factor 1/2.
- For D′=D+Id on a flat bundle, D′²=D²+2D+Id; the additional terms exclude arbitrary zero-order perturbations from this formula.

### 6.3 Spin and twisted Lichnerowicz formulas (G6.3)

The required API includes:

- Spin curvature contracts to Scal/4; tensor twists add their actual curvature contraction.
- On closed bases positive scalar curvature gives zero kernel and nonnegative scalar curvature gives parallel kernel.

For the spin connection prove
`R^S(X,Y)=¼Σ_(i,j)⟨R(X,Y)e_i,e_j⟩c(e_i)c(e_j)` and
`D_S²=∇*∇+Scal/4`. For a Hermitian twist W with connection prove
`D_W²=∇*∇+Scal/4+Σ_(i<j)c(e_i)c(e_j)⊗F^W(e_i,e_j)`.
Build gauge/isometry naturality and direct-sum/product formulas before
deriving the compact positive-scalar-curvature absence of harmonic
spinors, the nonnegative case's parallel-spinor conclusion and the
corresponding twisted curvature-positivity criterion. Numerical topological
index obstructions are outside this development.

(Nicolaescu, Theorem 12.2.33, p. 673; Exercise 12.1.68, p. 657, for product twists.)

*Needs:* G5.1; G6.2; Tau Ceti's first Bianchi identity `CovariantDerivative.curvatureTensor_cyclic_eq_zero`, skew-adjointness `CovariantDerivative.IsMetricCompatible.inner_curvatureTensor_eq_neg`, and scalar contraction `CovariantDerivative.scalarCurvature_eq_sum_riemannCurvatureTensor`.

**Checks.**

- On the unit round S², Scal=2 and the scalar remainder is 1/2; the closed-base energy identity forces the harmonic kernel to be zero.
- On a flat periodic torus, Scal=0 and constant spinors have ∇s=Ds=0; nonnegative curvature alone cannot force zero kernel.
- For a flat trivial twist, Fᵂ=0 and the extra curvature contraction is zero, recovering the untwisted formula.

### 6.4 The exterior Dirac operator (G6.4)

The required API includes:

- The exterior operator and its square identify with d+d* and the nonnegative Hodge Laplacian.
- Exterior parity and intrinsic chirality give their respective graded blocks and harmonic-kernel comparisons.

On exterior forms prove D=d+d*, D² the nonnegative Hodge Laplacian and
recover R7's real Weitzenböck curvature term, with d* G3.4's local formula,
which is Tau Ceti's codifferential on an oriented base. Exterior parity gives the
Euler operator; G2's chiral grading gives the signature operator on
even-dimensional oriented bases. Prove DΓ=−ΓD, the block/formal-adjoint
comparison and harmonic-kernel identification; the formal adjointness of d
and d* on a boundaryless, Hausdorff, σ-compact oriented base, for pairs of
forms one of which has compact support, is Tau Ceti's
`TauCeti.SmoothForm.integralTopForm_inner_mextDeriv_eq_inner_codifferential`. The numerical Euler/signature
formulas are outside this geometric
development; retain the operator and harmonic-space identifications.

(Nicolaescu, Proposition 12.2.1, p. 657; Example 12.1.25, p. 633.)

*Needs:* G2.2; G3.4; G6.1–G6.2; RiemannianGeometry R7 exterior comparison; Tau Ceti's codifferential and its formal adjointness.

**Checks.**

- On the flat circle, D(f,h dx)=(−h′,f′ dx); constants in both degrees are harmonic, with dimensions (1,1).
- On an oriented plane Γ1=i e₁₂ and Γe₁=i e₂, while exterior parity fixes 1 and negates e₁; chirality is not degree parity.
- On a point the de Rham operator is zero and its harmonic zero-form space has dimension 1; all positive-degree spaces vanish.

### 6.5 Circle, torus and sphere instances (G6.5)

The required API includes:

- The explicit circle lifts and torus H¹ twists realize the stated Fourier spectra.
- Sphere spin structures follow from the radial stable framing and the spin obstruction theorem.

Acceptance cases include the flat Euclidean operator, periodic and
antiperiodic spin structures on the flat circle of length 2π, with their
integer/half-integer Fourier spectra and kernels: the periodic kernel has
complex dimension 1 and the antiperiodic kernel is 0. Include product tori
with all H¹ spin twists, round-sphere
positive-scalar-curvature kernel vanishing. The periodic lift is the
disconnected trivial Spin(1)=Z/2 cover of the oriented circle frame bundle;
the antiperiodic lift is its connected double cover.
Construct the spin structures: trivial tangent frames for Euclidean space,
circle and tori; for Sⁿ use TSⁿ⊕ℝ≃Sⁿ×ℝ^(n+1), with the radial normal
section, the universal w₂ Whitney formula and G4's existence theorem.
Identify the two circle lifts and all torus lifts through the actual H¹
calculations. Use the shared Riemannian distance/metric structures and
the induced Fourier/L² normalization in the spectral calculations.
Circle spinors are ungraded; no even-dimensional half-spin decomposition
is imposed there.

(Nicolaescu, Exercise 12.2.30, p. 670, and Exercise 12.2.35, p. 673.)

*Needs:* G4.3–G4.4; G5.1; G6.1/G6.3; Fourier theory; CharacteristicClasses Whitney formula.

**Checks.**

- For length 2π the periodic spectrum is Z and the antiperiodic spectrum Z+1/2; zero multiplicities are 1 and 0.
- On T² the four twists are (0,0),(0,1/2),(1/2,0),(1/2,1/2); only (0,0) admits zero momentum.
- The unit Sⁿ for n≥2 has Scal=n(n−1)>0 and zero harmonic spinors; S¹ has Scal=0 and its periodic kernel has dimension 1.

### 6.6 The compact-support symbol (G6.6)

The required API includes:

- The symbol triple is exact away from the compact zero section and is natural under spin isometries.
- Musical transport, phase homotopy and graded products preserve its compact-support K-class.

On a closed even-dimensional spin manifold construct the exact-off-zero
bundle triple `(π*S⁺,π*S⁻,c(v))` on TM. Through TopologicalKTheory T3
export its compact-support class in K_c(TM); its support is the compact
zero section. Prove metric-musical comparison with the T*M carrier and
the phase homotopy between c(v) and the Fourier symbol i c(v), preserving
invertibility away from zero. Export the graded product, pullback along
spin isometries and twisted-bundle comparisons. Numerical analytic versus
topological index equality is outside this roadmap.

(Nicolaescu, §12.2.3, p. 672, for the chiral symbol.)

*Needs:* G5.1; G6.1; TopologicalKTheory T3 compact-support triples.

**Checks.**

- For ξ≠0, c(ξ)²=−|ξ|²Id, so c(ξ)⁻¹=−c(ξ)/|ξ|²; at ξ=0 the map is zero and this inverse is not claimed.
- The phase homotopy has endpoints c(ξ) and i c(ξ), both invertible for ξ≠0 since its scalar factor has modulus 1.
- For a point the zero section is compact; on ℝ its zero section is noncompact, so this exact-off-zero argument alone gives no compact-support class.

### 6.7 Quaternionic four-dimensional kernels (G6.7)

The required API includes:

- The parallel quaternionic symmetries extend to H¹ and L² and preserve the actual chiral kernels and cokernels.
- Complex dimension is twice quaternionic dimension and the geometric KO₄ class is α·a.

On a closed oriented Riemannian spin four-manifold, construct the
**untwisted** half-spin quaternionic symmetries untwistedSpinFourJPlus
and untwistedSpinFourJMinus on G5's actual S⁺/S⁻ bundles. Use the
real Clifford classification of SpinRepresentations Layer7 and the
native `Representation.IsQuaternionicStructure` from
`TauCeti/RepresentationTheory/QuaternionicStructure.lean`: J is complex
conjugate-linear, J²=−1 and intertwines the Spin action. Prove antiunitarity,
preservation of Γ's eigenspaces and Clifford compatibility
`J⁻ c(v)=c(v) J⁺`, with the reverse-chirality equation as well.
Their Spin-equivariance makes them parallel for the untwisted spin
connection. Use the chosen real Clifford model to construct J⁺/J⁻.
Prove the complex/quaternionic dimensions of ker D⁺ and ker D⁻,
the quaternionic index and KO class are invariant under replacing
`(J⁺,J⁻)` by `(zJ⁺,zJ⁻)` for a common constant z∈ℂ with |z|=1,
using actual quaternionic-module comparison isomorphisms. Construct the
conjugate-linear matrix-multiplier adapter extending them to K5a's H¹ and
L² section carriers, preserving the operator domains and satisfying
`J⁻ D⁺=D⁺ J⁺` and `J⁺ D⁻=D⁻ J⁻`. Prove the actual kernel and adjoint-cokernel
restrictions are quaternionic, using elliptic regularity to compare smooth
and Sobolev kernels. Equip each finite-dimensional kernel/cokernel with the
trivial Spin representation; verify the quaternionic structure for this
representation and apply the finite-dimensional quaternionic parity theorem to obtain even complex dimension. Do not claim these kernels carry a
nontrivial natural Spin representation. Give their right-Hamilton-module convention explicitly
and compare complex restriction through Quaternion.ofComplex; complex
dimension is twice quaternionic dimension.
Export untwistedSpinFourComplexIndex_eq_two_mul_quaternionicIndex:
the chiral complex index equals 2α, where
α=dim_ℍ ker D⁺−dim_ℍ ker D⁻. Include finite-dimensional evenness for a
complex space carrying the native quaternionic structure, kernel
restriction, direct sums, change of Spin frames and spin-isometry pullback.
Prove `realSpinDiracIndexClass = α·a` in KO₄. Pin the raw negative
Cl(0,4) volume ω₋, with ω₋²=1, and prove on the regular module
ε=L_(ω₋)R_(ω₋) and C₊(e₁)C₊(e₂)C₊(e₃)C₊(e₄)=R_(ω₋).
On its ε-even sector the external positive Cl(4,0) volume is
R_(ω₋)=L_(ω₋)=−Γ, since Γ=i²ω₋=−ω₋. Thus Γ=+1
corresponds to external volume−1 and to TopK's raw negative
volume−1 even factor a. Construct the actual factor intertwiners.
G6.0's general real operator construction precedes this
dimension-four quaternionic normalization.
This symmetry is asserted for the untwisted spin operator. A general
Hermitian twist W has no asserted quaternionic kernel or even complex index;
a compatible quaternionic symmetry for a twist requires its own intertwining
data. IndexTheory I7.5 consumes the numerical Â/signature comparison; it
is not an input to this construction.

(Nicolaescu, §12.1.8, pp. 651–653, for quaternionic half-spin representations.)

*Needs:* G5.1; G6.0–G6.1; SpinRepresentations Layer 7; native quaternionic structure; ComplexKahlerGeometry K5a.

**Checks.**

- On ℂ², J(z,w)=(−conj(w),conj(z)) has J²(z,w)=(−z,−w); the complex and quaternionic dimensions are 2 and 1.
- On a complex line any conjugate-linear J(z)=a conj(z) has J²(z)=|a|²z; |a|²=−1 has no solution, excluding an odd-dimensional kernel.
- For the flat four-torus with trivial spin structure, the half-spin kernel dimensions are 2 and 2; the complex index is 0=2(1−1) and α=0.
- In rank four Γ=−ω₋, so Γ=+1 gives ω₋=−1; this selects a rather than −a, and complexification gives 2u².

### Examples

Flat circle spectra, round-sphere vanishing and signed point indices fix
the local operator, closed domains and real index normalizations.

### Dependencies

The section-specific dependencies above order G6.1–G6.3 before G6.0 and
G6.7. The exterior comparison consumes RiemannianGeometry R7.

## Downstream consumers

G1–G2 use the algebraic suppliers and pointwise exterior metrics, before
bundle analysis. G3 uses SBC and the Levi-Civita carrier. Native compact-real
covering/connectivity supply G4.1a's topological frame/rank0 adapters and
SpinRepresentations L7's remaining universal-cover comparison. The item order
is G4.1a → CharacteristicClasses C3.5 → G4.3. G4.1b's smooth refinement
uses G4.1a and native Lie differential APIs, independently of C3.5.
G4.4's torsor uses a given lift and Tau Ceti's cocycle gluing independently of
that obstruction equality. G4.4a additionally consumes AT8.9's CW obstruction
API and SpinRepresentations Layer2's independent compact-real simple-connectivity
foundation. G5 uses G1–G3 and G4.1–G4.4a; G5.3 compares its square roots with G4.4a's rank-two criterion. G6 follows G3/G5 and uses
K5/PDO analysis; the exterior instance only needs G2/G3. Numerical topological index theorems are separate consumers of this development. For each object supply constructors/characterization,
extensionality, regularity, naturality, local-frame/gluing comparison and edge
cases, not only the headline theorem.

For the real KO lane, GeneralizedCohomology G5.5 and TopologicalKTheory T7 supply the functional-calculus, Clifford and KO interfaces consumed by SpinGeometry G5.0/G6.0. The algebraic real regular bundle/action SpinGeometry G5.0 consumes G1.1/G1.3/G3.1/G3.3/G4.1–G4.4 and any supplied principal Spin connection. G5.1 separately supplies the Levi-Civita principal Spin connection and associated connection, which specialize this general G5.0 construction for TM. G6.1–G6.3 are prerequisites and do not consume G6.0. Spin G6.0 consumes G5.0, the G5.1 Levi-Civita specialization and G6.1–G6.3; its arbitrary-boundaryless local operator/elliptic branch precedes the closed-manifold functional-calculus and index branch. Spin G6.7 consumes G5.1, G6.0 and G6.1's domain/chiral-adjoint results. GeneralizedCohomology G5.5 consumes Spin G1.3's trace but is independent of Spin G6.0. TangentialBordism B3.0 is downstream: it consumes the KO-valued analytic class and owns its comparison with the geometric ABS/PT genus. IndexTheory I7.5 is another downstream consumer, not an input. This names SpinGeometry G5.0 explicitly to distinguish it from GeneralizedCohomology G5.0.

## References

- H. B. Lawson and M.-L. Michelsohn, *Spin Geometry* (1989), Chapters I–II:
  algebraic module suppliers, spin structures, spinor bundles and Dirac
  operators; Chapter II's curvature formulas and Lichnerowicz theorem.
  Their negative-first Clifford signature is the reversed order of
  `TauCeti.realCliffordForm p q`.
- L. Nicolaescu, [*Lectures on the Geometry of Manifolds*](https://academicweb.nd.edu/~lnicolae/Lectures.pdf),
  Clifford modules and Dirac operators, for metric/chirality/bundle comparisons.
- M. F. Atiyah, R. Bott and A. Shapiro,
  [*Clifford modules*](https://doi.org/10.1016/0040-9383(64)90003-5), §1, for the
  Clifford algebra of an orthogonal sum as a graded tensor product, and §§6
  and 11, for graded products and the distinction between
  algebraic and topological classes.
- R. C. Kirby, [*The topology of 4-manifolds*](https://math.berkeley.edu/~kirby/papers/Kirby%20-%20The%20topology%20of%204-manifolds%20-%20MR1001966.pdf)
  (1989), Chapter IV, pp. 33–34, for skeletal Spin structures, stabilization
  and comparison with principal lifts.
