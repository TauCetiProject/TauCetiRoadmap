# Roadmap: smooth representations of local groups

This roadmap builds the smooth representation theory of a locally profinite group G over an
arbitrary commutative coefficient ring A, and the local representation theory of G = 𝐆(F) for a
connected reductive group 𝐆 over a nonarchimedean local field F. It starts from Mathlib's algebraic
representations, invariants and coinvariants and from Tau Ceti's discrete modules over profinite
groups, and it ends with the Bernstein decomposition and centre, the Langlands classification conditional on Harish–Chandra tempered support,
second adjointness, the Satake isomorphism with its explicit normalisations, the integral families
of GL_n, and the algebra of finite-wild parameters, center images and stable operators.

Two principles govern the statements. Everything that makes sense over any ring is stated over any
ring: smoothness, invariants, compact induction, Jacquet modules, the permutation-module Hecke
algebra and Frobenius reciprocity need no averaging, and the hypotheses that do (a cofinal family
of compact open subgroups of pro-order invertible in A) are attached to the statements that use
them. The complex theory is developed in the order in which it is proved: uniform admissibility and
the Bernstein centre precede second adjointness, whose proof uses them.

## Scope and ownership

The roadmap owns the smooth category of a locally profinite group over any commutative ring, with
its smooth vectors, invariants, averaging projectors, admissibility, characters, contragredients,
coefficient change and centre (SR.0); Hecke algebras over rings in both the convolution and the
permutation-module model, their comparison with the double-coset Hecke ring, Hecke modules, the
Λ-linear Bernstein centre, positive Hecke algebras and the Iwahori–Matsumoto and Bernstein
presentations (SR.1); the Grothendieck property, the derived smooth category with its dg
enhancement, derived invariants, compact generation, derived duality and the derived Hecke algebra
(SR.0d); smooth and compact induction, Jacquet functors, parabolic induction, the first
adjointness, the geometric lemma, Casselman's pairing and Whittaker functionals (SR.2); compact and
cuspidal representations, Harish-Chandra's compactness theorem and uniform admissibility (SR.3a);
cuspidal support, the Bernstein decomposition and centre, noetherianity, the Langlands
classification conditional on Harish–Chandra tempered support and the Iwahori categories (SR.3); Bernstein's stabilisation theorem and second
adjointness over ℂ (SR.2a); the Satake transform and isomorphism with their explicit GL_n, unitary
and GSp_4 normalisations (SR.4); the integral local families of GL_n (SR.5); and the integral
algebra of finite-wild parameters, excursion coefficients, center images and stable operators
(SR.6).

It uses the carriers of the neighbouring roadmaps as they exist and adds the smooth category, its
functors and its theorems on top of them. From
[Reductive groups, Part II](../ReductiveGroupsPartII/README.md) it takes, from RG2.0, the locally
profinite topology on 𝐆(F) and its closed subgroups P(F), M(F), N(F), on which it builds smooth
representations of these groups; from RG2.1, the maximal split central torus and the valued root
datum (the relative roots are ReductiveGroups layer 7), on which it builds unramified characters
and Satake twisting; from RG2.3, the parahoric, Iwahori and pro-p Iwahori subgroups and the
Moy–Prasad filtration (congruence subgroups are RG2.0 and Iwahori factorisations RG2.4), on which
it builds positive Hecke algebras, the Iwahori block and uniform admissibility; from RG2.4, the
Iwasawa, Cartan and Iwahori–Bruhat decompositions, compactness of P\G (hence finiteness of
P\G/K), unimodularity and the modulus δ_P of the minimal parabolic, on which it builds the
geometric lemma, the modulus character over A, the Satake transform and the Iwahori–Matsumoto
presentation; and from RG2.5, the pinned integral dual group over ℤ with its Galois action through
a finite quotient and the L-group, on which it builds the Frobenius-coinvariant dual torus,
spherical parameters, finite-wild cocycle schemes and excursion algebras. From
[Profinite cohomology](../ProfiniteCohomology/README.md#layer-0-discrete-modules-and-continuous-sections)
layer 0 and [layer 1](../ProfiniteCohomology/README.md#layer-1-the-canonical-carrier-and-its-functoriality)
it takes discrete modules over profinite groups, their exhaustion by invariants of open normal
subgroups, and the canonical smooth discrete carrier `TauCeti.SmoothDiscreteTopRep`; this roadmap
adds the algebraic smooth category over any commutative ring and identifies it with that carrier
using Tau Ceti's `discreteRepEquivSmoothTopRep`, and layer 1's finite products, subobjects, quotients and
restriction are transported along it. From
[Profinite cohomology layer 7](../ProfiniteCohomology/README.md#layer-7-coinduced-modules-and-shapiros-lemma)
and [layer 10](../ProfiniteCohomology/README.md#layer-10-continuous-cohomology-in-all-degrees) it
takes coinduction, Shapiro's lemma and continuous cohomology of profinite groups, and adds derived
invariants of compact open subgroups and the derived Hecke algebra. From
[Profinite and pro-p groups](../ProfiniteProPGroups/README.md#layer-1-supernatural-order-and-index)
layer 1 it takes supernatural orders and pro-p groups, and adds compact open subgroups of pro-order
invertible in A. From
[Induction and restriction](../RepresentationTheory/InductionRestriction/README.md#layer-0-the-functorial-core----transitivity-and-the-projection-formula)
layer 0 and [layer 3](../RepresentationTheory/InductionRestriction/README.md#layer-3-the-mackey-decomposition-formula)
it takes algebraic induction in stages and the Mackey decomposition, and adds compact induction
from open subgroups, induction in stages and the Mackey filtration. From
[Modular forms](../ModularForms/README.md#layer-2-hecke-operators-and-the-hecke-algebra) layer 2
it takes the double-coset Hecke ring with Shimura's product and the GL_2 polynomial presentation,
and adds convolution and permutation-module Hecke algebras with their comparison with the
double-coset ring, and the all-rank Satake isomorphism. From
[Reductive groups](../ReductiveGroups/README.md#layer-3-subgroups-quotients-components) layer 3,
[layer 7](../ReductiveGroups/README.md#layer-7-structure-theory) and
[layer 9](../ReductiveGroups/README.md#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ) it
takes root data, parabolic and Levi subgroups, Weyl groups, the Bruhat decomposition, central
quotients and pinned split group schemes, and adds the representation theory of the rational
points. From [Class field theory](../ClassFieldTheory/README.md#layer-9-the-local-weil-group)
layer 9 it takes the local Weil group and its Frobenius elements (the wild and tame filtrations are
[Local fields and ramification](../LocalFieldsRamification/README.md); local Langlands for tori is
an input stated where used), and adds finite-wild discretisations and cocycle functoriality.

The boundaries with the roadmaps that consume this one are as follows. The ∞-categorical
enhancement of the derived smooth category and its comparison with étale sheaves on the
classifying stack are built by the v-stack and enhanced-sheaf roadmaps on the dg model of SR.0d.
SR.6 concerns the integral finite-wild cocycle scheme, invariant quotients and the free-group
excursion algebra. The geometric Hecke action on Bun_G, its map to the smooth center, and the
integral finiteness and second-adjointness consequences requiring that action are outside the
scope of this roadmap ([FS] Theorems IX.0.1 and IX.5.1; [DHKM1] Theorems 1.1–1.2 and
Corollary 1.3). No geometric action is an input to the remaining SR.6 targets. The arithmetic GL_n double-coset multiplication belongs to
ModularForms; the geometric Satake equivalence to GeometricSatakeAndFusion, which compares against
the trace contract of SR.4; two-parahoric unitary operators, the Iwahori and Klingen computations
for GSp_4 with their Galois applications, the GL_2 newvector theorem and the minimal-lift line of
integral families belong to their own roadmaps, and SR.4–SR.5 export the spherical products,
the spin polynomial and co-Whittaker families. Plancherel theory is not
here: the Langlands classification is proved from Casselman's criterion and takes as an explicit
hypothesis `RationalParabolic.harishChandra_temperedSupport`, owned by SR.3.3, giving Harish-Chandra's description of tempered representations as summands of unitary
inductions of discrete series. The Whittaker-functionals target constructs the functionals and
twisted quotient, and includes multiplicity one for irreducible complex representations of GL_2(F). Bushnell–Kutzko types beyond
the Iwahori case are not here.

The following supplier results fix the shared interfaces. Compact open subgroups form Hecke pairs, with U₁gU₂ a finite union of
[U₁ : U₁ ∩ gU₂g⁻¹] left cosets: ReductiveGroupsPartII, RG2.4 (compact double-coset finiteness),
with Tau Ceti `HeckeCoset.degree_eq_relIndex`. The base-change map B ⊗_A V^K → (B ⊗_A V)^K and its
isomorphism under an averaging projector: *coefficient-change*. The normalised Satake data used by geometric Satake are those of
*satake-isomorphism*; integral essential vectors for GL_n are outside this roadmap. The following
library and roadmap declarations are the algebraic or compact-group halves of targets that remain
here, which add the locally profinite, ring-valued or reductive clause: Tau Ceti `DiscreteRep`,
`IsSmoothDiscrete`, `discreteRepEquivSmoothTopRep`, `IsSmoothDiscrete.res` and
`SmoothDiscreteTopRep.hasFilteredColimits` (SR.0.1–SR.0.2); `Representation.ofLinearCharacter`,
`charTwist`, `charTwist_one`, `charTwist_charTwist` (smooth characters and twists); `Rep.dual`,
`Rep.dualMap`, `Rep.doubleDualIso` (the algebraic contragredient);
`Representation.invariantsBaseChangeEquiv` (finite groups) for coefficient change; `coind`,
`DiscreteCoind`, `coindFunctor`, `smoothDiscreteResCoindAdjunction`, `DiscreteCoind.transEquiv`,
`coindMap_surjective`, `coindFunctor_map_shortExact` and Profinite cohomology layer 7 for
induction, Frobenius reciprocity, stages and exactness over compact G (SR.2.1);
`Rep.mackeyDecomposition` for finite G; Mathlib `Representation.Coinvariants` of `charTwist ψ⁻¹ ρ`
for the twisted coinvariants (SR.2.3, SR.5.1); the Iwahori factorisations, cell products, index
formula [H : H ∩ zHz⁻¹] = δ_P(z)⁻¹ and Cartan decomposition of ReductiveGroupsPartII, RG2.3–RG2.4,
and the modulus of a parabolic of AdelicAlgebraicGroups, AA.2.2 (SR.1.4–SR.1.5, SR.2.2, SR.3a.2);
the central-coset localisation of Modular forms, layer 2 (SR.4.3); the Iwasawa presentation
Fr s Fr⁻¹ = s^q of Local fields and ramification, layer 4, with Tau Ceti `IsArithFrobeniusLift`,
`tameQuotientEquiv`, `wildInertiaSubgroup` (SR.6.1); and Mathlib's Fitting decomposition
`LinearMap.eventually_isCompl_ker_pow_range_pow`, of which stable operators on Noetherian Artinian
modules are the instance (SR.6.5).

## Conventions

**Groups.** G is a locally profinite group: a Hausdorff topological group in which the compact
open subgroups form a neighbourhood basis of 1; for locally compact totally disconnected groups
this is van Dantzig's theorem. Mathlib's `NonarchimedeanGroup` supplies open subgroups but not
their compactness. Reductive statements concern G = 𝐆(F) with 𝐆 connected reductive over F,
equipped with a specified nontrivial surjective discrete valuation. F is complete for this
valuation, hence henselian; its valuation ring is a discrete valuation ring and its residue
field is finite, hence perfect, of characteristic p and cardinality q = p^f with p prime
and f ≥ 1. The topology is the valuation topology, as in
[Reductive groups, Part II](../ReductiveGroupsPartII/README.md) RG2.0. Unit tests for reductive
groups are stated for GL_n(ℚ_p), realised as the units of the matrix ring.

**Coefficients.** A is any commutative ring. A statement that needs averaging assumes a cofinal
family of compact open subgroups of pro-order invertible in A; for a locally pro-p group this means
p ∈ Aˣ. Statements that do not need it hold over every A, including F_p for a p-adic group.
Normalised induction and Jacquet functors need a chosen square root q^{1/2} ∈ Aˣ; the unnormalised
versions exist always and are kept separate. Layers SR.3a, SR.3 and SR.2a are over ℂ. The
coefficient residue characteristic is ℓ ≠ p in SR.1's Λ-linear centre, in SR.5 and in SR.6; a
noetherian, flat, reduced or ℓ-torsion-free hypothesis is written on the theorem that needs it and
nowhere else. Admissibility means finite generation over A of every compact-open invariant module,
not a dimension condition.

**Measures and modulus.** An A-valued Haar measure is a finitely additive left-invariant function
on compact open subsets, normalised by μ(U₀) = 1 on a compact open subgroup of invertible
pro-order. The modulus δ_P of a parabolic P = MN is the factor by which conjugation by p ∈ P scales
a Haar measure of N, so δ_B(diag(p, 1)) = p⁻¹ in GL_2(ℚ_p); it is Mathlib's `modularCharacter` of
P, and δ_{P̄} = δ_P⁻¹ on M. Normalised induction is i_P σ = Ind_P^G(δ_P^{1/2} ⊗ σ), normalised
Jacquet is r_P V = δ_P^{−1/2} ⊗ V_N, and the unnormalised functors are written I_P and R_P. For
hyperspecial K the characteristic function of K is the convolution identity with vol(K) = 1, and
the raw Satake transform uses vol(N ∩ K) = 1.

**Hecke algebras.** H(G, U; A) is the algebra of finitely supported functions on U\G/U with the
matrix product of G-invariant kernels on G/U × G/U; it acts on V^U on the right by
v ∗ h = Σ_{Ug ∈ U\G} h(U, gU) g⁻¹v. When μ(U) is a unit it is the corner e_U H(G, A) e_U of the
convolution algebra. The convolution algebra acts on the left, f·v = ∫ f(g) ρ(g)v dμ(g); with
μ(U) = 1 the characteristic function 1_{UgU} acts on V^U by v ↦ Σ_{xU ⊆ UgU} ρ(x)v, which is the
right action of [Ug⁻¹U], not of [UgU]. The basis element [UgU] of SR.1.2 and Tau Ceti's
`HeckeCoset.heckeSum` act by the right action; the operator of a double coset KaK on V^K in
SR.2.3, SR.2a, SR.4.2 and SR.6.5 (Jacquet's lemma on invariants, Borel–Casselman, stabilisation,
spherical characters, stable operators) is the convolution operator of 1_{KaK}. The double coset
[UgU] has degree #(UgU/U). The integral Iwahori quadratic
relation is (T_s + 1)(T_s − q_s) = 0, and the integral presentation uses the positive braid monoid.

**Adjunctions.** First adjointness is r_P ⊣ i_P along the same parabolic; second adjointness is
i_P ⊣ r_{P̄} along the opposite parabolic, and in unnormalised terms the right adjoint of I_P is
δ_P ⊗ R_{P̄}. Frobenius reciprocity for compact induction from an open subgroup is c-Ind ⊣ Res;
for smooth induction from a closed subgroup it is Res ⊣ Ind.

**Centres.** The centre of a category is Mathlib's `CatCenter`, the endomorphisms of the identity
functor. The Bernstein centre over ℂ is the centre of SmoothRep ℂ G; the Λ-linear Bernstein centre
is π₀End of the identity of D(G, Λ) and equals lim_K Z(e_K H(G, Λ) e_K) over pro-p K. In SR.6,
Z-finiteness of a representation V concerns the image Z_V of the centre in End_G(V).

**Satake and parameters.** For an unramified group the Weyl group is the relative Weyl group W₀ of
a maximal F-split torus, with the Frobenius action on the pinned dual group retained; no
absolute-Weyl formula is substituted. Arithmetic Frobenius Fr satisfies Fr s Fr⁻¹ = s^q in the
discrete Weil group; a consumer using geometric Frobenius inverts it. The raw transform S* has
twisted relative-Weyl invariants as image; the normalised S = δ_P^{1/2} S* needs a chosen q^{1/2}
and has ordinary invariants as image. The lattice Λ = T(F)/T(F)⁰ is identified with the character
lattice of the dual torus by sending the class of λ(ϖ) to λ, and an unramified character θ of
T(F) with the point t_θ given by λ(t_θ) = θ(λ(ϖ)). With these identifications and
S*f(t) = ∫_N f(tn) dn, the Weyl twist is ((wΣ* − Σ*)/2)(q) and a pseudoroot squares to Σ*(q)⁻¹;
it satisfies both this square condition and a twisted-fixed-point condition. Treumann–Venkatesh
[TV] §2.9, (2.9.2), p. 187, associates α ⊗ z with t ↦ z^{v(α(t))}; with v(ϖ) = 1
this is our identification, not its inverse. Their displayed point-action signs require the
inversion transport explained in *twisted-weyl-invariance*. Unitary spherical
parameters are tuples of units paired under
reversal with middle entry 1; genericity is defined by evaluation and derivative units of the
polynomial, not by naive root statements. In Leslie's unramified quadratic GL_n(E) formulas q is
the residue cardinality of the base field, q_E = q². The GSp_4 spin polynomial pairs its roots as
αδ = βγ.

**Integral parameters.** One affine scheme of crossed cocycles of a finite-wild discrete Weil group
is chosen over ℤ[1/p], and every ℤ_ℓ model is its base change; the ℓ-adic comparison of
discretisations is a comparison, not a canonical integral identification.

**Names.** API and test names are given without the common namespace of
[Suggested.lean](Suggested.lean). The bold titles specify the full mathematical targets;
a special-case computation does not replace a target in its stated generality. Each target below is led by its bold title and its short name in italics; the *Needs*
clause that closes it names the earlier targets and the supplier layers it rests on, and the
`**Checks.**` paragraph names its unit tests. A mirrored Check has a searchable `Check` comment immediately above its Lean `example`. The Mathlib and Tau Ceti declarations each layer
rests on are collected by supplier under *Exact supplier contracts* (Tau Ceti names start with
`TauCeti.` or `HeckeCosetModule.`). The pinned libraries are Mathlib `6b7abb3c76` and Tau Ceti
`a91d3aaf`.

## Exact supplier contracts

All names in this section are part of the dependency contract, at the pins above. Each entry
records the layer that consumes it; subject descriptions without an exact declaration are not
dependencies.

### From Mathlib

The smooth representation design follows
[Mathlib PR 41525](https://github.com/leanprover-community/mathlib4/pull/41525),
`Mathlib/RepresentationTheory/Smooth/Basic.lean`: `Representation.Smooth.IsSmooth` is a
proposition-valued class asserting open stabilizers, and `smoothVectors` is a
`Subrepresentation`. The categorical extension in
[PR 41520](https://github.com/leanprover-community/mathlib4/pull/41520),
`Mathlib/RepresentationTheory/Smooth/SmRep.lean`, uses `ObjectProperty.FullSubcategory` and
smooth vectors as the right adjoint of its inclusion. These are design references rather than
suppliers at the pins. SR.0 constructs these interfaces in Tau Ceti using that design. The
[discussion of smooth p-adic representations](https://leanprover-community.github.io/archive/stream/116395-maths/topic/class.20and.20def.20%28p-adic.20reps%29.html)
also separates general topological-group smoothness from the reductive applications.

For SR.0: `NonarchimedeanGroup` (open subgroups as a neighbourhood basis, without compactness),
`IsTopologicalGroup.exist_openSubgroup_sub_clopen_nhds_of_one` and
`compact_exists_isClopen_in_isOpen` (the two halves of van Dantzig's theorem), `OpenSubgroup`,
`Representation`, `Representation.stabilizer`, `Representation.ofMulAction` (the carrier of
smoothness and the permutation representations used in the checks), `Rep` with `Rep.res`,
`Rep.quotient` and `Rep.mkQ` in `Mathlib/RepresentationTheory/Rep/Basic.lean` (restriction and
quotient objects of the ambient category; `Rep.ofQuotient` is instead the representation of G ⧸ S
on a module where the normal subgroup S acts trivially, and is not used for quotient objects; the
two types are Lean examples),
`CategoryTheory.ObjectProperty.FullSubcategory`,
`CategoryTheory.ObjectProperty.IsClosedUnderColimitsOfShape`,
`CategoryTheory.ObjectProperty.IsClosedUnderKernels`,
`CategoryTheory.ObjectProperty.IsClosedUnderCokernels` and `CategoryTheory.Coreflective` (the
full subcategory, its closure properties and the coreflection by smooth vectors),
`Representation.invariants`, `Representation.averageMap` (the finite-group averaging that the
projector extends), `MonoidAlgebra` and `Representation.asModule` (finite generation over A[G]),
`Representation.dual` (the algebraic contragredient), `CategoryTheory.CatCenter` and
`CategoryTheory.Linear.toCatCenter` (the centre and the ring map from A).

`CategoryTheory.CatCenter.app`, `CatCenter.naturality` and `CatCenter.ext` in
`Mathlib/CategoryTheory/Center/Basic.lean` supply evaluation, naturality and extensionality;
`ObjectProperty.FullSubcategory.mk` and `ObjectProperty.hom_ext` in
`Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean` and `Rep.Hom.ext` in
`Mathlib/RepresentationTheory/Rep/Basic.lean` supply bundling and morphism equality.
`SemidirectProduct.inv_left` and `inv_right` in `Mathlib/GroupTheory/SemidirectProduct.lean`
fix inversion of a parameter section; SR.6 adds the section attached to a crossed cocycle.

For SR.1: `LocallyConstant`, `CompactlySupportedContinuousMap` in
`Mathlib/Topology/ContinuousMap/CompactlySupported.lean` (the model of C_c^∞ for a discrete
target). `LocallyConstantCompact` differs by requiring no topology on the target; the comparison
uses `LocallyConstant.toContinuousMap` and `IsLocallyConstant.iff_continuous` in
`Mathlib/Topology/LocallyConstant/Basic.lean`. Also use `TopologicalSpace.CompactOpens` (the domain of an A-valued measure),
`MeasureTheory.Measure.haarMeasure` (the real-valued comparison), and the double-coset Hecke ring
`HeckeRing` on `IsHeckeTriple`, shared with Tau Ceti, which is the target of the comparison of
SR.1.2.

For SR.0d: `CategoryTheory.IsGrothendieckAbelian` with
`CategoryTheory.IsGrothendieckAbelian.enoughInjectives` and
`CategoryTheory.IsGrothendieckAbelian.hasExt`, `HasDerivedCategory`, `DerivedCategory`,
`DerivedCategory.Plus`, `DerivedCategory.singleFunctor`, `CategoryTheory.Abelian.Ext`,
`CochainComplex.IsKInjective`, `CochainComplex.isKInjective_of_injective`,
`CochainComplex.HomComplex`, `CochainComplex.HomComplex.CohomologyClass.equivOfIsKInjective`,
`CategoryTheory.Functor.rightDerivedFunctorPlus`, `Rep.invariantsFunctor`,
`Rep.indResAdjunction` with `CategoryTheory.Injective.injective_of_adjoint` (restriction preserves
injectives because algebraic induction is its exact left adjoint), and `continuousCohomology`
(the target of the comparison of derived invariants).

For SR.2: `Representation.coind` (smooth induction is its smooth part), `Rep.ind` and
`Rep.indResAdjunction` (compact induction from an open subgroup and its Frobenius reciprocity),
`MeasureTheory.Measure.modularCharacter` (the modulus character), `Representation.Coinvariants`
and `Rep.coinvariantsFunctor` (the Jacquet module).

For SR.3a: `Module.End.instDivisionRing`, `Transcendental.linearIndependent_sub_inv` (the
countable-dimension form of Schur's lemma) and `Module.Finite.toModuleEnd_moduleEnd_surjective`
(Burnside's theorem for the isotypic quotients).

For SR.6: `Representation.tprod` (external tensor products in the excursion data).

The following exact algebraic suppliers are used directly:

- `LinearMap.range`, `LinearMap.range_id`, `LinearMap.range_zero` in
  `Mathlib/Algebra/Module/Submodule/Range.lean`, and `LinearEquiv.ofInjective` in
  `Mathlib/Algebra/Module/Submodule/Equiv.lean`. The Schwartz target adds the canonical
  mirabolic map and proves its injectivity; an arbitrary map's range supplies neither.
- `IsFiniteLength` and `isFiniteLength_iff_isNoetherian_isArtinian` in
  `Mathlib/RingTheory/FiniteLength.lean` supply finite length of the group-algebra module.
- `TauCeti.sign_eq_neg_one_pow_card_inversion` in
  `TauCeti/GroupTheory/Perm/Inversion.lean` supplies the sign of a permutation as (−1) to its
  inversion count. `inversionLength` retains the natural-number count used in the Hall normalizer.
- `Representation.quotient` in `Mathlib/RepresentationTheory/Basic.lean` supplies the
  representation on an invariant quotient.
- `Representation.invariants` in `Mathlib/RepresentationTheory/Invariants.lean` supplies
  subgroup invariants by restriction of the representation.
- `Representation.Coinvariants`, `Representation.Coinvariants.mk` in
  `Mathlib/RepresentationTheory/Coinvariants.lean` supply ordinary coinvariants. The
  Whittaker quotient records the ψ-twisted relation explicitly and must be identified with
  the ordinary coinvariants of the inverse character twist.
- `LinearMap.eventually_isCompl_ker_pow_range_pow` in
  `Mathlib/RingTheory/Artinian/Module.lean` supplies Fitting decomposition on Noetherian Artinian
  modules. `StableOperator` allows arbitrary modules and asks for such a decomposition
  without either chain condition.

### From Tau Ceti

For SR.0: `TauCeti.IsSmoothDiscrete`, `TauCeti.SmoothDiscreteTopRep` in
`TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean` (topologized
discrete modules; the algebraic representation carrier here has no topology on its module),
`TauCeti.isSmoothDiscrete_iff_continuousSMul` and `TauCeti.discreteRepEquivSmoothTopRep` (the
discrete-module carrier and the comparison with the algebraic smooth category),
`TauCeti.iSup_fixedPoints_openNormal_eq_top` and `TauCeti.directed_fixedPoints_addSubgroup` (the
profinite exhaustion that compact-open invariants extend), `TauCeti.profiniteOrder`,
`TauCeti.ofNat_card_quotient_le_profiniteOrder` and `TauCeti.IsProP` (supernatural order and
pro-p groups behind invertible pro-order), and `Representation.baseChange` (coefficient change).

For SR.1: the double-coset Hecke ring 𝕋 (⊤) U A of Mathlib/Tau Ceti as `HeckeRing` with
`HeckeCosetModule`, Shimura's product `HeckeCosetModule.mul`, `HeckeCosetModule.single_mul_single`,
`HeckeCosetModule.mul_assoc`, `HeckeCosetModule.instRingHeckeRing` and
`HeckeCosetModule.structureConstants` (the multiplicities m(D₁, D₂; D) that the comparison
matches), `HeckeRing.GLn.polynomialRingEquivTwo` (the GL_2 polynomial presentation, reused by the
GL_n spherical generators), `HeckeCoset.heckeSum` (the operator of one double coset on
invariants) and `HeckeCoset.degree_eq_relIndex` (the degree of a double coset).

For SR.0d and SR.2: `TauCeti.indTrivialIso` (c-Ind_U^G A = A[G/U]), `TauCeti.Rep.indFunctorCompIso`
(transitivity of algebraic induction), `TauCeti.indProjection` (the projection formula for open
H) and `Rep.mackeyDecomposition` (the Mackey decomposition for finite G, the direct-sum case of the
Mackey filtration).

For SR.4: `HeckeRing.GL2.Newform.satakeParameters` (the Satake pair of a classical newform at p,
which the spherical parameters must agree with).

For SR.6: `TauCeti.AffineGroupSchemeCat` (the affine group schemes carrying the cocycle scheme),
and `IsArithFrobeniusLift`, `tameQuotientEquiv`, `wildInertiaSubgroup` (the Iwasawa presentation
of the tame quotient, consumed by the finite-wild discretisation).

`Representation.ofLinearCharacter` in `TauCeti/RepresentationTheory/LinearCharacter/Basic.lean`
supplies the character representation over any commutative semiring. `Representation.charTwist`,
`Representation.charTwist_one` and `Representation.charTwist_charTwist` in
`TauCeti/RepresentationTheory/CharacterTwist.lean` supply twisting. SR.0 adds the open-kernel
criterion and the functor on smooth representations. `TauCeti.IsCrossedHom` in
`TauCeti/Topology/Algebra/Group/CrossedHom.lean` treats additive ring-valued crossed maps;
SR.6's `CrossedCocycle` instead has an arbitrary, possibly noncommutative, target group.

### From TauCetiRoadmap.ReductiveGroupsPartII

RG2.0: the locally profinite topology on 𝐆(F) and on P(F), M(F), N(F), and congruence subgroups.
RG2.1: the maximal split central torus and the valued root datum. RG2.3: parahoric, Iwahori and
pro-p Iwahori subgroups, the Moy–Prasad filtration and congruence subgroups in good position.
RG2.4: the Iwasawa, Cartan and Iwahori–Bruhat decompositions, Iwahori factorisations and cell
products, compact double-coset finiteness and the index formula [H : H ∩ zHz⁻¹] = δ_P(z)⁻¹,
compactness of P\G, unimodularity and the modulus δ_P of the minimal parabolic. RG2.5: the pinned
integral dual group over ℤ with its Galois action through a finite quotient and the L-group. These
are consumed as imported objects; no second topology, parahoric or dual group is defined here.

### From TauCetiRoadmap.ProfiniteCohomology

Layer 0: discrete modules over profinite groups and their exhaustion by invariants of open normal
subgroups. Layer 1: the canonical carrier `TauCeti.SmoothDiscreteTopRep` with its finite products,
subobjects, quotients and restriction, which SR.0.2 transports along
`discreteRepEquivSmoothTopRep`. Layer 7: coinduced modules and Shapiro's lemma, consumed by the
derived Hecke algebra and by exactness of induction. Layer 10: continuous cohomology in all
degrees, the target of the comparison of derived invariants in SR.0d.

### From TauCetiRoadmap.ProfiniteProPGroups

Layer 1: supernatural order and index, which defines the pro-order of a profinite group and the
pro-p property behind *unit-pro-order*.

### From TauCetiRoadmap.RepresentationTheory.InductionRestriction

Layer 0: the functorial core, transitivity and the projection formula of algebraic induction, with
which compact induction from open subgroups agrees. Layer 3: the Mackey decomposition formula, the
finite case of the Mackey filtration.

### From TauCetiRoadmap.ModularForms

Layer 2: the double-coset Hecke ring with Shimura's product, the GL_2 polynomial presentation and
the central-coset localisation, which SR.1.2 compares with and SR.4.3 reuses rather than defining
another multiplication.

### From TauCetiRoadmap.ReductiveGroups

Layer 3: subgroups, quotients and components, for the c-group formulation. Layer 7: structure
theory, with the relative roots, parabolic and Levi subgroups, Weyl groups and the Bruhat
decomposition that the parabolic pairs, the geometric lemma and the dual-group arguments use.
Layer 9: the pinned Chevalley–Demazure group schemes over ℤ, carrying the finite-wild cocycle
scheme.

### From TauCetiRoadmap.ClassFieldTheory

Layer 9: the local Weil group and its Frobenius elements, consumed by the torus-character
dictionary, the finite-wild discretisation and the torus compatibility of the excursion action.
Local Langlands for tori is an input stated where used.

### From TauCetiRoadmap.LocalFieldsRamification and TauCetiRoadmap.AdelicAlgebraicGroups

Local fields and ramification, layer 4: the wild and tame filtrations and the Iwasawa
presentation Fr s Fr⁻¹ = s^q. Adelic algebraic groups, AA.2.2: the modulus of a parabolic, of
which the ring-valued modulus character of SR.2.2 is the coefficient-safe form.

## How to read the build

`README.md` fixes the hypotheses and conclusions of the targets. `Suggested.lean` supplies
carriers, statements and examples with proof placeholders. The layers depend on one another in the order
SR.0 → SR.1 → SR.0d → SR.2 → SR.3a → SR.3 → SR.2a → SR.4 → SR.5 → SR.6, and they are presented
below in that order. SR.0d follows SR.1 because the derived Hecke algebra extends the
permutation-module Hecke algebra, and precedes SR.2 because the Jacquet module of a regular
principal series splits by the vanishing of Ext between distinct central characters. SR.2a follows
SR.3a and SR.3 because Bernstein's stabilisation theorem uses uniform admissibility, the Bernstein
decomposition, noetherianity and generic irreducibility; SR.3 itself uses nothing from SR.2a, since
the centre is proved by the Bernstein–Deligne route. SR.4 uses SR.1 and SR.2; SR.5 uses SR.3; SR.6
uses SR.0–SR.3, SR.2a and SR.4 and is used by nothing earlier. Within a target, *Needs* names the
earlier targets by their short names and the supplier layers by roadmap and layer; the references
in parentheses are to the editions listed under *References*, by printed page.

## Layer SR.0: the smooth category and its basic API

Smooth representations of a locally profinite group G on modules over an arbitrary commutative
ring A. The carrier is the full subcategory of Mathlib's `Rep A G` on the representations all of
whose vectors have open stabilisers. It is abelian, closed under colimits and coreflective: the
smooth vectors give the right adjoint of the inclusion, and hence limits.

### SR.0.1 Locally profinite groups and smoothness

**Compact open subgroups form a neighbourhood basis** (*van-dantzig*). Let G be a Hausdorff
topological group (`Group`, `TopologicalSpace`, `IsTopologicalGroup`, `T2Space`). Prove that the
following are equivalent: (a) G is locally compact and totally disconnected; (b) G is locally
compact and `NonarchimedeanGroup` (every neighbourhood of 1 contains an open subgroup); (c) every
neighbourhood of 1 contains a compact open subgroup. Such a G is called locally profinite (an
l-group). Prove that in that case every open subgroup contained in a compact neighbourhood of 1 is
compact, every compact open subgroup is profinite, and the compact open subgroups contained in a
given one form a cofinal directed family under reverse inclusion ([Ber92] Ch. I §1.1,
Definition 1, p. 7 (the definition); (a) ⇔ (c) is van Dantzig's theorem, from Mathlib's
`compact_exists_isClopen_in_isOpen` and
`IsTopologicalGroup.exist_openSubgroup_sub_clopen_nhds_of_one`). *Needs:* the library vocabulary
of this layer.


The two basis formulations are `locallyProfinite_iff_compactOpenBasis` and `locallyProfinite_iff_nonarchimedean`; `exists_compactOpenSubgroup_le` gives the subgroup inside a specified neighbourhood.

**Smooth representations** (*is-smooth*). Let G be a topological group (`IsTopologicalGroup`), A
a commutative ring and ρ : Representation A G V a representation on an A-module V, with no
topology on V. Define `Representation.IsSmooth` by IsSmooth ρ :⇔ ∀ v, IsOpen {g | ρ g v = v}: the
representation is smooth if for every v ∈ V the stabiliser {g ∈ G | ρ g v = v} is open in G. Prove
`Representation.isSmooth_iff_exists_openSubgroup`: for any topological group G, ρ is smooth iff
every v is fixed by some open subgroup, and for a locally profinite G iff every v is fixed by some
compact open subgroup, i.e. V = ⋃_U V^U over compact open U. Prove
`Representation.IsSmooth.subrepresentation` and `Representation.IsSmooth.quotient`: a
subrepresentation and a quotient representation of a smooth representation are smooth ([Ber92]
Ch. I Definition 2 and Proposition 1, p. 7). *Needs:* *van-dantzig*.

**Checks.**

- `Representation.isSmooth_trivial`: the trivial representation of any topological group on any
  A-module is smooth.
- `Representation.not_isSmooth_leftRegular`: for G = ℤ_p (additive, p-adic topology) and A = ℤ,
  the left regular representation on ℤ[ℤ_p] is not smooth.
- `Representation.isSmooth_ofMulAction_zmod`: for G = ℤ_p and U = p^n ℤ_p, the permutation
  representation ℤ[ℤ_p ⧸ U] is smooth and every vector is fixed by U.

**Smooth vectors and the smooth part functor** (*smooth-vectors*). For a topological group G, a
commutative ring A and any representation ρ : Representation A G V, define
`Representation.smoothVectors`, the subrepresentation V^∞ = {v ∈ V | the stabiliser of v is open}
of smooth vectors, and prove `Representation.mem_smoothVectors_iff`: v ∈ V^∞ ↔ IsOpen (stabiliser
of v), and for locally profinite G ↔ ∃ compact open U, v ∈ V^U, so that V^∞ = ⋃_U V^U over compact
open U. Prove `Representation.smoothVectors_isSmooth`, that the restriction of ρ to V^∞ is smooth,
and `Representation.smoothVectors_eq_top_iff`, V^∞ = ⊤ iff ρ is smooth. The assignment V ↦ V^∞ is
a functor smoothPart : Rep A G ⥤ SmoothRep A G which is right adjoint to the inclusion
ι : SmoothRep A G ⥤ Rep A G; the counit ι(V^∞) → V is the inclusion and is an isomorphism exactly
when V is smooth, so SmoothRep A G is a coreflective full subcategory of Rep A G ([Ber92] Ch. I
§1.1, Definition 2 and Proposition 1, p. 7). *Needs:* *is-smooth*.

**Checks.**

- `Representation.smoothVectors_product_ne_top`: for G = ℤ_p, the product over n of ℤ[ℤ_p ⧸ p^n
  ℤ_p] is not smooth, the family of basepoints not being a smooth vector.
- `Representation.smoothVectors_leftRegular_eq_bot`: for G = ℤ_p and A = ℤ the smooth vectors of
  the left regular representation on ℤ[ℤ_p] are 0.
- `Representation.smoothVectors_of_discreteTopology`: for G discrete, V^∞ = ⊤ for every
  representation.

**Check (topology).** The topological-group hypothesis on smooth vectors is essential. Give S₃ the topology generated
by the subgroup ⟨(01)⟩. In ℚ[S₃/⟨(01)⟩], the basis vector at that coset has open stabilizer,
whereas its translate by (12) does not. Thus an arbitrary topology does not give a
subrepresentation of smooth vectors; the corresponding Lean `example` uses this topology.

**Checks (coreflection).** The Lean examples compute the counit on a smooth vector as its
underlying vector, compute the image of a morphism as the original equivariant map, show that
the counit is invertible for discrete G, and show that the smooth part of the zero module is zero.
These use `SmoothRep.smoothPart_map_apply` and `SmoothRep.smoothPartAdjunction_counit`; the
adjunction has the inclusion as counit, fixing its normalization. The zero representation also
has smooth-vector submodule ⊤.

### SR.0.2 The abelian category and the discrete comparison

**The category of smooth representations** (*smooth-rep-category*). For a commutative ring A and
a topological group G (locally profinite for the invariant-theoretic API), define `SmoothRep` as
SmoothRep A G := ObjectProperty.FullSubcategory (fun V : Rep A G ↦ IsSmooth V.ρ), the full
subcategory of Mathlib's Rep A G on the smooth representations. Morphisms are A-linear
G-equivariant maps, so the category is A-linear; its limits, colimits and abelian structure are
*smooth-rep-abelian*. Define `SmoothRep.ι`, the fully faithful inclusion SmoothRep A G ⥤ Rep A G,
and use `ObjectProperty.FullSubcategory.mk` to bundle ρ with its smoothness proof.
Use `ObjectProperty.hom_ext` and `Rep.Hom.ext` for equality of morphisms ([Ber92] Ch. I §2, p. 11). *Needs:* *is-smooth*, *smooth-vectors*.

**Checks.**

- `SmoothRep.equivalence_of_discrete`: for G with the discrete topology, ι is an equivalence
  SmoothRep A G ≌ Rep A G.
- `SmoothRep.end_trivial`: the endomorphism algebra of the trivial object A of SmoothRep A G is A.
- `SmoothRep.not_closed_under_extensions`: for G = ℤ_p and A = ℚ, a non-continuous ℚ-linear map
  ℚ_p → ℚ defines an extension of the trivial representation by itself in Rep ℚ ℤ_p whose middle
  term is not smooth, so SmoothRep is not a Serre subcategory of Rep.

**Checks (bundled objects).** The Lean examples assert that the actual inclusion is an equivalence
for discrete G, identify the endomorphism ring of the trivial rank-one smooth object with A,
and exclude the integral regular representation of ℤ_p from the full subcategory.

**Smooth representations form an abelian category** (*smooth-rep-abelian*). For a commutative
ring A and a topological group G, prove that the property 'smooth' on Rep A G contains 0 and is
closed under kernels, cokernels, subobjects, quotients, finite products, arbitrary direct sums and
filtered colimits. Conclude that SmoothRep A G is an abelian category with all colimits (computed
in Rep A G) and all limits (the smooth parts of limits in Rep A G), that the inclusion into
Rep A G is exact and preserves all colimits, that kernels and cokernels are computed on underlying
A-modules, and that a morphism is a monomorphism (epimorphism) iff it is injective (surjective).
It is not closed under extensions in Rep A G ([Ber87] §1.1, p. 3). *Needs:*
*smooth-rep-category*.

The abelian structure extends the preadditive structure inherited from `Rep A G`:
addition and scalar multiplication of morphisms are the underlying operations on
intertwining maps. In particular its zero morphisms agree with those used in cochain complexes.


`SmoothRep.mono_iff_injective` and `SmoothRep.epi_iff_surjective` identify the categorical maps with their underlying functions. `SmoothRep.inclusion_exact` and `SmoothRep.inclusion_colimits` give the exactness and colimit assertions.

**Smooth representations as discrete continuous representations** (*smooth-discrete-comparison*).
Give the commutative ring A the discrete topology and let G be a
topological group. Prove that sending a smooth representation (V, ρ) to the object of TopRep A G
with the discrete topology on V defines an equivalence between SmoothRep A G and Tau Ceti's
SmoothDiscreteTopRep A G (objects of TopRep A G with discrete underlying module and open point
stabilisers), compatible with forgetting to A-modules. On a discrete module, smoothness is
equivalent to joint continuity of G × V → V (`TauCeti.isSmoothDiscrete_iff_continuousSMul`). The
closure properties proved for SmoothDiscreteTopRep by ProfiniteCohomology layer 1 match those of
*smooth-rep-abelian*; layer 1's closure properties are transported along this equivalence
([Ber92] Ch. I §1.3, Important Example and Fact, p. 10). *Needs:* *smooth-rep-category*;
ProfiniteCohomology layer 1.


Use `SmoothRep.toDiscrete`, with its action pinned by `SmoothRep.toDiscrete_carrier`; `SmoothRep.toDiscrete_equivalence` states the equivalence.

Checks:

- `SmoothRep.toDiscrete_trivial`: the trivial object remains trivial.
- `SmoothRep.toDiscrete_zero`: the zero module remains zero.
- `SmoothRep.toDiscrete_discrete`: for discrete G every representation is allowed.

`SmoothRep.toDiscrete_discrete` identifies both the underlying module and its G-action through the same linear equivalence.

### SR.0.3 Compact open invariants and averaging

**Invariants under compact open subgroups** (*compact-open-invariants*). For a locally profinite
G, a commutative ring A and a compact open subgroup U ≤ G, define `SmoothRep.invariants`, the
U-invariants V^U of a smooth representation V as Mathlib's invariants of the restriction,
V^U = (ρ.comp U.subtype).invariants, an A-submodule of V (for a compact open, or indeed any,
subgroup U), and `SmoothRep.invariantsFunctor`, the A-linear functor invariantsFunctor U :
SmoothRep A G ⥤ ModuleCat A, V ↦ V^U, acting on morphisms by restriction; it is left exact. Prove
`SmoothRep.invariants_antitone`, U' ≤ U implies V^U ≤ V^{U'}; `SmoothRep.invariants_conj`, that
ρ(g) maps V^U isomorphically onto V^{gUg⁻¹}; that for U' ≤ U open normal, V^U = (V^{U'})^{U/U'};
and the union description: V is smooth iff V = ⨆_U V^U, the supremum running over any
neighbourhood basis of 1 consisting of compact open subgroups, and that family is directed. This
extends Tau Ceti's profinite exhaustion `iSup_fixedPoints_openNormal_eq_top` (ProfiniteCohomology
layer 0) from open normal subgroups of a profinite group to the compact open subgroups of a
locally profinite group ([Ber92] Ch. I §2.2, Proposition 6(1) and its proof, p. 14). [BH06] 2.1, p. 13, gives exhaustion by compact-open invariants over ℂ; the union and conjugation arguments use no division and apply over A. *Needs:*
*smooth-rep-category*, *van-dantzig*; ProfiniteCohomology layer 0.

**Checks.**

- `SmoothRep.invariants_permutation_gl2`: for G = GL_2(ℚ_p) and U = GL_2(ℤ_p), the U-invariants of ℤ[G/U] are free on the double cosets of diag(p^a, p^b), a ≥ b.
- `SmoothRep.invariants_top_of_trivial`: for the trivial representation, V^U = V for every U.
- `SmoothRep.invariants_not_exact_fp`: for G = ℤ/p (discrete) and A = F_p, the U = G invariants of
  F_p[G] → F_p (augmentation) are not surjective, so invariantsFunctor is not right exact without
  invertibility of |U|.

**Profinite groups of invertible pro-order** (*unit-pro-order*). Let U be a compact (profinite)
group and A a commutative ring. Define `HasUnitProOrder` by
HasUnitProOrder A U :⇔ ∀ N : OpenNormalSubgroup U, IsUnit (Nat.card (U/N) : A).
Compactness makes these quotients finite. Equivalently, for every open subgroup U' ≤ U the index
[U : U'] is a unit of A, using the open normal core;
equivalently every prime in the support of the supernatural order of U (ProfiniteProPGroups
layer 1) is a unit in A. Prove `hasUnitProOrder_of_le`, that it passes from a compact subgroup K
to every open subgroup K' ≤ K (compactness of K suffices, through the open normal core), and that
for K profinite it passes to every closed subgroup; `hasUnitProOrder_of_proP`, that a compact
pro-p subgroup (Tau Ceti's `TauCeti.IsProP p K`, used verbatim as the hypothesis) has invertible
pro-order in any A with IsUnit (p : A); and `HasUnitProOrder.map`, that it is inherited along ring
homomorphisms A → B. A locally profinite group G has a cofinal
family of compact open subgroups of invertible pro-order in A if every neighbourhood of 1 contains
such a subgroup; for a non-discrete locally pro-p group (some compact open subgroup is pro-p) and
A ≠ 0 this holds exactly when p ∈ A^× ([Ber87] §1.3, p. 4). *Needs:* *van-dantzig*;
ProfiniteProPGroups layer 1.

**Checks.**

- `hasUnitProOrder_padicInt_iff`: HasUnitProOrder A ℤ_p ↔ IsUnit (p : A), for A nonzero.
- `hasUnitProOrder_finite_iff`: for a finite discrete group U, HasUnitProOrder A U ↔ IsUnit
  (Nat.card U : A).
- `hasUnitProOrder_trivial`: the trivial group has invertible pro-order in every A.
- For the discrete group ⨁_ℕ F₂, every quotient is an abstract 2-group, but the quotient by
  zero is infinite and has Nat.card = 0. Thus the displayed predicate fails over ℚ even though
  2 is a unit. The compactness hypothesis in `hasUnitProOrder_of_proP` excludes this example.
- The closed-subgroup case needs K profinite, not merely compact. The circle group is connected,
  so its only open normal subgroup is itself and it has unit pro-order over F_p; its closed
  subgroup μ_p carries the discrete topology, and the quotient by {1} has order p, which is 0 in
  F_p. The Lean example records both halves; `hasUnitProOrder_of_le` is stated for open K'.


`HasUnitProOrder.closed_subgroup` restricts invertible pro-order to a closed subgroup of a compact totally disconnected Hausdorff group. `HasUnitProOrder.iff_open_index` tests every open subgroup, without requiring normality.

**The averaging projector onto U-invariants** (*averaging-projector*). Let G be locally
profinite, A commutative, U a compact open subgroup of G with HasUnitProOrder A U, and V a smooth
A[G]-module. For v ∈ V choose an open normal subgroup U' ≤ U fixing v and set
e_U v = [U : U']⁻¹ Σ_{u ∈ U/U'} ρ(u) v. Define `Representation.averaging`, e_U : V →ₗ[A] V, and prove
`Representation.averaging_apply`, e_U v = [U:U']⁻¹ Σ_{u∈U/U'} ρ u v for any open normal U' ≤ U fixing
v, so that it is independent of U'; it is A-linear, natural in V, commutes with every
U-equivariant map, and extends Mathlib's `Representation.averageMap` from finite groups. Prove
`SmoothRep.averaging_idem`, e_U ∘ e_U = e_U, and `Representation.range_averaging`, range e_U = V^U.
For U' ≤ U, e_U e_{U'} = e_{U'} e_U = e_U. Its kernel is the span of {ρ(u)v − v : u ∈ U} ([Ber92]
Ch. I §2.1, p. 11 and Proposition 6(1), p. 14). *Needs:* *compact-open-invariants*,
*unit-pro-order*.

**Checks.** On the sign representation of C₂ over ℚ, the two-term average is
(1/2)(1 + (−1)) = 0. Over F₂ the group order is not a unit. Both computations are Lean examples.

- `SmoothRep.averaging_sign`: for U = ℤ/2 acting by −1 on ℤ[1/2], e_U = 0.
- `SmoothRep.averaging_trivial`: on the trivial representation e_U = id.
- `SmoothRep.averaging_eq_averageMap_test`: for G finite discrete and U = G with |G| invertible,
  e_G = Representation.averageMap.

**Checks (computed operator).** For the character of C₂ over ℚ with χ(s) = −1, the
actual `Representation.averaging` sends 1 to (1 + (−1))/2 = 0. For a trivial representation
it is the identity. Over F₂ the full C₂ subgroup fails `HasUnitProOrder`. Each is a Lean example.


`Representation.averaging_natural`, `Representation.averaging_ker` and `Representation.averaging_nested` specify functoriality, the span of the relations in the kernel, and the composition of nested averages.

**Exactness of invariants for invertible pro-order** (*invariants-exact*). Let G be locally
profinite, A commutative and U a compact open subgroup with HasUnitProOrder A U. Prove that
invariantsFunctor U : SmoothRep A G ⥤ ModuleCat A is exact, commutes with arbitrary direct sums
and filtered colimits, and that V^U is a natural direct summand of V as an A[U]-module. Without
the hypothesis exactness fails: for U = ℤ/p and A = F_p the U-invariants of F_p[U] → F_p are not
surjective ([Ber92] Ch. I §3.3, Proposition 10(2) and its proof, p. 17). [BH06] 2.3 Corollary 1, p. 16, gives the complex case; over A the specified unit-pro-order averaging proves surjectivity. *Needs:*
*averaging-projector*, *compact-open-invariants*, *smooth-rep-abelian*.


`SmoothRep.invariants_leftExact`, `SmoothRep.invariants_exact` and `SmoothRep.invariants_colimits` state the categorical assertions with compactness and invertible pro-order where required.

### SR.0.4 Admissibility, characters, duals, coefficients and the centre

**Admissible representations** (*admissible*). Let G be locally profinite, A a commutative ring
and V smooth. Define `Representation.IsAdmissible` by
IsAdmissible ρ :⇔ IsSmooth ρ ∧ ∀ U compact open, Module.Finite A (V^U): V is admissible if for
every compact open subgroup U the A-module V^U is finitely generated. Over a field this says
dim V^U < ∞ (Casselman's definition). Prove `Representation.isAdmissible_iff_basis`: it suffices to check U in a neighbourhood basis
of compact open subgroups when either every compact open subgroup has pro-order invertible
in A (then V^U = e_U V^{U'} is a direct summand of V^{U'} for U' ≤ U) or A is noetherian (then
V^U is a submodule of a finitely generated module). Prove that finite direct
sums of admissible representations are admissible; `Representation.IsAdmissible.subrepresentation`,
that over a noetherian A subrepresentations of admissible representations are admissible; and
`Representation.IsAdmissible.quotient`, that quotients of admissible representations are
admissible when every compact open subgroup has invertible pro-order, invariants then being exact
(*invariants-exact*) ([Cas95] §0, conditions (a)–(b), p. 2). [BH06] 2.1, p. 13, is the complex definition; finite generation replaces finite dimension over A, with the stated Noetherian or averaging hypotheses on the closure results. *Needs:* *compact-open-invariants*,
*averaging-projector*, *invariants-exact*.

**Checks.**

- `Representation.isAdmissible_quotient_compact`: for G = ℤ_p and A = ℚ, ℚ[ℤ_p ⧸ p^n ℤ_p] is
  admissible with (·)^{ℤ_p} of dimension 1.
- `Representation.not_isAdmissible_cInd_qp`: for G = ℚ_p and A = ℚ, ℚ[ℚ_p ⧸ ℤ_p] is smooth but not
  admissible.
- `Representation.isAdmissible_zero`: the zero representation is admissible.

**Checks (coefficient modules).** The Lean examples give admissibility for a finite module with
trivial action over a Noetherian A, and for the zero module over any A. For compact G the
trivial action on ℚ^{(ℕ)} is not admissible: its G-invariants are the whole infinite-dimensional
module. These distinguish finite generation from smoothness.

**Check (local compactness).** The Lean predicate quantifies over compact open subgroups, so its
finiteness clause is empty when there are none. For G = ℚ_p^ℕ with the product topology every open
subgroup contains a coordinate factor ℚ_p, so no open subgroup is compact, and the trivial action
on ℚ^{(ℕ)} satisfies `Representation.IsAdmissible`. Both facts are Lean examples; every statement
about admissibility in this roadmap assumes G locally profinite.

**Finitely generated and locally admissible representations** (*finiteness-conditions*). Let G
be locally profinite and A a commutative ring, noetherian for the comparison statements. Two
finiteness conditions are kept separate from admissibility. A smooth representation V is finitely
generated if ρ.asModule is a finitely generated A[G]-module (Mathlib's Module.Finite over
MonoidAlgebra A G); prove `Representation.fg_iff_module_finite`, that finite generation is
Module.Finite (MonoidAlgebra A G) ρ.asModule, equivalently that V is a quotient of
⊕_{i≤n} A[G/U_i] for compact open U_i. Define `Representation.IsLocallyAdmissible`: V is locally
admissible if every v ∈ V generates an admissible subrepresentation A[G]·v. Prove
`Representation.IsAdmissible.isLocallyAdmissible`, admissible ⇒ locally admissible over a
noetherian A, and `Representation.isAdmissible_of_fg_of_locallyAdmissible`, finitely generated and
locally admissible ⇒ admissible over a noetherian A in which every compact open subgroup has
invertible pro-order; neither admissibility nor finite generation implies the other ([CG18-arXiv]
arXiv v2 §9.2.1, Definition 9.11, p. 91 and §9.2.2, p. 94 (use of the notion, which is
Emerton's); the comparisons are elementary from *admissible*). *Needs:* *admissible*.

**Checks.**

- `Representation.fg_not_admissible`: ℚ[ℚ_p ⧸ ℤ_p] is finitely generated and not admissible.
- `Representation.admissible_not_fg`: ⊕_{n≥1} of characters of ℤ_p of exact conductor p^n (over
  ℚ(μ_{p^∞})) is admissible and not finitely generated.
- `Representation.isLocallyAdmissible_trivial`: the trivial rank-one representation A is locally admissible
  and finitely generated. An arbitrary trivial module need not be finitely generated.


`Representation.fg_iff_permutation_quotient` uses a finite direct sum of actual permutation modules A[G/U], with a surjective intertwining map.

**Smooth characters and twists** (*smooth-character*). Let G be a topological group and A a
commutative ring. Define `IsSmoothCharacter` by IsSmoothCharacter χ :⇔ IsOpen (χ.ker : Set G): a
smooth character of G with values in A is a group homomorphism χ : G →* Aˣ whose kernel is open;
equivalently the rank-one representation A(χ) is smooth, equivalently χ is continuous for the
discrete topology on Aˣ. Define `SmoothRep.ofCharacter`, the smooth rank-one representation A(χ),
and `SmoothRep.twist`, the twisting V ↦ V ⊗ χ (same module, action χ(g)ρ(g)), an exact
autoequivalence of SmoothRep A G with twist χ ∘ twist χ⁻¹ ≅ id and twist (χψ) ≅ twist χ ∘ twist ψ,
compatible with invariants under compact open subgroups contained in ker χ. Prove
`IsSmoothCharacter.mul`: products and inverses of smooth characters are smooth ([BZ76] Ch. I §1,
1.19, p. 11 (characters); Ch. I §2, 2.25(c), p. 23 (twists)). *Needs:* *is-smooth*,
*smooth-rep-category*.

**Checks.**

- `isSmoothCharacter_unramified`: x ↦ t^{v_p(x)} on ℚ_p^× is a smooth character for any t ∈ Aˣ.
- `isSmoothCharacter_one`: the trivial character is smooth and twisting by it is the identity.
- `not_isSmoothCharacter_padicExp`: x ↦ (1+p)^x, ℤ_p → ℤ_p^×, is not smooth with ℤ_p^× discrete.


`SmoothRep.twist_composition`, `SmoothRep.twist_inverse`, `SmoothRep.twist_exact` and `SmoothRep.twist_invariants` specify the functorial identities and the invariants when the twisting character is trivial on the subgroup.

**The smooth contragredient** (*smooth-dual*). Let G be locally profinite and A commutative; for
(3)–(4) below assume invertible pro-orders, and for (4) A = k a field. For a smooth representation
(ρ, V) over A define `SmoothRep.smoothDual`, the smooth dual (contragredient)
Ṽ := smoothPart (Representation.dual ρ), that is (Hom_A(V, A))^∞, the smooth part of Mathlib's
algebraic dual representation ((g·λ)(v) = λ(ρ(g)⁻¹ v)), and `SmoothRep.smoothDualFunctor`, the
contravariant A-linear functor SmoothRep A G ⥤ (SmoothRep A G)ᵒᵖ, V ↦ Ṽ. Prove: (1)
`SmoothRep.homSmoothDualEquiv`, Hom_G(V, W̃) ≃ₗ[A] Hom_G(W, Ṽ) naturally in V and W, both being
the G-invariant bilinear pairings V × W → A; (2) `SmoothRep.toDoubleDual`, the natural evaluation
map V → Ṽ̃; (3) when U has invertible pro-order, (Ṽ)^U = Hom_A(V^U, A) via e_U; (4) over a field
k in which all compact open subgroups have invertible pro-order, V ↦ Ṽ is exact and V → Ṽ̃ is
injective, and it is an isomorphism iff V is admissible ([Ber92] Ch. I §2.2, Definition 8,
Proposition 6, Proposition 7, Lemma 5, p. 14). [BH06] 2.8 Proposition, p. 23, 2.9 Proposition, p. 24, and 2.10 Lemma and Exercise, pp. 24–25, give the fixed-vector dual, biduality, exactness and pairing statements over ℂ. Over A the fixed-vector formula uses the specified projector; field duality supplies (4). *Needs:* *smooth-vectors*, *averaging-projector*,
*admissible*.

**Checks.**

- `SmoothRep.smoothDual_character`: the smooth dual of A(χ) is A(χ⁻¹).
- `SmoothRep.smoothDual_zero`: the smooth dual of 0 is 0.
- `SmoothRep.toDoubleDual_not_surjective`: for G = ℚ_p, k = ℚ and V = ℚ[ℚ_p/ℤ_p], V → Ṽ̃ is not
  surjective.

**Checks (dual carrier).** The Lean examples give the full algebraic dual for a trivial action,
a zero smooth dual for the zero module, and the full dual for a finite free smooth module.
The last claim uses a common open stabilizer of finitely many module generators.


Over a field and a cofinal family of compact opens with invertible pro-order, `SmoothRep.toDoubleDual_injective`, `SmoothRep.toDoubleDual_iso_iff` and `SmoothRep.smoothDual_exact` state separation, the admissibility criterion and contravariant exactness.

**Change of coefficients** (*coefficient-change*). Let A → B be a homomorphism of commutative
rings and G locally profinite. Prove that base change V ↦ B ⊗_A V (Tau Ceti's
`Representation.baseChange`) preserves smoothness and define `SmoothRep.baseChange`, the additive
functor SmoothRep A G ⥤ SmoothRep B G, V ↦ B ⊗_A V, with baseChange_id and baseChange_comp;
`SmoothRep.restrictScalars`, restriction of scalars SmoothRep B G ⥤ SmoothRep A G; and
`SmoothRep.baseChangeAdjunction`, baseChange ⊣ restrictScalars. For a compact open U define
`SmoothRep.baseChangeInvariants`, the natural B-linear map B ⊗_A V^U → (B ⊗_A V)^U, and prove
that it is an isomorphism if B is flat over A or if U has pro-order invertible in A, and that it
is not an isomorphism in general. A ring automorphism σ of A (for instance σ ∈ Aut(ℂ)) gives the
σ-twist V ↦ A ⊗_{A,σ} V, an autoequivalence preserving admissibility and irreducibility ([Ber87]
§2.0, Generalization, p. 9 (the decomposition over a commutative algebra B); the functor, its
adjunction and the comparison map on invariants are elementary from Tau Ceti's
`Representation.baseChange`). *Needs:* *smooth-rep-category*, *averaging-projector*.

**Checks.**

- `SmoothRep.baseChangeInvariants_sign_not_surjective`: for U = ℤ/2 acting by sign on ℤ and B =
  F_2 the map 0 → F_2 is not surjective.
- `SmoothRep.baseChange_id`: base change along the identity is naturally the identity functor.
- `SmoothRep.baseChangeInvariants_permutation`: for V = A[G/U'] and U compact open, B ⊗ V^U → (B ⊗
  V)^U is an isomorphism, both being free on the U-orbits of G/U'.

**The centre of the smooth category** (*smooth-centre*). Let A be commutative and G a
topological group, locally profinite for the description by corners. Define `SmoothCentre` as
SmoothCentre A G := CatCenter (SmoothRep A G) = End(𝟭), the commutative ring of natural
endomorphisms of the identity functor (Mathlib's CatCenter), written Z(G, A). Use
Mathlib's `CatCenter.app`, `CatCenter.naturality` and `CatCenter.ext` for evaluation,
commutation with every morphism and equality tested on every object. The additional
generator criterion tests equality on the A[G/U]. There is a ring map
A → Z(G, A) (Linear.toCatCenter); z_V restricts to subobjects and passes to quotients; Z(G, A)
acts on Hom_G(V, W) and on Ext groups compatibly from both sides ([Ber87] §1.8, p. 8). *Needs:*
*smooth-rep-abelian*.

**Checks.**

- `SmoothCentre.trivialGroup`: for G trivial, SmoothCentre A G ≅ A.
- `SmoothCentre.finite_eq_center`: for G finite discrete, SmoothCentre A G ≅ the centre of A[G]
  (Mathlib Subring.center of MonoidAlgebra).
- `SmoothCentre.int_discrete`: for G = ℤ discrete and A a field, SmoothCentre A G ≅ A[t, t⁻¹].


`SmoothCentre.ext_permutation` detects equality by the action on all compact-open permutation modules.

### Examples

The running examples of the layer are G = ℤ_p with its permutation modules ℤ[ℤ_p ⧸ p^n ℤ_p],
which are smooth and admissible, against the left regular representation on ℤ[ℤ_p] and the
product of the permutation modules, which are not smooth; ℚ[ℚ_p ⧸ ℤ_p], which is smooth and
finitely generated but not admissible and whose double-dual map is not surjective; the
GL_2(ℤ_p)-invariants of ℤ[GL_2(ℚ_p)/GL_2(ℤ_p)], free on the double cosets of diag(p^a, p^b); and
the failures over F_p, where invariants under ℤ/p are not exact and base change of invariants is
not surjective.

### Dependencies

Mathlib's `Representation`, `Rep`, invariants, averaging and `CatCenter`; Tau Ceti's discrete
carrier and profinite exhaustion; ProfiniteCohomology layers 0 and 1; ProfiniteProPGroups layer 1.

## Layer SR.1: Hecke algebras over rings

Hecke algebras over a coefficient ring, in two models. The first is convolution of locally
constant compactly supported functions against an A-valued Haar measure, which exists when some
compact open subgroup has invertible pro-order. The second is the endomorphism ring of the
permutation module A[G/U], which exists over every A, including F_p for a p-adic group. Both agree
with the double-coset Hecke ring of Mathlib and Tau Ceti and act on invariants.

### SR.1.1 Functions, measures and convolution

**Locally constant compactly supported functions** (*locally-constant-compact-support*). For an
l-space X (Hausdorff, locally compact, totally disconnected) and an A-module M, define
`LocallyConstantCompact`, the A-module C_c^∞(X, M) of locally constant functions f : X → M with
compact support (Mathlib's LocallyConstant with compact support; when M carries the discrete
topology this is Mathlib's CompactlySupportedContinuousMap X M), with `LocallyConstantCompact.coeFn`,
the injective coercion to functions X → M, `LocallyConstantCompact.ext`, f = g iff f x = g x for
all x, and `LocallyConstantCompact.indicator`, the function 1_K · m for K a compact open subset and
m ∈ M. Prove that C_c^∞(X, M) is spanned by the functions 1_K·m for K compact open and m ∈ M, that
every f is a finite sum Σ m_i 1_{K_i} with the K_i pairwise disjoint compact open, and that any two
such presentations have a common refinement. For X = G a locally profinite group, prove that every
f ∈ C_c^∞(G, M) is left and right invariant under some compact open subgroup, and that
C_c^∞(G, M)^{right-U} ≅ finitely supported functions on G/U ([Ber92] Ch. I §1.1 Lemma 1 and §1.2,
pp. 7–8). [BH06] §3.1, p. 25, gives the compact-open double-coset expansion for groups over ℂ; [Ber92] Ch. I §1.1 Lemma 1, pp. 7–8, gives the finite compact-open refinements on general l-spaces. Neither argument uses division in the coefficients. *Needs:* *van-dantzig*.

**Checks.**

- `LocallyConstantCompact.finite_eq_pi`: for X = Fin 3 discrete, C_c^∞(X, ℤ) ≃ Fin 3 → ℤ.
- `LocallyConstantCompact.empty`: for X empty, C_c^∞(X, M) = 0.
- `LocallyConstantCompact.real_eq_zero`: for X = ℝ with its usual topology, every locally constant
  compactly supported f : ℝ → ℤ is 0.

**Checks (compact-open indicators).** `LocallyConstantCompact.indicator U a` has value a inside
U and zero outside; coefficient zero and U = ∅ both give the zero function. All four are Lean
examples. This constructor assumes G Hausdorff, so compact opens are closed and their indicators
have compact closed support.

**The open–closed exact sequence** (*open-closed-sequence*). For an l-space X, an open subset
U ⊆ X with closed complement Z = X ∖ U, and an A-module M, prove that extension by zero and
restriction give a short exact sequence of A-modules
0 → C_c^∞(U, M) → C_c^∞(X, M) → C_c^∞(Z, M) → 0. If a locally profinite group acts continuously
on X preserving U, the sequence is one of smooth representations. Iterating along a finite
filtration of X by open subsets gives the filtration used in the Mackey and geometric lemmas
([Ber92] Ch. I §1.2, Proposition 2, p. 8). *Needs:* *locally-constant-compact-support*.


`LocallyConstantCompact.extendOpen` is literal extension by zero and `LocallyConstantCompact.restrictClosed` is literal restriction. `LocallyConstantCompact.openClosed_exact` states injectivity, exactness and surjectivity for the underlying module sequence.

Checks:

- `LocallyConstantCompact.extendOpen_empty`: extension from the empty space is zero.
- `LocallyConstantCompact.extendOpen_full`: extension from the whole space is unchanged.
- `LocallyConstantCompact.extendOpen_complement`: restriction to the complement annihilates the extension.

`LocallyConstantCompact.translation` is the left action on compact sections, with inverse pullback on arguments. `LocallyConstantCompact.openClosed_equivariant` states smoothness and equivariance of both maps as well as exactness. `LocallyConstantCompact.openClosed_filtration` identifies the successive quotients with compact sections on the locally closed strata, by restriction.

Checks: `LocallyConstantCompact.translation_trivial` gives a trivial representation for a trivial space action; `LocallyConstantCompact.translation_support` moves support by g; `LocallyConstantCompact.translation_delta` sends the mass at x to the mass at gx.

**Haar measures with values in a ring** (*a-valued-haar-measure*). Let G be locally profinite, A a
commutative ring, and, for existence, U₀ a compact open subgroup with HasUnitProOrder A U₀. Define
`HaarMeasureWithValues`: an A-valued (left) Haar measure is a function
μ : {compact open subsets of G} → A that is finitely additive on disjoint unions and left
invariant, μ(gK) = μ(K). Define `HaarMeasureWithValues.normalized`, the unique such μ with
μ(U₀) = 1 for U₀ of invertible pro-order, given by μ(∅) = 0 and μ(gU) = [U₀ : U]⁻¹ for open subgroups U ≤ U₀,
and prove `HaarMeasureWithValues.ext`, that two measures agreeing on one compact open subgroup U₀
of invertible pro-order agree, and `HaarMeasureWithValues.apply_subgroup`,
μ(U) = [U : U ∩ U₀]·[U₀ : U ∩ U₀]⁻¹ for every compact open subgroup U under the normalised
measure, so that μ(U) is a unit exactly when U has invertible pro-order. For a locally pro-p G and
a pro-p U₀, μ takes values in ℤ[1/p]·μ(U₀) and is the base change of the ℤ[1/p]-valued measure.
For A = ℝ, μ(K) = haar(K)/haar(U₀) with Mathlib's haarMeasure ([He18] §1.2, pp. 6–7 (the
ℤ[1/p]-valued measure); the A-valued axioms, uniqueness and the unit criterion are elementary from
finite additivity). *Needs:* *locally-constant-compact-support*, *unit-pro-order*.

**Checks.** The empty compact open has volume zero (`vol_bot`); the unnormalized Lean
structure permits the zero measure, while the existence and unit claims above concern the
specified normalization.

- `HaarMeasureWithValues.padic_apply`: for G = ℚ_p, U₀ = ℤ_p over ℤ[1/p], μ(p^n ℤ_p) = p^{−n} for
  all n ∈ ℤ.
- `HaarMeasureWithValues.finite_counting`: for G finite discrete normalised at {1}, μ(K) = |K|.
- `HaarMeasureWithValues.no_fp_measure`: there is no F_p-valued Haar measure on ℤ_p with μ(ℤ_p) =
  1.

**Checks (counting volume).** `HaarMeasureWithValues.counting` on a finite discrete group has
volume zero on ∅, volume 1 on every singleton, and volume |G| on G. Each identity is a Lean
example. Two further examples exhibit the unnormalized zero measure and show that none of its
volumes is a unit over a nonzero ring.

**Finite-sum integration** (*integration*). Let G be a Hausdorff topological group, A a
commutative ring and μ an A-valued Haar measure, without a normalization assumption. Define
`HaarMeasureWithValues.integrate` on `LocallyConstantCompact G A`: choose a finite compact-open
indicator expansion f = Σ_U a_U 1_U and take Σ_U μ(U)a_U. The nonzero fibers give such an
expansion; compactness makes their number finite. Prove
`LocallyConstantCompact.exists_indicator_expansion` and
`HaarMeasureWithValues.integrate_expansion`, independence of the chosen expansion, allowing
overlaps between the compact opens. On a locally profinite group this agrees with the coset
sum for a sufficiently small compact open right stabilizer. For any A-module M construct
`HaarMeasureWithValues.integrateModule` on C_c^∞(G, M) by Σ_U μ(U) • m_U.
Prove `integrateModule_expansion`, independence of expansions, linearity, naturality under
A-linear maps (`integrateModule_map`), and agreement with scalar integration when M = A
(`integrateModule_scalar`). No topology or completeness is required on M.
For Hausdorff topological groups G and H, construct the product of two such volumes, characterized
on compact-open rectangles by μ(U)ν(V) (`prod_vol`). Construct integration in the H variable
as a compactly supported locally constant M-valued function on G (`integrateRight`), and prove
Fubini (`integrateModule_prod`), including the reversed order after interchanging the factors.
These are [BH06] §3.2, pp. 28–29, for complex vector spaces; the stated ring/module version
follows by the same finite compact-open partition argument, using finite additivity and the
module axioms. The product assertion is about compactly supported locally constant functions,
not an extension to arbitrary measurable functions. *Needs:* *a-valued-haar-measure*, *locally-constant-compact-support*.

**Checks.**

- The integral of `LocallyConstantCompact.indicator U a` is μ(U)a.
- A zero indicator has integral zero, also for the zero coefficient ring.
- With finite discrete G and counting volume, the integral is Σ_g f(g).
- For C₂ = {1,s}, counting integration is f(1) + f(s), a computed two-term Lean example.
- Module-valued indicators integrate to μ(U) • m; a zero indicator integrates to zero.
- For C₂ and M = ℚ × ℚ, counting integration is the vector sum f(1) + f(s).
- On a product of finite discrete groups, product integration is Σ_x Σ_y f(x,y).

**The Hecke algebra of a locally profinite group** (*convolution-algebra*). Let G be locally
profinite and μ an A-valued Haar measure normalised on a compact open U₀ of invertible pro-order.
Define `HeckeAlgebra`, the Hecke algebra H(G, A) := C_c^∞(G, A) with convolution for the fixed
measure, `HeckeAlgebra.mul_apply` being (f₁ * f₂)(x) = ∫ f₁(y) f₂(y⁻¹x) dμ(y), and prove
`instNonUnitalRingHeckeAlgebraOfLocallyCompactSpaceOfT2Space`: it is an associative non-unital A-algebra; when A is nonzero it has a unit exactly when G
is discrete. Prove `HeckeAlgebra.support_mul_subset`, supp(f₁ * f₂) ⊆ supp f₁ · supp f₂; that if
f₁ is left U-invariant so is f₁ * f₂, and if f₂ is right U-invariant so is f₁ * f₂; and that
1_U * 1_U = μ(U) 1_U for a compact open subgroup U. The map f ↦ f^∨, f^∨(g) = f(g⁻¹)Δ(g⁻¹), is an
anti-automorphism (Δ the modular character of μ; Δ = 1 for unimodular G). The algebra acts on
every smooth representation by f·v = ∫ f(g) ρ(g) v dμ(g). Changing μ to cμ rescales the product,
and base change gives H(G, A) ⊗_A B ≅ H(G, B) ([Ber92] Ch. I §2.1, Definition 7, Proposition 5
and Theorem 2, pp. 11–12). [BH06] §4.1, pp. 33–34, gives the same convolution order and the discrete-group unit criterion; the finite-sum proof works for A with the stated normalization. *Needs:* *integration*, *a-valued-haar-measure*,
*smooth-rep-category*.

**Checks.**

- `HeckeAlgebra.finite_compat`: for G = ZMod 3 discrete with counting measure, H(G, ℤ) ≃ ℤ[ZMod
  3].
- `HeckeAlgebra.indicator_padic`: in H(ℚ_p, ℤ[1/p]) normalised on ℤ_p, 1_{pℤ_p} * 1_{pℤ_p} = p⁻¹ •
  1_{pℤ_p}.
- `HeckeAlgebra.no_one`: H(ℚ_p, ℚ) has no multiplicative identity.
- For s = (01), t = (12) in S₃ with counting measure, δ_s * δ_t has coefficient 1 at st
  and 0 at ts. This pins the order in `HeckeAlgebra.mul_apply`; the Lean example computes the
  same two coefficients in `MonoidAlgebra ℤ S₃`. The finite compact-open indicator formula in
  that theorem also specifies convolution for any unnormalized measure.

**Checks (the convolution carrier).** Three Lean examples compute multiplication in
`HeckeAlgebra μ` itself: zero volume gives zero multiplication; counting volume on a finite
discrete group gives Σ_y f(y)g(y⁻¹x); for C₂ = {1,s}, (f*g)(1) = f(1)g(1) + f(s)g(s).
The existing S₃ basis calculation additionally distinguishes st from ts.

**Normalised idempotents** (*hecke-idempotent*). Let G be locally profinite, μ an A-valued Haar
measure and U a compact open subgroup with μ(U) ∈ Aˣ (equivalently, for the normalised measure, U
of invertible pro-order). Define `HeckeAlgebra.idempotent`, e_U := μ(U)⁻¹ • 1_U ∈ H(G, A), and
prove `HeckeAlgebra.idempotent_mul_self`, e_U * e_U = e_U. It acts on every smooth V as the
averaging projector of SR.0, so e_U V = V^U. Prove `HeckeAlgebra.idempotent_mul_of_le`,
e_U * e_{U'} = e_{U'} * e_U = e_U for U' ≤ U, and `HeckeAlgebra.idempotent_mul_eq_iff`, that f is
left (right) U-invariant iff e_U * f = f (f * e_U = f). If such U are cofinal,
H(G, A) = ⋃_U e_U * H(G, A) * e_U, and e_U H e_U is a unital algebra with unit e_U. Normalised
idempotents are defined exactly when the volume is a unit; without this only 1_U (with
1_U * 1_U = μ(U) 1_U) is available ([Ber92] Ch. I §2.1, p. 11 and proof of Theorem 2(1), p. 12).
[BH06] 4.1 Proposition (1)–(3), pp. 34–35, gives idempotency, the invariance criterion and the corner identity. Over A division is only by the specified unit μ(U). *Needs:* *convolution-algebra*, *averaging-projector*.

**Checks.**

- `HeckeAlgebra.idempotent_finite`: for G = ZMod 2 discrete and A = ℤ[1/2], e_G = (1/2)(δ_0 +
  δ_1).
- `HeckeAlgebra.idempotent_padic`: in H(ℚ_p, ℤ[1/p]) normalised on ℤ_p, e_{pℤ_p} = p • 1_{pℤ_p}.
- `HeckeAlgebra.idempotent_top`: for G compact open in itself and U = G of invertible pro-order,
  e_G * f = (∫ f) e_G.
- In C₂ with counting measure, the nonidentity singleton has unit volume but δ₁ * δ₁ = δ₀ ≠ δ₁.
  It is a compact open subset, not a subgroup. The Lean example records this product.
  `HeckeAlgebra.idempotent_apply` fixes the value μ(U)⁻¹ on U and zero off U.

**Checks (the normalized function).** With counting volume on C₂, `HeckeAlgebra.idempotent`
for the whole subgroup has constant value 1/2. For any compact open subgroup of unit volume,
its normalized function vanishes off the subgroup and its convolution square equals itself.
These are three direct Lean examples; the singleton coset at s ∈ C₂ instead squares to the
identity point mass.

### SR.1.2 Level algebras and the double-coset ring

**Hecke algebras of permutation modules** (*permutation-hecke-algebra*). Let G be locally
profinite, A a commutative ring, S a discrete G-set with compact open stabilisers, and U' ≤ U
compact open subgroups. Define `FunG`, the A-module Fun_G(S × S, A) of functions h : S × S → A
invariant under the diagonal G-action whose support is a finite union of G-orbits, with the matrix
product (h₁ * h₂)(x, z) = Σ_y h₁(x, y) h₂(y, z) (a finite sum), and `FunG.actPermutation`, its
left action on the permutation module A[S], h * s = Σ_t h(t, s) t. Prove `FunG.equivEnd`: when S
has finitely many G-orbits, Fun_G(S × S, A) ≃ End_G(A[S]) as A-algebras. Define
`HeckeAlgebraLevel`, H(G, U; A) := Fun_G(G/U × G/U, A), the Hecke algebra of finitely supported
functions on U\G/U for S = G/U, with basis the double cosets [UgU]. It is defined over every A,
including F_p for p-adic G: no measure or averaging is used. Through V^U = Hom_G(A[G/U], V), V^U
is a right H(G, U; A)-module, explicitly v * h = Σ_{Ug ∈ U\G} h(U, gU) ρ(g)⁻¹ v (the summand
depends only on Ug, and only finitely many are nonzero); the operator of one double coset is Tau
Ceti's `HeckeCoset.heckeSum`. For U' ≤ U the inclusion V^U ⊆ V^{U'} and the trace
tr_{U/U'}(v) = Σ_{u ∈ U/U'} ρ(u) v are induced by the G-maps A[G/U'] → A[G/U], gU' ↦ gU, and
A[G/U] → A[G/U'], gU ↦ Σ_{u ∈ U/U'} guU'; tr ∘ incl = [U : U'], and for U' normal in U,
incl ∘ tr = Σ_{u ∈ U/U'} ρ(u). The anti-involution [UgU] ↦ [Ug⁻¹U] identifies H(G, U; A) with
its opposite ([TV] §2.10, (2.10.1)–(2.10.3), pp. 187–188 (published; arXiv v1 §2.10)). *Needs:*
*van-dantzig*, *compact-open-invariants*.

`HeckeAlgebraLevel.permutation_trace` gives the integral transfer on coset basis vectors and its two composites. `SmoothRep.permutation_invariants` identifies equivariant maps with invariant vectors by evaluation at the identity coset. `HeckeAlgebraLevel.inversion` sends the double coset of g to the double coset of g⁻¹ in the opposite algebra.

`FunG.mul_apply` pins matrix convolution, `FunG.actPermutation_apply` pins the action on finitely supported columns, `FunG.algebraMap_apply` pins scalar matrices, and `FunG.one_apply` pins the identity when there are finitely many orbits. The signatures require compact open stabilizers.

Checks: `FunG_empty` gives zero on the empty set; `FunG_point` recovers a scalar on one point; `FunG_orbit` supplies each orbit indicator. `FunG.actPermutation_zero`, `FunG.actPermutation_point` and `FunG.actPermutation_column` test zero, scalar action and the order of the two matrix indices.

**Checks.**

- `HeckeAlgebraLevel.gl2_tp_card`: for G = GL_2(ℚ_p), U = GL_2(ℤ_p), [U diag(p,1) U] is the sum of p + 1 left cosets.
- `HeckeAlgebraLevel.normal_eq_groupAlgebra`: for U normal in G, H(G, U; A) ≃ MonoidAlgebra A (G ⧸
  U).
- `SmoothRep.traceLevel_comp_incl`: tr_{U/U'} ∘ incl = [U : U'] • id on V^U.

**Comparison with the double-coset Hecke ring** (*hecke-ring-comparison*). Let G be locally
profinite, U compact open and A commutative; for the convolution statement assume μ(U) = 1 (U of
invertible pro-order for e_U). Prove that the Hecke algebra H(G, U; A) of
*permutation-hecke-algebra* is isomorphic, as an A-algebra, to the double-coset Hecke ring
𝕋 (⊤) U A of Mathlib/Tau Ceti (HeckeRing with Shimura's product HeckeCosetModule.mul), via
[UgU] ↦ the double coset of g, and that the structure constants agree with Shimura's
multiplicities m(D₁, D₂; D). If μ is an A-valued Haar measure with μ(U) = 1, prove that the
U-bi-invariant functions in H(G, A) form the subalgebra e_U * H(G, A) * e_U = 1_U * H(G, A) * 1_U,
that 1_{UgU} ↦ [UgU] is an algebra isomorphism onto H(G, U; A), and that the convolution
1_{UgU} * 1_{UhU} = Σ_D m(UgU, UhU; D) 1_D is a finite integral sum. The comparison is compatible
with base change and with the action on invariants, and no second double-coset multiplication is
introduced ([He18] §1.2, p. 7, formula (a) (convolution of double cosets); §4.1, p. 15; the
identification with Mathlib's `HeckeRing` is proved here). *Needs:* *permutation-hecke-algebra*,
*convolution-algebra*, *hecke-idempotent*; ModularForms layer 2.


The comparison is `HeckeAlgebraLevel.equivHeckeRing`, with the basis convention fixed by `HeckeAlgebraLevel.equivHeckeRing_apply`.

**Checks (permutation comparison).** `HeckeAlgebraLevel.equivHeckeRing_apply` reads the
coefficient of [UgU] from f(δ_U) at g⁻¹U. The zero endomorphism maps to zero; the identity
has coefficient one on U and zero on other double cosets; and the inverse image of the
basis element [UgU] sends δ_U to the sum of the cosets in Ug⁻¹U. All three are Lean
examples. The inverse is required by composition of endomorphisms of the left permutation
module; it is the same convention as the right action on invariants above. For the discrete
group ℤ and U = 0, the basis element of the double coset of 1 sends δ_0 to δ_{−1}, not δ_1 (a
fourth Lean example), so through V^U = Hom_G(A[G/U], V) it acts as ρ(1)⁻¹: the right action of
[UgU] is the convolution operator of 1_{Ug⁻¹U}, as recorded in the conventions.

### SR.1.3 Smooth representations as Hecke modules

**Idempotented algebras and nondegenerate modules** (*locally-unital-algebra*). Let A be
commutative and H an idempotented A-algebra. Define `IsIdempotented`: an A-algebra H (not
necessarily unital) is idempotented (locally unital) if every finite subset {x_i} admits an
idempotent e with e x_i = x_i = x_i e; then H = ⋃_e eHe. Define `NondegMod`, the full subcategory
of left H-modules M that are nondegenerate, HM = M, equivalently M = ⋃_e eM. Prove
`NondegMod.instAbelian`: NondegMod H is a full abelian subcategory of H-modules with exact
filtered colimits, closed under subquotients, direct sums and filtered colimits, with products
given by nondegenerate parts of products and a centre identified with the bimodule endomorphisms
of H. Prove `NondegMod.homProjEquiv`, Hom_H(He, M) ≃ eM, so that the He are finitely generated
projective generators ([Ber87] §1.1–1.2 and §1.8, pp. 3–4 and 8). *Needs:* the library
vocabulary of this layer.


`NondegMod.principal_projective`, `NondegMod.principal_finitelyGenerated`, `NondegMod.principal_generators` and `NondegMod.grothendieckAbelian` give the categorical assertions. `NondegMod.homProjEquiv_evaluation` fixes the evaluation convention. `NondegMod.part` takes the submodule on which local units act, and `NondegMod.centreEquiv_principal` pins the centre comparison on principal objects.

Checks:

- `NondegMod.part_nondegenerate`: a nondegenerate input is unchanged.
- `NondegMod.part_zeroAction`: a module annihilated by H has zero nondegenerate part.
- `NondegMod.part_zero`: the zero module has zero nondegenerate part.

**Checks.**

- `NondegMod.unital_equiv`: for H = A (unital), NondegMod H ≌ ModuleCat A.
- `IsIdempotented.directSum`: ⊕_{n ∈ ℕ} A with componentwise product is idempotented, and ∏_n A is not a nondegenerate module.
- `IsIdempotented.not_zeroMul`: A with the zero multiplication is not idempotented, for A ≠ 0.

**Smooth representations as nondegenerate Hecke modules** (*hecke-module-equivalence*). Let G be
locally profinite and A a commutative ring such that G has a cofinal family of compact open
subgroups of pro-order invertible in A (HasCofinalUnitProOrder A G), and fix an A-valued Haar
measure μ normalised on one of them. Prove that H(G, A) is idempotented with local units e_U, and
that V ↦ (V, f·v = ∫ f(g) ρ(g) v dμ) is an equivalence of categories
SmoothRep A G ≌ NondegMod H(G, A), with V^U = e_U·V. The inverse sends M to M with
g·m = (δ_g * e_U)·m for m ∈ e_U M, where δ_g * e_U = μ(U)⁻¹ 1_{gU}. The equivalence is A-linear,
compatible with base change, and preserves the centre. Without invertible pro-orders
(F_p-coefficients for a p-adic group) SmoothRep is used directly, with the integral operators of
*permutation-hecke-algebra* ([Ber92] Ch. I §2.1, Theorem 2 and Lemma 4, pp. 12–13). [BH06] 4.2 Propositions 1–2, pp. 35–37, constructs the two inverse actions; the ring-valued version uses the cofinal unit-volume idempotents stated here. *Needs:*
*convolution-algebra*, *hecke-idempotent*, *locally-unital-algebra*, *smooth-rep-category*,
*unit-pro-order*.


`SmoothRep.heckeModuleEquivalence` compares the actual smooth category and `NondegMod`; `SmoothRep.heckeModuleEquivalence_action` specifies the integrated action.

Checks for `NondegMod.bimoduleEnd`: `NondegMod.bimoduleEnd_scalar` admits central coefficient scalars; `NondegMod.bimoduleEnd_unital` determines an endomorphism from its central value at one; `NondegMod.bimoduleEnd_noncentral` excludes multiplication by a noncentral element.

**Hecke corners and irreducible representations** (*corner-irreducibles*). Let G be locally
profinite and U a compact open subgroup with μ(U) ∈ Aˣ; A is a field for the irreducibility
statements. Prove that the functor V ↦ V^U = e_U V from SmoothRep A G to right (or, through the
anti-involution, left) H(G, U; A)-modules is exact and has a left adjoint
M ↦ H(G, A)e_U ⊗_{e_U H e_U} M = c-Ind_U^G A ⊗_{H(G,U)} M, with the unit
M → e_U(H(G, A)e_U ⊗_{e_U H e_U} M) an isomorphism. Over a field A = k prove: V irreducible implies
V^U is 0 or a simple H(G, U; k)-module; every simple H(G, U; k)-module arises from a unique (up to
isomorphism) irreducible smooth V with V^U ≠ 0; and two irreducibles with nonzero U-invariants
are isomorphic iff their U-invariants are isomorphic H(G, U; k)-modules. If U splits the category
(the subcategory generated by U-invariants is a direct factor), V ↦ V^U is an equivalence between
that factor and H(G, U; k)-modules ([Ber92] Ch. I §4.2, Lemma 7, p. 19). [BH06] 4.3 Proposition and Corollary, pp. 38–39, gives this correspondence over ℂ. Its idempotent-module proof applies over A with the stated local units. *Needs:*
*hecke-module-equivalence*, *permutation-hecke-algebra*, *invariants-exact*.

`SmoothRep.cornerFunctor` uses the existing permutation-module endomorphism algebra and its opposite. `SmoothRep.cornerFunctor_hom` pins the right action by precomposition; `SmoothRep.cornerFunctor_natural` identifies the underlying fixed vectors, and `SmoothRep.cornerFunctor_invariants` gives the natural comparison after restricting scalars. `SmoothRep.corner_adjunction`, `SmoothRep.corner_irreducible`, `SmoothRep.corner_simple_lift` and `SmoothRep.corner_irreducible_iso` state exactness, the invertible adjunction unit and the simple-object correspondence.

Checks of the corner functor (the same idempotent-module calculation as [Ber92], Ch. I §4.2, Lemma 7): `SmoothRep.cornerFunctor_zero` sends zero to zero; `SmoothRep.cornerFunctor_trivial` retains the whole coefficient module of a trivial action; `SmoothRep.cornerFunctor_regular` gives the regular right corner module on ℂ[G/U].

`SmoothRep.corner_tensor` realizes the left adjoint as the quotient by the explicit balancing relations on the permutation representation. `SmoothRep.corner_splitting` identifies its invariants equivalence when the level-generated category is closed under subobjects.

**The Λ-linear Bernstein centre via Hecke corners** (*bernstein-centre-corners*). Let G be locally
profinite with a cofinal family 𝒦 of compact open subgroups of pro-order invertible in the
commutative ring Λ (HasCofinalUnitProOrder Λ G; for G locally pro-p these are the open pro-p
subgroups, with p ∈ Λˣ). Prove `SmoothCentre.equivLimCornerCentre`,
SmoothCentre Λ G ≃+* lim_{K ∈ 𝒦} Subring.center (HeckeAlgebraLevel G K Λ): restricting
z ∈ Z(G, Λ) = CatCenter(SmoothRep Λ G) (SR.0 *smooth-centre*) to the generators Λ[G/K] gives
Z(G, Λ) ≅ lim_{K ∈ 𝒦} Z(H(G, K; Λ)), with transition map `SmoothCentre.cornerCentreTransition`,
z ↦ e_K z : Z(H(G,K'; Λ)) → Z(H(G,K; Λ)) for K' ≤ K in 𝒦. Prove `SmoothCentre.coeffChange`: the
isomorphism is compatible with coefficient change, for Λ → Λ' there being a natural ring map
Z(G, Λ) → Z(G, Λ') induced by Z(H(G,K;Λ)) ⊗ Λ' → Z(H(G,K;Λ')) and compatible with the actions on
base-changed representations. Prove `SmoothCentre.equivLimGroupRing`: for G abelian,
Z(G, Λ) ≃ lim_K Λ[G/K]. This is the Λ-linear Bernstein centre of Fargues–Scholze (Definition
I.9.2) for Λ a ℤ_ℓ[√q]-algebra, ℓ ≠ p ([FS] Definition I.9.2(i), p. 34; Definition IX.0.2(i),
p. 318; §IX.6.4, p. 333). *Needs:* *smooth-centre*, *permutation-hecke-algebra*,
*hecke-idempotent*, *hecke-module-equivalence*, *locally-unital-algebra*.


The limit carrier is `SmoothCentre.cornerLimit`. `HeckeAlgebraLevel.projection_basis` and `HeckeAlgebraLevel.transfer_basis` pin the maps used in each transition: projection on cosets and normalized transfer, respectively. `SmoothCentre.equivLimCornerCentre_apply` identifies evaluation with the action on A[G/U]. `SmoothCentre.coeffChange_apply` pins extension of coefficients on pure tensors.

Checks:

- `SmoothCentre.cornerCentreTransition_identity`: equal levels give the identity.
- `SmoothCentre.cornerCentreTransition_scalar`: compression preserves scalar operators.
- `SmoothCentre.cornerCentreTransition_sign`: the sign projector disappears at full level.
- `SmoothCentre.cornerLimit_trivial`: the inverse limit for the point is the coefficient ring.
- `SmoothCentre.cornerLimit_finite`: the bottom level determines a finite discrete group.
- `SmoothCentre.cornerLimit_laurent`: the discrete infinite cyclic case is Laurent polynomials.
- `SmoothCentre.coeffChange_identity`: extension by the identity preserves the action.
- `SmoothCentre.coeffChange_scalar`: scalars map by the coefficient homomorphism.
- `SmoothCentre.coeffChange_characteristic`: the scalar 2 vanishes after reduction modulo 2.

**ℓ-adic separatedness of the Bernstein centre** (*l-adic-separatedness*). Let Λ be an
ℓ-adically separated ring in which the pro-orders of a cofinal family 𝒦 of compact open subgroups
are invertible: Λ = ℤ_ℓ[√q] (or any noetherian ℓ-adically separated domain), ℓ ≠ p, and 𝒦 the
open pro-p subgroups of a locally pro-p group G. Prove that each Hecke algebra H(G, K; Λ) and its
centre are ℓ-adically separated, and so is Z(G, Λ) ≅ lim_K Z(H(G, K; Λ)): ⋂_n ℓ^n Z(G, Λ) = 0. In
particular two elements of Z(G, Λ) agreeing modulo ℓ^n for every n are equal ([FS] proof of
Theorem IX.7.2, p. 335; proof of Corollary IX.7.3, p. 337). *Needs:* *bernstein-centre-corners*,
*permutation-hecke-algebra*.


For abelian G, `SmoothCentre.groupRingLimit` uses the quotient maps on group-ring basis elements. `SmoothCentre.equivLimGroupRing_apply` characterizes its comparison by evaluation on the identity coset.

Checks:

- `SmoothCentre.groupRingLimit_trivial`: the one-point group gives the coefficient ring.
- `SmoothCentre.groupRingLimit_cyclic`: the discrete infinite cyclic group gives Laurent polynomials.
- `SmoothCentre.groupRingLimit_finite`: for a finite discrete abelian group the limit is its group algebra.
- `SmoothCentre.groupRingTransition_basis`: a delta function maps to the coarser coset without a scalar factor.


`HeckeAlgebraLevel.separated`, `SmoothCentre.separated` and `SmoothCentre.ext_mod_pow` state separation under the coefficient-ring separation hypothesis.

### SR.1.4 Iwahori decompositions and positive Hecke algebras

**Iwahori decompositions and positive elements** (*iwahori-decomposition*). Let F be a
nonarchimedean local field and G a connected reductive F-group. In G(F), take opposite
parabolics P = M ⋉ N and P̄ = M ⋉ N̄ with their common Levi M, and a compact open U.
The parabolics and Iwahori factorisation are supplied by ReductiveGroups layer 7 and
ReductiveGroupsPartII RG2.4. The abstract factorisation definition makes sense for other
locally profinite groups, but the theorems below have these reductive hypotheses. Define `HasIwahoriDecomposition`: U has an Iwahori decomposition with respect to
(P, P̄) if both multiplication maps U_{N̄} × U_M × U_N → U and U_N × U_M × U_{N̄} → U are
bijective, where U_X = U ∩ X; prove `HasIwahoriDecomposition.mul_mem_iff`, that every u ∈ U is
uniquely ū m n with ū ∈ U_{N̄}, m ∈ U_M, n ∈ U_N, and also uniquely n m ū. Define
`positiveMonoid`, Δ_M⁺ := {m ∈ M | m U_N m⁻¹ ⊆ U_N, m⁻¹ U_{N̄} m ⊆ U_{N̄}} as a Submonoid M, the
U-positive elements, containing U_M, and Δ⁺ := U_N Δ_M⁺ U_{N̄}. Define `IsStronglyPositive`: a
central z ∈ Z(M) ∩ Δ_M⁺ is strongly positive if for all compact open subgroups H₁, H₂ of U_N there
is n ≥ 0 with z^n H₁ z^{−n} ⊆ H₂, and for all compact open subgroups K₁, K₂ of U_{N̄} there is
n ≥ 0 with z^{−n} K₁ z^n ⊆ K₂ (Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne
[ACC] §2.1.9, definition after Lemma 2.1.12, p. 914; application in Lemma 2.1.13, p. 915).
These quantifiers range over subgroups of U_N and U_{N̄}, respectively, as in the source. *Needs:* *van-dantzig*;
ReductiveGroups layer 7, ReductiveGroupsPartII RG2.3, ReductiveGroupsPartII RG2.4.

Additional Checks: `HasIwahoriDecomposition_torus` gives the factorization with trivial radicals, and `HasIwahoriDecomposition_overlap` rejects overlapping nontrivial factors. `IsStronglyPositive_torus` has vacuous contraction conditions; together with `IsStronglyPositive.gl2_diag` and `IsStronglyPositive.not_one_gl2` it distinguishes contraction from mere positivity. `positiveMonoid_torus` is the whole Levi; `positiveMonoid_contraction` contains diag(p,1), while `positiveMonoid_expansion` excludes its inverse.

**Checks.**

- `HasIwahoriDecomposition.gl2_iwahori`: the Iwahori subgroup of GL_2(ℚ_p) has an Iwahori decomposition with respect to the upper and lower Borels.
- `not_hasIwahoriDecomposition_gl2_maximal`: GL_2(ℤ_p) has no Iwahori decomposition with respect to (B, B̄).
- `IsStronglyPositive.gl2_diag`: diag(p, 1) is strongly positive for (B, B̄) and the Iwahori subgroup.

**The positive Hecke monoid homomorphism** (*positive-hecke-homomorphism*). In the reductive
local-field setting of *iwahori-decomposition*, let U have an Iwahori decomposition
with respect to (P, P̄); let H(Δ_M⁺, U_M) ⊆ H(M, U_M) and H(Δ⁺, U) ⊆ H(G, U) be the ℤ-spans of the
double cosets [U_M m U_M] (m ∈ Δ_M⁺) and [U δ U] (δ ∈ Δ⁺). Prove: (1)
`doubleCoset_mul_of_positive`, for m, m' ∈ Δ_M⁺, U m U m' U = U m U_M m' U, so
[U m U][U m' U] = t([U_M m U_M][U_M m' U_M]) in H(G, U; ℤ), and [U m U][U m' U] = [U m m' U] when
U_M m U_M m' U_M = U_M m m' U_M (for instance when M is a torus); (2) `positiveHeckeHom`, the
ℤ-linear map t : H(Δ_M⁺, U_M; ℤ) →+* H(Δ⁺, U; ℤ), [U_M m U_M] ↦ [U m U], is a ring homomorphism,
and `positiveHeckeHom_injective`, it is injective; (3) `positiveHeckeHom_comp_restrict`, with
𝒮 = r_M ∘ r_P the restriction–integration map, t ∘ 𝒮 and 𝒮 ∘ t multiply [U m U], resp.
[U_M m U_M], by |δ_P(m)|⁻¹ = #(U_N / m U_N m⁻¹) on basis elements. In particular, for M = T a
torus, the [U t U] (t ∈ Δ_T⁺) span a commutative subalgebra of H(G, U; ℤ). For M = T a maximal
torus of a split group, U = K_p with an Iwahori decomposition relative to (B, B̄) and T⁺ the
monoid of t with t U_{K_p} t⁻¹ ⊆ U_{K_p} and t⁻¹ Ū_{K_p} t ⊆ Ū_{K_p}, t ↦ [K_p t K_p] is an
algebra homomorphism ℤ[T⁺/T_{K_p}] → H(G, K_p; ℤ). The two contraction conditions are needed: the
product decomposition alone does not make t ↦ [K_p t K_p] multiplicative ([ACC] §2.1.9,
Lemma 2.1.12 and the following paragraph, p. 914). *Needs:* *iwahori-decomposition*,
*permutation-hecke-algebra*, *hecke-ring-comparison*.

`HeckeAlgebraLevel.doubleCoset` transports the existing Hecke-ring basis into the permutation model; `HeckeAlgebraLevel.doubleCoset_coefficient` fixes its inverse-coset convention. `HeckeAlgebraLevel.supportAlgebra` is the subalgebra generated by the specified double cosets. `doubleCoset_mul_of_positive`, `positiveHeckeHom` and `positiveHeckeHom_span` give the double-coset identity, the injective homomorphism and the integral span description under the rational parabolic and Iwahori-decomposition hypotheses. `positiveHeckeHom_injective` records injectivity from the basis formula, and `positiveHeckeHom_comp_restrict` specifies restriction–integration on the positive basis and both composites by the radical index.

Checks: `HeckeAlgebraLevel.doubleCoset_identity` gives the unit; `HeckeAlgebraLevel.doubleCoset_normal` recovers multiplication for a normal level; `HeckeAlgebraLevel.doubleCoset_index` computes augmentation using the number of left cosets. For the generated algebra, `HeckeAlgebraLevel.supportAlgebra_empty` gives the scalar algebra, `HeckeAlgebraLevel.supportAlgebra_subgroup` shows that elements of the level subgroup add only scalars, and `HeckeAlgebraLevel.supportAlgebra_full` recovers the full Hecke algebra. These are the basis calculations underlying [ACC], §2.1.9.

`positiveHeckeHom_torus` gives the positive monoid-algebra map when the Levi is a torus, sending each monomial to its characteristic double coset.

`positiveHeckeHom_torus_quotient` gives the injective monoid-algebra map on the image of the positive torus in M/(M ∩ U), with each monomial sent to its characteristic double coset.

**Localisation at a strongly positive element** (*strongly-positive-localisation*). In the
setting of *positive-hecke-homomorphism* let z ∈ Z(M) be strongly positive and central in M, and
let R be a ring in which q (the residue cardinality, so that |δ_P|⁻¹ is a power of q) is a unit
and [UzU] is invertible in H(G, U) ⊗ R. Prove that [U_M z U_M] is central and invertible in
H(M, U_M; ℤ), that every [U_M m U_M] times a power of [U_M z U_M] lies in H(Δ_M⁺, U_M), and that
H(Δ_M⁺, U_M)[[U_M z U_M]⁻¹] = H(M, U_M; ℤ). Prove that t ⊗ R and 𝒮 ⊗ R extend uniquely to algebra
isomorphisms between H(M, U_M) ⊗ R and (H(Δ⁺, U) ⊗ R)[[UzU]⁻¹], inverse to each other up to the
twist by |δ_P| ([ACC] §2.1.9, Lemma 2.1.13, p. 915). *Needs:* *positive-hecke-homomorphism*.

`IsStronglyPositive.cofinal` states that multiplication by a sufficiently large power of the strongly positive central element brings every Levi element into the positive monoid.

`positiveHeckeHom.localization` states centrality, invertibility, and the universal property of the integral Levi localization, including the positive-power condition on every double coset. `positiveHeckeHom.localized_isomorphisms` gives the unique two scalar-extended algebra isomorphisms and specifies their composite as the inverse-modulus twist on every Levi double coset.

**The torus inside the pro-p Iwahori Hecke algebra** (*pro-iwahori-torus*). Let G be a split
reductive group over the ring of integers O_v of a nonarchimedean local field F_v with residue
field k(v) of characteristic p, B = TU a Borel, Iw(v) and Iw₁(v) the preimages of B(k(v)) and
U(k(v)) under G(O_v) → G(k(v)) (Iw₁(v) the pro-p Iwahori subgroup), O the ring of integers of a finite extension of ℚ_ℓ with ℓ > 2,
containing a chosen q_v^{1/2}, and H₁ = O[Iw₁(v)\G(F_v)/Iw₁(v)]. Prove that for x, y in the positive monoid
T(F_v)⁺ = {t : α(t) ∈ O_v for every simple root α}, [Iw₁ x Iw₁][Iw₁ y Iw₁] = [Iw₁ xy Iw₁], and
that [Iw₁ x Iw₁] is a unit of H₁[1/p] (of H₁ when p is invertible in O). Writing t = x y⁻¹ with
x, y positive, prove that t ↦ δ_B^{1/2}(t)[Iw₁ x Iw₁][Iw₁ y Iw₁]⁻¹ is a well-defined homomorphism
T(F_v) → (H₁[1/p])ˣ with kernel T(O_v)₁ = ker(T(O_v) → T(k(v))); the Iwahori analogue embeds
O[X_*(T)] ⊗ O[1/p] into O[Iw(v)\G(F_v)/Iw(v)][1/p] ([BCGP] §2.4.1, Proposition 2.4.2 and the
following paragraph; the paragraph after Proposition 2.4.4 (arXiv v3 pp. 20–21; PMIHÉS 134,
pp. 174–176)). Here p denotes the residue characteristic of F_v, whereas
[BCGP] calls the coefficient prime p. Inverting our p has the same effect as their
localization when v divides their coefficient prime; otherwise it is already a unit.
Extension to arbitrary coefficient rings is a separate integral-basis proof obligation;
the kernel assertion at least needs a nonzero localized coefficient ring.
**Check:** over the zero ring the unit group is trivial, so the asserted torus kernel would
be all of T(F_v), not T(O_v)₁. *Needs:* *positive-hecke-homomorphism*, *strongly-positive-localisation*;
ReductiveGroupsPartII RG2.3.

`HeckeAlgebraLevel.proIwahori_torus` states positive multiplication, invertibility and the unique normalized torus homomorphism with its kernel. The level is the pinned Bruhat–Tits pro-unipotent radical of an alcove, and `modulusCharacterSqrt` fixes the half modulus. Its coefficient-ring formulation includes the stated integral-basis proof obligation. The Iwahori analogue is `HeckeAlgebraLevel.bernsteinEmbedding_injective` below.

`HeckeAlgebraLevel.map` changes the coefficients of the finite double-coset matrices; `HeckeAlgebraLevel.map_coefficient` specifies each coefficient. Checks `HeckeAlgebraLevel.map_identity`, `HeckeAlgebraLevel.map_comp` and `HeckeAlgebraLevel.map_zeroRing` test identity, composition and the zero-ring obstruction, with matching examples.

**The positive Klingen Hecke algebra of GSp_4** (*klingen-positive-hecke*). Let ℓ be a prime,
J = (0 A; −A 0) with A the 2 × 2 antidiagonal matrix of ones,
GSp_4(ℚ_ℓ) = {g ∈ GL_4(ℚ_ℓ) : gᵀ J g = ν(g) J, ν(g) ∈ ℚ_ℓ^×} (GSp_4 for the antidiagonal form J),
and Kli(ℓ) ⊆ GSp_4(ℤ_ℓ) the Klingen parahoric, the elements whose reduction mod ℓ stabilises the
line F_ℓ e₁. Let U₀ = [Kli ℓ·1 Kli], U₁ = [Kli diag(ℓ², ℓ, ℓ, 1) Kli] and
U₂ = [Kli diag(ℓ, ℓ, 1, 1) Kli] in H(GSp_4(ℚ_ℓ), Kli(ℓ); ℤ). Prove that U₀, U₁, U₂ commute and
that the ring map ℤ[X₀, X₁, X₂] → H(GSp_4(ℚ_ℓ), Kli(ℓ); ℤ), X_i ↦ U_i, is injective: the subring
H⁺_Kli they generate is a polynomial ring in U₀, U₁, U₂ (V. Pilloni [Pil]
§5.1.4, p. 21, the unnumbered assertion following the three generators; the parabolic is
§5.1.2, p. 20, author-copy pagination). The coefficient ring is ℤ, and U₀⁻¹ is not among
the generators of this positive subalgebra. *Needs:* *positive-hecke-homomorphism*, *iwahori-decomposition*,
*hecke-ring-comparison*; ModularForms layer 2.

`Klingen.similitudeGroup` is the subgroup of `GL (Fin 4) ℚ_[p]` defined by the displayed form equation. `Klingen.parahoric` uses the pinned integral `GL₄` subgroup and the first residue line. `Klingen.generator` gives the three displayed matrices, and `Klingen.operator` uses `HeckeAlgebraLevel.doubleCoset`. `Klingen.operator_commute` and `Klingen.positive_polynomial` state commutativity and the injective polynomial-algebra map ([Pil], §5.1.4, p. 21).

Checks: `Klingen.similitudeGroup_identity`, `Klingen.similitudeGroup_diagonal` and `Klingen.similitudeGroup_unbalanced` distinguish the paired products in the form equation. `Klingen.parahoric_identity`, `Klingen.parahoric_upper` and `Klingen.parahoric_lower` distinguish the preserved residue line from its opposite. `Klingen.generator_scalar`, `Klingen.generator_klingen` and `Klingen.generator_siegel` fix all diagonal exponents. `Klingen.operator_atGenerator`, `Klingen.operator_nonidentity` and `Klingen.operator_scalar` fix the coefficient, support and central-translation normalization. Each has a Lean example.

### SR.1.5 Presentations of the Iwahori–Hecke algebra

**The Iwahori–Matsumoto presentation** (*iwahori-matsumoto*). Let G be a split connected
reductive group (Chevalley group) over a nonarchimedean local field F with residue cardinality q,
I an Iwahori subgroup, A any commutative ring, and W̃ = N_G(T)(F)/T(O_F) the extended affine Weyl
group, W̃ = W_aff ⋊ Ω with W_aff a Coxeter group on the simple affine reflections S_aff and Ω the
length-zero elements. Prove that G = ⊔_{w ∈ W̃} IwI, [IwI : I] = q^{ℓ(w)}, and that H(G, I; ℤ) is
free over ℤ on T_w = [IwI] (w ∈ W̃) with: T_w T_{w'} = T_{ww'} when ℓ(ww') = ℓ(w) + ℓ(w');
(T_s − q)(T_s + 1) = 0 for s ∈ S_aff; T_ω T_w = T_{ωw} for ω ∈ Ω. These relations (quadratic,
braid and length-zero) present H(G, I; ℤ) ≅ ℤ[Ω] ⊗̃ H_aff. Base change gives H(G, I; A) for every
A; each T_w is invertible once q ∈ Aˣ; if q = 1 in A then H(G, I; A) ≅ A[W̃] ([IM65] §2,
Theorem 2.16, p. 36 and Proposition 2.8, p. 33; §3, Proposition 3.2, Theorem 3.3,
Proposition 3.4, Theorem 3.5, Proposition 3.8, pp. 44–47). *Needs:* *hecke-ring-comparison*,
*permutation-hecke-algebra*; ReductiveGroupsPartII RG2.4, ReductiveGroupsPartII RG2.3,
ReductiveGroups layer 7.

`HeckeAlgebraLevel.iwahoriBasis` uses the Iwahori–Bruhat indexing from ReductiveGroupsPartII; `HeckeAlgebraLevel.iwahoriBasis_coefficient` specifies characteristic functions in the permutation model. `HeckeAlgebraLevel.iwahoriMatsumoto` states the length-additive and quadratic relations, and `HeckeAlgebraLevel.iwahoriMatsumoto_presentation` states their universal property. `HeckeAlgebraLevel.iwahoriBasis_unit` and `HeckeAlgebraLevel.iwahoriBasis_groupAlgebra` give invertibility and the q = 1 specialization. The equal-parameter assertions explicitly require splitness.

Checks: `HeckeAlgebraLevel.iwahoriBasis_identity` gives T₁ = 1; `HeckeAlgebraLevel.iwahoriBasis_reflection` gives Tₛ² = (q − 1)Tₛ + q; `HeckeAlgebraLevel.iwahoriBasis_residueOne` identifies each basis vector at q = 1 with its group-algebra basis vector.

`HeckeAlgebraLevel.iwahoriBasis_index` states the compact-open index formula; `HeckeAlgebraLevel.iwahoriBasis_baseChange` specifies coefficient extension on every basis vector.

**The Bernstein presentation** (*bernstein-presentation*). In the setting of *iwahori-matsumoto*
(G split connected reductive) let A be a ring containing an inverse square root q^{−1/2} of q
(A ∋ q^{±1/2}). For a dominant cocharacter λ set θ_λ = q^{−ℓ(λ)/2} T_{λ(ϖ)}, and
θ_{λ−μ} = θ_λ θ_μ⁻¹ for λ, μ dominant. Prove that λ ↦ θ_λ is a well-defined injective algebra
homomorphism A[X_*(T)] → H(G, I; A); that multiplication gives an A-module isomorphism
A[X_*(T)] ⊗_A H(K, I; A) ≅ H(G, I; A), where H(K, I; A) is the finite Hecke algebra of
K = G(O_F), with basis T_w (w ∈ W); and that for a simple reflection s = s_α ∈ W the Bernstein
relation T_s θ_λ − θ_{s(λ)} T_s = (q − 1)(θ_λ − θ_{s(λ)})/(1 − θ_{−α^∨}) holds (the right side
lies in A[X_*(T)]). The same holds for the generic affine Hecke algebra over ℤ[v, v⁻¹], which
specialises to H(G, I; A) by v ↦ q^{1/2}. [Lus89] 3.2–3.7, pp. 607–609,
works over ℂ[v,v⁻¹]; its equal-parameter relations have integral coefficients, but proving the
ℤ[v,v⁻¹] basis theorem and arbitrary-ring specialization is an additional integral proof
obligation, not a quoted conclusion of that source. *Needs:*
*iwahori-matsumoto*, *positive-hecke-homomorphism*.

`HeckeAlgebraLevel.bernsteinEmbedding` has source the translation subgroup of the pinned Iwahori–Weyl group. Its dominant values and injectivity are `HeckeAlgebraLevel.bernsteinEmbedding_dominant` and `HeckeAlgebraLevel.bernsteinEmbedding_injective`. `HeckeAlgebraLevel.bernstein_tensor` specifies multiplication on pure tensors, and `HeckeAlgebraLevel.bernstein_relation` uses a finite geometric sum for the divided difference, including negative pairings.

Checks: `HeckeAlgebraLevel.bernsteinEmbedding_identity` identifies the zero cocharacter with the unit; `HeckeAlgebraLevel.bernsteinEmbedding_dominant` fixes the normalization exponent; `HeckeAlgebraLevel.bernsteinEmbedding_inverse` distinguishes opposite translations.

`GenericIwahoriHecke` is the quotient of Mathlib's `FreeAlgebra` by the identity, length-additive and quadratic relations, using `RingQuot`. `GenericIwahoriHecke.generator` is the quotient image of a free-algebra variable. `GenericIwahoriHecke.basis`, `GenericIwahoriHecke.baseChange` and `GenericIwahoriHecke.specialization` state the integral basis theorem and its comparison with the existing p-adic Hecke algebra. `GenericIwahoriHecke.bernstein` and `GenericIwahoriHecke.bernstein_relation` include the Laurent-parameter presentation, by taking A = ℤ[v,v⁻¹] and q = v²; the integral assertions are the additional proof obligations described above.

Checks: `GenericIwahoriHecke_identity` imposes T₁ = 1; `GenericIwahoriHecke_reflection` gives both coefficients in the quadratic relation; `GenericIwahoriHecke_residueOne` identifies the parameter-one generators with the group-algebra basis. Each is mirrored on the quotient carrier.

**The centre of the Iwahori–Hecke algebra** (*iwahori-hecke-centre*). With G split and
A = ℂ[v,v⁻¹] for the generic affine Hecke algebra, prove that the centre of
H(G, I; A) is θ(A[X_*(T)])^W = θ(A[X_*(T)]^W), free over A on the orbit sums z_λ = Σ_{μ ∈ Wλ} θ_μ
for λ dominant. Prove that H(G, I; A) is free of rank |W| over θ(A[X_*(T)]), which is finite over
the centre, so H(G, I; A) is a finitely generated module over its centre. The extension to
arbitrary rings with q^{±1/2} is a stated gap: formation of the center does not formally
commute with base change, so an integral basis argument is needed. For q = 1 the
centre of A[X_*(T) ⋊ W] is again A[X_*(T)]^W, W acting faithfully on X_*(T). This group-algebra case is a separate direct calculation, not a formal consequence of
specializing a center. The comparison of this centre with the spherical Hecke algebra (z ↦ e_K z, the Satake isomorphism) is an SR.4
target, not part of this target ([Lus89] §3, Proposition 3.11 and §3.12, p. 610). *Needs:*
*bernstein-presentation*.

`GenericIwahoriHecke.center_basis` characterizes the central basis by the coefficient-one orbit sums. `GenericIwahoriHecke.translation_basis` gives the finite-Weyl basis over the translation algebra. `GenericIwahoriHecke.bernstein` states the invariant centre and finiteness over it; `HeckeAlgebraLevel.bernstein_center` and `HeckeAlgebraLevel.bernstein_center_finite` give the corresponding specialized signatures. These statements include the separate integral proof obligation, without assuming that centre formation commutes with base change. `HeckeAlgebraLevel.latticeSemidirect_center` states the parameter-one calculation directly, with faithful Weyl action on a torsion-free lattice.

### Examples

The checks of the layer compute the normalised measure and the convolution on ℚ_p over ℤ[1/p]
(μ(p^n ℤ_p) = p^{−n}, 1_{pℤ_p} * 1_{pℤ_p} = p⁻¹ • 1_{pℤ_p}, e_{pℤ_p} = p • 1_{pℤ_p}), recover the
group ring for finite discrete groups and for U normal in G, count the p + 1 left cosets of
[U diag(p,1) U] in GL_2(ℚ_p), exhibit the Iwahori decomposition of the Iwahori subgroup of
GL_2(ℚ_p) and its failure for GL_2(ℤ_p), and show that there is no F_p-valued Haar measure on ℤ_p
and no unit in H(ℚ_p, ℚ).

### Dependencies

SR.0; Mathlib's `LocallyConstant`, `CompactlySupportedContinuousMap` and `haarMeasure`; the
double-coset Hecke ring of Mathlib and Tau Ceti; ModularForms layer 2; ReductiveGroups layer 7;
ReductiveGroupsPartII RG2.3 and RG2.4.

## Layer SR.0d: the derived smooth category

The smooth category is Grothendieck abelian. It therefore has enough injectives, K-injective
resolutions of unbounded complexes and an unbounded derived category, and the Hom complexes into
K-injective complexes give its dg enhancement. Derived invariants of a compact open subgroup
compute continuous cohomology. For G locally pro-p and Λ killed by an integer prime to p, the
compact inductions c-Ind_K Λ from pro-p subgroups K are compact generators.

### SR.0d.1 The Grothendieck property and the derived category

**The smooth category is a Grothendieck category** (*grothendieck-abelian*). Let G be locally
profinite, A a commutative ring and U a compact open subgroup. Prove that SmoothRep A G is a
Grothendieck abelian category: filtered colimits exist and are exact (AB5), and ⊕_{U ∈ 𝒰} A[G/U]
is a generator for any neighbourhood basis 𝒰 of compact open subgroups, because
Hom_G(A[G/U], V) ≅ V^U and V = ⋃ V^U. Hence SmoothRep A G has enough injectives, Ext groups and a
derived category (Mathlib). Prove that for a compact open U the restriction functor
SmoothRep A G ⥤ SmoothRep A U preserves injective objects, since its left adjoint, algebraic
induction A[G] ⊗_{A[U]} −, is exact and preserves smoothness ([Ber87] §1.1–1.2, pp. 3–4).
*Needs:* *smooth-rep-abelian*, *compact-open-invariants*.


The Grothendieck structure is `SmoothRep.instIsGrothendieckAbelian`; compact-open restriction preserves injectives by `SmoothRep.res_preserves_injective`.

**The derived category of smooth representations** (*derived-smooth-category*). Let G be locally
profinite, A a commutative ring, and the universe large enough for HasDerivedCategory.standard.
Use Mathlib's `DerivedCategory (SmoothRep A G)` for D(G,A),
`DerivedCategory.Plus` for D⁺(G,A), `DerivedCategory.Q` for localization, and
`DerivedCategory.singleFunctor` for the fully faithful degree-zero embedding.
Use `CategoryTheory.Abelian.Ext` for Ext^n_G, including its Yoneda composition and long
exact sequences. These are the existing categorical constructions applied to the smooth
category, with no new wrappers. Prove that for G finite discrete
D(G, A) ≃ D(A[G]), and that for an open subgroup U restriction and algebraic induction are exact
and induce an adjunction on derived categories. These are formal consequences of the
exact induction–restriction adjunction above. [FS] Ch. V §1, Theorem V.1.1, p. 168,
is the geometric comparison for locally pro-p G and nA = 0 for some n prime to p; it is not a source for arbitrary locally profinite G and arbitrary A. *Needs:*
*grothendieck-abelian*.

`SmoothRep.derivedGroupAlgebra_equivalence` compares the derived categories for discrete G and commutes with localization of complexes. `SmoothRep.derivedCompactFrobeniusReciprocity` states the unbounded derived adjunction for an open subgroup, with both functors identified on complexes.

**Checks.**

- `SmoothRep.ext_one_padicInt_fp`: Ext¹ of the trivial representation of ℤ_p over F_p with itself
  is one-dimensional.
- `SmoothRep.ext_pos_padicInt_fl`: for ℓ ≠ p, Ext^i of smooth F_ℓ-representations of ℤ_p vanishes
  for i > 0.
- `SmoothRep.ext_zero_test`: Ext⁰ of the trivial representation with itself is A.

**Checks (derived carrier).** On the actual Mathlib derived category of `SmoothRep`,
the degree-zero embedding induces a bijection on Hom, Hom from a degree-zero object to
a negative shift of another is zero, and a zero smooth object maps to a zero derived object.
All three are Lean examples with an explicit `HasDerivedCategory` universe instance.

**K-injective resolutions in Grothendieck categories** (*k-injective-resolutions*). Let 𝒜 be a
Grothendieck abelian category (Mathlib's IsGrothendieckAbelian). Prove that every (unbounded)
cochain complex X admits a quasi-isomorphism X → I to a K-injective complex I (Mathlib's
CochainComplex.IsKInjective). Consequently every additive functor F : 𝒜 → ℬ has a total right
derived functor RF : D(𝒜) → D(ℬ) computed by K-injective resolutions, and
RHom(X, Y) := HomComplex(X, I_Y) computes Hom_{D(𝒜)}(X, Y[n]) in degree n. Applied to
𝒜 = SmoothRep A G this gives unbounded derived invariants RΓ(U, −) : D(G, A) → D(A) and derived
Hom complexes ([Stacks] Tag 079P). *Needs:* the library vocabulary of this layer.


`SmoothRep.exists_kInjective` applies the library resolution theorem to this category; `SmoothRep.derivedInvariantsUnbounded_obj` states how the unbounded invariant functor is computed.

**Checks.** `SmoothRep.exists_kInjective` specializes the existence statement to smooth
complexes. The zero complex is K-injective; the identity on a K-injective complex is a
quasi-isomorphism; and a bounded-below complex of injective smooth objects is K-injective.
These are Lean examples; the last uses Mathlib's existing
`CochainComplex.isKInjective_of_injective` in
`Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean`.

### SR.0d.2 Derived invariants, the dg enhancement, generators, duality and the derived Hecke algebra

**Derived invariants and continuous cohomology** (*derived-invariants*). Let G be locally
profinite, A commutative, U a compact open subgroup and N ⊴ U a closed normal subgroup. Define
`SmoothRep.derivedInvariants`, RΓ(U, −) : D⁺(G, A) ⥤ D⁺(A), the right derived functor of
invariantsFunctor U (Mathlib's rightDerivedFunctorPlus), and prove
`SmoothRep.derivedInvariants_iso_rHom`, RΓ(U, −) ≅ RHom_G(A[G/U], −). Prove
`SmoothRep.homology_derivedInvariants_iso_continuousCohomology`: its cohomology on a smooth V is
the continuous cohomology of the profinite group U with coefficients in the discrete module V,
H^i(RΓ(U, V)) ≅ H^i_cont(U, V) (Mathlib's continuousCohomology, ProfiniteCohomology layer 10),
naturally in V. It commutes with filtered colimits. If U has pro-order invertible in A,
RΓ(U, −) = Γ(U, −) (no higher cohomology). For a closed normal subgroup N of U,
RΓ(U, −) ≅ RΓ(U/N, RΓ(N, −)). Prove `SmoothRep.res_preserves_injective`: restriction to a compact
open U preserves injective objects. These general statements are proved from the exact
compact-induction adjunction and the discrete continuous-cochain resolution supplied by
ProfiniteCohomology. [CG18-arXiv] Lemma 9.14 and Remark 9.15, p. 92, only treat the
specified locally admissible block over O/ϖ^k; they are a special-case comparison, not a
reference for arbitrary G and A. The general cochain comparison, including acyclicity for
closed N, remains an explicit proof obligation here. *Needs:* *grothendieck-abelian*, *derived-smooth-category*, *invariants-exact*;
ProfiniteCohomology layer 7, ProfiniteCohomology layer 10.

**Checks.**

- `SmoothRep.derivedInvariants_padicInt_fp`: for G = U = ℤ_p and A = F_p, H¹(RΓ(U, F_p)) ≅ F_p and H²(RΓ(U, F_p)) = 0.
- `SmoothRep.derivedInvariants_trivial_group`: for U trivial (G discrete), RΓ(U, V) = V.
- `SmoothRep.derivedInvariants_unit_test`: for U = ℤ/3 discrete and A = ℤ[1/3], RΓ(U, V) = V^U for all V, matching Representation.averageMap.


`SmoothRep.derivedInvariants_iso_rHom` compares unbounded derived invariants with Hom from the permutation module. `SmoothRep.homology_derivedInvariants_iso_continuousCohomology` uses the discrete continuous-representation equivalence and Tau Ceti’s continuous cohomology.

**The dg enhancement of the derived smooth category** (*dg-enhancement*). Let G be locally
profinite and A a commutative ring. The derived smooth category is enhanced by the dg category
whose objects are K-injective complexes of smooth representations and whose Hom complexes are
Mathlib's CochainComplex.HomComplex; prove that its homotopy category is equivalent to D(G, A).
For complexes V, W of smooth representations define `SmoothRep.rHom`,
RHom_G(V, W) := HomComplex(V, I_W) with I_W a K-injective resolution, a complex of A-modules, and
prove `SmoothRep.rHom_functorial`, that RHom_G is functorial in both variables on D(G, A),
contravariant in the first (functorial up to homotopy on complexes); `SmoothRep.homology_rHom`,
H^n RHom_G(V, W) ≅ Hom_{D(G,A)}(V, W[n]); and `SmoothRep.rHom_permutation`,
RHom_G(A[G/U], W) ≅ RΓ(U, W) for U compact open. The forgetful functor to complexes of A-modules,
restriction to open subgroups, derived invariants and derived tensor products over A are dg
functors or are computed by K-flat/K-injective replacements in this model ([Stacks] Tag 070Y and
Tag 079P). *Needs:* *k-injective-resolutions*, *derived-smooth-category*, *derived-invariants*.

Check `SmoothRep.tensorComplex_koszul`: for the two complexes [ℤ → ℤ] with identity differentials in degrees 0 and 1, the tensor differential is (x,y) ↦ x − y in the (0,1),(1,0) ordering. The vector (0,1) maps to −1.

**Checks.**

- `SmoothRep.homology_rHom_zero`: H⁰ RHom_G(A, A) = A for the trivial representation of any G.
- `SmoothRep.rHom_padicInt_fp`: for G = ℤ_p and A = F_p, H¹ RHom_G(F_p, F_p) = F_p.
- `SmoothRep.rHom_discrete_compat`: for G finite discrete, RHom_G agrees with RHom over A[G] after Rep.equivalenceModuleMonoidAlgebra.


Use `SmoothRep.tensor`, `SmoothRep.internalHom` and `SmoothRep.tensorHomEquiv` for the diagonal tensor–Hom adjunction. `SmoothRep.tensorComplex` uses Mathlib’s direct-sum total tensor complex and its Koszul differential. `SmoothRep.IsKFlat` means that tensoring preserves acyclic complexes; `SmoothRep.exists_kFlat` supplies a quasi-isomorphic K-flat complex.

**Compact induction from pro-p subgroups generates the derived category** (*compact-generation*).
Let G be locally profinite with a cofinal family 𝒦 of compact open
subgroups of pro-order invertible in A (HasCofinalUnitProOrder A G; for a locally pro-p group,
p ∈ A^×). Prove that for K ∈ 𝒦 the permutation module A[G/K] = c-Ind_K^G A is projective in
SmoothRep A G, that RHom_G(A[G/K], V) = V^K, and that A[G/K] is a compact object of D(G, A) (Hom
out of it commutes with arbitrary direct sums). Prove that the family {A[G/K]}_{K ∈ 𝒦} generates
D(G, A): a complex V with V^K acyclic for all K ∈ 𝒦 is 0. Hence D(G, A) is compactly generated,
and the thick subcategory generated by these objects consists of compact objects (for Λ a
ℤ_ℓ-algebra with ℓ ≠ p it is exactly the compact objects, as Fargues–Scholze state) ([FS] Ch. I
§5, Theorem I.5.1(iii), p. 24). The more general cofinal-unit-pro-order statement
here is proved algebraically from the displayed projective generators and exact invariants;
it is not the group/coefficient scope of that geometric theorem. *Needs:* *derived-invariants*, *k-injective-resolutions*,
*invariants-exact*, *unit-pro-order*.


`SmoothRep.permutation_projective` gives projectivity at invertible pro-order. `SmoothRep.derivedInvariants_detect_zero` detects zero objects on the cofinal family.

**Derived smooth duality and admissible complexes** (*derived-smooth-dual*). Let G be locally
profinite with HasCofinalUnitProOrder A G (e.g. locally pro-p and p ∈ A^×). Define
`SmoothRep.derivedSmoothDual`, 𝔻 : D(G, A)ᵒᵖ ⥤ D(G, A), the right derived functor of the left
exact functor V ↦ (V*)^sm = smooth part of Hom_A(V, A), 𝔻(V) := R((−)*)^sm (V), and prove
`SmoothRep.hom_derivedSmoothDual`, the characterising property
Hom_{D(G,A)}(B, 𝔻(V)) ≅ Hom_{D(G,A)}(B ⊗^L_A V, A) natural in B and V. Define
`SmoothRep.IsAdmissibleComplex`: a complex V is admissible if V^K is a perfect complex of
A-modules for every K in the cofinal family of compact open subgroups of invertible pro-order.
Prove `SmoothRep.invariants_derivedSmoothDual`, 𝔻(V)^K ≅ RHom_A(V^K, A) for K of invertible
pro-order; hence the dual of an admissible complex is admissible, and the natural map V → 𝔻𝔻(V)
is an isomorphism for admissible V ([FS] Ch. V §1, Corollary V.1.4 and proof, pp. 170–171;
Theorem I.5.1(v), p. 25, Theorem V.6.2, p. 182 and Theorem V.7.1, p. 183 (admissible complexes
and biduality); the formula for 𝔻(V)^K follows from the characterising property with
B = A[G/K]). Corollary V.1.4 assumes locally pro-p G and nA = 0 for some
n prime to p; Theorem I.5.1 concerns reductive local groups and ℤ_ℓ-algebras, ℓ ≠ p.
The stated extension to HasCofinalUnitProOrder and arbitrary A is a separate formal
construction obligation: construct the derived internal Hom, use averaging to identify
its K-invariants, then detect biduality on that cofinal family. No arbitrary-coefficient
version is attributed to the geometric theorems. *Needs:* *smooth-dual*, *dg-enhancement*, *compact-generation*,
*k-injective-resolutions*.

**Checks.**

- `SmoothRep.derivedSmoothDual_character`: 𝔻(A(χ)) ≅ A(χ⁻¹) in degree 0.
- `SmoothRep.derivedSmoothDual_zero`: 𝔻(0) = 0.
- `SmoothRep.not_isAdmissibleComplex_cInd`: for G = ℚ_p and A = F_ℓ (ℓ ≠ p), F_ℓ[ℚ_p/ℤ_p] in degree 0 is not an admissible complex.


`SmoothRep.derivedTensor_obj` characterizes `SmoothRep.derivedTensor` using K-flat representatives. `SmoothRep.derivedInternalHom` is pinned by `SmoothRep.derivedTensorHomAdjunction`; `SmoothRep.derivedInternalHom_dual` identifies its value at the coefficient unit with the derived smooth dual.

Checks:

- `SmoothRep.derivedTensor_unit`: the rank-one trivial object is the tensor unit.
- `SmoothRep.derivedTensor_zero`: tensoring with an acyclic complex is zero.
- `SmoothRep.derivedTensor_torsion`: Tor sits in cohomological degree minus one.
- `SmoothRep.derivedInternalHom_unit`: Hom out of the tensor unit is the original object.
- `SmoothRep.derivedInternalHom_zero`: Hom into zero is zero.
- `SmoothRep.derivedInternalHom_torsion`: Ext of integral torsion appears in degree one.

**Central characters separate Ext groups** (*central-ext-vanishing*). Let G be locally profinite
and A commutative, and let z ∈ Z(G, A) (*smooth-centre*) act on smooth V by a scalar a and on W by
a scalar b. Prove that (a − b) annihilates Ext^n_G(V, W) for every n; in particular if a − b ∈ A^×
all Ext^n_G(V, W) vanish. For an abelian locally profinite group T and smooth characters χ, χ'
with χ(t) − χ'(t) ∈ A^× for some t ∈ T, Ext^n_T(A(χ), A(χ')) = 0 for all n ≥ 0 ([CG18-arXiv] arXiv
v2 §9.2.1, proof of Lemma 9.12, p. 91 (the torus case); the general statement is the naturality
of the action of Z(G, A) on Ext through either argument). *Needs:* *smooth-centre*,
*derived-smooth-category*.


`SmoothRep.central_ext_annihilation` and `SmoothRep.central_ext_vanishing` state the scalar-annihilation and unit-difference assertions.

**The derived Hecke algebra** (*derived-hecke-algebra*). Let G be locally profinite, S a
commutative ring and U, U₁, U₂ compact open subgroups. Define `SmoothRep.derivedHecke`, the derived
Hecke algebra H*(G, U; S) := Ext*_{SmoothRep S G}(S[G/U], S[G/U]), a graded S-algebra under Yoneda
composition (opposite convention as in Venkatesh), and `SmoothRep.derivedHeckeAction`, its graded
action on the derived invariants H*(U, V) = Ext*_G(S[G/U], V) of every smooth V, natural in V.
Prove `SmoothRep.derivedHecke_zero`: its degree-zero part is the Hecke algebra End_G(S[G/U]) of
SR.1 (*permutation-hecke-algebra*). Prove `SmoothRep.derivedHecke_equiv_doubleCoset`, the
invariant-function model given by Shapiro's lemma,
H*(G, U; S) ≅ ⊕_{x ∈ U\G/U} H*(U ∩ xUx⁻¹, S) as graded S-modules, with product given by
restriction, conjugation and corestriction along double cosets (the double-coset model). More
generally, for compact open U₁, U₂ the derived bimodules Ext*(S[G/U₁], S[G/U₂]) make H*(G, U₁)
and H*(G, U₂) act compatibly, as for the derived Iwahori–Hecke algebra and its spherical
bimodules ([Ven-arXiv] §2.2, Definition 2.2 and equation (21), p. 12; §2.3, from p. 12
(invariant-function model); §4.2 and §4.4). *Needs:* *derived-invariants*,
*grothendieck-abelian*, *permutation-hecke-algebra*.


`SmoothRep.derivedHecke_bimodule` states associativity of the two corner actions, and `SmoothRep.derivedHeckeAction_natural` states compatibility with morphisms of smooth coefficients.

**Checks.**

- `SmoothRep.derivedHecke_padicInt`: for G = U = ℤ_p and S = F_p, H¹(G, U; F_p) ≅ F_p and H^i = 0 for i ≥ 2.
- `SmoothRep.derivedHecke_unit_degree_zero`: for U of invertible pro-order in S, H^i(G, U; S) = 0 for i > 0.
- `SmoothRep.derivedHecke_zero_compat`: H⁰(G, U; S) is the double-coset Hecke ring 𝕋 of the Hecke pair (U, G) over S (via SR.1 *hecke-ring-comparison*).

### Examples

The checks of the layer are the cohomology of ℤ_p with F_p-coefficients (Ext¹ and H¹ of
dimension one, H² = 0, the derived Hecke algebra concentrated in degrees 0 and 1), its vanishing
in positive degrees for F_ℓ-coefficients with ℓ ≠ p and for U of invertible pro-order, where
RΓ(U, −) is the averaging projector, the agreement with RHom over A[G] for finite G, and the
non-admissible complex F_ℓ[ℚ_p/ℤ_p].

### Dependencies

SR.0 and SR.1; Mathlib's Grothendieck-abelian, derived-category, K-injective and Ext API;
ProfiniteCohomology layers 7 and 10.

## Layer SR.2: induction, compact induction and Jacquet functors

Smooth induction from a closed subgroup, and compact induction with support compact modulo the
subgroup. The layer gives Frobenius reciprocity in both directions (for open subgroups, compact
induction is Mathlib's algebraic induction), exactness when the relevant pro-orders are
invertible, induction in stages, invariants of induced representations, the l-sheaf model on H\G
and the Mackey filtration.

### SR.2.1 Smooth and compact induction

**Smooth induction from a closed subgroup** (*smooth-induction*). Let H be a closed subgroup of
a locally profinite G, A commutative, and (σ, W) a smooth representation of H over A. Define
`SmoothRep.ind`, Ind_H^G σ, the space of functions f : G → W with f(hg) = σ(h) f(g) (h ∈ H) that
are right invariant under some compact open subgroup of G, with G acting by right translation
(`SmoothRep.ind_apply_mul`: f(hg) = σ(h) f(g) and (g'·f)(g) = f(g g')). Equivalently it is the
smooth part (SR.0 *smooth-vectors*) of Mathlib's algebraic coinduction Representation.coind along
H ↪ G. Define `SmoothRep.indFunctor`, the A-linear functor SmoothRep A H ⥤ SmoothRep A G, with
map_id and map_comp; it is unnormalised, with no modulus character. Define `SmoothRep.indEval`,
evaluation at 1, an H-map Ind_H^G σ → σ, and prove that it is surjective and nonzero on every
nonzero G-subrepresentation ([Cas95] §2.4, definitions and Theorem 2.4.1(a)–(c), p. 26).
[BH06] §2.4 and Frobenius Reciprocity, pp. 17–18, fixes the same right-translation action and evaluation map. Those constructions use no division and apply over A. *Needs:* *smooth-vectors*, *smooth-rep-category*.

**Checks.**

- `SmoothRep.ind_self`: Ind_G^G σ ≅ σ.
- `SmoothRep.ind_bot_padicInt`: for G = ℤ_p and H = ⊥, Ind_H^G A ≅ LocallyConstant ℤ_p A with
  translation.
- `SmoothRep.ind_ne_coind`: for G = ℤ_p, H = ⊥ and A = ℤ, Ind_H^G ℤ ≠ coind, the characteristic
  function of a non-open set being in coind but not smooth.

**Compact induction** (*compact-induction*). Let H be closed in G (open for the algebraic
comparison), A commutative and σ smooth on H. Define `SmoothRep.cInd`, c-Ind_H^G σ ⊆ Ind_H^G σ,
the subrepresentation of functions whose support is compact modulo H (has compact image in H\G),
and `SmoothRep.cIndFunctor`, the A-linear functor SmoothRep A H ⥤ SmoothRep A G. Prove
`SmoothRep.cInd_eq_ind_of_compact`: if H\G is compact, c-Ind_H^G = Ind_H^G. Prove
`SmoothRep.cIndIsoInd`: if H is open, f ↦ Σ_{gH ∈ G/H} g ⊗ f(g⁻¹) identifies c-Ind_H^G σ with
Mathlib's algebraic induction Rep.ind along H.subtype (A[G] ⊗_{A[H]} σ), naturally in σ; in
particular c-Ind_U^G A = A[G/U] for a compact open U (Tau Ceti's indTrivialIso), and c-Ind_U^G A
is generated by the characteristic function of U ([Cas95] §2.4, p. 26; Theorem 2.4.1(d)).
[BH06] §2.5 and Lemma (1)–(2), pp. 19–20, gives the support condition and the open-subgroup coset model. Its construction applies over A. *Needs:* *smooth-induction*.

**Checks.**

- `SmoothRep.cInd_padic`: c-Ind_{ℤ_p}^{ℚ_p} A ≅ A[ℚ_p ⧸ ℤ_p].
- `SmoothRep.cInd_self`: c-Ind_G^G σ ≅ σ.
- `SmoothRep.cInd_ne_ind`: for G = ℚ_p, H = {0} and A nonzero, the constant function 1 lies in Ind but not in
  c-Ind. For the zero coefficient ring both function spaces are zero.

**Frobenius reciprocity for smooth induction** (*frobenius-reciprocity*). For H closed in G (open
for the second adjunction), a smooth G-representation π and a smooth H-representation σ over any
commutative A, prove that composition with evaluation at 1 gives a natural isomorphism
Hom_G(π, Ind_H^G σ) ≅ Hom_H(π|_H, σ): smooth induction is right adjoint to restriction. For H
open, prove that compact induction is left adjoint to restriction,
Hom_G(c-Ind_H^G σ, π) ≅ Hom_H(σ, π|_H), and that under *compact-induction*'s comparison this is
Mathlib's Rep.indResAdjunction; in particular Hom_G(A[G/U], π) ≅ π^U. For H closed but not open,
c-Ind_H^G is not in general left adjoint to restriction ([Cas95] Theorem 2.4.1(e), p. 26).
[BH06] 2.4 Frobenius Reciprocity, p. 18, and 2.5 Proposition, p. 20, give the two adjunctions, with closed and open subgroup hypotheses respectively. Their explicit maps are valid over A. *Needs:* *smooth-induction*, *compact-induction*.


The adjunctions are `SmoothRep.frobeniusReciprocity` and `SmoothRep.compactFrobeniusReciprocity`; `SmoothRep.cIndIsoInd` compares open-subgroup compact induction with algebraic induction.

`SmoothRep.frobeniusReciprocity_evaluation` identifies the adjunction map with evaluation at 1.

**Invariants of induced representations** (*induced-invariants*). For H closed, σ smooth on H, K
compact open in G and A commutative, prove that evaluation at representatives gives
(Ind_H^G σ)^K ≅ ∏_{x ∈ H\G/K} σ^{H ∩ xKx⁻¹} and (c-Ind_H^G σ)^K ≅ ⊕_{x ∈ H\G/K} σ^{H ∩ xKx⁻¹}. In
particular, if G = H K then (Ind_H^G σ)^K ≅ σ^{H ∩ K}; and for a parabolic P = MN and K with an
Iwahori decomposition, (Ind_P^G σ)^K ≅ ⊕_{x ∈ P\G/K} σ^{pr_M(P ∩ xKx⁻¹)} (M-components, N acting
trivially) ([Ber87] §2.3(vii), Lemma, p. 11 (the parabolic case); the closed-subgroup formulas
are evaluation at representatives of H\G/K). *Needs:* *smooth-induction*, *compact-induction*,
*compact-open-invariants*; ReductiveGroupsPartII RG2.4.


`SmoothRep.ind_invariants` and `SmoothRep.cInd_invariants` specify the evaluation isomorphisms using chosen double-coset representatives and the actual intersection subgroups.

**Exactness of induction** (*induction-exactness*). For H closed in a locally profinite G and
any commutative A, with the extra hypotheses stated, prove: (a) c-Ind_H^G is exact; (b) Ind_H^G is
exact if H\G is compact; (c) Ind_H^G is exact when every compact open subgroup of H has invertible
pro-order in A (e.g. complex coefficients). In general Ind_H^G is left exact (as a right adjoint)
and preserves products, and c-Ind_H^G preserves direct sums. For H\G compact both preserve
admissibility ([BZ77] §1.9(a),(e), p. 445). [BH06] 2.4 Proposition, pp. 18–19, and 2.5 Exercise 1, p. 19, prove the complex cases; the proof of smooth-induction exactness uses invariants for H ∩ gKg⁻¹. Over A use the stated unit-pro-order hypothesis for that proof; compactly supported lifting uses a finite refinement. *Needs:* *compact-induction*, *induced-invariants*,
*invariants-exact*; ProfiniteCohomology layer 0.


The categorical statements are `SmoothRep.cInd_exact`, `SmoothRep.ind_exact_compact` and `SmoothRep.ind_exact_unit`.

**Induction in stages** (*induction-in-stages*). For closed subgroups K ≤ H ≤ G of a locally
profinite G and A commutative, prove the natural isomorphisms Ind_H^G ∘ Ind_K^H ≅ Ind_K^G and
c-Ind_H^G ∘ c-Ind_K^H ≅ c-Ind_K^G, given by f ↦ (g ↦ f(g)(1)). For open subgroups the compact
version agrees, under *compact-induction*'s comparison, with Tau Ceti's transitivity of algebraic
induction (indFunctorCompIso, InductionRestriction layer 0), and the projection formula
c-Ind_H^G(σ ⊗ π|_H) ≅ c-Ind_H^G σ ⊗ π holds (Tau Ceti's indProjection for open H) ([Cas95]
Proposition 2.4.5, p. 28). *Needs:* *smooth-induction*, *compact-induction*;
InductionRestriction layer 0.


`SmoothRep.ind_stages` and `SmoothRep.cInd_stages` compare the subgroup K of H with its injective image in G.

`SmoothRep.ind_stages_natural` and `SmoothRep.cInd_stages_natural` state natural induction-in-stages isomorphisms with the function formula F(g)(1).

**Induced representations as sections over H\G** (*l-sheaf-model*). Let G be locally profinite
and countable at infinity, H closed, A commutative and σ smooth on H. Define `SmoothRep.indSheaf`,
a G-equivariant sheaf 𝓕_σ of A-modules on the l-space X = H\G (an l-sheaf, with stalk σ at the
base point), and prove `SmoothRep.ind_equiv_sections`: Ind_H^G σ is its space of smooth sections
and c-Ind_H^G σ its space of compactly supported sections. Prove `SmoothRep.cInd_shortExact_open`:
for an open G'-stable (G' ≤ G closed) subset Y ⊆ X with closed complement Z, restriction gives a
short exact sequence of G'-representations 0 → Γ_c(Y, 𝓕_σ) → c-Ind_H^G σ → Γ_c(Z, 𝓕_σ) → 0. Prove
`SmoothRep.indSheafEquiv`: the functor σ ↦ 𝓕_σ is an equivalence between smooth
H-representations and G-equivariant l-sheaves on H\G (G countable at infinity) ([BZ77]
§5.10–5.14, pp. 463–465). *Needs:* *smooth-induction*, *compact-induction*,
*open-closed-sequence*, *locally-constant-compact-support*.


`EquivariantLSheaf` consists of an actual sheaf of modules on G/H with compatible locally smooth translation maps. `SmoothRep.indEquivariantSheaf` uses the equivariant-function sheaf, and `SmoothRep.indSheafEquiv_fibre` identifies the inverse equivalence with its stalk at the identity coset.

Checks:

- `SmoothRep.indEquivariantSheaf_point`: the fibre of induction from G is the inducing module.
- `SmoothRep.indEquivariantSheaf_zero`: induction of zero has zero stalk at every point.
- `SmoothRep.indEquivariantSheaf_translation`: right translation is retained on global sections.

**Checks.**

- `SmoothRep.indSheaf_point`: for H = G, sections over the point are σ.
- `SmoothRep.cInd_shortExact_gl2`: for GL_2(ℚ_p), B and Y the big cell, the kernel term is C_c^∞(ℚ_p, A) twisted by χ and the quotient is one-dimensional.
- `SmoothRep.indSheaf_trivial_subgroup`: for H = ⊥, compactly supported sections are C_c^∞(G, W) of SR.1.

**The Mackey filtration** (*mackey-filtration*). Let G be locally profinite and countable at
infinity, and H, Q closed subgroups of G such that Q has finitely many orbits on X = H\G, each
locally closed, numbered Z₁, …, Z_k so that Y_i = Z₁ ∪ … ∪ Z_i is open. Prove that the restriction
to Q of c-Ind_H^G σ has a Q-stable filtration 0 = F₀ ⊆ F₁ ⊆ … ⊆ F_k with
F_i/F_{i−1} ≅ c-Ind_{Q ∩ x_i⁻¹Hx_i}^Q (x_i⁻¹ · σ), x_i ∈ G a representative of Z_i. For H, Q open
(in particular G finite) this is the Mackey decomposition, a direct sum (Tau Ceti's
Rep.mackeyDecomposition) ([BZ77] §5.1–5.2, pp. 459–460; §5.10–5.14). *Needs:* *l-sheaf-model*;
InductionRestriction layer 3.

`SmoothRep.Filtration` consists of an exhaustive finite chain of invariant submodules; `SmoothRep.Filtration.graded` is its actual successive quotient. `SmoothRep.orbitStabilizer` and `SmoothRep.orbitRepresentation` use the stabilizer of Hx under right translation, with action q ↦ xqx⁻¹, as specified by `SmoothRep.orbitRepresentation_action`. `SmoothRep.mackey_filtration` specifies the support of every filtration step and its orbit-induction quotient. `SmoothRep.mackey_open` gives the direct sum when the restricting subgroup is open, with evaluation f(xq) on each summand.

Checks: `SmoothRep.Filtration_zero` forces a zero object when there are no pieces; `SmoothRep.Filtration_single` recovers the original object; `SmoothRep.Filtration_repeated` makes a repeated step's quotient zero. `SmoothRep.Filtration.graded_zero` makes every graded piece zero when the original representation is zero. `SmoothRep.orbitStabilizer_identity`, `SmoothRep.orbitStabilizer_trivial` and `SmoothRep.orbitStabilizer_full` compute the stabilizers of a point, a free orbit and the one-point quotient. `SmoothRep.orbitRepresentation_zero` and `SmoothRep.orbitRepresentation_trivial` preserve the zero and trivial fibres; `SmoothRep.orbitRepresentation_weyl` exchanges the diagonal characters for the GL₂ Weyl element. These specialize the orbit calculation in [BZ77], §5.1–5.2.

### SR.2.2 Jacquet functors and parabolic induction

`SmoothRep.mackey_filtration_natural` fixes each graded isomorphism by restriction f ↦ (q ↦ f(xq)) and states its compatibility with every morphism of inducing representations.

**The modulus character and its square root** (*modulus-character*). Let G be locally profinite
and P = M ⋉ N closed with N a union of compact open subgroups; A ∋ q^{−1}, and q^{±1/2} ∈ A for
the square root. For a closed subgroup N of G normalised by m ∈ G define `modulus`, the module
mod_N(m), on the normaliser of N with values in ℚ_{>0}, by index ratios of compact open subgroups
of N: it is the factor by which conjugation u ↦ m u m⁻¹ scales a Haar measure of N, and for a
compact open N₀ ⊆ N it is [mN₀m⁻¹ : mN₀m⁻¹ ∩ N₀]/[N₀ : mN₀m⁻¹ ∩ N₀]. Prove `modulus_mul`,
mod_N(mm') = mod_N(m) mod_N(m'), and `modulus_eq_index`, mod_N(m) = [mN₀m⁻¹ : N₀] when
mN₀m⁻¹ ⊇ N₀. For a parabolic pair P = M ⋉ N of a reductive group over F with residue cardinality
q, define `modulusCharacter`, δ_P := mod_N : P → q^ℤ ⊆ ℤ[1/q]^×, as a character P →* Aˣ for
A ∋ q⁻¹, trivial on N, with IsSmoothCharacter δ_P; prove that it equals |det(Ad(p)|Lie N)|_F and
equals Mathlib's modular character of P (μ(E p⁻¹)/μ(E) for a left Haar measure μ of P). A square
root δ_P^{1/2} : P → Aˣ is fixed by choosing q^{1/2} ∈ Aˣ, which is a choice of coefficients, not
part of the group data ([Cas95] §1.5 and Lemma 1.5.1, p. 16).
[BH06] §3.3, p. 29, and 7.6 Proposition, pp. 54–55, use the inverse module:
δ_B^{BH}(diag(a,d)) = |d/a|_F. Thus our δ_B = (δ_B^{BH})⁻¹; the factor
(δ_B^{BH})^{−1/2} in [BH06] (9.11.1), p. 69, is our δ_B^{1/2}. *Needs:* *a-valued-haar-measure*,
*smooth-character*; ReductiveGroups layer 7.

**Checks.**

- `modulusCharacter_gl2_borel`: for GL_2(ℚ_p) and B upper triangular, δ_B(diag(a,d)) = |a/d|_p.
- `modulusCharacter_trivial_parabolic`: for P = G (N = 1), δ_P = 1.
- `modulusCharacter_eq_modularCharacter_test`: for P = B ⊆ GL_2(ℚ_p), δ_B equals Mathlib's modularCharacter of B (as an ℝ≥0-valued character).
- At diag(ϖ,1), the conjugation modulus is q⁻¹ and the BH module is q; at diag(1,ϖ), these values are q and q⁻¹. These tests use conjugation on the actual upper unipotent subgroup, so interchanging the two characters fails them.

**The Jacquet module** (*jacquet-module*). Let G be locally profinite, P = M ⋉ N closed subgroups
of G (N normal in P) and A commutative, with q^{±1/2} ∈ A for r_P. For a smooth P-representation
(in particular the restriction of a G-representation) V define `SmoothRep.jacquet`, the Jacquet
module V_N = V/V(N), V(N) = span{ρ(n)v − v : n ∈ N, v ∈ V}, which is Mathlib's coinvariants
(Representation.Coinvariants of the restriction to N) with the induced smooth M-action, and
`SmoothRep.jacquetFunctor`, the unnormalised Jacquet functor (−)_N : SmoothRep A G ⥤ SmoothRep A M,
A-linear, right exact and preserving colimits. Prove `SmoothRep.jacquet_mk_surjective`: the
projection V → V_N is an M-equivariant surjection with kernel V(N). Define
`SmoothRep.normalizedJacquet`, r_P(V) := δ_P^{−1/2} ⊗ V_N, given q^{1/2} ∈ Aˣ. Prove that (−)_N is
right exact over any A, commutes with direct sums, colimits and base change, satisfies
transitivity (V_{N₂})_{N₁ ∩ M₂} ≅ V_{N₁} for P₁ ⊆ P₂, and sends finitely generated
G-representations to finitely generated M-representations when G = P K₀ with K₀ compact ([Cas95]
§3.2, pp. 33–34; Theorem 3.3.1, p. 35; §4.4, p. 45). *Needs:* *smooth-rep-category*,
*modulus-character*.

**Checks.**

- `SmoothRep.jacquet_trivial_gl2`: for G = GL_2(ℚ_p), the unnormalised Jacquet module of the trivial representation along N is the trivial character of T.
- `SmoothRep.jacquet_N_trivial`: if N = ⊥ then V_N ≅ V.
- `SmoothRep.jacquet_eq_coinvariants_test`: for the regular representation of a finite discrete group G over A and N = G, the coinvariants are A, with each basis vector mapping to 1.

**Jacquet's lemma and exactness of the Jacquet functor** (*jacquet-lemma*). Let N = ⋃ N_i be the
union of an increasing sequence of compact open subgroups N₀ ⊆ N₁ ⊆ … each with
HasUnitProOrder A N_i (e.g. N the unipotent radical of a parabolic of a p-adic group and p ∈ Aˣ).
Prove that for every smooth N-representation V,
V(N) = ⋃_i ker(e_{N_i}) = {v : ∫_{N_i} ρ(n)v dn = 0 for some i}, and that (−)_N is exact. In
characteristic-p coefficients for a pro-p N the functor is right exact but not left exact; no
characteristic-p exactness is asserted ([Cas95] Proposition 3.2.1, p. 33; Corollary 3.2.2 and
Proposition 3.2.3, p. 34). *Needs:* *jacquet-module*, *averaging-projector*, *invariants-exact*.


`SmoothRep.jacquet_exact` assumes an increasing compact-open exhaustion of N with invertible pro-orders. `SmoothRep.jacquet_ker_averaging` identifies the kernel by eventual vanishing of the averages. `SmoothRep.jacquet_colimits` and `SmoothRep.jacquet_baseChange` give the colimit and coefficient compatibilities.

**Normalised parabolic induction** (*parabolic-induction*). Let G be reductive over F (or
locally profinite with P\G compact), P = M ⋉ N a parabolic subgroup, and A ∋ q^{±1/2} for
normalised induction. Define `SmoothRep.parabolicInd`, normalised parabolic induction
i_P^G σ := Ind_P^G(δ_P^{1/2} ⊗ infl_M^P σ), and `SmoothRep.unnormalizedParabolicInd`,
Ind_P^G ∘ infl, available over every A. Prove `SmoothRep.parabolicInd_exact`: i_P^G is an exact
functor SmoothRep A M ⥤ SmoothRep A G for any A ∋ q^{±1/2} (P\G is compact, so Ind = c-Ind).
Prove `SmoothRep.parabolicInd_trans`, transitivity i_P^G ∘ i_{Q ∩ M}^M ≅ i_Q^G for parabolics
Q ⊆ P; that i_P^G preserves admissibility (preservation of finite generation over ℂ is
supplied by *noetherian*); and that it is
compatible with twisting by unramified characters of M and with base change ([Cas95] §3.1,
p. 32). *Needs:* *smooth-induction*, *modulus-character*, *induction-exactness*,
*induction-in-stages*; ReductiveGroupsPartII RG2.4, ReductiveGroups layer 7.

**Checks.**

- `SmoothRep.parabolicInd_gl2_apply`: for GL_2(ℚ_p), f ∈ i_B(χ₁ ⊗ χ₂) satisfies f((a b; 0 d)g) = χ₁(a)χ₂(d)|a/d|^{1/2} f(g).
- `SmoothRep.parabolicInd_self`: i_G^G σ ≅ σ.
- `SmoothRep.trivial_sub_parabolicInd`: the trivial representation of GL_2(ℚ_p) embeds in i_B(δ_B^{−1/2}).

**First adjointness** (*first-adjointness*). For a parabolic P = M ⋉ N closed in G, a smooth
G-representation V and a smooth M-representation σ over a commutative A, prove
Hom_G(V, Ind_P^G infl σ) ≅ Hom_M(V_N, σ), and in normalised form (q^{±1/2} ∈ A)
Hom_G(V, i_P^G σ) ≅ Hom_M(r_P V, σ): the Jacquet functor r_P is left adjoint to i_P^G.
Consequently i_P^G preserves injectives when r_P is exact, and r_P preserves projectives when
i_P is exact ([Cas95] Theorem 3.2.4, p. 34). *Needs:* *frobenius-reciprocity*,
*jacquet-module*, *parabolic-induction*.


The normalized adjunction is `SmoothRep.firstAdjunction`, on the specified Levi decomposition and mutually inverse modulus twists.

**Contragredients of induced representations** (*induced-contragredient*). Let G be unimodular
locally profinite, H closed, σ smooth on H over a field k in which the compact open subgroups have
invertible pro-order (characteristic 0 suffices; e.g. k = ℂ), and for i_P let k ∋ q^{±1/2}. Prove
(c-Ind_H^G σ)~ ≅ Ind_H^G(σ̃ ⊗ δ_H), δ_H the modulus character of H, via the G-invariant functional
on c-Ind_H^G δ_H given by integration over H\G. For a parabolic P = M ⋉ N (P\G compact) prove
(i_P^G σ)~ ≅ i_P^G σ̃ naturally in σ, so that normalised induction is compatible with smooth
duality, the pairing i_P σ × i_P σ̃ → k being f ⊗ f' ↦ ∮_{P\G} ⟨f, f'⟩ ([Cas95] Theorem 2.4.2 and
Corollary 2.4.3, pp. 27–28; Proposition 3.1.2, p. 32). *Needs:* *compact-induction*,
*parabolic-induction*, *smooth-dual*, *integration*, *modulus-character*.

`RationalParabolic.induction_duality` states the natural compatibility for normalized rational parabolic induction.

`modularCharacterWithValues` is the coefficient-valued subgroup modular character, pinned by the compact-open index ratio and its real comparison with Mathlib’s `modularCharacter`. `SmoothRep.cInd_duality` gives the general closed-subgroup compact-induction duality and the invariant integral pairing, with no admissibility hypothesis.

Checks: `modularCharacterWithValues_compact` compact groups have trivial Haar module; `modularCharacterWithValues_discrete` counting volume is unchanged by conjugation; `modularCharacterWithValues_unequalIndices` unequal indices detect a nontrivial modulus.

`SmoothRep.parabolicInd_baseChange` transports the half modulus along arbitrary coefficient extension. `SmoothRep.parabolicInd_twist` identifies twisting the inducing object by a restricted character with twisting the induced representation.

**The geometric lemma** (*geometric-lemma*). Let G be a connected reductive group over F,
P = MN and Q = LV standard parabolic subgroups, W the Weyl group and W^{M,L} the set of
minimal-length representatives of W_L\W/W_M, and σ a smooth representation of M over ℂ (or over
any A with p ∈ Aˣ and q^{±1/2} ∈ A, where exactness of r is available). Prove that r_Q ∘ i_P (σ)
has a filtration, natural in σ, whose graded pieces are
F_w(σ) = i^L_{L ∩ wPw⁻¹}(w · r^M_{M ∩ w⁻¹Qw}(σ)), w ∈ W^{M,L}, in an order compatible with the
closure order on the double cosets Pw⁻¹Q (open orbits give subfunctors, closed orbits quotients).
More generally, for an l-group G with closed subgroups P = MU, Q = NV satisfying
Bernstein–Zelevinsky's conditions (finitely many Q-orbits on P\G, U and V unions of compact
subgroups, decomposability), r_{V} ∘ i_{U} is glued from functors indexed by the Q-orbits on P\G
([BZ77] Lemma 2.11 and Geometrical Lemma 2.12, p. 448; Theorem 5.2 with conditions 5.1(1)–(4),
pp. 459–460; §6.4, pp. 468–469). *Needs:* *mackey-filtration*, *jacquet-lemma*,
*parabolic-induction*, *l-sheaf-model*; ReductiveGroups layer 7, ReductiveGroupsPartII RG2.4.

`SmoothRep.geometric_lemma` states a natural filtration for rational parabolics. Its graded pieces use the actual intersection parabolics and conjugation maps; the open ordering of the double cosets determines the order of the filtration.


`SmoothRep.geometric_lemma_natural` states compatibility of the graded isomorphisms with every morphism of inducing representations, on quotient generators.

**Jacquet modules of principal series** (*principal-series-jacquet*). Let G be reductive over F
and quasi-split, B = TU a Borel (minimal parabolic) subgroup and χ a smooth character of the
maximal torus T over ℂ. Prove that r_B(i_B χ) has a filtration with graded pieces the Weyl
conjugates wχ (w ∈ W), so its semisimplification is ⊕_{w ∈ W} wχ, and that if χ is regular
(wχ ≠ χ for w ≠ 1) the filtration splits. Conclude that every irreducible subquotient π of i_B χ
has r_B(π) ≠ 0, that its semisimplified Jacquet module is a sub-sum of ⊕ wχ, that π embeds in
i_B(wχ) for some w, and that i_B χ has length ≤ |W| ([BZ77] Corollary 2.13(c), p. 449;
Theorem 2.8, p. 448 (length); [Cas95] Proposition 6.4.1, p. 61 (splitting for regular χ)).
For GL_2(F), [BH06] 9.3 Theorem, pp. 63–64, gives the unnormalised two-step sequence; conversion using δ_B = (δ_B^{BH})⁻¹ gives the normalized Weyl characters. It is a filtration, not an unconditional splitting. *Needs:* *geometric-lemma*, *first-adjointness*, *central-ext-vanishing*.

`SmoothRep.principalSeries_jacquet_filtration` states the Weyl-character filtration, and `SmoothRep.principalSeries_jacquet_regular` splits it under pairwise distinctness of the Weyl characters. `SmoothRep.principalSeries_subquotient` gives the nonzero Jacquet module, its sub-sum of characters and the principal-series embedding; `SmoothRep.principalSeries_length` gives the Weyl-cardinality bound. The signatures use the relative Weyl quotient and explicit representatives, retaining the quasi-split hypothesis.

### SR.2.3 Pairings, canonical lifting, Iwahori invariants and Whittaker functionals

**Jacquet's lemma on invariants and canonical lifting** (*jacquet-invariants*). Let G be
reductive over F, K₀ a compact open subgroup with an Iwahori decomposition K₀ = N̄₀M₀N₀ with
respect to (P, P̄), and V an admissible representation over ℂ (or over a field with invertible
pro-orders; general smooth V is *jacquet-lemma-smooth* of SR.2a). Prove: (1) the projection
V^{K₀} → (V_N)^{M₀} is surjective; (2) for a ∈ M contracting N (a N₀ a⁻¹ ⊆ N₀, a ∈ A⁻), the
convolution operator of 1_{K₀aK₀} on V^{K₀} (vol K₀ = 1), v ↦ Σ_{x ∈ K₀aK₀/K₀} π(x)v, written
[K₀aK₀] below, lifts δ_P(a)⁻¹ π_N(a) on V_N, i.e. the projection intertwines
[K₀aK₀] with δ_P⁻¹(a) a; (3) for a sufficiently contracting, the subspaces
V^{K₀}_a = [K₀aK₀] V^{K₀} are all equal to a space V^{K₀}_{A⁻} on which every [K₀aK₀] (a ∈ A⁻) is
invertible, and the projection V^{K₀}_{A⁻} → (V_N)^{M₀} is an isomorphism (its inverse is
Casselman's canonical lifting); the kernel of the projection is the generalised null space of
[K₀aK₀]. Over a ring R with p ∈ Rˣ the same surjectivity holds for all smooth V once [K₀aK₀] is
invertible in H(G, K₀) ⊗ R (Bushnell–Kutzko) ([Cas95] Theorems 3.3.3–3.3.4, p. 35; Lemma 4.1.1,
Theorem 4.1.2, Propositions 4.1.4 and 4.1.6, Lemma 4.1.7, pp. 38–40). *Needs:* *jacquet-module*,
*jacquet-lemma*, *iwahori-decomposition*, *positive-hecke-homomorphism*, *modulus-character*,
*admissible*.

`SmoothRep.heckeOperator` is the index times e_Kπ(a) on K-invariants; `SmoothRep.jacquetProjection` is the actual coinvariant quotient on those invariants. `RationalParabolic.jacquet_surjective` gives surjectivity, and `RationalParabolic.jacquet_hecke` fixes the δ_P(a)⁻¹ factor for positive central a. `RationalParabolic.stabilization` identifies the stable range with the Jacquet invariants.

Checks of these operators: `SmoothRep.heckeOperator_identity` is the identity, `SmoothRep.heckeOperator_normalizer` has no index factor, and `SmoothRep.heckeOperator_trivial` is multiplication by the right-coset count. `SmoothRep.jacquetProjection_self` loses no vector for P = G; `SmoothRep.jacquetProjection_trivial` preserves a trivial line; `SmoothRep.jacquetProjection_zero` vanishes when the Jacquet module is zero. The normalization agrees with [Cas95], Theorem 4.1.2 and Proposition 4.1.4.

`RationalParabolic.jacquet_cone_intertwining` gives the characteristic-function action as an integral radical index over any coefficient ring. `RationalParabolic.jacquet_cone` supplies a single stable summand for the whole positive central cone over a field with the required invertible pro-orders. `RationalParabolic.jacquet_surjective_ring` gives the coefficient-ring surjectivity statement under invertibility of the strongly positive Hecke element.

**Check (which operator).** Take G = P = GL_1(ℚ_p), so N = 1, K₀ = ℤ_p^×, a = p, and V the
unramified character with χ(p) = 2 over ℚ. The convolution operator of 1_{K₀pK₀} is
multiplication by χ(p) = 2 = δ_P(p)⁻¹χ(p), as (2) asserts. The right action v ∗ [K₀pK₀] of
SR.1.2 is multiplication by χ(p)⁻¹ = 1/2, so (2) fails for it; the Lean example on ℤ in SR.1.2
(the double coset of 1 sends δ_0 to δ_{−1}) is this inversion.

**Casselman's pairing for admissible representations** (*casselman-pairing*). Let V be an
admissible complex representation of a reductive p-adic group G, P = MN a parabolic with opposite
P̄ = MN̄. Prove that there is a unique bilinear pairing ⟨, ⟩_N : V_N × (Ṽ)_{N̄} → ℂ such that for
v ∈ V, ṽ ∈ Ṽ with images u, ũ there is ε > 0 with ⟨π(a)v, ṽ⟩ = ⟨π_N(a)u, ũ⟩_N for all a in the
ε-contracting part A⁻(ε) of the split centre of M. It is M-invariant and nondegenerate, so
(V_N)~ ≅ (Ṽ)_{N̄} and, normalised, r_{P̄}(Ṽ) ≅ (r_P V)~. This is the compatibility of Jacquet
functors with smooth duality on admissible representations; the extension to all smooth
representations is *jacquet-duality* (SR.2a) ([Cas95] Lemmas 4.2.1–4.2.2, Proposition 4.2.3,
Theorem 4.2.4 and Corollary 4.2.5, pp. 40–42). *Needs:* *jacquet-invariants*, *smooth-dual*,
*jacquet-module*, *modulus-character*.

`RationalParabolic.casselman_pairing` states the unique nondegenerate M-invariant pairing, characterized by eventual agreement along powers of every strongly positive central element.

`RationalParabolic.casselman_pairing_cone` gives the uniform epsilon-cone equation for each pair of vectors and identifies the opposite Jacquet module with the smooth dual. The normalized functor comparison is `RationalParabolic.jacquet_duality`.

**Iwahori invariants and the Jacquet module** (*borel-casselman-invariants*). Let G be connected
reductive over F with minimal parabolic P = MN, B an Iwahori subgroup in good position
(B = N̄₀M₀N₀) and V an admissible representation over ℂ (or Ē). Prove that the projection V → V_N
induces an isomorphism V^B ≅ (V_N)^{M₀}, and that for m in the contracting cone M⁻ the convolution
operator of 1_{BmB} on V^B corresponds to meas(BmB)·π_N(m) = δ_P(m)⁻¹ π_N(m). For split G and the
pro-p Iwahori Iw₁ prove the same with (V_N)^{T(O)₁} and the normalised Jacquet module, compatibly
with the convolution action of T(F) through H(G, Iw₁)[1/p] (*pro-iwahori-torus*) ([Cas80] §2,
Propositions 2.3–2.5,
pp. 395–396; [Cas95] Lemma 1.5.1, p. 16 (meas(BmB) = δ_P(m)⁻¹); the pro-p Iwahori form is [BCGP]
as in *pro-iwahori-torus*). *Needs:* *jacquet-invariants*, *iwahori-matsumoto*,
*pro-iwahori-torus*; ReductiveGroupsPartII RG2.3.

`SmoothRep.iwahori_jacquet` states bijectivity of the actual coinvariant projection for the Iwahori subgroup of a supplied base alcove, in good position relative to the specified minimal parabolic.

`SmoothRep.proIwahori_jacquet` states the pro-p Iwahori comparison over ℂ and pins the full normalized torus action by its positive double-coset operators.

`SmoothRep.proIwahori_jacquet_coefficients` states the pro-p comparison over a field of characteristic different from the residue characteristic, with its chosen square root. The double-coset operator is the finite coset sum and is defined over any commutative coefficient ring.

**Generic characters and Whittaker functionals** (*whittaker-functionals*). Let G be quasi-split
over F with Borel B = TU, A a field (ℂ for the classical theory), and ψ : U → Aˣ a smooth
character. Define `IsGenericCharacter`: ψ is generic if it is nontrivial on every simple root
subgroup. Define `SmoothRep.whittakerFunctionals`, the Whittaker functionals Hom_U(V, ψ) on a
smooth G-representation V, and prove `SmoothRep.whittakerFunctionals_equiv_hom_ind`,
Hom_U(V, ψ) ≃ Hom_G(V, Ind_U^G ψ) by Frobenius reciprocity; V is ψ-generic if this is nonzero.
The Gelfand–Graev representation is c-Ind_U^G ψ. Whittaker data (B, ψ) are acted on by T(F) and
conjugation, and genericity depends only on the T(F)-orbit of ψ. Define `SmoothRep.twistedJacquet`,
the twisted Jacquet module V_{U,ψ} := V/span{ρ(u)v − ψ(u)v}, and prove
(V_{U,ψ})* ≃ Hom_U(V, ψ), so that it is dual to Whittaker functionals. For G = GL_2(F), A = ℂ, nontrivial smooth ψ and irreducible smooth V of infinite
dimension, prove `SmoothRep.whittakerMultiplicityOne_gl2`: both V_{U,ψ} and
Hom_U(V,ψ) have dimension one, and there is a unique G-subrepresentation of Ind_U^G ψ
isomorphic to V. For a one-dimensional irreducible V these spaces are zero
([BH06] 36.1 Theorem and Corollary 1, pp. 226–227). For every complex principal
series, including reducible ones, its Whittaker quotient has dimension one
([BH06] §36.2, p. 228). The irreducibility hypothesis on multiplicity one is essential:
the direct sum of two generic irreducibles has a two-dimensional quotient. For general
quasi-split G this target asserts the functional and quotient constructions ([BZ77] §1.8(a)–(b), pp. 444–445 (the twisted Jacquet module
and c-Ind_U^G ψ); the genericity condition is a definition and the description of Hom_U(V, ψ) is
*frobenius-reciprocity*). *Needs:* *smooth-induction*, *compact-induction*,
*frobenius-reciprocity*, *jacquet-module*; ReductiveGroups layer 7.

`IsGenericCharacter` takes the simple-root subgroups inside the radical as explicit data and requires a smooth character nontrivial on each. The algebraic root subgroups are supplied by ReductiveGroupsPartII.

Checks: `IsGenericCharacter_empty` keeps only smoothness for a torus; `IsGenericCharacter_trivial` rejects the trivial character when roots are present; `IsGenericCharacter_rankOne` recovers the smooth nontrivial-character condition.

**Checks.** The GL₂ checks use complex coefficients and a nontrivial smooth ψ on the upper
unipotent subgroup. The algebraic functionals in Suggested.lean are also defined over arbitrary
commutative rings; their vanishing for a nontrivial character needs a domain. For A = ℤ/6,
the trivial rank-one action and the tautological character of Aˣ have a nonzero functional
v ↦ 3v: 5·3 = 3. The Lean example records this failure without the domain hypothesis.

- `SmoothRep.isGeneric_principalSeries_gl2`: for GL_2(ℚ_p) and any smooth χ, i_B χ is ψ-generic.
- `SmoothRep.not_isGeneric_trivial_gl2`: the trivial representation of GL_2(ℚ_p) is not generic.
- `SmoothRep.whittaker_torus`: for G = T (U = ⊥), Hom_U(V, ψ) = Hom_A(V, A).

**Checks (functional carrier).** The Lean examples give the whole dual for U = 1, the zero
space of functionals on the zero representation, and zero functionals for a trivial action with
nontrivial ψ over a domain. The existing Z/6 example shows why the domain assumption matters.

### Examples

GL_2(ℚ_p) with its upper-triangular Borel B carries the examples of the layer: δ_B(diag(a,d)) =
|a/d|_p agrees with Mathlib's modular character; the Jacquet module of the trivial representation
is the trivial character of T and the trivial representation embeds in i_B(δ_B^{−1/2}); f ∈ i_B
(χ₁ ⊗ χ₂) transforms by χ₁(a)χ₂(d)|a/d|^{1/2}; the big-cell sequence of c-Ind has kernel
C_c^∞(ℚ_p, A) twisted by χ and one-dimensional quotient; i_B χ is ψ-generic and the trivial
representation is not. The p-adic line gives c-Ind_{ℤ_p}^{ℚ_p} A ≅ A[ℚ_p ⧸ ℤ_p] and the
separation of Ind from coind and of c-Ind from Ind.

### Dependencies

SR.0, SR.1 and SR.0d (for *central-ext-vanishing* in the principal-series splitting); Mathlib's
coinduction, algebraic induction, modular character and coinvariants; InductionRestriction layers
0 and 3; ProfiniteCohomology layer 0; ReductiveGroups layer 7; ReductiveGroupsPartII RG2.3 and
RG2.4.

## Layer SR.3a: early uniform admissibility

Complex representation theory before the Bernstein centre. Compact representations split off, and
cuspidality is equivalent to compactness of matrix coefficients modulo the centre (Harish-Chandra).
Every irreducible embeds in a parabolic induction of a cuspidal representation (Jacquet), and
irreducibles are admissible.

### SR.3a.1 Compact and cuspidal representations

**Compact representations** (*compact-representations*). Let G be unimodular, locally profinite
and countable at infinity, with complex coefficients. A smooth V is compact if for every v and
compact open K the function g ↦ e_K π(g⁻¹) v has compact support; equivalently all matrix
coefficients ⟨ṽ, π(g⁻¹)v⟩ are compactly supported. Prove: a finitely generated compact
representation is admissible; an irreducible compact W has a nonzero formal degree d(W) and a
corner-central idempotent E_{W,K} ∈ e_K H(G)e_K acting on W as e_K and by 0 on every
irreducible not isomorphic to W; it is not asserted central in all of H(G). Consequently {W} splits SmoothRep ℂ G, every smooth V being
V_W ⊕ V_W^⊥ with V_W a direct sum of copies of W and no subquotient of V_W^⊥ isomorphic to W. In
particular W is projective and injective, and the subcategory of compact representations is
semisimple ([Ber92] Ch. I §5, Definition 12, Theorem 6, Proposition 11, Theorem 7, Propositions
12–13, Theorem 8, pp. 22–26). *Needs:* *hecke-module-equivalence*, *corner-irreducibles*,
*smooth-dual*, *admissible*.


Define `SmoothRep.IsCompact` by compact support of all smooth matrix coefficients. Keep `SmoothRep.IsCompactModuloCenter` separate: it tests compactness of the closure of each coefficient’s support after projection to G/Z(G). The two predicates differ already for a noncompact torus.

Checks:

- `SmoothRep.IsCompact_finite`: finite groups have compactly supported coefficients.
- `SmoothRep.IsCompact_zero`: all coefficients of zero vanish.
- `SmoothRep.IsCompact_noncompact`: a nonzero trivial line is compact exactly when G is compact.
- `SmoothRep.IsCompactModuloCenter_finite`: a finite group has compact central quotient.
- `SmoothRep.IsCompactModuloCenter_zero`: the zero representation has empty coefficient support.
- `SmoothRep.IsCompactModuloCenter_torus`: an abelian group has one-point central quotient.

`SmoothRep.formal_degree` states Schur orthogonality with the chosen normalized Haar measure; `SmoothRep.regular_isotypic` gives the corresponding regular-representation splitting ([Ber92], Ch. I §5.2, pp. 23–25).

`SmoothRep.compact_admissible`, `SmoothRep.compact_corner_projector`, `SmoothRep.compact_splitting`, and `SmoothRep.compact_semisimple` give admissibility, corner-central projectors, the singleton block splitting on all smooth objects, and semisimplicity of compact modules. `SmoothRep.compact_averaging` gives the equivalent support condition after compact-open averaging.

**Cuspidal representations** (*cuspidal-representations*). Let G be the F-points of a connected
reductive group over a nonarchimedean local field F (topology from ReductiveGroupsPartII RG2.0)
and V a smooth complex representation; the definition makes sense for any A. Define
`SmoothRep.IsQuasiCuspidal`: V is quasi-cuspidal if r_P(V) = 0 (equivalently V_N = 0) for every
proper parabolic subgroup P = MN of G defined over F; prove
`SmoothRep.isQuasiCuspidal_iff_maximal`, that it suffices to check maximal standard parabolics.
Define `SmoothRep.IsCuspidal`: V is cuspidal if it is quasi-cuspidal and finitely generated. For
complex coefficients an irreducible cuspidal representation is called supercuspidal. Prove that
quasi-cuspidal representations are closed under subquotients, direct sums and twists by
characters, and `SmoothRep.isQuasiCuspidal_iff_hom`, that V is quasi-cuspidal iff
Hom_G(V, i_P σ) = 0 for all proper P and all smooth σ ([Ber92] Definitions 14 and 16, pp. 34 and 36, and the general-group extension, p. 42).
For admissible V this Hom criterion is [Cas95] Proposition 5.1.1, p. 46; for arbitrary smooth V
it follows directly from first adjointness by testing σ = r_P(V). *Needs:* *jacquet-module*, *jacquet-lemma*, *first-adjointness*,
*parabolic-induction*; ReductiveGroupsPartII RG2.0, ReductiveGroups layer 7.


`SmoothRep.isQuasiCuspidal_iff_maximal` uses a minimal rational parabolic B and the maximal proper rational parabolics containing B.

`SmoothRep.cuspidal_exact` states closure under subobjects, quotients and extensions; `SmoothRep.cuspidal_coproduct` gives arbitrary direct sums; `SmoothRep.cuspidal_dual` gives invariance under the smooth contragredient ([Ber92], Ch. II §3).

**Checks.**

- `SmoothRep.isQuasiCuspidal_torus`: every smooth representation of a torus T(F) is quasi-cuspidal.
- `SmoothRep.not_isQuasiCuspidal_principalSeries`: for GL_2(ℚ_p) and any smooth χ, i_B χ is not quasi-cuspidal.
- `SmoothRep.isCuspidal_depthZero_gl2`: the compact induction from ℚ_p^× GL_2(ℤ_p) of an extension of an inflated irreducible cuspidal representation of GL_2(F_p), with compatible central character, is irreducible and cuspidal. More generally this holds over every nonarchimedean local F, from Z(F) GL_2(O_F), with residue field k_F ([BH06] 11.4 Theorem, pp. 80–81, and 11.5 Lemma, p. 82). The extension to Z(F) is part of the input; induction from GL_2(O_F) alone is not this result.

**Harish-Chandra's compactness theorem** (*harish-chandra-compactness*). For G reductive over F
and a smooth complex representation V, prove that the following are equivalent: (1) V is
quasi-cuspidal; (2) for every v ∈ V and compact open K, g ↦ e_K π(g⁻¹) v has support compact
modulo the centre Z(G); (3) the restriction of V to G° (the subgroup generated by compact
subgroups, open with compact centre) is compact. For admissible V prove that this is equivalent
to all matrix coefficients being compactly supported modulo Z(G), and to the same property for Ṽ.
Conclude that every irreducible cuspidal representation is admissible ([Ber92] Ch. II §1.3,
Theorem 11 and Harish-Chandra's Theorem, pp. 34–36; Corollary, pp. 36–37; Ch. II §2.2, p. 42).
*Needs:* *cuspidal-representations*, *compact-representations*, *jacquet-invariants*,
*positive-hecke-homomorphism*; ReductiveGroupsPartII RG2.4, ReductiveGroupsPartII RG2.3.


`SmoothRep.isCompactModuloCenter_iff_isQuasiCuspidal` states the matrix-coefficient comparison for an admissible representation of the rational-point group; the averaging formulation above retains its arbitrary-smooth scope.

`SmoothRep.cuspidal_compactRestriction` states the equivalence with compactness after restriction to G°, without admissibility, and `SmoothRep.cuspidal_dual` states the smooth-dual equivalence ([Ber92], Ch. II §3).

`SmoothRep.cuspidal_averaging` states the compact-modulo-center support criterion after every compact-open average, for arbitrary smooth V.

**Jacquet's subrepresentation theorem** (*jacquet-subrepresentation*). For G reductive over F
and complex coefficients, prove that every irreducible smooth representation V of G embeds into
i_P σ for some parabolic P = MN and some irreducible cuspidal representation σ of M. One may take
M minimal among standard Levi subgroups with r_P V ≠ 0, and σ any irreducible quotient of r_P V
([Ber92] Ch. II §1.3, Lemma 17, p. 37). *Needs:* *cuspidal-representations*,
*first-adjointness*, *jacquet-module*.


`SmoothRep.jacquet_subrepresentation` supplies a cuspidal datum and an injective equivariant map into its normalized induction.

**Irreducible representations are admissible** (*admissibility-of-irreducibles*). For G
reductive over F, complex coefficients and V irreducible smooth, prove that V is admissible:
dim V^K < ∞ for every compact open K. Conclude (Schur) that End_G(V) = ℂ, that V has a central
character ω_V : Z(G) → ℂ^×, that Ṽ is irreducible and V ≅ Ṽ̃, and that V^K is a simple
H(G, K; ℂ)-module or 0. Classification of irreducibles is not used. Schur's lemma End_G(V) = ℂ
also holds for any irreducible smooth V of a locally profinite group countable at infinity by the
countable-dimension argument ([Ber92] Ch. II §1.3, Theorem 12, p. 37; Theorem 15, p. 43; Ch. I
§4.2, Schur's Lemma and Lemma 8, pp. 19–20). *Needs:* *jacquet-subrepresentation*,
*harish-chandra-compactness*, *parabolic-induction*, *admissible*, *smooth-dual*,
*corner-irreducibles*.


On the rational-point carrier, `RationalParabolic.irreducible_admissible`, `RationalParabolic.irreducible_end` and `RationalParabolic.irreducible_centralCharacter` give admissibility, scalar endomorphisms and the central character.

`SmoothRep.schur_countable` gives the scalar endomorphism algebra of an irreducible smooth complex representation when all compact-open coset spaces are countable; this assertion does not assume admissibility ([BH06], §2.6, p. 20).

**Compact-induction irreducibility criterion** (*compact-induction-criterion*). Let G be a
unimodular locally profinite group with G/U countable for every compact open U, and suppose
all its irreducible smooth complex representations are admissible. Let Z be its centre,
K an open subgroup containing Z with K/Z compact, and ρ an irreducible smooth complex
representation of K.
If the elements intertwining ρ are exactly K, prove that c-Ind_K^G ρ is irreducible and
has matrix coefficients compact modulo Z. Conversely, an intertwiner outside K gives a
nonscalar endomorphism, so compact induction is not irreducible. This is [BH06] 11.4 Theorem
and Remarks 1–2, pp. 80–81, with the countability hypothesis from §2.6, p. 20. For GL₂(F)
the conclusion is cuspidality in the Jacquet-module sense. The depth-zero example above
is a specialization using 11.5 Lemma, p. 82. *Needs:* *compact-induction*,
*frobenius-reciprocity*, *smooth-dual*, *admissibility-of-irreducibles*.

`SmoothRep.intertwiningSet` uses nonzero equivariant maps on K ∩ g⁻¹Kg. `SmoothRep.compact_induction_criterion` gives the irreducibility equivalence and compactness modulo the centre, with unimodularity, quotient countability and admissibility of irreducibles explicit.

Checks: `SmoothRep.intertwiningSet_zero` is empty; `SmoothRep.intertwiningSet_identity` contains K for every nonzero representation; `SmoothRep.intertwiningSet_trivial` is all of G for the trivial line. These distinguish the hypotheses of [BH06], 11.4.

**Checks.** For G = F× and K = G, a smooth character induces to itself. For GL₂(F),
an extended inflated cuspidal of GL₂(k_F) satisfies the intertwining condition and yields
the depth-zero example. If K = Z GL₂(O_F) and ρ is trivial, diag(ϖ,1) intertwines ρ
outside K, so its compact induction fails the criterion and is reducible.

### SR.3a.2 Uniform admissibility

**The Hecke algebra decomposition** (*hecke-algebra-decomposition*). Let G be reductive over F,
K₀ a special maximal compact subgroup and K ⊆ K₀ a congruence subgroup normal in K₀ with an
Iwahori decomposition with respect to every standard parabolic (Bruhat; a congruence subgroup in
good position, ReductiveGroupsPartII RG2.3). Let Λ = Z(F)/Z(F)₀ for the minimal Levi Z (the
centraliser of a maximal split torus) and Λ⁺ its dominant cone, so that G = ⊔_{λ ∈ Λ⁺} K₀λK₀
(Cartan decomposition, RG2.4). Prove that H(G, K; ℂ) = H₀ · D · C · H₀ where H₀ = H(K₀, K) and D
are finite-dimensional subspaces spanned by double-coset elements. Here one must first take
Λ_Z, the finite-index image of the centre Z(Z)(F) of the minimal Levi Z in Λ, and choose a
group lift Λ_Z → Z(Z)(F); lifts of the remaining finitely many lattice cosets are only setwise.
Then C = span{[KλK] : λ ∈ Λ_Z ∩ Λ⁺} is a commutative finitely generated subalgebra, and D
accounts for the finitely many remaining cone representatives. Commutativity is not claimed
for the span of arbitrary lifts of all of Λ⁺. In particular H(G, K) is a finite
sum Σ u_i C v_j ([Ber92] Ch. II §1.1, Theorem 9, p. 29, and its proof, pp. 29–30; Ch. II §2.1,
Theorem 13, p. 42, with the lattice and lift construction on pp. 40–41). *Needs:* *positive-hecke-homomorphism*, *iwahori-decomposition*,
*permutation-hecke-algebra*; ReductiveGroupsPartII RG2.4, ReductiveGroupsPartII RG2.3.

`HeckeAlgebraLevel.finite_decomposition` gives the finite-index central image, its homomorphic lift, the separate finite set of other lattice representatives, the commutative finite-type subalgebra and the H₀ D C H₀ spanning identity. The special maximal compact subgroup is the pinned fixer of a special point in the enlarged building; normality and all standard-parabolic Iwahori decompositions of K are explicit.

**Check.** For a split G the minimal Levi is a torus, so Λ_Z = Λ and the familiar
full-lattice commutative subalgebra is recovered. For a nonsplit minimal Levi the central lift
and the finite extra factor D must remain in the statement.

**Dimension bound for commutative subalgebras** (*commutative-subalgebra-bound*). Let V be an
m-dimensional vector space, m ≥ 1, over ℂ and R ⊆ End_ℂ(V) a commutative
unital ℂ-subalgebra generated by l ≥ 1 elements. Prove dim_ℂ R ≤ m^{2 − 2^{1−l}}
(I. N. Bernstein and A. V. Zelevinsky [BZ76] Ch. II §4, Lemma 4.10, p. 39,
and proof 4.12, p. 40). The exponent applies to every l ≥ 1, including l ≥ 3.
The Lean target is `commutativeSubalgebraBound`. *Needs:* the library vocabulary of this layer.

**Check.** At l = 3 the exponent is 7/4; at l = 1 it is 1.

**Uniform admissibility** (*uniform-admissibility*). Let G be reductive over F, K a compact open
subgroup (reduce to a congruence subgroup in good position, since V^K ⊆ V^{K'} for K' ⊆ K), and
the coefficients complex. Prove that there is a constant c(G, K) such that dim_ℂ V^K ≤ c(G, K) for
every irreducible smooth complex representation V; equivalently every simple H(G, K; ℂ)-module
has dimension ≤ c(G, K). One can take c = d^{2^l} where H(G, K) = Σ_{i,j ≤ d} u_i C v_j with C
commutative generated by l elements. The bound is uniform in V, not merely finiteness for each V.
It is not asserted for characteristic-p coefficients or for integral coefficient rings ([Ber92]
Ch. II §1.4, Uniform Admissibility Theorem and its proof, pp. 37–38; Ch. II §2.2, p. 43).
*Needs:* *admissibility-of-irreducibles*, *hecke-algebra-decomposition*,
*commutative-subalgebra-bound*, *corner-irreducibles*.


`RationalParabolic.uniform_admissibility` gives a natural-number bound for the dimensions at each compact open subgroup.

**Finitely many cuspidal components at fixed level** (*finitely-many-cuspidals*). Let G be
reductive over F, K a compact open subgroup of G, and the coefficients complex. Prove that there
is a compact subset Ω(G, K) ⊆ G° such that every K-bi-invariant matrix coefficient
g ↦ e_K π(g⁻¹)ξ of every irreducible cuspidal representation of G° is supported in Ω(G, K).
Conclude that only finitely many isomorphism classes of irreducible cuspidal representations of
G° have nonzero K-fixed vectors, and that only finitely many cuspidal components of G
(unramified-twist classes of irreducible cuspidals) have K-fixed vectors ([Ber92] Ch. II §1.4,
Proposition 21, Corollary and Lemma 18, pp. 38–39; Ch. II §2.2, Theorem 16 and Corollary, p. 43;
Ch. II §3.2, proof of Theorem 17, p. 45 (finitely many cuspidal components)). *Needs:*
*uniform-admissibility*, *harish-chandra-compactness*, *compact-representations*.

### Examples

The torus T(F), all of whose smooth representations are quasi-cuspidal; the principal series
i_B χ of GL_2(ℚ_p), which is not; and the depth-zero supercuspidal of GL_2(ℚ_p) compactly induced
from ℚ_p^× GL_2(ℤ_p), which is irreducible and cuspidal.

### Dependencies

SR.0, SR.1 and SR.2; Mathlib's `Module.End.instDivisionRing`,
`Transcendental.linearIndependent_sub_inv` and `Module.Finite.toModuleEnd_moduleEnd_surjective`;
ReductiveGroups layer 7; ReductiveGroupsPartII RG2.0, RG2.3 and RG2.4.

## Layer SR.3: admissible complex representations

Admissible complex representations of a reductive p-adic group. The layer covers unramified
characters, cuspidal support, finite length of parabolic inductions, generic irreducibility,
Bernstein components and the splitting of cuspidal components. The Bernstein decomposition
follows, then noetherianity, the centre as regular functions on the Bernstein variety, finiteness
of Hecke algebras over the centre, the universal unramified twist and the compatibilities of the
centre.

### SR.3.1 Cuspidal support and finite length

`SmoothRep.cuspidalComponents_finite` states finiteness modulo unramified twist, and `SmoothRep.cuspidalRestriction_finite` states the finite fixed-level list on G°.

**Unramified characters and the group G°** (*unramified-characters*). For G reductive over F
(ReductiveGroupsPartII RG2.0–RG2.1) and complex coefficients, define
`SmoothRep.compactlyGeneratedSubgroup`, the subgroup G° generated by all compact subgroups, as an
open normal subgroup; prove that G/G° = Λ(G) is a lattice of rank equal to the split rank of the
centre, and `SmoothRep.finiteIndex_center_mul`, that Z(G)G° has finite index in G. Define
`SmoothRep.unramifiedCharacters`, the unramified characters Ψ(G) = Hom(G/G°, ℂ^×), the smooth
characters trivial on G°, a complex algebraic torus Ψ(G) = Hom(Λ(G), ℂ^×) with coordinate ring
ℂ[Λ(G)] = ℂ[G/G°]; prove `SmoothRep.unramifiedCharacters_isSmoothCharacter`, that every element
of Ψ(G) is a smooth character. Ψ(G) acts on irreducible representations by twisting. For a Levi M
this gives Ψ(M), which acts on cuspidal representations of M ([Ber92] Ch. II §2.1,
Proposition 22, p. 39; Ch. II §3, Definition 18, p. 43). *Needs:* *smooth-character*;
ReductiveGroupsPartII RG2.0, ReductiveGroupsPartII RG2.1.

`SmoothRep.unramified_lattice` gives the lattice rank as the split rank minus the rank of the relative roots. `SmoothRep.unramified_coordinateRing` identifies its Laurent coordinate algebra, and `SmoothRep.unramified_points` pins its points over every complex algebra by evaluation of group-algebra basis elements.

**Checks.**

- `SmoothRep.unramifiedCharacters_gl1`: for G = ℚ_p^×, Ψ(G) ≅ ℂ^× via χ ↦ χ(p).
- `SmoothRep.unramifiedCharacters_sl2`: for SL_2(ℚ_p), G° = G and Ψ(G) is trivial.
- `SmoothRep.not_unramified_ramified`: a smooth character of ℚ_p^× nontrivial on ℤ_p^× is not unramified.

Ordinary unramified characters always use G°. For a minimal Levi M and its connected
parahoric M₁, define `SmoothRep.weaklyUnramifiedCharacters M₁` as smooth characters
trivial on M₁. Here M₁ = ker κ_M, whereas M°/M₁ is the torsion subgroup of
Ω_M = M(F)/M₁. Thus ordinary characters form the identity component of Hom(Ω_M, ℂˣ).
For split G the minimal Levi is a split torus and M₁ = M°; only in that case do the
two notions coincide automatically. These identifications are owned by
*iwahori-components* below ([Ros14] §§2.5–2.9, §3.2).

Checks: `SmoothRep.weaklyUnramifiedCharacters_full` gives only the trivial character
for the full subgroup; `SmoothRep.weaklyUnramifiedCharacters_trivial` gives all smooth
characters for the trivial subgroup; `SmoothRep.weaklyUnramifiedCharacters_ramifiedNormOne`
uses RG2's `NormTorus.quadraticData`, `NormTorus.pointsEquiv` and
`LevelSubgroups.normOneTorus_parahoric_index` (the example *torus-parahoric-example*):
for a ramified quadratic extension of odd residue characteristic, T(F) is compact,
T° = T(F), and the connected parahoric I has index two. There is exactly one ordinary
unramified character and exactly two weakly unramified characters. The latter both
have one-dimensional I-invariants and generate their character lines. The nontrivial
one has no T(F)-fixed vector. The two lines lie in different ordinary Bernstein
components, and H(T(F), I; ℂ) = ℂ[ℤ/2]. I remains the connected parahoric throughout.

**Finite length** (*finite-length*). For G reductive over F and complex coefficients prove: (1)
if σ is an admissible representation of finite length of a Levi M, then i_P σ has finite length,
and for σ irreducible cuspidal its length is at most |W(M)|; (2) every finitely generated
admissible complex representation of G has finite length (Howe) ([Cas95] Corollaries 6.3.7–6.3.8,
pp. 59–60; Theorem 6.3.10, pp. 60–61; Corollary 7.2.3, p. 68). *Needs:* *geometric-lemma*,
*compact-representations*, *harish-chandra-compactness*, *jacquet-module*,
*parabolic-induction*.


`RationalParabolic.finiteLength_of_fg_admissible` and `RationalParabolic.induction_finiteLength` state the finite-length assertions on rational-point groups.

`RationalParabolic.induction_length` gives the relative-normalizer Weyl bound for irreducible cuspidal induction. Its algebraic Levi comparison preserves the inclusion on rational points.

**Cuspidal support** (*cuspidal-support*). For G reductive over F and complex coefficients,
define `SmoothRep.CuspidalDatum`: a cuspidal datum of G is a pair (M, σ) of a Levi subgroup M (of
a parabolic of G) and an irreducible cuspidal representation σ of M, up to G-conjugacy. Every
irreducible V is a subquotient of i_P σ for some cuspidal datum (M, σ)
(*jacquet-subrepresentation*); prove `SmoothRep.cuspidalSupport_unique`, that the datum is unique
up to G-conjugacy, and define `SmoothRep.cuspidalSupport`, scs : Irr G → CuspidalDatum G, the
cuspidal support, with `SmoothRep.cuspidalSupport_spec`: V is a subquotient of i_P σ iff
scs(V) = [M, σ]. Prove that each cuspidal datum is the support of finitely many irreducibles,
namely the irreducible subquotients of i_P σ, independent of the parabolic P with Levi M, and
that every irreducible subquotient of i_P σ embeds into i_P(wσ) for some w ∈ W(M) = N_G(M)/M
([Ber92] Ch. III §2.1, Definition 22, Theorem 18, Lemma 25 and Corollary, Proposition 30,
pp. 55–56; [Cas95] Theorem 6.3.11, p. 61 (independence of the parabolic), and Corollary 7.2.2, p. 68 (embedding)). *Needs:*
*jacquet-subrepresentation*, *cuspidal-representations*, *geometric-lemma*, *finite-length*.

`SmoothRep.cuspidalSupport_finite`, `SmoothRep.cuspidalSupport_parabolic`, and `SmoothRep.cuspidalSupport_embedding` state finiteness over an exact datum, independence of the parabolic, and embedding after normalizer conjugation, respectively.

**Checks.**

- `SmoothRep.cuspidalSupport_trivial_gl2`: scs(1_{GL_2(ℚ_p)}) = [T, |·|^{−1/2} ⊗ |·|^{1/2}].
- `SmoothRep.cuspidalSupport_supercuspidal`: scs(V) = [G, V] for V irreducible cuspidal.
- `SmoothRep.cuspidalSupport_steinberg_gl2`: the Steinberg representation of GL_2(ℚ_p) has the same cuspidal support as the trivial representation.


`SmoothRep.CuspidalPair` records the Levi and an irreducible representation compact modulo its centre. `SmoothRep.CuspidalDatum` is its conjugacy quotient. `SmoothRep.cuspidalSupports` is the set obtained from subquotients of normalized induction; uniqueness on rational-point groups defines `SmoothRep.cuspidalSupport`. `PadicGL2.standardParabolics` and `PadicGL2.characterDatum` specify the rank-two computations.

Checks:

- `SmoothRep.CuspidalDatum_empty`: there are no data without Levi subgroups.
- `SmoothRep.CuspidalDatum_conjugacy`: changing the conjugate representative changes no datum.

**Generic irreducibility of induced representations** (*generic-irreducibility*). Let G be
reductive over F with complex coefficients, σ an irreducible cuspidal representation of a Levi M
and P = MN. Prove that for ψ in a nonempty Zariski-open subset of the torus Ψ(M), i_P(ψσ) is
irreducible. In particular every element z of the centre acts on i_P(ψσ) by a scalar z(ψσ), and
ψ ↦ z(ψσ) is a regular function on that open subset; it extends to a regular function on Ψ(M) by
*bernstein-centre-blocks* ([Ber92] Ch. III §3.3, Lemma 35, p. 69; Ch. IV §1.2, Theorem 27, p. 86;
Ch. III §4.2, Remark, pp. 74–75 (the regular function z(ψσ))). *Needs:*
*unramified-characters*, *parabolic-induction*, *admissibility-of-irreducibles*,
*finite-length*.

`SmoothRep.generic_irreducibility` specifies a nonempty principal open by a nonzero element of ℂ[M/M°]. It states irreducibility on that open and represents each central scalar action by an element of the same coordinate ring.

### SR.3.2 The Bernstein decomposition and centre

**Inertial classes and Bernstein components** (*bernstein-components*). For G reductive over F
and complex coefficients, two cuspidal data (M, σ), (M', σ') are inertially equivalent if there
are g ∈ G and ψ ∈ Ψ(M') with gMg⁻¹ = M' and gσ ≅ ψσ'. Define `SmoothRep.InertialClass`, the set
B(G) of inertial classes s = [M, σ]_G, cuspidal data modulo G-conjugacy and unramified twist, and
`SmoothRep.inertialSupport` : Irr G → B(G), the class of the cuspidal support of an irreducible V.
For s = [M, σ] define `SmoothRep.cuspidalComponent`, the cuspidal component
D = D_s = Ψ(M)·σ ⊆ Irr_cusp(M), with its structure of a quotient of the torus Ψ(M) by the finite
stabiliser of σ, and `SmoothRep.bernsteinWeylGroup`, W_s = W(M, D) = {w ∈ N_G(M)/M : wD = D},
finite. The variety of cuspidal data is Ω(G) = ⊔_s D_s/W_s. The full subcategory Rep_s(G)
consists of smooth V all of whose irreducible subquotients have inertial support s ([Ber92]
Ch. II §3, Lemma 21 and Definition 19, p. 44; Ch. III §2.1, Definition 22, Proposition 31,
Lemma 27, pp. 55–57). *Needs:* *cuspidal-support*, *unramified-characters*.

`SmoothRep.unramifiedOrbitRing` is the self-twist-invariant subalgebra of the lattice group algebra. `SmoothRep.cuspidalComponent_geometry` states finiteness of the self-twist group, the torus coordinate algebra, and the finite étale covering, identifying geometric points by character evaluation. `SmoothRep.componentRegularFunctions_geometry` describes the subsequent Weyl quotient and its complex points.

Checks: `SmoothRep.unramifiedOrbitRing_line` is the whole character torus algebra for a character; `SmoothRep.unramifiedOrbitRing_monomial` admits precisely the monomials annihilating every self twist; `SmoothRep.unramifiedOrbitRing_zero` leaves only scalars for the zero representation on an abelian lattice.

**Checks.**

- `SmoothRep.inertialClass_gl1`: for ℚ_p^×, inertial classes correspond to characters of ℤ_p^×.
- `SmoothRep.inertialSupport_trivial_steinberg`: the trivial and Steinberg representations of GL_2(ℚ_p) have the same inertial support [T, 1].
- `SmoothRep.bernsteinWeylGroup_supercuspidal`: for s = [G, σ], W_s is trivial.


`SmoothRep.InertialClass` quotients the same pairs by conjugacy and unramified twist. `SmoothRep.inertialNormalizer` stabilizes the unramified orbit, and `SmoothRep.bernsteinWeylGroup` is its quotient by the Levi. `SmoothRep.bernsteinWeylGroup_finite` states finiteness on rational-point groups.

Checks:

- `SmoothRep.InertialClass_conjugacy`: conjugate data have the same inertial class.
- `SmoothRep.bernsteinWeylGroup_unramified`: the unramified GL₂ torus datum has the two-element Weyl group.
- `SmoothRep.InertialClass_ramified`: different compact-unit values cannot have the same inertial class.
- `SmoothRep.bernsteinWeylGroup_torus`: a torus character has trivial Bernstein Weyl group.

**Splitting off cuspidal components** (*cuspidal-splitting*). For G reductive over F and complex
coefficients, prove that each cuspidal component D of G (an unramified-twist class of
irreducible cuspidal representations) splits SmoothRep ℂ G, and so does the set of all
irreducible cuspidals: SmoothRep ℂ G = M_cusp × M_ind with M_cusp = ∏_D M(D). For D = Ψ(G)ρ prove
that Π(D) = c-Ind_{G°}^G(ρ|_{G°}) ≅ ℂ[Λ(G)] ⊗ ρ is a finitely generated projective generator of
M(D), and that M(D) is equivalent to left modules over End(Π(D))ᵒᵖ, the crossed product of the
coordinate ring B = ℂ[Λ(G)] with the finite self-twist group of ρ ([Ber92] Ch. II §3, Proposition 26, Theorem 17 and
Corollary, Proposition 27, Lemma 22, Proposition 28, pp. 44–49). *Needs:*
*finitely-many-cuspidals*, *compact-representations*, *harish-chandra-compactness*,
*unramified-characters*, *compact-induction*, *frobenius-reciprocity*,
*locally-unital-algebra*.

`SmoothRep.cuspidal_splitting` and `SmoothRep.cuspidal_component_splitting` give the central projections. `SmoothRep.cuspidal_generator` gives finite generation, projectivity, the generator property and the module-category equivalence. `SmoothRep.cuspidal_generator_tensor` specifies the tensor-model G-action. `SmoothRep.cuspidal_endomorphisms` specifies a B-basis νχ of End(Π), with ν₁ = 1.
Set `SmoothRep.parameterTranslation χ` = aχ, where aχ(f)(t) = f(χt), so
 aχ([γ]) = χ(γ)[γ]. In End(Π), fνχ = νχ aχ(f), equivalently
νχ f = aχ⁻¹(f)νχ, and νχ νψ = cEnd(χ,ψ)νχψ. In the chosen opposite algebra put
Jχ = op(νχ). Then Jχ f = aχ(f)Jχ and Jχ Jψ = c(χ,ψ)Jχψ with
c(χ,ψ) = cEnd(ψ,χ). Both cocycles are normalized scalar 2-cocycles; the reversal
of arguments comes from opposite multiplication. In particular B need not be central
([Ber92], Proposition 28, printed p. 49).

Checks: `SmoothRep.parameterTranslation_one` is the identity;
`SmoothRep.parameterTranslation_inverse` composes with the inverse translation to the identity;
`SmoothRep.parameterTranslation_nontrivialSelfTwist` uses the actual two-character
representation 1 ⊕ ε of the discrete group ℤ, ε(n) = (−1)ⁿ. Its self-twist group is
{1, ε}; twisting by ε exchanges the two summands, and translation by ε sends the Laurent coordinate X to −X.
On B = ℂ[X, X⁻¹], multiplication by X and J = aε satisfy J² = 1 and
J X = −X J ≠ X J. This tests a nontrivial finite self-twist action, including the
opposite-algebra sign, without claiming that a reducible representation is cuspidal. The product over cuspidal components is the restriction of `SmoothRep.bernstein_decomposition` ([Ber92], Ch. II §3, pp. 44–49; Ch. III §2.2, pp. 58–59).

`SmoothRep.unramifiedStabilizer` is the subgroup of unramified characters whose twists are isomorphic to the given representation. Checks: `SmoothRep.unramifiedStabilizer_zero` is the whole character group; `SmoothRep.unramifiedStabilizer_line` is trivial; `SmoothRep.unramifiedStabilizer_determinant` forces a self-twist of a finite-dimensional representation to have order dividing its dimension.

**The Bernstein decomposition** (*bernstein-decomposition*). For G reductive over F and complex
coefficients, prove that SmoothRep ℂ G is the product of the full subcategories Rep_s(G) over the
inertial classes s ∈ B(G): every smooth V decomposes uniquely as V = ⊕_s V_s with V_s ∈ Rep_s(G),
naturally in V, and Hom between different blocks vanishes. The cuspidal blocks are those of
*cuspidal-splitting* ([Ber92] Ch. III §2.2, Decomposition Theorem, Lemma 28 and Lemma 29,
pp. 58–59). *Needs:* *bernstein-components*, *cuspidal-splitting*, *geometric-lemma*,
*first-adjointness*, *induced-invariants*, *finitely-many-cuspidals*.

`SmoothRep.BernsteinBlock` is the full subcategory specified by the inertial supports of all irreducible subquotients. `SmoothRep.bernstein_subrepresentations` states the unique internal direct-sum decomposition into these blocks. `SmoothRep.bernstein_decomposition` states the product equivalence, and `SmoothRep.bernstein_blocks_orthogonal` states vanishing of morphisms between different blocks.

Checks: `SmoothRep.BernsteinBlock_zero` puts zero in every block; `SmoothRep.BernsteinBlock_simple` identifies the block of an irreducible; `SmoothRep.BernsteinBlock_disjoint` forces an object common to distinct blocks to be zero ([Ber92], Ch. III §2.2).

**Noetherianity** (*noetherian*). For G reductive over F and complex coefficients, prove that
SmoothRep ℂ G is locally noetherian: every subrepresentation of a finitely generated smooth
representation is finitely generated. Prove that the functors i_P and r_P preserve finite
generation ([Ber92] Ch. III §2.2, Lemma 29, Propositions 32–33, pp. 59–61). *Needs:*
*cuspidal-splitting*, *bernstein-decomposition*, *jacquet-module*, *parabolic-induction*.


`RationalParabolic.fg_noetherian`, `RationalParabolic.induction_fg` and `RationalParabolic.jacquet_fg` specify the finite-generation assertions.

**The Bernstein centre** (*bernstein-centre-blocks*). For G reductive over F and complex
coefficients, prove that the centre Z(G) = CatCenter(SmoothRep ℂ G) of SR.0 is the product over
inertial classes of the centres Z_s of the blocks, and that Z_s ≅ ℂ[D_s]^{W_s}, the ring of
W_s-invariant regular functions on the cuspidal component D_s; hence Z(G) is the ring of regular
functions on Ω(G) = ⊔_s D_s/W_s. An element z acts on every i_P(π), π ∈ D_s, by the scalar z(π),
and on every irreducible V by z(scs V). The action on every object is the SR.0 action; on the
generators ℂ[G/K] it is the SR.1 description Z(G) ≅ lim_K Z(H(G, K)) ([BD84] Proposition 1.15,
p. 11; Proposition 2.11, p. 21; Théorème 2.13, p. 22). *Needs:* *smooth-centre*,
*bernstein-decomposition*, *generic-irreducibility*, *bernstein-components*,
*bernstein-centre-corners*.

`SmoothCentre.bernstein_product` states the product of the categorical block centres.

`SmoothRep.componentRegularFunctions` is the subalgebra of the unramified character algebra whose evaluations agree whenever the twisted cuspidal pairs are conjugate. Thus it includes both self-twist and Weyl-stabilizer descent. `SmoothCentre.bernstein_coordinates` identifies the categorical block center with this algebra and pins its scalar action on every irreducible induced subquotient.

Checks: `SmoothRep.componentRegularFunctions_scalar` includes all constants; `SmoothRep.componentRegularFunctions_selfTwist` excludes monomials detected by a self twist; `SmoothRep.componentRegularFunctions_line` retains the full character algebra for a line on a commutative group.

**Finiteness of Hecke algebras over the centre** (*finite-type-corners*). For G reductive over F,
complex coefficients and every compact open K, prove: (1) only finitely many inertial classes s
have blocks with nonzero K-invariants; (2) every finitely generated smooth representation is
Z(G)-admissible; (3) H(G, K; ℂ) is a finitely generated module over the image of Z(G), so it is
finite over its own centre, which is a finitely generated ℂ-algebra; (4) for each s, the corner
e_K H e_K restricted to Rep_s(G) is a finite module over Z_s ([BD84] §3.2, p. 25;
Proposition 3.3, p. 26; Corollaire 3.4, p. 27). *Needs:* *bernstein-centre-blocks*,
*noetherian*, *induced-invariants*, *finitely-many-cuspidals*.

`SmoothRep.bernstein_finite_level` gives the finite set of blocks seen at a compact open level. `SmoothRep.fg_zFinite` states central admissibility for finitely generated representations. `HeckeAlgebraLevel.finite_over_center` states finiteness of the corner over its centre and finite type of that centre.

`HeckeAlgebraLevel.block_finite` states finiteness of the endomorphism corner of the block part of ℂ[G/U] over the corresponding categorical block center, with the action given by composition.

**The universal unramified twist** (*universal-unramified-twist*). Let G be reductive over F
with complex coefficients (any A ∋ q^{±1/2} for the construction), P = MN a parabolic and σ a
smooth representation of M; let ℂ[Λ(M)] = ℂ[M/M°] carry the tautological unramified character
χ_univ : M → ℂ[Λ(M)]^×. Define `SmoothRep.universalUnramifiedTwist`, the universal twist
i_P(σ ⊗ χ_univ), a smooth (G, ℂ[Λ(M)])-module, and prove
`SmoothRep.universalUnramifiedTwist_specialize`: for every ψ ∈ Ψ(M), specialisation at ψ gives
i_P(σ ⊗ χ_univ) ⊗_{ℂ[Λ(M)], ψ} ℂ ≅ i_P(σ ⊗ ψ). Prove
`SmoothRep.universalUnramifiedTwist_invariants_projective`: if σ is admissible, its K-invariants
are finitely generated projective ℂ[Λ(M)]-modules (free for the unramified principal series),
compatibly with specialisation. For σ cuspidal and P = G this is Π(D) of *cuspidal-splitting*;
for the unramified principal series prove `SmoothRep.universalUnramifiedTwist_principal`, that
for split G, M = T and σ = 1 it is i_B(χ_univ) ≅ c-Ind_{T(O)N}^G 1 after
transporting the coefficient action by [λ] ↦ [−λ]. HKP's untransported coefficient action
gives i_B(χ_univ⁻¹), so this involution is essential for a coefficient-linear comparison (T. Haines, R. Kottwitz and A. Prasad [HKP] §1.4 and §1.5,
(1.5.1)–(1.5.2), p. 2; specialization at χ gives i_B(χ⁻¹), p. 3;
Lemma 1.6.1, p. 3; [Ber92] Ch. III §3.3, pp. 67–69 (cuspidal σ); the K-invariants are free by
*induced-invariants*). *Needs:* *unramified-characters*, *parabolic-induction*,
*induced-invariants*, *coefficient-change*.

**Checks.**

- `SmoothRep.universalUnramifiedTwist_gl1`: for G = M = ℚ_p^× and σ = 1, the universal twist is ℂ[t^{±1}] with p acting by t.
- `SmoothRep.universalUnramifiedTwist_hkpInverse`: in rank one, the untransported HKP
  model has ϖ acting by t⁻¹, while our tautological twist has ϖ acting by t; the coefficient
  involution t ↦ t⁻¹ identifies them. `hkpInverseCoefficient` distinguishes the two
  Laurent monomials in Lean.
- `SmoothRep.universalUnramifiedTwist_trivial_levi`: for M = M° (for instance M = G = SL_2(ℚ_p), where Λ(M) = 0), ℂ[Λ(M)] = ℂ and the universal twist is i_P σ itself.
- `SmoothRep.universalUnramifiedTwist_iwahori_free`: for split G, (i_B χ_univ)^I is free of rank one over H(G, I) (Haines–Kottwitz–Prasad Lemma 1.6.1).

**Compatibilities of the Bernstein centre** (*centre-compatibilities*). For G, G₁, G₂ reductive
over F and complex coefficients prove: (1) inner automorphisms act trivially on Z(G): for g ∈ G
the autoequivalence V ↦ V^{Int g} is isomorphic to the identity via ρ(g), so the induced
automorphism of Z(G) is the identity, and an isomorphism of groups G ≅ G' induces Z(G) ≅ Z(G')
depending only on its G'(F)-conjugacy class; (2) for G = G₁ × G₂, B(G) = B(G₁) × B(G₂) and
Z_{(s₁,s₂)} ≅ Z_{s₁} ⊗ Z_{s₂}, so Z(G) = ∏_{s₁,s₂} Z_{s₁} ⊗ Z_{s₂}, and irreducibles of G₁ × G₂
are external tensor products ([BD84] Théorème 2.13, p. 22). *Needs:* *bernstein-centre-blocks*,
*bernstein-components*, *smooth-centre*.

`SmoothRep.innerRestriction` gives the natural isomorphism by ρ(g). `SmoothCentre.innerAction` states that the central endomorphism remains unchanged under inner restriction, and `SmoothCentre.transport` specifies transport under a topological group isomorphism.

`SmoothRep.irreducible_product` classifies product-group irreducibles with uniqueness of the factors. `SmoothCentre.product_groups` identifies product inertia, the block centers as tensor products and the full center as their product; its equation pins the block tensor map on exterior tensors ([BD84], Théorème 2.13, p. 22).

### SR.3.3 Tempered representations and the conditional Langlands classification

**Square-integrable and tempered representations** (*square-integrable-tempered*). Let G be
reductive over F and V an admissible complex representation of G with central character ω.
Define `SmoothRep.IsSquareIntegrable`: V is square-integrable modulo the centre (discrete
series) if ω is unitary and every matrix coefficient g ↦ ⟨ṽ, π(g)v⟩ has |c|² integrable on
G/Z(G) (with Mathlib's Lp and the quotient Haar measure). Define `SmoothRep.centralExponents`,
the characters χ of the split centre A_M occurring in the Jacquet modules r_P(V), and
`SmoothRep.IsTempered`: V is tempered if ω is unitary and every exponent of every r_P(V) has
absolute value ≤ 1 on the negative cone (Casselman's criterion taken as the definition; it agrees
with the L^{2+ε} condition on matrix coefficients of Waldspurger's Plancherel theory, which is
not used here). In terms of exponents, the central characters χ of A_M on the r_P(V) satisfy
|χ(a)| < 1 (square-integrable, Casselman's criterion) resp. ≤ 1 (tempered, by definition) on the
negative cone outside the compact-times-central part; prove `SmoothRep.IsSquareIntegrable.isTempered`, square-integrable ⇒
tempered. Prove that an irreducible square-integrable V is unitary and has a formal degree
([Cas95] §2.5, definition and Propositions 2.5.3–2.5.4, pp. 28–29; §4.4, pp. 44–45;
§5.2.4–5.2.5, p. 48 (formal degree); [Kon03] §2, p. 390 (tempered via exponents)). *Needs:*
*admissibility-of-irreducibles*, *harish-chandra-compactness*, *jacquet-module*,
*smooth-dual*.

**Checks.**

- `SmoothRep.isSquareIntegrable_steinberg_gl2`: the Steinberg representation of GL_2(ℚ_p) is square-integrable modulo the centre.
- `SmoothRep.isTempered_unitary_principal`: i_B(χ₁ ⊗ χ₂) with χ_i unitary is tempered.
- `SmoothRep.not_isTempered_trivial`: the trivial representation of GL_2(ℚ_p) is not tempered.

**Casselman's criterion** (*casselman-criterion*). Let G be reductive over F and V an admissible
complex representation with a central character ω; finite length is not required. Prove that V
is square-integrable modulo the centre iff ω is unitary and, for every proper standard parabolic
P = MN and every exponent χ of the normalised Jacquet module r_P(V), one has |χ(a)| < 1 on
the closed negative cone of A_M outside its compact-times-central part. In Casselman's notation
this set is A_Θ⁻ ∖ A_∅(𝒪)A_Δ; on A_Θ the factor δ_∅^{−1/2} in his unnormalised statement
is δ_P^{−1/2}. The tempered condition replaces < by ≤, with the same unitary central
character requirement. For an irreducible π equipped with an embedding into i_{P_Θ} σ with σ
irreducible cuspidal, the square-integrability test need only use P_Ω with Ω associate to Θ
([Cas95] Theorem 4.4.6, p. 45; Theorem 6.5.1, pp. 64–65). The latter reduction is not asserted
for a general admissible V with no specified cuspidal embedding. *Needs:*
*square-integrable-tempered*, *casselman-pairing*, *modulus-character*; ReductiveGroupsPartII RG2.4.


`RationalParabolic.splitCenter_characterization` identifies `RationalParabolic.splitCenter` as the maximal split central torus of the Levi. `RationalParabolic.casselmanData` uses all proper rational parabolics, their normalized Jacquet modules and the positive radical-root norms q raised to minus their normalized valuations. `RationalParabolic.casselmanData_cone` pins the closed cone, including its walls. `RationalParabolic.casselman_criterion` states the admissible criterion on this datum, and `SmoothRep.IsSquareIntegrable.isTempered` gives its non-strict consequence. `CasselmanCriterion.finiteLength` is the GL₂ specialization.

Checks: `RationalParabolic.splitCenter_torus` recovers a split torus; `RationalParabolic.splitCenter_finite` excludes a nontrivial split torus when the Levi centre is finite; `RationalParabolic.splitCenter_minimal` recovers the minimal Levi for a split group. `RationalParabolic.casselmanData_torus` leaves no parabolic tests on a torus; `RationalParabolic.casselmanData_unit` excludes the identity from the strict test; `RationalParabolic.casselmanData_expanding` excludes a point expanding a radical root. These use the root and cone conventions of [Cas95], §4.4.

`RationalParabolic.casselman_associate` restricts the strict exponent test to Levi subgroups associate to the cuspidal Levi of a specified embedding V ↪ i_P σ.

**Checks.**

- `CasselmanCriterion.finiteLength`: the finite-length, unitary-central-character case is a specialization of the full admissible criterion.
- `CasselmanCriterion.torus`: for a torus the parabolic conditions are empty, but the unitary central character condition remains; a nonunitary character is not square-integrable modulo the centre in this convention.
- `CasselmanCriterion.wall`: the tested set includes a noncentral point on a wall of A_M⁻; removing all walls would not reproduce Theorem 4.4.6.

**Harish–Chandra tempered support** (*harish-chandra-tempered-support*). SR.3.3 owns
`RationalParabolic.harishChandra_temperedSupport`: for every connected reductive F-group
and every irreducible tempered complex representation, construct a split inclusion
into normalized induction from an irreducible square-integrable representation of a
rational Levi. The companion target `RationalParabolic.harishChandra_temperedSupport_unique`
proves uniqueness of the discrete-series support up to conjugacy.
The existence assertion is the explicit `hHC` argument below, quantified over all
reductive Levi groups. This input is assumed in [Kon03] §2.4, Proposition 2.2, p. 390;
its construction belongs here, using *square-integrable-tempered*, *casselman-pairing*
and *geometric-lemma*. Every use of the classification retains this input.

**The conditional Langlands classification** (*langlands-classification*). Let G be reductive over F of any
characteristic, with complex coefficients. (1) Hypothesis (Harish-Chandra's theorem, assumed as
in [Kon03]): every irreducible tempered representation is a direct summand of i_P σ for a
parabolic P = MN and a square-integrable σ of M, unique up to conjugacy. (2) For a standard
parabolic P = MN, an irreducible tempered τ of M and ν in the open positive chamber a_P^{*,+}
(|χ_ν(m)| = q^{⟨ν, H_M(m)⟩}, where H_M is defined by q^{⟨χ, H_M(m)⟩} = |χ(m)|_F, so that
δ_P^{1/2} = χ_{ρ_P}), prove that the standard module i_P(τ ⊗ χ_ν) has a unique irreducible
quotient J_P(τ, ν) (the Langlands quotient). Prove that every irreducible admissible V is
isomorphic to some J_P(τ, ν), that the triple (P, τ, ν) is unique up to W-conjugacy, and that V
is tempered iff P = G and ν = 0 ([Kon03] Theorem 3.5, p. 396; Corollary 3.2(ii), p. 393 (the
unique irreducible quotient); Proposition 2.2, p. 390; §3.1–3.3). *Needs:*
*harish-chandra-tempered-support*, *casselman-criterion*, *square-integrable-tempered*,
*casselman-pairing*, *first-adjointness*, *finite-length*.

`LanglandsDatum` specifies the rational parabolic, its reductive Levi and inclusion-compatible point equivalence, the irreducible tempered representation, and the real unramified weight. Its character equation uses the existing negative-valuation `BruhatTits.torusValuationMap`, with positive pairing on radical coroots. `LanglandsDatum.standardModule` uses the existing normalized induction. `LanglandsDatum.quotient_exists`, `LanglandsDatum.classification`, `LanglandsDatum.unique`, and `LanglandsDatum.quotient_tempered` state the four classification assertions under the displayed Harish–Chandra hypothesis.

Checks: `LanglandsDatum_zeroWeight` zero weight is excluded from every proper positive chamber; `LanglandsDatum_unitary` a positive real unramified twist is unitary exactly at weight zero; `LanglandsDatum_torus` a torus permits real weights but has no proper parabolic; `LanglandsDatum.standardModule_torus` on a torus the standard module is already irreducible; `LanglandsDatum.standardModule_zeroWeight` zero weight gives the tempered representation itself; `LanglandsDatum.standardModule_covariance` the positive half modulus and the unramified twist enter with the same sign.

### SR.3.4 The split Iwahori block and nonsplit components

**The Iwahori block** (*borel-casselman-block*). Let G be split connected reductive over F, with its connected Iwahori subgroup I
and complex coefficients. Prove that
the Iwahori subgroup splits SmoothRep ℂ G: the full subcategory of representations generated by
their I-fixed vectors is the block of the unramified principal series [T, 1] (T the split minimal Levi torus), and V ↦ V^I is an equivalence between this block and the
category of modules over H(G, I; ℂ). Prove that an irreducible V has V^I ≠ 0 iff V is a
subquotient (equivalently a subrepresentation) of an unramified principal series i_B χ, and that
for admissible V generated by V^I, V^I is a finite-dimensional H(G, I)-module and the subcategory
is closed under subobjects ([Bor76] §4, Theorem 4.10 and Corollary 4.11, pp. 249–250, for admissible
representations of semisimple groups; [Ber87] §3.1–3.2, pp. 15–17, especially Example (2),
for the full smooth block and reductive groups). *Needs:*
*borel-casselman-invariants*, *corner-irreducibles*, *bernstein-decomposition*,
*iwahori-matsumoto*, *first-adjointness*.

`SmoothRep.GeneratedByInvariants` means that the translates of the fixed-vector submodule span the representation; `SmoothRep.LevelCategory` is its full subcategory. `SmoothRep.iwahori_equivalence` identifies its corner functor with an equivalence. `SmoothRep.iwahori_subobjects` states closure under subobjects, `SmoothRep.iwahori_principalSeries` characterizes its irreducibles by embeddings in unramified principal series, and `SmoothRep.iwahori_finite` states finite dimensionality for admissible objects.

**Connected-Iwahori components in general** (*iwahori-components*). SR.3.4 owns the
nonsplit extension. Let S be maximal F-split, M = Z_G(S), P minimal with Levi M,
I the connected Iwahori, and M₁ = I ∩ M(F). The index set is
W(G,S) \ Hom(M°/M₁, ℂˣ), equivalently weakly unramified characters of M modulo
ordinary unramified twist and relative Weyl conjugacy. A class represented by η
labels the ordinary component [M,η]_G. Prove that the I-generated category is the
product of exactly these components, and that V ↦ V^I identifies it with modules
over H(G,I;ℂ). Its irreducibles embed into i_P η for weakly unramified η.
`SmoothRep.iwahori_weakPrincipalSeries` states this criterion. `SmoothRep.iwahoriCuspidalPair`
constructs [M,η], `SmoothRep.iwahori_components` characterizes the full category by
its irreducible subquotients, and `SmoothRep.iwahori_componentIndex` states the equivalence
on labels. The component indexing
uses restriction to the finite group M°/M₁. Prove that every character of that finite
group extends to Ω_M, with two extensions differing by an ordinary unramified
character. The compact full fixer is not substituted for I. Sources: [Ros14]
§§2.5–2.9 and Lemma 3.2.1 for the quotient groups; the categorical assertion follows
from *borel-casselman-invariants*, *bernstein-decomposition* and *iwahori-matsumoto*.

Checks: the split minimal torus gives one component; an anisotropic unramified
norm-one torus has connected parahoric equal to its compact rational points and
one component; `SmoothRep.GeneratedByInvariants_ramifiedNormOne` gives two components
for RG2's ramified torus, and `SmoothRep.weaklyUnramifiedCharacters_fullFixer`
rejects its nontrivial character at the full compact fixer. These use the same
RG2 torus and connected parahoric as *unramified-characters*.

Checks: `SmoothRep.GeneratedByInvariants_zero` includes zero; `SmoothRep.GeneratedByInvariants_trivial` includes every trivial coefficient module; `SmoothRep.GeneratedByInvariants_vanishing` excludes a nonzero object with no fixed vectors.

For split G, `SmoothRep.iwahori_bernsteinBlock` identifies the level category with the named inertial block of the trivial minimal-Levi representation. `SmoothRep.iwahori_subquotient` has the same split hypothesis and supplies the equivalent subquotient criterion.

**The Steinberg representation** (*steinberg*). For a connected reductive G over F with minimal
parabolic B and complex coefficients, define `SmoothRep.steinberg`, the Steinberg representation
St_G := C^∞(B\G)/Σ_{B ⊊ P} C^∞(P\G), the quotient of the smooth functions on the flag variety by
the sum of those pulled back from the partial flag varieties of the parabolics strictly
containing B. Prove `RationalParabolic.steinberg_irreducible`, that St_G is irreducible;
`RationalParabolic.steinberg_isSquareIntegrable`, that it is square-integrable modulo the centre; and
`SmoothRep.jacquet_steinberg`, that its normalised Jacquet module along B is r_B(St_G) ≅ δ_B^{1/2};
its Iwahori invariants are one-dimensional by *borel-casselman-invariants*. For GL_2,
0 → 1 → Ind_B^G 1 → St → 0 (unnormalised), i.e. St is the irreducible subrepresentation of
i_B(δ_B^{1/2}) ([Cas95] §8, Lemmas 8.1.1–8.1.2 and Theorem 8.1.3, p. 70). For GL_2(F), [BH06] (9.10.3)–(9.10.5), p. 68, verifies the quotient sequence, its dual embedding and self-duality, with the inverse-module conversion above. *Needs:*
*borel-casselman-invariants*, *smooth-induction*, *parabolic-induction*,
*principal-series-jacquet*, *square-integrable-tempered*; ReductiveGroups layer 7.

**Checks.**

- `SmoothRep.steinberg_gl2_exact`: for GL_2(ℚ_p), 0 → 1 → Ind_B^G 1 → St → 0 is exact.
- `SmoothRep.steinberg_torus`: for G = T a split torus, St_T is the trivial representation.
- `SmoothRep.steinberg_ne_trivial`: for GL_2(ℚ_p), St ≇ 1 (the r_B differ).

**Isotypic quotients of the regular representation** (*isotypic-quotient-regular*). Let G be
reductive over F (σ admissible suffices), with complex coefficients, and σ an irreducible smooth
representation of G, hence admissible. Prove that the map C_c^∞(G) → End(σ)^∞ ≅ σ ⊗ σ̃,
f ↦ σ(f), is G × G-equivariant (left and right translation) and surjective: on K-bi-invariant
functions it is H(G, K) → End(σ^K), onto by Burnside's theorem because σ^K is a simple
H(G, K)-module. For σ compact (e.g. cuspidal with compact centre) prove that the map splits,
C_c^∞(G) = (σ ⊗ σ̃) ⊕ (complement), the splitting being given by the formal degree ([Ber92] Ch. I
§5.2, Lemma 10, p. 23; Proposition 13, p. 24; Theorem 8, p. 25; Ch. I §4.2, Lemma 7, p. 19
(simplicity of σ^K)). *Needs:* *admissibility-of-irreducibles*, *hecke-module-equivalence*,
*corner-irreducibles*, *compact-representations*.

`SmoothRep.twoSidedEnd` acts by (a,b)·T = ρ(a)Tρ(b⁻¹), as specified by `SmoothRep.twoSidedEnd_apply`; `SmoothRep.smoothEnd` is its smooth-vector submodule. `SmoothRep.smoothEnd_tensor` identifies this carrier with σ ⊗ σ̃ for admissible σ. `SmoothRep.regular_isotypic` states surjectivity of the integrated action, its two-sided equivariance, and its formal-degree section for compact σ. `SmoothRep.formal_degree` fixes the normalization by Schur orthogonality. `SmoothRep.regular_corner_burnside` states surjectivity onto the full endomorphism algebra of the compact-open invariants.

Checks: `SmoothRep.twoSidedEnd_identity` gives the identity action; `SmoothRep.twoSidedEnd_rankOne` puts the inverse in the right factor; `SmoothRep.twoSidedEnd_character` gives χ(a)/χ(b). `SmoothRep.smoothEnd_zero` is zero; `SmoothRep.smoothEnd_trivial` is the whole endomorphism space even for an infinite trivial module; `SmoothRep.smoothEnd_rankOne` includes every operator formed from a vector and a smooth covector.

### Examples

GL_2(ℚ_p) again: the trivial and Steinberg representations share the cuspidal support
[T, |·|^{−1/2} ⊗ |·|^{1/2}] and the inertial support [T, 1] but differ in their Jacquet modules;
the Steinberg representation is square-integrable and the trivial representation is not tempered,
while a unitary principal series is tempered; and (i_B χ_univ)^I is free of rank one over
H(G, I). For GL_1 the unramified characters are ℂ^× via χ ↦ χ(p), the inertial classes are the
characters of ℤ_p^×, and the universal twist is ℂ[t^{±1}]; for SL_2(ℚ_p) the unramified
characters are trivial.

### Dependencies

SR.0–SR.2 and SR.3a; the Λ-linear centre of SR.1 for the comparison of the Bernstein centre on the
generators ℂ[G/K]; ReductiveGroups layer 7; ReductiveGroupsPartII RG2.0, RG2.1 and RG2.4.

## Layer SR.2a: second adjointness in characteristic zero

Second adjointness over ℂ by Bernstein's route. A strictly dominant central element of a Levi acts
on the K-invariants of any smooth representation, and its action stabilises: a power splits V^K
into a nilpotent part and an invertible part, with exponent bounded by the uniform admissibility
constant. From this come Jacquet's lemma and Jacquet duality without admissibility, the unit and
counit of the adjunction, and second adjointness: i_P is left adjoint to r_{P̄}, along the
opposite parabolic.

### SR.2a.1 Stabilisation and the second adjunction

**Bernstein's stabilisation theorem** (*stabilization*). Let G be reductive over F with complex
coefficients, (P, P̄) a parabolic pair with Levi M, K a compact open subgroup in good position
(K = K₋K_MK₊ with respect to (P, P̄)) and a ∈ Z(M) strictly dominant with respect to (P, P̄, K);
let h be the convolution operator of 1_{KaK} on V^K (the right action of [Ka⁻¹K] in SR.1.2).
Prove that for every smooth complex representation V (no
admissibility assumed) and every n ≥ c(G, K), the *uniform-admissibility* constant,
V^K = ker hⁿ ⊕ im hⁿ, that h acts invertibly on V^K_* := im hⁿ, and that V^K_0 := ker hⁿ and
V^K_* do not depend on n or on a. Prove moreover that V^K_0 = V^K ∩ ker e_C and V^K_* = e_K e_{C̄} V
for sufficiently large compact open C ⊆ N, C̄ ⊆ N̄, and that the projection V^K → (V_N)^{K_M} has
kernel V^K_0 and restricts to an isomorphism V^K_* ≅ (V_N)^{K_M} ([Ber87] §5.1–5.3, pp. 19–23;
§5.4 Remark 1, pp. 23–24). *Needs:* *uniform-admissibility*, *bernstein-decomposition*,
*cuspidal-splitting*, *universal-unramified-twist*, *generic-irreducibility*, *noetherian*,
*geometric-lemma*, *jacquet-invariants*, *iwahori-decomposition*,
*positive-hecke-homomorphism*.

`RationalParabolic.stabilization` supplies a bound valid for all smooth V, identifies the kernel with the Jacquet-projection kernel and gives the stable-range isomorphism.

`RationalParabolic.stableRange_independent` states independence of both eventual kernel and eventual image from the strictly dominant element.

`RationalParabolic.stabilization_averaging` identifies the stable kernel and image with sufficiently large compact-open averages in the two radicals, with a bound valid for every smooth complex representation.

**Jacquet's lemma for all smooth representations** (*jacquet-lemma-smooth*). For G reductive over
F with complex coefficients, every smooth complex representation V of G, and K, P = MN in good
position with respect to (P, P̄), prove that the projection V^K → (V_N)^{K_M} is surjective, and
that it has a natural section (Bernstein's canonical lifting) identifying (V_N)^{K_M} with the
direct summand V^K_* of V^K, functorially in V. The section is independent of the strictly
dominant element used to define it, and compatible with shrinking K ([Ber92] Ch. III §3.2,
Jacquet's Lemma (Final Version), p. 65). *Needs:* *stabilization*, *jacquet-invariants*.

`RationalParabolic.jacquet_canonical_lifting` gives a natural section whose image is the eventual Hecke range for every strongly positive element; hence its image is independent of that element.

`RationalParabolic.jacquet_lifting_shrink` states that averaging the canonical lift from a smaller good compact-open level gives the canonical lift at the larger level.

**Jacquet modules of contragredients** (*jacquet-duality*). For G reductive over F with complex
coefficients, every smooth complex representation V of G (not necessarily admissible) and
opposite parabolics P = MN, P̄ = MN̄, prove that there is a unique nondegenerate M-equivariant
pairing (Ṽ)_{N̄} × V_N → ℂ such that for ṽ ∈ Ṽ, v ∈ V and a strictly dominant central a,
⟨ṽ, π(aⁱ)v⟩ = ⟨p̄(ṽ), π_N(aⁱ)p(v)⟩ for i ≫ 0. It identifies (Ṽ)_{N̄} with the full smooth
contragredient of V_N; with normalised functors (using δ_{P̄} = δ_P⁻¹ on M),
r_{P̄}(Ṽ) ≅ (r_P V)~ naturally in V. For admissible V this is Casselman's pairing
(*casselman-pairing*) ([Ber87] §0.2 Theorem, p. 2; §6.1 Theorem and Corollary, p. 25; §6.2,
pp. 25–26). *Needs:* *stabilization*, *jacquet-lemma-smooth*, *smooth-dual*,
*casselman-pairing*, *modulus-character*.


`RationalParabolic.jacquet_duality` states the normalized duality for every smooth representation, with no admissibility hypothesis.

**Unit and counit of the second adjunction** (*second-adjunction-unit*). For G reductive over F,
opposite parabolics P = MN and P̄ = MN̄, complex coefficients, and Haar measures on N and N̄ fixed
to normalise η, define `RationalParabolic.secondAdjunctionUnit`, the unit η : 𝟭 ⟶ i_P ⋙ r_{P̄}, the
natural embedding η_τ : τ ↪ r_{P̄}(i_P τ) given by the open orbit P·P̄ of P̄ on P\G: functions in
i_P τ supported in the big cell P N̄ form the bottom piece of the *geometric-lemma* filtration of
r_{P̄} i_P, isomorphic to τ. Define `RationalParabolic.secondAdjunctionCounit`, the counit
ε : r_{P̄} ⋙ i_P ⟶ 𝟭, ε_π : i_P(r_{P̄} π) → π being the map corresponding, under the Hom
isomorphism constructed from *jacquet-duality*, *first-adjointness* and the induced
contragredient comparison, to the identity of r_{P̄} π. Construct `RationalParabolic.secondAdjunctionHomEquiv` here,
first on smooth duals and then on injective resolutions, before defining the counit.
Prove the triangle identities
`RationalParabolic.secondAdjunction_left_triangle`, r_{P̄}(ε_π) ∘ η_{r_{P̄}π} = id, and
`RationalParabolic.secondAdjunction_right_triangle`, ε_{i_P τ} ∘ i_P(η_τ) = id, and prove that the unit
agrees with the *geometric-lemma* map of Bernstein's β ([Ber92] Ch. III §3.1, p. 61; Important
Comment on Theorem 20, pp. 66–67). *Needs:* *geometric-lemma*, *l-sheaf-model*,
*parabolic-induction*, *jacquet-module*, *jacquet-duality*, *first-adjointness*,
*induced-contragredient*, *grothendieck-abelian*.

**Checks.**

- `SmoothRep.secondAdjunctionUnit_gl2`: for GL_2 and τ = χ, η_χ identifies χ with the subrepresentation of r_{B̄}(i_B χ) coming from functions supported on B N̄.
- `SmoothRep.secondAdjunctionUnit_trivial_parabolic`: for P = G and mass one on the trivial unipotent radical, η and ε are identities under the evaluation identifications.
- `SmoothRep.secondAdjunctionUnit_injective`: η_τ is injective for every τ.


`RationalParabolic.bigCellSection_apply` fixes the induced transformation law, and `RationalParabolic.bigCellSection_outside` fixes extension by zero. `RationalParabolic.secondAdjunctionUnit_integral` normalizes the unit by the chosen nonzero Haar measure on the opposite radical.

Checks:

- `RationalParabolic.secondAdjunction_zero`: the unit on zero is invertible.
- `RationalParabolic.secondAdjunction_self`: for the full parabolic the unit and counit are invertible.
- `RationalParabolic.secondAdjunction_injective`: no admissibility on the inducing object.

**Second adjointness** (*second-adjointness*). For a connected reductive group G over a
nonarchimedean local field F, opposite parabolics P = MN and P̄ = MN̄, and complex coefficients,
prove that normalised parabolic induction i_P is left adjoint to the normalised Jacquet functor
r_{P̄} along the opposite parabolic, Hom_G(i_P τ, π) ≅ Hom_M(τ, r_{P̄} π) naturally in τ and π,
with unit and counit those of *second-adjunction-unit*. This is separate from the first
adjunction r_P ⊣ i_P. Conclude that r_{P̄} commutes with arbitrary products; that i_P preserves
projective objects; and that for admissible π, Hom_G(i_P τ, π̃) ≅ Hom_M(τ, (r_P π)~), compatibly
with Casselman's pairing. In unnormalised terms the right adjoint of Ind_P^G ∘ infl is
δ_P ⊗ (−)_{N̄}, as in the conventions ([Ber87] §0.1 Main theorem, p. 1; §6.5 Theorem, p. 27).
*Needs:* *jacquet-duality*, *second-adjunction-unit*, *induced-contragredient*,
*first-adjointness*, *smooth-dual*.


`RationalParabolic.secondAdjunction` supplies the adjunction on the actual rational parabolics. `RationalParabolic.induction_projective` and `RationalParabolic.jacquet_products` state the projectivity and product consequences.

### Examples

For GL_2 the unit η_χ identifies the character χ of the torus with the functions in i_B χ
supported on the big cell B N̄ inside r_{B̄}(i_B χ); for P = G the unit and counit are the
identities; and the unit is injective for every τ.

### Dependencies

SR.0–SR.2, SR.3a and SR.3 (uniform admissibility, the Bernstein decomposition, cuspidal
splitting, the universal unramified twist, generic irreducibility and noetherianity enter the
stabilisation theorem); nothing from SR.2a is used by SR.3.

## Layer SR.4: spherical representations and Satake

The classical Satake isomorphism for an unramified group with a hyperspecial subgroup K, in a
coefficient-safe form. The transform is built from the Iwasawa and Cartan decompositions as finite
sums of N-integrals, so that it is defined over ℤ[q⁻¹] and the proof of the isomorphism is
triangular in the dominance order rather than an average over the Weyl group.

### SR.4.1 The Satake transform and isomorphism

**Integral and normalized Satake transforms** (*satake-transform*). For an unramified connected
reductive F-group with residue cardinality q, a hyperspecial K, a minimal parabolic P = TN and
the cocharacter lattice Λ = T(F)/T(F)⁰, over a coefficient ring in which p is invertible, define
the raw transform S*(f)(t) = ∫_N f(tn) dn with vol(N ∩ K) = 1. Prove `satakeTransform.support`,
that S* has finite support on the lattice Λ, and `satakeTransform.coefficient`, that the
coefficient at t is the N-integral with N ∩ K of volume one; it takes values over ℤ[q⁻¹]. With a
chosen square root of q in the coefficient ring, S = δ_P^{1/2} S*. The domain uses vol(K) = 1 and
the existing finite double-coset convolution. Prove `satakeTransform.baseChange`: S* commutes with
scalar extension whenever q remains a unit ([TV] theorem in §7.2, (7.2.4)–(7.2.6),
pp. 206–207, with the inversion comparison in *twisted-weyl-invariance*). *Needs:* layer SR.1;
ReductiveGroupsPartII RG2.4; ModularForms layer 2.

**Checks.**

- `satakeTransform.torus`: if N = 1 and K = T(F)⁰, S* is the identity.
- `satakeTransform.unit`: the characteristic function of K maps to the identity lattice monomial.
- `satakeTransform.gl2`: for GL_2, normalized S([K diag(ϖ, 1) K]) = q^{1/2}(X₁ + X₂).

**The twisted relative Weyl action** (*twisted-weyl-invariance*). Let W₀ = N_G(A)/Z_G(A) for the
maximal F-split torus A and let Σ* be the sum of the positive dual coroots (the positive roots of
G for the parabolic P = TN, viewed as cocharacters of the dual torus). With the identifications of
the conventions (the class of λ(ϖ) is the character λ of the dual torus), prove that S* lands in
the functions invariant for the twisted action w ∗ a = w(a)·((wΣ* − Σ*)/2)(q). The difference
wΣ* − Σ* is even, so this action is integral without a square root of q. Prove that the
normalized S lands in the ordinary W₀-invariants (D. Treumann and A. Venkatesh [TV],
the theorem in §7.2, (7.2.4)–(7.2.6), pp. 206–207).

`satakeTransform.weyl_parity` states the evenness of the modulus-exponent difference. `satakeTransform.twisted_weyl` uses that integral half-difference to specify the coefficient relation for the raw transform. `satakeTransform.weyl_invariant` states ordinary invariance after multiplication by the chosen square-root modulus. The normalizer and Levi come from the same rational root datum; the GL₂ sign is tested by `directLatticeSatake`.

**Source convention.** The printed point action (7.2.1), p. 206, uses ((Σ* − wΣ*)/2)(q),
and §7.4(a)(i), p. 209, uses α₀² = Σ*(q). These are the inverse of the twist and square
used here. They do not follow from an inverse lattice dictionary in §2.9: (2.9.2), p. 187,
uses t ↦ z^{v(α(t))}, hence λ(ϖ) ↦ λ for v(ϖ) = 1. With that dictionary, the printed
point formulas disagree with (7.2.5) and the modulus-character version (7.4.2).
To use the printed point formulas consistently, transport the raw transform by the lattice
involution [λ] ↦ [−λ], and the parameter by a ↦ a⁻¹. The transported transform has TV's
displayed twist, and a₀⁻¹ has TV's displayed square. The GL₂ check below determines the
sign without attributing an unstated inverse dictionary to the source. *Needs:*
*satake-transform*; ReductiveGroupsPartII RG2.1, ReductiveGroupsPartII RG2.5.

**Check (sign of the twist).** For GL_2 write X₁, X₂ for the classes of diag(ϖ,1) and diag(1,ϖ).
Then S*(1_{K diag(ϖ,1) K}) = qX₁ + X₂: the N-integral at diag(ϖ,1) is the volume q of ϖ⁻¹O, and
at diag(1,ϖ) it is the volume 1 of O. For s the reflection, the twist ((sΣ* − Σ*)/2)(q) = (−α)(q)
sends X₁ ↦ q⁻¹X₂ and X₂ ↦ qX₁, and fixes qX₁ + X₂. The opposite twist ((Σ* − sΣ*)/2)(q) sends it
to q⁻¹X₁ + q²X₂, so it does not describe the image of S*. Normalising, S = δ_B^{1/2}S* gives
q^{1/2}(X₁ + X₂), which is symmetric. The Lean example states this for q = 3 as a coefficient
function on ℤ² and proves both halves. Its companion `tvInverseLattice` uses the
coefficients at (−1,0) and (0,−1) and is fixed by TV's printed opposite twist.

**Classical Satake isomorphism** (*satake-isomorphism*). Prove that over ℤ[q⁻¹], S* identifies
the spherical Hecke algebra with the twisted W₀-invariant lattice algebra, and that after
adjoining a specified square root of q, S identifies it with the ordinary W₀-invariants.
Coefficient versions use the integral triangular orbit-sum basis, including when the coefficient
characteristic divides the order of W₀ ([TV] theorem in §7.2 and (7.2.4)–(7.2.6), pp. 206–207,
with the explicit inversion comparison in *twisted-weyl-invariance*). *Needs:* *satake-transform*,
*twisted-weyl-invariance*; ReductiveGroupsPartII RG2.4.

`satakeTransform.integral_isomorphism` gives injectivity, the exact twisted-invariant image, and compatibility with the actual Hecke convolution. `satakeTransform.normalized_isomorphism` gives the corresponding ordinary-invariant image with a specified square root. Both statements apply to any coefficient ring in which q is a unit, with vol(K) = 1; neither inverts the Weyl-group order.

**Unramified torus characters** (*torus-character-dictionary*). Over an algebraically closed
field with p invertible, prove that unramified characters of T(F) are the points of the
Frobenius-coinvariant dual torus. This is the character-lattice dictionary, including nonsplit
unramified tori ([TV] §2.9, (2.9.1)–(2.9.2), pp. 186–187; §7.1, pp. 204–205). *Needs:* ReductiveGroupsPartII RG2.5; ClassFieldTheory
layer 9.

`frobeniusFixedCocharacters` is the lattice dual to the geometric characters and fixed by arithmetic Frobenius. `FrobeniusCoinvariantTorus` is the group of points of the dual quotient torus with that character lattice. `SmoothRep.unramifiedTorus_dictionary` identifies the quotient of the rational unramified torus by its compact elements with this fixed lattice, fixes the positive valuation on every geometric character, and identifies unramified characters with quotient-dual-torus points. The condition on `UnramifiedApartmentData.torusIdeal` requires the entire torus to split over the maximal unramified completion ([TV], §2.9, pp. 186–187).

Checks: `frobeniusFixedCocharacters_split` retains the whole lattice; `frobeniusFixedCocharacters_inversion` is zero for the norm-one rank-one action; `frobeniusFixedCocharacters_swap` retains the diagonal for a quadratic induced torus. Correspondingly, `FrobeniusCoinvariantTorus_split` and `FrobeniusCoinvariantTorus_swap` give one unit coordinate, while `FrobeniusCoinvariantTorus_inversion` is a point.

**Twisted conjugation on the Frobenius component** (*frobenius-component-invariants*). Prove
that restriction from the Frobenius component Ĥ ⋊ Fr of the dual group to the dual torus
identifies conjugation-invariant regular functions with W₀-invariant regular functions on the
relative dual torus, over the fields and integral forms of TV §7.3. Closed conjugacy orbits are
the semisimple unramified parameters ([TV] Lemma 7.3 and proof, pp. 207–209). *Needs:*
*torus-character-dictionary*; ReductiveGroups layer 7, ReductiveGroupsPartII RG2.5.

`FrobeniusComponent.invariants` tests invariance over every coefficient algebra. `FrobeniusComponent.torusInvariants` consists of Laurent functions supported on the Frobenius-fixed lattice and invariant under the Frobenius-fixed Weyl group. `FrobeniusComponent.restriction` pins the algebra isomorphism along the existing dual-torus inclusion. `FrobeniusComponent.closed_orbit` characterizes closed twisted orbits by their meeting the dual torus, with closedness expressed by vanishing equations.

Checks: `FrobeniusComponent.invariants_scalar` scalars survive twisted conjugation; `FrobeniusComponent.invariants_splitTorus` conjugation on a split torus imposes no relation; `FrobeniusComponent.invariants_nonclassFunction` a function separating two twisted-conjugate points is rejected; `FrobeniusComponent.torusInvariants_scalar` the zero weight has no Frobenius or Weyl obstruction; `FrobeniusComponent.torusInvariants_splitTorus` a split torus retains every Laurent monomial; `FrobeniusComponent.torusInvariants_moved` a nonfixed character cannot descend to the Frobenius-coinvariant torus.

### SR.4.2 Spherical parameters

**Local pseudoroots** (*pseudoroot*). Define a local pseudoroot as an element a₀ of the dual
torus with a₀² = Σ*(q)⁻¹ (`Pseudoroot.square`, with `sigmaQ` = Σ*(q)⁻¹) that is fixed by every
element of the twisted relative Weyl action of *twisted-weyl-invariance* (`Pseudoroot.fixed`, with
twist w ↦ ((wΣ* − Σ*)/2)(q)). Prove `Pseudoroot.translate`: translation by a₀
takes ordinary Weyl orbits to twisted Weyl orbits; division by a₀ takes twisted
parameters to ordinary ones. Choosing a square root of q constructs a pseudoroot, namely
the parameter t_{δ_P^{1/2}} = (Σ*/2)(q)⁻¹ of δ_P^{1/2}; an even Σ* gives a canonical one ([TV] §7.4,
(a)–(b) and (7.4.2), p. 209, and (7.4.3)–(7.4.4), p. 210). The displayed
point pseudoroot in TV is the inverse of ours: `Pseudoroot.inv_iff` records the simultaneous
inversion of the square and the twist. This is a transport of the printed formulas, with
the dictionary discrepancy specified in *twisted-weyl-invariance*. *Needs:*
*twisted-weyl-invariance*.

**Checks.**

- `Pseudoroot.even`: if Σ* = 2η, then η(q)⁻¹ is a pseudoroot with square η(q)⁻² and twist w ↦ (wη(q))η(q)⁻¹; for trivial action and η the identity on ℚˣ at q = 2, the resulting point is 1/2 with square 1/4.
- `Pseudoroot.trivial`: for a torus Σ* = 0, the identity is a pseudoroot.
- `Pseudoroot.characteristicTwo`: over a coefficient field of characteristic two, squaring is
  injective, so a pseudoroot is unique when it exists. Since p is then odd, q maps to 1, so
  Σ*(q) = 1, the twist is trivial and the identity is the pseudoroot: the condition Σ*(q) ≠ 1 has
  no characteristic-two instance.
- Negative controls for the two conditions therefore live in other characteristics. If
  Σ*(q)⁻¹ ≠ 1 the identity fails the square condition. If a₀ is a pseudoroot and c is
  Weyl-invariant with c² ≠ 1 (for GL_2 over ℚ with q = 4: a₀ = diag(1/2, 2) and the scalar
  c = 2), then a₀c is still fixed by the twisted action but fails the square condition, so a
  definition that dropped `Pseudoroot.square` would accept it. Both are Lean examples.

**Spherical eigencharacters and parameters** (*spherical-parameter*). For an algebraically
closed coefficient field of characteristic different from p, prove that a spherical Hecke
character determines a semisimple unramified parameter. Under the convolution action, the K-fixed
line in the unnormalized Ind_P^G(θ) has character f ↦ θ(S*f), the value of S*f at t_θ, and
parameter t_θ a₀⁻¹ ⋊ Fr; normalized induction i_P χ = Ind_P^G(χδ_P^{1/2}) has parameter t_χ ⋊ Fr,
consistently, because t_{χδ_P^{1/2}} = t_χ a₀ for the canonical pseudoroot a₀ = t_{δ_P^{1/2}}.
For a classical newform the pair at p is Tau Ceti's
`HeckeRing.GL2.Newform.satakeParameters` ([TV] §7.5, formulas (7.5.2)–(7.5.5), pp. 210–211). *Needs:*
*satake-isomorphism*, *pseudoroot*, *frobenius-component-invariants*; layer SR.2.

`FrobeniusComponent.SemisimpleParameter` consists of dual-torus points modulo Frobenius-twisted conjugacy in the existing dual group. `FrobeniusComponent.eigencharacters` identifies its classes with characters of the invariant coordinate algebra. `satakeTransform.spherical_line` gives the actual convolution action on the one-dimensional fixed space of unnormalized induction; `satakeTransform.parameter_normalization` records the simultaneous half-modulus change in the inducing character and constant term.

Checks: `FrobeniusComponent.SemisimpleParameter_conjugacy` equality uses the Frobenius-twisted relation; `FrobeniusComponent.SemisimpleParameter_splitTorus` distinct points of a split torus give distinct parameters; `FrobeniusComponent.SemisimpleParameter_separated` regular class functions distinguish semisimple parameters.

**Canonical c-group Satake formulation** (*c-group-formulation*). In the earlier TV formulation,
over an algebraically closed coefficient field of characteristic different from p and two,
the C-group is (L-group × G_m)/⟨(Σ*(−1), −1)⟩. Its map to Γ × G_m sends the class of
(g, γ, c) to (γ, c²). The c-group is the subgroup over the graph c² = cyclo(γ), not the whole
C-group. For the unramified group and hyperspecial K of this section, prove that regular
functions on its Frobenius fibre modulo dual-group conjugacy give the canonical Satake algebra,
independent of the choice of square root of q. The characteristic-two case retains the preceding
pseudoroot formulation ([TVpre] §§7.8–7.9, Theorem 7.9, pp. 29–31). *Needs:*
*spherical-parameter*; ReductiveGroups layer 3.

`CGroupSatake.epsilon` is pinned by the sum of positive roots evaluated at −1. `CGroupSatake.CGroup` quotients the existing L-group times the multiplicative group by this diagonal sign; `CGroupSatake.projection` squares the scalar coordinate, and `CGroupSatake.cGroup` imposes the cyclotomic graph. `CGroupSatake.frobeniusCover`, `CGroupSatake.evaluate`, and `CGroupSatake.frobeniusInvariants` give the Frobenius-fibre coordinate algebra, evaluation, and regular functions invariant under both the sign and dual conjugacy. `CGroupSatake.frobeniusInvariants_chart` characterizes the chart associated to a square root of q.

Checks: `CGroupSatake.epsilon_square` the central sign has order dividing two; `CGroupSatake.epsilon_torus` a torus has zero root sum; `CGroupSatake.epsilon_central` the sign commutes with the full dual group, not just its torus; `CGroupSatake.CGroup_sign` both coordinates change under the quotient relation; `CGroupSatake.CGroup_kernel` no extra central points are killed; `CGroupSatake.CGroup_dual` away from characteristic two the full dual group embeds; `CGroupSatake.projection_apply` the target coordinate is c squared, not c; `CGroupSatake.projection_dual` the dual group lies in the projection kernel; `CGroupSatake.projection_onto` algebraic closedness supplies the missing square roots; `CGroupSatake.cGroup_equation` membership imposes the cyclotomic equation; `CGroupSatake.cGroup_excludes` arbitrary scalar points of the C-group are not c-group points; `CGroupSatake.cGroup_torus` the graph quotient canonically recovers the L-group for a torus; `CGroupSatake.frobeniusCover_relation` the Frobenius fibre has its square equation built in; `CGroupSatake.frobeniusCover_rootUnit` no extra localization at c is needed because q is a unit; `CGroupSatake.frobeniusCover_split` over algebraically closed coefficients the cover has two sheets before quotienting; `CGroupSatake.evaluate_root` the coordinate c evaluates to the chosen root; `CGroupSatake.evaluate_group` the dual-group factor retains its actual regular functions; `CGroupSatake.evaluate_sign` the two cover points differ before taking sign invariants; `CGroupSatake.frobeniusInvariants_scalar` scalar functions descend to the quotient; `CGroupSatake.frobeniusInvariants_root` the square-root coordinate alone does not descend; `CGroupSatake.frobeniusInvariants_sign` simultaneous sign change leaves a descended function unchanged.

`CGroupSatake.satake_isomorphism` constructs the Frobenius-fixed absolute cocharacter lattice comparison, pins it by valuations of rational torus characters, and states the Hecke algebra isomorphism with one evaluation equation valid for both square-root charts. `CGroupSatake.projection_pglTwo` identifies the split PGL₂ C-group with GL₂ × Γ and its projection with (γ, det).

Check: `CGroupSatake.projection_pglTwo` imposes det(g) = cyclo(γ) precisely on the c-group, distinguishing it from the full C-group.

**Checks.** For a torus Σ* = 0, the c-group recovers the L-group. For PGL₂ its c-group
consists of pairs (g, γ) with det(g) = cyclo(γ); dropping this equation gives the larger
C-group GL₂ × Γ. Changing a square root of q changes both identifications by Σ*(−1),
so their composite Satake map is unchanged ([TVpre] §7.8, p. 30; Theorem 7.9, pp. 30–31).

### SR.4.3 The general linear group

**Explicit GL_n spherical generators** (*gln-generators*). For GL_n(F), prove
S([K diag(ϖ, …, ϖ, 1, …, 1) K]) = q^{r(n−r)/2} e_r(X₁, …, X_n), with ϖ repeated r times and 1
repeated n − r times. The scalar coset is invertible, and the target is the symmetric Laurent
polynomial ring. Reuse the existing arithmetic GL_n Hecke algebra and the central-coset
localization comparison, rather than defining another multiplication ([TV] Theorem 7.2 and formulas (7.2.4)–(7.2.6), pp. 206–207;
GL_n specialization). *Needs:* *satake-isomorphism*; ModularForms layer 2.

`satakeTransform.gln_minuscule` specifies the elementary symmetric formula on the actual hyperspecial double-coset characteristic function; `satakeTransform.gln_scalar` identifies the scalar coset with the invertible determinant monomial. Both use `satakeTransform`, with the diagonal lattice map fixed by the positive normalized valuation.

`satakeTransform.gln_symmetric_laurent` gives the full algebra isomorphism onto permutation-invariant Laurent polynomials, characterized by the same normalized Satake integral and double-coset coefficients.

`HeckeAlgebraLevel.gln_central_localization` uses the arithmetic `HeckeRing` of integral matrices, sends each double-coset basis element to the same basis element in the full group, and specifies the localization universal property at the scalar-uniformizer coset. This comparison uses the supplier’s multiplication over every commutative coefficient ring.

**Hall–Littlewood spherical functions** (*hall-littlewood*). For a dominant integral tuple λ of
length n and invertible variables X_i, define P_λ(X; t) by the symmetric rational expression

```text
P_λ(X; t) = v_λ(t)⁻¹ · Σ_{w ∈ S_n} w( X^λ · ∏_{i<j} (X_i − t X_j)/(X_i − X_j) ),
```

the sum over permutations of X^λ times ∏_{i<j} (X_i − t X_j)/(X_i − X_j), divided by the
stabilizer Poincaré polynomial v_λ(t). Prove `HallLittlewood.integral`: the universal expression
cancels to a symmetric Laurent polynomial over ℤ[t], so specialization uses no
variable-difference inverses; prove this before specializing denominators in coefficient rings.
Prove `HallLittlewood.symmetric`, that P_λ is invariant under variable permutations, and
`HallLittlewood.homogeneous`, that its total Laurent degree is Σ λ_i ([Les] proof of Lemma 3.2, p. 24,
displayed Macdonald formula; the universal integrality assertion is a separate algebraic proof obligation). *Needs:* *satake-isomorphism*.


`HallLittlewood.LaurentRing` is the localization of the integer polynomial ring at the product of the coordinate variables. `HallLittlewood.integral` states integrality of the universal rational expression in its fraction field. `HallLittlewood.polynomial_fraction` characterizes `HallLittlewood.polynomial` before any specialization.

Checks:

- `HallLittlewood.polynomial_zero`: the integral zero-weight polynomial is one, including at poles of the raw expression.
- `HallLittlewood.polynomial_rankOne`: negative as well as positive rank-one weights give the corresponding Laurent monomial.
- `HallLittlewood.polynomial_minuscule`: the first rank-two fundamental weight gives X₁ + X₂.

`HallLittlewood.polynomial_symmetric` and `HallLittlewood.polynomial_homogeneous` state symmetry and Laurent homogeneity for the integral polynomial, including specialization where the rational expression has poles.

**Checks.**

- `HallLittlewood.rankOne`: for n = 1, P_{(m)} = X^m.
- `HallLittlewood.zero`: P₀ = 1 at pairwise distinct coordinates with nonzero Hall normalizer (the raw rational expression need not equal its polynomial extension at collisions).
- `HallLittlewood.minuscule`: for λ = (1, …, 1, 0, …, 0) with r ≤ n ones, P_λ = e_r at pairwise distinct coordinates with nonzero Hall normalizer.

The separate field-valued function `hallLittlewoodEval` in Suggested.lean uses total division.
Its `HallLittlewood.integralEvaluation` contract concerns dominant nonnegative exponents over a
characteristic-zero field, distinct evaluation coordinates and nonzero `hallNormalizer`;
it identifies the rational value with an integral polynomial. The universal Laurent-polynomial
construction above also treats negative exponents and specialization at collisions.

**Checks.** For the rational evaluation, the empty tuple gives 1. In rank two the zero tuple has
normalizer 1 + t: at t = −1 it vanishes and total division gives 0 even at coordinates (1, 2).
At t = 0 and coordinates (1, 1), variable-difference denominators vanish and the rational value
is again 0, whereas the universal P₀ specializes to 1. These are Lean negative controls for
using a rational evaluation at a pole.

**Macdonald formula for GL_n** (*macdonald-formula*). For GL_n(E), with E/F unramified quadratic
and q = #k_F, prove S(1_λ) = q^{⟨λ, 2ρ⟩} P_λ(X; q⁻²). Hall–Littlewood branching separates
n = a + b variables into bidegrees with |α| + |β| = |λ| ([Les] proof of Lemma 3.2, pp. 24–25). *Needs:*
*hall-littlewood*, *gln-generators*.

`satakeTransform.gln_macdonald` states the formula when the residue cardinality is q². `HallLittlewood.polynomial_branching` supplies universal polynomial coefficients whose two Laurent degrees sum to |λ|; the statement precedes all coefficient specializations.

**Spherical parabolic descent** (*parabolic-descent*). For G = GL_n(E), E/F unramified
quadratic, K = GL_n(O_E) and the standard Levi M = GL_a(E) × GL_b(E), a + b = n,
take P = MN and use complex coefficients. Define the normalized
spherical descent f^P(m) = δ_P(m)^{1/2} ∫_N ∫_K f(kmnk⁻¹) dk dn, with vol(K) = vol(N ∩ K) = 1.
Prove `parabolicDescent.support`, that descent preserves compact support modulo the Levi compact
subgroup; `parabolicDescent.satake`, that under Satake descent is restriction along the dual
Levi embedding (normalized Satake followed by dual-Levi restriction equals Levi Satake after
descent); and `parabolicDescent.stages`, that nested Levi descents agree, using the product of
the specified modulus halves. Leslie's ξ_{(a,b)} also twists the two determinant characters by
|·|_E^{b/2} and |·|_E^{a/2}: its dual embedding is
(m₁,m₂) ↦ diag(q^{−b}m₁,q^{−a}m₂) (S. Leslie [Les] Lemma 3.1 and the preceding
definition, p. 23; Lemma 3.2, p. 24, and proof, pp. 24–25). *Needs:* *satake-transform*;
layer SR.2. The corresponding statement for arbitrary unramified reductive groups is
outside this sourced target: it needs a reference proving normalized constant-term
compatibility and transitivity with the chosen Haar measures.

**Checks.**

- `parabolicDescent.quadraticNorm`: for GL₂(E), δ_B(diag(ϖ,1)) = q⁻² and its positive square root is q⁻¹. Use the normalized E-absolute value on determinants; the F-absolute-value subscript in the displayed modulus in [Les], p. 23, must not change this factor.
- `parabolicDescent.wholeGroup`: for M = G, descent is the identity.
- `parabolicDescent.torus`: for M = T, descent agrees with the normalized constant term.
- `parabolicDescent.xiVariables`: ξ_{(a,b)} replaces the first a variables by q^{−b} X_i and the
  last b by q^{−a} Y_j. For a = 1, b = 2, q = 3 and all coordinates 1, the
three coordinates become (1/9,1/3,1/3), distinguishing this twist from the modulus half.
The Lean coordinate map is `parabolicDescent.xiVariables`.

`parabolicDescent.stages` states the nested constant-term identity with a radical multiplication homeomorphism, the product Haar measure, the product of the specified modulus halves and triviality of the first half on the nested radical. `parabolicDescent.satake` identifies normalized transforms on the common torus lattice, where dual-Levi restriction is inclusion of invariant functions. The signatures retain the product-measure and subgroup-compatibility hypotheses; finite-sum Fubini is the integration statement of [BH06], §3.2, pp. 28–29.

`HeckeAlgebra.conjugationAverage` integrates compact conjugates of a function with the specified Haar measure. `parabolicDescent.averaged` composes this with the normalized radical integral, and `parabolicDescent.averaged_spherical` identifies it with the spherical constant term ([Les], §3, p. 23).

Checks: `HeckeAlgebra.conjugationAverage_spherical` fixes conjugation-invariant functions for probability Haar measure; `HeckeAlgebra.conjugationAverage_disjoint` vanishes on a conjugacy orbit disjoint from the support; `HeckeAlgebra.conjugationAverage_finite` gives the full conjugacy sum for counting measure. `parabolicDescent.averaged_spherical` gives the usual spherical descent, `parabolicDescent.averaged_zero` gives zero, and `parabolicDescent.averaged_wholeGroup` retains compact conjugation averaging when the radical is trivial.

**Checks (finite sums).** For the auxiliary finite sums, `inversionLength` is 0 on the empty permutation and the identity
of S₂ and is 1 on (01). The normalizer of the empty weight is 1, the normalizer of (0,0) is
1 + t, and that of (0,1) is 1. All six computations are Lean examples; in particular the
normalizer can vanish at t = −1.

### SR.4.4 Unramified unitary groups

**Ordered unitary Satake parameters** (*paired-unitary-parameter*). Over a coefficient ring L,
define an inert rank-N paired parameter as an ordered tuple of units α with α_i α_{N+1−i} = 1
and, for odd N, middle entry α = 1, with its monic polynomial `PairedParameter.polynomial`,
P_α(T) = ∏_i (T − α_i). Prove `PairedParameter.reciprocal`, P_α(T) = (−T)^N P_α(T⁻¹), interpreted
after clearing Laurent powers, and `PairedParameter.weyl`, that permutations and inversion of
paired coordinates leave the character unchanged. A reciprocal polynomial need not split over L,
so it need not admit this paired ordering ([LTXZZ] §3.1, Definition 3.1.3 and Construction 3.1.8,
pp. 139–141). *Needs:* *spherical-parameter*.

**Checks.** The empty paired parameter has polynomial 1. The two consecutive ranks fix the
reciprocity sign: over ℤ, reverse(T − 1) = −(T − 1), while reverse(T² − 3T + 1) = T² − 3T + 1.
Both identities are Lean examples.

- `PairedParameter.rankOne`: every inert paired rank-one parameter has polynomial T − 1 (and its sole entry is 1).
- `PairedParameter.rankTwo`: for units a, a⁻¹, P = T² − (a + a⁻¹)T + 1.
- `PairedParameter.productRing`: over L = ℚ, T² − 3T + 1 is reciprocal but has no root in L, so it
  admits no paired ordering.

**Polynomial unitary genericity predicates** (*unitary-genericity*). For q a unit of L and a
monic unitary P of rank N, apply the following polynomial predicates: odd Tate genericity, P'(1) is a unit
(`UnitaryGenericity.oddTate`: in odd rank the Tate condition is IsUnit (P' evaluated at 1)); odd
intertwining genericity, P(−q) is a unit; even level-raising specialness, P(q) = 0 and P'(q) is a
unit (`UnitaryGenericity.evenSpecial`: in even rank the raising condition combines P(q) = 0 with
IsUnit (P' evaluated at q)); even intertwining genericity, P(−1) is a unit. The predicates themselves are defined for any polynomial over a commutative ring and any q;
the unit and parity assumptions belong to their unitary applications. They remain meaningful
when roots collide. `UnitaryGenericity.AtRank kind N P q` includes the source hypotheses:
q is a unit, P is monic of degree N, P is reciprocal with sign (−1)^N, and N has the parity
specified by kind. This is the sourced unitary condition; `UnitaryGenericity` alone is its
polynomial test. The failure checks assume a nonzero coefficient ring. Prove
`UnitaryGenericity.baseChange`: the polynomial tests are preserved by every ring homomorphism;
`UnitaryGenericity.AtRank.baseChange` preserves the full condition when the target ring is
nonzero, so the degree of a monic polynomial is retained (Y. Liu, Y. Tian, L. Xiao, W. Zhang
and X. Zhu [LTXZZ] Definition 3.1.5, pp. 139–140, and Remark 3.1.6, p. 140).
The source calls the even condition “level-raising special”; the other three are genericity
conditions. Field-only root descriptions in Remark 3.1.6 are not definitions over rings. *Needs:* *paired-unitary-parameter*.

**Checks.**

- `UnitaryGenericity.doubleRoot`: for rank two with q = 1 and P = (T − 1)², the even level-raising special
  condition fails.
- `UnitaryGenericity.oddOne`: for P = T − 1 the odd Tate condition holds.
- `UnitaryGenericity.AtRank`: over ℚ, T − 1 passes odd Tate at rank one but cannot pass
  an even-rank condition, even when its polynomial evaluation is a unit.
- `UnitaryGenericity.collision`: for P = T − 1 and q = −1, odd intertwining fails despite there
  being no nonmiddle reciprocal pair.

**Unitary dual-group trace coordinates** (*unitary-weyl-traces*). For the unramified unitary
rank-N dual group GL_N ⋊ (the pinned transpose-inverse involution), prove that the invariant
lattice coordinates are the elementary symmetric functions in
μ_i = x_i/x_{N+1−i} + x_{N+1−i}/x_i, and that the extended exterior-power tensor-dual
representation has Frobenius-component trace equal to the subset sum of the products
x_i/x_{N+1−i}, over subsets of cardinality δ ([LTXZZ] Remark B.1.1, p. 332, and Lemmas B.1.2–B.1.4 with proofs, pp. 332–334). *Needs:* *satake-isomorphism*; ReductiveGroupsPartII RG2.5.

`UnitarySatake.weylInvariants` is the subalgebra fixed by signed permutations of the relative lattice. `UnitarySatake.mu_weylGenerators` identifies it with the polynomial algebra on the elementary symmetric functions in the paired coordinates. `UnitarySatake.tensorExterior` is a Mathlib `Representation` whose matrix entries are minors of g and g inverse in the ordered wedge tensor basis. `UnitarySatake.tensorFrobenius` supplies the pinned transpose-inverse extension; `UnitarySatake.tensorFrobenius_intertwining` specifies its action. `UnitarySatake.tensorExterior_trace` computes its Frobenius-component trace, and `UnitarySatake.tensorExterior_tracePolynomial` identifies it with the relative-lattice subset sum.

Checks: `UnitarySatake.weylInvariants_scalar` coefficient scalars are invariant; `UnitarySatake.weylInvariants_rankZero` the zero-rank torus has no Weyl condition; `UnitarySatake.weylInvariants_monomial` a lone positive monomial is not reflection invariant; `UnitarySatake.tensorExterior_identity` the identity acts as the identity on the wedge tensor basis; `UnitarySatake.tensorExterior_scalar` the scalar exterior action cancels its dual; `UnitarySatake.tensorExterior_top` top exterior power and inverse determinant cancel; `UnitarySatake.tensorFrobenius_square` the pinned extension squares to the identity; `UnitarySatake.tensorFrobenius_zeroth` the zeroth exterior tensor has positive Frobenius sign; `UnitarySatake.tensorFrobenius_rankTwo` the rank-two diagonal tensor detects the pinned minus sign.

**Unitary minuscule triangular Satake matrix** (*unitary-triangular-transform*). For
0 ≤ δ ≤ ⌊N/2⌋ and t_δ = (1, …, 1, 0, …, 0, −1, …, −1), with δ ones, N − 2δ zeros and δ entries −1, write T_δ for its
hyperspecial double coset. Prove

```text
q^{δ(N−δ)} · tr(ρ_{N,δ}) = Σ_{i=0}^{δ} [N − 2i choose δ − i]_{−q} · S(T_i),
```

with Gaussian binomial coefficients at −q. The matrix is unitriangular and gives an integral
algorithm for all spherical calculations in Appendix B ([LTXZZ] Lemma B.2.6, p. 337).
*Needs:* *unitary-weyl-traces*, *satake-transform*; ReductiveGroupsPartII RG2.4.

`satakeTransform.unitary_triangular` states this identity over any commutative coefficient ring in which q is a unit. Its inputs identify the group by its Hermitian matrix equation, the diagonal Levi, upper radical, integral compact subgroup, valuation lattice, and characteristic double-coset functions. The normalization uses the same `SatakeDatum` and `satakeTransform` as the general theory. `UnitarySatake.gaussian` uses the integral Pascal recurrence and `UnitarySatake.tracePolynomial` is the displayed subset sum.

Checks: `UnitarySatake.gaussian_zero` choosing no vectors has coefficient one; `UnitarySatake.gaussian_excess` impossible dimensions vanish as polynomials; `UnitarySatake.gaussian_plane` evaluation at -q has the sign 1-q; `UnitarySatake.tracePolynomial_zero` the zeroth exterior power contributes one; `UnitarySatake.tracePolynomial_top` determinant and its dual cancel; `UnitarySatake.tracePolynomial_first` odd rank contributes one middle weight.

**Mixed-level spherical product counts** (*unitary-isotropic-counts*). Prove that the product I
of the two neighboring unitary lattice correspondences has coefficient at T_δ equal to the
number of maximal isotropic subspaces in a residual hermitian space of dimension N − 2δ: in even
dimension 2k this is ∏_{i=1}^{k} (q^{2i−1} + 1), and in odd dimension 2k + 1 it is
∏_{i=1}^{k} (q^{2i+1} + 1). These coefficients define its hyperspecial spherical image ([LTXZZ]
Lemma B.2.4 and proof, pp. 335–337; Lemmas B.2.7–B.2.8, pp. 338–339). *Needs:* layer SR.1;
*unitary-triangular-transform*.

`UnitaryIsotropic` is the subtype of Mathlib submodules of E^N with the specified dimension and total isotropy for `UnitaryIsotropic.form`, the q-Frobenius Hermitian form with anti-diagonal Gram matrix. `UnitaryIsotropic.even` and `UnitaryIsotropic.odd` state the two finite-field counts when #E = q².

Checks: `UnitaryIsotropic.form_hyperbolic` computes a hyperbolic pair, `UnitaryIsotropic.form_anisotropic` gives norm one on the middle line, and `UnitaryIsotropic.form_frobenius` conjugates the value when the arguments are exchanged. `UnitaryIsotropic_zero` counts the unique zero plane, `UnitaryIsotropic_plane` gives q + 1 isotropic lines in dimension two, and `UnitaryIsotropic_excess` excludes dimensions above the Witt index.

`HeckeAlgebraLevel.unitary_neighbor_product` states the mixed-level product on the actual permutation representations of the two lattice stabilizers. The neighboring stabilizer is specified by preserving the lattice with its first ⌊N/2⌋ basis vectors scaled by ϖ⁻¹. Both incidence maps are pinned on every coset basis vector; their composite has the stated isotropic-count coefficients ([LTXZZ], Definition B.2.3 and Lemma B.2.4, pp. 335–337).

**Even-rank unitary spherical identities** (*unitary-even-formulas*). For N = 2r with r ≥ 1 prove

```text
S(I)            = q^{r²} ∏_i (μ_i + 2),
S((q+1)R − I)   = −q^{r²} ∏_i (μ_i − q − q⁻¹),
S(R + (q+1)T)   = −(q^{r²+1} − q^{r²−1}) Σ_j ∏_{i≠j} (μ_i − q − q⁻¹),
```

where R is the linear combination of the T_δ with coefficient
((1 − (−q)^{r−δ})/(q+1)) ∏_{i=1}^{r−δ} (q^{2i−1} + 1); all apparent quotients are universal
polynomials ([LTXZZ] Lemmas B.3.1–B.3.4 and Proposition B.3.5, pp. 339–343). *Needs:*
*unitary-isotropic-counts*, *unitary-triangular-transform*.

`satakeTransform.unitary_even` states all three identities on the actual spherical functions, with the displayed coefficients of I, R and T. `UnitarySatake.evenCoefficient` takes monic polynomial division over ℤ, and `UnitarySatake.evenCoefficient_divisibility` states that its remainder is zero. `UnitarySatake.mu` is the sum of the two opposite lattice monomials.

Checks: `UnitarySatake.evenCoefficient_zero` even rank removes the top term; `UnitarySatake.evenCoefficient_one` the first nonzero even coefficient is -q; `UnitarySatake.evenCoefficient_divisibility` clearing q+1 is an identity over Z[q]; `UnitarySatake.mu_rankOne` rank one has both opposite lattice monomials; `UnitarySatake.mu_origin` the paired coordinate has no constant term; `UnitarySatake.mu_distinct` different pairs are distinct Laurent functions.

**Odd-rank unitary spherical identities** (*unitary-odd-formulas*). For N = 2r + 1 prove
S(I) = q^{r²+r} ∏_i (μ_i + q + q⁻¹) and S(T) = q^{r²+r} ∏_i (μ_i − 2). Here
T = Σ_δ d_{r−δ,q} T_δ and

```text
d_{k,q} = Σ_{j=0}^{k} (−1)^j (2j+1) q^{j(j+1)} [2k+1 choose k−j]_{−q}.
```

The even-rank T uses
d•_{k,q} = (d_{k,q} + (((−q)^{k+1} − 1)/(q+1)) ∏_{i=1}^{k} (q^{2i−1} + 1))/(q+1), again evaluated
as a polynomial ([LTXZZ] Notation 1.3.1, pp. 119–120; Lemmas B.4.1–B.4.2 and Proposition B.4.3,
pp. 344–346). *Needs:* *unitary-isotropic-counts*, *unitary-triangular-transform*.

`satakeTransform.unitary_odd` states both identities with `UnitarySatake.oddCoefficient` defining the universal polynomial d. The coefficient ring is arbitrary with q invertible.

Checks: `UnitarySatake.oddCoefficient_zero` the top double coset has coefficient one; `UnitarySatake.oddCoefficient_one` rank three detects the sign and the factor three; `UnitarySatake.oddCoefficient_constant` every coefficient has constant term one.

### SR.4.5 GSp_4, derived Satake and comparisons

**The GSp_4 spherical spin polynomial** (*gsp4-spin-polynomial*). For residue size q and the
spherical generators T₀ (the central scalar ϖ), T₁ (diag(ϖ², ϖ, ϖ, 1)) and T₂ (diag(ϖ, ϖ, 1, 1)),
define

```text
Q(X) = 1 − T₂ X + q(T₁ + (q² + 1)T₀) X² − q³ T₂ T₀ X³ + q⁶ T₀² X⁴.
```

The scalar generator and the similitude are retained. Prove `SpinPolynomial.constant`, Q(0) = 1;
`SpinPolynomial.coefficients`, that the degree-four coefficient is q⁶ T₀² and the degree-one
coefficient is −T₂; and `SpinPolynomial.reciprocal`, that the reciprocal monic polynomial has
coefficients 1, −T₂, q T₁ + (q³ + q)T₀, −q³ T₂ T₀, q⁶ T₀² ([Pil] §5.1.3–5.1.5, pp. 21–22).
*Needs:* *gln-generators*; ReductiveGroupsPartII RG2.5.

**Checks.** At (q,T₀,T₁,T₂) = (1,1,4,4), Q = (1 − X)⁴; at (0,1,2,3),
Q = 1 − 3X. These Lean examples fix the alternating signs and show why `reflect 4`,
rather than reversal at the actual degree, defines the monic comparison.

- `SpinPolynomial.rankFour`: at q = 2, T₀ = 1, T₁ = 2 and T₂ = 3 over ℤ, the spin polynomial is 1 − 3X + 14X² − 24X³ + 64X⁴; in particular the middle coefficient includes q³ + q.
- `SpinPolynomial.similitude`: for roots α, β, γ, δ with αδ = βγ, its top coefficient is their
  product.
- `SpinPolynomial.centralScaling`: scaling all four spin roots by c multiplies the coefficient of
  X^j by c^j.

**GSp_4 spin and monic polynomial comparison** (*gsp4-galois-comparison*). Under the q^{−3/2}
similitude twist convention, prove Q(X) = ∏_{ξ ∈ {α, β, γ, δ}} (1 − ξX), with αδ = βγ,
T₀ = q⁻³ αδ and the generator evaluations of Pilloni Lemma 5.1.5.1. The substitution T_{x,1} = T₂,
T_{x,2} = T₁, S_x = T₀ identifies the reciprocal polynomial with Calegari–Geraghty
Definition 6.7. This is a local normalization comparison, not a construction of global Galois
representations ([CG20-arXiv] Definition 6.7, p. 28; [Pil] Lemma 5.1.5.1 and Remark 5.1.5.1, p. 21). *Needs:*
*gsp4-spin-polynomial*, *spherical-parameter*.

`SpinPolynomial.factorization` pins the four factors by the generator evaluations, including q³T₀ = αδ = βγ. `SpinPolynomial.monic_comparison` records the reciprocal polynomial in the CG generator order.

**Derived Satake at Taylor–Wiles primes** (*derived-satake*). For split G, S = ℤ/ℓ^r, q ≡ 1
modulo ℓ^r and ℓ ∤ |W|, prove that derived spherical restriction gives a graded algebra
isomorphism with (S[Λ] ⊗ H*(T(k_F), S))^W, whose degree-zero map is the classical Satake
specialization. The Iwahori-to-spherical Morita comparison is restricted to the étale locus of
Spec S[Λ] over Spec S[Λ]^W ([Ven-arXiv] Theorem 3.3, p. 22 (hypotheses §3.2, p. 21);
Lemma 4.5, pp. 28–29, and Lemma 4.7, pp. 30–31).
*Needs:* *satake-isomorphism*; layer SR.1, layer SR.0.

`SmoothRep.derivedSatake_isomorphism` uses Ext in the smooth category and the exact Jacquet functor. It states injectivity, the diagonal Weyl-invariant image, cup-convolution multiplicativity, and the degree-zero radical integral on permutation-module endomorphisms. Its torus coefficient group is the finite prime-to-p quotient of the maximal compact torus, with pro-p kernel. `TorusCohomology.invariants` uses Mathlib group cohomology, with the action on both the lattice and the cohomology coefficients. `TorusCohomology.cup_cocycles` fixes the product on inhomogeneous cocycles.

Checks: `TorusCohomology.cup_scalars`, `TorusCohomology.cup_unit`, `TorusCohomology.cup_oddSquare`, and `TorusCohomology.cup_independent` test scalar multiplication, the unit, an odd square with 2 invertible, and the nonzero product from two cyclic directions in characteristic ℓ. `TorusCohomology.invariants_trivial`, `TorusCohomology.invariants_monomial`, and `TorusCohomology.invariants_orbit` test trivial actions, exclusion of a moved monomial, and transport of coefficients in an orbit sum.

`HeckeAlgebraLevel.iwahori_morita` identifies the Iwahori algebra at q = 1 with the affine semidirect group algebra. The spherical averaging idempotent becomes full at maximal ideals where the invariant lattice quotient is étale, giving the localized module-category equivalence ([Ven-arXiv], §4.3 and Lemma 4.5, pp. 27–29).

**Unitary Iwahori center comparison** (*unitary-iwahori-center*). Let F be a finite extension
of ℚ_p with p odd, E/F ramified quadratic, and G the quasi-split unitary group of odd rank
2k + 1. Use the special maximal compact subgroup K and the full chamber stabilizer B of
Clozel–Thorne §2.1; B contains the connected Iwahori subgroup with index two. Over ℂ, prove that
the comparison with the split Sp_{2k} Iwahori algebra identifies the center with ℂ[Λ]^W, and
compare its action on K-fixed vectors using the same normalized Satake convention ([CT]
Proposition 2.2, p. 7, and the Bernstein presentation following it, p. 8).
For characteristic-double-coset generators the integral quadratic relation is
(T_s + 1)(T_s − q_s) = 0; the displayed relation on p. 7 has the opposite sign convention.
Over integral coefficients use the positive braid monoid; the braid group is available after
inverting the q_s. These integral formulas do not by themselves extend the source's complex
center comparison to every coefficient ring. *Needs:* *satake-isomorphism*;
layer SR.1; ReductiveGroupsPartII RG2.1.

`HeckeAlgebraLevel.unitary_center` uses the integral matrices preserving the antidiagonal Hermitian form and the full chamber stabilizer. It gives the split symplectic Hecke comparison and the Bernstein center map. `HeckeAlgebraLevel.unitary_center_connectedIndex` specifies the index-two connected Iwahori; `HeckeAlgebraLevel.unitary_center_satake` pins the center action on the special-compact invariants by the normalized Satake integral, and `HeckeAlgebraLevel.unitary_center_rankOne` gives the characteristic-function quadratic relation.

Checks: `HeckeAlgebraLevel.unitary_center_connectedIndex` the full chamber group is strictly larger than its connected Iwahori; `HeckeAlgebraLevel.unitary_center_rankOne` the rank-three ramified reflection has q−1, with the characteristic-function sign.

**Checks.** For a simple reflection, convolution gives T_s² = (q_s − 1)T_s + q_s;
this distinguishes the characteristic-function basis from its negative. For k = 1 use the
ramified rank-three unitary group: K is special, not hyperspecial. Replacing B by its
index-two connected Iwahori requires a separate algebra comparison.

### Examples

The checks compute S([K diag(ϖ, 1) K]) = q^{1/2}(X₁ + X₂) for GL_2, the identity transform for a
torus and the identity monomial for 1_K; the Hall–Littlewood polynomials X^m, 1 and e_r; the
rank-one and rank-two paired parameters and the reciprocal T² − 3T + 1 over ℚ with no paired
ordering; the failure of even raising at (T − 1)² with q = 1 and of odd intertwining at T − 1 with
q = −1; and the four coefficients of the GSp_4 spin polynomial with their similitude and
scaling behaviour.

### Dependencies

SR.1 (the spherical Hecke algebra and its comparison with the double-coset ring) and SR.2
(parabolic induction and the modulus); SR.0d for the derived Satake statement; ModularForms
layer 2; ReductiveGroups layers 3 and 7; ReductiveGroupsPartII RG2.1, RG2.4 and RG2.5;
ClassFieldTheory layer 9.

## Layer SR.5: integral local families for GL_n

The mirabolic and derivative constructions in this layer assume n ≥ 1.

The generic integral representation theory of GL_n(F) over ℤ[1/p]-algebras, ℓ ≠ p, that families
of Galois representations are matched against. Whittaker coinvariants and the mirabolic functors
give Bernstein–Zelevinsky derivatives with their exactness and filtration; the Schwartz submodule
explains why endomorphisms of generic objects are scalars after any coefficient change.

### SR.5.1 Derivatives

**Whittaker coinvariants** (*twisted-coinvariants*). For an A-linear U-action ρ and a character
ψ : U → Aˣ, define V_{U,ψ} as V modulo the A-span of ρ(u)v − ψ(u)v. Prove
`WhittakerCoinvariants.relation`, that the image of ρ(u)v equals ψ(u) times the image of v;
`WhittakerCoinvariants.lift`, that a linear map satisfying that relation factors uniquely through
the quotient; and `WhittakerCoinvariants.tensor`, that tensoring with any coefficient module
commutes with this quotient. For the maximal unipotent subgroup of GL_n and a nondegenerate
smooth ψ, this is the top Bernstein–Zelevinsky derivative. Ordinary coinvariants are already in
Mathlib and occur when ψ = 1 ([EH] §3.1, pp. 12–15; [Hel12] §3, pp. 4–5). *Needs:* layer SR.0.

**Checks.**

- `WhittakerCoinvariants.trivialCharacter`: for ψ = 1 the quotient agrees with Mathlib's ordinary
  coinvariants.
- `WhittakerCoinvariants.trivialGroup`: for U = 1 the quotient map is an isomorphism.
- `WhittakerCoinvariants.incompatibleCharacter`: a trivial rank-one action and a ψ value with
  ψ(u) − 1 invertible have zero Whittaker quotient.

**Mirabolic functors and derivatives** (*mirabolic-derivatives*). For this target and the next
two, let k be a perfect field of characteristic ℓ ≠ p and A a Noetherian W(k)-algebra. After
extending k to k̃ containing the required p-power roots of unity, fix the smooth additive
character used by [EH]. Use their **unnormalised** functors (Definition 3.1.1 and Remark 3.1.2,
p. 12); the square-root twists of the normalised functors do not enter their descent. Let P_n = GL_{n−1} ⋉ F^{n−1} be
the mirabolic subgroup. Define Ψ⁻ by ordinary last-row coinvariants, Ψ⁺ by inflation, Φ⁻ by the
specified nontrivial last-row character quotient, Φ⁺ by compact induction (left adjoint to Φ⁻)
and Φ̂⁺ by smooth induction (right adjoint to Φ⁻); Ψ⁻ is left adjoint to Ψ⁺. Set
D^r = Ψ⁻ (Φ⁻)^{r−1} for 1 ≤ r ≤ n and D⁰ = identity. Prove `BZDerivative.zero`, that D⁰ is the
identity functor; `BZDerivative.top`, that D^n agrees with the nondegenerate Whittaker
coinvariants; and `BZDerivative.baseChange`, that every derivative commutes with arbitrary
extension to a Noetherian A-algebra B. Over W(k) without
chosen roots, descend the functors by the diagonal conjugations of EH; the chosen quotient map
need not descend ([EH] Proposition 3.1.4, pp. 13–14). Commutation of derivatives with arbitrary
A-module tensoring is also retained (the paragraph following Proposition 3.1.4, p. 14). *Needs:* *twisted-coinvariants*; layer
SR.2.


`BZDerivative.blockParabolic` is the standard two-block upper parabolic and `BZDerivative.blockProjection_left` and `BZDerivative.blockProjection_right` pin its Levi projection to the diagonal matrix blocks. `BZDerivative.blockInduction` induces the exterior tensor product without a modulus twist; `BZDerivative.induced` identifies its top derivative.

Checks:

- `BZDerivative.blockParabolic_empty`: an empty second block leaves the whole group.
- `BZDerivative.blockParabolic_borel`: two one-dimensional blocks give the upper triangular subgroup.
- `BZDerivative.blockParabolic_weyl`: the nontrivial rank-two permutation is outside the Borel.

`BZDerivative.wittFunctors_semilinear` specifies the Galois action on the character quotient by the coefficient automorphism followed by the scalar upper-left block. The descended representation is its fixed submodule; the scalar-extension quotient map itself need not descend ([EH], Proposition 3.1.4, p. 13).

**Checks.**

- `BZDerivative.rankOne`: for GL_1 the top derivative is the underlying coefficient module.
- `BZDerivative.trivialRep`: for the trivial representation of GL_n, n ≥ 2, the top derivative D^n is 0.
- `BZDerivative.induced`: over a coefficient field, for admissible Levi factors, the top derivative of their unnormalised parabolic induction is the tensor product of their top derivatives ([EH] Proposition 3.1.6, p. 15). A normalised version also holds when the required square-root character has been chosen; no such choice is needed in the stated version.
- `BZDerivative.descent`: over W(k) the functor and the composite adjunction maps descend; a natural surjection V → Φ⁻V is not part of the descended data.


`BZDerivative.WittFunctors` bundles the descended functors and adjunctions, and `BZDerivative.wittFunctors` constructs them. `BZDerivative.descent` specifies their scalar-extension comparisons and the exact adjunction sequence ([EH], Proposition 3.1.4, pp. 13–14).

Checks: `BZDerivative.wittFunctors_zero` sends the zero object to zero; `BZDerivative.wittFunctors_inflation` recovers an inflated coefficient module; `BZDerivative.wittFunctors_compactInduction` recovers the inducing module on the nontrivial character orbit.

The unnormalised functors are `BZDerivative.psiMinus`, `BZDerivative.psiPlus`, `BZDerivative.phiMinus`, `BZDerivative.phiPlus` and `BZDerivative.phiHatPlus`. `BZDerivative.projection_apply` fixes the upper-left-block projection; `BZDerivative.psiMinus_obj`, `BZDerivative.phiMinus_obj` and `BZDerivative.phiExtension_obj` specify the quotient and stabilizer actions. The generic-character hypothesis `BZDerivative.IsGenericCharacter` requires smoothness, a nontrivial character and invertible nonzero character differences. Its use over a general coefficient ring is a construction obligation, separate from the cited W(k)-algebra theorem.

Checks:

- `BZDerivative.psiMinus_inflation`: the full coefficient module survives inflation.
- `BZDerivative.psiMinus_zero`: the zero representation has zero ordinary derivative.
- `BZDerivative.psiMinus_trivial`: an arbitrary trivial coefficient module survives.
- `BZDerivative.phiMinus_inflation`: the nontrivial character kills an inflated module.
- `BZDerivative.phiMinus_zero`: the twisted derivative of zero is zero.
- `BZDerivative.phiMinus_compactInduction`: the character orbit recovers its inducing module.

**Exactness and mirabolic filtration** (*derivative-exactness*). Under the coefficient and
character hypotheses of *mirabolic-derivatives*, prove that Ψ⁻, Φ⁻, their induction partners and all
derivatives are exact. Prove the standard adjunctions, Ψ⁻ Ψ⁺ = Id and Φ⁻ Φ⁺ = Id, the mixed
vanishings, and the exact sequence 0 → Φ⁺Φ⁻ → Id → Ψ⁺Ψ⁻ → 0 in the smooth mirabolic category.
Derivatives commute with arbitrary A-module tensoring ([EH] Proposition 3.1.3, p. 12;
Proposition 3.1.4 and the subsequent tensor-compatibility paragraph, pp. 13–14). Extension of
this whole package to every commutative ring with p invertible requires a separate construction;
it is not a theorem attributed to [EH].
*Needs:* *mirabolic-derivatives*; layer SR.1.


`BZDerivative.psiAdjunction`, `BZDerivative.phiAdjunction`, `BZDerivative.psi_composition`, `BZDerivative.phi_composition`, `BZDerivative.phi_psi_vanish` and `BZDerivative.mirabolic_shortExact` specify the adjunction identities and exact sequence for the character model. `BZDerivative.functors_exact` states exactness of its five functors under `BZDerivative.IsGenericCharacter`; this is also the explicit construction obligation for the stated commutative-ring extension.

`BZDerivative.wittFunctors_exact` states exactness, the compact-adjunction unit isomorphism and the mixed vanishings for the descended functors. `BZDerivative.tensorModule` gives the arbitrary-module tensor comparison on quotient generators and intertwines the surviving GL-action ([EH], Proposition 3.1.4 and following paragraph, pp. 13–14).

**Schwartz submodule** (*schwartz-submodule*). For any smooth P_n-representation V over the
Noetherian W(k)-algebra A above (in particular, a restricted GL_n-representation), define the
Schwartz submodule J(V) as the image of the canonical mirabolic map (Φ⁺)^{n−1} Ψ⁺(V^{(n)}) into V.
Prove `SchwartzSubmodule.injective`, that the canonical mirabolic map has zero kernel;
`SchwartzSubmodule.derivative`, that J(V) has the same top derivative V^{(n)} as V; that J
commutes with coefficient-module tensoring; and `SchwartzSubmodule.endomorphisms`, that
the derivative identifies End_{P_n}(J(V)) with End_A(V^{(n)}). The injection and tensor
compatibility are constructed in [EH] §3.1, p. 14, immediately before Lemma 3.1.5; the
endomorphism identification is the adjunction calculation in the proof of Proposition 3.1.16,
p. 17 (whose stated rank-one case says this ring is A). Lemma 6.3.2, pp. 50–51 instead concerns
when J(V) generates an admissible GL_n-representation over a Noetherian local A; it is not the
source of the injection. *Needs:* *mirabolic-derivatives*,
*derivative-exactness*.

**Checks.**

- `SchwartzSubmodule.rankOne`: J(V) = V for n = 1.
- `SchwartzSubmodule.zeroDerivative`: if V^{(n)} = 0 then J(V) = 0.
- `SchwartzSubmodule.tensor`: J(M ⊗ V) = M ⊗ J(V), for an arbitrary coefficient module M.


`BZDerivative.topFunctor` performs the iterated quotient, with comparison `BZDerivative.topFunctor_restriction` to the explicit upper-unipotent relations. `BZDerivative.schwartzSource` performs the iterated compact induction. `SchwartzSubmodule` is the invariant image of `BZDerivative.schwartzMap`, whose successive maps satisfy `BZDerivative.schwartzMap_successor`.

### SR.5.2 Integral blocks, Whittaker projectives and families

**Essentially AIG representations** (*essentially-aig*). For a field κ of characteristic
different from p, define a smooth representation to be essentially AIG if its socle is
absolutely irreducible and generic (`EssentiallyAIG.socle`: the socle is absolutely simple and has
nonzero top derivative), its quotient by the socle has zero top derivative
(`EssentiallyAIG.quotient`), and it is the union of its *finite-length* subrepresentations.
In the GL_n application, generic means nonzero nondegenerate Whittaker quotient; absolutely irreducible means simple after
every field extension. The Lean predicate is relative to arbitrary subgroup/character data;
its elementary socle and direct-sum checks hold at that generality. Scalar endomorphisms are
asserted here only for GL_n with nondegenerate Whittaker data and characteristic different from p.
Prove `EssentiallyAIG.endomorphisms`: every equivariant endomorphism is
scalar ([Hel12] Definition 3.3 and Lemma 3.4, pp. 5–6; [EH] §3.2, pp. 17–24). *Needs:*
*twisted-coinvariants*; layer SR.0, layer SR.3.

**Checks.**

- `EssentiallyAIG.genericSimple`: an absolutely irreducible generic representation is essentially
  AIG.
- `EssentiallyAIG.twoGeneric`: the direct sum of two nonzero generic simple representations is not
  essentially AIG.
- `EssentiallyAIG.zero`: the zero representation is not essentially AIG.

**Checks (absolute simplicity and genericity).** The Lean examples test
`AbsolutelyIrreducible` on the trivial rank-one module (true), zero (false), and the trivial
rank-two module (false). The relative `Generic` predicate holds for the trivial line with
U = 1, fails on zero, and fails on the trivial line for any nontrivial ψ over a field.

**Integral GL_n Bernstein blocks** (*integral-blocks*). For an algebraically closed field k of
characteristic ℓ different from p, prove that the smooth W(k)[GL_n(F)] category decomposes by
mod-ℓ inertial supercuspidal support, and that each block center A_{[L,π]} is a reduced,
ℓ-torsion-free finite-type W(k)-algebra whose k-points classify the exact supercuspidal supports
of the simple representations in that block. This center specializes the existing abstract
CatCenter; it is not a new abstract center construction ([Hel16] Definition 4.12, pp. 13–14;
Theorems 11.8, 12.8–12.9 and Corollary 12.12, pp. 58, 67–69). *Needs:* layer SR.0, layer SR.3.

`IntegralBernstein.Pair` uses matrix parabolics and modular supercuspidality. `IntegralBernstein.Support` distinguishes exact support from inertial support, and `IntegralBernstein.Pair.induced` fixes the normalized induction convention. `IntegralBernstein.block_action` characterizes the block idempotent on simple residue-field objects. `IntegralBernstein.decomposition`, `IntegralBernstein.center_geometry`, and `IntegralBernstein.center_points` state the category decomposition, the three center properties, and the exact-support classification with its scalar-action equation.

Checks: `IntegralBernstein.Pair_nonzero`, `IntegralBernstein.Pair_properInduction`, and `IntegralBernstein.Pair_rankOne` distinguish supercuspidal supports. `IntegralBernstein.Support_exact`, `IntegralBernstein.Support_inertial`, and `IntegralBernstein.Support_nonconjugate` distinguish the two equivalence relations. `IntegralBernstein.Pair.induced_nonzero`, `IntegralBernstein.Pair.induced_covariance`, and `IntegralBernstein.Pair.induced_rankOne` fix the inducing representation and half modulus. `IntegralBernstein.block_nonzero`, `IntegralBernstein.block_orthogonal`, and `IntegralBernstein.block_complete` test nonzero, disjoint, and exhaustive block projections.

**Distinguished type projectives and their fibers** (*type-projectives*). For a maximal
distinguished cuspidal k-type (K, τ), prove that the compactly induced projective envelope
P_{(K,τ)} has commutative endomorphism ring E_{(K,τ)}, is E-admissible, and has top derivative
locally free of rank one over E, and that every prime fiber has absolutely irreducible generic
cosocle and essentially AIG smooth dual ([Hel12] Theorem 4.1, Proposition 4.3, Proposition 4.8 and
Corollary 4.9, pp. 6–9). *Needs:* *integral-blocks*, *mirabolic-derivatives*, *essentially-aig*;
layer SR.2.

**Universal block Whittaker projective** (*universal-whittaker*). Here F is a finite extension
of ℚ_p, n ≥ 1 (in particular n ≥ 2 is included), G = GL_n(F), and k is algebraically closed
of characteristic ℓ ≠ p. Let U be the unipotent radical of a Borel and choose a smooth
nondegenerate character ψ : U → W(k)^×. Form W = c-Ind_U^G ψ; let W_{[L,π]} be its
summand for the inertial class of a Levi L and an irreducible supercuspidal k-representation π. Prove `UniversalWhittaker.represents`: Hom_G(W_{[L,π]}, V) is naturally the top derivative
of the block part of any smooth W(k)[G]-module V, with W(k)[G]-linear Hom. In particular,
for V in that block it is V^{(n)}; no admissibility or finite-generation hypothesis on V is
needed. The locator is D. Helm [Hel12] §3, numbered property (2) after Theorem 3.1, p. 5,
restricted to the block, with [Hel16] Theorem 11.8, p. 58, for the block decomposition.
The printed property (2) is stated for W without a block restriction; the ordinary module
Hom used here requires the following product/direct-sum distinction. Since W is the direct
sum of its block summands, Hom_G(W, V) is the
product over blocks of these derivatives; it equals V^{(n)}, the corresponding direct sum, when V
lies in finitely many blocks (for instance V finitely generated), and not in general.
`UniversalWhittaker.center`, that
W_{[L,π]} is projective and admissible over its block center and End_G(W_{[L,π]}) is the integral
block center; and `UniversalWhittaker.line`, that W_{[L,π]}^{(n)} is free of rank one over that
center. `CompactInducedFunctions` in Suggested.lean records only locally constant equivariant
functions supported in U times a compact set. Its comparison with c-Ind uses U closed and
smooth vectors for the right translation action; it is not the integral-block summand.
This is the universal generic projective, not a universal arbitrary irreducible
representation ([Hel12] §3, p. 4, for projectivity; Lemma 3.2, p. 5, for the derivative
line; Theorem 5.2, p. 10, for the endomorphism ring; Proposition 5.3, pp. 10–11, for
admissibility and finite generation). These assertions use Helm's p-adic-field hypotheses;
they do not assert the positive-characteristic-local-field extension. *Needs:*
*twisted-coinvariants*, *integral-blocks*, *type-projectives*; layer SR.2.


`SmoothRep.CentralBlock` specifies a primitive central idempotent. `SmoothRep.centralImage` and `SmoothRep.blockPart` form its actual image on a smooth representation; `SmoothRep.blockCentre` is Mathlib’s idempotent corner in the categorical centre. `UniversalWhittaker.representation` is this block part of compact induction of the nondegenerate character. `UniversalWhittaker.derivativeModule_mk` and `UniversalWhittaker.representationModule_apply` pin the central actions; `UniversalWhittaker.admissible_overCentre` states centre-admissibility.

Checks:

- `SmoothRep.centralImage_zero`: the zero central operator has zero image.
- `SmoothRep.centralImage_identity`: the identity central operator has full image.
- `SmoothRep.centralImage_orthogonal`: orthogonal central idempotents give disjoint images.

`UniversalWhittaker.represents_block` uses `IntegralBernstein.block` and allows every smooth target representation. Its derivative is taken on the target's block part, and its naturality equation is induced by the actual representation morphism.

**Checks.** The function carrier has the following additional Lean examples: the zero function
belongs for every U and ψ; the constant function 1 belongs for U = G compact and ψ = 1; and
it does not belong for a nontrivial ψ. These test the carrier, independently of block projection.

- `UniversalWhittaker.nongeneric`: Hom_G(W, V) = 0 for a representation with zero top derivative.
- `UniversalWhittaker.productOfBlocks`: for GL_1 (n = 1, U = 1) W is the regular representation
  C_c^∞(F^×, W(k)) and V^{(1)} = V. Take F = ℚ_p with p odd and k = F̄_ℓ, ℓ ≠ p.
  Let V be the direct sum, over the infinitely many smooth characters χ of 1 + pℤ_p,
  of the extensions of χ to F^× trivial on μ_{p−1} and on p. Then Hom_G(W, V) is the limit of the V^K under trace maps over pro-p K, a countable
  product of copies of W(k), while V^{(1)} = V is the countable direct sum, so the unrestricted
  formula Hom_G(W, V) = V^{(n)} fails: reduction modulo ℓ gives a product versus a direct
  sum over the countable field F̄_ℓ. The same product/direct-sum distinction holds for n ≥ 2
  by taking generic simple targets from infinitely many distinct integral blocks. The Lean
  example records the analogous cardinality obstruction ℚ^ℕ ≇ ℚ^{(ℕ)}.
- `UniversalWhittaker.genericSimple`: a generic simple fiber is a nonzero quotient of the corresponding universal fiber.
- `UniversalWhittaker.baseChange`: after a center map to A, the top derivative of W ⊗ A is A.

**Co-Whittaker families** (*co-whittaker*). For a Noetherian W(k)-algebra A, define a smooth
A[GL_n(F)] representation V to be co-Whittaker if it is admissible, V^{(n)} is free of rank one
over A (`CoWhittaker.derivative`: the top derivative is isomorphic to A as an A-module), and for
every prime ideal 𝔞 the smooth dual of V ⊗_A κ(𝔞) is essentially AIG (`CoWhittaker.fibers`).
The Lean fiber predicate is defined for arbitrary commutative A and specified subgroup/character
data; the GL_n structure and Noetherian W(k)-algebra hypotheses apply to the theorems here.
Domination means a surjective equivariant map. Prove `CoWhittaker.scalars`: the natural map
A → End_{A[G]}(V) is an isomorphism. The fiber condition is not replaced by genericity at minimal
primes only ([Hel12] Definition 6.1 and Proposition 6.2, pp. 11–12). *Needs:* *essentially-aig*,
*universal-whittaker*, *schwartz-submodule*; layer SR.0.


`Representation.radical` is the intersection of the maximal proper invariant submodules; `Representation.cosocle` is its quotient. `CoWhittaker.field` retains finite length and admissibility. `CoWhittaker.scalars` retains the Noetherian Witt-algebra and p-adic-field hypotheses.

Checks:

- `Representation.radical_simple`: a simple representation has zero radical.
- `Representation.radical_zero`: the empty intersection on the zero module is its whole zero submodule.
- `Representation.radical_trivial`: a semisimple rank-two trivial representation has zero radical.

**Checks.**

- `CoWhittaker.field`: over a field a *finite-length* admissible family is co-Whittaker exactly when its cosocle is absolutely irreducible generic and its top derivative has dimension one.
- `CoWhittaker.twoCopies`: the direct sum of two nonzero co-Whittaker families fails the rank-one
  derivative condition.
- `CoWhittaker.nongeneric`: over a nonzero coefficient ring, an admissible representation with zero top derivative is not co-Whittaker.

**Checks (relative predicate).** The trivial rank-one representation with U = 1 and ψ = 1
is co-Whittaker over every commutative A; each prime fiber is a one-dimensional trivial
representation. Over the zero ring the zero module satisfies the predicate, since the derivative
is isomorphic to A and there are no prime ideals. Both are Lean examples, supplementing the
two-copy and nongeneric negative controls.

**Universal co-Whittaker domination** (*universal-domination*). For any Noetherian A and center
map A_{[L,π]} → A, prove that W_{[L,π]} ⊗ A is co-Whittaker and surjects onto every co-Whittaker
A-family with that center character, and that a co-Whittaker family has a uniquely determined
center character through its scalar endomorphisms. Domination does not assert that every quotient
is isomorphic to the universal object ([Hel12] Theorem 6.3, pp. 12–13). *Needs:* *co-whittaker*,
*universal-whittaker*, *derivative-exactness*.

`CoWhittaker.centerCharacter` states uniqueness of the scalar centre character; `UniversalWhittaker.domination` states that scalar extension of the universal projective is co-Whittaker and surjects onto every family with that character.

**Reconstruction from minimal-prime fibers** (*reduced-family-reconstruction*). Let A be a
reduced Noetherian algebra over the block center and choose nonzero generic-cosocle quotients V_𝔞
of the universal fibers at its finitely many minimal primes. Prove that the image of the diagonal
universal map in the product of the V_𝔞 is co-Whittaker, A-torsion-free and uniquely determined by
these generic fibers in the sense of Helm Lemma 6.4 ([Hel12] Lemma 6.4, p. 13). *Needs:*
*universal-domination*.

`CoWhittaker.diagonalKernel` is the intersection of the kernels of the specified specialization maps, and `CoWhittaker.diagonalImage` is the corresponding quotient of the source representation. `CoWhittaker.reconstruction` states co-Whittakerness, injectivity of regular scalar multiplication, the prescribed minimal-prime fibers, and uniqueness. It applies to any co-Whittaker source, hence to the universal block family from `UniversalWhittaker.domination` ([Hel12], Lemma 6.4, p. 13).

Checks: `CoWhittaker.diagonalKernel_zero` and `CoWhittaker.diagonalKernel_empty` give the whole source, while `CoWhittaker.diagonalKernel_separating` is zero. `CoWhittaker.diagonalImage_zero` is zero, `CoWhittaker.diagonalImage_faithful` recovers the source when the diagonal kernel vanishes, and `CoWhittaker.diagonalImage_embedding` specifies the injection into the product on each residue-field coordinate.

**Classical parameters and the generic convention** (*classical-llc-normalization*).
SR.5.2 owns `LLCFamily.weilDeligne`, the Frobenius-semisimplified Weil–Deligne
parameter of a continuous ℓ-adic representation of G_F (ℓ ≠ p), including its
monodromy and compatibility with algebraic duals: (r,N)∨ = (r∨,−Nᵗ).
It also owns `LLCFamily.classicalLLC`, the classical GL_n correspondence, and
`LLCFamily.breuilSchneider`, the generic-socle representation defined using its
segments and the |det|^{−(n−1)/2} normalization of [EH] §4.2, Definition 4.2.1,
pp. 29–30. Construct descent to characteristic-zero coefficient fields and scalar
extension, using [EH] Theorem 4.1.6, pp. 26–27, and §4.2. The Weil group and
reciprocity come from ClassFieldTheory layer 9; reciprocity sends a uniformizer
to arithmetic Frobenius. Transport any geometric-Frobenius source convention by
inversion. SR.5.1 supplies the segment representations; the classical correspondence
itself is an owned input theorem here, not a consequence of reconstruction.
For every parameter define
`LLCFamily.normalizedFiber ρ = SmoothRep.smoothDual (LLCFamily.breuilSchneider (ρ∨))`.
The algebraic Galois dual and the smooth representation dual are separate operations.
Prove its essentially AIG dual and its supercuspidal support in this normalization
([EH] Corollary 4.3.3, p. 32; [Hel12] Theorem 7.1, p. 13).

**Integral centre interpolation** (*integral-llc-centre*). SR.5.2 owns
`LLCFamily.integralCenterMap`. For a complete reduced ℓ-torsion-free Noetherian
local W(k)-algebra A with residue field k algebraically closed, and a continuous
ρ : G_F → GL_n(A), select the integral block of the residual semisimple parameter
and construct zρ : Z_block → A. Its characteristic-zero specialization is the
centre character of `LLCFamily.normalizedFiber ρ_x`, including both duals.
Prove uniqueness, independence of a framing and compatibility with local coefficient
maps. Construct this map from the universal framed parameter rings and their
Helm–Moss interpolation theorem ([HM18] Conjecture 7.1, p. 1018, Theorems 7.4–7.5,
pp. 1019–1020, Corollary 7.7, p. 1021). This target owns that theorem and its
representation-theoretic descent and gamma-factor inputs in [HM18] Theorem 1.1
and §§5–7. *Needs:* *classical-llc-normalization*, *integral-blocks*,
*universal-whittaker*.

**The local-Langlands family construction** (*llc-family-conditional*). For F p-adic,
k algebraically closed of characteristic ℓ ≠ p, A complete reduced ℓ-torsion-free
Noetherian local over W(k) with residue field k, n ≥ 1 and continuous
ρ : G_F → GL_n(A), construct `LLCFamily.pi ρ`. Base change the universal co-Whittaker
module along `LLCFamily.integralCenterMap ρ`, form its quotients
`LLCFamily.normalizedFiber ρ_𝔞` at minimal primes, and take the diagonal image.
Prove A-torsion-freeness, co-Whittakerness, the prescribed generic fibres and
uniqueness up to isomorphism ([Hel12] Theorem 7.1, p. 13, Theorem 7.8, pp. 15–16).
The construction consumes the named classical and integral interpolation theorems.
*Needs:* *classical-llc-normalization*, *integral-llc-centre*, *universal-whittaker*,
*universal-domination*, *reduced-family-reconstruction*.

**Checks.** `LLCFamily.rankOneCharacter_uniformizer` sends an unramified parameter
with arithmetic Frobenius value u to the character with uniformizer value u.
`LLCFamily.normalizedFiber_bothDuals` computes the rank-one algebraic dual as u⁻¹
and the subsequent smooth dual as u; with u = 2 either single dual gives 1/2.
`LLCFamily.rankOneCenter_genericFiber` checks that the Laurent centre coordinate X
acts by u, and by its image at each characteristic-zero minimal prime, on the same
normalized character line. `LLCFamily.rankOneCenter_minimalPrime` makes the specialization
explicit on `(SmoothRep.baseChange).obj (LLCFamily.rankOneFamily p u)`:
the central uniformizer acts by u before specialization and by its image afterward.
`LLCFamily.rankOneFamily_minimalPrime` identifies that fibre with the character line.
`LLCFamily.normalizedFiber_monodromyDual` checks N = [[0,1],[0,0]]:
N∨ = [[0,0],[−1,0]] and (N∨)∨ = N. For all n, prove `LLCFamily.normalizedFiber_dualParameter`
by comparing WD(ρ∨) with WD(ρ)∨ before applying Breuil–Schneider and then smooth
duality; this does not assert that the generic-socle correspondence commutes with
smooth duality at reducible parameters. `LLCFamily.integralCenterMap_genericFiber`
identifies the specialized centre action on each normalized fibre, and
`LLCFamily.pi_genericFiber` identifies the reconstruction with those very fibres.
Checks of the rank-one constructions: `LLCFamily.unramifiedRankOneCharacter_unit`
is one on units, `LLCFamily.unramifiedRankOneCharacter_trivial` has u = 1, and
`LLCFamily.unramifiedRankOneCharacter_uniformizer` has value u on p.
`LLCFamily.rankOneFamily_trivial` is the trivial line,
`LLCFamily.rankOneFamily_zeroRing` is zero over the zero ring, and the minimal-prime
Check gives coefficient change. The zero ring is allowed only in this algebraic line
construction, not in the local-ring family theorem with residue field k.
`LLCFamily.rankOneNormalizedFiber_trivial` gives the trivial complex line; its other
Checks are `normalizedFiber_bothDuals` and `rankOneCenter_genericFiber` above.
A = W(k) satisfies the ring hypotheses; nonzero ℓ-torsion is excluded.

### SR.5.3 Coefficient change, Ext and local blocks

**Endomorphisms after arbitrary coefficient tensoring** (*tensor-endomorphisms*). For a
co-Whittaker GL_2(ℚ_l) family V over a Noetherian ℤ_p-algebra A, p different from l, and any
A-module M, prove that End_A(M) → End_{A[G]}(M ⊗_A V) is an isomorphism. After renaming the local
residue characteristic to p and the coefficient characteristic to ℓ, the Schwartz proof extends to
GL_n with the preceding derivative package (Nakamura states the GL_2 case) ([Nak] Lemma
B.10 and proof, p. 274). *Needs:* *co-whittaker*, *schwartz-submodule*,
*derivative-exactness*.

`CoWhittaker.tensorEndomorphisms` specifies the algebra isomorphism by its action f(m) ⊗ v on pure tensors.

**Ext and exact supercuspidal support** (*ext-support-orthogonality*). For irreducible
admissible representations of GL_n or of one of its Levi subgroups over a field of
characteristic different from p, prove that nonzero Ext^i implies the same exact supercuspidal
support. In a supercuspidal block the Laurent-coordinate maximal ideals kill Ext, so distinct
unramified twists have zero Ext; inertial equivalence alone is insufficient for nonvanishing
([EH] Theorem 3.2.13 and Corollary 3.2.14, pp. 21–22). *Needs:* *integral-blocks*; layer SR.2,
layer SR.3.

`SmoothRep.IsSupercuspidal` excludes subquotients of every proper parabolic induction, and `SmoothRep.matrixParabolics` specifies actual matrix parabolics by conjugated integral weights. `SmoothRep.ext_supercuspidalSupport` and `SmoothRep.ext_distinctSupport` compare the exact inducing representations by conjugacy, using the standing square-root normalization. The subgroup equation includes GL_n and every block-diagonal Levi.

Checks: `SmoothRep.IsSupercuspidal_zero` the zero representation is not supercuspidal; `SmoothRep.IsSupercuspidal_torus` on a torus supercuspidality is irreducibility; `SmoothRep.IsSupercuspidal_induced` proper induction cannot itself be supercuspidal; `SmoothRep.matrixParabolics_self` constant weights give the whole group; `SmoothRep.matrixParabolics_rankOne` rank one has no proper matrix parabolic; `SmoothRep.matrixParabolics_borel` the upper GL₂ Borel has the positive-weight radical.

`SmoothRep.ext_character_ideals` states that the sum of the two exact-character maximal ideals annihilates Ext under the central action, including the Laurent parameter algebra.

`SmoothRep.ext_supercuspidalSupport_unnormalized` states the comparison over the original coefficient field without a square root: the two unnormalized supports differ by the modulus ratio with its integral half-difference exponent. The exponent difference is even, and the intertwining equation uses q itself.

**The distinct-eigenvalue local block** (*cg-distinct-block*). In the Calegari–Geraghty setup,
A = O/ϖ^k, q ≡ 1 modulo ℓ and the residual unramified Frobenius eigenvalues distinct, prove that
there is a unique irreducible unramified principal series π attached to the residual semisimple
parameter, and that the locally admissible category with every irreducible subquotient π is
equivalent to the direct-limit *finite-length* module category of the completed ordered-character
deformation algebra: independent pro-ℓ residual-unit cyclic variables of order d and independent
formal unramified variables X_i ([CG18-arXiv] Lemmas 9.9–9.10, p. 90, Definition 9.11, Lemma 9.12 and Corollary 9.13, p. 91). *Needs:*
*ext-support-orthogonality*; layer SR.0, layer SR.2; *spherical-parameter*.

`orderedCharacterAlgebra` uses one cyclic residual-unit coordinate and one formal unramified variable for each ordered character. `finiteLengthIndCategory` consists of modules whose cyclic submodules have finite length. `SmoothRep.distinctEigenvalueBlock` tests local admissibility and every simple subquotient. `SmoothRep.distinctEigenvalue_equivalence` states the residual principal-series simplicity and the category equivalence over the specified valuation-ring quotient.

Checks: `orderedCharacterAlgebra_cyclic` each residual-unit generator has the prescribed order relation; `orderedCharacterAlgebra_unramified` different ordered characters retain independent formal parameters; `orderedCharacterAlgebra_empty` no characters leaves exactly the coefficient ring; `finiteLengthIndCategory_finite` every finite-length module is an object; `finiteLengthIndCategory_directSum` arbitrary sums are allowed although total length can be infinite; `finiteLengthIndCategory_regular` the unrestricted regular power-series module is excluded; `SmoothRep.distinctEigenvalueBlock_simple` the defining admissible simple lies in its block; `SmoothRep.distinctEigenvalueBlock_excludes` a different simple cannot enter the category; `SmoothRep.distinctEigenvalueBlock_subquotient` the condition sees subquotients, including nonsplit extensions.

**Derived hyperspecial–parahoric comparison** (*cg-derived-projector*). In that distinct
residual-eigenvalue block, prove that the projection e_α to a chosen simple Frobenius root
induces an isomorphism from hyperspecial invariants to the distinguished line-parahoric
invariants, and an isomorphism on all their right derived functors. The projector is the
stabilized Q(V)^{(n!)} construction of CG, with Q isolating the chosen residual root; the result
is specific to this local block ([CG18-arXiv] Lemma 9.14, Remark 9.15 and Theorem 9.16, p. 92, with proof on p. 93). *Needs:* *cg-distinct-block*; layer SR.1.

`factorialProjector` is pinned by eventual equality with factorial powers. `SmoothRep.distinctEigenvalue_derived` applies it to the polynomial in the actual parahoric double-coset operator, and identifies hyperspecial Ext with its image in every degree. The comparison is restriction followed by the projector.

Checks: `factorialProjector_zero` a zero operator selects no summand; `factorialProjector_identity` the identity selects the whole module; `factorialProjector_nilpotent` the generalized zero eigenspace is killed, not retained.

**Characteristic-zero highest-derivative adapter** (*highest-derivative-adapter*). For the
characteristic-zero GL_n multisegment convention used by Atobe–Kondo–Yasuda, prove that the
highest nonzero normalized derivative is irreducible and is obtained by the corresponding
endpoint shortening. Their iterated highest-derivative notation is distinguished from the
fixed-order D^r functors above. The local-conductor and newvector application is outside this
roadmap ([AKY] §1.2, p. 3, and §2.3, pp. 8–9;
Lemma 2.9 and its proof, p. 14, specify endpoint shortening after the Zelevinsky involution). *Needs:* *mirabolic-derivatives*; layer
SR.3.

`Zelevinsky.Segment` records a unitary supercuspidal line and its real endpoints. `Zelevinsky.segmentRepresentation` and `Zelevinsky.multisegmentRepresentation` use the irreducible-subrepresentation convention, characterized by their ordered normalized inductions. `Zelevinsky.normalizedProduct`, `Zelevinsky.parabolicProduct`, and `Zelevinsky.normCharacter` specify those inductions and determinant powers. `Zelevinsky.normalizedDerivative` uses the existing mirabolic quotient and its determinant normalization. `Zelevinsky.highestDerivative` identifies the highest nonzero derivative with `Zelevinsky.shorten`; `Zelevinsky.highestDerivative_iterated` recomputes the highest order after each shortening.

Checks: `Zelevinsky.normCharacter_zero` exponent zero gives the trivial twist; `Zelevinsky.normCharacter_add` real exponents add under twisting; `Zelevinsky.normCharacter_uniformizer` the norm at a uniformizer is q inverse; `Zelevinsky.normalizedProduct_zero` a zero inducing factor kills the product; `Zelevinsky.normalizedProduct_empty` the rank-zero trivial line is a unit; `Zelevinsky.normalizedProduct_covariance` the two determinant half powers have opposite signs; `Zelevinsky.parabolicProduct_empty` the empty product has rank zero and dimension one; `Zelevinsky.parabolicProduct_singleton` one factor retains its group action; `Zelevinsky.parabolicProduct_zero` any zero factor makes the ordered product zero; `Zelevinsky.Segment_degree` the cuspidal block cannot have rank zero; `Zelevinsky.Segment_nonzero` a zero representation cannot label a segment; `Zelevinsky.Segment_unitary` nonunitary powers are recorded in the endpoint, not hidden in the cuspidal label; `Zelevinsky.segmentRepresentation_singleton` a one-term segment is its cuspidal twist; `Zelevinsky.segmentRepresentation_lengthTwo` ascending [a,a+1] gives the determinant character, distinguishing it from Steinberg; `Zelevinsky.segmentRepresentation_nongeneric` a segment with more than one term has zero top derivative; `Zelevinsky.multisegmentRepresentation_empty` the empty multisegment is the rank-zero line; `Zelevinsky.multisegmentRepresentation_singleton` one segment recovers the segment representation; `Zelevinsky.multisegmentRepresentation_permutation` the multisegment is unordered, although its defining induction is ordered; `Zelevinsky.shorten_empty` the empty multisegment stays empty; `Zelevinsky.shorten_singletons` all one-term segments disappear; `Zelevinsky.shorten_endpoint` the lower endpoint stays fixed and the upper endpoint decreases; `Zelevinsky.normalizedDerivative_zero` order zero preserves the original action; `Zelevinsky.normalizedDerivative_rankOne` the full derivative of a character is the rank-zero line; `Zelevinsky.normalizedDerivative_trivial` the top derivative of a higher-rank trivial representation vanishes.

`Zelevinsky.langlandsSegment` and `Zelevinsky.langlandsRepresentation` specify the quotient convention. `Zelevinsky.involution_characterization` sends Z(m) to L(m), and `Zelevinsky.multisegmentRepresentation_classification` pins this on all irreducibles. `Zelevinsky.highestDerivative_involution` gives the shortening formula after converting a Langlands label to the Z convention.

Checks: `Zelevinsky.langlandsSegment_singleton` agrees with Z on cuspidal singletons, `Zelevinsky.langlandsSegment_generic` gives the generic derivative line, and `Zelevinsky.langlandsSegment_distinct` separates longer segments from Z. `Zelevinsky.langlandsRepresentation_empty`, `Zelevinsky.langlandsRepresentation_singleton`, and `Zelevinsky.langlandsRepresentation_permutation` fix the empty, single, and unordered conventions. `Zelevinsky.involution_cuspidal`, `Zelevinsky.involution_involutive`, and `Zelevinsky.involution_segment` test fixed cuspidals, the square of the involution, and a changed longer segment.

### Examples

The checks follow GL_1, where the top derivative is the coefficient module and J(V) = V, through
GL_n, where the trivial representation has vanishing top derivative and vanishing Schwartz
submodule, the top derivative of a normalized parabolic induction is the tensor product of those
of the Levi factors, and a direct sum of two generic simples or of two co-Whittaker families fails
the rank-one conditions.

### Dependencies

SR.0 (the smooth category, admissibility and the centre), SR.1 (Hecke corners, for the
distinct-eigenvalue block), SR.2 (induction, Jacquet functors and coinvariants), SR.3 (finite
length, cuspidal support and the Bernstein centre) and SR.4 (*spherical-parameter*).

## Layer SR.6: finite-wild parameters, center images and stability

The algebraic parameters are crossed cocycles of a finite-wild discrete Weil group.
Their invariant quotient is finite over the twisted Frobenius quotient, through wild strata,
tame tori and twisted components. Center images and stable module operators supply independent
representation-theoretic interfaces. The geometric action and its integral representation-theoretic
applications are outside this layer.

### SR.6.1 Finite-wild parameters

**Crossed cocycles and gauge action** (*crossed-cocycles*). For a group Γ acting on H by α,
define a crossed cocycle as a map c with c(γδ) = c(γ) α(γ)(c(δ)), and gauge conjugation by h as
(h.c)(γ) = h c(γ) α(γ)(h)⁻¹. Prove `CrossedCocycle.one`, c(1) = 1; `CrossedCocycle.gauge`, that
gauge conjugation preserves the crossed cocycle relation and is an H-action; and
`CrossedCocycle.map`, that an equivariant homomorphism H → H' maps crossed cocycles to crossed
cocycles and commutes with gauge conjugation. The associated section γ ↦ (c(γ), γ) is a
homomorphism into H ⋊ Γ ([DHKM2] §1.2, pp. 4–6; §2.1, p. 10). *Needs:* ReductiveGroupsPartII
RG2.5.

**Checks.** For Γ = ℤ acting on ℚˣ by inversion at the generator, gauge conjugation
of the identity cocycle by 2 has generator value 4. The Lean example fixes the inverse
and the side of the action in h α(γ)(h)⁻¹.

- `CrossedCocycle.trivialAction`: for trivial α, cocycles are group homomorphisms.
- `CrossedCocycle.identityCocycle`: when the target group is trivial, every crossed cocycle equals the identity cocycle.
- `CrossedCocycle.coboundary`: for Γ = ℤ acting on ℚˣ by inversion at the generator, gauge transforming the identity by 2 gives value 4 at the generator.

**Checks (functoriality).** `CrossedCocycle.gauge_one`, `gauge_mul`, `map_id`, `map_comp`
and `map_gauge` state the identity, composition and equivariance laws. The matching Lean
examples test gauge by 1, successive gauges h and k giving the single gauge hk, the identity
coefficient map, the trivial coefficient homomorphism giving the identity cocycle, and
equivariance of a coefficient map under gauge. Gauging successively by h⁻¹ and h returns the
identity cocycle; a cocycle with trivial target is the identity. Together with the inversion
action giving 4 from the gauge element 2, these distinguish the action convention from its inverse.

**Checks (parameter section and inversion).** `CrossedCocycle.toSection` is the homomorphism
γ ↦ (c(γ),γ) into Mathlib's `SemidirectProduct`. Its projection is γ, the identity cocycle
gives `SemidirectProduct.inr`, and gauging by h conjugates the section by `inl h`.
All three are Lean examples. For Γ = ℤ with trivial action on ℚˣ, a section whose generator
value is (2,1) has inverse (1/2,−1). With inversion action on ℚˣ, that inverse is instead
(2,−1). Both pairs are computed in Lean on the actual semidirect-product parameter.
For arithmetic Fr the geometric parameter is the inverse of c(Fr)⋊Fr, including the
action on its first coordinate; this uses `SemidirectProduct.inv_left` and `inv_right`.

**Finite-wild Weil discretization** (*finite-wild-discretization*). Choose an arithmetic
Frobenius Fr and a compatible tame generator s, with Fr s Fr⁻¹ = s^q. Define W_F⁰ as the preimage
of ℤ[1/q] ⋊ Fr^ℤ inside W_F. Fix an open subgroup P_F^e of P_F, normal in W_F
and contained in the kernel of the specified action on Ĥ. For this subgroup,
prove that W_F⁰/P_F^e is finitely presented. Its topology keeps the wild subgroup profinite and
the tame–Frobenius quotient discrete ([DHKM2] §1.2, pp. 4–6; §2.1, p. 10). *Needs:*
ClassFieldTheory layer 9; *crossed-cocycles*.

`WeilDiscretization.subgroup` is generated by wild inertia, Fr and s inside the pinned `TauCetiRoadmap.ClassFieldTheory.WeilGroup`. `WeilDiscretization.Generators` specifies arithmetic degree one, a topological tame generator and the q-power conjugation relation modulo wild inertia. `WeilDiscretization` retains the profinite topology on each wild-inertia coset; `WeilDiscretization.isOpen_iff` characterizes that topology. `WeilDiscretization.finitePresentation` states finite presentation after quotienting by an open normal subgroup of wild inertia. `WeilDiscretization.inclusion` is continuous and has dense image under the generator hypotheses.

Checks on the topological carrier: `WeilDiscretization_wildCoset` gives open wild cosets, `WeilDiscretization_finiteWild` gives discreteness for finite wild inertia, and `WeilDiscretization_frobeniusOrder` preserves infinite Frobenius order modulo wild inertia.

Checks: `WeilDiscretization.subgroup_identity` leaves only wild inertia, `WeilDiscretization.subgroup_frobenius` contains a degree-one element outside wild inertia, and `WeilDiscretization.subgroup_tameRoot` includes inverse-Frobenius conjugates of s. `WeilDiscretization.wild_open`, `WeilDiscretization.wild_nondiscrete` and `WeilDiscretization.wild_quotient` distinguish the open profinite wild subgroup from the discrete tame–Frobenius quotient. `WeilDiscretization.Generators_identity` rejects identity Frobenius, `WeilDiscretization.Generators_inverse` rejects geometric Frobenius, and `WeilDiscretization.Generators_relation` fixes the q-power relation in the wild quotient. `WeilDiscretization.inclusion_injective` preserves distinct group elements, `WeilDiscretization.inclusion_frobenius` preserves arithmetic degree one, and `WeilDiscretization.inclusion_dense` gives dense image.

**One integral finite-wild cocycle scheme** (*finite-wild-representability*). For the pinned
split dual group Ĥ over R = ℤ[1/p], use `TauCeti.AffineGroupSchemeCat (CommRingCat.of R)`:
its underlying group object lies in `Over (Spec R)`, so its multiplication, inverse,
identity and Weil automorphisms are morphisms over the base. The action is a homomorphism
from a finite quotient of W_F to automorphisms of that group object. Set Γ = W_F⁰/P_F^e
with P_F^e in the action kernel. On an R-algebra B the cocycle functor is
`CrossedCocycle` for the induced action on Ĥ(B); on f : B →ₐ[R] C it uses Ĥ(f).
Naturality of the Weil action makes Ĥ(f) equivariant, and `CrossedCocycle.map_id` and
`map_comp` give functoriality. Prove representability by an affine object X of
`Over (Spec R)`, through an isomorphism of functors natural in B, with X of finite
presentation over R. The construction is the closed relation locus in Ĥ^r for a finite
presentation of Γ. Construct this scheme once over ℤ[1/p]; its
ℤ_ℓ models are base changes, not independent schemes. The expected fiber dimension is dim(Ĥ over
the base), while the total dimension over ℤ[1/p] includes the base dimension ([DHKM2] §1.2 and
§2.1–2.2, pp. 4–6 and 10–11). *Needs:* *crossed-cocycles*, *finite-wild-discretization*;
ReductiveGroups layer 9.

`CocycleScheme.coordinateRing` is a commutative algebra characterized by the natural equivalence `CocycleScheme.points` with crossed cocycles on the convolution points of a coordinate Hopf algebra. `CocycleScheme.pointAction_apply` fixes the contravariant action, and `CocycleScheme.points_natural` fixes scalar functoriality. `CocycleScheme.evaluation_apply` characterizes evaluation on every coefficient algebra. `CocycleScheme.finitePresentation` applies to a finitely presented source group, while `CocycleScheme.weil_geometry` supplies finite presentation, flatness and the fiber dimension for the actual finite-wild quotient. `CocycleScheme.baseChange` identifies its scalar extension on the evaluation generators. The associated affine scheme is Spec of this algebra.

`CocycleScheme.invariants` tests gauge invariance over every coefficient algebra. `CocycleScheme.twistedInvariants` does the same for the Frobenius component, and `CocycleScheme.quotientEvaluation_apply` pins the map between the invariant quotients.

Checks: `CocycleScheme.pointAction_identity` the identity coordinate action is the identity on every point. `CocycleScheme.pointAction_trivial` trivial Hopf automorphisms give trivial point action. `CocycleScheme.pointAction_inverse` the coordinate inverse is necessary for the left action convention. `CocycleScheme.coordinateRing_cyclic` an infinite cyclic source gives the underlying group scheme. `CocycleScheme.coordinateRing_trivialSource` a trivial source gives the base scheme. `CocycleScheme.coordinateRing_trivialTarget` a trivial target gives the base scheme. `CocycleScheme.points_identity` the identity cocycle evaluates every group element at the group identity. `CocycleScheme.points_cyclic` the value at a cyclic generator can be any group point. `CocycleScheme.points_separated` evaluation at all group elements distinguishes coordinate maps. `CocycleScheme.evaluation_identity` evaluation at the group identity is the counit. `CocycleScheme.evaluation_cocycle` two evaluations multiply with the prescribed action. `CocycleScheme.evaluation_inverse` inverse evaluation includes the inverse group action. `CocycleScheme.invariants_scalar` base scalars are gauge invariant. `CocycleScheme.invariants_trivialSource` the one-point cocycle scheme has no nonconstant gauge orbits. `CocycleScheme.invariants_cyclic` cyclic gauge invariants are twisted conjugation invariants. `CocycleScheme.twistedInvariants_scalar` constants are invariant on every twisted component. `CocycleScheme.twistedInvariants_commutative` ordinary conjugation of a commutative group is trivial. `CocycleScheme.twistedInvariants_coboundary` twisting forces constancy along nontrivial coboundaries. `CocycleScheme.quotientEvaluation_scalar` Frobenius evaluation preserves coefficient scalars. `CocycleScheme.quotientEvaluation_identity` evaluation at identity factors through the counit. `CocycleScheme.quotientEvaluation_cyclic` on a cyclic source evaluation gives the full invariant quotient.

**ℓ-adic cocycle extension and changes of discretization** (*ell-adic-extension*). After base
change to ℤ_ℓ, ℓ ≠ p, prove that the universal finite-wild cocycle extends continuously to
W_F/P_F^e in the relative discrete ℓ-adic sense of DHKM. Changes of tame generator and Frobenius
give canonical ℓ-adic functor comparisons; the integral discretized schemes are not thereby
identified over ℤ[1/p] ([DHKM2] Theorem 4.1(ii) and Corollary 4.2, pp. 29–30). *Needs:*
*finite-wild-representability*.

`CocycleScheme.IsAdicallyContinuous` is the relative continuity condition: scalar extension from a Noetherian ℓ-adically separated algebra whose congruence kernels are open. `CocycleScheme.adic_extension` gives the unique extension with the prescribed wild kernel. `CocycleScheme.adic_comparison` gives coefficient-natural equivalences for two choices of discretization through their common continuous Weil cocycles.

Checks: `CocycleScheme.IsAdicallyContinuous_discrete` treats a discrete source, `CocycleScheme.IsAdicallyContinuous_scalarChange` allows scalar extension even when ℓ becomes invertible, and `CocycleScheme.IsAdicallyContinuous_nonopen` rejects a nonopen congruence kernel.

### SR.6.2 Finiteness of the invariant quotient

**Finite wild strata and reductive centralizers** (*wild-strata*). Let Ĥ be a split reductive
group scheme over ℤ[1/p], with W_F acting by group-scheme automorphisms through a finite quotient.
Fix an open subgroup P_F^e of wild inertia, normal in W_F and acting trivially on Ĥ.
After base change to R = Z̄[1/p], where Z̄ is the integral closure of ℤ in a fixed algebraic
closure of ℚ, the cocycles of the finite p-group P_F/P_F^e have finitely many orbit schemes.
Choose one R-valued representative φ in each orbit. Its centralizer C_Ĥ(φ) is smooth,
with split reductive neutral component and constant component group. For the strata extending
to W_F⁰/P_F^e, choose the finite collection of extensions φ̃ supplied by DHKM; their images
normalize a Borel pair of C_Ĥ(φ)⁰. Multiplication by φ̃ identifies the corresponding tame
cocycle schemes with open-and-closed pieces of the fixed-wild fiber; inducing by the stabilizer
in C_Ĥ(φ) gives the decomposition of the full scheme. Finiteness here concerns fixed e,
not all wild depths simultaneously ([DHKM2] Propositions 1.1–1.2, pp. 5–6;
[DHKM1] proof of Theorem 2.3, Step 1, pp. 6–7).
*Needs:* *finite-wild-representability*; ReductiveGroups layer 7.

`WildStrata.centralizerIdeal_points` characterizes the scheme stabilizer on every coefficient algebra. `WildStrata.finite_orbits` specifies orthogonal idempotents and faithfully flat orbit maps. `WildStrata.centralizer_geometry` gives the smooth stabilizer and its split reductive neutral component; `WildStrata.centralizer_components` records the constant finite component group through idempotents and their comultiplication.

Checks: `WildStrata.centralizerIdeal_trivial` gives the whole group for the trivial cocycle and action; `WildStrata.centralizerIdeal_source` removes the equations for a trivial wild source; `WildStrata.centralizerIdeal_excludes` rejects a point failing a single stabilizer equation.

**Twisted reductive-component quotient finiteness** (*twisted-component-finiteness*).
Let N ≥ 1, R = Z̄[1/N], Ĝ a reductive group scheme over R, θ an R-automorphism of finite
order, Ĥ a closed reductive R-subgroup and g ∈ Ĝ(R). Assume Int(g)θ preserves Ĥ.
Prove that (Ĥg⋊θ)//Ĥ → (Ĝ⋊θ)//Ĝ is a finite R-morphism, where // denotes the affine
invariant quotient. All inclusions and automorphisms are over Spec R; no arbitrary map of
underlying point sets is used. No pinning-preservation hypothesis on θ is required
([DHKM1] Lemma 2.2, p. 5; Lemma 2.1, p. 5).
*Needs:* ReductiveGroups layer 7; *wild-strata*.

`CocycleScheme.twistedComponent_finite` states finiteness through the induced homomorphism of invariant coordinate algebras. The surjective coordinate Hopf map specifies the closed subgroup, and the pointwise equation for Int(g)θ specifies its action. The pullback is characterized by x ↦ i(x)g over every coefficient algebra.

**Tame torus isogeny engine** (*tame-torus-engine*). Let R = Z̄[1/N] with p dividing N,
and let Ĥ be a reductive R-group with a tame finite-quotient W_F-action preserving a Borel
pair (B,T). Write s for a generator of I_F⁰/P_F, Fr for arithmetic Frobenius and
Ω = N_Ĥ(T)/T. Let N_T^s be the inverse image of Ω^s, and put
N_s = {n ∈ N_T^s : n s^q(n)⁻¹ ∈ T^{s,0}}, where T^{s,0} is the maximal subtorus of T^s.
The closed R-subscheme
A_s = {(t,n) ∈ T^{s,0} × N_s : n Fr(t)n⁻¹ t^{−q} = s^q(n)n⁻¹}
is finite over N_s. The equation describes a fiber of the relative torus isogeny
(t,n) ↦ (n Fr(t)n⁻¹ t^{−q},n). Prove that A_s reaches every geometric point of the
tame invariant quotient. The normalizer condition and the finite action are essential
([DHKM1] Lemmas 2.7–2.9, pp. 7–8). *Needs:* *wild-strata*,
*twisted-component-finiteness*.

`TameTorus.normalizerIdeal` defines the scheme normalizer by conjugation over every coefficient algebra. `TameTorus.fixedTorusIdeal_characterization` specifies the maximal fixed split subtorus; it does not replace the fixed subgroup by its full, possibly disconnected kernel. `TameTorus.normalizerLocusIdeal_points` and `TameTorus.equationIdeal_points` give the equations for N_s and A_s. `TameTorus.fixedTorusIdeal_isogeny` states finite faithful flatness of the relative isogeny with its two coordinates, `TameTorus.equationIdeal_finite` pins the finite projection by the second tensor inclusion, and `TameTorus.equationIdeal_quotient` gives a representative above every geometric quotient point.

Checks: `TameTorus.normalizerIdeal_whole`, `TameTorus.normalizerIdeal_commutative`, and `TameTorus.normalizerIdeal_excludes` test the whole group, a commutative group, and a point moving the torus. `TameTorus.fixedTorusIdeal_identity`, `TameTorus.fixedTorusIdeal_inversion`, and `TameTorus.fixedTorusIdeal_subtorus` distinguish the fixed subtorus from torsion in the fixed subgroup. `TameTorus.normalizerLocusIdeal_identity`, `TameTorus.normalizerLocusIdeal_untwisted`, and `TameTorus.normalizerLocusIdeal_excludes` test both normalizer equations. `TameTorus.equationIdeal_identity`, `TameTorus.equationIdeal_split`, and `TameTorus.equationIdeal_one` test t=1, the (q−1)-power kernel, and failure of finiteness when q=1.

**Finite Frobenius evaluation on cocycle quotients** (*frobenius-quotient-finite*). Prove that
the Frobenius evaluation Z¹(W_F⁰/P_F^e, Ĥ)//Ĥ → (Ĥ ⋊ Fr)//Ĥ to the twisted Frobenius component is
finite over ℤ[1/p], and that after restriction to a Weil-stable closed reductive subgroup the
induced cocycle quotient map is also finite ([DHKM1] Theorem 1.7 and Corollary 1.8, p. 4;
Theorem 2.3 and Corollaries 2.4–2.5, pp. 6–10). *Needs:* *finite-wild-representability*,
*tame-torus-engine*.

`CocycleScheme.frobenius_finite` makes the cocycle invariant algebra a finite module over the twisted-component invariant algebra via evaluation at arithmetic Frobenius. `CocycleScheme.subgroup_finite` states the closed reductive subgroup comparison, with the pullback pinned on every evaluation function. Both use the actual discretized Weil quotient and a finite-image continuous Weil action.

### SR.6.3 The excursion algebra and its coefficient functions

**Finite-wild excursion algebra** (*excursion-algebra*). For primes ℓ ≠ p, a split reductive ℤ_ℓ-group Ĥ and a W_F-action through a
specified finite quotient Q, choose P_F^e acting trivially on Ĥ and put W = W_F⁰/P_F^e.
Define Exc(W, Ĥ) as
the colimit, over free-group maps F_n → W, of the invariant coordinate rings O(Z¹(F_n, Ĥ))^Ĥ. Its
generators can be expressed by excursion tuples: a finite set I, a representation V of the
group scheme (Ĥ ⋊ Q)^I, diagonal-Ĥ-invariant creation and annihilation maps α
and β, and γ ∈ W^I. Define `ExcursionDatum.matrixCoefficient`, the coefficient function
β(ρ(h_i)_i α(1)), and prove `ExcursionDatum.diagonalInvariant`, that simultaneous diagonal
Ĥ-conjugation does not change the coefficient, and `ExcursionDatum.tensorProduct`, that tensoring
excursion representations multiplies their coefficient functions. Functorial pullback, product
and concatenation impose the excursion relations ([FS] Definition VIII.3.4, Proposition VIII.3.7
and Definition VIII.4.2, pp. 287–290 and 292–294). *Needs:* *crossed-cocycles*,
*finite-wild-representability*.

`ExcursionAlgebra.algebra` is characterized as the colimit by `ExcursionAlgebra.algebra_universal`. Its `ExcursionAlgebra.generator_words` relations include all word substitutions; the generator maps preserve products and sums. `ExcursionAlgebra.comparison_generator` pins evaluation on the actual cocycle scheme through `CocycleScheme.invariantPullback_coordinates`.

Checks: `CocycleScheme.invariantPullback_identity` the identity word substitution fixes every invariant; `CocycleScheme.invariantPullback_composition` successive word substitutions agree with their composite; `CocycleScheme.invariantPullback_scalar` restriction preserves the coefficient, including nonunits; `ExcursionAlgebra.algebra_trivialSource` the trivial group contributes only scalar excursions; `ExcursionAlgebra.algebra_trivialTarget` the identity group scheme contributes only scalars; `ExcursionAlgebra.algebra_free` a finite free source already supplies its full invariant ring; `ExcursionAlgebra.generator_product` multiplication of coefficient functions is multiplication of excursions; `ExcursionAlgebra.generator_scalar` a scalar coefficient is independent of the tuple; `ExcursionAlgebra.generator_concatenation` products can be represented on the concatenated tuple; `ExcursionAlgebra.comparison_scalar` comparison preserves the scalar excursion; `ExcursionAlgebra.comparison_cyclic` a cyclic source recovers the twisted component quotient; `ExcursionAlgebra.comparison_freeRankTwo` a free pair retains simultaneous, rather than separate, conjugacy invariants.

**Checks.**

- `ExcursionDatum.unit`: for the trivial one-dimensional representation with identity creation
  and annihilation, the coefficient is one.
- `ExcursionDatum.zeroAnnihilation`: if β is zero, the coefficient is zero.
- `ExcursionDatum.singleton`: for one index, creation and annihilation through invariant vectors
  give a constant coefficient function. For the empty index set the value is also β(α), as in
  the Lean empty-index example.

**Excursion and cocycle quotient comparison** (*excursion-invariant-comparison*).
Fix primes ℓ ≠ p, a split reductive ℤ_ℓ-group Ĥ with a W_F-action through a finite quotient,
and an open normal subgroup P of wild inertia acting trivially on Ĥ. Choose the finitely
generated dense discrete subgroup W ⊂ W_F/P used to define the cocycle scheme. The natural
map Exc(W,Ĥ) → O(Z¹(W,Ĥ))^Ĥ induces a universal homeomorphism of affine schemes and
becomes an isomorphism after inverting ℓ. Its kernel is nilpotent ℓ-power torsion; this does
not assert that its cokernel is a nilpotent ideal. If ℓ does not divide the order of
π₁(Ĥ)_tors, the map is an isomorphism integrally ([FS] §VIII.3.2, Definition VIII.3.4
and Theorem VIII.3.6, pp. 287–288). Separately, over R = Z̄[1/N] with p dividing N,
for a W_F-stable closed reductive subgroup Ĥ′ ⊂ Ĥ, the map
Exc(W_F⁰/P_F^e,Ĥ)_red → Exc(W_F⁰/P_F^e,Ĥ′)_red is finite. This last result uses no
good-ℓ assumption ([DHKM1] Corollary 2.6, p. 6).
*Needs:* *excursion-algebra*, *frobenius-quotient-finite*.

`ExcursionAlgebra.weil_comparison` states the homeomorphism after every affine base change, the nilpotent ℓ-power-torsion kernel, and the generic-fiber isomorphism. `ExcursionAlgebra.weil_integral` uses the algebraic fundamental group of the geometric generic fiber for the good-prime condition. `ExcursionAlgebra.reduced_subgroup_finite` gives the separate reduced-algebra finiteness statement over Z̄[1/N], pinned on the free-group generators.

### SR.6.4 Finiteness over the centre

**Z-finite smooth representations** (*z-finite*). For a Noetherian coefficient ring R, let Z_V be
the image of the smooth categorical center in End_{R[G]}(V). In Lean,
`SmoothCentre.image R G V` is the subalgebra of underlying R-linear endomorphisms consisting
exactly of `(z.app V).hom.hom.toLinearMap` for z in `CatCenter (SmoothRep R G)`. Thus all its
elements are equivariant; `SmoothCentre.image_commute` records commutativity. Define V to be Z-finite if Z_V is a finite-type
R-algebra and V^K is finite over Z_V for every compact open K (`SmoothCentre.invariants` gives the usual fixed-vector carrier with the action of this
specific image algebra, and `ZFinite` asserts finite generation over it). The image is used, rather than the full
possibly infinitely generated center. For G = 𝐆(F), R Noetherian and p invertible in R, prove `ZFinite.subquotient`:
Z-finiteness passes to subquotients ([DHKM1] Lemma 3.1, p. 9). The predicate itself
is defined for every commutative R and topological group G. *Needs:* layer
SR.0.

**Checks.**

- `ZFinite.zero`: the zero representation is Z-finite.
- `ZFinite.scalarFinite`: an admissible family with scalar center image and finite-type scalar
  image is Z-finite.
- `ZFinite.infiniteDirectSum`: the countable direct sum of the trivial ℚ-representation of
  the trivial group is not Z-finite.

**Checks (center image).** Lean examples identify image membership with evaluation of an actual
categorical central element, show that the image on zero is the zero ring, and show that on the
trivial ℚ-representation of the trivial group it is all of End_ℚ(ℚ). The invariant carrier
agrees with Mathlib's `Representation.invariants`, is zero on the zero object, and is the
whole module for a trivial action. The three direct `ZFinite` examples are the zero object,
the trivial rank-one object, and failure for ℚ^{(ℕ)} with trivial group. In the last case
naturality with the inclusions of rank-one summands forces the center image to be scalar.

**Depth projective generators and center criteria** (*depth-generators*). Prove that a
bounded-depth smooth block over p-invertible coefficients has a finitely generated projective
generator built from compact pro-p induction, and that Z-finiteness of all finitely generated
objects is equivalent to the corresponding Hecke corners being finite over a finite-type center.
The depth splitting and these generators are the integral Dat inputs; the compact-open corner
comparison is supplied by SR.1 ([DHKM1] Lemma 3.2, pp. 9–10; the depth splitting and its
generators are [Dat09]'s, as cited there). *Needs:* *z-finite*; layer SR.1, layer SR.2.

`SmoothRep.depthPart` is the subrepresentation generated by the Moy–Prasad r-plus fixed vectors. `SmoothRep.depth_generator` supplies its central idempotent and a finitely generated projective separator obtained from compact pro-p induction. `SmoothRep.zFinite_iff_corners` states the finite-center criterion.

Checks: `SmoothRep.depthPart_zero` vanishes on zero; `SmoothRep.depthPart_trivial` contains the whole trivial representation; `SmoothRep.depthPart_vanishing` vanishes when every r-plus invariant module vanishes.

**Torsion-free projective cuspidal embeddings** (*cuspidal-embedding*). Fix ℓ ≠ p and a square
root of q in Q̄_ℓ, and put R = ℤ_ℓ[√q]. Prove that a finitely generated projective smooth
R[G]-representation embeds into a finite direct sum of normalized parabolic inductions of finitely generated ℓ-torsion-free
cuspidal Levi modules. This is proved by characteristic-zero *cuspidal-support* theory and stable
lattices; no integral classification of supercuspidals is used ([DHKM1] Lemma 3.4, p. 10).
*Needs:* *depth-generators*; layer SR.2, layer SR.3, layer SR.2a.

`SmoothRep.cuspidal_embedding` states the embedding over the actual subalgebra ℤ_ℓ[√q] of an algebraic closure of ℚ_ℓ. Each Levi is a `BruhatTits.Building.LeviDatum`; the comparison with its rational parabolic preserves its inclusion in G. The target modules are finitely generated, cuspidal, and ℓ-torsion-free, and the map into the finite direct sum is explicitly injective.

### SR.6.5 Stable module operators

**Stable contracting Hecke operators** (*stable-operator*). For a module M and an endomorphism T,
define stability: there exist c ≥ 1 and a T-invariant direct summand I such that
M = ker(T^c) ⊕ I and T restricts to an automorphism of I (`StableOperator.split`: M is the direct
sum of ker(T^c) and a T-invertible submodule for some positive c). Prove
`StableOperator.invertiblePart`, that the stable image identifies with the localization M[T⁻¹],
and `StableOperator.dual`, that stability passes to the injective-cogenerator dual with the
adjoint operator. For a decomposed compact open K and a strictly P-positive central element λ,
use the convolution operator T_λ of 1_{KλK} on V^K; the invertible summand maps canonically to the
Levi compact-open Jacquet invariants ([DHKM1] §4, definition preceding Lemma 4.5 and Remarks
4.6–4.7, pp. 13–14; [Hel16] Definition 11.9, p. 58). *Needs:* layer SR.1, layer SR.2.


`StableOperator.localization` is Mathlib’s module direct limit of the powers of T. `StableOperator.invertiblePart` identifies the stable image with that colimit through its canonical map. `StableOperator.adjoint` acts by precomposition, and `StableOperator.dual` proves stability for Hom into any coefficient module.

Checks:

- `StableOperator.localization_nilpotent`: inverting a nilpotent operator gives zero.
- `StableOperator.localization_identity`: the identity gives the original module.
- `StableOperator.localization_mixed`: only the invertible summand survives.

`RationalParabolic.jacquet_localization` identifies the direct limit for the contracting Hecke operator with the actual Jacquet invariants, and identifies its degree-zero map with the Jacquet projection ([Ber87], §5.1–5.3, pp. 19–23).

**Checks.**

- `StableOperator.nilpotent`: a nilpotent T is stable with invertible part zero.
- `StableOperator.automorphism`: an invertible T is stable with nilpotent part zero.
- `StableOperator.mixed`: on M₁ ⊕ M₂ with T nilpotent on M₁ and invertible on M₂, the stable
  invertible part is M₂.

### Examples

The checks are the crossed cocycles of a trivial action (group homomorphisms), the identity
cocycle and its gauge conjugates h α(γ)(h)⁻¹; the excursion coefficients of the trivial
representation, of a zero annihilation map and of a single index; the zero representation, a
scalar-center admissible family and an infinite direct sum of the trivial representation for
Z-finiteness; and nilpotent, invertible and mixed operators for stability.

### Dependencies

SR.0–SR.3, SR.2a and SR.4; Tau Ceti's `TauCeti.AffineGroupSchemeCat` and Mathlib's
`Representation.tprod`; ReductiveGroups layers 7 and 9; ReductiveGroupsPartII RG2.5;
ClassFieldTheory layer 9; LocalFieldsRamification layer 4 through the Tau Ceti Iwasawa
presentation. The layer is used by nothing earlier.

## Downstream consumers

The v-stack and enhanced-sheaf roadmaps build the ∞-categorical enhancement of the derived smooth
category and its comparison with étale sheaves on the classifying stack on the dg model of SR.0d.
The parameter constructions in SR.6 supply the integral finite-wild cocycle scheme and the
free-group excursion algebra. Geometric Hecke actions and spectral actions require the additional
geometry of [FS] Chapters VI–IX; this roadmap exports no such action. GeometricSatakeAndFusion compares the
geometric Satake equivalence against the trace contract of SR.4, whose normalised Satake data are
those of *satake-isomorphism*. The roadmaps for two-parahoric unitary operators, for the Iwahori
and Klingen computations for GSp_4 with their Galois applications, for the GL_2 newvector theorem
and for the minimal-lift line of integral families consume the spherical products, the spin
polynomial and co-Whittaker families of SR.4–SR.5, and the
families of Galois representations of the modularity-lifting roadmaps are matched against the
integral local families of SR.5.

## References

Locators use the printed page numbers of the following editions.

- [BH06] C. J. Bushnell and G. Henniart, *The Local Langlands Conjecture for GL(2)*,
  Grundlehren der mathematischen Wissenschaften 335, Springer, 2006. Paragraph numbers
  identify statements as in the book (for example, “2.8 Proposition”).

- [Ber92] J. Bernstein, *Representations of p-adic groups*, Harvard lectures 1992, written by K. Rumelhart, [author copy](https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/Bernst_Lecture_p-adic_repr.pdf).
- [Ber87] J. Bernstein, *Second adjointness for representations of reductive p-adic groups*, 1987 manuscript, [author copy](https://www.math.tau.ac.il/~bernstei/Unpublished_texts/unpublished_texts/Bernstein87-second-adj-from-chicago.pdf).
- [BD84] J. Bernstein and P. Deligne, *Le « centre » de Bernstein*, in Représentations des groupes réductifs sur un corps local, Hermann 1984, 1–32, [scan](https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/Bern_Center.pdf).
- [BZ76] I. Bernstein and A. Zelevinsky, *Representations of the group GL(n, F)*, Russian Math. Surveys 31:3 (1976), 1–68, [copy](https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/B-Zel-RepsGL-Usp.pdf).
- [BZ77] I. Bernstein and A. Zelevinsky, *Induced representations of reductive p-adic groups I*, Ann. Sci. ENS 10 (1977), 441–472, [Numdam](http://archive.numdam.org/article/ASENS_1977_4_10_4_441_0.pdf).
- [Cas95] W. Casselman, *Introduction to the theory of admissible representations of p-adic reductive groups*, draft of 1995, [author copy](https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf).
- [Cas80] W. Casselman, *The unramified principal series of p-adic groups I*, Compositio Math. 40 (1980), 387–406, [Numdam](http://archive.numdam.org/article/CM_1980__40_3_387_0.pdf).
- [Bor76] A. Borel, *Admissible representations of a semi-simple group over a local field with vectors fixed under an Iwahori subgroup*, Invent. Math. 35 (1976), 233–259, [GDZ](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0035/LOG_0029.pdf).
- [IM65] N. Iwahori and H. Matsumoto, *On some Bruhat decomposition and the structure of the Hecke rings of p-adic Chevalley groups*, Publ. IHÉS 25 (1965), 5–48, [Numdam](http://archive.numdam.org/article/PMIHES_1965__25__5_0.pdf).
- [HKP] T. Haines, R. Kottwitz and A. Prasad, *Iwahori–Hecke algebras*, [arXiv:math/0309168](https://arxiv.org/pdf/math/0309168).
- [Lus89] G. Lusztig, *Affine Hecke algebras and their graded version*, J. AMS 2 (1989), 599–635, [AMS](https://www.ams.org/journals/jams/1989-02-03/S0894-0347-1989-0991016-9/S0894-0347-1989-0991016-9.pdf).
- [Dat09] J.-F. Dat, *Finitude pour les représentations lisses de groupes p-adiques*, [arXiv:math/0607405](https://arxiv.org/pdf/math/0607405).
- [BK15] R. Bezrukavnikov and D. Kazhdan, *Geometry of second adjointness for p-adic groups*, [arXiv:1112.6340v4](https://arxiv.org/pdf/1112.6340v4).
- [Kon03] T. Konno, *A note on the Langlands classification and irreducibility of induced representations of p-adic groups*, Kyushu J. Math. 57 (2003), 383–409, [J-STAGE](https://www.jstage.jst.go.jp/article/kyushujm/57/2/57_2_383/_pdf).
- [FS] L. Fargues and P. Scholze, *Geometrization of the local Langlands correspondence*, [arXiv:2102.13459v4](https://arxiv.org/pdf/2102.13459v4).
- [TV] D. Treumann and A. Venkatesh, *Functoriality, Smith theory, and the Brauer homomorphism*, Ann. of Math. 183 (2016), [published](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p04-p.pdf); [TVpre] [arXiv:1407.2346v1](https://arxiv.org/pdf/1407.2346v1), whose §§7.8–7.9 are not in the published version.
- [Ven-arXiv] A. Venkatesh, *Derived Hecke algebra and cohomology of arithmetic groups*, [arXiv:1608.07234v3](https://arxiv.org/pdf/1608.07234v3).
- [He18] X. He, *Cocenters of p-adic groups I*, Forum Math. Pi 6 (2018), [doi](https://doi.org/10.1017/fmp.2018.1).
- [ACC] P. Allen et al., *Potential automorphy over CM fields*, Ann. of Math. 197 (2023), [author copy](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
- [BCGP] G. Boxer, F. Calegari, T. Gee and V. Pilloni, *Abelian surfaces over totally real fields are potentially modular*, [arXiv:1812.09269v3](https://arxiv.org/pdf/1812.09269v3).
- [Pil] V. Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weight*, Duke Math. J. 169 (2020), [author copy](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).
- [CG18] F. Calegari and D. Geraghty, *Modularity lifting beyond the Taylor–Wiles method*, Invent. Math. 211 (2018), [author copy](https://math.uchicago.edu/~fcale/papers/CG.pdf); [CG18-arXiv] [arXiv:1207.4224v2](https://arxiv.org/pdf/1207.4224v2), whose §9.2.1 is the published §9.4.1.
- [CG20] F. Calegari and D. Geraghty, *Minimal modularity lifting for nonregular symplectic representations*, Duke Math. J. 169 (2020), [author copy](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf); [CG20-arXiv] [arXiv:1907.08691v1](https://arxiv.org/pdf/1907.08691v1).
- [CT] L. Clozel and J. Thorne, *Level-raising and symmetric power functoriality III*, Duke Mathematical Journal 166 (2017), [author manuscript](https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf).
- [Stacks] *The Stacks project*, [stacks.math.columbia.edu](https://stacks.math.columbia.edu).
- [Les] S. Leslie, *The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods*, [arXiv:1911.07907v3](https://arxiv.org/pdf/1911.07907v3).
- [LTXZZ] Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*, Invent. Math. 228 (2022), 107–375, [published](https://par.nsf.gov/servlets/purl/10323568).
- [Hel12] D. Helm, *Whittaker models and the integral Bernstein center for GL_n*, [arXiv:1210.1789v1](https://arxiv.org/pdf/1210.1789v1).
- [Ros14] S. Rostami, *The Bernstein presentation for general connected reductive groups*, [arXiv:1312.7374v3](https://arxiv.org/html/1312.7374v3), §§2.5–2.9, 3.2.
- [HM18] D. Helm and G. Moss, *Converse theorems and the local Langlands correspondence in families*, Invent. Math. 214 (2018), 999–1022, [published](https://link.springer.com/content/pdf/10.1007/s00222-018-0816-y.pdf).
- [Hel16] D. Helm, *The Bernstein center of the category of smooth W(k)[GL_n(F)]-modules*, [arXiv:1201.1874v3](https://arxiv.org/pdf/1201.1874v3).
- [EH] M. Emerton and D. Helm, *The local Langlands correspondence for GL_n in families*, [arXiv:1104.0321v1](https://arxiv.org/pdf/1104.0321v1).
- [Nak] K. Nakamura, *Zeta morphisms for rank two universal deformations*, Invent. Math. 234 (2023), [published](https://link.springer.com/content/pdf/10.1007/s00222-023-01203-7.pdf).
- [AKY] H. Atobe, S. Kondo and S. Yasuda, *Local newforms for the general linear groups over a non-archimedean local field*, [arXiv:2110.09070v4](https://arxiv.org/pdf/2110.09070v4).
- [DHKM1] J.-F. Dat, D. Helm, R. Kurinczuk and G. Moss, *Finiteness for Hecke algebras of p-adic groups*, [arXiv:2203.04929v2](https://arxiv.org/pdf/2203.04929v2).
- [DHKM2] J.-F. Dat, D. Helm, R. Kurinczuk and G. Moss, *Moduli of Langlands parameters*, [arXiv:2009.06708v3](https://arxiv.org/pdf/2009.06708v3).

