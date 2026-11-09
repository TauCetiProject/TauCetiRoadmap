# Roadmap: bordism, formal groups and chromatic operations

**Summary.** Complex bordism and the Lazard ring carry the same object,
the universal one-dimensional commutative formal group, and this roadmap
develops the coefficient and operation theory that connects them. On top
of the pinned Tau Ceti formal-group tree (the Lazard ring, logarithms,
heights and height ideals) it proves Lazard's classification of formal
groups over separably closed fields by their height. It constructs the
mod-p Steenrod algebras and Adams towers, computes π_*MO and π_*MU, and
proves Quillen's theorems that the real and complex orientations carry the
universal exponent-two and commutative formal laws, with the Conner–Floyd
and graded Eilenberg–MacLane comparisons for MO. It develops p-typical
coordinates, the Brown–Peterson, Johnson–Wilson and Morava K-theories with
their cooperations, Toda brackets and the Adams–Novikov spectral sequence;
it proves Landweber's classification of invariant prime ideals, the
Landweber filtration and exact functor theorems, and the Lubin–Tate
deformation theorem. It ends with the chromatic theorems: homological
Bousfield localization, the Devinatz–Hopkins–Smith nilpotence theorem, the
Hopkins–Smith thick-subcategory and periodicity theorems, the
Hopkins–Ravenel smashing theorem and the chromatic fracture square, the
Greenlees–Sadofsky/Kuhn Tate vanishing, and torus Euler cancellation on
finite MU pieces with its module-extension nullhomotopies. A chosen
complex orientation is data; its formal group does not by itself prove a
coefficient-ring universality theorem or supply an E∞ orientation.

## Scope and ownership

This roadmap owns, by layer: F1, the height classification of
one-dimensional commutative formal groups over separably closed fields,
built on the pinned Tau Ceti formal-group tree, which F1 consumes by name
and never plans again; F2, complex and real orientations with their
formal laws, the mod-p Steenrod algebras and HF_p-based Adams towers, the
unoriented coefficient ring MO_*, Thom's and Quillen's coefficient
theorems for MO and MU, and the Conner–Floyd and graded Eilenberg–MacLane
comparisons; F3, p-typical coordinates, Brown–Peterson theories and their
cooperations; F4, comodule algebra, the Adams–Novikov spectral sequence,
the three-fold Toda brackets of pointed spaces and the higher Toda
operations; F5, invariant prime ideals, Landweber exactness and the
algebraic Lubin–Tate deformation theory; F6, homological Bousfield
localization, the nilpotence theorem with its James-construction proof,
thick subcategories and periodicity, Johnson–Wilson theories, the
smashing theorem and the chromatic fracture square, local group actions
with their Tate comparisons, and the torus Euler cancellation on finite
MU pieces with its module-extension nullhomotopy application.

It leaves to other roadmaps, which it cites by section where it consumes
them: GeneralizedCohomology G2–G5 supplies spectral models, derived
smash/function objects, represented theories, projective/Thom
orientations, MU and its multiplicative model, connective K spectra and
generic spectral Postnikov covers, and G2.11's enriched, quasicategorical,
straightening, monoidal-localization and operadic foundations.
TopologicalKTheory's Conventions fix the Bott class β=[O(−1)]−1 on
CP¹=S² that F2 uses for K-theory's multiplicative law. AlgebraicTopology
supplies ordinary (co)homology with cup products, Stage 5.5's Serre
spectral sequences, Stage 8.7's finite CW type of compact smooth
manifolds and Stage 8.8–8.10's Eilenberg–MacLane models and
representability; CharacteristicClasses C3 supplies the Stiefel–Whitney
classes and the mod-2 cohomology of BO(n) and BO. TangentialBordism
consumes F1–F2's formal laws, Steenrod and Adams carriers and coefficient
rings; it owns geometric cycles, the Pontryagin–Thom comparison and the
integral oriented/Spin coefficient calculations, none of which is an
input here. StringOrientation consumes F3–F5 and owns the Hovey
specialization to MString and its geometric Cayley-plane kernel.
EllipticCohomology owns elliptic realization, descent and tmf; it
consumes formal-group exactness and deformation theory here, and the
Bauer bracket forms of F4 are its applications, not generic definitions.
EllipticCurves owns the elliptic logarithm and exponential instances of
the pinned generic formal-group API and consumes nothing here. Nothing
geometric (manifolds, cycles, transversality) is constructed here.

The generic foundations under F6.5 item 1 are GeneralizedCohomology
G2.11's, which keeps their sub-lane headings; a citation of one of them
resolves as follows (old → new):

- F6.5 item 1, **Categorical model and functor spaces** → GeneralizedCohomology G2.11, **Categorical model and functor spaces**.
- F6.5 item 1, **Enriched diagram foundations before straightening** → GeneralizedCohomology G2.11, **Enriched diagram foundations before straightening**.
- F6.5 item 1, **Unmarked straightening and the categorical model** → GeneralizedCohomology G2.11, **Unmarked straightening and the categorical model**.
- F6.5 item 1, **Marked fibrations and Kan extensions** → GeneralizedCohomology G2.11, **Marked fibrations and Kan extensions**.
- F6.5 item 1, **Coherent model diagrams and stable enhancements**, with its Kan extensions and pointwise comma-category formula, its stable quotients, Ind, monoidal and operadic sub-lanes → GeneralizedCohomology G2.11, **Coherent model diagrams and stable enhancements**.

## Conventions

Formal groups are Mathlib's `FormalGroup R`, one-dimensional over a
commutative ring R, with `FormalGroup.IsComm` where commutativity is a
hypothesis; homomorphisms, isomorphisms and strict isomorphisms are Tau
Ceti's bundled ones. A prime p is fixed within each layer that mentions
it, and p=2 is treated by its own constructions wherever the odd-prime
argument divides by two. Spectra, smash products and function spectra are
GeneralizedCohomology G2's model and its homotopy category; a complex
orientation of a ring spectrum is data, a chosen class in cohomological
degree 2 restricting to the unit on CP¹. G abbreviates
GeneralizedCohomology: "G's model" is GeneralizedCohomology's model, and
Gk or Gk.n is its layer Gk or item k.n.

Use homological grading: |v_i|=2(p^i−1), |b_i|=2i and a complex
orientation in cohomological degree 2. A formal-group coefficient a_ij has
homological degree 2(i+j−1). For graded coefficients, retain the direct-sum
graded ring and the homogeneous-degree equations; do not replace a
completed projective-space cohomology ring by a direct sum. Formal-group
coordinates, p-typical generators and strict coordinate changes are specified
choices, with explicit comparison maps between choices.

## Exact supplier contracts

- **From Mathlib:** `FormalGroup R`, `FormalGroup.IsComm`,
  `FormalGroup.Point`, `FormalGroup.map`, `FormalGroup.𝔾ₐ` and
  `FormalGroup.𝔾ₘ` (`Mathlib/RingTheory/FormalGroup/Basic.lean`), and
  `MvPowerSeries (Fin 2) R` with the existing substitution and coefficient
  APIs; `IsSepClosed` and `CharP` for the field hypotheses of F1's
  classification. A `FormalGroup R` is one-dimensional and carries no
  commutativity: `IsComm` is a separate class. For F5's two headlines:
  `Ideal.IsHomogeneous` (`Mathlib/RingTheory/GradedAlgebra/Homogeneous/Ideal.lean`)
  for the homogeneity of an ideal of the graded Lazard ring, `Ideal.IsPrime`,
  `Ideal.map` and `MvPolynomial.C` as the left unit; the Witt vectors
  `WittVector p k` with `WittVector.constantCoeff`
  (`Mathlib/RingTheory/WittVector/Basic.lean`), `PerfectRing`
  (`Mathlib/FieldTheory/Perfect.lean`), `MvPowerSeries` with
  `MvPowerSeries.constantCoeff` and `MvPowerSeries.X`, and the complete
  noetherian local test rings through `IsLocalRing`,
  `IsLocalRing.maximalIdeal`, `IsNoetherianRing` and `IsAdicComplete`
  (`Mathlib/RingTheory/AdicCompletion/Basic.lean`; it bundles
  Hausdorffness with precompleteness).
- **From Tau Ceti:** the formal-group tree `TauCeti.RingTheory.FormalGroup`:
  the bundled homomorphisms `TauCeti.FormalGroupHom` and isomorphisms
  `TauCeti.FormalGroupIso` (strict ones through
  `TauCeti.FormalGroupIso.IsStrict`, module `Hom`), the inverse series
  `FormalGroup.addInvX` (module `AddInv`), the n-series
  `FormalGroup.nsmulSeries` (module `NSMul.Basic`), the topologically
  nilpotent point carrier `FormalGroup.TopNilpotentPoint` (module
  `TopNilpotentPoint.Basic`), coordinate changes `TauCeti.FormalCoordinate`
  (module `TauCeti.RingTheory.PowerSeries.Coordinate.Basic`) with their
  action on formal groups (module `CoordinateChange.Basic`), the Lazard ring `TauCeti.LazardRing`
  (modules `LazardRing.Basic`, `LazardRing.Polynomial`,
  `LazardRing.Indecomposable`), its coordinate-change Hopf algebroid with
  the right unit `TauCeti.LazardRing.rightUnit` (module
  `CoordinateChange.Lazard`) and the invariance of the height ideals
  `TauCeti.LazardRing.map_rightUnit_heightIdeal` (module
  `CoordinateChange.HopfAlgebroid`), the symmetric cocycle lemma (module
  `SymmetricCocycle.Classification`), the invariant differential,
  logarithm and exponential (modules `Logarithm.Basic`,
  `Logarithm.Naturality`, `Logarithm.InfiniteHeight`), the exponent-two
  logarithm and its universal ring (modules `ExponentTwo.Basic`,
  `ExponentTwo.Iso`, `ExponentTwo.Universal`), the height
  `FormalGroup.height` and height ideals `FormalGroup.heightIdeal`
  (modules `Height.Basic`, `Height.Ideal`) with Landweber's generators
  `FormalGroup.heightIdeal_one`, `FormalGroup.heightIdeal_eq_span` and
  `FormalGroup.heightIdeal_succ_eq_sup_of_sub_mem` and the coordinate
  independence `FormalGroup.heightIdeal_smul`, the Frobenius factorization
  (module `Frobenius.Factorization`), the obstruction and
  leading-difference lemmas (modules `Obstruction`, `LeadingDifference`)
  and the rigidity of isomorphisms over a Hausdorff local ring
  `TauCeti.FormalGroupIso.eq_of_map_residue_eq` (module `Rigidity`).
  F1 names each consumed declaration where it is used; the height is
  defined over a field, and the classification's separable closure is a
  hypothesis of this roadmap's target, not of the library's height.
- **From TauCetiRoadmap.GeneralizedCohomology:** G2–G5 and G2.11 as
  described under Scope and ownership: G2's spectral model and cofiber
  sequences, G2.7's mod-p Eilenberg–MacLane spectrum, G3.3's arbitrary-CW
  comparison, G3.8's Milnor sequence and connective covers, G3.9's derived
  p-completion, G4's projective-bundle comparison and G4.3's Thom
  isomorphism, G5.1's finite Spanier–Whitehead duality, and G5.3–G5.5 and
  G5.7's Thom models, Thom product, canonical orientations, module
  families and extension classification. G3 owns integer
  spectral localization and derived p-completion; it supplies no chromatic
  localization or smashing theorem.
- **From TauCetiRoadmap.AlgebraicTopology:** ordinary (co)homology with
  cup products, Stage 5.5's cohomological Serre spectral sequence of a
  fibration, Stage 8.7's finite CW type of compact smooth manifolds with
  or without boundary (F6.6's finite CW models), Stage 8.8's bar/CW models
  and Stage 8.10's universal classes and representability of
  Eilenberg–MacLane spaces.
- **From TauCetiRoadmap.CharacteristicClasses:** C3's Stiefel–Whitney
  classes, the Whitney formula and `H^*(BO(n);𝔽₂)=𝔽₂[w₁,…,w_n]`.
- **From TauCetiRoadmap.TopologicalKTheory:** the Conventions' Bott class
  β=[O(−1)]−1 on CP¹=S².
- **From TauCetiRoadmap.ProfiniteCohomology:** the continuous-cohomology
  carrier and the closed-subgroup and cohomological-dimension tools that
  F6.4's Morava stabilizer computation consumes.
- **From TauCetiRoadmap.RepresentationTheory:** SchurWeyl Layers 0, 2 and 5
  (Young diagrams, Young symmetrizers and the hook formula) for F6.3's
  Smith idempotents; CompactGroups Layers 1–2 (unitarizability, complete
  reducibility and the circle Fourier-series engine) for F6.6's torus
  characters.
- **From TauCetiRoadmap.DGAInfinity:** Layer 8's matric and higher Massey
  defining systems, consumed by F4's higher Toda operations.

## How to read the build

F1 precedes F2. F2 constructs the mod-p Steenrod algebras, the HF_p-based
Adams towers and the unoriented coefficient ring from AlgebraicTopology's
ordinary cohomology and G's HF_p, MO and MU models, and supplies F3's
spectra/cooperations. F3's BP-homology AHSS uses these construction
targets and precedes F3's space-homology presentation, which in turn
precedes F4's Adams–Novikov/comodule applications. Within F2 Thom's
computation of π_*MO precedes Quillen's unoriented theorem, within F4 the
comodule category and the Adams–Novikov tower precede the Massey/Toda
comparisons that use them, and within F5 the Ext⁰ computations and the
MU transport precede the classification on the Lazard ring. G3 owns integer
spectral localization, derived p-completion and π-holim/Milnor, with its
actual ring/module and convergence comparisons; consume it before MU_(p)
and keep F4's BP-nilpotent completion and its identification as new targets.
F6.1 builds homological localization from G2's model and its own
cardinality inputs. F6.2's nilpotence proof consumes G5's Thom and
complex Bott models and its own James construction;
its X(r)-based towers and E₂ Thom refinements are new constructions.
F6.3 first constructs the quotient-operation stable homology
comparison and the P(n)/B(n)/E(n) class comparisons from F3/F5,
before height forms, finite support or Moore
systems. Its Smith toolkit and F2's Steenrod/Adams carriers supply
the separate linear-connectivity theorem, type examples and initial
periodic maps; then thick classification, periodicity transport and
Moore systems and their system-level MU/BP map comparisons follow.
Finite-local telescope comparison, Moore pro-recovery and the actual
Moore-dual Γ_k^fS model are then proved in F6.3 before F6.4’s
finite chromatic filtration and its source N/M comparison.
F6.4 consumes those class comparisons, actual cofinal Moore systems,
finite type examples and F5 exactness, then builds
algebraic stabilizer/change-of-rings/prenilpotence before smashing
and fracture. Its continuous cohomology consumes ProfiniteCohomology,
and its idempotent adapters consume SchurWeyl's earlier native
Young-diagram/symmetrizer/hook APIs. F6.5 consumes GeneralizedCohomology
G2.11's simplicial Bergner, Kan-enriched diagram/internal-hom and enriched
Grothendieck/localization homotopy (co)limit foundations, its unmarked and
marked straightening and Joyal model, coherent model-diagram rectification
and (co)limit comparison, Cat∞ colimits/descent/Kan extensions,
space-valued Ind, coCartesian monoidal/relative-adjoint constructors and
colored-operad rectification of supplied strict associative rings/modules;
it does not rectify arbitrary homotopy rings. It first constructs the
induced-object tensor ideal and lax Tate functor, then the
countable-cell/Milnor realization of the earlier homology comparison and ordinary Borel norm/Euler model before applying
F6.4's prenilpotent seed and finite height tower. The Morava E∞ realization lane
of EllipticCohomology remains downstream. F5 exactness uses F1–F4, while its algebraic
deformation lane begins with F1 independently of the spectral realization.
StringOrientation's coefficient calculation and EllipticCohomology's spectrum construction consume
these layers; neither is an input to Lazard, Quillen or BP construction.

F6.6 consumes the earlier F1–F3/F5 coefficient/comodule constructions,
F6.3's generic p-typical ring map/action and F6.4's generic coefficient
polynomial/monomial foundation, together with G5.1's finite duality and G5.7
module-family/Thom adapters. Its coefficient proof does not consume the
chromatic localization, strong-smashing or Tate applications. F6.5's
Tate lane consumes G2.11's generic enhancement and has no F6.6 or
geometric input.
F6.7 consumes F6.6 plus G5.7's extension classification. The Euler proof
uses the generic coefficient constructions and the stated
module-family/duality inputs.

## F1. Formal-group algebra and universality

Everything in this layer except the height classification at its end is a
theorem of the pinned Tau Ceti, in the modules of
`TauCeti.RingTheory.FormalGroup` named below; consume it by name. The
remaining target, Lazard's classification over separably closed fields, is
the layer's only headline.

**n-series, inverses, homomorphisms and points.** The n-series [n]_F is
`FormalGroup.nsmulSeries` (module `NSMul.Basic`), the value of n times the
coordinate point `FormalGroup.tautologicalPoint` of `FormalGroup.Point F Unit`
(module `AddInv`); `nsmulSeries_zero` and `nsmulSeries_succ` are the
recursion [0]_F=0, [n+1]_F=F([n]_F,X), `constantCoeff_nsmulSeries` and
`coeff_one_nsmulSeries` give zero constant coefficient and linear
coefficient n, `nsmulSeries_add` and `nsmulSeries_mul` are the addition law
[m+n]_F=F([m]_F,[n]_F) and the composition law [mn]_F=[m]_F∘[n]_F for every
formal group, `map_nsmulSeries` (module `NSMul.BaseChange`) is base change,
and for a commutative F `FormalGroup.nsmulHom` is [n]_F as an endomorphism
of F. For a commutative F and a prime p, `natCast_dvd_coeff_nsmulSeries`
says p divides the coefficient of X^k in [p]_F whenever p∤k,
`exists_nsmulSeries_eq_of_prime` writes [p]_F=p·X·u+X^p·h with u(0)=1 over
every ring, and `exists_order_nsmulSeries_eq_pow` (module `Height.Basic`)
says that when p=0 in R and [p]_F≠0 its order is a power of p; the general
form of Ravenel's Lemma A2.2.7 for a nonzero homomorphism f:F→G over a
field of characteristic p is
`TauCeti.FormalGroupHom.exists_iso_comp_iterateFrobeniusHom` (module
`Frobenius.Factorization`): f=g∘Frob^h for some h with ord f=p^h and an
isomorphism g from the h-fold Frobenius twist of F to G, and g is unique
once h is fixed by the order
(`existsUnique_iso_comp_iterateFrobeniusHom_of_order`, same module). The
inverse series is
`FormalGroup.addInvX`, with `subst_addInvX_X_eq_zero`, linear coefficient
−1 (`coeff_one_addInvX`), base change `map_addInvX` and the group structure
on `FormalGroup.Point F σ`; the integer-indexed series are
`FormalGroup.zsmulSeries` (module `ZSMul`) with `zsmulSeries_neg_one`,
`zsmulSeries_add` and `zsmulSeries_mul`. A homomorphism is
`TauCeti.FormalGroupHom F G` (module `Hom`): a series with zero constant
term intertwining the two laws, with identity, composition, the induced
map `applyPoint` on points, base change `FormalGroupHom.map` and
`coeff_one_comp`; an isomorphism is `TauCeti.FormalGroupIso F G`, a
forward and an inverse homomorphism whose substitutions are mutually
inverse, with `symm`, `trans`, `isUnit_coeff_one`, `FormalGroupHom.toIso`
(a homomorphism with unit linear coefficient is an isomorphism), the class
`IsStrict` (linear coefficient one) and base change `FormalGroupIso.map`.
A coordinate change is `TauCeti.FormalCoordinate R` (a series with zero
constant term and unit linear coefficient; module
`TauCeti.RingTheory.PowerSeries.Coordinate.Basic`) acting on `FormalGroup R`
by φ•F=φ(F(φ⁻¹X,φ⁻¹Y)) (module `CoordinateChange.Basic`), with
`FormalGroup.smulIso : FormalGroupIso F (φ • F)` and
`isStrict_smulIso_iff`; `exists_iso_lifting_coordinate` (module
`CoordinateChange.Lifting`) lifts a coordinate change of the reduction
along a surjection with surjective unit map. Points in a complete
Hausdorff linearly topologized R-algebra A are
`FormalGroup.TopNilpotentPoint F A` (module `TopNilpotentPoint.Basic`): the
topologically nilpotent elements of A under x+_Fy=F(x,y), with the group
laws proved by evaluating the power-series identities, the convergent-sum
characterisations `hasSum_val_add` and `hasSum_val_neg`, functoriality
`TopNilpotentPoint.map` along continuous algebra maps, the comparison
`pointEquivTopNilpotentPoint` with `FormalGroup.Point F σ`, the induced
continuous homomorphisms `toTopNilpotentPointHom` and equivalences
`toTopNilpotentPointContinuousAddEquiv` (modules `TopNilpotentPoint.Hom`
and `TopNilpotentPoint.Topology`).

**Lazard ring, cocycle lemma and Hopf algebroid.** `TauCeti.LazardRing`
(module `LazardRing.Basic`) is the quotient of ℤ[a_ij : i,j≥1] by the
commutativity and associativity relations `LazardRing.relations` of
X+Y+Σa_ij X^iY^j; `LazardRing.formalGroup` is the universal commutative
law and `TauCeti.LazardRing.lift` is the natural bijection
{F : FormalGroup R // F.IsComm} ≃ Hom_ring(L,R), with `map_lift`,
`coe_lift_symm` and the naturality `lift_map`. The grading
`LazardRing.grading` puts a_ij in degree 2(i+j−1), is a `GradedAlgebra`,
and `gradedLift` is the graded universal property for graded coefficient
rings. Lazard's polynomial theorem is `TauCeti.LazardRing.mvPolynomialEquiv`,
an isomorphism of ℤ-algebras from the polynomial ring on ℕ+ sending the n-th
variable to `LazardRing.generator n` of degree 2n (module `Indecomposable`,
with `generator_mem_grading` and the cotangent basis `cotangentBasis` of
the augmentation ideal modulo its square), with the integral independence
`algebraicIndependent_generator` (module `Independence`). The homogeneous
symmetric additive 2-cocycle lemma is `TauCeti.existsUnique_eq_smul_lazardCocycle`
(module `SymmetricCocycle.Classification`): over every commutative ring R a
homogeneous symmetric additive 2-cocycle of degree n≥2 is uniquely r·C_n
for `TauCeti.lazardCocycle n R`, C_n=((X+Y)^n−X^n−Y^n)/d_n with
d_n=`TauCeti.lazardGcd n` (p when n is a power of the prime p,
`lazardGcd_prime_pow`, and 1 otherwise,
`lazardGcd_eq_one_of_not_isPrimePow`), including torsion coefficient
rings; `map_lazardCocycle` is its base change and `aeval_diag_lazardCocycle`
its diagonal value. Strict coordinate changes are represented by
L[b₁,b₂,…]=`MvPolynomial ℕ+ LazardRing` with the universal strict
coordinate `TauCeti.FormalCoordinate.universalStrictCoordinate` (module
`TauCeti.RingTheory.PowerSeries.Coordinate.Universal`) and the bijection
`TauCeti.LazardRing.coordinateChangeLift` (module `CoordinateChange.Lazard`);
the Hopf-algebroid structure maps are `LazardRing.rightUnit`, `counit`,
`coproduct` and `conjugation` (modules `CoordinateChange.Lazard` and
`CoordinateChange.HopfAlgebroid`), with `coproduct_coassoc`, the counit
laws `tensorLift_counit_id_comp_coproduct` and
`tensorLift_id_counit_comp_coproduct`, the antipode laws
`tensorLift_conjugation_id_comp_coproduct` and
`tensorLift_id_conjugation_comp_coproduct`, `conjugation_conjugation`,
`counit_conjugation` and `conjugation_comp_rightUnit`; the gradings
`coordinateGrading` and `coordinateTensorGrading` (module
`CoordinateChange.Grading`) put b_i in degree 2i, and the structure maps
are graded (modules `CoordinateChange.Homogeneous` and
`CoordinateChange.Coproduct`). F2 identifies this Hopf algebroid with
(MU_*, MU_*MU).

**Invariant differential, logarithm and exponential.**
`FormalGroup.invariantDifferential` (module `Logarithm.Basic`) is
P(T)=F_X(0,T)⁻¹ for every formal group over every ring, with P(0)=1
(`constantCoeff_invariantDifferential`), the invariance
P(F(X,Y))·F_X(X,Y)=P(X) for every F (`subst_invariantDifferential_mul_pderiv`)
and, for commutative F, P(F(X,Y))·F_Y(X,Y)=P(Y)
(`subst_invariantDifferential_mul_pderiv_one`), base change
`map_invariantDifferential`, and the values P=1 and P=(1+T)⁻¹ for the
additive and multiplicative groups (`invariantDifferential_𝔾ₐ`,
`invariantDifferential_𝔾ₘ`). Over a ℚ-algebra R, `FormalGroup.log` has
coefficient p_(n−1)/n in degree n≥1 where P=Σp_nT^n (`coeff_log`), zero
constant coefficient, linear coefficient one (`coeff_one_log`), derivative
P (`derivative_log`) and is additive along F (`subst_toPowerSeries_log`);
`subst_toPowerSeries_eq_add_iff` says a series g is additive along F
precisely when g=c·log_F for some c∈R (Ravenel, Theorem A2.1.6 for the
existence; the uniqueness of the strict logarithm is the one asserted in
the proof of Lemma A2.1.9); `FormalGroup.exp` is the substitution inverse
(`subst_exp_log`, `subst_log_exp`), `toPowerSeries_eq_subst_exp` is
F(X,Y)=exp_F(log_F(X)+log_F(Y)), `FormalGroup.logIso` is the bundled
strict isomorphism from F to the additive group (instance `IsStrict`) and
`eq_logIso` its uniqueness among strict isomorphisms to the additive
group; `map_log` and `map_exp` are base change. Naturality under
homomorphisms (`TauCeti.FormalGroupHom.subst_log`, and
`coeffOneEquiv`: over a ℚ-algebra the homomorphisms F→G between
commutative laws are classified by their linear coefficient) and under
coordinate change (`log_smul`: the logarithm of φ•F is φ'(0)·log_F(φ⁻¹X),
and `exp_smul`) are in module `Logarithm.Naturality`; the logarithm of a
rescaled law over rings without ℚ is module `Logarithm.Rescale`; the
examples `log_𝔾ₐ`, `exp_𝔾ₐ`, `log_𝔾ₘ`, `exp_𝔾ₘ` give T, T, log(1+T)
and e^T−1. Checks, as values that must agree with these declarations: for
the additive group P=1, log=T and exp=T; for the multiplicative group
X+Y+XY, P=(1+T)⁻¹, log_F=Σ_(n≥1)(−1)^(n+1)T^n/n and exp_F=e^T−1, and
P(F(X,Y))·F_X(X,Y)=(1+Y)/((1+X)(1+Y))=P(X), whereas the un-inverted
series 1+T fails invariance since (1+F(X,Y))(1+Y)≠1+X; over a ℚ-algebra
the additive series along the additive group are exactly the multiples
c·T, so T² is not additive, whereas X² is additive along X+Y precisely
over rings with 2=0, since (X+Y)²−X²−Y²=2XY, the setting of the
exponent-two paragraph below. The exponent-two construction below is a
separate integral argument; the ℚ-algebra logarithm does not apply there.

**Exponent two.** For a commutative F over any ring R with [2]_F=0 (which
forces 2=0 in R, `natCast_eq_zero_of_nsmulSeries_eq_zero`), the normalized
strict logarithm g_F(X)=X+Σ_(i≥1)a_iX^(i+1) with a_(2^k−1)=0 for every
k≥1 and g_F(F(X,Y))=g_F(X)+g_F(Y) is `FormalGroup.exponentTwoLog` (module
`ExponentTwo.Basic`), with `constantCoeff_exponentTwoLog`,
`coeff_one_exponentTwoLog`, `coeff_two_pow_exponentTwoLog` and
`subst_toPowerSeries_exponentTwoLog`; its existence and uniqueness is
`FormalGroup.existsUnique_logarithm_of_nsmulSeries_eq_zero` (module
`Logarithm.InfiniteHeight`), stated for every prime p with [p]_F=0: there
is exactly one g with g(0)=0, g'(0)=1, vanishing coefficients in the
degrees p^k for k≥1, and g(F(X,Y))=g(X)+g(Y); `eq_exponentTwoLog`
identifies every such g with g_F, and `map_exponentTwoLog` is base-change
naturality. The inverse strict exponential f_F is
`FormalGroup.exponentTwoExp` (module `ExponentTwo.Iso`), with the direction
pinned by `subst_exponentTwoExp_toPowerSeries`: F(f_F(X),f_F(Y))=f_F(X+Y),
so g_F maps F to the additive group and f_F maps the additive group to F;
the bundled strict isomorphism is `FormalGroup.exponentTwoLogIso` (instance
`IsStrict`, forward series g_F, inverse series f_F), and
`eq_exponentTwoLogIso_iff` says an isomorphism from F to the additive
group is this one precisely when it is strict with no term of degree 2^k,
k≥1. The characteristic-two forms of the cocycle lemma are
`TauCeti.existsUnique_eq_smul_add_pow_sub_pow_sub_pow_of_two_eq_zero`
(module `SymmetricCocycle.CharTwo`): when 2=0 in R and n is not a power of
two, a homogeneous symmetric additive 2-cocycle of degree n is uniquely
r·((X+Y)^n−X^n−Y^n), and `eq_zero_of_two_eq_zero_of_aeval_X_X_eq_zero`:
in degree 2^k such a cocycle with zero diagonal is zero, because the
reduction mod 2 of C_(2^k) has diagonal value a^(2^k) at a
(`aeval_diag_lazardCocycle_two_pow`); both derive from the any-ring lemma
through `lazardCocycle_eq_add_pow_sub_pow_sub_pow_of_two_eq_zero`, with
no coefficient field and no division by two. The additive series along
the additive group when a prime p vanishes in R are
`PowerSeries.subst_X_add_X_eq_add_iff_of_natCast_eq_zero` (module
`AdditiveSeries`): h(X+Y)=h(X)+h(Y) precisely when h is supported in the
degrees p^j, j≥0; the strict additive series along an exponent-two F are
exactly the composites of g_F with a strict such automorphism
(`subst_toPowerSeries_eq_add_iff_existsUnique_subst_exponentTwoLog`, module
`ExponentTwo.Coordinates`). The universal graded ring is
`TauCeti.ExponentTwoLazardRing` (module `ExponentTwo.Universal`), the
polynomial ring over 𝔽₂ on generators a_i for i≥1 with i+1 not a power
of two, with `ExponentTwoLazardRing.lift`, the bijection from commutative
laws with [2]_F=0 over R to ring homomorphisms out of it, the grading
`ExponentTwoLazardRing.grading` with a_i in degree i and the graded lift
`gradedLift`; `ExponentTwoLazardRing.ofLazardRing` (module
`ExponentTwo.Lazard`) is the surjection from the Lazard ring with its
kernel `ker_ofLazardRing`, and the exponent-two coordinate-change Hopf
algebroid with `rightUnit`, `counit` and `coordinateChangeLift` is module
`ExponentTwo.CoordinateChange`. F2 identifies this ring with MO_* for the
degree-one real orientation.

**Height and Lazard's classification.** Over a field K,
`FormalGroup.height F p` (module `Height.Basic`) is ⊤ when [p]_F=0 and
otherwise log_p of the order of [p]_F (`height_eq_top_iff`); for a
commutative F over a field of characteristic p, `height_eq_natCast_iff`
says the height is h precisely when the first nonzero term of [p]_F has
degree p^h, `one_le_height`, `height_eq_one_iff`, base extension
invariance `height_map`, coordinate independence `height_smul`,
isomorphism invariance `TauCeti.FormalGroupIso.height_eq`, and
`height_𝔾ₐ`=⊤, `height_𝔾ₘ`=1; `height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ`
(module `Logarithm.InfiniteHeight`) is the infinite-height case of the
classification over every field of characteristic p: F has height ∞
precisely when it is isomorphic to the additive group; for finite height
h, `existsUnique_iso_comp_iterateFrobeniusHom_eq_nsmulHom_of_height_eq`
(module `Frobenius.Factorization`) factors [p]_F uniquely as the h-fold
Frobenius followed by an isomorphism from the Frobenius twist. Over any
ring the height ideals I_(p,n) are `FormalGroup.heightIdeal` (module
`Height.Ideal`), the ideal generated by the coefficients of [p]_F below
degree p^n, with `heightIdeal_eq_bot_iff_le_height` comparing them
with the height over fields; for commutative F and a prime p,
`FormalGroup.heightIdeal_one` is I_(p,1)=(p),
`FormalGroup.heightIdeal_eq_span` is I_(p,n)=(v₀,…,v_(n−1)) with v_i the
coefficient of X^(p^i) in [p]_F, and
`FormalGroup.heightIdeal_succ_eq_sup_of_sub_mem` is I_(p,n+1)=I_(p,n)+(v)
for every v congruent to v_n modulo I_(p,n); `FormalGroup.heightIdeal_smul`
and `TauCeti.FormalGroupIso.heightIdeal_eq` are their independence of the
coordinate. F5 consumes them.

Prove Lazard's classification over separably closed fields: for a
separably closed field k of characteristic p and commutative
one-dimensional formal groups F and G over k, `TauCeti.FormalGroupIso F G`
is nonempty precisely when `FormalGroup.height F p` equals
`FormalGroup.height G p`, the infinite-height class included
(`nonempty_formalGroupIso_iff_height_eq`; Ravenel, Theorem A2.2.12, which
says that every law of height n over k is isomorphic to the p-typical
Honda law of height n, the additive law for n=∞). The forward direction
is `TauCeti.FormalGroupIso.height_eq` and the infinite-height case is
`height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ`. Ravenel's route for finite
height: by Cartier's theorem (A2.1.18) replace F and G by isomorphic
p-typical laws, parametrized by the images of the generators v_i of the
p-typical Lazard ring V (A2.1.24, A2.1.25), and seek the isomorphism in
the form of a formal sum Σ^F t_i x^(p^i); the coefficient equations
(A2.2.13), from the right-unit formula of Theorem A2.2.6, begin with
t₀·θ(v_h)=t₀^(p^h) and continue degree by degree with equations whose
derivative in the new unknown is a unit, so each is separable and has a
root in k. The degree-by-degree obstruction theory for this induction is
at the pin: when an approximate homomorphism f from F to G has
homomorphism defect vanishing below degree n, the degree-n part of the
defect is c·C_n (`exists_homogeneousComponent_homDefect_eq_smul_lazardCocycle`,
module `Obstruction`), removable by a strict correction in degree n when
d_n is a unit, and read off the p-series in degree p^k, k≥1
(`homogeneousComponent_homDefect_eq_smul_lazardCocycle`): the degree-p^k
part is the coefficient of X^(p^k) in [p]_G(f(X))−f([p]_F(X)) times
C_(p^k), which is where the separable equations above arise; it vanishes
automatically when k is below both heights, since each composite then has
order at least p^h>p^k (`PowerSeries.order_subst`, module
`TauCeti.RingTheory.PowerSeries.Substitution`, with `height_eq_natCast_iff`),
and for f the identity series, whose defect is F−G, this is
`succ_le_order_sub_of_lt_height` (module `LeadingDifference`). *Needs:*
`FormalGroup.height`, `TauCeti.FormalGroupIso` and the pinned p-series,
Frobenius, obstruction and leading-difference APIs named above; for
Ravenel's route also F3's p-typical coordinates and Hazewinkel
generators, which are a route input, not an input of the statement.
Checks: the additive and multiplicative groups over an algebraic closure
of 𝔽_p have heights ∞ and 1 (`height_𝔾ₐ`, `height_𝔾ₘ`) and are not
isomorphic, which the statement forbids and a definition of height that
returned 0 for the additive group would not; for F=G the identity series
X is the isomorphism and the heights agree trivially; over 𝔽_p itself the
forward direction holds but the converse fails: the multiplicative group
and its nontrivial Galois twists have height one and are not isomorphic
over 𝔽_p, since an 𝔽_p-isomorphism commutes with the Frobenius
endomorphism X^p, which these twists send to different elements of the
common endomorphism ring ℤ_p, so separable closure is needed.

### Examples

The multiplicative group X+Y+XY has [p](X)=(1+X)^p−1≡X^p modulo p, so over
𝔽̄_p its height is 1, while the additive group has [p]=0 and height ∞;
over ℚ its logarithm is log(1+T)=T−T²/2+T³/3−⋯. The Lazard ring in degree
2 is ℤ·a₁₁, and [2]_F=2X+a₁₁X²+2a₁₂X³+⋯ for the universal law, so the
height ideals at 2 begin I_(2,1)=(2) and I_(2,2)=(2,a₁₁).

### Dependencies

Mathlib's `FormalGroup` with `IsSepClosed` and `CharP`; the pinned Tau Ceti
formal-group tree named in the supplier contracts; for Ravenel's route to
the classification, F3's p-typical coordinates and Hazewinkel generators.

## F2. Complex orientations and Quillen's theorem

Consume G4's chosen complex orientation and finite projective-bundle theorem.
Own the two-variable comparison: iterated finite CP^m×CP^n projective-bundle
isomorphisms, the surjective truncation restriction system, vanishing lim¹
and the skeletal Milnor comparison give E*(CP∞×CP∞)=E*[[x,y]], with
its degreewise completion and products. Use the even commutative coefficient
ring π_(2*)E for the native formal group; odd coefficients remain modules
over it. This comparison precedes the tensor-product definition. Prove that tensoring the two universal lines defines a
commutative native formal group F_E, with the orientation normalization,
inverse dual-line formula and base-change laws. Compare two orientations by
their strict coordinate change. Include K-theory's multiplicative law with its Bott grading: for
TopologicalKTheory's Bott class u=β=[O(−1)]−1 of its Conventions (O(−1)
the tautological line on CP¹=S²) and the normalized coordinate on L=O(1), set
x_K(L)=u⁻¹([L⁻¹]−1), so its restriction is +1 and
F_K(x,y)=x+y+u xy. Compare u x with native 𝔾ₘ. Pin the Thom/orientation
adapter if another K orientation is used. Ordinary cohomology has the
additive law. For the right-complex restriction of a quaternionic line,
prove roots t and [−1]_F(t), the dual/inverse, tensor and Whitney Euler
laws with both of G4's specified quaternionic orientations:
e^c(γ_H)|CP∞=t[−1]_F(t), the restriction of x_H^E, and
e^std(γ_H)|CP∞=−t[−1]_F(t). The standard class differs from the
complex-induced class by (−1)^r in quaternionic rank r. State the
higher-rank splitting, Whitney and naturality laws separately for these
orientations and use the standard normalization for e_Sp.
Do not impose this normalization on an arbitrary independent E orientation.
The completed comparison and the formal group law of an orientation are
Ravenel, Lemma 4.1.4, p. 107. *Needs:* GeneralizedCohomology G4's complex
orientations and finite projective-bundle theorem and G3.8's Milnor
sequence; TopologicalKTheory's Conventions; Mathlib's `FormalGroup`,
`FormalGroup.𝔾ₐ` and `FormalGroup.𝔾ₘ`.

**Steenrod algebras and mod-p Adams towers.** For every prime p construct
the stable mod-p Steenrod operations on AlgebraicTopology's ordinary
cohomology, Sq^i at p=2 and P^i with the Bockstein β at odd p, by the
extended-power construction over the cyclic group of order p and the mod-p
cohomology of its classifying space (Hatcher, Section 4.L, Theorems 4L.12,
4L.13 and 4L.16). Prove naturality, additivity, Sq⁰=id and P⁰=id,
instability (Sq^i x=0 for i>|x| and Sq^(|x|)x=x²; P^i x=0 for 2i>|x| and
P^(|x|/2)x=x^p for even |x|), the Cartan formula, suspension stability,
Sq¹=β at p=2 and the Adem relations. Define the Steenrod algebra A_p as the
algebra of stable operations, identified with H^*(HF_p) for G2.7's mod-p
Eilenberg–MacLane spectrum through AlgebraicTopology Stage 8.10's universal
classes and G3.8's Milnor sequence, and prove that the admissible monomials
form a basis: spanning by the Adem relations, independence by the
Serre–Cartan computation. Own that computation: H^*(K(ℤ/p,n);𝔽_p) is the
free graded-commutative algebra on the admissible monomials of excess
below n applied to the fundamental class (Hatcher, Section 4.L, the
unnumbered theorem on page 500, which defers its proof). The excess is
Hatcher's (p. 499): Σ_j(i_j−2i_(j+1)) for Sq^(i₁)Sq^(i₂)⋯ at p=2, and
Σ_j(2i_j−2p·i_(j+1)−ε_(j+1)) for β^(ε₁)P^(i₁)β^(ε₂)P^(i₂)⋯ at odd p, which
does not count a leading Bockstein ε₁; with an excess that counts it the
theorem needs the additional generators of excess exactly n that begin
with β. The proof is by induction on n
along the path–loop fibration K(ℤ/p,n−1)→P→K(ℤ/p,n) in AlgebraicTopology
Stage 5.5's cohomological Serre spectral sequence. For that induction
construct the transgression as the additive relation
H^(q−1)(F)⊃dom→H^q(B)/ind given by H^(q−1)(F)→H^q(E,F)←H^q(B,*), identify
it with d_q from E_q^(0,q−1) to E_q^(q,0), and prove Kudo's theorem
(Steenrod operations of a transgressive class are transgressive and
commute with transgression, with τβ=−βτ, and at odd p the class
y^(p−1)⊗τy of an even transgressive y of degree 2k survives to E_r,
r=2k(p−1)+1, with d_r(y^(p−1)⊗τy)=−βP^k τy) and Borel's theorem (if
H^*(F) has a p-simple system of transgressive generators, its ordered
monomials with exponents below p on even and below 2 on odd elements
forming a basis, and E is acyclic, then H^*(B) is free graded-commutative
on the transgressions and, at odd p, on the classes βP^k τy of the even
generators), as the topological cochain instances of the algebraic
statements in Guillou–Weibel, Definition 6.1, Theorem 6.2 and Theorem 6.5
at H^*=𝔽_p. Theorem 6.2 applies to any first-quadrant spectral sequence
of graded-commutative 𝔽_p-algebras; Theorem 6.5 is stated for the Leray
spectral sequence of the universal bundle E•G→B•G of a connected
simplicial sheaf of groups under the Künneth hypothesis of its
Proposition 6.4, so take it over the point site with G a connected
simplicial group whose mod-p cohomology has finite type, for which the
Künneth hypothesis holds over the field 𝔽_p: the path–loop fibration of
K(ℤ/p,n), n≥2, is this instance with G a simplicial-group model of
K(ℤ/p,n−1) (the case n=1 is the direct computation for Bℤ/p),
and the laws that a transgressive class and its Steenrod operations obey
in an arbitrary fibration (operations commute with transgression, with
τβ=−βτ) follow from the naturality of the operations for the coboundary
of the pair (E,F) and the projection, the sign being the anticommutation
of the Bockstein with that coboundary. Prove Milnor's theorem on the dual:
A_*=H_*(HF_p) is the
commutative Hopf algebra `𝔽₂[ξ₁,ξ₂,…]`, |ξ_i|=2^i−1, at p=2 and
`𝔽_p[ξ₁,ξ₂,…]⊗E(τ₀,τ₁,…)`, |ξ_i|=2(p^i−1), |τ_i|=2p^i−1, at odd p, with
coproduct Δξ_n=Σ_(i+j=n) ξ_j^(p^i)⊗ξ_i, Δτ_n=τ_n⊗1+Σ_(i+j=n) ξ_j^(p^i)⊗τ_i
and conjugation (Miller, Chapter 1, Theorem 11.2 at p=2; Ravenel,
Theorem 3.1.1). Define the generators through the coaction of A_* on
H^*(Bℤ/p;𝔽_p) dual to the action of A, with ξ₀=1: at p=2, on 𝔽₂[x] with
|x|=1, λ(x)=Σ_(i≥0) x^(2^i)⊗ξ_i; at odd p, on E(x)⊗𝔽_p[y] with |x|=1 and
y=βx, λ(x)=x⊗1+Σ_(i≥0) y^(p^i)⊗τ_i and λ(y)=Σ_(i≥0) y^(p^i)⊗ξ_i. Derive
the coproduct formulas from the coassociativity of the coaction. At p=2
the ξ-monomials span A_* because A acts freely through degree n on the
product x₁⋯x_n of the degree-one classes of (RP^∞)^n (Miller, Chapter 1,
Lemma 11.1), and they are independent by the degree count against the
admissible basis. At odd p the product y₁⋯y_n of the degree-two classes
is not such a class: β kills each y_i, so β(y₁⋯y_n)=0 although β≠0 in
degree 1. There prove instead that the map from the free
graded-commutative algebra 𝔽_p[ξ₁,ξ₂,…]⊗E(τ₀,τ₁,…), with the coproduct
above, to A_* is an injective map of Hopf algebras: a nonzero element of
lowest degree in the kernel of a map of connected graded coalgebras over
a field is primitive, the primitives of the source are spanned by τ₀
and the ξ₁^(p^k), k≥0 (Ravenel, Nilpotence and Periodicity, Section 6.2,
p. 63), and these pair to 1 with β and with P^(p^k), since βx=y and
P^(p^k)(y^(p^k))=y^(p^(k+1)). Surjectivity is the degree count: the
admissible sequences (ε₀,s₁,ε₁,…,s_k,ε_k), with s_j≥ps_(j+1)+ε_j, match
the monomials τ₀^(e₀)τ₁^(e₁)⋯ξ₁^(r₁)ξ₂^(r₂)⋯ bijectively and in the same
degree through e_i=ε_i and r_j=s_j−ps_(j+1)−ε_j.
Construct the Milnor primitives Q₀=β (Sq¹ at p=2) and
Q_(i+1)=[P^(p^i),Q_i] (at p=2, [Sq^(2^(i+1)),Q_i]), of degree 2p^i−1
(2^(i+1)−1 at p=2), dual to τ_i at odd p and to ξ_(i+1) in the Milnor
basis at p=2; prove Q_i²=0 and Q_iQ_j=Q_jQ_i, that E=E(Q₀,Q₁,…) is an
exterior sub-Hopf algebra, that A_p is free as a left and as a right
E-module by the Milnor basis, and that the quotient A//E is dual to
`P_*=𝔽_p[ξ₁,ξ₂,…]` at odd p and to `𝔽₂[ξ₁²,ξ₂²,…]` at p=2, while E is
dual to the quotient A_*⊗_(P_*)𝔽_p, the exterior algebra on the τ_i (on
the ξ_i at p=2) (Ravenel, Theorem 3.1.1 and Lemmas 3.1.6 and 3.1.8).
Prove the change-of-rings isomorphism
Ext_(A_*)(𝔽_p,P_*⊗C)≅Ext_(E_*)(𝔽_p,C) for an E_*-comodule C (Ravenel,
Corollaries A1.1.18 and A1.3.13) at every prime; the mod-2 statement uses
the squares ξ_i² and is constructed here, not transported from the
odd-prime one. Construct the HF_p-based Adams tower of a spectrum X from
G2's cofiber sequences of the unit S→HF_p smashed with X, an E-Adams
resolution (Ravenel, Definition 2.2.1), its exact couple and spectral
sequence with E₂^(s,t)=Ext_(A_*)^(s,t)(𝔽_p,H_*(X;𝔽_p)) and d_r of bidegree
(r,r−1) (Ravenel, Theorems 2.1.1 and 2.2.3); prove the pairing for ring
spectra (Ravenel, Theorem 2.3.3) and, for bounded-below X, strong
convergence to the homotopy of the HF_p-nilpotent completion, identified
for bounded-below X with G3.9's derived p-completion (Bousfield, §6,
Theorem 6.6), which is π_*(X)⊗ℤ_p when the homotopy groups of X are
finitely generated (Ravenel, Theorem 2.1.1(ii)); control
lim¹ and keep this completion distinct from p-localization. Checks: on the
degree-one class a of RP^∞, Sq¹a=a² and Sq²a=0, so an instability bound
with strict inequality would lose the top square; at p=2, |ξ₂|=3 and
|Q₁|=3, and at p=3, |ξ₁|=4, |τ₀|=1, |τ₁|=5 and |Q₁|=5; d₂ sends
(s,t)=(1,2) to (3,3), lowering t−s from 1 to 0, not raising it; for the
Moore spectrum X of ℤ/2^∞, with π₀X=ℤ/2^∞, π₁X=0 and π₂X=ℤ/2, the
classical 2-completion of π₀X is 0 and π₀X⊗ℤ₂=ℤ/2^∞, while the derived
2-completion has π₀=0 and π₁=Hom(ℤ/2^∞,ℤ/2^∞)=ℤ₂ by the sequences
0→Ext(ℤ/2^∞,π_nX)→π_n(X^∧)→Hom(ℤ/2^∞,π_(n−1)X)→0, so the tensor form
needs finite generation; for n=1 and odd p the admissible monomials 1
and β have excess 0, while P¹, P¹β and βP¹β have excess 2, 1 and 1, so
the Serre–Cartan theorem gives H^*(K(ℤ/p,1);𝔽_p)=Λ[ι]⊗𝔽_p[βι], the
cohomology of Bℤ/p (Hatcher, p. 500), whereas an excess counting the
leading β would give βι excess 1 and drop it; at p=2 and n=1 only the
empty monomial has excess 0 (Sq¹ has excess 1), giving 𝔽₂[ι].
TangentialBordism consumes these operations, algebras and towers.
*Needs:* AlgebraicTopology's ordinary cohomology with cup products, Stage
5.5's Serre spectral sequence and Stage 8.10's universal classes;
GeneralizedCohomology G2's cofiber sequences, G2.7's HF_p, G3.8's Milnor
sequence and G3.9's derived p-completion.

Construct the map L→MU_* from MU's orientation and prove it is an
isomorphism. Supply the complete coefficient proof from the Adams towers
above, owning their MU instances at every prime. Construct
H_*(MU;ℤ)=ℤ[b₁,b₂,…], |b_i|=2i, from G4's projective-bundle comparison
and G5.3–G5.4's Thom model with its Thom product, and H_*(MU;𝔽_p) with its
A_*-coaction; prove that the Thom class MU→HF_p induces a map of comodule
algebras H_*(MU;𝔽_p)→A_* with image P_* (Ravenel, Lemma 3.1.4), so that
H_*(MU;𝔽_p)≅P_*⊗C simultaneously as a left C-module and as an
A_*-comodule, where C=𝔽_p□_(P_*)H_*(MU;𝔽_p) is a polynomial algebra on
generators u_i of degree 2i, one for each i with i+1 not a power of p
(Ravenel, Lemmas 3.1.6–3.1.7 and Corollary A1.1.18); the cited splitting
is one of modules and comodules, not of comodule algebras, and the
change of rings below uses only that structure (Ravenel, Lemma 3.1.8).
Equivalently the Milnor primitives annihilate the Thom class. Prove the change-of-rings
decomposition E₂=Ext_(E_*)(𝔽_p,C)=𝔽_p[a₀,a₁,…]⊗C with a_i of bidegree
(1,2p^i−1) (Ravenel, Corollary 3.1.10), at p=2 with E(Q₀,Q₁,…) and
|Q_i|=2^(i+1)−1, and at odd p with |Q_i|=2p^i−1; the mod-2 case is
constructed here and is not a specialization of the odd-prime one. Prove
the collapse (E₂ is concentrated in even t−s), the extension a₀=p
(Ravenel, Lemma 3.1.3), the p-local polynomial ring, and the integral
reconstruction: π_i(MU) is finitely generated and torsion-free, the
indecomposable quotient Q_(2i)π_*(MU) is ℤ for i>0, hence
π_*(MU)=ℤ[x₁,x₂,…] with |x_i|=2i (Ravenel, Theorem 3.1.5(i)). Construct the
generators x_i homotopically and prove characteristic-number detection:
the Hurewicz map h:π_*(MU)→H_*(MU;ℤ) is injective and, modulo
decomposables, h(x_i) is a unit multiple of p·b_i when i+1 is a power of
the prime p and of b_i otherwise (Ravenel, Theorem 3.1.5(ii)). This
Newton-number divisibility is the criterion by which a class of π_(2i)MU
is a polynomial generator; TangentialBordism's geometric representatives
are matched against it on its side. No geometric cycle, no Pontryagin–Thom
comparison and no abstract claim that an arbitrary formal group is MU's
coefficient ring enters this proof. Compare the formal-group coefficients
of the orientation with Lazard's generators and prove that L→MU_* is an
isomorphism (Ravenel, Theorem 4.1.6; Miller, Chapter 2, Theorem 3.5 and
Proposition 8.3; Quillen 1969, Theorem 2). Prove MU_* is polynomial
in degrees 2n and identify the coproduct/strict-coordinate interpretation of
MU_*MU≅MU_*[b₁,b₂,…], including grading and left/right units. Checks:
modulo decomposables h(x₁), h(x₂), h(x₃), h(x₄), h(x₅), h(x₆) are unit
multiples of 2b₁, 3b₂, 2b₃, 5b₄, b₅, 7b₆, since 2, 3, 4, 5, 7 are prime
powers and 6 is not; π₂MU=ℤ on x₁ and π₄MU=ℤ² on x₁², x₂, while a
wrong collapse argument allowing odd t−s would have to account for
π₁MU=π₃MU=0.
*Needs:* the Steenrod algebras and Adams towers above; GeneralizedCohomology
G4's projective-bundle comparison and G5.3–G5.4's Thom model and Thom
product; F1's pinned `TauCeti.LazardRing`, `TauCeti.LazardRing.lift` and
`TauCeti.LazardRing.mvPolynomialEquiv`.

**Unoriented coefficients.** Own Thom's computation of π_*MO
homotopically. From G5.3–G5.4's Thom model of MO, G4.3's Thom isomorphism
and CharacteristicClasses C3's `H^*(BO(n);𝔽₂)=𝔽₂[w₁,…,w_n]` with the
Whitney formula, identify H^*(MO;𝔽₂) with the free H^*(BO;𝔽₂)-module on
the Thom class U, and H_*(MO;𝔽₂)=𝔽₂[a₁,a₂,…], |a_i|=i, as an algebra
under the Thom product. Prove that the Steenrod algebra A acts freely on U
through degree n on MO(n): restriction along the zero section sends U to
w_n, and restriction along (RP^∞)^n→BO(n) sends w_n to x₁⋯x_n, on which A
acts freely through degree n (Miller, Chapter 1, Theorem 12.1 and
Corollary 12.2). Hence
the Thom class MO→HF₂ induces a surjective map f:H_*(MO;𝔽₂)→A_* of
algebras and A_*-comodules. Prove that H^*(MO;𝔽₂) is a free A-module
(Miller, Chapter 1, Proposition 10.4 and Theorem 12.3) and that
H_*(MO;𝔽₂)≅P⊗A_* simultaneously as a left P-module and as an
A_*-comodule, where P=H_*(MO;𝔽₂)□_(A_*)𝔽₂ is the subalgebra of
A_*-coinvariants (Ravenel, Corollary A1.1.18); the cited splitting is not
multiplicative. From an A-basis construct the additive comparison
MO→⋁_α Σ^(|α|)HF₂, an isomorphism in mod-2 cohomology; prove 2·id_MO
null through the ring unit since π₀MO=𝔽₂, so that the cofiber of the
comparison has bounded-exponent homotopy, and conclude by the stable
Hurewicz theorem on a lowest nonzero homotopy group that the comparison
is a stable weak equivalence (Miller, Chapter 1, Theorem 12.4). Prove that
the Hurewicz map π_*MO→H_*(MO;𝔽₂) is an injective ring map with image P.
Derive the ring structure of P from the module splitting. Write
H=H_*(MO;𝔽₂). The map f kills the positive-degree part P⁺ of P, since an
element of A_* that is coinvariant under its own coproduct lies in
degree 0, so f induces a surjection H/P⁺H→A_*, which is an isomorphism
because the splitting gives both sides the same finite dimension in
each degree. Choose an algebra section s:A_*→H of f by lifting each ξ_k.
Multiplication P⊗A_*→H, y⊗a↦y·s(a), is then a map of algebras, onto by
graded Nakayama over P and injective by the same dimension count, so
P≅H/(s(ξ₁),s(ξ₂),…) as algebras. Each s(ξ_k) is indecomposable in H,
because f(s(ξ_k))=ξ_k is indecomposable in A_*, and H is polynomial on
one generator in each positive degree, so s(ξ_k) may replace the
generator of degree 2^k−1 and the quotient is polynomial on the remaining
generators. Conclude `π_*MO=𝔽₂[x_d : d≥1, d≠2^k−1]` as a graded ring
(Thom 1954, Chapitre IV; Miller, Chapter 1, Section 13 states this ring
and omits its proof). This ring is the MO_* of the Conner–Floyd
comparison below. TangentialBordism's geometric multiplication and its
manifold generators are matched against these x_d on its side and are
not inputs. Checks: π₁MO=π₃MO=0 and π₂MO=𝔽₂ on x₂, since 1 and 3 are of
the form 2^k−1; π₄MO has basis x₄, x₂², rank 2, where counting only
indecomposables gives 1; in degree 5 the ranks of H_*(MO;𝔽₂), A_* and P
are 7, 2 and 1, and the Künneth count
1·1+1·2+1·0+2·1+2·0+2·1=7 of A_*⊗P agrees, whereas replacing A_* by the
polynomial algebra on all ξ_k and ξ_k² would overcount.
*Needs:* GeneralizedCohomology G5.3–G5.4's Thom model of MO and G4.3's Thom
isomorphism; CharacteristicClasses C3; the Steenrod algebra, Milnor's
theorem and the Adams-tower convergence above.

For a chosen real orientation use G4's RP∞ projective comparisons to
construct the real-line tensor Euler law F(x,y) in degree1. Own the
two-variable real projective comparison: on RP^m×RP^n identify
E^* with E^*[x,y]/(x^(m+1),y^(n+1)), compatibly with restriction
and both Euler classes. Pass to RP∞×RP∞ through the two finite-stage
towers, proving surjective transition maps, the required lim¹ vanishing
and the completed graded E^*[[x,y]] comparison before defining F. Prove 2·1=0
and F(x,x)=0 from the square-triviality of the universal real line.
Identify the universal graded characteristic-2 formal-group ring with
[2]_F=0, which is F1's pinned `TauCeti.ExponentTwoLazardRing` (the
polynomial ring over 𝔽₂ on generators in the degrees other than 2^k−1,
with its graded lift), with MO_*, using the unoriented coefficient ring
computed above and Quillen's unoriented operation proof
(Quillen 1969, Theorem 3), and prove the orientation/change-of-coordinate
universal property of MO.
TangentialBordism consumes these real formal laws; its geometric cycles
and manifold representatives are not inputs here.
*Needs:* GeneralizedCohomology G4's real projective comparisons and G3.8's
Milnor sequence; F1's pinned `TauCeti.ExponentTwoLazardRing`; the
unoriented coefficient ring above.

Specify the category of real-oriented multiplicative cohomology theories:
an object includes its unital homotopy-commutative ring-spectrum model and
chosen multiplicative real Thom orientation, and morphisms are stable
multiplicative natural transformations preserving that orientation. Define
the coefficient functor to graded characteristic-2 rings with normalized
degree-one exponent-two formal laws, with coordinate-preserving graded
ring homomorphisms. Construct the Thom transformation MO→h and prove its
universal property for these chosen multiplicative orientations, retaining
the specified Thom data and its homotopies rather than inferring an E∞
orientation from a homotopy-ring orientation. On the algebraic side prove
the equivalence between commutative graded MO_*-algebras and these normalized
exponent-two formal laws: a law over R determines the unique graded
classifying map MO_*→R, and morphisms commute with that map. Prove the
coefficient functor and Thom transformation induce this algebraic
classification, naturally under orientation-preserving transformations.
For every commutative graded MO_*-algebra R, first define the graded
functor on CW pairs `h_*(X,A)=MO_*(X,A)⊗_(MO_*)R`; the Conner–Floyd
comparison below proves it a multiplicative real-oriented homology theory.
Retain the appropriate cohomological regrading of its coefficient law.
Construct the graded Eilenberg–MacLane ring-spectrum model HR
in G2.4's symmetric spectral model, using G2.7's HF₂ and ordinary-module
spectra. Own the graded Eilenberg–MacLane functor from graded 𝔽₂
modules, viewed as complexes with zero differential, its shifts and
multiplicative lax-monoidal comparison; construct HR's strict ring model
and product from the specified associative graded multiplication on R.
Prove this product is homotopy commutative: maps from HR∧HR into
this graded EM model are detected by mod-2 homology, and μ and μ∘τ
agree there by commutativity of R and the dual Steenrod algebra.
Construct the ring comparison `H_*(HR;𝔽₂)≃A_*⊗_(𝔽₂)R`
and the Künneth comparison for HR∧HR, identifying H_*(μ) with
multiplication on both factors. Use the commutative dual Steenrod algebra
`A_*=𝔽₂[ξ₁,ξ₂,…]` constructed above; the sphere-twist signs
(−1)^(ab) are trivial mod2.
No strict commutative DGA or E∞ structure is inferred. Prove the chosen
HR model semistable and compare its model homotopy groups with G2.6's
true π_* before applying the stable weak-equivalence criterion.
Identify its underlying module with the wedge, and the weakly equivalent
product, of Σ^dH(R_d), for d∈ℤ, and prove its represented homology is
H_*(−;𝔽₂)⊗_(𝔽₂)R. Construct the ordinary real Thom orientation and
its coordinate x_H; for the prescribed law use the pinned exponent-two
exponential `FormalGroup.exponentTwoExp` (F1) to define x_F=f_F(x_H). Build its multiplicative Thom
classes and MO→HR map, identify the coefficient map and law through
HR^*(RP∞)=R[[x_H]]. Construct the natural map h_*(X,A)→HR_*(X,A)
induced by MO→HR; prove it an isomorphism after the Conner–Floyd
comparison below. Prove the 𝔽₂-coefficient universal comparison
and vanishing of phantom maps into this graded EM model, using field
cochains and its product comparison. Prove functoriality under commutative graded
MO_*-algebra maps, with the specified orientation/coordinate retained. The algebraic
category equivalence does not assert that arbitrary ring-spectrum
theories or their stable operations are determined by their coefficient
formal law.
*Needs:* MO_* and the real formal laws above; GeneralizedCohomology G2.4's
symmetric spectral model, G2.6's homotopy groups and G2.7's HF₂ and
module spectra; F1's pinned `FormalGroup.exponentTwoExp`.


Own a chosen natural Conner–Floyd
MO_*-module comparison
`MO_*(X,A)≃MO_*⊗_(𝔽₂)H_*(X,A;𝔽₂)`, compatible with the actual
relative boundary, suspension, wedge and external-product maps.
Using the preceding graded EM ring/orientation, for R=MO_* and
its own real law, its Thom map MO→H(MO_*) induces the identity on
coefficients by the algebraic classification. Prove it an isomorphism on G2.6 true π_* and hence a stable weak
equivalence and derive the stated natural module/product/boundary
comparison, using the coefficient ring MO_* computed above. An additive
splitting alone is not this multiplicative comparison.
Deduce freeness and identify h_* naturally with
`H_*(X,A;𝔽₂)⊗_(𝔽₂)R`. Exactness follows by tensoring over the field,
including the boundary maps; termwise freeness alone is not an exactness
argument. This works for every commutative graded MO_*-algebra R.
*Needs:* the graded Eilenberg–MacLane ring HR and its Thom map above;
GeneralizedCohomology G2.6's homotopy groups; MO_* above.

Construct the Landweber–Novikov operations from these cooperations, their
composition, Cartan, naturality and Thom/Gysin formulas, and their agreement
with coordinate changes. Supply duality/completion hypotheses for infinite
families; a graded dual is not an unqualified algebraic dual.
The cooperation algebra is Ravenel, Theorem 4.1.11, p. 110. *Needs:*
MU_*MU≅MU_*[b₁,b₂,…] above; F1's pinned coordinate-change Hopf algebroid
(`TauCeti.LazardRing.rightUnit`).

### Examples

On RP^∞, Sq^i(x^n)=C(n,i)x^(n+i), so Sq¹x=x² and Sq²(x²)=x⁴. The unoriented
coefficients begin π₂MO=𝔽₂{x₂}, π₄MO=𝔽₂{x₄,x₂²} and π₅MO=𝔽₂{x₅}. For
complex K-theory with x_K(L)=u⁻¹([L⁻¹]−1) the formal law is x+y+uxy. In
H_*(MU;ℤ) the Hurewicz image of x₁ is ±2b₁ modulo decomposables, since 2 is
a prime power.

### Dependencies

F1; GeneralizedCohomology G2 (G2.4, G2.6, G2.7), G3.8, G3.9, G4, G4.3 and
G5.3–G5.5; AlgebraicTopology's ordinary (co)homology, Stage 5.5 and Stage
8.10; CharacteristicClasses C3; TopologicalKTheory's Conventions.

## F3. p-typical and Brown–Peterson theories

For each prime p, construct the p-typicalization idempotent on MU_(p),
prove its multiplicative comparison, and split it to obtain BP. Pin
BP_*≅ℤ_(p)[v₁,v₂,…] using specified Hazewinkel generators and prove the
logarithm recursion and conversion to other p-typical coordinates.
Construct BP_*BP≅BP_*[t₁,t₂,…] and the full Hopf-algebroid structure;
identify its strict p-typical coordinate-change functor (Ravenel,
Theorem 4.1.12, pp. 110–111, for BP and π_*BP, Theorem 4.1.19, p. 113,
for BP_*BP, and Theorem A2.2.3, p. 364, for the Hazewinkel and Araki
generators). *Needs:* F2's MU, MU_*MU≅MU_*[b₁,b₂,…] and Landweber–Novikov
operations; GeneralizedCohomology G3's integer localization; F1's pinned
logarithm `FormalGroup.log` for the logarithm recursion.

Build BP⟨n⟩ and E(n) for n≥0, with the specified ordered spectral cofibres by v_(n+1),v_(n+2),… and localization at v_n for n≥1. Define E(0)=Hℚ.
Prove the homotopy groups, canonical maps, connective-cover comparisons
and the homotopy-associative products needed for the Hopf rings. Construct
and compare the products on the iterated cofibres, with their actual
p=2 noncommutativity/choice qualifications; no coherent BP-module
category is presumed before an A∞ model is constructed. Do not
assert an E∞ structure on BP or every BP⟨n⟩. Include BP⟨0⟩≃Hℤ_(p), and ku_(2)≃BP⟨1⟩. Construct Morava
K(n) for n≥1 from the specified p,v_i (i≠n) cofibres and v_n
localization, with coefficients F_p[v_n,v_n⁻¹], exact sequence and
homology/detection APIs; its homotopy product is not asserted E∞.
For odd p, construct the Adams summand BP⟨1⟩ comparison with connective
complex K-theory and the p−1 summands
ku_(p)≃∏_(i=0)^(p−2) Σ^(2i)BP⟨1⟩. Prove Bott's cyclic action between
the factors, including v₁ on the last return. Include the i=0 summand.
Construct ko_(p)≃⋁_(i=0)^((p−3)/2)Σ^(4i)BP⟨1⟩ for odd p by
real/complex K comparison and conjugation, preserving its Bott action
and actual connective-cover maps. StringOrientation S5.3 owns the resulting
BO⟨4k⟩ space splitting. The homotopy and mod-p homology of BP⟨n⟩, the cofibre
sequences Σ^(2(p^n−1))BP⟨n⟩→BP⟨n⟩→BP⟨n−1⟩, E(n) as the v_n-telescope and
K(n) as the telescope of its connective form with π_*K(n)=𝔽_p[v_n,v_n⁻¹]
are Ravenel, Section 4.2, pp. 115–117, and Johnson–Wilson 1975.
*Needs:* BP and BP_*BP above; GeneralizedCohomology G2's cofibre
sequences and telescopes, G3's localization and G3.8's connective covers,
and its connective K spectra.

**Checks.**
- BP⟨0⟩ is Hℤ_(p): killing all v_i, i≥1, leaves π_*=ℤ_(p) in degree 0,
  and H_*(BP⟨0⟩;𝔽_p)=P_*⊗E(τ₁,τ₂,…) at odd p, the dual of A//E(Q₀);
  a construction that also killed p would give H𝔽_p, with τ₀ present.
- |v₁|=2(p−1): at p=2 this is 2, and BP⟨1⟩=ku_(2) with v₁ the Bott class;
  at p=3 it is 4, so π₂BP⟨1⟩=0 while π₂ku_(3)=ℤ_(3), which is why ku_(p)
  splits into the p−1 shifted summands Σ^(2i)BP⟨1⟩, 0≤i≤p−2.
- H_*(BP⟨n⟩;𝔽_p)=P_*⊗E(τ_(n+1),τ_(n+2),…) (Ravenel, p. 116): for n=1 the
  bottom exterior class is τ₂, of degree 2p²−1, matching the first
  v₂-attaching cell; killing v₁ instead of v₂ would put τ₁ there.
- K(n): π_*K(1) has period 2 at p=2 and 2p−2 at odd p, the period of
  mod-p complex K-theory and of its Adams summand; K(n)_*(S/p) has rank 2
  over K(n)_*, since p=0 in K(n)_*, while E(n)_*(S/p)=E(n)_*/p is not
  free over E(n)_*; K(n) has a Künneth isomorphism because K(n)_* is a
  graded field, whereas for E(1) the Tor term of E(1)_*(S/p∧S/p) shows
  that the plain tensor formula fails.

Build the Atiyah–Hirzebruch spectral sequence for BP-homology from G's
cellular filtration, using only the BP spectrum and orientation above:
for a CW complex or CW spectrum X its E²-term is H_s(X;BP_t), its
differential d^r has bidegree (−r,r−1), and it is natural in X. Prove its
convergence and extension criteria: BP_*X is the colimit of BP_* of the
skeleta, and the spectral sequence converges strongly to BP_*X for a CW
complex and for a bounded-below CW spectrum, since BP is connective and
each total degree then meets only finitely many nonzero E²-terms. *Needs:*
BP above; AlgebraicTopology's ordinary homology of spaces;
GeneralizedCohomology G3.3's arbitrary-CW comparison and G3.7's homology
filtered-colimit theorem.

Construct the designated Ω-spectrum spaces BP⟨n⟩_k, their multiplication,
additive infinite-loop structure, suspension, coefficient elements and
homology orientations. Prove Wilson's torsion-free polynomial-space results
in their exact degree/range hypotheses. For BP⟨1⟩ and odd p, develop the
BP-homology Hopf ring with its star/circle products, units, coproducts,
distributivity and the b_(i), [v₁^j] elements. For positive even m<2p+2 prove
H_*(BP⟨1⟩_m;ℤ_(p)) is torsion-free and polynomial in even degrees;
for positive even m<2p prove the BP-homology polynomial generators occur
in positive even degrees congruent to m modulo 2p−2. Give the polynomial
presentations below space degree 2p and the generators/relations in degree
2p+2, including the [v₁] map and augmentation-ideal filtrations needed by
StringOrientation. Prove the collapse of the BP-homology AHSS above for
these spaces and its extension identifications; cellular ranks alone do
not determine the ring. This completes the space-homology part of F3
before F4's Adams–Novikov application.
(Wilson, *The Ω-spectrum for Brown–Peterson cohomology II*, for the
torsion-free polynomial spaces and the splitting of BP⟨n⟩_k for
k≤2(p^n−1)/(p−1), surveyed in Ravenel, p. 116; Hovey, *The homotopy of
MString and MU⟨6⟩ at large primes*, Theorems 1.2 and 1.4, for the
BP⟨1⟩ Hopf-ring presentations below space degree 2p and in degree 2p+2.)
*Needs:* BP⟨n⟩ above; AlgebraicTopology's ordinary homology of spaces;
the BP-homology Atiyah–Hirzebruch spectral sequence above.

### Examples

BP⟨0⟩=Hℤ_(p); at p=2, BP⟨1⟩=ku_(2) with v₁ the Bott class, and K(1) is
mod-2 complex K-theory with π_*K(1)=𝔽₂[v₁,v₁⁻¹], |v₁|=2; at p=3, |v₁|=4
and ku_(3)≃BP⟨1⟩∨Σ²BP⟨1⟩.

### Dependencies

F1 and F2; GeneralizedCohomology G2's cofibre sequences and telescopes,
G3's localization, G3.3's arbitrary-CW comparison, G3.7's homology
filtered-colimit theorem and G3.8's connective covers; AlgebraicTopology's
ordinary homology of spaces.

## F4. Comodules and Adams–Novikov comparisons

Own the three-fold Toda brackets of pointed spaces. For pointed CW
complexes and composable pointed maps h:W→X, g:X→Y, f:Y→Z with chosen
nullhomotopies A of g∘h and B of f∘g, the extensions f∘A:CW→Z and
B∘Ch:CW→Z agree on W and glue to a map ΣW=CW∪_W CW→Z, the cone
coordinate placed last; define ⟨f,g,h⟩⊂[ΣW,Z] as the set of classes of
these maps over all choices of A and B (Toda, Chapter I). Prove that it
is nonempty precisely when both adjacent composites are null; that
changing A by a class a∈[ΣW,Y] changes the value by f∘a and changing B
by b∈[ΣX,Z] changes it by b∘Σh, so that for W a suspension the bracket
is one coset of the subgroup f∘[ΣW,Y]+[ΣX,Z]∘Σh of the abelian group
[ΣW,Z], and for general W the same two subsets act on the left and on
the right; and naturality in each of the four spaces. Prove the
suspension comparison Σ⟨f,g,h⟩⊂−⟨Σf,Σg,Σh⟩: suspending a value puts the
suspension coordinate after the cone coordinate, the bracket of the
suspended maps puts it before, and the two differ by the swap of the two
circle coordinates of S¹∧S¹, of degree −1. Checks: the swap of the two
circle factors of S² has degree (−1)^(1·1)=−1, so reading the two
constructions as the same map is wrong; stably ⟨2,η,2⟩=η² in π₂^s=ℤ/2
with indeterminacy 2π₂^s+π₂^s·2=0, so a bracket convention that makes
every bracket with a repeated entry vanish is wrong. Construct the passage
of these brackets through suspension and G's sphere-spectrum comparison
to stable spectral Toda brackets, preserving composition, signs and
indeterminacy. Construct
three-fold Toda brackets for composable maps of spectra and of right
modules over a supplied G2.4 strict associative ring spectrum R,
including its chosen strict commutative models. Consume G2.4's transferred
module model structure and construct its triangulated stable homotopy
category here, with suspension, cofiber triangles, hom groups [ΣX,V]_R,
exactness and the comparison to the underlying stable spectral category.
Build the brackets from their chosen cofiber triangles and nullhomotopies. The module version
requires this coherent structure; a homotopy-ring multiplication alone does
not supply it. Pin degrees, suspension signs, naturality under exact
functors, and module indeterminacy
`f∘[ΣX,V]_R+[ΣY,W]_R∘Σh` for a composable triple X→Y→V→W
(with f the final and h the first map). For the right regular R-module
identify left-multiplication maps with π_*R and state
`⟨a,b,c⟩⊆π_(|a|+|b|+|c|+1)R`, with indeterminacy
`a·π_(|b|+|c|+1)R+π_(|a|+|b|+1)R·c`, retaining the chosen
graded suspension/composition convention. The sphere case R=S gives
ordinary stable brackets.
*Needs:* AlgebraicTopology's pointed CW complexes and homotopy classes;
GeneralizedCohomology G2's stable homotopy category and sphere-spectrum
comparison and G2.4's strict ring spectra with their transferred module
model structures.

Construct higher Toda operations for every finite arity r≥3 in these
same enriched stable spectral and right-module models, and in supplied
stable symmetric monoidal models with the corresponding derived mapping
spaces. Construct the operations before passage to the triangulated
homotopy category. For X_r→⋯→X_0 use coherent
iterated-cofiber defining systems with value in [Σ^(r−2)X_r,X_0],
comparing with Carrick–Davies–van Nigtevecht Definitions3.3/3.7 on Picard
objects. Extend their Picard-object construction to the general objects
specified here and determine the suspension signs from the chosen model;
the reference leaves these only up to units. Compare the r=3 normalization
with the convention above. The displayed ring
entries a₁,…,a_r run from the final map to the first map, matching
left-to-right multiplication. Construct the cubical comparison and
specify all maps, adjacent
nullhomotopies and their higher compatibility homotopies on proper
subintervals, with the final obstruction map as the value. Define the
bracket as the set of values of such systems; adjacent products vanishing
alone is not a defining system. Construct restriction, extension and
change-of-system maps, their obstruction criteria, equivalence invariance
and comparison of the cofiber and cubical definitions. For homogeneous
ring classes pin the value degree Σ_i|a_i|+r−2, and recover exactly the
preceding triple convention at r=3. Describe the full change-of-system
indeterminacy; higher brackets need not be cosets of the triple's two
composition subgroups. Prove suspension, naturality under derived exact
functors and extension of scalars, and the composition/shuffling inclusions
with their compatible defining-system hypotheses. On dualizable objects
construct reversal through duality and its suspension/sign comparisons;
specialize to Picard-graded E₂-ring classes. Construct nested-system
substitution and the resulting bracket-of-brackets juggling inclusions,
tracking the inner choices, proper-subinterval vanishing hypotheses and
full outer indeterminacy. Include the forms in Bauer Lemma8.6 and
Corollary8.7 as applications in EllipticCohomology, not additional generic
definitions. A ring map carries a
chosen system and its value to the image system and value; lifting a
bracket requires lifting its coherent system, not just its entries.
*Needs:* the three-fold brackets above; GeneralizedCohomology G2.4's module
models and G2.11's quasicategorical foundations for the derived mapping
spaces.

Develop graded comodules over the flat MU and BP Hopf algebroids, cofree
comodules, the normalized cobar complex, Ext, change of rings and base
change. Construct their graded tensor category and internal Hom, and prove
that dualizable comodules are exactly those with finitely generated
projective underlying graded module. Build their evaluation/coevaluation,
dual coaction and tensor-Hom comparisons. Prove the Adams generation
hypotheses used in EllipticCohomology E4.A's separately constructed Hovey
stable model; this
comodule API does not itself identify that model with an ordinary derived
category. Construct the actual MU/BP resolution of a spectrum by iterated
unit/cofiber maps, its exact couple and Adams–Novikov spectral sequence.
For the BP version, prove E₂^(s,t)=Ext_(BP_*BP)^(s,t)(BP_*,BP_*X)
using BP_*BP's proved flatness and the comodule cobar comparison,
with the completion/convergence hypotheses below; do not add an
unnecessary flatness hypothesis on BP_*X.
The E₂-term of an E-based Adams resolution is Ravenel, Theorem 2.2.3,
p. 50. *Needs:* F2's MU_*MU and F3's BP_*BP with its flatness;
GeneralizedCohomology G2's cofiber sequences.

Construct the filtration on the appropriate completion of π_(t−s)X,
edge/Hurewicz maps, multiplicative and naturality laws, lim¹ obstruction,
and conditional/strong-convergence criteria. Prove convergence to X_(p) for bounded-below X in the BP-based
p-local Adams tower: the augmentation fibre of S_(p)→BP is
positive-connective, so its iterated smash powers with X have connectivity
tending to infinity. Prove the resulting tower limit and strong
convergence criteria rather than merely labelling it a completion.
Construct the BP/p-based nilpotent tower separately and identify its
limit with derived p-completion for bounded-below finite-type X,
using G3's derived completion and Milnor exact sequence. For spectra
outside those hypotheses retain the actual nilpotent tower limit and
its conditional-convergence statement. Ordinary p-localization and
p-completion are distinct. Using F3's BP-homology Atiyah–Hirzebruch
spectral sequence, supply the free/even/comodule comparisons
used in StringOrientation's Hovey calculation. F2's HF_p-based Adams tower is a
different tower from this BP-based one; neither is substituted for the
other.
The completion of a connective spectrum is Ravenel, Theorem 2.2.13,
p. 52, and Bousfield, Theorem 6.6. *Needs:* the Adams–Novikov tower above;
F3's BP-homology Atiyah–Hirzebruch spectral sequence; GeneralizedCohomology
G3.8's Milnor sequence and G3.9's derived p-completion.

Consume DGAInfinity Layer8’s matric/higher Massey defining systems over
the coefficient rings in use. Its field-dependent transferred-operation
comparison is not used for integral or p-local MU/BP cobars. Own the
specialization of its Massey definitions to the normalized
multiplicative MU/BP cobar complexes, with the cohomological/internal-degree
and Koszul-sign dictionary and full variation under changes of
representatives. This is the cobar/filtration comparison, with a single
generic Massey-product owner. Construct the following distinct comparisons.

1. For every arity, start with a chosen coherent defining system in the
   filtered model: the actual lifts of its entries, a filtered form of
   C(a₂,…,a_(r−1)), and the extension and coextension maps. Exact realization
   carries its total value into the corresponding classical Toda bracket.
   For a central τ with E₂ quotient maps, reduction to R/τ^k carries this
   same system to its reduced Toda system. Construct the normalized-cobar
   associated-graded comparison on the proper faces and total obstruction;
   when these faces define a Massey system on a specified spectral-sequence
   page, its value is the image of this chosen system. Prove filtration,
   sign, indeterminacy and tower-map naturality. This assertion begins with
   a filtered defining system; it does not reconstruct one from arbitrary
   higher Massey membership.
2. Prove the threefold synthetic Moss theorem with explicit hypotheses:
   R is an E₂-ring, a₁,a₂,a₃ are actual bigraded classes, and r≥s≥0 are
   minimal with τ^r a₁a₂=τ^s a₂a₃=0. For r,s>0 construct H₀,H₁ with
   total differentials d_(r+1)H₀=a₁a₂ and d_(s+1)H₁=a₂a₃, and a value
   of ⟨a₁,τ^r a₂,a₃⟩ lifting τ^(r−s)a₁H₁±H₀a₃ modulo τ^s. For
   r>0=s construct H₀ modulo τ^r and a bracket value lifting H₀a₃.
   Pin the sign by the preceding cone convention and compare reduction
   modulo τ with the corresponding threefold page-Massey product.
   Include r=s=0 as the ordinary defined triple case. For classes initially
   given only after τ-inversion, obtaining lifts with these annihilation
   identities is an additional construction, not a consequence of page
   membership. Compare this theorem with the Adams–Novikov tower through
   its actual filtered realization.
3. EllipticCohomology E4/E5 constructs the proper faces, extension maps and
   total obstruction cell by cell for each of its higher applications,
   and computes the corresponding detection and full indeterminacy.
[Carrick–Davies–van Nigtevecht §3](https://arxiv.org/abs/2412.01640v2)
supplies the chosen higher-cone/naturality/shuffling convention; its
displayed Moss theorem3.16 is threefold. Lemma3.9 and Propositions3.14–15
give the forward exact-functor and truncation comparisons; they do not
assert a Massey-to-Toda converse for arbitrary arity.
*Needs:* DGAInfinity Layer 8; F2's MU_*MU and F3's BP_*BP; the higher Toda
operations above; the Adams–Novikov tower above for the filtered
realization.

### Examples

Stably ⟨2,η,2⟩=η² in π₂^s=ℤ/2 with zero indeterminacy. At odd p,
η_R(v₁)=v₁+pt₁ makes pt₁ a coboundary in the cobar complex of BP_*BP, and
the primitive t₁ gives the class α₁=[t₁] of order p in
Ext^(1,2p−2)_(BP_*BP)(BP_*,BP_*).

### Dependencies

F2 and F3; GeneralizedCohomology G2, G2.4, G2.11, G3.8 and G3.9;
AlgebraicTopology's pointed CW complexes; DGAInfinity Layer 8.

## F5. Exact functors, deformations and elliptic inputs

For each prime p use F3's graded flat Hopf algebroid
(A,Γ)=(BP_*,BP_*BP). Define invariance of a homogeneous ideal through
its coaction, equivalently the equal extension of the two unit maps to Γ,
and prove the equivalence of these formulations. Classify its homogeneous
invariant prime ideals as I₀=(0), I_n=(p,v₁,…,v_(n−1)) for finite n≥1,
and I_∞=(p,v₁,v₂,…). Prove primality, invariance, distinctness,
their strict inclusion order and the quotient presentations, including
A/I_∞=𝔽_p. The homogeneity hypothesis is essential: the ungraded
invariant prime (p,v₁−1), using η_R(v₁)=v₁+p t₁, is not in this list.
Compare these ideals under the chosen p-typical coordinate changes.
(Ravenel, Theorem 4.3.2, pp. 120–121.) *Needs:* F3's BP_*BP with the
right-unit formula η_R(v_n) (Ravenel, (4.3.1)).

**Checks.**
- I₁=(p) is invariant because η_R(p)=p, and A/I₁=𝔽_p[v₁,v₂,…] is a
  domain, so I₁ is prime; a definition of invariance that tested only the
  left unit would accept every ideal, since η_L is the identity of A.
- (p,v₂) is a homogeneous prime ideal that is not invariant: by the
  right-unit congruence η_R(v₂)≡v₂+v₁t₁^p−v₁^p t₁ modulo p (Ravenel,
  proof of Theorem 4.3.2, p. 121), and v₁t₁^p−v₁^p t₁ is not in
  (p,v₂)Γ; so homogeneity and primality alone do not make an ideal
  invariant, which is why the classification lists exactly the I_n.
- (v₁) is homogeneous and prime, A/(v₁)=ℤ_(p)[v₂,v₃,…], but not
  invariant, since η_R(v₁)=v₁+pt₁ and pt₁∉(v₁)Γ; the inclusions
  I_n⊊I_(n+1) are strict because v_n is a nonzero element of
  A/I_n=𝔽_p[v_n,v_(n+1),…] for n≥1 and p≠0 in A/I₀=A.

Construct the primitive and invariant calculations on which the BP_*
classification above and the Lazard-ring classification below rest:
η_R(v_n)≡v_n mod I_n and
Ext⁰_Γ(A,A/I_n)=𝔽_p[v_n] for finite n≥1, with
Ext⁰_Γ(A,A)=ℤ_(p) and invariants 𝔽_p at height∞. For a nonzero
graded comodule with finitely presented underlying A-module, construct a
nonzero primitive and the invariant-annihilator comparison. Use the
bounded-below grading and finite coaction of its generators; prove the
finite-polynomial-stage descent of a module presentation and coaction.
Prove Landweber filtration for these comodules: construct a finite
filtration by graded subcomodules with subquotients Σ^d A/I_n, d∈ℤ
and n finite, including n=0. Prove termination over the descended finite
Noetherian polynomial stage and its extension back to A. Prove the
required coherence and finite-presentation/base-change lemmas for A;
A itself is not assumed Noetherian. The prime I_∞ belongs to the
prime classification, but A/I_∞ is not finitely presented and is not
an additional filtration factor. Using F4's Adams dualizable generators
and the coherence just proved, construct
the graded-comodule filtered presentation: every graded comodule is a
filtered colimit of comodules with finitely presented underlying
A-module, with its actual coaction and universal property. Use finite
cokernels between finite sums of dualizable generators, with kernel
comparisons supplied by flatness of Γ. Do not assert a union of
finitely presented subcomodules: A/I_∞ itself is a counterexample.
Prove tensor/homology filtered-colimit comparisons. For spectra also
construct the direct filtered finite-cell/retract presentation and
BP_*X≃colim_αBP_*X_α, with each finite-stage homology finitely
presented. Use these colimit comparisons in the later class identities;
vanishing of a colimit does not assert that some finite stage is acyclic.
(Ravenel, Theorem 4.3.2(ii), p. 120; Landweber 1976, surveyed in Ravenel,
Section 4.2, p. 118; Miller, Chapter 2, Theorem 13.3, p. 100, for the
invariance of annihilator ideals.) *Needs:* F3's BP_*BP; F4's comodule
category, its dualizable generators and Adams generation.

Transport the exactness theorem to MU through the actual p-typical
Hopf-algebroid comparison. Construct the weak equivalence between the
MU_(p) cooperation groupoid and (A,Γ) using F3's strict p-typicalization,
its extension/descent comodule functors, unit/counit and finite-presentation
comparisons. Take the height ideals I_(p,n) in MU_(p)* as the pinned
`FormalGroup.heightIdeal` (F1) of its chosen formal group, and compare
them with the p-typical ideals. Lifts and coordinate changes do not
matter, by the pinned lemmas: `FormalGroup.heightIdeal_succ_eq_sup_of_sub_mem`
gives I_(p,n+1)=I_(p,n)+(v) for every v congruent modulo I_(p,n) to the
coefficient of X^(p^n) in [p]_F, `FormalGroup.heightIdeal_eq_span` gives
I_(p,n)=(v₀,…,v_(n−1)) for these coefficients, with v₀=p
(`FormalGroup.heightIdeal_one`), and `FormalGroup.heightIdeal_smul` and
`TauCeti.FormalGroupIso.heightIdeal_eq` give independence of the
coordinate. What is proved here is the congruence that feeds them: the
image in MU_(p)* of the p-typical generator v_n is congruent modulo
I_(p,n) to that coefficient, because the p-series of the p-typical law is
the formal sum of the v_i x^(p^i) for the Araki generators, the
Hazewinkel generators are congruent to them modulo p (Ravenel, Theorem
A2.2.3 and (A2.2.4), p. 364), and conjugating by the strict comparison
isomorphism leaves the coefficient of X^(p^n) unchanged modulo I_(p,n);
hence I_(p,n) is generated by the images of p,v₁,…,v_(n−1). This
identifies the criterion on an MU_*-module without pretending the
quotient MU_(p)*→BP_* is a flat map of coefficient rings.
*Needs:* F3's p-typicalization and BP_*BP; F2's MU_*MU; F1's pinned
`FormalGroup.heightIdeal`, `FormalGroup.heightIdeal_one`,
`FormalGroup.heightIdeal_eq_span`,
`FormalGroup.heightIdeal_succ_eq_sup_of_sub_mem`,
`FormalGroup.heightIdeal_smul` and `TauCeti.FormalGroupIso.heightIdeal_eq`.

State the classification on the Lazard ring itself, at every prime at
once, with F1's pinned coordinate-change Hopf algebroid (L,L[b₁,b₂,…]):
`TauCeti.LazardRing` with its grading `TauCeti.LazardRing.grading`, the
right unit `TauCeti.LazardRing.rightUnit` and the left unit
`MvPolynomial.C`. Prove that an ideal I of L, homogeneous for that
grading, is prime and invariant, meaning that its extensions to
L[b₁,b₂,…] along the two units agree, precisely when for some prime p
either I=I_(p,n) for some finite n≥0 or I=I_(p,∞)=⋃_n I_(p,n), where
I_(p,n) is the pinned `FormalGroup.heightIdeal` of the universal law
`TauCeti.LazardRing.formalGroup`, the ideal generated by the
coefficients of [p]_F below degree p^n
(`isPrime_and_invariant_iff_eq_heightIdeal`; Ravenel, Theorem 1.3.16(iv),
p. 17, for L, and Theorem 4.3.2(iv), p. 121, for BP_*). The source's
list for L starts at n=1; the zero ideal I_(p,0)=0 belongs to it, being
invariant and prime because L is a domain, and both source proofs take a
lowest-degree element, which is where homogeneity enters. The invariance
of every I_(p,n) is pinned (`TauCeti.LazardRing.map_rightUnit_heightIdeal`,
module `CoordinateChange.HopfAlgebroid`) and its primality is Ravenel,
Theorem 1.3.16(i). For the converse follow the proof of Theorem 4.3.2(iv)
on L: the degree-zero part of a nonzero homogeneous invariant prime is
(p) for a prime p, since a lowest-degree element of positive degree would
be a primitive of L, and the invariants of L are ℤ in degree 0 (the
L-form of Theorem 4.3.2(ii), transported along the p-typical
comparison above); a
lowest-degree element of I outside I_(p,n) is invariant modulo I_(p,n),
hence a power of v_n by 𝔽_p[v_n]=H⁰ of L/I_(p,n) (Theorem 1.3.16(iii)), so
v_n∈I by primality. *Needs:* F1's pinned `TauCeti.LazardRing`,
`TauCeti.LazardRing.grading`, `TauCeti.LazardRing.rightUnit`,
`TauCeti.LazardRing.formalGroup`, `FormalGroup.heightIdeal` and
`TauCeti.LazardRing.map_rightUnit_heightIdeal`; for the route, the
invariant computations and the MU transport above.

**Checks.**
- I_(p,0)=0 and I_(p,1)=(p): the coefficients of [p]_F below degree p are
  p in degree 1 and multiples of p in degrees 2,…,p−1
  (`natCast_dvd_coeff_nsmulSeries`; the pinned `FormalGroup.heightIdeal_one`
  is I_(p,1)=(p)); a classification listing only n≥1,
  as the source's statement for L does, would wrongly exclude the zero
  ideal.
- at p=2, v₁=a₁₁ is the coefficient of X² in [2]_F, and the strict change
  of coordinates x+b₁x² sends the universal law to one with xy-coefficient
  a₁₁+2b₁, so η_R(a₁₁)=a₁₁+2b₁; hence (2,a₁₁−1) is invariant and prime,
  with quotient 𝔽₂[x₂,x₃,…], but not homogeneous: without the homogeneity
  hypothesis the classification is false.
- (a₁₁) and (3,a₁₁) are homogeneous primes that are not invariant, since
  2b₁ lies in neither extension; (3,a₁₁) is not I_(3,2)=(3,v₁), whose
  second generator is the coefficient of X³ in [3]_F, of degree 4, while
  a₁₁ has degree 2.

Prove Landweber's exact functor theorem for a graded MU_*-module M:
for every prime p, p and successive v_i act injectively on its successive
height quotients (Landweber 1976, Theorem 2.6; surveyed in Ravenel,
Section 4.2, p. 118). Zero quotients satisfy the criterion. Prove the
necessary Tor vanishing for the filtration factors from their finite
regular sequences; induct through the Landweber filtration to obtain
tensor exactness on finitely presented graded comodules. Prove MU_*X
is finitely presented for finite spectra X, using the coherent polynomial
coefficient ring and finite-cell/retract induction. Then pass through
filtered homotopy colimits over finite subcomplexes to construct the
homology theory MU_*(−)⊗_(MU_*)M on all CW pairs, with suspension,
wedges and the actual relative boundary maps. Construct its representing
spectrum by stable homology representability: on finite spectra use
Spanier–Whitehead duality to form the corresponding flat homology
functor, construct its wedge/cofiber realization by the Adams
representability argument for the countable finite stable category,
and prove its identification on finite sources and all filtered cell
unions. Construct the countability, flat-functor and realization
prerequisites here; G's cohomological Brown theorem alone is not this
homology representability argument. Construct comparison maps and products when M is a graded
algebra, retaining their coherence hypotheses. Distinguish a
multiplicative represented theory from a specified commutative
spectral-ring realization. Prove the coordinate-independent criterion
and height-stratum flatness formulation used for elliptic curves.
*Needs:* the Landweber filtration and the MU transport above; F4's comodule
tensor category; GeneralizedCohomology G5.1's finite duality and G3's
Brown representability and telescopes; F2's MU.

Develop finite-height formal-group deformations over complete local
rings. For a perfect field k of characteristic p and a commutative formal
group Φ over k of finite height h (`FormalGroup.height Φ p = h`), prove
the Lubin–Tate theorem: there is a commutative formal group Γ over
W(k)[[u₁,…,u_(h−1)]] (`MvPowerSeries (Fin (h - 1)) (WittVector p k)`)
reducing to Φ modulo (p,u₁,…,u_(h−1)) such that, for every complete
noetherian local W(k)-algebra A whose residue map π:A→k has kernel the
maximal ideal and restricts to the reduction W(k)→k, and every
commutative formal group G over A with π_*G=Φ, there is exactly one
W(k)-algebra map ψ:W(k)[[u₁,…,u_(h−1)]]→A sending each u_i into the
maximal ideal for which G is ⋆-isomorphic to ψ_*Γ, and then exactly one
⋆-isomorphism G→ψ_*Γ, an isomorphism whose series reduces to X under π
(`exists_lubinTate_universalLift`; Lubin–Tate, Theorem 3.1, with
Proposition 1.1 for Γ). Proposition 1.1 builds Γ when Φ≡x+y modulo
degree p^h; a general Φ is k-isomorphic to such a law (Lubin–Tate, §1,
p. 50), and Γ is transported along any lift of that isomorphism. The
uniqueness of the ⋆-isomorphism is pinned:
`TauCeti.FormalGroupIso.eq_of_map_residue_eq` (module `Rigidity`) proves
that isomorphisms between commutative laws over an 𝔪-adically Hausdorff
local ring with the same reduction are equal when the reduction of the
source has finite height. Then construct the coordinate changes and the
automorphism action of Aut(Φ) on the deformation ring, and the
complete-local deformation prerequisites, using Mathlib's `WittVector`
carrier and its existing ring/Frobenius/Verschiebung APIs, including
representability, inverse-limit and base-change proofs. These algebraic
targets supply EllipticCohomology's spectral realization and Serre–Tate
comparison; the Goerss–Hopkins–Miller E∞ realization is owned there.
Include height-one multiplicative and height-two elliptic examples.
*Needs:* Mathlib `WittVector`, `MvPowerSeries`, `IsAdicComplete`,
`FormalGroup.map`; F1's pinned `FormalGroup.height`,
`TauCeti.FormalGroupIso` and Lazard's cocycle lemma
`TauCeti.existsUnique_eq_smul_lazardCocycle` (Lubin–Tate's buds and
2-cocycles); `TauCeti.FormalGroupIso.eq_of_map_residue_eq`.

**Checks.**
- at h=1, W(k)[[u₁,…,u_(h−1)]] has no variables and is W(k): every lift
  of a height-one Φ to A is ⋆-isomorphic to the base change of Γ along the
  unique W(k)-algebra map W(k)→A, so lifts of height-one laws have no
  moduli; a parametrisation by h variables instead of h−1 would give a
  spurious one-parameter family.
- the ⋆ condition is needed for uniqueness: [−1]_G is an automorphism of
  every commutative G, and it reduces to [−1]_Φ, whose linear coefficient
  is −1≠1 when p is odd and which differs from X at p=2 because [2]_Φ≠0
  at finite height; so the identity and [−1]_G are two isomorphisms G→G,
  and only the identity is a ⋆-isomorphism.
- for the height-two formal group of a supersingular elliptic curve over
  𝔽̄_p the base is W(𝔽̄_p)[[u₁]], one parameter, matching the
  one-dimensional deformation space of the curve; for the multiplicative
  group over 𝔽_p the base is ℤ_p.

### Examples

I_(p,0)=0, I_(p,1)=(p) and BP_*/I_∞=𝔽_p. The ring E(1)_*=ℤ_(p)[v₁,v₁⁻¹]
satisfies Landweber's criterion (p is injective and v₁ is a unit), so
E(1)_*(X)=BP_*(X)⊗_(BP_*)E(1)_*. The Lubin–Tate ring of the multiplicative
group over 𝔽_p is ℤ_p, and that of the height-two formal group of a
supersingular elliptic curve over 𝔽̄_p is W(𝔽̄_p)[[u₁]].

### Dependencies

F1 (the pinned Lazard ring, its coordinate-change Hopf algebroid, height
ideals and `TauCeti.FormalGroupIso.eq_of_map_residue_eq`), F3 and F4;
GeneralizedCohomology G3 and G5.1; Mathlib's `WittVector` and
`MvPowerSeries`.

## F6. Chromatic localization and fracture

### F6.1. Spectral Bousfield localization

Use G2's stable symmetric spectral model and F3's actual spectra. For a
supplied spectrum E define E-equivalences by derived E-smash and E-acyclic
objects by E∧X≃0; define E-locality by the contractibility of the derived
function spectrum F(A,Y) for every E-acyclic A. Construct Bousfield
localization L_E, its unit, derived mapping-space universal property,
functoriality, exactness and idempotence. Construct the localized model and
homotopy categories, their derived smash/localized smash and function
comparisons. Prove the smallness/cardinal bound and existence by
transfinite homotopy pushouts along a bounded family of E-equivalences,
consuming G2's model and small-object constructions (Ravenel,
*Nilpotence and Periodicity*, Theorem 7.1.3, p. 76, the existence and
functoriality of L_E for every homology theory E). Prove the required
local presentability/accessibility, left properness, cellular generating
cofibrations and cardinal bounds for these symmetric spectra from
simplicial sets and their sequence/module presentation. Prove the
localization-existence hypotheses for the chosen stable model and its
cofibrant replacements, not just its homotopy category; do
not assume that G2's stable-model existence already proves arbitrary
homological localization. Include all integer shifts in any mapping-space locality criterion. Compare G3's
integer localization and derived p-completion under their actual
hypotheses; these do not supply chromatic localization or its smashing
theorems.

Define the Bousfield class ⟨E⟩ by its acyclic objects, with
`⟨E⟩≤⟨F⟩` meaning every F-acyclic spectrum is E-acyclic.
Construct smash product, wedge/join and equivalence invariance. Construct natural
comparison transformations when the acyclic classes are included, prove
transitivity and unit compatibility, and identify the class of a supplied
smashing localization through its localized sphere. Do not assume every
L_E is smashing.

**Checks.**
- ⟨Hℚ⟩<⟨S⟩: the S-acyclic spectra are the contractible ones, so ⟨S⟩ is
  the largest class, and the Moore spectrum S/p is Hℚ-acyclic (its
  rational homology vanishes because p is invertible on ℚ) but not
  contractible; a definition comparing E-local instead of E-acyclic
  objects would reverse every such inequality.
- ⟨HF_p⟩<⟨Hℤ⟩: Hℚ∧HF_p≃0 while Hℚ∧Hℤ≃Hℚ≠0, so Hℚ is HF_p-acyclic and
  not Hℤ-acyclic, and every Hℤ-acyclic spectrum is HF_p-acyclic because
  HF_p is the cofiber of p on Hℤ.
- ⟨E⟩=⟨ΣE⟩=⟨E∨E⟩ for every E, since the three have the same acyclics,
  whereas a class attached to the homotopy type of E would separate E
  from ΣE; and ⟨E⟩∧⟨F⟩ is bounded by both ⟨E⟩ and ⟨F⟩ because an
  E-acyclic spectrum is E∧F-acyclic.

*Needs:* GeneralizedCohomology G2's stable model and small-object
constructions and G3's integer localization and derived p-completion;
F3's spectra.

### F6.2. Nilpotence and its proof constructions

Build the three distinct Devinatz–Hopkins–Smith conclusions on G's
actual derived smash, finite duality and ring spectra:

- MU-smash nilpotence: for a finite spectrum F, an arbitrary spectrum X
  and a stable map f:F→X, if the actual map MU∧f is null, then
  f^(∧r) is null for some positive r. No bounded-below or finite-type
  hypothesis is imposed on X.
- MU-self-map nilpotence: for a finite spectrum F, an integer d and
  f:Σ^dF→F, if the graded endomorphism MU_*f is nilpotent under
  composition, then f^r:Σ^(rd)F→F is null for some positive r.
  Keep the suspension identifications in the iteration.
- MU-Hurewicz nilpotence: for a unital homotopy-associative ring spectrum
  R, an integer d and x∈π_dR, x is nilpotent if and only if its
  MU-Hurewicz image in MU_*R is nilpotent. Construct the product on
  MU_*R and its compatibility with Hurewicz. No commutative or E∞
  structure, connectivity or finite-type hypothesis on R is required.

Here finite includes retracts of finite cell spectra. In the core proof,
connective finite type means a connective CW model with finitely many
cells in each degree; construct its homology/filtration finiteness
comparisons. Prove the core theorem for a connective associative ring
with this underlying finite-type model first, then the following
reductions in this order. For a positive-connective finite spectrum P,
its tensor algebra `JP=⋁_(j≥0)P^(∧j)` is a connective finite-type
associative ring. Its word-length splitting turns the core ring theorem
into smash nilpotence for a sphere-source map into P. For a general
finite-source map, finite duality replaces f by S→X∧DF. Factor both
this class and its MU-nullhomotopy through one finite stage of a filtered
finite-cell presentation of X∧DF; suspend into the positive-connective
range and use the tensor-algebra result. Prove compactness, the
suspension/twist comparisons and the finite-retract extension. This
constructs MU-smash nilpotence for an arbitrary target, rather than
assuming that target is connective or of finite type.

Next, for arbitrary R and d, the free MU-module adjunction identifies
its MU-Hurewicz class with the MU-module map
`Σ^dMU→MU∧R` induced by MU∧x. A zero class therefore gives an
actual null MU-smashed map. Apply MU-smash nilpotence to x:S^d→R
and compose its smash power with the iterated multiplication of R.
For a nilpotent Hurewicz image first apply this argument to a power of x.
Prove the adjunction, multiplication and suspension comparisons; this
is the unrestricted ring theorem, not a connective-cover assertion.
For the self-map theorem, construct the finite MU-cell ghost bound in
F4's triangulated derived right-MU-module category over G5.4's strict MU,
including finite-cell retracts and suspension shifts. The inductive
cofiber factorization is an arbitrary MU-module map; it need not itself
be the MU-smash of a map of spectra. A fixed power of
MU∧f is zero on π_* by the hypothesis; a sufficiently long composite
of these ghosts out of the finite-cell MU-module MU∧F is actually null.
Compare MU∧F(F,F) with its MU-module endomorphisms by finite duality
and apply the ring-element theorem to f in the endomorphism ring.

Include the Moore-boundary test: in S→^p S→M(p)→^δΣS,
MU_*δ=0, but H₁(δ;𝔽_p) is an isomorphism and field Künneth
shows every smash power of δ is nonzero.

Construct the core nilpotence proof following
[Devinatz–Hopkins–Smith, §§1–3](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/dhs-ocr.pdf).
Use G5.4's complex space-level Bott equivalence and G2.9's
loop/bar comparison, with the stable determinant fibration SU→U→S¹,
to construct the actual additive Bott map ΩSU→BU. Own this
SU-loop/clutching adapter, its rank inclusions and multiplicative
coherence; the bundle Bott theorem alone is not this map. Construct the native SU(r) stabilization and the sphere fibration
SU(r)→SU(r+1)→S^(2r+1), including local trivializations and the
loop homotopy-fibre comparison. Consume AlgebraicTopology Stage 5.5's
Serre-fibration predicate (the homotopy lifting property for all cubes)
and the locally trivial bundle instances of it; that stage owns their
homotopy long exact sequence and the ordinary Serre spectral sequences
over CW and arbitrary bases, so no second Serre predicate is built here.
Apply G5.3's numerable bundle/Thom diagrams to the finite-rank pullbacks
along ΩSU(r)→ΩSU→BU. Own their stabilized Thom-spectrum
comparison and the E₁/E₂ multiplicative refinement for these loop
maps, including module actions and associativity/coherence. G5's
symmetric commutative Thom diagrams do not themselves provide this
loop-map refinement. Construct X(r), its units, products and rank maps,
H_*X(r)=ℤ[b₁,…,b_(r−1)] with |b_i|=2i and the flat graded
cooperation Hopf algebroids used by the relative Adams comparison. Prove X(1)≃S, the (2r−1)-connectivity of
X(r)→MU and hocolim_r X(r)≃MU, with the Thom homology/product
comparisons. Own the James construction. For a pointed CW complex Y whose
basepoint is a 0-cell, construct J(Y) as the free topological monoid on Y
with the basepoint as unit, with the word-length filtration J_j(Y), the
image of Y^j, J₀=*, J₁=Y and J_j/J_(j−1)≅Y^(∧j), each J_j a subcomplex of a
CW structure on J(Y); construct the James map J(Y)→ΩΣY by concatenating
the adjoints of the suspended letters, and prove it is a weak homotopy
equivalence for path-connected Y (Hatcher, Theorem 4J.1; James 1955,
Sections 1–6). Prove that for a field 𝔽 with H_*(Y;𝔽) of finite type,
H_*(J(Y);𝔽) is the tensor algebra on the reduced homology of Y, with
H_*(J_j(Y);𝔽) its part of tensor length at most j (Hatcher, Proposition
3C.8). For Y=S^(2r), r≥1, deduce ΩS^(2r+1)≃J(S^(2r)),
H_*(ΩS^(2r+1);ℤ)=ℤ[b] with |b|=2r, the James stages J_jS^(2r) with
homology spanned by 1,b,…,b^j, and the quotients J_j/J_(j−1)=S^(2rj).
Prove functoriality in Y and compatibility of the filtration with the
monoid product. These are the stages of item 1 and the sources and
targets of the James–Hopf maps of item 3.
Checks: J₁(S²)=S², J₂(S²)/J₁(S²)=S⁴ and H₂(J₂(S²);ℤ)=ℤ on b, whereas a
construction with J₂/J₁=S²×S² would add two classes in degree 2; for
Y=S⁰ the James map is not an equivalence: J(S⁰) is the discrete monoid
ℕ while ΩS¹ has components ℤ, so the map misses the negative components
and the path-connectedness hypothesis is not removable. The proof has the
following constructions and estimates.

1. Pull the fibration ΩSU(r)→ΩSU(r+1)→ΩS^(2r+1) back over
   the James stages J_jS^(2r) constructed above. Construct their
   Thom spectra F_j, the X(r)-module filtration of X(r+1), F₀=X(r),
   quotients Σ^(2rj)X(r), and the homology/comodule basis
   1,b_r,…,b_r^j over X(r+1)_*X(r). Build its relative Thom
   comparisons and the X(r+1)-Adams exact couples here, comparing with
   F4's tower conventions rather than identifying different ring bases.
   Construct their convergent spectral sequence for G_k∧R with
   E₂=Ext_(X(r+1)_*X(r+1))(X(r+1)_*,X(r+1)_*(G_k∧R)),
   its grading, product/action of α, and finite-type/Künneth comparisons.
2. For each prime p set G_k=(F_(p^k−1))_(p). Prove the relative Ext
   change of rings, p-adic/May
   filtration and normalized-cobar estimates reducing to the polynomial
   Hopf algebra generated by b_r^(p^k), |b_r|=2r. Prove vanishing
   lines with slope tending to zero as k grows, uniformly in the
   connective input comodule after its connectivity shift. In the
   normalized cobar model prove vanishing for
   t−s<(2r p^k−1)s−c; in a minimal resolution prove the bound
   t−s<(r p^(k+1)−1)s−c′, with intercepts c,c′ and the input
   connectivity shifts explicitly quantified. These have slopes
   1/(2r p^k−1) and 1/(r p^(k+1)−1), equal at p=2.
   Quantify the intercepts and
   connectivity/finite-type hypotheses and prove the tensor-comodule
   shift of the vanishing bound. Apply them
   to each connective finite-type associative R, positive-degree class
   α∈π_dR, d>0, whose
   X(r+1)-Hurewicz image is nilpotent. After taking a power, α has
   X(r+1)-Adams filtration at least one. Define Tel(α;R) as the
   telescope of the suspended left-multiplication maps and prove, for
   every supplied unital homotopy-associative R and integer-degree α,
   Tel(α;R)≃0 if and only if α is nilpotent; prove its E-smashed
   version detects nilpotence of the E-Hurewicz image when E is a
   supplied ring spectrum. Prove that sufficiently large
   James stages smashed with the multiplication telescope Tel(α;R)
   are contractible, by annihilating each homotopy class. A convergent
   Adams spectral sequence without this stage-dependent estimate is
   insufficient.
3. Construct the combinatorial James–Hopf maps
   H_j:J(Y)→J(Y^(∧j)) for every j≥1, using the ordered j-element
   subwords, their basepoint identifications and filtration/naturality
   homotopies; the length-two map H₂ is the special case j=2.
   For Y=S^(2r), define h₀=id and h_(k+1)=H_p∘h_k, with H_p
   taken on ΩS^(2r p^k+1), and prove p-local mod-p homology
   surjectivity of every h_k:ΩS^(2r+1)→ΩS^(2r p^k+1).
   Define F′_(p^k−1) as the actual homotopy fibre of h_k composed
   with ΩSU(r+1). Use this iterated composition in the cartesian
   squares, not an unproved literal equality H_p∘H_(p^k)=H_(p^(k+1)).
   Compare them with the pulled-back James stages and construct the cartesian
   squares and p-local fibre sequence
   F′_(p^k−1)→F′_(p^(k+1)−1)→J_(p−1)S^(2r p^k).
   Apply the Thom construction to these squares to identify the
   consecutive G_k. Construct DHS Proposition3.27's actual extension:
   E′=ΩSU(r+1) with its projection followed by h_k to
   ΩS^(2m+1), m=rp^k. Its pullback over J_(p−1)S^(2m)
   is E=F′_(p^(k+1)−1) p-locally. Use the stabilized classifying
   map E′→BU extending the Thom bundle on E. Derive the Ω²S^(2m+1) fibre action from
   this extension; it is not an extra assumed action. Own DHS
   Lemma3.35/Proposition3.33 here p-locally; no integral fibre-sequence
   assertion is inferred from a mod-p calculation.
   Construct the coherent Thom diagonal and maps θ_j on these James
   stages, their binomial composition laws, filtration-quotient
   equivalences and naturality under smashing. In the length-(p−1)
   comparison, (p−1)! is invertible p-locally. Construct
   b:Σ^(2r p^(k+1)−2)G_k→G_k and its cofiber/Bousfield
   decomposition, and prove consecutive
   p-power James stages have the same Bousfield class by proving
   Tel(b)≃0. Use the Ω²S^(2m+1) action derived above, with
   m=r p^k, and prove its compatibility with b.
   Own the little-2-cubes configuration operad, its extended powers
   D_(2,j)(Y)=C₂(j)_+∧_(Σ_j)Y^(∧j). Construct May's approximation
   theorem for the connected based CW sphere input, comparing the
   free little-2-cubes algebra with Ω²Σ²Y, before the specialized stable
   splitting of Ω²S^(2m+1)_+ into D_(2,j)(S^(2m−1)). Construct
   its filtration, products, naturality and mod-p homology operations
   needed for the factorization of powers of b. Prove the mod-p
   vanishing of b and the increasing-connectivity comparison which
   makes each homotopy class in its telescope zero. Supply both the
   odd-prime and prime-2 homology/operation proofs. The source's
   odd-prime calculation leaves prime-2 modifications to the reader;
   those modifications are targets here, not an assumed consequence
   of F2's cohomological Steenrod operations or G's E∞ transfer.
4. Combine the stage-dependent vanishing and the Bousfield comparisons
   to descend nilpotence from X(r+1)_*R to X(r)_*R. The G_k are
   p-local: prove the descent for every prime and the rational branch,
   then assemble the contractibility of X(r)∧Tel(α;R) from rational
   and all p-local homotopy groups. Compactness detects
   a zero MU-Hurewicz class at one finite X(r) stage. Descend to X(1)
   to prove the core connective finite-type ring theorem. Negative
   degrees vanish by connectivity; degree0 uses the isomorphism
   π₀R→π₀(MU∧R) before the positive-degree argument. Then apply
   the preceding reductions. Keep the multiplication telescope distinct
   from an inverse limit or an arbitrary BP completion.

*Needs:* GeneralizedCohomology G5's Thom and complex Bott models and G3.8's
Milnor sequence; F2's MU and Adams towers; F4's Adams–Novikov spectral
sequence and its convergence; F6.1's Bousfield classes; AlgebraicTopology's
CW complexes for the James construction.

### F6.3. Finite height, periodicity and telescopes

Fix a prime p. Before finite-type classification, construct P(n) and B(n)
from F3's BP and F5's height ideals by actual ordered cofibers and
localization, with P(0)=BP, P(n)=BP/(p,v₁,…,v_(n−1)),
B(n)=v_n⁻¹P(n) for n≥1, and P(∞)=hocolim_nP(n).
Use F3's ordered-cofiber homotopy products and construct their
homotopy BP-actions and compatible P(j)/B(j)-actions on K(j).
These are unital/associative homotopy actions, not an assumed A∞
BP-module category. Construct the K(j) field Künneth and graded
module-basis splitting at this point: every nonzero homotopy K(j)-module
is a wedge of suspensions of K(j), by choosing a graded coefficient
basis and using its unit/action maps. Deduce the Bousfield minimality
`⟨Z⟩∧⟨K(j)⟩∈{0,⟨K(j)⟩}` for every spectrum Z.
Prove `P(∞)≃H𝔽_p` by the homotopy-cofiber coefficient computation
and connectivity. Construct the Johnson–Wilson–Würgler stable natural homology
comparison
`Λ_X:B(n)_*X≃K(n)_*X⊗_(𝔽_p)𝔽_p[v_(n+1),v_(n+2),…]`
(Johnson–Wilson, Proposition 4.14; Würgler, Theorem 2.16 and Remark 6.19).
Use F3's BP operations and ordered regular quotients to construct
quotient-operation lifts and Bocksteins. Prove their completed module
presentation indexed by BP-operation multi-indices and binary Bockstein
words, with Cartan, coefficient and suspension comparisons; prove the
prime-2 product relations separately. The comparison consumes the following explicit part of that API.
For each finite-support multi-index E in v_(n+1),v_(n+2),…,
write |E|=b_E d_n+a_E, d_n=2p^n−2 and 0≤a_E<d_n.
Construct the quotient-operation components
`s_E:P(n)→Σ^(a_E)k(n)`, with k(n) the connective quotient
killing v_i for i≠n, and its localization k(n)→K(n).
For E=(0,…,0,e_(n+1),…) pin
`σ^nE=(p^n e_(n+1),p^n e_(n+2),…)` and
`c_E=b_E−Σ_(i>n)e_i≥0`. Thus
`|σ^nE|=c_Ed_n+a_E`. Define the component by actual stable maps
`s_E:=λ_n∘v_n^(c_E)∘(r_(σ^nE))_n`, with the displayed
suspensions, and λ_n:P(n)→k(n). Construct this quotient-operation
lift for every height using the BP version of the completed-operation
module presentation. Compare its lifting/commutator obstructions through
successive regular cofibers with the completed Koszul–Bockstein
presentation, and construct the nullhomotopies expressing its Cartan
and v_n-linearity identities. The right-unit congruence alone is not
its descent proof, and uniqueness of arbitrary chosen lifts is not
presumed. Define
`Â_X(y)=Σ_E v_n^(−b_E)s_E(y)⊗v^E`, where |v^E|=|E|.
For finite X choose b with P(n)_qX=0 for q<b. On input degree t,
the first operation is zero when |σ^nE|>t−b. There are only
finitely many E with bounded shifted degree, so the sum is finite;
multiplication by v_n^(c_E) occurs after this vanishing test.
Construct the coefficient dual basis. Pin the triangular range,
including ties: `r_F(v^E)≡0 mod I_n` if
`|F|≥|σ^nE|` and `F≠σ^nE`, while
`r_(σ^nE)(v^E)≡v_n^(Σe_i) mod I_n`. In each fixed
connective degree this is a finite triangular matrix with the displayed
powers of v_n on its diagonal. After inverting v_n the normalization
v_n^(c_E−b_E) makes that diagonal1. Construct its lower-finite
triangular inverse on the localized module and compare the fixed-degree
connective blocks; do not invert these diagonal entries before localization.
This proves the coefficient isomorphism.
The all-height operation lift gives `Â(v_n y)=v_n Â(y)`, hence
Λ after inverting v_n. Prove the comparison on finite spectra by
exactness and cells, then extend by filtered finite-subcomplex
homotopy colimits to all CW spectra and pairs, with suspension,
boundary and filtered-colimit naturality. This is an additive theory
comparison, with no imposed multiplicative or BP-linear splitting.


Construct the coefficient-localization and ordered-cofiber diagrams on
actual scalar-action maps. The maps on quotients are the supplied BP
coefficient actions, not arbitrary fillers with the same π_* action.
Construct action comparisons for quotient inclusions and boundaries,
their commuting-map homotopies, and the rectified ladders used by each
telescope. For infinitely many higher-generator cofibers, prove their
filtered-colimit comparison and its compatibility with localization.
Keep the usual meaning of unital homotopy ring, with actual unit and
associativity identities in the stable homotopy category. For an acyclic-
class argument needing less, construct explicitly a spectrum pairing
`m:C∧C→C`, a unit candidate `η:S→C`, and prove
`ℓ_C=m∘(η∧id_C)` is a true π_*-isomorphism. This is a weaker
pairing certificate, not a redefinition of a unital homotopy ring.
Spectral Whitehead and ℓ_C⁻¹ give the actual retraction used below;
no phantom difference is silently set to zero. For telescope pairings
use the diagonal cofinal sequence in the product of the two telescope
indices, finite-stage products and their scalar-action homotopies.
Prove the unit comparison on true π_* and transport it through the
actual quotient/localization maps. Retain full homotopy-ring or module
identities wherever those structures are used.

For any suspended self-map f:Σ^dZ→Z prove
`⟨Z⟩=⟨cofib(f)⟩∨⟨Tel(f)⟩` by smashing with an arbitrary
spectrum. A zero smashed cofiber makes f invertible and identifies
the initial object with its telescope. This needs no centrality or ring
hypothesis; central coefficient localization is a specialization.
Use this to prove
`⟨P(n)⟩=⟨K(n)⟩∨⟨P(n+1)⟩` and `⟨B(n)⟩=⟨K(n)⟩`.
The second equality follows on all CW spectra directly from the
stable natural homology comparison just constructed, with its
filtered-colimit extension. The rational branch B(0)=p⁻¹BP is a
nonzero Hℚ-module and has class K(0)=Hℚ. This proof does not
require a vanishing colimit to have an acyclic finite stage.

Prove the following pairing/field test before the remaining comparisons.
For nonzero C with the preceding pairing certificate and
⟨C⟩≤⟨K(j)⟩, K(j)∧C cannot vanish: otherwise C∧C=0,
contradicting the equivalence ℓ_C. Field Künneth gives
`⟨K(j)⟩=⟨K(j)∧C⟩≤⟨C⟩`, hence equality.
Also prove the locality criterion: if ⟨C⟩≤⟨E⟩, then C∧Y is
E-local for every Y. Factor each map A→C∧Y, for E-acyclic A,
through C∧A using η and m, and apply the inverse of ℓ_C∧id_Y;
include every integer shift. These statements include genuine unital
homotopy rings, but only consume the explicit weaker certificate.
For fixed n≥1 apply the finite lower-generator cofiber/telescope
decomposition to v_n⁻¹P(j), j=0,…,n+1. For j≤n, the object
v_n⁻¹B(j) is built from B(j) by the actual scalar localization.
Its pairing certificate and nonzero coefficient ring give class K(j)
by the preceding test.
The coefficient v_n acts by zero on π_*P(n+1). Thus π_* of
its telescope is the colimit of zero transition maps and vanishes;
spectral Whitehead gives v_n⁻¹P(n+1)≃0. No nullhomotopy of
the individual coefficient-action map is inferred from this fact.
Deduce
`⟨v_n⁻¹BP⟩=⟨K(0)∨⋯∨K(n)⟩`.
Apply the same finite decomposition to E(n)/I_j, j=0,…,n+1.
Construct its localized term v_j⁻¹(E(n)/I_j) as the compatible
higher-generator quotient/localization of B(j), so its class lies
below K(j). Its explicit nonzero coefficient ring and pairing certificate
give equality by the same test. The terminal quotient is zero since
v_n is a unit. This proves
`⟨E(n)⟩=⟨K(0)∨⋯∨K(n)⟩=⟨v_n⁻¹BP⟩`.
All coefficient maps, centrality homotopies and products used in
these finite diagrams are construction targets here, compatible with
F3's ordered quotient models. In particular compute
BP_*E(n)=BP_*BP⊗_(BP_*,η_R)E(n)_* by the right-flatness
of the cooperation algebra and the actual ordered regular cofibers;
construct the flipped E(n)_*BP comparison with the antipode.
Prove E(n)_*BP is flat over its right BP_* action: extend an
arbitrary short exact sequence of graded BP_*-modules to comodules
by BP_*BP⊗_(η_R)−, use cooperation flatness, and apply F5's
Landweber-exact E(n)_*⊗_(η_L)− functor. Identify the resulting
module functor with E(n)_*BP⊗_(BP_*)−. Deduce the regular-power
cofiber and quotient comparisons used in the Moore localization
maps, with the indicated right action.
These are arbitrary-spectrum acyclic class proofs, preceding type examples, periodicity and Moore systems.
K(n) is not assumed Landweber exact over BP_*.
Construct the p-typical ring comparison: the homotopy-ring map
BP→MU_(p), its unit/product homotopies and the MU_(p) homotopy
BP-algebra action from F3's p-typicalization. It transports a null
BP-smashed map to a null MU_(p)-smashed map. It does not assert
an A∞ structure on BP.

Construct Smith's idempotent toolkit before its finite-spectrum
applications. Consume SchurWeyl Layers0,2,5's native Young-diagram,
row/column, rational symmetrizer and hook-length APIs. Form the same
row-symmetrizer times column-antisymmetrizer finite sum over ℤ, prove
its quasi-idempotent equation by the injective rational comparison,
and use the staircase partition λ_i=(a+1−i)(p−1), 1≤i≤a.
Prove its hook product μ_λ is prime to p, so
 e_a=μ_λ⁻¹c_λ∈ℤ_(p)[Σ_((p−1)binom(a+1,2))]
is an actual idempotent. Own the p-local transport and its actions on
graded tensor powers with Koszul signs. For V=V⁺⊕V⁻ put
 a_V=dimV⁺+floor(dimV⁻/(p−1)),
 k_V=(p−1)binom(a_V+1,2) and e_V=e_(a_V).
Prove its nonzero-image and subspace-annihilation tests, and the
free-summand criterion for the local finite Hopf algebras used in
Ravenel AppendixC.2.2. Construct their image/splitting and homology
base-change comparisons on finite p-local smash powers, using G's
idempotent splitting. These p-local/graded constructions do not
follow from complex semisimplicity.

Construct the linear-connectivity MU/BP telescope theorem: for a sequence X_j with connectivity
c_j≥aj+b for fixed real a,b and maps zero on MU homology, its
homotopy direct limit is zero. Use the Smith summand of smash powers
of finite CP spaces to produce a nonzero torsion-free finite W with
arbitrarily small-slope Ext vanishing over
`P_* = 𝔽_p ⊗_(BP_*) BP_*BP ⊗_(BP_*) 𝔽_p = 𝔽_p[t₁,t₂,…]`.
Construct its map to the dual Steenrod algebra with t₀=ξ₀=1 and
these pinned coproducts:
`Δt_n=Σ_(i=0)^n t_i⊗t_(n−i)^(p^i)` in P_*, and
`Δξ_n=Σ_(i=0)^n ξ_(n−i)^(p^i)⊗ξ_i` in the polynomial
part of A_*. Derive the first from composition of F3's strict
p-typical coordinates modulo (p,v₁,v₂,…), where the law is
additive. With ζ_i=χ(ξ_i), antipode anti-comultiplicativity gives
`Δζ_n=Σ_i ζ_i⊗ζ_(n−i)^(p^i)`. Prove the coalgebra identity
for t_i↦ζ_i at odd p and t_i↦ζ_i² at 2 by Frobenius.
This pins the side of the cooperation map rather than allowing an
uncompared opposite coproduct. Construct the P_*-comodule H_*W from the BP_*BP coaction
on 𝔽_p⊗_(BP_*)BP_*W and compare with ordinary homology; prove
the corresponding A_*-coaction factors through this P_* model.
At p=2 this is a proper sub-Hopf algebra, not the full polynomial
A_* with its h₀-towers. Prove the Anderson–Davis/Miller–Wilkerson
Margolis vanishing criterion needed here, the BP cobar/May comparison
and connectivity shifts, and the increasing-Adams-filtration bound
on composites. Choose the slope against a so each fixed homotopy
class dies at a finite stage. Prove W has the sphere Bousfield class
by its torsion-free bottom homology summand and the MU/BP-smash
nilpotence theorem. This is a homotopy direct-limit theorem, not
an inverse-limit vanishing statement.

Put K(0)=Hℚ, K(∞)=H𝔽_p, and use F3's K(n)
for 1≤n<∞. Prove the Morava-height forms of nilpotence: for a
finite-source map f:F→X with arbitrary p-local target, vanishing of
K(m)_*f for every 0≤m≤∞ detects smash nilpotence; for a self-map
of a finite p-local spectrum, nilpotence of each K(m)-homology
endomorphism detects composition nilpotence. Prove their comparison
with the MU-smash and MU-Hurewicz versions using the preceding class
identities. For a ring R and a class x whose every height-Hurewicz
image is nilpotent, form the left-multiplication telescope R′.
K(m)∧R′ is zero for all heights, including ∞. The null unit in
P(∞)∧R′ is already null at some finite P(N)∧R′ by sphere
compactness. Use the preceding ordered-cofiber homotopy products
and module actions to compare P(j)∧R′ with the left-multiplication telescope
of the P(j)-Hurewicz class: the vanishing of its unit class forces
a power of that class to vanish, hence this telescope is contractible.
Descend through the P(j) class identities to BP∧R′≃0. Apply the
MU/BP nilpotence comparison to x. For finite-source general maps,
use finite duality and the free tensor algebra on the target of the
resulting sphere-source map; its word-length summands recover actual
smash powers. For finite self-maps use the endomorphism ring.
This argument uses the class identities, not a linear-connectivity
hypothesis on the arbitrary target. Include height∞ for arbitrary targets;
the unit S→H𝔽_p is not detected by finite-height K-theories.
Use the preceding field Künneth and construct its finite-duality
comparisons. Prove finite support monotonicity
K(n)_*F=0⇒K(n−1)_*F=0, n≥1, and eventual nonvanishing
K(n)_*F≠0 for all sufficiently large n when F is nonzero finite
p-local. Define its type by its least nonzero finite height, and type∞
for the zero spectrum. Prove the support characterization before using
type in a construction. Prove monotonicity from the finite BP-comodule
height filtration and its derived K(n) comparisons, and eventual
nonvanishing from the finite-cell K(n)-AHSS when the period is larger
than the cell range, followed by finite-p-local ordinary-homology
detection. Do not replace either comparison by a false inclusion
between the Bousfield classes of distinct Morava fields.

**Checks.**
- S_(p) has type 0, since K(0)_*S_(p)=ℚ≠0; S/p has type 1, since
  K(0)_*(S/p)=0 (p is invertible on ℚ) while K(1)_*(S/p)=K(1)_*⊕ΣK(1)_*
  is nonzero because p=0 in the 𝔽_p-vector space K(1)_*.
- the zero spectrum has type ∞ and, by eventual nonvanishing, is the only
  finite p-local spectrum with K(n)_*X=0 for every n; a definition by the
  largest n with K(n)_*X=0 is undefined on S_(p), where no such n exists.
- the cofiber of a v₁ self-map v:Σ^dS/p→S/p has type 2: it is K(0)- and
  K(1)-acyclic, and K(2)_*≠0 because v acts nilpotently, hence not
  bijectively, on K(2)_*(S/p)≠0; the type rises by exactly one, while
  mod-p homology only doubles in rank.

Define a positive-degree v_n self-map by K(n)-homology invertibility and nilpotence at
every other height. Its positive degree makes mod-p homology nilpotent
on a finite spectrum. Prove some positive power of any such map has degree
2a(p^n−1), a>0, inducing scalar multiplication by v_n^a on
K(n)-homology. This is a normalization of an existing map; arbitrary
v_n self-maps can have other degrees. For chosen maps v:Σ^dF→F
and w:Σ^eF→F, prove there exist positive a,b with ad=be and
v^a=w^b. For h:F→G between type-n spectra prove suitable
equal-degree powers intertwine h with its actual suspension.
Carry these choices/comparisons through composition.

**Checks.**
- at p=2 the Adams map Σ^8S/2→S/2 is a v₁ self-map of degree
  8=2·4·(2−1), with a=4, while at odd p the Adams map Σ^(2p−2)S/p→S/p has
  a=1; the normalization asserts only that some power has degree
  2a(p^n−1), not that a=1 is attained.
- the identity of S/p is K(1)-invertible but also K(n)-invertible for
  every n≥2, so it is not a v₁ self-map; the zero map Σ^dS/p→S/p is
  nilpotent at every height but not K(1)-invertible; each clause of the
  definition excludes one of them.
- multiplication by p on S_(p) is K(0)-invertible and zero on K(n)_* for
  n≥1 (p=0 there), the degree-zero v₀ case, which the positive-degree
  requirement keeps out of the definition for n≥1.

Construct nonzero finite type-n spectra for every n≥1 by the following
Smith/Margolis construction, separate from the torsion-free type0 CP
summands used above. Own the finite Steenrod sub-Hopf algebras,
Margolis homology, free-module criteria and associated Adams estimates;
consume F2's mod-p Steenrod algebras and Adams towers and construct these
spectral instances. Construct E(Q_i) and, for t>0, the Hopf algebra T_t generated
by P_t^s, 0≤s<t, dual to 𝔽_p[ξ_t]/(ξ_t^(p^t)), with
their dual Hopf-ideal comparisons, including the prime-2 proof. For a p-nilpotent operator P use the
Margolis
criterion ker(P)=im(P^(p−1)); for square-zero Q use ker(Q)=im(Q).
Prove their equivalence to freeness over the corresponding truncated
polynomial/exterior subalgebras, rather than treating an odd-primary
P as square-zero.

For finite p-local X define strong type n by these exact conditions
on H=H^*(X;𝔽_p), the indices always obeying 0≤s<t. At p=2 require
vanishing P_t^s-Margolis homology for s+t≤n+1, excluding (s,t)=(0,n+1),
with Q_n=P_(n+1)^0. At odd p require this vanishing for s+t≤n and
Q_i-Margolis vanishing for i<n. In both cases require Q_nH=0
and dim_(𝔽_p)H=rank_(K(n)^*)K(n)^*X. Define partial type n
by the latter two conditions and nontrivial action of each Q_i and
P_t^0 occurring in the strong-type conditions, without the freeness
or s>0 conditions. Build the actual partial-type seed
`B_2^(2p^n) = (BC_p)^(2p^n)/(BC_p)^1`, using AlgebraicTopology Stage 8.8's bar/CW
model and its skeletal/stunted quotient. Compare its standard lens/RP
cells and mod-p operations with that model. At odd p use the basis
x^k (1≤k≤p^n), yx^k (1≤k<p^n), |x|=2, |y|=1,
with Q_i(yx^k)=x^(k+p^i) and P_t^0(x^k)=k x^(k+p^t−1),
and their y-multiples. Verify nontriviality using classes actually
present in the quotient, such as yx, and prove the analogous prime-2
calculation. Q_n-triviality and the rank equality follow from the
actual finite K(n)-AHSS, including its edge and extension comparison.

**Checks.**
- at odd p, S/p has type 1 but not strong type 1: H^*(S/p;𝔽_p) is 𝔽_p in
  degrees 0 and 1 with Q₀=β an isomorphism between them, so the
  Q₀-Margolis homology vanishes, Q₁H=0 for degree reasons and
  dim H=2=rank K(1)^*(S/p); but P₁⁰=P¹, of degree 2p−2≥4, acts as zero,
  so its P₁⁰-Margolis homology ker P¹/im (P¹)^(p−1) is all of H, which
  the condition at (s,t)=(0,1) forbids (Ravenel, Nilpotence and
  Periodicity, Definition 6.2.3, p. 64). Strong type is sufficient for a
  v_n self-map, not necessary: the Adams map of degree 2p−2 exists on S/p
  regardless.
- at p=2, S/2 has strong type 1: the indices obey 0≤s<t, so for n=1 the
  vanishing condition runs only over (s,t)=(0,1), the pair (0,2) being
  excluded and Sq²=P₁¹ not occurring (it is not nilpotent of order 2,
  since Sq²Sq²=Sq³Sq¹≠0); Sq¹=P₁⁰ is an isomorphism from degree 0 to
  degree 1 of H^*(S/2;𝔽₂), so its Margolis homology vanishes, Q₁H=0 for
  degree reasons and dim H=2=rank K(1)^*(S/2), since 2=0 in K(1)_*
  (Ravenel, Nilpotence and Periodicity, Definition 6.2.3, p. 64). A reading
  that admitted (s,t)=(1,1) would wrongly exclude S/2.
- at p=2, S/4 has type 1 but not strong type 1: K(0)_*(S/4)=0 and
  K(1)_*(S/4) has rank 2 because 4=0 in K(1)_*, but the attaching map has
  degree 4, so Sq¹ acts as zero on the two-dimensional H^*(S/4;𝔽₂) and its
  Margolis homology is all of H, which the condition at (s,t)=(0,1)
  forbids; strong type therefore depends on more than the type.
- a nonzero strong type n spectrum X has type n: the vanishing Margolis
  homologies force K(m)_*X=0 for m<n, and the rank equality gives
  rank K(n)^*X=dim H≠0 (Ravenel, Nilpotence and Periodicity, p. 65).
- the zero spectrum satisfies every strong-type condition for every n
  (all Margolis homologies vanish, Q_nH=0 and 0=0), but fails partial
  type n, whose nontrivial-action clauses need H≠0; strong type is used
  only together with X≠0, which the nonzero seeds guarantee.

Apply the already constructed graded p-local Smith idempotents to
smash powers of this seed. For the finite family of sub-Hopf algebras
in the strong-type conditions, construct free summands in suitable
tensor powers from each specified nontrivial action. Choose a common
power and the staircase idempotent using the nonzero-image and
Margolis-image dimension inequalities: for the relevant subspaces
U⊆V require dim U⁺≤dim V⁺−1 or
 dim U⁻≤dim V⁻−(p−1). An exterior-Q free summand supplies a
nonzero even part, and a rank-one free T_t summand supplies at
least p^t to one parity part at odd p. At2 the dual basis x^j,
0≤j<2^t, has |x|=2^t−1 odd, so there are 2^(t−1) vectors
in each parity for t≥1. Thus it also supplies the required ≥1
codimension, since p−1=1. Prove that tensoring a free
summand with a nonzero module preserves a free summand, and that
Koszul permutation actions commute with the Steenrod action by
cocommutativity of its coproduct. Use these facts to choose the
common power, using the Hopf regular-tensor isomorphism from the
coproduct and antipode with its graded signs; prove the resulting retract
has nonzero mod-p homology, is free over every required subalgebra,
retains Q_n-triviality and satisfies the K(n)-rank equality. This
constructs an actual nonzero strong-type X. For i≥1 identify Q_i with the
first K(i)-AHSS differential of length 2p^i−1, with its specified
v_i coefficient and homology dual. Treat Q_0 by the integral
Bockstein comparison and finite p-local rational-homology detection,
not a mod-p AHSS for K(0)=Hℚ. Prove the later-differential
and survival comparisons establishing that this X has type n.

Construct its first v_n map in the multiplicative mod-p Adams spectral
sequence for R=DX∧X. Prove the Margolis bound
`Ext_A^(s,t)(H^*R,𝔽_p)=0` for s>c+(t−s)/(2p^n−2).
For A_N generated by Sq^1,…,Sq^(2^N) at 2 and by
β,P^1,P^p,…,P^(p^(N−1)) at odd p, construct the change-of-rings
map to Ext_(A_N) and prove it an isomorphism when
`s>(t−s)/(2p^n−2)−k_N`, N>n, with k_N→∞.
Construct the restriction λ to the Q_n-Ext polynomial algebra and,
for sufficiently large N, an Ext_(A_N) class mapping to a positive
v_n power. Lift it through the indicated isomorphism. Construct the needed
finite-sub-Hopf Frobenius-power lift from unit cohomology by its
May/change-of-rings spectral sequence and the strong-type Margolis
conditions, so its image in Ext_(A_N)(H^*R,𝔽_p) is central.
For a possible u=d_r(y), put both yu and uy in the indicated
isomorphism region and prove φ(yu−uy)=0, hence yu=uy.
The derivation identity then makes the next p-power a cycle;
the vanishing line eventually excludes every further differential.
Prove strong convergence and resolve the multiplicative extensions;
identify the image in K(n)_*R=End(K(n)_*X) as scalar multiplication
by a v_n power. Since X is finite of positive type, its relevant
positive-degree endomorphism homotopy is finite p-primary: compare
its p-completion with the actual p-local stable map. Verify K(n)-invertibility. For every m>n construct the connective
Morava model k(m) from F3 and prove H^*k(m)=A//E(Q_m), using
the following mod-p computation and lower-generator Bocksteins.
Own `H^*BP⟨j⟩=A//E(Q₀,…,Q_j)` for j≥0 at both primes:
start with BP⟨0⟩=Hℤ_(p). For j≥1 use the actual cofiber
`Σ^(2p^j−2)BP⟨j⟩ --v_j→ BP⟨j⟩ → BP⟨j−1⟩`.
Prove v_j acts by zero on mod-p cohomology, from its BP-action
and zero mod-p Hurewicz image. The cohomology LES therefore gives
`0→Σ^(2p^j−1)H^*BP⟨j⟩→H^*BP⟨j−1⟩→H^*BP⟨j⟩→0`.
Identify the connecting primitive of degree2p^j−1 with Q_j.
Prove connectivity and finite type before the Poincaré-series count,
and use this sequence to prove the cyclic-module identification
inductively. Compare the regular-quotient models with these maps,
not just their vector-space dimensions. Change of
rings gives the mod-p Adams spectral sequence for k(m)∧R over
E(Q_m). Its cochain degrees lie in a strip
`t−s≥(2p^m−2)s−C`, with C determined by the finite cell range
of R, uniformly in m. Prove strong convergence and naturality of
the Hurewicz map from R. A high p-power of the candidate has
stem (2p^n−2)s, below that strip for every m>n; its image is
zero in k(m)_*R and hence K(m)_*R after inversion. The lower
heights already vanish on X. This proves other-height nilpotence
before transporting periodicity to other finite spectra.
Then prove Hopkins–Smith thick-subcategory classification: the full
thick subcategories of finite p-local spectra are C₀, the C_n of
K(n−1)-acyclic finite spectra for n≥1, and C_∞={0} (Ravenel,
*Nilpotence and Periodicity*, Theorem 3.4.3, p. 37, stated there for
p-local finite CW complexes). Prove their
strict order and type/support characterization. Use the Morava
nilpotence theorem on the finite evaluation/coevaluation fibre and
its iterated-smash cofiber filtration for the classification.
Prove the nilpotence and ideal-extension argument that transports a
self-map across finite cofiber/retract constructions in a thick
subcategory, yielding Hopkins–Smith periodicity for every type-n
finite spectrum, n≥1: a self-map inducing an isomorphism on K(n)_* and
zero on K(m)_* for m>n, of degree a multiple of 2p^n−2 (Ravenel,
*Nilpotence and Periodicity*, Theorem 1.5.4, p. 9).

Include Adams' v₁ maps on the mod-p Moore spectrum, of degree2p−2 for odd p and
degree8 at p=2, constructing their K-theory/Adams-operation detection
and α₁/e-invariant comparison rather than deducing their minimal
degrees from the general existence theorem.

Construct the compatible generalized Moore systems by successive
cofibers of these self-maps. Prove the BP-homology normalization
BP_*v=v_k^a on the preceding quotient and its unit/sign comparisons,
not merely invertibility on K(k). For the completion specialization, work in F4's actual derived
right-module category over strict MU_(p). After a further compatible
p-power construct the stronger identity
`MU_(p)∧v = multiplication by v_k^a` on the chosen ordered
MU-quotient. Centrality here comes from the commutative strict
MU_(p)-action; even degree removes the Koszul sign. Prove it as follows: the difference from the central scalar map is a ghost; F6.2's finite-MU-cell ghost bound
makes it nilpotent. A power of p annihilates the quotient's homotopy,
so the same ghost bound makes a further p-power annihilate its actual
identity map. Choose p^s with all relevant intermediate binomial
coefficients divisible by this power; the binomial expansion then
kills the ghost difference. Absorb this additional power and the
unit normalization (including a factor (p−1)p^N where needed)
into N(prefix), and prove independence of the chosen lift modulo
the preceding height ideal. An equality only on homotopy groups
does not itself supply the module-map identity. For each prefix
(p^(i₀),v₁^(i₁),…,v_(k−1)^(i_(k−1))) construct a positive integer
N(prefix) such that the next construction works whenever i_k is a
positive multiple of N(prefix). Construct cofinal choices and their
actual transition maps/homotopies. Before any use in F6.4, transport
the scalar-map identities to the whole BP-smash system, at every
prefix length h, including h=n+1. Use ε:MU_(p)→BP and
ι:BP→MU_(p), their homotopy-ring comparisons ε∘ι≃id,
and lifted generators ṽ_i with ε(ṽ_i)=v_i. At the map level write
`BP∧v=(ε∧id)∘(MU_(p)∧v)∘(ι∧id)` and use ε's
multiplicative homotopy to identify its scalar action with v_i^a,
not just its action on BP-homology. Tensor the fixed comparison
homotopies with the entire prefix/transition diagrams and rectify
the resulting compatible cofiber ladders. Construct, for the cofinal
system M_a of every such length, actual unit/transition compatible
equivalences
`BP∧M_a≃BP/(p^(a₀),…,v_(h−1)^(a_(h−1)))`,
where every right-side self-map is its specified scalar BP-action.
Prove compatibility under deleting a prefix, enlarging exponents,
cofiber boundary maps and duality. The MU and BP scalar identities
and these rectified systems precede both chromatic colimit models
and completion. This does not use an unconstructed coherent
BP-module category. Construct the finite homotopy-unital
multiplications and central-power/module diagrams needed for each
specified finite stage, and their pro-level compatibility after
passing to cofinal powers. Construct the n=1 tower directly from
p-power Moore spectra. Do not assert that every stage, or even a
cofinal family, carries a commutative associative or A∞ ring
structure. Coherent products on a derived limit require separately
supplied algebra models and comparison maps. This does not assert
existence of all small-exponent Smith–Toda complexes.

Construct telescopes T(n) of chosen v_n maps, with T(0)=S_(p)[1/p],
their independence in Bousfield class, the inequality
⟨K(n)⟩≤⟨T(n)⟩ and the resulting localization-unit comparisons.
Construct finite localization L_n^f away from the finite type-(n+1)
spectra, its smashing universal property, its class
⟨T(0)∨⋯∨T(n)⟩. Using the earlier Johnson–Wilson class identity,
prove `⟨E(n)⟩≤⟨T(0)∨⋯∨T(n)⟩` and construct L_n^f→L_n
with localization-unit/naturality comparisons. Construct it by localizing
G2's spectral model at the small set Σ^dF→0, d∈ℤ, for one
chosen finite type-(n+1) F; thick classification identifies this with
all such finite spectra. Prove the kernel is their localizing tensor
ideal by the localization cell filtration. Compactness of these
finite generators makes local spectra closed under coproducts and
all stable homotopy colimits. Consequently L_n^fS∧X is local
for every X, and the fiber of X→L_n^fS∧X belongs to that
ideal. This proves the smashing universal property. Prove its stated
class by the finite height cofiber/telescope tower: its top finite
term is annihilated by L_n^f, each T(i), i≤n, is finite-local,
and the successive telescope/cofiber class inequalities detect zero
after smashing. This construction and its derived mapping-space
localization property precede the following comparisons.
Before F6.4, prove the finite-source telescope comparison
`L_k^fM≃v⁻¹M` for each finite type-k M, k≥1, and chosen
v_k map v, with its actual unit. Its cofiber has type≥k+1.
For every finite type>k F, the map induced by v on D(F)∧M
has nilpotent action at every height, including ∞; finite self-map
nilpotence makes a power null. Compactness identifies maps out of F
into the telescope with their colimit, so that telescope is finite-local.
Its unit is a finite-local equivalence, proving the comparison.
Use p-inversion and rationalization for k=0. Construct the naturality
of these comparisons under the equal-power intertwining maps above.

Also prove generalized-Moore pro-recovery here, before any use of
L_n or smashing. For each length k≥1 choose the coherent cofinal
inverse tower M_a and its unit-compatible maps from the preceding
construction. For every finite spectrum Z of type≥k prove
`Z→{Z∧M_a}_a` is an isomorphism in Pro(Ho(Sp_(p))).
Construct this pro-category as the opposite of Ind of the opposite
homotopy category, with its lim-colim mapping formula, and compare
the actual coherent towers with their images. For each lower-generator
self-map on a prefix smashed with Z, its action is nilpotent at every
height: at its own height Z is acyclic, at other heights the map is
nilpotent, including ordinary mod-p homology. Finite self-map
nilpotence makes a high power null. In the resulting cofiber tower
the unit summand is constant Z and the shifted summand has eventually
zero transition maps. Induct on the prefixes to obtain the pro-isomorphism,
with naturality in finite Z and cofinal refinements. Treat k=1 directly
with p-power Moore spectra. No splitting of an entire coherent tower
or ring structure on its stages is required. Prove independence of
the chosen pro-class and retain the specified coherent spectrum-level
unit/transition maps for homotopy limits.

Define Γ_0^fS=S_(p), L_(-1)^f=0, and
`Γ_k^fS=fib(S_(p)→L_(k−1)^fS)` for k≥1.
Construct its counit and the natural equivalence
`hocolim_a D(M_a) ≃ Γ_k^fS`, using duals of the inverse
Moore unit/transition maps, with no self-duality convention imposed
on M_a. Each D(M_a) is finite type k and thus finite-acyclic.
For every finite type≥k Z, the pro-recovery comparison for D(Z),
finite duality and compactness show
`Z∧hocolim_a D(M_a)→Z` is an equivalence. Hence the cofiber
of the counit to S is L_(k−1)^f-local, while its source is
L_(k−1)^f-acyclic. The localization universal property identifies
this counit with Γ_k^fS→S. Construct this identification naturally
under cofinal changes and compare its BP-smash with the ordered
regular dual quotients:
`BP∧D(M_a)≃Σ^(−k−Σ_(i<k)a_i|v_i|)BP/(v_i^(a_i):i<k)`.
Here v₀=p and |v₀|=0; the transition maps are the actual duals
of quotient maps, not forward quotient-unit maps. Use the earlier
system-level scalar transport and G2's finite-duality/cofiber API
for this comparison and all boundary signs.

Keep these functors and classes distinct from E(n)-localization;
no telescope comparison is inferred from periodicity or thick
classification. The Thom spectra X(r) above and these telescopes have
separate definitions and notation.

*Needs:* F2's Steenrod algebras and Adams towers; F3's BP⟨n⟩, E(n) and
K(n); F5's invariant primes and Landweber exactness; F6.1–F6.2;
RepresentationTheory SchurWeyl Layers 0, 2 and 5; AlgebraicTopology Stage
8.8's bar/CW model.

### F6.4. Johnson–Wilson classes, smashing and fracture

For each prime p construct the p-typical polynomial coefficient isomorphism, using F3's
single Cartier-idempotent splitting and F6.3's p-typical ring comparison
i:BP→MU_(p). It is the graded BP_*-algebra isomorphism

`BP_*[z_n : n≥1, n≠p^j−1 for every j≥1] ≃ MU_(p)*`,

whose BP_* structure is i_* and whose z_n are the chosen MU polynomial
generators in the omitted degrees. Use F2/F3's polynomial coefficient
presentations and p_*i_*=id: on indecomposables of degree 2(p^j−1),
the inclusion/projection scalars a_j,b_j satisfy a_j b_j=1. Thus
`i_*(v_j)=a_j x_(p^j−1)+f_j(x_1,…,x_(p^j−2))` with a_j a unit.
Construct the inverse by the degreewise triangular recursion, including
its grading, coefficient embedding and finite-support monomial basis.
This generic coefficient construction precedes the localization applications
below; those applications and F6.6 use this same i_* and basis.

Use F6.3's already constructed Johnson–Wilson and P(n)/B(n)
class comparisons, followed by its actual cofinal MU/BP Moore systems
and their map-level quotient/transition equivalences. The class comparisons
precede finite-height nilpotence and periodicity; the Moore systems are
constructed after periodicity and before this item.
Prove K(i)∧K(j)≃0 for distinct finite heights, including rational
height0, on the actual spectra. No identity of a finite localization
with L_n is inferred.

Set L_n=L_(E(n)) and C_nX=fib(X→L_nX) for the acyclic fiber,
distinct from F6.3's thick subcategories C_n. Prove the Hopkins–Ravenel smashing theorem as the
natural unit-compatible equivalence `L_n X≃L_nS∧X` for every
p-local spectrum X and finite n≥0 (Ravenel, Nilpotence and Periodicity,
Theorem 7.5.6, p. 87). Construct its proof through
[Ravenel, Chapter8 §§1–5](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mybooks/nilpb2020.pdf),
with the following intermediate APIs before invoking smashing.

1. Construct the spectral chromatic resolution using F6.3's finite
   acyclizations Γ_k^fS and their Moore-dual colimit models. First
   construct the natural triangles
   `Γ_(k+1)^fS→Γ_k^fS→L_k^fΓ_k^fS→ΣΓ_(k+1)^fS`, k≥0.
   They are the fiber triangles of the nested finite localizations:
   prove both L_(k−1)^f L_k^f≃L_(k−1)^f and
   L_k^f L_(k−1)^f≃L_(k−1)^f, compatibly with their units,
   by the universal properties. Exactness and finite-local smashing
   identify L_k^fΓ_k^fS with fib(L_k^fS→L_(k−1)^fS);
   use this identification in the finite-limit/cofiber comparison. These
   constructions use finite localization's earlier smashing theorem,
   not the Hopkins–Ravenel theorem being proved here.

   Construct the unit-compatible equivalence
   `BP∧L_k^fΓ_k^fS≃v_k⁻¹BP∧Γ_k^fS`.
   For each finite D(M_a), the earlier finite-telescope theorem and
   the scalar-map identity, transported through finite duality, give
   `BP∧L_k^fD(M_a)≃BP∧v_k⁻¹D(M_a)≃v_k⁻¹BP∧D(M_a)`.
   The target is E(k)-local by the pairing certificate and hence
   L_k^f-local by the class inequality. Obtain this comparison as
   the extension of its specified unit. Prove the space of such
   extensions is contractible by the derived mapping-space localization
   property, and use it to assemble the coherent comparison on the
   entire tower. This proves naturality and all transition coherences,
   rather than choosing unrelated telescope equivalences. Pass to the
   Moore-dual homotopy colimit; both finite
   localization and smash preserve it. For k=0 use p-inversion.

   Set spectral N^k=Σ^k(BP∧Γ_k^fS) and
   M^k=Σ^k(BP∧L_k^fΓ_k^fS). Construct their homotopy BP-actions,
   comodule and connecting-map comparisons and identify M^k≃v_k⁻¹N^k.
   The preceding triangles give N^k→M^k→N^(k+1).
   Compute π_* from the actual regular Moore dual quotients and
   their transitions. Prove these groups are even, that localization
   N^k_*→v_k⁻¹N^k_* is injective, and that the cofiber groups
   are its cokernel. This gives the source chromatic BP-comodule
   resolution `0→N^k_*→M^k_*→N^(k+1)_*→0`, N⁰_*=BP_*.
   Prove the comodule structures and degree shifts agree with its
   algebraic construction, not only abstract isomorphisms of groups.

   Identify `L_n^fBP≃BP∧L_n^fS≃cofib(BP∧Γ_(n+1)^fS→BP)`.
   Construct its finite filtration, with layers BP∧L_k^fΓ_k^fS
   for 0≤k≤n, from these exact triangles and their octahedral
   comparisons. Each layer is E(n)-local: the displayed comparison
   presents it as v_k⁻¹BP∧Γ_k^fS, which is E(k)-local by its
   pairing certificate, hence E(n)-local. Its Bousfield class lies
   below E(k), hence below E(n). Finite extensions give both locality
   and the class inequality for L_n^fBP. The fiber is the stated
   Moore-dual colimit of BP∧D(M_a), all E(n)-acyclic. Thus
   BP→L_n^fBP is an E(n)-equivalence, giving L_n^fBP≃L_nBP
   and C_nBP≃BP∧Γ_(n+1)^fS. Its source-normalized cofiber is
   `Σ^(−n−1)N^(n+1)→BP→L_nBP`.
   Finally E(n)∧BP has class E(n), by its unit/action retraction
   and BP∧K(k)≠0 for k≤n. Apply E(n) to this unit to deduce
   `⟨L_nBP⟩=⟨v_n⁻¹BP⟩=⟨E(n)⟩`.
   Construct the genuine unital homotopy product on L_nBP by
   locality: BP∧BP→L_nBP∧L_nBP is an E(n)-equivalence,
   so the map BP∧BP→BP→L_nBP extends uniquely in the stable
   homotopy category. Prove unit/associativity by the same uniqueness
   on the corresponding two-/three-fold smashed comparison maps.

   Prove the strong localization theorem
   `L_n(BP∧Y)≃BP∧L_nY≃L_nBP∧Y`.
   First finite duality gives D(M_a)∧L_nY≃L_n(D(M_a)∧Y)=0,
   since each D(M_a) has type≥n+1. Thus the Moore-dual colimit
   gives BP∧Γ_(n+1)^fS∧L_nY=0, and the cofiber gives
   BP∧L_nY≃L_nBP∧L_nY. The E(n)-equivalence
   Y→L_nY and the proved class of L_nBP identify the latter
   with L_nBP∧Y. Finally, if A is E(n)-acyclic then
   L_nBP∧A=0; the unit/action factorization of every map
   A→L_nBP∧Y through L_nBP∧A proves locality in every
   shift. This identifies the composite with L_n(BP∧Y), without
   the global smashing theorem for L_n. Construct the MU_(p)
   counterpart by the actual p-typical wedge comparison
   `MU_(p)≃⋁_b Σ^|b|BP`. Construct its BP_* monomial basis from
   the polynomial coefficient/idempotent comparison, realize the maps
   by the supplied homotopy BP-action and prove true π_* isomorphism.
   After localizing use the unit/action on the wedge of L_nBP-modules
   to prove its locality; do not assume arbitrary wedges of local
   spectra are local. Smash this comparison with Y and L_nY to
   obtain the same unit-compatible strong-localization equivalences
   for MU_(p), before global smashing.
   Also prove
   `BP∧L_n^fY≃BP∧L_nY` by the type-(n+1) argument, and its
   MU_(p) counterpart using the p-typical homotopy-module comparison.
   These do not presume that L_n itself is smashing. For a supplied
   homotopy MU_(p)-module N, apply the unit/action retraction
   N→MU_(p)∧N→N and the strong localization theorem to deduce
   `L_n^fN≃L_nN` as a retract of the corresponding comparison on
   MU_(p)∧N, with units/naturality. Together with F6.3’s earlier
   finite-source telescope comparison these supply the completion
   specialization without equating L_n^f and L_n globally.
2. For a supplied unital homotopy ring E define E-nilpotent spectra
   as the thick subcategory generated by E∧Z for arbitrary spectra Z,
   using finite cofiber extensions, shifts and retracts. Prove that this
   equals the thick closure of underlying unital homotopy E-modules
   by their unit/action retractions; no coherent BP-module category
   is implicit. Define E-prenilpotence through an E-equivalence to an
   E-nilpotent spectrum. Construct the E-Adams tower by iterating
   the actual fiber of S→E, with its exact couples and supplied-ring
   comparisons to F4's MU/BP resolutions.
   Prove the countable-π_*E prenilpotence criteria: a uniform horizontal
   vanishing line at a fixed page of the E-Adams spectral sequences
   for Y∧Z, for every finite Z, implies the required prenilpotence.
   More generally construct the criterion with an E_∞ horizontal
   bound and a page function φ(s) with E_r^(s,*)=E_∞^(s,*) for
   r>φ(s). State all bounds independently of Z and prove the
   passage to arbitrary spectra. For E=L_nBP reduce
   smashing to a nonzero finite p-local torsion-free E-prenilpotent Y,
   and prove the sphere-prenilpotence/localized-sphere criteria used in
   this reduction.
   **Checks.**
   - for E=S every spectrum X is S-nilpotent (take Z=X), and for E=Hℚ the
     Hℚ-nilpotent spectra are exactly the rational spectra, since a
     rational X satisfies X≃Hℚ∧X and rational spectra are closed under
     cofibers, shifts and retracts; so S/p is not Hℚ-nilpotent.
   - S is not HF_p-nilpotent: an E-nilpotent spectrum is E-local, and the
     HF_p-localization of S is the p-completion S_p^ with π₀=ℤ_p≠ℤ; its
     HF_p-Adams tower therefore does not terminate.
   - the E-nilpotent spectra form a tensor ideal, E∧Z∧W being again of the
     generating form; a definition restricting Z to finite spectra would
     be smaller: for E=Hℚ it would contain only the finite rational
     spectra and exclude the countable wedge of copies of Hℚ.
3. Construct the algebraic Morava stabilizer input at each 1≤m≤n,
   independently of Morava E∞ realization. Use F3's height-m Honda
   law over 𝔽_(p^m), F5's formal-group automorphism/deformation
   carriers and Witt vectors to build its profinite automorphism group
   full stabilizer `𝕊_m=O_D^×`, its strict subgroup
   `S_m=1+S O_D`, and their exact sequence with quotient 𝔽_(p^m)^×.
   Construct the division algebra/maximal order with S^m=p and
   `Sa=φ(a)S`, where φ is the native Witt-vector Frobenius;
   `φ(a)=a^p` is used only for Teichmüller representatives.
   Include the semidirect Galois action when extending the coefficient
   field, and compare full, strict and extended change-of-rings
   conventions. The prime-to-p scalar quotient is handled by exact
   invariants. For the finite-field Galois quotient, prove exact
   semilinear descent using the normal-basis theorem, including when
   p divides m; do not use averaging by the Galois-group order. Construct
   the scalar-extended Morava theory FK(m), its finite-dimensional
   graded coefficient representations and the continuous
   stabilizer/comodule change-of-rings isomorphism for the Ext groups
   v_m⁻¹BP_*Y/I_m. Consume the native continuous-cohomology carrier
   and the closed-subgroup/cohomological-dimension tools of
   [ProfiniteCohomology](../ProfiniteCohomology/README.md); own the
   stabilizer-specific finiteness and vanishing proofs. Construct a
   sufficiently deep torsion-free open normal congruence subgroup U,
   its uniform p-adic analytic structure, ordered coordinates and
   complete group algebra filtration; prove its associated graded/
   Koszul-May resolution has cohomological dimension d=m², including
   a deeper congruence level at p=2 (Ravenel, Theorem 6.2.10(ii), p. 204,
   is the case (p−1)∤m, in which S_m itself is torsion-free). Export
   the Morava stabilizer cohomology vanishing: for a finite-dimensional
   continuous coefficient representation V free on every order-p
   subgroup, H_c^s(S_m;V)=0 for s>d. Construct the following
   projectivity and complete-resolution proof, with the continuous
   compact/discrete coefficient comparisons.

   Prove every finite abelian subgroup of D^× is cyclic: its commuting
   elements generate a finite-dimensional commutative subfield of D,
   and a field's finite root-of-unity subgroup is cyclic. Thus finite
   elementary abelian p-subgroups have rank≤1. Construct the finite-
   group Chouinard criterion, so V's order-p freeness implies
   projectivity on restriction to every finite subgroup. Construct
   Symonds's tensor-induced signed weak permutation resolution from
   a length-d projective U-resolution. Include its completed tensor
   products, coset permutations and Koszul signs; its length N is
   finite (at most [S_m:U]d), not asserted to equal d. Its terms
   are summands of signed permutation modules on profinite sets with
   finite stabilizers. Prove the stabilizer-Ext vanishing criterion by
   continuous Shapiro, finite quotients and the compactness argument,
   and deduce that tensoring with V gives a length-N projective
   resolution. No finiteness of conjugacy classes is needed here.

   Construct a Brown–Farrell complete resolution with its ordinary
   comparison in degrees s>d, separately from the length-N bound.
   The d-th syzygy of the trivial module is projective over the
   completed group algebra of U. In the exact category of modules
   projective over that algebra, with U-split exact sequences, prove
   finite-index induction=coinduction and the Frobenius property:
   S_m-projectives give enough projective-injectives. No averaging
   by [S_m:U] is used. Extend this syzygy in both directions to a
   complete S_m-projective resolution agreeing with the ordinary
   resolution in its high-degree tail; prove Hom into every projective
   is acyclic. Dimension-shifting along V's finite projective resolution
   makes its complete cohomology zero. The tail comparison then gives
   ordinary continuous H_c^s(S_m;V)=0 for s>d, uniformly in V.
   Construct its comparison with native continuous cochains and with
   the finite module regarded in either compact or discrete category.
   These specialized constructions are owned here; they are not
   assigned to ProfiniteCohomology.
   Handle the full/extended groups by their indicated quotient actions
   and treat height0 rationally. ProfiniteCohomology supplies the
   carrier and generic resolutions, not these analytic-group theorems.
4. Apply F6.3's Smith idempotents to tensor/smash powers of a finite
   torsion-free W: nontrivial actions
   of the relevant order-p subgroups on FK(m)_*W produce a nonzero
   finite torsion-free idempotent summand Y with free subgroup
   actions, simultaneously for the finite set of heights m≤n.
   For a fixed m, pass first to the (p−1)-st tensor power.
   For H≃C_p write 𝔽_(p^m)[H]=𝔽_(p^m)[u]/(u^p).
   From a nontrivial action construct α,β with uα=β, uβ=0;
   the Vandermonde comparison for (α+iβ)^(⊗(p−1)), i∈𝔽_p,
   gives a nonzero free submodule. Prove the finite group algebra is
   self-injective so this submodule splits. Apply the same e_V to obtain
   freeness for every order-p H at this height. Specify the
   degreewise/finite-periodic-regrading model of FK(m)_*W used
   as a finite-dimensional 𝔽_(p^m)-representation, and compare
   it with the actual graded homology and scalar action.
   Supply W by sufficiently large reduced Σ∞CP^j. Prove the
   stabilizer coaction on its b_i basis and its restriction to each
   order-p subgroup: for m divisible by p−1 the first nontrivial
   coefficient has index m/(p−1), and large enough j makes that
   action nontrivial. Give a common j for all m≤n and include p=2.
   Prove the scalar-extended Künneth map is a stabilizer-comodule
   isomorphism on these finite torsion-free CP smash summands,
   including its permutation/Koszul comparison at p=2; do not assume
   that a general characteristic-two K(m) ring is homotopy commutative.
   Construct the simultaneous-height spectrum from the finite family
   of fixed-height summands by their smash product. Prove each summand
   has nonzero torsion-free homology and hence type0, so its FK(i)
   homology is nonzero at every finite height. Prove the diagonal
   tensor of a free 𝔽_(p^m)[H]-module with any representation is
   free, using the regular-module tensor comparison; then prove the
   product is nonzero, torsion-free and free for every required H.
5. Apply Landweber filtration and the stabilizer change of rings to
   the constructed Y, obtain the finite uniform Ext/Adams vanishing
   bound, and prove Y is L_nBP-prenilpotent. Apply the preceding
   prenilpotence criteria to construct the natural smashing
   equivalence. The algebraic stabilizer/FK(m) lane precedes this
   theorem; EllipticCohomology E2's E∞ Morava realization, completed
   cooperations and θ-algebras are not suppliers for it.

Deduce ⟨L_nS⟩=⟨E(n)⟩ and, for every n≥1, the natural equivalence
`L_(K(n)) L_(n−1) X≃0` for arbitrary p-local X. Prove this by smashing
with K(n) and using the class identity and smashing theorem. The
reverse composite L_(n−1)L_(K(n)) is a separate functor.

Construct the chromatic fracture square, with the actual localization
units as edges and their commuting homotopy:

```
L_n X ─────────────→ L_(K(n)) X
  │                         │
  ↓                         ↓
L_(n−1) X ────────→ L_(n−1)L_(K(n)) X.
```

For every p-local spectrum X and n≥1 prove this square homotopy
cartesian. First prove the homotopy pullback of the lower and right
corners is E(n)-local. Then prove X→that pullback is an E(n)-equivalence
by applying L_(n−1) and L_(K(n)), using the correctly ordered vanishing
above and the class identity. Include n=1 with rational L₀; retain the
lower-right corner. Prove functoriality in X, comparisons with the
chromatic tower L_n→L_(n−1), the fibre/Mayer–Vietoris sequences on
true π_*, and product/module comparisons with the actual derived
localized structures.

*Needs:* F6.3's class comparisons, Moore systems and type examples; F5's
exactness and Lubin–Tate deformations for the Morava stabilizer; F3;
ProfiniteCohomology; RepresentationTheory SchurWeyl Layers 0, 2 and 5.

### F6.5. Local group actions and completion comparisons

For Borel finite-group actions on G's spectra, construct the projective
model category of BG-diagrams and its derived/coherent action comparison,
homotopy orbits, homotopy fixed points, transfer/norm and Tate cofiber, with
restriction, induction and lax monoidal/module naturality. Prove the
K(n)-local Tate vanishing theorem: for n≥1, finite G and an object
of Fun(BG,L_(K(n))Sp), its underlying ordinary Tate spectrum E^(tG)
is K(n)-acyclic (Clausen–Mathew, Theorem 1.1, after Greenlees–Sadofsky
and Hovey–Sadofsky; Kuhn, Theorem 1.5, proves the stronger T(n)-local
form, which this layer does not state). The localized norm is an equivalence; ordinary
integral Tate vanishing is not asserted.
Construct the proof in this ordinary Borel norm-cofiber model, using
the following prerequisites and finite-height descent.

1. Construct the coherent Borel Tate product by the induced-object
   tensor-ideal construction. Use G2's simplicial model of spectra and
   projective BG-diagrams.
   Consume GeneralizedCohomology G2.11's enriched, quasicategorical and
   monoidal foundations in their stated shapes and universes: its Bergner
   model with the rigidification/coherent-nerve Quillen equivalence and
   coherent mapping-space theorem, enriched projective/injective diagram
   models with their localization, Grothendieck and homotopy-limit
   theorems, unmarked and marked straightening with the coCartesian
   instance and enriched Quillen-equivalence criterion, the Joyal model,
   Cat∞ colimits, descent and Kan extensions, the coherent model-diagram
   theorem with its stable enhancements Sp∞ and Fun(BG,Sp∞) and their
   monoidal enhancements, stable quotients, space-valued Ind, coCartesian
   Day convolution, relative adjunctions and the universal exact
   lax-monoidal approximation, the parameterized lax-refinement categories
   A and B with their contractible section spaces, the two-colored
   associative algebra/module operad and its rectification against G2's
   strict rings and modules. The following bordism-specific applications
   are owned here.

   Apply G2.11's stable quotient, Ind and universal-approximation
   constructions to C=Sp^(BG) and the stable tensor ideal D generated
   by all induced objects Ind_1^G X, using finite cones and shifts.
   Prove the projection formula identifies the tensor of an induced
   object with any action as induced, and that the norm on induced
   objects is the identity under orbit/fixed-point identifications.
   Thus Tate kills D. Prove D_/X is filtered and
   `colim_(Y∈D_/X)Y≃X` by induced-sphere generators and their
   kernel-killing cofibers. The resulting formula
   `colim_(Y∈D_/X) cofib(Y→X)^(hG)≃X^(tG)`
   follows from the norm cofiber triangles and the vanishing of the
   colimit of the orbit terms. Apply G2.11's universal exact
   lax-monoidal approximation to homotopy fixed points, which are lax symmetric
   monoidal as a right adjoint. This constructs the lax symmetric
   monoidal Tate functor and the compatible `can:hG→tG`.
   D is not closed under arbitrary filtered colimits.
   Handle size by choosing an uncountable regular κ for which fixed
   points and Tate are κ-accessible, the relevant κ-compact objects
   are tensor-closed, and BG-diagrams agree with coherent actions on
   those objects. Prove these bounds and pass from that small model
   by Ind_κ; prove independence of κ and the chosen small model.
   G2.11's coherent quotient/Ind constructions precede their use here.

   Construct the unital Tate action for every coherent equivariant
   left module over a coherent equivariant associative ring by applying
   the lax functor to G2.11's two-colored associative algebra/module
   operad and its algebras. Also construct its homotopy-ring/
   homotopy-action version: multiplication and module identities are
   transported through the natural lax product without asserting an
   associative strictification of K(n). Prove exactness and
   `E^(tG)∧F≃(E∧F)^(tG)` for finite spectra F by dualizability.
   Construct restriction, transfer, their double-coset and Frobenius
   reciprocity identities on fixed points and Tate, by the finite
   indexed sum/product adjunctions and the same norm comparisons.
   In particular transfer after restriction acts by tr(1). Construct
   normal-extension norm transitivity and residual quotient actions;
   for a normal subgroup H◁G, straighten BG→B(G/H) to the
   functor assigning its Kan homotopy fiber, equivalent to BH, with
   conjugation transport and every higher simplex. Construct the
   pullback functor S↦Sp^S, with its pointwise monoidal
   enhancement. On equivalences of Kan spaces use inverse pullback
   to regard it covariantly; construct this inversion adapter through
   the Kan groupoid/core and prove all higher inverse/composition
   comparisons. Compose that covariant functor with the parameterized
   fiber functor. Fixed points and the induced-ideal quotient define a
   diagram in G2.11's category A over B(G/H). Apply its right-fibration
   refinement theorem, using objectwise limits in its category B, to lift it
   coherently to the lax fixed-to-Tate transformation. Prove the
   forgetful map is an equivalence and respects multiplication and
   the normal-extension norm. Take the limit of the lifted diagram
   in G2.11's B. Prove BG≃colim_(s∈B(G/H))F_s for its Kan fiber family,
   by the groupoid straightening/Grothendieck comparison. Then
   `lim_s Sp^(F_s)≃Sp^(BG)` because Fun(−,Sp∞) sends this
   colimit to a limit, and the constant target has limit
   `lim_(B(G/H))Sp∞≃Fun(B(G/H),Sp∞)`. Identify the resulting
   limit functors with `hH,tH:Sp^(BG)→Sp^(B(G/H))` and the
   fixed-to-Tate transformation. This explicitly constructs its total
   parameter space; objectwise contractibility alone does not define it.
   This supplies equivariant, multiplicative comparisons, not just
   choices separately at the objects of B(G/H). Prove the unit criterion in
   R⁰(BG) by finite-skeleton nilpotence and the Milnor sequence,
   including the square-zero phantom-kernel comparison. For the
   Sylow restriction/transfer composite its basepoint value is the
   prime-to-p index, hence a unit. These constructions use the Borel
   model for every finite G, not only the representation-sphere model
   used for C_p in the next item.
2. For the faithful complex character χ of C_p use the free spheres
   S(kχ) as a model of EC_p. Construct their finite-stage duality,
   Thom and transfer diagrams and identify the ordinary norm cofiber
   with the Euler-inversion homotopy colimit of the χ-Thom twists
   of E^(hC_p). After trivializing these twists by an orientation,
   identify the structure maps with multiplication by x=e_χ.
   Compute K(n)^*(BC_p)=K(n)^*[[x]]/([p](x)) using the circle
   bundle over CP∞, its Gysin sequence and the actual skeletal/Milnor
   comparison. Here [p](x)=v_n x^(p^n); its unit coefficient makes
   x nilpotent, so Euler inversion gives K(n)^(tC_p)≃0.
   Extend this to Borel C_p-actions with an equivariant unital
   homotopy K(n)-action by Tate-module naturality. For H normal in G,
   construct the G/H-equivariant unital K(n)-action on K(n)^(hH)
   (K(n) has trivial original action) and compare iterated fixed
   points and the normal-extension norm. Use these actions and
   norm transitivity for p-groups and the Sylow unit comparison for
   arbitrary finite groups to prove K(n)^(tG)≃0. Prime-to-p groups
   also have the direct averaging norm inverse. This input concerns
   K(n)-modules; it does not presume the theorem for all K(n)-local
   spectra.
3. Use F6.3's stable natural B(n)-homology comparison.

   Realize this particular transformation as an actual spectrum map.
   Let C be the countable polynomial-monomial basis and set
   S_n=⋁_(c∈C)Σ^|c|K(n). Construct countable-cell models for K(n)
   and S_n from their countable homotopy groups: attach countably many
   cells in all integer degrees to realize generators and kill kernels.
   Compactness of the attaching spheres gives finite closures and a
   sequential finite-subspectrum exhaustion S_n≃hocolim_iS_i.
   This construction includes the unbounded negative degrees of K(n).
   Extend Λ and its inverse to stable finite spectra with all suspension
   comparisons. Apply finite duality to the inverse comparison
   `S_n*(-)→B(n)*(-)` to obtain compatible maps S_i→B(n). Use the surjection
   `[S_n,B(n)]→lim_i[S_i,B(n)]`
   in the mapping-telescope Milnor sequence to lift them. Its lim¹
   kernel permits nonunique phantom choices. Compactness verifies
   the prescribed transformation on every finite source, and sphere
   tests prove the resulting S_n→B(n) is an equivalence.
   Transport the unital homotopy K(n)-action along this equivalence.
   Keep the direct-sum monomial basis throughout; no product/wedge
   exchange or unrestricted finite-source Yoneda assertion is used.
4. From F6.3's large-exponent Moore system choose a finite type-n M
   with BP_*M=BP_*/(p^a₀,v₁^a₁,…,v_(n−1)^a_(n−1)).
   Consume F6.3's system-level MU/BP scalar-map transport and its
   rectified regular-power cofiber ladders. Localizing that finite
   ladder at the specified v_n action retains its finite filtration,
   with subquotients shifts of B(n). Prove
   `L_nBP∧M≃v_n⁻¹BP∧M` through the localization unit.
   Use F6.3's right-flat E(n)_*BP comparison to compute the actual
   E(n)-smash cofiber quotients by the right-unit images of p^a₀,
   …,v_(n−1)^a_(n−1). Right-unit triangularity makes the left
   ideal (p,…,v_(n−1)) nilpotent in that quotient. Thus η_R(v_n)
   is a unit plus a nilpotent term and acts invertibly. Spectral
   Whitehead proves the required E(n)-equivalence on maps, not
   merely a coefficient substitution. The target is local because
   v_n⁻¹BP has
   class E(n) and its pairing certificate. Construct also the finite-
   duality comparison `v_n⁻¹BP∧M≃F(DM,v_n⁻¹BP)`.
   Include the right/left
   v_n cooperation comparison modulo lower-generator powers.
   The filtration is still used for K(n)-nilpotence; locality alone
   does not provide that filtration.

   Use F6.4's finite type0 L_nBP-prenilpotent Y. Its localized
   model L_nY is built in finitely many stages from L_nBP-modules.
   For each such module N, use the unit/action retraction
   N∧M→L_nBP∧N∧M→N∧M and smash the preceding finite
   filtration with N. Thus L_n(Y∧M) is K(n)-nilpotent.
   This argument requires no multiplication on M.
   The Tate functor kills these finite constructions, using item2
   and the unital module action, even when the generating modules
   are infinite spectra. Thus for F=Y∧M, a finite type-n spectrum,
   `(L_nF)^(tG)≃0`. Thick classification and finite dualizability
   give the same vanishing for every finite spectrum of type≥n.
5. Put R_G=(L_nS)^(tG), with its unital ring and L_nS-module
   structure. Use the finite type tower F₀=S_(p),
   F_(i+1)=cofib(v_i), and F6.3's telescopes T(i), with v₀=p
   and the rational comparison T(0)=S_(p)[1/p]≃Hℚ. Its top term
   R_G∧F_n vanishes by item4 and finite-smash/Tate comparison.
   The remaining Bousfield terms R_G∧T(i), i<n, lie below K(i):
   use ⟨L_nS⟩=⟨E(n)⟩ and
   `⟨E(n)∧T(i)⟩=⟨K(i)⟩`, proved by field Künneth and the
   self-map height tests. Deduce ⟨R_G⟩≤⟨E(n−1)⟩ and its
   E(n−1)-locality by the unital ring action. No commutation of
   Tate with infinite telescopes is needed here.

   Finally any K(n)-local Borel object E is L_n-local and has the
   equivariant action of the trivial-action idempotent ring L_nS.
   Its ordinary Tate spectrum is a unital R_G-module. Since
   K(n)∧R_G≃0, the unit/action retraction proves
   K(n)∧E^(tG)≃0 for every such action, yielding the required
   localized norm equivalence. This step does not move localization
   through homotopy fixed points. Finite versus telescopic
   localization retains the distinctions proved in F6.3–4.
EllipticCohomology E2 consumes this finite-action API for its continuous towers.

For fixed p and n≥1 use F6.3’s cofinal generalized-Moore tower M_i
with its coherent quotient/unit maps and its already proved finite
pro-recovery and independence comparisons. Use finite duality and the
localization
universal property, as in Hovey–Strickland Proposition7.10(e), to
prove the model-level comparison
`L_(K(n))X≃holim_i(L_nX∧M_i)`
for every p-local spectrum X. Construct the map from X and prove the
homotopy limit is K(n)-local and that the map is a K(n)-equivalence,
using finite duality, the exponent bounds and fracture; do not replace
a coefficient completion by this object-level theorem. Specialize in
F4's actual right-module category over the strict MU_(p), for a
supplied even MU_(p)-module E and the ordered lifted height generators.
Construct MU_(p)∧M_i≃MU_(p)/J(i) and the actual module-map
multiplication identity for the good self-maps, compatible with the
chosen tower. Use F6.4's MU_(p)∧L_n^fY≃MU_(p)∧L_nY to
identify L_n(E∧M_i) with v_n⁻¹(E/J(i)), with comparison maps
and units; finite M_i commute with L_n. Then identify the limit with
`holim_i v_n⁻¹(E/J(i))` on this same index category. A homotopy
BP action may be compared separately through the stated p-typical
map; no A∞ BP-module category is presumed by this assertion.
Products require separately supplied coherent MU-algebra/derived
quotient models and multiplicative comparison maps, not ring
structures on every generalized Moore spectrum. Identify
π_* with ordinary coefficient completion only under explicit regularity
and Milnor/lim¹-vanishing hypotheses; retain the derived limit otherwise.
For a fixed prime p and a Landweber-exact
p-local coefficient module M with M/I_(n+1)=0 prove the represented theory is E(n)-local,
and construct its p-completion Hasse square under the stated finiteness
and completion hypotheses. EllipticCohomology E2 consumes it for the height≤2
elliptic instance. Include the K(1)/K(2) comparisons and the arithmetic square for
all spectra using derived p-completion, with vertices X, ∏_p X_p^∧,
X_ℚ and (∏_p X_p^∧)_ℚ, proving its homotopy-cartesian comparison
and retaining rationalization outside the product until a separate
commutation theorem is proved. These are the inputs consumed by
EllipticCohomology, and convergence conditions for assembling them.
Morava E∞ realizations, completed stabilizer cooperations and θ-algebra
obstruction theory are EllipticCohomology E2 targets; this layer supplies their
local categories and fracture functors.

*Needs:* GeneralizedCohomology G2's simplicial spectra and projective
BG-diagrams and G2.11's foundations; F6.3's homology comparison and Moore
systems; F6.4's prenilpotent seed and finite height tower.

**Checks.**
- KU_p, p-complete complex K-theory, is K(1)-local; give it the trivial
  C_p-action. Its homotopy fixed points have π₀=KU_p^0(BC_p)=
  ℤ_p[[x]]/((1+x)^p−1), and item 2's Euler inversion gives
  π₀(KU_p^(tC_p))=ℤ_p[[x]]/((1+x)^p−1)[x⁻¹]=ℤ_p[ζ_p][(ζ_p−1)⁻¹]=ℚ_p(ζ_p),
  because (1+x)^p−1=x·Φ_p(1+x) with Φ_p(1+x) Eisenstein in x. This is
  nonzero (ℚ₂ at p=2) and rational, so K(1)∧KU_p^(tC_p)≃0 although
  KU_p^(tC_p) is not contractible: the theorem asserts that E^(tG) is
  K(n)-acyclic, and a reading as E^(tG)≃0 is false.
- K(n) with the trivial C_p-action: [p](x)=v_n x^(p^n)·(unit) in
  K(n)^*[[x]], so x is nilpotent in K(n)^*(BC_p)=K(n)^*[[x]]/([p](x)) and
  K(n)^(tC_p)≃0 (item 2), whereas for KU_p the p-series (1+x)^p−1 has
  linear coefficient p, which is not nilpotent, and inverting x leaves the
  nonzero field above; so vanishing for K(n)-modules does not give
  vanishing for every K(n)-local spectrum.
- n=0: for a rational spectrum E with an action of a finite group G, the
  composite E^(hG)→E→E_(hG) inverts the norm up to multiplication by |G|
  (Clausen–Mathew, §1, after Theorem 1.1), so E^(tG)≃0 itself, not only
  its localization.

### F6.6. Torus Euler cancellation on finite MU pieces

Use G's single MU spectrum and complex orientation, F1–F3's formal group and
p-typicalization, F5's finitely presented comodule filtration, and G5.7's
continuous-torus action, coherent Thom family and mapping-tower comparisons.
For T=(S¹)^ℓ let C,D be compact closed stably-complex T-fixed manifolds with
their specified finite CW and compact-oriented duality models, with D
equidimensional of real dimension d_D. Treat different-dimensional connected
components of D by the finite-sum comparison, with their individual shifts.
Obtain the finite CW models of C and D from AlgebraicTopology Stage 8.7
(compact smooth manifolds, with or without boundary, have finite CW type).
Transport the bundle,
Euler and duality diagrams along the actual comparison homotopy equivalences.
Write
P_C=MU∧Σ∞C₊ and P_D=MU∧Σ∞D₊, as constant objects of
A_MU(BT)=Fun(Sing BT,Mod_MU). Treat specified finite-free presentations
P_C≃⊕_jΣ^(d_j)MU and P_D≃⊕_kΣ^(e_k)MU, as well as the general
finite-cell P_C,P_D without such presentations. Compactness supplies neither
a chosen finite CW model nor a finite-free MU basis; construct the former
through the cited manifold/CW comparison and carry the latter as actual data
when using the finite-free interface.

For a T-equivariant complex rank-r bundle ν→C with no zero character weights,
consume G5.7's actual Thom-cocone Euler map eν:P_C→Σ^(2r)P_C. Construct
the torus finite-cell mapping Euler comparison: compact MU-oriented duality on D
and the constant-family mapping comparison identify

`π_t Map_BT(Σ^{a+2r}P_C,Σ^bP_D)`
`  ≃ MU^{d_D+b−a−2r−t}(BT×C×D)`

for every a,b,t∈Z. Prove the underlying equivalence of mapping spectra,
composition, restrictions and finite-model comparisons. Precomposition with
Σ^a eν corresponds to multiplication by the Euler class pulled back from
BT×C, with degree +2r. Prove that this Euler precomposition is injective
on these groups in every degree. Construct the finite-sum variants and the
actual finite-duality transpose: for M=Σ^(−b)D_MU(P_D), identify the above
precomposition map with postcomposition

`Map_BT(M,Σ^(−a−2r)D_MU(P_C)) → Map_BT(M,Σ^(−a)D_MU(P_C))`

by D_MU(Σ^a eν). Construct its identification with Σ^(−a)D_MU(eν)
through evaluation/coevaluation and the ordered suspension-sphere interchange;
include the Koszul interchange factor (−1)^(2r k)=1 for an integer shift k.
This transposed assertion has the stated geometric M, not an arbitrary module.
For G5.7's specified finite-free
postcomposition interface identify its entries by the same oriented-duality
calculation and prove injectivity. Include the empty sums and r=0 unit branch.

For any finite CW X, build the actual finite projective-bundle comparisons
MU^k(X×(CP^n)^ℓ)=⊕_(0≤α_i≤n)MU^(k−2|α|)(X)x^α, their multiplicative
restriction maps and their surjectivity in every degree. Use G3's Milnor
sequence to obtain zero lim¹ and the completed graded ring
MU^k(X×BT)=∏_(α∈ℕ^ℓ)MU^(k−2|α|)(X)x^α. Construct the same comparisons
for BP and MU_(p). Use x_i=e(λ_i) for GeneralizedCohomology G5.7's standard
character line λ_i=O(−1); its ordinary coefficient image is −h_i, with
h=c₁(O(1)) as in CharacteristicClasses' Conventions. Relate this coordinate
to G4's dual-line projective-bundle coordinate by the actual formal inverse.
Prove tower and multiplication compatibility, and identify this instance's
mapping-spectrum Milnor sequence. Finite truncations have their own kernels;
prove cancellation on the full completed groups.

Consume RepresentationTheory/CompactGroups Layers1–2, **unitarizability**
and **complete reducibility**, and its **circle S¹ and Fourier series** engine
for integer characters of AddCircle 1. Construct the finite-product circle characters:
continuous characters of T=(Fin ℓ→Circle) are uniquely
χ_m(z)=∏_i z_i^(m_i), m∈Z^ℓ, by coordinate restriction and finite-product
multiplication. Use Mathlib's AddCircle.homeomorphCircle and toCircle_addChar
at period1; toCircle_zsmul identifies the circle engine with z↦z^n.
For a finite-dimensional continuous T-representation, apply the compact-group
decomposition and abelian Schur lemma to obtain its finite character list.
Construct only the pointwise fibre/Euler adapter: at one vertex of each
connected C component decompose ν_v, and use G4's Thom multiplicativity to
identify its Borel Euler class. Prove that path-related vertex restrictions
agree by homotopy naturality. With χ_j≠0 these fibre characters, set
Π(x)=∏_j[χ_j]_F(x), using the formal inverse for negative weights. In the
C-skeletal multiplicative filtration, prove n=Π−eν has filtration ≥1 and
n^q=0 for a uniform q=1+dim CW C, at every torus stage and after completion.
Use relative cup products and cellular diagonals to prove the filtration
product law. In the actual cup ring MU^*(BT×C), Euler classes have even
degree, so construct the homogeneous ring identity

`eν · Σ_{i=1}^q Π^{q−i}n^{i−1} = Π^q`.

Apply this identity through the cup-action comparison of
the torus finite-cell mapping Euler comparison, with pullback to BT×C×D. Construct
that comparison as an action on the direct sum over all integer mapping
degrees: the scalars shift degrees, rather than acting within one degree.
This reduces cancellation to scalar Π regularity while retaining all
nilpotent constant terms of eν. The skeletal ideal need not be a subcomodule.

For finite X=C×D identify BP^k(X) with BP_(−k)(DΣ∞X₊), including the actual
coaction. Apply F5's finite filtration by shifts of BP_*/I_h, h finite and
including h=0. Prove scalar-character regularity on every completed factor:
write χ=dχ₀ with primitive χ₀, implement a GL_ℓ(Z) torus-coordinate change,
and use the nonzero linear coefficient d for h=0. For h≥1 write d=p^a d'
with p∤d'; prove the first surviving p^a-series coefficient is a nonzero
power of v_h up to a unit, using F5's quotient presentations and primality
for the domain BP_*/I_h. Prove the graded
power-series coefficient substitution is invertible for the chosen torus
coordinate change. Complete the finite module filtration coefficientwise,
prove exactness degree by degree, and induct to obtain Π and Π^q regularity.

Consume F6.3's p-typical ring comparison i:BP→MU_(p), including its
unit/product homotopies and homotopy BP-action. Consume F6.4's generic
p-typical polynomial coefficient isomorphism and monomial basis for that same
coefficient embedding i_*, using F3's single fixed splitting
MU_(p) --p--> BP --i--> MU_(p). This generic coefficient foundation
precedes its localization application and depends only on the earlier
coefficient/idempotent constructions.

Construct the p-typical finite cohomology comparison: deduce flatness of the
polynomial BP_*→MU_(p)* embedding and the domain presentations modulo each
finite I_h, including I_0. Define the natural finite-CW-pair map

`MU_(p)^* ⊗_(BP^*) BP^*(X) → MU_(p)^*(X),  r⊗a ↦ r·i_*(a)`

and prove it an isomorphism by flatness, coefficient comparison and finite
cofiber/retract induction. Keep its naturality, products, suspensions and
relative boundary maps. Regrade coefficient degree j as cohomological
degree −j. Set x_BP:=p_*(x_MU). Construct the strict Cartier coordinate
comparison `i_*(x_BP)=c_F(x_MU)`, its inverse substitution and its scalar
character-series regularity transport. This scalar-coordinate comparison,
together with the finite-X coefficient comparison, supplies the injectivity
proof. Construct also the normalized Thom/Euler unit
`i_*(e_BP(ν))=u(ν)e_MU(ν)`, with `u(L)=c_F(x_MU(L))/x_MU(L)`
on lines, multiplicativity and the splitting-injection comparison on bundles.
Prove the unit and inverse are compatible on the finite Borel/flag models
and their completed tower, including rank0/unit1. Transfer the finite
Landweber filtration and Euler calculation through these finite-X and
scalar-coordinate comparisons. The full-bundle Thom unit is a separate
compatible orientation API. Consume the map, polynomial basis and p-typical
wedge comparison from their F6.3/F6.4 owners.

Recover integral injectivity by the finite-X localization comparison and
coefficientwise injection M→∏_p M_(p). Construct the coefficient maps on
power series; keep localization outside the infinite series product.

Apply G5.5/G5.7's full-base MU→HZ coefficient square, finite CP restrictions
and maps of mapping towers/Milnor sequences to these objects. Prove their
compatibility with the torus finite-cell mapping Euler comparison, its cup action
and the finite-X/completed comparisons. This gives the corresponding
coefficient maps on Euler and extension classes.

*Needs:* F1–F3 and F5's coefficient and comodule constructions; F6.3's
p-typical ring map and action; F6.4's coefficient polynomial foundation;
GeneralizedCohomology G5.1's finite duality and G5.7's module families
and Thom adapters; AlgebraicTopology Stage 8.7; RepresentationTheory
CompactGroups Layers 1–2.

**Checks.**
- T=S¹, C=D=pt and ν the line of weight d≠0: eν=[d]_F(x)=dx+⋯ in
  MU^*(BS¹)=MU^*[[x]], a nonzerodivisor because MU^* is a polynomial ring
  over ℤ, hence a domain, and so is MU^*[[x]]; Euler precomposition is
  injective, as the section asserts.
- the same with weight 0: ν is the trivial line and eν=0, so the
  precomposition is the zero map on the nonzero groups MU^*[[x]]; this is
  why zero character weights are excluded.
- r=0: eν is the unit 1 and Π is the empty product 1, so the cancellation
  is the identity map, the r=0 unit branch.
- C a point: q=1+dim C=1, so n=Π−eν satisfies n=n¹=0 and the ring identity
  reads eν·Π⁰=Π, that is eν=∏_j[χ_j]_F(x), the Euler class of a sum of
  characters; an identity with n^i in place of n^(i−1) would assert
  eν·0=Π here, false because Π≠0: its lowest-degree part is the product
  of the nonzero linear forms of the weights χ_j in x₁,…,x_ℓ.

### F6.7. Euler cancellation and module-extension nullhomotopies

In G5.7's module-family category take an actual cofiber triangle
A→B→Q→δΣA, a specified finite sum A≃⊕_DΣ^(b_D)P_D, a finite family of
fixed components C and nonzero-weight complex bundles ν_C of ranks r_C,
and specified data
Q≃⊕_CΣ^(2r_C)P_C, j:⊕_C P_C→B, qj~⊕_C eν_C.
The ranks may vary. Construct the moment-stratum extension nullhomotopy: compose
the given diagonal homotopy with the actual cofiber nullhomotopy δq~0,
apply F6.6 to each finite mapping entry to prove [δ]=0 in the global
π₀ Map_BT(Q,ΣA), and construct a choice of path δ→0. Apply G5.7's
extension classification to give A⊕Q≃B under A and over Q. Include the
rank-zero, empty-family and empty-A branches. Prove replacement, restriction
and coefficient compatibility for diagrams carrying the chosen δ-nullpaths,
and describe the splitting-choice space by G5.7's mapping-space fibre.
Restrict a chosen global path to the finite Borel towers. For a finite
filtered diagram of such triangles with supplied compatible δ-nullpaths,
construct the compatible splittings by G5.7's filtered extension-classification
form. The finite Borel restriction diagram is obtained from the one global
path and its functorial restriction maps.

*Needs:* F6.6; GeneralizedCohomology G5.7's extension classification.

### Examples

⟨Hℚ⟩<⟨S⟩, since S/p is Hℚ-acyclic but not contractible. At odd p the
Moore spectrum S/p has type 1 and the Adams map Σ^(2p−2)S/p→S/p is a v₁
self-map; at p=2, S/2 has strong type 1 and S/4 has type 1 without strong
type 1.

### Dependencies

F1–F5; GeneralizedCohomology G2, G2.11, G3, G5, G5.1, G5.5 and G5.7;
AlgebraicTopology Stages 8.7 and 8.8; ProfiniteCohomology;
RepresentationTheory SchurWeyl Layers 0, 2 and 5 and CompactGroups Layers
1–2.

## Downstream consumers

TangentialBordism consumes F1–F2's formal laws, Steenrod and Adams
carriers and coefficient rings for its geometric comparisons.
StringOrientation consumes F3–F5 (BP, cooperations, Hopf rings and
Landweber exactness) for the Hovey specialization to MString.
EllipticCohomology consumes F5's exactness and deformation theory, F6.5's
local actions and Hasse square and F4's higher Toda operations.

## References

- Quillen, [*Elementary proofs of some results of cobordism theory using Steenrod operations*](https://people.math.rochester.edu/faculty/doug/otherpapers/QuillenElem.pdf).
- Adams, *Stable Homotopy and Generalised Homology*, for orientations and cooperations.
- Ravenel, [*Complex Cobordism and Stable Homotopy Groups of Spheres*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mybooks/ravenel3rd.pdf), for p-typical cooperations and Adams–Novikov constructions, and Appendix 2 (Theorems A2.1.6, A2.1.18, A2.2.6 and A2.2.12, Lemmas A2.1.9 and A2.2.7, Definitions A2.1.24–A2.1.25 and equation (A2.2.13)) for the formal-group logarithm, p-series, height and the height classification over separably closed fields.
- Bousfield, [*The localization of spectra with respect to homology*](https://doi.org/10.1016/0040-9383(79)90018-1), Topology 18 (1979), §6, Theorem 6.6, for the identification of the HF_p-nilpotent completion of a bounded-below spectrum with its derived p-completion.
- Landweber, *Homological properties of comodules over `MU_*(MU)` and `BP_*(BP)`*, Amer. J. Math. 98 (1976), 591–610, Theorem 2.6 for the exact functor theorem, and for the filtration of finitely presented BP_*BP-comodules with subquotients BP_*/I_n (both surveyed in Ravenel, *Complex Cobordism*, Section 4.2, p. 118).
- Landweber–Ravenel–Stong, [*Periodic cohomology theories defined by elliptic curves*](https://people.math.rochester.edu/faculty/doug/mypapers/lrs.pdf), for exactness and elliptic examples.
- Wilson, *The Ω-spectrum for Brown–Peterson cohomology II*, and Hovey, [*The homotopy of MString and MU⟨6⟩ at large primes*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Hovey-bpbp1.pdf), for the Hopf-ring interfaces.
- Lubin–Tate, *Formal moduli for one-parameter formal Lie groups*, for the algebraic deformation theorem.
- Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), Section 4.J for the James construction and Section 4.L for the Steenrod operations, Adem relations and the admissible basis.
- Miller, [*Notes on Cobordism*](https://math.mit.edu/~hrm/papers/cobordism.pdf), Chapter 1, Sections 9–13, for the Steenrod algebra, Milnor's theorem on its dual and Thom's computation of MO_*; Chapter 2, Theorem 3.5 and Proposition 8.3, for Quillen's theorem and the Hurewicz embedding.
- Guillou–Weibel, [*Unstable operations in étale and motivic cohomology*](https://arxiv.org/abs/1301.0872), Definition 6.1, Theorem 6.2 and Theorem 6.5, for the algebraic forms of Borel's and Kudo's transgression theorems.
- Thom, *Quelques propriétés globales des variétés différentiables*, Comment. Math. Helv. 28 (1954), Chapitre IV, for the unoriented coefficient ring.
- Quillen, [*On the formal group laws of unoriented and complex cobordism theory*](https://www.ams.org/journals/bull/1969-75-06/S0002-9904-1969-12401-8/S0002-9904-1969-12401-8.pdf), Theorems 2 and 3, for the universality of the complex and unoriented laws.
- James, *Reduced product spaces*, Annals of Mathematics 62 (1955), Sections 1–6, for the James construction and its filtration.
- Toda, *Composition Methods in Homotopy Groups of Spheres*, Annals of Mathematics Studies 49 (1962), Chapter I, for the three-fold Toda brackets and their suspension.

- Devinatz–Hopkins–Smith, [*Nilpotence and stable homotopy theory I*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/dhs-ocr.pdf), for the three nilpotence scopes and the Thom/James/vanishing-line proof.
- Hopkins–Smith, [*Nilpotence and stable homotopy theory II*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HS.pdf), for finite support, thick classification and periodicity.
- Ravenel, [*Nilpotence and Periodicity in Stable Homotopy Theory*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mybooks/nilpb2020.pdf), §§3.3,7.3,7.5, Chapters6–8 and AppendixC, for invariant primes, Bousfield classes, periodicity, the Hopkins–Ravenel smashing proof and Smith idempotents, with Theorem 7.1.3 (p. 76) for the existence of Bousfield localization, Theorem 3.4.3 (p. 37) for the thick subcategory theorem and Theorem 1.5.4 (p. 9) for the periodicity theorem.
- Hovey–Strickland, [*Morava K-Theories and Localisation*](https://doi.org/10.1090/memo/0666), for generalized Moore systems, their local categories and completion comparisons.
- Greenlees–Sadofsky, [*The Tate spectrum of v_n-periodic complex oriented theories*](https://people.math.rochester.edu/faculty/doug/otherpapers/greenlees-sadofsky.pdf), and Kuhn, [*Tate cohomology and periodic localization of polynomial functors*](https://arxiv.org/abs/math/0307173), Theorem 1.5 for the T(n)-local form, for the stated local Tate comparisons.

- Hovey–Sadofsky, [*Tate Cohomology Lowers Chromatic Bousfield Classes*](https://doi.org/10.1090/S0002-9939-96-03495-8), for the finite-height prenilpotence/Tate descent.
- Johnson–Wilson, *BP-operations and Morava’s extraordinary K-theories*, Math. Z. 144 (1975), 55–75, Proposition4.14, for the operation-defined comparison, and Würgler, [*Cobordism theories of unitary manifolds with singularities and formal group laws*](https://doi.org/10.1007/BF01221149), Theorem2.16 and Remark6.19, for quotient operations and the stable homology comparison; the countable-cell/Milnor realization is the additional spectral adapter specified here.
- Clausen–Mathew, [*A short proof of telescopic Tate vanishing*](https://arxiv.org/html/1608.02063), Theorem 1.1 for the K(n)-local Tate vanishing and §2 for the unit/transfer and arbitrary-action module criteria.

- Symonds, [*Permutation complexes for profinite groups*](https://ems.press/content/serial-article-files/43113), §5 Theorem5.2, Proposition5.4, Corollary5.5 and §7, for finite signed weak permutation resolutions and complete cohomology; the uniform-vcd comparison is constructed in F6.4.
- Nikolaus–Scholze, [*On topological cyclic homology*](https://arxiv.org/abs/1707.01799), §I.3 and AppendixA, for the induced-object ideal, coherent stable quotient/Ind construction and lax symmetric monoidal Tate functor.

- Lurie, [*Higher Topos Theory*](https://www.math.ias.edu/~lurie/papers/HTT.pdf), §§1.2.4,1.2.9,2.1.2,2.2.1–2.2.5,2.4.5–2.4.6,3.1–3.3,4.2.4,4.3,5.2.7,5.3.5,A.2.6,A.3.2–A.3.6, and [*Higher Algebra*](https://www.math.ias.edu/~lurie/papers/HA.pdf), §§4.1.8,4.3.3,4.8.1,7.3.2, for the categorical models, natural marked straightening, model-diagram rectification and (co)limit comparison, Kan extensions, Ind, operadic rectification, monoidal Ind and relative adjoints that F6.5 consumes from GeneralizedCohomology G2.11 and applies to Borel actions.
