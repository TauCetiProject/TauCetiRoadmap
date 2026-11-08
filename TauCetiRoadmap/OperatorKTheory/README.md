# Roadmap: operator K-theory, extensions, and KK-theory

**Summary.** Starting from Mathlib's `CStarMatrix`, `IsStarProjection`, `unitary` and
`ContinuousLinearMap.IsFredholm`, build K-theory of complex C*-algebras from projections and
unitaries, with stability, homotopy, Bott periodicity and exact sequences (K1–K3). Develop Fredholm
indices and extensions with their Busby invariants and Ext semigroups (K4), graded Kasparov theory
(K5) and its product (K6), equivariance, descent and the crossed-product calculations (K7), the
universal coefficient and Künneth theorems on the bootstrap class (K8), and asymptotic morphisms
with E-theory (K9). The end theorems are Bott periodicity for arbitrary coefficient algebras, the
six-term exact sequence of every extension, Atkinson's theorem with the K₀-valued module index, the
group Ext(A,B) for separable nuclear A, associativity of the Kasparov product, the Green–Julg,
Pimsner–Voiculescu and Connes–Thom theorems, the K-groups of free-group, rotation and Cuntz
algebras, the UCT and Künneth sequences, the Brown–Douglas–Fillmore classification of essentially
normal operators, and the universal property of E-theory. The output is a reusable functorial
library whose geometric comparison, grading and boundary signs are explicit.

## Scope and ownership

This roadmap owns operator K-theory of complex C*-algebras, unital or not, separable or not;
Atkinson's theorem and the Hilbert-module index; extension semigroups; graded KK-theory and the
Kasparov product; equivariant KK and descent; the crossed-product, free-group, rotation-algebra
and Cuntz-algebra calculations of K7; the twisted group C*-algebra `C*(L,c)` of a discrete abelian
group L with a circle-valued 2-cocycle c, built in 7.5 on Tau Ceti's algebraic twisted group
algebra in its twisted regular representation on ℓ²(L), with its trace, gauge action, universal
property, centre and simplicity criterion, the noncommutative tori and the twisted algebras of
lattices in phase space being instances; the bootstrap class with the UCT and Künneth theorems;
the Brown–Douglas–Fillmore theorem; and asymptotic morphisms and E-theory. The layers are K1–K9
below. Subsection k.n of layer Kk is cited as `Kk.n`; subsections 2.4 and 7.3
also keep their names K2.LocalNormed and K7.FreeGroups.

The following stay with their owners and are not targets here.

- TopologicalKTheory owns geometric vector-bundle K-theory, geometric complex Bott periodicity,
  geometric Thom classes (T5), equivariant bundles (T6) and real KO-theory (T7); this roadmap
  proves the comparison with `K_i(C₀(X))` and Bott periodicity for C*-coefficients.
- CStarAlgebras owns the Calkin algebra `B(H)/K(H)` and its ideal structure (C1.6), and the
  unitary conjugacy of nearby projections and matrix units (C9.2); K4 and K1 consume them.
- AlgebraicKTheory owns, for unital rings, the finite-projective category Proj(R) and its K₀ (A0),
  algebraic K₁, Milnor patching and the comparison of algebraic K₁ of a Banach algebra with its
  stable component group (A1–A2, A6, A8). This roadmap proves the comparisons of its own groups
  with these: projection K₀ with A0's K₀ (1.4), the unitary model of K₁ with A8 (2.4), and the
  pullback boundary with A6 (3.3).
- PseudodifferentialOperators owns elliptic symbols, parametrices and Fredholm operators on
  manifolds; this roadmap owns the general Atkinson, module-index and K-pairing bridges.
- The full crossed product of a C*-dynamical system, and with it the full group C*-algebra
  `ℂ⋊G`, is Tau Ceti's `TauCeti.CStarAction.FullCrossedProduct`. OperatorAlgebraDynamics owns the
  reduced crossed products and reduced group C*-algebras, the comparison `ℂ⋊G≃C*(G)`, the duality
  theorems and the finite universal Cuntz algebras O_n; their K-theory and KK consequences belong
  here.
- NoncommutativeGeometry owns smooth algebras' cyclic cohomology, spectral triples and their
  geometric index theorems.
- CStarClassification owns dimension-group classification of AF algebras, the absorption and
  classification properties of O_∞, and *-isomorphism classification; K1 supplies its projection
  and trace invariants and K8 its UCT condition.
- FreeProbability owns the end-oriented shift and radial-vector norm bounds on free groups, and
  FactorRigidity Layer 4 owns proper length functions and Haagerup kernels.
- This roadmap does not prove simplicity or uniqueness of the trace of the reduced free-group
  C*-algebras; the K-group calculations of K7.FreeGroups do not use either.

## Conventions

The basic K-groups and their exact sequences apply to arbitrary complex C*-algebras, including
nonunital and nonseparable ones. In KK and E-theory, retain the separability, σ-unitality and
countable-generation assumptions specified in each milestone. Tensor products of C*-algebras are
spatial unless explicitly marked maximal; graded tensor products include their Koszul signs. Put
`K=K(ℓ²(ℕ,ℂ))` and use the rank-one corner for stabilization. The zero algebra is included, and
its K-groups vanish.

Use `CStarMatrix (Fin n) (Fin n) A`, `IsStarProjection`, `unitary A`, and Mathlib's units, paths
and homotopies. A right projective module over A uses `Module Aᵐᵒᵖ`; a right Hilbert module uses
`CStarModule Aᵐᵒᵖ`, with inner products linear in the second variable. For projections p and q of
possibly different matrix sizes, Murray–von Neumann equivalence means there is a rectangular
matrix v with `v*v=p` and `vv*=q`, where the first star is conjugate transpose. Use rectangular
matrix multiplication, not casts identifying unequal matrix sizes.

K₀ of a unital algebra sends a rank-one projection in `M_n(ℂ)` to 1, so `[1_(M_n)]` has value n.
The Hilbert-space index is `dim ker T − dim coker T`. Suspensions are `SA=C₀((0,1),A)`; identify
the open interval with ℝ by the increasing map `t↦tan(π(t−1/2))`. Put `CA=C₀((0,1],A)` with
quotient evaluation at 1 and ideal SA. The index boundary of this cone extension is
`θ_A:K₁(A)→K₀(SA)`; its exponential boundary is the positive Bott map b_A of K3. Fix
`S²A=C₀((0,1)_s,C₀((0,1)_t,A))` and `z=tan(π(s−1/2))+i tan(π(t−1/2))`, so the outer coordinate
is real. Under the compactification `ℂ⁺≃S²`, the Bott class is `β=[L]−1`, where L is the
tautological line with first-to-second disc transition z, as in TopologicalKTheory. Its
projection representative is

```
p(z) = (1+|z|²)⁻¹ [[|z|², z], [conjugate z, 1]],
p(∞) = diag(1,0),       β = [p] − [p(∞)].
```

Prove that comparison with the geometric class, including the sign: TopologicalKTheory's
rank-one dual Koszul symbol represents −β. Products, boundary maps and Thom maps must retain
their chosen orientation; no unnamed isomorphism with ℤ determines a generator's sign.

## Exact supplier contracts

### From Mathlib

- C*-algebras and matrices: `CStarAlgebra`, `NonUnitalCStarAlgebra`, `CStarMatrix` with
  `CStarMatrix.conjTranspose` (`Mathlib/Analysis/CStarAlgebra/CStarMatrix.lean`),
  `IsStarProjection` (`Mathlib/Algebra/Star/StarProjection.lean`), `unitary`, `IsStarNormal`,
  `Unitization` with its C*-norm, the continuous functional calculus `cfc`, and
  `Unitary.mem_pathComponentOne_iff` (`Mathlib/Analysis/CStarAlgebra/Unitary/Connected.lean`):
  the identity path component of the unitary group is the set of finite products of
  exponential unitaries, with logarithm charts near 1; `Unitary.joined` (same file): two
  unitaries at distance less than 2 are joined by a path of unitaries.
- Group completion: `Algebra.GrothendieckAddGroup`
  (`Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean`), whose class map is injective
  only for cancellative monoids.
- Fredholm theory: `ContinuousLinearMap.IsFredholm`, `ContinuousLinearMap.FredholmPackage`,
  `ContinuousLinearMap.isFredholm_iff_exists_isQuasiInverse` and
  `ContinuousLinearMap.IsFredholm.index_comp`
  (`Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean`), where a quasi-inverse inverts modulo
  operators of finite rank (`Mathlib/Algebra/Module/LinearMap/FiniteRange.lean`);
  `ContinuousLinearMap.index_continuousOn_isFredholm`
  (`Mathlib/Analysis/Normed/Operator/Fredholm/Open.lean`); `LinearMap.index`
  (`Mathlib/Algebra/Module/LinearMap/Index.lean`); `IsCompactOperator`
  (`Mathlib/Analysis/Normed/Operator/Compact/Basic.lean`); `ContinuousLinearMap.adjoint`.
  The forward direction of Atkinson's theorem in K4 is
  `ContinuousLinearMap.isFredholm_iff_exists_isQuasiInverse`, since an operator of finite rank is
  compact.
- Hilbert modules and selections: `CStarModule` (`Mathlib/Analysis/CStarAlgebra/Module/Defs.lean`);
  `CompletelyPositiveMap` (`Mathlib/Analysis/CStarAlgebra/CompletelyPositiveMap.lean`), a
  complex-linear map between C*-algebras whose entrywise amplification to every `CStarMatrix`
  size preserves positivity;
  `ContinuousLinearMap.NonlinearRightInverse` (`Mathlib/Analysis/Normed/Operator/Banach.lean`),
  a norm-controlled right inverse with no continuity field, and
  `ContinuousLinearMap.exists_nonlinearRightInverse_of_surjective` (same file), the open mapping
  theorem in that form; `LowerHemicontinuous.exists_continuous_selection`
  (`Mathlib/Topology/Semicontinuity/Michael.lean`), Michael's selection theorem: a lower
  hemicontinuous map from a paracompact normal space to a real Fréchet space with nonempty closed
  convex values has a continuous selection.
- Topology and harmonic analysis: `TopologicalSpace.MetrizableSpace`, `CompleteSpace`,
  `IsTopologicalAddGroup`, `LocallyConvexSpace`, `ContinuousStar`,
  `TopologicalSpace.SeparableSpace`, `ConnectedComponents`, `LocallyConstant.freeOfProfinite`
  (Nöbeling), `PontryaginDual`, `MeasureTheory.Measure.haar`, `lp`.
- Groups and graphs: `FreeGroup.of`, `FreeGroup.toWord`, `SimpleGraph.mulCayley`
  (`Mathlib/Combinatorics/SimpleGraph/Cayley.lean`, edges `g — g·s` for s in the generating
  set) and `SimpleGraph.IsTree`.
- Homological algebra: `CategoryTheory.Abelian.Ext` and `CategoryTheory.Tor` on `ModuleCat ℤ`,
  and `CategoryTheory.ShortComplex.ShortExact.extClass`.

### From Tau Ceti

- `TauCeti.SplitK0` (`TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`), the split
  Grothendieck group of an essentially small additive category.
- `TauCeti.finiteProjectiveModules` (`TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean`):
  the object property of being a finitely generated projective module over a ring, closed under
  isomorphisms, containing zero and essentially small in the ring's universe; over Aᵐᵒᵖ it is
  AlgebraicKTheory 0.1's Proj(A).
- `TauCeti.IsPartialIsometry` with `TauCeti.IsPartialIsometry.isStarProjection_star_mul_self` and
  `TauCeti.IsPartialIsometry.isStarProjection_mul_star_self`
  (`TauCeti/Algebra/Star/PartialIsometry.lean`): an element v with `vv*v=v`, whose initial and
  final elements `v*v` and `vv*` are projections. These are the square Murray–von Neumann
  partial isometries of K1.
- `TauCeti.isFredholm_one_sub`, `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator` and
  `ContinuousLinearMap.index_add_of_isCompactOperator`
  (`TauCeti/Analysis/Fredholm/CompactPerturbation.lean`): compact perturbations of Fredholm
  operators and the invariance of their index. The converse direction of Atkinson's theorem in
  K4 starts here: if `ST−1` and `TS−1` are compact then ST and TS are Fredholm, their
  quasi-inverses give left and right quasi-inverses of T, and these agree modulo finite rank.
- `Continuous.isLocallyConstant_index` and `Path.index_eq`
  (`TauCeti/Analysis/Fredholm/ContinuousFamily.lean`): homotopy invariance of the index.
- `Matrix.fromBlocks_one_sub_mul_self_of_mul_eq` and
  `Matrix.fromBlocks_one_sub_mul_fromBlocks_mul_fromBlocks_one_sub_of_mul_eq`
  (`TauCeti/Data/Matrix/Block.lean`): for rectangular matrices a, b over a ring with `ab=e`,
  `ba=f` and `be=b`, the block matrix `[[1−e, a], [b, 1−f]]` conjugates `e⊕0` to `0⊕f`, and it
  is an involution when also `ea=a`. K1.1 applies them with a=v*, b=v.
- `TauCeti.IsFactorSet`, `TauCeti.twistedTranslation`, `TauCeti.twistedMonoidAlgebra`,
  `TauCeti.TwistedMonoidAlgebra.lift` and `TauCeti.TwistedMonoidAlgebra.algHom_ext`
  (`TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean`): a normalized factor set `α : G → G → kˣ`
  on a monoid, with `α(gh,j)α(g,h)=α(h,j)α(g,hj)` and `α(1,g)=α(g,1)=1`; the twisted translation
  on `G →₀ k` sending the basis vector at h to `α(g,h)` times the basis vector at gh; the
  algebraic twisted monoid algebra, the span of these translations; and its universal property
  for families u with `u(1)=1` and `u(g)u(h)=α(g,h)u(gh)`, with uniqueness. K7.5 uses them over
  ℂ on `Multiplicative L` for a discrete abelian group L; the C*-completion is constructed there.
- `TauCeti.Amenable.of_commGroup` (`TauCeti/GroupTheory/Amenable/Abelian.lean`): every commutative
  topological group is amenable, `TauCeti.Amenable` meaning a left-invariant mean on the left
  uniformly continuous bounded real functions, which for a discrete group are all bounded
  functions. No rank, torsion or countability hypothesis is made. K7.5 applies it to
  `Multiplicative L` with the discrete topology.
- `TauCeti.CStarAction.FullCrossedProduct`, with `TauCeti.CStarAction.FullCrossedProduct.of`,
  `TauCeti.CStarAction.FullCrossedProduct.lift` and
  `TauCeti.CStarAction.CovariantRepresentation.integratedFull`
  (`TauCeti/Analysis/CStarAlgebra/Action/CrossedProduct/Full.lean`): for a point-norm continuous
  action α of a locally compact group G on a C*-algebra A and a left Haar measure μ, the full
  crossed product `A⋊_αG`, the completion of the twisted convolution algebra `C_c(G,A)` in the
  supremum of the norms of the integrated forms of covariant representations on Hilbert spaces in
  the universe of G and A, with the canonical dense map from `C_c(G,A)`, the extension of
  *-homomorphisms bounded by that supremum, and the extension of every such integrated form. No
  unit, separability or nondegeneracy is assumed.
  `TauCeti.CStarAction.CovariantRepresentation.regular`
  (`TauCeti/Analysis/CStarAlgebra/Action/Covariant/Regular.lean`): the regular covariant
  representation on `L²(G,H)` induced by a representation ρ of A on H, `π(a)ξ(r)=ρ(α_(r⁻¹)(a))ξ(r)`
  and `λ_sξ(r)=ξ(s⁻¹r)`. K7 takes its full crossed products, and full group C*-algebras as `ℂ⋊G`,
  from here.
- `TauCeti.SmoothNoncommutativeTorus.twist`
  (`TauCeti/NoncommutativeGeometry/SmoothTorus/Basic.lean`): the phase `(y,z)↦exp(2πiθ y₂z₁)` of
  the smooth noncommutative torus. K7.5's rotation cocycle is this phase; the smooth algebra itself
  stays with NoncommutativeGeometry.

### From TauCetiRoadmap.CStarAlgebras

- *CStarAlgebras C1.* Ideals, quotients and functional calculus in ideals; in particular C1.4's
  quasicentral approximate units, C1.6's Calkin algebra `B(H)/K(H)`, simple for separable
  infinite-dimensional H and zero for finite-dimensional H, and C1.7's multiplier algebras with
  their strict topology.
- *CStarAlgebras C5.* Spatial tensor products, C*-inductive limits, the universal algebra on
  countably many unitaries, and the path, cone, suspension and mapping-cone algebras with their
  pullback and extension API.
- *CStarAlgebras C6–C8.* Nuclearity, exactness and completely positive liftings under their
  respective hypotheses; the Toeplitz extension `0→K→T→C(𝕋)→0` of the unilateral shift; and
  the Weyl–von Neumann–Voiculescu theorem.
- *CStarAlgebras C9.2.* Norm stability and unitary conjugacy of nearby systems of matrix units;
  in the one-block case, projections p and q with `‖p−q‖<1` are conjugate by a unitary u of the
  unitization with `‖u−1‖≤√2‖p−q‖`.

### From TauCetiRoadmap.HilbertModules

- *HilbertModules H1–H2.* The standard module `H_A=ℓ²(ℕ,A)`, compact and adjointable module
  operators, `K(H_A)≃A⊗K`, `L(H_A)≃M(A⊗K)`, finite direct sums and homogeneous operator
  blocks.
- *HilbertModules H3–H4.* Interior tensor products, Morita equivalence and Kasparov
  stabilization.
- *HilbertModules H5.* The analytic Serre–Swan equivalence.
- *HilbertModules H6–H7.* Regular operators, their bounded transforms and localization.

### From TauCetiRoadmap.OperatorAlgebraDynamics

- *[OperatorAlgebraDynamics D1–D2](../OperatorAlgebraDynamics/README.md).* Covariant
  representations and their Haar and involution conventions, consumed with Tau Ceti's full crossed
  product `TauCeti.CStarAction.FullCrossedProduct`; reduced crossed products, the regular Hilbert
  module, full and reduced group C*-algebras with `ℂ⋊G≃C*(G)`, the regular quotient, the faithful
  conditional expectation of a discrete reduced crossed product, Fell absorption and the weak
  containment of the trivial representation in the regular representation of an amenable group.
- *OperatorAlgebraDynamics D3–D4.* Green imprimitivity and Takai duality with its character
  conventions.
- *OperatorAlgebraDynamics D6.* The finite universal Cuntz algebras O_n.

### From TauCetiRoadmap.BanachAlgebras

- *[BanachAlgebras](../BanachAlgebras/README.md) Layer 1.2.* The left-multiplication renorming
  of a nonzero unital Banach algebra, with `‖1‖=1`.
- *BanachAlgebras Layer 2.* Holomorphic functional calculus, used for idempotent loops in the
  direct Bott proof and for K2.LocalNormed.

### From TauCetiRoadmap.GrothendieckEulerForms

- *[GrothendieckEulerForms](../GrothendieckEulerForms/README.md) Layers 1–2.* Categorical
  Grothendieck groups and their universal properties. Consume `TauCeti.SplitK0` and
  `Algebra.GrothendieckAddGroup`, comparing their presentations rather than defining another
  group-completion mechanism.

### From TauCetiRoadmap.TopologicalKTheory

- *[TopologicalKTheory T1–T6](../TopologicalKTheory/README.md).* Finite-rank continuous bundles,
  geometric K-groups of compact pairs and compact supports, geometric complex Bott periodicity
  with its tautological class β, and equivariant bundles. No geometric index theorem is a
  prerequisite for periodicity.

### From TauCetiRoadmap.AlgebraicKTheory

- *AlgebraicKTheory A0 (0.1, 0.3, 0.4).* For every unital ring R: Proj(R), the full subcategory
  `TauCeti.finiteProjectiveModules Rᵐᵒᵖ` of finitely generated projective right R-modules, with
  its zero object, finite biproducts and essential smallness (0.1); K₀(R), the group
  `TauCeti.SplitK0` of Proj(R), with K₀(f) given by extension of scalars along unital ring maps
  (0.3); and idempotent matrices with rectangular algebraic equivalence, `e∼f` exactly when
  `eRⁿ≅fRᵐ`, and the identification of K₀(R) with the group completion of the idempotent monoid
  (0.4). K1.4 and K3.5 apply them to unital C*-algebras and unital Fréchet algebras.
- *AlgebraicKTheory A1–A2, A6, A8.* The algebraic K₁ and its quotient construction, Milnor
  patching, and the comparison with topological K₁ of Banach algebras.

### From TauCetiRoadmap.VonNeumannAlgebras

- *[VonNeumannAlgebras](../VonNeumannAlgebras/README.md) V0.* The faithful Gelfand–Naimark
  representation of a C*-algebra.
- *VonNeumannAlgebras V11.* Pontryagin duality for locally compact abelian groups.

## How to read the build

Build the layers in the order K1–K9. Within K1, the projection calculus (1.1) precedes V(A) and
K₀ (1.2–1.3), and the module and bundle comparisons (1.4, 1.6) follow them. K2's unitary model
(2.1–2.3) precedes K2.LocalNormed (2.4), which K3's Fréchet comparison (3.5) consumes. In K3 the
Bott map and periodicity (3.1) come before the six-term sequence (3.2), which the pullback
sequence (3.3) and products (3.4) use. K4's Atkinson theorem (4.1) precedes the module index
(4.2), which the Busby invariants (4.4) use; the dilation theorem (4.3) needs only Hilbert
modules and precedes extension invertibility (4.5). K5 builds the graded cycles that K6
multiplies; the Manuilov–Thomsen comparison (6.5) uses K4's unital Ext. In K7, equivariant KK and
descent (7.1–7.2) precede K7.FreeGroups (7.3), whose tree interface comes first and is
independent of the rest of K7; the ℤ-action Pimsner–Voiculescu sequence (7.4) precedes the
twisted-centre and rotation calculations (7.5). The constructions of the Toeplitz–Cuntz algebras
and O_∞ in 7.6 use no K-theory; their K-groups use K2, K3 and K6 and precede K8's bootstrap
examples. K8 uses K6's semisplit exact sequences and K7's crossed products. The asymptotic
morphisms of 9.1–9.3 use no K-theory; K9's E-theory uses K3's suspension conventions and
compares with KK through K6.

`Suggested.lean` states, with `sorry`, the headline theorems that are statable at the pins:
Atkinson's theorem of 4.1 in its parametrix form, and the two Brown–Douglas–Fillmore theorems of
8.4 with the two operator predicates they need. Its module docstring lists the headline theorems
that are not statable there and the carrier each lacks.

## K1. Projections, projective modules, and K₀

### 1.1 Matrix calculus and projection equivalence

*Needs:* Mathlib `CStarMatrix`, `IsStarProjection`, `unitary`, `Unitization` and
`Unitary.joined`; Tau Ceti `TauCeti.IsPartialIsometry`,
`Matrix.fromBlocks_one_sub_mul_self_of_mul_eq` and
`Matrix.fromBlocks_one_sub_mul_fromBlocks_mul_fromBlocks_one_sub_of_mul_eq`; CStarAlgebras C1
functional calculus and C9.2 conjugacy of nearby projections.

Develop finite matrix amplification, corner inclusions and block sums with their norm and star
identities, arbitrary finite reindexing, associativity and permutation conjugacies. Define
rectangular Murray–von Neumann equivalence of matrix projections as in Conventions (Blackadar,
Definition 4.6.1 and Propositions 4.6.2–4.6.6).

- Murray–von Neumann equivalence is reflexive, symmetric and transitive, compatible with
  orthogonal sums, implied by unitary conjugacy, and preserved by *-homomorphisms.
- For square matrices the implementing elements are Tau Ceti's partial isometries
  `TauCeti.IsPartialIsometry`; their initial and final projections are given by
  `TauCeti.IsPartialIsometry.isStarProjection_star_mul_self` and
  `TauCeti.IsPartialIsometry.isStarProjection_mul_star_self`.
- Nearby projections: by CStarAlgebras C9.2 in its one-block case, projections p and q of the
  unitization with `‖p−q‖<1` are conjugate by a unitary u with `‖u−1‖≤√2‖p−q‖`. Prove the
  corollary that u lies in the identity path component of the unitary group of the unitization:
  `‖u−1‖<2`, so Mathlib `Unitary.joined` gives a path from 1 to u.
- A norm-continuous path of projections gives equivalence of its endpoints; after matrix
  stabilization, equivalent projections are joined by a path of projections. Supply the actual
  rotation paths and perturbation formulae used in these implications. For the stabilized
  conjugacy, if `v*v=p` and `vv*=q` then `vv*v=v`, and Tau Ceti's
  `Matrix.fromBlocks_one_sub_mul_fromBlocks_mul_fromBlocks_one_sub_of_mul_eq` and
  `Matrix.fromBlocks_one_sub_mul_self_of_mul_eq`, with a=v* and b=v, show that the self-adjoint
  unitary `w=[[1−p, v*], [v, 1−q]]` conjugates `p⊕0` to `0⊕q`; since `w=1−2r=exp(iπr)` for the
  projection `r=(1−w)/2`, the path `t↦exp(iπtr)` joins 1 to w.

**Checks.**
- For `p=diag(1,0)` and q the projection onto the line at angle φ, 0<φ<π/2, in M₂(ℂ):
  `‖p−q‖=sin φ<1`, the rotation u through φ has `upu*=q`, and `‖u−1‖=2sin(φ/2)≤√2 sin φ`
  because `cos(φ/2)≥1/√2`; so `‖u−1‖<2` and u is joined to 1.
- In `B(ℓ²(ℕ))` the unilateral shift S has `S*S=1` and `SS*=1−e₀₀`, so 1 and `1−e₀₀` are
  Murray–von Neumann equivalent, yet no unitary conjugates them (`u1u*=1`), and `‖1−(1−e₀₀)‖=1`
  lies outside the nearby-projection estimate. A definition of equivalence as unitary conjugacy
  separates these two projections.
- Stabilized conjugacy for p=q=1 in M₁(ℂ) and v=1: `w=[[0,1],[1,0]]` conjugates `diag(1,0)` to
  `diag(0,1)`, `r=(1−w)/2=[[1/2,−1/2],[−1/2,1/2]]` is a projection, and at t=1/2 the path
  `exp(iπtr)diag(1,0)exp(−iπtr)` passes through the rank-one projection `[[1/2,i/2],[−i/2,1/2]]`.
- In the nonunital algebra K the rank-one projections e₀₀ and e₁₁ are conjugate by
  `u=1−e₀₀−e₁₁+e₁₀−e₀₁`, which lies in the unitization K⁺ and not in K; it acts as rotation
  through π/2 on the span of δ₀,δ₁, so `‖u−1‖=√2<2`.

### 1.2 The projection monoid V(A) and K₀ of a unital algebra

*Needs:* 1.1; Mathlib `Algebra.GrothendieckAddGroup`.

Form V(A), the additive commutative monoid of matrix projections modulo rectangular equivalence,
with addition induced by block sum and zero from the zero projection (Blackadar, Definitions 5.1.1
and 5.1.2). For unital A, define K₀(A) by `Algebra.GrothendieckAddGroup (V A)` (Blackadar,
Definition 5.3.1). Cancellation in V(A) is not assumed.

- The class of a projection in V(A) is independent of the matrix size in which it is written and
  of finite reindexing: padding by zero blocks and conjugating by a permutation of the index set
  give equivalent projections, and block sum is well defined, associative and commutative on
  classes.
- Equality criterion in V(A): two matrix projections have the same class exactly when they are
  rectangularly equivalent after padding by zero blocks to any common sizes.
- Functoriality: a *-homomorphism φ:A→B applied entrywise induces a monoid homomorphism
  V(A)→V(B), with identities and composites preserved, and for unital A and B an additive map of
  K₀.
- Universal property: for unital A, every monoid homomorphism from V(A) to an abelian group factors
  uniquely through the class map V(A)→K₀(A).
- Generation by differences: every element of K₀(A) is `[p]−[q]` for matrix projections p, q.
- Equality criterion in K₀(A): `[p]−[q]=[p']−[q']` exactly when some matrix projection r makes
  `p⊕q'⊕r ∼ p'⊕q⊕r`.

**Checks.**
- For A=ℂ the 1×2 matrix `v=(1 0)` has `v*v=diag(1,0)` in M₂(ℂ) and `vv*=1` in M₁(ℂ), so
  `[diag(1,0)]=[1]`; V(ℂ)≅ℕ by rank and K₀(ℂ)≅ℤ with `[1_(M_n)]↦n`. A definition comparing only
  square matrices of one size cannot identify these two classes.
- For B(H) with H infinite-dimensional separable, `1⊕1∼1` because H⊕H≅H, so `[1]+[1]=[1]` in
  V(B(H)) while `[1]≠0`; V(B(H)) is not cancellative and K₀(B(H))=0. A definition assuming
  cancellation would force `[1]=0` in V(B(H)).
- For the zero algebra every matrix projection is zero, V(0)=0 and K₀(0)=0; size-zero matrices
  give the zero element of V(A) for every A.

### 1.3 K₀ of a nonunital algebra

*Needs:* 1.2; Mathlib `Unitization` with its C*-norm.

For arbitrary A use the forced C*-unitization `A⁺` and its augmentation `ε:A⁺→ℂ`; define
`K₀(A)=ker K₀(ε)` (Blackadar, Definition 5.5.1 and Proposition 5.4.1).

- Split decomposition: the scalar inclusion ℂ→A⁺ splits K₀(ε), so `K₀(A⁺)≃K₀(A)⊕ℤ`.
- For unital A this group is naturally isomorphic to the K₀(A) of 1.2.
- Functoriality: every *-homomorphism, unital or not, induces a homomorphism of K₀ through its
  unitization, with identities and composites preserved.
- Representatives: every element of K₀(A) is a difference of classes of unitization projections
  whose scalar parts have equal rank; after stabilization and conjugation by a scalar unitary the
  two scalar projections are equal.
- Projections in matrices over A alone need not generate K₀(A) (Blackadar, Example 5.5.3); K3
  supplies the Bott-class example after periodicity establishes its nonvanishing.

**Checks.**
- For unital A the forced unitization is `A⁺≅A×ℂ` by `a+λ↦(a+λ1,λ)`; for A=ℂ this gives
  `K₀(ℂ⁺)=ℤ²` with K₀(ε) the second projection, whose kernel ℤ×0 is the unital K₀(ℂ).
- For A=C₀(ℝ²) no matrix over A carries a nonzero projection (the rank is locally constant on
  the connected plane and vanishes at infinity), yet K₀(C₀(ℝ²))≅ℤ by K3. A definition as the
  group completion of V(A) gives 0 here.
- For A=K the rank-one projection e₀₀ lies in K itself and generates K₀(K)≅ℤ.

### 1.4 Projective modules and the split Grothendieck group

*Needs:* 1.2; AlgebraicKTheory A0 (0.1 Proj(R), 0.3 K₀ and its functoriality, 0.4 idempotents
and rectangular equivalence); Tau Ceti `TauCeti.finiteProjectiveModules` and `TauCeti.SplitK0`;
GrothendieckEulerForms Layers 1–2.

For unital A use AlgebraicKTheory 0.1's Proj(A), the full subcategory
`TauCeti.finiteProjectiveModules Aᵐᵒᵖ` of finitely generated projective right A-modules, with its
zero object, finite biproducts and essential smallness, and AlgebraicKTheory 0.3's K₀(A), the
group `TauCeti.SplitK0` of Proj(A) with K₀(f) given by extension of scalars (Blackadar, 1.7.2, for
K₀ of a unital ring through its projective modules). No other module category is constructed
here.

- Every object of Proj(A) is isomorphic to a range `p Aⁿ` of a matrix projection: AlgebraicKTheory
  0.4 gives an idempotent e with `e Aⁿ` isomorphic to it, and the projection p of Blackadar,
  Proposition 4.6.2, satisfies `ep=p` and `pe=e`, so `p Aⁿ=e Aⁿ`.
- For matrix projections p over `M_n(A)` and q over `M_m(A)`, `p Aⁿ≅q Aᵐ` exactly when p and q
  are Murray–von Neumann equivalent. By AlgebraicKTheory 0.4 the isomorphism holds exactly when
  p and q are algebraically equivalent idempotents (Roe, Lemma 2.13), and algebraically equivalent
  projections are Murray–von Neumann equivalent by the polar argument of Blackadar, Proposition
  4.6.4; conversely a rectangular v with `v*v=p` and `vv*=q` gives the algebraic equivalence
  `x=v*`, `y=v`.
- Sending `[p]` to `[p Aⁿ]` gives an isomorphism from K₀(A) of 1.2 onto AlgebraicKTheory 0.3's
  K₀(A), natural for unital *-homomorphisms f:A→B, where the target map is K₀(f) and
  `p Aⁿ⊗_A B≅f(p) Bⁿ`. It is the composite of the monoid isomorphism from V(A) to AlgebraicKTheory
  0.4's idempotent monoid, given by the two preceding facts, with 0.4's identification of the
  group completion of that monoid with K₀(A).
- An idempotent matrix e is similar to a projection with the same range module (Blackadar,
  Proposition 4.6.2), and the resulting K-classes agree.

**Checks.**
- For A=ℂ the category is that of finite-dimensional vector spaces, `[ℂⁿ]↦n` identifies
  `TauCeti.SplitK0` with ℤ, and the comparison sends `[1_(M_n)]` to `[ℂⁿ]`, matching K₀(ℂ)≅ℤ.
- The idempotent `e=[[1,1],[0,0]]` in M₂(ℂ) satisfies `e²=e` but is not self-adjoint; its range
  is `ℂ×0`, whose orthogonal projection is diag(1,0), so `eℂ²≅ℂ` and the class is 1. A comparison
  defined only on self-adjoint representatives must convert e first.
- For A=B(H), H infinite-dimensional separable, `A²≅A` as right A-modules because H⊕H≅H, so
  `[A]+[A]=[A]` and `[A]=0` in `TauCeti.SplitK0`, matching `K₀(B(H))=0` of 1.2; a comparison that
  counted free ranks would give `[A]=1`.
- Naturality along the unital inclusion f:ℂ→M₂(ℂ): on projections `[1]↦[1_(M₂)]=[e₁₁]+[e₂₂]=2[e₁₁]`,
  and on modules K₀(f) sends `[ℂ]` to `[ℂ⊗_ℂ M₂(ℂ)]=[M₂(ℂ)]`, which is `2[e₁₁M₂(ℂ)]` because
  `M₂(ℂ)=e₁₁M₂(ℂ)⊕e₂₂M₂(ℂ)`; both sides give 2, whereas a comparison normalized by matrix size
  would send `[1_(M₂)]` to 1.

### 1.5 Order, scale and tracial pairings

*Needs:* 1.2–1.3; Mathlib `Matrix.trace`.

Define the canonical positive cone of K₀(A) as the set of classes of actual projections over A,
the scale as the set of classes of projections in A itself, and the resulting preorder. For unital
A record the distinguished order unit `[1_A]`. Let τ be a positive tracial functional on A, a
positive linear functional with `τ(ab)=τ(ba)`; it is bounded, as every positive functional on a
C*-algebra is, and need not have norm 1. Define the additive pairing `τ_*:K₀(A)→ℝ` through the
unnormalized matrix trace `τ_m(p)=∑ᵢτ(p_ii)` (Blackadar, §6.3 for the order and §6.9 for the
states induced by traces). For nonunital A extend τ by `τ⁺(a+λ)=τ(a)+λ` to the forced
unitization, and pair a representative `[e]−[p_n]`, with e in `M_m(A⁺)` whose scalar part is the
rank-n scalar projection p_n, as `τ⁺_m(e)−n`; this is `τ_m(e−p_n)`, because `e−p_n` has entries
in A, so neither positivity of τ⁺ nor a bound on ‖τ‖ enters. Tracial states are the norm-one case,
and for unital A they induce states of `(K₀(A),K₀(A)⁺,[1_A])`. These are the projection and trace
invariants that CStarClassification's dimension-group classification of AF algebras uses.

- The preorder is a partial order when the cone is proper, `K₀(A)⁺∩(−K₀(A)⁺)=0`; partial-order
  statements are made only under that hypothesis.
- For unital A, `[1_A]` is an order unit, and unital *-homomorphisms preserve the cone, the scale
  and the order unit.
- The trace pairing is independent of representatives, additive and positive on the cone, and
  natural: for a *-homomorphism φ:A→B and a positive tracial functional τ of B, `τ∘φ` is a
  positive tracial functional of A and `(τ∘φ)_*=τ_*∘φ_*`. Its behaviour under C*-inductive limits
  is stated in 2.3, after continuity of K₀.
- For a finite-dimensional direct sum the pairing is computed summand by summand.
- The compact-operator example uses its K₀ rank-one generator and the ordinary densely defined
  trace on finite-rank and Pedersen-ideal elements; K has no nonzero positive tracial functional.

**Checks.**
- For A=Mₙ(ℂ) with the normalized trace `tr/n`, a rank-one projection pairs to `1/n` and
  `[1_(M_k(A))]` pairs to k through the unnormalized matrix trace.
- For A=C(X) and τ evaluation at a point x, the pairing of `[p]` is the rank of the bundle of p at
  x, an integer; a pairing through a normalized matrix trace would give rank divided by size.
- For A=K the rank-one generator pairs to 1 with the densely defined trace, while a positive
  tracial functional τ on K is 0: the matrix units give `τ(e_ii)=τ(e_ij e_ji)=τ(e_ji e_ij)=τ(e_jj)`
  and `Nτ(e_00)=τ(e_00+⋯+e_(N−1,N−1))≤‖τ‖` for every N, so τ vanishes on every e_ii and, by the
  Cauchy–Schwarz inequality, on the dense finite-rank operators. The example cannot be routed
  through the functional pairing.
- For `φ:ℂ→ℂ²`, `λ↦(λ,0)`, and `τ(a,b)=b` on ℂ², `τ∘φ=0` is a positive tracial functional that
  is not a state, and `(τ∘φ)_*[1]=0=τ(1,0)=τ_*(φ_*[1])`; a pairing defined only for tracial
  states would leave the left side undefined.
- For A=C₀(ℝ²), τ the evaluation at a point x, and the Bott class `β=[p]−[p(∞)]` of Conventions,
  the scalar part of p is `p(∞)=diag(1,0)` of rank 1 and `τ⁺_2(p)−1=trace p(x)−1=0`, which is
  `τ_2(p−p(∞))`; omitting the correction −n would pair β, and also the zero class
  `[p(∞)]−[p(∞)]`, to 1.

### 1.6 Commutative algebras and vector bundles

*Needs:* 1.2–1.3; HilbertModules H5 Serre–Swan equivalence; TopologicalKTheory T1–T3.

For compact Hausdorff X use H5's Serre–Swan equivalence to identify `K₀(C(X))` with geometric K⁰(X)
(Blackadar, 1.7.1; Roe, Proposition 1.12), naturally for continuous maps and compatibly with
products and rank functions on disconnected spaces. Extend to locally compact Hausdorff X using
unitization/compactification, with proper pullback and open-extension compatibility. Do not identify
compactly supported K-theory with unrestricted bundle theory on a noncompact space.

### Examples

- K₀(Mₙ(ℂ))≅ℤ with `[1]↦n`; K₀(K)≅ℤ generated by a rank-one projection; K₀(B(H))=0 for
  infinite-dimensional separable H.
- For a finite-dimensional direct sum `⊕ᵢ M_(nᵢ)(ℂ)` the group is `ℤ^k`, the positive cone is
  `ℕ^k`, the order unit is `(nᵢ)ᵢ`, and each tracial state pairs as a positive weighting of
  ranks.
- For X a finite discrete space, `K₀(C(X))` is the group of integer functions on X, matching
  the rank function of bundles.

### Dependencies

Mathlib C*-algebra, matrix, unitization and Grothendieck-group APIs; Tau Ceti `TauCeti.SplitK0`,
`TauCeti.finiteProjectiveModules`, `TauCeti.IsPartialIsometry` and the block-matrix conjugacy of
`TauCeti/Data/Matrix/Block.lean`; CStarAlgebras C1 and C9.2;
AlgebraicKTheory A0; HilbertModules H5; GrothendieckEulerForms Layers 1–2; TopologicalKTheory
T1–T3.

## K2. Unitaries, K₁, and functorial properties

### 2.1 K₁ of a unital algebra

*Needs:* K1; Mathlib `unitary`, `Unitary.mem_pathComponentOne_iff` and its logarithm charts.

For unital A form the stable unitary group by the inclusions `u↦diag(u,1)` and define K₁(A) by
stable norm-homotopy classes (Blackadar, Definition 8.1.1 and Proposition 8.1.3; Roe, Proposition
6.2(b)). Consume Mathlib's unitary logarithm charts, local path connectedness and
finite-exponential-product description of the identity component.

- Representatives: every class is the class of a unitary in some `M_n(A)`, and two unitaries have
  equal classes exactly when they become homotopic after one common finite stabilization.
- Block-sum addition `[u]+[v]=[diag(u,v)]` is well defined, the identity class is `[1]`, and the
  inverse is given by the adjoint, `−[u]=[u*]`.
- The rotation homotopies connect `diag(u,v)` with `diag(uv,1)` and with `diag(vu,1)`, so K₁(A)
  is abelian and its addition agrees with multiplication of unitaries of equal size.
- The polar deformation `x↦x(x*x)^(-t/2)` compares the stable homotopy classes of invertible
  matrices with K₁(A), and this comparison is natural for unital *-homomorphisms.

**Checks.**
- In C(𝕋) the coordinate unitary z has winding number 1, `[z]+[z]=[z²]` through the rotation
  homotopy between `diag(z,z)` and `diag(z²,1)`, and `[z*]=−[z]`; winding number gives
  K₁(C(𝕋))≅ℤ with `[z]↦1`.
- For A=C(S³) every unitary of A itself is homotopic to 1 (S³ is simply connected, so it lifts
  through the exponential), whereas the coordinate unitary of M₂(C(S³)) from `S³≅SU(2)`
  generates K₁(C(S³))≅ℤ. A definition using the unitary group of A without matrix
  stabilization misses this class.
- For finite-dimensional A every unitary is `exp(ih)` with h self-adjoint, so K₁(A)=0; the
  polar deformation sends the invertible `2∈ℂ` to the unitary 1.

### 2.2 Nonunital K₁, functoriality and stability

*Needs:* 2.1; K1.3.

For nonunital A define K₁(A) by stable homotopy classes of unitization unitaries whose scalar
part is the identity (Blackadar, 8.1.5 and Corollary 8.3.7).

- Every class of `K₁(A⁺)` restricting to 0 in `K₁(ℂ)` has such a representative, homotopies can
  be chosen with the same scalar condition, and the construction agrees with
  `ker(K₁(A⁺)→K₁(ℂ))`; for unital A it agrees with 2.1.
- Both K-groups are functorial for arbitrary *-homomorphisms, with identity, composition,
  homotopy invariance, finite direct sums and zero maps.
- Stability: finite-matrix corners induce isomorphisms, and the rank-one corner `a↦a⊗p` induces
  `K_i(A)≃K_i(A⊗K)` for every rank-one projection p (Roe, Example 7.14), with all matrix sizes
  and all rank-one choices compared.

**Checks.**
- Since `K₁(ℂ)=0`, the kernel condition is vacuous on K₁ and `K₁(A)≅K₁(A⁺)`; for A=K every
  unitary `1+k` with k compact has spectrum accumulating only at 1, so it has a logarithm in K⁺
  and `K₁(K)=0`.
- For A=ℂ the corner `λ↦λe₀₀` sends `[1]` to the generator `[e₀₀]` of K₀(K), while the corner
  `λ↦λ(e₀₀+e₁₁)` of a rank-two projection sends `[1]` to `2[e₀₀]` and is not an isomorphism; the
  stability isomorphism needs a rank-one corner.
- For A=C₀(ℝ) the unitization loop `exp(2πit)`, written in the coordinate of Conventions, has
  scalar part 1 and winding number 1, and generates K₁(C₀(ℝ))≅ℤ; the constant unitary −1 of
  C₀(ℝ)⁺ has scalar part −1 and is not an admissible representative.

### 2.3 Continuity, Morita invariance and cone sequences

*Needs:* 2.2; 1.5 for the trace pairing under limits; CStarAlgebras C5 inductive limits and path,
cone, suspension and mapping-cone algebras; HilbertModules H3–H4.

Prove continuity of K₀ and K₁ for C*-inductive systems, including noninjective connecting maps
(Blackadar, 5.2.4 and 8.1.5; Roe, Proposition 7.11 for injective ones): projections and unitaries
lift approximately to a finite stage and are corrected by functional calculus, and stabilized
equivalences and homotopies descend after increasing the stage. Supply the uniform estimates for
compact homotopy parameters. Deduce countable direct-sum additivity and countability of K-groups for
separable A.

- Trace pairing under limits: for a C*-inductive system with limit A, maps `φ_(i,∞):Aᵢ→A` and a
  positive tracial functional τ of A, a tracial state for instance, put `τᵢ=τ∘φ_(i,∞)`, a positive
  tracial functional on Aᵢ that need not be a state, paired with K₀(Aᵢ) by 1.5. Then
  `τ_*∘(φ_(i,∞))_*=(τᵢ)_*` on K₀(Aᵢ), and since every class of K₀(A) comes from a finite stage, the
  pairing of τ on K₀(A) is the map induced on `lim K₀(Aᵢ)≅K₀(A)` by the `(τᵢ)_*`. The first
  identity is 1.5's naturality, `τ_m(φ(p))=Σ_jτ(φ(p_jj))=(τ∘φ)_m(p)`, which needs no normalization
  of τ∘φ; the second is the continuity above.

Use H3–H4 to prove Morita invariance for σ-unital algebras (Roe, Proposition 12.17),
identify the map induced by an imprimitivity module, and prove identity, composition and agreement
with full-corner maps; distinguish the chosen natural map from an abstract existence of a stable
isomorphism.

Consume CStarAlgebras C5's path, cone, suspension and mapping-cone algebras and their
pullback/extension API, with the cone/evaluation convention fixed in Conventions. Establish their
K-theory sequences and homotopies (Blackadar, Theorem 8.2.2 and Corollary 8.2.3), cone
contractibility, and the action of orientation reversal on suspension classes. Develop the
elementary exactness and lifting lemmas before using Bott to close a six-term sequence.

### 2.4 K2.LocalNormed: component groups of normed local algebras

*Needs:* 2.1; BanachAlgebras Layer 1.2 renorming and Layer 2 holomorphic calculus;
AlgebraicKTheory A1–A2 and A8.

Extend the component-group construction to a unital normed complex algebra B with Banach
completion B̄, using the inherited norm topology on B (Blackadar, Definition 3.1.1 and
Proposition 3.4.3, for local Banach algebras). Require that B embeds unitally into B̄ and
that, at every finite matrix size, B is closed under the holomorphic functional calculus computed
in M_n(B̄). This is an explicit all-matrix hypothesis. It does not assert completeness of B or the
existence of contour integrals in an unspecified stronger topology. Include the zero algebra and
size-zero matrices separately. For `O_n={g: ‖g−1‖<1 and ‖g⁻¹−1‖<1}` in `GL_n(B)`, form the
directed colimit of the component groups `GL_n(B)/GL_n(B)_0` under g↦diag(g,1).

- Consume BanachAlgebras' holomorphic calculus in the completion: the resulting inverse,
  exponential and logarithm values belong to M_n(B).
- Renorming: for nonzero B, BanachAlgebras' left-multiplication norm comparison extends to the
  normed case and gives an equivalent algebra norm with ‖1‖=1. Use its maximum row-sum matrix
  norm; the resulting topology is independent of the equivalent standard finite-matrix norm
  chosen.
- GL_n(B) is an open topological group, and its identity component equals its path component and
  the subgroup of finite products of exponentials.
- O_n is open and inverse-symmetric, and `GL_n(B)_0=⋃_(k≥1) O_n^k`. The logarithm argument uses
  the strict inequality ‖g−1‖<1: its completion spectrum lies in the open disc about 1 on which
  the chosen logarithm branch is holomorphic. The path `t↦exp(t log g)` is norm continuous, by
  comparison with the completion. The generated subgroup is open and closed, and its cosets
  identify the connected component; no inverse symmetry is assumed for a norm ball. Thus
  GL_n(B)/GL_n(B)_0 is a discrete group.
- The colimit has common-finite-stage representative and equality criteria, its block-sum and
  multiplication agree, and it is an abelian group.
- Consume AlgebraicKTheory A1–A2 and A8 for the single algebraic K₁ and its quotient
  construction: the paths `t↦e_ij(ta)` put E_infinity(B) in the stable identity component, giving
  a natural surjection `K₁_alg(B)→K₁_top(B)` with kernel the image of that component modulo
  E_infinity(B). At a fixed finite size use the map from GL_n(B) itself; write a quotient by
  E_n(B) as a group only where its normality is proved.
- Lifting: for a continuous surjective unital homomorphism between algebras satisfying these
  hypotheses, matrix exponentials and their finite products lift invertibly, by lifting their
  logarithm/exponent coefficients and using functional-calculus naturality in the completions.
  This is a lifting theorem for the identity component, not for arbitrary units.
- For Banach algebras this construction agrees with A8's existing one; for C*-algebras it agrees
  with 2.1's unitary model through the polar homotopy. The stronger Fréchet-topology comparison in
  3.5 retains its own hypotheses.

**Checks.**
- For B=ℂ, `GL₁(ℂ)=ℂ^×` is connected, so the component group is trivial; for B=C(𝕋) the
  unit z is not in the identity component, and its class is the winding generator of 2.1.
- The ball `{g: ‖g−1‖<1}` alone is not inverse-symmetric: in ℂ the point `g=1/10` has
  `|g−1|<1` but `|g⁻¹−1|=9`, which is why O_n imposes both inequalities.
- For the zero algebra `GL_n(0)` is the trivial group at every size, including n=0, and the
  colimit is 0.

### Examples

- K₁(ℂ)=K₁(Mₙ(ℂ))=K₁(K)=0; K₁(C(𝕋))≅ℤ generated by `[z]`; K₁(C₀(ℝ))≅ℤ generated by the positive
  loop `exp(2πit)` in the unitization.
- For the CAR algebra `M_(2^∞)`, the limit of the `M_(2^k)(ℂ)` under `a↦diag(a,a)`, with its
  tracial state τ: here `τ_k` is the normalized trace of `M_(2^k)`, a rank-one projection e of
  `M_(2^k)` pairs to `2^(−k)`, and its image `diag(e,e)` in `M_(2^(k+1))` pairs to
  `2/2^(k+1)=2^(−k)` again. Continuity identifies K₀(M_(2^∞)) with `lim(ℤ→ℤ→…)` under
  multiplication by 2, that is with ℤ[1/2], and the τ-pairing is the inclusion `ℤ[1/2]⊂ℝ`.
- The polynomial algebra ℂ[z] with the supremum norm on the closed unit disc fails the
  hypothesis of K2.LocalNormed: `z−2` is invertible in its completion, the disc algebra, but its
  inverse is not a polynomial. The algebra of functions holomorphic on a neighbourhood of the
  closed disc satisfies it at every matrix size, since holomorphic calculus composes holomorphic
  functions.

### Dependencies

K1; Mathlib unitary-group APIs; CStarAlgebras C5; HilbertModules H3–H4; BanachAlgebras Layers 1–2;
AlgebraicKTheory A1–A2 and A8.

## K3. Bott periodicity, boundary maps, and products

### 3.1 The Bott map and periodicity

*Needs:* K1–K2; BanachAlgebras Layer 2 holomorphic calculus; TopologicalKTheory T4 for the
geometric comparison.

Define the positive Bott map `b_A:K₀(A)→K₁(SA)` on unitization representatives by

```
f_e(t) = exp(2πit)e + (1−e),
b_A([e]−[p_n]) = [f_e f_(p_n)⁻¹].
```

Both endpoints and the scalar part of the resulting loop are the identity. For the other parity
use θ_A as fixed in Conventions.

- b_A is independent of representatives and natural.
- Bott periodicity: b_A is an isomorphism for arbitrary A (Blackadar, Definition 9.1.1 and Theorem
  9.2.1). A direct proof must supply uniform approximation of invertible loops, correction of
  approximate homotopies, stabilized polynomial-loop reduction, the companion-matrix reduction to
  degree one, and spectral separation followed by holomorphic functional calculus to obtain an
  idempotent loop, and must prove uniqueness of the resulting stable idempotent class as well as
  existence. This makes the coefficient Bott theorem independent of KK-theory and of geometric
  index theory.
- The exponential boundary of `0→SA→CA→A→0` is b_A (Blackadar, 9.3.2). For a unitization
  projection e with scalar projection p, use the self-adjoint lift `x(s)=p+s(e−p)` in the
  unitization of the cone, whose scalar part is the fixed p. Its exponential loop is homotopic to
  `f_e f_p⁻¹` by the explicit homotopy

  ```
  H(r,s) = exp(2πi[s e+(1−r)(1−s)p]) exp(2πi r(1−s)p),
  0≤r,s≤1.
  ```

  Its r=0 end is `exp(2πi x(s))` and its r=1 end is `f_e(s)f_p(s)⁻¹`; for every r both
  s-endpoints and the scalar part are the identity. Prove these identities and norm continuity
  without assuming e commutes with p.
- `θ_(Sℂ)(b_ℂ[1])=β` in the ordered (s,t) plane. For the index lift of `u(t)=exp(2πit)`, take
  `w=diag(u,1) R(s) diag(1,u⁻¹) R(s)⁻¹`, where R(s) is real rotation through `π(1−s)/2`: w(0,t)=1
  and w(1,t)=diag(u,u⁻¹). The projection `w diag(1,0) w⁻¹` has boundary frame u on the s=1 edge
  and frame 1 on the other edges; compare its positive clutching with the displayed tautological
  projection.
- `K_i(S²A)≃K_i(A)` with these coordinate and boundary maps and no unspecified parity
  isomorphism.
- β is nonzero, and `C₀(ℝ²)` has no nonzero actual matrix projections, giving K1's unitization
  example.
- The comparison with TopologicalKTheory's periodicity holds through the bundle/projection maps.

**Checks.**
- For a projection e, `exp(2πite)=1+(exp(2πit)−1)e=f_e(t)`, so `f_e(0)=f_e(1)=1`; for A=ℂ and
  e=1, `b_ℂ[1]` is the loop `exp(2πit)` of winding +1, the positive generator of K₁(Sℂ). The
  opposite convention gives winding −1.
- The homotopy H satisfies all four boundary identities without `ep=pe`: at r=0 it is
  `exp(2πi[se+(1−s)p])=exp(2πi x(s))`; at r=1 it is `f_e(s)f_p(s)⁻¹` because `exp(2πi p)=1`; at
  s=0 it is `exp(2πi(1−r)p)exp(2πirp)=1`; at s=1 it is `exp(2πi e)=1`.
- The Bott projection satisfies `M²=(1+|z|²)M` for `M=[[|z|²,z],[conjugate z,1]]`, so p(z) is a
  rank-one projection with range the line through `(z,1)`; `p(0)=diag(0,1)` and `p(z)→diag(1,0)`
  as `z→∞`, matching TopologicalKTheory's tautological line.

### 3.2 The six-term exact sequence of an extension

*Needs:* 3.1; K2.3 cone and mapping-cone sequences; CStarAlgebras C8 Toeplitz extension.

For every short exact sequence `0→J→A→Q→0`, construct the natural cyclic six-term sequence, with no
separability or completely positive splitting assumption (Blackadar, Theorem 9.3.1). Its boundary
maps are `δ₁:K₁(Q)→K₀(J)` and `δ₀:K₀(Q)→K₁(J)`. Construct the index boundary by lifting
`diag(u,u⁻¹)` to an invertible matrix w over the unitization and taking `[w p_n w⁻¹]−[p_n]`
(Blackadar, Definition 8.3.1), with idempotents converted to projections by K1. For a projection
e over Q⁺, with scalar part p_n, choose a self-adjoint lift x over A⁺; the exponential boundary is
`δ₀([e]−[p_n])=[exp(2πi x)]`, a unitary equal to the identity modulo J.

- δ₁ is independent of the lift, and agrees with the partial-isometry formula whenever such a
  lift v exists (Blackadar, 8.3.2):

  ```
  δ₁[u] = [1−v*v] − [1−vv*].
  ```

- δ₀ is independent of the lift and given by the displayed exponential (Blackadar, 9.3.2).
- Both boundaries are additive and natural for morphisms of extensions, and the sequence is exact
  at all six positions.
- The two boundaries are compatible with suspension and Bott, with the signs recorded explicitly.
- Mapping-cone and relative K-groups, the long exact sequence of a *-homomorphism and excision for
  ideals are developed, with the identifications relating these presentations to the six-term
  sequence.
- In the Toeplitz extension constructed in CStarAlgebras C8 the symbol z has boundary −1, because
  its lift is the unilateral shift; the K-groups of the Toeplitz algebra and the maps of that
  extension are computed.

**Checks.**
- In the Toeplitz extension `0→K→T→C(𝕋)→0` the unilateral shift S lifts z, and
  `δ₁[z]=[1−S*S]−[1−SS*]=0−[e₀₀]=−1`, which equals `index S=0−1`; a boundary with the opposite
  sign convention gives +1.
- For the cone extension of A=ℂ the exponential boundary sends `[1]` to the positive loop of
  3.1, so δ₀ and b_ℂ agree on the generator.
- For a split extension `0→J→J⊕Q→Q→0` both boundaries vanish, and for `0→K→B(H)→Q(H)→0` exactness
  with `K₀(B(H))=K₁(B(H))=0` makes δ₁ an isomorphism `K₁(Q(H))≃ℤ`.

### 3.3 Pullback Mayer–Vietoris

*Needs:* 3.2; AlgebraicKTheory A6 and A8 for the unital comparison. The closed pullback is
constructed here, on the model of CStarAlgebras C5.5's mapping cone.

Let π_j:A_j→Q be arbitrary *-homomorphisms of complex C*-algebras, with at least one π_j
surjective. Construct the closed pullback D=A₁×_Q A₂ with its projections p_j, including nonunital
and zero cases. First take π₁ surjective and put J=ker π₁. Identify the two exact extensions
`0→J→D→A₂→0` and `0→J→A₁→Q→0`, with J→D given by j↦(j,0); D→A₂ is onto because every π₂(a₂) lifts
through π₁. For i=0,1 define the pullback boundary by the second extension boundary followed by
this inclusion: `∂_i:K_i(Q)→K_(i−1)(J)→K_(i−1)(D)`, with indices modulo two. No separability or
completely positive splitting is assumed. A square with neither leg surjective is outside this
exactness assertion.

- D has the C*-universal property of the pullback.
- The cyclic sequence

  ```
  K₀(D) → K₀(A₁)⊕K₀(A₂) → K₀(Q) →∂₀ K₁(D)
        → K₁(A₁)⊕K₁(A₂) → K₁(Q) →∂₁ K₀(D)
  ```

  is exact at every term, by the diagram chase between the six-term sequences of these two
  extensions. The first maps are `(p₁*,p₂*)` and the second maps are `π₁*−π₂*`. Blackadar, Theorem
  21.2.2, proves the sequence for any homology theory when both legs are surjective, and the remark
  after it removes that hypothesis by Schochet, *Topological methods for C*-algebras III*, Theorem
  4.5, p. 431, which needs only the first leg surjective; the one-surjective-leg case here is the
  comparison of the two extensions above.
- The sequence is natural for maps of pullback squares and compatible with suspension and the
  fixed Bott maps. Swapping the two legs and identifying the pullbacks negates the boundary.
- For unital squares ∂₁ agrees with AlgebraicKTheory A6/A8 after the algebraic-to-topological K₁
  quotient, including the normalization `[M(u)]−[Dⁿ]`: if X lifts diag(u,u⁻¹) through π₁ and
  e=diag(I,0), the class is `[(XeX⁻¹,e)]−[(e,e)]`, converting the resulting idempotent to a
  projection by K1.

**Checks.**
- If A₂=0 then D=J and the sequence is the six-term sequence of `0→J→A₁→Q→0`, with ∂ equal to
  its boundary.
- If Q=0 then D=A₁×A₂, ∂=0 and the sequence splits as `K_i(D)=K_i(A₁)⊕K_i(A₂)`.
- For the patching element, `π₁(XeX⁻¹)=diag(u,u⁻¹)e diag(u⁻¹,u)=e=π₂(e)`, so `(XeX⁻¹,e)` lies in
  M_(2n)(D), and `[XeX⁻¹]−[e]` pushed along `j↦(j,0)` plus the unit `(e,e)` is
  `[(XeX⁻¹,e)]−[(e,e)]`.

### 3.4 External products

*Needs:* 3.1–3.2; CStarAlgebras C5 spatial tensor products; TopologicalKTheory T2 external
products.

Define external products `K_i(A)⊗ℤK_j(B)→K_(i+j)(A⊗B)`, with spatial tensor products, first on
projection and unitary representatives, with `[p]×[q]=[p⊗q]` for projections over unital
algebras, and then through suspension for the odd cases; this is the map α of the Künneth theorem
(Blackadar, Theorem 23.1.3). K3's construction does not use KK-theory; K5–K6 own the subsequent
explicit Clifford/KK product comparison.

- The product is well defined, bilinear, natural in both variables and associative, with unit
  `[1_ℂ]` under `ℂ⊗B=B`, and graded commutative: the tensor flip carries `x×y` to
  `(−1)^(ij)y×x` for x of degree i and y of degree j.
- It is compatible with stability and Bott maps, and with the boundary maps of an extension
  whenever tensoring that extension preserves exactness; that hypothesis is stated at each use,
  and holds when the other tensor factor is exact.
- For commutative algebras it agrees with tensor products of bundles and with
  TopologicalKTheory T2's geometric external product.
- Torus pinning: q collapses the two coordinate circles in 𝕋² and has degree +1 from the ordered
  (s,t) two-cell to the complex-oriented sphere, and the positive winding classes satisfy
  `[z_s]×[z_t]=q*β` for the tautological β of Conventions. Construct the representative and prove
  this pinning using the ordered suspension and clutching maps; compute the sphere and torus
  examples with their generators and grading.

**Checks.**
- The unit: `[1_ℂ]×x=x` for every x in `K_i(B)`; for B=ℂ, `[1]×[1]=[1]` in K₀(ℂ)≅ℤ, so the
  product on K₀(ℂ)⊗K₀(ℂ) is multiplication of integers.
- `[z_s]×[z_t]=q*β` has rank 0: evaluation at a point of 𝕋² kills β, so the product of the two
  degree-one classes lies in reduced K₀(C(𝕋²)), and with `[1]` it forms a basis of
  K₀(C(𝕋²))≅ℤ², as the Künneth count `K₀⊗K₀⊕K₁⊗K₁=ℤ⊕ℤ` predicts.
- Graded commutativity on the torus: the coordinate flip τ of 𝕋² makes `qτ` of degree −1, so the
  flip carries `[z_s]×[z_t]` to `−q*β=−([z]×[z])`, the sign `(−1)^(1·1)`; a product commutative
  without sign would force `2q*β=0`, false in the torsion-free group ℤ².

### 3.5 Dense inverse-closed Fréchet subalgebras

*Needs:* 3.1–3.2; K2.LocalNormed; AlgebraicKTheory 0.3–0.4 for the algebraic comparison; Mathlib
`TopologicalSpace.MetrizableSpace`, `CompleteSpace`, `IsTopologicalAddGroup`, `LocallyConvexSpace`
and `ContinuousStar`.

Develop topological K-theory of dense inverse-closed Fréchet subalgebras `𝒜⊆A`, where the Fréchet
topology is stronger than the ambient C*-norm topology, and require inverse closure of
unitizations in the nonunital case (Roe, Theorem 14.5 and Lemma 16.3; Blackadar, Definition 3.1.1
for the holomorphic-calculus closure). Use a metrizable complete Hausdorff locally convex complex
topological vector space with continuous multiplication and star, and an injective continuous
dense *-algebra map to A. In Lean use `MetrizableSpace`, `CompleteSpace`, `IsTopologicalAddGroup`,
`LocallyConvexSpace`, continuous scalar action and `ContinuousStar`; the topology need not come
from one norm. Use matrix idempotents and invertibles; paths use the Fréchet topology. The
smooth-algebra differential calculus and its cyclic cohomology are outside this roadmap.

- Matrix spectral invariance and holomorphic-functional-calculus closure hold at every matrix
  size, with perturbation and homotopy lifting.
- The inclusion `𝒜→A` induces isomorphisms on K₀ and K₁.
- AlgebraicKTheory 0.3's projective-module K₀ agrees with this topological K₀, through 0.4's
  idempotent description, for 𝒜 when it is unital and for its unitization otherwise.
- Sufficient condition: a dense *-subalgebra 𝒜 that is a Banach algebra for a norm `|||·|||≥‖·‖`
  satisfying `|||xy|||≤C(‖x‖|||y|||+|||x|||‖y‖)` for a fixed C and all x, y is inverse-closed,
  with the unitization normed by `|||a+λ1|||=|||a|||+|λ|` in the nonunital case, so the inclusion
  induces isomorphisms on K₀ and K₁ (Roe, Corollary 14.7, p. 66, and its proof, p. 67). Route:
  the inequality at `x=y=aⁿ` gives `|||a^(2n)|||≤2C|||aⁿ|||‖aⁿ‖`, so by the spectral radius formula
  the spectral radii of a in 𝒜 and in A agree; if b∈𝒜 is invertible in A, then for large real λ
  the element `λ1−b*b` has spectral radius less than λ in A, hence in 𝒜, so b*b, and likewise
  bb*, is invertible in 𝒜, and b is invertible in 𝒜.

**Checks.**
- `C^∞(𝕋)⊆C(𝕋)` is dense and inverse-closed, since `1/f` is smooth for smooth nonvanishing f; its
  Fréchet topology does not come from one norm, and its K₁ is generated by the class of z.
- The trigonometric polynomials are dense in C(𝕋) but not inverse-closed: `2+z` is invertible in
  C(𝕋), and `1/(2+z)=Σ_(n≥0)(−1)^n z^n/2^(n+1)` has infinitely many nonzero Fourier
  coefficients.
- Matrix inverse closure: for 𝒜=C¹(𝕋), a matrix over 𝒜 invertible over C(𝕋) has inverse
  `adj(x)/det(x)` with `det(x)` a nonvanishing C¹ function, so the inverse is again over 𝒜; this
  is the matrix-size hypothesis the K-theory comparison uses.

### Examples

- K₀(C(S²))≅ℤ² with basis `[1]` and β, and K₁(C(S²))=0; K₀(C(𝕋²))≅ℤ² with basis `[1]` and `q*β`,
  and K₁(C(𝕋²))≅ℤ² with basis `[z_s]`, `[z_t]`.
- For the Toeplitz algebra T, K₀(T)≅ℤ generated by `[1]` and K₁(T)=0; in the extension the map
  K₀(K)→K₀(T) is zero and K₁(T)→K₁(C(𝕋)) is zero, since `δ₁[z]` generates K₀(K).
- C¹ functions on the circle form a dense inverse-closed Banach subalgebra of C(𝕋) satisfying
  the derivation estimate with C=1, so its K-groups agree with those of C(𝕋).

### Dependencies

K1–K2; BanachAlgebras Layer 2; CStarAlgebras C5 and C8; AlgebraicKTheory A0, A6 and A8;
TopologicalKTheory T2 and T4; Mathlib locally convex and metrizable-space APIs.

## K4. Fredholm indices and extensions

### 4.1 Atkinson's theorem in the Calkin algebra

*Needs:* K3.2; Mathlib `ContinuousLinearMap.IsFredholm`, `isFredholm_iff_exists_isQuasiInverse`,
`IsCompactOperator` and `LinearMap.index`; Tau Ceti `TauCeti.isFredholm_one_sub`,
`ContinuousLinearMap.index_add_of_isCompactOperator`, `Path.index_eq`; CStarAlgebras C1.6 Calkin
algebra.

Prove Atkinson's theorem `isFredholm_iff_exists_isCompactOperator_comp_sub_one`: a bounded
operator T:H₀→H₁ between complex Hilbert spaces satisfies `ContinuousLinearMap.IsFredholm`
exactly when some bounded S:H₁→H₀ makes `ST−1` compact on H₀ and `TS−1` compact on H₁ (Zois,
Analytic K-theory Lecture 1, Theorem 1, p. 59, stated there for two Hilbert spaces). The forward
and converse directions follow the two library routes recorded in the supplier contracts. For
H₀=H₁=H, consume CStarAlgebras C1.6's Calkin algebra `Q(H)=B(H)/K(H)` and read the theorem as:
T is Fredholm exactly when its Calkin class is invertible. Under `K₀(K(H))≃ℤ` for
infinite-dimensional separable H, prove that the index boundary is `dim ker T−dim coker T`
(Blackadar, 8.3.2; Roe, Exercise 7.13). Derive the index's homotopy, compact-perturbation and
composition laws through this comparison, using the existing Fredholm theorems where they already
supply the result.

**Checks.**
- The unilateral shift S has `S*S=1` and `SS*=1−e₀₀`, so its Calkin class is unitary and S is
  Fredholm of index −1, while a compact operator on an infinite-dimensional space has Calkin
  class 0 and is not Fredholm.
- On a finite-dimensional space K(H)=B(H) and Q(H) is the zero algebra, in which every element is
  invertible; correspondingly every operator is Fredholm, with index 0.
- An operator with a parametrix modulo compacts on one side only need not be Fredholm: the
  isometry `δ_n↦δ_(2n)` of ℓ²(ℕ) has the left inverse T* but a cokernel of infinite dimension.
- Between different spaces: `0:{0}→ℂⁿ` is Fredholm of index −n, with parametrix S=0, since `S0−1`
  is the zero operator of {0} and `0S−1=−1` is compact on ℂⁿ; the zero map `ℓ²(ℕ)→{0}` has an
  infinite-dimensional kernel, and every S gives `S0−1=−1`, which is not compact on ℓ²(ℕ).

### 4.2 The module index and graded Fredholm pairs

*Needs:* 4.1; HilbertModules H1–H2; K2.2 stability.

For σ-unital A consume HilbertModules H1–H2's standard module `H_A=ℓ²(ℕ,A)` and its identifications
`K(H_A)≃A⊗K` and `L(H_A)≃M(A⊗K)`, and construct the multiplier and corona extension
`0→A⊗K→M(A⊗K)→M(A⊗K)/(A⊗K)→0`. At this stage A has the trivial grading; a grading on E is an
A-linear selfadjoint unitary γ, with its orthogonal even/odd summands. Build graded direct sums,
parity reversal and homogeneous operator blocks from HilbertModules H2. Define graded Fredholm
pairs using countably generated Hilbert A-modules and odd adjointable F with `F−F*` and `F²−1`
compact.

- The K-groups of `M(A⊗K)` vanish, by the countable-shift swindle (Blackadar, Proposition 12.2.1
  and Corollary 12.2.3; Roe, Proposition 12.15), so the boundary of the corona extension gives the
  K₀(A)-valued index of invertible corona elements.
- Graded Fredholm pairs have direct sums, unitary equivalence, homotopy, stabilization and
  degenerate pairs, and their homotopy group is naturally K₀(A) (Roe, Lemmas 12.6–12.8 and Theorem
  12.16), through stabilization and perturbation steps relating this model to the corona boundary.
- The index is constructed without requiring a Fredholm module operator to have finitely
  generated projective kernel and cokernel; when it has them, the index is the difference of
  their classes.

**Checks.**
- For A=ℂ and the unilateral shift S on ℓ²(ℕ), the odd operator with off-diagonal blocks S and
  S* on `ℓ²⊕ℓ²` is a graded Fredholm pair of index `dim ker S−dim ker S*=0−1=−1`, agreeing with
  4.1 and with the Toeplitz boundary of 3.2.
- A degenerate pair, with `F=F*` and `F²=1`, has index 0; for A=ℂ and the even/odd identity
  `ℂ^(1|1)` with F the swap, both kernels vanish.
- For A=C(X) with X compact and F of finitely generated projective kernel and cokernel, the
  index is the difference of the corresponding vector bundles, which can be nonzero in reduced
  K⁰(X) although its rank vanishes; an index defined by ranks alone loses it.

### 4.3 Hilbert-module Kasparov–Stinespring dilation

*Needs:* HilbertModules H1–H4; CStarAlgebras C1.7 multipliers and strict topology; Mathlib
`CompletelyPositiveMap`.

Build Hilbert-module Kasparov–Stinespring dilation before extension invertibility. For a strict
completely positive map `φ:A→L_B(E)` define E_φ as the separated completion of A⊙E for the
B-valued inner product `⟨a⊗ξ,b⊗η⟩=⟨ξ,φ(a*b)η⟩`, with the representation `π(c)(a⊗ξ)=ca⊗ξ` and
the adjointable V determined on the dense span by the strict extension of φ (Blackadar, 13.7.2,
which states Kasparov's generalized Stinespring theorem). Strictness means φ(h_λ) converges
strictly for an approximate unit of A.

- `φ(a)=V*π(a)V` for every a, π is a nondegenerate representation by adjointable operators, and
  the dilation is minimal: π(A)VE spans a dense submodule. Two minimal dilations are unitarily
  equivalent by a unitary intertwining the representations and the maps V.
- E_φ is countably generated when A is separable and E is countably generated.
- When φ is unital, `V*V=φ(1)=1`, so V is an isometry, VE is the complemented submodule cut out
  by the projection VV*, and φ is the compression of π to it; prove the complemented-submodule
  compression for nondegenerate φ alongside.
- Standard-module dilation: for every completely positive contraction `A→L_B(H_B)` with A
  separable and B σ-unital, there is a representation on `H_B⊕H_B` whose 11-corner is φ (Blackadar,
  13.7.2), proved by stabilization and the non-strict-map enlargement when strictness is
  unavailable. This corollary supplies arbitrary completely positive lifts in the extension
  argument; the strict theorem is not silently applied to all maps.

**Checks.**
- For `A=M₂(ℂ)`, `B=E=ℂ` and the state `φ(a)=a₁₁`, the null space consists of the a with
  `φ(a*a)=‖aδ₁‖²=0`, that is, the matrices with zero first column; so E_φ≅ℂ², of dimension 2 and
  not 4, π is the identity representation, `V(1)=δ₁`, and `V*π(a)V=a₁₁`.
- For `A=B=E=ℂ` and `φ(λ)=λ/2`, E_φ≅ℂ with inner product `x̄y/2`, `V*(y)=y/2` and
  `V*V=φ(1)=1/2`, while `V*π(a)V=a/2=φ(a)`; V is not an isometry, so the isometric statement needs
  `φ(1)=1`.
- The order in `φ(a*b)` is forced: with `φ(ab*)` instead, π(c*) would be the adjoint of π(c)
  only if `φ(cab*)=φ(ab*c)`, and for `A=M₂(ℂ)`, `φ(x)=x₁₁`, `c=e₁₂`, `a=e₂₂`, `b=e₁₂` the two
  sides are `φ(e₁₁)=1` and `φ(e₂₂)=0`. With `φ(a*b)` both sides of the adjoint identity equal
  `φ(a*c*b)`.

### 4.4 Busby invariants and complete pairs of isometries

*Needs:* 4.2 multiplier and corona extension; HilbertModules H1–H2 standard module and
`L_B(H_B)≃M(B⊗K)`; CStarAlgebras C1.7 multipliers; 3.3 closed pullback.

For separable A and σ-unital B develop extensions by `B⊗K` and their Busby invariants
`τ:A→Q(B⊗K)` (Blackadar, Definition 15.2.1), and distinguish equality of Busby maps, conjugacy by a
multiplier unitary, and conjugacy by a corona unitary. A complete pair of multiplier isometries is
a pair `s₀,s₁∈M(B⊗K)` with `sᵢ* sⱼ=δᵢⱼ1` and `s₀s₀*+s₁s₁*=1`. Writing q for the multiplier
quotient map, define the sum of Busby maps along a complete pair s by
`(τ₀⊞ₛτ₁)(a)=Σ_(i=0,1) q(sᵢ)τᵢ(a)q(sᵢ)*` (Blackadar, Definition 15.6.1).

- An extension is reconstructed from its Busby invariant by the multiplier pullback (Blackadar,
  Examples 15.3.2(a)); an extension is essential exactly when τ is injective, and split exactly
  when τ has a *-homomorphic lift to `M(B⊗K)`.
- A complete pair exists. Use H1's standard right module H_B and H2's `L_B(H_B)≃M(B⊗K)`: on
  finitely supported sequences put `Sᵢ(b)_((2n)+i)=b_n` for i=0,1, with every other coordinate
  zero. Prove preservation of the norm-summable B-valued inner product, extend by finite-support
  density, and construct the adjoints by extracting the even and odd coordinates. The resulting
  unitary `W:H_B⊕H_B→H_B`, `W(x,y)=S₀x+S₁y`, has inverse `z↦(S₀*z,S₁*z)`. Transport Sᵢ through
  the stated adjointable/multiplier comparison to obtain sᵢ; B need not be unital. Include B=0
  using the zero algebra's unit 0 and the zero-module unitary, without imposing a nonzero-unit
  hypothesis.
- `τ₀⊞ₛτ₁` is linear and preserves star and multiplication, by the pair relations. No unitality of
  A or τᵢ is needed; when A is unital and both τᵢ are unital, the range-sum identity makes the sum
  unital.
- Independence of the pair: for any other complete pair t, `U=t₀s₀*+t₁s₁*` has inverse
  `s₀t₀*+s₁t₁*`, `U*U=UU*=1`, `Usᵢ=tᵢ`, and `q(U)(τ₀⊞ₛτ₁)(a)q(U)*=(τ₀⊞ₜτ₁)(a)` for every a.
- Orthogonal ranges alone do not suffice: on ℓ²(ℕ), the even/odd pair has range sum 1, whereas the
  pair sending e_n to e_(3n) and e_(3n+1) has range sum 1−R with R the infinite-rank projection
  onto e_(3n+2). R is noncompact, and for two unital scalar split Busby maps the two sums send 1
  respectively to 1 and 1−q(R) in the Calkin algebra, which are not unitarily conjugate; this
  example is kept as a boundary test.

**Checks.**
- The even/odd pair on ℓ²(ℕ) satisfies `S₀S₀*+S₁S₁*=1`; the pair `e_n↦e_(3n)`, `e_n↦e_(3n+1)` has
  orthogonal ranges with sum `1−R`, R of infinite rank, so it is not complete.
- For complete pairs s and t, `U=t₀s₀*+t₁s₁*` satisfies `U*U=Σsᵢsᵢ*=1`, `UU*=Σtᵢtᵢ*=1` and
  `Usᵢ=tᵢ`; the two sums are therefore conjugate by the multiplier unitary U.
- For B=0 the module H_B is zero, `s₀=s₁=0` and `0=1` in `L(0)`; the pair relations hold and the
  sum is the zero map.

### 4.5 Extension semigroups and invertibility

*Needs:* 4.3–4.4; CStarAlgebras C6–C7 completely positive liftings.

Use complete pairs for both ordinary and unital strong extension addition. Define stable
equivalence by allowing addition of split extensions on both sides. The resulting Ext monoid has
the split class as zero; it is not a group by definition (Blackadar, Definition 15.6.3). Keep
unital extensions and unital equivalences as explicitly distinguished constructions rather than
silently imposing unitality on the stable Ext theory: define unital strong Ext separately using
all unital Busby maps, multiplier-unitary equivalence and addition of unital split extensions.

- For split inputs, the same formula on their multiplier *-homomorphic lifts is a lift of the sum.
- Addition is compatible with multiplier-unitary equivalence, commutative and associative, by the
  block permutations and regrouping unitaries of H_B finite sums.
- Invertibility: a stable extension class is invertible precisely when its Busby invariant admits
  a completely positive contractive multiplier lift (Blackadar, Theorem 15.7.1). The standard-module
  dilation of 4.3 and its complementary diagonal corner construct the inverse Busby map.
- The lift condition is equivalent to the existence of a completely positive contractive section
  of the associated extension. Consequently Ext(A,B) is a group when A is separable nuclear
  (Blackadar, Corollary 15.8.4).
- The natural pullback and ideal-variable constructions needed for the comparison with KK₁ in K6
  are developed here.
- Unital strong Ext has the invertibility criterion that a CP contractive multiplier lift exists,
  and that lift need not be unital.
- The KK/unit-evaluation comparison is constructed in K6 after KK and its extension
  correspondence; no bivariant group is needed to construct these extension semigroups.

**Checks.**
- The Toeplitz extension has Busby map `C(𝕋)→Q(ℓ²)` sending z to the class of S; it is essential
  and nonsplit, since a *-homomorphic lift would send z to a unitary of index 0 while S has
  index −1.
- Unital strong Ext and stable Ext differ: for A=M_n(ℂ) and ideal K every ordinary class is
  trivial, while the invertible unital strong classes form ℤ/n (6.5). A definition identifying
  the two theories gets this pair wrong.
- For A=C(X) with X compact metrizable a completely positive contractive lift exists by
  nuclearity, so every class is invertible; the inverse of the Toeplitz class is represented by
  the Busby map sending z to the class of S*.

### Examples

- The index of the unilateral shift is −1, and of its adjoint +1; compact perturbations and
  homotopies through Fredholm operators preserve both.
- `Ext(C(𝕋),K)≅ℤ` through the index of the lift of z, with the Toeplitz class mapping to −1.
- The complete-pair counterexample of 4.4 gives two unital scalar split Busby maps whose sums are
  not unitarily conjugate in the Calkin algebra.

### Dependencies

K1–K3; Mathlib Fredholm and compact-operator APIs; Tau Ceti compact-perturbation and
continuous-family index theorems; CStarAlgebras C1.6, C1.7 and C6–C7; HilbertModules H1–H4.

## K5. Graded cycles and KK-groups

### 5.1 Graded algebras, Hilbert modules and Clifford conventions

*Needs:* K4.2; HilbertModules H1–H4.

Develop ℤ/2-graded C*-algebras, graded Hilbert modules, graded tensor products and adjointable
operators, using the ungraded constructions of HilbertModules H1–H4. A grading on an algebra is an
involutive *-automorphism, equivalently its even/odd decomposition; it need not be implemented by
an inner multiplier (Blackadar, Definition 14.1.1 and Examples 14.1.2). Fix complex Clifford
algebras with odd self-adjoint generators `e_i²=1` and `e_i e_j=−e_j e_i` for distinct i,j. Pin
Cl₂→M₂(ℂ) by `e₁↦[[0,1],[1,0]]`, `e₂↦[[0,i],[−i,0]]`, with grading conjugation by diag(1,−1). The
graded Morita module is ℂ^(1|1); these generator orders are part of the Clifford/suspension
comparison, not adjustable matrix labels. These are the analytic complex Clifford conventions;
geometric real KO and its signature conventions remain in TopologicalKTheory. Pin the
two-odd-factor period reduction `Cl₁⊗̂Cl₁→Cl₂` by `e⊗1↦e₂`, `1⊗e↦e₁`; the individual generators
and the displayed Cl₂ matrix model stay fixed. This records a choice of period reduction, not a
change to the underlying Kasparov product.

- Graded Kasparov stabilization (Blackadar, Theorem 13.6.2 in the ungraded case): for countably
  generated graded E over σ-unital graded B, E is a graded orthogonally complemented summand of
  `H_B⊕H_B` with the two opposite standard gradings, and `E⊕(H_B⊕H_B)≅H_B⊕H_B` by a degree-zero
  unitary.
- Graded modules have even/odd generating sequences, and compact and adjointable operators have
  homogeneous block formulas.
- The complex Clifford algebras have graded tensor identifications, matrix models and graded
  Morita periodicity.
- Under the pinned reduction the two-suspension comparison cycle is `s e₂+t e₁`, with even-to-odd
  block `t−is=−iz` in the ordered plane; its clutching winding is positive and its class is β.
  The unswapped reduction `e⊗1↦e₁`, `1⊗e↦e₂` instead has block `s−it=conjugate z` and class −β.
- The comparison between these two reductions acts by −1 after graded Morita equivalence. The
  displayed swapped reduction is used in the parity-reduced K/KK product comparisons; relative to
  the unswapped convention the adapter contributes `(−1)^(pq)` for p,q∈{0,1}, and it is coherent
  for triple products because `pq+(p+q)r=qr+p(q+r)` modulo two.

**Checks.**
- The displayed matrices satisfy `e₁²=e₂²=1` and `e₁e₂=diag(−i,i)=−e₂e₁`, and both are odd for
  conjugation by diag(1,−1).
- The even-to-odd block of `s e₂+t e₁` is `t−is=−iz`, of winding +1, while that of `s e₁+t e₂`
  is `s−it=conjugate z`, of winding −1.
- `pq+(p+q)r` and `qr+p(q+r)` both equal `pq+pr+qr`, so the sign adapter is coherent for all
  p,q,r∈{0,1}.

### 5.2 Kasparov cycles and the groups KK(A,B)

*Needs:* 5.1; K4.2 graded Fredholm pairs.

For separable graded A and σ-unital graded B, define a Kasparov cycle `(E,φ,F)` (Blackadar,
Definition 17.1.1) with E a countably generated graded right Hilbert B-module, φ a graded
*-homomorphism into L(E), and F odd and adjointable. For every homogeneous a require compactness of

```
Fφ(a) − (−1)^degree(a) φ(a)F,
(F²−1)φ(a),
(F−F*)φ(a).
```

Define degenerate cycles by vanishing of these expressions. Define unitary equivalence, direct
sum, change of coefficients by interior tensor product, and homotopy via cycles over
`C([0,1],B)`, and define KK(A,B) as the set of homotopy classes (Blackadar, Definition 17.3.1).
Fix its universe by the standard-module picture: stabilize cycles onto complemented graded
submodules of the fixed H_B⊕H_B, then take the homotopy quotient of that set of
operators/representations. Ext uses the fixed corona of B⊗K, and K9's asymptotic maps use fixed
source/target carriers.

- Homotopy is an equivalence relation, and KK(A,B) is an abelian group under direct sum.
- The standard-module picture is equivalent to the picture with arbitrary-module cycles; KK(A,B)
  lives in max(u_A,u_B), independent of a chosen larger module universe, and the construction is
  compatible with universe lifts.
- The inverse of `[(E,φ,F)]` is `[(Eᵒᵖ,φ∘γ_A,−F)]`, where Eᵒᵖ has reversed grading and γ_A is A's
  grading automorphism; a rotation homotopy joins their direct sum to a degenerate cycle.
- Compact-perturbation and operator-homotopy invariance hold, with their actual defect estimates.
- Every class has a normalized self-adjoint contractive representative and a standard-module
  representative obtained by stabilization, retaining the representation on any degenerate
  summand.
- KK is contravariant in A and covariant in B, the two actions commute, and both are homotopy
  invariant and stable.

**Checks.**
- For nonzero trivially graded A the identity cycle `(A,id,0)`, with A a trivially graded module
  over itself, is a cycle because `K_A(A)=A`, so `(0²−1)a=−a` is compact; the zero operator on
  `H_A=ℓ²(ℕ,A)` with the diagonal left action is not a cycle, since `diag(a,a,…)` is not
  compact for a≠0.
- For A=B=ℂ, KK(ℂ,ℂ)≅ℤ with the class of `(ℂ^(1|0),id,0)` equal to 1, and the cycle on
  `ℓ²⊕ℓ²` whose odd operator has off-diagonal blocks S, S* equal to −1.
- On the direct sum of `(E,φ,F)` and `(Eᵒᵖ,φ∘γ_A,−F)` the swap W of the two copies is odd,
  self-adjoint, unitary and graded-commutes with the representation, and it anticommutes with
  `F⊕−F`; so `cos(πt/2)(F⊕−F)+sin(πt/2)W` connects the sum to the degenerate W, and the second
  class is the inverse of the first.

### 5.3 Countable additivity in the first variable

*Needs:* 5.2.

Prove countable additivity in the first variable: for separable graded A_n and σ-unital graded B,
restriction to the summands induces `KK_i(⨁⁽c₀⁾_n A_n,B) ≃ ∏_n KK_i(A_n,B)` in both degrees
(Blackadar, Theorem 19.7.1).
Construct the inverse from countable sums of normalized cycles; use the c₀ condition to control
the compact defects. Prove independence of representatives, injectivity by compatible homotopies,
and naturality. This supplies the product groups in the contravariant mapping-telescope sequence
that CStarClassification CL8 uses.

### 5.4 Degrees, K-theory and K-homology

*Needs:* 5.2; K3.1 Bott conventions; K4.1–4.2.

Define `KK_i(A,B)=KK(A,B⊗̂Cl_i)` for separable graded A, σ-unital graded B and i modulo 2, the
domain of 5.2: `B⊗̂Cl_i` is σ-unital because Cl_i is finite-dimensional (Blackadar, Definition
17.3.1); ordinary K-group identifications use trivially graded B.

- The suspension and Clifford pictures agree, and the graded Morita maps through `ℂ^(1|1)` give
  two-periodicity `KK_(i+2)(A,B)≅KK_i(A,B)`.
- The one-suspension comparison is normalized by the positive winding class `u(t)=exp(2πit)`,
  which is the Cayley form `(x−i)/(x+i)` in the increasing real coordinate of Conventions, and the
  two-suspension comparison by the displayed `s e₂+t e₁` cycle, β in the ordered plane and the
  fixed Cl₂ matrices. Construct these comparison cycles and prove their scalar evaluation, rather
  than selecting their sign from an abstract ℤ-isomorphism.
- `KK_i(ℂ,B)≃K_i(B)` for trivially graded σ-unital B (Blackadar, Propositions 17.5.5 and
  17.5.6), and `KK_i(A,ℂ)` is analytic K-homology through even and odd Fredholm modules; both
  identifications are natural and agree with K4's index.
- *-homomorphisms and imprimitivity modules have classes; the identity class of A is represented
  by `(A,id,0)`, a cycle because A acts on itself by compact module operators, which handles
  nonunital A.

**Checks.**
- For t∈(0,1) the coordinate `x=tan(π(t−1/2))=−cot(πt)` gives
  `(x−i)/(x+i)=(−cos πt−i sin πt)/(−cos πt+i sin πt)=exp(2πit)` exactly, so the Cayley form is the
  positive loop of winding +1 and not its inverse.
- `KK₁(ℂ,ℂ)=K₁(ℂ)=0` while `KK₀(ℂ,ℂ)=ℤ`, and two-periodicity gives `KK₂(ℂ,ℂ)=KK(ℂ,Cl₂)≅ℤ`
  through the Morita module `ℂ^(1|1)`; an unreduced degree would make `KK₂` a new group.
- `(L²(𝕋),f↦f,0)` is not a cycle for C(𝕋): `(0²−1)φ(1)=−1` is not compact on the
  infinite-dimensional space, whereas `(C(𝕋),id,0)`, with C(𝕋) a module over itself, is the
  identity class.

### 5.5 Unbounded cycles

*Needs:* 5.2; HilbertModules H6–H7.

Define unbounded cycles on HilbertModules H6–H7 (Blackadar, Definition 17.11.1): an odd regular
self-adjoint D on a countably generated graded Hilbert B-module, a graded representation φ of A,
a dense graded *-subalgebra of A whose represented elements preserve Dom(D) and have bounded
adjointable graded commutators with D, and compactness of `φ(a)(1+D²)⁻¹` for all a∈A.

- The bounded transform `F=D(1+D²)^(-1/2)` is a bounded Kasparov cycle, with the
  functional-calculus commutator estimates (Blackadar, Proposition 17.11.3).
- For separable A every KK-class in this scope has an unbounded representative (Blackadar,
  Theorem 17.11.4); construct the strictly positive compact regularizer and its domain rather than
  postulating it.
- No unbounded-product formula follows merely from bounded-transform surjectivity; the product is
  constructed in K6. Spectral triples and their geometric index theorems are outside this roadmap.

**Checks.**
- `D=−i d/dx` on L²(ℝ) with C₀(ℝ) acting by multiplication and dense subalgebra `C_c^∞(ℝ)`:
  `[D,f]=−if′` is bounded, and `f(1+D²)⁻¹` is the product of multiplication by `f∈C₀(ℝ)` and the
  Fourier multiplier `(1+ξ²)⁻¹∈C₀(ℝ)`, hence compact; the bounded transform is the Fourier
  multiplier `ξ/√(1+ξ²)`.
- On an eigenvector of D with eigenvalue λ, F has eigenvalue `λ/√(1+λ²)` and
  `F²−1=−(1+λ²)⁻¹`, so `F²−1=−(1+D²)⁻¹` and the compact-resolvent condition is exactly the
  condition `(F²−1)φ(a)` compact.
- `D=0` on `ℂ^(1|0)` with A=ℂ is an unbounded cycle with `F=0`, the class 1 of `(ℂ^(1|0),id,0)`,
  while `D=0` on an infinite-dimensional H with A=ℂ fails, since `(1+D²)⁻¹=1` is not compact.

### Examples

- KK(ℂ,B)≅K₀(B) and KK₁(ℂ,B)≅K₁(B); KK(ℂ,ℂ)≅ℤ and KK₁(ℂ,ℂ)=0.
- The Dirac operator `−i d/dx` on L²(ℝ), with C₀(ℝ) acting by multiplication, is an odd
  unbounded cycle, and its bounded transform represents a generator of KK₁(C₀(ℝ),ℂ)≅ℤ.
- The Clifford algebra Cl₂ is graded Morita equivalent to ℂ through ℂ^(1|1), so
  `KK_i(A,B⊗̂Cl₂)≅KK_i(A,B)`.

### Dependencies

K1–K4; HilbertModules H1–H4 and H6–H7.

## K6. Kasparov product, exactness, and index pairings

### 6.1 Quasicentral approximate units and the technical theorem

*Needs:* K5.1 gradings, for the graded version; CStarAlgebras C1.4 quasicentral approximate units
and C1.7 multipliers.

Develop quasicentral approximate units with simultaneous estimates on countable sets and
Kasparov's technical theorem. In its ungraded form, for a σ-unital J, σ-unital subalgebras A₁,A₂
of M(J), and a separable linear subspace Δ of M(J), assume `A₁A₂⊆J` and `[A₁,Δ]⊆A₁`. Construct
positive contractions M,N in M(J) such that

```
M+N=1,     MA₁⊆J,     NA₂⊆J,     [M,Δ]⊆J.
```

Prove the graded version with even M,N, including the approximate-unit diagonal construction and
functional-calculus commutator estimates. Use this theorem for countably generated modules; verify
σ-unitality of the compact-operator algebras to which it is applied. The hypotheses and conclusion
are those of Blackadar, Theorem 12.4.2.

### 6.2 The Kasparov product

*Needs:* 6.1; K5.2 and K5.4; K3.4 external products; HilbertModules H3 interior tensor products.

For separable graded A,D and σ-unital graded B, construct `KK(A,D)×KK(D,B)→KK(A,B)`. On cycles its
module is `E=E₁⊗_D E₂`. For homogeneous ξ∈E₁ let `T_ξ(η)=ξ⊗η`. The product operator F must be an
F₂-connection (Blackadar, Definition 18.3.1): both `T_ξ F₂−(−1)^degree(ξ) F T_ξ` and
`F₂ T_ξ*−(−1)^degree(ξ) T_ξ* F` are compact between the appropriate modules. For normalized
self-adjoint representatives also require positivity modulo K(E) of `φ(a)[F₁⊗1,F]φ(a*)` for all a,
where the bracket is the graded commutator, hence an anticommutator for the two odd operators.

- Connections exist, the technical theorem of 6.1 constructs product operators, and the product
  operator is unique up to operator homotopy (Blackadar, Theorem 18.4.3).
- The product is independent of all cycle and connection choices, bilinear and associative
  (Blackadar, Theorem 18.6.1), with the identity classes as units.
- It is compatible with homomorphisms, Morita equivalences, suspension and the K3 external
  product, using K5's explicit parity-reduction adapter; its minus sign for two odd factors is
  recorded when comparing with the unswapped Clifford convention, and the resulting signs are
  included in the K-theory/K-homology index interchange and the ordered two-circle/Dirac example.
- The external KK product exists and satisfies the graded interchange law.

**Checks.**
- The identity classes act trivially: with `1_D=[(D,id,0)]`, `x⊗_D 1_D=x` and `1_A⊗_A x=x`.
- For *-homomorphisms f:A→D and g:D→B, `[f]⊗_D[g]=[g∘f]`.
- For two odd degree-one classes the product compared through the unswapped Clifford reduction
  differs from the swapped one by `(−1)^(1·1)=−1`, the sign of K5's adapter.

### 6.3 The KK-category, split exactness and quasihomomorphisms

*Needs:* 6.2; HilbertModules H2 multiplier comparison.

Define the additive KK-category of separable graded C*-algebras, with morphisms `KK(A,B)` and
Kasparov product as composition, and a KK-equivalence as an invertible morphism (Blackadar,
Definition 19.1.1). Define a quasihomomorphism from A to B as a pair of *-homomorphisms
`φ₀,φ₁:A→M(B⊗K)` whose differences lie in `B⊗K`, with common unitary conjugacy, stabilization,
degenerates and homotopy (Blackadar, 17.6).

- A KK-equivalence induces isomorphisms in both variables; Morita equivalences, homotopy
  equivalences and the Bott element give KK-equivalences (Blackadar, Examples 19.1.2).
- KK is split exact, and has the universal property: a stable, homotopy-invariant, split-exact
  functor from trivially graded separable C*-algebras to an additive category factors through
  the KK-category, uniquely with the specified action on homomorphisms (Blackadar, Theorem 22.2.1
  and Corollary 22.3.1).
- The quasihomomorphism picture agrees with the cycle picture.
- A quasihomomorphism determines the split extension `D={(a,φ₀(a)+b) | a∈A, b∈B⊗K}` with ideal
  `j(b)=(0,b)` and the two sections `s₀(a)=(a,φ₀(a))` and `s₁(a)=(a,φ₁(a))`; under a split-exact
  functor the difference of the two sections, which lands in the image of the ideal, gives the
  action of the KK-class.

**Checks.**
- For A=B=ℂ the pair `φ₀(λ)=λ1`, `φ₁(λ)=λ(1−e₀₀)` into `B(ℓ²)=M(K)` has difference `λe₀₀∈K`. In D
  the projections `s₀(1)=(1,1)` and `s₁(1)=(1,1−e₀₀)` differ by the orthogonal projection
  `(0,e₀₀)=j(e₀₀)`, so under K₀ the difference of the sections sends `[1]` to `[e₀₀]=1` in
  K₀(K)≅ℤ; swapping φ₀ and φ₁ gives −1.
- A degenerate pair `φ₀=φ₁` has `s₀=s₁`, so every split-exact functor assigns it 0.
- ℂ and K are KK-equivalent through the rank-one corner `[e₀₀]∈KK(ℂ,K)` and the class of
  `(ℓ²(ℕ),id,0)` in KK(K,ℂ), whose product in KK(ℂ,ℂ)≅ℤ is the rank 1 of e₀₀; the corner of a
  rank-two projection gives 2 and is not invertible.

### 6.4 Semisplit extensions and KK₁

*Needs:* 6.2–6.3; K4.5 extension semigroups; K3.2.

For a semisplit extension of separable graded C*-algebras `0→J→A→Q→0`, with a grading-preserving
completely positive contractive section, construct the extension element in `KK₁(Q,J)`. The
semisplit hypothesis is stated at every application of KK excision; K-theory's exactness for
arbitrary extensions does not remove it from the bivariant statement.

- The six-term exact sequences hold in both variables: in the second variable,
  `KK_*(D,J)→KK_*(D,A)→KK_*(D,Q)` for every separable graded D, and in the first variable,
  `KK_*(Q,D)→KK_*(A,D)→KK_*(J,D)` for every σ-unital graded D (Blackadar, Theorem 19.5.7, which
  proves the first for semisplit extensions of σ-unital algebras and the second when A is
  separable). Their boundaries are the products with this class, and they agree with K3's index and
  positive-exponential maps.
- The extension element is natural for morphisms of extensions, and compatible with suspension,
  mapping cones and the product boundary identities with their graded signs.
- For trivially graded separable A and σ-unital B, `KK₁(A,B)` is identified with the invertible
  stable extension classes of K4 (Blackadar, Proposition 17.6.5), through the comparison between
  the compact-perturbation, operator-homotopy and Hilbert-module-homotopy pictures used in that
  identification.

**Checks.**
- The Toeplitz extension is semisplit (C(𝕋) is nuclear); the product of `[z]∈K₁(C(𝕋))` with its
  extension class is `δ₁[z]=−1∈K₀(K)≅ℤ`, matching 3.2.
- A split extension, with a *-homomorphic section, has extension class 0.
- For the cone extension `0→Sℂ→Cℂ→ℂ→0` the product of `[1]` with the extension class is the
  positive loop `exp(2πit)` of 3.1, so the class generates `KK₁(ℂ,Sℂ)≅ℤ`.

### 6.5 Unital extensions: the Manuilov–Thomsen sequence

*Needs:* 6.4; K4.5 unital strong Ext.

For separable unital A and separable stable J, prove the natural six-term comparison of
Manuilov–Thomsen (Theorem 3, p. 5). Write U(A,J) for the group of invertible strong unital stable
extension classes of K4.5, Manuilov–Thomsen's unital Ext⁻¹. The invertible ordinary classes form
their Ext⁻¹(A,J), which they identify with `KK(A,SJ)=KK₁(A,J)` (p. 1); in the cycle it appears
only as KK₁(A,J). The exact cycle is

```
KK₀(A,J) → K₀(J) → U(A,J) → KK₁(A,J)
          → K₁(J) → U(A,SJ) → KK₀(A,J).
```

The KK-to-K maps are restriction along ℂ→A, equivalently unit evaluation. The K-to-U maps use
corona-unitary index classes and conjugation of an absorbing unital split Busby map. Build the
relative commutant corona K₁/KK comparison and the absorbing representation constructions needed
to prove exactness (Manuilov–Thomsen, Lemma 2, p. 4).

- The cycle is exact at each of its six terms.
- The kernel of `U(A,J)→KK₁(A,J)` is K₀(J) modulo the image of unit evaluation
  `KK₀(A,J)→K₀(J)`.
- The image of `U(A,J)→KK₁(A,J)` is the kernel of unit evaluation `KK₁(A,J)→K₁(J)`.
- No nuclearity hypothesis on A is needed: the comparison concerns invertible classes only.
- For nonempty compact metrizable X, evaluation at a point makes unit evaluation
  `KK₀(C(X),K)→K₀(K)` onto, and K₁(K)=0, so `U(C(X),K)≅KK₁(C(X),K)`. This compares stable
  classes; essential Busby maps require the separate unital absorption theorem of K8.

**Checks.**
- For A=M_n and J=K the unit evaluation `KK₀(M_n,K)≅ℤ→K₀(K)≅ℤ` is multiplication by n, because
  the unit of M_n is a sum of n rank-one projections, and `KK₁(M_n,K)=0`; so `U(M_n,K)≅ℤ/n` while
  ordinary Ext vanishes.
- For A=ℂ the unit evaluation `KK₀(ℂ,J)→K₀(J)` is the identity and `KK₁(ℂ,J)→K₁(J)` is the
  identity, so `U(ℂ,J)=0`: the only unital Busby map `ℂ→Q(J)` is `λ↦λ1`, which splits.
- For X=𝕋 the evaluation at a point makes unit evaluation onto and `K₁(K)=0`, so
  `U(C(𝕋),K)≅KK₁(C(𝕋),K)≅ℤ`, detected by the index of a lift of z.

### 6.6 Index pairings

*Needs:* 6.2; K5.4; K4.1; CStarAlgebras C8 unilateral shift; Mathlib `lp` and `cfc`.

For separable A construct the index pairing `K_i(A)×KK_i(A,ℂ)→ℤ` as the Kasparov product over A
of `KK_i(ℂ,A)≃K_i(A)` with `KK_i(A,ℂ)`. With the Clifford/suspension
maps fixed in K5, consider the following odd Fredholm module over C(𝕋). On
`lp (fun _ : ℤ => ℂ) 2` let u be the bilateral shift `uδ_n=δ_(n+1)`; its spectrum is the circle,
and C(𝕋) acts by the continuous functional calculus `f↦f(u)`, so z acts as u. Let P be the
projection onto the closed span of the δ_n with n≥0. This roadmap uses the sequence model of the
circle and does not compare it with a Hardy-space model.

- Representative formulae (Blackadar, 16.3.2 for the odd pairing with Ext, and 17.5 for the
  Fredholm picture): for an even Fredholm module and a projection p, the pairing is the Fredholm
  index of the compressed operator from the even to the odd summand; for an odd self-adjoint
  involutive representative F and a unitary u, with `P=(1+F)/2`, the odd pairing is the index of
  `PuP` on PH. The relevant commutators are compact and the compressions Fredholm, and the
  formulae extend to unitization differences.
- The pairing is homotopy invariant and compatible with pullback, pushforward and geometric
  K-theory.
- Scalar compatibility: `⟨[z],[2P−1]⟩=−1` as a Kasparov-product identity. Each commutator
  `[P,f(u)]` has finite rank for a trigonometric polynomial f, so it is compact for every
  continuous f; on PH, identified with `lp (fun _ : ℕ => ℂ) 2`, the compression PuP is the
  unilateral shift of CStarAlgebras C8, with kernel 0 and cokernel spanned by δ_0, so the pairing
  is `0−1=−1`. This is the scalar compatibility theorem, not the definition of the sign.

**Checks.**
- `[P,u]` is the rank-one operator sending δ_(−1) to δ_0 and every other basis vector to 0, so
  `(ℓ²(ℤ),f↦f(u),2P−1)` is an odd Fredholm module.
- `⟨[z],[2P−1]⟩=index(PuP)=0−1=−1`, while `⟨[z*],[2P−1]⟩=index(Pu*P)=1−0=+1`, as additivity
  requires.
- For the constant unitary 1, PuP is the identity of PH and the pairing is 0; a pairing defined
  with the projection 1−P instead of P reverses the sign of the generator.

### Examples

- KK(ℂ,ℂ)≅ℤ is a ring under the Kasparov product with unit `[(ℂ,id,0)]`; the Bott class in
  KK(ℂ,C₀(ℝ²)) and the Dirac class in KK(C₀(ℝ²),ℂ) are mutually inverse, with the signs fixed by
  K5.
- For A=M_n and J=K the Manuilov–Thomsen cycle gives `U(M_n,K)=ℤ/n` from the unit evaluation
  `KK₀(M_n,K)≅ℤ→K₀(K)≅ℤ`, which is multiplication by n.
- The sequence-space module of 6.6 pairs to −1 with `[z]`.

### Dependencies

K1–K5; CStarAlgebras C1 and C8; HilbertModules H2–H3; Mathlib `lp` and continuous functional
calculus.

## K7. Equivariance, descent, and crossed-product calculations

### 7.1 Equivariant Kasparov theory

*Needs:* K6.1–6.2; OperatorAlgebraDynamics D1 actions.

For a second-countable locally compact G and separable graded G-algebras A,B, define equivariant
Hilbert modules (Blackadar, Definition 20.1.1) with norm-continuous orbit maps, grading-preserving
actions, and

```
g(ξb) = (gξ)β_g(b),       ⟨gξ,gη⟩ = β_g(⟨ξ,η⟩).
```

The individual transformations are complex-linear isometries and need not be B-linear. Define
equivariant Kasparov cycles by an equivariant representation φ and an odd F satisfying K5's
conditions, norm continuity of `g↦gFg⁻¹`, and compactness of `(gFg⁻¹−F)φ(a)` for every g,a, and
`KK_G(A,B)` as their homotopy classes (Blackadar, Definitions 20.2.1 and 20.2.2).

- `KK_G(A,B)` is an abelian group, functorial in both variables, with restriction along
  continuous group homomorphisms where the specified actions pull back.
- The equivariant Kasparov product exists and is associative (Blackadar, Theorem 20.3.1), with
  the equivariant connection estimates.
- Equivariant technical theorem: let G be σ-compact and let J, A₁, A₂ and Δ satisfy the
  hypotheses of 6.1, with J a σ-unital graded G-algebra. If A₁, A₂ and Δ consist of G-continuous
  elements of M(J), meaning that `g↦g(x)` is norm continuous, then the elements M and N of 6.1
  can be chosen even and G-continuous, with `g(M)−M∈J` for every g, and G-invariant when G is
  compact (Blackadar, Theorem 20.1.5). The G-continuous elements of the adjointable operators of
  an equivariant module form a C*-subalgebra containing the compact operators (Blackadar, the
  remark after Definition 20.1.2), so the hypothesis holds for the algebras generated by compact
  operators, by `φ(A)` and by the G-continuous operators of equivariant cycles, to which the
  equivariant product applies the theorem.
- For compact G averaging gives invariant representatives, and equivariant semisplit extensions,
  with equivariant completely positive contractive sections, have six-term exact sequences.

**Checks.**
- For the trivial group the continuity and invariance conditions are vacuous, so `KK_G=KK`.
- For compact G acting trivially on ℂ, a finite-dimensional representation V gives the cycle
  `(V^(1|0),id,0)`, of class `[V]` in `KK_G(ℂ,ℂ)≅R(G)`; for infinite compact G the regular
  representation on L²(G) gives no cycle with F=0, since `(0²−1)φ(1)=−1` is not compact.
- For `E=B=C(𝕋)` with the rotation action, `gξ=β_g(ξ)` satisfies both displayed identities but is
  not B-linear: `g(ξb)=β_g(ξ)β_g(b)≠β_g(ξ)b` for nonconstant b and a nontrivial rotation g.
- G-continuity of the inputs cannot be dropped from the equivariant technical theorem. Let
  G=ℝ act by translation on J=C₀(ℝ), so that M(J)=C_b(ℝ) and its G-continuous elements are the
  bounded uniformly continuous functions. Put `f=max(sin x²,0)` and `h=max(−sin x²,0)` for x>0
  and f=h=0 for x≤0, A₁=C*(f), A₂=C*(h) and Δ=0, so `A₁A₂=0`. If `Mf` and `(1−M)h` lie in
  C₀(ℝ), then M→0 along `x_k=√(π/2+2πk)`, where f=1, and M→1 along `y_k=√(3π/2+2πk)`, where h=1;
  since `y_k−x_k=π/(x_k+y_k)→0`, M is not uniformly continuous. Here f itself is not uniformly
  continuous, so the hypothesis excludes this input.

### 7.2 Descent and the Green–Julg theorem

*Needs:* 7.1; Tau Ceti `TauCeti.CStarAction.FullCrossedProduct`; OperatorAlgebraDynamics D1–D2;
HilbertModules H1–H3; TopologicalKTheory T6.

Construct the full crossed-product Hilbert module from `C_c(G,E)`, with its convolution-valued
inner product and compatibility with Dynamics D1's Haar and involution conventions, and the
descent map `j_G:KK_G(A,B)→KK(A⋊G,B⋊G)` given by the left action and the descended cycle. For
compact G, still second countable as above, and separable graded G-algebra B with a
grading-preserving action, put `K_i^gr(D)=KK_i(ℂ,D)` for a σ-unital graded C*-algebra D, using
K5's fixed Clifford degree and period comparisons and trivially graded ℂ. Equip B⋊G with the
grading induced by B and trivial grading on the group unitaries. Let `p_G=∫_G u_g dg∈C*(G)` for
normalized Haar measure, meaning the integrated constant function 1 in `C_c(G)`, not an assumed
operator-norm Bochner integral of the multiplier unitaries. Let `L²(G,B)` be the regular B⋊G–B
correspondence from D1–D2 and H1–H3: the Hilbert-module completion of `C_c(G,B)` for
`⟨ξ,η⟩=∫ ξ(r)*η(r)dr`, not the Banach-space Bochner L² norm of B-valued functions, with
`ρ(b)ξ(r)=β_(r⁻¹)(b)ξ(r)`, `λ_sξ(r)=ξ(s⁻¹r)` and the commuting semilinear G-action
`V_gξ(r)=β_g(ξ(rg))`.

- The convolution-valued inner product on `C_c(G,E)` is positive and its completion is a Hilbert
  module; the induced grading on B⋊G is compatible with the full crossed-product construction.
- Descent is functorial and compatible with identities and Kasparov products (Blackadar, Theorem
  20.6.2).
- Graded Green–Julg: `KK_G^i(ℂ,B)≃K_i^gr(B⋊G)` in both degrees, natural in equivariant graded
  coefficient maps (Blackadar, Theorem 20.2.7(a)). The forward map is
  `x↦[p_G]⊗_(C*(G))j_G(x)`, with the Clifford factor carrying the trivial G-action.
- The inverse: for compact G the integrated left action on `L²(G,B)` has image in
  `K_B(L²(G,B))`, by continuous B-valued kernel approximation on G×G and finite-rank module
  operators. Tensor a degree-zero graded cycle over B⋊G with this correspondence, with F⊗1, the
  induced grading and this G-action. For degree i externally tensor the correspondence with Cl_i
  carrying the trivial G-action, construct the grading-preserving generator comparison
  `(B⋊G)⊗̂Cl_i≃(B⊗̂Cl_i)⋊G`, and apply the same cycle construction over B⊗̂Cl_i, retaining its
  Clifford grading. The compactness and continuity requirements hold in both degrees, and both
  composites with the forward map are identities, by the normalized-Haar projection and the
  corresponding module unitaries and homotopies.
- For trivially graded B, K5's ordinary K comparison gives `KK_G^i(ℂ,B)≃K_i(B⋊G)` with K1–K3's
  ordinary K-groups and their fixed signs; a nontrivial grading is not forgotten when applying
  this ordinary comparison. Nonunital and zero B are included under the same definitions.
- For B=ℂ, degree zero is the complex representation ring and degree one vanishes.
- For compact Lie G the commutative case is compared with TopologicalKTheory T6's equivariant
  bundles by constructed comparison maps; an equivariant bundle group is not identified with a
  crossed-product K-group merely by matching their names.

**Checks.**
- `p_G` is a projection: `p_G*=p_G` because Haar measure on a compact group is inversion
  invariant, and `p_G²=p_G` because the convolution of the constant function 1 with itself is 1
  for normalized Haar measure.
- For the trivial group, `KK_G=KK`, `B⋊G=B`, `p_G=1`, and the Green–Julg map is the identity.
- For G=ℤ/2 acting trivially on B=ℂ, `KK_G(ℂ,ℂ)≅R(ℤ/2)≅ℤ²` and `ℂ⋊ℤ/2≅ℂ²`, with K₀(ℂ²)≅ℤ², and
  degree one vanishes on both sides.

### 7.3 K7.FreeGroups: tree comparison, free-group PV and rank invariants

*Needs (reduced-word, path and acyclicity interface):* Mathlib `SimpleGraph.mulCayley`,
`SimpleGraph.IsTree` and `FreeGroup.toWord`.

*Needs (tree cycle and Julg–Valette homotopy, full/reduced KK comparison, Toeplitz extension, PV
sequence and K-group calculations):* 7.1–7.2; K6.3 quasihomomorphisms; K3.2; K2.2–2.3 stability
and directed-limit continuity; Tau Ceti `TauCeti.CStarAction.FullCrossedProduct` for the full group
algebras `ℂ⋊F_n`; OperatorAlgebraDynamics D1–D2 full and reduced group algebras and the regular
quotient; CStarAlgebras C5 inductive limits.

For finite n≥1 put `F_n=FreeGroup (Fin n)` and label its distinguished generators by
`g_(j+1)=FreeGroup.of j`, j∈Fin n. Use the full/reduced group algebras and regular quotient
`q_n:C*(F_n)→Cr*(F_n)` constructed in Dynamics D1–D2. The group is discrete and countable, so the
equivariant KK scope fixed above applies. Build the following tree and Toeplitz interfaces before
using their K-theory consequences. These are separate constructions from the ℤ-action PV sequence
of 7.4 and from the Toeplitz–Cuntz algebras E_n of 7.6.

**Tree and full/reduced KK comparison.** Consume Mathlib's `SimpleGraph.mulCayley`,
`SimpleGraph.IsTree` and `FreeGroup.toWord`: use the native Cayley graph on the positive free
generators, with edges `g→g g_i`, rooted at 1. A vertex v≠1 has a unique adjacent vertex v′ on its
path to 1. On the vertex and edge Hilbert spaces define `Fδ_1=0` and `Fδ_v=±δ_e`, where e is that
last geometric edge and the sign compares `v→v′` with its fixed positive orientation; p_1 is the
rank-one projection at the root. Under the chosen edge indexing, the vertex representation is λ
and the edge representation is the n-fold regular representation; form their actual even
equivariant Kasparov cycle using the odd operator with off-diagonal blocks F,F*. For the
Julg–Valette homotopy one explicit model uses the root-parent operator `Pδ_1=0`, `Pδ_v=δ_v′`, the
projection p_1, and `T_t=1−tP+(sqrt(1−t²)−1)p_1` for `0≤t<1`; on finitely supported vectors use
the finite-path inverse of `1−tP` to define `T_t⁻¹ λ(g) T_t`, without assuming that T_t has a
bounded inverse on the whole Hilbert space. For this finite-valence tree the parent operator is
bounded. Use Julg, *A new look at the Julg–Valette homotopy for groups acting on trees*
(References), §§1–5, for this construction, checking the oriented-edge normalization against the
displayed partial-isometry identities. Construct reduced descent alongside the full descent of
7.2, using D2's regular module norms, quotient module completion and descended compact operators.

- The Cayley graph is a tree whose geometric edges are indexed by `F_n×Fin n`, and left
  translation preserves the positive-edge orientation.
- The shared reduced-word/path/acyclicity interface holds uniformly in finite n: the reduced word
  of an element gives its geodesic from 1, consecutive vertices are adjacent, and no vertex
  repeats. This interface uses no analytic input and does not depend on the Toeplitz–Cuntz
  algebras; it is exported for every finite n, including n=2, where the graph is four-regular.
- F is onto, `F*F=1−p_1` and `FF*=1`, and its defect `Fλ(g)−π_edges(g)F` vanishes on vertices
  outside the root-to-g⁻¹ geodesic and has range in the edge span of the root-to-g geodesic, hence
  has finite rank. Both graded representation summands of the cycle factor through Cr*(F_n).
- The cycle represents `1∈KK_(F_n)(ℂ,ℂ)`: `T_t⁻¹ λ(g) T_t` extends to a unitary θ_t(g), the
  differences θ_t(g)−λ(g) have finite rank and are norm continuous as compact operators, θ_t(g)
  is strongly continuous, and `θ_1(g)=F*π_edges(g)F+p_1`. With θ_0=λ this gives a genuine
  Kasparov homotopy from the zero difference cycle to `1−[λ,π_edges,F]`, with the
  C([0,1])-module adjointability and compact-defect estimates; strong operator convergence alone
  is not the homotopy condition.
- Reduced descent satisfies identity, product, homotopy and full-to-reduced comparison laws.
- Factorization adapter: after tensoring the finite-rank free-group cycle with a separable
  F_n-algebra A and applying full descent, its left action factors through `A⋊r F_n`, since its
  group representation is weakly contained in λ; the factorization is proved by the regular norm
  estimate/Fell absorption, not by simplicity or by an asserted universal normal quotient. It
  defines `x_A∈KK(A⋊r F_n,A⋊F_n)`, and for the actual regular quotient q_A

  ```
  [q_A] ⊗_(A⋊r F_n) x_A = 1_(A⋊F_n),
  x_A ⊗_(A⋊F_n) [q_A] = 1_(A⋊r F_n).
  ```

  The first identity is the full descent of the proved equivariant unit class; the second is its
  reduced descent, using the comparison law.
- For A=ℂ, `[q_n]` is invertible in KK, so q_n induces isomorphisms on both K-groups, fixing `[1]`
  and every generator-unitary class. This supplies the content needed here from K-amenability; it
  does not assert ordinary amenability or injectivity of q_n. No free-group K-group calculation or
  PV sequence is used to prove this comparison.

**Reduced subgroup inclusions.**

- For a subgroup H of a discrete group G and an action α of G on a C*-algebra A, the canonical map
  `A⋊_(α|H,r)H→A⋊_(α,r)G` is isometric, including for the trivial subgroup and H=G. Left
  translation by H preserves every right coset Hg, so `ℓ²(G,H_0)` is the direct sum of the
  subspaces `ℓ²(Hg,H_0)`; under `ξ↦(h↦ξ(hg))` the regular representation of A⋊G restricted to A⋊H
  acts on the summand of Hg as the regular representation of A⋊H induced from the faithful
  representation `ρ∘α_(g⁻¹)`. D2's independence of the reduced norm from the faithful
  representation then gives equality of norms.

**Selected-generator Toeplitz extension and PV.** For a unital C*-algebra A with an action α of
F_n, put `B_n=A⋊_(α,r)F_n`, `B_(n−1)=A⋊_(α|F_(n−1),r)F_(n−1)` and let i:A→B_(n−1) and
k:B_(n−1)→B_n be the canonical inclusions; k is isometric by the reduced subgroup inclusions
above. For n=1 set B_0=A. For A=0 all these algebras and maps are zero; make nonzero-representation
arguments only in the nonzero case. Define Γ_n to be the identity together with reduced words
whose final syllable has positive exponent whenever its generator is g_n; a final syllable using
another generator has either sign. In a faithful covariant representation `A⊆B(H_0)`, with
implementing unitaries t_g, realize B_n by `ρ(a)=1⊗a` and `(u_g ξ)(h)=t_g ξ(g⁻¹h)`, and compress
to `ℓ²(Γ_n,H_0)`, obtaining U_i, i<n, and S_n, with `P_1=1−S_n S_n*` the root-fibre projection.
Let `T_(n,α)=C*(ρ(A),U_1,…,U_(n−1),S_n)`. If ω(g) replaces the reduced-word generators by
U_i,S_n,S_n*, pin the matrix-unit map, for g′,g∈Γ_n, to
`e_(g′,g)⊗a ↦ ω(g′)P_1 ω(g⁻¹)ρ(α_g(a))`; the matrix-unit indices are Γ_n, not the whole F_n. The
inclusion `d:B_(n−1)→T_(n,α)` uses ρ and U_i, i<n. Follow Pimsner–Voiculescu (1982), Lemmas
1.1–1.3, the §2 two-representation construction and Theorem 3.1, with their unital coefficient
hypotheses.

- `g_i Γ_n=Γ_n` for i<n and `g_n Γ_n=Γ_n∖{1}`, so the restricted U_i, i<n, are unitaries and the
  restricted S_n is an isometry.
- T_(n,α) is independent of the faithful covariant representation, and there is an exact sequence

  ```
  0 → K(ℓ²(Γ_n))⊗A → T_(n,α) → B_n → 0,
  ```

  whose symbol sends ρ(a),U_i,S_n to a,u_i,u_n; the compact ideal is the one generated by P_1. The
  matrix-unit map satisfies the multiplication, star, norm, density and kernel identities, and the
  root corner gives K2 stability.
- d_* is an isomorphism on K₀ and K₁, by the two-representation Toeplitz quasihomomorphism and its
  rotation homotopy: construct the representations into the stabilized multiplier algebra
  agreeing modulo the compact ideal, identify their difference on d, and prove both inverse
  K-group compositions by that homotopy, consuming K1–K2 stability/homotopy and K6's
  quasihomomorphism comparison in the separable case. Arbitrary unital A follows by directed
  limits of separable unital α-invariant subalgebras, with compatible reduced norm and Toeplitz
  inclusions. This is a K₀/K₁-isomorphism target; it is not inferred from an unstated
  KK-equivalence of d.
- K3's six-term sequence then yields the cyclic exact sequence

  ```
  K₀(A) --i_*∘(1−α_(g_n⁻¹)*)--> K₀(B_(n−1)) --k_*--> K₀(B_n)
    ↑ δ₁                                                    ↓ δ₀
  K₁(B_n) <--k_*-- K₁(B_(n−1)) <--i_*∘(1−α_(g_n⁻¹)*)-- K₁(A).
  ```

  Here δ₁:K₁(B_n)→K₀(A) and δ₀:K₀(B_n)→K₁(A) are the actual extension boundaries transported by
  the root corner. The displayed ideal-map formula follows from `P_1=1−S_nS_n*` and the inverse
  automorphism in the covariance identity `S_n*ρ(a)S_n=ρ(α_(g_n⁻¹)(a))`. This fixes the direction
  of α and is not obtained by treating F_n as a single ℤ-action.

**Canonical K-groups and rank distinction.**

- For A=ℂ with trivial action, `δ₁[u_n]=−[1]` from the lift S_n and K3's index convention, and
  `δ₁[u_i]=0` for i<n from the unitary lifts U_i. Induction from n=0 and n=1 gives the canonical
  isomorphisms

  ```
  K₀(Cr*(F_n)) ≃ ℤ,               [1] ↦ 1,
  K₁(Cr*(F_n)) ≃ (Fin n → ℤ),     [λ(g_i)] ↦ e_i.
  ```

  The positive new coordinate uses −δ₁; the raw Toeplitz boundary is not relabelled as +1. The
  canonical maps from ℤ and the free abelian group on the displayed unitary classes are
  isomorphisms.
- Transport through the actual q_n KK-equivalence gives the full-algebra groups with the same unit
  and distinguished generators, and q_n* is the identity in these coordinates. These assertions
  include Pimsner–Voiculescu Corollary 3.2. Simplicity and uniqueness of the trace are not used to
  compute the K-groups. No membership in K8's nuclear bootstrap class, nuclearity, or UCT
  classification is inferred here.
- For an arbitrary basis type ι, build the full and reduced algebras of `FreeGroup ι` as the
  C*-inductive limits over its finite basis subsets. For full algebras the inclusions are faithful
  by the group retraction killing generators outside the subset and the full universal property;
  for reduced algebras by the reduced subgroup inclusions above. Norms are compatible, the union is
  dense and all finite-rank unit/generator identifications are natural. K2 directed-limit
  continuity then gives, with no cardinality restriction on ι,

  ```
  K₀(C*(FreeGroup ι)) ≃ ℤ ≃ K₀(Cr*(FreeGroup ι)),
  K₁(C*(FreeGroup ι)) ≃ (ι →₀ ℤ) ≃ K₁(Cr*(FreeGroup ι)).
  ```

  The unit has coordinate 1, each positive free generator has its corresponding Finsupp basis
  coordinate, and the canonical full-to-reduced map induces these identities. This limit argument
  asserts K-group isomorphisms, without extending the separable KK category or the finite-valence
  homotopy to uncountable groups. The empty basis gives ℂ and a singleton basis gives C(𝕋).
- Distinct finite ranks m,n give nonisomorphic reduced group C*-algebras: a *-isomorphism would
  induce an additive-group isomorphism ℤ^m≃ℤ^n, whose rationalized dimensions force m=n. In
  particular `Cr*(F₂)≄Cr*(F₃)`. This says nothing about isomorphism of their von Neumann weak
  closures.

**Checks.**
- For Γ_n: `g_i·1=g_i∈Γ_n` and `g_i g_i⁻¹=1`, so `g_iΓ_n=Γ_n` for i<n; `g_n·1=g_n`,
  `g_n g_n^k=g_n^(k+1)`, and `g_n w=1` only for `w=g_n⁻¹∉Γ_n`, so `g_nΓ_n=Γ_n∖{1}`.
- In the tree, sending a vertex v≠1 to the last edge of its path to 1 is a bijection onto the
  geometric edges, so `F*F=1−p_1` and `FF*=1`; the defect of g vanishes off the path from 1 to
  g⁻¹.
- For A=ℂ: n=0 gives (ℤ,0) and n=1 gives C(𝕋) with (ℤ,ℤ), matching `ι→₀ℤ` for |ι|=0,1; the
  boundary `δ₁[u_n]=[1−S_n*S_n]−[1−S_nS_n*]=−[P_1]=−[1]`.

### 7.4 Pimsner–Voiculescu for ℤ-actions and the rotation algebras

*Needs:* 7.2 descent; K6.3–6.4; Tau Ceti `TauCeti.CStarAction.FullCrossedProduct`;
OperatorAlgebraDynamics D1–D2; K3.4 for the commutative case.

For any C*-algebra A and automorphism α, fix U by `UaU*=α(a)`, and take T_α inside
`(A⋊_αℤ)⊗T`: the closure of the span `(aU^(i−j))⊗S^i(S*)^j`, a∈A, i,j≥0. This definition covers
nonunital A. Its symbol map sends that expression to aU^(i−j). Identify its ideal with A⊗K by
`a⊗e_ij↦U^i a U^(−j)⊗e_ij`; the distinguished corner is e_00, not an unspecified translated
rank-one projection. Put j(a)=a⊗1. For every real θ define `α(f)(z)=f(exp(2πiθ)z)` and
`A_θ=C(𝕋)⋊_αℤ`; v(z)=z is the coordinate unitary and u is U, so `uv=exp(2πiθ)vu`. Define the
canonical trace `τ=HaarIntegral∘E` using D2's expectation.

- Pimsner–Voiculescu: the six-term exact sequence with horizontal maps `1−α_*` and the canonical
  inclusion into `A⋊_αℤ` holds for every A (Blackadar, Theorem 10.2.1). First make the KK
  construction for separable A: construct the inverse class x∈KK(T_α,A) of j by the Toeplitz
  quasihomomorphism/shift homotopy and prove both inverse products; compute the ideal-inclusion
  map followed by x as `1−[α⁻¹]` in KK(A,A), and hence `1−(α⁻¹)_*` on K-groups. To display
  `1−α_*`, precompose that map with `−α_*` on the ideal's K-group and transport the adjacent
  boundary by the inverse `−(α⁻¹)_*`. Then obtain the arbitrary-A sequence from directed unions of
  separable α-invariant subalgebras and K2 continuity.
- The sequence is natural, and its normalized boundaries agree with the extension index maps. The
  identity automorphism and rotations of the circle are included as computations.
- A_θ has the universal unitary presentation with these relations from Dynamics D1, including
  injectivity of the coordinate copy, with no irrationality hypothesis. τ is faithful, compatible
  with integral parameter shifts, and θ=0 gives C(𝕋²).
- For every real θ, `K₀(A_θ)≅K₁(A_θ)≅ℤ²` from the PV sequence (Blackadar, Exercise 10.11.6(b),
  pp. 87–88, for irrational θ; the computation uses only that the rotation is homotopic to the
  identity and applies to every θ): α_* is the identity on `K_*(C(𝕋))` and the maps `1−α_*`
  vanish, and `[u]`,`[v]` is a basis of K₁(A_θ). For θ∈ℤ the algebra is C(𝕋²) and K₀ has basis
  `[1]`, `q*β` by K3.
- For 0<θ<1 a Powers–Rieffel projection of trace θ is constructed from continuous circle
  functions, with its projection relations verified, and its class x with `[1]` is a K₀ basis. Its
  PV boundary against [v] is computed in the specified ideal corner and transport convention,
  including the sign, and `τ(x)=θ`. The positive trace value fixes x rather than allowing its
  negative as an unnamed PV generator. Every other real θ reduces to these cases by the comparison
  under integral parameter shifts.
- The trace range `τ_*(K₀(A_θ))` is ℤ+θℤ; for θ=p/q in lowest terms this is `(1/q)ℤ` (Blackadar,
  Theorems 10.10.4–10.10.5, p. 85, for the de la Harpe–Skandalis determinant computation, which
  applies to every θ with Lebesgue measure as the invariant trace, and Exercise 10.11.6(d) with the
  Powers–Rieffel remark after it, p. 88, for irrational θ). Build the rotation-number/determinant
  proof of the range and of the normalization of x.
- For irrational θ, τ is the unique normalized trace (Blackadar, Exercise 10.11.6(c)), by
  invariance of the circle Fourier coefficients and vanishing of the nonzero crossed-product
  Fourier modes under conjugation by v, and `τ_*` is injective on K₀(A_θ).
- The smooth rotation algebra and its cyclic cocycles are outside this roadmap.

**Checks.**
- With `UaU*=α(a)`, `(1−(α⁻¹)_*)∘(−α_*)=1−α_*`, matching the horizontal maps of Blackadar,
  Theorem 10.2.1.
- In A_θ, `u^n v^(m′)=exp(2πiθ n m′) v^(m′) u^n`, so `v^m u^n v^(m′) u^(n′)` is
  `exp(2πiθ n m′) v^(m+m′) u^(n+n′)` for every real θ.
- For θ=1/2 the trace range is `(1/2)ℤ` and τ_* is not injective on `K₀(A_(1/2))≅ℤ²`, while
  `[1]` and x still form a basis because the PV boundary sends x to a generator of K₁(C(𝕋)).

### 7.5 Twisted abelian centers and simplicity

*Needs:* 7.4 for the rotation algebra; OperatorAlgebraDynamics D2 Fell absorption and weak
containment for amenable groups; VonNeumannAlgebras V0 and V11; Tau Ceti `TauCeti.IsFactorSet`,
`TauCeti.twistedTranslation`, `TauCeti.twistedMonoidAlgebra`,
`TauCeti.TwistedMonoidAlgebra.lift`, `TauCeti.TwistedMonoidAlgebra.algHom_ext` and
`TauCeti.Amenable.of_commGroup`; Mathlib `lp`, `lp.single`, `lp.hasSum_single`, `PontryaginDual`
and `MeasureTheory.Measure.haar`.

Let L be a discrete abelian group, written additively; no countability, finite generation or
torsion-freeness is assumed. Let c be a circle-valued factor set on L: a function
`c : Multiplicative L → Multiplicative L → ℂˣ` with Tau Ceti's `TauCeti.IsFactorSet c`, which in
additive notation says `c(x,y)c(x+y,z)=c(x,y+z)c(y,z)` and `c(0,x)=c(x,0)=1`, and with `|c(x,y)|=1`
for all x, y. Tau Ceti's `TauCeti.twistedTranslation ℂ c x` sends `δ_z` to `c(x,z)δ_(x+z)` on
finitely supported vectors; since `|c|=1` it preserves the ℓ²-norm and maps the finitely supported
vectors onto themselves, so it extends uniquely, along this dense subspace (Mathlib `lp.single`
and `lp.hasSum_single`), to a unitary W_x of `lp (fun _ : L => ℂ) 2`. These are the twisted shifts
`W_xδ_z=c(x,z)δ_(x+z)`. By the first bullet below, `TauCeti.TwistedMonoidAlgebra.lift` turns
x↦W_x into an algebra map λ_c from the algebraic twisted group algebra
`TauCeti.twistedMonoidAlgebra ℂ (Multiplicative L) c` to the bounded operators on ℓ²(L); define
C*(L,c) as the norm closure of its range, the span of the W_x. Define the trace
`τ(a)=⟨δ_0,aδ_0⟩`. For χ in the Pontryagin dual L̂ let M_χ be multiplication by χ on ℓ²(L) and
define the gauge action `α_χ=Ad(M_χ)`. Define the continuous alternating commutator
bicharacter `ρ(x,y)=c(x,y)conjugate(c(y,x))`, its radical `C_ρ={x:∀y,ρ(x,y)=1}`, the characters
κ_x(y)=ρ(x,y), `H_ρ=closure{κ_x:x∈L}⊆L̂`, and the conditional expectation
`Q(a)=∫_(H_ρ) α_s(a) ds`, with probability Haar on the compact group H_ρ, a closed subgroup of
the compact dual of the discrete group L. Phillips (2006), Theorem 1.9, states the simplicity
criterion for noncommutative tori, the case L=ℤ^d, and attributes the simplicity direction to
Slawny (1972), Theorem 3.7; the route below uses neither finite generation nor torsion-freeness.

- The twisted shifts are unitary and satisfy `W_xW_y=c(x,y)W_(x+y)`, `W_0=1` and
  `W_x*=conjugate(c(x,−x))W_(−x)`.
- `τ(W_x)` is 1 at x=0 and 0 otherwise; τ is tracial and faithful, using the commuting right
  twisted shifts for which δ_0 is cyclic, and the Fourier coefficients `a↦τ(W_y*a)` determine a.
- `α_χ(W_y)=χ(y)W_y`, and the gauge action is norm continuous in χ at each element.
- λ_c is injective: by the first two bullets, `τ(W_y*λ_c(a))` is the coefficient of a at y.
- Universal property: unitaries U_x in a unital C*-algebra B with `U_xU_y=c(x,y)U_(x+y)`, so that
  U_0=1, give by `TauCeti.TwistedMonoidAlgebra.lift` an algebra map from the algebraic twisted
  group algebra to B, unique by `TauCeti.TwistedMonoidAlgebra.algHom_ext`. Prove that it is
  bounded for the norm transported along λ_c, so that it extends uniquely to a *-homomorphism
  C*(L,c)→B sending W_x to U_x: represent B faithfully (V0), tensor with the untwisted regular
  representation, and use D2's Fell absorption and the weak containment of the trivial
  representation in the regular representation of L, which is amenable by Tau Ceti's
  `TauCeti.Amenable.of_commGroup`.
- `Ad(W_x)=α_(κ_x)`, and H_ρ is the annihilator of C_ρ: consume VonNeumannAlgebras V11's Pontryagin
  duality and prove this discrete-abelian annihilator comparison here by character separation and
  Fourier coefficient uniqueness.
- Q is a faithful conditional expectation with Q(W_y)=W_y for y∈C_ρ and zero otherwise; its fixed
  algebra is the center, and `Z(C*(L,c))=closure(span{W_y:y∈C_ρ})` by finite Fourier
  approximation.
- Every closed two-sided ideal I is invariant under the inner action and its compact closure, so
  Q(I)⊆I; for a nonzero positive a∈I, Q(a) is nonzero since `τ∘Q=τ`. Hence every nonzero ideal
  meets the center, and C*(L,c) is simple iff its center is ℂ1 iff C_ρ={0} iff H_ρ=L̂. Include L=0
  and the trivial cocycle.
- For the rotation algebra use W_(m,n)=v^m u^n and `c((m,n),(m′,n′))=exp(2πiθ n m′)`; A_θ is
  identified with C*(ℤ²,c) through the universal properties of both. This is the phase of Tau
  Ceti's `TauCeti.SmoothNoncommutativeTorus.twist θ`, with its generators U₁, U₂ in the roles of
  v, u. This roadmap exports this cocycle and the gauge action `α_χ(W_y)=χ(y)W_y` in these
  coordinates for every real θ.
- If θ is irrational, C_ρ=0 and A_θ is simple. If θ=p/q in lowest terms, q≥1, then C_ρ=qℤ² and
  the center is C(𝕋²), with its coordinate unitaries sent to v^q,u^q, injectively by the gauge
  action and Fourier coefficient uniqueness. Thus every rational rotation algebra is nonsimple,
  including the commutative integral-parameter case.

**Checks.**
- The cocycle identity at `(x,−x,x)` gives `c(x,−x)=c(−x,x)`, so `τ(W_xW_(−x))=τ(W_(−x)W_x)` and
  τ is tracial on the span; `M_χW_xM_χ*δ_z=χ(x)W_xδ_z`.
- For the rotation cocycle `ρ((m,n),(m′,n′))=exp(2πiθ(nm′−n′m))`, so `C_ρ={0}` for irrational θ,
  `C_ρ=qℤ²` for θ=p/q in lowest terms, and `C_ρ=ℤ²` for θ=0.
- For L=0 the algebra is ℂ, `C_ρ=0` and `H_ρ=L̂` is trivial, so it is simple. For the trivial
  cocycle and L≠0, `C_ρ=L` and the Fourier transform gives C*(L,1)≅C(L̂), which is not simple
  because the characters separate the points of L, so L̂ has more than one point; for L=ℤ^d this
  is C(𝕋^d).
- Torsion: on L=(ℤ/2)² put `c(x,y)=(−1)^(x₂y₁)`, a bicharacter and hence a normalized factor set.
  Then `W_(1,0)²=c((1,0),(1,0))W_0=1` and `W_(0,1)²=1`, while `c((1,0),(0,1))=1` and
  `c((0,1),(1,0))=−1` give `ρ((1,0),(0,1))=−1`, so these two self-adjoint unitaries anticommute;
  `ρ((1,1),(1,0))=−1` and `ρ((0,1),(1,0))=−1` leave `C_ρ=0`, and C*(L,c), of dimension |L|=4, is
  M₂(ℂ), simple. The untwisted algebra is C(L̂)≅ℂ⁴, not simple. The radical of c itself,
  `{x: c(x,y)=1 for all y}={0,(1,0)}`, is nonzero, so a criterion stated with c in place of ρ
  would wrongly predict a nontrivial centre here.
- Convention witness for the rotation cocycle: at x=(0,1), y=(1,0) it gives `c(x,y)=exp(2πiθ)`
  and `c(y,x)=1`, so `W_xW_y=exp(2πiθ)W_(1,1)` and `W_yW_x=W_(1,1)`, that is `uv=exp(2πiθ)vu` as
  in 7.4. The transposed cocycle `exp(2πiθ m n′)` would give `vu=exp(2πiθ)uv` instead.

### 7.6 Toeplitz–Cuntz and Cuntz algebras

*Needs (E_n, O_∞, the creation representation and the uniqueness theorems):*
OperatorAlgebraDynamics D6 finite Cuntz algebras; CStarAlgebras C5 inductive limits.

*Needs (K-groups and the KK-equivalence ℂ→E_n):* K2.2–2.3 stability and continuity; K3.2; K6.3.

Construct the Toeplitz–Cuntz algebra E_n, universal for n isometries with orthogonal ranges and
`∑s_i s_i*≤1`, and its faithful creation representation on the Hilbert space of finite words.
Dynamics D6 supplies the finite universal O_n. Construct O_∞ as the universal unital algebra of
countably many isometries with orthogonal ranges. Follow Cuntz (1981), Theorem 1.5 and §2.4. The
absorption and classification properties of O_∞ belong to CStarClassification.

- Toeplitz uniqueness: orthogonal-range isometries with nonzero defect generate a canonical copy
  of E_n.
- E_n has a circle gauge action, a faithful gauge expectation and core matrix/compact blocks, with
  the corresponding uniqueness theorem; the vacuum defect is verified to apply it to creation
  operators and to the finite O_∞ stages.
- The ideal generated by `1−∑s_i s_i*` is the compact operators, and the quotient is O_n.
- The scalar unital inclusion induces `K₀(E_n)≃ℤ`, with `[1]↦1`, and `K₁(E_n)=0`, by the Toeplitz
  homotopy and stability argument, including its coefficient-algebra version. The same argument,
  run for stable homotopy-invariant split-exact functors using K6, makes ℂ→E_n a
  KK-equivalence.
- From `0→K→E_n→O_n→0`, K₀(O_n)=ℤ/(n−1) and K₁(O_n)=0 for n≥2: the inclusion sends the vacuum
  rank-one class to `[1]−Σ[s_i s_i*]=(1−n)[1]` in K₀(E_n). Thus the quotient carries `[1]` to 1
  mod(n−1), with the generator fixed by the actual extension maps.
- O_∞ is the unital inductive limit of the E_n, with injective finite-stage representations and
  compatible scalar inclusions; hence `K₀(O_∞)≃ℤ`, with `[1]↦1`, and `K₁(O_∞)=0`.

**Checks.**
- The vacuum projection is `1−Σs_is_i*`, and `[s_is_i*]=[s_i*s_i]=[1]`, so its class in K₀(E_n) is
  `(1−n)[1]`.
- For n=2, `K₀(O₂)=ℤ/1=0`; for n=1, E₁ is the Toeplitz algebra, O₁=C(𝕋) and the formula gives
  `ℤ/0=ℤ=K₀(C(𝕋))`.
- In the creation representation the vacuum vector spans the common kernel of the `s_i*`, so
  the defect `1−Σs_is_i*` is the rank-one projection onto it and is nonzero.

### 7.7 Mapping tori and the Connes–Thom isomorphism

*Needs:* 7.1–7.2; 7.4; K3.1–3.2; Tau Ceti `TauCeti.CStarAction.FullCrossedProduct`;
OperatorAlgebraDynamics D4 Takai duality.

Develop the mapping torus `M_α={f∈C([0,1],A) | f(1)=α(f(0))}` (Blackadar, Definition 10.3.1) and
its extension with quotient evaluation at 0 and ideal SA. For a strongly continuous action α of ℝ
on any A the Connes–Thom map is `t_α:K_i(A)→K_(i+1)(A⋊_αℝ)`. Fix the Fourier identification for
the trivial scalar action using characters `s↦exp(isx)`, with x increasing from −∞ to +∞, and
normalize `t_0(1)` as the class of `u(x)=(x+i)/(x−i)`, of winding number −1, the normalization of
Roe, Lemma 19.1. This is the negative of K3's positive suspension generator. For separable
trivially graded A, Blackadar's Thom cycle is built from a real multiplier function tending to −1
at −∞ and +1 at +∞.

- With K3's positive Bott and exponential conventions the K₀-to-K₁ boundary of the mapping-torus
  extension is `b_A∘(α_*−1)`; the lift `x(t)=(1−t)p+tα(p)` proves the sign. The other boundary is
  identified through suspension, giving the mapping-torus sequence.
- The mapping-torus sequence is related to crossed products via induction and the Thom
  isomorphism, with the suspension reversal or ideal identification needed to match the
  Pimsner–Voiculescu `1−α_*` convention stated explicitly.
- Connes–Thom: `t_α` is an isomorphism for every A (Blackadar, Theorem 19.3.6, for separable A). It
  is natural for equivariant *-homomorphisms, invariant under exterior equivalence of actions and
  compatible with suspension, and the translation action is computed.
- For separable trivially graded A the Thom cycle has compact commutators and the normalization
  above, and its inverse is constructed using the dual action; Dynamics D4's Takai identification
  proves both Kasparov products are identity. This is the primary KK proof. Arbitrary A follows
  through directed separable α-invariant subalgebras, with continuity and compatibility of the
  Thom maps.
- The Wiener–Hopf extension and its boundary identification follow as a consequence: the middle
  K-groups vanish by that exact sequence and the proven Thom isomorphism. The comparison with
  Takai duality uses Dynamics D4's character conventions.

**Checks.**
- `x(1)=α(p)=α(x(0))`, so the lift lies in the mapping torus, and the boundary of `[p]` is
  `b_A(α_*[p]−[p])`.
- `arg u(x)=2arg(x+i)` decreases from 2π to 0 as x runs from −∞ to +∞, so u has winding −1, while
  the Cayley form `(x−i)/(x+i)` has winding +1.
- For the identity automorphism the mapping torus is `C(𝕋,A)` and the boundary vanishes.

### Examples

- K₀(Cr*(F_n))≅ℤ and K₁(Cr*(F_n))≅ℤⁿ, so Cr*(F_m)≇Cr*(F_n) for m≠n.
- K₀(A_θ)≅K₁(A_θ)≅ℤ² for every θ, with trace range ℤ+θℤ.
- K₀(O_n)≅ℤ/(n−1) and K₁(O_n)=0; K₀(O_∞)≅ℤ and K₁(O_∞)=0.
- For compact G acting trivially on ℂ, `KK_G(ℂ,ℂ)≅R(G)≅K₀(C*(G))`.

### Dependencies

K1–K6; OperatorAlgebraDynamics D1–D4 and D6; HilbertModules H1–H3; CStarAlgebras C5;
TopologicalKTheory T6; VonNeumannAlgebras V0 and V11; Tau Ceti's full crossed product
(`TauCeti/Analysis/CStarAlgebra/Action/CrossedProduct/Full.lean`), factor sets and twisted monoid
algebra (`TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean`) and amenability of commutative groups
(`TauCeti/GroupTheory/Amenable/Abelian.lean`); Mathlib free-group, Cayley-graph, `lp`,
Pontryagin-dual and Haar-measure APIs.

## K8. Bootstrap UCT and Künneth

### 8.1 The bootstrap class

*Needs:* K6.3–6.4; K7.4 and K7.6–7.7; CStarAlgebras C5 inductive limits.

Fix one universe u for the C*-algebra category and define the bootstrap class N as an inductively
generated predicate on its separable nuclear algebras, with universe-lift comparisons: the
smallest class containing ℂ, closed under countable inductive limits, two-out-of-three for
extensions, and KK-equivalence among separable nuclear algebras (Blackadar, Definition 22.3.4).
Membership in N is an explicit hypothesis in the theorems below; no claim that nuclearity alone
implies membership is a target.

- N contains the separable commutative and AF algebras and is closed under suspensions,
  stabilization, and crossed products by ℤ and ℝ, using K7.
- The finite Cuntz algebras are in N by the semisplit extension with E_n: first E_n is in N by its
  scalar KK-equivalence, then two-out-of-three gives O_n. O_∞ is in N as the inductive limit of the
  E_n.
- Compact metrizable spaces are inverse limits of finite polyhedra, using refining finite-cover
  nerves and comparison maps; finite CW function algebras are in N by cell-attachment extensions
  and induction, and the function-algebra direct limits follow. Noncompact second-countable
  locally compact spaces are handled through one-point compactification and its evaluation ideal.
  These topological bridges are targets here.

**Checks.**
- The zero algebra is in N by two-out-of-three for `0→ℂ→ℂ→0→0`, and Sℂ is in N by the extension
  `0→Sℂ→Cℂ→ℂ→0`, whose middle term is contractible and so KK-equivalent to 0.
- O_n is in N: E_n is KK-equivalent to ℂ, K is KK-equivalent to ℂ by stability, and
  `0→K→E_n→O_n→0` is semisplit.
- B(H) is not separable and Cr*(F₂) is not nuclear, so neither is in N; membership is never
  inferred from separability or nuclearity alone.

### 8.2 Ext and Tor over ℤ

*Needs:* Mathlib `CategoryTheory.Abelian.Ext`, `CategoryTheory.Tor` and `ModuleCat ℤ`.

Use Mathlib's `CategoryTheory.Abelian.Ext` on `ModuleCat ℤ` and `CategoryTheory.Tor` for the
homological algebra. Build the bridges from countable free abelian presentations to these
derived-functor objects: length-one projective resolutions over ℤ, computation of Ext¹ and Tor₁,
naturality, balanced tensor symmetry, and the required vanishing criteria (Stacks Project, Section
10.71, Tag 00LO, with Lemma 10.71.5, Tag 00LT, for Ext from free resolutions; Section 10.75, Tag
00LY, with Lemmas 10.75.1 and 10.75.5, Tags 00LZ and 00M3, for Tor and its symmetry). Prove that
Ext¹ takes direct sums in its first variable to products and that Tor₁ commutes with direct sums in
either variable; include the cyclic-group computations. Prove freeness of subgroups of countable
free abelian groups and identify the concrete resolution kernels and cokernels with the native
Ext/Tor groups.

### 8.3 Geometric resolutions and the universal coefficient theorem

*Needs:* 8.1–8.2; K6.2–6.4; K3.1; Mathlib `CategoryTheory.ShortComplex.ShortExact.extClass`.

Construct geometric free resolutions of K-groups. For separable A, realize generators by a
*-homomorphism from a commutative algebra with spectrum a countable disjoint union of lines and
planes into `SA⊗K`, surjective on K-theory. Replace A by `S²A⊗K` to obtain the geometric free
resolution, as in Blackadar, Proposition 23.5.1, and form its semisplit mapping-cone extension.
For separable nuclear A not assumed in N, define the canonical map κ from the kernel of the
K-theory action γ to the degree-shifted Ext¹ group: use K6's semisplit-extension picture and the
short exact K-group extension associated to a class with zero K-theory action, with
`ShortComplex.ShortExact.extClass` in the native Abelian.Ext API for this extension class. Define
the UCT condition on such A by requiring, for every separable B and both degrees, that γ is
surjective and κ is an isomorphism. This pins the condition used in CStarClassification
independently of prior knowledge that A belongs to N. No finite-generation hypothesis is imposed.

- The K-groups of the replacement compare back through the fixed Bott and stability maps, and the
  K-theory sequence of the mapping-cone extension is a free resolution.
- UCT: for A∈N and separable B there is a natural short exact sequence

  ```
  0 → ⊕_(j=0,1) Ext¹ℤ(K_j(A), K_(j+i+1)(B))
    → KK_i(A,B)
    → ⊕_(j=0,1) Homℤ(K_j(A), K_(j+i)(B)) → 0,
  ```

  with indices modulo 2 (Blackadar, Theorem 23.1.1, p. 233). Its proof develops the KK
  exact-sequence comparison, bootstrap induction and resolution independence. The right map is the
  action on K-theory by Kasparov product; the left map is natural in both variables; a splitting
  exists, without a natural choice; and the right map is an isomorphism if K_*(A) is free or
  K_*(B) divisible.
- κ agrees with the concrete free-resolution presentation, is independent of representatives,
  additive and natural under Kasparov products, and the UCT injection above is κ⁻¹.
- For A,B∈N a graded K-group isomorphism lifts to a KK-equivalence, using the product behavior of
  the UCT kernel rather than assuming an arbitrary lift is invertible. This classifies the
  KK-invariant; *-isomorphism classification is owned by CStarClassification.
- The unital scalar inclusion `ℂ→O_∞` is a KK-equivalence, by K7's unit-preserving computation and
  this UCT argument.

**Checks.**
- For A=ℂ both Ext terms vanish and the sequence reduces to `KK_i(ℂ,B)≅K_i(B)`.
- For A=O_n with n≥2 and B=ℂ, `KK₀(O_n,ℂ)=0`, while `KK₁(O_n,ℂ)≅Ext¹(ℤ/(n−1),ℤ)≅ℤ/(n−1)` comes
  entirely from the Ext term; a sequence omitting it gives 0.
- In degree i the Ext term pairs `K_j(A)` with `K_(j+i+1)(B)`: for i=1 these are `K₀(A)` with
  `K₀(B)` and `K₁(A)` with `K₁(B)`.

### 8.4 Planar compact sets and the Brown–Douglas–Fillmore theorem

*Needs:* 8.3; K4.1 and K4.5; K6.5; CStarAlgebras C8 Weyl–von Neumann–Voiculescu; Mathlib
`LocallyConstant.freeOfProfinite`, `ConnectedComponents`, `ContinuousLinearMap.IsFredholm` and
`IsCompactOperator`.

Apply UCT to compact subsets X of ℂ. Build the planar topological input through finite planar
polyhedral neighborhoods and continuity: `K₀(C(X))≃C(X,ℤ)` is free abelian, and `K₁(C(X))` is the
direct sum of copies of ℤ indexed by bounded components of `ℂ∖X`. Construct the winding generators
`x↦(x−λ)/|x−λ|` for one λ in each bounded complementary component and their compatibility under
neighborhood restriction. Compare locally constant integer functions with those on the profinite
space `ConnectedComponents X` and consume `LocallyConstant.freeOfProfinite` (Nöbeling); prove the
component-quotient bridge. Torsion-freeness alone would not make the UCT Ext¹ term vanish. Identify
the UCT Hom map with index pairing against the winding generators. Supply essential unital
representatives and the absorption argument when passing from the following Ext classification to
actual unitary equivalence modulo compacts. For nonempty compact X an evaluation class in
KK₀(C(X),ℂ) pairs to 1 with the unit. Use K6's comparison exact sequence to deduce unital strong
Ext→ordinary Ext is an isomorphism in this case. Then apply the separate unital absorption theorem
to essential Busby maps; a general unital comparison isomorphism is not used.

Define `IsEssentiallyNormal`: an operator T on a Hilbert space is essentially normal when
`T*T−TT*` is compact. Define `essentialSpectrum`: the essential spectrum σ_e(T) is the set of λ
for which `T−λ` is not Fredholm, equivalently, by Atkinson's theorem in 4.1, for which the Calkin
class of `T−λ` is not invertible. On a finite-dimensional space every operator is essentially
normal and σ_e(T) is empty. For an essentially normal operator T on an infinite-dimensional
separable Hilbert space, construct its extension of `C(X)` by compact operators, where `X=σ_e(T)`.
Prove the Brown–Douglas–Fillmore classification for compact subsets X of ℂ: its Ext group is the
product of one copy of ℤ for each bounded connected component of `ℂ∖X`, represented by
`λ↦index(T−λ)` (Blackadar, Theorem 16.2.1). Prove local constancy and vanishing on the unbounded
component, realize every such collection of integers, and prove completeness of the invariant.
Establish the passage from stable extension equivalence to the following operator statements,
using absorption and the Weyl–von Neumann–Voiculescu theorem of CStarAlgebras C8 (Blackadar,
Corollary 16.2.2). Both hold on every separable Hilbert space; in finite dimension both sides are
true, since every operator is compact, σ_e is empty and every index is 0.

- `exists_unitary_isCompactOperator_conj_sub_iff_index_eq`: two essentially normal operators T₁,
  T₂ with the same essential spectrum satisfy `UT₁U*−T₂` compact for some unitary U exactly when
  `index(T₁−λ)=index(T₂−λ)` for every λ outside the essential spectrum.
- `exists_isStarNormal_isCompactOperator_sub_iff_index_eq_zero`: an essentially normal operator T
  is a compact perturbation of a normal operator exactly when `index(T−λ)=0` for every λ outside
  its essential spectrum. The unilateral shift is the basic obstruction.

**Checks.**
- The unilateral shift S has `S*S−SS*=e₀₀`, so it is essentially normal, with `σ_e(S)` the unit
  circle and `index(S−λ)=−1` for |λ|<1; hence S is not a compact perturbation of a normal
  operator.
- The bilateral shift is normal with essential spectrum the unit circle and index function 0
  inside it; S⊕S* has index function `−1+1=0`, so it is a compact perturbation of a normal
  operator.
- For X with connected complement, such as a segment or a closed disc, the Ext group is 0, so
  every essentially normal operator with essential spectrum X is normal plus compact.

### 8.5 The Künneth theorem

*Needs:* 8.2–8.3; K3.4 external products; K2.3 continuity.

For A∈N and any C*-algebra B prove the spatial Künneth sequence (Blackadar, Theorem 23.1.3)

```
0 → ⊕_(j+k=i) K_j(A)⊗ℤK_k(B)
  → K_i(A⊗B)
  → ⊕_(j+k=i+1) Tor₁ℤ(K_j(A),K_k(B)) → 0.
```

The first arrow is K3's external product. Prove naturality, the noncanonical splitting, and the
identification of the right map through the free resolution. Extend from separable B by
directed-limit continuity, proving the needed compatibility of the algebraic terms with those
limits. If either graded K-group is torsion-free, prove the Tor term vanishes and the external
product is an isomorphism. No finite-generation hypothesis is imposed on this tensor-product
theorem. Include torsion examples where the Tor contribution is nonzero, as well as computations
for tensor products of commutative, AF and rotation algebras.

**Checks.**
- For A=O_n and B=O_m, `K₀(O_n⊗O_m)≅ℤ/(n−1)⊗ℤ/(m−1)` and `K₁(O_n⊗O_m)≅Tor₁(ℤ/(n−1),ℤ/(m−1))`,
  both cyclic of order gcd(n−1,m−1); for n=m=3 the group K₁ is ℤ/2 and comes only from Tor.
- For A=C(𝕋) the K-groups are free and the external product `K_*(C(𝕋))⊗K_*(B)≅K_*(C(𝕋)⊗B)` is
  an isomorphism.
- In degree i the Tor term uses the pairs with `j+k=i+1`: for i=1 these are `(K₀(A),K₀(B))` and
  `(K₁(A),K₁(B))`.

### Examples

- `KK(O_n,O_n)≅ℤ/(n−1)` for n≥2, from the Hom term alone.
- For X the circle in ℂ, `Ext(C(X))≅ℤ` through the index at an interior point, with the class
  of the unilateral shift equal to −1.
- `K₀(A_θ⊗A_θ′)≅K₁(A_θ⊗A_θ′)≅ℤ⁸` for all real θ,θ′, since the K-groups are free.

### Dependencies

K3–K7; CStarAlgebras C5 and C8; Mathlib homological-algebra, Nöbeling and Fredholm APIs.

## K9. Asymptotic morphisms and E-theory

### 9.1 Asymptotic morphisms

*Needs:* CStarAlgebras C5 path algebras.

For separable C*-algebras A,B define an asymptotic morphism (Blackadar, Definition 25.1.1) as maps
`φ_t:A→B`, t≥1, continuous in t at each a, with addition, complex scalar multiplication,
multiplication and star defects tending to zero in norm. No exact linearity or multiplicativity at
finite t is required. Two asymptotic morphisms are equivalent when their pointwise norm difference
tends to zero, and homotopic when joined by an asymptotic morphism into `C([0,1],B)` with the
defects uniform in the homotopy parameter.

- Asymptotic contractivity holds at each a, so the induced map into
  `B_∞=C_b([1,∞),B)/C₀([1,∞),B)` is a *-homomorphism.
- Equivalence and homotopy are equivalence relations, and equivalent asymptotic morphisms are
  homotopic.
- Genuine *-homomorphisms give asymptotic morphisms functorially, and homotopy classes are
  invariant under reparameterization.

**Checks.**
- A *-homomorphism φ gives the constant asymptotic morphism, and `φ_t=(1+1/t)φ` is equivalent to
  it: its multiplicativity defect is `−(1/t)(1+1/t)φ(ab)`, which tends to 0.
- On A=B=ℂ the maps `φ_t(a)=2a` are not an asymptotic morphism: the multiplicativity defect at
  a=b=1 is `2−4=−2` for every t.
- Asymptotic contractivity, `limsup‖φ_t(a)‖≤‖a‖`, holds although no bound is imposed at finite t;
  for `(1+1/t)φ` with φ isometric the norms exceed ‖a‖ at every t and converge to it.

### 9.2 Continuous selections: the Bartle–Graves theorem

*Needs:* Mathlib `ContinuousLinearMap.NonlinearRightInverse`,
`ContinuousLinearMap.exists_nonlinearRightInverse_of_surjective` and
`LowerHemicontinuous.exists_continuous_selection`.

Supply the continuous-selection bridge needed for uniformization: prove the Bartle–Graves theorem
that a surjective continuous linear map `q:E→F` between real Banach spaces has a continuous,
positively homogeneous nonlinear right inverse (Messerschmidt, Theorem 5.1), with a uniform linear
norm bound. Derive it from Michael's selection theorem,
`LowerHemicontinuous.exists_continuous_selection`. The open mapping theorem, in the form
`ContinuousLinearMap.exists_nonlinearRightInverse_of_surjective`, gives C such that every y has a
preimage of norm at most `C‖y‖`; fix R>C. On the unit sphere of F, a metric space and hence
paracompact and normal, the map `y↦q⁻¹{y}∩closedBall 0 R` has nonempty closed convex values. It is
lower hemicontinuous: a point x₀ of the fibre over y₀ is first moved along the segment towards a
fibre point of norm at most C to a fibre point of norm less than R, and the open mapping theorem
then corrects it to a point of the fibre over any nearby y. The selection theorem gives a continuous
σ on the sphere with `qσ(y)=y` and `‖σ(y)‖≤R`. Put `s(0)=0` and `s(y)=‖y‖σ(y/‖y‖)` for y≠0; then
`qs=id`, s is positively homogeneous, `‖s(y)‖≤R‖y‖`, and s is continuous at 0 by this bound and
elsewhere by construction. For F=0 take s=0. Mathlib's `NonlinearRightInverse` supplies a
norm-controlled right inverse but has no continuity field; the continuous selection is an additional
theorem, not an instance inferred from that structure. Apply it to `C_b→B_∞` on underlying real
spaces to replace any asymptotic morphism by an equivalent continuous map `A→C_b([1,∞),B)`. Prove
its asymptotic defects and contractivity estimates are uniform on compact input sets.

**Checks.**
- The quotient map `ℓ^∞→ℓ^∞/c₀` has no bounded linear right inverse, since c₀ is not complemented
  in ℓ^∞, yet the theorem gives a continuous positively homogeneous one; the result does not
  follow from linear sections.
- Positive homogeneity at r=0 forces `s(0)=0`, and continuity at 0 with homogeneity gives
  `‖s(y)‖≤C‖y‖` for a single constant C; in the construction above the constant is the radius R,
  which works for `ℓ^∞→ℓ^∞/c₀` although that map has no linear section.
- For a split surjection, such as a coordinate projection `ℝ²→ℝ`, the linear section is already
  such a right inverse.

### 9.3 Composition of asymptotic morphisms

*Needs:* 9.1–9.2.

For uniform representatives φ:A→B and ψ:B→C of 9.2 define their composite as `ψ_(r(t))∘φ_t` for
a sufficiently fast continuous increasing `r(t)→∞` (Blackadar, Theorem 25.3.1).

- Such r exist, constructed from countable dense sets and compact-uniform estimates, and every
  faster reparameterization gives an equivalent composite.
- The homotopy class of the composite does not depend on the representatives or on r, and
  composition is associative on homotopy classes. This gives the asymptotic homotopy category
  (Blackadar, 25.3.2), with genuine homomorphisms as its specified comparison functor.

**Checks.**
- For *-homomorphisms φ, ψ the composite of `(1+1/t)φ` and `(1+1/t)ψ` is
  `(1+1/r(t))(1+1/t)ψφ`, equivalent to the constant asymptotic morphism ψφ for every `r(t)→∞`.
- If φ is a genuine *-homomorphism, `ψ_(r(t))∘φ` is an asymptotic morphism for every increasing
  `r(t)→∞`, and these composites are homotopic by reparameterization invariance of 9.1.
- For A=B=ℂ, `x_t=φ_t(1)` satisfies `x_t²−x_t→0` and `x_t−conjugate(x_t)→0` with t↦x_t
  continuous, so for large t it stays within 1/4 of 0 or within 1/4 of 1; hence φ is equivalent to
  0 or to the identity, the asymptotic homotopy classes from ℂ to ℂ are {0, id}, and composition
  is multiplication in {0,1}.

### 9.4 E-theory

*Needs:* 9.3; K3.1 suspension conventions; K6.1 quasicentral approximate units.

Define `E(A,B)=[[SA,SB⊗K]]` (Blackadar, Definition 25.4.4), with addition by stabilized block sum,
and put `E₁(A,B)=E(A,SB)`.

- E(A,B) is an abelian group, with inverse given by reversal of the domain suspension SA; identity
  classes and the reparameterized product make the separable C*-algebras an additive category.
- Stability and Bott periodicity hold in both variables, with the explicit comparison to K3's
  suspension conventions; in particular `E(A,SB)≃E(SA,B)`.
- Boundary classes are constructed using quasicentral approximate units (Blackadar, Proposition
  25.5.1), and the six-term exact sequences hold in each variable for every extension of separable
  C*-algebras, without a semisplitting hypothesis.
- The sequences are natural, compatible with mapping cones, and their boundaries are products with
  the boundary classes.

**Checks.**
- `E(ℂ,B)≅K₀(B)` and `E₁(ℂ,B)≅K₁(B)`; in particular E(ℂ,ℂ)≅ℤ with the identity class equal to 1.
- The class of a *-homomorphism f in E is the image of `[f]∈KK` under the comparison of 9.5.
- Reversing the domain suspension of a representative gives its additive inverse, as reversing
  the loop `exp(2πit)` gives `exp(−2πit)` in K₁(Sℂ).

### 9.5 Universal property and comparison with KK

*Needs:* 9.4; K6.3 universal property of KK; CStarAlgebras C6–C7 completely positive liftings.

Prove E-theory's universal property for stable, homotopy-invariant, half-exact functors on separable
C*-algebras to abelian categories (Blackadar, Theorem 25.6.1, which allows additive targets):
half-exact means that an extension is sent to a sequence whose image at the middle object equals the
kernel of the following map. Construct the factorization and prove its uniqueness and compatibility
with composition, including the contravariant version. Construct the canonical natural
transformation `KK_i(A,B)→E_i(A,B)`, preserving addition, products, homomorphism classes and
suspension, and identify `E_i(ℂ,B)` with K_i(B). If `KK(A,−)` is half-exact, prove this comparison
is an isomorphism for every separable B; in particular prove it for separable nuclear A using
completely positive lifting (Blackadar, Theorem 25.6.3, p. 278). This distinguishes KK's semisplit
excision from E-theory's excision for all separable extensions while retaining the concrete
comparison between their cycles and boundary classes.

### Examples

- For separable nuclear A, `KK(A,B)≅E(A,B)`; for A=O_n and B=ℂ both are 0 in degree 0 and
  ℤ/(n−1) in degree 1.
- The Toeplitz extension gives the boundary class in `E₁(C(𝕋),ℂ)≅ℤ` that pairs with `[z]` to −1.

### Dependencies

K2–K6; CStarAlgebras C5–C7; Mathlib `ContinuousLinearMap.NonlinearRightInverse`,
`ContinuousLinearMap.exists_nonlinearRightInverse_of_surjective` and
`LowerHemicontinuous.exists_continuous_selection`.

## Downstream consumers

- [NoncommutativeGeometry](../NoncommutativeGeometry/README.md) consumes K1–K7: idempotent and
  unitary K-theory, the Fréchet comparison of K3, the Fredholm and Atkinson theory of K4, KK
  cycles and index products, and K7's rotation algebras with their K-groups.
- [FreeProbability](../FreeProbability/README.md) consumes the reduced-word interface of
  K7.FreeGroups, the dilation theorem of K4 and the algebras E_n and O_∞ of K7.
- [OperatorTheory](../OperatorTheory/README.md)'s ToeplitzOperators consumes K4's Atkinson theorem
  and compact-perturbation index foundation.
- [SeibergWittenTheory](../SeibergWittenTheory/README.md) consumes K4's module-index comparison.
- [GeneralizedCohomology](../GeneralizedCohomology/README.md) consumes K5's graded Clifford
  conventions and its swapped parity reduction.
- CStarClassification consumes K1's projection and trace invariants, K5's countable additivity,
  K8's UCT condition and K9's asymptotic morphisms.
- The twisted algebras `C*(D,β)` of lattices D in phase space in HeisenbergImprimitivity Layer 3
  and the quantum tori `C*(ℤ^d,σ_Θ)` of CompactQuantumMetricSpaces §6.0 are 7.5's `C*(L,c)` at L=D
  and at L=ℤ^d, with the same twisted regular representation `W_xδ_z=c(x,z)δ_(x+z)`, trace
  `⟨δ_0,aδ_0⟩`, gauge action `α_χ(W_y)=χ(y)W_y` and universal property.

## References

- Bruce Blackadar, [*K-Theory for Operator Algebras*, second
  edition](https://www.bruceblackadar.com/Mathematics/book6.pdf): Definitions 5.1.1, 5.5.1 and 8.1.1
  for the projection and unitary models (K1–K2); Definition 9.1.1 and Theorems 9.2.1 and 9.3.1 for
  the Bott map, periodicity and the exact sequence (K3); Theorem 21.2.2 and the remark after it for
  the pullback sequence (3.3); Theorem 10.2.1 for the Pimsner–Voiculescu sequence (7.4); Theorem
  12.4.2 for the technical theorem (6.1); Theorem 13.6.2 for Kasparov stabilization (5.1); Theorem
  15.7.1 for invertibility of extensions (4.5); Theorem 16.2.1 and Corollary 16.2.2 for the
  Brown–Douglas–Fillmore theorem (8.4); Definitions 17.1.1 and 17.3.1 for Kasparov cycles and KK
  (5.2); Theorems 18.4.3 and 18.6.1 for the product (6.2); Theorems 19.5.7 and 19.7.1 for the
  six-term sequence and countable additivity (5.3, 6.4); Theorem 20.2.7 for Green–Julg (7.2);
  Definition 22.3.4 for the bootstrap class (8.1); Theorems 23.1.1 and 23.1.3 and Proposition 23.5.1
  for the UCT, Künneth and geometric resolutions (8.3, 8.5); Definition 25.1.1 and Theorem 25.6.1
  for asymptotic morphisms and the universal property of E-theory (K9); the remaining locators are
  given at the claims they support. The pullback remark cites C. Schochet, *Topological methods for
  C*-algebras III: axiomatic homology*, Pacific J. Math. 114 (1984), 399–445, Theorem 4.5, p. 431.
- John Roe, [*Lectures on K-Theory and Operator
  Algebras*](https://bpb-us-e1.wpmucdn.com/sites.psu.edu/dist/1/4020/files/2017/12/KTheoryNotes-1uvuwyz.pdf):
  Lectures 7–8 for continuity, exactness and the Toeplitz proof of coefficient Bott periodicity
  (K2–K3); Lectures 10–12 for projective modules and Fredholm pairs (K1, K4); Lectures 14–16 for
  inverse-closed dense subalgebras (3.5); Lectures 19–21, with Lemma 19.1, for the Connes–Thom
  construction and its winding −1 normalization (7.7).
- Ioannis P. Zois, [*18 Lectures on K-Theory*](https://arxiv.org/abs/1008.1346), Analytic K-theory,
  Lecture 1, Theorem 1, p. 59: Atkinson's theorem (4.1).
- The Stacks Project, [Section 10.71, Ext groups](https://stacks.math.columbia.edu/tag/00LO), Lemma
  10.71.5, and [Section 10.75, Tor groups](https://stacks.math.columbia.edu/tag/00LY), Lemmas
  10.75.1 and 10.75.5: Ext and Tor from free resolutions and the symmetry of Tor (8.2).
- Miek Messerschmidt, [*A pointwise Lipschitz selection theorem*](https://arxiv.org/abs/1611.08435),
  Theorem 5.1: the classical Bartle–Graves continuous positively homogeneous selection theorem,
  whose standard proof the paper describes as an application of Michael's selection theorem (9.2).
  Its stronger pointwise Lipschitz conclusion, Theorem 5.2, is outside this roadmap.
- Joachim Cuntz, [*K-theory for certain C*-algebras.
  II*](https://www.theta.ro/jot/archive/1981-005-001/1981-005-001-009.pdf), J. Operator Theory 5
  (1981), Theorem 1.5 and §2.4, pp. 105–107: Toeplitz exact sequences and the unital finite-stage
  and O_∞ K-theory computations (7.6).
- Mihai Pimsner and Dan Voiculescu, [*K-groups of reduced crossed products by free
  groups*](https://jot.theta.ro/jot/archive/1982-008-001/1982-008-001-006.html), J. Operator Theory
  8 (1982), Lemmas 1.1–1.3, §2, Theorem 3.1 and Corollary 3.2 (7.3).
- Pierre Julg, [*A new look at the Julg–Valette homotopy for groups acting on
  trees*](https://arxiv.org/abs/1310.6941), §§1–5: the tree cycle, the operators T_t and the unit
  class (7.3).
- Vladimir Manuilov and Klaus Thomsen, [*The group of unital
  C*-extensions*](https://arxiv.org/abs/math/0501472), Lemmas 1–2 and Theorem 3, pp. 2–5, for the
  strong unital invertible-class comparison, with separable source and stable separable ideal (6.5).
- N. Christopher Phillips, [*Every simple higher dimensional noncommutative torus is an AT
  algebra*](https://arxiv.org/abs/math/0609783), Remark 1.2, Lemma 1.5, Definition 1.6 and
  Theorem 1.9: the universal presentation, the iterated crossed-product description and the
  simplicity criterion for noncommutative tori (7.5). Theorem 1.9 attributes the simplicity
  direction to J. Slawny, *On factor representations and the C*-algebra of canonical commutation
  relations*, Comm. Math. Phys. 24 (1972), Theorem 3.7.
- The Zulip discussions of [heterogeneous matrix operations and K₀ block
  sums](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/to_additive.20issues/near/311901875)
  and [general linear groups for stable
  K-theory](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/General.20linear.20group.20.28and.20special.20linear.20group.29/near/564149967)
  motivate the rectangular matrix operations and matrix units of K1–K2.
