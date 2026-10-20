# C*-algebras, operator spaces, and approximation

Develop the structure and representation theory of C*-algebras, completely positive
and completely bounded maps, operator-space tensor products, and finite-dimensional
approximation. The principal depth targets are Stinespring and Wittstock theory,
the tensorial and bidual characterizations of nuclearity, nuclearity versus Banach
amenability, exactness, the Choi–Effros lifting theorem, Kirchberg's WEP/LLP
characterizations, and Voiculescu's representation theorem for quasidiagonality.
Each includes the constructions and elementary APIs that make it usable.

## Conventions, dependencies, and ownership

Algebras are complex and complete. Use Mathlib's `NonUnitalCStarAlgebra` and
`CStarAlgebra`, `NonUnitalStarAlgHom` and `StarAlgHom`, closed
`NonUnitalStarSubalgebra` and `StarSubalgebra`, and `TwoSidedIdeal`. A C*-subalgebra
is norm closed; a two-sided ideal is norm closed whenever a C*-quotient is used.
Unit-preserving maps are stated explicitly. Nonunital representations are
nondegenerate when the closed span of π(A)H is H; their essential-subspace
reduction is part of the API. General results use nets, with separability or
countability imposed only where specified.

Use the existing continuous functional calculus, `IsStarProjection`, spectral
order, positive square roots, and C*-unitization `Unitization ℂ A`. The latter
carries its C*-norm, distinct from the ℓ¹ norm on a general Banach-algebra
unitization. Inner products are conjugate-linear in the first variable;
`ω_ξ(a)=⟪ξ,π(a)ξ⟫`. Algebra multiplication on operators is composition, with
the rightmost operator acting first. Matrix levels use
[`CStarMatrix`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/CStarAlgebra/CStarMatrix.html),
including its rectangular operator norms and square matrix order. An entrywise
sup norm on ordinary `Matrix` is not the norm in complete boundedness.

Use [BanachSpaceTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/8ec510e27a71a361532c18ad8b42b512958199ca/TauCetiRoadmap/BanachSpaceTheory/README.md#b1-duality-and-weak-topologies) B1–B2 for duality,
weak compactness and separation, B4 for completed Banach tensors, and
[BanachAlgebras](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4ca3e99e0e27255fdcf8aea71e4e9aef052a3d77/TauCetiRoadmap/BanachAlgebras/README.md#a1-constructions-ideals-and-the-radical) A1–A2 for quotients and holomorphic
calculus, A4 for factorization and Arens products, and A6 for Banach amenability
and virtual diagonals. Prove compatibility with these constructions, including
the equality of the holomorphic and continuous calculi on their common domain.
Identify the Banach and C*-unitizations by a bounded algebra isomorphism,
proving equivalence of their norms for the amenability transfer.

[VonNeumannAlgebras](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a94eaf89e2d9d74266066a5c929bd7f1afb61198/TauCetiRoadmap/VonNeumannAlgebras/README.md#v0-c-algebra-and-state-prerequisites) owns positive functionals,
GNS, state separation and faithful representations (V0), operator topologies,
bicommutants and Kaplansky density (V1), support projections and Hilbert/spatial
tensors (V2), and preduals and normal representations (V4). Its V13a owns the
shared CP-map and operator-system order foundations, Tomiyama's theorem,
Arveson extension and the projection/extension definition of injectivity;
V13b owns injectivity versus semidiscreteness and consumes C5's minimal
tensor construction. Consume those
specific developments. C3–C4 add operator spaces, dilation and CB-map theory;
C6 uses the injectivity/semidiscreteness equivalence for arbitrary W*-algebras,
including biduals without separable predual or a faithful normal state,
without requiring the
factor-classification conclusions of V13. The normal virtual diagonal
construction uses V5's center-valued trace and Dixmier averaging and V10–V11's
standard form for arbitrary von Neumann algebras, including its conjugation
between M and M′. Build missing interfaces in the
owning development and expose them for both roadmaps.

[OperatorTheory](../OperatorTheory/README.md) supplies Hilbert-space geometry,
adjoints, compact operators, polar decomposition and spectral theory. Hilbert
C*-modules and Morita equivalence belong to HilbertModules; group C*-algebras,
crossed products, and equilibrium states belong to OperatorAlgebraDynamics;
K/KK-theory and classification belong to OperatorKTheory and CStarClassification.
Here finite-dimensional algebras and their inductive limits are examples and
approximation tools. C9 owns the AF-embedding/subquotient machinery needed
for exactness; classification by dimension groups or K-theory has separate
ownership.
Free products with prescribed states or expectations belong to FreeProbability.

**CStar.WStarJordanBoundary.** V12.J of VonNeumannAlgebras owns normal
Jordan/projection-logic and full-normal-state
reconstruction for W*-algebras, including the typeI₂ exception for extending
a bare projection map and the enriched theorem retaining that part. Use
V12.J.Maps' native-linear-map API only in that later W*-algebra application;
projection logic alone does not choose associative orientation. C2's
pure-state/irreducible-GNS theorem remains an earlier input to QF2, has no
V12.J dependency, and does not classify arbitrary C*-algebra operational models.

All new objects need extensionality, coercion, equality and transport lemmas;
maps need identity, composition, restriction, range and factorization APIs.
Topological wrappers must preserve the existing norm topology on underlying
algebras. The README is definitive; [Suggested.lean](Suggested.lean) records
representative interfaces rather than an exhaustive list.

## C1. Ideals, hereditary subalgebras, and multipliers

On C[0,1], prove the maximal ideal at0 is `{f:f(0)=0}` and is the
closure of xC[0,1], where x(t)=t. Prove sqrt(x) belongs to the maximal
ideal but not to xC[0,1], using the unbounded quotient1/sqrt(t).
Compare with multiplication by x and its C*-functional calculus;
the character's kernel is the closed principal ideal, not necessarily
the algebraic principal ideal. For a genuinely nonunital C*-algebra A,
identify its C*-unitization isometrically with `{λI+L_a:λ∈ℂ,a∈A}`
inside the native Banach operators `A →L[ℂ] A`. Use
`ContinuousLinearMap.mul` and the native `Unitization` C*-norm for the
isometry. First consume native `ContinuousLinearMap.opNorm_mul_apply`
and `CStarRing.instRegularNormedAlgebra` for ‖L_a‖=‖a‖,
including a=0. Consume native `ContinuousLinearMap.opNorm_mul_flip_apply`
for the equal right-multiplication norm. The native proofs use the C*-identity and testing at scalar
multiples of a*. Prove |λ|≤‖λI+L_a‖ for nonunital A:
otherwise I−(λI+L_a)/λ=−L_a/λ is invertible by Neumann series.
An invertible L_a gives e=L_a⁻¹(a) with ex=x for all x; a left
unit and its adjoint force a two-sided unit, a contradiction. The native
splitMul norm max(|λ|,‖λI+L_a‖) then equals the displayed operator
norm. Prove the image is closed by this isometry and completeness,
with transported star algebra. Consume native `Unitization.starLift`
for the universal extension of a nonunital *-homomorphism to a unital
C*-algebra, (λ,a)↦λ1+f(a). For a↦L_a into the transported
star algebra above, prove its starLift is precisely
(λ,a)↦λI+L_a by the native uniqueness property. This construction uses no Hilbert-module supplier.
For already-unital A, the image is L(A) and the external unitization map
has kernel {(λ,−λ1_A)}; state its quotient comparison separately.
For the zero algebra the external unitization is ℂ while the left-action
image is zero, so this representation is not faithful. Give these branch
maps, closedness and universal properties on their actual carriers.

For a complete commutative complex C*-algebra with a chosen unit, consume the native `gelfandTransform_isometry`, `gelfandTransform_bijective` and `gelfandStarTransform` under `[CommCStarAlgebra A]`, giving the isometric star-algebra isomorphism `A≃C(characterSpace ℂ A,ℂ)`. No separability or nonzero-algebra hypothesis is required for that equivalence. Own the nonunital restriction adapter on `[NonUnitalCommCStarAlgebra A]`: use the native C*-norm on `U=Unitization ℂ A`, its scalar augmentation `ε=Unitization.fstHom`, viewed as a nonzero continuous character, and compact Hausdorff character space `K=characterSpace ℂ U`. Prove that the isometric inclusion identifies A with `ker ε`, and that U's unital Gelfand transform identifies this ideal with `{F∈C(K,ℂ):F(ε)=0}`. For the open locally compact Hausdorff subspace `X=K∖{ε}`, prove restriction is an isometric star-algebra isomorphism from that vanishing-at-ε ideal onto `C₀(X,ℂ)`, with inverse extension by zero at ε. Own the vanishing-at-infinity, continuity-at-ε, inverse and norm equalities, so the result is onto C₀, not merely an embedding into bounded functions.

Include A=0, when K is the singleton augmentation and X is empty. If A already has a unit but is treated through its nonunital carrier, the external unitization adds an isolated augmentation; X is compact and the result agrees with its native unital Gelfand model, using `C₀(X)=C(X)` for compact X. This adapter uses the native unital theorem, C*-unitization and compact-Hausdorff restriction/zero-extension. BanachAlgebras A3's extension/restriction character comparison can then identify X with A's nonzero continuous character space; its later isolated-augmentation criterion is not an input to this adapter. General Gelfand–Naimark faithful representations remain in VonNeumannAlgebras V0.

Develop closed ideal lattices, closure, sums and intersections, annihilators,
ideal generation and quotient C*-algebras. Prove closed two-sided ideals are
complex linear and self-adjoint; give their induced nonunital C*-structures,
quotient order and quotient C*-norm, surjective-map correspondence and the
isomorphism theorems. Prove *-homomorphisms have closed range, are contractive,
and are isometric exactly when injective. Include positive contractive lifts
of positive contractions in a quotient, CFC membership in ideals and hereditary
subalgebras, and spectral permanence for C*-subalgebras with the appropriate
unitization. Adopt `cfcₙ` for functions vanishing at zero.

Specialize BanachAlgebras A1's ideal annihilators to closed ideals of
C*-algebras, adding self-adjointness and left/right agreement.
For a closed two-sided ideal I, construct the closed self-adjoint two-sided
ideal `Ann(I)={a∈A:∀x∈I, ax=0}` and prove it equals
`{a∈A:∀x∈I, xa=0}`. Prove that Ann reverses inclusion,
`I∩Ann(I)=0`, and `I⊆Ann(Ann(I))`. Prove Ann(I) is the largest closed
two-sided ideal J with `JI=0`, meaning `ji=0` for all j∈J and i∈I.
Define I to be essential when `I∩J≠0` for every nonzero closed two-sided
ideal J, and prove this is equivalent to `Ann(I)=0`. C2.AnnHull consumes
this annihilator ideal and supplies its primitive-space comparisons.

Use native `TwoSidedIdeal A` and its existing ideal/module conversions.
For unital A, identify Ann(I) with
`(Module.annihilator A I).toTwoSided`, using the left multiplication
module on I and the native two-sided instance for
[Module.annihilator](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Ideal/Maps.lean#L866-L878).
For nonunital A and closed I, use C1's complex linearity of I to construct
the `Unitization ℂ A`-module action as a definition taking the closedness
hypothesis, rather than a global instance for arbitrary ring ideals, by
`(z,a)•x=z•x+ax`; identify Ann(I) with the preimage in A of
`(Module.annihilator (Unitization ℂ A) I).toTwoSided` under
`Unitization.inrNonUnitalAlgHom ℂ A`, using `TwoSidedIdeal.comap`.
Prove both comparisons by their membership formulas and transport the
closedness, complex linearity and star invariance to these native carriers;
no parallel ideal type is introduced.

For a closed *-subalgebra B⊆A, heredity means `0≤a≤b` and b∈B imply a∈B.
Construct the hereditary algebra generated by a positive a as `closure(aAa)`.
Prove the order-preserving correspondences between hereditary subalgebras B,
closed left ideals L, and closed hereditary cones: `L↦L∩L*`,
`B↦{x:x*x∈B}`, and B↦B₊. Identify the latter left ideal with AB using
Cohen–Hewitt factorization. Writing I for the closed ideal generated by B, give the
closed-ideal correspondence `J↦J∩B` and `K↦closure(span(AKA))` between ideals
of I and ideals of B. Distinguish full positive elements (generating A as an
ideal) from strictly positive elements (generating A as a hereditary algebra).

Use Mathlib's `CStarAlgebra.approximateUnit` and
`Filter.IsIncreasingApproximateUnit`. Supply subnet/convexification, transport,
ideal, hereditary-subalgebra and representation lemmas. For each closed ideal
I⊆A construct a positive contractive approximate unit e_λ in I with
`‖e_λa-ae_λ‖→0` for every a∈A. Prove a C*-algebra has a countable approximate
unit iff it has a strictly positive element. For h≥0, relate strict positivity
to `closure(hAh)=A`, to positivity on every nonzero positive functional, and
to the sequence `h(h+1/n)⁻¹` in the unitization being an approximate unit
(n≥1). Prove every separable C*-algebra is σ-unital; do not assume the converse.

Construct the Pedersen ideal as the smallest dense two-sided ideal, generated
by positive functional-calculus elements whose functions vanish near zero.
Prove density, heredity, positive generation, minimality, quotient functoriality,
and `Ped(B)⊆Ped(A)∩B` for C*-subalgebras. Identify it with finite-rank operators
for K(H), with compactly supported continuous functions for C₀(X), and with A
for unital A. Keep this algebraic ideal distinct from its norm closure.

Extend Mathlib's
[`DoubleCentralizer`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/CStarAlgebra/Multiplier.html#DoubleCentralizer)
model `𝓜(ℂ,A)` of M(A). Prove A is an essential ideal of M(A), and its universal
property among essential ideal extensions. Construct the strict topology by
the seminorms `m↦‖ma‖+‖am‖`, a∈A, prove Hausdorffness, completeness on bounded
sets, strict density of A, and continuity of multiplication on bounded sets and
of star. A nondegenerate *-homomorphism A→M(B) extends uniquely to a unital
strictly continuous map M(A)→M(B); formulate continuity on bounded sets and
its equivalence with strict continuity for these maps. Include composition,
nondegenerate representations and the concrete idealizer description. Compute
M(C₀(X))=C_b(X) and M(K(H))=B(H), and identify the corresponding strict
topologies on bounded sets (uniform convergence on compact subsets, and
strong-star convergence, respectively).

## C2. Irreducible representations, primitive ideals, and the bidual

Consume VonNeumannAlgebras V0’s separable faithful representation on ℓ²
and its unital/nonunital/zero-algebra cases; it owns that construction.

For a unital closed star subalgebra B⊆A with the same unit, prove every
state on B extends to a state on A, with exact restriction and norm one.
Construct a norm-preserving Hahn–Banach extension and prove positivity
from its value at the unit. An arbitrary extension need not be pure or
multiplicative; for B⊆B(H), it need not be normal. Prove every pure state has a pure extension:
its extensions form a nonempty weak-* compact face, whose extreme
points are extreme in the state space of A. Include functorial restriction and existence
for concrete inclusions B⊆B(H).

Extend V0's representation API with cyclic/irreducible representations,
intertwiners, unitary equivalence, direct sums, restriction to ideals and
nondegenerate extension from ideals. A pure state is an extreme point of the
state space. An irreducible representation is nonzero and has no closed
invariant subspaces other than 0 and H. Prove it is nondegenerate. For a nonzero nondegenerate representation,
prove equivalence of irreducibility with scalar commutant. Keep the zero
Hilbert-space case separate: its zero representation is nondegenerate and
has scalar commutant, but is not irreducible under the stated nonzero convention.
Prove pure state iff irreducible GNS representation and norm detection
by irreducible representations. Establish
Kadison transitivity: for an irreducible π on H, T∈B(H), and a
finite-dimensional subspace E⊆H, there is a∈A with `‖a‖≤‖T‖` and
`π(a)ξ=Tξ` for every ξ∈E; if T is self-adjoint, a can be chosen
self-adjoint. Include the interpolation lemmas and
bounded approximation argument needed for the exact conclusion. Obtain
the exact norm bound from the ε-bound by enlarging E to E+T(E) in the
self-adjoint case, interpolating the compression there, and clipping the
interpolant by continuous functional calculus. Handle general T by the
self-adjoint 2×2 block operator and take its off-diagonal corner.

Identify the kernels of nonzero irreducible representations with the
algebraic primitive ideals of BanachAlgebras A1. Use Kadison transitivity
to prove algebraic irreducibility of these Hilbert modules and the
maximal-modular-left-ideal/pure-state construction for the converse
kernel identification. Use A1's hull-kernel topology on Prim(A), with
`hull(J)={P:J⊆P}`. Prove every closed ideal is
an intersection of primitive ideals. Also prove every closed left ideal J
is the intersection of the left kernels `{a : ω(a*a)=0}` of pure states
whose left kernels contain J: for a∉J construct such a pure state with
ω(a*a)>0. Establish the supported pure-state/maximal-left-ideal separation
argument, including the nonunital unitization restriction. Use this in
HilbertModules H7's point-separation theorem.
Prove the lattice correspondence between
closed ideals and open subsets. Identify Prim(A/I) with hull(I) and Prim(I)
with its open complement. Prove T₀ and local quasi-compactness; for unital A
prove quasi-compactness, and for separable A prove second countability and
that closed prime ideals are primitive. No Hausdorffness is assumed.

**C2.AnnHull — annihilators and open supports.** For a closed two-sided
ideal I put `U_I=Prim(A)∖hull(I)` and prove that its elements are exactly
the kernels of nonzero irreducible π with `π(I)≠0`. Represent these kernels
by closed members of native `TwoSidedIdeal A`. Prove
`Ann(I)=⨅_(P∈U_I)P` and `hull(Ann(I))=closure(U_I)`, with the meet in
`TwoSidedIdeal A`; its underlying set is the intersection, which remains
closed, and the empty meet is A. Include I=0, I=A and A=0 explicitly.
For irreducible π with π(I)≠0, `closure(span π(I)H)` is a nonzero closed
invariant subspace, hence H, so aI=0 forces π(a)=0. Conversely, if π(a)=0
whenever π(I)≠0, then π(ai)=0 for every irreducible π and i∈I, so ai=0
by C2's norm detection by irreducible representations. Ann(I) is C1's
annihilator ideal; this argument uses its left-annihilator membership,
not the left/right comparison. Identify A1's hull-kernel closure operator,
on this native two-sided-ideal representation of Prim(A), with the formula
`closure(S)=hull(⨅_(P∈S)P)` for every
`S⊆Prim(A)`, and apply it to U_I. Deduce that I is essential iff
`Ann(I)=0` iff U_I is dense, and prove
`U_(Ann(I))=interior(hull(I))`. These targets have no unitality,
separability, type-I or Hausdorff hypothesis.

For a∈A prove lower semicontinuity of `P↦‖a+P‖`, quasi-compactness of
`{P:‖a+P‖≥ε}` for every ε>0, and continuity when Prim(A) is Hausdorff. Identify
the commutative primitive space with the Gelfand spectrum. Prove
Dauns–Hofmann as `Z(M(A))≅C_b(Prim(A))`, characterized by
`za+P=f(P)(a+P)`; this supplies the central action, not only a bijection of sets.

Construct the universal representation as the sum of all state GNS
representations. Identify its bicommutant with the Banach bidual A**, with
predual A*. Prove the two Arens products agree here, the canonical embedding
is isometric and preserves star, multiplication is separately weak-star
continuous, and this makes A** a W*-algebra. Every nondegenerate representation
π extends uniquely to a normal surjective *-homomorphism A**→π(A)'', whose
kernel is a central summand. For a closed ideal I identify
`A**≅I**⊕(A/I)**` as W*-algebras, with the induced inclusions and quotient maps.

Define an open projection p∈A** by an increasing net of positive elements of
A converging weak-star to p. Identify hereditary subalgebras with open
projections by `B=A∩pA**p` and `p=sup e_λ`, and closed ideals with the central
open projections. Prove B** identifies with pA**p. For a≥0 identify its support
with the support of `closure(aAa)`; strictly positive means full support in
this correspondence. Identify M(A) with the idealizer of A in A** and relate
this realization to nondegenerate representations: bounded strict convergence
implies strong-star convergence in every such representation, including
the universal representation.

## C3. Operator spaces and completely bounded maps

An abstract operator space is a complex vector space with matrix norms
satisfying Ruan's axioms: `‖x⊕y‖=max(‖x‖,‖y‖)` and
`‖αxβ‖≤‖α‖‖x‖‖β‖` for scalar matrices. Include rectangular levels and the
zero-level convention. Prove compatibility of level one with the underlying
normed space, reindexing, matrix amplification, completions, subspaces and
quotients. Prove Ruan's representation theorem as a complete isometry into
B(H), with closed image for complete spaces. Reuse V13a's matrix-order
and CP-extension APIs. Construct abstract Archimedean matrix-ordered
*-vector spaces with a matrix order unit, their order-unit matrix norms,
and their Choi–Effros realization as concrete operator systems by
matrix-state separation. Construct the Paulsen block operator system
associated to an abstract operator space and prove its matrix-order
axioms; use its representation to prove Ruan's theorem.

For a linear map u set `u_n([x_ij])=[u(x_ij)]` and define
`‖u‖cb=sup_n‖u_n‖` on the maps for which this supremum is finite. Develop the
normed space CB(E,F), complete when F is complete, together with complete
contractions, complete isometries, complete quotient maps, composition norm
bounds and matrix amplification. Keep incomplete operator spaces in the
construction; for E=ℂ the evaluation isometry CB(ℂ,F)≅F records this
completeness boundary. Put the
operator-space structure on CB(E,F) by `M_n(CB(E,F))=CB(E,M_n(F))`, and on E*
by `M_n(E*)=CB(E,M_n)`. Prove the canonical E→E** is completely isometric,
duality exchanges complete quotient maps and complete isometries, and a map
to M_n has cb norm equal to its n-th amplification norm (Smith's lemma).

Construct column and row spaces from B(ℂ,H) and B(H,ℂ), their conjugate-dual
identifications, and finite row/column matrix norm formulas. Construct MIN(E)
and MAX(E) for a Banach space E, prove their universal properties (bounded
maps into MIN(E), respectively out of MAX(E), are CB with the same norm), and
their duality. Give explicit examples distinguishing bounded from completely
bounded maps, including transpose on M_n with cb norm n and operator norm 1
for n≥1. At the zero matrix level both norms are 0; retain that level.
An operator algebra is a norm-closed, not necessarily self-adjoint subalgebra
of B(H), with its inherited operator-space structure; specify units when used.

## C4. CP dilations, multiplicative domains, and Wittstock theory

Use Mathlib's `CompletelyPositiveMap` and the shared V13a operator-system
extension API. Add bounded/continuous realizations and norm compatibility:
for a CP map with unital domain, `‖φ‖cb=‖φ‖=‖φ(1)‖`; include the nonunital
approximate-unit formulation and unitization of completely positive
contractions. Positive maps to or from a commutative C*-algebra are CP.
Prove the Schwarz inequality for unital 2-positive maps. For unital CP φ,
the elements a satisfying both
`φ(a*a)=φ(a)*φ(a)` and `φ(aa*)=φ(a)φ(a)*`
form a closed unital C*-subalgebra, the multiplicative domain; characterize it
by `φ(ab)=φ(a)φ(b)` and `φ(ba)=φ(b)φ(a)` for every b. Prove restriction to it
is a *-homomorphism and a unital CP map fixing a C*-subalgebra is bimodular
over that subalgebra.

For every CP map φ:A→B(H) construct a Hilbert space K, a nondegenerate
representation π:A→B(K), and bounded V:H→K with `φ(a)=V*π(a)V` and
`‖V‖²=‖φ‖`. Construct K from the positive form on A⊙H and prove the null-space,
bounded-action, completion and nonunital approximate-unit steps. Take the
minimal dilation `K=closure(span(π(A)VH))`, prove unitary uniqueness with
intertwining of both π and V, and prove V is an isometry when φ is unital.
For ψ≤φ in CP order, establish the Radon–Nikodym correspondence with positive
contractions T in π(A)', namely `ψ(a)=V*Tπ(a)V`; prove it is an affine order
isomorphism onto the CP interval [0,φ], with uniqueness in the minimal dilation.
On the dense algebraic
Stinespring space use the form
`q_ψ(Σ a_i⊗ξ_i, Σ b_j⊗η_j)=Σ_ij ⟪ξ_i,ψ(a_i*b_j)η_j⟫`.
CP order gives `0≤q_ψ≤q_φ`, so the form descends and represents a positive
contraction; its left-action identity gives commutation with π(A).

For φ:M_n→M_m prove Choi's criterion: CP iff n-positive iff the block matrix
`[φ(E_ij)]` is positive. Construct Kraus operators `V_k:ℂ^m→ℂ^n` with
`φ(a)=Σ V_k*aV_k`, minimal number equal to the rank of the Choi matrix, and
unitary/isometric change-of-Kraus-family formulas. Derive unitality
`Σ V_k*V_k=1`, and the trace-dual Schrödinger map
`ρ↦Σ V_kρV_k*`; its trace preservation corresponds to that unitality. Relate
these finite formulas to the abstract minimal Stinespring construction.

Prove the 2×2 operator-system trick and Wittstock extension: a CB map from an
operator subspace of a C*-algebra to B(H) extends with unchanged cb norm.
For a CB map u:A→B(H) construct a representation π and operators V,W with
`u(a)=V*π(a)W` and `‖V‖‖W‖=‖u‖cb`. Prove the CP block-matrix completion and
Wittstock decomposition into a linear combination of four CP maps, including
the self-adjoint two-term version and its norm estimates. For a unital CB
homomorphism ρ from a unital operator algebra into B(H), prove Paulsen's
similarity theorem: some invertible S has `S⁻¹ρ(·)S` completely contractive
and `‖S‖‖S⁻¹‖=‖ρ‖cb`. For a C*-domain the transformed map is a
*-homomorphism. Complete boundedness is a hypothesis of this result.

## C5. C*-tensor products and operator-space tensor products

Construct the algebraic star algebra A⊙B and its minimal and maximal
C*-completions. The minimal norm is the operator norm in faithful spatial
representations on H⊗₂K; prove independence of the representations. The
maximal norm is the supremum over pairs of commuting *-representations on a
common Hilbert space, evaluated by `Σ a_i⊗b_i ↦ Σ π(a_i)ρ(b_i)`. Prove
finiteness, nondegeneracy, the C*-identity, the universal property, and
`‖·‖min≤‖·‖max`. Show these bound every C*-cross norm. Include units and
unitizations, associativity, flip, distributivity over finite direct sums,
functoriality and its norm bounds. Spatial tensors inject under inclusions;
maximal tensors preserve quotient exact sequences. State their different
inclusion/exactness properties separately.

Prove CP maps tensor to CP maps on both completions, with the product norm
bound. For arbitrary bounded complex linear functionals φ,ψ construct
φ⊗ψ on the minimal completion and prove `‖φ⊗ψ‖=‖φ‖‖ψ‖`, using
the bidual polar decomposition/spatial representation and simple tensors
for the matching lower bound. Include zero functionals and naturality.
Construct slice maps, their separation and bimodule formulas, and
matrix identifications `M_n⊗A≅M_n(A)`. Identify `C₀(X)⊗min A` with C₀(X,A)
for locally compact Hausdorff X, supplying the vector-valued continuous-function
and density bridge. In particular for compact Hausdorff X,Y construct
`C(X)⊗min C(Y)≅C(X×Y)`, sending f⊗g to ((x,y)↦f(x)g(y)),
with star, norm, unit and pullback naturality, by the vector-valued
comparison and Stone–Weierstrass density. Identify the spatial completion of K(H)⊙K(K) with
K(H⊗₂K). Relate the C*-tensor inclusion in representations to the spatial
von Neumann tensor product in V2.

For arbitrary operator spaces construct the minimal tensor norm by concrete
spatial realization and prove independence and injectivity. Construct the
operator-space projective tensor product using
`‖z‖∧=inf ‖α‖‖x‖‖y‖‖β‖` over factorizations
`z=α(x⊗y)β`, with x∈M_p(E), y∈M_q(F), scalar
α∈M_(n,pq), β∈M_(pq,n) at level n. Give the indexing/shuffle maps explicitly.
Prove the norm axioms, completion, associativity, flip, functoriality and
complete quotient property, and identify its dual with CB(E,F*).
Its universal bilinear maps are jointly completely bounded: the matrices
`[u(x_ij,y_kl)]_((i,k),(j,l))` have a uniform bound by C‖x‖‖y‖.
Prove the linearization and its equality of norms, including matrix levels.

Construct the Haagerup tensor product with matrix norm
`‖z‖h=inf ‖x‖‖y‖` over `z_ij=Σ_k x_ik⊗y_kj`,
x∈M_(n,r)(E), y∈M_(r,n)(F). At level one, in concrete realizations, this is
`inf ‖Σ a_i a_i*‖^(1/2) ‖Σ b_i* b_i‖^(1/2)`.
Prove the matrix norm axioms, associativity, functoriality, injectivity under
complete isometries, and preservation of complete quotients. Its universal
bilinear maps satisfy the multiplicative amplification bound
`‖[Σ_k u(x_ik,y_kj)]‖≤C‖x‖‖y‖`; distinguish this from the projective
product's jointly CB condition. Prove the common-Hilbert-space product
representation and CB factorization interpretation using C4. Construct the
canonical complete contractions from the projective to Haagerup product and
from Haagerup to minimal product. Compute
`C_n⊗h R_n≅M_n` with operator norm and `R_n⊗h C_n≅S₁^n` with its dual
operator-space structure. These products are not symmetric in general.

Supply the analytic constructions used by the approximation results: finite
direct sums, c₀ direct sums, bounded products and their closed-ideal quotients,
prove the c₀ direct sum is a closed two-sided ideal of the bounded product,
and build C*-inductive limits of directed systems of *-homomorphisms, including
noninjective connecting maps. Give their universal properties, canonical
maps, norm formulas and dense union/range criteria. For a family (A_i),
pin the bounded product to native `lp (fun i=>A_i) ∞` and the c₀ ideal
to its subspace of families whose coordinate norms tend to 0 along the
cofinite filter. Prove the closed-ideal property by the uniform norm bound,
with pointwise products and star and the induced quotient norm. Build the universal
unital C*-algebra on countably many unitary generators, C*(F_∞), from the
supremum over unitary representations, prove its universal property and
separability. This universal algebra is the test object in C7;
OperatorAlgebraDynamics D1 identifies it with the full free-group algebra.

Construct the path algebra `PA=C([0,1],A)`, cone `CA=C₀((0,1],A)`
and suspension `SA=C₀((0,1),A)`, with supremum norm and pointwise
star operations. Prove completeness, endpoint evaluation, ideal/quotient
identifications, functoriality, tensor comparisons and cone contraction.
View cone functions as paths vanishing at 0; the cone quotient is
evaluation at 1. For a star homomorphism φ:A→B construct the mapping cone
`C_φ={(a,f)∈A×CB : φ(a)=f(1)}` as a closed pullback C*-algebra.
Prove its pullback universal property, functoriality for commuting squares,
and the extension `0→SB→C_φ→A→0`, with inclusion g↦(0,g)
and projection (a,f)↦a. Prove surjectivity using f(t)=tφ(a)
and give the completely positive contractive section a↦(a,tφ(a)).
Construct homotopies of star homomorphisms as maps into PB, with
evaluation, composition and concatenation APIs. For a homotopy
Φ:A→PB, construct C_Φ and its endpoint maps to C_(ev₀Φ) and
C_(ev₁Φ). Prove these maps are homotopy equivalences by explicit
path rescaling and concatenation, hence homotopic homomorphisms have
homotopy-equivalent mapping cones. OperatorKTheory K2
consumes these elementary constructions independently of C9's
approximation and local-reflexivity theorems.

## C6. Nuclearity, the bidual, and Banach amenability

A completely positive contraction φ:A→B is nuclear when it is a point-norm
limit of composites `A --α_i→ M_(n_i) --β_i→ B` of CP contractions. Give the
finite-set/ε formulation, passage between nets and that formulation,
unitization, composition, matrix amplification and point-norm closure
properties. For general bounded CP maps use positive scalar multiples of
nuclear contractions and prove independence of the scaling. A is nuclear
when id_A is nuclear. Distinguish this notion from nuclear Banach-space
operators and from the Banach-space approximation property.

Prove the following equivalent characterizations for every C*-algebra A:

- A has the CP approximation property just defined.
- Its identity is a point-norm limit of finite-rank CP contractions, with
  no a priori matrix factorization imposed.
- For every C*-algebra B, the canonical map `A⊗max B→A⊗min B` is an
  isomorphism, equivalently A⊙B has a unique C*-cross norm.
- A** is semidiscrete, equivalently injective by V13b.
- A is amenable as the Banach algebra of BanachAlgebras A6.

Build the connecting tools as targets. Prove the tensor-extension argument
that turns nuclear CP factorizations into min-to-max continuity. For the
converse construct the matrix factorizations via CP extension and separation,
consuming V13b's explicit commuting-representation minimal-norm criterion
and its normal CP/predual approximation equivalents.
Develop dual CP pairings and the point-weak-star approximation on A*, then
the passage between approximations of A, A*, and A**; convexity and Kaplansky
density must yield the stated point-norm conclusion. Keep normal maps in
the semidiscrete definition distinct from arbitrary CP extensions.

For the amenability bridge, develop bounded bilinear forms on C*-algebras
and their weak compactness and separately weak-star continuous extensions to
biduals. Prove the noncommutative Grothendieck estimate: for a bounded
complex bilinear form u on nonzero unital C*-algebras A×B there are states f₁,f₂ on
A and g₁,g₂ on B such that
`|u(a,b)|≤‖u‖ (f₁(a*a)+f₂(aa*))^(1/2) (g₁(b*b)+g₂(bb*))^(1/2)`.
The square roots are of the nonnegative real values of these functionals.
Give the nonunital version through unitization and prove the Hilbert-space
factorization/weak-compactness consequences used for the bidual extension.
Define
the space of separately normal bounded bilinear forms on a W*-algebra M,
its dual bimodule, and its multiplication map to M. A normal virtual
diagonal N commutes with every a∈M and satisfies
`N((x,y)↦ω(xy))=ω(1)` for each normal functional ω. Prove the normal virtual
diagonal criterion for injectivity, construct it from the injective/
semidiscrete structure, and transfer it to the Banach virtual diagonal of A
using the bidual extension of bilinear forms. Prove the converse transfer
from a Banach virtual diagonal and the expectation criterion.

Include the analytic construction of that normal diagonal. Write V for the
separately normal bounded bilinear forms on M×M, and V_h for those continuous
for the Haagerup norm, with their respective norms. Construct a faithful
normal representation in which every normal state is a vector state:
amplify any faithful normal representation by ℓ²(ℕ) and use V4's
countable vector-functional decomposition. In that representation extend
`x⊗y ↦ (T↦xTy)` to the isometric bimodule identification of V_h* with bounded
M′-bimodule maps on B(H). Consume V13b's commutant-injectivity theorem,
using V10–V11's general standard form for its representation comparison.
For nonzero M, an expectation onto M′
yields a central element of V_h* of norm one with multiplication equal to 1.
For M=0 use the zero diagonal. Construct an M-bimodule
map `θ:V_h*→V*` intertwining the multiplication maps: its norm is at most 2
in the finite case, using V5's center-valued trace and unitary averages, and
at most 1 in the properly infinite case, using a countable sequence of
pairwise orthogonal projections equivalent to 1 and implementing partial
isometries; prove the projections tend ultraweakly to zero. Use V5's
halving and central decomposition results to combine the finite and properly
infinite central summands to obtain a normal virtual diagonal of norm at
most 2. Supply the normal-state factorization of Haagerup-bounded forms,
the vector-functional dual pairing, and the weak-star limit arguments
needed by these maps; a diagonal lies in the dual of the form space.

Define normal dual Banach bimodules: the actions are weak-star continuous
in the module variable, and each orbit map from M is weak-star continuous.
Develop bounded weak-star continuous derivations, and prove the
equivalent Connes-amenability formulation: every such derivation from M is
inner. Reuse A6's bimodule and universal-derivation constructions with these
specified continuity conditions. Handle
nonunital A by its unitization and its contractive approximate unit. These
constructions prove the amenability equivalence; they are not extra
hypotheses imposed on nuclear algebras.

Prove nuclearity is invariant under *-isomorphism, unitization, matrix
amplification and stabilization by K(ℓ²); passes to closed ideals, hereditary
subalgebras and quotients; and is preserved by extensions, directed inductive
limits and minimal tensors. An extension is nuclear iff its ideal and
quotient are nuclear. Give the compression, ideal approximate-unit and
quotient/bidual arguments that justify these assertions. Produce explicit
CP approximations for finite-dimensional algebras, C₀(X), K(H), and inductive
limits of finite-dimensional algebras. Deduce the metric approximation
property for A and A* from the proved dual approximation criteria.

## C7. Exactness, lifting, and weak expectation

A is exact if tensoring every closed-ideal sequence
`0→J→B→B/J→0` with `A⊗min -` leaves it exact. Develop the kernel and quotient
norm formulations, unitization and matrix variants, and prove nuclear
implies exact. Prove Kirchberg's local characterization: for each
finite-dimensional operator subspace E⊆A and ε>0 there is a linear
isomorphism u:E→F⊆M_n with `‖u‖cb‖u⁻¹‖cb<1+ε`.
Include the finite-dimensional operator-space compactness and perturbation
lemmas connecting this condition to tensor exactness. Prove also that A is
exact iff a faithful representation A→B(H) is nuclear as a CP map, and prove
independence of the faithful representation. The approximating maps return
to B(H), rather than to A; this is the distinction from nuclearity of A.
Prove permanence under
C*-subalgebras, closed ideals, minimal tensors and directed inductive limits
with injective connecting maps. C9 develops operator-space local reflexivity,
proves quotient permanence, and deduces the general inductive-limit result.
For extensions of exact algebras,
prove exactness under a local CP-splitting hypothesis, and in particular when
the quotient is nuclear, using the lifting results below. Do not assert
unconditional permanence under extensions.

For a quotient q:B→B/J, define a CP contractive lifting of φ:A→B/J by a CP
contraction ψ:A→B with qψ=φ. Prove matrix-domain lifting and the perturbation
lemma that adjusts one lifting to stay close to another on a prescribed
finite set. Use quasicentral approximate units in its proof. Prove the
Choi–Effros theorem: every nuclear CP contraction from a separable C*-algebra
admits such a lifting; in the unital setting give the unital version. Thus
extensions with separable nuclear quotient are semisplit, meaning they have
a CP contractive section. Without separability prove finite-set approximate
liftings for nuclear quotients. Use `0→c₀→ℓ∞→ℓ∞/c₀→0` to exhibit the need
for the global lifting theorem's separability hypothesis. Prove Phillips's
lemma: finitely additive
complex measures μ_n on ℕ with a uniform total-variation bound and
μ_n(E)→0 for every subset E
satisfy `Σ_k |μ_n({k})|→0`. Deduce noncomplementability of c₀ in ℓ∞:
for a putative bounded projection P onto c₀,
apply this to `μ_n(E)=(P 1_E)_n`; its singleton masses would be δ_nk.

For WEP and LLP use nonzero unital algebras and proper quotient ideals.
The local lifting property (LLP) says that every unital CP
map A→B/J, with B unital, restricts on each finite-dimensional operator
subsystem E⊆A to a unital CP map E→B lifting that restriction. Define the
weak expectation property (WEP) by a faithful unital representation A⊆B(H)
and a unital CP map B(H)→A** extending the canonical inclusion of A. Prove
representation independence, the relative weak-injectivity criterion in
larger unital C*-algebras, and invariance under unital *-isomorphism.

Prove Kirchberg's tensor characterizations, with the canonical algebraic
identifications determining the maps:

- A has LLP iff `A⊗min B(ℓ²(ℕ))=A⊗max B(ℓ²(ℕ))`.
- A has WEP iff `A⊗min C*(F_∞)=A⊗max C*(F_∞)`.
- If A has LLP and B has WEP, min and max agree on A⊙B.
- A is nuclear iff it is exact and has WEP.

Develop the finite-dimensional subsystem duality, local lifting/tensor
continuity equivalences, and extension arguments in these proofs. Prove
C*(F_∞) has LLP and B(H) has WEP. Retain the specified unital conventions
throughout; give the unitization formulation for nonunital algebras. No
universal assertion of WEP or QWEP is a target.

## C8. Quasidiagonality and representation approximation

A set Ω⊆B(H) is quasidiagonal if for every finite F⊆Ω, finite X⊆H and ε>0
there is a finite-rank orthogonal projection P with `‖[P,T]‖<ε` for T∈F
and `‖Pξ-ξ‖<ε` for ξ∈X. For norm-separable Ω on separable H prove this is
equivalent to increasing finite-rank orthogonal projections P_n converging
strongly to 1 with `‖[P_n,T]‖→0` for every T∈Ω. Develop the corresponding
net formulation, direct sums,
amplifications and compact perturbations. Distinguish restriction to a
reducing subspace from these permanence results: quasidiagonality of a
representation need not pass to every reducing summand. A separable
C*-algebra is quasidiagonal if it has a faithful quasidiagonal representation.
A faithful representation is essential when its image meets K(H) only at zero.

Prove Voiculescu's noncommutative Weyl–von Neumann theorem in the form needed
for representation independence. If A is separable unital, π:A→B(H) is a
faithful unital essential representation on separable H, and ρ:A→B(K) is
any unital representation on separable K, construct unitaries
`U_n:H→H⊕K` such that
`U_n π(a) U_n*-(π(a)⊕ρ(a))` is compact and tends to zero in norm for every a.
Develop the finite-set isometry/compression approximations, orthogonal
summand selection, and absorption argument proving this theorem. Deduce
that quasidiagonality can be tested in any faithful essential representation.

Prove the abstract criterion: a separable unital A is quasidiagonal iff it
admits unital CP maps φ_n:A→M_(k_n) with
`‖φ_n(ab)-φ_n(a)φ_n(b)‖→0` and `‖φ_n(a)‖→‖a‖` for all a,b∈A.
Give the finite-set formulation and the nonunital CP-contractive version via
unitization. Prove permanence under C*-subalgebras and injective sequential
inductive limits, and show finite-dimensional, commutative separable, compact
operator and separable AF algebras are quasidiagonal. Define stable finiteness
by finiteness of every matrix unitization and prove quasidiagonal algebras
are stably finite. Exhibit the unilateral shift algebra as an obstruction:
its proper isometry precludes quasidiagonality. Construct its extension
`0→K(ℓ²)→T→C(𝕋)→0`, proving the symbol map and kernel, and deduce nuclearity
from C6. Here ℓ² is native `lp (fun _ : ℕ => ℂ) 2`, S is the forward
shift `Sx(0)=0`, `Sx(n+1)=x(n)`, 𝕋 is native `Circle`, and the symbol
of S is the identity coordinate z. ToeplitzOperators consumes this exact
extension for its Hardy-space comparison. This gives a concrete nuclear
algebra that is not quasidiagonal.

## C9. Local reflexivity and exactness under quotients

Develop the approximation constructions underlying the quotient theorem.
A C*-algebra is residually finite-dimensional (RFD) when its finite-dimensional
*-representations separate points. Give its faithful product-of-matrices
description and its norm-detecting finite-set criteria, and prove permanence
under subalgebras and unitization. Consume C5's cone and homotopy APIs. Prove
that cones over RFD algebras are RFD, using evaluation and finite-dimensional
representations. Prove
Voiculescu's homotopy invariance of quasidiagonality for separable C*-algebras;
more precisely, if α:A→B and β:B→A have βα homotopic to id_A and B is
quasidiagonal, then A is quasidiagonal. In particular, CA is quasidiagonal
for every separable A.

For a separable exact quasidiagonal algebra in a faithful essential
representation on a separable Hilbert space, prove Dadarlat's external finite-dimensional approximation
theorem: every finite subset is arbitrarily close in norm to a
finite-dimensional C*-subalgebra of B(H). Prove norm stability of
the relations for any fixed finite family of matrix blocks: for every
ε>0 choose δ>0 depending only on ε and the block sizes, uniformly over
all C*-algebras. For entries e^r_ij of norm at most 2, require
`‖(e^r_ij)*−e^r_ji‖<δ`,
`‖e^r_ij e^r_kl−δ_jk e^r_il‖<δ` within each block, and
`‖e^r_ij e^s_kl‖<δ` for r≠s. Construct an exact system
within ε entry by entry, with orthogonal block supports.
Include the unital version when the diagonal sum is close
to 1. Construct the correction by spectral cutoffs and polar
decomposition inside the generated C*-algebra. Prove nearby exact
systems are conjugate by a unitary close to 1 in the unitization,
with estimates on their finitely many entries. CStarClassification
uses these norm perturbation lemmas for finite-dimensional
semiprojectivity and local AF approximation.
Develop approximate intertwining
for sequences of finite-dimensional algebras, including norm convergence,
injectivity and unitary adjustment lemmas. In particular, asymptotically
multiplicative and isometric CP contractions into finite-dimensional stages, with
summable compatibility errors on a set with dense linear span, induce an
embedding into their inductive limit.

For a separable unital algebra, a finite set F and ε>0, call a unital
finite-dimensional representation σ
(F,ε)-admissible when its countable infinite amplification is within ε on F,
after unitary conjugation, of a faithful essential representation. Prove
existence of such representations for separable unital exact RFD algebras and
preservation of admissibility upon adding a finite-dimensional summand.
Supply the RFD homomorphism refinement of external finite-dimensional
approximation: for a faithful essential representation π and finite F,ε,
construct a finite-dimensional unital *-representation σ whose infinite
amplification is unitarily within ε of π on F. Use block-diagonal
finite-dimensional separating representations and the absorption theorem
to pass from a nearby finite-dimensional algebra to this representation.
For homotopic unital representations σ₀,σ₁:A→M_k with σ₀ (F,ε)-admissible, prove
that for some N, `(N+1)σ₀` and `σ₁⊕Nσ₀` are within 3ε on F after unitary
conjugation. Build the preceding stable homotopy lemma by subdivision of
the homotopy and absorption into a faithful essential representation using
C8. Prove any two unital representations of the unitized cone on the same
Hilbert space are homotopic. These estimates supply the summable unitary
adjustments in the finite-dimensional inductive system.

Prove that the cone of a
separable exact RFD algebra embeds into an AF algebra. For an exact
separable quasidiagonal B, use C8's matrix maps φ_n to embed B into
`∏ M_(k_n) / ⨁ M_(k_n)`. Form the pullback E inside the bounded matrix
product, with ideal the c₀ sum; the coordinate maps φ_n give a CP contractive
section B→E. Prove E is separable, RFD and exact, using C7's locally split
extension theorem. Apply this to B=CA, and embed CE in an AF algebra.
Compose the evaluations at 1 and the map E→CA to obtain a surjection CE→A.
Thus every separable exact algebra is isomorphic to a quotient of a
C*-subalgebra of a separable AF algebra. This analytic subquotient theorem is built
here; it does not assume the O₂-embedding or K-theoretic classification results.

For unital A, operator-space local reflexivity means that every finite-dimensional
operator subsystem E⊆A** admits completely contractive maps E→A converging
point-weak-star to its inclusion. Prove the equivalent finite-test formulations,
the point-norm refinement on E∩A, and the operator-subspace version. For
nonunital A use its unitization and prove equivalence with the direct
subspace formulation. Distinguish this from Banach local reflexivity in
BanachSpaceTheory B7: the matrix norm bounds are essential here.

Construct the canonical injective binormal map
`A**⊙B**→(A⊗min B)**` from the normal extensions of the commuting factor
representations. Define property C by its min-continuity for every B;
property C′ by min-continuity of its restriction to `A⊙B**`; and property
C″ by min-continuity of its restriction to `A**⊙B`. Prove independence of
representations, the restriction and unitization lemmas, and the subalgebra
permanence of all three properties. Prove C and C″ pass to closed-ideal
quotients using C2's central summand description. Prove C″ iff local
reflexivity, using the operator-space duality of C3 and weak-star approximation
of finite-dimensional matrix maps; prove C′ iff exactness using the
following strong-star family construction in its tensor-kernel argument.
For every C*-algebra B choose its faithful universal normal realization
B**⊆B(H_u), with the canonical B inclusion. Take the common directed set
I=Finset(H_u)×ℕ_(≥1), ordered by inclusion of the finite test set and
increasing n; it is independent of the element to be approximated. In C5's
native bounded product `lp (fun _ : I => B) ∞`, construct
`D_I(B)={b : b_i converges strong-star in B**}` with its inherited norm.
Use V1's bounded strong-star multiplication/star laws to prove it is a
norm-closed star subalgebra, generally nonunital when B is nonunital. For
closedness, the strong-star limits of a uniformly norm-Cauchy family are
norm-Cauchy by the limit map's contractive estimate; the three-term vector
estimate then gives strong-star convergence of the uniform limit family.
Prove the limit map q:D_I(B)→B** is a contractive star homomorphism and
`ker q={b : b_i→0 strong-star}`. For x∈B**, bounded strong-star Kaplansky
density chooses b_(F,n)∈B with ‖b_(F,n)‖≤‖x‖ and both
`‖(b_(F,n)−x)ξ‖<1/n`, `‖(b_(F,n)*−x*)ξ‖<1/n` for ξ∈F; for x=0 choose
the zero family. Prove these families converge strong-star to x, so q is
surjective, and construct the actual isometric C*-quotient comparison
`D_I(B)/ker q≅B**`. When B is unital, the constant1 is its unit and q is
unital; B=0 gives the zero algebra and quotient. Use common-universe lifts
when needed. Prove transport under faithful normal realizations using V4's
normality/vector-functional comparison of bounded strong-star convergence;
do not replace this arbitrary directed set by a countable model. This
uses C5's single bounded-product/quotient carrier, not a second family
engine. Retain the algebraic/tensor maps and exactness conclusion above.

Include the star-closure control B=K(ℓ²), B**=B(ℓ²): for n≥1,
T_n=E_(0,n) has norm1 and T_nξ=ξ_n e₀→0 for every ξ, while
T_n*e₀=e_n has no norm limit. Thus bounded SOT-convergent families alone
are not star closed and cannot replace D_I(B).

Prove nuclear algebras have C using C6's semidiscrete bidual theorem.
Apply the AF-subquotient theorem to prove C, C′ and exactness equivalent
for separable algebras, hence exact algebras locally reflexive. Prove the
separable-subalgebra tests and the equivalence `C ↔ (C′ and C″)` that remove
separability. Deduce exactness passes to every closed-ideal quotient.
Deduce exactness of directed inductive limits with arbitrary connecting
*-homomorphisms by applying quotient permanence to the stage images
and C7's increasing-union result.
For a unital locally reflexive A prove each quotient extension is locally
CP-split, with a lifting on each finite-dimensional operator subsystem;
prove the converse local-reflexivity theorem for locally split extensions
whose ideal and quotient are locally reflexive. These give the precise
extension and quotient interfaces used by crossed products, K-theory and
classification.

## References and design evidence

- Blackadar, *Operator Algebras*, II.4–II.6 (approximate units, ideals,
  representations and primitive spaces), II.7.3 (multipliers), II.8–II.9
  (constructions and tensors), III.5.2 (universal representation/bidual),
  IV.3.1–IV.3.3 (nuclearity, lifting and amenability), and V.4
  (quasidiagonality). In particular II.5.2.4 is the Pedersen ideal theorem,
  II.5.3.2 the hereditary-ideal correspondence, II.6.4.8 the pure-state
  criterion, and IV.3.2.4 the lifting theorem.
- Brown–Ozawa, *C*-Algebras and Finite-Dimensional Approximations*, Chapters
  1–3 (CP maps, approximation and tensors), 7–9 (quasidiagonality,
  AF embeddings, local reflexivity and quotient permanence), 13
  (WEP and LLP), and Appendices B–C (operator spaces and lifting).
- Paulsen, *Completely Bounded Maps and Operator Algebras*, Chapters 3–4,
  6–9 and 13; Theorems 3.14 and 3.18 (Choi and multiplicative domain),
  8.2–8.5 (Wittstock), 9.1 (similarity) and 13.4 (Ruan).
- Arveson, [*Subalgebras of C*-algebras*](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6082-11511_2006_Article_BF02392388.pdf),
  Lemma 1.4.1 and Theorem 1.4.2, pp. 159–160, for the comparison of minimal
  Stinespring dilations and CP Radon–Nikodym order isomorphism.
- Pisier, *Introduction to Operator Space Theory*, Chapters 1–5 for matrix
  norms, duality, minimal, projective and Haagerup products; Theorems 4.1 and
  5.1 specify the distinct tensor universal properties.
- Haagerup, [*The Grothendieck inequality for bilinear forms on C*-algebras*](https://www.isibang.ac.in/~soumyashant/misc/collected-works-of-haagerup/1980s/1985_The_Grothendieck_inequality_for_bilinear_forms_on_C-star_algebras.pdf),
  Theorem 1.1, p. 94, for the bounded-bilinear state estimate in C6.
- Runde, *Lectures on Amenability*, §§6.4–6.5, especially Corollaries 6.4.27
  and 6.5.12 for nuclearity, injectivity and Banach amenability.

Mathlib's existing `CompletelyPositiveMap`, `CStarMatrix`, GNS, approximate-unit,
unitization and double-centralizer APIs determine the underlying objects.
The [CP-map discussion](https://leanprover.zulipchat.com/#narrow/stream/217875-Is%20there%20code%20for%20X%3F/topic/%E2%9C%94%20Complete%20Positive%20%28CP%29%20and%20CPTP%20Maps%20in%20LEAN)
points to the merged CP-map implementation; the
[matrix-order discussion](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/negative%20%28semi-%29definite%20matrices)
explains the spectral order on CStarMatrix. Follow
[PR #42095](https://github.com/leanprover-community/mathlib4/pull/42095)
for CFC in closed two-sided ideals and
[PR #42100](https://github.com/leanprover-community/mathlib4/pull/42100)
for clopen spectral projections away from zero in the quasispectrum.
[PR #24106](https://github.com/leanprover-community/mathlib4/pull/24106)
unbundles the underlying ring from the C*-classes; adapt to that class design
as it becomes available, without introducing competing classes.
Build missing mathematics in Tau Ceti now with these interfaces; adopt
Mathlib implementations by replacing local material with imports.

The [Stinespring discussion](https://leanprover.zulipchat.com/#narrow/stream/395462-Natural%20sciences/topic/Top%20100%20Quantum%20Theorems)
and [Physlib PR #1191](https://github.com/leanprover-community/physlib/pull/1191)
document existing finite-dimensional Kraus/dilation work. Its concrete
matrix identities are relevant to C4; the arbitrary C*-domain minimal
dilation theorem and CP Radon–Nikodym theorem remain the intrinsic targets.
Coordinate with those authors before integrating their code, and check its
licence; mathematical overlap alone does not authorize copying.
