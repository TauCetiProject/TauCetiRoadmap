# Roadmap: integral lattices, discriminant forms, and overlattices

An integral lattice is most useful as more than a Gram matrix.  It has a rational ambient space,
a dual lattice in that space, a finite discriminant group with a pairing, and intermediate
lattices controlled by subgroups of that discriminant group.  This roadmap builds that reusable
algebraic package and proves the discriminant-form gluing theorem.  It ends with checked ADE
discriminant forms and the basic glue calculation which enlarges `D₈` to `E₈`.

The primary object is a full `ℤ`-submodule `L` of a finite-dimensional rational vector space `V`,
expressed by Mathlib's `Submodule.IsLattice ℚ`, together with a symmetric rational bilinear form
which is integer-valued on `L`.  This choice makes
`LinearMap.BilinForm.dualSubmodule` the literal dual lattice and keeps finite-index overlattices in
one ambient space.  Nondegeneracy and every shade of definiteness are predicates rather than
structure fields, and the invariant which records them is the signature: duality, discriminant
forms, and gluing apply to indefinite lattices, and a degenerate lattice such as an affine Cartan
matrix is an object of the same type, reached from the nondegenerate theory by quotienting out the
radical.

This roadmap is a foundation for later roadmaps on code-lattice constructions and explicit
rank-24 lattice constructions.  It does **not** classify lattices in any rank; construct Niemeier or
Leech lattices or their glue tables; develop Construction A or a theory of codes; study theta
series, modular forms, mass formulae, reduction, packing, or automorphism groups; or make any
categorical claim.  It also does not replace Tau Ceti's root-system, Cartan-matrix, root-lattice, or
weight-lattice developments.  Those supply named ADE data; this roadmap supplies the bridge from
that data to integral lattices and performs the discriminant-form calculations.

Suggested home: `TauCeti/LinearAlgebra/IntegralLattice/`, with separate files for the basic lattice,
duality, finite bilinear and quadratic modules, overlattices, and ADE examples.

## Standing conventions

- The ambient space is an `ℚ`-vector space `V`.  A carrier `L : Submodule ℤ V` has
  `[L.IsLattice ℚ]`: it is finitely generated over `ℤ` and its `ℚ`-span is all of `V`.  Use the
  freeness, bases, rank, and scalar-extension API that follows from this Mathlib class; do not
  replace it by a private finite-free module.  Finite-dimensionality of `V` is a consequence.
- The form is `B : LinearMap.BilinForm ℚ V`, with `B.IsSymm`.  **Integral** means `B(x,y) ∈ ℤ` for
  every `x,y ∈ L`.  **Even** means `B(x,x) ∈ 2ℤ` for every `x ∈ L`.
- The **radical** is `LinearMap.ker B`, and `B.Nondegenerate` is exactly its triviality
  (`LinearMap.BilinForm.nondegenerate_iff_ker_eq_bot`).  Nondegeneracy is a predicate, carried as a
  mixin class on the lattice rather than as a structure field, so that a degenerate integral
  symmetric form is a lattice of the same type, and so is the restriction of a nondegenerate form to
  a subspace on which it degenerates.  Positive-semidefinite affine Cartan matrices are the
  motivating degenerate case.  Layer 1 is stated without nondegeneracy wherever the statement does
  not need it; Layers 2 to 4 assume it, and Layer 2 proves that the hypothesis is load-bearing
  rather than decorative.
- The **signature** is the triple `(n₊, n₀, n₋)`, where `n₊` and `n₋` are the largest dimensions of a
  subspace on which the form is positive-definite and negative-definite, and `n₀` is the dimension
  of the radical.  Mathlib supplies `n₊` and `n₋` as `sigPos` and `sigNeg` of `B.toQuadraticMap`,
  over any linearly ordered field and so over `ℚ` itself, with no extension to `ℝ`.
  **Positive-definite** means `n₀=n₋=0`,
  **positive-semidefinite** means `n₋=0`, **negative-definite** and **negative-semidefinite** are
  those conditions for `-B`, **degenerate** means `n₀>0`, and **indefinite** means `n₊>0` and
  `n₋>0`.  Each is a predicate, and `n₊+n₀+n₋` is the rank.
- The dual lattice is
  `L^∨ = {x : V | ∀ y ∈ L, B(x,y) ∈ ℤ}`, literally `B.dualSubmodule L`.  Integrality is equivalent
  to `L ≤ L^∨`.  **Unimodular** means the equality `L = L^∨`; determinant and discriminant-group
  criteria are theorems equivalent to this definition, not alternative definitions.
- For a `ℤ`-basis `e`, the Gram matrix is `(B(eᵢ,eⱼ))`.  Its signed determinant is retained as an
  integer invariant.  The nonnegative discriminant is its absolute value.  Thus
  `disc(L)=|det Gram(L)|=#(L^∨/L)`; the sign of a Gram determinant is never called the order of the
  discriminant group.  The second equality is a nondegeneracy statement: `det Gram(L)=0` is exactly
  `n₀>0`, and in that case `L^∨` contains the radical, so it is not finitely generated and `L^∨/L`
  is infinite.
- The discriminant group is `A_L=L^∨/L`.  Its bilinear form is
  `b_L(x+L,y+L)=B(x,y) mod ℤ`, valued in `ℚ/ℤ`, represented in Lean by
  `AddCircle (1 : ℚ)`.
- A quadratic discriminant form is attached only to an **even** lattice.  This roadmap uses the
  half-norm convention
  `q_L(x+L)=B(x,x)/2 mod ℤ : ℚ/ℤ`, so
  `q_L(x+y)-q_L(x)-q_L(y)=b_L(x,y)`.  Nikulin uses the equivalent full-norm convention
  `x ↦ B(x,x) mod 2ℤ : ℚ/2ℤ`; values quoted from that convention must be divided by two when put in
  the tables below.  No quadratic discriminant form is assigned to an odd lattice.
- An isometry is a linear equivalence which carries one carrier onto the other and preserves the
  bilinear form.  A module or additive equivalence without the form-preservation equation is not an
  isometry.  All invariance and functoriality statements use the former.
- Orthogonal direct sum uses the sum form with zero cross terms.  Negating a lattice means negating
  its form, and negates both discriminant forms.  Scaling and rational extension use Mathlib's
  scalar-action and base-change vocabulary and state their nonzero hypotheses.  Every comparison
  fixes the half-norm convention above.
- A finite bilinear module is a finite abelian group `A` with a symmetric biadditive map
  `b : A × A → ℚ/ℤ`.  Its adjoint is `A → CharacterModule A`, where Mathlib's
  `CharacterModule A = A →+ AddCircle (1 : ℚ)`.  **Nondegenerate** means that adjoint is an additive
  equivalence (equivalently, bijective), not merely injective with finiteness left implicit.
  Nondegeneracy is a predicate on a finite bilinear module, not a structure field: restriction to an
  arbitrary subgroup can be degenerate.  A finite quadratic module uses Mathlib's
  `QuadraticMap ℤ A (AddCircle (1 : ℚ))`, with the displayed polar form identified with `b`.
- For `H ≤ A`, `H^⊥={x | ∀ h∈H, b(x,h)=0}`.  `H` is isotropic for a bilinear form when
  `b|_{H×H}=0`, and is isotropic for a quadratic form when `q|_H=0`.  A **Lagrangian** is the stronger
  condition `H=H^⊥`; neither “isotropic” nor “maximal isotropic” is used as a synonym for it.
- ADE lattices use the positive Cartan/Gram matrices and roots of squared norm `2`.  Node labels and
  simple roots follow the Bourbaki numbering used by Tau Ceti.

## Existing library material to consume

### Mathlib

- `Mathlib/Algebra/Module/Lattice.lean` defines `Submodule.IsLattice A M` and develops finite
  generation, spanning, freeness over a PID, extended bases, rank, and intersections.  This is the
  carrier API for the entire roadmap.
- `Mathlib/Algebra/Module/ZLattice/*` has the distinct real-topological `IsZLattice` theory for
  discrete subgroups of real normed spaces.  Inventory its bases, covolume, and discreteness
  results, but do not make it the primary representation.  Add comparison lemmas only where they
  transport a genuinely useful theorem between a positive-definite rational lattice after
  extension to `ℝ` and the algebraic carrier used here.
- `Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean` defines
  `LinearMap.BilinForm.dualSubmodule`, its membership criterion, `dualSubmoduleToDual`, injectivity
  under nondegeneracy and spanning, dual-basis descriptions, and double-dual lemmas.  Complete its
  advertised missing lattice/perfect-pairing consequences rather than reimplementing it.
- `Mathlib/LinearAlgebra/QuadraticForm/Signature.lean` defines the indices of inertia `sigPos` and
  `sigNeg` over a linearly ordered commutative ring, proves them invariant under equivalence
  (`QuadraticMap.Equivalent.sigPos_eq` and its negative counterpart), and over a linearly ordered
  field proves `QuadraticForm.sigPos_add_sigNeg_add_radical` and the uniqueness half of Sylvester's
  law of inertia (`QuadraticForm.sigPos_of_equiv_weightedSumSquares` and its negative counterpart).
  The existence half is `QuadraticForm.equivalent_weightedSumSquares`.  Take the signature of an
  integral lattice from these applied to `B.toQuadraticMap` over `ℚ`; do not define a competing
  index of inertia.
- `Mathlib/LinearAlgebra/QuadraticForm/Radical.lean` defines `QuadraticMap.radical`, its
  preservation by isometry equivalences, invariance of its rank, and `QuadraticMap.lift` for
  quotienting by a submodule of the radical.  Use these for the degenerate case, and prove that over
  `ℚ` the quadratic radical of `B.toQuadraticMap` coincides with `LinearMap.ker B`.
- `Mathlib/LinearAlgebra/FreeModule/Finite/Quotient.lean` provides Smith-normal-form quotient
  equivalences and finiteness, notably `Submodule.quotientEquivPiZMod`,
  `finiteQuotientOfFreeOfRankEq`, and `finiteQuotient_iff`.
  `Mathlib/LinearAlgebra/FreeModule/Finite/CardQuotient.lean` provides determinant/index formulae,
  including `Submodule.natAbs_det_basis_change` and `AddSubgroup.relIndex_eq_abs_det`.
- `Mathlib/Algebra/Module/CharacterModule.lean` supplies `CharacterModule`, its contravariant
  `dual`, `congr`, separation of points by characters, and the injective/surjective duality lemmas.
  Use it for the adjoint of a finite bilinear form and its functoriality; do not introduce another
  character-dual type.
- `Mathlib/GroupTheory/Torsion.lean` supplies the additive `CommGroup.primaryComponent` and its
  disjointness and `p`-group API.  The module versions and decomposition theorems in
  `Mathlib/Algebra/Module/Torsion/PrimaryComponent.lean` and `.../PID.lean` supply the corresponding
  scalar-compatible facts.  The finite-module layer below proves compatibility of these existing
  components with the forms; it does not define primary components again.
- Mathlib already has bilinear and quadratic forms, `QuadraticMap.PosDef`, bases and matrices,
  determinants, tensor products and base change, finitely generated free modules, finite abelian
  groups, `ZMod`, quotient modules, and `AddCircle`.  Reuse each at the greatest generality which
  does not obscure the integral-lattice statements.

Mathlib does not yet bundle an integral lattice with this algebraic carrier, or provide discriminant
groups and forms, finite quadratic modules, and the overlattice/isotropic-subgroup correspondence.
It has the signature of a quadratic form but not the definiteness vocabulary of a lattice, which
this roadmap defines on top of it.

### Tau Ceti and neighboring roadmaps

Tau Ceti's root-system library already owns standard Cartan matrices and root data.  In particular,
`TauCeti/LinearAlgebra/RootSystem/FiniteType/Dynkin.lean` realizes the `E₈` Cartan/Gram matrix and its
`E₆` and `E₇` submatrices, while
`TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/E8.lean` enumerates the 240 `E₈` roots in
integral bases.  The [root-systems roadmap](../RepresentationTheory/RootSystems/README.md) owns the
classification, Bourbaki numbering, and pinned integral root data; its highest-weight neighbor owns
general root and weight lattices.  This roadmap constructs the conversion of such data into its
integral-lattice structure, proves that the Gram matrix is the named Cartan matrix, and computes the
associated dual quotient and forms.  It does not duplicate roots, Weyl groups, Cartan matrices, or
root-data classification.  This repository has Tau Ceti as a Lake dependency, so the accompanying
`Suggested.lean` imports the individual `TauCeti.LinearAlgebra.RootSystem.*` modules it needs and
prototypes the bridge against them rather than behind a Mathlib-only stand-in.

---

## Layer 1: lattices with forms

Build the primary bundled object and a usable API before introducing a quotient.

- Define an integral symmetric lattice from a carrier `L : Submodule ℤ V` with
  `[L.IsLattice ℚ]`, a symmetric `B : BilinForm ℚ V`, and a proof that `B(L,L)⊆ℤ`.
  Supply coercions to the carrier and form, an extensionality theorem, access to a carrier basis and
  rank, and constructors from a basis plus an integral symmetric Gram matrix and from an
  existing full submodule with form.  Prove that changing the chosen carrier basis does not change
  any basis-independent invariant.
- Define the radical as `LinearMap.ker B` and the signature `(n₊, n₀, n₋)` from `sigPos`, `sigNeg`,
  and the rank of the radical, and prove the quadratic radical of `B.toQuadraticMap` equal to
  `LinearMap.ker B`.  Prove `n₊+n₀+n₋` is the rank by consuming
  `QuadraticForm.sigPos_add_sigNeg_add_radical` rather than reproving inertia.  Define
  positive-definite, positive-semidefinite, negative-definite, negative-semidefinite, degenerate,
  and indefinite as predicates in the signature vocabulary, and prove each equivalent to its
  elementwise formulation: `B(x,x)>0` for every nonzero `x` in the positive-definite case,
  `B(x,x)≥0` for every `x` in the positive-semidefinite case, the same two for `-B` in the negative
  cases, a nonzero radical vector in the degenerate case, and vectors of both signs in the
  indefinite case.  Identify positive-definite with Mathlib's `QuadraticMap.PosDef`, prove
  positive-definite equivalent to positive-semidefinite together with nondegenerate, and prove
  indefinite equivalent to neither positive-semidefinite nor negative-semidefinite.
- Define nondegeneracy of a lattice as the mixin predicate `B.Nondegenerate`.  Prove it equivalent to
  triviality of `LinearMap.ker B`, to `n₀=0`, and, for any carrier basis, to nonvanishing of the
  Gram determinant.  Prove that the Gram-matrix constructor produces a nondegenerate lattice exactly
  from a nonsingular Gram matrix, and provide that instance so downstream layers acquire it without
  a side condition.
- Define linear isometries of integral lattices.  Provide identity, inverse, composition,
  extensionality, carrier restriction, rational extension from a carrier equivalence, transport of
  a lattice along a rational linear equivalence, and the induced equivalence on bases.  Prove
  invariance of integrality, evenness, nondegeneracy, the radical, the signature and each
  definiteness predicate, rank, signed determinant, and discriminant.
- Restrict the rational form to the carrier as an integer-valued bilinear form and prove that its
  rational scalar extension recovers `B`.  Conversely, extend an integral form on a
  finite free `ℤ`-module to its rationalization and relate the abstract rationalization to the
  embedded carrier model.  This is the entry point for consumers whose input begins as an abstract
  Gram matrix.
- For every carrier basis, define the integral Gram matrix, prove symmetry, and
  identify it with Mathlib's matrix of the restricted form.  Define the signed determinant and its
  nonnegative absolute value, prove change-of-basis invariance (`det` changes by the square of a
  unimodular determinant and hence in fact is unchanged), and make basis-free names available.
- Define evenness, unimodularity, norm, and roots of a specified norm.  Prove
  their elementary implications and transport lemmas.  Do not infer evenness from integrality or
  attach a quadratic discriminant form to an odd carrier.
- Construct the quotient of a lattice by its radical: the image of the carrier in `V ⧸ ker B`, with
  the induced form obtained from `QuadraticMap.lift`.  Prove that it is again a full integral
  lattice, that it is nondegenerate, that it inherits evenness, that its signature is `(n₊, 0, n₋)`,
  and that the quotient map preserves the form.  This is what makes the nondegenerate theory of
  Layers 2 to 4 available to a degenerate lattice, and it is how a consumer holding a
  positive-semidefinite affine Cartan matrix reaches the finite root lattice underneath it.
- Construct form scaling, form negation, and orthogonal direct sums.  State exactly how rank,
  determinant, discriminant, integrality, evenness, nondegeneracy, the radical, and the signature
  behave: signature is additive over orthogonal direct sums, negation exchanges `n₊` and `n₋` and
  fixes `n₀`, and scaling by a nonzero rational fixes or exchanges them according to its sign.
  Include canonical inclusions, projections, associativity/commutativity isometries, and
  compatibility of isometries with direct sum.

Acceptance at this layer includes a Gram-matrix constructor whose resulting carrier is genuinely a
`Submodule.IsLattice ℚ`, and an isometry-invariance theorem which cannot be applied to a bare
additive equivalence.  It also includes three lattices which exercise the predicates rather than
only the definite case: the hyperbolic plane `!![0,1;1,0]`, which is even, unimodular and indefinite
of signature `(1,0,1)`; the negative-definite rank-one lattice `⟨-2⟩` of signature `(0,0,1)`; and the
affine `Ã₁` Gram matrix `!![2,-2;-2,2]`, which is even, positive-semidefinite and degenerate of
signature `(1,1,0)`, and whose radical quotient is the `A₁` root lattice `⟨2⟩`.

## Layer 2: duality and the finite discriminant group

Every lattice in this layer and the two after it is nondegenerate, through the Layer 1 mixin, so the
hypothesis is an instance argument and not a repeated side condition.  Prove the two statements
which show that the hypothesis is load-bearing rather than decorative: the dual is a full lattice
exactly when the lattice is nondegenerate, and `A_L` is finite exactly then.  A degenerate lattice
reaches this layer through its radical quotient.

- Define `L^∨` using `B.dualSubmodule L`.  Prove `L ≤ L^∨ ↔ L` is integral (and record the flipped
  version before symmetry is used), and prove that the dual is again a full `ℤ`-lattice.  Show that
  `dualSubmoduleToDual` is an equivalence from `L^∨` to `Module.Dual ℤ L`, not only an injection;
  identify it in dual bases and establish the resulting perfect integral pairing.
- Prove `(L^∨)^∨=L`, with the correct `B.flip` in the nonsymmetric intermediate theorem, then derive
  the symmetric form.  Give the inclusions and equalities as submodule statements in the common
  ambient space.  Prove compatibility with isometry, scaling, negation, and orthogonal direct sum.
- Define `A_L` as the actual quotient of the subtype `L^∨` by the inverse-image of `L`; provide its
  quotient map, representative lemmas, zero criterion, additive-group structure, and functorial map
  induced by an isometry.  Prove it finite using equal rank and Mathlib's finite-quotient API.
- For a carrier basis, use the dual basis and Smith normal form to give
  `A_L ≃ ∏ i, ZMod dᵢ`, with the invariant factors and their divisibility chain explicit.  Relate
  these factors to the Smith normal form of the Gram matrix.  Prove
  `#A_L=|det Gram(L)|`, using the existing quotient-cardinality theorem rather than a fresh
  determinant/index proof.
- Prove the equivalence of the following, with nondegeneracy, integrality, fullness, and finite rank
  visible in the theorem context: `L=L^∨`; `A_L` is trivial; `#A_L=1`; the Gram determinant has
  absolute value one; and the restricted pairing `L → Module.Dual ℤ L` is an equivalence.  Signed
  determinant `-1` is allowed.
- Define `b_L` by reducing `B(x,y)` modulo `ℤ`.  Prove independence from both representatives,
  symmetry, biadditivity, and nondegeneracy.  Package the result as the finite bilinear module built
  in Layer 3, and prove its compatibility with isometry, direct sum, and form negation.

## Layer 3: finite bilinear and quadratic modules

Develop this layer independently for finite abelian groups before specializing it to discriminant
groups.

- Define a finite bilinear module as a finite abelian group with a symmetric biadditive
  `ℚ/ℤ`-valued form.  Define its adjoint `A → CharacterModule A`, nondegeneracy as that map being an
  additive equivalence, morphisms, isometries, isometry extensionality, restriction, form negation,
  and orthogonal direct sums.  Keep nondegeneracy as a predicate rather than bundled data, so that
  unrestricted restriction is well typed.  Prove equivalence between bijectivity and the standard
  trivial-radical formulation in the finite case, using Mathlib's character separation and duality
  API.
- Define a finite quadratic module by reusing
  `QuadraticMap ℤ A (AddCircle (1 : ℚ))`, and identify its symmetric biadditive polar form
  `b_q(x,y)=q(x+y)-q(x)-q(y)` with the underlying pairing.  Supply morphisms, isometries,
  orthogonal sums, negation, restriction, and passage to the underlying bilinear module.  State
  nondegeneracy through the polar form.  The codomain is the additive quotient `ℚ/ℤ`, not a ring;
  do not introduce a parallel private quadratic-map structure.
- Define the radical, isotropic elements and subgroups, `H^⊥`, and Lagrangians.  Prove
  `H ≤ H^⊥` under the appropriate bilinear-isotropy hypothesis and under quadratic isotropy, the
  unconditional inclusion `H ≤ H^⊥⊥`, order reversal, and the general finite formula
  `H^⊥⊥ = H + rad(b)`.  Deduce the double-perp equality `H^⊥⊥=H` and
  `|H| |H^⊥| = |A|` only under nondegeneracy.  Deduce `|H|²=|A|` for a Lagrangian.  Provide
  explicit membership and computation lemmas, rather than exposing these notions only through the
  later correspondence.
- Consume `CommGroup.primaryComponent A p`.  Prove distinct prime-primary components are
  orthogonal and that the canonical primary decomposition preserves the raw bilinear and quadratic
  forms.  Under `IsNondegenerate A`, prove each restricted primary form is nondegenerate and package
  the decomposition as an isometry of nondegenerate modules.  Prove that isotropy and orthogonal
  complements decompose componentwise.  This is the calculation API used by the ADE examples.
- Construct the discriminant bilinear module of every integral lattice.  For an even lattice,
  prove `B(x,x)/2 mod ℤ` descends to `A_L`, has polar form `b_L`, and is nondegenerate; package it as
  its discriminant quadratic module.  Prove functoriality under lattice isometry and compatibility
  with orthogonal sum and negation, always in the half-norm convention.

## Layer 4: overlattices and isotropic subgroups

All lattices in this layer lie in the same rational ambient space and use the same form.  An
overlattice carrier `M` is intermediate, `L ≤ M ≤ L^∨`; its finiteness and full-rank facts are proved
from those inclusions.  Define integrality and evenness of `M` separately, and define
`[M:L]=#(M/L)`.

- Construct the subgroup map `M ↦ M/L ≤ A_L` and, for a subgroup `H ≤ A_L`, the literal inverse
  image `L_H={x∈L^∨ | x+L∈H}` as a `ℤ`-submodule of `V`.  Prove `L ≤ L_H ≤ L^∨`, fullness, and that
  the two constructions are mutually inverse and order-preserving.  Package the result as an order
  isomorphism between intermediate lattices and subgroups, with explicit membership and quotient-map
  lemmas.
- Prove the two refinements without conflating them.  Integral overlattices correspond exactly to
  subgroups on which the **bilinear** discriminant form vanishes on `H×H`.  When `L` is even, even
  overlattices correspond exactly to subgroups on which the **quadratic** discriminant form vanishes.
  State both restrictions of the general intermediate-lattice correspondence.
- Prove `[L_H:L]=|H|` and
  `disc(L_H)=disc(L)/[L_H:L]²`, including the divisibility/integrality conclusion.  Relate a chain of
  intermediate lattices to a chain of subgroups and prove multiplicativity of index.
- For isotropic `H`, define the induced form on `H^⊥/H` and construct the natural isometry
  `A_{L_H} ≅ H^⊥/H`, bilinear in the integral case and quadratic in the even case.  Include the
  representative formula, nondegeneracy, order computation, and compatibility with the index and
  determinant formulae.  Deduce that an even overlattice `L_H` is unimodular exactly when
  `H=H^⊥`, that is, exactly when `H` is Lagrangian.
- Prove naturality: a lattice isometry transports intermediate and integral/even overlattices,
  carries their corresponding subgroups and orthogonal complements to one another, and commutes
  with `A_{L_H} ≅ H^⊥/H`.  Prove the componentwise statement for orthogonal direct sums.

The mathematical source for the correspondence and the `H^⊥/H` calculation is Nikulin,
§1.4, Proposition 1.4.1, translated from his full-norm `ℚ/2ℤ` convention to the half-norm
`ℚ/ℤ` convention fixed above.  The bilinear integral-overlattice statement is recorded separately
as the elementary intermediate-lattice analogue; it must not be cited as though Proposition 1.4.1
were a statement about odd lattices.

## Layer 5: rank one and ADE discriminant forms

The examples are formal acceptance tests: each calculation must construct the dual, identify the
quotient, and verify the displayed pairing values from representatives.  Merely entering a group
order or table value does not discharge a target.

### Rank one

For `⟨2m⟩`, `m≠0`, take `L=ℤe` and `B(e,e)=2m`.  Prove

`L^∨ = (1/(2m))ℤe`, `A_L ≅ ℤ/(2m)ℤ`,

and, for `g=e/(2m)+L`,

`b_L(g,g)=1/(2m) mod ℤ`, `q_L(g)=1/(4m) mod ℤ`.

Prove `#A_L=|2m|` and check directly that the polar of the displayed `q_L` is the displayed `b_L`.
This example must compile for negative `m` as a negative-definite rank-one lattice too: the
signature is `(1,0,0)` for `m>0` and `(0,0,1)` for `m<0`, so positive-definiteness is exactly `m>0`.
The excluded `m=0` form is the degenerate rank-one lattice, of signature `(0,1,0)`, whose radical
quotient is the zero lattice and which has no discriminant group: Layer 1 covers it and Layers 2 to
4 do not.

### ADE root lattices

Construct, or consume through the Tau Ceti bridge, the positive root lattices with simple-root Gram
matrix the corresponding Cartan matrix.  Verify the following group structures and values.  The
fractions are in `ℚ/ℤ` and use the half-norm convention.

| lattice | discriminant group | checked classes and quadratic values |
| --- | --- | --- |
| `A_n`, `n≥1` | `ℤ/(n+1)` | the class of the first fundamental weight generates and has `q=n/(2(n+1))` |
| `D_n`, odd `n≥5` | `ℤ/4` | either spinor class generates; `q(s)=n/8`; the vector class is `2s` and has `q(v)=1/2` |
| `D_n`, even `n≥4` | `(ℤ/2)²` | vector and the two spinor classes are the three nonzero classes; `q(v)=1/2` and `q(s)=q(c)=n/8` |
| `E₆` | `ℤ/3` | a minuscule-weight class generates and has `q=2/3` |
| `E₇` | `ℤ/2` | the minuscule-weight class generates and has `q=3/4` |
| `E₈` | trivial | the Cartan determinant is `1`, so the root lattice is self-dual and its form is trivial |

Here values such as `n/8` are reduced in `ℚ/ℤ`; for example the two spinor classes of an even
`D_n` can have the same quadratic value while their mutual bilinear value distinguishes the module.
For every row, prove the determinant from the Gram matrix, write representatives in the rational
weight lattice, show they exhaust the quotient, calculate all pairings needed to identify the finite
quadratic module up to isometry, and verify nondegeneracy.  In particular, group order alone is not
enough to distinguish the even-`D_n` quadratic forms.  The `E₆` and `E₇` values are respectively
half of Nikulin's full-norm values `4/3` and `3/2`.

The `A_n` calculation uses the inverse Cartan matrix to check
`B(ω₁,ω₁)=n/(n+1)`, hence `q(ω₁)=n/(2(n+1))`.  For `D_n` use the standard coordinate model
`D_n={x∈ℤ^n | ∑x_i even}` with the Conway--Sloane representatives
`v=e_n`, `s=(1/2)(e₁+⋯+e_n)`, and `c=s-e_n`, so that the rank-24 roadmap downstream can reuse these
without a change of representative.  Their
squared norms are `1`, `n/4`, and `n/4`, giving precisely the half-norm values in the table.
Cross-check exceptional node labels and inverse-Cartan entries against Bourbaki's ADE plates and
Tau Ceti's numbering.

### The `D₈ ⊂ E₈` glue calculation

In `A_{D₈}≅(ℤ/2)²`, let `H` be generated by a spinor class `s`.  The table gives
`q(s)=8/8=0 mod ℤ`, so `H` is quadratic-isotropic.  Prove its preimage is

`D₈^+ = D₈ ∪ (s+D₈)`

in the standard coordinate model.  The subgroup has order two, so the determinant scales from
`4` to `1`; equivalently `H=H^⊥`, and the general theorem makes the preimage even and unimodular.
Construct an explicit basis (or an explicit rational isometry) and verify its Gram matrix is the
positive `E₈` Cartan matrix in Tau Ceti's Bourbaki numbering.  Conclude by an actual lattice isometry
`D₈^+ ≅ E₈`, not by the invalid inference that all lattices of determinant one are isometric.
Finally check that the general comparison gives
`A_{D₈^+} ≅ H^⊥/H = 0` and that this agrees with the direct `E₈` computation.

## Ordering and completion criterion

Layer 1 precedes duality because the dual and all quotient types use the pinned embedded carrier and
form, and because the radical quotient is what lets Layer 2 assume nondegeneracy throughout.
Layer 2 constructs and proves finiteness of the discriminant group.  The abstract part of
Layer 3 can proceed beside Layer 2, but its lattice specialization needs Layer 2.  Layer 4 consumes
both and supplies the gluing theorem.  Rank one is developed alongside Layers 1--3 as a normalization
test; the ADE and `D₈ ⊂ E₈` examples come after Layer 4 and consume the existing root-data bridge.

The roadmap is complete only when the general APIs, all table rows, and the `D₈ ⊂ E₈` isometry have
been formalized.  A proof of the general correspondence without verified examples, or a collection
of ADE determinant computations without discriminant forms and gluing, is not completion.

## References

- V. V. Nikulin, “Integral symmetric bilinear forms and some of their applications,” *Math.
  USSR-Izv.* **14** (1980), [MathNet](https://www.mathnet.ru/eng/im1677),
  [DOI](https://doi.org/10.1070/IM1980v014n01ABEH001060).  Section 1.1 defines discriminant
  bilinear and quadratic forms in the full-norm convention and develops their finite primary data;
  §1.4, Proposition 1.4.1 is the even-overlattice/isotropic-subgroup correspondence and identifies
  the new discriminant form with the induced form on `H^⊥/H`.
- J. H. Conway and N. J. A. Sloane, *Sphere Packings, Lattices and Groups*, 3rd ed., Springer
  (1999), [DOI](https://doi.org/10.1007/978-1-4757-6568-7).  Chapter 4, especially the sections on
  glue vectors, glue groups, dual lattices, and laminated/root lattices, supplies the concrete ADE
  and `D₈^+` calculations; Chapter 15, especially §§2 and 4--8, supplies the integral
  quadratic-form setting and its local/primary viewpoint.
- W. Ebeling, *Lattices and Codes*, 3rd ed., Springer (2013),
  [DOI](https://doi.org/10.1007/978-3-658-00360-9).  Chapter 1 supplies the lattice, Gram matrix,
  determinant, dual, discriminant group, orthogonal-sum, and glue calculations; Chapter 3 supplies
  the standard even unimodular examples, including the `D₈^+=E₈` construction.
- N. Bourbaki, *Lie Groups and Lie Algebras, Chapters 4--6*, Springer (2002), Chapter VI, §4 and
  Plates I--IX.  These fix the ADE simple-root numbering, Cartan matrices, fundamental weights, and
  determinant data used in the acceptance calculations; the formal bridge must agree with Tau
  Ceti's pinned Bourbaki numbering.
