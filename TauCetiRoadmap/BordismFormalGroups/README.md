# Roadmap: bordism, formal groups and chromatic operations

**Summary.** This roadmap develops the coefficient and operation theory
that connects complex bordism to one-dimensional commutative formal groups.
From the pinned Tau Ceti formal-group tree (Lazard ring, logarithms,
heights) it builds the algebra of p-typical formal group laws and proves
Lazard's classification of formal groups over separably closed fields by
their height (F1). From GeneralizedCohomology's spectra,
Thom spectra and orientations it builds the mod-p Steenrod algebras and
Adams towers and proves Quillen's theorem L≅MU_* and Thom's computation of
π_*MO (F2); constructs the p-typicalization of MU_(p) and the Brown–Peterson,
Johnson–Wilson and Morava K-theories (F3); develops comodules, the
Adams–Novikov spectral sequence, Toda brackets and the Ω-spectrum Hopf
rings of BP⟨n⟩ (F4); proves the invariant prime ideal theorem,
Landweber's exact functor theorem and the Lubin–Tate universal
deformation theorem (F5); and reaches the chromatic
theorems of F6: Bousfield localization, the Devinatz–Hopkins–Smith
nilpotence theorem, the Hopkins–Smith thick-subcategory and periodicity
theorems, the Hopkins–Ravenel smashing theorem, the chromatic fracture
square, Greenlees–Sadofsky/Kuhn Tate vanishing, and torus Euler
cancellation on finite MU pieces with its module-extension nullhomotopy
application (F6.6–F6.7). A chosen complex orientation is data; its formal
group does not by itself prove a coefficient-ring universality theorem or
supply an E∞ orientation.

## Scope and ownership

This roadmap owns, by layer: F1, the algebraic theory of p-typical formal
group laws (Cartier's theorem, the universal p-typical ring V and its
Hopf algebroid) and the height classification of
one-dimensional commutative formal groups over separably closed fields,
built on the pinned Tau Ceti formal-group tree, which F1 consumes by name
and never plans again; F2, complex and real orientations with their
formal laws, the mod-p Steenrod algebras and HF_p-based Adams towers, the
unoriented coefficient ring MO_*, Thom's and Quillen's coefficient
theorems for MO and MU, and the Conner–Floyd and graded Eilenberg–MacLane
comparisons; F3, the splitting of idempotents of spectra, the
p-typicalization of MU_(p), Brown–Peterson theories and their
cooperations, the height-n Honda laws, and the theories BP⟨n⟩, E(n) and
K(n) with the Adams summands; F4, comodule algebra, the Adams–Novikov
spectral sequence, the BP-homology Atiyah–Hirzebruch spectral sequence,
the three-fold Toda brackets of pointed spaces, the higher Toda
operations and the Ω-spectrum Hopf rings of BP⟨n⟩; F5, invariant prime
ideals, Landweber exactness and the Lubin–Tate universal deformation
theorem; F6, homological Bousfield localization, the nilpotence theorem
with its James-construction proof, thick subcategories and periodicity,
the Bousfield classes of the Johnson–Wilson theories, the smashing
theorem and the chromatic fracture square, local group actions with
their Tate comparisons, and the torus Euler cancellation on finite MU
pieces with its module-extension nullhomotopy application.

It leaves to other roadmaps, which it cites by section where it consumes
them: GeneralizedCohomology G2–G5 supplies spectral models, derived
smash/function objects, represented theories, projective/Thom
orientations, MU and its multiplicative model, connective K spectra and
generic spectral Postnikov covers, and G2.11's enriched, quasicategorical,
straightening, monoidal-localization and operadic foundations.
TopologicalKTheory's Conventions fix the Bott class β=[O(−1)]−1 on
CP¹=S² that F2 uses for K-theory's multiplicative law, and its T2.5
supplies the Adams operations by which F6.3 detects Adams' v₁ maps.
AlgebraicTopology supplies ordinary (co)homology with cup products,
Stage 5.5's Serre spectral sequences, Stage 8.3's Hurewicz theorem,
Stage 8.7's finite CW type of compact smooth manifolds and Stage
8.8–8.10's Eilenberg–MacLane models and representability;
CharacteristicClasses C3 supplies the Stiefel–Whitney classes and the
mod-2 cohomology of BO(n) and BO. TangentialBordism
consumes F1–F2's formal laws, Steenrod and Adams carriers and coefficient
rings; it owns geometric cycles, the Pontryagin–Thom comparison and the
integral oriented/Spin coefficient calculations, none of which is an
input here. The ordinary-operation items of TangentialBordism's Layer 4
and its additive MO splitting are F2 targets, which TangentialBordism
consumes, one line each:

- TangentialBordism B4.1, the Steenrod squares Sq^i → F2.2, **Steenrod
  algebras and mod-p Adams towers** (the operations by the extended-power
  construction; a cup-i model of them is a comparison with these);
- TangentialBordism B4.2, the Steenrod algebra with its admissible basis
  and dual, the transgression with Kudo's and Borel's theorems, and
  HF_p-Adams convergence → F2.2, the same section;
- TangentialBordism B4.7, the odd-prime operations P^i and β and Borel's
  theorem for p-simple systems → F2.2, the same section;
- TangentialBordism B4.4, the additive splitting MO≃⋁_α Σ^(|α|)HF₂ →
  F2.4, **Unoriented coefficients**.

StringOrientation consumes F3–F5, including F3's Adams-summand splitting
of ko_(p) for its own space-level splitting of BO⟨d⟩_(p), and owns the
Hovey specialization to MString and its geometric Cayley-plane kernel.
EllipticCohomology owns elliptic realization, descent and tmf; it
consumes formal-group exactness and deformation theory here, and the
Bauer bracket forms of F4 are its applications, not generic definitions.
EllipticCurves owns the elliptic logarithm and exponential instances of
the pinned generic formal-group API; ModularCurves consumes F1's height
classification. Nothing geometric (manifolds, cycles, transversality) is
constructed here.

The generic enriched, quasicategorical and monoidal foundations that F6.5
applies to Borel actions are GeneralizedCohomology G2.11's (its item 11).
Identifiers of F6.5 that other roadmaps cite for them, with their owner,
one line each:

- F6.5, **Categorical model and functor spaces** → GeneralizedCohomology
  G2.11, the same heading;
- F6.5, **Enriched diagram foundations before straightening** →
  GeneralizedCohomology G2.11, the same heading;
- F6.5, **Unmarked straightening and the categorical model** →
  GeneralizedCohomology G2.11, the same heading;
- F6.5, **Marked fibrations and Kan extensions** → GeneralizedCohomology
  G2.11, the same heading;
- F6.5, **Coherent model diagrams and stable enhancements**, with the
  homotopy (co)limit comparison, coherent and absolute Kan extensions and
  adjunctions, relative and Dwyer–Kan localization, Cat∞ colimits and
  descent → GeneralizedCohomology G2.11, the same heading;
- F6.5's monoidal/fibration sub-lane (finite pointed sets, coCartesian
  Segal fibrations, operads, the two-coloured associative algebra/module
  operad with its rectification, unit-adjoined monoidal localization,
  relative adjunctions and the universal exact lax-monoidal approximation,
  the lax-refinement categories A and B) → GeneralizedCohomology G2.11,
  under **Coherent model diagrams and stable enhancements**;
- F6.5's quotient/Ind sub-lane (stable quotients, space-valued Ind_κ,
  monoidal Ind and Day convolution) → GeneralizedCohomology G2.11, under
  **Coherent model diagrams and stable enhancements**.

F6.5, **Local group actions and completion comparisons**, owns the
application of these foundations to Borel actions: the induced-object
ideal, the lax symmetric monoidal Tate functor, norms, transfers and Tate
vanishing.

## Conventions

Formal groups are Mathlib's `FormalGroup R`, one-dimensional over a
commutative ring R, with `FormalGroup.IsComm` where commutativity is a
hypothesis; homomorphisms, isomorphisms and strict isomorphisms are Tau
Ceti's bundled ones. Ravenel's formal group laws are commutative by
definition (Definition A2.1.1(ii), p. 352), so a statement taken from his
Appendix 2 is read with `FormalGroup.IsComm` on every law it mentions. A
prime p is fixed within each layer that mentions
it, and p=2 is treated by its own constructions wherever the odd-prime
argument divides by two. Spectra, smash products and function spectra are
GeneralizedCohomology G2's model and its homotopy category; a complex
orientation of a ring spectrum is data, a chosen class in cohomological
degree 2 restricting to the unit on CP¹. Gk and Gk.n denote
GeneralizedCohomology's layer Gk and its item n; Fk and Fk.n denote this
roadmap's layers and sections.

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
  commutativity: `IsComm` is a separate class. For F5's Lubin–Tate
  theorem: `MvPowerSeries (Fin (h - 1)) R` with
  `MvPowerSeries.constantCoeff` and `MvPowerSeries.X`, `PowerSeries.map`,
  `IsLocalRing` with `IsLocalRing.maximalIdeal`, `IsNoetherianRing`,
  `IsAdicComplete` (`Mathlib/RingTheory/AdicCompletion/Basic.lean`, which
  includes Hausdorffness: it extends `IsHausdorff` and `IsPrecomplete`),
  and Witt vectors `WittVector` with the residue map
  `WittVector.constantCoeff` (`Mathlib/RingTheory/WittVector/Basic.lean`)
  for the standard coefficient ring. For F5's invariant prime ideals:
  `Ideal.IsHomogeneous` for a `GradedRing`
  (`Mathlib/RingTheory/GradedAlgebra/Homogeneous/Ideal.lean`), `Ideal.map`,
  `Ideal.IsPrime` and `MvPolynomial.C`.
- **From Tau Ceti:** the formal-group tree `TauCeti.RingTheory.FormalGroup`:
  the bundled homomorphisms `TauCeti.FormalGroupHom` and isomorphisms
  `TauCeti.FormalGroupIso` (strict ones through
  `TauCeti.FormalGroupIso.IsStrict`, module `Hom`), the inverse series
  `FormalGroup.addInvX` (module `AddInv`), the n-series
  `FormalGroup.nsmulSeries` (module `NSMul.Basic`), the topologically
  nilpotent point carrier `FormalGroup.TopNilpotentPoint` (module
  `TopNilpotentPoint.Basic`), coordinate changes `TauCeti.FormalCoordinate`
  (module `CoordinateChange.Basic`), the Lazard ring `TauCeti.LazardRing`
  (modules `LazardRing.Basic`, `LazardRing.Polynomial`,
  `LazardRing.Indecomposable`), the symmetric cocycle lemma (module
  `SymmetricCocycle.Classification`), the invariant differential,
  logarithm and exponential (modules `Logarithm.Basic`,
  `Logarithm.Naturality`, `Logarithm.InfiniteHeight`), the exponent-two
  logarithm and its universal ring (modules `ExponentTwo.Basic`,
  `ExponentTwo.Iso`, `ExponentTwo.Universal`), the height
  `FormalGroup.height` and height ideals `FormalGroup.heightIdeal`
  (modules `Height.Basic`, `Height.Ideal`), the Frobenius factorization
  (module `Frobenius.Factorization`) and the obstruction and
  leading-difference lemmas (modules `Obstruction`, `LeadingDifference`).
  For F5: the invariance of the height ideals of the Lazard ring,
  `TauCeti.LazardRing.map_rightUnit_heightIdeal` (module
  `CoordinateChange.HopfAlgebroid`), their presentation
  `FormalGroup.heightIdeal_eq_span` (module `Height.Ideal`), and Lubin–Tate
  rigidity `TauCeti.FormalGroupIso.eq_of_map_residue_eq` (module
  `Rigidity`): over a local ring Hausdorff for its maximal ideal, with
  residue field of characteristic p, two isomorphisms between commutative
  formal groups with the same reduction are equal when the reduction of
  the source has finite height.
  F1 names each consumed declaration where it is used; the height is
  defined over a field, and the classification's separable closure is a
  hypothesis of this roadmap's target, not of the library's height.
- **From TauCetiRoadmap.GeneralizedCohomology:** G2–G5 and G2.11 as
  described under Scope and ownership: G2's spectral model and cofiber
  sequences, G2.7's mod-p Eilenberg–MacLane spectrum, G3.3's arbitrary-CW
  comparison, G3.8's Milnor sequence and connective covers, G3.9's derived
  p-completion, G4's projective-bundle comparison and G4.3's Thom
  isomorphism, G5.3–G5.5 and G5.7's Thom models, Thom product, finite
  duality, module families and extension classification. G3 owns integer
  spectral localization and derived p-completion; it supplies no chromatic
  localization or smashing theorem.
- **From TauCetiRoadmap.AlgebraicTopology:** ordinary (co)homology with
  cup products, Stage 5.5's cohomological Serre spectral sequence of a
  fibration, Stage 8.3's Hurewicz theorem, Stage 8.7's finite CW type of
  compact smooth manifolds (F6.6's finite CW models), Stage 8.8's bar/CW
  models and Stage 8.10's universal classes and representability of
  Eilenberg–MacLane spaces.
- **From TauCetiRoadmap.CharacteristicClasses:** C3's Stiefel–Whitney
  classes, the Whitney formula and `H^*(BO(n);𝔽₂)=𝔽₂[w₁,…,w_n]`.
- **From TauCetiRoadmap.TopologicalKTheory:** the Conventions' Bott class
  β=[O(−1)]−1 on CP¹=S², and T2.5's Adams operations ψ^k, k≥1, with
  ψ^kβ_n=k^nβ_n on the Bott classes of the spheres S^(2n), for F6.3's
  detection of Adams' v₁ maps.
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

F1 precedes F2, and no section of F1 uses a later layer: F1.5 contains
the algebraic theory of p-typical laws (Cartier's theorem, the ring V, its
generators and the Hopf algebroid (V,VT)) on which Lazard's classification
and F3.2's Honda laws rest, and F3.1 identifies (V,VT) with (BP_*,BP_*BP)
after Quillen's theorem. F2 constructs the mod-p Steenrod algebras, the HF_p-based
Adams towers and the unoriented coefficient ring from AlgebraicTopology's
ordinary cohomology and G2.7's HF_p and G5.4's MO and MU models, and
supplies F3's spectra/cooperations. After the Toda brackets (F4.1–F4.2),
F4 builds the comodules and the Adams–Novikov spectral sequence (F4.3),
then its convergence and the BP-homology Atiyah–Hirzebruch spectral
sequence (F4.4); the Massey/Toda comparisons on cobar complexes (F4.5)
follow, and F4.6 runs that Atiyah–Hirzebruch spectral sequence on the
Ω-spectrum spaces of F3's BP⟨n⟩ for their Hopf rings. G3 owns integer
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
F6.7 consumes F6.6 plus G5.7's extension classification.
The separate stable-stratum/diagonal construction in
SymplecticGeometry/ConvexityToric T2, **Morse–Bott and moment-map topology**,
instantiates F6.7 on its own geometric cofiber/diagonal data for the
full integral MU-module finite moment filtration. The Euler proof uses the
generic coefficient constructions and the stated module-family/duality inputs.

## Layer 1: F1. Formal-group algebra and universality

Everything in this layer except F1.5's algebraic theory of p-typical laws
and the height classification at its end is a theorem of the pinned Tau
Ceti, in the modules of `TauCeti.RingTheory.FormalGroup` named below;
consume it by name. Those two are this layer's targets, and Lazard's
classification over separably closed fields is the layer's only headline.

### 1.1 n-series, inverses, homomorphisms and points (F1.1)

The n-series [n]_F is
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
constant term and unit linear coefficient) acting on `FormalGroup R` by
φ•F=φ(F(φ⁻¹X,φ⁻¹Y)) (module `CoordinateChange.Basic`), with
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

### 1.2 Lazard ring, cocycle lemma and Hopf algebroid (F1.2)

`TauCeti.LazardRing`
(module `LazardRing.Basic`) is the quotient of ℤ[a_ij : i,j≥1] by the
commutativity and associativity relations `LazardRing.relations` of
X+Y+Σa_ij X^iY^j; `LazardRing.formalGroup` is the universal commutative
law and `TauCeti.LazardRing.lift` is the natural bijection
{F : FormalGroup R // F.IsComm} ≃ Hom_ring(L,R), from commutative laws
to classifying maps, with `map_lift` (the law classified by `lift F` is
F), `coe_lift_symm` and the naturality `lift_map`. The grading
`LazardRing.grading` puts a_ij in degree 2(i+j−1), is a `GradedAlgebra`,
and `gradedLift` is the graded universal property for graded coefficient
rings. Lazard's polynomial theorem is `TauCeti.LazardRing.mvPolynomialEquiv`
(module `LazardRing.Polynomial`), an isomorphism of ℤ-algebras from the
polynomial ring on ℕ+ sending the n-th variable to
`LazardRing.generator n`; the generators, of degree 2n
(`generator_mem_grading`), and the cotangent basis `cotangentBasis` of the
augmentation ideal modulo its square are in module
`LazardRing.Indecomposable`, and the integral independence
`algebraicIndependent_generator` is in module `LazardRing.Independence`. The homogeneous
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

### 1.3 Invariant differential, logarithm and exponential (F1.3)

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
and e^T−1. The exponent-two construction of F1.4 is a separate integral
argument; the ℚ-algebra logarithm does not apply there.

**Checks.** Values that must agree with these declarations:
- for the additive group P=1, log=T and exp=T;
- for the multiplicative group X+Y+XY, P=(1+T)⁻¹,
  log_F=Σ_(n≥1)(−1)^(n+1)T^n/n and exp_F=e^T−1, and
  P(F(X,Y))·F_X(X,Y)=(1+Y)/((1+X)(1+Y))=P(X), whereas the un-inverted
  series 1+T fails invariance since (1+F(X,Y))(1+Y)≠1+X;
- over a ℚ-algebra the additive series along the additive group are
  exactly the multiples c·T, so T² is not additive, whereas X² is additive
  along X+Y precisely over rings with 2=0, since (X+Y)²−X²−Y²=2XY, the
  setting of F1.4.

### 1.4 Exponent two (F1.4)

For a commutative F over any ring R with [2]_F=0 (which
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

### 1.5 Height and Lazard's classification (F1.5)

Over a field K,
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
`Height.Ideal`), with `heightIdeal_eq_bot_iff_le_height` comparing them
with the height over fields; F5 consumes them.

Build the algebraic theory of p-typical laws, which the pinned Tau Ceti
formal-group tree does not contain; it is formal-group algebra over
ℤ_(p)-algebras and uses no spectrum. Every law in this paragraph is
commutative, a `FormalGroup` with `FormalGroup.IsComm`: Ravenel's formal
group laws are commutative by definition (Definition A2.1.1(ii), p. 352),
whereas Mathlib's `FormalGroup` is not. For a prime p, a commutative
formal group law over a torsion-free ℤ_(p)-algebra is p-typical when its
logarithm has the form Σ_(i≥0) ℓ_i x^(p^i) with ℓ₀=1 (Ravenel, Definition
A2.1.17); a commutative law over an arbitrary ℤ_(p)-algebra is p-typical
when for every prime q≠p the series
f_q(x)=[1/q]_F(Σ^F_(1≤j≤q) ζ^j x), ζ a primitive q-th root of unity,
vanishes (Ravenel, Proposition A2.1.20 for [1/q]_F, (A2.1.21) and
Definition A2.1.22, pp. 358–359); prove that f_q has coefficients in the
base ring and that the two definitions agree in the torsion-free case.
Its API:

- Cartier's theorem: every commutative formal group law over a
  ℤ_(p)-algebra is strictly isomorphic, by a coordinate change natural in
  the ring, to a p-typical one; for the universal law over L⊗ℤ_(p) the
  p-typical law has logarithm Σ_(i≥0) m_(p^i−1) x^(p^i), where
  Σ m_i x^(i+1) is the logarithm over L⊗ℚ (Ravenel, Theorem A2.1.18,
  p. 358, and (A2.1.24)).
- The ring V=ℤ_(p)[v₁,v₂,…], |v_n|=2(p^n−1), carries a universal
  p-typical law: commutative p-typical laws over a commutative
  ℤ_(p)-algebra R correspond bijectively to ring maps V→R, and V is the
  image of the idempotent ring endomorphism of L⊗ℤ_(p) whose
  rationalization fixes m_i for i+1 a power of p and kills the other m_i,
  hence a retract of L⊗ℤ_(p) (Ravenel, Theorem A2.1.25, p. 360, with its proof).
- Generators: with ℓ_i the image of m_(p^i−1) in V⊗ℚ, Hazewinkel's
  generators are defined by pℓ_n=Σ_(0≤i<n) ℓ_i v_(n−i)^(p^i) and Araki's by
  pℓ_n=Σ_(0≤i≤n) ℓ_i v_(n−i)^(p^i) with v₀=p; each family lies in V and
  generates it as a ℤ_(p)-algebra, and the two are congruent modulo p
  (Ravenel, (A2.2.1), (A2.2.2) and Theorem A2.2.3, pp. 363–364).
- For Araki's generators the p-series of the universal p-typical law is
  [p]_F(x)=Σ^F_(i≥0) v_i x^(p^i), v₀=p (Ravenel, (A2.2.4), p. 364).
- A strict isomorphism f out of a p-typical law F, whose target is then
  commutative as F is, has p-typical target exactly when
  f⁻¹(x)=Σ^F_(i≥0) t_i x^(p^i) with t₀=1, so
  VT=V[t₁,t₂,…], |t_n|=2(p^n−1), classifies strict isomorphisms of
  commutative p-typical laws and (V,VT) is a Hopf algebroid, a quotient of
  (L⊗ℤ_(p),L⊗ℤ_(p)[b₁,b₂,…]); its right unit is determined by
  η_R(ℓ_n)=Σ_(0≤i≤n) ℓ_i t_(n−i)^(p^i) and, for Araki's generators, by
  Σ^F_(i,j≥0) t_i η_R(v_j)^(p^i)=Σ^F_(i,j≥0) v_i t_j^(p^i) (Ravenel, Lemma
  A2.1.26, Theorem A2.1.27, pp. 360–361, and Theorem A2.2.6, p. 365).

*Needs:* Mathlib `FormalGroup` and `FormalGroup.IsComm`; the pinned
`TauCeti.LazardRing` with
`TauCeti.LazardRing.lift` and `TauCeti.LazardRing.mvPolynomialEquiv`,
`FormalGroup.log` over L⊗ℚ (F1.3), the pinned n-series (F1.1) and F1.2's
coordinate changes and Hopf algebroid (L,L[b₁,b₂,…]). F3.1 identifies
(V,VT) with (BP_*,BP_*BP); nothing here uses F2 or F3.

**Checks.**
- The multiplicative law X+Y+XY over ℤ_(p) is not p-typical: its
  logarithm Σ_(n≥1)(−1)^(n+1)x^n/n has the nonzero coefficient −1/2 at x²
  for odd p, and 1/3 at x³ for p=2, in degrees that are not powers of p.
  Its p-typicalization has logarithm Σ_(i≥0)(−1)^(p^i+1)x^(p^i)/p^i, so
  ℓ₁=1/p for odd p and −1/2 for p=2, and Hazewinkel's v₁=pℓ₁ is 1,
  respectively −1: a unit, as height one requires.
- The additive law is p-typical for every p (logarithm x) and is
  classified by v_i↦0 for all i≥1, for either family of generators; a
  definition requiring only ℓ₁≠0 would exclude it.
- ℓ₁: Hazewinkel's recursion gives ℓ₁=v₁/p and Araki's gives
  ℓ₁=v₁/(p−p^p), so the two v₁ differ by the factor 1−p^(p−1), a unit of
  ℤ_(p) congruent to 1 modulo p; at p=2 the factor is −1.
- From η_R(ℓ₁)=ℓ₁+t₁ the Hazewinkel v₁=pℓ₁ has η_R(v₁)=v₁+pt₁. For
  Araki's v₁ the degree-2(p−1) part of Theorem A2.2.6's identity reads
  η_R(v₁)+p^p t₁=v₁+pt₁, the cross terms of the formal sums having higher
  degree, so η_R(v₁)=v₁+(p−p^p)t₁, in agreement with ℓ₁=v₁/(p−p^p); a
  right unit equal to the left unit would make every ideal of V
  invariant.
- Commutativity is a hypothesis, not a consequence: over 𝔽_p[ε]/(ε²) the
  series F(X,Y)=X+Y+εXY^p is a `FormalGroup`, since both bracketings give
  X+Y+Z+ε(XY^p+XZ^p+YZ^p) (the p-th power of Y+Z+εYZ^p is Y^p+Z^p in
  characteristic p), but not `FormalGroup.IsComm`, since
  F(X,Y)−F(Y,X)=ε(XY^p−X^pY)≠0. Every law classified by a map V→R is
  commutative and a strict isomorphism preserves commutativity, so
  Cartier's theorem does not apply to F and no ring map
  V→𝔽_p[ε]/(ε²) classifies it. The nilpotent ε is needed: over a reduced
  ring every one-dimensional law is commutative (Ravenel, remark after
  Definition A2.1.1, p. 352, citing Lazard).

Prove Lazard's classification over separably closed fields: for a
separably closed field k of characteristic p and commutative
one-dimensional formal groups F and G over k, `TauCeti.FormalGroupIso F G`
is nonempty precisely when `FormalGroup.height F p` equals
`FormalGroup.height G p`, the infinite-height class included
(`nonempty_formalGroupIso_iff_height_eq`; Ravenel, Theorem A2.2.12,
p. 367, which says that every commutative law of height n over k is
isomorphic to one standard law, his F_n of Definition A2.2.11, and to the
additive law for n=∞; F3.2 defines F_n as the height-n Honda law and
consumes this classification, while the statement here compares two
arbitrary laws and its route below does not use F_n). The forward direction
is `TauCeti.FormalGroupIso.height_eq` and the infinite-height case is
`height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ`. Ravenel's route for finite
height h, run for two arbitrary laws: by Cartier's theorem (A2.1.18)
replace F and G by isomorphic p-typical laws, classified by ring maps
φ,θ:V→k from the ring V of the p-typical paragraph above (Theorem
A2.1.25), with Araki's generators; since p=0 in k, the p-series formula
(A2.2.4) shows that height h means φ(v_i)=θ(v_i)=0 for 1≤i<h and
φ(v_h),θ(v_h)≠0. Seek f:F→G with f⁻¹(x)=Σ^F_(i≥0) t_i x^(p^i) and t₀ a
unit; the law that f transports F to is then p-typical whatever the unit
t₀ (Lemma A2.1.26, p. 360), and it is G once the t_i satisfy the
equations below, which determine the classifying map of that law. Comparing
f⁻¹([p]_G(x)) with [p]_F(f⁻¹(x)) by (A2.2.4) gives the identity of
Theorem A2.2.6 with φ(v_i) for v_i and θ(v_j) for η_R(v_j),
`Σ^F_(i,j≥0) t_i θ(v_j)^(p^i) x^(p^(i+j)) = Σ^F_(i,j≥0) φ(v_i) t_j^(p^i) x^(p^(i+j))`,
whose proof holds for t₀≠1 (Ravenel, proof of Theorem A2.2.12, p. 367).
Its coefficient of x^(p^h) gives t₀·θ(v_h)=φ(v_h)·t₀^(p^h), that is
t₀^(p^h−1)=θ(v_h)/φ(v_h), and its coefficient of x^(p^(h+i)), i≥1, gives
t_i·θ(v_h)^(p^i)+c_i=φ(v_h)·t_i^(p^h) with c_i∈k determined by
t₀,…,t_(i−1) (and c₀=0). Each equation says that its new unknown is a
root of φ(v_h)·T^(p^h)−θ(v_h)^(p^i)·T−c_i, whose derivative in
characteristic p is the nonzero constant −θ(v_h)^(p^i); so the
polynomial is separable of degree p^h and has p^h distinct roots in k,
and for i=0 all but the root 0 are units. For F=F_h, where φ(v_h)=1,
these are Ravenel's equations (A2.2.13). The degree-by-degree obstruction theory for this induction is
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
Ravenel's route also the p-typical paragraph above (Cartier's theorem, V
with Araki's generators, the p-series formula and the right-unit
formula) and Lemma A2.1.26 for a unit t₀, which are route inputs, not
inputs of the statement.
This supplies ModularCurves' height-classification application.
EllipticCurves Layer 1 owns the elliptic logarithm/exponential instances;
it consumes the pinned generic API.

**Checks.**
- The additive and multiplicative groups over an algebraic closure of
  𝔽_p have heights ∞ and 1 (`height_𝔾ₐ`, `height_𝔾ₘ`) and are not
  isomorphic, which the statement forbids and a definition of height that
  returned 0 for the additive group would not.
- For F=G the identity series X is the isomorphism and the heights agree
  trivially.
- Over 𝔽_p itself the forward direction holds but the converse fails: the
  multiplicative group and its nontrivial Galois twists have height one
  and are not isomorphic over 𝔽_p, since an 𝔽_p-isomorphism commutes with
  the Frobenius endomorphism X^p, which these twists send to different
  elements of the common endomorphism ring ℤ_p; so separable closure is
  needed.
- At h=1 the route's first equation can be read off a scaling: for
  nonzero a,b∈k let F and G be the p-typical laws classified by v₁↦a and
  v₁↦b, v_i↦0 for i≥2, so [p]_F(x)=ax^p and [p]_G(x)=bx^p by (A2.2.4).
  Transporting F along x↦cx gives a p-typical law with p-series
  c·a(x/c)^p=ac^(1−p)x^p, hence classified by v₁↦ac^(1−p), v_i↦0 for
  i≥2; it is G exactly when c^(p−1)=a/b, that is when t₀=1/c satisfies
  t₀^(p−1)=θ(v₁)/φ(v₁)=b/a. The equation t₀θ(v₁)=t₀^p, which is the case
  F=F₁, would give c^(p−1)=1/b and transport F to the law classified by
  v₁↦ab, which is not G when a≠1. For p odd and a≠b in 𝔽_p^× the
  equation has no root in 𝔽_p, where t₀^(p−1)=1 for every t₀≠0; since
  every isomorphism of p-typical laws is a strict one of the form in the
  p-typical paragraph above followed by a scaling, F and G are not
  isomorphic over 𝔽_p, and become isomorphic over its separable closure.

### Examples

- Over an algebraic closure of 𝔽_p the additive and multiplicative laws
  have heights ∞ and 1 (`height_𝔾ₐ`, `height_𝔾ₘ`) and are not isomorphic.
- For a unit u, X+Y+uXY is isomorphic to the multiplicative law over every
  ring by x↦ux, since u(X+Y+uXY)=uX+uY+(uX)(uY); over a field of
  characteristic p its p-series is u^(p−1)x^p, of height 1, as the
  classification requires.
- Over a ℚ-algebra the multiplicative law has logarithm
  log(1+T)=Σ_(n≥1)(−1)^(n+1)T^n/n and exponential e^T−1 (`log_𝔾ₘ`,
  `exp_𝔾ₘ`).

### Dependencies

Mathlib's `FormalGroup` carrier and the pinned Tau Ceti formal-group tree
listed under Exact supplier contracts. F1.5's p-typical theory uses
F1.1–F1.3 and the pinned Lazard ring, and Ravenel's route to the
classification uses that p-typical theory; no section of F1 uses a later
layer.

## Layer 2: F2. Complex orientations and Quillen's theorem

### 2.1 Complex orientations and their formal laws (F2.1)

Consume G4's chosen complex orientation and finite projective-bundle theorem.
Own the two-variable comparison: iterated finite CP^m×CP^n projective-bundle
isomorphisms, the surjective truncation restriction system, vanishing lim¹
and the skeletal Milnor comparison give E*(CP∞×CP∞)=E*[[x,y]], with
its degreewise completion and products. Use the even commutative coefficient
ring π_(2*)E for the native formal group; odd coefficients remain modules
over it. This comparison precedes the tensor-product definition. Prove that tensoring the two universal lines defines a
commutative native formal group F_E, with the orientation normalization,
inverse dual-line formula and base-change laws (Ravenel, Definition
4.1.1, p. 106, for a complex orientation of an associative
homotopy-commutative ring spectrum, and Lemma 4.1.4, p. 107, for
E^*(CP^∞)=E^*[[x]], E^*(CP^∞×CP^∞)=E^*[[x⊗1,1⊗x]] and the formal group
law of the tensor-product map). Compare two orientations by
their strict coordinate change (Ravenel, Lemma 4.1.13 with its proof,
p. 111). Include K-theory's multiplicative law with its Bott grading: for
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
*Needs:* GeneralizedCohomology G4 (the chosen complex orientation, the
finite projective-bundle theorem and the two quaternionic orientations)
and G3.8 (the Milnor sequence); TopologicalKTheory's Conventions (the Bott
class); Mathlib `FormalGroup` and `FormalGroup.𝔾ₘ`, and F1.1's
`TauCeti.FormalCoordinate` for the comparison of two orientations.

**Checks.**
- With x_K(L)=u⁻¹([L⁻¹]−1), write [L⁻¹]=1+ux; then
  x_K(L⊗L′)=u⁻¹((1+ux)(1+uy)−1)=x+y+uxy, and on CP¹ the restriction of
  x_K(O(1)) is u⁻¹([O(−1)]−1)=u⁻¹u=1. The variant u⁻¹([L]−1) has the same
  law but restricts to −1, because [O(1)]−1=−β on S² (β²=0 and
  [O(1)][O(−1)]=1), so it violates the normalization.
- The dual line has x_K(L⁻¹)=[−1]_(F_K)(x)=−x/(1+ux): indeed
  x+(−x/(1+ux))+ux·(−x/(1+ux))=(x+ux²−x−ux²)/(1+ux)=0, so the inverse
  dual-line formula is not x↦−x for K-theory.
- For ordinary cohomology, with the additive law, γ_H restricted to CP∞ is
  L⊕L⁻¹ as a complex bundle, of top Chern class t·(−t)=−t², the value of
  e^c(γ_H)|CP∞=t[−1]_F(t); the standard class is t², and the two differ by
  (−1)^r with r=1, as stated.

### 2.2 Steenrod algebras and mod-p Adams towers (F2.2)

For every prime p construct
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
unnumbered theorem on page 500, which defers its proof), by induction on n
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
and conjugation (Miller, Chapter 1, Theorem 11.2; Ravenel, Theorem 3.1.1),
through the action of A on the product of the degree-one (p=2) or
degree-two (odd p) classes of (Bℤ/p)^n, which is free through degree n.
Construct the Milnor primitives Q₀=β (Sq¹ at p=2) and
Q_(i+1)=[P^(p^i),Q_i] (at p=2, [Sq^(2^(i+1)),Q_i]), of degree 2p^i−1
(2^(i+1)−1 at p=2), dual to τ_i at odd p and to ξ_(i+1) in the Milnor
basis at p=2; prove Q_i²=0 and Q_iQ_j=Q_jQ_i, that E=E(Q₀,Q₁,…) is an
exterior sub-Hopf algebra, that A_p is free as a left and as a right
E-module by the Milnor basis, and that the quotient A//E is dual to the
sub-Hopf algebra `P_*=𝔽_p[ξ₁,ξ₂,…]` at odd p and `𝔽₂[ξ₁²,ξ₂²,…]` at p=2
of A_*, so that the dual E_* of E is the quotient Hopf algebra
A_*⊗_(P_*)𝔽_p, the exterior algebra `E(τ₀,τ₁,…)` at odd p and
`E(ξ₁,ξ₂,…)` at p=2 (Ravenel, Theorem 3.1.1, Lemma 3.1.6 for P_*, and
Lemma 3.1.8, p. 64, for E_*). Prove that A_*≅P_*⊗E_* as left P_*-modules
and right E_*-comodules (Ravenel, Corollary A1.1.20, for the surjection
A_*→E_*). Prove the change-of-rings isomorphism
Ext_(A_*)(𝔽_p,A_*□_(E_*)C)≅Ext_(E_*)(𝔽_p,C) for every left E_*-comodule C
(Ravenel, Corollary A1.3.13), where A_*□_(E_*)C≅P_*⊗C as graded vector
spaces by the preceding splitting, and its comodule-algebra form
Ext_(A_*)(𝔽_p,P_*⊗N)≅Ext_(E_*)(𝔽_p,N) for an A_*-comodule algebra N, with
P_*⊗N carrying the tensor-product coaction and N its restricted
E_*-coaction (Ravenel, Lemma 3.1.8, p. 64), at every prime; the mod-2
statements use the squares ξ_i² and are constructed here, not transported
from the odd-prime ones. Construct the HF_p-based Adams tower of a spectrum X from
G2's cofiber sequences of the unit S→HF_p smashed with X, an E-Adams
resolution (Ravenel, Definition 2.2.1), its exact couple and spectral
sequence with E₂^(s,t)=Ext_(A_*)^(s,t)(𝔽_p,H_*(X;𝔽_p)) and d_r of bidegree
(r,r−1) (Ravenel, Theorems 2.1.1 and 2.2.3); prove the pairing for ring
spectra (Ravenel, Theorem 2.3.3) and, for bounded-below X, strong
convergence to the homotopy of the HF_p-nilpotent completion, identified
for bounded-below X with G3.9's derived p-completion (Bousfield, §6,
Theorem 6.6), which is π_*(X)⊗ℤ_p when the homotopy groups of X are
finitely generated (Ravenel, Theorem 2.1.1(ii)); control
lim¹ and keep this completion distinct from p-localization.
TangentialBordism consumes these operations, algebras and towers.
*Needs:* AlgebraicTopology's ordinary cohomology with cup products, Stage
5.5's cohomological Serre spectral sequence and Stage 8.8–8.10's
Eilenberg–MacLane models, universal classes and representability;
GeneralizedCohomology G2's cofiber sequences, G2.7's HF_p, G3.8's Milnor
sequence and G3.9's derived p-completion. Hatcher, Miller, Ravenel,
Guillou–Weibel and Bousfield are cited sources, not suppliers.

**Checks.**
- On the degree-one class a of RP^∞, Sq¹a=a² and Sq²a=0, so an instability
  bound with strict inequality would lose the top square.
- At p=2, |ξ₂|=3 and |Q₁|=3, and at p=3, |ξ₁|=4, |τ₀|=1, |τ₁|=5 and
  |Q₁|=5; the Poincaré series of P_*⊗E_* at p=2,
  ∏(1−t^(2(2^i−1)))⁻¹·∏(1+t^(2^i−1)), equals that of A_*,
  ∏(1−t^(2^i−1))⁻¹, as the splitting A_*≅P_*⊗E_* requires.
- d₂ sends (s,t)=(1,2) to (3,3), lowering t−s from 1 to 0, not raising
  it.
- The Moore spectrum of ℤ/2^∞ has classical 2-completion zero but derived
  2-completion with π₁=ℤ₂, so the tensor form needs finite generation.

### 2.3 Quillen's theorem and the homotopy of MU (F2.3)

Construct the map L→MU_* from MU's orientation and prove it is an
isomorphism. Supply the complete coefficient proof from the Adams towers
above, owning their MU instances at every prime. Construct
H_*(MU;ℤ)=ℤ[b₁,b₂,…], |b_i|=2i, from G4's projective-bundle comparison
and G5.3–G5.4's Thom model with its Thom product, and H_*(MU;𝔽_p) with its
A_*-coaction; prove that the Thom class MU→HF_p induces a map of comodule
algebras H_*(MU;𝔽_p)→A_* with image P_* (Ravenel, Lemma 3.1.4), so that
H_*(MU;𝔽_p)≅C⊗P_* as left C-modules and P_*-comodules, for
C=𝔽_p□_(P_*)H_*(MU;𝔽_p), by the splitting of a comodule algebra that
maps onto the Hopf algebra (Ravenel, Corollary A1.1.18, which gives a
module and comodule isomorphism, not an algebra isomorphism; Lemma 3.1.7
states it as an A_*-comodule isomorphism); equivalently the Milnor
primitives annihilate the Thom class. For the ring structure, prove that
the Thom-class map kills the positive-degree part C⁺ of C, so that the
module isomorphism identifies H_*(MU;𝔽_p)/C⁺H_*(MU;𝔽_p) with P_*; lift
the polynomial generators of P_* (ξ_k at odd p, ξ_k² at p=2) to
H_*(MU;𝔽_p), so that by graded Nakayama the monomials in the lifts form a
C-basis and the multiplication map from C⊗𝔽_p[lifts] is an isomorphism of
algebras (not of comodules); comparing indecomposables and Poincaré
series, C is polynomial on generators u_i of degree 2i for i+1 not a
power of p (Ravenel, Lemma 3.1.7, p. 63); by the same count, since the
indecomposables of H_*(MU;𝔽_p)=𝔽_p[b₁,b₂,…] are spanned by b_i in degree 2i
and the algebra isomorphism embeds the indecomposables of C, each u_i is a
unit multiple of b_i modulo decomposables. Only the comodule isomorphism
enters the Ext computation: C has the trivial coaction, so
H_*(MU;𝔽_p)≅P_*⊗C≅A_*□_(E_*)C as A_*-comodules, and the change of rings
above gives Ext_(A_*)(𝔽_p,H_*(MU;𝔽_p))=Ext_(E_*)(𝔽_p,𝔽_p)⊗C (Ravenel,
Lemma 3.1.8 and its proof).
Prove the change-of-rings
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
MU_*MU≅MU_*[b₁,b₂,…], including grading and left/right units.

Construct the Landweber–Novikov operations from these cooperations, their
composition, Cartan, naturality and Thom/Gysin formulas, and their agreement
with coordinate changes. Supply duality/completion hypotheses for infinite
families; a graded dual is not an unqualified algebraic dual.
*Needs:* F2.2 (the HF_p-Adams towers, Milnor primitives and change of
rings); GeneralizedCohomology G4 (projective-bundle comparison) and
G5.3–G5.4 (Thom model of MU and Thom product); F1.2's pinned
`TauCeti.LazardRing.lift`, `TauCeti.LazardRing.mvPolynomialEquiv` and
Hopf-algebroid structure maps for the comparison with L and with
(L,L[b₁,b₂,…]).

**Checks.**
- Modulo decomposables h(x₁), h(x₂), h(x₃), h(x₄), h(x₅), h(x₆) are unit
  multiples of 2b₁, 3b₂, 2b₃, 5b₄, b₅, 7b₆, since 2, 3, 4, 5, 7 are prime
  powers and 6 is not.
- π₂MU=ℤ on x₁ and π₄MU=ℤ² on x₁², x₂, while a wrong collapse argument
  allowing odd t−s would have to account for π₁MU=π₃MU=0.
- In the normalization in which the total Landweber–Novikov operation
  sends the orientation x to x+Σt_ix^(i+1), the form of F1.2's
  `TauCeti.FormalCoordinate.universalStrictCoordinate` under t_i↦b_i,
  s_(1)(x)=x², and by multiplicativity s_(1)(x²)=2x³, the coefficient of
  t₁ in (x+t₁x²+⋯)², not x⁴; normalizing by the inverse series instead
  gives s_(1)(x)=−x², which is why the comparison with coordinate changes
  fixes the normalization.

### 2.4 Unoriented coefficients (F2.4)

Own Thom's computation of π_*MO
homotopically. From G5.3–G5.4's Thom model of MO, G4.3's Thom isomorphism
and CharacteristicClasses C3's `H^*(BO(n);𝔽₂)=𝔽₂[w₁,…,w_n]` with the
Whitney formula, identify H^*(MO;𝔽₂) with the free H^*(BO;𝔽₂)-module on
the Thom class U, and H_*(MO;𝔽₂)=𝔽₂[a₁,a₂,…], |a_i|=i, as an algebra
under the Thom product. Prove that the Steenrod algebra A acts freely on U
through degree n on MO(n): restriction along the zero section sends U to
w_n, and restriction along (RP^∞)^n→BO(n) sends w_n to x₁⋯x_n, on which A
acts freely through degree n (Miller, Chapter 1, Theorem 12.1 and
Corollary 12.2). Hence
the Thom class MO→HF₂ induces a surjective map of A_*-comodule algebras
H_*(MO;𝔽₂)→A_*. Prove that H^*(MO;𝔽₂) is a free A-module (Miller,
Chapter 1, Theorem 12.3, by the Milnor–Moore freeness criterion for
A-module coalgebras, Proposition 10.4) and that H_*(MO;𝔽₂)≅P⊗A_* as left
P-modules and A_*-comodules, P=𝔽₂□_(A_*)H_*(MO;𝔽₂) the subalgebra of
comodule primitives, by the splitting of a comodule algebra that maps
onto the Hopf algebra (Ravenel, Corollary A1.1.18, a module and comodule
isomorphism, not an algebra isomorphism). From an A-basis construct the
additive comparison
MO→⋁_α Σ^(|α|)HF₂, an isomorphism in mod-2 cohomology; prove 2·id_MO
null through the ring unit since π₀MO=𝔽₂, so that the cofiber of the
comparison has bounded-exponent homotopy, and conclude by the stable
Hurewicz theorem on a lowest nonzero homotopy group that the comparison
is a stable weak equivalence (Miller, Chapter 1, Theorem 12.4). Prove that
the Hurewicz map π_*MO→H_*(MO;𝔽₂) is an injective ring map with image P.
For the ring structure of P: the Thom-class map kills the positive-degree
primitives, so the module isomorphism identifies
H_*(MO;𝔽₂)/P⁺H_*(MO;𝔽₂) with A_*; choose y_k∈H_(2^k−1)(MO;𝔽₂) mapping
to ξ_k, so that by graded Nakayama the monomials in the y_k form a
P-basis and the multiplication map P⊗𝔽₂[y₁,y₂,…]→H_*(MO;𝔽₂) is an
isomorphism of algebras (not a comodule map). Since H_*(MO;𝔽₂) is
polynomial on one generator in each positive degree, its indecomposables
are those of P together with one in each degree 2^k−1, and a
Poincaré-series count proves
`π_*MO=𝔽₂[x_d : d≥1, d≠2^k−1]` as a graded ring (Thom 1954, Chapitre IV,
which proves it; Miller, Chapter 1, Section 13, states it and omits the
proof). This ring is the MO_* of the Conner–Floyd
comparison below. TangentialBordism's geometric multiplication and its
manifold generators are matched against these x_d on its side and are
not inputs. *Needs:* GeneralizedCohomology G5.3–G5.4 (Thom model of MO
and Thom product) and G4.3 (Thom isomorphism); CharacteristicClasses C3;
F2.2 (Steenrod algebra, Milnor's dual and the comodule-algebra
splitting); AlgebraicTopology Stage 8.3's Hurewicz theorem with
GeneralizedCohomology G2.5's sphere/space comparison for the stable
Hurewicz step.

**Checks.**
- π₁MO=π₃MO=0 and π₂MO=𝔽₂ on x₂, since 1 and 3 are of the form 2^k−1.
- π₄MO has basis x₄, x₂², rank 2, where counting only indecomposables
  gives 1.
- In degree 5 the ranks of H_*(MO;𝔽₂), A_* and P are 7, 2 and 1, and the
  Künneth count 1·1+1·2+1·0+2·1+2·0+2·1=7 of A_*⊗P agrees, whereas
  replacing A_* by the polynomial algebra on all ξ_k and ξ_k² would
  overcount.

### 2.5 Real orientations and the exponent-two law (F2.5)

For a chosen real orientation use G4's RP∞ projective comparisons to
construct the real-line tensor Euler law F(x,y) in degree 1. Own the
two-variable real projective comparison: on RP^m×RP^n identify
E^* with E^*[x,y]/(x^(m+1),y^(n+1)), compatibly with restriction
and both Euler classes. Pass to RP∞×RP∞ through the two finite-stage
towers, proving surjective transition maps, the required lim¹ vanishing
and the completed graded E^*[[x,y]] comparison before defining F. Prove 2·1=0
and F(x,x)=0 from the square-triviality of the universal real line.
Identify the universal graded characteristic-2 formal-group ring with
[2]_F=0, which is F1's pinned `TauCeti.ExponentTwoLazardRing` (the
polynomial ring over 𝔽₂ on generators in the degrees other than 2^k−1,
with its graded lift), with MO_*, using F2.4's unoriented coefficient
ring and Quillen's unoriented operation proof
(Quillen 1969, Theorem 3), and prove the orientation/change-of-coordinate
universal property of MO.
TangentialBordism consumes these real formal laws; its geometric cycles
and manifold representatives are not inputs here. *Needs:*
GeneralizedCohomology G4 (real projective comparisons and Euler classes)
and G3.8 (Milnor sequence); F1.4's pinned `TauCeti.ExponentTwoLazardRing`,
`ExponentTwoLazardRing.lift` and `ExponentTwoLazardRing.gradedLift`; F2.4's
π_*MO.

**Checks.**
- For HF₂ with x_H=w₁ the real-line law is additive, since
  w₁(L⊗L′)=w₁(L)+w₁(L′); it satisfies 2·1=0 and F(x,x)=0.
- The law X+Y+XY over 𝔽₂ has F(x,x)=x²≠0, so it is not the law of any
  real orientation: F(x,x)=0 is forced by the triviality of L⊗L, and is
  the exponent-two condition [2]_F=0.
- `TauCeti.ExponentTwoLazardRing` has no generator in degree 1 (1+1=2 is
  a power of two) and one in degree 2 (2+1=3 is not), matching π₁MO=0 and
  π₂MO=𝔽₂ in F2.4.

### 2.6 Real-oriented theories, graded Eilenberg–MacLane models and the Conner–Floyd comparison (F2.6)

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
(−1)^(ab) are trivial mod 2.
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


Own a chosen natural Conner–Floyd
MO_*-module comparison
`MO_*(X,A)≃MO_*⊗_(𝔽₂)H_*(X,A;𝔽₂)`, compatible with the actual
relative boundary, suspension, wedge and external-product maps (Quillen
1969, Theorem 3, for the universality of the real law over MO_* on which
the algebraic classification above rests; Quillen 1971, Introduction, for
the comparison of unoriented cobordism with mod-2 cohomology; Miller,
Chapter 1, Theorem 12.4, for the additive splitting of MO that this
multiplicative comparison refines).
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
*Needs:* GeneralizedCohomology G2.4 (symmetric spectral model), G2.6 (true
homotopy groups) and G2.7 (HF₂ and module spectra); F2.2's dual Steenrod
algebra; F2.4's MO_* and F2.5's real laws; F1.4's pinned
`FormalGroup.exponentTwoExp` and `ExponentTwoLazardRing.lift`.

**Checks.**
- For R=𝔽₂ through the augmentation of MO_*, h_*(X,A)=H_*(X,A;𝔽₂) and
  HR=HF₂ with the additive law; the comparison h_*→HR_* is the identity.
- π_*HR=R with R_d in degree d: for R=MO_*, π₂HR=𝔽₂x₂, whereas the
  ungraded Eilenberg–MacLane spectrum of the underlying ring would put
  all of R in degree 0 and give π₂=0.
- For R=MO_* the Thom map MO→H(MO_*) induces the identity on
  coefficients, so the Conner–Floyd comparison gives
  MO_*(pt)=MO_*⊗H_*(pt;𝔽₂)=MO_*, and MO_*(RP²) has rank 1+1+1 over MO_*
  in degrees 0, 1, 2 from H_*(RP²;𝔽₂).

### Examples

- On the degree-one class a of RP^∞, Sq¹a=a² and Sq²a=0.
- π_*MO in degrees 0 to 5 is 𝔽₂, 0, 𝔽₂x₂, 0, 𝔽₂x₄⊕𝔽₂x₂², 𝔽₂x₅.
- π_*MU in degrees 0 to 4 is ℤ, 0, ℤx₁, 0, ℤx₁²⊕ℤx₂, and h(x₁) is a unit
  multiple of 2b₁ modulo decomposables.
- K-theory's law is F_K(x,y)=x+y+uxy for the Bott class u, and ordinary
  cohomology has the additive law.

### Dependencies

F1; AlgebraicTopology's ordinary cohomology, Stage 5.5, Stage 8.3 and
Stages 8.8–8.10; CharacteristicClasses C3; TopologicalKTheory's
Conventions; GeneralizedCohomology G2.4, G2.5, G2.6, G2.7, G3.8, G3.9, G4
(with G4.3) and G5.3–G5.4.

## Layer 3: F3. p-typical and Brown–Peterson theories

### 3.1 p-typicalization and Brown–Peterson theory (F3.1)

Prove that idempotents split in GeneralizedCohomology G2.4's stable
homotopy category: for an idempotent e of a spectrum X, the mapping
telescope eX of X→X→⋯ along e, formed as G3.4's cofiber of 1−shift on the
countable wedge of copies of X, has π_*(eX)=e·π_*X, the map X→eX and the
map eX→X induced by e on every stage compose to the identity of eX and to
e on X, and X≃eX∨(1−e)X (Bökstedt–Neeman, Proposition 3.2 and Remark
3.3, pp. 221–222, for a triangulated category with countable direct
sums). F6.3 uses the same splitting for Smith's idempotents.

For each prime p, construct the p-typicalization idempotent on MU_(p):
by Quillen's theorem and F1.5's Cartier coordinate change there is a
multiplicative self-map g of MU_(p), unique up to homotopy, whose effect
on the orientation is that coordinate change, and g is idempotent because
π_*(g)⊗ℚ is (Ravenel, Lemmas 4.1.13 and 4.1.15 and the proof of Theorem
4.1.12, pp. 111–112; Quillen 1969, Theorem 4, for the idempotent
operation and its values on the coefficients). Split it to obtain BP, an associative
homotopy-commutative ring spectrum and a retract of MU_(p) with
multiplicative retraction MU_(p)→BP (Ravenel, Theorem 4.1.12, p. 110).
Identify π_*BP with F1.5's ring V=ℤ_(p)[v₁,v₂,…], compatibly with
L⊗ℤ_(p)→V, and H_*(BP;𝔽_p) with P_* as an A_*-comodule algebra (Ravenel,
Theorem 4.1.12(ii)–(iii)). Pin the Hazewinkel generators of F1.5 in
BP_*, with their logarithm recursion and the conversion to Araki's
generators. Prove that BP_*BP is flat over BP_* and that
(BP_*,BP_*BP) is isomorphic as a Hopf algebroid to F1.5's (V,VT), so that
BP_*BP≅BP_*[t₁,t₂,…] represents strict isomorphisms of p-typical laws
(Ravenel, Theorem 4.1.19, p. 113, with Theorem 4.1.18 for the structure
maps). *Needs:* F2.3 (MU, MU_*MU and Quillen's theorem); F1.5's p-typical
theory (Cartier's theorem, V, its generators and (V,VT)); F2.2's P_* and
A_*; GeneralizedCohomology G3.9 (the p-localization MU_(p)), G2.4 (the
stable category, its coproducts and cofiber triangles) and G3.4 (the
telescope of a sequence of spectra as the cofiber of 1−shift).

**Checks.**
- At p=2, |v₁|=2 and |v₂|=6, so BP₂=ℤ_(2)v₁, BP₄=ℤ_(2)v₁² and
  BP₆=ℤ_(2){v₁³,v₂}, whereas π₄MU_(2) has rank 2 on x₁², x₂: the
  idempotent kills the generator x₂, as 2+1=3 is not a power of 2, and BP
  is a proper summand.
- Idempotent splitting on a two-term example: on X=S[1/2]∨S[1/2] the swap
  τ gives the idempotent e=(1+τ)/2, with e·π₀X the diagonal copy of
  ℤ[1/2] in ℤ[1/2]², so eX≃S[1/2] and X≃eX∨(1−e)X; the
  telescope along e, not the cofiber of e, is the summand: the cofiber of
  an idempotent e on X is (1−e)X∨Σ(1−e)X.
- Under π_*BP≅V the Hazewinkel recursion of F1.5 gives ℓ₁=v₁/p in
  BP_*⊗ℚ, where ℓ₁ is the image of the logarithm coefficient m_(p−1) of
  MU; at p=2, m₁=x₁/2 up to sign, so v₁ is the image of ±x₁.
- For the Hazewinkel generators η_R(v₁)=v₁+pt₁ in BP_*BP, from
  η_R(ℓ₁)=ℓ₁+t₁ (Ravenel, Theorem A2.1.27(iv)) and v₁=pℓ₁; for Araki's,
  η_R(v₁)=v₁+p(1−p^(p−1))t₁. Either way v₁ is primitive modulo p but not
  integrally; a right unit equal to the left unit would make every ideal
  invariant in F5.1.

### 3.2 The height-n Honda law (F3.2)

For 1≤n<∞ define the height-n Honda law H_n
over 𝔽_p as the p-typical law classified by the ring map V→𝔽_p, V the
ring of F1.5's p-typical theory, with
v_n↦1 and v_i↦0 for every i≠n, Ravenel's standard law F_n (Definition
A2.2.11, p. 367), and H_∞ as the additive law; over an 𝔽_p-algebra, in
particular 𝔽_(p^m), it is the base change. Hazewinkel's and Araki's
generators are congruent modulo p (Ravenel,
Theorem A2.2.3, p. 364), so the two choices classify the same law over
𝔽_p. The definition is formal-group algebra and uses no spectrum; F3.1's
isomorphism π_*BP≅V makes H_n the law of the ring map BP_*→𝔽_p. Its API:

- the p-series is [p]_(H_n)(x)=x^(p^n): Araki's formula
  [p]_F(x)=Σ^F_(i≥0) v_i x^(p^i), v₀=p (Ravenel, (A2.2.4), p. 364),
  specializes to its single term with i=n; hence H_n has height n
  (Ravenel, Definition A2.2.8) and `FormalGroup.height` of its underlying
  law is n;
- over a separably closed field of characteristic p every commutative
  law of height n is isomorphic to H_n, by F1's classification.

*Needs:* F1.5's p-typical theory (V with its universal p-typical law,
the two families of generators and the p-series formula); Mathlib
`FormalGroup` and the pinned `FormalGroup.height`; F1.5's classification
for the second API bullet.

**Checks.**
- At n=1 the p-series is x^p, which is also the p-series (1+x)^p−1=x^p
  of the multiplicative law X+Y+XY over 𝔽_p (Ravenel, Example
  A2.2.10(ii)): both laws have height 1, so by F1's classification they
  become isomorphic over a separable closure of 𝔽_p.
- Classifying v_n↦u for a unit u≠1 gives p-series u·x^(p^n), still of
  height n: the height does not detect this normalization, and v_n↦1 is
  what makes the p-series exactly x^(p^n).
- Classifying v_n↦1 and v_(n+1)↦1, the other v_i↦0, gives p-series
  x^(p^n)+_F x^(p^(n+1)), again of height n but a different law; the
  condition v_i↦0 for every i≠n, not only for i<n, pins H_n.

### 3.3 BP⟨n⟩, E(n), K(n) and the Adams summands (F3.3)

Build BP⟨n⟩ and E(n) for n≥0, with the specified ordered spectral
cofibres by v_(n+1),v_(n+2),… and, for n≥1, E(n) the telescope of
BP⟨n⟩ along multiplication by v_n, with π_*BP⟨n⟩=ℤ_(p)[v₁,…,v_n] and the
cofibre sequences `Σ^(2p^n−2)BP⟨n⟩ --v_n→ BP⟨n⟩ → BP⟨n−1⟩` (Ravenel,
Section 4.2, p. 116). Define E(0)=Hℚ.
Prove the homotopy groups, canonical maps, connective-cover comparisons
and the homotopy-associative products needed for F4.6's Hopf rings. Construct
and compare the products on the iterated cofibres, with their actual
p=2 noncommutativity/choice qualifications; no coherent BP-module
category is presumed before an A∞ model is constructed. Do not
assert an E∞ structure on BP or every BP⟨n⟩. Include BP⟨0⟩≃Hℤ_(p), and ku_(2)≃BP⟨1⟩. Construct Morava
K(n) for n≥1 from the specified p,v_i (i≠n) cofibres and the
v_n-telescope of the connective k(n), with coefficients F_p[v_n,v_n⁻¹],
exact sequence and homology/detection APIs (Ravenel, Section 4.2,
pp. 116–117, for k(n), K(n), their coefficients and the cofibre sequence
`Σ^(2p^n−2)k(n) --v_n→ k(n) → H𝔽_p`); its homotopy product is not
asserted E∞.
For odd p, construct the Adams summand BP⟨1⟩ comparison with connective
complex K-theory and the p−1 summands
ku_(p)≃∏_(i=0)^(p−2) Σ^(2i)BP⟨1⟩ (Adams, *Lectures on generalised
cohomology*, Lecture 4, for the splitting of p-local K-theory; Ravenel,
Section 1.5, p. 33, states the p−1 summands of ku_(p), Section 4.2,
pp. 116 and 118, that BP⟨1⟩ is a summand of ku_(p) and E(1) of KU_(p),
and Section 3.1, p. 66, that ko is a summand of ku at odd primes). Prove Bott's cyclic action between
the factors, including v₁ on the last return. Include the i=0 summand.
Construct ko_(p)≃⋁_(i=0)^((p−3)/2)Σ^(4i)BP⟨1⟩ for odd p by
real/complex K comparison and conjugation, preserving its Bott action
and actual connective-cover maps. StringOrientation consumes this splitting
for its own space-level splitting of BO⟨d⟩_(p). The API of these spectra:

- π_*BP⟨n⟩=ℤ_(p)[v₁,…,v_n], connective with π₀=ℤ_(p), and
  π_*E(n)=ℤ_(p)[v₁,…,v_(n−1),v_n^(±1)], periodic of period
  |v_n|=2(p^n−1), with BP→BP⟨n⟩→E(n) inducing the quotient by
  (v_(n+1),v_(n+2),…) and the inversion of v_n on coefficients;
- π_*K(n)=𝔽_p[v_n^(±1)], and K(n) is the v_n-localization of the
  connective k(n), whose coefficients are 𝔽_p[v_n].

*Needs:* F3.1; GeneralizedCohomology G2.4 (cofibers), G3.4 (the
telescopes of BP⟨n⟩ and k(n) along v_n), G3.9 (p-localization of ku, ko,
KU and KO), G3.8 (connective covers), G4.5 (complex orientations) and G5.4
(KU, KO and their connective covers ku, ko).

**Checks.**
- n=0: BP⟨0⟩≃Hℤ_(p) has π_*=ℤ_(p) in degree 0, and E(0)=Hℚ has π_*=ℚ in
  degree 0, the localization of ℤ_(p) at v₀=p; a definition of E(0) as
  v₀⁻¹BP would instead keep every v_i.
- At p=2, BP⟨1⟩≃ku_(2) with v₁ the Bott class in degree 2=2(2−1),
  E(1)≃KU_(2) and K(1)≃KU/2; at odd p the Adams splitting gives
  KU/p≃⋁_(i=0)^(p−2)Σ^(2i)K(1), and π_*K(1) is nonzero exactly in the
  degrees divisible by 2(p−1).
- Killing only v_(n+1) leaves π_*(BP/v_(n+1))=ℤ_(p)[v₁,…,v_n,v_(n+2),…],
  so every higher generator must be killed; and inverting v_n is what
  makes E(n) periodic: π_(−|v_n|)BP⟨n⟩=0 while v_n⁻¹∈π_(−|v_n|)E(n).
- K(n)∧H𝔽_p≃0 for 1≤n<∞: H_*(K(n);𝔽_p) is the colimit of the groups
  H_*(Σ^(−j|v_n|)k(n);𝔽_p) along H_*(v_n), which is zero because v_n has
  positive degree and acts by zero on mod-p homology (the same argument
  as for BP⟨j⟩ in F6.3), whereas the unlocalized k(n) has nonzero mod-p
  homology.

### Examples

- The height-n Honda law has p-series x^(p^n); at n=1 it shares the
  p-series x^p with the multiplicative law over 𝔽_p.
- At p=3, ku_(3)≃BP⟨1⟩∨Σ²BP⟨1⟩, and ko_(3)≃BP⟨1⟩, the single summand
  i=0 of ⋁_(i=0)^((p−3)/2)Σ^(4i)BP⟨1⟩.
- At p=2, K(1)≃KU/2 and E(1)≃KU_(2).

### Dependencies

F1 (F1.5's p-typical theory, used by F3.1 and F3.2; F3.2 needs nothing
from F2) and F2 (MU, its orientation and cooperations, and F2.2's P_*
and A_*, used by F3.1); GeneralizedCohomology G2.4 (the
stable category and cofibers), G3.4 (telescopes of spectra), G3.9
(p-localization), G3.8 (connective covers), G4.5 (complex orientations)
and G5.4 (KU, KO, ku and ko).

## Layer 4: F4. Comodules and Adams–Novikov comparisons

### 4.1 Three-fold Toda brackets (F4.1)

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
circle coordinates of S¹∧S¹, of degree −1. Construct the passage
of these brackets through suspension and G2.5's sphere/space comparison
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
ordinary stable brackets. *Needs:* pointed CW complexes and their
homotopy classes from AlgebraicTopology; GeneralizedCohomology G2.4
(strict associative ring spectra and transferred module model structures)
and G2.5 (sphere/space comparison); Toda is a cited source.

**Checks.**
- The swap of the two circle factors of S² has degree (−1)^(1·1)=−1, so
  reading the two suspension constructions as the same map is wrong.
- Stably ⟨2,η,2⟩=η² in π₂^s=ℤ/2 with indeterminacy 2π₂^s+π₂^s·2=0, so a
  bracket convention that makes every bracket with a repeated entry vanish
  is wrong.
- ⟨η,η,2⟩ is empty: η∘2=2η=0 in π₁^s=ℤ/2, but η∘η=η²≠0 in π₂^s, and the
  bracket needs both adjacent composites null; a definition requiring only
  one of them would produce a value.

### 4.2 Higher Toda operations (F4.2)

Construct higher Toda operations for every finite arity r≥3 in these
same enriched stable spectral and right-module models, and in supplied
stable symmetric monoidal models with the corresponding derived mapping
spaces. Construct the operations before passage to the triangulated
homotopy category. For X_r→⋯→X_0 use coherent
iterated-cofiber defining systems with value in [Σ^(r−2)X_r,X_0],
comparing with Carrick–Davies–van Nigtevecht Definitions 3.3 and 3.7 on Picard
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
full outer indeterminacy. Include the forms in Bauer Lemma 8.6 and
Corollary 8.7 as applications in EllipticCohomology, not additional generic
definitions. A ring map carries a
chosen system and its value to the image system and value; lifting a
bracket requires lifting its coherent system, not just its entries.
*Needs:* F4.1's models and triple convention; GeneralizedCohomology G2.4
and G2.11 (enriched stable models and derived mapping spaces);
Carrick–Davies–van Nigtevecht is a cited source.

**Checks.**
- At r=3 the value degree Σ_i|a_i|+r−2 is Σ_i|a_i|+1, the degree of
  F4.1's ⟨a,b,c⟩; a convention adding r−1 would put ⟨2,η,2⟩ in π₃^s
  instead of π₂^s∋η².
- The fourfold bracket ⟨2,η,2,η⟩ has no defining system although every
  adjacent product 2η and η·2 vanishes: its inner triple ⟨2,η,2⟩={η²} does
  not contain zero. So adjacent vanishing is not a defining system.
- For a four-term system the value lies in [Σ²X₄,X₀], in stem
  Σ_i|a_i|+2 for ring classes: ⟨a₁,a₂,a₃,a₄⟩ of four classes of stem 0 has
  stem 2, as for r=4 in the formula.

### 4.3 Comodules and the Adams–Novikov spectral sequence (F4.3)

Develop graded comodules over the flat MU and BP Hopf algebroids, cofree
comodules, the normalized cobar complex, Ext, change of rings and base
change. Construct their graded tensor category and internal Hom, and prove
that dualizable comodules are exactly those with finitely generated
projective underlying graded module (Hovey, *Homotopy theory of comodules
over a Hopf algebroid*, Proposition 1.3.4, p. 10, for a flat Hopf
algebroid; it is stated without grading, and its proof, finite
presentation because the internal Hom out of a dualizable comodule
preserves colimits and then projectivity by faithful flatness of Γ,
applies to graded comodules unchanged). Build their evaluation/coevaluation,
dual coaction and tensor-Hom comparisons. Prove the Adams generation
hypotheses used in EllipticCohomology E4.A's separately constructed Hovey stable model:
(MU_*,MU_*MU) and (BP_*,BP_*BP) are Adams Hopf algebroids, so the
dualizable comodules generate (Hovey, same paper, Proposition 1.4.4 and
Lemma 1.4.6, p. 12, with Theorem 1.4.7, p. 13, for the topological
flatness of MU and the proof of Proposition 1.4.8, p. 13, for that of
BP); this
comodule API does not itself identify that model with an ordinary derived
category. Construct the actual MU/BP resolution of a spectrum by iterated
unit/cofiber maps, its exact couple and Adams–Novikov spectral sequence
(Ravenel, Theorem 2.2.3, p. 50, for the spectral sequence of an
E_*-Adams resolution).
For the BP version, prove E₂^(s,t)=Ext_(BP_*BP)^(s,t)(BP_*,BP_*X)
(Ravenel, Theorem 4.4.1(i), p. 132)
using BP_*BP's proved flatness and the comodule cobar comparison,
with the completion/convergence hypotheses below; do not add an
unnecessary flatness hypothesis on BP_*X. *Needs:* F2.3's (MU_*,MU_*MU)
and F3.1's (BP_*,BP_*BP) with their flatness; GeneralizedCohomology G2.4
(cofiber sequences and smash products).

**Checks.**
- E₂^(0,*)=Ext⁰_(BP_*BP)(BP_*,BP_*)=ℤ_(p) in degree 0 (Ravenel, Theorem
  4.3.2(ii)), matching π₀S_(p)=ℤ_(p).
- At odd p, t₁ is primitive (Δt₁=t₁⊗1+1⊗t₁), so [t₁] is a class
  α₁∈Ext^(1,2p−2), in stem 2p−3; at p=3 it is in stem 3, where
  π₃S_(3)=ℤ/3.
- BP_*/p is finitely presented, by BP_*→BP_* multiplication by p, but its
  underlying module is not projective, so it is not dualizable; a
  definition by finite presentation instead of finitely generated
  projective modules would wrongly make it dualizable.

### 4.4 Convergence and the BP-homology Atiyah–Hirzebruch spectral sequence (F4.4)

Construct the filtration on the appropriate completion of π_(t−s)X,
edge/Hurewicz maps, multiplicative and naturality laws, lim¹ obstruction,
and conditional/strong-convergence criteria. Prove convergence to X_(p) for bounded-below X in the BP-based
p-local Adams tower: the augmentation fibre of S_(p)→BP is
positive-connective, so its iterated smash powers with X have connectivity
tending to infinity (Ravenel, Theorem 4.4.1, p. 132: the E₂-term
Ext_(BP_*BP)(BP_*,BP_*X) and, for connective p-local X, convergence to
π_*X with the filtration by factorizations into maps that vanish after
smashing with BP). Prove the resulting tower limit and strong
convergence criteria rather than merely labelling it a completion.
Construct the BP/p-based nilpotent tower separately and identify its
limit with derived p-completion for bounded-below finite-type X,
using G3's derived completion and Milnor exact sequence. For spectra
outside those hypotheses retain the actual nilpotent tower limit and
its conditional-convergence statement. Ordinary p-localization and
p-completion are distinct. Build the AHSS for
BP-homology from the cellular filtration of G2.4's CW-spectrum approximation and prove its corresponding
convergence and extension criteria (Adams, *Stable Homotopy and
Generalised Homology*, Part III, Section 7, the reference Ravenel gives
for this spectral sequence in the proof of Lemma 4.1.4, p. 107). Supply the free/even/comodule comparisons
used in StringOrientation's Hovey calculation. F2's HF_p-based Adams tower is a
different tower from this BP-based one; neither is substituted for the
other. *Needs:* F4.3; GeneralizedCohomology G2.4 (CW-spectrum
approximation and cellular filtration), G3.8 (Milnor sequence) and G3.9
(derived p-completion); F3.1's BP.

**Checks.**
- For X=S the BP-based tower converges to S_(p), with π₀=ℤ_(p), while the
  BP/p-based tower converges to the p-completion, with π₀=ℤ_p≠ℤ_(p): the
  two limits differ.
- The fibre F of S_(p)→BP has π_iF=0 for i≤0, from π₀S_(p)≅π₀BP=ℤ_(p) and
  π₁BP=0, so F^(∧s) is (s−1)-connected and the connectivity of the tower
  terms tends to infinity.
- For CP^n the BP-homology Atiyah–Hirzebruch spectral sequence has
  E²=H_*(CP^n;BP_*) in even total degrees only and collapses, so
  BP_*(CP^n) is free on n+1 classes; for the Moore spectrum S/p it gives
  BP_*/p in filtration 0, as Tor(ℤ/p,BP_*)=0.

### 4.5 Massey and Toda comparisons on cobar complexes (F4.5)

Consume DGAInfinity Layer 8’s matric/higher Massey defining systems over
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
displayed Moss Theorem 3.16 is threefold. Lemma 3.9 and Propositions 3.14–3.15
give the forward exact-functor and truncation comparisons; they do not
assert a Massey-to-Toda converse for arbitrary arity. *Needs:* DGAInfinity
Layer 8; F4.2's defining systems; F2.2's HF_p-based towers and F4.3's
MU/BP cobar complexes and Adams–Novikov tower.

**Checks.**
- In the cobar complex of A_* at p=2, h₀=[ξ₁] and h₁=[ξ₁²] satisfy
  d[ξ₂]=[ξ₁²|ξ₁] and d[ξ₂+ξ₁³]=[ξ₁|ξ₁²], and the Massey value
  [ξ₂+ξ₁³|ξ₁]+[ξ₁|ξ₂] differs from h₁²=[ξ₁²|ξ₁²] by d[ξ₁ξ₂]; so
  ⟨h₀,h₁,h₀⟩=h₁² with zero indeterminacy (Ext^(1,3)=0), the class
  detecting F4.1's ⟨2,η,2⟩=η².
- Likewise ⟨h₁,h₀,h₁⟩ has value [ξ₂|ξ₁²]+[ξ₁²|ξ₂+ξ₁³], which differs from
  h₀h₂=[ξ₁|ξ₁⁴] by d[ξ₁²ξ₂]+d[ξ₁⁵]; it is nonzero, consistent with
  ⟨η,2,η⟩, for which juggling gives 2⟨η,2,η⟩=⟨2,η,2⟩η=η³≠0.
- A threefold Massey product of classes in Ext^(s_i,t_i) lies in
  Ext^(s₁+s₂+s₃−1,t₁+t₂+t₃), so its stem is the sum of the stems plus 1,
  matching the Toda value degree: ⟨h₀,h₁,h₀⟩ lies in (2,4), stem 2.

### 4.6 Ω-spectrum spaces and Hopf rings (F4.6)

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
StringOrientation. Run F4.4's BP-homology Atiyah–Hirzebruch spectral
sequence, built from the cellular filtration of G2.4's CW-spectrum
approximation, on the suspension spectra of these spaces, and prove its
collapse and extension
identifications; cellular ranks alone do not determine the ring
(Wilson, Part II, Corollary 5.1, for the torsion-free polynomial
p-local homology of BP⟨1⟩_m when m<2p+2, and Ravenel, Section 4.2,
pp. 116 and 119, for Wilson's splitting of the spaces BP⟨n⟩_k in his
range and the torsion-free homology of the spaces of BP; Hovey, Theorem
1.2, for the BP-homology polynomial generators when m is even and m<2p
or m=2p, and Corollary 1.6 and Theorem 1.7 for the relations and the
presentation at m=2p+2).
*Needs:* F3.3; AlgebraicTopology Stages 8.8–8.10 (Eilenberg–MacLane
models); F4.4's BP-homology Atiyah–Hirzebruch spectral sequence.

**Checks.**
- The spaces of an Ω-spectrum satisfy π_i(BP⟨n⟩_k)=π_(i−k)BP⟨n⟩ for
  i≥0: at odd p, BP⟨1⟩_2 has homotopy ℤ_(p) exactly in the degrees
  2+j(2p−2), j≥0, the first two coming from 1 and v₁; the opposite shift
  would put the class of v₁ in the negative degree 2−(2p−2).
- BP⟨0⟩_k=K(ℤ_(p),k), so BP⟨0⟩_2≃(CP^∞)_(p) has torsion-free homology,
  one ℤ_(p) in each even degree.
- At p=2, BP⟨0⟩_3=K(ℤ_(2),3) has 2-torsion in H_5: ι₃² is an integral
  class of order 2 (graded commutativity in odd degree) whose mod-2
  reduction Sq³ι₃=ι₃² is nonzero, so H^6 has 2-torsion and, by the
  universal coefficient theorem, so does H_5; torsion-freeness therefore
  holds only in Wilson's degree range and is not asserted for all k.

### Examples

- Stably ⟨2,η,2⟩=η² in π₂^s=ℤ/2, with indeterminacy 2π₂^s+π₂^s·2=0.
- The swap of the two circle factors of S¹∧S¹ has degree −1, the sign in
  Σ⟨f,g,h⟩⊂−⟨Σf,Σg,Σh⟩.
- In the Adams–Novikov spectral sequence d_r has bidegree (r,r−1), so d₂
  lowers the stem t−s by one.
- BP⟨0⟩_2≃(CP^∞)_(p) has one ℤ_(p) in each even degree of homology, while
  at p=2 the space BP⟨0⟩_3=K(ℤ_(2),3) has H_5 of order 2, outside Wilson's
  torsion-free range.

### Dependencies

F2 (HF_p- and MU-Adams towers, MU_*MU) and F3 (BP and BP_*BP, and
BP⟨n⟩ for F4.6); GeneralizedCohomology G2.4, G2.5, G2.11 and G3;
DGAInfinity Layer 8; AlgebraicTopology's pointed CW complexes and
homotopy classes, and its Stages 8.8–8.10 for F4.6.

## Layer 5: F5. Exact functors, deformations and elliptic inputs

### 5.1 Invariant prime ideals (F5.1)

For each prime p use F3's graded flat Hopf algebroid
(A,Γ)=(BP_*,BP_*BP). First construct the primitive and invariant
calculations on which the classification rests: η_R(v_n)≡v_n modulo
I_n=(p,v₁,…,v_(n−1)) and Ext⁰_Γ(A,A/I_n)=𝔽_p[v_n] for finite n≥1, with
Ext⁰_Γ(A,A)=ℤ_(p) and invariants 𝔽_p at height ∞ (Ravenel, Theorem
4.3.2(ii), pp. 120–121, with its proof). Define invariance of a homogeneous ideal through
its coaction, equivalently the equal extension of the two unit maps to Γ,
and prove the equivalence of these formulations. Classify its homogeneous
invariant prime ideals as I₀=(0), I_n=(p,v₁,…,v_(n−1)) for finite n≥1,
and I_∞=(p,v₁,v₂,…). Prove primality, invariance, distinctness,
their strict inclusion order and the quotient presentations, including
A/I_∞=𝔽_p. The homogeneity hypothesis is essential: the ungraded
invariant prime (p,v₁−1), using η_R(v₁)=v₁+p t₁, is not in this list.
Compare these ideals under the chosen p-typical coordinate changes.
*Needs:* F3.1's Hopf algebroid (BP_*,BP_*BP), which is F1.5's (V,VT)
with its right-unit formulas; the calculations of this section are
statements about (V,VT) and use no other property of BP.

**Checks.**
- v₁ is primitive modulo p, since η_R(v₁)=v₁+pt₁, so 𝔽_p[v₁] lies in
  Ext⁰_Γ(A,A/I₁); v₂ is not, since η_R(v₂)≡v₂+v₁t₁^p−v₁^p t₁ modulo p.
- I₁=(p) is invariant because η_R(p)=p, and A/I₁=𝔽_p[v₁,v₂,…] is a
  domain, so I₁ is prime; a definition of invariance that tested only the
  left unit would accept every ideal, since η_L is the inclusion of A in
  Γ=A[t₁,t₂,…] and η_L(I)Γ=IΓ always.
- (p,v₂) is a homogeneous prime ideal that is not invariant: by the
  right-unit congruence η_R(v₂)≡v₂+v₁t₁^p−v₁^p t₁ modulo p (Ravenel,
  proof of Theorem 4.3.2, p. 121), and v₁t₁^p−v₁^p t₁ is not in
  (p,v₂)Γ; so homogeneity and primality alone do not make an ideal
  invariant, which is why the classification lists exactly the I_n.
- (v₁) is homogeneous and prime, A/(v₁)=ℤ_(p)[v₂,v₃,…], but not
  invariant, since η_R(v₁)=v₁+pt₁ and pt₁∉(v₁)Γ; the inclusions
  I_n⊊I_(n+1) are strict because v_n is a nonzero element of
  A/I_n=𝔽_p[v_n,v_(n+1),…] for n≥1 and p≠0 in A/I₀=A.

### 5.2 Primitives and the Landweber filtration (F5.2)

Using F5.1's classification of the invariant primes, for a nonzero
graded comodule with finitely presented underlying A-module, construct a
nonzero primitive and the invariant-annihilator comparison. Use the
bounded-below grading and finite coaction of its generators; prove the
finite-polynomial-stage descent of a module presentation and coaction.
Prove Landweber filtration for these comodules: construct a finite
filtration by graded subcomodules with subquotients Σ^d A/I_n, d∈ℤ
and n finite, including n=0 (Landweber 1976, for comodules over
BP_*BP, in the form stated in Ravenel, Section 4.2, p. 118, and in
Ravenel, *Nilpotence and Periodicity*, (B.5.19), p. 182; the MU form is
Theorem 3.3.7, p. 33, there). Prove termination over the descended finite
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
*Needs:* F3.1's Hopf algebroid; F5.1 (the ideals I_n, their
classification and Ext⁰_Γ(A,A/I_n)); F4.3's comodules, dualizable
comodules and Adams generation; GeneralizedCohomology G2.4 for the
finite-cell presentations of spectra.

**Checks.**
- (p,v₁²) is invariant, since η_R(v₁²)≡v₁² modulo p, and A/(p,v₁²) has
  the Landweber filtration 0⊂v₁A/(p,v₁²)⊂A/(p,v₁²) by subcomodules (v₁
  being primitive modulo p), with subquotients Σ^(2p−2)A/I₂ and A/I₂,
  because multiplication by v₁ is injective on the domain
  A/I₁=𝔽_p[v₁,v₂,…]; so a factor can carry the nonzero shift
  d=|v₁|=2p−2, which a filtration with unshifted factors would not allow.
- A/(p²) is a comodule, η_R(p²)=p², with Landweber filtration
  0⊂pA/p²A⊂A/p², both subquotients A/I₁; the filtration factors are
  shifts of A/I_n with n finite, as stated.
- A/I_∞=𝔽_p is not finitely presented, its only subcomodules are 0 and
  itself, and the union of its finitely presented subcomodules is 0: the
  filtered presentation must be a colimit of comodules mapping to it, not
  a union of subcomodules.

### 5.3 The p-typical comparison and the invariant primes of the Lazard ring (F5.3)

Construct the actual p-typical Hopf-algebroid comparison, through which
F5.4 transports the exactness criterion to MU and the classification of
F5.1 passes to the Lazard ring. Construct the weak equivalence between the
MU_(p) cooperation groupoid and (A,Γ) using F3's strict p-typicalization,
its extension/descent comodule functors, unit/counit and finite-presentation
comparisons. Take the height ideals I_(p,n) in MU_(p)* as the pinned
`FormalGroup.heightIdeal` (F1) of its chosen formal group, invariant under
coordinate change by `heightIdeal_smul`, and compare them with the
p-typical ideals. Prove independence of lifts of v_i modulo preceding
height ideals and of the specified coordinate changes. This identifies
the criterion on an MU_*-module without pretending the quotient
MU_(p)*→BP_* is a flat map of coefficient rings. *Needs:* F3.1's
p-typicalization and BP_*BP; F2.3's MU_*MU; the pinned
`FormalGroup.heightIdeal`, `heightIdeal_smul` and
`FormalGroup.heightIdeal_eq_span`.

**Checks.**
- I_(p,1) in MU_(p)* is (p), by `FormalGroup.heightIdeal_one`, and maps to
  I₁=(p) in BP_*.
- At p=2, [2](X)=2X+a₁₁X²+⋯ for the universal law, so v₁ is the class of
  a₁₁ in degree 2, which maps to v₁∈BP₂ modulo I₁ under the p-typical
  comparison.
- At odd p, x₁ maps to 0 in BP₂=0, while multiplication by x₁ is
  injective on the domain MU_(p)*: the quotient MU_(p)*→BP_* is not flat,
  which is why the comparison is a weak equivalence of Hopf algebroids and
  not a flat base change.

Prove Landweber's classification on the Lazard Hopf algebroid
(L,L[b₁,b₂,…]) of F1, at all primes at once: for a homogeneous ideal I of
the pinned `TauCeti.LazardRing` for `LazardRing.grading`, I is prime and
invariant, that is, its extensions along the right unit
`LazardRing.rightUnit` and along the left unit `MvPolynomial.C` agree,
exactly when there is a prime p such that I is a height ideal
I_(p,n)=`FormalGroup.heightIdeal p n` of `LazardRing.formalGroup` for some
n≥0, with I_(p,0)=0, or their union I_(p,∞)=`⨆ n, heightIdeal p n`
(`isPrime_and_invariant_iff_eq_heightIdeal`; Ravenel, Theorem 1.3.16(i) and
(iv), p. 17, which state it for L, and Theorem 4.3.2(iv), p. 121, with its
proof, for BP_*). Invariance of each I_(p,n) is the pinned
`TauCeti.LazardRing.map_rightUnit_heightIdeal`, and
I_(p,n)=(p,v₁,…,v_(n−1)), v_i the coefficient of X^(p^i) in [p], is the
pinned `FormalGroup.heightIdeal_eq_span`. A route: a homogeneous invariant
prime I meeting ℤ in 0 lies in positive degrees, and the strict coordinate
change by the logarithm over L⊗ℚ (F1's `FormalGroup.log`) carries the
universal law to the additive law, classified by the augmentation, which
kills positive degrees; comparing the two units along it gives I⊗ℚ=0, so
I=0 because L is torsion-free. If I meets ℤ in (p), it contains I_(p,1)=(p);
if it properly contains I_(p,n) for a finite n≥1, its lowest-degree
homogeneous element outside I_(p,n) is invariant modulo I_(p,n), hence a
nonzero multiple of a power of v_n, because the invariants of
L/I_(p,n) under (L,L[b₁,b₂,…]) are 𝔽_p[v_n] (Ravenel, Theorem
1.3.16(iii)), and primality puts v_n in I. If I contains
I_(p,∞), the same comparison over L/I_(p,∞), where [p]=0 and the pinned
`FormalGroup.existsUnique_logarithm_of_nsmulSeries_eq_zero` gives a strict
coordinate change to the additive law, shows I=I_(p,∞). Unlike
BP_*/I_∞=𝔽_p, the quotient L/I_(p,∞) is a polynomial ring over 𝔽_p on
generators in the degrees 2i with i+1 not a power of p, so I_(p,∞) is not
maximal and the last step needs this argument instead of maximality.
*Needs:* the pinned `TauCeti.LazardRing`, `LazardRing.grading`,
`LazardRing.rightUnit`, `LazardRing.formalGroup`, `FormalGroup.heightIdeal`,
`TauCeti.LazardRing.map_rightUnit_heightIdeal` and
`FormalGroup.heightIdeal_eq_span`; Mathlib `Ideal.IsHomogeneous`,
`Ideal.map` and `MvPolynomial.C`; for the route, the pinned polynomial
theorem `TauCeti.LazardRing.mvPolynomialEquiv`, `FormalGroup.log`,
`FormalGroup.existsUnique_logarithm_of_nsmulSeries_eq_zero` and
`TauCeti.LazardRing.coordinateChangeLift`, and the invariants
𝔽_p[v_n] of L/I_(p,n) under (L,L[b₁,b₂,…]), from F5.1's
Ext⁰_Γ(A,A/I_n)=𝔽_p[v_n] through the p-typical comparison above.

**Checks.**
- At p=2, [2](X)=F(X,X)=2X+a₁₁X²+2a₁₂X³+⋯, so `heightIdeal 2 1`=(2) and
  `heightIdeal 2 2`=(2,a₁₁), with v₁=a₁₁; both are listed, and both are
  prime, since a₁₁ spans L in degree 2, so that L/(2)≅𝔽₂[x₁,x₂,…] and
  L/(2,a₁₁)≅𝔽₂[x₂,x₃,…] are domains.
- (a₁₁) is homogeneous and prime, L/(a₁₁)≅ℤ[x₂,x₃,…], but not invariant:
  for the action φ•F=φ(F(φ⁻¹X,φ⁻¹Y)) of `CoordinateChange.Basic` and the
  universal strict coordinate φ=X+Σb_iX^(i+1), the XY coefficient of φ•F
  is a₁₁+2b₁, so η_R(a₁₁)=a₁₁+2b₁, and 2b₁ is not in (a₁₁)L[b₁,b₂,…]; a
  classification that admitted every homogeneous prime generated by
  coefficients of [p] would wrongly list it.
- (2,a₁₁−1) is prime, L/(2,a₁₁−1)≅𝔽₂[x₂,x₃,…], and invariant, since
  η_R(a₁₁−1)=a₁₁−1+2b₁ lies in its extension and the conjugation exchanges
  the two units, but it is not homogeneous and is not in the list: the
  homogeneity hypothesis cannot be dropped.
- n=0 gives `heightIdeal p 0`=⊥ for every prime p, and ⊥ is prime because
  L is a polynomial ring over ℤ; (4) is homogeneous and invariant but not
  prime, and is correctly not listed.

### 5.4 Landweber's exact functor theorem (F5.4)

Prove Landweber's exact functor theorem for a graded MU_*-module M:
for every prime p, p and successive v_i act injectively on its successive
height quotients (Landweber 1976, Theorem 2.6; the statement, with the
reduction to Tor₁ against the filtration factors, is Ravenel, *Nilpotence
and Periodicity*, Theorem B.6.2 and Section B.6, pp. 182–183, and Ravenel,
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
prerequisites here; G3.1's cohomological Brown representability alone is not this
homology representability argument. Construct comparison maps and products when M is a graded
algebra, retaining their coherence hypotheses. Distinguish a
multiplicative represented theory from a specified commutative
spectral-ring realization. Prove the coordinate-independent criterion
and height-stratum flatness formulation used for elliptic curves.
*Needs:* F5.1–F5.3; F4.3's comodules and dualizable generators;
GeneralizedCohomology G2.4 (finite spectra, cofibers and filtered
colimits) and G5.1 (finite duality); G3.1 is consumed only for
cohomological representability, which this homology argument does not
replace.

**Checks.**
- M=ℤ through the classifying map of the additive law fails the
  criterion: p acts injectively on ℤ, but v₁ acts by zero on ℤ/p≠0, so
  MU_*(X)⊗_(MU_*)ℤ is not a homology theory in general, as expected for
  ordinary homology.
- M=ℤ[u^(±1)] through the law x+y+uxy: [p](x)=((1+ux)^p−1)/u, so p acts
  injectively, and modulo p, [p](x)=u^(p−1)x^p, so v₁=u^(p−1) is a unit,
  injective on 𝔽_p[u^(±1)], and M/(p,v₁)=0 makes the remaining conditions
  vacuous; this is the Conner–Floyd form of K-theory.
- M=ℚ: p acts invertibly and M/p=0, so the criterion holds and gives
  rational homology.

### 5.5 Lubin–Tate deformations (F5.5)

Fix a field k of characteristic p, a
surjective ring homomorphism ρ:R→k and a commutative one-dimensional
formal group F₀ over k of finite height h; F1's `one_le_height` gives
h≥1. For a ring homomorphism π:A→k, a ⋆-isomorphism relative to π is an
isomorphism `TauCeti.FormalGroupIso G H` of formal groups over A whose
forward series reduces along π to the identity series X (`IsStarIso`;
Lubin–Tate 1966, p. 49). Its API:

- the identity isomorphism is a ⋆-isomorphism, and composites and
  inverses of ⋆-isomorphisms are ⋆-isomorphisms, because reduction along π
  commutes with substitution and the substitution inverse of X is X;
- if a ⋆-isomorphism from G to H exists, G and H have the same reduction
  along π, the reduced series X being an isomorphism between the
  reductions;
- base change along a ring homomorphism A→A′ compatible with the maps to
  k carries ⋆-isomorphisms to ⋆-isomorphisms;
- rigidity: if A is a local ring, Hausdorff for its maximal ideal 𝔪, and π
  is surjective onto a field of characteristic p with kernel 𝔪, then two
  ⋆-isomorphisms G→H between commutative formal groups are equal when the
  reduction of G along π has finite height. Both reduce to X, and π is the
  residue map followed by an isomorphism of fields, so this is the pinned
  `TauCeti.FormalGroupIso.eq_of_map_residue_eq` (module `Rigidity`), with
  `height_map` for the change of residue field (Lubin–Tate 1966,
  Proposition 2.4, p. 52, last clause, in its stepwise form modulo
  successive powers of 𝔪).

**Checks.**
- Over ℤ_p with π the reduction modulo p, the automorphism
  [1+p](x)=(1+x)^(1+p)−1 of the multiplicative law reduces to
  (1+x)(1+x^p)−1=x+x^p+x^(p+1)≠x: an isomorphism with equal source and
  target reductions that is not a ⋆-isomorphism.
- For odd p, x↦2x is an automorphism of the additive law over ℤ_p
  reducing to 2x≠x, again not a ⋆-isomorphism; equality of reductions does
  not make an isomorphism ⋆.
- For u≡1 modulo p, G=X+Y+uXY over ℤ_p is ⋆-isomorphic to the
  multiplicative law by x↦ux, since u(X+Y+uXY)=uX+uY+(uX)(uY) and ux
  reduces to x; for u≢1 modulo p the same series is an isomorphism and not
  a ⋆-isomorphism, and the reductions differ.
- Rigidity needs finite height: over 𝔽_p[ε], ε²=0, the series x+εx^p is
  an automorphism of the additive law, since (X+Y)^p=X^p+Y^p, with inverse
  x−εx^p, and it reduces to x; so the additive law, of infinite height,
  has two distinct ⋆-automorphisms.

Prove the Lubin–Tate theorem (Lubin–Tate 1966, Theorem 3.1, p. 56, with
the generic law of Proposition 1.1, p. 50, and the functorial form of
§3.2, p. 57): there is a commutative formal group Γ over
R[[t₁,…,t_(h−1)]] reducing to F₀ along ρ composed with the constant
coefficient, such that for every complete noetherian local R-algebra A
with a surjection π:A→k whose kernel is the maximal ideal and with
π∘(structure map)=ρ, and every commutative formal group G over A reducing
to F₀ along π, there is exactly one R-algebra map
θ:R[[t₁,…,t_(h−1)]]→A with every θ(t_i) in the maximal ideal of A for
which Γ base-changed along θ is ⋆-isomorphic to G
(`lubinTate_universal_deformation`). For that θ the ⋆-isomorphism is
unique, by the rigidity bullet of the `IsStarIso` API (Lubin–Tate 1966,
Theorem 3.1, last sentence): the statement asserts the uniqueness of θ
among all maps admitting some ⋆-isomorphism, and the pinned rigidity
supplies the uniqueness of the ⋆-isomorphism. The base ring R is
arbitrary, as in the source (a ring with a maximal ideal J and R/J≅k);
the standard form is k perfect, R=W(k) and ρ=`WittVector.constantCoeff`,
for which R[[t₁,…,t_(h−1)]]=W(k)[[t₁,…,t_(h−1)]] is the Lubin–Tate ring.
Lubin–Tate assume F₀≡x+y modulo degree p^h; every law of height h is
strictly isomorphic over k to one of this form, by removing its terms of
degree n<p^h one at a time with F1's cocycle lemma
(`TauCeti.existsUnique_eq_smul_lazardCocycle`: the lowest non-additive
part is a multiple of C_n, removable by a strict coordinate change when
d_n is a unit, and zero in degree p^j, j<h, because the height is h), and
conjugating Γ by a lift of that strict isomorphism to R gives the general
statement. The proof runs by induction on A/m^r: the classes of the
cocycles obtained from ∂Γ/∂t_i at t=0 form a basis of the (h−1)-dimensional
group of symmetric 2-cocycles of F₀ modulo coboundaries (Lubin–Tate 1966,
Proposition 2.6, p. 54), so the obstruction to lifting a ⋆-isomorphism
from A/m^r to A/m^(r+1) is cancelled by a unique correction of θ and of the
⋆-isomorphism. *Needs:* Mathlib `FormalGroup.map`, `MvPowerSeries`,
`IsLocalRing`, `IsNoetherianRing`, `IsAdicComplete`; Tau Ceti
`TauCeti.FormalGroupIso`, `FormalGroup.height`; F1's cocycle lemma and
obstruction API (`TauCeti.existsUnique_eq_smul_lazardCocycle` and module
`Obstruction`); for the uniqueness of the ⋆-isomorphism and of θ in the
induction, the pinned rigidity `TauCeti.FormalGroupIso.eq_of_map_residue_eq`.

**Checks.**
- h=1, F₀ the multiplicative law over a perfect k, R=W(k): there are no
  variables, θ is the structure map W(k)→A, and Γ may be taken to be the
  multiplicative law over W(k). For A=W(k) and G=X+Y+uXY with u≡1 modulo
  p, the unique ⋆-isomorphism from Γ to G is x↦u⁻¹x; composing it with the
  automorphism [1+p] gives a second isomorphism, which is not ⋆, so the
  uniqueness needs the ⋆ condition.
- F₀ the additive law, of height ∞, is excluded: over A=𝔽_p[ε], ε²=0,
  the laws X+Y+εC_(p^j)(X,Y), j≥1, are pairwise not ⋆-isomorphic, since a
  ⋆-isomorphism x+εg(x) changes the cocycle by Σ_n g_n d_n C_n and
  d_(p^j)=p=0 in 𝔽_p; for every finite h these infinitely many classes
  cannot match the p^(h−1) maps R[[t₁,…,t_(h−1)]]→𝔽_p[ε] over ρ (taking
  k=𝔽_p) that send each t_i into 𝔽_p·ε.
- For k perfect, R=W(k) and ρ=`WittVector.constantCoeff` (surjective by
  Teichmüller lifts, with kernel pW(k)), A=R[[t₁,…,t_(h−1)]] with π=ρ
  composed with the constant coefficient is itself an admissible A; for
  G=Γ the theorem returns θ the identity with the identity ⋆-isomorphism,
  so Γ is its own universal deformation.
- R=k is allowed (equal characteristic): for A=k[[s]] and G=F₀⊗A the
  answer is θ(t_i)=0 for every i, with the identity ⋆-isomorphism.

Deduce, for R complete noetherian local, the action of the automorphism
group of F₀ over k on R[[t₁,…,t_(h−1)]]: each automorphism u of F₀
determines a unique substitution u′ of the t_i with values in the maximal
ideal and a unique isomorphism Γ(t)→Γ(u′(t)) reducing to u, compatibly
with composition (Lubin–Tate 1966, Proposition 3.3 and §3.4, pp. 57–58).
Include the height-two elliptic example of Lubin–Tate 1966, §3.5, p. 58
(p=2, k=𝔽₄, R=W(𝔽₄), the curve Y²+tXY+Y=X³ over R[[t]]).
These algebraic targets supply EllipticCohomology's spectral realization
and Serre–Tate comparison; the Goerss–Hopkins–Miller E∞ realization is owned
there.

### Examples

- I₁=(p) is an invariant prime and (v₁) is not, since η_R(v₁)=v₁+pt₁.
- In the Lazard ring at p=2, (2) and (2,a₁₁) are the invariant primes
  I_(2,1) and I_(2,2), while (a₁₁) is a homogeneous prime that is not
  invariant, since η_R(a₁₁)=a₁₁+2b₁.
- π_*E(n)=ℤ_(p)[v₁,…,v_(n−1),v_n^(±1)] satisfies Landweber's criterion:
  v_i acts injectively for i≤n, and E(n)_*⊗BP_*/I_i=0 for i>n (Ravenel,
  Section 4.2, p. 118).
- At height 1 the Lubin–Tate theorem has no parameters: every lift of the
  multiplicative law to a complete noetherian local W(k)-algebra with
  residue field k is ⋆-isomorphic to the multiplicative law by exactly one
  ⋆-isomorphism.

### Dependencies

F1 (the Lazard ring with its grading and Hopf algebroid, the invariance
and presentation of the height ideals, the logarithms, the cocycle lemma,
the obstruction API, the height and Lubin–Tate rigidity), F2 (MU_*MU), F3
(BP_*BP) and F4 (comodules); GeneralizedCohomology G2.4 and G5.1;
Mathlib's power series, complete noetherian local rings, homogeneous
ideals and Witt vectors.

## Layer 6: F6. Chromatic localization and fracture

### 6.1 Spectral Bousfield localization (F6.1)

Use G2's stable symmetric spectral model and F3's actual spectra. For a
supplied spectrum E define E-equivalences by derived E-smash and E-acyclic
objects by E∧X≃0; define E-locality by the contractibility of the derived
function spectrum F(A,Y) for every E-acyclic A. Construct Bousfield
localization L_E, its unit, derived mapping-space universal property,
functoriality, exactness and idempotence (Bousfield 1979, §1, for the
existence of L_E for every spectrum E; Ravenel, *Nilpotence and
Periodicity*, Theorem 7.1.3, p. 76, states it). Construct the localized model and
homotopy categories, their derived smash/localized smash and function
comparisons. Prove the smallness/cardinal bound and existence by
transfinite homotopy pushouts along a bounded family of E-equivalences,
consuming G2's model and small-object constructions. Prove the required
local presentability/accessibility, left properness, cellular generating
cofibrations and cardinal bounds for these symmetric spectra from
simplicial sets and their sequence/module presentation. Prove the
localization-existence hypotheses for the chosen stable model and its
cofibrant replacements, not just its homotopy category; do
not assume that G2's stable-model existence already proves arbitrary
homological localization. Include all integer shifts in any mapping-space locality criterion. Compare G3's
integer localization and derived p-completion under their actual
hypotheses; these do not supply chromatic localization or its smashing
theorems. *Needs:* GeneralizedCohomology G2.3–G2.4 (the stable symmetric
spectral model, its small-object constructions, derived smash products
and function spectra) and G3.9 (integer localization and derived
p-completion, for the comparison); F3.3's spectra for the examples.

**Checks.**
- L_S is the identity: only the zero spectrum is S-acyclic, so every
  spectrum is S-local and every S-equivalence is a weak equivalence.
- L_(Hℚ)X≃X∧Hℚ, the rationalization: Hℚ is the rational Moore spectrum,
  X∧Hℚ is Hℚ-local and X→X∧Hℚ is an Hℚ-equivalence; so π_*L_(Hℚ)S is ℚ
  in degree 0, and the torsion of π_*S in positive degrees is killed.
- L_E X≃0 exactly when X is E-acyclic, the unit X→L_E X then being an
  E-equivalence to 0: L_(Hℚ)(S/p)≃0 although S/p is not contractible, so
  L_E is not conservative and an E-equivalence need not be a weak
  equivalence.

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

### 6.2 Nilpotence and its proof constructions (F6.2)

Build the three distinct Devinatz–Hopkins–Smith conclusions on G2.4's
actual derived smash and ring spectra and G5.1's finite duality:

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

**Checks.**
- J₁(S²)=S², J₂(S²)/J₁(S²)=S⁴ and H₂(J₂(S²);ℤ)=ℤ on b, whereas a
  construction with J₂/J₁=S²×S² would add two classes in degree 2.
- For Y=S⁰ the James map is not an equivalence: J(S⁰) is the discrete
  monoid ℕ while ΩS¹ has components ℤ, so the map misses the negative
  components and the path-connectedness hypothesis is not removable.
- For Y=S¹, J(S¹)≃ΩS², and the tensor algebra on H̃_*(S¹;𝔽) has one class
  in each degree j≥0, matching H_*(ΩS²;𝔽); the James stage J_j(S¹) carries
  exactly the classes of degree at most j.

The proof has the following constructions and estimates.

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
   consecutive G_k. Construct DHS Proposition 3.27's actual extension:
   E′=ΩSU(r+1) with its projection followed by h_k to
   ΩS^(2m+1), m=rp^k. Its pullback over J_(p−1)S^(2m)
   is E=F′_(p^(k+1)−1) p-locally. Use the stabilized classifying
   map E′→BU extending the Thom bundle on E. Derive the Ω²S^(2m+1) fibre action from
   this extension; it is not an extra assumed action. Own DHS
   Lemma 3.35 and Proposition 3.33 here p-locally; no integral fibre-sequence
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
   of F2's cohomological Steenrod operations or G2.8's operadic E∞ transfer.
4. Combine the stage-dependent vanishing and the Bousfield comparisons
   to descend nilpotence from X(r+1)_*R to X(r)_*R. The G_k are
   p-local: prove the descent for every prime and the rational branch,
   then assemble the contractibility of X(r)∧Tel(α;R) from rational
   and all p-local homotopy groups. Compactness detects
   a zero MU-Hurewicz class at one finite X(r) stage. Descend to X(1)
   to prove the core connective finite-type ring theorem. Negative
   degrees vanish by connectivity; degree 0 uses the isomorphism
   π₀R→π₀(MU∧R) before the positive-degree argument. Then apply
   the preceding reductions. Keep the multiplication telescope distinct
   from an inverse limit or an arbitrary BP completion.

*Needs:* GeneralizedCohomology G2.4 (derived smash products and ring
spectra), G3.4 (telescopes of spectra, for the multiplication telescopes
Tel(α;R)), G2.9 (loop/bar comparison), G5.1 (finite duality), G5.3
(numerable bundle and Thom diagrams) and G5.4 (strict MU and the complex
Bott equivalence); AlgebraicTopology Stage 5.5 (Serre fibrations); F4.1's
derived right-module category over a strict ring spectrum; F2.2's mod-p
Steenrod operations and dual Steenrod algebra; the mod-p homology
operations of Ω²S^(2m+1) and of the extended powers D_(2,j), at odd
primes and at 2, are constructed here.

### 6.3 Finite height, periodicity and telescopes (F6.3)

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
`⟨Z⟩∧⟨K(j)⟩∈{0,⟨K(j)⟩}` for every spectrum Z (Ravenel, *Nilpotence and
Periodicity*, Theorem 7.3.2(f), p. 82).
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
v_n^(c_E−b_E) makes that diagonal 1. Construct its lower-finite
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
spectrum (Ravenel, *Nilpotence and Periodicity*, Proposition 7.2.6(iii),
p. 79). A zero smashed cofiber makes f invertible and identifies
the initial object with its telescope. This needs no centrality or ring
hypothesis; central coefficient localization is a specialization.
Use this to prove
`⟨P(n)⟩=⟨K(n)⟩∨⟨P(n+1)⟩` and `⟨B(n)⟩=⟨K(n)⟩` (Ravenel, *Nilpotence and
Periodicity*, Theorem 7.3.2(c) and (a), p. 82).
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
`⟨v_n⁻¹BP⟩=⟨K(0)∨⋯∨K(n)⟩` (Theorem 7.3.2(b) and (d), p. 82).
Apply the same finite decomposition to E(n)/I_j, j=0,…,n+1.
Construct its localized term v_j⁻¹(E(n)/I_j) as the compatible
higher-generator quotient/localization of B(j), so its class lies
below K(j). Its explicit nonzero coefficient ring and pairing certificate
give equality by the same test. The terminal quotient is zero since
v_n is a unit. This proves
`⟨E(n)⟩=⟨K(0)∨⋯∨K(n)⟩=⟨v_n⁻¹BP⟩` (Theorem 7.3.2(d) and (b), p. 82).
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

**Checks.**
- π_*B(1)=v₁⁻¹(BP_*/p)=𝔽_p[v₁^(±1),v₂,v₃,…], while
  π_*K(1)=𝔽_p[v₁^(±1)]: B(1) and K(1) are different spectra with the
  same Bousfield class, so ⟨B(n)⟩=⟨K(n)⟩ is an identity of classes, and
  defining B(n) as K(n) would lose the generators v_i, i>n.
- P(1) and the graded Eilenberg–MacLane spectrum H(BP_*/p), a wedge of
  suspensions of H𝔽_p, have the same homotopy groups 𝔽_p[v₁,v₂,…]. But
  K(1)∧H(BP_*/p)≃0, since K(1)∧H𝔽_p≃0 (F3.3) and smash products commute
  with wedges, while K(1)∧P(1)≠0, since ⟨P(1)⟩=⟨K(1)⟩∨⟨P(2)⟩ and
  K(1)∧K(1)≠0. So P(n) is the ordered cofiber, not any spectrum with
  homotopy BP_*/I_n.
- π_*P(∞)=colim_n BP_*/I_n is 𝔽_p in degree 0: BP_*/I_n=𝔽_p[v_n,v_(n+1),…]
  vanishes in each positive degree below 2(p^n−1). A spectrum whose
  homotopy is 𝔽_p in degree 0 is H𝔽_p, as P(∞)≃H𝔽_p requires.

Construct Smith's idempotent toolkit before its finite-spectrum
applications. Consume SchurWeyl Layers 0, 2 and 5's native Young-diagram,
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
Ravenel Appendix C.2.2. Construct their image/splitting and homology
base-change comparisons on finite p-local smash powers, splitting each
idempotent by F3.1's idempotent splitting. These
p-local/graded constructions do not
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
*Needs:* for the class comparisons, the Smith toolkit, the
linear-connectivity theorem, the height forms of nilpotence and type:
F3.1 (BP_*BP, the BP operations, the strict p-typical coordinates and
p-typicalization), F3.3 (BP⟨n⟩, E(n), K(n), k(n) and their ordered-cofiber
products), F5.1–F5.2 (the height ideals and the finite Landweber
filtration), F5.4 (Landweber exactness of E(n)_*), F4.3 (the BP cobar
complex), F2.2 (the dual Steenrod algebra), F6.1 (Bousfield classes) and
F6.2 (MU-smash and MU-Hurewicz nilpotence); RepresentationTheory
SchurWeyl Layers 0, 2 and 5 (Smith idempotents); F3.1's splitting of
idempotents; GeneralizedCohomology G2.4 (cofibers and the
finite-subcomplex filtration of spectra, for the finite
K(n)-Atiyah–Hirzebruch spectral sequences built here as F4.4 builds the
BP-homology one), G3.4 (telescopes of spectra) and G5.1 (finite
duality).

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
Smith/Margolis construction, separate from the torsion-free type 0 CP
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
on H=H^*(X;𝔽_p). At p=2 require vanishing P_t^s-Margolis
homology for s+t≤n+1, excluding (s,t)=(0,n+1), with
Q_n=P_(n+1)^0. At odd p require this vanishing for s+t≤n and
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
*Needs:* for strong and partial type and the seed: F2.2 (the mod-p
Steenrod algebras, the Milnor primitives Q_i and Milnor's dual);
AlgebraicTopology Stage 8.8 (the bar/CW model of BC_p and its skeleta);
F3.3's K(n) with the finite K(n)-Atiyah–Hirzebruch spectral sequences
above.

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
- at p=2, S/2 has strong type 1: the operations P_t^s are defined only
  for t>s≥0 (Ravenel, Nilpotence and Periodicity, §6.2, p. 63), so the
  pairs with s+t≤2 other than the excluded (0,2) reduce to (0,1), and
  P₁⁰=Sq¹ is an isomorphism from degree 0 to degree 1, so its Margolis
  homology vanishes; Q₁, of degree 3, acts as zero, and
  dim H=2=rank K(1)^*(S/2). Ravenel's Theorem 6.2.4 then gives a v₁
  self-map, the Adams map of degree 8. Strong type depends on the prime:
  S/2 has it and S/p, p odd, does not; a reading that also imposed
  Sq²=P₁¹ would wrongly exclude S/2.
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
Identify the connecting primitive of degree 2p^j−1 with Q_j.
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
K(n−1)-acyclic finite spectra for n≥1, and C_∞={0} (Hopkins–Smith,
Theorem 7; Ravenel, *Nilpotence and Periodicity*, Theorem 3.4.3,
p. 37). Prove their
strict order and type/support characterization. Use the Morava
nilpotence theorem on the finite evaluation/coevaluation fibre and
its iterated-smash cofiber filtration for the classification.
Prove the nilpotence and ideal-extension argument that transports a
self-map across finite cofiber/retract constructions in a thick
subcategory, yielding Hopkins–Smith periodicity for every type-n
finite spectrum, n≥1 (Hopkins–Smith, Theorem 9; Ravenel, *Nilpotence
and Periodicity*, Theorem 1.5.4, p. 9).

Include Adams' v₁ maps on the mod-p Moore spectrum, of degree 2p−2 for odd p and
degree 8 at p=2, constructing their K-theory/Adams-operation detection
and α₁/e-invariant comparison rather than deducing their minimal
degrees from the general existence theorem.
*Needs:* for the v_n self-maps, the strong-type spectra, the first v_n
map, thick classification, periodicity and Adams' maps: the Smith
idempotents, the height forms of nilpotence, type and strong type above;
F2.2 (the multiplicative mod-p Adams spectral sequence, its change of
rings and the finite sub-Hopf algebras' duals); F3.3 (k(m) and BP⟨j⟩);
GeneralizedCohomology G5.1 (finite duality, for R=DX∧X) and G5.4 (KU);
TopologicalKTheory T2.5 (the Adams operations ψ^k, k≥1, with
ψ^kβ_n=k^nβ_n).

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
their independence in Bousfield class of the chosen map and of the
chosen type-n spectrum (Ravenel, *Nilpotence and Periodicity*, the
paragraph of (7.2.8), p. 80, from the class invariance Theorem 7.2.7), the inequality
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

**Checks.**
- T(0)=S_(p)[1/p] has π_*=π_*(S_(p))⊗ℚ, which is ℚ in degree 0 and zero
  in every other degree because the positive stable stems are finite. So
  L_0^f is rationalization, L_0^fS_(p)=S_(p)[1/p], and
  L_0^f(S/p)=S/p∧S_(p)[1/p]≃0, as S/p has type 1.
- Replacing v by a power v^a leaves the telescope unchanged: the sequence
  along v^a is the subsequence of every a-th term of the sequence along
  v, which is cofinal, so the two homotopy colimits agree. With v^a=w^b
  for two chosen v_n maps this gives the independence of the choice.
- L_1^f kills the type-2 cofiber of a v₁ self-map of S/p, while
  L_1^f(S/p)≃v₁⁻¹S/p by the finite-source telescope comparison, and
  v₁⁻¹S/p≠0 because v₁ acts invertibly on K(1)_*(S/p)≠0, so
  K(1)_*(v₁⁻¹S/p)=K(1)_*(S/p). A localization that also killed the
  type-1 spectra would be L_0^f, which kills S/p.

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

*Needs:* for the Moore systems, telescopes, finite localization,
pro-recovery and Γ_k^fS: F4.1 (the derived right-module category over a
strict ring spectrum, here GeneralizedCohomology G5.4's strict MU
localized by G3.9); F6.2's finite-MU-cell ghost bound; F3.1 (the
p-typical maps ε and ι); F6.1 (localization, Bousfield classes and the
derived mapping-space property); thick classification, periodicity and
the Johnson–Wilson class identity above; GeneralizedCohomology G2.3–G2.4
(the stable model structure, its small-object constructions and the
stable category, on which the finite localizations are built), G3.4
(telescopes of spectra) and G5.1 (finite duality).

**Checks.**
- Γ_0^fS=S_(p), since L_(−1)^f=0.
- Γ_1^fS=fib(S_(p)→S_(p)[1/p]) is the desuspension Σ^(−1)S/p^∞ of the
  Moore spectrum of ℚ/ℤ_(p): in the long exact sequence ℤ_(p)→ℚ is
  injective in degree 0 and π_*(S_(p)[1/p]) vanishes in other degrees,
  so π_(−1)=ℚ/ℤ_(p)≅ℤ/p^∞, π_0=0 and π_m=π_m(S_(p)) for m≥1. With
  M_a=S/p^(a₀) and D(S/p^a)=Σ^(−1)S/p^a this is hocolim_a D(M_a), and
  smashing with BP gives the k=1 case Σ^(−1)BP/p^(a₀) of the dual-quotient
  formula above, as |v₀|=0. Taking the cofiber S/p^∞ instead of the fiber
  would put ℤ/p^∞ in degree 0.
- k=2 tests the degrees |v_i| in the shift: for a in the system, M_a is
  the cofiber of a v₁ self-map Σ^(a₁|v₁|)S/p^(a₀)→S/p^(a₀) acting on BP_*
  as v₁^(a₁), so it has
  cells in dimensions 0, 1, a₁|v₁|+1 and a₁|v₁|+2, and D(M_a) has cells in
  their negatives, from −2−a₁|v₁| to 0. The ordered cofiber
  BP/(p^(a₀),v₁^(a₁)) has BP-cells in dimensions 0, 1, a₁|v₁|+1 and
  a₁|v₁|+2, so the shift −k−a₁|v₁|=−2−a₁|v₁| of the formula matches
  them; a shift of −k alone would put the bottom cell at −2.

### 6.4 Johnson–Wilson classes, smashing and fracture (F6.4)

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
height 0, on the actual spectra (Ravenel, *Nilpotence and Periodicity*,
Theorem 7.3.2(e), p. 82). No identity of a finite localization
with L_n is inferred.

Set L_n=L_(E(n)) and C_nX=fib(X→L_nX) for the acyclic fiber,
distinct from F6.3's thick subcategories C_n. Prove the Hopkins–Ravenel smashing theorem as the
natural unit-compatible equivalence `L_n X≃L_nS∧X` for every
p-local spectrum X and finite n≥0 (Ravenel, Nilpotence and Periodicity,
Theorem 7.5.6, p. 87). Construct its proof through
[Ravenel, Chapter 8, §§1–5](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mybooks/nilpb2020.pdf),
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
     be smaller: for E=Hℚ it would contain only the rational spectra
     with finite-dimensional total homotopy and exclude the countable
     wedge of copies of Hℚ.
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
   and treat height 0 rationally. ProfiniteCohomology supplies the
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
   has nonzero torsion-free homology and hence type 0, so its FK(i)
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
cartesian. This is the case E=E(n−1), K=K(n) of the general fracture
square (Lawson, *An introduction to Bousfield localization*,
arXiv:2002.03888v1, Proposition 9.26, p. 30): its hypothesis
L_K L_E≃0 is the vanishing L_(K(n))L_(n−1)≃0 above, and its corner
L_(E∨K) is L_n because ⟨E(n−1)∨K(n)⟩=⟨E(n)⟩ by Theorem 7.3.2(d).
Lawson's proof has the two steps below, detecting equivalences by
smashing with E and K. First prove the homotopy pullback of
the lower and right corners is E(n)-local. Then prove X→that pullback
is an E(n)-equivalence by applying L_(n−1) and L_(K(n)), using the
correctly ordered vanishing above and the class identity. Include n=1 with rational L₀; retain the
lower-right corner. Prove functoriality in X, comparisons with the
chromatic tower L_n→L_(n−1), the fibre/Mayer–Vietoris sequences on
true π_*, and product/module comparisons with the actual derived
localized structures.

*Needs:* F6.3 (class comparisons, the p-typical ring map, Smith
idempotents, Moore systems and telescopes); F2.3 and F3.1 (the polynomial
coefficient presentations of MU_* and BP_* and the Cartier splitting);
F3.2 (the height-m Honda law) and F3.3; F4.3 (the MU and BP resolutions);
F5.2–F5.4 (Landweber filtration and exactness); F5.5 (the formal-group
automorphism and deformation carriers); F6.1; F6.2's ghost bound;
ProfiniteCohomology (continuous cohomology of the stabilizer groups);
RepresentationTheory SchurWeyl Layers 0, 2 and 5; GeneralizedCohomology
G2.4, G3.8, G4 (the projective-bundle theorem, for the basis of BP_*CP^j)
and G5.1; Mathlib `WittVector`. Ravenel and Symonds are cited sources.

**Checks.**
- n=1, X=Hℚ: L₁Hℚ=Hℚ, L_(K(1))Hℚ=0 since K(1)∧Hℚ=0, L₀Hℚ=Hℚ and the
  lower-right corner is 0; the square has rows Hℚ→0 and Hℚ→0 and is
  cartesian.
- n=1, X=S/p: L₀(S/p)=S/p∧Hℚ=0, and L₀L_(K(1))(S/p)=0 because the
  homotopy of L_(K(1))(S/p) is killed by p²; the square says
  L₁(S/p)≃L_(K(1))(S/p), as it must for a type-1 finite spectrum.
- n=1, X=S_(p), p odd: π₀ of the corners is ℤ_p for L_(K(1))S, ℚ for L₀S
  and ℚ_p for L₀L_(K(1))S, and the pullback has π₀=ℚ×_(ℚ_p)ℤ_p=ℤ_(p); a
  square without the lower-right corner, a product of L₀X and L_(K(1))X,
  would give ℚ×ℤ_p instead.

### 6.5 Local group actions and completion comparisons (F6.5)

For Borel finite-group actions on G2's spectra, construct the projective
model category of BG-diagrams and its derived/coherent action comparison,
homotopy orbits, homotopy fixed points, transfer/norm and Tate cofiber, with
restriction, induction and lax monoidal/module naturality. Prove the
Greenlees–Sadofsky/Kuhn theorem: for n≥1, finite G and an object
of Fun(BG,L_(K(n))Sp), its underlying ordinary Tate spectrum E^(tG)
is K(n)-acyclic. The localized norm is an equivalence (Clausen–Mathew,
Theorem 1.1, p. 1, which credits it to Greenlees–Sadofsky and
Hovey–Sadofsky; Kuhn, Theorem 1.5, p. 4, for the telescopic form);
ordinary integral Tate vanishing is not asserted.
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

   Use F6.4's finite type 0 L_nBP-prenilpotent Y. Its localized
   model L_nY is built in finitely many stages from L_nBP-modules.
   For each such module N, use the unit/action retraction
   N∧M→L_nBP∧N∧M→N∧M and smash the preceding finite
   filtration with N. Thus L_n(Y∧M) is K(n)-nilpotent.
   This argument requires no multiplication on M.
   The Tate functor kills these finite constructions, using item 2
   and the unital module action, even when the generating modules
   are infinite spectra. Thus for F=Y∧M, a finite type-n spectrum,
   `(L_nF)^(tG)≃0`. Thick classification and finite dualizability
   give the same vanishing for every finite spectrum of type≥n
   (Hovey–Sadofsky, Lemma 2.1 and Corollary 3.2, p. 3581, who take M
   to be a ring spectrum).
5. Put R_G=(L_nS)^(tG), with its unital ring and L_nS-module
   structure. Use the finite type tower F₀=S_(p),
   F_(i+1)=cofib(v_i), and F6.3's telescopes T(i), with v₀=p
   and the rational comparison T(0)=S_(p)[1/p]≃Hℚ. Its top term
   R_G∧F_n vanishes by item 4 and finite-smash/Tate comparison.
   The remaining Bousfield terms R_G∧T(i), i<n, lie below K(i):
   use ⟨L_nS⟩=⟨E(n)⟩ and
   `⟨E(n)∧T(i)⟩=⟨K(i)⟩`, proved by field Künneth and the
   self-map height tests. Deduce ⟨R_G⟩≤⟨E(n−1)⟩ and its
   E(n−1)-locality by the unital ring action (Hovey–Sadofsky, §4,
   inequality (4) and the paragraph after it, p. 3582). No commutation of
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
universal property, as in Hovey–Strickland Proposition 7.10(e), to
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

*Needs:* GeneralizedCohomology G2 (simplicial model of spectra and
projective BG-diagrams), G2.11 (enriched, quasicategorical and monoidal
foundations), G3.8 (Milnor sequence), G3.9 (derived p-completion),
G4.3–G4.5 (Thom isomorphisms, Euler classes and complex orientations, for
the Gysin sequence of the circle bundle over CP∞), G5.1 (finite duality) and G5.4 (strict MU); F3.2 and F3.3 (K(n), its
p-series v_n x^(p^n), and E(n)); F4.1 (the derived right-module category
over strict MU_(p)); F5.4 (Landweber exactness, for the represented
theories and the Hasse square); F6.1 (Bousfield localization); F6.3 (the
B(n)-homology comparison, the right-flat E(n)_*BP comparison, Moore
systems, telescopes, thick classification and pro-recovery); F6.4
(smashing, the chromatic tower and the finite-height prenilpotent seed);
Greenlees–Sadofsky, Kuhn, Hovey–Strickland, Clausen–Mathew and
Nikolaus–Scholze are cited sources.

**Checks.**
- For the trivial group the norm E_(h1)→E^(h1) is the identity, so
  E^(t1)=0 for every E, with no hypothesis on E.
- For E=K(n) with trivial C_p-action, K(n)^*(BC_p)=K(n)^*[[x]]/(v_n x^(p^n))
  has nilpotent Euler class x, so inverting it gives K(n)^(tC_p)≃0.
- For Hℤ with trivial C_p-action, π_(−2k)Hℤ^(tC_p)=Ĥ^(2k)(C_p;ℤ)=ℤ/p≠0,
  so integral Tate vanishing is false; this does not contradict the
  theorem, because K(n)∧Hℤ=0 makes L_(K(n))Hℤ=0 for n≥1.

### 6.6 Torus Euler cancellation on finite MU pieces (F6.6)

Use G5.4's single MU spectrum and G4.5's complex orientation, F1–F3's formal group and
p-typicalization, F5's finitely presented comodule filtration, and G5.7's
continuous-torus action, coherent Thom family and mapping-tower comparisons.
For T=(S¹)^ℓ let C,D be compact closed stably-complex T-fixed manifolds with
their specified finite CW and compact-oriented duality models, with D
equidimensional of real dimension d_D. Treat different-dimensional connected
components of D by the finite-sum comparison, with their individual shifts.
Obtain the finite CW models of C and D from AlgebraicTopology Stage 8.7
(the compact case: a compact smooth manifold has finite CW type), whose
hypotheses C and D, compact closed smooth manifolds, satisfy. Transport the bundle,
Euler and duality diagrams along the actual comparison homotopy equivalences.
Write
P_C=MU∧Σ∞C₊ and P_D=MU∧Σ∞D₊, as constant objects of
A_MU(BT)=Fun(Sing BT,Mod_MU). Treat specified finite-free presentations
P_C≃⊕_jΣ^(d_j)MU and P_D≃⊕_kΣ^(e_k)MU, as well as the general
finite-cell P_C,P_D without such presentations. Compactness supplies neither
a chosen finite CW model nor a finite-free MU basis; take the former
from AlgebraicTopology Stage 8.7 and carry the latter as actual data
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
on these groups in every degree. This injectivity, the torus Euler
cancellation, is this roadmap's own argument, set out below: a
telescoping ring identity reduces it to the regularity of a scalar
character series Π, which rests on F5.2's finite Landweber filtration
and, for h≥1, on the leading term v_h x^(p^h) of the p-series modulo
I_h, read off Araki's formula [p]_F(x)=Σ^F_(i≥0) v_i x^(p^i) (Ravenel,
(A2.2.4), p. 364), the same modulo I_h for Hazewinkel's generators since
the two families are congruent modulo p (Theorem A2.2.3, p. 364).
Construct the finite-sum variants and the
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
for BP and MU_(p). Use x_i=e(λ_i) for the standard-character line of
CharacteristicClasses' Conventions, as G5.7 uses it,
λ_i=O(−1); its ordinary coefficient image is −h_i. Relate this coordinate
to G4's dual-line projective-bundle coordinate by the actual formal inverse.
Prove tower and multiplication compatibility, and identify this instance's
mapping-spectrum Milnor sequence. Finite truncations have their own kernels;
prove cancellation on the full completed groups.

Consume RepresentationTheory/CompactGroups Layers 1–2, **unitarizability**
and **complete reducibility**, and its **circle S¹ and Fourier series** engine
for integer characters of AddCircle 1. Construct the finite-product circle characters:
continuous characters of T=(Fin ℓ→Circle) are uniquely
χ_m(z)=∏_i z_i^(m_i), m∈Z^ℓ, by coordinate restriction and finite-product
multiplication. Use Mathlib's AddCircle.homeomorphCircle and toCircle_addChar
at period 1; toCircle_zsmul identifies the circle engine with z↦z^n.
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
and their completed tower, including rank 0 and unit 1. Transfer the finite
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

*Needs:* GeneralizedCohomology G3.8 (Milnor sequence), G4 (projective
bundles and Thom multiplicativity), G4.5 (complex orientation), G5.1
(finite duality), G5.4 (MU), G5.5 (the MU→Hℤ coefficient square) and G5.7
(torus actions, Thom families, mapping towers); F1–F3 (formal group and
p-typicalization); F5.1–F5.2 (quotients A/I_h and the finite Landweber
filtration); F6.3's p-typical ring comparison and F6.4's polynomial
coefficient isomorphism; CharacteristicClasses' Conventions;
RepresentationTheory CompactGroups Layers 1–2; AlgebraicTopology Stage
8.7 (finite CW type of compact smooth manifolds).

**Checks.**
- ℓ=1 and χ=[2]: Π(x)=[2]_F(x)=2x+a₁₁x²+⋯ is regular on
  MU^*(BT)=MU^*[[x]], its linear coefficient 2 being a nonzero divisor in
  MU^*; on the factor BP_*/I₁ at p=2, [2](x)≡v₁x²+⋯ modulo 2, with
  lowest coefficient v₁, a nonzero divisor in the domain 𝔽₂[v₁,v₂,…].
  Over HF₂, whose law is additive, [2](x)=0 and the cancellation fails,
  so the height-h argument is needed.
- A zero weight is excluded: for χ=0, [0]_F(x)=0, the Euler class of the
  corresponding line vanishes and precomposition with it is not
  injective.
- The identity eν·Σ_(i=1)^q Π^(q−i)n^(i−1)=Π^q telescopes from
  eν=Π−n and n^q=0: for q=2 it reads (Π−n)(Π+n)=Π²−n²=Π², and for r=0,
  eν=1 is the unit and injectivity is trivial.

### 6.7 Euler cancellation and module-extension nullhomotopies (F6.7)

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
This nullhomotopy and splitting are this roadmap's own lemma, a formal
consequence of F6.6's injectivity and G5.7's extension classification,
as the first Check shows.
Restrict a chosen global path to the finite Borel towers. For a finite
filtered diagram of such triangles with supplied compatible δ-nullpaths,
construct the compatible splittings by G5.7's filtered extension-classification
form. The finite Borel restriction diagram is obtained from the one global
path and its functorial restriction maps.

Construct the geometric instantiation in SymplecticGeometry/ConvexityToric
T2, **Morse–Bott and moment-map topology**, as a separate stable-stratum/
open-filtration and diagonal Thom/Euler construction. Supply its actual
stable-stratum/support cofiber, j, diagonal Thom/Euler homotopy and prior
finite-piece decomposition of A to instantiate the abstract lemma. Retain
the full integral MU-module moment-filtration application, including torsion
in fixed-component homology. T2's ordinary rational perfection and its
even/torsion-qualified integral cases precede this separate construction.
Send the resulting chosen path through G5.5's fixed MU→HZ scalar extension.
*Needs:* F6.6; GeneralizedCohomology G5.7 (module-family category,
mapping-space fibres and the extension classification, with its filtered
form) and G5.5 (the MU→Hℤ scalar extension).

**Checks.**
- The proof skeleton: δq~0 and qj~⊕_C eν_C give δ∘(⊕_C eν_C)~δqj~0, and
  F6.6's injectivity of precomposition with each eν_C gives [δ]=0; for a
  zero weight, where eν=0, the first identity gives no information.
- Empty family: Q=0, δ:0→ΣA is null, and A≃B; empty A: the triangle is
  0→B→Q→0 and B≃Q with δ=0.
- Rank zero: r_C=0 gives eν_C=1, so q has the section j up to homotopy
  and δ=δqj~0 directly, without F6.6.

### Examples

- L_(Hℚ)S≃Hℚ; ⟨Hℚ⟩<⟨S⟩ and ⟨HF_p⟩<⟨Hℤ⟩ strictly, witnessed by S/p and
  Hℚ.
- S/p has type 1, carries the Adams v₁ self-map of degree 2p−2 for odd p
  and 8 at p=2, and the cofiber of that map has type 2.
- K(n)^*(BC_p)=K(n)^*[[x]]/(v_n x^(p^n)), in which x is nilpotent, so
  Euler inversion gives K(n)^(tC_p)≃0.

### Dependencies

F1–F5; GeneralizedCohomology G2.3–G2.11, G3, G4, G5.1 and G5.3–G5.7;
AlgebraicTopology Stages 5.5, 8.7 and 8.8; TopologicalKTheory T2.5;
CharacteristicClasses' Conventions; ProfiniteCohomology;
RepresentationTheory SchurWeyl Layers 0, 2 and 5 and CompactGroups
Layers 1–2; Mathlib's Witt vectors.

## Downstream consumers

TangentialBordism consumes F1–F2's formal laws, Steenrod and Adams
carriers and coefficient rings for its geometric comparisons.
StringOrientation consumes F3–F5 (BP, cooperations, Hopf rings and
Landweber exactness) for the Hovey specialization to MString.
EllipticCohomology consumes F5's exactness and the Lubin–Tate deformation
theorem, F6.5's local actions and Hasse square and F4's higher Toda
operations. EnhancedDerivedSheaves' citations of F6.5 for generic
enriched, quasicategorical and monoidal foundations resolve to
GeneralizedCohomology G2.11 by the list under Scope and ownership.
ModularCurves consumes F1's height classification. EllipticCurves
instantiates the pinned logarithm and exponential on elliptic formal
groups. SymplecticGeometry/ConvexityToric T2 instantiates F6.7's
module-extension nullhomotopy on its moment-map stratification.

## References

- Quillen, [*Elementary proofs of some results of cobordism theory using Steenrod operations*](https://people.math.rochester.edu/faculty/doug/otherpapers/QuillenElem.pdf).
- Adams, *Stable Homotopy and Generalised Homology*, Part II for orientations and cooperations and Part III, Section 7, for the Atiyah–Hirzebruch spectral sequence.
- Ravenel, [*Complex Cobordism and Stable Homotopy Groups of Spheres*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mybooks/ravenel3rd.pdf), for p-typical cooperations and Adams–Novikov constructions (Theorem 1.3.16, p. 17, for the invariant prime ideals of L; Lemmas 3.1.4, 3.1.6, 3.1.7 and 3.1.8, Theorem 3.1.5, Corollary 3.1.10, Section 4.2, p. 118, and Theorem 4.3.2 with its proof, pp. 120–121), Corollaries A1.1.18 and A1.1.20 for the splitting of a comodule algebra and of a Hopf algebra as a module and comodule, Corollary A1.3.13 for the change of rings, and Appendix 2 (Theorems A2.1.6, A2.1.18, A2.1.25, A2.1.27, A2.2.3, A2.2.6 and A2.2.12, Lemmas A2.1.9, A2.1.26 and A2.2.7, Proposition A2.1.20, Definitions A2.1.17, A2.1.22, A2.2.8 and A2.2.11, Example A2.2.10 and equations (A2.1.21), (A2.1.24), (A2.2.1), (A2.2.2), (A2.2.4) and (A2.2.13)) for the formal-group logarithm, p-typical laws and their Hopf algebroid (V,VT), p-series, height, the Honda laws and the height classification over separably closed fields; Section 4.1 (Definition 4.1.1, Lemmas 4.1.4, 4.1.13 and 4.1.15, Theorems 4.1.12, 4.1.18 and 4.1.19, pp. 106–113) for complex orientations, BP and BP_*BP; Section 4.2, pp. 116–119, for BP⟨n⟩, E(n), k(n), K(n) and Wilson's results; Theorem 4.4.1, p. 132, for the Adams–Novikov spectral sequence; and Section 1.5, p. 33, and Section 3.1, p. 66, for the summands of ku and ko at odd primes.
- Hovey, [*Homotopy theory of comodules over a Hopf algebroid*](https://arxiv.org/abs/math/0301229v1), arXiv version 1 (2003), whose numbering is used here: Proposition 1.3.4, p. 10, for the dualizable comodules of a flat Hopf algebroid, and Proposition 1.4.4, Lemma 1.4.6, Theorem 1.4.7 and Proposition 1.4.8, pp. 12–13, for Adams Hopf algebroids and the topological flatness of MU and BP.
- Bökstedt–Neeman, [*Homotopy limits in triangulated categories*](https://www.numdam.org/item/CM_1993__86_2_209_0/), Compositio Math. 86 (1993), 209–234, Proposition 3.2 and Remark 3.3, pp. 221–222, for the splitting of idempotents by telescopes.
- Adams, *Lectures on generalised cohomology*, Lecture Notes in Mathematics 99 (1969), Lecture 4, for the splitting of p-local K-theory.
- Landweber, *Homological properties of comodules over MU_*(MU) and BP_*(BP)*, Amer. J. Math. 98 (1976), for the Landweber filtration theorem for comodules over BP_*BP and, as Theorem 2.6, the exact functor theorem.
- Carrick–Davies–van Nigtevecht, [*The descent spectral sequence for topological modular forms*](https://arxiv.org/abs/2412.01640v2), §3 (Definitions 3.3 and 3.7, Lemma 3.9, Propositions 3.14–3.15 and Theorem 3.16), for the higher Toda conventions and the synthetic Moss theorem.
- Bauer, [*Computation of the homotopy of the spectrum tmf*](https://arxiv.org/abs/math/0311328v3), Geom. Topol. Monogr. 13 (2008), 11–40, §8 (Lemma 8.6 and Corollary 8.7), for the bracket forms of F4.2.
- Bousfield, [*The localization of spectra with respect to homology*](https://doi.org/10.1016/0040-9383(79)90018-1), Topology 18 (1979), §1, for the existence of homological localizations, and §6, Theorem 6.6, for the identification of the HF_p-nilpotent completion of a bounded-below spectrum with its derived p-completion.
- Lawson, [*An introduction to Bousfield localization*](https://arxiv.org/abs/2002.03888v1), arXiv version 1 (2020), whose numbering is used here: Proposition 9.26, p. 30, for the fracture square of two localizations with L_K L_E≃0, whose case E=E(n−1), K=K(n) is F6.4's chromatic fracture square.
- Landweber–Ravenel–Stong, [*Periodic cohomology theories defined by elliptic curves*](https://people.math.rochester.edu/faculty/doug/mypapers/lrs.pdf), for exactness and elliptic examples.
- Wilson, *The Ω-spectrum for Brown–Peterson cohomology II*, Amer. J. Math. 97 (1975), Corollary 5.1, and Hovey, [*The homotopy of MString and MU⟨6⟩ at large primes*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Hovey-bpbp1.pdf), Algebr. Geom. Topol. 8 (2008), Theorem 1.2, Corollary 1.6 and Theorem 1.7, for the Hopf-ring interfaces.
- Lubin–Tate, [*Formal moduli for one-parameter formal Lie groups*](https://www.numdam.org/item/BSMF_1966__94__49_0.pdf), Bull. Soc. Math. France 94 (1966), 49–59: the ⋆-isomorphisms (p. 49), Proposition 1.1 (p. 50), Proposition 2.4 (p. 52) for rigidity, Proposition 2.6 (p. 54), Theorem 3.1 (p. 56), §3.2 and Proposition 3.3 (p. 57) and §§3.4–3.5 (p. 58), for the universal deformation theorem, its automorphism action and the height-two elliptic example.
- Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), Section 4.J for the James construction and Section 4.L for the Steenrod operations, Adem relations and the admissible basis.
- Miller, [*Notes on Cobordism*](https://math.mit.edu/~hrm/papers/cobordism.pdf), Chapter 1, Sections 9–13, for the Steenrod algebra, Milnor's theorem on its dual (Theorem 11.2), the Milnor–Moore freeness criterion (Proposition 10.4), the freeness of H^*MO and the splitting of MO (Theorems 12.1–12.4), with Section 13 stating the ring π_*MO without proof; Chapter 2, Theorem 3.5 and Proposition 8.3, for Quillen's theorem and the Hurewicz embedding.
- Guillou–Weibel, [*Unstable operations in étale and motivic cohomology*](https://arxiv.org/abs/1301.0872), Definition 6.1, Theorem 6.2 and Theorem 6.5, for the algebraic forms of Borel's and Kudo's transgression theorems.
- Thom, *Quelques propriétés globales des variétés différentiables*, Comment. Math. Helv. 28 (1954), Chapitre IV, for the proof of the structure of the unoriented coefficient ring.
- Quillen, [*On the formal group laws of unoriented and complex cobordism theory*](https://www.ams.org/journals/bull/1969-75-06/S0002-9904-1969-12401-8/S0002-9904-1969-12401-8.pdf), Theorems 2 and 3, for the universality of the complex and unoriented laws, and Theorem 4 for the p-typical idempotent.
- James, *Reduced product spaces*, Annals of Mathematics 62 (1955), Sections 1–6, for the James construction and its filtration.
- Toda, *Composition Methods in Homotopy Groups of Spheres*, Annals of Mathematics Studies 49 (1962), Chapter I, for the three-fold Toda brackets and their suspension.

- Devinatz–Hopkins–Smith, [*Nilpotence and stable homotopy theory I*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/dhs-ocr.pdf), for the three nilpotence scopes and the Thom/James/vanishing-line proof.
- Hopkins–Smith, [*Nilpotence and stable homotopy theory II*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HS.pdf), Theorems 3, 7 and 9, for the Morava K-theory form of nilpotence and finite support, thick classification and periodicity.
- Ravenel, [*Nilpotence and Periodicity in Stable Homotopy Theory*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mybooks/nilpb2020.pdf), §§3.3, 7.2, 7.3 and 7.5, Chapters 6–8 and Appendices B and C, for invariant primes, the Landweber filtration and exact functor theorems (Theorem 3.3.7, p. 33, (B.5.19) and Theorem B.6.2, pp. 182–183), the thick subcategory and periodicity theorems (Theorem 3.4.3, p. 37, and Theorem 1.5.4, p. 9), Bousfield localization (Theorem 7.1.3, p. 76), Bousfield classes (Proposition 7.2.6(iii), p. 79, for the class of the source of a self-map; Theorem 7.2.7 and the telescopes of (7.2.8), p. 80; Theorem 7.3.2, p. 82, for the classes of P(n), B(n), v_n⁻¹BP, E(n) and K(n)), periodicity (§6.2: the operations P_t^s for t>s≥0, p. 63, Definition 6.2.3 of strong type and Theorem 6.2.4, pp. 64–65), the smash product theorem (Theorem 7.5.6, p. 87), the Hopkins–Ravenel smashing proof and Smith idempotents.
- Hovey–Strickland, [*Morava K-Theories and Localisation*](https://doi.org/10.1090/memo/0666), for generalized Moore systems, their local categories and completion comparisons.
- Greenlees–Sadofsky, [*The Tate spectrum of v_n-periodic complex oriented theories*](https://people.math.rochester.edu/faculty/doug/otherpapers/greenlees-sadofsky.pdf), Math. Z. 222 (1996), Theorem 1.1 (the number under which Hovey–Sadofsky, p. 3580, cite it), for the vanishing of the Tate spectrum of K(n), and Kuhn, [*Tate cohomology and periodic localization of polynomial functors*](https://arxiv.org/abs/math/0307173), Theorem 1.5, p. 4 (arXiv version), for its telescopic form, the two sources of F6.5's Tate vanishing.

- Hovey–Sadofsky, [*Tate Cohomology Lowers Chromatic Bousfield Classes*](https://doi.org/10.1090/S0002-9939-96-03495-8), Proc. Amer. Math. Soc. 124 (1996), Lemma 2.1 and Corollary 3.2, p. 3581, and §4, p. 3582, for the finite-height prenilpotence/Tate descent.
- Johnson–Wilson, *BP-operations and Morava’s extraordinary K-theories*, Math. Z. 144 (1975), 55–75, Proposition 4.14, for the operation-defined comparison, and Würgler, [*Cobordism theories of unitary manifolds with singularities and formal group laws*](https://doi.org/10.1007/BF01221149), Theorem 2.16 and Remark 6.19, for quotient operations and the stable homology comparison; the countable-cell/Milnor realization is the additional spectral adapter specified here.
- Clausen–Mathew, [*A short proof of telescopic Tate vanishing*](https://arxiv.org/html/1608.02063), Theorem 1.1, p. 1, for the statement of K(n)-local Tate vanishing proved in F6.5, and §2 (Proposition 2.3) for the unit/transfer and arbitrary-action module criteria.

- Symonds, [*Permutation complexes for profinite groups*](https://ems.press/content/serial-article-files/43113), §5, Theorem 5.2, Proposition 5.4, Corollary 5.5 and §7, for finite signed weak permutation resolutions and complete cohomology; the uniform-vcd comparison is constructed in F6.4.
- Nikolaus–Scholze, [*On topological cyclic homology*](https://arxiv.org/abs/1707.01799), §I.3 and Appendix A, for the induced-object ideal, coherent stable quotient/Ind construction and lax symmetric monoidal Tate functor.

- Lurie, [*Higher Topos Theory*](https://www.math.ias.edu/~lurie/papers/HTT.pdf), §§1.2.4, 1.2.9, 2.1.2, 2.2.1–2.2.5, 2.4.5–2.4.6, 3.1–3.3, 4.2.4, 4.3, 5.2.7, 5.3.5, A.2.6 and A.3.2–A.3.6, and [*Higher Algebra*](https://www.math.ias.edu/~lurie/papers/HA.pdf), §§4.1.8, 4.3.3, 4.8.1 and 7.3.2, for the categorical models, natural marked straightening, model-diagram rectification and (co)limit comparison, Kan extensions, Ind, operadic rectification, monoidal Ind and relative adjoints that F6.5 consumes from GeneralizedCohomology G2.11 and applies to Borel actions.
