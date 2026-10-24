# Roadmap: abelian schemes and arithmetic moduli, part II

**Summary.** This roadmap builds three interfaces for abelian varieties: integral coefficients
for completed Poincaré bundles, real analytic Betti coordinates in families, and
integral realizations over finite fields. These interfaces connect the geometry
of a family to computations that retain its arithmetic information. The first
part uses universal connections to construct moments and ordinary CM trivializations.
The second turns Betti rank into a geometric condition on subvarieties and their
fibre powers. The third passes from Frobenius and Tate modules to isogeny classes,
integral lattice orbits and counts of polarized and unpolarized varieties.

The objects must support their natural maps. A completed Poincaré bundle needs
truncations, unit sections, isogeny maps and compatible connections. A Betti map
needs changes of period frame, not just a coordinate formula in one chart. A
lattice classification needs integral morphisms at every prime, including the
characteristic prime. The counting statements use those interfaces rather than
replacing them by finiteness assertions.

## Scope and ownership

The parent **AbelianSchemesAndArithmeticModuli** owns abelian schemes and their
group laws (A1), duality, Picard and Poincaré geometry, polarizations (A2), isogenies, finite subgroup quotients and
`Polarization.rosati` (A3.9), the universal vector extension `AbelianVectorExtension`
(A4.2), relative de Rham
cohomology, its Hodge sequence and Tate systems (A4), complex uniformization and
the Hodge dictionary (A5), and finite-rank Hom groups, characteristic polynomials,
semisimple endomorphism algebras and complete reducibility (A6). These objects
are inputs here. B2 constructs uniform Manin–Mumford, Lang–Néron modulo trace and their finite-maximal-special application.
In particular, a second dual abelian scheme, Picard functor,
polarization definition or quotient construction is outside this roadmap.

Use **AlgebraicVectorBundles** for finite locally free sheaves, symmetric and
exterior powers, vector groups and relative Spec. Its locally free sheaf and
vector-group conventions also fix the meaning of the vector kernel in P1.
Use **DifferentialGeometry**, layers 0–1, for differential forms, wedge products
and exterior derivatives; the new calculation in B1 is the particular Betti
form and its kernel. **LieGroupoidsPoisson**, G0.1, owns the smooth boundaryless
constant-rank theorem and its level-fibre API; B2.10 owns the finite C^k and
real-analytic extension, its comparison with that smooth structure, and the Betti
application. **SmoothBundlesConnections**, B6.0, owns metric convexity and generic
good-cover refinements; B2.11 adds holomorphic-chart subordination and the disc
consequence using **ConformalMapping**, L3. B2.9 constructs the arbitrary-dimensional
invariance-of-domain extension in the shared topology API; its planar specialization
agrees with **PlanarTopology**, Layer 2, under the usual real identification ℂ≃ℝ².

**SchemeAndStackFoundations**, SF.2 and SF.4, supplies coherent direct images,
formal functions, thickenings and formal completion. **ComplexComparisonPartII**,
C0, supplies analytic sheaf and bundle carriers; C1.1 `localDolbeault` supplies
the bundle-valued Dolbeault comparison.
**FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.1 and R07.2, supplies the
connected–étale decomposition, finite flat groups, their descent, p-divisible
groups and the contravariant Dieudonné equivalence. The completed Poincaré,
ordinary CM and abelian-variety realization adapters are constructed here.

**PELModuli**, M3.5–M3.6, supplies period uniformization; M5 supplies the
Siegel family and M6 the arithmetic coarse-moduli and level interfaces, including M6.11 `finiteFieldFiniteness`.
**Completed/HodgeStructures**, L0–L3, supplies the linear Hodge carriers.
**ShimuraVarieties**, §§3.5a–3.5d, supplies the real o-minimal and definable-Chow
foundations; §5.2 supplies the algebraic weight −1 Hodge–Hom comparison and
§§5.5–5.8 supply CM models, potential good reduction and the Shimura–Taniyama
Frobenius formula. B2 owns fixed parts, their trace adapter, algebraic monodromy
and abelian Ax–Lindemann; B3 owns mixed Kuga uniformization and its counting
application and abelian-family adapters. F3 owns prescribed-slope CM existence
and finite-field effectivity, using the parent's A5.1–A5.3 algebraization and
A6.32–A6.33 Weil restriction. **JacobianChallengePartII**, §2.6
`RelativeJacobian.CurveDifference`, §§5.3–5.4 and §7.2
`RelativeJacobian.levelFaltingsZhang`, supplies differences for a given curve
family. B4 constructs the fine full-level curve moduli and universal family. **JacobianChallenge** supplies the
underlying Jacobian and curve Picard geometry.

For arithmetic groups use **AdelicAlgebraicGroups**:
AA.1 constructs adelic points and compact open levels, AA.3 supplies reduction
theory and finite class sets, and AA.4 supplies approximation and level double
quotients. F4 specializes these constructions to the units of an endomorphism
algebra. **GeometryOfNumbersAndQuadraticArithmetic**, §2.5 and §3.3, supplies
invariant-factor and quadratic genus-mass prerequisites. F4 owns semisimple stable-lattice bounds; F5 owns the unitary CM mass asymptotic. **ClassFieldTheory**,
layers 5, 10 and 13, supplies Brauer invariants, their global compatibility and
norm theorems. **RepresentationTheory/SemisimpleAlgebras**, layers 4–5, supplies
central simplicity and centralizers. **Completed/EffectiveBounds**, layer 1,
supplies number-field discriminant, class-number and unit-index bounds;
**Chebotarev**, layer 14, supplies natural density;
**ImaginaryQuadraticClassNumber**, H3.6, supplies the nine maximal-order
class-number-one cases.
**DeligneWeightsAndPurity**, DWP.0 targets 0.1–0.3 and DWP.1 targets 1.4–1.5,
supplies pure algebraic numbers and the independent Rosati proof of the abelian
Frobenius root bound and the extension-field point-count identity. F0 adds integrality and the finite-field classification adapter. None of these general theories
is rebuilt here.

The outputs are the completed-bundle and Betti-rank interfaces used in
Eisenstein–Kronecker and Mordell–Lang arguments, and the finite-field
classification and counting interfaces. This roadmap stops before constructing
Eisenstein–Kronecker classes, proving height inequalities or deriving new
Mordell–Lang bounds. The finite-field part does not claim a sharp unconditional
numerical exponent for the number of unpolarized varieties.

The invariant tensor comparison with the free divided power algebra is supplied by
**DerivedModuleAlgebra**, §0.DP.2, “Free divided powers and symmetric tensors”; P0 owns the
arbitrary-module comparison, shuffle-product compatibility and degree completion. Mathlib
`Polynomial.lifts_and_natDegree_eq_and_monic` and `Polynomial.resultant_map_map` supply monic
coefficient lifting and fixed-size resultant congruence, with arbitrary coefficient ideals.
Their specializations are inputs to F2. AbelianSchemesAndArithmeticModuli A6.10–A6.11 owns
integer characteristic polynomials, degree and prime independence; F0 adds reciprocity and
finite-field product corollaries rather than a second integrality theorem. The integer-character theorem and its finite-equation
consequence have one owner, B2's integer-character construction.

The independent prerequisite extensions belong here: B2 owns uniform torsion closures,
Lang–Néron, polarized fixed parts and the abelian Ax theorem; B3 owns the mixed Kuga inputs;
B4 owns fine curve moduli; F4 owns semisimple lattice bounds; F5 owns CM unitary masses.
Tate full faithfulness and Honda–Tate are supplied to later arithmetic consumers by F0–F3.
F0–F1 own the finite-field Tate comparison, including the characteristic prime.

## Conventions

- A geometric abelian scheme is a smooth proper group scheme with geometrically
  connected fibres. Write π : A → S, e for its unit, A∨ for its dual and P for
  the Poincaré bundle rigidified along both units. Unless a target says otherwise,
  P1–P3 use a noetherian base and constant relative dimension d. A♮ denotes the
  universal vector extension **of A∨**. Its vector kernel is ω_A, and
  H = (H¹_dR(A/S))∨ identifies with ω_A♮.
- TSymⁿ_R(M) is the permutation-invariant submodule of the native tensor power.
  Multiplication is the shuffle sum. Symⁿ(M) denotes the usual symmetric-power
  quotient. The two integral objects are kept distinct. Write v^[n] for the
  diagonal invariant tensor; vⁿ = n! v^[n] in the shuffle algebra (Roby, Chapter III §§5–6, pp.251–255).
- A hat on the coefficient algebra means the product over degrees. A hat on a
  group or sheaf means completion along the specified unit ideal. Coordinate
  rings are inverse limits; formal functors are filtered unions of thickenings.
  An equality between degree and augmentation-adic topologies requires its own
  hypotheses. Completed tensor products are specified before exchanging limits
  with base change. In P4, O_Cp is used after completed base change from a
  noetherian CM model; it is not assumed noetherian.
- In a Betti chart choose polarization type D = diag(d₁,…,d_g), a period matrix
  Z with positive definite Im Z, and coordinates w = Da + Zb. The map to the
  fixed real torus has coordinates (a,b); it does not include the base point.
  Frame changes act by integral torus automorphisms. Betti ranks are real ranks
  on the smooth analytic locus over S^sm; all restricted-form assertions use that locus. Non-degeneracy compares them with **twice the
  total complex dimension** of a subvariety.
- The Betti form is normalized by i∂∂̄(2(Im w)ᵗ(Im Z)⁻¹(Im w)). Thus it is
  2 Σ d_j da_j ∧ db_j, and on a fibre its class is twice the polarization class.
  Keep this normalization in wedge powers, pullbacks and examples.
- The C(S)/C trace and the geometric C(S)bar/C trace are different objects.
  The latter may increase after a finite cover. GH generically special varieties
  allow an arbitrary constant subvariety in the geometric trace. Gao's
  special-generically closure uses a constant section, a torsion translate and
  an abelian subscheme. These notions have separate names and interfaces.
- In F0–F3 let q = p^a, p prime and a ≥ 1. End and Hom are over F_q. Frobenius is
  the q-power endomorphism π_A, so P_A(X) = det(X − π_A). In the descending
  expansion P_A = Σ a_i X^(2g−i), a₀ = 1 and a_(2g−i) = q^(g−i)a_i for i ≤ g.
  Weil numbers are algebraic integers with the required absolute values under
  every complex embedding; arbitrary reciprocal polynomials are not substituted
  for realizable classes.
- C is the contravariant Dieudonné functor: f : A → B induces C(f) : C(B) → C(A).
  Over W(F_q), F is arithmetic Frobenius semilinear and F^a is L-linear, where
  L = W(F_q)[1/p]. End⁰(A)^op occurs on the realization side. Over F_p a
  **linear dual** restores covariant lattice notation; it is not Cartier duality.
- Rational markings are quasi-isogenies B → A₀. Lattice tuples have finite
  support relative to A₀. The characteristic-prime component is transported by
  C(f)⁻¹ before the prime-field linear-dual convention is applied. Unmarked
  classes are rational orbits; an integral lattice need not be a projective
  rank-one module over its order.
- D_* is a product over ordered pairs of unequal **root values**, with their
  occurrences counted. It remains positive for repeated-root characteristic
  polynomials. Local orbit estimates, stabilizer indices and fixed-level class
  numbers are separate inputs. Constants in O_p and O_q may depend on the fixed
  prime or prime power; an error used uniformly across isogeny classes must be
  stated uniformly.

## Exact supplier contracts

### From Mathlib

Use Mathlib's `TensorPower`, `PiTensorProduct.reindex`, `reindex_tprod` and
`map_reindex` for permutations and tensor functoriality. Form invariant
submodules with `LinearMap.eqLocus` and `Submodule.mem_iInf`. The existing
`DividedPowerAlgebra` is the source of the comparison in P0, rather than a new
presentation of the divided power algebra.

### From TauCetiRoadmap.DerivedModuleAlgebra

Consume §0.DP.2, “Free divided powers and symmetric tensors”: for a commutative ring R and
free R-module M, the natural map Γⁿ_R(M) → (M^(⊗n))^(S_n), γ_n(v) ↦ v^(⊗n), is a linear
equivalence, natural in M. Consume §0.DP.2's Roby representability for all modules
to construct the arbitrary-module natural comparison in P0.5; the free-module
invertibility theorem remains the export of §0.DP.2.

### From Mathlib: polynomial lifting and congruence

`Polynomial.lifts_iff_coeff_lifts` and `Polynomial.lifts_and_natDegree_eq_and_monic` in
`Mathlib/Algebra/Polynomial/Lifts.lean` provide lifts of monic polynomials with their natural
degree retained. Apply them modulo a proper ideal I to a unital map D → O surjective modulo I:
for monic P ∈ O[X] choose monic ψ ∈ D[X] of degree deg P with ψ ≡ P modulo I. For I=O the
congruence imposes no condition and ψ=X^(deg P) suffices when D is nonzero; if D is zero,
O is zero and P has natural degree zero. `Polynomial.resultant_map_map` in
`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean` commutes with every ring map at fixed
Sylvester sizes m,n. Applied to O → O/I, it gives congruence of the two fixed-size resultants
whenever Q ≡ Q′ modulo I, without a degree-preservation assumption. Default resultants require
the actual degrees to agree. These inputs hold for arbitrary commutative coefficient rings.

### From Tau Ceti

Tau Ceti's `symmetricTensors` is the
flip-fixed tensor square; P0 compares it with the degree-two instance of the
all-degree construction.

### From Mathlib: analytic and arithmetic carriers

`AddCircle (1 : ℝ)` is the real circle used in Betti tori. It supplies a torus
fibre, while the period charts and transition maps are constructed in B0.
For resultants use `Polynomial.resultant`; its Sylvester degree arguments are
retained in congruence statements. `PadicInt.appr_spec` supplies coefficient
lifts modulo p^N. Mathlib's natural-valued `PadicInt.valuation` sends zero to
zero, so recognition statements explicitly exclude zero resultants. For F6
evaluate `MvPolynomial.mul_esymm_eq_sum` on the root occurrences; the new work
is the coefficient and reciprocity adapter, not another Newton-identity proof.
For CM power effectivity use `NumberField.Embeddings.pow_eq_one_of_norm_eq_one`
in `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean`: an integral
number-field element whose complex conjugates all have norm one has a positive
power equal to one. F3 proves integrality of the quotient before applying it.

### From Tau Ceti: tensor, discriminant and abelian-variety carriers

At `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`,
`TauCeti/LinearAlgebra/TensorPower/Basic.lean` supplies
`TauCeti.TensorPower.oneEquiv` and `TensorPower.splitAt`.
`TauCeti/RingTheory/Polynomial/Resultant/Discriminant.lean` supplies
`Polynomial.Monic.resultant_deriv`, `Polynomial.Monic.discr_eq_prod_roots_sub_sq`,
`Polynomial.Monic.discr_mul` and `Algebra.discr_powerBasis_eq_minpoly_discr`.
F4 compares the latter power-basis discriminant with the maximal-order
number-field discriminant, retaining the square of the order index.
`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean`, `Isogeny.lean` and
`End/Basic.lean` supply `TauCeti.AlgebraicGeometry.AbelianVariety`, its homomorphisms,
`TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny` and endomorphisms. The dimension used in F6 is
`TauCeti.AlgebraicGeometry.AbelianVariety.dim`, defined by the topological Krull dimension;
its finite-value subtype and native quotients require no realization functor. These field carriers do not
supply the relative universal extensions, completed coefficient sheaves or
Dieudonné functors required by P1–P4 and F1.

### From Tau Ceti: complements of embedded spheres and balls

Consume `TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two` and
`TauCeti.reducedSingularHomologySphereComplRangeSphereIso` in
`TauCeti/AlgebraicTopology/Singular/JordanBrouwer.lean`: a continuous injection
S^(m−1)→S^m has a complement with two path components, with reduced degree-zero
homology one copy of the coefficients. Consume
`TauCeti.isZero_reducedSingularHomologyFunctor_compl_range_closedBall` in
`TauCeti/AlgebraicTopology/Singular/CubeComplement.lean`, specialized to a sphere,
whose point complements are acyclic. Retain the Hausdorff and finite-dimensional
hypotheses. For connectivity use rational coefficients and
`TauCeti.reducedSingularHomology₀Iso` in
`TauCeti/AlgebraicTopology/Singular/Reduced.lean`, which identifies reduced
homology with the direct sum indexed by path components other than a chosen
basepoint. B2.9 constructs the open-map conclusion from these complement theorems.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

Consume A2's dual and rigidified Poincaré bundle, A3's isogeny/quotient and
Tate-product maps, A3.9 `Polarization.rosati`, A4.2 `AbelianVectorExtension`
with its connection-moduli representation and universal bundle, and A4.3
`AbelianH1dR.hodgeSequence`, `baseChange` and `dualPairing`. In particular
A♮ is `AbelianVectorExtension (A∨)`; neither representability nor its vector
kernel is constructed here. Consume A5's complex Hodge dictionary and A6.2
`homTateInjective`, A6.5 `poincareReducibility`, A6.7 `homFreeFinite`, A6.8
`endQ_isSemisimple`, A6.10 `End.charpoly`, A6.11 `charpolyTate`, A6.14
`rosatiPositivity`, A6.18 `polarizedAutomorphisms` and A6.21
`frobeniusSemisimple`. F1 only transports the last theorem to its faithful
contravariant realization and identifies the polynomial. Consume A5.1–A5.3 for
lattice tori, positive Riemann forms and algebraization, and A6.32
`weilRestrictionAbelian` and A6.33 `weilRestrictionTate` for finite separable
extensions, with dimension multiplied by the extension degree and the induced
prime-to-characteristic Tate module. F3 derives the finite-field Frobenius
polynomial of that restriction.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

Consume R07.1.2 `etaleGroupEquivContAction`, R07.2.10
`dieudonnePDivisible` with its contravariant exactness and F,V conventions,
and R07.2.19 `exists_padic_charpoly`: a Witt-integral matrix invariant under
Frobenius conjugation over the isocrystal has its polynomial over ℤ_p.
F1 applies this descent and proves agreement with the parent's integer polynomial.

### From TauCetiRoadmap.ComplexComparisonPartII

Consume C0's coherent analytic modules and holomorphic bundles, C1.1
`localDolbeault`, and C5's relative de Rham–Betti comparison. The Dolbeault
resolution includes holomorphic finite-rank bundle coefficients and its frame
and pullback comparisons.

### From TauCetiRoadmap.ShimuraVarieties and Completed/HodgeStructures

Consume Completed/HodgeStructures L0–L3 for pure, mixed and polarized linear
Hodge objects and their morphisms. Consume ShimuraVarieties §§3.5a–3.5d for
`R_an,exp`, finite definable charts, polarized variation carriers and definable
Chow. Consume ShimuraVarieties §5.2 `TauCeti.Shimura.weight_one_algebraization`:
over a smooth finite-type complex scheme, integral flat morphisms of homological
weight −1 Hodge variations correspond to algebraic abelian-scheme homomorphisms.
Consume §§5.5–5.8 `TauCeti.Shimura.cm_number_field_model`,
`TauCeti.Shimura.cm_potential_good_reduction`, `TauCeti.Shimura.cm_frobenius` and
`TauCeti.Shimura.shimura_taniyama`. Retain a full maximal-order CM action, its
number-field definition and a Galois field containing all CM conjugates when
using the last two; at a good prime of residue cardinality q₀ they give arithmetic
q₀-Frobenius π₀ and ord_w(π₀)/ord_w(q₀)=#(Φ∩H_w)/#H_w, also at ramified primes.
B2 constructs fixed parts and their trace adapter, and B3 the mixed Kuga extension.

### From TauCetiRoadmap.LieGroupoidsPoisson and SmoothBundlesConnections

Consume LieGroupoidsPoisson G0.1's local smooth constant-rank normal form,
tangent kernel, chart/restriction comparisons and level-fibre universal property
on finite-dimensional boundaryless manifolds, with no Hausdorff assumption.
B2.10 extends the regularity to finite C^k and real analytic maps and compares
the induced smooth level-fibre structure when both apply. Consume only the early
SmoothBundlesConnections B6.0 good-cover construction, before its bundle and
connection applications: on a Hausdorff second-countable boundaryless manifold,
a chosen smooth positive-definite metric, supplied by DifferentialGeometry
12.1 when needed, gives locally finite subordinate strongly convex covers and contractions of every nonempty finite intersection.
B2.11 applies it to the underlying real surface. ConformalMapping L3 supplies
Riemann mapping for the bounded simply connected chart images of intersections.

### From TauCetiRoadmap.GlobalNumberFields

Consume Layer 0's place/completion and local-degree interfaces and Layer 1
`GlobalNumberFields.weakApproximation_denseRange` for simultaneous
finite-completion conditions and real-place signs. F3 uses it coefficientwise
for a polynomial with prescribed local irreducibility and all roots real, and
for a CM polarizing element with prescribed imaginary signs.

### From TauCetiRoadmap.PELModuli and JacobianChallengePartII

Consume PELModuli M3.5–M3.6's complex uniformization, M5's Siegel family and
M6.11 `finiteFieldFiniteness`. Consume
JacobianChallengePartII §2.6 `RelativeJacobian.CurveDifference` and §7.2
`RelativeJacobian.levelFaltingsZhang` with their section-free base-change maps
for a supplied smooth projective genus-g family with full symplectic level.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

Consume §2.5's DVR invariant factors, §2.7 `IntegralHermitianLattice.ofCarrier` and `.dual`,
and §3.3's weighted genus sums. Its orthogonal mass formula is used only in its orthogonal scope. F4–F5 construct the semisimple-linear bounds and unitary mass asymptotic.

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume SF.2 and SF.4 for coherent direct images, formal functions, unit thickenings and
formal completion; §1.18 `Stack.stackification` and §1.21 `Stack.quotient`, `actionQuotient`
and `quotientStack_algebraic` for finite descent with isotropy; and §4.15 `StableCurves.Mbar`,
`Mbar.smooth`, `Mbar.algebraicFiniteTypeDM` and `isom_stable_curves` for the finite-type smooth
curve stack and its finite unramified isomorphism schemes. B4 constructs its full-level
scheme and universal curve rather than assuming a universal curve on a coarse space.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

Consume Layer 5 §5.2 `rigidLevelStructure`, `ArithmeticModuli.auxiliary_level_comparison`
and the level quotient-recovery interface. A representable finite étale level cover changes
objects and their automorphism stabilizers; trivial sheaf-valued inertia is required before
calling the level moduli an algebraic space. B4 proves curve-specific full-level rigidity and
schematicity on the curve stack. Generic Hilbert and Hom families enter B2's trace argument
through Layer 2's projective Hom and bounded-family constructions.

### From the remaining arithmetic and geometric suppliers

Consume SchemeAndStackFoundations SF.2 and SF.4 for coherent direct images,
formal functions and unit thickenings; AlgebraicVectorBundles L0B and L2B for
finite locally free sheaves, their tensor operations and vector groups;
DifferentialGeometry Layers 0–1 for forms and exterior differentiation and
12.1 for existence of smooth Riemannian metrics;
AdelicAlgebraicGroups AA.1, AA.3 and AA.4 for restricted products, compact
open levels, class-set finiteness and level double quotients with the group
hypotheses retained; ClassFieldTheory Layers 5,10,13 for local Brauer invariants
and norms; RepresentationTheory/SemisimpleAlgebras Layers 4–5 for central
simple algebras and centralizers; Completed/EffectiveBounds Layer 1 for
number-field bounds; Chebotarev Layer 14 for natural density; and
ImaginaryQuadraticClassNumber H3.6 for the maximal-order class-number-one
certificates of discriminants −4,−8,−3,−7,−11,−19,−43,−67,−163.
Consume DeligneWeightsAndPurity DWP.0 targets 0.1–0.3 and DWP.1 targets
1.4–1.5 for purity, root bounds and `#A(𝔽_(q^r))=det(1−π^r)` for every r≥1.
F0 keeps only its isogeny and product corollaries.

## How to read the build

The geometric branches run P0 → P1 → P2 → P3 and P4, and B0 → B1 → B2 → B3 → B4.
The arithmetic branch starts with F0 and the independent polynomial layer F2,
then runs F1 → F3 → F4 → F5 → F6. In particular, polynomial recognition precedes
the characteristic-prime comparison; no counting theorem is used to establish
Tate's theorem. Each target gives its source and the interfaces it needs.
References to targets within a layer refer to the construction order dictated
by their stated dependencies.

The headline theorems are the shuffle-compatible divided-power comparison (P0.5),
completed Poincaré cohomology (P2.8), logarithm and smooth comparisons (P3.3–P3.4),
ordinary CM trivialization (P4.2–P4.3), the Betti-rank, specialness and degeneracy
criteria and their fibre-power applications (B1.4, B2.3–B2.4, B2.21–B2.23, B3–B4),
all-prime Tate and Honda–Tate with integral lattice classification (F0.7, F1.8–F1.10,
F3.2–F3.10), fixed-level isomorphism bounds (F4.8), CM mass and polarization growth
(F5.7–F5.9), and the counting and proportion theorems (F6.2, F6.4–F6.6). Resultant recognition
(F2.2) is an independent algebraic endpoint used by the characteristic-prime comparison.
`Suggested.lean` states `resultantRecognition`, `weilPolynomialCount`,
`isogenyClassAsymptotic` and `isomorphismClassCount`; its module docstring identifies
the missing carriers for the other headlines. API facts and Checks remain in this README.

## Layer P0: Symmetric tensors and moment coefficients

The coefficient objects are built over a commutative ring R and an arbitrary R-module M; freeness and
projectivity enter only the comparison theorems. Establish the permutation action and the
invariant-submodule interface before defining multiplication. Degree completion is a product of
these modules, so it remains meaningful in positive characteristic.

### P0.1 Invariant tensor powers

For a commutative ring R, an R-module M and n≥0, define TSymⁿ_R(M) as the submodule of TensorPower R n
M fixed by every permutation of Fin n, acting by PiTensorProduct.reindex. It is an invariant
submodule, not the symmetric-power quotient.

Its API consists of the following facts and maps.

- A tensor belongs to TSymⁿ(M) exactly when every permutation fixes it.
- The pure tensor with every factor v lies in TSymⁿ(M).
- Every R-linear f:M→N induces TSymⁿ(M)→ₗ[R]TSymⁿ(N) by tensoring every factor.
- The induced maps preserve identities and composition, and send the diagonal tensor of v
  to the diagonal tensor of f(v), for R-modules M,N,L.
- Equality uses native subtype extensionality.

**Checks.**

- In degree zero, TSym⁰(M)=⊤ in TensorPower R 0 M.
- In degree one, TSym¹(M)=⊤ in TensorPower R 1 M, hence agrees with M through the
`TauCeti.TensorPower.oneEquiv`.
- For M=ℤ² the pure tensor e₀⊗e₁ is not in TSym²(M); swapping
it gives e₁⊗e₀, distinguished by the coordinate functional.
- In degree zero the induced map is id_R; the zero map would destroy the empty unit tensor.
- In degree one the induced map agrees with f under the one-letter equivalence; replacing f by
  its rank or another scalar does not give this equality for arbitrary f.
- For f=0, every positive-degree induced map is zero, while the degree-zero map is id_R;
  a degree-independent scalar rule fails one of these two cases.

([Roby][Roby], Chapter III §5, printed pp.251–254 (Roby line 1416)).

*Needs:* `TensorPower`; `PiTensorProduct.reindex`; `LinearMap.eqLocus`; `Submodule.mem_iInf`;
`PiTensorProduct.reindex_tprod`; `PiTensorProduct.map_reindex`.

### P0.2 Degree completion of symmetric tensors

Define the degree-completed module TSym̂_degree(M)=∏_(n≥0)TSymⁿ(M), with the product/degree
filtration, and finite truncation `∏_{n≤N}TSymⁿ(M)`. No identification with I-adic completion over
an arbitrary integral base is part of this definition.

Its API is evaluation and finite truncation.

- Evaluation at n is the native R-linear projection to TSymⁿ(M).
- Extensionality and zero components use the Pi-module API.
- Restriction to `Fin (N+1)` gives an R-linear map from the completed module to
  ∏_(j≤N)TSymʲ(M), compatibly as N increases.

**Checks.**

- For R=M=ℤ, let c_n be the invariant tensor
  1⊗⋯⊗1 in degree n, including the empty tensor in degree zero. Every c_n is
  nonzero and c lies in the product but outside the image of the canonical
  direct-sum inclusion. A direct-sum replacement cannot contain this sequence.
- Loss under truncation: A nonzero coefficient in degree N+1 gives a
  nonzero completed sequence whose restriction through N is zero; this distinguishes completion from any fixed finite truncation.
- A sequence with degree-zero coefficient
  1 over ℤ is nonzero, through the native empty-tensor equivalence; the empty tensor detects the coefficient.

([KS][KS], Equation(2.1.3), PDF p.14).

*Needs:* [P0](#layer-p0-symmetric-tensors-and-moment-coefficients), Invariant tensor powers.

### P0.3 Shuffle multiplication and divided powers

For tensors invariant under S_m and S_n, sum over (m,n)-shuffles to obtain
TSym^m(M)×TSym^n(M)→TSym^(m+n)(M). It is associative and commutative; diagonal divided tensors
satisfy v^[m]v^[n]=binom(m+n,m)v^[m+n] and v^n=n!v^[n].

- Multiplication on ⊕n TSymⁿ(M) is the sum over (m,n)-shuffles in degrees m,n.

- The unit is 1 in degree zero, using the native empty tensor equivalence.

- For diagonal tensors v^[n], v^[m]v^[n]=binom(m+n,m)v^[m+n].

**Checks.**

- The degree-zero subalgebra is the native base ring R.
- For M=F₂·v, the shuffle square v·v is zero, but v^[2] is
nonzero; ordinary tensor concatenation would fail this test.
- For a free rank-two module with basis x,y,
  `(x+y)^[2]=x^[2]+x*y+y^[2]`; the middle coefficient is 1, including over 𝔽₂.

([Roby][Roby], Chapter III §§5–6, Proposition III.1, printed pp.251–255
(Roby line 1476, Roby line 1526); [Kings][Kings], §2.2, equation (2.2.2), PDF p.10).

*Needs:* [P0](#layer-p0-symmetric-tensors-and-moment-coefficients), Invariant tensor powers.

### P0.4 Comparison with the degree-two invariant submodule

Under the native PiTensorProduct binary tensor equivalence, TSym²_R(M) is
TauCeti.symmetricTensors R M, the eqLocus of TensorProduct.comm and identity. This compares
invariant submodules; it does not identify the invariant lattice with the coinvariant
SymmetricPower quotient integrally.

([Roby][Roby], Chapter III §5, printed pp.251–254 (Roby line 1416)).

*Needs:* [P0](#layer-p0-symmetric-tensors-and-moment-coefficients), Invariant tensor powers;
`TauCeti.symmetricTensors`.

### P0.5 Shuffle compatibility of the divided-power comparison

For every commutative ring R and R-module M, construct the natural degree-n
linear map Γⁿ_R(M) → TSymⁿ_R(M) from the homogeneous polynomial law v↦v^(⊗n).
First define the tensor-valued law after every commutative R-algebra base
change, using that tensor powers commute with base change. Use
DerivedModuleAlgebra §0.DP.2's Roby representability to obtain Γⁿ_R(M) → M^(⊗n),
then use invariance of the law under each permutation to factor this map
through TSymⁿ_R(M). No commutation of invariants with arbitrary base change
is assumed. Prove that the sum of these maps is a unital graded
algebra homomorphism from Mathlib's `DividedPowerAlgebra R M` to ⊕n TSymⁿ_R(M)
with shuffle multiplication. For free M, identify its degreewise maps with
DerivedModuleAlgebra §0.DP.2's equivalences and hence obtain a graded algebra
equivalence (Roby, Chapter III §6 Proposition III.1 and Chapter IV §5
Proposition IV.5, printed pp.254–255,272–273).

Its API comprises the following laws.

- The degree-n map takes γ_n(v) to v^(⊗n), including γ₀(v)↦1.
- For every R-linear f:M→N, applying the comparison then the invariant tensor
  power of f equals applying Γⁿ(f) then the comparison for N.
- A degree-m times degree-n product maps to the (m,n)-shuffle product, with no
  factorial denominator. Invertibility is asserted for free modules.

**Checks.**

- In degree zero the map takes 1 to the empty unit tensor, also for M=0.
- For rank one in characteristic two, γ₁(v)² maps to 0 while γ₂(v) maps to v⊗v≠0.
- For free rank two, γ₁(x)γ₁(y) maps to x⊗y+y⊗x, fixing the shuffle coefficient one.
- For R=ℤ and M=ℤ/2, multiplication by 2 on M sends both γ₁(1) and its tensor
  image to 0; the map is required without imposing freeness on this module.

*Needs:* DerivedModuleAlgebra §0.DP.2's universal homogeneous polynomial law,
Roby representability, direct-sum grading and free comparison; P0.1 invariant tensor powers and
P0.3 shuffle multiplication and divided powers.

### P0.6 Multigrading of invariant tensors

For a finite family of finitely generated projective R-modules Mσ and M=⊕σ Mσ, there is a
natural multigraded isomorphism `TSym^k(M)≃⊕_{|α|=k}⊗σ TSym^{α(σ)}(Mσ)`. For a vector v with
components vσ, its α-component is ⊗σ vσ^[α(σ)]. The corresponding sheaf statement holds for
finite locally free summands. No such isomorphism for arbitrary nonflat summands is asserted.

([KS][KS], Definition 1.6 and displayed multigrading, PDF pp.8–9).

*Needs:* [P0](#layer-p0-symmetric-tensors-and-moment-coefficients), Invariant tensor powers;
[P0](#layer-p0-symmetric-tensors-and-moment-coefficients), Shuffle multiplication and divided powers.

### P0.7 Construction requirements

For shuffle multiplication, index representatives of S_(m+n)/(S_m × S_n) and prove independence
of representatives, invariance and the three-block shuffle bijection. That bijection gives
associativity; exchanging the two blocks gives commutativity. Compare diagonal tensors with the
relations of the existing divided power algebra. For multigrading use orbit sums in local bases
of the finite projective summands and glue by naturality. Do not infer a multigraded
decomposition for nonflat summands. Truncation gives the degree topology directly; an
augmentation-adic comparison must carry a cofinality hypothesis, such as the finite-generation
and factorial-invertibility assumptions that identify the shuffle algebra with a symmetric
algebra. The integral moment constructions only use degree truncations.

### Examples

For a rank-one module over 𝔽₂, the divided square survives while the shuffle square vanishes. The all-unit sequence over ℤ has infinitely many nonzero degrees (Roby, Chapter III §6; KS (2.1.3)).

### Dependencies

Native tensor powers, permutation reindexing and equalizers precede shuffle multiplication and completion; DerivedModuleAlgebra §0.DP.2 supplies the divided-power comparison, and AlgebraicVectorBundles L0B supplies sheafification for finite locally free summands.

## Layer P1: Universal vector extensions

Compare the connection and cotangent notation with the completed Poincaré
coefficients; the vector extension itself is supplied as specified in Scope and ownership.

### P1.1 Connection and cotangent notation

For an abelian scheme A/S over a noetherian base, put A♮=E(A∨) and let
p:A♮→A∨ be its forgetful map. Prove that
the pulled-back rigidified bundle `(id_A×p)^*P` with its universal relative
integrable connection is the P♮ used in P2. Under the duality pairing for A and
A∨, transport the parent's invariant-form comparison to
`Lie(A♮)≃H¹_dR(A/S)` and `ω_A♮≃H=(H¹_dR(A/S))∨`, with the Hodge sequences,
rigidifications and base change. This fixes notation and variance for P2,
without a new extension or representability construction.

The comparison API has three requirements.

- Forgetting the connection recovers the underlying rigidified Poincaré bundle.
- The cotangent and Lie identifications agree with both Hodge sequences.
- These identifications commute with base change.

**Checks.**

- In dimension zero the coefficient space H is zero and P♮ is the rigidified
  trivial line with its trivial relative connection.
- For an elliptic scheme the vector kernel has rank one and Lie(A♮) rank two;
  confusing E(A) and E(A∨) loses the specified forgetful target.
- On a square-zero test base `k⊕M` the tangent comparison has domain
  `Hom_k(H,M)`, fixing the dual in the identity-class construction of P3.

([KS][KS], Notation 2.2 and equation (2.1.1), PDF p.13).

*Needs:* AbelianSchemesAndArithmeticModuli A4.2–A4.3, A2.2;
AlgebraicVectorBundles L0B and L2B.

### Examples

For an elliptic scheme, the vector kernel has rank one and the invariant cotangent of A♮ has rank two; the square-zero identity class lies in Hom(H,H) (KS Notation 2.2).

### Dependencies

AbelianSchemesAndArithmeticModuli A2.2 and A4.2–A4.3 supply the Poincaré bundle, universal vector extension and de Rham pairing; AlgebraicVectorBundles L0B,L2B supplies their vector-kernel interpretation.

## Layer P2: Completed Poincaré bundles

Complete along the dual unit, retaining the finite pushforward system. Moments turn formal
coefficients into invariant tensors. Functoriality and torsion splittings come from the
rigidified biextension, while top cohomology uses the normalized Poincaré transform and formal
functions.

### P2.1 Moments of a formal smooth group

For a separated smooth commutative group G/S of finite presentation, with closed unit section e,
its unit ideal J has J^n/J^(n+1)≃Sym^n(ω_G). Iterating the coproduct and projecting each factor
O_G/J²→ω_G gives `mom_n:O_G/J^(n+1)→⊕_{b≤n}TSym^b(ω_G)`, compatible with truncation; their inverse
limit lands in degree completion. Over a Q-algebra the moment maps are isomorphisms.

- Projection from the n-th to the m-th formal neighborhood commutes with moments for m≤n.

- The degree-one component is the canonical projection O_G/J²→ω_G.

- A homomorphism of smooth commutative groups commutes with moments through its invariant cotangent map.

**Checks.**

- At n=0 the moment map is the identity of O_S.
- For G_a over a Q-algebra, x^n maps to n! times the nth
invariant divided tensor.
- For G_a over F_p, the degree-p associated-graded map sends x^p to
zero because p!=0; the integral moment map is not automatically an isomorphism.

([KS][KS], Equation(2.1.2), moment construction and Remark 2.3, PDF pp.13–14).

*Needs:* [P0](#layer-p0-symmetric-tensors-and-moment-coefficients), Invariant tensor powers;
[P0](#layer-p0-symmetric-tensors-and-moment-coefficients), Degree completion of symmetric tensors;
**SchemeAndStackFoundations**, SF.4.

### P2.2 Finite and completed Poincaré sheaves

For a coherent sheaf F on a smooth group G with unit ideal J, construct its unit completion from
the inverse system F ⊗ O_G/J^(n+1), restricted to the unit space, and compare it with pullback
to the formal completion. For A, put P^(n) = (id_A ×
π∨^(n))_*(P|_(A×A∨^(n))) and P̂ = lim_n P^(n). Perform the same construction on A♮ to obtain
P♮^(n), P̂♮ and their integrable relative connections. The rigidifications identify degree zero
with O_A. For n≥1, prove the truncation sequences
0 → π^*Sym^n(ω_A∨) → P^(n) → P^(n−1) → 0 and
0 → π^*Sym^n(H) → P♮^(n) → P♮^(n−1) → 0.
Their compatible unit sections induce O_S → e^*P̂ ≃ O_Â∨ and
O_S → e^*P̂♮ ≃ O_Â♮. Construct the unit-compatible maps P^(n) → P♮^(n) and identify
P♮^(n) with P^(n) ⊗_(O_(A×A∨^(n))) O_(A×A♮^(n)). All limits use the specified finite
pushforwards; tensor interchange with an arbitrary inverse limit is a separate assertion.

- P_hat→P(n) is the projection to the n-th infinitesimal dual neighborhood, and similarly for P♮.

- Rigidification gives the compatible unit sections O_S→e^*P(n).

- The nth kernel is π^*Sym^n(ω_A∨), respectively π^*Sym^n(H) in the connection version.

**Checks.**

- P(0)≃O_A and P♮(0)≃O_A with trivial relative connection.
- P(1) is an extension of O_A by π^*ω_A∨ with the imported unit
rigidification.
- On an elliptic scheme, P^(2) and P♮^(2) have
O_A-ranks 3 and 6, while their degree-two truncation kernels have ranks 1 and 3.
The conormal ranks are respectively 1 and 2; identifying the ordinary and
connection coefficient sheaves fails this check.

([KS][KS], Definitions 2.4/2.7 and equations(2.1.4)–(2.1.5), PDF pp.14–16).

*Needs:* [P1](#layer-p1-universal-vector-extensions), Connection and cotangent notation;
[P2](#layer-p2-completed-poincaré-bundles), Moments of a formal smooth group.

### P2.3 Fourier–Mukai input for completed Poincaré cohomology

For a noetherian S and an abelian scheme A/S of constant relative dimension d, establish the
normalized Poincaré transform, its formal-functions comparison at the dual unit, and the
derived/ordinary completion comparison. After twisting by Ω^d_A/S these identify Rπ_*(P̂ ⊗
Ω^d_A/S) with O_S[−d]. The assertion includes the inverse-limit comparison needed to compute
completed, rather than only finite-level, cohomology.

([KS][KS], Theorem 2.15 and its proof, PDF pp.18–19).

*Needs:* **AbelianSchemesAndArithmeticModuli**, A2; **SchemeAndStackFoundations**, SF.2;
[P2](#layer-p2-completed-poincaré-bundles), Finite and completed Poincaré sheaves.

### P2.4 Isogeny functoriality of completed Poincaré sheaves

For an isogeny φ : 𝒜 → ℬ, the isomorphisms (φ × id)^*𝒫_ℬ ≅ (id × φ^∨)^*𝒫_𝒜 and their ♮-versions
(equation (2.2.1)) give canonical maps `φ^{(n)}_#` : `𝒫^{(n)}_𝒜` → `φ^*𝒫^{(n)}_ℬ` and `𝒫^{♮(n)}_𝒜` →
`φ^*𝒫^{♮(n)}_ℬ`, isomorphisms if φ^∨ (resp. φ^♮) is étale (e.g. if deg φ is invertible), and in
the limit φ_# : 𝒫̂_𝒜 → φ^*𝒫̂_ℬ, 𝒫̂^♮_𝒜 → φ^*𝒫̂^♮_ℬ.

([KS][KS], Theorem 2.8 and proof, PDF p.16).

*Needs:* [P2](#layer-p2-completed-poincaré-bundles), Finite and completed Poincaré sheaves;
**AbelianSchemesAndArithmeticModuli**, A3.

### P2.5 Canonical torsion splittings and moments

For an isogeny φ : 𝒜 → ℬ and a φ-torsion section x, φ_# induces `φ_{#x}` : x^*𝒫̂_𝒜 → x^*φ^*𝒫̂_ℬ ≅
e^*𝒫̂_ℬ ≅ `𝒪_{ℬ̂^∨}`; if φ^∨ is étale, `𝒫̂_𝒜|_{ker φ}` ≅ `π^*_{ker φ}𝒪_{ℬ̂^∨}` and there is a
canonical ϱ_x : x^*𝒫̂_𝒜 ≅ `𝒪_{𝒜̂^∨}`; the same for 𝒫̂^♮ when φ^♮ is étale. Composing with the
moment map gives _ϱmom_x : x^*𝒫̂_𝒜 → `TSym^̂(ω_{𝒜^∨})` and x^*𝒫̂^♮_𝒜 → TSym^̂(ℋ), with components
_ϱmom^b_x.

([KS][KS], Corollary 2.9 and Definition 2.10, PDF p.17).

*Needs:* [P2](#layer-p2-completed-poincaré-bundles), Isogeny functoriality of completed Poincaré
sheaves; [P2](#layer-p2-completed-poincaré-bundles), Moments of a formal smooth group.

### P2.6 Equivariant structure under relative automorphisms

If a discrete group Γ acts on 𝒜/𝒮 by automorphisms, `(γ_#)^{-1}` : γ^*𝒫̂ ≅ 𝒫̂ and γ^*𝒫̂^♮ ≅ 𝒫̂^♮
make 𝒫̂ and 𝒫̂^♮ Γ-equivariant sheaves.

([KS][KS], Corollary 2.11, PDF p.17).

*Needs:* [P2](#layer-p2-completed-poincaré-bundles), Isogeny functoriality of completed Poincaré
sheaves; **SchemeAndStackFoundations**, SF.2.

### P2.7 Poincaré comultiplication and symmetric levels

There are canonical `𝒫^{(n+m)} → 𝒫^{(n)} ⊗_{𝒪_𝒜} 𝒫^{(m)}` and 𝒫̂ → 𝒫̂ ⊗̂ 𝒫̂, co-commutative, whose
associated graded is induced by the diagonal of `ω_{𝒜^∨}` (Proposition 2.12, reflecting the
partial group law of the Poincaré torsor, Remark 2.13); likewise for 𝒫^♮. Hence `𝒫^{(n)}` →
`TSym^n_{𝒪_𝒜}(𝒫^{(1)})` and `𝒫^{♮(n)}` → `TSym^n(𝒫^{♮(1)})`, isomorphisms if n! is invertible on 𝒮
(Corollary 2.14).

([KS][KS], Proposition 2.12 and Corollary 2.14, PDF pp.17–18).

*Needs:* [P2](#layer-p2-completed-poincaré-bundles), Isogeny functoriality of completed Poincaré
sheaves; [P0](#layer-p0-symmetric-tensors-and-moment-coefficients), Shuffle multiplication and divided
powers.

### P2.8 Top cohomology of the ordinary completed Poincaré sheaf

For an abelian scheme π:A→S of constant relative dimension d over a noetherian base,
R^iπ_*(P_hat⊗Ω^d_A/S)≃O_S when i=d and is zero for i≠d, compatibly with the rigidification. This
is the completed ordinary Poincaré sheaf. The connection/logarithm variant mentioned in Remark
2.16 is a separate comparison obligation; it is not asserted to have this identical underlying
coherent-cohomology formula.

([KS][KS], Theorem 2.15 and proof, PDF pp.18–19).

*Needs:* [P2](#layer-p2-completed-poincaré-bundles), Fourier–Mukai input for completed Poincaré
cohomology.

### P2.9 Construction requirements

Use smoothness to identify J^n/J^(n+1) with Sym^n(ω_G). Project the iterated coproduct to the
split first infinitesimal neighbourhood and prove symmetry and truncation compatibility. The
associated-graded map is symmetrization: its orbit-sum coefficient for multiplicities α is ∏
α_j!, with n! for a diagonal monomial. This proves the rational isomorphism and explains the
characteristic-p failure. For completed cohomology prove the normalized transform R pr∨_*P =
e∨_*(det ω_A∨)^−1[−d], apply proper formal functions along e∨ and compare the derived and
ordinary inverse limits. Grothendieck duality identifies det ω_A with det ω_A∨, cancelling the
line after the Ω^d twist. These comparisons must be established over the noetherian base before
reading the cohomology groups; finite-level vanishing alone is insufficient. The normalization
and formal-functions route are Kings–Sprang, Theorem 2.15, pp.18–19. Equivariance uses coherent
pullback and identity/composition maps from SF.2.

### Examples

On an elliptic scheme the ordinary and connection coefficients at level two have ranks 3 and 6; their last kernels have ranks 1 and 3 (KS (2.1.4)–(2.1.5)).

### Dependencies

P0 coefficient tensors and P1 connection notation precede moments and finite coefficients. AbelianSchemesAndArithmeticModuli A2–A3 supplies biextension and isogeny maps; SchemeAndStackFoundations SF.2,SF.4 supplies formal functions and unit thickenings. The normalized transform precedes the top-cohomology conclusion.

## Layer P3: Logarithm and smooth realizations

Over a characteristic-zero field the first logarithm extension is characterized by an identity
class and a chosen unit splitting. The universal connection supplies that class. Over ℂ its
smooth realization becomes an explicit connection on truncated invariant tensors, with a
compatible Dolbeault resolution.

### P3.1 Square-zero deformation and the logarithm class

For S=Spec k, char k=0, and finite-dimensional M, the universal connection identifies
ker(A♮(k⊕M)→A♮(k))≃Lie(A♮)⊗M≃Hom(H,M) with Ext¹ of O_A by π^*M in integrable connections,
compatibly with the split unit. Taking M=H and id_H gives Log¹.

([KS][KS], Theorem 2.36 proof and equation(2.7.2), PDF pp.28–29).

*Needs:* [P1](#layer-p1-universal-vector-extensions), Connection and cotangent notation;
[P1](#layer-p1-universal-vector-extensions), Connection and cotangent notation.

### P3.2 The smooth d+ν connection

Over C, for the Hodge/CM component conventions of §3.1, ν is the identity tensor in H⊗(ω⊕conj
ω). On `⊕_{k≤n}TSym^k(H)` the connection d+ν has the same rigidified first extension as P♮(1) and
induces the higher symmetric constructions.

([KS][KS], Definitions 3.2–3.3 and Theorem 3.5, PDF pp.30–32).

*Needs:* [P3](#layer-p3-logarithm-and-smooth-realizations), Square-zero deformation and the
logarithm class; [P0](#layer-p0-symmetric-tensors-and-moment-coefficients), Shuffle multiplication and
divided powers; **AbelianSchemesAndArithmeticModuli**, A5.

### P3.3 Comparison with the logarithm sheaf

Let S = Spec k with char k = 0. Define Log^(1) as the integrable-connection extension of O_A by
π^*H whose image in Hom_k(H,H) is id_H, together with a fixed splitting at e. Use the
local-to-global sequence 0 → Ext¹_DS(O_S,H) → Ext¹_DA(O_A,π^*H) → Hom_DS(H,H) → 0 to
characterize it. Set Log^(n) = Sym^n(Log^(1)) with the compatible unit sections and transition
maps, and Log = lim_n Log^(n). Prove a canonical isomorphism of connections and unit splittings
Log^(1) ≃ P♮^(1), and hence Log ≃ P̂♮. The square-zero tangent comparison sends ker(A♮(k⊕M) →
A♮(k)) ≃ Lie(A♮) ⊗ M ≃ Hom_k(H,M) to the corresponding rigidified Ext class; at M = H it sends
id_H to the first logarithm class.

The first-logarithm API records three properties.

- The image of its extension class is id_H.
- Restriction to the unit has the specified splitting.
- Its comparison with P♮^(1) is horizontal and preserves the rigidification.

**Checks.**

- For A of dimension zero, H=0 and Log^(1)=O_A with its
  unique unit splitting; no positive-rank kernel may be inserted.
- For dim A>0, the extension maps to id_H≠0;
  its rigidified connection extension is nonsplit.
- The split connection O_A⊕π^*H maps to zero,
  so for dim A>0 it fails the defining identity-class condition.

([KS][KS], Theorem 2.36, PDF pp.28–29).

*Needs:* [P3](#layer-p3-logarithm-and-smooth-realizations), Square-zero deformation and the
logarithm class; [P2](#layer-p2-completed-poincaré-bundles), Poincaré comultiplication and symmetric
levels.

### P3.4 Smooth tensor model and Dolbeault resolutions

Over ℂ, with ℂ-bases (ū_1, …, ū_d, u_1, …, u_d) of ℋ ≅ conj(Lie(𝒜/ℂ)) ⊕ Lie(𝒜/ℂ) corresponding
to ∂/∂z̄_i, ∂/∂z_i (the differential forms are the dual basis) (Definition 3.3), ν = `ν^{1,0}` +
`ν^{0,1}` ∈ ℋ ⊗ (ω ⊕ ω̄) the identity (Definition 3.2), and the smooth pro-bundles `𝒫^{(n)}`,
`𝒫^{♮(n)}` ⊗ 𝒞^∞ (Notation 3.4): there is a compatible system of horizontal isomorphisms
`(𝒫^{♮(n)}, ∇_{𝒞^∞}) ≅ (⊕_{k≤n} TSym^k(ℋ), d + ν)` restricting to `𝒫^{(n)} ≅ ⊕_{k≤n} TSym^k(ℋ(Σ̄))`
and compatible with the moment map along e. Corollary 3.6: `𝒫^{(n),an}[0] ≅ (𝒫^{(n)} ⊗ ℰ^{0,•}, ∇″)` and `(𝒫^{(n),an} ⊗ Ω^p)[0] ≅ (𝒫^{(n)} ⊗ ℰ^{p,•}, ∇″)` (Dolbeault resolutions).

([KS][KS], Definition 3.3, Theorem 3.5 and Corollary 3.6, PDF pp.31–33).

*Needs:* [P3](#layer-p3-logarithm-and-smooth-realizations), The smooth d+ν connection;
[P3](#layer-p3-logarithm-and-smooth-realizations), Comparison with the logarithm sheaf;
**ComplexComparisonPartII**, C1.1 `localDolbeault`.

### P3.5 Construction requirements

Use the square-zero tangent functor of A♮ to construct the rigidified connection extension.
Verify the sign and identity class in the local-to-global Ext sequence rather than identifying
abstract vector spaces alone. Propagate the first-level comparison through factorial-invertible
symmetric powers and their transition maps. In the complex model the chosen H-basis consists of
tangent vectors; forms belong to the dual basis. Compute both Hodge components of the identity
tensor ν and show that ∇″ preserves the ordinary Poincaré subbundle. The bundle-valued ∂̄
Poincaré lemma from C1.1 and analytic-bundle carriers from C0 then give the Dolbeault
quasi-isomorphisms. Kings–Sprang, Theorem 2.36 and equations (2.7.1)–(2.7.2), pp.28–29, and
Theorem 3.5/Corollary 3.6, pp.31–33, fix these comparison requirements.

### Examples

In positive dimension the first extension has image id_H≠0, whereas the split connection extension has image zero (KS (2.7.2)).

### Dependencies

P0 shuffle tensors, P1 universal connections and P2 finite coefficients precede the identity extension and its smooth tensor model. AbelianSchemesAndArithmeticModuli A5 and ComplexComparisonPartII C0,C1.1 supply the analytic and Dolbeault carriers.

## Layer P4: Ordinary CM formal trivializations

The integral statement is obtained from the connected ordinary CM torsion and a dual-étale
splitting. Base change is completed before taking the formal coefficient limit. The moment maps
are injective integrally and become isomorphisms on the generic fibre; the projected connection
and translation diagrams retain that distinction.

### P4.1 Ordinary CM completion and completed base change

Start with the noetherian CM model (A/R,Σ,ω(A),ω(A∨),x) of Notation 5.1: Frac(R) is a number
field containing L^Gal, p is prime and not a unit in R, d_L is a unit, Σ_p and conjugate Σ_p are
disjoint, and x is killed by an ideal prime to p. Fix the indicated map R→O_Cp, base change and
complete. The connected ordinary kernels are compared with unit thickenings modulo p^r
before a p-adic inverse limit; no noetherian assertion about O_Cp is used.

([KS][KS], Notation 5.1 and Proposition 5.9, PDF pp.55–56,59–60).

*Needs:* **AbelianSchemesAndArithmeticModuli**, A4;
**FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.1.

### P4.2 Ordinary infinitesimal trivialization and projected connection

In the ordinary CM setting over O_Cp, let C_n=A[𝔭_Σ^n] and r≥1.
- over O_Cp/p^r the C_n and the
unit-ideal thickenings of A are cofinal as formal functors on nilpotent
unit neighbourhoods. For each finite C_n, its unit ideal is nilpotent after
reduction modulo p^r; conversely every fixed unit thickening is killed by
some connected CM power over that base. Dual étaleness of [𝔭_Σ^n] permits
the diagonal torsion splitting over A×C_n. Construct the resulting compatible splittings modulo
p^r and their inverse limit in r, including its comparison with the p-adically completed unit-completed
coefficient sheaf. Thus P̂ on the p-adic formal unit neighbourhood has the
coefficient ring O_((A×A∨)^∧) with this double completion understood. The first levels become O_Â ⊗ (O_Cp ⊕ ω_A∨) and O_Â ⊗
(O_Cp ⊕ H). Moments give integral injections into the corresponding completed invariant-tensor
coefficient modules. On the Cp generic fibre these are isomorphisms; on that fibre construct the
Hodge retraction r of i : P̂ → P̂♮ and show that r ∇ i becomes the ordinary differential on the
formal coefficient ring. The [p]_# calculation eliminates the unwanted Hodge component; the
symbol for the retraction is distinct from the prime p.

**Checks.**

- In the multiplicative formal group over
  O_Cp[ε]/(ε²), 1+ε belongs to the unit completion but
  `[p^n](1+ε)=1+p^nε≠1` for every n. The torsion union over O_Cp is smaller.
- Modulo p^r the same point is killed by p^r. In d multiplicative formal
  coordinates a unit thickening with nilpotent ideal J is killed by a
  sufficiently large p-power: coefficients of low-degree terms vanish
  modulo p^r and high-degree terms vanish by nilpotence of J.
- For a fixed C_n, modulo p its coordinate augmentation ideal is nilpotent;
  lifting through the nilpotent ideal (p)/(p^r) makes it nilpotent modulo
  p^r. This is the reverse cofinality and applies at p=2 as well.

([KS][KS], Proposition 5.9, equations(5.2.1)–(5.2.4), Lemma 5.11,
PDF pp.59–61 (KS line 2783); the modulo-p^r cofinality specifies the
formal-topology interpretation needed for the compatible p-adic limit).

*Needs:* [P4](#layer-p4-ordinary-cm-formal-trivializations), Ordinary CM completion and completed
base change; [P2](#layer-p2-completed-poincaré-bundles), Canonical torsion splittings and moments;
[P1](#layer-p1-universal-vector-extensions), Connection and cotangent notation;
[P2](#layer-p2-completed-poincaré-bundles), Poincaré comultiplication and symmetric levels.

### P4.3 Torsion translations of the ordinary trivialization

For y ∈ `𝒜(𝒪_{ℂ_p})` in the kernel of an isogeny φ with étale dual, T_y^*𝒫̂ ≅ 𝒫̂ (always on the
generic fibre; Lemma 5.12), and ϱ̂_y : `T_y^*𝒫̂|_{𝒜̂}` ≅ `𝒫̂|_{𝒜̂}` ≅ `𝒪_{(𝒜×𝒜^∨)^∧}` (Definition
5.13). Lemma 5.14: (1) `mom_{Â^∨}` ∘ e^*ϱ̂_y = `mom_{Â^∨}` ∘ ϱ_y = ϱmom_y; (2) on the Cp generic fibre, ϱ̂_y ∘ r ∘ ∇ ∘ i =
d_Â ∘ ϱ̂_y; (3) for s ∈ `𝒜̂[p^n](𝒪_{ℂ_p})` = `𝒜[𝔭_Σ^n](𝒪_{ℂ_p})`, translation by s intertwines ϱ̂_y
and `ϱ̂_{y+s}` with (T_s × id)^* (integrally). Integral translation assumes y killed by an isogeny
with étale dual; the generic-fibre extension here is for torsion y, not for every point.
Retain moment compatibility, compatibility with the projected connection, and connected-torsion
translation as separate assertions; r is the generic-fibre Hodge retraction of P4.2.

([KS][KS], Lemmas 5.12/5.14 and Definition 5.13, PDF pp.62–63).

*Needs:* [P4](#layer-p4-ordinary-cm-formal-trivializations), Ordinary infinitesimal trivialization
and projected connection; [P2](#layer-p2-completed-poincaré-bundles), Canonical torsion splittings and
moments.

### P4.4 Construction requirements

Prove the cofinality modulo each p^r, take inverse limits of coordinate rings
there, and then the compatible inverse limit in r. The torsion union over
O_Cp itself is not identified with the unit-completion functor. Prove the completed
base-change comparison from the chosen noetherian model to O_Cp; ordinary tensoring need not
commute with the limit. Apply the splitting principle to the diagonal section over each C_n and
pass to the compatible limit. On the generic fibre use factorial invertibility, the ordinary
Hodge splitting and the algebraic computation with [p]_# to eliminate the unwanted connection
component. Use a distinct name for the Hodge retraction and for the rational prime p. For a
torsion translation, compare the moment-composed splitting at the unit, the projected
differential and the connected-torsion translation action separately. Kings–Sprang, Proposition
5.9, equations (5.2.1)–(5.2.5), Lemmas 5.11–5.14 and Definition 5.13, pp.59–63, give the three
compatibility diagrams.

### Examples

For 1+ε in the multiplicative formal group, [p^n](1+ε)=1+p^nε. It is never torsion over characteristic-zero dual numbers, but is killed modulo p^r for n≥r (KS Proposition 5.9, formal-topology interpretation).

### Dependencies

AbelianSchemesAndArithmeticModuli A4 and FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 supply ordinary CM torsion. P1–P2 supply moments, dual-étale splitting and connection coefficients. Cofinality modulo p^r and completed base change precede the inverse-limit trivialization and translation maps.

## Layer B0: Period coordinates and Betti maps

Choose a symplectic period frame on a simply connected analytic neighbourhood of the smooth
complex base. Construct the inverse period parametrization as a real analytic torus
trivialization. The Betti projection, its integral frame transitions and its holomorphic leaves
then become intrinsic interfaces.

### B0.1 Period-coordinate trivializations

For a polarized abelian scheme A→S of relative dimension g over a smooth irreducible
quasi-projective complex variety S, choose connected simply connected U⊂S^an and a symplectic
lattice frame of polarization type D=diag(d₁,…,d_g). Its period matrix Z gives
(a,b,s)↦(Da+Z(s)b,s), and the inverse induces (b_U,π):A_U^an≃(R/Z)^(2g)×U as real analytic
manifolds. b_U alone is projection to the torus.

- b_U is the torus-coordinate projection, excluding the base coordinate.

- The restriction b_U:A_s^an→(R/Z)^(2g) is an analytic group isomorphism.

- For fixed torus coordinate β, s↦(b_U,π)^−1(β,s) is holomorphic.

- Two choices on connected U differ by a constant element of GL_(2g)(Z); these are automorphisms, not arbitrary endomorphisms.

**Checks.**

- Over a point the torus-coordinate map is the imported complex
uniformization expressed in real period coordinates.
- The zero section has Betti coordinate zero.
- On a constant family over a positive-dimensional U, db_U
annihilates the base directions although d(b_U,π) is invertible.

([DGH][DGH], Proposition 2.1 and PropositionB.2 proof, PDF pp.8–9,41–42).

*Needs:* **AbelianSchemesAndArithmeticModuli**, A5; `AddCircle`; **PELModuli**, M3.5–M3.6 and M5;
**ComplexComparisonPartII**, C0.

### B0.2 Birational invariance of generic Betti rank

A birational base change between irreducible complex bases identifies generic real Betti rank on
the corresponding dominating subvarieties.

([DGH][DGH], LemmaB.3, PDF pp.42–43).

*Needs:* [B0](#layer-b0-period-coordinates-and-betti-maps), Period-coordinate trivializations.

### B0.3 Construction requirements

Build the relative period chart on the imported complex abelian-family carrier, using A5, C0 and
the moduli uniformizations M3.5–M3.6. Prove that the combined map (b_U,π) is invertible while b_U
alone forgets the base coordinate. Check the polarization matrix in the lattice and torus
coordinates. Birational rank invariance is proved on the common dense open where the maps agree;
no rank statement is propagated across exceptional loci.

### Examples

In a constant family, the combined period chart is invertible but its Betti projection kills all base tangent vectors (DGH Proposition 2.1).

### Dependencies

AbelianSchemesAndArithmeticModuli A5, PELModuli M3.5–M3.6,M5 and ComplexComparisonPartII C0 supply period and analytic carriers; the frame-change theorem precedes intrinsic generic-rank invariance.

## Layer B1: Betti forms and non-degeneracy

Compute the Betti form in a period chart, descend it through the arithmetic action and pull it
back to the family. The central lemma identifies its pointwise kernel with the kernel of the
Betti differential. Closedness, positivity and multiplication are properties of this one form,
with a fixed factor-two normalization.

### B1.1 The descended Betti form

For a principal polarization upstairs on C^g×H_g set Y=Im Z and ω_hat=i∂∂bar(2(Im w)^tY^−1(Im
w)). In real coordinates w=a+Zb it equals 2∑ da_j∧db_j. It descends under the arithmetic
semidirect action to the universal family and pulls back to A/S. For type D, in coordinates
w=Da+Zb, the same calculation gives ω=2∑ d_j da_j∧db_j. On each fibre this is twice the
translation-invariant form representing the polarization class; retain this factor-two
normalization.

- The form on A is the pullback of the universal Betti form in the chosen polarization type.

- dω=0 and ω has type (1,1).

- ω is semipositive on each complex tangent space.

- For every N∈Z, [N]^*ω=N²ω.

**Checks.**

- For w=a+τb, the principal elliptic Betti form is 2 da∧db.
- [0]^*ω=0, while [−1]^*ω=ω.
- On a single fibre, with the factor-two normalization, ω is twice the
translation-invariant positive (1,1) form representing the principal polarization class.
- For polarization type diag(1,2), in the corresponding period
coordinates the two coordinate real two-tori have ω-periods 2 and 4; replacing D by the identity
fails.

([DGH][DGH], Lemmas 2.3, 2.4 and 2.6, Corollary 2.5, PDF pp.9–11).

*Needs:* [B0](#layer-b0-period-coordinates-and-betti-maps), Period-coordinate trivializations.

### B1.2 Pointwise kernel and rank identity

At a smooth point x of a complex subvariety X, ker(ω|T_xX)=ker(db_U|T_xX), and the real rank of
db_U is the rank of the restricted alternating form. Thus ω^dim_CX is nonzero exactly when
rank_R db_U=2 dim_CX.

([DGH][DGH], Equation(2.1) and Proposition 2.7, PDF pp.9–12).

*Needs:* [B1](#layer-b1-betti-forms-and-non-degeneracy), The descended Betti form.

### B1.3 Non-degenerate subvarieties

For a polarized abelian scheme A→S over an irreducible quasi-projective complex variety, an
irreducible X⊂A is non-degenerate if there are a Betti neighborhood U⊂(S^sm)^an and x∈X^sm∩A_U
with rank_R(db_U|X)_x=2 dim_C X. Equivalently the top restricted Betti form is nonzero somewhere
on this regular-base locus. The dimension is total complex dimension, including base directions.
For Qbar varieties use the fixed embedding into C. No condition is inferred for a subvariety
entirely over the singular locus from a nonexistent manifold trivialization there.

- Non-degeneracy holds exactly when generic real Betti rank equals twice total complex dimension.

- Non-degeneracy holds exactly when ω^dim_CX is nonzero on X^sm.

- A non-degenerate X has a smooth nonvanishing point over a smooth point of π(X).

**Checks.**

- Every irreducible subvariety of a single polarized abelian
variety over a point is non-degenerate.
- For an elliptic family E over a curve, Δ(E)⊂E×_S E has dim_C=2 and
real Betti rank≤2, so is degenerate.
- A torsion section over a positive-dimensional base has locally
constant Betti coordinates and is degenerate.

([DGH][DGH], Definition 1.5 and DefinitionB.4, PDF pp.5,43).

*Needs:* [B0](#layer-b0-period-coordinates-and-betti-maps), Period-coordinate trivializations;
[B1](#layer-b1-betti-forms-and-non-degeneracy), Pointwise kernel and rank identity.

### B1.4 Betti-form criterion for maximal rank

Let A → S be a principally polarized abelian scheme over a smooth irreducible complex
quasi-projective variety, equipped with symplectic level-ℓ structure for some ℓ ≥ 3. Let X ⊆ A
be irreducible of dimension d and Δ ⊆ S^an a nonempty open Betti domain meeting X^sm. Then the
restricted top wedge ω^d is not identically zero on X^sm if and only if the maximum real rank of
d(b_Δ|X^sm) on X^sm ∩ A_Δ equals 2d. On the universal family this is the same criterion with the
universal form; the family statement is obtained by pullback.

([DGH][DGH], Proposition 2.2(iii), Proposition 2.7 and equations(2.5)–(2.7), PDF
pp.8,11–13).

*Needs:* [B1](#layer-b1-betti-forms-and-non-degeneracy), Pointwise kernel and rank identity;
[B1](#layer-b1-betti-forms-and-non-degeneracy), Non-degenerate subvarieties.

### B1.5 Non-vanishing of the top power of the Betti form on a non-degenerate subvariety

Let X⊂A→S be non-degenerate in the regular-base sense of Definition B.4. Then there is z∈X^sm(C)
over S^sm with (ω|_X)^(∧dim_C X)_z≠0. One may also choose π(z) in the regular locus of the
reduced closure of π(X). The latter choice uses that X dominates this image and the maximal-rank
locus meets its dense open preimage.

([GGK][GGK], Proposition 5.2 proof, Step 1, equation(5.4), printed pp.212–213 (PDF
pp.25–26)).

*Needs:* [B1](#layer-b1-betti-forms-and-non-degeneracy), Pointwise kernel and rank identity;
[B1](#layer-b1-betti-forms-and-non-degeneracy), Non-degenerate subvarieties.

### B1.6 Construction requirements

Use Y = Im Z > 0 in the Hessian calculation. Its null directions satisfy dw − dZ·b = D da + Z db
= 0, which is equivalent to da = db = 0. Restrict this positive Hermitian form to the complex
tangent space of X to obtain the real rank equality and wedge criterion. Use real analyticity
and the identity theorem on the regular locus to pass from one nonzero top wedge to generic
maximal rank. Keep the regular-base restriction when selecting a full-rank smooth point. DGH,
Lemmas 2.3, 2.4 and 2.6, Corollary 2.5 and Proposition 2.7, pp.9–12, provide the local computations and generic-rank
argument.

### Examples

For type diag(1,2), the two real coordinate tori have form periods 2 and 4. A positive-dimensional torsion section has Betti rank zero (DGH §2).

### Dependencies

B0 supplies real period coordinates and frame changes; DifferentialGeometry Layers 0–1 supplies forms and exterior derivatives. The Hessian computation precedes kernel equality, rank, non-degeneracy and full-rank point selection.

## Layer B2: Curve monodromy and constant traces

The curve argument combines local Betti leaves, monodromy and the constant trace. Construct
trace functors and closed torus characters before using definability. Keep actual and geometric
traces separate, and use the fixed-part theorem only with an equivariant Hodge morphism.

### B2.1 Degeneracy over a curve

For an irreducible closed subvariety Y⊂A over a smooth irreducible complex curve S, a smooth
point x∈Y^sm∩A_U is degenerate when it is not isolated in the local fibre of b_U restricted to
Y^sm∩A_U. Y is curve-degenerate when these points contain a nonempty relatively open subset of
this smooth locus. The vertical case is included in this definition; any curve-degenerate Y
necessarily dominates S.

- DegenerateAt(x) iff x is nonisolated in its local Betti fibre.

- CurveDegenerate(Y) iff a nonempty open subset of Y consists of degenerate points.

- On the smooth generic constant-rank locus curve degeneracy is the failure of the total-dimension Betti rank criterion.

**Checks.**

- A torsion section over a curve is curve-degenerate.
- A smooth subvariety contained in one fibre has isolated local Betti
fibres and is not curve-degenerate.
- A constant abelian family over a curve is curve-degenerate,
despite positive definite form on each individual fibre.

([GH][GH], §5 definition and Lemma 6.2, PDF pp.18,31).

*Needs:* [B0](#layer-b0-period-coordinates-and-betti-maps), Period-coordinate trivializations;
[B1](#layer-b1-betti-forms-and-non-degeneracy), Non-degenerate subvarieties.

### B2.2 Function-field trace and constant part

For an algebraically closed field k of characteristic zero, a smooth irreducible
curve S/k, K=k(S) and an abelian variety A/K, a k-trace is an abelian variety
T/k with a K-homomorphism
τ:T_K→A universal among maps from constant abelian varieties. In characteristic zero τ has
finite kernel. Its image has a complementary abelian subvariety up to isogeny by imported
Poincaré reducibility. For k=ℂ, universal equivariant Hodge-Hom detects this trace.
Also construct the trace over Kbar/k for a chosen algebraic closure Kbar of K. The latter is the
geometric trace used in Definition 1.2; it can grow after finite extension and is not identified
with the K/k trace without an explicit descent argument.

- τ:T_K→A is the universal homomorphism from the constant trace.

- For every B/k, Hom_k(B,T)→Hom_K(B_K,A), f↦τ∘f_K, is a bijection.

- In characteristic zero there is an abelian complement B and a K-isogeny T_K×B→A.

**Checks.**

- The k-trace of a constant B_K is B with identity map.
- The zero abelian variety has zero trace.
- For a non-isotrivial elliptic variety over C(S), the trace
is zero even though its complex fibres are nonzero elliptic curves.

([ConradTrace][ConradTrace], Definition 6.1 and Theorems 6.2, 6.4,
author version pp.20–21 (ConradTrace line 966, ConradTrace line 1007);
[GH][GH], Lemma 5.6 and §5.4, PDF pp.25,28–29 for the complex application).

*Needs:* **AbelianSchemesAndArithmeticModuli**, A6.5 `poincareReducibility`.

### B2.3 Uniform torsion closures and Lang–Néron modulo trace

Prove uniform Manin–Mumford in families: for an abelian variety A over an algebraically closed field Ω of characteristic zero, an irreducible quasi-projective Ω-variety V and an irreducible closed Y⊂V×A, there are a finite family of abelian subvarieties B_i⊂A and D≥0 such that, for every v∈V(Ω), the Zariski closure of the torsion points in Y_v is a union of at most D torsion translates of members of that family, including empty fibres; the requirement includes the characteristic-zero Manin–Mumford theorem and its uniform-family proof ([GH][GH], Theorem 3.2, PDF p.13; GH line 546).

Prove Lang–Néron modulo trace: for every finitely generated regular extension K/k of fields, in any characteristic, and abelian variety A/K with K/k-trace (T,τ), the group A(K)/τ(T(k)) is finitely generated; also supply its bounded-degree torsion consequence over curve fields: if k is algebraically closed of characteristic zero, K=k(S) for a smooth irreducible curve, A/K has zero geometric trace and D≥1, then the orders of P∈A(Kbar)_tors with [K(P):K]≤D are bounded in terms of A and D, using the finiteness of finite étale covers of bounded degree of the good-reduction open curve ([ConradTrace][ConradTrace], Theorem 7.1, author version p.23, ConradTrace line 1079; [GH][GH], Proposition 3.1 proof, PDF pp.14–15, GH line 610).

Construct the trace over any regular finitely generated extension as the universal map from
constant abelian varieties, compatible with scalar extension and towers; B2's function-field
trace is its curve-field specialization. The proof of finite generation includes the reduction
to algebraically closed constants and a curve field, bounded section graphs modulo trace,
finite prime-to-characteristic Kummer quotients, and descent in the trace quotient
(ConradTrace, Theorem 7.1 and Lemmas 7.3–7.5, pp.23–27). In characteristic zero, obtain uniform
torsion closures by Manin–Mumford and parameter-uniformity for algebraic families, including a
uniform bound on fibre components and the finite set of abelian-subvariety directions (GH,
Theorem 3.2 proof, p.13). Prove the bounded-degree torsion assertion using the good-reduction curve's
finitely many finite étale covers of bounded degree and Lang–Néron on each cover. These are
proof obligations here, with no restriction to one fixed fibre or one bounded-degree level.

**Checks.**

- An empty fibre has empty torsion closure; the family V×A has closure A in every fibre,
  with D=1 and the single direction A.
- For V×{P}, torsion P gives the singleton closure and non-torsion P gives the empty closure;
  arbitrary translates would incorrectly include the latter.
- For K=k the trace is A and the quotient is zero, including when A(k) is not finitely generated.
- For A=0 the trace and quotient vanish; for a geometrically trace-free curve-field variety,
  D=1 gives finite rational torsion, while higher D requires the cover argument.

*Needs:* B2, Function-field trace and constant part; AbelianSchemesAndArithmeticModuli A3,
A6.5 and A6.7; SchemeAndStackFoundations §§2.11,2.16 and algebraic Hom/Hilbert families.

### B2.4 Polarized fixed parts and equivariant Hodge Hom

For polarized torsion-free integral variations arising from smooth proper
complex algebraic families over a smooth connected quasi-projective base S,
prove that the invariant rational local system is a constant Hodge subvariation,
with its induced integral lattice. Prove separately that the rational monodromy
representation is semisimple and that the identity component G⁰ of its algebraic
Zariski-closure group is semisimple. The group assertion uses the smooth proper
geometric origin (Deligne, Corollary 4.1.2, Theorem 4.2.6 and Corollary 4.2.9(a),
printed pp.42,45,48; Deligne line 1377, Deligne line 1498, Deligne line 1610).

For an abelian scheme, after any connected finite étale cover of S, construct
the abelian realization of this constant weight −1 subvariation and identify
its inclusion, up to isogeny, with the constant part supplied by the C(S)/C
trace. The adapter takes the invariant homology Hodge substructure to a constant
abelian variety T and its inclusion into the family; it agrees on homology with
the invariant inclusion and on the generic fibre with the trace map up to
isogeny. Use ShimuraVarieties §5.2's algebraic Hodge–Hom correspondence to obtain
this map and its uniqueness, and the trace universal property for the generic
identification (Deligne, Rappel 4.4.3, printed p.51, Deligne line 1698).

**Checks.**

- A constant dimension-g family has fixed homology ℤ^(2g), constant part of
  dimension g, and G⁰=1, a semisimple group of dimension zero.
- Zero invariant rational homology gives a dimension-zero constant part.
- For monodromy −I on rank-two homology, invariants are 0; on the double cover
  killing it they are ℤ². The constant part is computed on that cover.
- The cyclic subgroup generated by [[2,1],[1,1]] has eigenvalues (3±√5)/2 and
  semisimple rational representation, but its connected closure is a
  one-dimensional torus. Representation semisimplicity alone cannot replace
  the geometric group assertion.
- Multiplication by 2 on a constant elliptic family acts as 2I on H₁; the
  rational map (1/2)I is only a quasi-homomorphism, fixing integral versus
  rational Hom in the imported comparison.

*Needs:* Completed/HodgeStructures L0–L3; ShimuraVarieties §3.5b.1's variation
carrier and §5.2 `TauCeti.Shimura.weight_one_algebraization`;
AbelianSchemesAndArithmeticModuli A5.5–A5.6 and A6.25; B2.2–B2.3's trace universal
property for regular finitely generated function fields, for the abelian
constant-part adapter.

### B2.5 Integer characters and countably many closed torus subgroups

Use the native real torus Tⁿ=`Fin n → AddCircle (1 : ℝ)`. Its integer characters are
χ_m(x)=∑_i m_i • x_i, and the annihilator of H is the subgroup of weights
whose characters vanish on every x∈H. Prove integer-character separation and countability:
every closed subgroup H of (R/Z)^n is the intersection of kernels of integer characters in its
annihilator L⊂Z^n. Since subgroups of Z^n are finitely generated, there are countably many such
H. L need not be saturated: H may be disconnected.

The character API is evaluation, addition in either variable and continuity;
the annihilator API is membership, reversal of inclusions and the character
kernel intersection. These use the native subgroup operations.

**Checks.**

- The weights (1,−1) on (a,b) give a−b, fixing the character convention;
  the zero weight pairs to zero even for n=0.
- The trivial subgroup has annihilator ℤⁿ, including n=0; a zero annihilator would reverse the duality.
- The whole torus has annihilator {0}; nonzero weights do not vanish everywhere.
- The subgroup generated by 1/2 in the circle
  has annihilator 2ℤ. It is nonsaturated, so a connected-only construction
  fails this Check.

([GH][GH], Lemma 5.2/Proposition 5.3 proofs, PDF pp.20–22).

*Needs:* `AddCircle`.

### B2.6 Semirational block counting

Prove the semirational block-counting theorem for a definable family Z ⊂ ℝʳ×ℝᵃ×ℝᵇ in a fixed
o-minimal expansion of the real field. Let π₁,π₂ be the projections of each fibre Z_t to
ℝᵃ and ℝᵇ. For every ε>0 there is c_ε>0, uniform in t and T≥1, such that: if a finite set
Σ ⊂ {z∈Z_t : π₁(z)∈ℚᵃ, H(π₁(z))≤T} and #π₂(Σ)>c_ε T^ε, there exists a continuous
definable γ:[0,1]→Z_t whose π₁ projection is semialgebraic and real analytic on (0,1),
whose π₂ projection is nonconstant, with π₂(γ(0))∈π₂(Σ). Also construct the parameter-uniform
block decomposition that yields this corollary, with the rational-coordinate height bound
only in ℝᵃ; no rationality or height restriction is put on ℝᵇ. Use the maximum multiplicative
height of the rational coordinates, with height at least one. In B2’s affine incidence relation
y=γx−a, the unrestricted y is then also semialgebraic and becomes real analytic after
restriction to an interval; no analytic second projection is required for an arbitrary
o-minimal family (GH, Lemma 5.2 proof, PDF
pp.19–20, GH line 931 and GH line 953; Gao–Ax, Theorem 5.2 proof, PDF pp.17–19).

**Checks.**

- The graph y=αx with irrational α has rational first coordinates and generally irrational
  second coordinates; requiring both coordinates rational loses the intended points.
- A singleton fibre gives at most one point and no nonconstant arc.
- For Z={0}×[0,1], the first projection of the resulting arc is constant and semialgebraic,
  while the second must be nonconstant; demanding variation in the rational coordinates is wrong.

*Needs:* ShimuraVarieties §3.5a, o-minimal definable sets, dimension and cell decomposition.

### B2.7 Free matrix word growth at bounded height

Let Γ⊂GL_n(Z) be freely generated by two matrices. Fix c>1 bounding the submultiplicative norms
of both generators and both inverses. There are at least 2^k distinct Γ matrices of norm at most
c^k, so for sufficiently large T there are at least C T^(log2/logc) matrices of norm at most T
for some C>0. This counts matrices; distinct orbit points require the separate collision
argument.

([GH][GH], Lemma 5.2 proof, PDF pp.19–20).

*Needs:* `FreeGroup`; `FreeGroup.lift`; `Matrix.GeneralLinearGroup`.

### B2.8 Tits: free subgroups of linear groups

A subgroup of GL_n over a field of characteristic 0 that is not virtually solvable contains a
free subgroup on two generators; in particular a Zariski-dense subgroup of a non-trivial
connected semisimple group does.

([Tits][Tits], Theorem 1, printed p.250, for the characteristic-zero alternative,
and Theorem 3, printed p.251, for dense semisimple groups;
[GH][GH], Lemma 5.5, PDF p.25, for the monodromy application).

*Needs:* `Matrix.GeneralLinearGroup`; `Subgroup.FiniteIndex`; `Group.IsSolvable`; `FreeGroup`.

### B2.9 Invariance of domain in equal real dimension

For every finite m≥0, a continuous injective map f:U→ℝ^m from an open
subset U⊆ℝ^m is an open embedding. Consequently continuous injections between
boundaryless real m-manifolds are open embeddings, by restriction to charts.
The local assertion requires no global separation or countability assumption.
State the general theorem on Mathlib's native Euclidean spaces and
`Topology.IsOpenEmbedding` in the shared topology API.

For m≥1, restrict f around each point to a closed ball contained in U and
include the target ℝ^m into S^m by stereographic compactification. Compactness
makes the restrictions to the ball and its boundary embeddings. The embedded
boundary has a complement with two path components. The complement of the
embedded ball is nonempty, since it contains infinity, and is path connected:
its reduced degree-zero homology with ℚ coefficients vanishes.
The image of the ball's interior is path connected, so these two sets are
exactly the two path components of the boundary complement. They are open
because that complement is locally path connected. Thus every f(x) has a
neighbourhood contained in f(U). Apply the same argument to each open subset
of U and obtain the open embedding with
`Topology.IsOpenEmbedding.of_continuous_injective_isOpenMap`. For m=0 the
source is empty or a point (Hatcher, Theorem 2B.3, printed p.172;
[GH][GH], Theorem 5.1 proof, PDF p.29, for the application).

**Checks.**

- For m=0 the possible images are ∅ and the one-point space ℝ⁰, both open;
  the empty open domain also has open image in every dimension.
- For m=1, x↦x³ maps (−1,1) homeomorphically onto (−1,1), although its
  derivative at 0 is 0. A nonzero-derivative hypothesis would lose this case.
- On (−1,1), x↦x² has image [0,1), which is not open in ℝ; its equal values
  at 1/2 and −1/2 show why injectivity is required.
- The inclusion [0,1)→ℝ has nonopen image, and x↦(x,0) maps ℝ into a line
  with empty interior in ℝ². These exclude domains with boundary and unequal
  real dimensions from the assertion.

*Needs:* the sphere- and closed-ball-complement theorems in the Tau Ceti
supplier contract, including its reduced degree-zero homology comparison;
Mathlib `stereographic'`, `stereographic'_source` and `stereographic'_target` in
`Mathlib/Geometry/Manifold/Instances/Sphere.lean`,
`Continuous.isClosedEmbedding` in `Mathlib/Topology/Separation/Hausdorff.lean`,
and `IsOpen.pathComponentIn` in
`Mathlib/Topology/Connected/LocallyPathConnected.lean` for open path components;
`Topology.IsOpenEmbedding.of_continuous_injective_isOpenMap` in
`Mathlib/Topology/Maps/Basic.lean`. The chartwise manifold consequence uses
only the Euclidean theorem and chart homeomorphisms.

### B2.10 Real constant-rank theorem for Betti fibres

Consume the smooth local normal form and level-fibre API from LieGroupoidsPoisson
G0.1. Extend that result here to each finite k≥1 and to real-analytic regularity:
for an open U⊆ℝ^m, a C^k map f:U→ℝ^n of constant differential rank r has local
C^k coordinate isomorphisms putting f in the form (u,v)↦(u,0). Its nonempty local
fibres have dimension m−r and tangent space ker df. The extension includes
restriction, chart changes and the local map-into-the-fibre universal property.
On finite-dimensional boundaryless manifolds it is transported through C^k
charts; no Hausdorff hypothesis is needed for this local assertion.

Choose an invertible r×r minor, apply the inverse function theorem to the first
r component functions together with the remaining domain coordinates, and use
constant rank to make the remaining target functions independent of v. The
coordinate construction and its inverse retain the given regularity. For a
smooth f, the finite-k structures agree with the C^k structure obtained by
forgetting smooth regularity from G0.1's fibre, via the fibre universal property;
the real-analytic fibre has the same underlying smooth structure. Apply the analytic form to the Betti map
on the smooth maximal-rank locus, with m=2 dim X. The real/complex chart adapter
identifies T_xX as a real vector space of dimension 2 dim_ℂ X, without claiming
that the Betti map is holomorphic (GH, Lemma 6.2 proof, PDF p.31).

**Checks.**

- f(x,y)=(x,0) has rank 1, fibre dimension 1 and tangent kernel ℝ(0,1).
- A constant map ℝ²→ℝ has rank 0 and fibre dimension 2; identity on ℝ² has
  rank 2 and fibre dimension 0. Empty fibres assert no local chart.
- For f(x)=x² the rank is 0 at 0 and 1 nearby. No rank-zero neighbourhood
  exists there, so the constant-rank conclusion is inapplicable.
- The complex coordinate z=x+iy has real dimension 2; f(z)=Re z has rank 1
  and real fibre dimension 1, so complex-linear rank cannot be substituted.

*Needs:* LieGroupoidsPoisson G0.1; Mathlib `ContDiffAt.toOpenPartialHomeomorph`
and `ContDiffAt.to_localInverse` in
`Mathlib/Analysis/Calculus/InverseFunctionTheorem/ContDiff.lean` for the same
nonzero differentiability order, including analytic order; `fderiv`,
`LinearMap.range`, `Module.finrank`; B0's real-analytic Betti charts for the
application.

### B2.11 Good-cover refinement on a Riemann surface

Let S be a Hausdorff second-countable complex-analytic manifold of dimension one
(`IsManifold 𝓘(ℂ) ω S`). Refine a given open cover first by relatively compact
holomorphic coordinate neighbourhoods with bounded chart image. Choose a smooth
Riemannian metric using DifferentialGeometry 12.1 and apply
SmoothBundlesConnections B6.0 to the underlying real surface. Transport the
resulting locally finite subordinate good cover back through the complex/real
chart comparison. Metric existence, convexity and contractions of nonempty
finite intersections are the imported construction.

For every nonempty finite intersection W, choose a containing cover member's
holomorphic chart. Its image is a nonempty bounded simply connected open subset
of ℂ, so ConformalMapping L3 makes W biholomorphic to the unit disc; in
particular it is a topological open disc. The API gives the refinement map to
the original cover, relative compactness of each member, local finiteness,
intersection contractions and these disc charts (GH, §5.2, PDF p.22).

**Checks.**

- Two overlapping convex discs in a planar chart have a contractible lens;
  in the Euclidean metric H(t,z)=(1−t)q+tz stays in the lens and gives H(0,z)=q,
  H(1,z)=z. An empty intersection requires no base point or disc chart.
- The annulus 1<|z|<2 has fundamental group ℤ and is not itself a good-cover
  member; a coordinate neighbourhood alone does not imply contractibility.
- A compact surface has a finite refined cover, but each nonempty intersection
  still has bounded open chart image and hence is noncompact, rather than a sphere.

*Needs:* SmoothBundlesConnections B6.0's early metric good covers;
DifferentialGeometry 12.1's metric existence; ComplexManifolds Milestone 1's realification/chart comparison; ConformalMapping
L3's Riemann mapping theorem; `LocallyFinite` and `ContractibleSpace`.

### B2.12 Fixed homology and equivariant Hom

For an abelian scheme over a smooth irreducible complex algebraic curve, apply the fixed-part
theorem to its polarized integral homology variation of weight −1 (equivalently the dual
cohomology variation of weight +1). A nonzero integral homology class fixed by a finite-index
monodromy subgroup yields a nonzero constant part over the corresponding connected finite étale
cover. Use the equivariant Hodge-Hom comparison to algebraize the fixed substructure;
unrestricted Hom of a single Hodge fibre is insufficient.

([GH][GH], Lemma 5.6 proof, PDF p.25).

*Needs:* [B2](#layer-b2-curve-monodromy-and-constant-traces), Function-field trace and constant
part; B2, Polarized fixed parts and equivariant Hodge Hom; **AbelianSchemesAndArithmeticModuli**, A5.

### B2.13 Generically special subvarieties

For an algebraically closed field k of characteristic zero and an irreducible closed
Y⊂A dominating a smooth irreducible curve S/k, Y is GH generically special
if its geometric generic fibre is a finite union of τ(Z_Kbar)+B+t, where τ is the Kbar/k
geometric trace, Z is a closed irreducible subvariety of that constant trace over k, B is an
abelian subvariety of A_Kbar and t is torsion. A Gao special-generically subvariety in a complex family, used for
degeneracy loci, instead uses a constant section and an abelian subgroup, not a general constant
Z.

- Each geometric generic irreducible component has the stated constant-variety plus torsion-coset description.

- A constant subvariety of a constant abelian family is generically special.

- A torsion translate of an abelian subvariety is generically special.

**Checks.**

- A constant genus≥2 curve in its constant Jacobian is GH
generically special but is not itself a torsion coset.
- A torsion point of the geometric generic fibre gives a
generically special torsion multisection after closure; its generic fibre is zero-dimensional,
while its total dimension is one.
- For a constant family with identity trace, every subvariety
defined over C is supplied by the imported trace map.

([GH][GH], Definition 1.2, PDF pp.2–3).

*Needs:* [B2](#layer-b2-curve-monodromy-and-constant-traces), Function-field trace and constant
part.

### B2.14 Invariant definable sets of Ax-type

Its API is the defining arc implication, translation invariance and the torus-coset examples.

Let X ⊆ T^n be closed, definable and of Ax-type, and Γ ⊆ GL_n(ℤ) free on two generators with
γ(X) = X for all γ ∈ Γ. Then either X lies in a finite union of proper closed subgroups of T^n,
or there are a non-empty open U ⊆ X and a closed connected infinite subgroup G with U + G ⊆ X.
Here definable means that the lift X̃=exp⁻¹(X)∩[0,1]^n is definable in the fixed o-minimal
structure. Ax-type means that every continuous semialgebraic y:[0,1]→X̃, real analytic on (0,1),
has exp(y([0,1])) contained in exp(y(0))+G⊆X for some closed subgroup G.

**Checks.**

- A singleton has Ax-type: every arc in its lift is constant and G={0} works.
- A translate a+H of a closed connected real subtorus has Ax-type: every
  lifted arc maps into a+H and the same H supplies the required coset.
- The image of t↦(t,t²), 0≤t≤1/4, in (ℝ/ℤ)² is closed and definable but
  fails Ax-type. Its displayed lift is semialgebraic and analytic and is
  nonconstant. A positive-dimensional subgroup coset would give a line
  segment locally; a line with t² linear on an interval has second
  derivative both 2 and 0. A zero-dimensional compact subgroup is finite
  and cannot contain this arc, so no permitted G exists.

([GH][GH], Ax-type definition and Lemma 5.2, PDF pp.18–20).

*Needs:* [B2](#layer-b2-curve-monodromy-and-constant-traces), Free matrix word growth at bounded
height; [B2](#layer-b2-curve-monodromy-and-constant-traces), Integer characters and countably many
closed torus subgroups; B2, Semirational block counting.

### B2.15 Algebraic subvarieties and the abelian Ax theorem

Prove the abelian Ax–Lindemann input and its real-period adapter: for every complex abelian variety A of dimension g, a real-linear period identification b:A(ℂ)≃(ℝ/ℤ)^(2g), and closed algebraic Z⊂A, the lift of b(Z(ℂ)) to [0,1]^(2g) is definable in `R_an,exp`, and every continuous semialgebraic arc in this lift, real analytic on (0,1), maps into a coset b(z₀)+G contained in b(Z(ℂ)), for a closed subgroup G; prove the abelian Ax input independently of B3's mixed Ax–Schanuel conclusion ([GH][GH], Ax-type definition and Proposition 5.3 proof, PDF pp.18–21; GH line 1003). For a point G={0} works; for an abelian-subvariety coset its real subtorus works; the curved arc t↦(t,t²) from B2 fails the implication and cannot be such an algebraic Z under a period identification.

**Checks.**

- For a point, the zero subgroup supplies its constant arc.
- For an abelian-subvariety translate, its real subtorus supplies every arc.
- The parabola arc in the Ax-type construction is definable but has no such subgroup coset;
  the algebraicity hypothesis rules it out.

*Needs:* B2, Invariant definable sets of Ax-type (definition only); ShimuraVarieties §3.5a;
AbelianSchemesAndArithmeticModuli A5.1–A5.3; GH Proposition 5.3's abelian Ax input.

### B2.16 Transport along nonisolated Betti fibres

Let A→S be an abelian scheme of relative dimension g≥1 over a smooth irreducible complex
algebraic curve, and let Y⊂A be irreducible and closed. Glueing Betti maps along loops gives a
homomorphism ρ̃ : π₁(S^an, s) → {homeomorphic group automorphisms of 𝒜_s^an} with ρ̃(h)_* =
ρ(h), the monodromy on H₁(𝒜_s^an, ℤ). (i) If P ∈ Y^an over s is not isolated in its Betti fibre
in Y, then ρ̃(h)(P) ∈ Y^an for all h, and if P has order N then dim_P Y ∩ 𝒜[N] ≥ 1. (ii) ρ̃
commutes with homomorphisms of abelian schemes.

([GH][GH], Proposition 5.4 and proof, PDF pp.22–24).

*Needs:* [B0](#layer-b0-period-coordinates-and-betti-maps), Period-coordinate trivializations;
[B2](#layer-b2-curve-monodromy-and-constant-traces), Degeneracy over a curve;
[B2](#layer-b2-curve-monodromy-and-constant-traces), Good-cover refinement on a Riemann surface.

### B2.17 Free subgroups in curve monodromy

For an abelian scheme over a smooth irreducible complex algebraic curve, let Γ_s be its integral
H₁ monodromy image and G_s its Zariski closure over Q. If G_s⁰ is nontrivial, every finite-index
subgroup of Γ_s contains a free subgroup on two generators.

([GH][GH], Lemma 5.5, PDF p.25).

*Needs:* [B2](#layer-b2-curve-monodromy-and-constant-traces), Tits: free subgroups of linear groups;
B2.4's connected algebraic-monodromy-group semisimplicity from Deligne
Corollary 4.2.9(a); finite-index subgroups have the same connected Zariski closure.

### B2.18 Monodromy-invariant subvarieties of a fibre

Let A be a complex abelian variety and Γ ⊆ `GL_{2g}(ℤ)` act continuously on A^an via a Betti
isomorphism, of monodromy type (every abelian subvariety is Γ-stable), containing a free
subgroup of rank 2 and with no non-zero invariant vector in `ℤ^{2g}`. If Z ⊆ A is irreducible
closed with Γ(Z(ℂ)) = Z(ℂ), then Z lies in a proper torsion coset, or Z + B = Z for some abelian
subvariety B of positive dimension.

([GH][GH], Proposition 5.3 and proof, PDF pp.21–22).

*Needs:* [B2](#layer-b2-curve-monodromy-and-constant-traces), Integer characters and countably many
closed torus subgroups; [B2](#layer-b2-curve-monodromy-and-constant-traces), Invariant definable sets
of Ax-type; B2, Algebraic subvarieties and the abelian Ax theorem.

### B2.19 Invariant homology gives the function-field trace

For an abelian scheme A→S over a smooth irreducible complex algebraic curve, if H₁(A_s^an,Z) has
a nonzero monodromy-invariant element, the C(S)/C-trace of its generic fibre is nonzero over
C(S) itself.

([GH][GH], Lemma 5.6, PDF p.25).

*Needs:* [B2](#layer-b2-curve-monodromy-and-constant-traces), Fixed homology and equivariant Hom.

### B2.20 Virtually invariant subvarieties in kernels

Let A→S be an abelian scheme of relative dimension g≥1 over a smooth irreducible complex
algebraic curve. Let Y ⊆ 𝒜 be irreducible closed dominating S, virtually monodromy invariant
(some component of Y_s is ρ̃-stable under a finite-index subgroup) above every point of an
uncountable set of extendable points, and suppose the generic fibre of 𝒜 ×_S S′ has trivial
trace for every finite étale S′ → S. Then there is a homomorphism 𝒜 → 𝒞 of abelian schemes over
S whose kernel contains Y and has dimension dim Y. Here extendable means that every abelian
subvariety of A_s is the fibre of an abelian subscheme, understood as the image of an
endomorphism of A. All kernel dimensions in this assertion are total dimensions, including the
base.

([GH][GH], Extendability; Lemma 5.8 and proof, PDF pp.25–28).

*Needs:* [B2](#layer-b2-curve-monodromy-and-constant-traces), Fixed homology and equivariant Hom;
[B2](#layer-b2-curve-monodromy-and-constant-traces), Integer characters and countably many closed
torus subgroups; [B2](#layer-b2-curve-monodromy-and-constant-traces), Function-field trace and
constant part; [B2](#layer-b2-curve-monodromy-and-constant-traces), Monodromy-invariant subvarieties
of a fibre; [B2](#layer-b2-curve-monodromy-and-constant-traces), Transport along nonisolated Betti
fibres; [B2](#layer-b2-curve-monodromy-and-constant-traces), Free subgroups in curve monodromy;
[B2](#layer-b2-curve-monodromy-and-constant-traces), Invariant homology gives the function-field
trace.

### B2.21 Finitely many maximal GH generically special subvarieties

Prove finiteness of maximal GH generically special subvarieties. Let k be algebraically closed of
characteristic zero, S/k a smooth irreducible curve, A→S an abelian scheme of
constant relative dimension g≥1, and X⊂A irreducible closed dominating S.
There are finitely many maximal GH generically special subvarieties of A
contained in X. Their union is closed in X; its complement is empty exactly
when X is GH generically special.

For the trace-free reduction, prove the form of GH Proposition 3.1: put
K=k(S), choose Kbar, let V₀/k be irreducible quasi-projective, and let B/Kbar
be an abelian variety with zero Kbar/k-trace. For irreducible closed
Y⊂(V₀×_k Kbar)×B, density of V₀(k)×B(Kbar)_tors in Y implies
Y=(W₀×_k Kbar)×(t+C) for W₀⊂V₀ irreducible closed, t torsion and C⊂B
an abelian subvariety. Consequently Y contains finitely many maximal products
of this form. Apply this after an isogeny splitting off the geometric trace.
Uniform torsion closures and bounded-degree torsion in the trace-free quotient
are separate inputs to this argument.

**Checks.**

- For A=B₀×S and X=C₀×S, with C₀ any irreducible constant subvariety,
  the sole maximal special subvariety is X itself, even when C₀ has genus≥2.
  Restricting the constant factor to torsion cosets would fail.
- In a geometrically trace-free family, a torsion multisection X is its own
  sole maximal special subvariety; its generic dimension is zero and its
  total dimension is one.
- If X is a non-torsion section of a geometrically trace-free family, it
  contains no GH generically special subvariety dominating S, so its special
  union is empty. Allowing arbitrary translates would give the opposite answer.

([GH][GH], Propositions 1.3 and 3.1, PDF pp.3,12–15
(GH line 120, GH line 512)).

*Needs:* [B2](#layer-b2-curve-monodromy-and-constant-traces), Generically special subvarieties;
[B2](#layer-b2-curve-monodromy-and-constant-traces), Function-field trace and constant part;
AbelianSchemesAndArithmeticModuli A3; B2, Uniform torsion closures and Lang–Néron modulo trace.

### B2.22 Curve degeneracy implies GH generic specialness

For an abelian scheme over a smooth irreducible complex algebraic curve S, an irreducible closed
subvariety Y dominating S which is curve-degenerate is GH generically special.

([GH][GH], Theorem 5.1 and §5.4 proof, PDF pp.18,28–30).

*Needs:* [B2](#layer-b2-curve-monodromy-and-constant-traces), Degeneracy over a curve;
[B2](#layer-b2-curve-monodromy-and-constant-traces), Generically special subvarieties;
[B2](#layer-b2-curve-monodromy-and-constant-traces), Function-field trace and constant part;
[B2](#layer-b2-curve-monodromy-and-constant-traces), Virtually invariant subvarieties in kernels;
[B2](#layer-b2-curve-monodromy-and-constant-traces), Finitely many maximal GH generically special subvarieties.

### B2.23 Full-rank algebraic points outside generic specialness

Let F⊂C be algebraically closed, S/F a smooth irreducible curve, A→S an abelian scheme, and X⊂A
an irreducible closed subvariety dominating S. If X is not GH generically special and Δ⊂S^an is
any nonempty Betti neighborhood, there exists P∈X^sm(F) with π(P)∈Δ and `P∈(X_{π(P)})^sm(F)` such
that rank_R d(b|X)_P=2 dim_C X.

([GH][GH], §6 hypotheses and Lemma 6.2, PDF pp.30–31).

*Needs:* [B1](#layer-b1-betti-forms-and-non-degeneracy), Non-degenerate subvarieties;
[B2](#layer-b2-curve-monodromy-and-constant-traces), Degeneracy over a curve;
[B2](#layer-b2-curve-monodromy-and-constant-traces), Generically special subvarieties;
[B2](#layer-b2-curve-monodromy-and-constant-traces), Curve degeneracy implies GH generic specialness;
[B2](#layer-b2-curve-monodromy-and-constant-traces), Invariance of domain in equal real dimension;
[B2](#layer-b2-curve-monodromy-and-constant-traces), Real constant-rank theorem for Betti fibres.

### B2.24 Construction requirements

Prove existence and the finite-kernel property of the C(S)/C trace and the geometric trace,
their finite-cover descent, and extension over the smooth curve. The trace reduction also needs
two specific assertions: after making connected monodromy, all fibres outside a countable set
are extendable (Gao–Habegger, Lemma 5.7, pp.25–26), and
B2.21's finiteness theorem supplies the finite union of special closures.
Establish the endomorphism-extension argument for the first and use the precise
B2’s uniform torsion-closure theorem and B2’s Lang–Néron theorem contracts for the second. The local Néron factor theory
is not a substitute for either assertion.

For the definable argument, prove integer-character separation for closed torus subgroups
including disconnected ones. Bound free words as matrices; exclude the proper collision kernels
before counting distinct orbit points. Apply B2.6’s semirational block-counting theorem and then
Baire with the countable subgroup family. For monodromy transport apply B2.11’s Riemann-surface adapter to
SmoothBundlesConnections B6.0’s good-cover refinement, glue Betti transitions along loops and prove analytic continuation of a
nonisolated leaf inside the closed Y. Tits's dense-group theorem and B2.4's connected algebraic-monodromy
semisimplicity (Deligne Corollary 4.2.9(a)) give free subgroups at every finite index; the fixed-part and equivariant Hom
theorem B2’s polarized fixed-part theorem gives the constant trace. The equal-dimensional invariance-of-domain and
constant-rank assertions above are prerequisites of the dimension argument, with constant
maximal rank chosen on a neighbourhood before computing a fibre dimension.

### Examples

A constant genus-two curve inside its constant Jacobian is GH generically special but is not a torsion coset. The order-two circle subgroup has annihilator 2ℤ, which is not saturated (GH Definition 1.2 and §5).

### Dependencies

The prerequisite interfaces for each target are the *Needs* clauses above. External inputs include AbelianSchemesAndArithmeticModuli, ShimuraVarieties §5.2,
LieGroupoidsPoisson G0.1 and SmoothBundlesConnections B6.0, with the exact contracts above. The order is trace construction, uniform torsion and fixed parts, character separation and block counting, then the monodromy and specialness arguments. The abelian Ax target uses only the definition of Ax-type, and precedes its algebraic-subvariety application.

## Layer B3: Degeneracy loci and quotient criteria

Use the mixed Kuga interfaces of B3’s mixed Kuga input theorem in four forms: growth, stabilizer, normal quotient and
finite weakly optimal data. Then construct special-generically closures and degeneracy loci in
the abelian family. The quotient criterion concerns generic Betti rank; it does not identify
every critical point with a degeneracy locus.

### B3.1 Mixed Kuga uniformization and semirational counting

Define a connected Kuga datum on a connected rational linear algebraic group P with vector unipotent
radical V and a P(ℝ)⁺-homogeneous component X⁺ of maps from the Deligne torus to P_ℝ.
Require the adjoint mixed Hodge types (−1,1),(0,0),(1,−1),(−1,0),(0,−1), weight filtration
W_(−2)=0, W_(−1)=Lie V, W_0=Lie P, and the Cartan involution induced by x(i) on
G^ad_ℝ for G=P/V, with no rational G^ad-factor compact over ℝ. Require P/P^der to be an
almost product of a rational split torus and a rational torus compact over ℝ, and require no
proper rational normal subgroup through which every x∈X⁺ factors. A Levi splitting writes
P=V⋊G and X⁺ as V(ℝ)×X_G⁺ with its Hodge complex structure. Its API gives pure projection,
the weight −1 vector Hodge structure, smallest subdata containing a set, and quotients by
connected rational normal subgroups with their induced Hodge and complex structures
(Gao–Ax, Definition 2.1 and Remark 2.2, pp.8–9, Gao-Ax line 359; §2.5, pp.9–10).

Construct definable uniformization for connected Kuga data (P=V⋊G,X⁺), congruence Γ⊂P(ℚ)⁺, its quasi-projective coarse quotient Γ∖X⁺, and its relative family after a split neat refinement, an `R_an,exp`-definable fundamental set and uniformization, the parameter-uniform semirational Pila–Wilkie block theorem for a definable Z⊂ℝᵃ×ℝᵇ with bounded-height rational coordinates and unrestricted remaining coordinates, and the bi-algebraic/weakly-special closure and connected normal rational quotient dictionary, including algebraic monodromy normality for a Hodge-generic subvariety; these are the carriers and counting inputs to the growth, stabilizer, quotient and finite weakly optimal targets of B3, not those targets' Ax–Schanuel conclusion (GH Lemma 5.2 proof pp.19–20; Gao–Ax §§2–4.1, pp.5–15).

Its API consists of definable uniformization and compatibility with arithmetic frame changes
and connected normal rational quotients. Prove monodromy normality for Hodge-generic algebraic
subvarieties. The semirational theorem is B2.6's block-counting theorem; B3 constructs its mixed application.
For split neat Γ=Γ_V⋊Γ_G, construct the abelian scheme over Γ_G∖X_G⁺ whose fibres are the
polarized tori V(ℝ)/Γ_V. For a general congruence level, construct a compatible split neat
normal refinement, its finite descent datum and the resulting quotient stack and coarse
family; retain translation cocycles and isotropy. Prove descent compatibility for identity, composition and change of refinement. A coarse quotient with isotropy does not
carry a universal abelian scheme merely from the coarse point set (Gao–Ax §§2.2–2.5,
pp.6–10; PELModuli M6.7's finite-level descent).

**Checks.**

- V=0 gives the pure Shimura quotient with no abelian-fibre direction.
- Constant abelian period data give the product family, with constant Betti frames.
- A normal vector subgroup W⊂V gives the quotient abelian family with fibre V/W;
  a non-G-stable W does not define a normal quotient datum.
- With inversion in a non-neat level, the coarse quotient of an elliptic fibre is E/{±1}≃ℙ¹,
  which is not an elliptic curve. Retaining the quotient stack and the neat cover is necessary.

*Needs:* ShimuraVarieties §§P.1,3.5a–3.5d; PELModuli M3.5–M3.6 and M5;
B2, Semirational block counting and Polarized fixed parts and equivariant Hodge Hom.

### B3.2 Quantitative estimates on the pure projection

In the graph-component setting of Gao–Ax Theorem 4.1, let Z be an irreducible
complex analytic component of B∩graph(u), B=Z^Zar, for a connected Kuga datum, reduced to the smallest Kuga subdatum containing
pr_X⁺Z, and let Z_G be the pure projection of pr_X⁺Z. Assume dim Z_G>0, fix z₀∈Z_G,
and use the invariant hyperbolic metric and height of Gao–Ax §4.2, with a fixed
open definable fundamental set F_G as in §4.1. Write
`B_horz(T)={z:d_horz(z,z₀)<log T}` for T>1. Prove that if γF_G meets B_horz(T), then H(γ)≤c₁T^c₂ for
positive c₁,c₂; for sufficiently large T,
vol(Z_G∩B_horz(T))≥c₃T^(c₄ dim Z_G) for positive c₃,c₄; and
vol(Z_G∩γF_G)≤c₅ for every γ∈Γ_G,
with c₅>0. Constants depend only on the fixed datum, fundamental set,
projection and base point. In particular c₅ is independent of γ.

**Checks.**

- On the upper half-plane with curvature −1 and z₀=i, the full pure
  projection has ball area 2π(cosh(log T)−1)=π(T+T⁻¹−2), of positive-power
  growth; a logarithmic lower bound would miss the needed scale.
- For γ_N(z)=z+N, d(i,γ_N i)<log T is equivalent to
  N²<T+T⁻¹−2. The standard fundamental domain contains i, so these
  translates test the polynomial height scale, rather than a constant bound.
- For the full upper half-plane projection, every translate of the standard
  modular fundamental domain has area π/3. The corresponding uniform bound
  is independent of N; summing the areas of translates in one piece would fail.
- If the pure projection is a point, the positive-dimensional volume estimate
  is inapplicable; horizontal/vertical growth uses its vertical case instead.

([Gao–Ax][Gao–Ax], Lemmas 4.2–4.5 and (4.1)–(4.2), PDF pp.15–16
(Gao-Ax line 650, Gao-Ax line 667, Gao-Ax line 672, Gao-Ax line 675)).

*Needs:* B3.1, Mixed Kuga uniformization and semirational counting; B2, Semirational block counting.

### B3.3 Horizontal and vertical growth in mixed Ax–Schanuel

Let M=Γ\X⁺ be a connected Kuga mixed Shimura variety with uniformization u, Δ=graph(u), and Z an
irreducible analytic component of B∩Δ where B=Z^Zar. Replace the ambient datum (P,X⁺) by the
smallest Kuga subdatum containing pr_X⁺Z. Assume dim pr_X⁺Z>0. For the definable fundamental set
F of §4.1 put Θ={p∈P(R):dim(p⁻¹B∩(F×M)∩Δ)=dim Z}. There are ε>0 and T_i→∞ such that for each i a
connected semialgebraic block in Θ contains at least T_i^ε points of Γ of height at most T_i.

([Gao–Ax][Gao–Ax], Theorem 4.1 setting and Theorem 5.2, PDF pp.14–19).

*Needs:* [B3](#layer-b3-degeneracy-loci-and-quotient-criteria), Quantitative estimates on the pure projection;
B3.1, Mixed Kuga uniformization and semirational counting; B2, Semirational block counting.

### B3.4 Bigness of the rational stabilizer

Let M=Γ\X⁺ be a connected Kuga mixed Shimura variety with uniformization u, Δ=graph(u), and Z an
irreducible analytic component of B∩Δ where B=Z^Zar. Replace the ambient datum (P,X⁺) by the
smallest Kuga subdatum containing pr_X⁺Z. Put `H=(Γ∩Stab_{P(R)⁺}(B))^{Zar,0}`, with rational
Zariski closure. Either dim B−dim Z≥dim(pr_X⁺Z)^biZar, or dim H>0.

([Gao–Ax][Gao–Ax], Equation(5.1), Proposition 5.1 and proof, PDF pp.16,19–20).

*Needs:* [B3](#layer-b3-degeneracy-loci-and-quotient-criteria), Horizontal and vertical growth in
mixed Ax–Schanuel; B3.1, Mixed Kuga uniformization and semirational counting; B2, Semirational block counting.

### B3.5 Normality and quotient induction

Let M=Γ\X⁺ be a connected Kuga mixed Shimura variety with uniformization u, Δ=graph(u), and Z an
irreducible analytic component of B∩Δ where B=Z^Zar. Replace the ambient datum (P,X⁺) by the
smallest Kuga subdatum containing pr_X⁺Z. For the purpose of proving the dimension inequality
one may replace (B,Z) by a very general pair in its Hilbert family, with no larger dimension
defect and the same bi-algebraic closure, so that its rational stabilizer H is normal in P. The
vector part V∩H is a G=P/V module and the reductive part acts trivially on V/(V∩H). Quotient by
H and compare generic fibre dimensions to obtain the Ax–Schanuel inequality. Normality is not
asserted for every original pair without this reduction.

([Gao–Ax][Gao–Ax], Proposition 6.1, §§6–7, PDF pp.20–27).

*Needs:* [B3](#layer-b3-degeneracy-loci-and-quotient-criteria), Bigness of the rational stabilizer;
B3.1, Mixed Kuga uniformization and semirational counting; B2, Semirational block counting.

### B3.6 Finite weakly optimal quotient data

For a fixed algebraic subvariety of a Kuga mixed Shimura variety, weakly optimal subvarieties
have weakly special closures from a finite set of rational subdata and connected normal
subgroups with semisimple reductive parts. Explicitly δ_ws(Z)=dim Z^biZar−dim Z, and Z⊂Y is
weakly optimal if every larger irreducible closed Z′⊂Y has δ_ws(Z′)>δ_ws(Z). A finite list
((Q,Y⁺),N) suffices so that each Z^biZar=u(N(R)⁺y) for some y∈Y⁺. The points y need not come
from a finite set.

([Gao–Ax][Gao–Ax], Definition 8.1, Theorem 8.2 and §§8.1–8.3, PDF pp.27–32).

*Needs:* [B3](#layer-b3-degeneracy-loci-and-quotient-criteria), Normality and quotient induction;
B3.1, Mixed Kuga uniformization and semirational counting; B2, Semirational block counting.

### B3.7 Gao t-degeneracy loci

For closed irreducible X in an abelian scheme A→S over an irreducible complex quasi-projective
variety and t∈Z, define X^deg(t) as the union of positive-dimensional closed irreducible Y⊂X
with dim⟨Y⟩_sg−dimπ(Y)<dimY+t. Here ⟨Y⟩_sg is the smallest special-generically closure inside A
restricted to the reduced closure of π(Y): torsion plus constant section plus abelian subscheme
after finite cover. X^deg(t) is a set before its Zariski closedness theorem.

- x∈X^deg(t) iff x lies on a positive-dimensional Y satisfying the strict dimension inequality.

- For t≤u, X^deg(t)⊂X^deg(u).

- Once closedness is proved, X minus X^deg(0) is a Zariski-open complement of algebraic degeneracy. It is not asserted to be exactly the pointwise full-Betti-rank locus.

**Checks.**

- For a zero-dimensional X all t-degeneracy loci are empty because no
positive-dimensional Y exists.
- A torsion section over a positive-dimensional base belongs
to its 0-th degeneracy locus.
- If dim⟨Y⟩_sg−dimπY=dimY+t, that Y is excluded; replacing < with ≤
changes the definition.
- For a nonconstant branched map f:C→E from a smooth curve to
an elliptic curve, its graph X⊂E×C has X^deg(0)=∅, while db|X vanishes at ramification points.
Algebraic degeneracy does not equal the pointwise rank-drop set.

([Gao–Betti][Gao–Betti], Definitions 1.5–1.6, PDF pp.4–5).

*Needs:* [B1](#layer-b1-betti-forms-and-non-degeneracy), Non-degenerate subvarieties;
[B3](#layer-b3-degeneracy-loci-and-quotient-criteria), Finite weakly optimal quotient data.

### B3.8 Zariski closedness of degeneracy loci

Let A → S be an abelian scheme over an irreducible complex quasi-projective variety, X ⊂ A
closed and irreducible, and t any integer. Prove that the set X^deg(t) defined above is Zariski
closed. The universal modular-image case uses finite normal quotient data and fibre-dimension
loci. The passage to a general family must include exceptional and jumping modular fibres. A
dense-open identity involving only the generic relative dimension is insufficient for this
global assertion.

([Gao–Betti][Gao–Betti], Theorem 7.1 and Lemma 9.1, PDF pp.16–18,22–23).

*Needs:* [B3](#layer-b3-degeneracy-loci-and-quotient-criteria), Gao t-degeneracy loci;
[B3](#layer-b3-degeneracy-loci-and-quotient-criteria), Finite weakly optimal quotient data.

### B3.9 Gao quotient criterion for Betti rank

Let S be an irreducible complex algebraic variety and X⊂A→S a closed irreducible subvariety
dominating S. After the indicated finite cover, translate the smallest torsion translate of an
abelian subscheme containing X to obtain the group family A_X. For each integer l≥0, generic
real Betti rank of X is <2l iff there is an abelian subscheme B⊂A_X with quotient p_B and its
modular map ι/B such that dim((ι/B)∘p_B)(X)<l−dim(B/S).

([Gao–Betti][Gao–Betti], Theorem 1.1, generic-rank criterion and §9.3, PDF
pp.2,15–24).

*Needs:* [B3](#layer-b3-degeneracy-loci-and-quotient-criteria), Zariski closedness of degeneracy
loci; [B3](#layer-b3-degeneracy-loci-and-quotient-criteria), Finite weakly optimal quotient data;
B2, Polarized fixed parts and equivariant Hodge Hom.

### B3.10 Construction requirements

The mixed Ax–Schanuel uses require B3's quantitative estimates on the pure projection.
The Pila–Wilkie connected-block theorem, o-minimal Chow and mixed bi-algebraic
monodromy come from B3’s mixed Kuga input theorem. Normality requires the very
general Hilbert-family replacement, the G-stability of the vector part and the trivial reductive
action on its quotient. Normality in an intermediate subgroup alone is not enough. Normalize the
rational conjugating parameters in the finite-data argument, retaining moving orbit points (Gao,
Ax–Schanuel, §§8.1–8.3, pp.27–32).

For general-family closedness account for every modular fibre dimension, including exceptional
fibres. Prove the passage from the universal modular image to the family with these loci
included; a formula based solely on the generic relative dimension does not do this. An example is the graph of Bl_0(B) → B in the constant family B × Bl_0(B): the exceptional ℙ¹ lies in
the zero-degeneracy locus even though the generic modular relative dimension is zero.
Quotient-jump loci also retain the positive-dimensional-subvariety condition when their
numerical threshold is negative. If a field-of-definition statement is used, prove invariance
under Aut(ℂ/ℚbar) and effective descent of the resulting closed subset separately. The
abelian-subscheme/monodromy-submodule and quotient-modular-map dictionary is supplied by the
polarized fixed-part contract B2’s polarized fixed-part theorem and the Kuga interface, with finite covers explicit.

### Examples

The graph of a branched C→E has empty zero-degeneracy locus although its Betti differential vanishes at branch points. For the graph of Bl_0(B)→B in B×Bl_0(B), the exceptional ℙ¹ belongs to the zero-degeneracy locus (Gao–Betti Definitions 1.5–1.6 and Lemma 9.1).

### Dependencies

The prerequisite interfaces for each target are the *Needs* clauses above. Mixed Kuga inputs precede pure height and volume bounds, then growth, stabilizer, quotient induction, finite data and general-family degeneracy.

## Layer B4: Fibre powers and differences

Fibre powers and difference images are taken componentwise when necessary. First prove the
product lemma by tangent kernels. The main induction uses the quotient criterion with the full
generating-fibre and non-isotrivial-stabilizer hypotheses; generic finiteness
and finite stabilizers specify the full-rank corollaries. The universal curve is
then a specialization through the Jacobian and Torelli maps.

### B4.1 Fine curve moduli with symplectic level

Construct the fine quasi-projective scheme M_g[ℓ] of smooth projective genus g≥2 curves with full symplectic level ℓ≥3 in characteristic zero over ℚ(ζ_ℓ), its universal curve, the quasi-finite Torelli map to A_g[ℓ] compatible with the Jacobian and polarization, and finite étale level-change comparisons that allow descent of the level-independent Betti-rank assertion; JacobianChallengePartII §7.2 supplies the difference morphism only once this family is given (DGH §6.1, pp.23–25).

Its API has three requirements.

- Families are pullbacks of the universal curve.
- The Torelli map agrees with Jacobians and their principal polarization.
- Level refinement is finite étale and respects universal-family pullback and cocycle laws.

Construct the full-level curve scheme through the smooth-curve stack,
its level cover and triviality of level-preserving automorphisms; prove the Torelli map
quasi-finite using geometric Torelli: for smooth projective geometrically connected
curves C,C′ of genus g≥2 over an algebraically closed field, an isomorphism of their
canonically principally polarized Jacobians implies C≃C′. Retain the stronger map statement:
for pointed Abel embeddings j,j′ and a polarized isomorphism β, there are a curve isomorphism
α, sign ε∈{1,−1} and c∈Jac(C′) with j′∘α=εβ∘j+c. Prove it by the theta-divisor and Wʳ
incidence geometry, including hyperelliptic and nonhyperelliptic cases (MilneJV, Theorem 12.1,
p.38; §13, pp.40–44). In characteristic zero this and finite level frames make the Torelli map
quasi-finite (DGH §6.1, pp.23–25).

**Checks.**

- g=2 and ℓ=3 give a fine family; a coarse point alone supplies no universal curve.
- The identity level change gives the identity curve and difference map.
- Composing level refinements gives the same family as their composite; ℓ=2 retains the
  hyperelliptic involution on its homology modulo two and fails the rigidifying hypothesis.

*Needs:* PELModuli M6's abelian level and coarse-moduli interfaces;
SchemeAndStackFoundations §4.15 `StableCurves.Mbar`, `Mbar.smooth`,
`Mbar.algebraicFiniteTypeDM` and `isom_stable_curves`; AlgebraicModuliForArithmeticGeometry
Layer 5, finite covers and rigidification; JacobianChallengePartII §§2.6,7.2.

### B4.2 Non-degeneracy of a dominant fibre product

For dominant irreducible X,Y⊂A→S with geometrically irreducible generic fibres, if X is
non-degenerate then X×_S Y is non-degenerate in A×_S A. For general fibre products apply the
assertion to each dominating component after the requisite finite cover.

([Gao–Survey][Gao–Survey], Lemma 6.2 and proof, PDF p.15).

*Needs:* [B0](#layer-b0-period-coordinates-and-betti-maps), Period-coordinate trivializations;
[B1](#layer-b1-betti-forms-and-non-degeneracy), Non-degenerate subvarieties.

### B4.3 The fibre-power dimension induction

Let A→S be an abelian scheme over an irreducible complex quasi-projective
variety and X⊂A closed irreducible and dominant, of positive relative
dimension, with every fibre generating A_s. Require X+A′⊄X for each
non-isotrivial abelian subscheme A′⊂A; a positive-dimensional isotrivial
stabilizer is allowed. Write ι for the modular map and D_m for fibrewise
differences. Prove the fibre-power rank estimate: for every integer t≥0 and m≥1,
`rank_R(db^[m]|X^[m])≥2(dim ι^[m](X^[m])−t)` if m≥dim S−t.
Prove the difference-image rank estimate:
`rank_R(db^[m]|D_m^A(X^[m+1]))≥2(dim D_m(ι^[m+1](X^[m+1]))−t)`
if m≥dim X−t. The differences commute with the modular maps.
Apply componentwise after a finite cover when geometric irreducibility is
needed. The finite-stabilizer, generically-finite modular-image, t=0 cases
give the full total-dimension rank corollaries for both powers and differences.

**Checks.**

- For X=A=B×S with B a constant positive-dimensional abelian variety, the
  stabilizer is B. The modular image of X^[m] has dimension m dim B and
  Betti rank 2m dim B. The theorem applies, while total dimension also
  includes dim S; generic finiteness is needed for the latter corollary.
- If t≥dim S, the power bound applies already at m=1; a negative lower
  bound on rank remains an inequality and does not force non-degeneracy.
- A multisection has relative dimension zero and fails the hypothesis;
  its fibre powers do not gain independent positive-dimensional fibres.

([Gao–Betti][Gao–Betti], Theorem 10.1(i)–(ii), AppendixB, PDF pp.26–29,33–35).

*Needs:* [B3](#layer-b3-degeneracy-loci-and-quotient-criteria), Gao quotient criterion for Betti
rank; **AbelianSchemesAndArithmeticModuli**, A6.5 `poincareReducibility`.

### B4.4 Non-degeneracy of universal-curve difference images

Fix g≥2 and full symplectic level ℓ≥3 over ℚ(ζ_ℓ). For an irreducible
ℚ̄-variety S with a quasi-finite morphism S→M_g[ℓ], take the pullback C_S
of the universal curve from B4’s fine curve-moduli construction. For M≥3g−2,
`D_M(C_S^[M+1])⊂𝔄_g[ℓ]^[M]×_(A_g[ℓ])S` is non-degenerate after a
complex embedding. Prove that the rank
assertion is unchanged under finite étale level refinements and descends
where a curve family is given without level. A coarse-moduli morphism
alone does not specify a universal curve.

([DGH][DGH], Theorem 6.2 and proof, PDF pp.26–28).

*Needs:* [B4](#layer-b4-fibre-powers-and-differences), The fibre-power dimension induction;
**JacobianChallengePartII**, §7.2 `RelativeJacobian.levelFaltingsZhang`;
B4, Fine curve moduli with symplectic level.

### B4.5 Non-degeneracy criterion for fibre powers

Let A → S be an abelian scheme over an irreducible complex quasi-projective base and X ⊆ A an
irreducible subvariety dominating S with (a) relative dimension ≥ 1, (b) X_s generating A_s for
all s, (c) X_η of finite stabilizer. If m ≥ 1, m ≥ dim S and `ι^{[m]}|_{X^{[m]}}` (the moduli map
to `𝔄_g^{[m]}`) is generically finite, then `X^{[m]}` ⊆ `A^{[m]}` is non-degenerate. Work with a
geometrically irreducible generic fibre, or select a dominating component after the quasi-finite
étale cover in survey footnote 6; the whole reducible fibre product is not called irreducible.

([Gao–Survey][Gao–Survey], Theorem 6.5(i) and footnote 6, PDF pp.16–17).

*Needs:* [B4](#layer-b4-fibre-powers-and-differences), The fibre-power dimension induction.

### B4.6 Non-degeneracy is preserved by the difference construction

If `X^{[m]}_{S′}` is non-degenerate, then so is `D(X^{[m(M+2)]}_{S′})` = `X^{[m]}_{S′}` `×_{S′}`
`D₀((X^{[m]}_{S′})^{[M+1]})` ⊆ `A^{[m(M+1)]}_{S′}`. For arbitrary abelian families the group-valued
difference is the native group-law specialization; the curve case uses the imported Jacobian
map. Choose the dominating irreducible components when needed.

([Gao–Survey][Gao–Survey], Lemma 6.2 and §8.3 Step 1, PDF pp.15,22).

*Needs:* [B4](#layer-b4-fibre-powers-and-differences), Non-degeneracy of a dominant fibre product;
**JacobianChallengePartII**, §2.6 `RelativeJacobian.CurveDifference`.

### B4.7 Construction requirements

At each step of the fibre-power induction re-diagonalize the connected kernel using a
G-equivariant shear. Kernel projections are endomorphisms; only the combined coordinate map is
an isogeny. Retain finite covers and connected components through every dimension equality.
Prove both the power and the difference-image induction, not just the power case. For the
universal-curve application pass to a cover with a section and use quasi-finiteness of the
Torelli/modular map. In the difference-product argument the first factor is independent, so
product non-degeneracy suffices; generic injectivity of the full difference map is unnecessary.

### Examples

For a constant full family, Betti rank detects fibre dimension and omits base dimension. Thus a generically finite modular image is necessary for the total-dimension full-rank corollary (Gao–Betti Theorem 10.1).

### Dependencies

SchemeAndStackFoundations §4.15 supplies curve moduli stacks; PELModuli M6 supplies abelian level moduli; JacobianChallengePartII §§2.6,7.2 supplies the given-family difference maps. Fine curve-level construction and Torelli are B4 targets. B0–B1 supplies ranks and B3 supplies the quotient criterion, preceding the power and difference inductions.

## Layer F0: Finite-field Frobenius and Tate

Start with polarized-moduli finiteness and compact lattice limits. Tate's isotropic-image lemma
yields the split-prime commutant calculation, and prime independence plus saturation gives full
faithfulness. Frobenius polynomials and point counts use the parent characteristic-polynomial
interface and the Weil absolute-value theorem.

### F0.1 Compact preimages and exact lattice limits

Prove the compact-lattice image-limit theorem. For a prime ℓ, let L be a finite free
Z_ℓ-lattice and u_j∈End_Zℓ(L) converge to u, with the compact images
L_j=u_j(L) forming a decreasing sequence. Then u(L)=⋂_j L_j. In Tate Proposition 1, after
passing to infinitely many isomorphic fixed-polarization models, L=X_n, L_j=X_j=(T∩W)+ℓ^jT along
a cofinal subsequence, and u belongs to the closed finite-dimensional algebra E_ℓ. Finiteness of
the models is a separate hypothesis, established over finite fields using polarized moduli.

**Checks.**

- Rank zero gives the singleton lattice and singleton intersection.
- A constant matrix sequence gives its fixed image, including the zero matrix.
- For `u_n=ℓ^n·id`, the limit is zero and `⋂n ℓ^n L={0}`; replacing
  the intersection by a union would give all of L.

Include the separatedness identity ⋂_nℓⁿL={0}; rank zero and constant maps are Checks of the compact-image theorem.

([Tate][Tate], Hyp(k,A,d,ℓ) and Proposition 1 proof, printed pp.136–137 (PDF pp.3–4)).

*Needs:* **PELModuli**, M6.

### F0.2 Frobenius polynomial and reciprocity

For A/F_q of dimension g, write P_A for the parent’s integer characteristic polynomial of π_A.
Apply AbelianSchemesAndArithmeticModuli A6.10–A6.11 to identify it with det(X−Frob_q|V_ℓA),
monic of degree 2g and independent of ℓ≠p, and DWP.1 target 1.4 for the root modulus √q.
Prove the reciprocity coefficients a_(2g−i)=q^(g−i)a_i for 0≤i≤g, indexed in descending powers:
P_A=∑_(i=0)^(2g) a_i X^(2g−i), with a_0=1 and a_(2g)=q^g.

- Writing P_A=∑a_i X^(2g−i), a_(2g−i)=q^(g−i)a_i for 0≤i≤g, a_0=1 and a_(2g)=q^g.

- P_(A×B)=P_A P_B.

**Checks.**

- For the zero-dimensional abelian variety P_A=1 and the point count
is 1.
- For an elliptic curve, P_A=X²−tX+q and #A(F_q)=q+1−t.
- For elliptic curves with traces a,b over F_q,
  their product has polynomial X⁴−(a+b)X³+(ab+2q)X²−q(a+b)X+q².
  This tests both the descending coefficient order and dimension-two reciprocity.

([Waterhouse][Waterhouse], Chapter 2 opening, printed pp.526–528 (PDF pp.7–9)).

*Needs:* **AbelianSchemesAndArithmeticModuli**, A6.11 `charpolyTate`;
**DeligneWeightsAndPurity**, DWP.1 (targets 1.4–1.5).

### F0.3 Weil q-numbers

For q=p^a with p prime and a≥1, a Weil q-number is an algebraic integer π whose image under
every complex embedding of Q(π) has absolute value sqrt(q). Classification uses conjugacy
classes of these numbers, not arbitrary reciprocal polynomials of degree 2g. Use the weight-one
predicate of DWP.0 together with IsIntegral ℤ; the three interfaces below are its integral
finite-field specializations, rather than a second purity predicate.

- For every embedding σ:Q(π)→C, |σπ|²=q.

- Algebraic conjugates of a Weil q-number are Weil q-numbers.

- π^r is a Weil q^r-number for r≥1.

**Checks.**

- ±sqrt(p) are Weil p-numbers and have minimal polynomial X²−p.
- For q>1 the algebraic integer 1 is not a Weil q-number.
- Every Frobenius eigenvalue of the imported characteristic polynomial
of A/F_q is a Weil q-number.

([Waterhouse][Waterhouse], Chapter 2, printed pp.527–528 (PDF pp.8–9)).

*Needs:* **DeligneWeightsAndPurity**, DWP.0 (targets 0.1–0.3); `IsIntegral`;
`IntermediateField.adjoin`.

### F0.4 Tate’s isotropic image lemma

Let A/k have a k-polarization θ of degree d², let ℓ≠char(k), and assume Tate’s Hyp(k,A,d,ℓ):
only finitely many k-isomorphism classes B admitting a degree-d² k-polarization and an ℓ-power
isogeny B→A. Every Galois-stable maximal isotropic Q_ℓ-subspace W⊆V_ℓ(A) for θ is the image of
some u∈End_k(A)⊗Q_ℓ.

([Tate][Tate], Proposition 1 and proof, printed pp.136–137 (PDF pp.3–4)).

*Needs:* [F0](#layer-f0-finite-field-frobenius-and-tate), Compact preimages and exact lattice
limits.

### F0.5 Point-count corollaries

Prove isogeny invariance and product compatibility of point counts: for every r≥1,
F_q-isogenous abelian varieties have the same number of F_(q^r)-points,
and the point counts multiply on products. Apply the supplied point-count
identity to the isomorphism of rational Tate modules and to the direct-sum
product action, respectively.

([Tate][Tate], Theorem 1(c), printed p.139 (PDF p.6)).

*Needs:* DeligneWeightsAndPurity DWP.1 target 1.5;
AbelianSchemesAndArithmeticModuli A3 and A4.1 (Tate isogeny and product maps).

### F0.6 Tate at a split Frobenius prime

For abelian varieties over a finite field k of characteristic p and a prime ℓ≠p splitting the
étale algebra Q[π] generated by Frobenius, Tate Proposition 2 identifies End_k(A)⊗Q_ℓ with the
Frobenius commutant. Its dimension is ∑_P m_P² deg P and is independent of ℓ. Off-diagonal
blocks give Hom_k(A,B)⊗Q_ℓ; the integral inclusion has torsion-free cokernel. These are
k-rational Hom spaces, not unrestricted geometric Hom.

([Tate][Tate], Lemmas 1–4, Proposition 2 and equations(4)–(5), printed pp.135–139
(PDF pp.2–6)).

*Needs:* [F0](#layer-f0-finite-field-frobenius-and-tate), Compact preimages and exact lattice
limits; **AbelianSchemesAndArithmeticModuli**, A6.2 `homTateInjective`;
**AbelianSchemesAndArithmeticModuli**, A6.7 `homFreeFinite`;
**AbelianSchemesAndArithmeticModuli**, A6.8 `endQ_isSemisimple`;
[F0](#layer-f0-finite-field-frobenius-and-tate), Tate’s isotropic image lemma.

### F0.7 Tate full faithfulness over finite fields

For A,B/F_q and ℓ≠p, Hom_Fq(A,B)⊗Z_ℓ→Hom_Gal(T_ℓA,T_ℓB) is an isomorphism; rationalizing gives
the analogous Q_ℓ statement.

([Tate][Tate], Main Theorem; Lemmas 1–3; conclusion of §2, printed pp.134–135,138–139
(PDF pp.1–2,5–6)).

*Needs:* [F0](#layer-f0-finite-field-frobenius-and-tate), Tate at a split Frobenius prime.

### F0.8 Construction requirements

Construct the finite fixed-polarization moduli sets and the compatible compact preimages in
Tate's argument without using F6. For decreasing images u_j(L), compactness proves that each
element of the intersection has a preimage under the limit u; mere convergence of images is
insufficient. Compute each split eigenspace and off-diagonal block and justify independence of
the commutant dimension from ℓ. Combine rational surjectivity with integral saturation. Use
DeligneWeightsAndPurity, DWP.1 target 1.4, for the abelian-variety Frobenius root bound. Its
Rosati proof uses the parent polarization and characteristic-polynomial theory, without Tate
full faithfulness. Use DWP.0 targets 0.1–0.3 for the embedding, conjugacy and power laws of pure
algebraic numbers, and add the integrality condition for Honda–Tate Weil numbers. Semisimplicity
is applied to Frobenius, not to arbitrary endomorphisms.

### Examples

For two elliptic traces a,b, multiply (X²−aX+q)(X²−bX+q): the X coefficient is −q(a+b) and the constant is q², fixing descending reciprocity (Waterhouse Chapter 2).

### Dependencies

The prerequisite interfaces for each target are the *Needs* clauses above. External layers used here are AbelianSchemesAndArithmeticModuli, DeligneWeightsAndPurity, PELModuli, with the exact contracts specified above. The root bound uses the independent Rosati proof; polarized-moduli finiteness precedes the compact-image argument.

## Layer F2: Resultant recognition

This polynomial layer is independent of the geometric realizations. A dense coefficient ring
provides monic tests at arbitrary ideal-power precision. Fixed-size determinant congruences and
a shifted-factor slope distinguish every irreducible multiplicity, including repeated and
inseparable factors.

### F2.1 Multiplicity detected by shifted factors

Let O be a DVR, R,S monic with gcd(R,S)=1 over Frac(O), d=degR>0, and P=R^e S. If monic
ψ_n≡R+π^n mod π^(2n) and degψ_n=d, then eventually Res(P,ψ_n)≠0 and v Res(P,ψ_n)=nde+v Res(S,R).

([Milne][Milne], §1, characteristic-polynomial uniqueness criterion, printed p.65
(PDF p.3), scan; DVR polynomial adapter).

*Needs:* Mathlib `Polynomial.lifts_and_natDegree_eq_and_monic`;
Mathlib `Polynomial.resultant_map_map`.

### F2.2 Recognition from nonzero monic resultant tests

Prove `resultantRecognition` in the following generality.

Let O be a nonfield discrete valuation ring with uniformizer π and normalized valuation on its
nonzero elements, and let D be a commutative ring with a unital map to O. If monic P,Q∈O[X] have
equal valuations of every common nonzero resultant with monic polynomials lifted from D, and D→O
is surjective modulo each π^N, then P=Q. Equal degree, completeness, separability,
characteristic zero and finite residue field are unnecessary.

**Checks.**

- For P=Q=1, every monic test has resultant 1 on both sides and both valuations are 0.
- For P=X and Q=X+π, take ψ=X+π². The two nonzero resultants have valuations 2 and 1,
  including in residue characteristic two.
- For P=X and Q=X², the tests ψ=X+πⁿ, n≥1, give valuations n and 2n;
  repeated factors are detected rather than discarded.
- Without density, take D=𝔽₂ inside O=𝔽₂[[t]], P=X+t and Q=X+t+t². Every monic
  ψ∈𝔽₂[X] has equal resultant valuations against P and Q: both equal the multiplicity
  of X in ψ. The polynomials P,Q are distinct, so testing only constant-field coefficients fails.

([Milne][Milne], §1, characteristic-polynomial uniqueness criterion, printed p.65
(PDF p.3), scan; DVR polynomial adapter).

*Needs:* [F2](#layer-f2-resultant-recognition), Multiplicity detected by shifted factors.

### F2.3 Integer tests for a p-adic polynomial

For prime p and monic P,Q∈Z_p[X], equality of v_p Res(P,ψ) and v_p Res(Q,ψ) for all monic ψ∈Z[X]
with both resultants nonzero implies P=Q.

([Milne][Milne], §1, characteristic-polynomial uniqueness criterion, printed p.65
(PDF p.3), scan; DVR polynomial adapter).

*Needs:* [F2](#layer-f2-resultant-recognition), Recognition from nonzero monic resultant tests;
`PadicInt.appr_spec`; `PadicInt.valuation`.

### F2.4 Construction requirements

For P = R^eS use the finite free quotient O[X]/(R). If ψ_n differs from R + π^n modulo π^(2n),
multiplication by ψ_n there is π^n(I + π^nH_n), whose determinant has valuation n·deg R.
Multiplicativity of resultants and eventual stability of Res(S,ψ_n) give the slope n·deg R·e
plus a constant. This quotient determinant retains enough precision for degree(R) > 2; a scalar
error estimate at precision 2n alone does not. Compare the slopes for P and Q factor by factor,
choosing only tests with both resultants nonzero. The coefficient-lift and congruence statements
allow an arbitrary ideal; the recognition theorem uses the powers of a DVR uniformizer.
Completeness, a finite residue field, characteristic zero and separability are not assumptions.

### Examples

For R=X, S=1 and ψ_n=X+π^n, Res(R^e,ψ_n)=π^(ne). The slope is e; inseparability introduces no new hypothesis (Milne §1, DVR polynomial adapter).

### Dependencies

The prerequisite interfaces for each target are the *Needs* clauses above. This layer is independent of F0–F1: it uses native polynomial lifting, fixed-size resultants and DVR valuations.

## Layer F1: Characteristic-prime realization

The characteristic-prime comparison uses the actual contravariant Dieudonné functor from R07.2.
Prove the degree/length and characteristic-polynomial identities before the rational commutant
calculation. Integral full faithfulness then follows from rational full faithfulness and a
separately established saturated image.

### F1.1 Degree from Dieudonné cokernel length

For an isogeny f:A→B of abelian varieties over a perfect field k of characteristic p>0, the
contravariant map C(f):C(B)→C(A) is injective and length_W coker C(f)=v_p(deg f). For an
endomorphism its determinant valuation gives the same value.

([Milne][Milne], §1, printed pp.64–66 (PDF pp.2–4), scanned page images).

*Needs:* **FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2.10 `dieudonnePDivisible`.

### F1.2 Saturated injection on integral p-realization Hom groups

For A,B/F_(p^a), the natural map j:Hom_k(A,B)⊗Z_p→Hom_(W,F,V)(C(B),C(A)) is injective with
p-saturated image. This statement does not assume rational p-Tate or equality of ranks.

([WM][WM], PartI Theorems 3/5 and opening proof of Theorem 6, printed pp.55–57 (PDF
pp.3–5), scans).

*Needs:* **FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2.10 `dieudonnePDivisible`;
**AbelianSchemesAndArithmeticModuli**, A6.7 `homFreeFinite`;
**AbelianSchemesAndArithmeticModuli**, A3.

### F1.3 Characteristic polynomial on the p-realization

For an abelian variety A over a perfect field k of characteristic p>0 and every u∈End_k(A), the
W(k)-linear map C(u) on its contravariant Dieudonné module has characteristic
polynomial equal to the image of the parent's integer characteristic polynomial
of u. Its descent to Z_p is supplied by R07.2.19 `exists_padic_charpoly`,
applied to the conjugation identity from the invertible semilinear Frobenius
commuting with C(u). Only agreement with the integer polynomial is proved here. No
semisimplicity of arbitrary u is assumed.

([Milne][Milne], §1, printed pp.65–66 (PDF pp.3–4), scanned page images).

*Needs:* [F1](#layer-f1-characteristic-prime-realization), Degree from Dieudonné cokernel length;
[F2](#layer-f2-resultant-recognition), Integer tests for a p-adic polynomial;
**AbelianSchemesAndArithmeticModuli**, A6.10 `End.charpoly`;
**FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2.19 `exists_padic_charpoly`.

### F1.4 Algebra acting on a Frobenius polynomial block

Let L/Q_p be unramified of degree a≥1 with arithmetic Frobenius σ, and let m∈Q_p[X] be monic
irreducible with m(0)≠0. Put K=Q_p[X]/m and θ=X mod m. On ⊕_(0≤j<a)(L⊗Qp K)U^j define
multiplication by U b=(σ⊗1)(b)U and U^a=θ. This defines a K-algebra B of dimension a². If a
semilinear bijection F on an L-vector space V satisfies m(F^a)=0, the actions of L, θ↦F^a and
U↦F define a B-module structure on V. The coefficient tensor L⊗Q_p K may be étale with several
factors; preserve the σ action on all factors.

- U c=σ(c)U and U^a=θ on L⊗_(Q_p)K; θ is the chosen q-Frobenius root.

- The algebra has K-dimension a² after the coefficient étale algebra is handled correctly.

- On the corresponding isocrystal block, the semilinear F gives an action of this cyclic algebra.

**Checks.**

- For a=1 the block algebra is K, with U=θ.
- After a splitting base extension it is a full a×a matrix algebra, with
weighted cyclic U and diagonal coefficient action.
- If L⊗Q_p K is a product, the construction retains every
idempotent and its σ-permutation; it is not replaced by one arbitrarily selected coefficient
field.

([WM][WM], PartII proofs, printed pp.60–61 (PDF pp.8–9), scans).

*Needs:* **FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2.10 `dieudonnePDivisible`;
[F1](#layer-f1-characteristic-prime-realization), Characteristic polynomial on the p-realization.

### F1.5 Frobenius adapter on the isocrystal

For A/F_(p^a), identify C(π_A)=F^a on C(A)[1/p], where
L=W(F_(p^a))[1/p]. Apply A6.21 `frobeniusSemisimple` to its faithful
End⁰(A)^op action, and prove the isocrystal Frobenius polynomial comparison identifying
its characteristic polynomial with P_A using the preceding comparison.
This specializes the supplied semisimplicity theorem; it asserts no
semisimplicity for arbitrary endomorphisms.

([Milne][Milne], §1, printed pp.65–66 (PDF pp.3–4)).

*Needs:* AbelianSchemesAndArithmeticModuli A6.21 `frobeniusSemisimple`;
[F1](#layer-f1-characteristic-prime-realization), Characteristic polynomial on the
p-realization; Saturated injection on integral p-realization Hom groups.

### F1.6 Central simplicity of a Frobenius block algebra

The algebra B in the Frobenius block construction above is central simple over K. For an
algebraic closure Ω/K, B⊗K Ω≅M_a(Ω). In particular the conclusion includes the cases where L⊗Qp
K is a product of fields.

([WM][WM], PartII Theorem 2 proof, printed p.61 (PDF p.9), scan).

*Needs:* [F1](#layer-f1-characteristic-prime-realization), Algebra acting on a Frobenius polynomial
block; [RepresentationTheory/SemisimpleAlgebras, layer
4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md#layer-4-central-simple-algebras-and-their-tensor-products).

### F1.7 Dimension of the semilinear Frobenius commutant

For A/F_(p^a), factor P_A=∏m_i^(e_i) over Q_p into distinct monic irreducibles of degrees d_i.
For V=C(A)[1/p] and R=L[F,F^(-1)], dim_Qp End_R(V)=Σ_i d_i e_i².

([WM][WM], PartII Theorem 1 proof, printed pp.60–61 (PDF pp.8–9), scans).

*Needs:* [F1](#layer-f1-characteristic-prime-realization), Algebra acting on a Frobenius polynomial
block; [F1](#layer-f1-characteristic-prime-realization), Central simplicity of a Frobenius block
algebra; [RepresentationTheory/SemisimpleAlgebras, layer
5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md#layer-5-skolem-noether-and-the-centralizer-theorem);
[F1](#layer-f1-characteristic-prime-realization), Frobenius adapter on the isocrystal.

### F1.8 Rational and integral p-Tate comparison

For A,B/F_q, Hom(A,B)⊗Q_p≃Hom_(F,V)(C(B)[1/p],C(A)[1/p]); the integral map is an isomorphism
onto the F,V-compatible integral morphisms after its injectivity and p-saturation are proved.

([WM][WM], PartI Theorems 5–6 and PartII Theorem 1 proof, printed pp.56–57,60–61 (PDF
pp.4–5,8–9), scans).

*Needs:* **FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2.10 `dieudonnePDivisible`;
[F1](#layer-f1-characteristic-prime-realization), Characteristic polynomial on the p-realization;
[F0](#layer-f0-finite-field-frobenius-and-tate), Tate at a split Frobenius prime;
**AbelianSchemesAndArithmeticModuli**, A6.8 `endQ_isSemisimple`;
[F1](#layer-f1-characteristic-prime-realization), Saturated injection on integral p-realization Hom
groups; [F1](#layer-f1-characteristic-prime-realization), Central simplicity of a Frobenius block
algebra; [F1](#layer-f1-characteristic-prime-realization), Dimension of the semilinear Frobenius
commutant; [F1](#layer-f1-characteristic-prime-realization), Frobenius adapter on the isocrystal.

### F1.9 Integral Tate full faithfulness at the characteristic prime

For abelian varieties A,B/F_q, let C(A),C(B) be the contravariant Dieudonné modules of their
p-divisible groups over W(F_q), with their F,V actions. The natural map
`Hom_Fq(A,B)⊗Z_p→Hom_{W(F_q),F,V}(C(B),C(A))` is an isomorphism.

([WM][WM], PartI saturation and PartII Theorem 1, printed pp.56–57,60–61 (PDF
pp.4–5,8–9), scans).

*Needs:* [F1](#layer-f1-characteristic-prime-realization), Rational and integral p-Tate comparison.

### F1.10 Rational p-Tate comparison

For A,B/F_(p^a), Hom_k(A,B)⊗Q_p→Hom_(L,F)(C(B)[1/p],C(A)[1/p]) is an isomorphism of Q_p-vector
spaces. For A=B it identifies End⁰_k(A)^op⊗Q_p with the equivariant endomorphism algebra.

([WM][WM], PartII Theorem 1 proof, printed pp.60–61 (PDF pp.8–9), scans).

*Needs:* [F1](#layer-f1-characteristic-prime-realization), Rational and integral p-Tate comparison.

### F1.11 Characteristic-prime invariant of a simple endomorphism algebra

Let A/F_(p^a) be simple, with Frobenius π and center Q(π) of E=End⁰_k(A). For v|p put K=Q(π)_v,
e_v=ord_v(p) and f_v its residue degree, with ord_v a uniformizer-normalized valuation. Then
inv_v(E)=f_v ord_v(π)/a=[K:Q_p]ord_v(π)/ord_v(p^a) in Q/Z.

([WM][WM], PartII Theorem 2 and proof, printed pp.60–61 (PDF pp.8–9), scans).

*Needs:* [F1](#layer-f1-characteristic-prime-realization), Algebra acting on a Frobenius polynomial
block; [F1](#layer-f1-characteristic-prime-realization), Rational and integral p-Tate comparison;
[ClassFieldTheory, layer
5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality).

### F1.12 Construction requirements

Construct the completed Hom map and prove injectivity from finite-rank Hom and finite flat
torsion. To prove p-saturation, interpret divisibility of C(f) by p^n as annihilation of the
finite flat subgroup A[p^n], then factor through [p^n]; geometric torsion points alone cannot
detect connected kernels. Use F2's nonzero-resultant recognition to identify characteristic
polynomials for arbitrary endomorphisms. On each Frobenius block construct the cyclic algebra on
the full étale tensor L ⊗ K, including every idempotent when it is a product. After a splitting
extension identify it with M_a; apply centralizer dimensions blockwise to match the ℓ-adic
dimension. Rational surjectivity and saturation then give integral p-Tate. For local invariants
track the opposite endomorphism algebra and arithmetic Frobenius through the cyclic-algebra
convention.

### Examples

For [p] on a g-dimensional abelian variety, C([p])=p and its cokernel has Witt length 2g, agreeing with v_p(deg[p])=2g. For a=1 the cyclic block algebra is K (Milne §1; WM Part II).

### Dependencies

FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 supplies the contravariant realization and scalar descent; AbelianSchemesAndArithmeticModuli A6 supplies integral Hom and polynomial data; RepresentationTheory/SemisimpleAlgebras Layers 4–5 and ClassFieldTheory Layer 5 supply centralizers and Brauer invariants. F2 recognition precedes polynomial agreement; saturation and block dimensions precede the integral comparison.

## Layer F3: Honda–Tate and lattice classifications

Honda–Tate combines the Frobenius commutant with existence for every Weil number and the global
Brauer invariants. Classification of integral objects requires a separate lattice theorem, with
finite support and the contravariant characteristic-prime marking. The characteristic-prime lattice theorem uses C; its prime-field corollaries use the explicit linear dual.

### F3.1 Prime-to-p and p lattice spaces

Fix A₀/F_q. X^p is the restricted product of Frobenius-stable full Z_ℓ-lattices in V_ℓ(A₀),
equal to T_ℓ(A₀) almost everywhere. X_p consists of full W(F_q)-lattices in C(A₀)[1/p] stable
under F and V, where C is the contravariant Dieudonné functor. For Γ=End⁰_Fq(A₀)^× use the left
action α·(Λ_p,(Λ_ℓ))=(C(α)⁻¹Λ_p,(α_ℓΛ_ℓ)).

- The prime-to-p part consists of a Frobenius-stable full Z_ℓ-lattice in V_ℓA for each ℓ≠p, equal to T_ℓA at all but finitely many ℓ.

- The characteristic-prime part is a full F,V-stable W(F_q)-lattice in the contravariant isocrystal C(A₀)[1/p].

- The left action of Γ is α_ℓ at ℓ≠p and C(α)⁻¹ at p. Contravariance reverses composition; taking inverses restores the left action.

**Checks.**

- The identity marking gives exactly T_ℓ(A₀) at ℓ≠p and C(A₀) at p.
- The zero-dimensional abelian variety has one lattice tuple.
- A tuple differing from the standard lattice at infinitely many primes
is excluded from the finite-support space.

([Waterhouse][Waterhouse], §1.2 and §3.1, printed pp.524–525,529–531 (PDF pp.5–6,10–12)).

*Needs:* **FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2.10 `dieudonnePDivisible`;
**FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.1.2 `etaleGroupEquivContAction`.

### F3.1a CM fields and types with prescribed slopes

For a q-Weil number π, put F=ℚ(π) and λ_v=ord_v(π)/ord_v(q) for v|p.
Construct a CM field L containing F such that n_w=[L_w:ℚ_p]λ_v is an integer
for every w|v|p, and a CM type Φ of L with #(Φ∩H_w)=n_w, where H_w is the set
of embeddings into a fixed algebraic closure of ℚ_p inducing w. Thus
#(Φ∩H_w)/#H_w=λ_v. Fix an identification with the complex embedding set before
regarding Φ as a complex CM type. The valuations of q are positive, and
0≤λ_v≤1 follows from integrality of π and q/π.

If F is CM, use weak approximation to choose a totally real extension of its
maximal real subfield with sufficiently divisible degree and the prescribed
full local degrees at p, and form its compositum with F. Prove the polynomial
approximation step using open Eisenstein coefficient conditions at the finite
places and simple real roots at the real places. If π has
a real conjugate, π²=q and F is totally real; L=F(√(−p)) supplies the required
CM extension, including p=2. Complex conjugation pairs w and w̄ with
n_w+n_w̄=#H_w; if w=w̄, pair the embeddings inside H_w and choose half.
These counting laws construct Φ, without requiring a primitive type
([TateHonda][TateHonda], §3 Lemma 2, printed pp.100–101, and §4 after Lemma 5, printed pp.104–105;
TateHonda line 172, TateHonda line 253).

**Checks.**

- For π=2+i and q=5, L=ℚ(i) has local degrees 1 at both primes over 5,
  slopes 1 and 0 and type counts 1 and 0; reversing Φ reverses these slopes.
- For π=√2, q=2, take L=ℚ(√2,i). At 2 its local degree is 4 and λ=1/2,
  so n_w=2; the real Weil number is not discarded.
- For π=±2, q=4, L=ℚ(√(−2)) has degree 2 at 2 and n_w=1.
  A degree-one local factor at slope 1/2 would give the impossible count 1/2.

*Needs:* F0's Weil-number integrality and conjugation; GlobalNumberFields
Layers 0–1 for completions, local degrees and mixed-place weak approximation;
Mathlib `NumberField.IsCMField`.

### F3.1b Realization of a prescribed CM type

For every CM field L and CM type Φ, construct a full lattice I in L stable under
O_L and a positive integral Riemann form on ℂ^Φ/Φ(I), hence an abelian variety of
dimension [L:ℚ]/2 with O_L-action and Lie type Φ. Choose ξ∈L with ξ̄=−ξ and
Im φ(ξ)>0 for φ∈Φ, scale it by a positive integer for integrality, and use
E(x,y)=Tr_(L/ℚ)(ξx̄y) on L, extended real bilinearly to ℂ^Φ. In the parent's
sign convention, for x≠0 one has E(Jx,x)>0 and E(x,Jx)<0. Apply AbelianSchemesAndArithmeticModuli A5.1–A5.3; the polarization
need not be principal and the variety need not be simple. Its API retains the
O_L-action, the actual type and a polarization whose Rosati restriction is CM
conjugation ([TateHonda][TateHonda], §4 Lemma 4, printed pp.102–103, TateHonda line 221).

**Checks.**

- For L=ℚ(i), Φ={i↦i}, I=ℤ[i], ξ=i, the form has E(i,1)=2 and E(1,i)=−2;
  it is positive and integral, with determinant 4, so it is not principal.
- Replacing ξ=i by −i gives E(i,1)=−2 and fails positivity for this Φ;
  the sign is tied to the chosen type.
- Multiplying ξ=i by 2 gives E(i,1)=4 and determinant 16; it changes the
  polarization degree while retaining the CM type. Scaling need not preserve
  principal polarization.

*Needs:* F3.1a's CM type for the prescribed-slope application;
GlobalNumberFields Layer 1 for the imaginary signs;
AbelianSchemesAndArithmeticModuli A5.1–A5.3 and A3.9.

### F3.1c Effectivity of a power by CM reduction

For every q-Weil number π, construct N≥1 and an abelian variety over F_(q^N)
whose Frobenius has π^N as a root. Realize F3.1a's CM type by F3.1b, use
ShimuraVarieties §§5.5–5.6 for a number-field model with defined O_L-action and
potential good reduction at a place over p, and enlarge to a Galois number
field containing all conjugates of L. At the chosen good place let q₀=p^b, b≥1,
be the residue cardinality. Its reduction Frobenius π₀∈O_L, from §§5.7–5.8,
has ord_w(π₀)/ord_w(q₀)=ord_w(π)/ord_w(q) at every w|p, with the arithmetic
Frobenius convention even when p ramifies.

Write q=p^a; the Weil absolute values give π≠0. The quotient ζ=π₀^a/π^b
is a unit at every finite place and has
absolute value 1 at every infinite place, so it is a root of unity. If ζ has
order t≥1, extension of the reduction field by degree at makes its Frobenius
π₀^(at)=π^(bt) and its cardinality q^(bt). Take N=bt. This constructs the
power before invoking Honda–Tate surjectivity ([TateHonda][TateHonda], §3 Lemma 3 and §4
Lemmas 5–6, printed pp.101–105, TateHonda line 194, TateHonda line 241,
TateHonda line 291).

**Checks.**

- With q=q₀=4, π=2 and π₀=−2, the slopes agree but ζ=−1. The choice t=2
  gives π₀²=π²=4 over the cardinality-16 field; t=1 would retain the wrong sign.
- With π=√2, q=2 and π₀=2, q₀=4, one has a=1, b=2 and ζ=1; N=2 and
  π₀=π²=2. Equal slopes do not require equal residue cardinalities.
- For π=2+i, q=5, a local inverse would have slope −1 rather than 1 at the
  π-prime. The normalized valuation equality excludes inverse Frobenius.

*Needs:* F3.1a–F3.1b; ShimuraVarieties §§5.5–5.8 with their full-action,
maximal-order and Galois-model hypotheses;
`NumberField.Embeddings.pow_eq_one_of_norm_eq_one` after proving the quotient
is an algebraic integer unit.

### F3.1d Descent of effectivity to the stated finite field

Call a q-Weil number effective if it is a root of P_A for an abelian variety
A/F_q. This is equivalent to occurring as the Frobenius of an F_q-simple factor,
using complete reducibility, not Honda–Tate existence. For N≥1 and B/F_(q^N),
prove P_(Res B)(T)=P_B(T^N) for Res=Res_(F_(q^N)/F_q). The parent A6.32–A6.33
supplies the abelian restriction and its induced prime-to-p Tate module;
compute arithmetic q-Frobenius as the cyclic block shift whose Nth power on
a block is the q^N-Frobenius of B. Thus if π^N is effective, π is a root of
P_(Res B), and selecting an F_q-simple factor proves π effective. This includes
inseparable isogeny factors ([TateHonda][TateHonda], §3 Lemma 1, printed p.100,
TateHonda line 152).

Its API gives invariance of effectivity under conjugacy, forward power
transport by scalar extension and descent from every positive power; the
power transports need not preserve simplicity.

**Checks.**

- For N=1 restriction is B and P_B(T^1)=P_B(T).
- For an elliptic B/F_(q²) with P_B(T)=T²−tT+q², the restriction has
  P(T)=T⁴−tT²+q² and dimension 2; P_B(T)² generally has a nonzero cubic term
  −2t and is the wrong induced polynomial.
- For π=√2 and B/F₄ with P_B(T)=(T−2)², the restriction over F₂ has
  P(T)=(T²−2)² and π as a root; its constant term is 4, as required in dimension 2.
- For B=0 the polynomial is 1 and restriction still has polynomial 1;
  no Weil number becomes effective through an empty root set.

*Needs:* F3.1c for existence of the effective power;
AbelianSchemesAndArithmeticModuli A6.32 `weilRestrictionAbelian`, A6.33
`weilRestrictionTate` and A6.5 `poincareReducibility`; F0's characteristic
polynomial comparison. The implication from a power uses only the supplied B,
not F3.2's classification.

### F3.2 Honda–Tate simple isogeny classification

Simple F_q-isogeny classes correspond to conjugacy classes of q-Weil algebraic integers π. The
dimension is determined by 2 dim A=[Q(π):Q] sqrt([End⁰(A):Q(π)]), with the division-algebra
local invariants prescribed by π.

([Waterhouse][Waterhouse], Chapter 2, printed pp.526–528 (PDF pp.7–9);
[TateHonda][TateHonda], §3 Lemmas 1–3 and §4 Lemmas 4–6, printed pp.100–105).

*Needs:* F3.1a–F3.1d for existence; [F0](#layer-f0-finite-field-frobenius-and-tate), Weil q-numbers;
[F1](#layer-f1-characteristic-prime-realization), Rational and integral p-Tate comparison;
[F1](#layer-f1-characteristic-prime-realization), Characteristic-prime invariant of a simple
endomorphism algebra; [ClassFieldTheory, layer
10](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants).

### F3.3 Frobenius polynomial determines the isogeny class

Two abelian varieties over F_q are F_q-isogenous exactly when their Frobenius characteristic
polynomials agree.

([Tate][Tate], Theorem 1(c), printed p.139 (PDF p.6)).

*Needs:* [F0](#layer-f0-finite-field-frobenius-and-tate), Frobenius polynomial and reciprocity;
[F0](#layer-f0-finite-field-frobenius-and-tate), Tate at a split Frobenius prime.

### F3.4 Commutative endomorphisms in the nonreal prime-field case

If A/F_p is simple and Q(Frob) has no real embedding, End⁰_Fp(A)=Q(Frob) is a CM field.

([Waterhouse][Waterhouse], Chapter 2, printed pp.527–528 (PDF pp.8–9)).

*Needs:* [F1](#layer-f1-characteristic-prime-realization), Rational and integral p-Tate comparison;
[F1](#layer-f1-characteristic-prime-realization), Characteristic-prime invariant of a simple
endomorphism algebra; [ClassFieldTheory, layer
10](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants).

### F3.5 Prime-field p-realization Frobenius polynomial

For A/F_p define the prime-field linear dual by D^lin(A)=Hom_ℤp(C(A),ℤ_p), with transpose F and V.
For f:A→B its covariant map is the transpose C(f)^*:D^lin(A)→D^lin(B). Its API consists of the following laws.

- Composition is covariant.
- The finite free double dual recovers C(A).
- Frobenius and Verschiebung are transposed without interchanging them.

Identify these maps after inverting p, including compatibility with quasi-isogenies and integral lattices (Waterhouse §§1.2,3.1, pp.524–525,529–531; WM Part II,
pp.60–61).

**Checks.**

- For A=0 the dual module is zero and the marking gives its unique lattice.
- On a rank-one étale module over 𝔽_p, (F,V)=(1,p); linear duality retains (1,p),
  whereas Cartier duality exchanges it with the multiplicative pair (p,1).
- For C(f):C(B)→C(A) and C(g):C(C)→C(B), transposition sends C(f)C(g) to
  C(g)^*C(f)^*, giving D^lin(g∘f)=D^lin(g)D^lin(f); the identity marking acts as 1.

For A/F_p the linear Frobenius F on C(A)⊗Q_p, and hence its transpose on D^lin(A), is semisimple
and has characteristic polynomial equal to the intrinsic degree-2dim(A) Frobenius polynomial
P_A(T)∈Z[T] occurring on every V_ℓ(A), ℓ≠p.

([WM][WM], PartII, printed pp.60–61 (PDF pp.8–9), scans).

*Needs:* [F1](#layer-f1-characteristic-prime-realization), Characteristic polynomial on the
p-realization; **FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2.10 `dieudonnePDivisible`;
[F1](#layer-f1-characteristic-prime-realization), Frobenius adapter on the isocrystal.

### F3.6 Marked quasi-isogenies classified by lattices

Isomorphism classes of pairs (B,f:B→A₀ a rational quasi-isogeny over F_q), with (B,f)≅(B′,f′)
when f′u=f for an F_q-isomorphism u:B→B′, correspond to X_p×X^p by Λ_ℓ=f_ℓ(T_ℓB) and
Λ_p=C(f)⁻¹(C(B)). This bijection is equivariant for postcomposition on f and the action
specified in the prime-to-p and p lattice spaces above.

([Waterhouse][Waterhouse], §1.2 and §3.1, printed pp.524–525,529–531 (PDF pp.5–6,10–12)).

*Needs:* [F3](#layer-f3-hondatate-and-lattice-classifications), Prime-to-p and p lattice spaces;
**FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.1.2 `etaleGroupEquivContAction`;
**FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2.10 `dieudonnePDivisible`;
**AbelianSchemesAndArithmeticModuli**, A3; [F0](#layer-f0-finite-field-frobenius-and-tate), Tate full
faithfulness over finite fields; [F1](#layer-f1-characteristic-prime-realization), Integral Tate full
faithfulness at the characteristic prime.

### F3.7 Finite-support lattice tuples are realized over the prime field

Fix A₀/F_p. Let M_ℓ be full π-stable Z_ℓ-lattices in V_ℓ(A₀) for ℓ≠p and M_p a full F,V-stable
Z_p-lattice in D^lin(A₀), equal to the reference realization lattices T₀,ℓ at all but finitely
many primes. There exist B/F_p and a rational quasi-isogeny f:B→A₀ with transported realization
lattices f_ℓ(T_ℓB)=M_ℓ, including D^lin at p.

([Waterhouse][Waterhouse], §3.1 and Theorem 6.1 proof, printed pp.530–531,550–551
(PDF pp.11–12,31–32)).

*Needs:* [F3](#layer-f3-hondatate-and-lattice-classifications), Prime-to-p and p lattice spaces;
**FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.1.2 `etaleGroupEquivContAction`;
**FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2.10 `dieudonnePDivisible`;
[F3](#layer-f3-hondatate-and-lattice-classifications), Prime-field p-realization Frobenius polynomial;
[F1](#layer-f1-characteristic-prime-realization), Integral Tate full faithfulness at the
characteristic prime; **AbelianSchemesAndArithmeticModuli**, A3.

### F3.8 Realization of nonreal prime-field orders

In the preceding simple F_p-isogeny class, every order R in Q(Frob) containing Frob and p/Frob
occurs as End_Fp(A′) for some A′ in that class.

([Waterhouse][Waterhouse], Theorem 6.1 and proof, printed pp.550–551 (PDF pp.31–32)).

**Checks.**

- For a unital local order R_ℓ, multiplication by x preserves R_ℓ exactly
  when x∈R_ℓ: necessity follows by applying it to 1, and sufficiency from
  closure under multiplication. Thus the multiplier order of the chosen
  lattice is R_ℓ itself, including when R_ℓ is nonmaximal.
- Take p=5, K=ℚ(ζ₅), π=√5 ζ₅ and R=ℤ[π,5/π]. Both generators are
  integral, every conjugate of π has modulus √5, and π²/5=ζ₅² gives
  ℚ(π)=K. At the unique prime above 5, normalized by v(5)=4, both
  generators have valuation 2. Every element of R⊗ℤ₅ is congruent to a
  scalar in ℤ₅ modulo the valuation-2 ideal, so none has valuation 1;
  the maximal order contains 1−ζ₅ of valuation 1. Prime-to-5 isogenies
  preserve the 5-divisible group and its endomorphism order, so a maximal
  order model cannot reach R by prime-to-5 changes alone.
- For p=2, K=ℚ(i), π=1+i and 2/π=1−i give R=ℤ[i]. With v(2)=2,
  both π and 2/π have valuation 1; this time R is maximal at 2. The
  all-prime construction includes this case without an odd-prime hypothesis.

*Needs:* [F3](#layer-f3-hondatate-and-lattice-classifications), Commutative endomorphisms in the
nonreal prime-field case; [F3](#layer-f3-hondatate-and-lattice-classifications), Finite-support
lattice tuples are realized over the prime field; F3.5's prime-field
linear realization; F0.7 and F1.9 for the integral Hom dictionary at all primes.

### F3.9 Isomorphism classes as rational orbits

The underlying F_q-isomorphism classes in the isogeny class of A₀ are End⁰(A₀)^×∖(X_p×X^p).

([Waterhouse][Waterhouse], §3.1, printed pp.530–532 (PDF pp.11–13)).

*Needs:* [F3](#layer-f3-hondatate-and-lattice-classifications), Prime-to-p and p lattice spaces;
[F3](#layer-f3-hondatate-and-lattice-classifications), Marked quasi-isogenies classified by lattices.

### F3.10 Prime-field marked and unmarked classification

For A₀/F_p, the transport map is a bijection from isomorphism classes of marked pairs (B,f:B→A₀
a rational quasi-isogeny) to the finite-support lattice tuples of the finite-support prime-field
realization theorem above. Here (B,f)≅(B′,f′) means an F_p-isomorphism u:B→B′ with f′u=f. Under
this bijection Γ=End⁰_Fp(A₀)^× acts by postcomposition, and Γ-orbits are precisely underlying
F_p-isomorphism classes in the isogeny class of A₀.

([Waterhouse][Waterhouse], §3.1 and Theorem 6.1, printed pp.530–532,550–551 (PDF
pp.11–13,31–32)).

*Needs:* [F3](#layer-f3-hondatate-and-lattice-classifications), Prime-to-p and p lattice spaces;
[F3](#layer-f3-hondatate-and-lattice-classifications), Finite-support lattice tuples are realized over
the prime field; [F3](#layer-f3-hondatate-and-lattice-classifications), Isomorphism classes as
rational orbits.

### F3.11 Construction requirements

The existence assertion must construct an abelian variety over the stated finite field for each
Weil q-number and prove its multiplicity; a reciprocal polynomial alone does not provide
existence. Construct the prescribed CM type, its polarized realization and an
effective power by F3.1a–F3.1c, then use F3.1d's Weil restriction to descend
effectivity to F_q and select a simple factor. Only then use the characteristic-prime invariant and the real-place invariants to determine the
division-algebra index e and hence dimension. For marked lattices, clear denominators and
realize the resulting finite flat subgroup using the quotient theorem A3 and the integral
realizations R07.1–R07.2. Prove the resulting integral Hom dictionary in both directions before
passing to rational orbits. Over F_p define D_lin = Hom_Zp(C, Z_p) and transpose F and V; this
is linear duality. Preserve V-integrality as well as F-stability. For a nonreal simple
prime-field class put K=ℚ(π). Identify each rational realization with the rank-one
K⊗ℚ_ℓ module, using D^lin at p with F=π and V=p/π. For any order R containing
π and p/π, choose the lattice R_ℓ=R⊗ℤ_ℓ at every exceptional prime, including
p when necessary, and keep the reference lattices elsewhere. The reference
multiplier orders agree with R_ℓ outside finitely many primes. Apply F3.7 to
this finite-support tuple; stability follows from π,p/π∈R. The identity
(R_ℓ:R_ℓ)=R_ℓ and integral Tate at every prime identify the resulting
endomorphism order with R. Taking R=O_K also gives maximal-order existence
(Waterhouse, Theorem 6.1 proof, printed pp.550–551).

### Examples

The zero-dimensional variety gives one marked lattice tuple; the identity marking gives the reference lattices. An infinitely supported tuple cannot come from a quasi-isogeny (Waterhouse §§1.2,3.1).

### Dependencies

F3.1a–F3.1d construct Honda existence from GlobalNumberFields Layer 1, the parent
A5.1–A5.3 and A6.32–A6.33, and ShimuraVarieties §§5.5–5.8, before classification.
F0 and F1 supply full faithfulness at every prime; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2 supplies torsion realization and Dieudonné lattices; AbelianSchemesAndArithmeticModuli A3 supplies finite-flat quotients. ClassFieldTheory Layer 10 supplies the invariant sum used in Honda–Tate. Marked realization precedes rational orbits and the prime-field order theorem.

## Layer F4: Adelic class sets and local bounds

Specialize the adelic point and double-quotient theory to G = End⁰(A₀)^×. Separate the number of
adelic lattice orbits, the index of each integral stabilizer and the fixed-level rational class
set. Repeated roots require a discriminant quantity that stays nonzero.

### F4.1 Adelic class set of the endomorphism group

For G=(End⁰(A₀))^× and an adelic lattice L, the global orbits inside its G(A_fin)-orbit are
G(Q)\G(A_fin)/Stab(L).

- A finite adele in E^×(A_f) determines its double coset modulo left E^×(Q) and right K.

- g,h have the same class iff h=e g k for e∈E^×(Q),k∈K.

- K is the restricted product of the automorphism groups of the chosen local lattices, including the p-component.

**Checks.**

- Any rational unit e∈E^×(Q) has the identity class.
- Changing a local lattice by conjugation replaces K by its conjugate
and induces the corresponding class-set bijection.
- For a nonmaximal order R the entire full-lattice class monoid can
include nonprojective lattices and need not be Pic(R). A single fixed local genus may have its
own double-coset class set; in the commutative genus of R itself this is Pic(R).

([LT][LT], §3 and §3.2(15), v1 pp.6,11).

*Needs:* [F3](#layer-f3-hondatate-and-lattice-classifications), Isomorphism classes as rational
orbits; [AdelicAlgebraicGroups,
AA.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-1-adelic-points-of-algebraic-groups).

### F4.2 The prime-field p-component reduction

For A₀/F_p, F is Q_p-linear and V=pF^(−1); hence the simultaneous centralizer of F,V is the
centralizer of F, and its orbits on F,V-stable lattices form a subset of its orbits on F-stable
lattices.

([LT][LT], Remark 3.2, v1 p.11).

*Needs:* [F1](#layer-f1-characteristic-prime-realization), Rational and integral p-Tate comparison;
[F1](#layer-f1-characteristic-prime-realization), Characteristic polynomial on the p-realization;
[F3](#layer-f3-hondatate-and-lattice-classifications), Prime-field p-realization Frobenius polynomial.

### F4.3 Discriminant and ordered-root bounds

If K=Q(π), π is an integral p-Weil number of degree d, then |D_K|≤|disc
minpoly(π)|≤(2√p)^(d(d−1)). More generally, for an integer q≥1 and a monic integral polynomial of degree m all of
whose root occurrences λ_i have modulus √q, the positive integer `D_*=|∏_{i,j:λ_i≠λ_j}(λ_i−λ_j)|`
satisfies `D_*≤(2√q)^{m(m−1)}`. Unequal root values retain occurrence multiplicities; the ordinary
discriminant may vanish.

([Lee][Lee], §2.1 and §3.1–3.2, PDF pp.3,5–6, especially equation(11)).

*Needs:* [F0](#layer-f0-finite-field-frobenius-and-tate), Frobenius polynomial and reciprocity.

### F4.4 Local semisimple stable-lattice bounds

Prove the local semisimple stable-lattice bounds: for a semisimple operator γ on a finite-dimensional ℚ_ℓ-space with characteristic polynomial `∏f_i^{n_i}`, distinct monic irreducible f_i∈ℤ_ℓ[X], and `Δ_ℓ=Σn_i²v_ℓ(disc f_i)+2Σ_{i<j}n_in_jv_ℓRes(f_i,f_j)`: its linear centralizer has at most `ℓ^{2Δ_ℓ}` orbits of γ-stable full ℤ_ℓ-lattices and each stabilizer lies in a conjugate of a fixed maximal compact with index `≤ℓ^{Δ_ℓ}`; the proof must use successive projected lattices pr_i(M∩V_≤i), including repeated factors and ℓ=2 (LT §§3.1–3.2.1, pp.7–14, especially Lemma 3.1 and (15)–(20), as a strengthened local adaptation).

Its API separates the orbit bound from the stabilizer bound and gives one orbit with
maximal-compact stabilizer when Δ_ℓ=0. Use the primary decomposition and successive projected lattices with their invariant
factor profiles, and retain field-discriminant and cross-resultant contributions separately.

**Checks.**

- For a scalar integral operator on ℚ_ℓ^n, Δ_ℓ=0: GL_n(ℚ_ℓ) acts transitively on lattices,
  with stabilizer GL_n(ℤ_ℓ).
- For an unramified irreducible factor with any multiplicity, Δ_ℓ=0 and its stable lattices
  are free over the unramified integer ring; there is one centralizer orbit.
- The operator diag(0,ℓ) on ℚ_ℓ² has cross-resultant valuation one and Δ_ℓ=2;
  the lattice spanned by (1,ℓ⁻¹),(0,1) is stable but is not the sum of its intersections
  with the two eigenspaces. The projected-lattice construction retains this gluing at ℓ=2.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §2.5; rational primary decomposition;
Mathlib and Tau Ceti discriminant and resultant identities.

### F4.5 Finite-support adelic stabilizers in a prime-field isogeny class

For A₀/F_p and the prime-field lattice space X, use Tate full faithfulness at all primes to
identify G(Q_ℓ), G the Q-algebraic unit group of End⁰_Fp(A₀), with the linear Frobenius
centralizer. If λ₁,…,λ_m are all Frobenius root occurrences, let `D_*=|∏_{i,j:λ_i≠λ_j}(λ_i−λ_j)|`,
a positive integer; equal values are omitted and unequal values retain their occurrence
multiplicities. There is a compact open K₀=∏H₀,ℓ of G(A_f) such that every M∈X has
Stab(M)=∏S_M,ℓ contained in a conjugate K_M=a_M K₀a_M^(−1), with a_M∈G(A_f) supported at
finitely many places, S_M,ℓ=H_M,ℓ almost everywhere, and [K_M:Stab(M)]≤D_*. Moreover
#G(A_f)\X≤D_*².

([LT][LT], §§3.1–3.2.1, v1 pp.7–14; local orbit/stabilizer adaptation).

*Needs:* [F4](#layer-f4-adelic-class-sets-and-local-bounds), Adelic class set of the endomorphism
group; [F3](#layer-f3-hondatate-and-lattice-classifications), Prime-to-p and p lattice spaces;
[F3](#layer-f3-hondatate-and-lattice-classifications), Prime-field marked and unmarked classification;
[F4](#layer-f4-adelic-class-sets-and-local-bounds), The prime-field p-component reduction;
F4, Local semisimple stable-lattice bounds; [AdelicAlgebraicGroups,
AA.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-1-adelic-points-of-algebraic-groups);
[AdelicAlgebraicGroups,
AA.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-4-approximation-neat-levels-and-hecke-maps);
[F0](#layer-f0-finite-field-frobenius-and-tate), Tate full faithfulness over finite fields;
[F3](#layer-f3-hondatate-and-lattice-classifications), Prime-field p-realization Frobenius polynomial.

### F4.6 Class-set comparison by reduced norms

Let K₀=Q(√p), D₀/K₀ the quaternion algebra ramified at both real places and split at every
finite place, and d≥2. With maximal finite compact U₀,d=∏_v GL_(2d)(O_(K₀,v)), reduced norm
identifies GL_d(D₀)(K₀)\GL_d(D₀)(A_(K₀,fin))/U₀,d with the narrow ideal class group Cl⁺(K₀). For
each CM field K_i, determinant identifies
GL_(n_i)(K_i)\GL_(n_i)(A_(K_i,fin))/GL_(n_i)(Ohat_(K_i)) with Cl(K_i). Their product gives the
mixed class set. The d=1 quaternion factor remains its own class set; d=0 omits it.

([LT][LT], §3.2.2(21), v1 p.14, maximal-compact and narrow-class conventions).

*Needs:* [F4](#layer-f4-adelic-class-sets-and-local-bounds), Adelic class set of the endomorphism
group; **GeometryOfNumbersAndQuadraticArithmetic**, §2.5; [AdelicAlgebraicGroups,
AA.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-4-approximation-neat-levels-and-hecke-maps).

### F4.7 Conditional rational-orbit bound from local lattices

Let a group G_f with subgroup Γ act on a lattice space X, with at most D_*² G_f-orbits. Suppose
h=#(Γ\G_f/K₀)<∞ for a fixed compact level K₀. For every orbit representative M assume
`Stab(M)=∏S_{M,ℓ}`, contained in `K_M=∏H_{M,ℓ}=a_M K₀ a_M⁻¹` with a_M∈G_f, equality `S_{M,ℓ}=H_{M,ℓ}`
away from finitely many primes, and `∏[H_{M,ℓ}:S_{M,ℓ}]≤D_*`. Then Γ\X is finite and #Γ\X≤D_*³h.
If the relevant Weil-lattice tuple satisfies these assumptions and `D_*≤(2√p)^{m(m−1)}`, the
resulting conditional bound is `#Γ\X≤(2√p)^{3m(m−1)}h`.

The abstract counting lemma needs only a group action, finitely many G_f-orbits and double
cosets, and stabilizers contained with finite index at most D_* in conjugates of K₀. The local
product decomposition supplies that index hypothesis. State finiteness separately from the
numerical index bound: Mathlib's subgroup index and `Nat.card` assign zero to infinite quotients.

([LT][LT], §3.2(15),(20)–(21),(28), v1 pp.11,14,16; coarse orbit-count adaptation).

*Needs:* [F4](#layer-f4-adelic-class-sets-and-local-bounds), Adelic class set of the endomorphism
group; [AdelicAlgebraicGroups,
AA.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-4-approximation-neat-levels-and-hecke-maps).

### F4.8 Coarse prime-field isomorphism count at fixed adelic level

For A₀/F_p of dimension g>0, put m=2g, take D_* and K₀ from the finite-support adelic stabilizer
theorem above, and suppose h=#(G(Q)\G(A_f)/K₀) is finite. Then the number of F_p-isomorphism
classes in the isogeny class of A₀ is at most `D_*³h≤(2√p)^{3m(m−1)}h`. Class-set finiteness is
imported from AA.3 with its exact group hypotheses; no numerical bound on h is included.

([Lee][Lee], §3.1(5)–(10), PDF pp.4–5; coarse orbit-count adaptation).

*Needs:* [F3](#layer-f3-hondatate-and-lattice-classifications), Prime-field marked and unmarked
classification; [F4](#layer-f4-adelic-class-sets-and-local-bounds), Finite-support adelic stabilizers
in a prime-field isogeny class; [F4](#layer-f4-adelic-class-sets-and-local-bounds), Conditional
rational-orbit bound from local lattices; [F4](#layer-f4-adelic-class-sets-and-local-bounds),
Discriminant and ordered-root bounds; [AdelicAlgebraicGroups,
AA.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-3-reduction-and-arithmetic-quotients).

### F4.9 Construction requirements

The local contract F4’s local semisimple lattice theorem requires the successive projected lattices pr_i(M ∩ V_≤i), with their
induced quotient profiles, rather than the generally smaller intersections M ∩ V_i. Factor the
local characteristic polynomial as ∏ f_i^n_i with distinct monic irreducibles, put δ_i = v_ℓ
disc(f_i), ρ_ij = v_ℓ Res(f_i,f_j), and Δ_ℓ = ∑ n_i² δ_i + `2∑_{i<j}` n_i n_j ρ_ij. Bound local
orbit counts by ℓ^(2Δ_ℓ) and stabilizer indices by ℓ^Δ_ℓ. AA.1 and AA.4 assemble only finitely
many nontrivial local conjugators; obtain globally at most D_*² orbits and total stabilizer
index at most D_*. At p use the prime-field linear-dual centralizer, while keeping F- and
V-stable integral lattices. Reduced norms give ordinary ideal classes in the CM matrix case and
narrow classes for the real quaternion case in matrix degree at least two; dimension one and
zero have their separate cases. AA.3 gives fixed-level class-set finiteness. A quantitative
bound for that class set must be established explicitly before it can enter a uniform counting
estimate.

### Examples

For P=(X²+p)² the ordinary discriminant is zero but D_*=(4p)^4>0; unequal values retain both root occurrences (Lee §3.2(11), repeated-root adaptation).

### Dependencies

F0–F3 supply Frobenius, integral full faithfulness and lattice classification. GeometryOfNumbersAndQuadraticArithmetic §2.5 supplies invariant factors; the semisimple bounds are proved in this layer. AdelicAlgebraicGroups AA.1,AA.3,AA.4 supplies restricted products, class-set finiteness and approximation. Discriminant, local stabilizer and fixed-level inputs precede rational-orbit counting.

## Layer F5: Polarizations and CM powers

Finite-field descent connects symmetric homomorphisms with line bundles. Rosati and unit norm
classes then control squarefree polarizations. Class-number-one CM fields provide elliptic
factors, and the Hermitian mass interface counts their principal polarizations. Keep weighted
masses distinct from unweighted isomorphism counts.

### F5.1 Lang surjectivity for an abelian variety

For B/F_q, the morphism Frob_q−1 on B is an étale surjective isogeny, hence H¹(F_q,B)=0 for the
actual Galois torsor cohomology.

([Conrad][Conrad], Theorem 2.6 proof, PDF p.8; explicit abelian specialization of
Lang).

*Needs:* **AbelianSchemesAndArithmeticModuli**, A3.

### F5.2 Units that are norms modulo norms of units (Lemmermeyer)

Let L/K be a cyclic extension of number fields of prime degree. There is an exact sequence 1 →
Am_st(L/K) → Am(L/K) → (E_K ∩ N_(L/K)L^×)/N_(L/K)E_L → 1, where Am(L/K) ⊂ Cl(L) is the group of
ambiguous ideal classes and Am_st(L/K) its subgroup of strongly ambiguous classes. In particular
(E_K ∩ N L^×)/N E_L is a subquotient of Cl(L) and its order is at most h(L).

([Lemmermeyer][Lemmermeyer], Proposition 1 and proof, PDF pp.1–3).

*Needs:* [ClassFieldTheory, layer
13](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-13-norm-theorems-and-class-fields).

### F5.3 Density of primes splitting in a class-number-one CM field

For the nine fields Q(√−d), d∈{1,2,3,7,11,19,43,67,163}, each of class number one, the defining
square classes are independent in Q×/(Q×)². Outside the finite ramified-prime set, the rational
primes splitting in at least one field have natural density 1−2^(−9).

([LT][LT], Lemma 5.11, v1 p.33).

*Needs:* **ImaginaryQuadraticClassNumber**, H3.6 (maximal-order certificates);
[Chebotarev, layer
14](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/Chebotarev/README.md#layer-14-natural-density-and-consistency-theorems).

### F5.4 Elliptic curve with class-number-one endomorphisms

If a prime p splits in an imaginary quadratic class-number-one field L, there exists E/F_p with
End_Fp(E)=O_L, obtained from a norm-p algebraic integer and Waterhouse order realization.

([Waterhouse][Waterhouse], Chapter 2, Porism 4.3 and Theorem 6.1, printed
pp.527–528,540,550–551).

*Needs:* [F0](#layer-f0-finite-field-frobenius-and-tate), Weil q-numbers;
[F3](#layer-f3-hondatate-and-lattice-classifications), Honda–Tate simple isogeny classification;
[F3](#layer-f3-hondatate-and-lattice-classifications), Realization of nonreal prime-field orders.

### F5.5 Elliptic point groups in odd characteristic

Let p be an odd prime and E/F_p an elliptic curve. Then E(F_p) and E(F_(p²)) are not both
p-groups. For p = 2 the statement is false exactly for the curves with trace a = ±1, for example
y²+xy = x³+x²+1 (a = 1), with #E(F_2) = 2 and #E(F_4) = 8.

([LT][LT], Lemma 5.19, v1 p.36, with the odd-characteristic restriction).

*Needs:* [F0](#layer-f0-finite-field-frobenius-and-tate), Frobenius polynomial and reciprocity;
**DeligneWeightsAndPurity**, DWP.1 target 1.5 (extension-field point counts).

### F5.6 Line-bundle realization over a finite field

For A over a finite field, every symmetric isogeny A→A∨ is φ_L for some line bundle over that
field.

([Conrad][Conrad], Lemma 2.3 and Theorem 2.6, PDF pp.6–8).

*Needs:* [F5](#layer-f5-polarizations-and-cm-powers), Lang surjectivity for an abelian variety;
**AbelianSchemesAndArithmeticModuli**, A2.

### F5.7 CM Hermitian mass and class asymptotics

Prove the CM Hermitian mass and unweighted class asymptotics: for fixed imaginary quadratic class-number-one K and positive-definite unimodular rank-g O_K-Hermitian lattices, with the unitary mass formula under specified measures including all ramified and dyadic local factors, a bound exp(O_K(g²)) for the number of genera and uniform local-factor errors, log M_K(g)=½g²log g+O_K(g²) for the sum of the weighted genus masses, |Aut L|≤exp(O_K(g log(g+1))), and M_K(g)≤H_K(g)≤(max_L|Aut L|)M_K(g) for the unweighted GL_g(O_K)-class count, hence log H_K(g)=½g²log g+O_K(g²) as g→∞; g=0 has one class and mass one (LT §§5.3–5.5, (38)–(40), (42), (50), Lemma 5.8 and (52)–(55), pp.26–33, with the factorial correction specified in F5).

Construct the unitary mass on the imported Hermitian lattice and adelic carriers, normalize
its Haar measures by the local factors in LT (38)–(40), and prove the all-genus and
unweighted comparisons with their displayed error terms. Retain the genus bound, local-factor errors, automorphism bound and unweighted comparison as
separate interfaces; no replacement of a unitary group by an orthogonal group enters.

**Checks.**

- Rank zero has one class, automorphism order one and mass one.
- Over ℤ[i], rank one has one class and automorphism group of order four, hence mass 1/4.
- The factorial contribution for g=2 is 0!1!=1; its logarithm in rank g is
  Σ_(k=1)^(g−1)(g−k)log k, with leading coefficient 1/2.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §§2.7,3.3 for Hermitian carriers and
weighted genus sums; AdelicAlgebraicGroups AA.1,AA.3; LT §§5.3–5.5, including ramified and
dyadic local factors and the genus enumeration proof.

### F5.8 Principal polarizations on CM elliptic powers

Fix a prime p splitting in one of the imaginary quadratic fields K = Q(√−d) with d ∈
{1,2,3,7,11,19,43,67,163}. Construct E/F_p with End_Fp(E) = O_K. If N_p(g) counts
F_p-isomorphism classes of principal polarizations on E^g, prove log N_p(g) = (1/2)g² log g +
O_p(g²). The count is unweighted and uses the Hermitian orbit dictionary and its mass
comparison. The endpoint from F5.7 states that for fixed class-number-one K,
`log H_K(g)=½g²log g+O_K(g²)`. The polarization theorem proves its transport
through the Rosati/Hermitian orbit dictionary.

LT (51) and (56) print coefficient 1. The factorial product in (39) gives
`Σ_(j=1)^g log((j−1)!)=½g²log g+O(g²)`; this is the coefficient required
here. The ramified local factors, genus count and automorphism bound enter
through F5’s CM Hermitian mass theorem, not an orthogonal mass formula.

**Checks.**

- Rank zero has one form and one polarization, with logarithm zero.
- For K=ℚ(i), the rank-one unimodular positive form [1] has automorphism group of order 4;
  mass 1/4 and class count 1 distinguish weighted and unweighted counts.
- The factorial product for g=2 is 0!1!=1; in general its logarithm is
  `Σ_(k=1)^(g−1)(g−k)log k`, fixing the leading coefficient 1/2.

([LT][LT], §§5.3–5.5, equations(39),(51)–(56), v1 pp.26–33
(LT line 1067, LT line 1243, LT line 1418)).

*Needs:* [F5](#layer-f5-polarizations-and-cm-powers), Elliptic curve with class-number-one
endomorphisms; [F5](#layer-f5-polarizations-and-cm-powers), Density of primes splitting in a
class-number-one CM field; F5, CM Hermitian mass and class asymptotics;
**AbelianSchemesAndArithmeticModuli**, A6.14 `rosatiPositivity`;
**AbelianSchemesAndArithmeticModuli**, A6.18 `polarizedAutomorphisms`;
**AbelianSchemesAndArithmeticModuli**, A3.9 `Polarization.rosati`.

### F5.9 Squarefree nonreal polarization bound

For A/F_p of dimension g, with no repeated simple F_p-isogeny factor and Frobenius polynomial
coprime to X²−p, let n_A be the number of F_p-isomorphism classes of principal polarizations on
A. There are absolute positive constants C₀,C with n_A≤C₀p^(Cg²). If A admits no principal
polarization set n_A=0.

([LT][LT], Proposition 4.11, Example 4.13 and Proposition 4.16, v1 pp.20–23).

*Needs:* [F5](#layer-f5-polarizations-and-cm-powers), Line-bundle realization over a finite field;
[F3](#layer-f3-hondatate-and-lattice-classifications), Commutative endomorphisms in the nonreal
prime-field case; [F5](#layer-f5-polarizations-and-cm-powers), Units that are norms modulo norms of
units (Lemmermeyer); [F4](#layer-f4-adelic-class-sets-and-local-bounds), Discriminant and ordered-root
bounds; [Completed/EffectiveBounds, layer
1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/EffectiveBounds/README.md#layer-1-effective-upper-bounds-the-first-migration-targets);
**AbelianSchemesAndArithmeticModuli**, A6.14 `rosatiPositivity`;
**AbelianSchemesAndArithmeticModuli**, A6.18 `polarizedAutomorphisms`;
**AbelianSchemesAndArithmeticModuli**, A3.9 `Polarization.rosati`;
[F4](#layer-f4-adelic-class-sets-and-local-bounds), Finite-support adelic stabilizers in a prime-field
isogeny class.

### F5.10 Construction requirements

For Lang use that Frobenius − 1 is an étale surjective isogeny and translate it into the
procyclic torsor dictionary. Prove finite-field Brauer vanishing and the line-bundle descent
obstruction calculation, including characteristic two. A symmetric isogeny gives a line bundle;
positivity is needed before calling it ample. The ambiguous class sequence uses ideal Hilbert 90
and distinguishes ambiguous from strongly ambiguous classes. For squarefree polarization counts
combine maximal-order unit-square indices, local conductor/norm estimates and class-number
bounds, in the CM field rather than its real subfield.

The CM existence application must supply an element of norm p and its realizable endomorphism
order. Treat p = 3 separately in the odd-characteristic p-group test; characteristic two has the
indicated counterexample. For E^g prove the exact Rosati/Hermitian orbit dictionary, including
integral positivity and unimodularity, then use F5’s CM Hermitian mass theorem
for all local factors and conversion from weighted masses to unweighted counts. The leading logarithmic coefficient is
1/2, with an O_p(g²) error; the mass alone is not the unweighted count.

### Examples

Over ℤ[i], the rank-one form has mass 1/4 and one unweighted class. At p=2, trace 1 gives point counts 2 over 𝔽₂ and 8 over 𝔽₄, disproving the odd-prime assertion there (LT §5 and Lemma 5.19).

### Dependencies

F0–F4 supply Frobenius, endomorphism orders, local lattice bounds and discriminants. AbelianSchemesAndArithmeticModuli A2,A3,A6.14,A6.18 supplies line bundles, Rosati and finite polarized automorphisms; ClassFieldTheory Layer 13 supplies norm theory; Completed/EffectiveBounds Layer 1 supplies class-number bounds. ImaginaryQuadraticClassNumber H3.6 and Chebotarev Layer 14 supply the density inputs. The unitary mass theorem precedes its CM-polarization transport.

## Layer F6: Counting isogeny and isomorphism classes

Count characteristic polynomials by their first g power sums and q-reciprocity, then use
ordinary realizability for the matching isogeny-class lower bound. For isomorphism classes
assemble the local lattice and fixed-level arithmetic estimates uniformly. Polarization growth
on CM elliptic powers then compares the squarefree nonreal locus with all principally polarized
classes.

### F6.0 Geometric class carriers

Define `AbelianVarietiesOfDimension k g` as the subtype of the pinned
`TauCeti.AlgebraicGeometry.AbelianVariety k` with native dimension g, for a field k
and g∈ℕ. Fix the universe of k and its schemes throughout. The dimension condition
uses the finite value g in `WithBot ℕ∞`; the zero abelian variety and product dimensions
use AbelianSchemesAndArithmeticModuli A1.

- Forgetting the dimension proof recovers the original abelian variety over k.
- Membership is exactly equality of its geometric dimension with g.
- Equality of members uses native subtype extensionality.

**Checks.**

- The zero abelian variety has dimension 0 and belongs in dimension 0.
- An elliptic curve has dimension 1 and does not belong in dimension 0.
- A product of two elliptic curves has dimension 2 and is excluded in dimension 1;
  counting factors instead of dimension would admit the wrong objects.

Define `AbelianIsogenyClasses k g` as the native quotient of these varieties by the
relation generated by k-homomorphisms that are finite and surjective. Isogenies
between abelian varieties form an equivalence relation, so equality of classes
means existence of a k-isogeny; separability is not imposed (Waterhouse, §1.1,
printed pp.522–524; Tate, Theorem 1(c), printed p.139).

- The class map has source the dimension-g subtype and target this quotient.
- Every class has a representative, and two representatives give the same class
  exactly when they are k-isogenous.
- Isomorphisms give the same isogeny class; the defining relation includes
  inseparable isogenies in characteristic p.

**Checks.**

- The identity of a zero-dimensional variety gives its own class, and dimension 0
  has one class; discarding dimension zero would incorrectly give no class.
- Multiplication by p on a positive-dimensional abelian variety in characteristic p
  is an isogeny, even though it is inseparable; a separability condition would exclude it.
- Over 𝔽₅ the curves y²=x³+x and y²=x³+4x have respectively 4 and 8 rational points,
  hence distinct 𝔽₅-isogeny classes. Their geometric isomorphism does not identify them here.

Define `AbelianIsomorphismClasses k g` as the native quotient by isomorphisms of
abelian varieties over k, with no marking or polarization included (Lee, §1,
PDF p.1; Lee line 20).

- The class map has source the dimension-g subtype and target this quotient.
- Every class has a representative, and equality of classes means existence of a
  k-isomorphism.
- The class ignores a chosen polarization, while retaining the k-group structure.

**Checks.**

- The zero abelian variety contributes one class, with logarithmic count log 1=0.
- The two preceding elliptic curves give distinct 𝔽₅-isomorphism classes; passing to
  an algebraic closure would identify their geometric classes and change this count.
- Changing only the polarization on a fixed abelian variety gives the same unpolarized
  class; counting polarized pairs instead would count a different object.

*Needs:* Tau Ceti's abelian-variety dimension, homomorphism category and isogeny predicate;
AbelianSchemesAndArithmeticModuli A3 for symmetry of the isogeny relation;
native quotients and subtype extensionality.

### F6.1 Reconstruction from integer power sums

For any integers q,g≥0 and a monic degree-2g integer polynomial satisfying the coefficient
relations a_(2g−i)=q^(g−i)a_i for 0≤i≤g in descending convention, its first g power sums
determine the entire polynomial. The q=0 case is a coefficient statement; finite-field
applications require a prime power q≥2. Newton recurrence
i·a_i=−∑_(j=1)^i a_(i−j)s_j determines a_i over Q, and reciprocity determines the remaining
coefficients.

([LT][LT], Lemma 2.1 proof, v1 p.5; coefficient adapter to Newton identities).

*Needs:* `MvPolynomial.mul_esymm_eq_sum`.

### F6.2 Counting Weil polynomials by power sums

Prove `weilPolynomialCount` in the following generality.

For q≥2 and g≥1, the number of monic q-reciprocal integer polynomials (q^gP(X)=X^(2g)P(q/X)) of
degree 2g with constant q^g and all roots of absolute value √q is at most (4g+1)^g q^(g(g+1)/4).

**Checks.**

- For q=2 and g=1, the five polynomials X²−tX+2 with t∈{−2,−1,0,1,2}
  satisfy the conditions; 5≤5√2. Requiring ordinary realizability would discard t=0,±2.
- For q=3 and g=1 there are seven such polynomials, and 7≤5√3. A bound
  omitting the count of integer endpoints need not cover all seven traces.
- For q=2 and g=2, (X²+2)²=X⁴+4X²+4 is included despite its repeated roots;
  a squarefree-only polynomial set would change the counting object.

([LT][LT], Lemma 2.1 and proof, v1 p.5, power-sum counting adaptation).

*Needs:* [F0](#layer-f0-finite-field-frobenius-and-tate), Frobenius polynomial and reciprocity;
[F6](#layer-f6-counting-isogeny-and-isomorphism-classes), Reconstruction from integer power sums.

### F6.3 Asymptotic count of isogeny classes

For fixed q, the number of dimension-g F_q-isogeny classes is at most exp((log q)g²/4+O_q(g log
g)).

([LT][LT], Corollary 2.2, v1 p.5, using the power-sum count).

*Needs:* [F0](#layer-f0-finite-field-frobenius-and-tate), Frobenius polynomial and reciprocity;
[F6](#layer-f6-counting-isogeny-and-isomorphism-classes), Counting Weil polynomials by power sums;
[F3](#layer-f3-hondatate-and-lattice-classifications), Frobenius polynomial determines the isogeny
class.

### F6.4 Coarse isomorphism counts and conditional numerical assembly

For a fixed prime p let B(p,g) be the number of F_p-isomorphism classes of g-dimensional abelian
varieties. Prove `isomorphismClassCount`: these classes are finite for every g∈ℕ and
log B(p,g) = O_p(g²) as g→∞. Also prove the following
conditional numerical assembly: if the maximal size I_p(g) of a dimension-g isogeny class
satisfies I_p(g) ≤ 2^(34g²) p^(17g²(1+ε_g)) for an error ε_g → 0 uniform across those classes,
then B(p,g) ≤ 2^(34g²) p^((69/4)g²(1+o(1))). The first assertion uses coarse uniform lattice and
class-number estimates; the second explicitly assumes the sharper uniform estimate.

([Lee][Lee], Theorem 1.1 and §3.1(5)–(10), contrasted with §3.2(11), PDF pp.1–9).

*Needs:* F6.0, Geometric class carriers;
[F6](#layer-f6-counting-isogeny-and-isomorphism-classes), Counting Weil polynomials by
power sums; [F4](#layer-f4-adelic-class-sets-and-local-bounds), Coarse prime-field isomorphism count
at fixed adelic level; [F4](#layer-f4-adelic-class-sets-and-local-bounds), Class-set comparison by
reduced norms; [F4](#layer-f4-adelic-class-sets-and-local-bounds), Discriminant and ordered-root
bounds; [Completed/EffectiveBounds, layer
1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/EffectiveBounds/README.md#layer-1-effective-upper-bounds-the-first-migration-targets).

### F6.5 DiPippo–Howe lower bound for isogeny classes

For n ≥ 1 and a prime power q, let O(q,n) be the set of ordinary n-dimensional F_q-isogeny
classes. Put c₄ = e^(−3/2), c₅ = 2 + √2 and r(q) = φ(q)/q. Prove #O(q,n) > c₄(c₅n)^(−2 log 2/log
q)(2^n/n!)(r(q)q^(n/2) − n)q^(n(n−1)/4). Combining this with the power-sum upper bound proves
`isogenyClassAsymptotic`: for every fixed finite field k of cardinality q, all dimension-g
isogeny-class sets are finite and log #Isog(k,g)/g² tends to (log q)/4 as g→∞.
The value at g=0 is 0 under native total real division, since there is one class and log 1=0;
the limit concerns g→∞. This is equivalent to log #Isog(q,g) = (1/4)g² log q + o_q(g²).

([DPH][DPH], Theorem 1.3; Lemmas 2.1.1/2.1.3/2.5.1–3; Proposition 3.1.1; §3.2, PDF
pp.2,4,13–18).

*Needs:* F6.0, Geometric class carriers;
[F3](#layer-f3-hondatate-and-lattice-classifications), Honda–Tate simple isogeny
classification; [F6](#layer-f6-counting-isogeny-and-isomorphism-classes), Asymptotic count of isogeny
classes.

### F6.6 Asymptotic exclusion of squarefree nonreal ppavs

Fix a prime p for which the CM elliptic-power polarization estimate of F5 holds, in particular a
prime splitting in at least one of the nine class-number-one CM fields. As g → ∞, the proportion
of dimension-g principally polarized F_p-isomorphism classes whose underlying variety has no
repeated F_p-simple isogeny factor and whose Frobenius polynomial is coprime to X² − p tends to
zero.

([LT][LT], Proposition 4.17 and Lemma 5.11, v1 pp.22–23,33, using the Hermitian mass
coefficient).

*Needs:* [F5](#layer-f5-polarizations-and-cm-powers), Squarefree nonreal polarization bound;
[F6](#layer-f6-counting-isogeny-and-isomorphism-classes), Asymptotic count of isogeny classes;
[F5](#layer-f5-polarizations-and-cm-powers), Principal polarizations on CM elliptic powers;
[F6](#layer-f6-counting-isogeny-and-isomorphism-classes), Coarse isomorphism counts and conditional
numerical assembly.

### F6.7 Construction requirements

Evaluate the existing Newton recurrence on root occurrences, convert its signs to descending
coefficients and reconstruct the remaining coefficients by reciprocity. The DiPippo–Howe lower
bound needs the boundary control of the real-root region, weighted diamond lattice counts and
the ordinary realizability criterion, including the continuation of its finite-n proof. Retain
the possibly negative right side for small n; logarithms are taken only once it is positive. For
the coarse isomorphism count combine the exact local lattice and class-number bounds from F4–F5.
The numerical 69/4 specialization assumes a uniform per-isogeny-class bound with exponent 17,
then adds the independently proved isogeny-class exponent 1/4. Class-set finiteness or the
abstract D_*³h estimate alone does not imply that uniform numerical hypothesis. For the ppav
proportion retain both excluded factors: repeated F_p-simple factors and the real factor X² − p.

### Examples

For g=1 the polynomial is X²−tX+q, reconstructed from s₁=t, with |t|≤2√q. The number of possible integer traces is at most 4√q+1≤5√q (LT Lemma 2.1).

### Dependencies

F0 supplies integer Frobenius polynomials; F3 supplies Honda–Tate and the isogeny criterion; F4–F5 supplies uniform lattice, class-number and polarization bounds. Mathlib’s Newton identity precedes coefficient reconstruction. The DiPippo–Howe realizability and region estimates precede the isogeny lower bound; the sharper numerical isomorphism assembly retains its uniform extra hypothesis.

## Downstream consumers

The completed coefficient sheaves, moments and ordinary CM translations supply
Eisenstein–Kronecker constructions. Intrinsic Betti ranks, degeneracy loci and curve-difference
non-degeneracy supply height and Mordell–Lang applications. Finite-field realization and lattice
classification supply polarized moduli, arithmetic point counting and integral isogeny arguments.
All consumers use the complete maps and all-prime realization interfaces stated above.

## References

Page numbers above refer to the linked version. Printed journal pages are identified
explicitly when they differ from PDF page numbers. The v1 counting arguments are used
with the separate polynomial, repeated-root, small-characteristic and mass hypotheses
stated in F4–F6. LT v1 (51) and (56) have a leading-coefficient
misprint; F5 derives 1/2 from (39) rather than using the printed 1.

- **Hatcher**: Allen Hatcher, *Algebraic Topology* (2002), §2.B, Theorem 2B.3,
  printed p.172 (chapter PDF p.76). [Author-hosted chapter][Hatcher].

- **MilneJV**: James S. Milne, *Jacobian Varieties*, author version dated June 12, 2021,
  Theorem 12.1, p.38, and §13, pp.40–44. [MilneJV][MilneJV].

- **Tits**: Jacques Tits, *Free subgroups in linear groups*. Journal of Algebra 20 (1972), 250–270, Theorem 1, p.250, and Theorem 3, p.251 (uncertified). [Tits][Tits].

- **Roby**: Norbert Roby, *Lois polynomes et lois formelles en théorie des modules*. Annales ENS (3) 80 (1963), 213–348. Chapter III §§5–6, Proposition III.1 and Proposition IV.5, printed pp.251–255,272–273. [Roby][Roby].
- **Kings**: Guido Kings, *Eisenstein classes, elliptic Soulé elements and the ℓ-adic elliptic polylogarithm*. arXiv:1304.7161v2 (2013), §2.2, pp.9–11. [Kings][Kings].
- **Deligne**: Pierre Deligne, *Théorie de Hodge : II*. Publications Mathématiques de l'IHÉS 40 (1971), 5–57; Corollary 4.1.2, Theorem 4.2.6, Corollary 4.2.9(a) and Rappel 4.4.3, printed pp.42,45,48,51. [Deligne][Deligne].

- **KS**: Guido Kings and Johannes Sprang, *Eisenstein–Kronecker classes, integrality of critical values of Hecke L-functions and p-adic interpolation*. Annals of Mathematics (2) 202 (2025), no. 1, 1–109. [KS][KS].

- **DGH**: Vesselin Dimitrov, Ziyang Gao and Philipp Habegger, *Uniformity in Mordell–Lang for curves*. Annals of Mathematics 194 (2021), no. 1, 237–298. [DGH][DGH].

- **GH**: Ziyang Gao and Philipp Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*. Annals of Mathematics 189 (2019), no. 2, 527–604. [GH][GH].

- **LT**: Michael Lipnowski and Jacob Tsimerman, *How large is A_g(F_q)?*. Duke Mathematical Journal 167(18) (2018), 3403–3453. [LT][LT].

- **GGK**: Ziyang Gao, Tangli Ge and Lars Kühne, *The Uniform Mordell–Lang Conjecture*. Publications Mathématiques de l'IHÉS 143 (2026), 189–235. [GGK][GGK].

- **Gao–Betti**: Ziyang Gao, *Generic rank of Betti maps and unlikely intersections*. arXiv:1810.12929v6. [Gao–Betti][Gao–Betti].

- **Gao–Ax**: Ziyang Gao, *Ax–Schanuel for the universal abelian variety*. arXiv:1806.01408v2. [Gao–Ax][Gao–Ax].

- **Lee**: Jungin Lee, *On the lower bound of the number of abelian varieties over F_p*. arXiv:2002.04420v3. [Lee][Lee].

- **DPH**: Stephen A. DiPippo and Everett W. Howe, *Real polynomials with all roots on the unit circle and abelian varieties over finite fields*. arXiv:math/9803097v3. [DPH][DPH].

- **Lemmermeyer**: Franz Lemmermeyer, *The ambiguous class number formula revisited*. arXiv:1309.1071v1. [Lemmermeyer][Lemmermeyer].

- **ConradTrace**: Brian Conrad, *Chow’s K/k-image and K/k-trace, and the Lang–Néron theorem*. Enseignement Mathématique 52 (2006), 37–108; author version, Definition 6.1, Theorems 6.2, 6.4 and 7.1, pp.20–23. [ConradTrace][ConradTrace].

- **Conrad**: Brian Conrad, *Polarizations*. 2004 publicly available notes. [Conrad][Conrad].

- **TateHonda**: John Tate, *Classes d’isogénie des variétés abéliennes sur un corps fini (d’après T. Honda)*. Séminaire Bourbaki 1968/69, exposé 352, published 1971, pp.95–110; §3 Lemmas 1–3 and §4 Lemmas 4–6, printed pp.100–105. [TateHonda][TateHonda].

- **Tate**: John Tate, *Endomorphisms of abelian varieties over finite fields*. Inventiones Mathematicae 2 (1966), 134–144. [Tate][Tate].

- **Waterhouse**: William C. Waterhouse, *Abelian varieties over finite fields*. Annales ENS (4) 2 (1969), 521–560. [Waterhouse][Waterhouse].

- **WM**: William C. Waterhouse and James S. Milne, *Abelian varieties over finite fields*. 1971, Part II, printed pp.60–61. [WM][WM].

- **Milne**: James S. Milne, *Extensions of abelian varieties defined over a finite field*. Inventiones Mathematicae 5(1968), 63–84; author-hosted published scan. [Milne][Milne].

- **Gao–Survey**: Ziyang Gao, *Recent developments of the Uniform Mordell–Lang Conjecture*. arXiv:2104.03431v5. [Gao–Survey][Gao–Survey].
[Hatcher]: https://pi.math.cornell.edu/~hatcher/AT/ATch2.pdf
[ConradTrace]: https://math.stanford.edu/~conrad/papers/Kktrace.pdf
[Tits]: https://doi.org/10.1016/0021-8693(72)90058-0
[Roby]: https://www.numdam.org/item/10.24033/asens.1124.pdf
[Kings]: https://arxiv.org/pdf/1304.7161v2
[Deligne]: https://www.numdam.org/item/PMIHES_1971__40__5_0.pdf
[KS]: https://arxiv.org/pdf/1912.03657v4
[DGH]: https://arxiv.org/pdf/2001.10276v3
[GH]: https://arxiv.org/pdf/1801.05762v3
[LT]: https://arxiv.org/pdf/1511.02212v1
[GGK]: https://pmihes.centre-mersenne.org/item/10.5802/pmihes.26.pdf
[Gao–Betti]: https://arxiv.org/pdf/1810.12929v6
[Gao–Ax]: https://arxiv.org/pdf/1806.01408v2
[Lee]: https://arxiv.org/pdf/2002.04420v3
[DPH]: https://arxiv.org/pdf/math/9803097v3
[Lemmermeyer]: https://arxiv.org/pdf/1309.1071v1
[Conrad]: https://virtualmath1.stanford.edu/~conrad/vigregroup/vigre04/polarization.pdf
[TateHonda]: https://numdam.org/item/SB_1968-1969__11__95_0.pdf
[Tate]: https://pazuki.perso.math.cnrs.fr/index_fichiers/Tate66.pdf
[Waterhouse]: https://www.numdam.org/item/ASENS_1969_4_2_4_521_0.pdf
[WM]: https://jmilne.org/math/articles/1971a.pdf
[Milne]: https://jmilne.org/math/articles/1968a.pdf
[Gao–Survey]: https://arxiv.org/pdf/2104.03431v5

Library declaration locations:

- [`TensorPower`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/TensorPower/Basic.lean).
- [`PiTensorProduct.reindex`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean).
- [`PiTensorProduct.reindex_tprod`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean).
- [`PiTensorProduct.map_reindex`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean).
- [`LinearMap.eqLocus`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Module/Submodule/EqLocus.lean).
- [`Submodule.mem_iInf`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Module/Submodule/Lattice.lean).
- [`DividedPowerAlgebra`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- [`AddCircle`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Topology/Instances/AddCircle/Defs.lean).
- [`Polynomial.resultant`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Polynomial/Resultant/Basic.lean).
- [`PadicInt.appr_spec`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/Padics/RingHoms.lean).
- [`TauCeti.symmetricTensors`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean).
- [`PadicInt.valuation`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/Padics/PadicIntegers.lean).
- [`MvPolynomial.mul_esymm_eq_sum`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/MvPolynomial/Symmetric/NewtonIdentities.lean).

- [`TauCeti.TensorPower.oneEquiv`, `TensorPower.splitAt`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/LinearAlgebra/TensorPower/Basic.lean).
- [`Polynomial.Monic.resultant_deriv`, `Algebra.discr_powerBasis_eq_minpoly_discr`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/Polynomial/Resultant/Discriminant.lean).
- [`TauCeti.AlgebraicGeometry.AbelianVariety`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean).
- [`TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean).
- [`PadicInt.compactSpace`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/Padics/ProperSpace.lean).

[MilneJV]: https://www.jmilne.org/math/xnotes/JVs.pdf
