# Roadmap: clifford bundles, spin structures, and Dirac geometry

**Summary.** Develop the geometric theory of real and complex Clifford modules, spin lifts,
spinor bundles and their compatible connections. The resulting library must
support the de Rham, signature and twisted spin Dirac operators, with their
metrics, gradings and curvature formulas pinned. This README is definitive;
`Suggested.lean` states the headline theorems expressible against the pinned APIs;
the geometric headlines and their missing carriers are listed in its module docstring.

## Scope and ownership

The algebraic Clifford algebra, its real periodicity and the abstract spin
representations are supplied by
[SpinRepresentations L0–L4,L7,L9](../RepresentationTheory/SpinRepresentations/README.md)
and [OrthogonalSpinGroups L0–L2](../../Completed/OrthogonalSpinGroups/README.md).
Use Mathlib's `CliffordAlgebra`, `ExteriorAlgebra`, `CliffordAlgebra.equivExterior`,
`equivBaseChange`, `equivOfIsometry`, `prodEquiv`, `evenOdd`, `involute` and
`reverse`. Tau Ceti already has `TauCeti.spinAction`,
`SpinPolarizationData.cliffordEquivEnd`, its even/odd matrix classification,
half-spin actions, raw orthogonal-product volume identities and real algebraic
eight-periodicity. G1–G2 supply the geometric metric/complexification/chirality
comparisons with those objects. They do not construct another abstract Fock
action, classification table or Bott-periodicity proof. Real algebraic
periodicity is distinct from the topological Bott theorem. G3 owns smooth Clifford
module and connection comparisons, G4 the geometric lift data, G5 associated
spinors and G6 the geometric Dirac and real analytic index comparisons. Generic
bundle descent, characteristic classes, elliptic analysis and KO models remain
with the named suppliers below.

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
G1.3 names scalar conjugation on this carrier `κ_base`; the conjugate-linear
negative-metric Clifford involution is `*Cl_base = κ_base ∘ CliffordAlgebra.star`.
On the tensor carrier `ℂ⊗_ℝCl_ℝ(V,−g)`, construct a local
`StarModule ℝ (CliffordAlgebra Q)` proof instance from
`CliffordAlgebra.star_smul` and the trivial real star; do not add a global
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
`LinearMap.trace` and `LinearMap.mulLeft` express the normalized regular trace.
`ModuleCat.matrixEquivalence` and `moritaEquivalenceMatrix` supply matrix Morita
transport; the evaluation identification below is the geometric module comparison.

### From Tau Ceti

Use the spin representation, volume and periodicity declarations named in Scope
and ownership and the compact-real covering and Lie projection declarations
listed in G4.1a–G4.1b. The latter use the native units-range topologies.

### From the named roadmaps

The following contracts name the supplying sections and the structures consumed:

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
  the shared exterior Gram metrics, pointwise real Hodge star and its
  complex-linear extension, complex-type stars, formal adjoints, p=2 bundle Sobolev/distribution theory,
  Laplace-type regularity, Hodge theorem and compact resolvent. Its K1/K4
  complex/type and Hermitian bundle interfaces supply the almost-complex
  pointwise comparisons below. The pointwise exterior metric/star API
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

G1 supplies the metric Clifford dictionary, Morita evaluation and trace; G2 fixes
chirality and exterior comparisons. G3 constructs bundles and connections, G4
principal lifts, and G5 associated spinors. G6.1–G6.3 construct the complex
operator before G6.0's real analytic index; G6.7 then identifies its quaternionic
normalization. G5.3 compares its square roots with G4.4a's rank-two criterion. Each target lists its
statement and proof-route inputs; G labels remain the cross-roadmap locators.

## Layer 1: Negative-metric Clifford modules and their positive metrics

### 1.1 Negative-metric and scalar-extension dictionary (G1.1)

The required API includes:

- The scalar-extension equivalence preserves generators, products, grading and reverse.
- The even-algebra comparison preserves the Spin vector action and central ±1.

Build the real-to-complex negative-metric dictionary on the native tensor
and Clifford carriers, with generator evaluation, isometry naturality,
grading, involution and reverse compatibility. Compare the negative form
`realCliffordForm 0 n` with an orthonormal coordinate model; transport its
existing real classification and periodicity results. For n≥1 compare compact
Spin from the positive-form supplier with the negative-form geometric model:
construct its real even-algebra comparison, sending the positive-form
bivector e_i e_j to −e_i e_j in the negative form, and pin its vector
conjugation action and central ±1. In rank0 construct μ₂⊂Cl(0)=ℝ
on native `CliffordAlgebra.evenUnitaryGroup` and compare it with the
native trivial Spin group using `range_spinGroup_toUnits`; this
algebraic geometric branch precedes the later frame adapters.
Over ℂ the map from
the positive full algebra to the negative full algebra sends v to i v.
Its even restriction must be compared to the real group map, with the
bivector sign made explicit. Do not infer a real full-algebra isomorphism
from the complex multiplication by i.

(Nicolaescu, Definition 12.1.10 and Corollary 12.1.14, pp. 626–627.)

*Needs:* native base change, even algebra and involution; SpinRepresentations L0–L2/L7.

**Checks.**

- A unit negative generator has square −1; multiplying a negative generator by i gives square +1, fixing the positive-to-negative map.
- For orthogonal unit e₁,e₂, the even comparison sends e₁e₂ to −e₁e₂; a sign-free comparison has the wrong conjugation action.
- At rank zero Cl=ℝ and the geometric kernel has two elements ±1, whereas native vector-generated Spin has one element.

### 1.2 Polarization and the Fock metric (G1.2)

The required API includes:

- The normalized creation and contraction operators satisfy the three anticommutator identities.
- The degree rescaling intertwines the native Fock action and transports its positive metric.

For (V,J), build the two isotropic J-eigenspaces, their perfect g_ℂ pairing
and the adapted `SpinPolarizationData`. The native action on ΛW is
`ε(v^(1,0))−2ι(v^(0,1))`, since polar(−g_ℂ)=−2g_ℂ.
Conjugate it by T|_(Λ^pW)=2^(p/2)Id to obtain the √2 Fock action;
prove this exact intertwining equation. Use h_ℂ(x,y)=g_ℂ(bar(x),y)
restricted to W: |v^(1,0)|²=|v|²/2. On (V,J) Mathlib's conjugate-first
Hermitian form is h_J(v,w)=g(v,w)−i g(v,Jw), twice the pullback of
h_ℂ|_W under v↦v^(1,0). Translate the source's g+i g(·,J·) by
conjugating its slot convention. The native-action metric pulled back
along T has degree-p factor 2^p relative to the normalized Fock metric.
Prove the three
creation/annihilation anticommutators, wedge/contraction metric adjointness,
c(v)²=−|v|²Id, and skew-Hermitian real-vector multiplication. Include
unit orthogonal 2-plane and tensor-product computations. Use K5's exterior
Gram metric and the increasing orthonormal wedge basis.

(Nicolaescu, Proposition 12.1.19, pp. 630–631.)

*Needs:* G1.1; SpinRepresentations L3–L4; ComplexKahlerGeometry K5 exterior Gram metric.

**Checks.**

- In a unit J-plane, gℂ(v¹⁰,v⁰¹)=1/2 and the squared Hermitian norm of v¹⁰ is 1/2; omitting √2 gives the wrong vector square.
- On the orthonormal Fock basis (1,w), c(e₁) sends 1 to w and w to −1, while c(e₂) sends 1 to iw and w to i; both squares are −Id and the mixed sum is zero.
- T scales degrees zero and one by 1 and √2; its pulled-back squared norms are 1 and 2, excluding an isometric unrescaled intertwiner.

### 1.3 Adjoints, Morita evaluation and scalar trace (G1.3)

The required API includes:

- The conjugate-linear adjoint is involutive, reverses products and makes real vectors skew-adjoint.
- Evaluation is natural in arbitrary algebraic E and independent of matrix basis and chosen matrix unit.
- The trace is normalized, cyclic and invariant under algebra equivalences and scalar extension.
- Its positive-form null space is precisely the radical-generated ideal; the negative-metric adjoint gives a faithful positive trace.

Construct the conjugate-linear Clifford star intrinsically and identify it
with grade-involution followed by reversal and scalar conjugation.
Given an algebra isomorphism
`Cl_ℂ(ℂ⊗_ℝV,−g_ℂ)≃End_ℂ(S)` in even dimension,
construct a positive Hermitian metric with `ρ(a^{*Cl_base})=ρ(a)†`, unique up to a
**positive** scalar. Prove existence using the native Fock metric transported
along the representation intertwiner, and uniqueness via Schur. For an
arbitrary unital algebraic complex module E, define `multiplicitySpace` as the
submodule of complex-linear intertwiners and construct
`S⊗Hom_Cl(S,E) → E`, s⊗T↦T(s), prove it an evaluation isomorphism and
give its inverse and naturality. Choose a finite basis of the nonzero S
and transport Mathlib's `ModuleCat.matrixEquivalence` and
`moritaEquivalenceMatrix` from `RingTheory/Morita/Matrix` through
`LinearMap.toMatrixAlgEquiv` and the stated ℂ-algebra equivalence.
Require `IsScalarTower ℂ Cl E` and prove the scalar action induced
by the native inverse functor's matrix scalar homomorphism equals
E's given ℂ-action. Pin S's matrix action as scoped
`Matrix.Module.matrixModule`, compare it with the usual mulVec
action by `Matrix.Module.smul_apply`, and transport by explicit
equivalences rather than an instance-definitional equality.
For a chosen basis index j identify Hom_Cl(S,E) with E_jj E by
`T↦T(e_j)`. Under `S⊗X≃(ι→X)`, the native counit is
`(x_i)↦Σ_i E_ij x_i`; prove `E_ij T(e_j)=T(e_i)` and hence that
the counit is evaluation. Prove the resulting evaluation and naturality
independent of both the basis and j. Supply universe lifts of the
finite index and module-category comparisons when needed, so this
construction does not restrict E's universe.
The headline `multiplicityEvaluation_exists` explicitly assumes finite-dimensional
nonzero S and an algebra equivalence with End(S), and asserts an equivalence
whose value on every pure tensor is T(s).
This algebraic statement imposes no finite-dimension
or topological hypothesis on E. For finite-dimensional E give the
dimension formula and Hermitian comparison. Compatible metrics are positive
Hermitian metrics on the multiplicity space, rather than unique up to scale
for reducible E. On S* pin the dual Clifford action as
`(a·φ)(s)=φ(ρ(reverse(a))s)`, with the transported positive dual metric;
distinguish it from conjugate-linear Hermitian adjunction. Treat zero
modules and dimension-zero V.
Own the finite Clifford scalar-part trace. For a finite-dimensional
real V and any native Q : QuadraticForm ℝ V, use `CliffordAlgebra Q`.
Set b=Q.associated, so Q(v)=b(v,v). Choose ℂ⊗ℝCliffordAlgebra Q
as the complexification. Consume `(CliffordAlgebra.equivBaseChange ℂ Q).symm`
for its equivalence with the scalar-extended Clifford algebra and the
native generator, involute and reversal laws, stated for `toBaseChange`.
Derive their inverse-map forms. On `CliffordAlgebra (Q.baseChange ℂ)`, prove
both directions of the ℤ/2 eigenspace characterization: Mathlib supplies
that even elements are fixed by involute and odd elements are negated; prove
the converses using the ordered basis and invertibility of 2, then transport
the grading through `equivBaseChange.symm`. Define `κ_tens=conj⊗Id` on the
tensor complexification, distinct from real Clifford conjugation
`involute∘reverse`. On `CliffordAlgebra (Q.baseChange ℂ)`, construct
`κ_base` as the unique ℂ-antilinear ring automorphism fixing every
`ι(1⊗ₜv)` for real v. Existence comes from transporting `κ_tens` under
`equivBaseChange.symm`; prove the generator characterization and
uniqueness by generation, together with involutivity. Using the native
base-change intertwining laws, prove that κ_base commutes with involute and
reverse; the transported negative-metric
adjoint is `κ_base∘CliffordAlgebra.star` on the base-changed Clifford algebra,
corresponding to `κ_tens∘(id⊗star_ℝ)` on the tensor carrier. Its
intertwining law is this characterized automorphism, with explicit
scalar, sum, product and real-generator evaluation laws. Prove explicitly
that the negative-metric adjoints are involutive and anti-multiplicative,
`(ab)^{*Cl_base}=b^{*Cl_base}a^{*Cl_base}` and
`(ab)^{*Cl_tens}=b^{*Cl_tens}a^{*Cl_tens}`; derive the tensor-carrier
formula on pure tensors and extend it, then transport it through
`equivBaseChange`. The TensorProduct `Star` instance supplies the
pure-tensor/additive/involutive action, not the anti-multiplicative law.
Define the scalar-part trace, written τ, by the degree-zero
projection under the native Clifford/exterior module equivalence,
and prove it equals `2^(−dim V) trace(L_a)` on the regular module.
Prove basis independence, τ(1)=1, linearity, τ(ab)=τ(ba),
invariance under involute and under reverse separately. Define τ_ℂ as its ℂ-linear extension on
ℂ⊗ℝCliffordAlgebra Q; prove τ_ℂ(a)=2^(−dim V)trace_ℂ(L_a),
unit/linearity/cyclicity and `τ_ℂ(κ_tens a)=conj(τ_ℂ(a))`. Use
this τ_ℂ in the complex-coefficient positivity statements below.
For any orthogonal basis (e_i) and any Q,
construct the ordered-product basis e_I, with increasing indices;
prove its equality with the native Clifford basis transported from
the increasing wedge basis by `equivExterior`. Export its spanning,
independence, scalar coefficients and the pairing
`τ(reverse(e_I)e_J)=δ_(I,J)Π_(i∈I)b(e_i,e_i)`, including
degenerate Q. On the tensor complexification, for nonnegative b define
`a^*=(κ_tens∘(id⊗reverse_ℝ))(a)` and prove, in an orthogonal basis,
`τ_ℂ(a^*a)=Σ_I|a_I|²Π_(i∈I)b(e_i,e_i)≥0`. It is faithful when b
is positive definite; for semidefinite b its null set is exactly the
two-sided ideal generated by the radical of b, so faithfulness is equivalent
to positive definiteness.
For the negative-metric convention used here, the tensor-carrier adjoint is
explicitly `κ_tens∘(id⊗(reverse_ℝ∘involute_ℝ))`; after base
change this is `κ_base∘CliffordAlgebra.star` on the Clifford carrier.
The real negative-metric headline `cliffordScalarTrace_exists` states the
normalized regular-trace formula, unit, cyclicity, positivity and faithfulness
on the native real Clifford carrier.
Replace b by g in the same positive coefficient formula, using τ_ℂ for
complex coefficients. In particular, the positive-form scalar-trace adjoint
is `κ_tens∘(id⊗reverse_ℝ)`; the negative-metric adjoint adds involute.
Keep these named operations local;
do not install a competing global star instance. For every ℝ-algebra
equivalence φ between finite-dimensional real Clifford carriers, prove
`τ_Q′ ∘ φ = τ_Q`. Derive the equality of regular-trace normalizations
from the equal Clifford dimensions under φ. Prove the analogous
ℂ-algebra-equivalence identity for τ_ℂ, and the scalar-extension equation
`τ_ℂ(1⊗a)=τ(a)`. Define the transported trace
`τ_base=τ_ℂ ∘ CliffordAlgebra.equivBaseChange ℂ Q`, with its
`2^(−dim V)trace_ℂ(L_a)` formula. Export these equations for finite
Clifford model consumers; this uses no later real
C*-model, Hilbert-module or Dirac-index construction. Positive generators
are not identified with the native negative-generator star without
an explicit transport map.

(Nicolaescu, Corollary 12.1.22 and Remark 12.1.23, p. 632; Proposition 12.1.27, p. 634.)

The scalar-trace formulas follow by diagonal entries of left multiplication in
the ordered orthogonal Clifford basis (Nicolaescu, §12.1.2, p. 629): only the scalar monomial contributes to
each diagonal. Positivity uses the sum of squared coefficients; it is not an
assertion about the native complex-linear star on complex coefficients.

*Needs:* G1.1–G1.2; native matrix Morita equivalence, ordered Clifford basis and regular trace.

**Checks.**

- For V=0, S=ℂ and E=ℕ→₀ℂ, a scalar intertwiner T is determined by T(1); evaluation sends 1⊗T to T(1), without a finite-dimensional E hypothesis.
- For E=0 the intertwiner space and tensor product are zero and evaluation is the unique equivalence 0≃0; for E=S the identity intertwiner evaluates s⊗Id to s.
- For the negative line a+be, e²=−1, normalized real regular trace is (2a)/2=a and τ(a* a)=a²+b²; at rank zero it is a and a². Thus τ(1)=1 in both ranks.
- For a=1+e₁+2e₂ with orthogonal negative unit generators, τ(a* a)=6; reversing the factors has the same scalar part. The unnormalized regular trace would give τ(1)=4.
- For a null generator e in a degenerate form, e≠0 but τ(reverse(e)e)=0; a positive unit generator gives 1 under reversal and −1 under native Clifford star. The two positivity conventions cannot be interchanged.
- Scalar conjugation and the Hermitian adjoint send i to −i, whereas native complex-linear Clifford star fixes i; on real e the negative adjoint sends e to −e.

### 1.4 Odd-dimensional factors (G1.4)

The required API includes:

- The two central idempotents split every module into the two labeled multiplicity spaces.
- The even-algebra intertwiner and orientation reversal obey the displayed volume-sign relation.

In oriented dimension n=2ℓ+1 consume the existing Nonempty two-matrix-
factor classification, then construct labeled factors using
ω_ℂ=i^(ℓ+1)e₁⋯e_n, prove it central with square 1, and use the explicit
idempotents (1±ω_ℂ)/2. Label the two irreducibles by ω_ℂ=±Id and pin
the polarization line action to these labels: in the ordered orientation
(u₁,Ju₁,…,u_ℓ,Ju_ℓ,u), c(u)=λ·exterior-parity and ω_ℂ=iλ,
so λ=−i gives the + factor and λ=i gives the − factor. Arbitrary modules have one
multiplicity space for each factor. Supply the negative-form generator
dictionary for `Cl_n≃Cl^even_(n+1)`: e_j↦e₀e_j and
x⁰+x¹↦x⁰+e₀x¹, with the inclusion of V into V×ℝ explicit.
Mathlib's `EquivEven.Q'` orders V first and e₀ last. Prove
multiplicativity, bijectivity and grading correspondence using this
native `equivEven` design. In the ordered orientation (e₁,…,e_n,e₀),
prove ψ(ω_ℂ)=−Γ_(V⊕ℝ); therefore the odd ω=+1 module is the
restriction of S⁻_(V⊕ℝ), and the odd ω=−1 module restricts S⁺.
Moving e₀ first reverses orientation for odd n and interchanges these
two labels. Construct these specific module intertwiners. State the effect of
reversing orientation and
choosing the other central factor, not an even-dimensional chirality
splitting for an ungraded odd irreducible module.

(Nicolaescu, Lemma 12.1.29 and Proposition 12.1.30, pp. 634–635.)

*Needs:* G1.1–G1.3; SpinRepresentations odd-factor classification; native equivEven.

**Checks.**

- In rank one c(e)=−i gives ω=i(−i)=1, while c(e)=i gives ω=−1; the labels distinguish the two factors.
- In the ordered plane (e₁,e₀), ψ(ie₁)=ie₀e₁=−ie₁e₀=−Γ, so the positive odd factor restricts the negative half-spin space.
- The projectors (1±ω)/2 act as (1,0) and (0,1) on the two factors; omitting either projector loses one summand.

### Examples

The negative line, the polarized unit plane and the scalar rank-zero algebra
fix the normalization; G1.3 also tests an infinite-dimensional multiplicity module.

### Dependencies

Native Clifford algebra and SpinRepresentations algebraic classification;
ComplexKahlerGeometry K5 only for the pointwise exterior metric.
## Layer 2: Volume, chirality and exterior-form comparisons

Consume K5's pointwise real Hodge star, characterized by
`α∧*β=⟨α,β⟩vol`, its complex-linear extension and native exterior-power
Gram metric. This finite-dimensional metric package is available before K5's
bundle/analytic Hodge theory and independently of Clifford representations.
G2 supplies its Clifford/chirality comparisons; R7 retains its real-bundle
Weitzenböck/star specialization on the same carrier.

### 2.1 Intrinsic chirality (G2.1)

The required API includes:

- Normalized volume is basis-independent for fixed orientation and changes sign under orientation reversal.
- The actual ±1 kernels are complementary and their projections are (Id±Γ)/2.

Define `cliffordMultiplication` by restricting the native algebra action to
generators, and `IsGeometricAction` by Q(v)=−⟨v,v⟩ and skew-adjointness
in the conjugate-first Hermitian metric. Define the normalized complex volume from the native orthogonal product.
Prove independence under **orientation-preserving** orthonormal changes,
sign reversal under orientation reversal, Γ²=1 and `Γ^{*Cl_base}=Γ`
(equivalently ρ(Γ)†=ρ(Γ)). Compare with the native complex-linear
`star Γ=(−1)^ℓ Γ`. Prove
Γa=(−1)^deg(a)aΓ for homogeneous a and the two eigenspace/direct-sum
decomposition of every finite module. Give canonical projections
(Id±Γ)/2, and through G1.3's evaluation identify the eigenspaces of E
with S⁺⊗Hom_Cl(S,E) and S⁻⊗Hom_Cl(S,E). Give restrictions, isometry/duality naturality and the graded algebra
map to End(S). Identify Γ on the adapted Fock module with exterior parity
and compare the eigenspaces literally with the supplier's half-spin modules.
On an ordered orthonormal basis, `chirality` is this normalized product;
`chirality_sq` and `chirality_anticommutes` assert its square and vector
relations. Define `positiveSpinors` and `negativeSpinors` as its actual
±1 eigenspaces; `isCompl_spinors` states their complementarity. These
algebraic assertions allow arbitrary complex inner-product modules S.
The canonical rank-zero empty frame gives Γ=Id. For every signed rank-zero
orientation σ∈{±1}, use Γ_σ=σ·Id and interchange the half-spin labels
for σ=−1; the canonical zero-frame carrier is unchanged.

(Nicolaescu, chirality discussion and Exercise 12.1.24, p. 632.)

*Needs:* G1.2–G1.3; native orthogonal Clifford products.

**Checks.**

- On the Fock plane Γ=diag(1,−1); Γ²=Id, the positive space is the vacuum line and the negative space is the degree-one line. Both projections have rank one.
- Reversing the plane orientation changes Γ to diag(−1,1), interchanging the eigenspaces; the mixed relation Γc(e₁)+c(e₁)Γ is zero.
- For V=0 the empty product is Id, S⁺=S and S⁻=0; for S=0 both eigenspaces are zero and remain complementary.
- On ℂ for the negative line, c(e)=i is skew-adjoint and squares to −1; c(e)=1 squares to +1 and fails the geometric-action equations.

### 2.2 Hodge and exterior-module comparison (G2.2)

The required API includes:

- The Chevalley comparison intertwines Clifford multiplication with left multiplication on End(S).
- The Hodge and dual-parity comparisons preserve the displayed metric normalization and degree signs.

On the shared complexified real exterior algebra, construct
c(v)=ε(v)−ι(v), with multiplication/Clifford/module comparison to
`equivExterior`. Prove it is a ℤ/2-graded module for exterior parity,
with even Clifford elements preserving parity and odd elements reversing it.
Prove, on degree p,
`Γω=i^(ℓ+p(p−1))*ω`, including star-square and orientation signs.
Through the adapted Fock polarization construct the Clifford-module
identification `Λ*V_ℂ≃S⊗S*≃End(S)`; the Clifford algebra acts by left
multiplication on End(S). Specify the pairing/intertwiner and its values
on wedge basis elements: use the inverse Chevalley/antisymmetrization map
to Cl, then G1.2's normalized Fock action with its normalized metric and the tensor-to-endomorphism
evaluation map. The increasing orthonormal wedge e_I maps to c(e_I).
Its exterior Gram metric corresponds to normalized Hilbert–Schmidt
metric `2^(−ℓ)tr(A†B)` on End(S); with the ordinary tensor/dual metrics
the squared norm acquires the factor 2^ℓ. Prove this normalization and
the metric/duality comparisons. Prove the chiral action is
Γ_S⊗Id, while exterior parity is Γ_S⊗Γ_(S*) with the induced dual parity.
These are different decompositions of forms.
Here the induced dual parity is Γ_S transposed. The chirality of the
reverse-dual Clifford module is `(−1)^ℓ Γ_S^transpose`; prove this
comparison before identifying any geometric dual half-spin labels.

(Nicolaescu, Example 12.1.25, equation (12.1.1), p. 633.)

*Needs:* G1.2–G1.3; G2.1; ComplexKahlerGeometry K5 pointwise Hodge star.

**Checks.**

- On an oriented unit plane, Γ1=i e₁₂ and Γe₁=i e₂; star-square is +1 on scalars and −1 on one-forms, yielding Γ²=1 in both cases.
- The plane Clifford identity maps to Id on a two-dimensional spinor space: its ordinary Hilbert–Schmidt squared norm is 2, while normalized squared norm is 1.
- On the plane S*, induced dual parity is diag(1,−1) but reverse-dual chirality is diag(−1,1); conflating them swaps the labels.

### 2.3 Graded products and twists (G2.3)

The required API includes:

- The graded product is associative and symmetric with Koszul signs, with the rank-zero unit.
- Graded evaluation identifies the induced multiplicity grading and is natural under intertwiners.

Build graded direct-sum/tensor comparisons for even V and W: the action
on S_V⊗S_W is `c(v,0)=c_V(v)⊗Id`,
`c(0,w)=Γ_V⊗c_W(w)`, and Γ_(V⊕W)=Γ_V⊗Γ_W for the ordered product
orientation. Prove associativity, symmetry with Koszul signs, duality and
orientation reversal, and compare to `CliffordAlgebra.prodEquiv` and its
native graded tensor product. No ungraded algebra tensor product replaces
it. Give the rank-zero unit and the one-plane acceptance computations.
For any finite-dimensional graded multiplicity space A=A⁺⊕A⁻, construct
the graded twist S⊗̂A with even part S⁺⊗A⁺⊕S⁻⊗A⁻ and odd part
S⁺⊗A⁻⊕S⁻⊗A⁺. Its Clifford action is c(v)⊗Id and its tensor grading
Γ_S⊗γ_A; its intrinsic chiral grading remains Γ_S⊗Id. Give the graded
evaluation/naturality comparison, including the induced grading on the
multiplicity space of a graded Clifford module.

(Nicolaescu, graded-module discussion, p. 633.)

*Needs:* G2.1–G2.2; native graded tensor product; G1.3 evaluation.

**Checks.**

- On two Fock planes, ΓV⊗ΓW has eigenvalues (1,−1,−1,1); the two-plane sum has even and odd dimensions 2 and 2.
- The mixed generators cV⊗Id and ΓV⊗cW have anticommutator zero; omitting ΓV gives twice their nonzero product.
- For a purely odd one-dimensional twist A, tensor parity is −ΓS while intrinsic chirality is ΓS; a purely even line preserves ΓS.

### Examples

The Fock plane and its two-plane tensor square distinguish intrinsic chirality,
exterior parity and reverse-dual parity.

### Dependencies

G1 and the pointwise K5 Hodge metric; no bundle elliptic theorem is needed.
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

*Needs:* G3.1–G3.2; SmoothBundlesConnections B3; the prescribed metric connection.

**Checks.**

- For constant c(e)=i and the trivial connections, ∇(is)=i ds, equal to c(∇e)s+c(e)∇s.
- In the plane model with c(e₁)=[[0,−1],[1,0]], the skew-Hermitian connection coefficient B=diag(i,−i) has [B,c(e₁)]=[[0,−2i],[−2i,0]]≠0; Hermitian alone is insufficient.
- Flat compatible connections give Rᴱ=Rⱽ=0, so the curvature compatibility equation has both sides zero.

### 3.4 The exterior connection (G3.4)

The required API includes:

- The induced exterior connection respects the Clifford action and gives the local d and d* formulas.
- Musical and isometric pullback comparisons preserve the exterior metric and connection.

On exterior forms build the induced Levi-Civita connection, c=ε−ι,
Clifford compatibility and the local frame formulas for d and d*;
G6 then identifies its Dirac operator with d+d*. Pullback of a module
connection is general bundle functoriality; a pullback does not identify
tangent Dirac operators on manifolds of different dimensions.

(Nicolaescu, Proposition 12.2.1, p. 657.)

*Needs:* G2.2; G3.3; HopfRinow L1; DifferentialGeometry exterior calculus.

**Checks.**

- On ℝ, d(f)=f′ dx and d*(h dx)=−h′; c(dx)(f,h)=(−h,f), giving D(f,h)=(−h′,f′).
- For f=x² and h=0, D²(f,0)=(−2,0), fixing the nonnegative Laplacian sign.
- On a point d=d*=D=0; pulling back to a line still has trivial pulled-back connection, without identifying the line tangent Dirac operator.

### Examples

Trivial line and plane bundles test the distinction between a Hermitian
connection and a Clifford-compatible one.

### Dependencies

G1–G2, SmoothBundlesConnections B1–B3 and HopfRinow L1.
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

On TopologicalKTheory T6.4's continuous principal-bundle carrier and
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
through its covering of the smooth oriented frame bundle.

(Nicolaescu, §12.2.3, pp. 668–669, for smooth tangent lifts.)

The paracompact-base generality uses the named numerable-bundle and Čech
descent suppliers; the cited smooth tangent-bundle statement alone does not
establish that extension.

*Needs:* G4.1a–G4.1b; TopologicalKTheory T6.4; CharacteristicClasses C1; SmoothBundlesConnections B1–B2.

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

Given one lift, twist by a principal Z/2-bundle. Prove this action is free
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

*Needs:* G4.2; principal central-bundle descent; TopologicalKTheory T6.4.

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
modulo homotopy over X⁰, classify C1.0's determinant-cover orientations.
Their existence obstruction is w₁; when nonempty they form an
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
coefficient exact sequence. For rank one an
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

*Needs:* G4.2–G4.4; AlgebraicTopology §8.9; SpinRepresentations Layer 2; CharacteristicClasses C3.2 and C7.3 for the Euler comparison and radial stable framing.

**Checks.**

- TS² has e=2 and w₂=0: its stabilized bundle is trivial and it has one spin structure, but its unstabilized two-plane bundle has no global frame.
- For the trivial rank-three bundle on S¹, the two loop classes in SO(3) give two skeletal classes and two lifts; keeping only globally constant frames loses one.
- The plane bundle on S² with e=1 stabilizes with w₂=1 and has neither extendible skeletal data nor a spin lift.
- If H²(X;Z)=Z/2 and e is its nonzero class, 2H²=0 so no root exists; rational vanishing of e does not establish divisibility by 2.

### Examples

TS², the two circle lifts and the four torus lifts distinguish lift data,
existence and a chosen trivialization.

### Dependencies

G1.1, the native covering/Lie projection, TopologicalKTheory T6.4,
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

*Needs:* G1–G3; G4.1–G4.4; SmoothBundlesConnections B2–B3; HopfRinow L1 for tangent bundles.

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

(Nicolaescu, graded-module discussion, p. 633, followed by associated-bundle transport.)

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

*Needs:* G3.3; G6.1; RiemannianGeometry R1; PDO P1 Bochner connection.

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

*Needs:* G5.1; G6.2; RiemannianGeometry R1 curvature identities.

**Checks.**

- On the unit round S², Scal=2 and the scalar remainder is 1/2; the closed-base energy identity forces the harmonic kernel to be zero.
- On a flat periodic torus, Scal=0 and constant spinors have ∇s=Ds=0; nonnegative curvature alone cannot force zero kernel.
- For a flat trivial twist, Fᵂ=0 and the extra curvature contraction is zero, recovering the untwisted formula.

### 6.4 The exterior Dirac operator (G6.4)

The required API includes:

- The exterior operator and its square identify with d+d* and the nonnegative Hodge Laplacian.
- Exterior parity and intrinsic chirality give their respective graded blocks and harmonic-kernel comparisons.

On exterior forms prove D=d+d*, D² the nonnegative Hodge Laplacian and
recover R7's real Weitzenböck curvature term. Exterior parity gives the
Euler operator; G2's chiral grading gives the signature operator on
even-dimensional oriented bases. Prove DΓ=−ΓD, the block/formal-adjoint
comparison and harmonic-kernel identification. The numerical Euler/signature
formulas are outside this geometric
development; retain the operator and harmonic-space identifications.

(Nicolaescu, Proposition 12.2.1, p. 657; Example 12.1.25, p. 633.)

*Needs:* G2.2; G3.4; G6.1–G6.2; RiemannianGeometry R7 exterior comparison.

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
G4.4's torsor uses a given lift and central-bundle descent independently of
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
  [*Clifford modules*](https://doi.org/10.1016/0040-9383(64)90003-5), §§6 and 11, for
  graded products and the distinction between algebraic and topological classes.
- R. C. Kirby, [*The topology of 4-manifolds*](https://math.berkeley.edu/~kirby/papers/Kirby%20-%20The%20topology%20of%204-manifolds%20-%20MR1001966.pdf)
  (1989), Chapter IV, pp. 33–34, for skeletal Spin structures, stabilization
  and comparison with principal lifts.
