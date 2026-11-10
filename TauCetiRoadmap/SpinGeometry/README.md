# Clifford bundles, spin structures, and Dirac geometry

Develop the geometric theory of real and complex Clifford modules, spin lifts,
spinor bundles and their compatible connections. The resulting library must
support the de Rham, signature and twisted spin Dirac operators, with their
metrics, gradings and curvature formulas pinned. This README is definitive;
`Suggested.lean` states the headline theorems that are statable at the pinned
libraries and is not an exhaustive checklist.

## Scope, conventions and suppliers

The algebraic Clifford algebra, its real periodicity and the abstract spin
representations are supplied by
[SpinRepresentations L0–L4,L7,L9](../RepresentationTheory/SpinRepresentations/README.md)
and [OrthogonalSpinGroups L0–L2](../../Completed/OrthogonalSpinGroups/README.md).
Use Mathlib's `CliffordAlgebra`, `ExteriorAlgebra`, `CliffordAlgebra.equivExterior`,
`equivBaseChange`, `equivOfIsometry`, `prodEquiv`, `evenOdd`, `involute` and
`reverse`. Tau Ceti already has `TauCeti.spinAction`,
`SpinPolarizationData.cliffordEquivEnd`, its even/odd matrix classification,
half-spin actions, raw orthogonal-product volume identities and real algebraic
eight-periodicity. In particular `CliffordAlgebra.prod_map_ι_sq_scalar` gives
the square of the ordered product ω=e₁⋯e_n of any orthogonal list as
`(−1)^(n(n−1)/2)·Π_i Q(e_i)` for every Q, so the positive-form pseudoscalar
squares to `(−1)^(n(n−1)/2)` and the negative-form one to `(−1)^(n(n+1)/2)`,
and Mathlib's `Module.Basis.ExteriorAlgebra` is the increasing wedge basis
that Tau Ceti's `CliffordAlgebra.basis` transports to the Clifford monomial
basis. This roadmap constructs no other abstract Fock action, classification
table or Bott-periodicity proof. Real algebraic periodicity is distinct from
the topological Bott theorem.

Tau Ceti also proves the finite Clifford-module algebra of G1–G2: the
positive/negative sign comparisons, the Fock model with its metric, the
conjugate-linear Clifford involution, compatible spinor metrics,
multiplicity spaces, the scalar trace, the normalized volume element and its
chirality splitting, the Clifford action on forms and graded products. G1–G2
cite these declarations and state as targets only the comparisons the library
lacks, each with one clause on how it differs. Paths are under
`TauCeti/LinearAlgebra/CliffordAlgebra/` unless another directory is named.

- Sign comparisons (G1.1): `CliffordAlgebra.equivNeg`, `equivNeg_coe`,
  `equivNeg_ι_mul_ι` and `equivNeg_ofBaseChangeAux` (`Neg.lean`);
  `CliffordAlgebra.spinGroupEquivNeg` and `equivNeg_spinGroupBaseChange`
  (`Spin/Neg.lean`); `CliffordAlgebra.realCliffordSpinGroupEquivNeg`,
  `spinVectorAction_realCliffordSpinGroupEquivNeg`,
  `realCliffordSpinGroupEquivNeg_negOne` and
  `OrthonormalBasis.realSpinGroupEquiv` (`Spin/Real/Neg.lean`);
  `OrthonormalBasis.negRealCliffordFormIsometryEquiv` and
  `OrthonormalBasis.realEvenCliffordEquiv` (`RealForm/OrthonormalBasis.lean`);
  `OrthonormalBasis.isometryEquivRealCliffordForm` and
  `TauCeti.nonempty_algEquiv_cliffordAlgebra_realCliffordForm`
  (`RealForm/Orthonormal.lean`);
  in rank zero `CliffordAlgebra.evenUnitaryGroupEquivRootsOfUnityOfSubsingleton`
  and `CliffordAlgebra.range_spinGroup_toUnits_ne_evenUnitaryGroup_of_subsingleton`
  (`Spin/LowRank/Zero.lean`).
- Polarization and Fock model (G1.2), under
  `TauCeti/RepresentationTheory/Spin/Polarization/`:
  `TauCeti.AlmostComplexStructure.spinPolarizationData`
  (`ComplexStructure.lean`); `TauCeti.AlmostComplexStructure.spinAction_ι_one_tmul`,
  `TauCeti.AlmostComplexStructure.fockAction`,
  `degreeScaling_comp_spinAction_eq_fockAction_comp`, `fockAction_bijective`,
  `fockAction_ι_one_tmul` and `fockAction_ι_one_tmul_mul_self`
  (`Fock/Basic.lean`); `toLinearMapₛₗ₂_wedge_left`,
  `toLinearMapₛₗ₂_contract_left`, `toLinearMapₛₗ₂_fockAction_left`,
  `toLinearMapₛₗ₂_fockAction_ι_one_tmul_left` and
  `toLinearMapₛₗ₂_degreeScaling_of_mem_exteriorPower` (`Fock/Metric.lean`);
  `TauCeti.AlmostComplexStructure.sesqComplexification_holomorphicPart_holomorphicPart`
  (`TauCeti/Geometry/Symplectic/Complex/HermitianForm.lean`).
  For a real algebra map into complex endomorphisms:
  `CliffordAlgebra.map_ι_mul_map_ι`, `CliffordAlgebra.adjoint_map_eq_map_star`
  and `CliffordAlgebra.norm_map_ι_apply` (`Hermitian/Basic.lean`).
- Involutions, spinor metrics, multiplicity spaces and the scalar trace
  (G1.3): `CliffordAlgebra.complexConj`, `complexConj_unique`,
  `CliffordAlgebra.conjStar` and `toBaseChange_conjStar`
  (`Complexification.lean`); `CliffordAlgebra.involute_eq_self_iff` and
  `involute_eq_neg_iff` (`Grading.lean`);
  `CliffordAlgebra.exists_sesqForm_map_eq_map_conjStar`
  (`Hermitian/Spinor.lean`); `CliffordAlgebra.existsUnique_pos_mul_of_surjective`
  and `CliffordAlgebra.adjoint_map_eq_map_conjStar_iff`
  (`Hermitian/Complex.lean`); `TauCeti.isotypicTensorEquivOfBijective` and
  `TauCeti.finrank_eq_finrank_mul_finrank_linearMap_of_bijective_lsmul`
  (`TauCeti/RingTheory/Morita/ModuleEnd.lean`); `TauCeti.multiplicityMetric`
  and `TauCeti.inner_isotypicTensorEquivOfBijective_eq`
  (`Hermitian/Multiplicity.lean`); `AlgHom.cliffordReverseDual` (`Dual.lean`);
  `CliffordAlgebra.scalarTrace`, `scalarTrace_mul_comm`,
  `trace_mulLeft_eq_two_pow_mul_scalarTrace` and `scalarTrace_eq_of_algEquiv`
  (`ScalarTrace/Basic.lean`); `CliffordAlgebra.basis_eq_prod_map_sort`,
  `scalarTrace_reverse_basis_mul_basis`,
  `CliffordAlgebra.scalarTrace_reverse_mul_self_nonneg` and
  `CliffordAlgebra.scalarTrace_reverse_mul_self_eq_zero_iff`
  (`OrthogonalBasis.lean`); `CliffordAlgebra.scalarTrace_ofBaseChange` and
  `trace_mulLeft_eq_two_pow_mul_baseChange_scalarTrace`
  (`ScalarTrace/BaseChange.lean`);
  `CliffordAlgebra.scalarTrace_conjStar_mul_self_nonneg`,
  `scalarTrace_conjStar_mul_self_eq_zero_iff` and
  `posDef_iff_forall_scalarTrace_reverse_mul_self_eq_zero`
  (`ScalarTrace/Positivity.lean`);
  `CliffordAlgebra.scalarTrace_reverse_mul_self_eq_zero_iff_mem_span_radical`
  (`ScalarTrace/Radical.lean`).
- Odd volume element and the dimension-raising map (G1.4):
  `CliffordAlgebra.complexVolume_mem_center` (`VolumeElement/Complex.lean`);
  `TauCeti.SpinPolarizationData.spinAction_complexVolume`
  (`TauCeti/RepresentationTheory/Spin/Polarization/OddVolume.lean`);
  `TauCeti.SpinPolarizationData.cliffordEquivEndProd`
  (`TauCeti/RepresentationTheory/Spin/LineSign.lean`);
  `CliffordAlgebra.coe_toEven_of_mem_odd` and
  `CliffordAlgebra.EquivEven.equivOfIsometry_toEven_ι`
  (`Even/EquivEven.lean`).
- Chirality (G2.1): `CliffordAlgebra.volumeElement`, `volumeElement_eq`,
  `volumeElement_mul_ι_of_even` and `volumeElement_mul_self`
  (`VolumeElement/Oriented.lean`); `CliffordAlgebra.complexVolume`,
  `complexVolume_eq`, `complexVolume_neg_orientation`,
  `conjStar_complexVolume`, `complexVolume_mul_eq_involute_mul` and
  `complexVolume_mul_self` (`VolumeElement/Complex.lean`);
  `CliffordAlgebra.isCompl_eigenspace_complexVolume`,
  `projection_eigenspace_complexVolume_apply` and
  `projection_eigenspace_complexVolume_neg_one_apply`
  (`VolumeElement/Eigenspace.lean`); `TauCeti.eigenspaceTensorEquivOfBijective`
  (`TauCeti/RingTheory/Morita/Eigenspace.lean`);
  `TauCeti.AlmostComplexStructure.fockAction_complexVolume`
  (`TauCeti/RepresentationTheory/Spin/Polarization/Chirality.lean`);
  `CliffordAlgebra.EquivEven.equivOfIsometry_toEven_complexVolume`
  (`VolumeElement/EquivEven.lean`); `TauCeti.isCompl_eigenspace_one_neg_one`
  (`TauCeti/LinearAlgebra/Eigenspace/Separation.lean`).
- Forms and duals (G2.2): `CliffordAlgebra.exteriorAction` and
  `CliffordAlgebra.baseChangeExteriorAction`
  (`TauCeti/LinearAlgebra/ExteriorAlgebra/CliffordAction.lean`);
  `CliffordAlgebra.exteriorAction_volumeElement` and
  `CliffordAlgebra.baseChangeExteriorAction_complexVolume_of_eq_two_mul`
  (`VolumeElement/HodgeStar.lean`); `Orientation.hodgeStar` and
  `Orientation.complexHodgeStar`
  (`TauCeti/Analysis/InnerProductSpace/HodgeStar/`);
  `CliffordAlgebra.inv_two_pow_mul_trace_adjoint_map_equivExterior_symm_mul`
  (`ScalarTrace/Representation.lean`);
  `AlgHom.cliffordReverseDual_complexVolume` (`VolumeElement/Dual.lean`).
- Graded products and twists (G2.3): `AlgHom.cliffordProdTensor` and
  `AlgHom.map_mul_cliffordProdTensor_ι` (`Prod.lean`);
  `CliffordAlgebra.complexProdTensor` and
  `CliffordAlgebra.complexProdTensor_complexVolume` (`VolumeElement/Prod.lean`);
  `CliffordAlgebra.twistingGrading` and
  `CliffordAlgebra.eigenspaceTwistingGradingEquiv`
  (`VolumeElement/GradedModule.lean`); `Module.End.eigenspaceTensorMapEquiv`
  (`TauCeti/LinearAlgebra/Eigenspace/TensorProduct/Involution.lean`).

For the remaining suppliers:

- [SmoothBundlesConnections B1–B5,B6.0](../SmoothBundlesConnections/README.md)
  owns smooth principal/associated bundles, descent, frames, sums/tensors/duals,
  scalar extension, metrics, connections, curvature and parallel transport.
  Use its actual Mathlib `FiberBundle`, `VectorBundle`, `ContMDiffVectorBundle`
  carriers, and its metric-parametrized L² sections. G3 adds Clifford algebra
  multiplication and module data to those bundles; G4 adds a spin lift of the
  oriented frame bundle. B3 supplies the invariant-vector parallel-section
  theorem used in G3.
- [HopfRinow L1](../../Completed/HopfRinow/README.md) supplies the actual Levi-Civita
  covariant derivative. [RiemannianGeometry R1,R5,R7](../RiemannianGeometry/README.md)
  supplies curvature identities, pullback/normal connections and the real
  Weitzenböck comparison. The metric uses Mathlib's `RiemannianBundle` and
  `IsContMDiffRiemannianBundle`.
- [DifferentialGeometry L0–L2,L5–L9](../DifferentialGeometry/README.md)
  supplies forms, exterior calculus, orientation, densities, integration,
  Stokes and de Rham comparison.
  [ComplexKahlerGeometry K5](../ComplexKahlerGeometry/README.md) supplies
  the shared exterior Gram metrics, complex-type stars, formal adjoints, p=2 bundle Sobolev/distribution theory,
  Laplace-type regularity, Hodge theorem and compact resolvent. Its K1/K4
  complex/type and Hermitian bundle interfaces supply the almost-complex
  bundle comparisons below. The pointwise real Hodge star and its
  complex-linear extension are Tau Ceti's `Orientation.hodgeStar` and
  `Orientation.complexHodgeStar` (G2). The pointwise exterior metric/star API
  precedes the analytic Hodge theorem.
- [CharacteristicClasses C1,C3.5](../CharacteristicClasses/README.md) owns
  mod2 cohomology, universal w₂ and its equality with the real spin-cover
  transition obstruction. G4.3 consumes that universal equality for lift
  existence; G4.4 constructs the H¹ torsor once a lift is given. [AlgebraicTopology Stages 2–6](../AlgebraicTopology/README.md)
  supplies cochains, cup/cross products and CW comparisons; SBC B6.0 supplies
  smooth good covers. On general paracompact bases keep Čech cohomology;
  identify it with singular cohomology on CW-type bases using C1's comparison.
- [TopologicalKTheory T1–T3,T6.4](../TopologicalKTheory/README.md) supplies the
  vector-bundle K-ring and products for G5's virtual spinor formula. Its
  T6.4 owns the continuous numerable principal/associated-bundle category;
  CharacteristicClasses C1 owns its continuous orthonormal/oriented frames.
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
  The cited contracts are PseudodifferentialOperators P1.0 (differential-operator
  core), P4 (differential-operator/ΨDO identification), P5 (Sobolev mapping)
  and P6 (ellipticity and parametrices) of
  [PseudodifferentialOperators](../PseudodifferentialOperators/README.md),
  together with [ComplexKahlerGeometry K5a](../ComplexKahlerGeometry/README.md#k5-compact-hermitian-elliptic-theory-and-serre-duality)
  for general finite-rank Hermitian-bundle Sobolev/H¹/L² carriers, compactness,
  distributional pairings, Riesz transport and bundle-system regularity. G6 must prove
  the Dirac-specific domain/adjoint bridge stated below from these contracts.
  Numerical topological index formulas, the Hirzebruch signature theorem and
  the Â-genus formula are outside this roadmap.

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
Clifford `star` is the complex-linear map `reverse ∘ involute` (`CliffordAlgebra.star_def`): it fixes
coefficient scalars and sends each real generator to its negative (`star_ι`).
G1.3 names scalar conjugation on this carrier `κ_base`, Tau Ceti's
`CliffordAlgebra.complexConj`; the conjugate-linear negative-metric Clifford
involution is `*Cl_base = κ_base ∘ star`, Tau Ceti's
`CliffordAlgebra.conjStar`. On the tensor carrier `ℂ⊗_ℝCl_ℝ(V,−g)`, use
Tau Ceti's local `StarModule ℝ (CliffordAlgebra Q)` proof
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

Use `R(X,Y)=[∇_X,∇_Y]−∇_[X,Y]`, positive round-sphere curvature,
`D=Σ c(e_j)∇_(e_j)` and nonnegative rough Laplacian ∇*∇. The geometric
principal symbol has `σ_geom(D)(ξ)=c(ξ♯)`; the Fourier symbol of
`−i∂_j` is ξ_j and `σ_F(D)=i c(ξ♯)`. Thus the Fourier symbol of D² is
|ξ|²Id. The complex-linear Hodge star on complexified real forms is distinct
from the native complex-linear Clifford `star` and the conjugate-linear
`*Cl_base` and `*Cl_tens` defined above. Conjugate-linear Hermitian/Dolbeault stars have separate names.

## G1. Negative-metric Clifford modules and their positive metrics

1. The comparisons between the positive and the negative form are Tau Ceti's
   (see the supplier list). Over ℂ, `CliffordAlgebra.equivNeg` with u=i is
   the full-algebra isomorphism v↦i v from the positive to the negative form;
   on even elements it is Mathlib's `CliffordAlgebra.evenToNeg`, which sends
   the bivector e_i e_j to −e_i e_j (`equivNeg_coe`, `equivNeg_ι_mul_ι`), and
   on the image of the real even algebra it is the scalar extension of
   `CliffordAlgebra.evenEquivEvenNeg` (`equivNeg_ofBaseChangeAux`). For V≠0
   it is not the extension of a real full-algebra isomorphism, since it sends
   a real generator to i times a real generator.
   `CliffordAlgebra.realCliffordSpinGroupEquivNeg` compares compact Spin(n),
   the Spin group of `realCliffordForm n 0`, with the Spin group of the
   negative form `realCliffordForm 0 n`: it intertwines the vector actions
   through the coordinate isometry and sends −1 to −1. Along an orthonormal
   frame of (V,Q) with Q(v)=−‖v‖² the same comparisons are
   `OrthonormalBasis.realSpinGroupEquiv` and
   `OrthonormalBasis.realEvenCliffordEquiv`, through the coordinate isometry
   `OrthonormalBasis.negRealCliffordFormIsometryEquiv`, and
   `equivNeg_spinGroupBaseChange` identifies the complex map on Spin
   elements with the scalar extension of `CliffordAlgebra.spinGroupEquivNeg`.
   The vector action of a Clifford unit
   z is throughout the native twisted conjugation v↦involute(z)·v·z^(−1) of
   `CliffordAlgebra.vectorMap` in `LinearAlgebra/CliffordAlgebra/Lipschitz/Action.lean`,
   under which a unit vector acts by the reflection in its orthogonal
   hyperplane; on the even part, where Spin lives, it is plain conjugation
   z v z^(−1). In rank 0 the even unitary group of Cl(0)=ℝ is μ₂
   (`CliffordAlgebra.evenUnitaryGroupEquivRootsOfUnityOfSubsingleton`) while
   the native Spin group is trivial
   (`CliffordAlgebra.range_spinGroup_toUnits_ne_evenUnitaryGroup_of_subsingleton`);
   this algebraic branch precedes the later frame adapters. The coordinate
   model of (V,Q) is the isometry `OrthonormalBasis.isometryEquivRealCliffordForm`
   from Q to `realCliffordForm 0 n`, and the real classification of
   `CliffordAlgebra Q` by dim V modulo eight is
   `TauCeti.nonempty_algEquiv_cliffordAlgebra_realCliffordForm` with
   `TauCeti.cliffordAlgebra_classification_of_finrank_mod_eight_eq_zero` and
   its seven companions.

   This roadmap adds one comparison that the library does not state: pin the
   two-by-two matrix models of the real planes against the standard
   Pauli matrices `X=[[0,1],[1,0]]`, `Y=[[0,−i],[i,0]]`, `Z=diag(1,−1)`:
   each squares to Id, they pairwise anticommute, `XY=iZ`, `YZ=iX`,
   `ZX=iY`, the real span of X, Y, Z is the traceless Hermitian matrices
   and the real span of iX, iY, iZ is su(2), with `[X,Y]=2iZ` cyclically.
   For the positive plane send the ordered generators to e₁↦X, e₂↦Z; the
   universal property gives a real algebra map from the native
   `CliffordAlgebra (TauCeti.realCliffordForm 2 0)` to M₂(ℝ), to be compared
   with the public model `TauCeti.realCliffordSignatureSwitchRecurrenceEquiv 0 0`
   composed with Cl(0,0)≅ℝ: both are isomorphisms Cl(2,0)≅M₂(ℝ), so they
   differ by an inner automorphism. For the negative plane compose the
   native `TauCeti.realCliffordZeroTwoEquivQuaternion` with
   `Quaternion.toComplexMatrix`: the quaternion units i, j, k map to iZ,
   iY, iX. These are comparisons with the existing Clifford classifiers,
   not another algebra or Lie-group construction. *Needs:* Mathlib
   `CliffordAlgebra.lift`; Tau Ceti
   `realCliffordForm`, `realCliffordSignatureSwitchRecurrenceEquiv`,
   `realCliffordZeroTwoEquivQuaternion`, `Quaternion.toComplexMatrix` and
   the sign comparisons listed under the suppliers.

   **Checks.**
   - Positive plane: e₁↦X, e₂↦Z, e₁e₂↦XZ=[[0,−1],[1,0]]=−iY, a real
     matrix with (e₁e₂)²=−Id; Id, X, Z, XZ have coordinate determinant 4,
     so they are a real basis of M₂(ℝ) and the universal map is an
     isomorphism. A model sending e₂ to Y instead would not be real.
   - Negative plane: e₁↦i↦iZ, e₂↦j↦iY, e₁e₂↦k↦iX, each squaring to −Id,
     with (iZ)(iY)=iX. A dictionary sending k to iY would contradict ij=k.
   - Negative control: the odd permutation (X,Y,Z)↦(Z,Y,X) is realized by no
     conjugation of M₂(ℂ), since XYZ=i·Id and ZYX=−i·Id while conjugation
     fixes scalars; so the ordered triple (Z,Y,X) has cyclic products
     S_jS_(j+1)=−iS_(j+2), the opposite sign to XY=iZ. With one sign
     change it is a conjugation: the Hadamard matrix H=(X+Z)/√2 satisfies
     HXH=Z, HYH=−Y, HZH=X.

2. For (V,J) with J orthogonal, the polarization and the Fock model are
   Tau Ceti's. `TauCeti.AlmostComplexStructure.spinPolarizationData`
   polarizes ℂ⊗V by the two isotropic J-eigenspaces, decomposing 1⊗v as
   (v^(1,0),v^(0,1)). A real vector acts natively on ΛW by
   `ε(v^(1,0))−2ι(v^(0,1))` (`spinAction_ι_one_tmul`), since
   polar(−g_ℂ)=−2g_ℂ. The degree scaling T|_(Λ^pW)=2^(p/2)Id intertwines it
   with the √2 Fock action c(v)=√2(ε(v^(1,0))−ι(v^(0,1)))
   (`degreeScaling_comp_spinAction_eq_fockAction_comp`,
   `fockAction_ι_one_tmul`), an isomorphism onto End(ΛW)
   (`fockAction_bijective`) with c(v)²=−|v|²Id
   (`fockAction_ι_one_tmul_mul_self`). For h_ℂ(x,y)=g_ℂ(bar(x),y) on W, so
   that |v^(1,0)|²=|v|²/2, the exterior Gram metric of h_ℂ makes creation
   and annihilation adjoint (`toLinearMapₛₗ₂_wedge_left`,
   `toLinearMapₛₗ₂_contract_left`), the Fock action a *-representation for
   `CliffordAlgebra.conjStar` and real-vector multiplication skew-Hermitian
   (`toLinearMapₛₗ₂_fockAction_left`,
   `toLinearMapₛₗ₂_fockAction_ι_one_tmul_left`), and the native-action metric
   pulled back along T is 2^p times it in degree p
   (`toLinearMapₛₗ₂_degreeScaling_of_mem_exteriorPower`). On (V,J) Mathlib's
   conjugate-first Hermitian form h_J(v,w)=g(v,w)−i g(v,Jw) is twice the
   pullback of h_ℂ|_W under v↦v^(1,0)
   (`TauCeti.AlmostComplexStructure.sesqComplexification_holomorphicPart_holomorphicPart`,
   in `TauCeti/Geometry/Symplectic/Complex/HermitianForm.lean`).
   Nicolaescu's h(u,v)=g(u,v)+i g(u,Jv) (proof of Proposition 12.1.19,
   p. 630) is linear in its first slot and is the complex conjugate of h_J;
   this roadmap uses h_J.

   This roadmap adds the convention for real algebra maps, which the library
   states only through the diagonal relation `CliffordAlgebra.map_ι_mul_map_ι`.
   Record the geometric convention as the predicate `IsGeometricAction` on a
   real algebra map ρ into End_ℂ(S): `Q(v)=−⟨v,v⟩` and each
   `cliffordMultiplication` c(v)=ρ(ι v) skew-Hermitian; prove the polarized
   relation c(v)c(w)+c(w)c(v)=−2⟨v,w⟩Id
   (`cliffordMultiplication_anticommutator`; Nicolaescu, Definition 12.1.10,
   p. 626). Include unit orthogonal 2-plane and tensor-product computations.
   *Needs:* Mathlib
   `CliffordAlgebra.ι_mul_ι_add_swap`, `QuadraticMap.polar` and the
   conjugate-first `inner`; Tau Ceti's polarization, Fock and Hermitian-module
   declarations listed under the suppliers.

   **Checks.**
   - V=ℝ, S=ℂ, c(e)=i: c(e)²=−1=Q(e) and ⟨is,t⟩=−i⟨s,t⟩=−⟨s,it⟩, so
     `IsGeometricAction` holds; c(e)=1 fails both clauses (1²≠−1, and 1 is
     Hermitian, not skew-Hermitian); c(e)=Z on ℂ² squares to Id, so no
     algebra map from Cl(Q) with Q(e)=−1 sends ι(e) to it.
   - Negative plane c(e₁)=iZ, c(e₂)=iY: the anticommutator on (e₁,e₁) is
     2(iZ)²=−2Id=−2⟨e₁,e₁⟩Id and on (e₁,e₂) it is −(ZY+YZ)=0; the positive
     convention c(v)²=+|v|²Id would give +2Id on (e₁,e₁).
   - Fock model for V=ℝ²=ℂ with e₂=Je₁, w=e₁^(1,0), g_ℂ(w̄,w)=1/2:
     c(e₁)1=√2w, c(e₁)²1=−2g_ℂ(w̄,w)=−1=−|e₁|², and
     ⟨c(e₁)1,w⟩=√2|w|²=1/√2=−⟨1,c(e₁)w⟩, so c(e₁) is skew-Hermitian for
     the Gram metric; the unnormalized native action ε(v^(1,0))−2ι(v^(0,1))
     sends 1↦w and w↦−1, and ⟨w,w⟩=1/2≠1=⟨1,1⟩, so it is skew-Hermitian only
     for the metric rescaled by 2^p in degree p.
3. The conjugate-linear Clifford involution, compatible spinor metrics,
   multiplicity spaces and the finite scalar trace are Tau Ceti's (see the
   supplier list); this subsection fixes how this roadmap and its consumers
   name them and states no further target.
   - Involutions. κ_base is `CliffordAlgebra.complexConj`, the unique
     conjugate-linear ring endomorphism of `CliffordAlgebra (Q.baseChange ℂ)`
     fixing every ι(1⊗ₜv) (`complexConj_unique`); it is involutive and
     commutes with involute and reverse (`complexConj_complexConj`,
     `complexConj_involute`, `complexConj_reverse`). *Cl_base is
     `CliffordAlgebra.conjStar`=κ_base∘star, an involutive
     anti-automorphism (`conjStar_mul`, `conjStar_conjStar`); under
     `CliffordAlgebra.equivBaseChange` it is the `TensorProduct` star
     *Cl_tens=κ_tens∘(id⊗star_ℝ) of the tensor carrier
     (`toBaseChange_conjStar`), with κ_tens=conj⊗Id
     (`toBaseChange_complexConj`), distinct from real Clifford conjugation
     involute∘reverse. The ℤ/2 eigenspace characterization of the grading is
     `CliffordAlgebra.involute_eq_self_iff` and `involute_eq_neg_iff`.
   - Spinor metrics. For an algebra isomorphism
     ρ:`Cl_ℂ(ℂ⊗_ℝV,−g_ℂ)≃End_ℂ(S)` (Nicolaescu, Proposition 12.1.19,
     p. 630), which forces dim V even, a positive Hermitian metric with
     `ρ(a^{*Cl_base})=ρ(a)†` exists, transported from the Fock metric
     (`CliffordAlgebra.exists_sesqForm_map_eq_map_conjStar`), and is unique up
     to a **positive** scalar (`CliffordAlgebra.existsUnique_pos_mul_of_surjective`).
     Compatibility on all of the algebra is equivalent to skew-adjointness of
     the real generators (`CliffordAlgebra.adjoint_map_eq_map_conjStar_iff`).
   - Multiplicity spaces. For an arbitrary module E over the complexified
     Clifford algebra, the multiplicity space Hom_Cl(S,E) is the space
     `S →ₗ[Cl] E` of Clifford-linear maps, and evaluation s⊗T↦T(s) is the
     isomorphism `TauCeti.isotypicTensorEquivOfBijective` (Nicolaescu,
     Corollary 12.1.22, p. 632), with no finiteness or topology on E. Its
     inverse in a basis and its naturality are
     `isotypicTensorEquivOfBijective_symm_apply_basis` and
     `isotypicTensorEquivOfBijective_symm_apply_map`; for finite-dimensional
     E, dim E=dim S·dim Hom_Cl(S,E)
     (`finrank_eq_finrank_mul_finrank_linearMap_of_bijective_lsmul`). A
     compatible metric on E is a positive Hermitian metric on the multiplicity
     space, `TauCeti.multiplicityMetric`, which evaluation turns into the
     metric of E (`TauCeti.inner_isotypicTensorEquivOfBijective_eq`); it is
     not unique up to scale for reducible E. On S* the dual Clifford action
     is `(a·φ)(s)=φ(ρ(reverse(a))s)`, `AlgHom.cliffordReverseDual`, compatible
     with the Riesz dual metric (`dualMetric_cliffordReverseDual_left`) and
     distinct from conjugate-linear Hermitian adjunction.
   - Scalar trace. τ is `CliffordAlgebra.scalarTrace Q`, the degree-zero
     part under `CliffordAlgebra.equivExterior`, read by
     `ExteriorAlgebra.algebraMapInv`. It satisfies τ(1)=1, τ(ab)=τ(ba) and
     invariance under involute and under reverse (`scalarTrace_one`,
     `scalarTrace_mul_comm`, `scalarTrace_involute`, `scalarTrace_reverse`);
     for every Q on a finite-dimensional V, `2^(dim V)τ(a)=trace(L_a)` on the
     regular module (`trace_mulLeft_eq_two_pow_mul_scalarTrace`; Nicolaescu
     §12.1.2, pp. 626–629), and τ_Q′∘φ=τ_Q for every algebra equivalence φ
     of Clifford algebras of finite-dimensional spaces
     (`scalarTrace_eq_of_algEquiv`). For an orthogonal basis b=(e_i) and any
     Q, degenerate Q included, the native basis `CliffordAlgebra.basis Q b`
     transported from the increasing wedge basis is the ordered-product basis
     e_I (`basis_eq_prod_map_sort`), its empty coordinate is τ
     (`basis_repr_empty`) and `τ(reverse(e_I)e_J)=δ_(I,J)Π_(i∈I)Q(e_i)`
     (`scalarTrace_reverse_basis_mul_basis`). If Q is nonnegative on the
     basis, `τ(reverse(a)a)≥0`, with equality only at a=0 when Q is positive
     on it (`scalarTrace_reverse_mul_self_nonneg`,
     `scalarTrace_reverse_mul_self_eq_zero_iff`); faithfulness is equivalent
     to positive definiteness
     (`posDef_iff_forall_scalarTrace_reverse_mul_self_eq_zero`), and for
     semidefinite Q the null set is the two-sided ideal generated by the
     radical (`scalarTrace_reverse_mul_self_eq_zero_iff_mem_span_radical`).
   - Complexified traces. τ_ℂ is `Module.Dual.baseChange ℂ (scalarTrace Q)`
     on ℂ⊗_ℝCl(Q), with τ_ℂ(z⊗a)=zτ(a),
     `τ_ℂ(a)=2^(−dim V)trace_ℂ(L_a)`
     (`trace_mulLeft_eq_two_pow_mul_baseChange_scalarTrace`), invariance
     under ℂ-algebra equivalences (`baseChange_scalarTrace_eq_of_algEquiv`)
     and `τ_ℂ(κ_tens a)=conj(τ_ℂ(a))` (`baseChange_scalarTrace_congr_conjAe`).
     The transported trace τ_base on `CliffordAlgebra (Q.baseChange ℂ)` is its
     intrinsic scalar part `scalarTrace (Q.baseChange ℂ)`, which agrees with
     τ_ℂ under `equivBaseChange` (`scalarTrace_ofBaseChange`) and satisfies
     `τ_base(a^{*Cl_base})=conj(τ_base(a))` (`scalarTrace_conjStar`). The
     positive-form norm `τ_base(κ_base(reverse a)·a)` for Q≥0 and the
     negative-metric norm `τ_base(a^{*Cl_base}a)` for Q≤0 are nonnegative, with
     null set the two-sided ideal generated by the radical of Q_ℂ and
     faithful exactly for definite Q
     (`scalarTrace_complexConj_reverse_mul_self_nonneg`,
     `scalarTrace_conjStar_mul_self_nonneg`,
     `scalarTrace_complexConj_reverse_mul_self_eq_zero_iff_mem_span_radical`,
     `scalarTrace_conjStar_mul_self_eq_zero_iff_mem_span_radical`,
     `posDef_iff_forall_scalarTrace_complexConj_reverse_mul_self_eq_zero`,
     `posDef_neg_iff_forall_scalarTrace_conjStar_mul_self_eq_zero`). Positive generators are
     not identified with the native negative-generator star without an
     explicit transport map.

   GeneralizedCohomology G5.5 consumes this trace as G1.3's
   cliffordScalarTrace together with τ_ℂ and the ordered-product basis: these
   are Tau Ceti's `CliffordAlgebra.scalarTrace`,
   `Module.Dual.baseChange ℂ (CliffordAlgebra.scalarTrace Q)` and
   `CliffordAlgebra.basis`, with the laws above. *Needs:* Tau Ceti as listed
   under the suppliers; Mathlib `CliffordAlgebra.equivBaseChange`,
   `CliffordAlgebra.star_def`, `Module.Dual.baseChange`.

   **Checks.**
   - S=ℂ² with ρ the plane action Cl(ℂ²)≅M₂(ℂ), E=S⊗ℂ³ with σ=ρ⊗Id:
     the multiplicity space is ℂ³, of dimension 3, and 2·3=6=dim E; for E=S it
     is ℂ·Id by Schur, of dimension 1, whereas all linear maps S→S form a
     4-dimensional space.
   - E=0: the multiplicity space is 0 and S⊗0≅0. V=0, S=ℂ, E=ℕ→₀ℂ with the
     scalar action: Hom_Cl(S,E)=E and 1⊗T↦T(1) is bijective with no
     finiteness on E. If ρ is only an algebra map, say S=ℂ²⊕ℂ² with the
     diagonal plane action and E=ℂ², then Hom_Cl(S,E) has dimension 2 and
     S⊗Hom_Cl(S,E) dimension 8≠2, so evaluation is not injective: ρ onto
     End_ℂ(S) is needed.
   - Cl(0,1), e²=−1: τ(x+ye)=x and L_a=[[x,−y],[y,x]] in the basis (1,e),
     of trace 2x=2¹τ(a); V=0: τ=Id_ℝ and 2⁰τ(a)=a=tr(L_a). The unnormalized
     regular trace would give τ(1)=2^(dim V)≠1.
   - Q=0 on V=ℝ: e²=0, L_(x+ye)=[[x,0],[y,x]] of trace 2x=2τ(a), so the
     trace formula holds for every Q; but τ(reverse(e)e)=τ(e²)=0 with e≠0,
     so faithfulness needs positive definiteness, and for Q(e)=−1,
     τ(reverse(e)e)=−1<0, so nonnegativity needs it too.
   - Under `equivExterior`, `changeForm_ι_mul_ι` sends uv to u∧v+b(u,v),
     b=`QuadraticMap.associated` Q, so τ(uv)=b(u,v)=τ(vu): τ(e₁e₂)=0 for orthogonal e₁,e₂, τ(e₁e₁)=Q(e₁),
     τ(e₁(e₁+e₂))=Q(e₁) and τ(reverse(e₁e₂)e₁e₂)=τ(e₂e₁e₁e₂)=Q(e₁)Q(e₂); a
     definition reading every product of two vectors as pure degree two
     would give τ(e₁(e₁+e₂))=0.
4. In oriented dimension n=2ℓ+1 the labelled odd structure is Tau Ceti's.
   ω_ℂ=i^(ℓ+1)e₁⋯e_n is `CliffordAlgebra.complexVolume`
   (`complexVolume_eq_prod_pairs_mul`), central
   (`complexVolume_mem_center`) with ω_ℂ²=1 for Q(v)=−‖v‖²
   (`complexVolume_mul_self`), so (1±ω_ℂ)/2 are central idempotents and on
   every module the ±1 eigenspaces of ω_ℂ are stable under the whole algebra
   (`smul_mem_eigenspace_complexVolume_of_odd`): an arbitrary module has one
   multiplicity piece for each factor. Reversing the orientation negates
   ω_ℂ (`complexVolume_neg_orientation`). On a spinor module ΛW of a
   polarization adapted to the ordered orientation
   (u₁,Ju₁,…,u_ℓ,Ju_ℓ,u), the remainder vector u acts by λ·exterior-parity
   and ω_ℂ acts by iλ (`TauCeti.SpinPolarizationData.spinAction_complexVolume`),
   so λ=−i gives the + factor and λ=i the − factor
   (`spinAction_complexVolume_eq_one_iff`,
   `spinAction_complexVolume_eq_neg_one_iff`); the labelled two-factor
   isomorphism is `TauCeti.SpinPolarizationData.cliffordEquivEndProd`. The
   dictionary ψ:`Cl_n≃Cl^even_(n+1)` (Nicolaescu, Lemma 12.1.29, p. 634) is
   Mathlib's `CliffordAlgebra.equivEven`, whose `EquivEven.Q'` orders V first
   and e₀ last; Tau Ceti gives its generator form x⁰+x¹↦x⁰+e₀x¹
   (`coe_toEven_of_mem_even`, `coe_toEven_of_mem_odd`), the grade involution
   as conjugation by e₀ (`coe_toEven_involute`) and, after
   complexification, ψ(c(v))=c(e₀)c(v)
   (`CliffordAlgebra.EquivEven.equivOfIsometry_toEven_ι`). G2.1 records the
   comparison of these labels with the chirality of V⊕ℝ under ψ. An ungraded
   odd irreducible module has no even-dimensional chirality splitting. This
   subsection states no further target. *Needs:* Tau Ceti as listed under
   the suppliers; Mathlib `CliffordAlgebra.equivEven`, `EquivEven.Q'`.

   **Checks.**
   - n=1, V=ℝe₁ with e₁²=−1: ω_ℂ=ie₁ has ω_ℂ²=i²e₁²=1, the idempotents
     (1±ie₁)/2 split Cl_ℂ(V)≅ℂ⊕ℂ, and the two irreducibles are ℂ with
     c(e₁)=λ=∓i: λ=−i gives ω_ℂ=iλ=1, the + factor, and λ=i gives −1.
     Without the factor i^(ℓ+1), ω=e₁ squares to −1 and ((1+e₁)/2)²=e₁/2 is
     not an idempotent, so no labels result.
   - n=3 in the negative Pauli model c(e₁)=iZ, c(e₂)=iY, c(e₃)=iX:
     ω=e₁e₂e₃ acts by i³ZYX=(−i)(−i)Id=−Id, so ω²=1 and ω_ℂ=i²ω acts by
     +Id: this module is the + factor. With (u₁,Ju₁,u)=(e₁,e₂,e₃),
     Γ_(u₁,Ju₁)=i(iZ)(iY)=−X and c(u)=iX=λΓ with λ=−i, as the label rule
     says; replacing c(e₃) by −iX gives the − factor. Centrality:
     e₁ω=−e₂e₃=ωe₁.
   - Multiplicity: Cl_ℂ(ℝ³)≅M₂(ℂ)⊕M₂(ℂ) acting on E=ℂ²⊕ℂ²⊕ℂ² through the
     factors (+,+,−) has multiplicity spaces of dimensions 2 and 1, and
     E has no chirality: no invertible endomorphism anticommutes with
     every c(v), since conjugation by one would realize the grade
     involution, which interchanges the two central factors.
   - ψ: ψ(e₁)²=e₀e₁e₀e₁=−e₀²e₁²=−1 preserves the relation,
     ψ(e₁e₂)=e₀e₁e₀e₂=e₁e₂ fixes even elements, and for n=3
     ψ(e₁e₂e₃)=e₁e₂e₀e₃=−e₁e₂e₃e₀; the dictionary e_j↦e_je₀ would give
     +e₁e₂e₃e₀, the opposite sign, and so the opposite labels in G2.1's
     comparison.

## G2. Volume, chirality and exterior-form comparisons

The pointwise Hodge star is Tau Ceti's `Orientation.hodgeStar`, characterized
by `⟨⋆α,β⟩vol=α∧β`, which is the convention `α∧⋆β=⟨α,β⟩vol`, with
complex-linear extension `Orientation.complexHodgeStar`; ComplexKahlerGeometry
K5 supplies the exterior-power Gram metric of bundles of forms. This
finite-dimensional metric package is available before K5's
bundle/analytic Hodge theory and independently of Clifford representations.
G2 cites Tau Ceti's Clifford/chirality comparisons and adds the bridges named
below; R7 retains its real-bundle Weitzenböck/star specialization on the same
carrier.

1. The normalized complex volume Γ is Tau Ceti's `CliffordAlgebra.complexVolume`
   (see the supplier list). It is defined without a frame from the real
   `CliffordAlgebra.volumeElement`, and Γ=i^ℓc(e₁)⋯c(e_(2ℓ)) for every
   positively oriented orthonormal frame (`complexVolume_eq`), so it is
   independent under **orientation-preserving** orthonormal changes and
   changes sign under orientation reversal (`complexVolume_neg_orientation`).
   In rank zero Γ=Id for the positive orientation
   (`complexVolume_positiveOrientation`) and −Id for the negative one: the
   signed convention Γ_σ=σ·Id, which interchanges the half-spin labels for
   σ=−1. For Q(v)=−‖v‖²: Γ²=1 (`complexVolume_mul_self`), `Γ^{*Cl_base}=Γ`
   (`conjStar_complexVolume`, equivalently ρ(Γ)†=ρ(Γ)), the native
   complex-linear `star Γ=(−1)^ℓ Γ` (`star_complexVolume`), and
   Γa=involute(a)Γ (`complexVolume_mul_eq_involute_mul`), so Γ anticommutes
   with every vector (`complexVolume_mul_ι_of_even`). Every module splits
   into the ±1 eigenspaces with projections (Id±Γ)/2
   (`isCompl_eigenspace_complexVolume`,
   `projection_eigenspace_complexVolume_apply`,
   `projection_eigenspace_complexVolume_neg_one_apply`), vectors exchange
   them (`ι_smul_mem_eigenspace_complexVolume_neg`), and intertwiners along
   orientation-preserving isometries preserve them
   (`map_eigenspace_complexVolume`). For a spinor module S, evaluation
   identifies the eigenspaces of E with S⁺⊗Hom_Cl(S,E) and S⁻⊗Hom_Cl(S,E)
   (`TauCeti.eigenspaceTensorEquivOfBijective`), and both half-spin spaces of
   S have dimension 2^(ℓ−1) for ℓ≥1
   (`finrank_eigenspace_complexVolume_of_bijective_lsmul`). On the adapted
   Fock module Γ is exterior parity, with the vacuum in S⁺ and eigenspaces
   `TauCeti.spinPlus` and `TauCeti.spinMinus`
   (`TauCeti.AlmostComplexStructure.fockAction_complexVolume`,
   `eigenspace_fockAction_complexVolume_one`,
   `eigenspace_fockAction_complexVolume_neg_one`). For odd n=2ℓ+1 and G1.4's
   ψ, in the ordered orientation (e₁,…,e_n,e₀), ψ(ω_ℂ)=−Γ_(V⊕ℝ)
   (`CliffordAlgebra.EquivEven.equivOfIsometry_toEven_complexVolume`), and
   ω_ℂ acts through ψ on the μ-eigenspace of Γ_(V⊕ℝ) by −μ
   (`equivOfIsometry_toEven_complexVolume_smul`): the odd ω_ℂ=+1 module is
   the restriction of S⁻_(V⊕ℝ) and the odd ω_ℂ=−1 module restricts S⁺.
   Moving e₀ first reverses the orientation for odd n and interchanges these
   two labels (`equivOfIsometry_toEven_complexVolume_of_cons`).

   This roadmap adds the form of Γ for G1.2's real algebra maps; the library
   states Γ only on modules over `CliffordAlgebra (Q.baseChange ℂ)`. For a
   real algebra map ρ:Cl(Q)→End_ℂ(S), let ρ_ℂ be its complex-linear
   extension to `CliffordAlgebra (Q.baseChange ℂ)`: Mathlib's
   `Algebra.TensorProduct.lift` of the scalar map ℂ→End_ℂ(S) and ρ,
   composed with `CliffordAlgebra.equivBaseChange ℂ Q`. Prove
   ρ_ℂ(ι(1⊗ₜv))=c(v) and, for an oriented 2ℓ-dimensional V with
   Q(v)=−‖v‖², ρ_ℂ(Γ)=i^ℓρ(`CliffordAlgebra.volumeElement` Q o)
   =i^ℓc(e₁)⋯c(e_(2ℓ)) for every positively oriented orthonormal frame, so
   that S⁺ and S⁻ of S as a module over `CliffordAlgebra (Q.baseChange ℂ)`
   are the ±1 eigenspaces of this operator. Prove that, for
   finite-dimensional S, ρ_ℂ is a *-representation for `conjStar`
   exactly when ρ satisfies `IsGeometricAction`'s skew-Hermitian clause
   (from `CliffordAlgebra.adjoint_map_eq_map_conjStar_iff`), so that Γ is
   self-adjoint on every geometric Hermitian module. These are the forms of
   Γ and S^± that G3–G6 use on Clifford-module bundles. *Needs:* G1.2's
   `IsGeometricAction` and `cliffordMultiplication`; Mathlib
   `CliffordAlgebra.equivBaseChange`, `Algebra.TensorProduct.lift`,
   `OrthonormalBasis`; Tau Ceti `CliffordAlgebra.volumeElement_eq` and the
   chirality declarations listed under the suppliers.

   **Checks.**
   - ℓ=0: for the positive orientation Γ is the empty product Id, so S⁺=S
     and S⁻=0; the negative orientation gives Γ=−Id, S⁺=0 and S⁻=S, the
     signed convention Γ_σ=σId with σ=−1.
   - ℓ=1 on the negative plane c(e₁)=iZ, c(e₂)=iY: c(e₁)c(e₂)=iX and
     Γ=i·iX=−X, with Γ²=Id, S⁺=ker(Γ−Id)=ℂ·(1,−1) and S⁻=ℂ·(1,1); c(e₁)
     sends (1,−1) to i(1,1), so Clifford multiplication is odd. Without the
     factor i^ℓ the product iX squares to −Id and has no ±1 eigenspaces;
     the reversed frame (e₂,e₁) gives −Γ and interchanges S⁺ and S⁻.
   - Rotation invariance: for e₁'=cos θ e₁+sin θ e₂ and
     e₂'=−sin θ e₁+cos θ e₂, c(e₁')c(e₂')=(cos²θ+sin²θ)c(e₁)c(e₂)+
     cos θ sin θ(c(e₂)²−c(e₁)²)=c(e₁)c(e₂), using c(e_j)²=−Id.
   - Fock witness for V=ℝ²=ℂ, e₂=Je₁, with G1.2's values c(e₁)1=√2w and
     c(e₂)=i√2(ε(w)+ι(w̄)): c(e₂)c(e₁)1=2i·g_ℂ(w̄,w)=i, so c(e₁)c(e₂)1=−i
     and Γ·1=i·(−i)=1: the vacuum lies in S⁺ as the convention requires,
     and the orientation (Je₁,e₁) would put it in S⁻.
   - Negative control for the hypothesis Q(v)=−‖v‖²: for Q=0, ℓ≥1 and every
     c(e_j)=0 (an algebra map, since ι(v)²=0), i^ℓc(e₁)⋯c(e_(2ℓ))=0 and both
     eigenspaces are 0, not complementary; `IsGeometricAction` excludes it
     because Q(v)≠−⟨v,v⟩, and `complexVolume_mul_self` assumes Q(v)=−‖v‖².
2. The Clifford module of forms is Tau Ceti's (see the supplier list).
   `CliffordAlgebra.exteriorAction` transports left multiplication along
   `CliffordAlgebra.equivExterior` (`exteriorAction_apply_one`); a vector acts
   by c(v)=ε(v)−ι(v) for Q(v)=−‖v‖² (`exteriorAction_ι`), even elements
   preserve exterior parity and odd elements reverse it
   (`exteriorAction_mem_evenOdd`), and `baseChangeExteriorAction` is its
   complexification. The volume element acts by the Hodge star,
   vol·ω=(−1)^(C(k+1,2)+kl)⋆ω on k-forms with k+l=n
   (`exteriorAction_volumeElement`), and in dimension 2ℓ,
   `Γω=i^(ℓ+k(k−1))⋆ω` on complex k-forms
   (`baseChangeExteriorAction_complexVolume_of_eq_two_mul`; Nicolaescu,
   eq. (12.1.1), p. 633), including both orientations. For a full spinor
   representation with skew-adjoint real generators, the inverse Chevalley
   map followed by ρ carries the exterior Gram metric to the normalized
   Hilbert–Schmidt metric `2^(−ℓ)tr(A†B)`, so with the unnormalized trace
   the squared norm acquires the factor 2^ℓ
   (`inv_two_pow_mul_trace_adjoint_map_equivExterior_symm_mul`). The
   chirality of the reverse-dual module is `(−1)^ℓ Γ_S^transpose`
   (`AlgHom.cliffordReverseDual_complexVolume`), with its eigenspaces the
   duals of those of S up to the sign (−1)^ℓ
   (`AlgHom.cliffordReverseDualComplexVolumeEigenspaceEquiv`).

   This roadmap adds the identification of forms with endomorphisms of
   spinors, which the library does not construct. Through the adapted Fock
   polarization construct the Clifford-module isomorphism
   `Λ*V_ℂ≃S⊗S*≃End(S)`, the Clifford algebra acting by left multiplication
   on End(S): send a form to the image under ρ of its inverse Chevalley
   image, using G1.2's normalized Fock action and the tensor-to-endomorphism
   evaluation map, so that the increasing orthonormal wedge e_I maps to
   c(e_I). Prove that it is an isometry from the exterior Gram metric to
   `2^(−ℓ)tr(A†B)` and record the metric/duality comparisons with the
   ordinary tensor and dual metrics. Prove that the chiral action is
   Γ_S⊗Id, while exterior parity is Γ_S⊗Γ_(S*) with the induced dual
   parity Γ_S^transpose; these are different decompositions of forms, and
   the chirality `(−1)^ℓ Γ_S^transpose` of the reverse dual differs from that
   parity exactly when ℓ is odd. *Needs:* Tau Ceti's exterior-action,
   Hodge-star, Hilbert–Schmidt and reverse-dual declarations listed under
   the suppliers; Mathlib `CliffordAlgebra.equivExterior`,
   `Module.Basis.ExteriorAlgebra`; G1.2's Fock action and metric; G1.3's
   evaluation isomorphism; G2.1's Γ; ComplexKahlerGeometry K5's exterior
   Gram metric.

   **Checks.**
   - Plane with vol=e₁∧e₂ and α∧∗β=⟨α,β⟩vol: ∗1=e₁∧e₂, ∗e₁=e₂, ∗e₂=−e₁,
     ∗(e₁∧e₂)=1. With c=ε−ι: c(e₂)1=e₂ and c(e₁)e₂=e₁∧e₂, so
     Γ1=ie₁∧e₂=i^(1+0)∗1; c(e₂)e₁=−e₁∧e₂ and c(e₁)(−e₁∧e₂)=ι(e₁)(e₁∧e₂)=e₂,
     so Γe₁=ie₂=i^(1+0)∗e₁; c(e₂)(e₁∧e₂)=e₁ and c(e₁)e₁=−1, so
     Γ(e₁∧e₂)=−i=i^(1+2)∗(e₁∧e₂); Γ²1=i·(−i)=1.
   - The Γ=+1 eigenspace of the plane is spanned by 1+ie₁∧e₂ and e₁+ie₂
     (Γe₂=−ie₁), mixing degrees, while exterior parity has eigenspaces
     Λ⁰⊕Λ² and Λ¹: the chiral grading Γ_S⊗Id and the parity grading
     Γ_S⊗Γ_(S*) are different decompositions of the four-dimensional
     Λ*(ℝ²)_ℂ=S⊗S*.
   - c(e₁)1=e₁ and c(e₁)e₁=−ι(e₁)e₁=−1, so c(e₁)²=−1=−|e₁|²; the other
     sign ε+ι squares to +g(v,v), the positive convention, which the
     geometric predicate rejects.
   - Normalization and duality: e_I↦c(e_I) is unitary, so
     2^(−ℓ)tr(c(e_I)†c(e_I))=1=|e_I|² for the exterior Gram metric while
     the unnormalized trace gives 2^ℓ (2 for the plane);
     reverse(e₁⋯e_(2ℓ))=(−1)^ℓe₁⋯e_(2ℓ), so the reverse-dual chirality is
     (−1)^ℓΓ_S^transpose, and for ℓ=1 reverse(e₁e₂)=−e₁e₂ interchanges the
     half-spin labels of S*.
3. The graded tensor product is Tau Ceti's (see the supplier list). For a
   grading γ of E, an involution anticommuting with every vector,
   `AlgHom.cliffordProdTensor` makes E⊗F a module over
   `CliffordAlgebra (Q₁.prod Q₂)` with `c(v,w)=c₁(v)⊗Id+γ⊗c₂(w)`
   (`cliffordProdTensor_ι`), and γ⊗γ₂ again anticommutes with every vector
   (`map_mul_cliffordProdTensor_ι`). For even oriented V with γ=Γ_V,
   `CliffordAlgebra.complexProdTensor` is the complexified action on S_V⊗S_W,
   `c(v,0)=c_V(v)⊗Id`, `c(0,w)=Γ_V⊗c_W(w)`, and Γ_(V⊕W)=Γ_V⊗Γ_W for the
   ordered product orientation when dim W is even
   (`complexProdTensor_complexVolume`), while for odd dim W the central
   volume element of V⊕W acts by Id⊗ω_W
   (`complexProdTensor_complexVolume_of_odd`). For a finite-dimensional
   graded space A=A⁺⊕A⁻ the graded twist S⊗̂A, with Clifford action
   c(v)⊗Id, tensor grading Γ_S⊗γ_A and intrinsic chiral grading Γ_S⊗Id, is
   a graded module whose twisting grading is Id⊗γ_A
   (`map_lsmul_complexVolume_ι_smul`,
   `twistingGrading_map_lsmul_complexVolume_apply`); its even part is
   S⁺⊗A⁺⊕S⁻⊗A⁻ and its odd part S⁺⊗A⁻⊕S⁻⊗A⁺
   (`Module.End.eigenspaceTensorMapEquiv`). The induced grading on the
   multiplicity space of a graded Clifford module is
   `CliffordAlgebra.twistingGrading`, with evaluation intertwining
   Γ_S⊗γ_W and the grading of E (`isotypicEval_map_twistingGrading`,
   `eigenspaceTwistingGradingEquiv`).

   This roadmap adds the structural laws of the graded product, which the
   library does not state: the eigenspace decomposition
   S⁺_(V⊕W)≃S⁺_V⊗S⁺_W⊕S⁻_V⊗S⁻_W from `complexProdTensor_complexVolume` and
   `Module.End.eigenspaceTensorMapEquiv`; associativity, symmetry with Koszul
   signs, duality and orientation reversal of `complexProdTensor`; and its
   comparison with Mathlib's `CliffordAlgebra.prodEquiv` and its graded
   tensor product. No ungraded algebra tensor product replaces it. Give the
   rank-zero unit and the one-plane acceptance computations. *Needs:* Mathlib
   `CliffordAlgebra.prodEquiv` and its graded tensor product; Tau Ceti's
   graded-product and graded-module declarations listed under the
   suppliers; G2.1's Γ and half-spin eigenspaces; G1.3's evaluation
   isomorphism.

   **Checks.**
   - V, W negative planes with S_V=S_W=ℂ²: c(v,0)=c_V(v)⊗Id and
     c(0,w)=Γ_V⊗c_W(w) give c(v,0)c(0,w)+c(0,w)c(v,0)=
     (c_V(v)Γ_V+Γ_Vc_V(v))⊗c_W(w)=0 and c(0,w)²=Γ_V²⊗c_W(w)²=−|w|²Id; the
     ungraded choice Id⊗c_W(w) has cross anticommutator 2c_V(v)⊗c_W(w)≠0.
     Γ_(V⊕W)=i²c(e₁)c(e₂)c(f₁)c(f₂)=−c_V(e₁)c_V(e₂)⊗c_W(f₁)c_W(f₂)=Γ_V⊗Γ_W,
     and S⁺_(V⊕W)=S⁺⊗S⁺⊕S⁻⊗S⁻ has rank 2 of 4.
   - Rank-zero unit: V=0, S_V=ℂ, Γ_V=Id gives c(0,w)=Id⊗c_W(w) and
     S_(0⊕W)=S_W with its own Γ; the signed convention Γ_σ=σId with σ=−1
     gives Γ_(0⊕W)=−Γ_W and interchanges the labels.
   - Koszul sign: the swap s⊗t↦(−1)^(|s||t|)t⊗s intertwines c(0,w)=Γ_V⊗c_W(w)
     with c_W(w)⊗Id, since Γ_Vs=(−1)^(|s|)s; the unsigned swap fails on odd
     s. For even V and W the ordered orientations of V⊕W and W⊕V agree,
     so Γ_(W⊕V)=Γ_V⊗Γ_W under the swap.
   - Graded twist with A=A⁺⊕A⁻=ℂ⊕ℂ and ℓ=1: the even part
     S⁺⊗A⁺⊕S⁻⊗A⁻ has dimension 2; on S⊗A⁻ the tensor grading Γ_S⊗γ_A and
     the chiral grading Γ_S⊗Id differ by sign, and for purely even A they
     coincide (Nicolaescu, p. 633: the chirally graded modules are those
     with purely even twisting space).

## G3. Smooth Clifford bundles and compatible connections

1. Construct the algebra bundle Cl(V,−g) and its complexification from the
   orthonormal frame principal bundle by the supplier's isometry action.
   Build smooth fiberwise unit/product, generator inclusion, grading, the
   bundle extension of `*Cl_base`,
   norm and local multiplication formulas. Use the exterior Gram norm
   transported through the Chevalley map, and prove its basis-independence
   and multiplication bounds rather than leaving the norm unspecified. Prove gluing, extensionality,
   pullback along bundle maps, metric isometry naturality and the G1
   complexification/even-algebra comparisons as smooth bundle maps. Apply
   this to TM and T*M using the musical isometry and to pullback/normal bundles.
   For a compact Lie group G with orthogonal ρ:G→O(V), unitary
   μ:G→U(E) and intertwining equality
   c(ρ(g)v)=μ(g)c(v)μ(g)^(−1), descend the algebra/module structures to
   P×_GCl(V), P×_GV and P×_GE for any principal G-bundle P. Prove the
   smooth generator/action/metric comparisons and functoriality; this includes
   the general compact-group construction, not only the frame case.
   Identify c with the corresponding tensor in V_ℂ*⊗E*⊗E, using finite-
   dimensional Hom/tensor and scalar-extension maps. Prove the intertwining
   equation is equivalent to that tensor being G-fixed, with the induced
   tensor representation written explicitly. *Needs:*
   SmoothBundlesConnections B1–B5 (principal and associated bundles,
   descent, frames, tensors, duals, scalar extension, metrics) on Mathlib's
   `FiberBundle`, `VectorBundle` and `ContMDiffVectorBundle`; G1.1's
   negative-form comparisons; G1.3's `*Cl_base` and exterior Gram norm.

   **Checks.**
   - Ranks 0 and 1: Cl(0)=ℝ is the trivial line; for a metric line bundle
     L, Cl(L,−g)=ℝ⊕L has even part the trivial line and odd part L, so for
     the Möbius bundle over S¹ the fibres are ≅ℂ but the algebra bundle is
     a nontrivial rank-two real bundle whose generator is defined up to
     sign.
   - Gram norm: on Cl(ℝ²,−g)≅ℍ the monomials 1,e₁,e₂,e₁e₂ are orthonormal
     and |ab|=|a||b|; on Cl(ℝ³,−g), a=1+ω with ω=e₁e₂e₃ (ω²=1) has a²=2a,
     so |a²|=2√2=√2|a|²: the fibre norm is submultiplicative only up to a
     constant, which the multiplication bound carries.
   - Descent for G=SO(2) rotating V=ℝ² and E=ℂ² the plane module:
     μ(R_θ)=e^(iθ/2)(cos(θ/2)+sin(θ/2)c(e₁)c(e₂)) is single-valued on
     SO(2) (both factors change sign at θ=2π) and satisfies
     c(R_θv)=μ(R_θ)c(v)μ(R_θ)^(−1), since conjugation by
     cos φ+sin φ e₁e₂ rotates V by 2φ (G5.3); it acts on S⁺ with weight 0
     and on S⁻ with weight 1, so the descended bundle over an oriented
     two-plane bundle E is ℂ⊕E. The bare spin factor is not a function on
     SO(2), and μ=Id fails since c(R_(π/2)e₁)=c(e₂)≠c(e₁).
2. A Hermitian Clifford module is an existing smooth finite-rank Hermitian
   vector bundle E with a smooth real-linear c:V→End_ℂ(E) satisfying the
   concrete Clifford and skew-adjoint equalities. It comes with a unital
   algebra-bundle action obtained by the Clifford universal property; prove
   the two presentations equivalent. Define module maps, isometries, direct
   sums, pullbacks, tensor twists and graded modules with anticommutation
   equations, and supply local-frame change and smoothness APIs. *Needs:*
   SmoothBundlesConnections B1–B5's Hermitian vector bundles, sums, duals,
   pullbacks and tensor products; Mathlib `CliffordAlgebra.lift`; G1.2's
   `IsGeometricAction`; G3.1's algebra bundle.

   **Checks.**
   - Trivial ℂ² over ℝ² with c(∂₁)=iZ, c(∂₂)=iY satisfies the Clifford and
     skew-adjoint equalities (G1.2); replacing c(∂₂) by the Hermitian Y
     gives c(∂₂)²=+Id, so the pair is not a Clifford module and the
     algebra-bundle presentation does not exist.
   - Rank: the fibre is a module over Cl_ℂ(n), so its rank is a multiple
     of 2^⌊n/2⌋; the trivial line over ℝ² carries no Clifford action,
     while over ℝ the line with c(∂)=i does, and its sum with the line
     c(∂)=−i is the faithful rank-two module of both G1.4 factors.
   - Pullback and restriction: the plane module restricted along S¹⊂ℝ² to
     TS¹=ℝ∂_θ has c(∂_θ)=−sin θ·iZ+cos θ·iY, skew-Hermitian of square −1
     and trace 0, so it is the sum of the two rank-one circle modules
     c=±i; a pullback is a module for the pulled-back bundle, not a tangent
     module.
3. For a metric connection on V and a Hermitian connection on E, Clifford
   compatibility is the actual Leibniz identity
   `∇^E_X(c(v)s)=c(∇^V_Xv)s+c(v)∇^E_Xs` (Nicolaescu, Definition 12.1.64
   (a2), p. 653). Prove equivalence to ∇c=0,
   affine/skew-adjoint description of compatible connections, induced
   tensor/dual/pullback connections and curvature compatibility
   `[R^E(X,Y),c(v)]=c(R^V(X,Y)v)`. In the principal associated construction,
   use B3's invariant-vector parallel-section theorem on the invariant tensor
   c. The principal connection must induce the prescribed V connection;
   an arbitrary principal connection is not automatically Levi-Civita.
   *Needs:* SmoothBundlesConnections B5's connections and curvature on
   Mathlib's `CovariantDerivative`, and B3's invariant-vector
   parallel-section theorem; HopfRinow L1's Levi-Civita covariant
   derivative; G3.1; G3.2.

   **Checks.**
   - Flat ℝⁿ with constant c, ∇^E=d and ∇^V=d: ∂_X(c(v)s)=c(∂_Xv)s+c(v)∂_Xs,
     so the trivial pair is compatible and ∇c=0.
   - Affine description on the trivial plane module over ℝ²: ∇^E=d+A is
     compatible with the flat ∇^V iff A(X) commutes with c(e₁) and c(e₂),
     i.e. A(X) is scalar; A=iY dx¹ is Hermitian but
     [iY,iZ]=−[Y,Z]=−2iX≠0, so it is not compatible, while A=i dx¹ is.
     The compatible Hermitian connections of the irreducible module form
     an affine space over the imaginary 1-forms.
   - A=(e₁e₂)dx¹ is a Spin(2)-connection whose induced V-connection has
     ∇_(∂₁)e₁=[e₁e₂,e₁]=2e₂≠0, so it is compatible with that connection
     and not with the flat Levi-Civita one.
   - Curvature compatibility on the unit S² (K=1, R(e₁,e₂)e₁=−e₂):
     R^S(e₁,e₂)=¼Σ⟨R(e₁,e₂)e_i,e_j⟩c(e_i)c(e_j)=−½c(e₁)c(e₂) and
     [R^S(e₁,e₂),c(e₁)]=−c(e₂)=c(R(e₁,e₂)e₁); the coefficient ½ in place
     of ¼ would give −2c(e₂).
4. On exterior forms build the induced Levi-Civita connection, c=ε−ι,
   Clifford compatibility and the local frame formulas for d and d*;
   G6 then identifies its Dirac operator with d+d* (Nicolaescu §12.2.1,
   p. 657). Pullback of a module
   connection is general bundle functoriality; a pullback does not identify
   tangent Dirac operators on manifolds of different dimensions. *Needs:*
   DifferentialGeometry L0–L2, L5–L9 (forms, exterior derivative,
   orientation, integration); HopfRinow L1; ComplexKahlerGeometry K5's
   formal adjoint d*; G2.2's c=ε−ι; G3.3's compatibility.

   **Checks.**
   - Flat ℝ² with the trivial Levi-Civita connection d and c=ε−ι: on a
     function f, Df=Σ_j c(e_j)∂_jf=∂₁f e₁+∂₂f e₂=df, since ι(e_j)1=0; on
     the 1-form f e₁, c(e₁)∂₁(f e₁)=−∂₁f (ε(e₁)e₁=0, ι(e₁)e₁=1) and
     c(e₂)∂₂(f e₁)=∂₂f e₂∧e₁=−∂₂f e₁∧e₂, which is d*(f e₁)+d(f e₁) with
     d*=−div on 1-forms; so D=d+d*, as G6.4 states. The choice c=ε+ι
     squares to +|v|² and gives d−d*, skew rather than formally symmetric.
   - Unit S² with e₁=∂_θ, e₂=(1/sin θ)∂_φ and coframe e¹=dθ, e²=sin θ dφ:
     the Levi-Civita values ∇_(e₁)e²=0 and ∇_(e₂)e²=−cot θ e¹ (from
     ∇_(e₂)e₂=−cot θ e₁) give the frame formula
     de²=Σ_j ε(e^j)∇_(e_j)e²=ε(e²)(−cot θ e¹)=cot θ e¹∧e², which is
     d(sin θ dφ)=cos θ dθ∧dφ computed directly, and
     d*e²=−Σ_j ι(e_j)∇_(e_j)e²=−ι(e₂)(−cot θ e¹)=0, as the coclosed form
     sin θ dφ requires; differentiating only the constant frame coefficient
     would give de²=0.
   - Pullback along the inclusion S¹⊂ℝ²: the pulled-back form bundle has
     rank 4 and carries c for the restricted bundle Tℝ²|_(S¹), with
     c(e_r) and c(e_θ) both acting, while Λ*T*S¹ has rank 2 and its D=d+d*
     is the circle operator; the pullback is a Clifford module for the
     restricted tangent bundle, not the tangent Dirac operator of S¹.

## G4. Spin lifts, obstruction and classification

1. **G4.1a. Topological frame adapters.** For n≥1 consume the native
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
   *Needs:* the Tau Ceti covering, compactness, connectivity, units-range
   and special-orthogonal declarations named above; G1.1's rank-zero μ₂ and
   negative-form comparison.

   **Checks.**
   - Spin(2) squaring: cos θ+sin θ e₁e₂ acts on V by rotation by 2θ
     (G5.3), so under e₁e₂↦i the cover Spin(2)→SO(2) is z↦z² on U(1) with
     kernel {±1}; z and −z have the same image.
   - Rank 1: Cl(0,1)^even=ℝ, Spin(1)={±1} and SO(1)={1}; rank 0: μ₂={±1}⊂
     Cl(0,0)=ℝ has two elements, whereas Mathlib's Spin(0), generated by
     the invertible vectors of the zero space, is {1}, so only μ₂ gives a
     rank-zero double cover of SO(0)={1}.
   - Odd units are excluded: the unit vector e₁∈Cl(0,2), with e₁^(−1)=−e₁
     and involute(e₁)=−e₁, acts on V by G1.1's twisted conjugation
     v↦involute(e₁)·v·e₁^(−1): e₁↦(−e₁)e₁(−e₁)=−e₁ and
     e₂↦(−e₁)e₂(−e₁)=e₁e₂e₁=e₂, the reflection in e₁^⊥, of determinant −1
     (the plain conjugation would give e₁e₁e₁^(−1)=e₁ and
     e₁e₂e₁^(−1)=−e₂, also of determinant −1); the Spin carrier is the
     even part, where the two conjugations agree and every element acts
     with determinant +1.

   **G4.1b. Smooth refinement.** Consume
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
   *Needs:* the Tau Ceti Lie-structure, Lie-map, coordinate-Lie-hom and
   local-diffeomorphism declarations named above; SmoothBundlesConnections
   B2's operator-topology instances and units-level identity homeomorphism;
   G4.1a; G1.1's negative-form comparison with its bivector sign.

   **Checks.**
   - Rank two: in the positive form e₁e₂ squares to −1 and
     z(θ)=cos θ+sin θ e₁e₂ lies in Spin(2); conjugation gives
     z e₁ z^(−1)=cos 2θ e₁−sin 2θ e₂ and z e₂ z^(−1)=sin 2θ e₁+cos 2θ e₂,
     a rotation through the angle 2θ, so z(π)=−1 is the kernel and the
     differential at 1 sends e₁e₂ to the matrix A with Ae₁=−2e₂, Ae₂=2e₁,
     the Clifford commutators [e₁e₂,e₁]=−2e₂ and [e₁e₂,e₂]=2e₁; this is the
     value 2(e₁e₂ᵀ−e₂e₁ᵀ) of `bivectorEquivSo` on e₁∧e₂, and ℝe₁e₂→so(2)
     is a bijection. A differential normalised without the factor 2 would
     contradict the commutator; G1.1's comparison sends e₁e₂ to −e₁e₂ in
     the negative form and reverses the sign of A.
   - Evenly covered sections: over the arc of rotations R_φ,
     φ∈(−π,π), with R_φe₁=cos φ e₁+sin φ e₂, the preimage in Spin(2) is the
     disjoint union of the images of the two smooth sections
     φ↦±(cos(φ/2)−sin(φ/2)e₁e₂); a section over all of SO(2) would be a
     continuous square root on the circle, which does not exist, so the
     cover is the connected one z↦z² and not the trivial one.
   - Rank one: Spin(1)={±1}⊂Cl(1,0) and SO(1)={1}; both Lie algebras are
     zero (⋀²ℝ¹=0 and so(1)=0), the differential is the zero bijection,
     the covering is the two-point cover of a point with the constant
     section 1, and the odd unit e₁, excluded from Spin, would act on ℝ¹ by
     −1 under G1.1's twisted conjugation (involute(e₁)e₁e₁^(−1)=−e₁ with
     e₁²=1), which is not in SO(1).
2. On TopologicalKTheory T6.4's continuous principal-bundle carrier and
   CharacteristicClasses C1's actual oriented orthonormal frame bundle,
   use G4.1a's native Spin units range when n≥1 and G1.1's
   μ₂=`evenUnitaryGroup (realCliffordForm 0 0)` when n=0 as the
   topological structure group. Smooth bundles use G4.1b's Lie structure
   for n≥1. For rank0 equip G1.1's same μ₂ subgroup of Cl(0)ˣ with
   `TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed`'s
   embedded Lie-subgroup data. Prove its Lie algebra is zero and its induced
   topology discrete, giving the zero-dimensional smooth structure.
   A spin structure on an
   oriented metric V of rank n is a numerable principal Spin(n)-bundle P with an equivariant map P→Fr⁺_SO(V) over the
   identity, inducing an isomorphism `P×_Spin SO(n)≃Fr⁺_SO(V)`.
   Define equivalences, pullback and descent; prove metric-change independence
   by constructing the unique positive g-self-adjoint B with
   g'(u,v)=g(Bu,v), its positive square root, and the frame map B^(−1/2).
   Prove smooth dependence through the invertible Sylvester differential
   H↦B^(1/2)H+HB^(1/2), and naturality under pullback and bundle isometries.
   Compare composite metric changes through homotopies in the contractible
   positive-metric space; noncommuting square roots need not compose literally.
   A lift is data, not merely the proposition w₂(V)=0. For a smooth base
   prove each continuous lift has the unique smooth structure transported
   through its covering of the smooth oriented frame bundle. *Needs:*
   TopologicalKTheory T6.4's numerable principal-bundle category;
   CharacteristicClasses C1's continuous oriented orthonormal frame bundle;
   SmoothBundlesConnections B1's descent and frames; G4.1a/G4.1b's
   structure groups; G1.1's μ₂ with Tau Ceti
   `TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed`;
   Mathlib `CFC.sqrt` for the positive square root of B.

   **Checks.**
   - Circle: Fr⁺_SO(1)(TS¹)=S¹ and Spin(1)={±1}, so a spin structure is a
     double cover of S¹ over the identity: the trivial cover and the
     connected one, two structures (Nicolaescu, Exercise 12.2.30, p. 670);
     over a simply connected base there is one.
   - A lift is data: over S¹ the proposition w₂=0 holds (H²(S¹;ℤ/2)=0)
     while the two lifts are inequivalent; in rank zero the frame bundle is
     the base and μ₂-lifts are its double covers, two over S¹ and one
     over S².
   - Metric change g'(u,v)=g(Bu,v) with B=diag(4,1) on ℝ²: B^(1/2)=diag(2,1)
     and B^(−1/2) sends the g-orthonormal frame (e₁,e₂) to (e₁/2,e₂),
     which is g'-orthonormal (g'(e₁/2,e₁/2)=g(2e₁,e₁/2)=1); B^(−1) would
     give (e₁/4,e₂) of g'-norm ½; B=Id has as g-self-adjoint square roots
     exactly the reflections 2P−Id for P an orthogonal projection, among
     them ±Id and diag(1,−1), of which only +Id is positive. The Sylvester
     map H↦B^(1/2)H+HB^(1/2) has
     eigenvalues √b_i+√b_j>0, so it is invertible (2H at B=Id).
3. For smooth bases choose good-cover orthonormal transitions and local lifts
   to Spin. For a general paracompact numerable base, consume C3.5's
   atlas-refinement/local-lifting construction using locally finite shrinkings
   and evenly covered neighborhoods; specialize it to the frame bundle. Use the locally constant Z/2 coefficient sheaf in its Čech groups.
   Apply C3.5's universal cocycle construction and its independence,
   naturality and w₂ comparison to this frame bundle. Identify the
   pulled-back cocycle as the local triple-product discrepancy. Prove a spin
   structure exists iff
   this class vanishes, by correcting lifted transitions with a 1-cochain
   and gluing (Nicolaescu, Proposition 12.2.25, p. 669, for manifolds;
   Lawson–Michelsohn, Theorem II.1.7). In the smooth setting use locally constant central cochains
   and B1 descent. Identify singular w₂ on paracompact Hausdorff CW-type bases; do not assert
   singular/Čech equality for arbitrary paracompact spaces. *Needs:*
   CharacteristicClasses C3.5's local lifting, universal cocycle and w₂
   comparison, and C1's mod-2 cohomology with its singular/Čech
   comparison; AlgebraicTopology Stages 2–6's cochains and products;
   SmoothBundlesConnections B6.0's good covers and B1's descent; G4.1a;
   G4.2.
4. Given one lift, twist by a principal Z/2-bundle. Prove this action is free
   and transitive on equivalence classes, giving an H¹(X;Z/2) torsor
   (Lawson–Michelsohn, Theorem II.1.7; Nicolaescu, Remark 12.2.28 and
   Exercise 12.2.35, pp. 669 and 673), with
   explicit relative gauge transformations and cocycle comparisons. Construct
   product/direct-sum lifts using `(Spin(m)×Spin(n))/{(1,1),(−1,−1)}`
   and the actual homomorphism to Spin(m+n). Pin the ordered orientations,
   associativity, pullback and metric-change maps, and their low-rank central
   kernels, using the μ₂ geometric branch whenever a rank is 0. The rank 0
   frame bundle is C1's canonical oriented zero-frame bundle; retain any
   additional rank-zero orientation sign as separate data in chirality and
   characteristic comparisons. The rank 0 unit is the trivial μ₂ lift; an arbitrary rank 0 lift acts by its central
   flat-line twist. This is a construction on supplied bundles, not an assertion
   that every oriented bundle is spin. *Needs:* G4.2's lifts and
   equivalences; SmoothBundlesConnections B1's descent; CharacteristicClasses
   C1's canonical zero-frame bundle; G4.1a's covering with its central
   kernel; G1.1's μ₂.

   **Checks.**
   - S¹: H¹(S¹;ℤ/2)=ℤ/2, two structures, periodic and antiperiodic,
     exchanged by the nontrivial twist; T²: four; Sⁿ for n≥2: one, since
     H¹=0. Twisting twice by the same ℤ/2-bundle is the identity.
   - Direct sum for m=n=1: (Spin(1)×Spin(1))/{(1,1),(−1,−1)}≅ℤ/2 maps to
     {±1}⊂Spin(2) by multiplication; over S¹ the sum of lifts of twist
     classes a and b has class a+b, so antiperiodic⊕antiperiodic has
     transitions (−1)(−1)=+1 and is the periodic rank-two structure.
   - Rank zero: the unit is the trivial μ₂-lift; twisting it by the
     connected double cover of S¹ gives the connected μ₂-lift, and in a
     direct sum a rank-zero lift contributes exactly its flat-line twist.

## G5. Spinor bundles, chiral products and rank-two roots

0. **Real regular Clifford spinors.** Construct realCliffordSpinorBundle
   for an oriented rank-n metric Spin bundle P as
   P×_Spin(n)Cl(0,n), with Spin acting by left multiplication through
   G1.1/G4's specified negative even-unitary comparison. Give its smooth
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
   on the right by the negative Clifford vector after parity. This is
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
   odd generators are not identified by an algebra isomorphism. *Needs:*
   G1.1's even-unitary comparison and vector-conjugation action; G1.3's
   monomial basis and trace; G3.1's algebra-bundle comparison; G4.2's lift;
   SmoothBundlesConnections B5's associated connections; Tau Ceti
   `TauCeti.realCliffordForm`; GeneralizedCohomology G5.5's mixed-signature
   conventions, for the comparison only.

   **Checks.**
   - n=1: Cl(0,1)=ℝ⊕ℝe with e²=−1, orthonormal basis (1,e), ε(1)=1,
     ε(e)=−e. c₋(e)1=e and c₋(e)e=−1: odd, skew-adjoint
     (⟨c₋(e)1,e⟩=1=−⟨1,c₋(e)e⟩), square −1. C₊(e)1=ε(1)e=e and
     C₊(e)e=ε(e)e=−e²=1: odd, self-adjoint, square +1; on 1,
     c₋(e)C₊(e)+C₊(e)c₋(e)=c₋(e)e+C₊(e)e=−1+1=0. Dropping the parity from
     C₊ gives s↦se with square −1, the negative relation.
   - Spin(1)={±1} acts by ±Id, so over S¹ the periodic lift gives the
     trivial rank-two bundle and the antiperiodic lift gives two Möbius
     lines, both monomials being negated by −1.
   - n=2: Cl(0,2)=ℍ with 1,e₁,e₂,e₁e₂ orthonormal; z=cos θ+sin θ e₁e₂
     acts by left multiplication, z·e₁=cos θ e₁+sin θ e₂, rotating the odd
     part by θ, whereas its conjugation rotates V by 2θ (G5.3): the
     regular bundle is not the vector-action associated bundle of the
     frame bundle. Left multiplication preserves norm and parity, and
     C₊(e₁)C₊(e₂)1=C₊(e₁)e₂=ε(e₂)e₁=−e₂e₁=e₁e₂, the right multiplication
     by e₁e₂.
   - Rank zero: Cl(0,0)=ℝ with ε_σ=σ; the positive point's line is even
     and the negative point's odd; σ is separate data, not read off the
     empty frame, and agrees with G2.1's Γ_σ=σId. C₊(w)=R_w∘ε commutes
     with the left Spin action, so it is parallel for every associated
     connection, whereas c₋(v)=L_v obeys ∇(c₋(v)s)=c₋(∇v)s+c₋(v)∇s only.

1. Associate the irreducible complex Clifford module S to a chosen lift;
   its Spin action is obtained by restriction along G1.1’s positive-to-negative
   even-algebra comparison. Build S(V), its positive metric,
   Clifford action and, in even dimension,
   the G2 half-spin subbundles. Give local transition/rank formulas,
   functoriality under spin isometries, pullback, orientation reversal and
   change of spin structure by a flat central line. In odd dimension retain
   the chosen Clifford factor for S(V), and also construct the faithful
   ungraded module S_odd^+⊕S_odd^- from both ω-labeled factors, with its
   metric and diagonal action/connection. This is Nicolaescu's odd spinor
   module S(V)=S⁺(V)⊕S⁻(V) (Proposition 12.1.30, p. 635); its factor
   labels are not an even-dimensional chiral grading. The chosen-factor geometric spinor has half its rank. Lift the metric connection through the Lie
   algebra isomorphism to the principal spin connection; construct its
   compatible spinor connection and curvature formula. For TM use precisely
   the Levi-Civita connection, and prove Γ parallel. *Needs:* G1.1's
   positive-to-negative even-algebra comparison; G1.3's Hermitian metric and
   G1.4's odd factors; G2.1's half-spin eigenspaces; G4.1b's Lie algebra
   isomorphism; G4.2's lift; HopfRinow L1; SmoothBundlesConnections B5;
   G3.3's compatibility.

   **Checks.**
   - Ranks: S(V) has complex rank 2^⌊n/2⌋: 1 on a circle, 2 on a surface
     and on a 3-manifold (chosen factor), 4 on a 4-manifold with S^± of
     rank 2; the faithful odd module S_odd^+⊕S_odd^- of a 3-manifold has
     rank 4, twice the chosen factor.
   - S² with E=TS² of degree 2 and G5.3's weights: S⁻≅E^(1/2) has degree
     1 and S⁺≅(S⁻)* degree −1, so S(TS²) has rank 2 and degree 0 with
     non-isomorphic half-spin bundles; the convention (S⁺)²≃E would
     interchange the degrees.
   - Change of lift on S¹: the antiperiodic spinor bundle is the periodic
     one tensored with the flat complex Möbius line, with sections
     s(θ+2π)=−s(θ). Γ is parallel: on the flat plane Γ=−X is constant
     (G2.1), and in general the volume element is parallel for every
     compatible connection.
2. Prove the smooth bundle version of G2's graded tensor product for direct
   sum spin lifts. On compact bases, in TopologicalKTheory T2's supplied K-ring derive
   `[S⁺(V⊕W)]−[S⁻(V⊕W)]=([S⁺(V)]−[S⁻(V)])([S⁺(W)]−[S⁻(W)])`.
   Keep actual spin structures and intertwiners in the bundle theorem; an
   equality of ungraded ranks alone does not prove this formula. *Needs:*
   G2.3's graded tensor product; G4.4's direct-sum lifts; G5.1;
   TopologicalKTheory T1–T2's K-ring and products.
3. For an oriented metric two-plane bundle let E=(V,J), J the positive
   quarter-turn. Pin the spin parameter
   `z=cos θ+sin θ e₁e₂` in Cl(V,−g), whose conjugation rotates V by
   2θ. The corresponding positive-form units-range element is
   `cos θ−sin θ e₁e₂` by G1.1's bivector sign. Thus E has
   weight z². With the G1 Fock action and Γ=i c(e₁)c(e₂), S⁺ has weight
   z^(−1) and S⁻ weight z. Thus `(S⁺)²≃E*`, `(S⁻)²≃E` and
   `S⁻≃(S⁺)*`. Prove the equivalence of spin lifts with Hermitian line
   square roots of E (including the root isomorphism), and construct the
   connections with curvature halving. The labels must obey these explicit
   characters; reversing the orientation interchanges them, so an
   unqualified `(S⁺)²≃E` holds for the reversed orientation. *Needs:* G1.1's
   bivector sign; G1.2's Fock action; G2.1's Γ; G4.2's lifts; G5.1's
   connection; ComplexKahlerGeometry K1/K4's Hermitian line bundles;
   SmoothBundlesConnections B5's curvature.

   **Checks.**
   - z=cos θ+sin θ e₁e₂ has (e₁e₂)²=−1 and ze₁=e₁z^(−1), so
     ze₁z^(−1)=e₁z^(−2)=cos 2θ e₁+sin 2θ e₂: E=(V,J) has weight z² under
     z↦e^(iθ), and z^(−1)=cos θ−sin θ e₁e₂.
   - With Γ=ic(e₁)c(e₂), c(e₁)c(e₂)=−iΓ and ρ(z)=cos θ−i sin θ Γ acts by
     e^(−iθ) on S⁺ and e^(iθ) on S⁻: (S⁻)² has weight z²=E, (S⁺)² weight
     z^(−2)=E*, and S⁺⊗S⁻ weight 0, so S⁻≃(S⁺)*; the reversed frame
     (e₂,e₁) changes the sign of Γ and gives (S⁺)²≃E.
   - S²: E=TS² has c₁=2 and H²(S²;ℤ)=ℤ has no 2-torsion, so E has one
     square root up to isomorphism (c₁=1), matching the unique spin
     structure; the flat T² has four flat square roots of the trivial E,
     matching |H¹(T²;ℤ/2)|=4. Curvature halving gives the root of TS² the
     Chern number 1=2/2.

## G6. Dirac operators and curvature formulas

0. **Real Clifford-linear analytic index.** On any boundaryless oriented
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
   regular module (Nicolaescu, Theorem 12.2.33, p. 673; Lawson–Michelsohn,
   Theorem II.8.8). G6.2 states the connection-induced square formula for
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
   the geometric ABS/PT genus and its complexification/Â formula. *Needs:*
   G5.0; G5.1; G6.1–G6.3; G2.2's dual parity and G2.3's graded products;
   the differential-operator, ΨDO-identification, Sobolev-mapping and
   elliptic-estimate contracts P1.0/P4–P6 whose owner the supplier section
   names; ComplexKahlerGeometry K5a;
   GeneralizedCohomology G5.5's functional-calculus, comparison,
   stabilization and family-index declarations named above;
   TopologicalKTheory T7's KO coefficients and graded quotient and T4's
   generator u.

   **Checks.**
   - Rank one, A=Cl(0,1)≅ℂ: reverse∘involute fixes 1 and negates e, so it
     is complex conjugation and ⟨s,t⟩_A=∫s̄t on the circle; ⟨s,s⟩_A=∫|s|²≥0,
     ⟨sa,tb⟩_A=ā⟨s,t⟩_Ab, and the scalar part τ(⟨s,t⟩_A)=Re∫s̄t is the
     real L² inner product, so here ‖s‖_A=‖s‖_(L²).
   - Not equal in general: on the flat T³ of volume 1 with A=Cl(0,3), the
     constant section s=1+ω, ω=e₁e₂e₃ (ω²=1, ω*=ω), has ⟨s,s⟩_A=2+2ω,
     of C*-norm 4 (ω is a self-adjoint unitary with both eigenvalues) and
     of scalar part 2=‖s‖²_(L²): ‖s‖_A²=4≠2, the norms are equivalent and
     not equal.
   - Circle spectra and classes: D=e·d/dθ on the periodic circle has
     eigenvalues −k, k∈ℤ, and kernel the constants Cl(0,1), the graded
     regular module, class η∈KO₁=ℤ/2; the antiperiodic circle has k∈ℤ+½,
     kernel 0 and class 0. On the Lie-framed T² the kernel is the
     constants Cl(0,2), class η²≠0 in KO₂, while ker D⁺ and ker D⁻ of the
     complexified chiral operator are both one-dimensional, so the chiral
     complex index is 0=c(η²), as n≡2 mod 4 requires.
   - Lichnerowicz values: the round S³ has Scal=6, so D²≥3/2 and the
     kernel vanishes (Scal=n(n−1) on every round Sⁿ); the flat Lie-framed
     T³ has Scal=0 and kernel the parallel sections, the constants
     Cl(0,3) of real dimension 8. Signed points give +1 and −1 in KO⁰=ℤ,
     and a positive and a negative point together give 0.

1. On a Riemannian manifold with a Hermitian Clifford module E for TM, assume
   the chosen connection ∇^E is Hermitian and satisfies the Levi–Civita
   compatibility identity: for vector fields X,v and sections s,
   `∇^E_X(c(v)s)=c(∇^LC_X v)s+c(v)∇^E_Xs`. This is a hypothesis on the
   selected connection; an arbitrary Hermitian connection on E need not satisfy
   this identity for the specified ∇^LC. Define D=Σc(e_j)∇^E_(e_j) on smooth
   sections, from the pointwise contraction `diracInFrame` of a frame.
   Prove frame independence (`diracInFrame_eq`), first-order locality,
   Leibniz rule
   D(fs)=c((df)♯)s+fDs, smoothness, pinned symbols and ellipticity. Prove formal
   symmetry by integration by parts on compactly supported sections
   (Nicolaescu, Proposition 12.1.66, p. 655). On a closed
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
   `T^*M` with projection `π_{T^*M}`:
   `[π_{T^*M}^*E⁺,π_{T^*M}^*E⁻, ξ↦σ_geom(D⁺)(ξ)=c(ξ♯)|_{E⁺}]`.
   This bundle map is homogeneous of degree 1 and invertible for ξ≠0.
   For every (E,γ), the phase homotopy
   `e^(iπt/2)c(ξ♯)` joins the geometric symbol to the Fourier symbol
   `i c(ξ♯)`. On a closed base, prove the chiral Fredholm index of
   H^(s+1)(E⁺)→H^s(E⁻) is independent of s. *Needs:* HopfRinow L1; G3.2;
   G3.3; SmoothBundlesConnections B5's `CovariantDerivative`; Mathlib
   `OrthonormalBasis`; DifferentialGeometry L5–L9's integration; the
   differential-operator, ΨDO-identification, Sobolev-mapping and
   elliptic-estimate contracts P1.0/P4–P6 whose owner the supplier section
   names; ComplexKahlerGeometry K5a; G2.1's Γ.

   **Checks.**
   - Flat ℝ² with the trivial bundle ℂ², c(∂₁)=iZ, c(∂₂)=iY and the trivial
     connection: `diracInFrame` is iZ∂₁+iY∂₂, and
     D²=(iZ)²∂₁²+(iY)²∂₂²−(ZY+YZ)∂₁∂₂=−∂₁²−∂₂², the nonnegative flat
     Laplacian, as the Fourier symbol |ξ|²Id requires; the positive
     convention c(v)²=+|v|²Id would give +∂₁²+∂₂².
   - Frame change: for n=0 the sum is empty and the value is 0; for the
     rotated frame e₁'=cos θ e₁+sin θ e₂, e₂'=−sin θ e₁+cos θ e₂,
     bilinearity in the frame vector gives
     c(e₁')∇_(e₁')+c(e₂')∇_(e₂')=(cos²θ+sin²θ)(c(e₁)∇_(e₁)+c(e₂)∇_(e₂)),
     the cross terms cos θ sin θ(c(e₁)∇_(e₂)+c(e₂)∇_(e₁)) cancelling in
     pairs, which is `diracInFrame_eq`; the non-orthonormal frame (2e₁,e₂)
     would give 4c(e₁)∇_(e₁)+c(e₂)∇_(e₂), so orthonormality is needed.
   - Circle of length 2π with the trivial line bundle and c(∂_θ)=i, so
     c(∂_θ)²=−1=−|∂_θ|²: D=i d/dθ has eigenfunctions e^(ikθ) with
     eigenvalues −k, k∈ℤ for the periodic structure (kernel the constants,
     complex dimension 1) and k∈ℤ+1/2 for the antiperiodic one (kernel 0),
     the values G6.5 requires; the Hermitian choice c(∂_θ)=1 gives d/dθ,
     which is skew-symmetric rather than formally symmetric.
2. Prove D²=∇*∇+Σ_(i<j)c(e_i)c(e_j)R^E(e_i,e_j) (Nicolaescu, Theorem
   12.1.67, p. 656; Lawson–Michelsohn, Theorem II.8.2), including the
   curvature contraction and normal-frame calculation. This is the connection-induced
   Dirac operator; an arbitrary first-order Dirac-type operator may carry an
   additional zero-order term. Compare its Bochner connection with PDO P1's
   canonical construction and its Laplace-type realization with K5. *Needs:*
   G6.1; G3.3's curvature compatibility; SmoothBundlesConnections B5's
   curvature; RiemannianGeometry R1's curvature identities; the
   differential-operator contract P1.0 whose owner the supplier section
   names; ComplexKahlerGeometry K5's Laplace-type theory.
3. For the spin connection prove
   `R^S(X,Y)=¼Σ_(i,j)⟨R(X,Y)e_i,e_j⟩c(e_i)c(e_j)` and
   `D_S²=∇*∇+Scal/4` (Nicolaescu, Theorem 12.2.33, p. 673;
   Lawson–Michelsohn, Theorem II.8.8). For a Hermitian twist W with
   connection prove
   `D_W²=∇*∇+Scal/4+Σ_(i<j)c(e_i)c(e_j)⊗F^W(e_i,e_j)`.
   Build gauge/isometry naturality and direct-sum/product formulas before
   deriving the compact positive-scalar-curvature absence of harmonic
   spinors, the nonnegative case's parallel-spinor conclusion and the
   corresponding twisted curvature-positivity criterion. Numerical topological
   index obstructions are outside this development. *Needs:* G6.2; G5.1's
   spin curvature; RiemannianGeometry R1's Bianchi and symmetry identities
   for the contraction to Scal/4; G6.1's integration by parts for the
   kernel statements; G2.3's graded twist.
4. On exterior forms prove D=d+d* (Nicolaescu, Proposition 12.2.1,
   p. 657), D² the nonnegative Hodge Laplacian and
   recover R7's real Weitzenböck curvature term. Exterior parity gives the
   Euler operator; G2's chiral grading gives the signature operator on
   even-dimensional oriented bases. Prove DΓ=−ΓD, the block/formal-adjoint
   comparison and harmonic-kernel identification. The numerical Euler/signature
   formulas are outside this geometric
   development; retain the operator and harmonic-space identifications.
   *Needs:* G3.4; G6.1; G6.2; DifferentialGeometry L5–L9's d and Stokes;
   ComplexKahlerGeometry K5's formal adjoint, Hodge Laplacian and Hodge
   theorem; RiemannianGeometry R7's Weitzenböck term; G2.1/G2.2's gradings.
5. Acceptance cases include the flat Euclidean operator, periodic and
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
   is imposed there. *Needs:* G4.3; G4.4; G5.1; G6.1; G6.3; HopfRinow L1;
   CharacteristicClasses C1's universal w₂ and its Whitney formula;
   RiemannianGeometry R5's normal bundles; Mathlib `fourierBasis` on
   `AddCircle` for the circle and torus spectra.
6. On a closed even-dimensional spin manifold construct the exact-off-zero
   bundle triple `(π*S⁺,π*S⁻,c(v))` on TM (the symbol of D⁺: Nicolaescu
   §12.2.3, p. 672). Through TopologicalKTheory T3
   export its compact-support class in K_c(TM); its support is the compact
   zero section. Prove metric-musical comparison with the T*M carrier and
   the phase homotopy between c(v) and the Fourier symbol i c(v), preserving
   invertibility away from zero. On a closed base G6.1's symbol triple over
   `T*M` has its exact-off-zero class in `K_c(T*M)`; for E=S with γ=Γ, or
   E=S⊗W with γ=Γ⊗Id, it corresponds under ♯ to the respective untwisted
   or twisted class in `K_c(TM)` constructed here. Export the graded product, pullback along
   spin isometries and twisted-bundle comparisons. Numerical analytic versus
   topological index equality is outside this roadmap. *Needs:* G5.1's
   half-spin bundles; G2.1's Γ; G6.1's symbol; TopologicalKTheory T3's
   compact-support K-theory; SmoothBundlesConnections B1's pullback bundles.

   **Checks.**
   - Flat plane with c(v)=v₁iZ+v₂iY and G2.1's S⁺=ℂ(1,−1), S⁻=ℂ(1,1):
     c(v)(1,−1)=iv₁(1,1)+v₂i·i(1,1)=(iv₁−v₂)(1,1), so in the bases (1,−1)
     and (1,1) the symbol S⁺→S⁻ is multiplication by i(v₁+iv₂), nonzero
     for v≠0 (c(v)²=−|v|²) and of winding number +1 around the unit
     circle; its class generates K_c(ℝ²)≅ℤ. The reversed orientation
     interchanges S⁺ and S⁻ and gives the symbol i(v₁−iv₂) of winding
     number −1, the negative class.
   - Rank zero: TM is the zero bundle over the point, the triple is
     (S⁺,S⁻,0) with S⁺=S≅ℂ and S⁻=0 for the canonical Γ=Id, exact off the
     zero section vacuously, and its class in K_c(pt)=K(pt)≅ℤ is
     rank S⁺−rank S⁻=1; the signed orientation σ=−1 gives S⁺=0, S⁻=S and
     the class −1, whereas a class read off the symbol map alone would
     be 0.
   - Twist by the trivial W=ℂʳ over the plane: the symbol is
     i(v₁+iv₂)·Id_r in the bases above, with determinant of winding number
     r, so the twisted class is r times the untwisted one and r=1 and r=2
     are distinguished; the phase homotopy e^(iπt/2)c(v) multiplies by a
     nonzero scalar and leaves the winding number, hence the class,
     unchanged, while the family t·c(v) vanishes identically at t=0 and is
     not exact off zero.

7. On a closed oriented Riemannian spin four-manifold, construct the
   **untwisted** half-spin quaternionic symmetries J⁺ and J⁻ on G5's
   actual S⁺/S⁻ bundles. Use the
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
   representation and apply the G6.7-owned parity theorem
   `even_finrank_of_conjLinear_square_neg` (a conjugate-linear J with J²=−1
   on a finite-dimensional complex space forces even complex dimension; the
   Spin-equivariance of J is not needed for the parity) to obtain even
   complex dimension. Do not claim these kernels carry a
   nontrivial natural Spin representation. Give their right-Hamilton-module convention explicitly
   and compare complex restriction through Quaternion.ofComplex; complex
   dimension is twice quaternionic dimension.
   Export the complex index formula: the chiral complex index equals 2α,
   where
   α=dim_ℍ ker D⁺−dim_ℍ ker D⁻. Include finite-dimensional evenness for a
   complex space carrying the native quaternionic structure, kernel
   restriction, direct sums, change of Spin frames and spin-isometry pullback.
   Prove realSpinDiracIndexClass=α·a in KO₄. Pin the raw negative
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
   is not an input to this construction. *Needs:* SpinRepresentations L7's
   real Clifford classification; Tau Ceti
   `Representation.IsQuaternionicStructure`; Mathlib `Quaternion.ofComplex`;
   G5.1; G6.0; G6.1's domains and chiral adjoints; ComplexKahlerGeometry
   K5a's H¹/L² carriers; TopologicalKTheory T7's class a;
   `even_finrank_of_conjLinear_square_neg`.

   **Checks.**
   - Parity: on ℂ², J(z₁,z₂)=(−z̄₂,z̄₁) is conjugate-linear with J²=−1,
     dimension 2; on ℂ, J(z)=az̄ has J²z=|a|²z, never −z, so no such J
     exists in dimension 1, matching |det A|²=(−1)^(dim V).
   - ω₋=e₁e₂e₃e₄: ω₋²=(−1)^6(−1)^4=1 and Γ=i²ω₋=−ω₋; ω₋e_j=−e_jω₋, so
     ω₋aω₋=(−1)^(deg a)a=ε(a) on the regular module;
     C₊(e₁)C₊(e₂)C₊(e₃)C₊(e₄)1 passes through e₄, e₃e₄, e₂e₃e₄ to
     e₁e₂e₃e₄=ω₋=R_(ω₋)1, and on the ε-even sector R_(ω₋)=L_(ω₋)=−Γ, so
     Γ=+1 is external volume −1.
   - Phase: (zJ)²=zz̄J²=−1 for |z|=1 and −|z|² otherwise, so only unit z
     preserve the structure, and J⁻c(v)=c(v)J⁺ persists for (zJ⁺,zJ⁻)
     since c(v) is complex-linear.
   - Values: on the round S⁴ (Scal=12) both kernels vanish and α=0; on a
     K3 surface the two parallel spinors span ker D⁺=ℂ²=ℍ¹ and ker D⁻=0,
     so α=1 and the complex index is 2=2α; an odd complex index cannot
     occur.

## Dependency order and references

G1–G2 cite Tau Ceti's finite Clifford-module algebra and add its geometric comparisons, before
bundle analysis. G3 uses SBC and the Levi-Civita carrier. Native compact-real
covering/connectivity supply G4.1a's topological frame/rank0 adapters and
SpinRepresentations L7's remaining universal-cover comparison. The item order
is G4.1a → CharacteristicClasses C3.5 → G4.3. G4.1b's smooth refinement
uses G4.1a and native Lie differential APIs, independently of C3.5.
The same interleaving holds with the three other suppliers that consume
this roadmap's early sections: SpinRepresentations L7 consumes G1.1's
negative-form comparison and G4.1's frame refinement and supplies G6 its
real Clifford classification; RiemannianGeometry R7 consumes G1.2, G2.2 and
G3.4 and supplies G6.4 its real Weitzenböck term; GeneralizedCohomology
G4.0a, G5.0 and G5.4 consume G4.1, G5.5 consumes G1.3, and G5.5 supplies
G5.0 and G6.0. The order
between this roadmap and each of those four is an order of sections, and no
section here uses a result of a section that consumes it.
G4.4's torsor uses a given lift and central-bundle descent independently of
that obstruction equality. G5 follows G1–G4. G6 follows G3/G5 and uses
K5/PDO analysis; the exterior instance only needs G2/G3. Numerical topological index theorems are separate consumers of this development. For each object supply constructors/characterization,
extensionality, regularity, naturality, local-frame/gluing comparison and edge
cases, not only the headline theorem.

For the real KO lane, GeneralizedCohomology G5.5 and TopologicalKTheory T7 supply the functional-calculus, Clifford and KO interfaces consumed by SpinGeometry G5.0/G6.0. The algebraic real regular bundle/action SpinGeometry G5.0 consumes G1.1/G1.3/G3/G4 and any supplied principal Spin connection. G5.1 separately supplies the Levi-Civita principal Spin connection and associated connection, which specialize this general G5.0 construction for TM. G6.1–G6.3 are prerequisites and do not consume G6.0. Spin G6.0 consumes G5.0, the G5.1 Levi-Civita specialization and G6.1–G6.3; its arbitrary-boundaryless local operator/elliptic branch precedes the closed-manifold functional-calculus and index branch. Spin G6.7 consumes G5.1, G6.0 and G6.1's domain/chiral-adjoint results. GeneralizedCohomology G5.5 consumes Spin G1.3's trace but is independent of Spin G6.0. TangentialBordism B3.0 is downstream: it consumes the KO-valued analytic class and owns its comparison with the geometric ABS/PT genus. IndexTheory I7.5 is another downstream consumer, not an input. This names SpinGeometry G5.0 explicitly to distinguish it from GeneralizedCohomology G5.0.

- H. B. Lawson and M.-L. Michelsohn, *Spin Geometry* (1989), Chapters I–II:
  algebraic module suppliers, spin structures, spinor bundles and Dirac
  operators; Chapter II's curvature formulas and Lichnerowicz theorem.
  Their negative-first Clifford signature is the reversed order of
  `TauCeti.realCliffordForm p q`.
- L. Nicolaescu, [*Lectures on the Geometry of Manifolds*](https://www3.nd.edu/~lnicolae/Lectures.pdf),
  Chapter 12 (Clifford modules and Dirac operators), for the
  metric/chirality/bundle comparisons; page numbers are the printed
  numbers of the author's copy.
- M. F. Atiyah, R. Bott and A. Shapiro,
  [*Clifford modules*](https://doi.org/10.1016/0040-9383(64)90003-5), for
  graded products and the distinction between algebraic and topological classes.
- The [Mathlib contraction API](https://leanprover-community.github.io/mathlib4_docs/Mathlib/LinearAlgebra/CliffordAlgebra/Contraction.html)
  and [Zulip reference discussion](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/References.20in.20QuadraticForm.20and.20CliffordAlgebra.2EContraction/near/400464524)
  fix the native algebra/exterior vocabulary.
