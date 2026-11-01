# Roadmap: representations of compact groups and the Peter–Weyl theorem

**Summary.** Build on normalized Haar measure, finite-dimensional unitarization,
Peter–Weyl, compact character theory and the SU(2) symmetric-power classification.
The comparison targets concern invariant metrics, G-finite vectors in Banach
representations, metrizability, duals of arbitrary products, compact abelian
Fourier bases, global representation rings and unitary conjugacy of SU(2) actions.

## Scope and ownership

The Haar-through-Peter–Weyl and SU(2) constructions belong to the base compact-group
library. Their implemented statements are inputs, not construction targets:
Haar averaging and bi-invariance; Gram averaging and unitarization; orthogonal
complete reducibility; matrix coefficients, their star-algebra, Schur orthogonality,
convolution and uniform/L² density; the native irreducible skeleton and identified
Peter–Weyl basis; trace characters and the central L² character basis;
Frobenius–Schur forms and structure maps; and SU(2) classification and Weyl integration.
The exact native interfaces are listed below. The remaining comparisons preserve
these objects and their coefficient convention.

This roadmap owns field-general orbit finiteness and compact strongly continuous
Banach density. AutomorphicFormsOnReductiveGroups §2.1 owns the complete locally
convex extension and consumes this Banach theorem. SmoothBanachRepresentations
SB4 owns the stronger smooth-topology comparison. Neither is an analytic input.
Completed/OrthogonalL2Bases Part B owns generic weighted L² basis assembly;
CharacterTheory Layers 0–4 own finite-group character theory. LieGroups Layers 2,
4–6 supply automatic smoothness, Lie integration, covering groups and maximal
tori; the compact center/derived splitting and finite-cover refinement needed
for descent are explicit targets of Layer 6 here. OperatorTheory/OperatorIdeals
Part C owns the generic Hilbert–Schmidt theory; Layer 0 only compares continuous
kernels with it. The Hilbert-basis separability bridge in Layer 3 uses metric
separation and countable support, without a BanachSpaceTheory supplier claim.

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

An irreducible representation has V≠0 and no proper nonzero invariant subspace.
For finite-dimensional V all subspaces are closed, so this agrees with
`Representation.IsIrreducible`. On infinite-dimensional spaces topological
irreducibility uses closed invariant subspaces and is a different condition.

**Checks.**

- For the trivial group on V=0 the invariant-subspace lattice has one element:
  the old subspace-only condition holds but irreducibility is false.
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
- `Representation.IsIrreducible` in `Mathlib/RepresentationTheory/Irreducible.lean`:
  `IsSimpleOrder` of the subrepresentation lattice, including nontriviality.
- `HilbertBasis`, its coordinate isometry and Parseval in
  `Mathlib/Analysis/InnerProductSpace/l2Space.lean`; `ContinuousMap.toLp_denseRange`
  in `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean`.
- `Summable.countable_support_ennreal` in
  `Mathlib/Topology/Algebra/InfiniteSum/ENNReal.lean`: a nonnegative family with
  finite total mass has countable support. Apply it to squared basis coordinates.
- `PontryaginDual` and its compact-open topology in
  `Mathlib/Topology/Algebra/PontryaginDual.lean`, including discreteness for compact
  domain; `Circle.eq_one_of_forall_pow_mem_centeredArc_pi_div_two` for finite
  coordinate dependence. `AddMonoidAlgebra` and `Algebra.GrothendieckAddGroup`
  supply algebraic carriers, not a continuous-representation ring.

### From Tau Ceti

Paths in this list are below `TauCeti/RepresentationTheory/`.

- `Compact/Haar.lean`: `TauCeti.haarProb`, `TauCeti.haarProb_def`,
  `TauCeti.haarProb_apply_univ` and the probability, Haar and bi-invariance instances.
  `Compact/Averaging.lean`: `TauCeti.haarAverage`, for complete normed targets.
- `Compact/Unitarizable.lean`: `TauCeti.ContRepresentation.gramOperator` and
  `TauCeti.ContRepresentation.isUnitarizable`, for finite-dimensional actions with
  continuous parameter; `Compact/UnitaryModel.lean`:
  `TauCeti.ContRepresentation.exists_isUnitary_congr`.
- `Continuous/Unitary/Basic.lean`: `TauCeti.ContRepresentation.IsUnitary`;
  `Continuous/OrthogonalDecomposition.lean`:
  `TauCeti.ContRepresentation.IsUnitary.exists_orthogonal_irreducible_decomposition`;
  `Continuous/Schur.lean`:
  `ContRepresentation.exists_eq_smul_one_of_isIrreducible`.
- `Continuous/MatrixCoefficient.lean` and `Compact/MatrixCoefficient.lean`:
  `TauCeti.ContRepresentation.matrixCoeff` and `TauCeti.ContRepresentation.matrixCoeffLp`;
  `Compact/SchurOrthogonality.lean`:
  `TauCeti.ContRepresentation.schur_orthogonality_self` and
  `TauCeti.ContRepresentation.schur_orthogonality_basis`, with unitary irreducible hypotheses.
- `Compact/Convolution.lean`, `Compact/ApproximateIdentity.lean`,
  `Compact/EigenspaceRepresentation.lean`, `Compact/RepresentativeDensity.lean`:
  the continuous-kernel convolution, approximate identities and noncircular density route;
  in particular `TauCeti.representativeStarSubalgebra_dense` and its point-separation corollary.
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
- `SU2/Exhaustion.lean`: `TauCeti.SU2.symPowerModel` and
  `TauCeti.SU2.existsUnique_nonempty_equiv_symPower`;
  `SU2/Weyl/Character.lean` and `Integration.lean`: the global weight sum,
  sine quotient with nonzero denominator, endpoint values and
  `TauCeti.SU2.weyl_integration_formula`. Unitarize the monomial model before
  applying coefficient formulas; its Euclidean coordinates are not unitary for n≥2.
- `Compact/FourierPeterWeyl.lean`: `TauCeti.fourierPeterWeylIndexEquiv` and
  `TauCeti.peterWeylFamily_fourierIrrepModel`, including the sign −n.
  `TauCeti.fourierPontryaginDualEquiv` supplies the single-circle dual.

### From named roadmaps

LieGroups Layers 2, 4, 5 and 6 supply respectively automatic smoothness,
integration of homomorphisms from simply connected groups, universal covering
homomorphisms and maximal tori with Weyl groups. LieHighestWeight Layers 0–5
supply finite-dimensional semisimple highest-weight modules; its Layer 6 supplies
formal-character additivity and lower-weight bounds. Only these interfaces are
needed for Layer 6, not the compact Haar applications of its Weyl formula.
OperatorTheory/OperatorIdeals Part C supplies Hilbert–Schmidt operators and their
compactness for Layer 0. No supplier is required to construct Haar, unitarization,
Peter–Weyl or the SU(2) classification a second time.

## How to read the build

Layer 0 compares the continuous representation interfaces and continuous kernels.
Layer 1 classifies invariant metrics; Layer 2 proves Banach orbit-finite density;
Layer 3 relates countability and metrizability; Layer 4 handles arbitrary products;
Layer 5 identifies abelian Fourier bases; Layer 6 constructs global-form descent
and the representation ring; Layer 7 classifies unitary SU(2) actions. Layers 1,
2 and 4 are independent beyond their named native inputs. The README carries
all targets and Checks; `Suggested.lean` carries headline acceptance statements.

## Layer 0: comparisons with the base theory

### 0.1 Finite-dimensional and kernel comparisons

Construct the equivalence between finite-dimensional continuous complex actions
and the full subcategory of `FDRep ℂ G` with continuous parameter maps. Prove that
it identifies algebraic and continuous intertwiners, subrepresentations, trace
characters, direct sums, tensors and duals. All finite-dimensional linear maps
are continuous, but continuity of the group parameter is a separate hypothesis.
Compare closed-subspace irreducibility with the nonzero algebraic definition.
These comparisons use the concrete forgetful functor and are not a replacement
representation category (Knapp, §IV.2, for finite-dimensional representations).

For every compact Hausdorff X with a finite regular Borel measure μ and continuous
complex kernel k on X×X, construct its integral operator on L²(μ), identify it
with the Hilbert–Schmidt operator of k and prove that its squared Hilbert–Schmidt
norm is ∫|k|² d(μ×μ). Specialize to convolution on a compact group with normalized
Haar; translation invariance gives ‖A_k‖²_HS=‖k‖²₂. This is the missing
continuous-kernel comparison, distinct from the native compactness proof.

- The categorical comparison preserves composition, identities, equivalences,
  tensor and trace; it restricts to the same invariant subspaces.
- The kernel map is complex-linear and respects adjoints: k*(x,y)=conj k(y,x).
  Kernels equal almost everywhere give the same operator; no full-support
  assumption is made on μ.
- The convolution specialization intertwines the kernel-to-operator map with
  the native convolution operator and its continuous representatives.

*Needs:* Mathlib `FDRep`, continuous linear maps and finite-dimensional topology;
native compact convolution; OperatorTheory/OperatorIdeals Part C.

**Checks.**

- On the zero representation the subrepresentation lattice has one point, so
  neither side of the irreducibility comparison holds; on trivial ℂ both hold.
- On X={1,2} with probability masses 1/2 and kernel 1, the operator is the
  rank-one averaging projection, and both squared norms equal 1.
- Kernel 0 has squared norm 0; with μ=0 every kernel induces zero, so injectivity
  of continuous kernels is not asserted without full support.

### Examples

For C₃, normalized character pairings are 1 on the diagonal and
(1+ω+ω²)/3=0 off the diagonal. For SU(2), χ₀(1)=1 and χ₁(1)=2;
Weyl integration of 1 gives (1/(2π))·4·(π/2)=1. These are normalization
Checks of the supplied theory, not additional admitted theorems.

### Dependencies

The native finite-dimensional compact theory, Mathlib finite-dimensional topology,
and OperatorTheory/OperatorIdeals Part C.

## Layer 1: invariant Hermitian metrics

### 1.1 invariant Hermitian metrics

Fix a finite-dimensional unitary complex representation π with its given inner
product, conjugate-linear in the first variable. Represent every Hermitian form
h by the unique self-adjoint continuous linear Gram operator T with
`h(v,w)=⟪v,Tw⟫`. Prove the representation and uniqueness, and that positive
definiteness of h is equivalent to `re⟪v,Tv⟫>0` for every v≠0. Invariance
`h(π(g)v,π(g)w)=h(v,w)` is equivalent to `Tπ(g)=π(g)T` for every g.
Prove these comparisons and their transport under unitary intertwiners. The
map `v↦h(v,−)` into the complex linear dual is conjugate-linear; construct
the comparison by the stated Gram operators with that scalar convention.

The scalar classification is a deduction from Knapp, Corollary 4.9, p.240, and the native Schur theorem. For irreducible π, apply scalar Schur to T. Self-adjointness
makes its scalar real and positivity makes it strictly positive. Prove that the
invariant positive Hermitian forms are exactly `c⟪−,−⟫` with a unique real c>0.
For two such forms, construct the identity-times-`1/√c` equivariant isometry
from the first metric to the second when `h₂=c h₁`, and prove both metric and
inverse identities. Consume the native
`TauCeti.ContRepresentation.exists_linearIsometryEquiv_congr_eq` theorem and
compare its normalization with this particular scalar map. For an initially
nonunitary representation, use native unitarization's Gram conjugacy to transport this
classification; no extra choice of an inner-product instance is implicit.

For a supplied finite unitary decomposition `V≃⊕_i(S_i⊗ℂ^{m_i})`, with the S_i
pairwise inequivalent unitary irreducibles and m_i>0, construct the *-algebra
identification of the commuting operators with `∏_i Matrix (Fin m_i) (Fin m_i) ℂ`.
Pin it by `T|_(S_i⊗ℂ^{m_i})=id_(S_i)⊗A_i`. Prove addition, multiplication,
complex scalars, adjoints and both inverse-map identities; for units prove
compatibility with operator and matrix inversion. Invariant positive metrics
correspond exactly to positive-definite Hermitian A_i. Under a decomposition
change `d'=(⊕_i(id⊗U_i))d`, with each U_i unitary, prove
`A_i'=U_i A_i U_i†`, and prove compatibility with reindexing. For the trivial representation
on ℂ², the Gram operator diag(1,2) gives an invariant positive metric that is
not a scalar multiple of the standard one. Thus scalar uniqueness uses the
irreducibility hypothesis; repeated copies retain their full matrix freedom.

Specialize to finite discrete groups and compare native unitarization's Haar average with
`|G|⁻¹ Σ_g⟪π(g)v,π(g)w⟫`; the unnormalized sum is |G| times that form.


*Needs:* Native unitarization, complete reducibility and scalar Schur; finite-dimensional Hermitian linear algebra.

**Checks.**

- T=2I on ℂ gives h(1,1)=2>0; T=0 gives 0 and is not positive definite.
- For the trivial action on ℂ², diag(1,2) is positive and invariant but nonscalar. Swapping the two basis vectors changes it to diag(2,1).
- For irreducible ℂ, h₂=4h₁ gives the isometry v↦v/2: h₂(v/2,v/2)=h₁(v,v). On V=0 every positive scalar gives the same form, so scalar uniqueness requires nonzeroness.
- On the zero module the multiplicity index is empty and the product commutant has one element; on S⊕S the commutant is M₂(ℂ), not ℂ.

### Examples

The C₃ average is one third of the unnormalized sum; for the trivial action both give h and 3h respectively.

### Dependencies

Native unitarization, complete reducibility and scalar Schur; finite-dimensional Hermitian linear algebra.

## Layer 2: G-finite vectors in Banach representations

### 2.1 G-finite vectors in Banach representations

For a compact Hausdorff topological group G, a complete complex normed space E
and a representation by continuous linear automorphisms, assume explicitly
that g↦π(g)v is continuous for every v. First define `IsGFinite` for a representation ρ of any group on a module over any
field k: the k-span of {ρ(g)v | g∈G} is finite dimensional. Construct its submodule
of vectors. Its underlying set is exactly {v | IsGFinite ρ v}; no topology enters
this definition.

- The orbit span of v+w lies in the sum of the two orbit spans, so two G-finite
  vectors have G-finite sum; scalar multiplication preserves G-finiteness.
- For every g, ρ(g)v has the same orbit-span dimension as v, so this submodule
  is invariant under the action.
- An equivariant k-linear map sends the orbit span into the image of that span,
  hence maps the G-finite submodule into the G-finite submodule of its target.

Here construct the application estimates and witnesses: uniform boundedness
on compact orbit maps gives C_π=sup_g‖π(g)‖<∞; operator-norm continuity is
not assumed. Construct the integrated action T_f v=∫f(g)π(g)v dμ_G for continuous f,
using the Bochner integral, and prove ‖T_f‖≤C_π‖f‖₁. Use the native
compact-group approximate identity, with normalization ∫u=1.
Use the normalized Haar measure and prove
π(h)T_f v=T_(L_h f)v, L_h f(g)=f(h⁻¹g).

Prove `gFinite_dense`, the density of G-finite vectors, by integrated representative functions. For a finite sum p of matrix
coefficients, left translates span a finite-dimensional space; covariance
makes T_p v G-finite. Given v and ε>0, retain an approximate-identity
kernel u with ‖T_u v−v‖<ε/2 and a representative function p with
C_π‖p−u‖₁‖v‖<ε/2, treating v=0 separately. Keep their actual
finite-orbit-span witnesses; these estimates prove density of the submodule. Prove the
norm estimates, covariance, naturality and uniform-on-compact-vector-sets
refinement from bounded operator norms and a finite ε-net. Use nets for
arbitrary compact groups. The vector-valued Bochner integral and its
separable-compact-image measurability follow from continuity, compactness and Bochner integration;
no separability of the whole E is imposed.

The proof order is the field-general orbit-span construction, native uniform
Peter–Weyl density, integrated representative functions, then Banach density.
AutomorphicFormsOnReductiveGroups §2.1 consumes this theorem for its complete
locally convex extension; no locally convex or smooth-vector result is a premise.


*Needs:* Native Haar integration, approximate identities and uniform Peter–Weyl density; Mathlib Bochner integration and uniform boundedness.

**Checks.**

- Zero has orbit-span dimension 0; a nonzero vector in any trivial representation has orbit-span dimension 1, including over 𝔽₂.
- For rotations on C(S¹), a nonzero Fourier monomial has orbit-span dimension 1; a sum of the distinct modes 0 and 1 has dimension 2.
- Every nonidentity rotation has operator distance 2 from identity on C(S¹), although each orbit map is continuous; trigonometric polynomials are dense.
- For the shift action of ℤ on ℓ²(ℤ), the point mass has infinitely many independent translates. This is outside the compact-group theorem.
- For the trivial action, T_f v=(∫f)v. Kernels of mass 1 fix v, and kernels of mass 2 send v to 2v; the normalization cannot be dropped.

### Examples

For v=0 take the zero approximant. For v≠0 choose errors ε/2 and ε/(2C_π‖v‖), giving total error less than ε. C_π≥1 on a nonzero space because π(1)=I.

### Dependencies

Native Haar integration, approximate identities and uniform Peter–Weyl density; Mathlib Bochner integration and uniform boundedness.

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
and build the Hilbert-basis countability bridge here: a complex Hilbert space
with a Hilbert basis indexed by I is separable iff I is countable. In the forward
direction distinct unit vectors have distance √2, so disjoint balls of radius
1/3 inject into a countable dense set. Conversely finite rational-complex
linear combinations of a countable basis form a countable dense set.
Use `Summable.countable_support_ennreal` for the support of each expansion. The metrization criterion
is downstream of general Peter–Weyl.

For every index type J, let G_J=∏_(j∈J) Circle with its product topology and
normalized Haar measure. The local instances `circleProductMeasurable` and
`circleProductBorel` choose the Borel sigma algebra of the full product topology,
including for uncountable J. Construct the continuous one-dimensional characters
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

The signatures are `secondCountable_iff_countable_irrepClass`,
`separable_L2_iff_countable_irrepClass` and `not_separable_L2_circleProduct`.
The four-way criterion is a deduction from the native Peter–Weyl basis and the
preceding metric argument. Etingof §37.1, p.199, and Theorem 37.5, p.202,
cover the countable-base setting only.


*Needs:* Native Peter–Weyl basis and separation; Mathlib compact metrization, countable products and Summable.countable_support_ennreal.

**Checks.**

- The zero Hilbert space has empty basis index and is separable; ℓ²(ℕ) has countable basis and is separable.
- In ℓ²(J), two distinct coordinate vectors have squared distance 2. Uncountable J therefore gives a nonseparable space.
- The empty circle product is a one-point group with one character and one-dimensional Haar L²; for J=ℕ the dual is countable.
- For the empty product the Borel sigma algebra is {∅,G}; on Circle² each open arc cylinder is measurable; on uncountable Circle^J the complement of the identity tuple is open and Borel, but is not in the coordinate cylinder sigma algebra because it depends on every coordinate.
- For uncountable J, χ_j and χ_k have pairing 0 for j≠k and squared distance 2; any single χ_j has support of size 1 in the Fourier expansion.

### Examples

The uncountable product has nonseparable L², yet each individual L² expansion has countably many nonzero coefficients; finite total squared norm excludes uncountably many positive terms.

### Dependencies

Native Peter–Weyl basis and separation; Mathlib compact metrization, countable products and Summable.countable_support_ennreal.

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
whose restricted coordinates are1 lies in that cylinder. All positive powers
of each of its elements still lie there; use native
`Circle.eq_one_of_forall_pow_mem_centeredArc_pi_div_two` to show χ is1 on
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
coordinate duals. The characters do not converge to1 in the compact-open dual
of Circle^ℕ, which is discrete. They also do not converge pointwise to1 on Circle^ℕ:
evaluate them on the constant tuple −1. Prove these topology distinctions.

This is Conway, *A Course in Functional Analysis*, second edition, VII.9,
exercise11, with the maps and topologies fixed explicitly.
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
`TauCeti.IrrepClass ℂ G` with `PontryaginDual G`. Prove that each complex
irreducible has dimension1: commutativity makes every action operator an
intertwiner, so Schur's lemma makes it scalar; irreducibility then forces
dimension1. Its scalar action is a continuous circle-valued character,
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
from the native Peter–Weyl theorem's Peter–Weyl theorem. This is the compact abelian specialization
of that construction; it uses neither the general LCA Fourier-inversion
engine nor Pontryagin biduality.

Construct
a Hilbert basis b of Haar L² indexed by `PontryaginDual G`
with the exact equation
`b χ = ContinuousMap.toLp 2 (TauCeti.haarProb G) ℂ c_χ`.
The normalized Haar measure makes these vectors have norm1. Fix the
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


*Needs:* Native Peter–Weyl and scalar Schur; Layers 3–4; Mathlib HilbertBasis and continuous character operations.

**Checks.**

- For the trivial group there is one character with value 1; its L² norm is 1 and it spans the one-dimensional space.
- At i on Circle, the scalar action χ has coefficient −i and Fourier vector i. Inverting the character in the coefficient index gives i.
- On C₃, χ and χ² are distinct and have pairing (1+ω+ω²)/3=0; each diagonal pairing is 1.
- For f=c_χ+2c_ψ with χ≠ψ, its two Fourier coordinates are 1 and 2 and both sides of Parseval are 5; zero has empty support and norm 0.

### Examples

On any circle product the Fourier index is a finitely supported integer family. Expansion is in L² and does not assert pointwise convergence.

### Dependencies

Native Peter–Weyl and scalar Schur; Layers 3–4; Mathlib HilbertBasis and continuous character operations.

## Layer 6: global forms and representation rings

### 6.1 global forms and representation rings

The preceding analytic results hold for all compact Hausdorff groups. This layer assumes K is a compact **connected finite-dimensional real Lie**
group, T an actual maximal torus and `W=N_K(T)/T`. Representations are
finite-dimensional continuous complex representations, with continuity of the
parameter map explicit as in the standing conventions. Use [LieGroups Layer 2](../LieGroups/README.md#layer-2-the-closed-subgroup-cartan-theorem)
for automatic smoothness and Layers 3–4 for differentiation and integration;
[LieHighestWeight Layers 0–5](../LieHighestWeight/README.md) supply the semisimple
highest-weight modules, one-dimensional top lines and finite lower-weight bounds.
Use only LieHighestWeight Layer 6's early formal-character/additivity interfaces: prove the leading
orbit-sum formula from those bounds and the actual normalizer action. Neither the
Weyl character formula nor its Haar/Fourier applications is a premise. No
Borel–Weil, flag cohomology, generic algebraic-group classification, HC isomorphism
or compact character-ring surjectivity is an input.

**Virtual representations and actual torus characters.** Construct R(K), the
Grothendieck ring of finite-dimensional continuous complex representations,
with addition by direct sum, multiplication by tensor product, unit, dual,
restriction and continuous intertwiner/equivalence APIs. Reuse the generic
additive group-completion engine (`Algebra.GrothendieckAddGroup`) and prove its
split-representation specialization. Native complete reducibility and Schur orthogonality identify
it with the free abelian group on irreducible equivalence classes, with the
finite tensor-decomposition coefficients as multiplication. Also identify it
with the subring of complex class functions generated by **continuous** finite
characters. The native general `TauCeti.virtualCharacters` allows arbitrary
algebraic representations; do not silently use its entire carrier for this
continuous subgroup. Construct the continuous subring and comparison map using
actual continuous coordinate models and prove equivalence-independence,
cancellation, character injectivity, tensor/dual identities and naturality.
The positive cone consists of nonnegative irreducible multiplicities; an
arbitrary integral combination is virtual and need not be a genuine module.

Let `X=Additive (PontryaginDual T)` be the actual character group (native
`PontryaginDual`, whose carrier is `ContinuousMonoidHom T Circle`), not the full
real dual Lie algebra and not an automatically simply connected weight lattice.
Construct torus weight spaces and their finite internal sum from commuting
unitaries; one-dimensionality of irreducibles gives `R(T)≃Z[X]`, using
Mathlib `AddMonoidAlgebra ℤ X` after the explicit additive-character convention.
Prove the character/Fourier coefficient equation and uniqueness, and the finite
rank/lattice identification from LieGroups Layer 6's identification of a compact torus with a finite product of circles.
For `chi(exp X)=exp(i ell_chi(X))`, the differential is `i ell_chi` and
`ell_chi(ker exp_T)⊆2πZ`. The period lattice is measured with this 2π normalization (Knapp, Proposition 4.58, p.264). For a real finite-dimensional T-module, construct the conjugate-linear map
on its complexification sending the chi-weight space bijectively to the
chi-inverse weight space, with its involution and dimension equations. This
proves opposite multiplicities without assuming semisimple root theory; the
compact adjoint application uses the full central/Cartan zero-weight space from the center/derived splitting below.
Pin the left Weyl action by `(w·chi)(t)=chi(n⁻¹tn)` for n representing w;
it is independent of the representative modulo T. On the integral group
algebra send `e^chi` to `e^(w·chi)`, with fixed subring `Z[X]^W`.

**Global existence and descent before the ring isomorphism.** Build the following
compact structural prerequisites before descent, using LieGroups Layers 4–6
for integration, universal covering homomorphisms and maximal tori.

- For every compact connected real Lie group K, prove its Lie algebra is the
  direct sum of its center and its semisimple derived algebra; prove that the
  connected derived subgroup is closed and that multiplication from the
  connected center times the derived subgroup is onto (Knapp, Corollary 4.25,
  p.249, and Theorem 4.29, pp.250–251).
- Prove the simply connected cover of the compact semisimple derived subgroup
  is compact, hence its covering kernel is finite (Knapp, Theorem 4.69, p.268).
- Construct the actual smooth covering homomorphism q:Z(K)^0×K_der,sc→K,
  q(z,s)=z·p(s), with finite central kernel F, its quotient topology and
  derivative isomorphism. Its restriction to covering maximal tori gives
  the injection X*(T)→X*(Z(K)^0)⊕P_der, whose image consists precisely of
  characters trivial on F. This is a deduction from the preceding two targets,
  the maximal-torus theorem and the period criterion of Proposition 4.58;
  the descent argument is Knapp, proof of Theorem 5.110, pp.335–336.

Do not treat the covering factors as direct factors of K. Dominance is imposed
only on the derived coordinate; the zero-root case retains the full central
character. The pullback and descent APIs preserve addition, tensor products,
duals and intertwiners, and their composites are identity.

For each dominant element of X, integrate the derived highest-weight module to
K_der,sc by LieGroups Layer 4, and use its specified central-torus character. The
covering-product action is the actual map
`(z,s)↦chi(z)·rho_lambda(s)`. Compute its restriction to F; the actual X condition
makes it the identity. Descend through q, proving continuity and smoothness from
the quotient/local-cover charts, not an unproved abstract representation of K.
(Knapp, Theorem 5.110, pp.335–336.) Construct and prove the descent on intertwiners, tensor and dual maps, unique
factorization and the top weight line. Prove irreducibility and uniqueness by
the derivative/connected-group stable-subspace dictionary. Conversely pull
back an irreducible K-module, use Schur for the central torus, and restrict to
the semisimple derived factor; its Lie highest weight and actual torus
character give exactly that dominant element of X. State all differentiability,
Lie-to-group invariant-subspace and intertwiner comparisons at this cut.
A Lie-algebra central functional can be arbitrary; it integrates only when the
actual periods and the finite kernel conditions hold.

By triangular highest-weight expansion (a deduction from Knapp, Theorem 5.110, pp.335–336, and LieHighestWeight Layer 6), restriction gives the ring isomorphism
`R(K)≃Z[X*(T)]^W`. Injectivity follows from all-element conjugacy into T and
compact character injectivity. For surjectivity, give the orbit-sum basis of
`Z[X]^W`, summing each DISTINCT weight in W·lambda once, including walls and
lambda=0. Prove the irreducible-character formula with leading orbit sum coefficient 1,
and triangular spanning by induction on the finite lower-weight sets. Each such
set has fixed central character and bounded semisimple weights; no ordering of
arbitrary central real directions is used. Construct the inverse ring
map, not just additive spanning, and prove it preserves multiplication by
restriction injectivity. This is integral virtual-character surjectivity; it
asserts neither that each invariant positive torus character is positive in
the irreducible basis nor that every Lie dominant weight integrates to K.

**Normalization and global-form tests.** For a torus W is trivial and all
irreducibles are its actual characters. For the trivial group R(K)=Z and X=0.
For SU2 all highest integers n≥0 occur, whereas for SO3 only even SU2 highest
integers descend. The positive torus character `e²+e⁻²=chi_(Sym²)−1` is
virtual but not a positive SU2 character, testing the positive-cone distinction. For U(n), n>0, use the actual covering
`S1×SU(n)→U(n), (z,A)↦zA`, with kernel `(z,z⁻¹I)` for zⁿ=1. A central exponent
q and derived highest coefficients a_i descend exactly when
`q≡Σ_(i=1)^(n−1) i a_i (mod n)`. Compare this with the full integer tuple
lambda, where q=Σlambda_i and a_i=lambda_i−lambda_(i+1). This is a congruence,
not an independent central/derived lattice split. Exterior powers1,…,n and
determinant inverse give the U(n) ring generators; include n=1, and treat U(0)
as trivial without a purported injective scalar-circle inclusion. Other global
forms need not admit all fundamental modules or a polynomial representation
ring on a purported independent set of fundamental characters.

**Recognizing genuine U(2) weight characters.** For a finitely supported
function `f:ℤ²→ℕ`, prove that f is the diagonal-torus weight-multiplicity
function of a finite-dimensional continuous complex U(2) representation iff the following two conditions hold (deduced from Knapp, Theorem 5.110, pp.335–336, and the native SU(2) weight strings):

```
f(a,b)=f(b,a)                         for all a,b∈ℤ,
f(a,b)≥f(a+1,b−1)                    whenever a≥b.
```

Finite support is a hypothesis, not a consequence of these two conditions.
Use this layer's actual character lattice and the engine's SU2 strings;
retain every central degree `a+b`, including negative determinant twists.
For each dominant pair `a≥b`, construct
`L_(a,b)=det^b⊗Sym^(a−b)(ℂ²)` restricted to U(2), and prove its weights
are `(a−j,b+j)`, `0≤j≤a−b`, each with multiplicity 1. Equivalently descend
`z^(a+b)⊗Sym^(a−b)` through `S1×SU2→U2`: the kernel element
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
positive cone in rank2; it does not infer positivity from Weyl invariance.


The algebraic universal-enveloping center and trace-form adapter is owned by
LieHighestWeight Layer 9. CharacteristicClasses §C5.1 owns compact invariant polynomial
restriction. Neither polynomial invariant theorem nor a semisimple Lie weight
label replaces this layer's actual integrable group-character construction.

*Needs:* Native compact characters, complete reducibility and SU(2) classification; LieGroups Layers 2 and 4–6; LieHighestWeight Layers 0–6; the center/derived and finite-cover targets of this layer.

**Checks.**

- For K={1}, X=0, W=1 and R(K)=ℤ; for K=Circle, R(K)=ℤ[t,t⁻¹], retaining t⁻¹ as well as t.
- For SU(2), weights n=0,1,2 have characters 1, t+t⁻¹, t²+1+t⁻². For SO(3) only even n descend: −I acts as (−1)^n.
- For U(2), q(z,s)=zs has kernel {(1,I),(−1,−I)}. Its action on z^q⊗Sym^a is (−1)^(q+a)=(−1)^(q−a), hence q≡a modulo 2.
- The U(2) weights (2,0),(1,1),(0,2) with multiplicities 1,2,1 have outward differences 1,1 and dimension 3+1=4. Values 1 at (1,−1),(−1,1) and 0 at (0,0) fail 0≥1.
- For the circle period 2π, weight n gives exp(in·2π)=1; the half-integer functional gives −1 and does not descend. For a two-element Weyl orbit the orbit sum has two terms, not twice each term.
- For SU(2), the tensor square of the dimension-two character is χ₂+χ₀: (t+t⁻¹)²=t²+2+t⁻². The virtual difference χ₂−χ₀=t²+t⁻² is Weyl invariant but not a genuine character.

### Examples

The U(2) criterion is a deduction from the global highest-weight classification and the explicit SU(2) strings, not an assertion that Weyl-invariant positive weights alone form a representation.

### Dependencies

Native compact characters, complete reducibility and SU(2) classification; LieGroups Layers 2 and 4–6; LieHighestWeight Layers 0–6; the center/derived and finite-cover targets of this layer.

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

  Prove `(-I)·v=(-1)^d v` on Sym^d(ℂ²). For d≥1 prove its Lie algebra
  action is nonzero and has zero kernel by simplicity of su(2); its group
  kernel is therefore discrete and central, using connectedness and the actual
  center Z(SU(2))={±I}. Thus the kernel is {I} for odd d and {±I} for positive
  even d; Sym^0 has kernel all of SU(2). Prove the kernel of the direct sum is
  the intersection of these kernels. Consequently the homomorphism is faithful
  iff m_d>0 for some odd d. A faithful continuous homomorphism here is a
  topological embedding by compactness of SU(2) and the Hausdorff target;
  compare it with the smooth Lie-group embedding through LieGroups' automatic
  smoothness and the injective differential. Supply the converse from an
  embedding to faithfulness.

  Identify these multiplicity lists with partitions of n, whose part d+1
  occurs m_d times. Embeddings correspond precisely to partitions containing
  an even part. Prove finiteness and the cardinal
  identity `#(embedding conjugacy classes)=p(n)-p_odd(n)`, where p(n) counts
  all partitions and p_odd(n) counts partitions with all parts odd, with the
  empty partition included. For n=0 and n=1 the only homomorphism is trivial
  and there are no embeddings; for n=2,3,4 the numbers of embedding classes
  are respectively 1,1,3. This is a deduction from the symmetric-power classification and the displayed kernel computation.

*Needs:* Native SU(2) classification and torus formulas; native unitary intertwiner comparison; LieGroups Layers 2–3; simplicity of su(2) from LieHighestWeight Layer 0.

**Checks.**

- For n=0 and n=1 the only action is trivial, and there are 0 embedding classes.
- For n=2,3,4 the counts p(n)−p_odd(n) are 2−1=1, 3−2=1 and 5−2=3.
- Sym⁰ has kernel all of SU(2); Sym¹ has kernel {I}; Sym² has kernel {±I}. Thus even representation dimension, not even highest weight, detects a faithful irreducible.
- For Sym¹⊕Sym¹, the kernel is {I}∩{I}={I} and dimension is 4; its multiplicity is complex multiplicity 2, including the quaternionic type of Sym¹.

### Examples

Partitions containing an even part give precisely the faithful actions. Compactness makes these injective continuous maps topological embeddings.

### Dependencies

Native SU(2) classification and torus formulas; native unitary intertwiner comparison; LieGroups Layers 2–3; simplicity of su(2) from LieHighestWeight Layer 0.

## Downstream consumers

AutomorphicFormsOnReductiveGroups §2.1 consumes Banach G-finite density and supplies
the locally convex extension. SmoothBanachRepresentations SB4 consumes compact-finite
approximation for its stronger smooth topology. The global-form ring comparison
supplies actual continuous characters with their central and period restrictions.

## References

- A. W. Knapp, *Lie Groups Beyond an Introduction*, digital second edition (2021),
  author-distributed version: Corollary 4.25 p.249, Theorem 4.29 pp.250–251,
  Proposition 4.58 pp.264–265, Theorem 4.69 p.268, and Theorem 5.110 pp.335–336.
  [Legal author edition](https://www.math.stonybrook.edu/~aknapp/download/Beyond2.pdf).
- P. Etingof, *Lie Groups and Lie Algebras II*, MIT 18.755 (Spring 2024),
  Lecture 11, §37, pp.199–204. This source assumes a countable base.
  [Institutional notes](https://ocw.mit.edu/courses/18-755-lie-groups-and-lie-algebras-ii-spring-2024/mit18_755_s24_lec11.pdf).
- J. B. Conway, *A Course in Functional Analysis*, second edition, Springer (1990),
  VII.9, Exercises 8–11, DOI 10.1007/978-1-4757-4383-8.
- D. Bump, *Lie Groups*, second edition, Springer (2013), Chapters 2–4 and 15–18,
  DOI 10.1007/978-1-4614-8024-2.
- T. Bröcker and T. tom Dieck, *Representations of Compact Lie Groups*, Springer
  (1985), Chapters II–III and VI, DOI 10.1007/978-3-662-12918-0.
- G. B. Folland, *A Course in Abstract Harmonic Analysis*, second edition, CRC
  (2016), Chapter 5, DOI 10.1201/b19172.
- E. Hewitt and K. A. Ross, *Abstract Harmonic Analysis*, Volumes I (1963) and
  II (1970), Springer; Volume II, Chapters VII–VIII, for arbitrary compact groups.
