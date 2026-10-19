# Roadmap: reductive algebraic groups

The theory of reductive algebraic groups underpins the Langlands programme, automorphic
forms, and much of FLT. Suggested home: `TauCeti/Algebra/AlgebraicGroup/` (foundations) and
`TauCeti/AlgebraicGeometry/` (the scheme-side dictionary).

The marker `⚠` identifies a common mathematical trap, followed immediately by its correction.

## Standing hypotheses

State hypotheses separately; **do not** bundle them into one mega-class. Work over a field
`k` to start and state each result at its own generality.

Keep **two distinct notions**, and never make smoothness implicit:
- an **affine group scheme of finite type** over `k`: a commutative Hopf `k`-algebra `A`
  finitely generated as a `k`-algebra. This admits `μ_p`, `αₚ`, and other non-smooth /
  non-reduced groups, and is the right default generality.
- a **smooth** such group (an "algebraic group" in the classical sense): add smoothness
  as a named hypothesis. For group schemes locally of finite type over a *field*,
  smoothness ⇔ geometric reducedness of `A` (a fact special to the homogeneous,
  finite-type-over-a-field setting, *not* a general commutative-algebra equivalence; in
  characteristic 0 every such group is automatically smooth, by Cartier).

There will be **no** monolithic `LinearAlgebraicGroup`/`Variety` definition. Like
Mathlib, we state exactly the hypotheses each result needs.

## Three synchronized models

Maintain **three equivalent views** of an affine algebraic group and the explicit
equivalences between them, so any proof can work in whichever is most convenient:

1. **Commutative Hopf algebras** over `k` (the coordinate ring `A`).
2. **Group objects in schemes over `Spec k`**: `GrpObj (G.asOver (Spec k))`, with
   `[G.Over (Spec k)]` and `[IsAffine G]` kept as separate hypotheses.
3. **The functor of points**: a representable group-valued functor `R ↦ Homₖ(A, R)`.

Representations are then **comodules over `A`**, and we keep the
representation ⇆ comodule ⇆ Tannakian dictionary in sync throughout. Wherever there is
a modelling fork (Hopf-ideal kernel vs. scheme-theoretic kernel; root data vs. dynamic
parabolics; reductive-via-unipotent-radical vs. linearly-reductive), **do both and
prove them equivalent** rather than committing.

## Mathlib foundations to use

- **Hopf/coalgebra algebra:** `Mathlib/RingTheory/HopfAlgebra/{Basic,GroupLike,TensorProduct}.lean`,
  `Mathlib/RingTheory/Coalgebra/{Convolution,GroupLike}.lean`.
- **Categorical group objects:** `Mathlib/CategoryTheory/Monoidal/{Mon_,Comon_,Bimon_,Grp_,CommGrp_}.lean`
  and the cartesian/`Over` variants, so view 2 is expressible (and the equivalence
  signature examples below elaborate).
- **Algebra categories:** `Mathlib/Algebra/Category/CoalgCat/ComonEquivalence.lean`
  (coalgebras ≃ comonoids), `Mathlib/Algebra/Category/CommAlgCat/{Basic,FiniteType,Monoidal}.lean`.
- **Scheme-side group theory:** `Mathlib/AlgebraicGeometry/Group/Abelian.lean` (the
  rigidity theorem: proper group schemes are commutative) and `…/Group/Smooth.lean`.
- **Affine group schemes and Hopf algebras:** `Mathlib/AlgebraicGeometry/Group/Affine.lean`
  provides `hopfSpec.fullyFaithful` and `essImage_hopfSpec` for affine group schemes over
  `Spec R`; use this dictionary for the corresponding Layer 0 targets.
- **Smoothness ingredient:** `Mathlib/RingTheory/Nilpotent/GeometricallyReduced.lean`.
- **Combinatorial prerequisites** (not ready-made algebraic-group infrastructure; they
  supply abstract root systems/Weyl groups; extracting a *root datum from a group* still
  needs substantial glue): `Mathlib/LinearAlgebra/RootSystem/*` (root pairings, bases,
  Cartan matrices) and `Mathlib/GroupTheory/Coxeter/*`.
- **Representation theory to mine for patterns** (finite-group / module flavour; it does
  *not* generalize directly without building comodules and rational representations first):
  `Mathlib/RepresentationTheory/{FDRep,Character,Tannaka,Maschke,Semisimple,Irreducible}.lean`.

## Remaining roadmap targets

Build on Tau Ceti's comodule, finite-subcoalgebra, coefficient-generation, finite-type Hopf,
point-functor, base-change, Borel/reductive, cocharacter-parabolic, and Frobenius APIs at
the hypotheses implemented in those modules. Complete the algebraic-group representation
dictionary, group-scheme embedding and Tannakian results in Layers 0–1. Other targets are
fppf sheaves and faithfully-flat descent on `CommAlgCat k`; `Lie(G)` and
the adjoint action; Hopf ideals, closed subgroup schemes and quotients; identity components
and component groups; Jordan decomposition; diagonalizable and multiplicative-type groups,
tori and character lattices; unipotent groups and the unipotent radical; reductive and
semisimple structure, central isogenies and simply-connected/adjoint forms; Borel and
parabolic subgroup schemes; root data extracted from groups; Bruhat/BN-pairs; classification;
and pinned Chevalley–Demazure group schemes over `ℤ`, including root subgroups, base change,
and special isogenies.

---

## Implemented foundations to consume

- Mathlib `AlgebraicGeometry.Group.Affine` provides `hopfSpec.fullyFaithful` and
  `essImage_hopfSpec`; use this affine group scheme/Hopf-algebra dictionary. Its scope is
  affine group schemes over `Spec R`. Mathlib `AlgebraicGeometry.Group.Smooth` provides
  `AlgebraicGeometry.smooth_of_grpObj` under its field, locally finite type, group-object,
  and geometric-reducedness hypotheses.
- Tau Ceti's `FiniteTypeCommHopfAlgCat`, `CommHopfAlgCat.pointsFunctor`,
  `FiniteTypeCommHopfAlgCat.pointsFunctor`, and base-change modules provide the finite-type
  Hopf categories and group-valued points. Its `WithConv` point construction and functorial
  maps are the starting point for R-points; extend these interfaces for any missing
  comparison with scheme points and descent.
- Tau Ceti's `Comodule.Basic`, `Comodule.Cat`, finite/rigid comodule categories, matrix
  coefficient subcoalgebras, and `Subcoalgebra.Finite` supply comodule structures, finite
  subcoalgebras over fields, and coefficient constructions. In particular,
  `exists_finiteDimensional_subcoalgebra_mem` proves elementwise finite-subcoalgebra
  containment, and `exists_finite_subcomodule_matrixCoefficientSubalgebra_eq_top` gives a
  finite subcomodule whose coefficients generate a finite-type algebra-coalgebra over a
  field. The remaining targets are the algebraic-group representation dictionary, the
  group-scheme representation map and closed immersion with their full hypotheses.
  [`TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean) already reconstructs the points
  functor of a commutative Hopf algebra over a field from tensor automorphisms, with
  its explicit universe lift. Layer1 transports this natural isomorphism through the
  representation/comodule and scheme/group-functor dictionaries.
- Tau Ceti `Borel.Basic` and `Reductive.Basic` provide predicates on finite-type
  commutative Hopf algebras. The dynamic modules provide cocharacter-defined parabolic,
  Levi, unipotent point subgroups and a pointwise Levi decomposition. Their documentation
  does not establish representability of arbitrary dynamic subfunctors or the algebraic
  intersection/transporter results below. `Frobenius.Points` and `Frobenius.FixedPoints`
  provide pointwise Frobenius maps and fixed-point comparisons; they do not prove finiteness
  for every endomorphism or Lang–Steinberg.
- Mathlib's root-system and Coxeter modules provide abstract combinatorial structures.
  Tau Ceti has concrete torus, GL, SL, and symplectic root-data carriers. These are
  reusable instances, not general root extraction or classification.

## The build, in layers

The layers are ordered by mathematical prerequisites. Nonexhaustive target signatures are
in `Suggested.lean`, `IntegralRationalTargets.lean` and `SignedADETargets.lean`, using native carriers and honest
`sorry` construction targets; the README remains definitive.

**Cross-cutting prerequisite: sheaves and descent.** The functor-of-points comparison,
quotients, torsors and representability use the fppf topology and faithfully-flat descent:
presheaves on `CommAlgCat k`, Yoneda/representability, fppf sheafification, torsors, and
faithfully-flat descent.

### Layer 0: the functor of points and the three-way dictionary

- **R-points as a group.** Keep `R` a commutative `k`-algebra and let the values `G(R)` be
  allowed to be noncommutative. Consume Tau Ceti's `WithConv`,
  `CommHopfAlgCat.pointsFunctor`, and `FiniteTypeCommHopfAlgCat.pointsFunctor`; prove
  convolution, identity, inverse, and naturality lemmas at their exact hypotheses where
  the named interfaces need them; do not introduce a parallel `AlgPoints` structure. The convolution is
  `(f * g)(a) = ∑ f(a₁) g(a₂)`, with counit identity and antipode inverse, not composition.
  `GroupLike k A` is not the points functor: group-like elements form a commutative group,
  whereas `GLₙ(R)` can be noncommutative.
- **The three model interfaces.** For affine group schemes over `Spec R`, package Mathlib's
  `hopfSpec.fullyFaithful` and `essImage_hopfSpec` as the anti-equivalence between
  commutative Hopf `R`-algebras and affine group objects over `Spec R`. Keep finite-type and
  smoothness as transported predicates, not objects built into either category. Prove the
  counit and unit identifications explicitly: `Γ(Spec A) ≃ A` as Hopf algebras and
  `Spec Γ(G) ≃ G` as group objects for affine `G`, compatible with Mathlib's instances and
  structural maps. Prove the third equivalence with representable group-valued functors
  using Yoneda and Tau Ceti's `CommHopfAlgCat.pointsFunctor`; identify the points of `Spec A`
  with algebra homomorphisms by existing `Spec.mapMulEquiv`, and prove compatibility of the
  group laws and naturality in the test algebra. Pin the scheme, Hopf carrier, and test-algebra
  universes to a common `u` (`w=v=u` in `pointsFunctor` / `GrpCat.{max v w}` and
  `R S T : Type u` for `Spec.mapMulEquiv`); no heterogeneous-universe convention is intended.
  Complete the finite-type and points comparisons not supplied by these declarations. The native typed examples in
  `Suggested.lean` are:

  ```lean
  noncomputable abbrev globalSectionsHopfAlgebra (G : Scheme.{u})
      [G.Over (Spec (CommRingCat.of R))]
      [GrpObj (G.asOver (Spec (CommRingCat.of R)))] [IsAffine G] :
      HopfAlgebra R Γ(G, ⊤) :=
    AlgebraicGeometry.instHopfAlgebraCarrierObjOppositeOpensCarrierCarrierCommRingCatPresheafOpOpensTopOfGrpObjOverSchemeSpecAsOverOfIsAffine
      (R := CommRingCat.of R)

  noncomputable abbrev specGroupObject (A : Type u) [CommRing A] [HopfAlgebra R A] :
      GrpObj ((Spec (CommRingCat.of A)).asOver (Spec (CommRingCat.of R))) := inferInstance
  ```

  The Spec group-object instance and the native global-sections Hopf instance (named
  explicitly above) discharge these signature examples; the examples do not discharge the
  anti-equivalence, Γ-inverse identifications, or third model. `Scheme.Over` carries the structural morphism, so use
  the native carriers rather than rebuilding it with `Over.mk`.
- **Base change and descent.** Consume Tau Ceti's finite-type Hopf-category and base-change
  functors, including compatibility of points under base change. Keep geometric notions
  after extension to `k̄`. Develop the fppf sheaf, faithfully-flat descent, torsor, and
  representability machinery in the cross-cutting lane where quotient or reconstruction
  results require it.

### Layer 1: representations = comodules

- **Comodules and their finite-dimensional category.** Consume Tau Ceti's
  comodule structures, category, finite/rigid categories, tensor products, duals, and
  matrix-coefficient APIs. Complete the rational-representation/comodule comparison and
  regular representation at the exact field and finite-type hypotheses; do not define
  parallel comodule structures.
- **Finite-dimensional subcoalgebras.** Consume Tau Ceti's proved fundamental-theorem
  interfaces: `exists_finiteDimensional_subcoalgebra_mem` and
  `iUnion_finiteDimensional_subcoalgebras_eq_univ` for subcoalgebras, and
  `exists_finite_subcomodule_mem` and `iUnion_finiteSubcomodules_eq_univ` for comodules.
  Use the elementwise and directed-union declarations at their exact field/module hypotheses;
  over a field the required module freeness is automatic. Reuse the finite
  coefficient-subcoalgebra API. Any stronger coefficient-ring or category-level versions
  remain explicit new targets.
- **The dictionary and faithful representations.** Relate rational representations to
  comodules and matrix coefficients. For an affine group scheme `G` of finite type over a
  field `k` and a finite-dimensional representation `ρ : G → GL(V)`, faithfulness means
  that `ρ` is a closed immersion. Prove that this is equivalent to surjectivity of
  `ρ* : k[GL(V)] → k[G]`, hence to generation of `k[G]` by the matrix coefficients of `V`
  together with `det(V)⁻¹`; equivalently, the coefficients of `V ⊕ Vˇ` generate `k[G]`.
  State the exact base-ring, finite-type, and representation hypotheses for this coordinate
  criterion. The matrix coefficients of `V` alone need not generate the coordinate algebra:
  the standard character `𝔾_m → GL₁` is a closed immersion but its coefficient `t`
  generates `k[t]`, not `k[t,t⁻¹]`. Equivalently, the Hopf subalgebra generated by the
  coefficients of `V ⊕ Vˇ` is all of `k[G]`. Faithfulness is not injectivity only on
  field-valued points. Tau Ceti proves the finite-type
  algebra-coalgebra step producing a finite subcomodule whose coefficients generate the
  algebra, but the group-scheme representation map and closed-immersion theorem require
  their own statements and proofs at full hypotheses.
- **Embedding theorem.** Prove that every affine group scheme of finite
  type has a faithful finite-dimensional representation / closed immersion into `GLₙ`.
  Use the finite-subcoalgebra and coefficient-generation results above as inputs, and prove
  the remaining Hopf/group-scheme and basis-change steps; bare Noetherianity is not a
  substitute.
- **Tannakian reconstruction dictionaries.** Consume native
  `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor k H` for `[Field k]`,
  `[CommRing H]`, `[HopfAlgebra k H]` in the common universe. Preserve the actual
  `pointsFunctor ⋙ GrpCat.uliftFunctor ≅ tensorAutFunctor`, its coefficient-algebra
  naturality and component/reconstructed-point equations. Transport it through the
  rational-representation/comodule equivalence and Layer0's scheme/group-functor
  equivalences; construct those remaining adapters and their compatibility with the
  faithful-representation/closed-immersion maps. No second native reconstruction
  theorem or unlifted equality of these functors is intended.

The generic cofree-resolution/rational-cohomology and cotensor-induction constructions
are supplied by IntegralHeckeAndGaloisDeterminants0.7 on these native early comodule
foundations. Layers6A/10B consume the exact field specialization and convention maps.
The generic supplier does not consume the relative theory, integral group construction,
representation classification or spectral topology of this roadmap.

### Layer 2: Lie algebra and the adjoint representation
- **Tangent space at the identity / `Lie(G)`**, the differential of a homomorphism, the
  Lie algebra of a closed subgroup, and the **adjoint action** `Ad : G → GL(Lie G)`.
- **Smoothness and dimension tools** via `Lie(G)` (dimension of kernels, the smoothness
  criterion). These are needed before Jordan decomposition, root spaces, and the unipotent
  radical, which is why this sits early.

### Layer 3: subgroups, quotients, components
- **Hopf ideals ↔ closed subgroup schemes:** an ideal `I` with `Δ(I) ⊆ I⊗A + A⊗I`,
  `ε(I)=0`, `S(I) ⊆ I`; the quotient Hopf algebra `A/I`; the anti-equivalence; kernels.
- **Normality and quotients:** normal = Hopf ideal stable under the adjoint coaction
  (needs the conjugation/adjoint morphism at Hopf level). The quotient `G/H` is first the
  **fppf sheaf quotient**; whether it is represented by a scheme (and when by an *affine*
  one, e.g. `H` reductive, by Matsushima) is a **theorem with hypotheses**, not automatic.
  Then short exact sequences.
- **Identity component `G°` and component group `π₀(G)`:** geometric connectedness
  (`A ⊗ k̄` has no nontrivial idempotents, *stronger* than over `k`). Under smoothness
  (and over a perfect field, or suitable hypotheses) `π₀(G)` is finite étale.
  ⚠ Reserve the term **connected–étale sequence** for *finite* group schemes; here use
  "identity component and component group", and "connected" always means the geometric
  notion.

### Layer 3A: algebraic actions, orbit boundaries and projective closed orbits

Build this phase on Layers0–1 and the early scheme/group-object vocabulary of
Layer3. It precedes Borel subgroups, reductive classification and Borel–Weil.
For its geometric statements take an algebraically closed field k, a smooth
affine finite-type k-group G, and a separated finite-type k-scheme X with an
actual algebraic G-action. G need not be connected, and X need not be
irreducible or reduced. Empty X has no orbit-existence assertion. Over a
nonclosed field apply the geometric statements after the specified algebraic
closure; do not turn a geometric orbit or closed point into a k-rational one
without a descent argument. Retain the standing distinction between smooth
groups and arbitrary finite-type group schemes. In characteristic zero use
the separately proved Cartier smoothness comparison when starting from the
latter. No reductivity hypothesis belongs in the orbit-existence theorem.

**3A.1 Actual action and orbit maps.** Use native `GrpObj` and `ModObj` in
the cartesian monoidal category of schemes over Spec k. Its action is a
scheme morphism G×X→X with native unit/associativity laws; the native
`CategoryTheory.Hom.group` and `Hom.mulAction` give the action on test-scheme
points. Export product, inverse-translation, stabilizer equalizer, base-change
and equivariant-map laws. For x∈X(k) construct μ_x:G→X, g↦gx, translations
t_g and their inverses, and μ_(hx)=μ_x∘R_h. Define the geometric orbit O_x
as the image of the underlying scheme map μ_x, with closure Z_x and boundary
Z_x\O_x. Compare its closed points with the actual orbit of x under G(k).
This comparison uses the finite-type closed-point/residue-field theorem; the
image of all scheme points is not literally a set consisting only of
k-valued points. Define the stabilizer as the scheme fibre over x, with its
actual subgroup structure and fibre translation isomorphisms. A set-theoretic
stabilizer does not supply the scheme-theoretic kernel or a smoothness proof.

**3A.2 Constructible image and local closedness.** Derive that μ_x is
quasi-compact and locally of finite presentation from finite type over k,
the Noetherian target and separatedness/quasi-separatedness; do not add
these conclusions as unexplained action data. Consume native
`Scheme.Hom.isLocallyConstructible_image` / `isConstructible_image`
(Chevalley) at their exact hypotheses. Supply the finite-type-over-k
Jacobson adapter: closed points have residue field k; a nonempty
constructible set contains a closed point; and constructible subsets are
determined by their closed points. Consume native `residueFieldIsoBase`,
`pointOfClosedPoint`, `pointEquivClosedPoint` and
`LocallyOfFiniteType.jacobsonSpace` at their actual hypotheses. The
remaining image/fibre and constructible-set comparisons are bounded
adapters here, not new point or residue-field carriers. For a closed point in the image, a
nonempty finite-type fibre has a k-point. Prove that a dense constructible
set in a Noetherian space contains an open subset dense in every
irreducible component of its closure. Apply this to O_x⊂Z_x, choose a
closed point of that open subset, and translate it by G(k). The translates
are open in Z_x and cover exactly the orbit on closed points; Jacobson
constructible detection identifies their union with O_x as a subset of the
whole scheme space. Thus O_x is open in Z_x and locally closed in X.
Construct its reduced locally closed subscheme and immersion into X,
including the action restriction, independence of the open/closed
factorization, equivariant isomorphisms and algebraically closed field
extension comparisons. These are direct image/subscheme constructions;
no representability theorem for G/H is a premise.

**3A.3 Finite dimensions, including disconnected groups.** Consume
SchemeAndStackFoundations0.7 and native topological Krull dimension rather
than introducing a second dimension function. Prove the bounded helpers
needed here: finite-type schemes over k have finite dimension; a proper
closed subset of an irreducible finite-dimensional finite-type k-scheme
has strictly smaller dimension; a nonempty open in such an irreducible
component has the same dimension; and dimension of a finite union of
closed components is their maximum. Treat the empty set with dimension
−∞, not dimension0. For Z_x, the finitely many irreducible components
are permuted transitively by G(k). Prove this using closed orbit points
away from component intersections and transitivity on O_x(k). A point of
O_x cannot lie in two components: translate an orbit point belonging to
only one component to that point. It follows that all components have
the same dimension d=dim O_x and the boundary misses a dense open in
each. Hence dim(Z_x\O_x)<dim O_x, and every boundary orbit O_y has
strictly smaller dimension. Prove closure stability and orbit containment
before applying the bound. Do not assume Z_x irreducible or assert that
every closed orbit has the globally smallest dimension.

**3A.4 Existence of closed orbits.** In a nonempty X, minimize the natural
number dim O_x over its k-points. If the boundary is nonempty, its
finite-type closed locus has a k-point y, contradicting the strict bound.
Thus an orbit of minimal dimension is closed. Apply the same argument
inside every Z_x to prove that each orbit closure contains a closed orbit.
Export the actual chosen point, containment, closed immersion of its
reduced orbit model, and change-of-choice statements; uniqueness is not
claimed. This is a generic algebraic action theorem, not a highest-line
or adjoint-only substitute. The argument also gives closed orbits in
nonproper X, but supplies compactness only with properness.

**3A.5 Properness and the complex comparison.** If X is proper over k,
the closed orbit model is proper; in particular apply the existing
SchemeAndStackFoundations0.3 relative-Proj/projective-space carrier and
the projective-morphism properness theorem to projective X. Consume native
`IsProper (Proj.toSpecZero 𝒜)` at its `Algebra.FiniteType (𝒜 0) A`
hypothesis and transport through the actual projective-space/closed-immersion
maps. Over ℂ,
consume ComplexComparisonPartII C−1.1's actual `.complexPoints`,
`.closedSubspace`, `.proper`, `.separatedHausdorff` and `.smooth`
interfaces, not a proper-GAGA theorem or an invented analytification
functor. Prove the point-map, subspace-topology and properness comparison
at these finite-type hypotheses. A proper scheme over ℂ has compact
Hausdorff complex points; the closed orbit therefore has compact complex
points. To obtain its complex manifold, prove that the reduced orbit
model is smooth: over the perfect field ℂ its nonempty smooth locus
meets each component, and translations spread it to the whole orbit.
Consume native `Scheme.Hom.dense_smoothLocus_of_perfectField` and its
open smooth locus, restricting to the reduced component loci as needed.
Construct the corresponding charts and compare with the existing
finite-dimensional LieGroups closed-stabilizer/local-constant-rank
quotient construction. Pin H=Stab_G(x), the actual map G(ℂ)→O_x(ℂ)
and its fibres. Consume SmoothBundlesConnections B1.1/1.4 and its
independent LieGroupoidsPoisson G0.1 regular-fibre-product prerequisite,
as specified by LieGroups Layer6's early homogeneous-space floor; no
torus, conjugacy or Weyl theorem is needed. Prove the complex orbit map
is a holomorphic submersion using characteristic-zero separability:
prove the generic maximal-rank statement from the actual function-field
extension and Jacobian criterion, then spread the smooth/rank locus by
the source/target translation equations. This bounded orbit-map
separability/rank adapter is part of this phase, not assumed action data.
Then construct holomorphic local sections by the analytic inverse theorem.
Prove the induced biholomorphic homogeneous-space
identification G(ℂ)/H(ℂ)≃O_x(ℂ). This is downstream of the direct
orbit construction and the characteristic-zero stabilizer-smoothness
theorem. It does not assume an algebraic quotient G/H was already
represented. The compact manifold can be disconnected. A closed orbit
in affine X need not be compact, and an arbitrary projective orbit
need not be closed or compact.

**3A.6 Projective representation and restriction maps.** For a nonzero
finite-dimensional rational G-module V retain the original G and its
homomorphism ρ:G→GL(V). Construct the dual action
(g·ℓ)(v)=ℓ(ρ(g⁻¹)v) on V*, its regular action on P(V*) and the O(1)
linearization. Consume the generic relative-Proj/tautological line and
projective-space H⁰ calculation from SchemeAndStackFoundations0.3/2.6
and AlgebraicVectorBundles. Prove the actual natural identification
H⁰(P(V*),O(1))≃V (using finite-dimensional double duality) and its
equivariance. Choose a closed orbit X in P(V*) by 3A.4; construct the
G-equivariant restriction r:V→H⁰(X,O(1)|X), including multiplication,
pullback and section evaluation in trivializations. At x=[ℓ] choose
v with ℓ(v)≠0, proving r≠0. Its kernel is a rational G-submodule;
for irreducible V it is zero. When using point-group representations,
first prove the rational-submodule versus G(k)-stable-subspace adapter
by the density of k-points of the smooth group. Do not replace G by
GL(V), assume H⁰(X,O(1)) irreducible, or assume restriction surjective.
H⁰ finiteness uses the existing proper/coherent theorem, separately
from this kernel argument. Any comparison with holomorphic sections
uses the specified proper coherent comparison later; no Borel–Weil or
cohomological vanishing premise enters the injection. For connected
reductive G, identifying H with a parabolic and the line with a
dominant-weight associated bundle is the later Layer7/SchubertGeometry
application, not an input to generic orbit existence.
For the compact U(n) source specialization, first consume the actual
compact-to-rational GL_n(ℂ) representation dictionary from the existing
classical/compact representation suppliers. Do not apply an algebraic
action theorem directly to a bare continuous compact-group action.

**3A.7 Regularity, tests and conventions.** Compare a rational/comodule
representation with its actual scheme morphism, all action equations,
and regular matrix coefficients. On GL_n these lie in
k[x_ij,det⁻¹]; arbitrary rational functions with poles on GL_n are
not allowed. Prove that entrywise complex conjugation is not a complex
algebraic representation, by restriction to the nonholomorphic map
z↦bar z on a diagonal ℂ* (n>0); GL_0 is the separate trivial case.
Require the following complete tests with explicit action/orbit maps:
ℂ* acting by t·[u:v]=[tu:v] on P¹ has two closed fixed-point orbits
and the nonclosed open orbit ℂ*, whose boundary is those two points;
the finite constant group C₂ swapping coordinates has the disconnected
closed orbit {0,∞}; trivial actions give point orbits; zero V gives
empty P(V*) and no chosen orbit; dimension-one V gives P⁰.
In characteristic p, t·[u:v]=[t^p u:v] has the same geometric open
orbit but scheme stabilizer μ_p and zero orbit differential. Keep the
local-closedness/boundary theorem, but do not infer smooth orbit maps,
tangent-image equality, or a separable homogeneous quotient from it
without the actual stabilizer/separability hypotheses.

The generic algebraic construction belongs here. SchemeAndStackFoundations
retains generic constructibility/dimension/projective/coherent geometry,
ComplexComparisonPartII retains generic analytification and properness,
and LieGroups retains finite-dimensional analytic quotient/manifold theory.
NilpotentOrbits' adjoint orbit and SchubertGeometry's highest-line/flag
comparison consume or compare with this earlier phase without becoming
its prerequisites. Nonexhaustive native target forms are in
`OrbitGeometryTargets.lean`, which imports `Suggested.lean`; no reverse
import is needed.


### Layer 4: Jordan decomposition, diagonalizable groups, tori
- **Jordan decomposition** of elements into semisimple and unipotent parts (geometric,
  over `k̄`), functorial under representations.
- **Diagonalizable groups and groups of multiplicative type:** the anti-equivalence
  `M ↦ D(M) = Spec k[M]` between finitely generated abelian groups and diagonalizable
  groups; `μ_n = D(ℤ/n)`, `𝔾_m = D(ℤ)`; the non-smooth example `μ_p` in characteristic `p`.
  (*Cartier duality* proper is the duality of **finite locally free** commutative group
  schemes, a related but distinct statement to develop separately.)
- **Tori:** split and non-split; the **character lattice** `X*(T)` and **cocharacter
  lattice** `X_*(T)` with their perfect pairing: the input to root data.

### Layer 5: solvable and unipotent groups; the unipotent radical
- **Unipotent groups** (correct, geometric definition): `g ∈ G(k̄)` is unipotent iff
  `ρ_g − id` is nilpotent for **every** f.d. representation; a smooth connected group is
  unipotent iff it embeds in the upper-triangular unipotent `Uₙ`.
  - ⚠ "No nontrivial characters" is **not** equivalent to unipotent (e.g. `SLₙ` has no
    nontrivial characters but is semisimple). The implication is one-way: a *connected
    unipotent* group has no nontrivial characters; the converse needs solvability.
  - ⚠ A naïve `IsUnipotent` that tests nilpotence in the reduced ring `A` is *vacuous*
    (only `g = 1` qualifies): the correct definition needs comodule theory (Layer 1).
- **Lie–Kolchin**; solvable groups.
- **The unipotent radical `R_u(G)`** (the hard core, SGA3/Borel level): the maximal
  connected normal unipotent closed subgroup. ⚠ Over **imperfect** fields the geometric
  unipotent radical `R_u(G_{k̄})` need *not* descend to `k`; this is exactly where
  pseudo-reductive groups appear. **Assume `k` perfect first** (so descent is fine), or
  define reductivity by the geometric condition without constructing a descended subgroup;
  distinguish the `k`-unipotent radical from the geometric one in general.

### Layer 6: reductive and semisimple groups
- **Reductive:** smooth, connected, with `R_u(G_{k̄})` trivial. **Semisimple:** radical
  `R(G)` (maximal connected normal solvable, geometric) trivial. Develop the radical,
  the centre `Z(G)`, the derived group `G_der`, **central isogenies**, and the simply
  connected and adjoint forms: these are not optional for the classification.
- **Alternative characterization, linearly reductive:** every f.d. representation is completely
  reducible. ⚠ Reductive groups are **not** linearly reductive in characteristic `p`
  (rational representations are generally not semisimple). State the equivalence precisely:
  for smooth connected affine groups in **characteristic 0**, reductive ⇔ linearly
  reductive (Maschke-flavoured; mine `Semisimple`/`Maschke`); over an algebraically closed
  field of characteristic `p`, a **smooth connected affine** group is linearly reductive iff it is a torus.
  Provide both definitions and the char-0 equivalence so downstream work can pick either.

#### Layer 6A: characteristic-zero Levi complements for general affine groups

Let k be a field of characteristic zero and G a smooth connected affine k-group
of finite type. Here G need not be reductive or be a parabolic in another
reductive group. Consume Layer5's geometric unipotent radical U=R_u(G),
its k-descent and smooth connectedness, and Layer3's represented quotient
q:G→Q=G/U; prove Q reductive with this actual quotient map. A Levi complement
is a closed k-subgroup L⊂G for which q|L:L→Q is a group-scheme isomorphism.
Construct such L, prove it connected and reductive, and construct the actual
semidirect-product group scheme U⋊L, with L acting on U by conjugation.
On every commutative k-algebra A its multiplication is
`(u,l)(u',l')=(u(lu'l⁻¹),ll')`; the isomorphism U⋊L→G sends `(u,l)` to ul.
Its inverse sends g to `(g s(q(g))⁻¹,s(q(g)))`, where
`s:Q→G` is the splitting with image L. Construct these as scheme morphisms
and prove both inverse identities, not just a bijection on k-points.

Build the following algebraic splitting machinery before proving this theorem.
It uses Layers0–1's same affine/Hopf and native right-comodule carriers,
Layer3's quotients and Layer5's unipotent structure, followed by Layer6's
characteristic-zero equivalence between reductivity and linear reductivity.
It uses neither the parabolic Levi theorem of Layer7 nor an integration of an
arbitrary Lie subalgebra.

1. **Equivariant vector layers and regular sections.** For a connected
   unipotent k-group U normal in G, construct a finite descending filtration
   `U=U₀⊃U₁⊃⋯⊃U_m=1` by smooth connected k-subgroups characteristic in U,
   normal in G, with `[U,U_i]⊂U_(i+1)` and vector-group quotients
   `V_i=U_i/U_(i+1)`. The strictly descending nontrivial layers can be obtained
   from the lower central series. Prove in characteristic zero that each
   commutative unipotent layer is canonically linearizable through its Lie
   algebra, using polynomial unipotent exponential/logarithm on a faithful
   matrix realization and proving subgroup preservation and independence of
   the realization. Conjugation consequently gives an actual rational linear
   Q-action on V_i. Retain Q's central torus in this action. These are
   constructions of the filtration and linearization, not additional hypotheses
   restricting G. From Layer0's faithfully-flat torsor/descent machinery prove
   vector-group torsors over affine k-schemes trivial: construct the additive
   descent cocycle and solve it by the exact affine module/Amitsur sequence.
   Induct through split-unipotent layers to obtain regular sections for the
   quotients used here. Prove in particular U(k)→(U/U₁)(k) surjective.
   A regular section of varieties is not asserted a group homomorphism.
2. **Rational algebraic cohomology and averaging.** For an affine k-group H
   and rational H-module V consume [IntegralHeckeAndGaloisDeterminants0.7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1e875b1e9277da9091c8c1338594ede28d52f342/TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md#07-connected-reductive-invariant-evaluations)'s
   generic rational-cohomology construction for a flat commutative coordinate Hopf
   algebra and an arbitrary right comodule, specialized to the field k. The canonical
   generic cofree-resolution, enough-injectives and derived-invariants API is owned
   by that early supplier, consuming the native comodule/cofree foundations used in
   Layer1; no later relative, spectral or arithmetic layer is an input. Preserve its
   arbitrary-module generality. Transport its coefficient-first complex by the supplied
   tensor permutation to `Cⁿ_alg(H,V)=k[H]^(⊗n)⊗V`, with C⁰=V and tensor unit in degree0.
   Here V^H is defined by `coact(v)=v⊗1`, not only by invariance under H(k). For
   finite-dimensional V construct the identification with regular maps Hⁿ→V; no
   complex of arbitrary functions on H(k) is substituted. With the left point action
   and left-factor-first Hopf convention, the inhomogeneous differential is
   `dc(g₁,…,g_(n+1))=g₁·c(g₂,…,g_(n+1))`
   `+Σ_(j=1)^n(−1)^j c(g₁,…,g_j g_(j+1),…,g_(n+1))`
   `+(−1)^(n+1)c(g₁,…,g_n)`.
   Transport the supplier's d²=0, H⁰=V^H, coefficient functoriality, connecting maps
   and derived-invariants comparisons through these exact coface/convention maps.
   Construct the normalized-subcomplex comparison and extension-of-field compatibility
   needed here. Consume the native abelian `TauCeti.ComoduleCat` for flat coordinate
   coalgebras and `Comodule.cofree`, `Comodule.Hom.cofreeUnit`,
   `Comodule.Hom.cofreeEquiv` and `ComoduleCat.cofree`; the shared supplier constructs
   their categorical injectivity/cofree-resolution comparisons without requiring V
   flat, finite-dimensional or injective. This layer constructs the regular-function,
   normalization and field transports and the reductive averaging application below. For reductive Q in characteristic zero, transport Layer6's
   finite-dimensional complete reducibility to the native
   `Coalgebra.IsLinearlyReductive` hypothesis and consume
   `Comodule.Hom.exists_fixed_preimage_of_isLinearlyReductive`,
   `fixedMap_surjective_of_isLinearlyReductive` and
   `exact_fixedMap_of_isLinearlyReductive` from
   `TauCeti.Algebra.Coalgebra.Comodule.LinearlyReductive.Fixed`.
   These already lift invariant vectors in arbitrary rational modules by
   Layer1's finite-subcomodule reduction and an equivariant splitting of its
   finite-dimensional image; retain this comparison with the scheme-level
   invariants. Construct the resulting Reynolds splittings/acyclicity
   comparison, and prove `Hⁿ_alg(Q,V)=0` for n>0. This algebraic averaging
   uses rational representations over k, not a Haar probability measure on Q(k).
3. **Vector extensions and explicit sign conventions.** For a smooth affine
   extension `1→V→E→H→1` by a vector group with the specified rational
   H-action, construct a regular normalized section s using item1. Define
   `s(g)s(h)=i(c(g,h))s(gh)`; associativity is exactly the algebraic
   2-cocycle equation. Identify E, as a variety and as an extension, with
   V×H having product
   `(v,g)(w,h)=(v+g·w+c(g,h),gh)`.
   If `s_b(g)=i(b(g))s(g)`, prove `c_b=c+db`, where
   `db(g,h)=g·b(h)−b(gh)+b(g)`. Thus a solution c=da gives the
   homomorphic section s_(−a). Prove independence of the cohomology class,
   classification of these extensions with identified kernel/quotient/action
   by H²_alg, and the split criterion. In the split extension, sections are
   precisely regular 1-cocycles a:H→V. If `a(g)=g·v−v`, then
   `s_a(g)=i(−v)s₀(g)i(v)`; prove this identity with the displayed product.
   Vanishing H¹_alg gives conjugacy by V(k). Include V=0 and the trivial
   action, and prove that the kernel coordinate action term cannot be omitted.
4. **Induction and all complements.** Apply H² vanishing to
   `G/U₁`, an extension of Q by V₀. Pull back its resulting complement to
   G and induct on the remaining unipotent filtration. Prove that this
   pullback is smooth connected affine of finite type, with unipotent radical
   U₁ and reductive quotient Q, before
   applying the induction. This constructs L and the scheme isomorphism
   above without assuming a Levi complement in the induction inputs.
   For two Levi complements first use H¹ vanishing in G/U₁, lift its
   conjugating V₀(k)-point to U(k) by item1, and then induct in the
   preimage of the common complement. Prove that U(k) acts transitively
   on the set of k-Levi complements and that the stabilizer of L is
   C_U(L)(k): an element of U normalizing L acts trivially on its quotient
   Q and hence centralizes L. Construct the orbit bijection with
   `U(k)/C_U(L)(k)` as a set of group cosets, and distinguish this from
   any asserted representability of a complement-parameter functor.
   Conjugators need not be unique.

Export the quotient, chosen section/complement, multiplication isomorphism,
its point-functor/Hopf comparisons and their identity/composition diagrams.
Prove extension of scalars carries any chosen complement, its action and its
scheme isomorphism to the corresponding data over every field extension;
this does not assert that every complement after base change descends.
Different choices are related by the conjugacy theorem, not a canonical
functorial choice of L. Differentiate the actual scheme isomorphism to obtain
`Lie(G)≃Lie(U)⋊Lie(L)` and compare with Layer2; a general Lie-algebra splitting
is not used to assert an algebraic complement. Keep the full reductive
central torus, arbitrary unipotent dimension, U=1 and Q=1 cases.

Give explicit tests on a torus acting on a vector group, upper-triangular
invertible matrices, a connected reductive group (U=1), a connected unipotent
group (L=1), and L×G_a. In the last example all of U centralizes the same
complement, disproving uniqueness of the conjugating element. Under k=ℂ
compare this exact algebraic decomposition with the underlying holomorphic
group and use LieGroups Layer7 only for the already reductive factor's
compact real form. There is no asserted Levi splitting for all groups in
positive characteristic; Layer7's separate all-field parabolic theorem
retains its hypotheses and is not replaced by this characteristic-zero lane.
The regular extension/cohomology route is discussed in
[McNinch §§2.2–2.3,3.1,4.1,4.3–4.5,5.1–5.2](https://arxiv.org/html/1007.2777v1).

#### Layer 6B: complex reductive coset affineness

- **Complex reductive coset affineness.** For a smooth connected affine reductive
  complex algebraic group A and a closed connected reductive subgroup H, construct
  the fpqc quotient A/H and prove it is the affine scheme Spec(O(A)^H).
  Build the Reynolds map using Layer6's characteristic-zero complete reducibility,
  finite generation of the invariant algebra, and the closed-orbit quotient and
  torsor identification; expose the quotient map, universal property and base
  changes at the exact stated hypotheses. In particular apply this to GL_n/G
  for every faithful closed reductive G→GL_n. This is the Matsushima construction
  owned here; FormalConnectionsOpers F6 consumes it and owns its loop-Grassmannian
  reduction-locus/ind-stage application. Keep the general quotient discussion and
  its hypotheses, without asserting arbitrary closed-subgroup quotients affine.

### Layer 7: structure theory
- **Borel subgroups and maximal tori**, their conjugacy, and the existence of a common
  maximal torus in any pair of Borel subgroups in a connected reductive group. Prove the
  Bruhat decomposition and the double-coset identification `B\G/B ≃ W` here. These
  algebraic prerequisites are consumed by Layer 7b.
- **Parabolic subgroup schemes and Levi decompositions.** For a connected smooth
  affine reductive group of finite type over a field `k`, define its parabolic
  `k`-subgroups `P` and their Levi complements. Prove that the geometric unipotent
  radical of `P` descends to a smooth connected `k`-split normal subgroup `U`,
  and that a reductive `k`-subgroup `L` exists with `P=L⋉U`. Prove that conjugation
  by `U(k)` acts simply transitively on the Levi `k`-subgroups of this fixed `P`.
  These targets hold over every field; they include the algebraically closed case.
  Build the cocharacter description `P=P_G(λ)`, `U=U_G(λ)`, `L=Z_G(λ)` and its
  scheme-level comparison with the pointwise dynamic APIs. See Conrad–Feng,
  [*Reductive Groups over Fields*, §6.3, Proposition 12.3.1 and Appendix H.1](https://math.stanford.edu/~conrad/249BW16Page/handouts/AMSalggroups2.pdf).
  Layer 7b owns the additional finite-field intersection, transporter, and rational-point
  comparisons; its common-Levi statements take the specified `F`-stable complement as input.
- **Root datum** `(X*(T), Φ, X_*(T), Φ^∨)` of `(G, T)` with its **Weyl group**: do the
  **split** case first (split maximal torus, or work over `k̄`), consuming
  `LinearAlgebra/RootSystem/*` and `GroupTheory/Coxeter/*`; then add the **absolute root
  datum with Galois action** and the **relative root system** for non-split groups.
- **Bruhat decomposition** and **BN-pairs / Tits systems**. Keep the **dynamic** approach
  to parabolics/Levi/unipotent radical as a route that avoids full root data,
  useful for consumers that require only a BN-pair.

### Layer 7a: finite fields, Frobenius and rational points

**Supplier:** ReductiveGroupsPartII RG2.3.7 owns ordinary q-Frobenius Lang surjectivity,
its quotient/H¹ consequences, and generic fixed-coset lifting. This layer consumes
*lang-theorem* and *fixed-coset-lifting* under their stated smoothness and geometric
connectedness hypotheses; the finite-field fixed-group and subgroup application adapters
below remain targets here.

Let `q=p^f`, `k=F̄_q`, and let `G₀` be a connected reductive group scheme of finite type over
`F_q`, with base change `G=G₀×_{F_q}k`. Define the geometric Frobenius `F` on `G` from the
`F_q`-structure: on the coordinate algebra it is the scalar extension of the `q`-power map
on functions of `G₀`. More generally, use this same definition for any `F_q`-form of the
geometric group; do not restrict the carrier to the split form. Prove the canonical group
equivalence `G^F ≃ G₀(F_q)` and its compatibility with morphisms and `F`-stable closed
subgroup schemes. Reserve “split q-Frobenius” for the case that `G₀` is split. State
separately the standard field-Frobenius and Steinberg hypotheses in every result.

Tau Ceti's `TauCeti.Bialgebra.iterateFrobeniusPoints` supplies the iterated prime-power
point map for its `ℤ`-bialgebra carrier. For a commutative `ℤ`-Hopf algebra, the fixed-point
equivalence `TauCeti.Bialgebra.frobeniusFixedPointsMulEquiv` identifies points fixed by that
map with points over the Frobenius-fixed coefficient ring; `Frobenius.FixedPoints` supplies
the corresponding pointwise comparison. Extend the point-functor comparison to arbitrary
`F_q`-forms, including nonsplit forms, at the hypotheses above.

Prove finiteness of `G^F` and of the rational points of named `F`-stable closed subgroup
schemes, and functoriality on these finite groups. The ordinary q-Frobenius Lang theorem is
owned by ReductiveGroupsPartII, RG2.3.7 *lang-theorem*: for a smooth geometrically connected
group of finite type over `F_q` and its q-Frobenius, the map `x ↦ x⁻¹F(x)` is surjective on
geometric points. Consume that theorem and its stated quotient, nonabelian `H¹`, and exact-sequence
point-surjectivity consequences; do not duplicate the generic Lang proof here. For every
F-stable closed subgroup used by this layer, prove the application adapter: finite type,
smoothness, geometric connectedness, and compatibility of its restricted Frobenius with the
q-Frobenius structure required by RG2.3.7. Establish these hypotheses separately for each
parabolic, unipotent radical, or connected centralizer to which the theorem is applied. Smoothness
is retained as an explicit supplier hypothesis and a convenient adapter condition; this makes no
claim that point-level Lang fails for nonsmooth connected groups. Consume
`FiniteTypeCommHopfAlgCat.baseChangePointsMulEquiv` for the comparison
`G₀×_{F_q}k`-points `≃ Hom_{F_q}(O(G₀),k)` when `k/F_q` is a field extension.
Identify `G₀(F_q)` with `Hom_{F_q}(O(G₀),F_q)` by the points functor. The `q`-power
map is `F_q`-linear on `F_q`-algebras. For a `ℤ`-model, identify the iterated prime-power
point map with this construction.

### Layer 7b: algebraic parabolics and Levi intersections

Use Layer 7's algebraic parabolic subgroup schemes `P`, unipotent radicals `U=R_u(P)`, and
Levi complements `P=L⋉U`, together with Tau Ceti's cocharacter-defined point subgroups and
pointwise Levi decomposition. Layer 7b owns the additional F-stability data, the comparison
between these existing scheme/group carriers and the finite-point subgroups, and the
intersection and transport theorems below. Prove the comparison with standard parabolics in
split reductive groups where the existing point-carrier adapter requires it; do not introduce a
second general parabolic, Levi, or unipotent-radical definition.

Consume Layer 7's conjugacy of Borel subgroups and maximal tori, common-maximal-torus
theorem for pairs of Borels, and Bruhat/Weyl double-coset theorem; Layer 7b owns none of
these prerequisites. For a fixed maximal torus `T` contained in `P`, prove the unique Levi
complement of `P` containing `T`. For arbitrary Levi complements of `P`, prove conjugacy
under `R_u(P)` by a unique element of `R_u(P)`; retain the uniqueness clause. State the
field and connectedness hypotheses for all these results.

Use Dudas–Michel Proposition 8.9 with its exact hypothesis: for `P=L⋉U` and `Q=M⋉V`,
the selected Levi complements `L` and `M` contain one common maximal torus `T`. Then
`(P∩Q)U` is parabolic with Levi `L∩M`, and `P∩Q` is connected with unique factorization

    P∩Q = (L∩M) ⋉ ((L∩V)(M∩U)(U∩V)).

Prove the scheme-level and finite-point forms, connectedness of each factor and intersection
used, and uniqueness of the expression. In the rational transporter case, require
`x∈S(L,M)^F`; the transported Levi `xMx⁻¹` then shares a maximal torus with `L`. The
input Levis need not share one global torus.

Make the additional intersection facts explicit for each such `F`-fixed `x`:

* `L∩xQx⁻¹` is an `F`-stable parabolic subgroup of the connected reductive group `L`,
  with Levi `L∩xMx⁻¹` and unipotent radical `L∩xVx⁻¹`.
* `P∩xMx⁻¹` is an `F`-stable parabolic subgroup of `xMx⁻¹`, with unipotent radical
  `U∩xMx⁻¹` and Levi factor `L∩xMx⁻¹` from the intersection decomposition.
* `(L,F|_L)` and `(xMx⁻¹,F|_{xMx⁻¹})` are again connected reductive groups with the
  restricted Frobenius endomorphisms used below.
* `U∩xVx⁻¹` is connected, as required by the unipotent-piece bijection. Prove connectedness
  scheme-theoretically before passing to finite fixed points.

Prove the parabolic double-coset theorem `P\G/Q ≃ W_L\W/W_M` with the common-torus
hypotheses, consuming Layer 7's Bruhat decomposition, common-torus theorem, and Weyl-group
interfaces. State the exact map and its inverse on representatives.

For an `F`-stable Levi decomposition `P=L⋉U`, prove the scheme-to-point comparison and
Frobenius compatibility give `P^F=L^F⋉U^F`, with unique coordinates and projection
`P^F →* L^F`. This uses Layer 7a's rational-point groups and the algebraic decomposition
and compatibility proved in this layer.

### Layer 7c: Harish–Chandra functors and biadjunctions

Let `Λ` be a commutative ring in which `p` is invertible, and let `P=L⋉U` be an
`F`-stable parabolic with `F`-stable Levi complement. Work in the categories of all left
modules over the finite group algebras (equivalently, Mathlib's `Rep Λ G^F` and
`Rep Λ L^F` at `[CommRing Λ]`); the finitely generated and finite-dimensional subcategories
are consequences where their hypotheses apply. Define

    R^G_{L⊂P}(M) = Λ[G^F/U^F] ⊗_{Λ L^F} M
    *R^G_{L⊂P}(N) = Λ[U^F\G^F] ⊗_{Λ G^F} N ≃ N^{U^F}.

The first permutation module is a `(ΛG^F,ΛL^F)`-bimodule; the second is a
`(ΛL^F,ΛG^F)`-bimodule. The actions of `L^F` come from `P^F=L^F⋉U^F`. Prove the displayed
invariant identification using the averaging idempotent
`e_U=|U^F|⁻¹∑_{u∈U^F}u`. Prove that rational points of each connected unipotent radical form a finite p-group; hence
`p∈Λˣ` implies `|U^F|∈Λˣ`.

First prove the induction-side adapter, naturally in every left `ΛL^F`-module `M`:

    Λ[G^F/U^F] ⊗_{ΛL^F} M ≃
      Ind_{P^F}^{G^F}(Inf_{L^F}^{P^F} M).

The left side uses the right `L^F`-action on `G^F/U^F`; the right side is ordinary
finite-group induction from `P^F`. Use `P^F=L^F⋉U^F` and the section/cocycle model for
nontrivial `M`. The restriction-side adapter identifying
`Λ[U^F\G^F] ⊗_{ΛG^F} N` with `N^{U^F}` is proved in Layer 7d, where it is first used.

Prove inflation/invariants adjunctions, exactness, and the finite-index biadjunctions

    R^G_{L⊂P} ⊣ *R^G_{L⊂P} ⊣ R^G_{L⊂P}.

Derive both adjunctions from finite-group induction/coinduction and the averaging equivalence
between `U^F`-invariants and `U^F`-coinvariants. State naturality, conjugation compatibility,
finite-free permutation-bimodule bases, and the exact module categories. For general `Λ`,
consume Mathlib's `Rep.ind`, `Rep.indResAdjunction`, `Rep.resIndAdjunction`,
`Rep.coindResAdjunction`, and `Rep.indCoindIso` at their commutative-ring hypotheses, together
with the equivalence between representations and modules over the corresponding monoid
algebra. Mathlib's finite-index adjunction declarations additionally require
`[S.FiniteIndex]`, `[DecidableRel (QuotientGroup.rightRel S)]`, and carrier universe
`Rep.{max w u v}`. Keep Tau Ceti's `indFDRep` and its finite-dimensional adjunctions for the
field / complex specialization; they do not supply the general coefficient-ring adapter.
For the complex specialization, use
`indFDRep (FDRep.of (M.ρ.comp π))`, where `π:P^F→L^F` is the projection. The dimension
theorem is `finrank ℂ (indFromProjectedLevi P π M) = P.index * finrank ℂ M`, by Tau
Ceti's `finrank_indFDRep`. For nontrivial `M`, a coset-function presentation of induction must use the section
cocycle; the coset permutation action itself carries only the trivial module.

### Layer 7d: rational transport and the specialized Mackey theorem

For `F`-stable Levis `L,M` in `F`-stable parabolics `P,Q`, define `ad_x(V)` for an `M`-module as the `xMx⁻¹`-module with action
`(xmx⁻¹)·v := m·v`; use this direction throughout. Define

    S(L,M) = {x∈G | L∩xMx⁻¹ contains a maximal torus of G}.

Prove the geometric transporter equivalence `L\S(L,M)/M ≃ P\G/Q` and the rational
bijection

    L^F\S(L,M)^F/M^F ≃ P^F\G^F/Q^F.

The rational proof consumes ReductiveGroupsPartII RG2.3.7 *lang-theorem* and
*fixed-coset-lifting*, after Layer 7a/7b establish their exact finite-type, smooth,
geometrically-connected, F-stable subgroup and restricted-Frobenius hypotheses. It also uses
the fixed-point/orbit and component-group lemmas of this layer, and connectedness of the actual
stabilizers `P∩xQx⁻¹` and `L∩xMx⁻¹`. Prove both smoothness and geometric connectedness of
each stabilizer, as required by the supplier Lang adapter; do not infer either property from
equality of point groups. Consume Layer 7b's intersection and restricted-Frobenius facts.

Use the source permutation-bimodule route for the parabolic Mackey theorem. Reuse Layer 7c's
induction-side adapter and prove the restriction-side bimodule equivalence

    Λ[U^F\G^F] ⊗_{ΛG^F} −  ≃  (−)^{U^F}

at `p∈Λˣ`; prove that composition of these functors corresponds to tensoring their
bimodules by associativity. The composite bimodule for
`*R^G_{L⊂P} ∘ R^G_{M⊂Q}` is `Λ[U^F\G^F/V^F]`, with left `L^F` and right `M^F` actions.

For each `x∈S(L,M)^F`, prove the source piece bijection, with exact map and actions:

    L^F/(L∩xVx⁻¹)^F ×_{(L∩xMx⁻¹)^F}
      (U∩xMx⁻¹)^F\(xMx⁻¹)^F  → U^F\P^F x Q^F/V^F,
      (l, m′) ↦ U^F·l·m′·x·V^F.

The middle group acts by the identified Levi factor. Prove this factor is
`L∩xMx⁻¹` and prove its finite-point identification. Prove the right `M^F` action on the
left-hand fiber product is `m′ ↦ m′·xmx⁻¹`, including well-definedness and equivariance.
Show these pieces
partition the full biset as `[x]` ranges over `L^F\S(L,M)^F/M^F`. Prove the biset linearization adapter
`Λ[X] ⊗_{ΛH} Λ[Y] ≃ Λ[X ×_H Y]` for the finite bisets in this theorem, then linearize this
bijection to a direct-sum decomposition of `(ΛL^F,ΛM^F)`-permutation bimodules. Identify
each piece with the tensor product of the two finite permutation bimodules for the Levi intersections,
and use the tensor-composition equivalences from Layer 7c to obtain the natural Mackey
isomorphism

    *R^G_{L⊂P} ∘ R^G_{M⊂Q}
      ≅ ⊕_[x] R^L_{L∩xMx⁻¹ ⊂ L∩xQx⁻¹}
            ∘ *R^{xMx⁻¹}_{L∩xMx⁻¹ ⊂ P∩xMx⁻¹}
            ∘ ad_x,

where `[x]` ranges over `L^F\S(L,M)^F/M^F`. The intermediate functors use the finite-point
parabolic, Levi, and unipotent-radical intersections from Layer 7b. Prove naturality and
compatibility with the pinned conjugation convention. This supplies parabolic Mackey from explicit bisets.

### Layer 7e: common-Levi independence

Let `Λ` be a commutative ring with `p∈Λˣ`. For `F`-stable parabolics `P,Q` with a common
`F`-stable algebraic Levi complement `L`, prove the natural isomorphisms on all left
`ΛG^F`- and `ΛL^F`-modules,

    *R^G_{L⊂P} ≅ *R^G_{L⊂Q},   R^G_{L⊂P} ≅ R^G_{L⊂Q}.

The coefficient ring is commutative with identity and has `p∈Λˣ`. If `L=G`, then `P=Q=G`
and both Harish–Chandra functors are identities; handle this case directly. For `L≠G`, prove the coefficient-general theorem by constructing the natural
`(Λ[G^F],Λ[L^F])`-bimodule isomorphism
`Λ[G^F/U^F] ≃ Λ[G^F/V^F]`, where `U=R_u(P)` and `V=R_u(Q)`. Separately prove the
complex-character identity by the Layer 7d decomposition and induction on semisimple rank of
the ambient connected reductive group. Prove that every proper Levi has strictly smaller
semisimple rank; at each step identify the full-Levi normalizer and conjugation terms. For
general `Λ`, identify these bimodule carriers with `Λ[G^F]e_U` and `Λ[G^F]e_V`; the explicit
corner construction follows below.
Use the explicit averaged-idempotent construction below, prove its hypotheses, and establish
extension-of-scalars compatibility. Tensor the resulting bimodule isomorphism with an arbitrary
left `Λ[L^F]`-module and prove naturality to obtain the induction comparison. Obtain the
restriction comparison from the adjunctions in Layer 7c using Mathlib
`CategoryTheory.Adjunction.ofNatIsoLeft` and `CategoryTheory.Adjunction.rightAdjointUniq`; prove
the resulting unit/counit compatibility. The complex character identity is the complex
specialization of these functor isomorphisms. Howlett–Lehrer and Dipper–Du are source
references, not opaque assumptions.

The construction target is explicit and finite. First work in the integral model
`A₀=ℤ[1/p][G^F]`. For each finite `p`-group `U`, write
`e_U=|U|⁻¹∑_{u∈U}u` in `A₀`, and likewise for `V`; construct finite free
`ℤ[1/p]`-bases of the corner algebras `e_UA₀e_U` and `e_VA₀e_V`, using normalized
double-coset averages. Prove their base-change identifications with the corresponding
corners of `Λ[G^F]` for every commutative `Λ` in which `p` is a unit. For `t:=e_Ue_V`, prove the corner memberships and construct
`z_U:=e_Ue_Ve_U` and `z_V:=e_Ve_Ue_V` as units in their respective corners, first over
`ℤ[1/p]`. Set `s:=e_Ve_U z_U⁻¹`. Then `ts=e_U`; from `ts=e_U`, `st` is an idempotent, and
`(st)z_V=z_V`; since `z_V` is a unit, `st=e_V`. Because `L^F` normalizes both unipotent
radicals, `t` and `s` commute with every `ℓ∈L^F`. Right multiplication by `t` and `s` gives
mutually inverse `(ΛG^F,ΛL^F)`-bimodule maps
`Λ[G^F]e_U ≃ Λ[G^F]e_V`, hence the required permutation-bimodule isomorphism. The
construction and both unit proofs over `ℤ[1/p]` base-change to every commutative `Λ` with
`p∈Λˣ`.

The hard unit statements remain explicit proof targets: prove normalized-average factorization
and the betweenness identity `e_Ue_We_V=e_Ue_V` when
`W=(W∩U)(W∩V)`; connect the parabolics with Levi `L` by galleries of `F`-stable parabolics;
reduce each gallery step to adjacent relative-rank-one common-Levi pairs; and give an explicit
finite-free corner basis and rank-one inversion calculation whose only denominators are powers
of `p`. Construct and verify the intermediate subgroups, parabolics, and unipotent-factor
transport needed for these reductions. No Weyl representative, Bruhat-leading-coefficient
criterion, or unnamed source lemma is assumed. Howlett–Lehrer and Dipper–Du remain source
references, not opaque assumptions.

If the two Levis are rationally conjugate, require a witness `g∈G^F` with `gLg⁻¹=M`.
For an `L`-module `V`, define `ad_g(V)` as the `M`-module with action
`m·v := (g⁻¹mg)·v`. State the natural isomorphism
`R^G_{L⊂P} ≅ R^G_{M⊂gPg⁻¹} ∘ ad_g` and the restriction isomorphism
`*R^G_{L⊂P} ≅ ad_g⁻¹ ∘ *R^G_{M⊂gPg⁻¹}` before applying common-Levi independence. Geometric conjugacy alone or conjugacy of the finite Levi point subgroups does
not supply this rational witness. Keep the `G`-split hypothesis explicit: an `F`-stable
Levi need not be a Levi complement of an `F`-stable parabolic.

### Layer 7f: trivial-module specialization and Gassmann interface

For the trivial `L^F`-module, inflation is trivial and Harish–Chandra induction is the
permutation representation on left cosets `G^F/P^F`. Layer 7e therefore gives isomorphic
complex permutation representations for common-Levi parabolics. Build the comparison as a
`Representation.Equiv` between the two permutation representations, using the Layer 7c
`Ind∘Inf` adapter and Tau Ceti's `indTrivialEquiv`. The latter has a companion `Rep`-category
isomorphism `indTrivialIso`; provide the explicit conversion between that `Rep`-isomorphism and
the `Representation.Equiv` interface consumed by InductionRestriction Layer 2.1. Under
`[Finite G^F]`, `[Field ℂ]`, and `[CharZero ℂ]`, consume
`Gassmann.almostConjugate_iff_permutation_equiv` to obtain
`Gassmann.AlmostConjugate (P^F) (Q^F)` in `G^F`. See the
[InductionRestriction roadmap, Layer 2.1](../RepresentationTheory/InductionRestriction/README.md#layer-21-almost-conjugacy-and-permutation-representations)
for its owner contract. The arithmetic identity below is an independent target of that layer;
this roadmap does not treat it as already proved. The generic induction-restriction layer owns
its finite-group criterion; this layer owns the Harish–Chandra-to-permutation adapter and the
finite-reductive application.

For finite `G`, subgroup `H≤G`, and `g∈G`, use `Nat.card` for natural cardinality,
`C_G(g)` for the centralizer, and `g^G` for the conjugacy class. The target identity is

    Nat.card (MulAction.fixedBy (G ⧸ H) g) * Nat.card H
      = Nat.card (MulAction.stabilizer (ConjAct G) g)
          * Nat.card {x : G // x ∈ (ConjClasses.mk g).carrier ∧ x ∈ H}.

It counts representatives of fixed cosets mapping to each element of the class intersection.

### Layer 7g: Steinberg endomorphisms and extension of Layers 7a–7f

Let `σ:G→G` be a surjective algebraic-group endomorphism of a connected reductive group over
an algebraic closure of a finite field. A Steinberg endomorphism here means that some positive
power `σ^m` is the geometric Frobenius attached to an `F_{q′}`-structure on `G`. State the
characteristic, finite-type, smoothness, and connectedness assumptions; include diagram
automorphism twists and special isogenies only when this power condition is proved. Prove point
and algebraic compatibility needed to construct the finite group `G^σ`. For each stable closed
subgroup `H`, specify the restricted endomorphism `σ|_H` and verify that its positive power is
the restricted geometric Frobenius from the induced `F_{q′}`-structure. The ordinary q-Frobenius
Lang statement in ReductiveGroupsPartII RG2.3.7 is a supplier only for its stated
standard-Frobenius case; the Steinberg Lang–Steinberg theorem and its restricted-subgroup
applications are new targets here.

Extend each finite-field interface from Layers 7a–7f to this exact regime: finiteness and
functoriality of `G^σ` and `H^σ`; Lang–Steinberg surjectivity for every connected smooth affine
finite-type group and every connected smooth `σ`-stable closed subgroup with its restricted
endomorphism; fixed-point, component, and orbit consequences; `P^σ=L^σ⋉U^σ` for `σ`-stable
parabolics and Levis; `p`-invertible coefficient-ring Harish–Chandra induction/restriction and
biadjunctions; transporter and connected-intersection results for `σ`-stable parabolics; the
permutation-bimodule Mackey decomposition; common-Levi independence for commutative `Λ` with
`p∈Λˣ`; and the trivial-module Gassmann target. Reprove or transport each interface with the
power-Frobenius hypothesis visible. No 7a–7f output is treated as a split-only result when its
Steinberg extension is needed.

Layer 9's pinned Chevalley–Demazure groups supply explicit inputs, but do not by themselves
discharge the Steinberg fixed-point and representation-theory targets.

#### Worked example: GL3 over every finite field

For every `q`, let `P` stabilize the line `⟨e₁⟩`, `Q` stabilize the plane `⟨e₂,e₃⟩`, and
`L=diag(GL₁,GL₂)`. Both parabolics are F-stable with common Levi `L`, so Layer 7e gives
isomorphic complex permutation modules. They are not conjugate as finite subgroups:
every conjugate of `P` preserves a line, whereas `Q` has no common invariant line. A line
inside `⟨e₂,e₃⟩` is moved by `GL₂(F_q)`, including `q=2`; a line outside that plane is
moved by a lower-block unipotent. This example tests the general theorem and does not
replace it.

#### References for Layers 7a–7g

- O. Dudas and J. Michel, *Lectures on finite reductive groups and their representations*
  (2015), §§7–10, especially Proposition 7.5, Lemma 7.6, Proposition 7.7, Propositions
  8.7 and 8.9, Lemmas 9.9–9.11, Theorem 9.6 and Theorem 10.1:
  <https://webusers.imj-prg.fr/~jean.michel/papiers/lectures_beijing_2015.pdf>.
- R. B. Howlett and G. I. Lehrer, “On Harish-Chandra induction and restriction for modules
  of Levi subgroups,” *Journal of Algebra* 165 (1994), 172–183.
- R. Dipper and J. Du, “Harish-Chandra vertices,” *Journal für die reine und angewandte
  Mathematik* 437 (1993), 101–130.
- R. W. Carter, *Finite Groups of Lie Type: Conjugacy Classes and Complex Characters*,
  §1.17 (Frobenius fixed points and finite groups of Lie type).
- S. Lang, “Algebraic groups over finite fields,” *Amer. J. Math.* 78 (1956), 555–563;
  R. Steinberg, *Endomorphisms of Linear Algebraic Groups*, Memoirs AMS 80 (1968).
- J.-P. Serre, *Linear Representations of Finite Groups*, §§2.3 and 3.3; F. Gassmann,
  “Bemerkungen zur vorstehenden Arbeit von Hurwitz,” *Math. Z.* 25 (1926), 665–675.

### Layer 8: classification and existence
- The **isomorphism** and **existence theorems**: split reductive groups ↔ root data;
  classification of split semisimple groups up to central isogeny by Dynkin diagrams,
  and of split simply connected or adjoint semisimple groups up to isomorphism;
  central isogenies and the isogeny theorem; Chevalley existence.
- **Relative reductive groups over an affine Noetherian base.** For `S=Spec R`, `R`
  any commutative Noetherian ring, a reductive S-group means a smooth affine group scheme
  of finite presentation with connected reductive geometric fibers; semisimple means all
  those fibers are semisimple. Define these fiberwise predicates on the existing scheme
  group objects and their Hopf presentations. Prove invariance under isomorphism, arbitrary
  base change within the category, products and fpqc descent, with the actual base-change
  and descent comparison maps. Construct the relative center and derived subgroup, prove
  the derived subgroup semisimple and the center of multiplicative type, and state
  smoothness only where it holds; for example the center of SL_p need not be smooth in
  characteristic p. Construct central isogenies and the simply-connected and adjoint
  semisimple forms, their kernels and their base-change compatibilities.

  Construct the smooth scheme of maximal tori and the smooth projective scheme of Borels,
  with their functor-of-points descriptions, pullback equations and étale-local sections.
  Construct root subgroup and relative root-space decompositions after an étale splitting
  cover, and descend the character/cocharacter perfect pairing and root datum as étale
  locally constant sheaves. Prove the split root datum is locally constant in the étale
  topology and that the group is étale-locally a split group from Layer9. The identification
  retains the full root datum, not merely its Dynkin diagram. Prove the based-root-datum
  classification of split pinned models over connected bases and the isomorphism, base
  change and pinning-change equations. Extend the field-level subgroup/quotient and multiplicative-type comparisons of
  Layers3–4 to these bases in this lane: build the fppf sheaf coequalizers, effective
  affine descent and representability statements needed by each displayed construction,
  with their base-change maps. Field-only quotient results do not imply these relative
  theorems. Use Layer0's actual affine/Hopf dictionaries and the independent Layer9 split
  integral models. This relative extension is not a prerequisite of Layer9.

  For each fixed split reductive model G₀ over S, construct its automorphism sheaf and its
  inner/outer and pinned-automorphism interfaces, and the actual `Isom(G₀,G)` torsor.
  Prove the equivalence between étale forms of G₀ and torsors under this automorphism sheaf
  by effective affine descent, with inverse functors and the resulting nonabelian H¹
  classification. Build the needed sheaf-torsor and descent API here from Layer0 if no
  lower supplier has it. This classifies forms with that specified split type; it asserts
  no chosen global splitting or Borel on every base. Include a nonsplit real torus and
  SL₂ versus PGL₂ as tests of the Galois/root-datum and global-form distinctions.

- **Pseudo-reductive basic theory over arbitrary fields.** For any field k, start with
  smooth connected affine finite-type k-groups. Construct the maximal smooth connected
  normal k-unipotent subgroup `R_(u,k)(G)`, its uniqueness, characteristicity, functorial
  isomorphism transport and represented quotient, using Layer3 quotients and Layer5's
  unipotent constructions. Define pseudo-reductive to mean this subgroup is trivial.
  Prove reductive implies pseudo-reductive and equality of the two notions over perfect
  fields. For a finite separable extension K/k, prove that the k-unipotent radical commutes
  with extension to K, hence pseudo-reductivity is preserved and reflected by that
  extension. Do not claim pseudo-reductivity survives arbitrary inseparable extension. Identify the radical
  after algebraic closure and the obstruction to descending it. Keep the schematic center
  without an unproved smoothness assertion.

  Consume the finite-locally-free affine Weil-restriction construction, point adjunction,
  products/base change and Hopf transport of [ReductiveGroupsPartII RG2.0a.1–2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1e875b1e9277da9091c8c1338594ede28d52f342/TauCetiRoadmap/ReductiveGroupsPartII/README.md), whose lower
  dependencies are Layer0 and ModularCurves0F. For every nontrivial finite purely
  inseparable extension K/k, construct `Res_(K/k) G_m` with its actual unit functor
  `(K⊗_k A)ˣ`. Prove it smooth, connected, commutative and pseudo-reductive over k.
  On an algebraic closure, identify K⊗k k̄ as a local algebra with residue k̄; the units
  have quotient G_m and unipotent kernel `1+nilradical` of dimension `[K:k]−1`, so the
  group is not reductive. Prove the kernel filtration by powers of the nilradical and its
  additive successive quotients. Prove the k-unipotent radical is trivial using the Weil
  adjunction and the absence of characters of unipotent groups, rather than deducing it
  from the geometric fiber. Give coordinate calculations for K=k(a^(1/p)), and recover
  G_m when K=k. Develop homomorphism, product, central-subgroup and quotient API at the
  hypotheses proved here; no general closure under inseparable base change is implicit.
  These are active basic-theory and example targets. They neither assume nor substitute
  for a full classification of pseudo-reductive groups over all imperfect fields.

### Layer 9: pinned Chevalley–Demazure group schemes over `ℤ`

This lane is the exception to the standing "work over a field `k`" hypothesis: its whole
point is a group scheme over `ℤ` that is then base-changed. It is narrower than the relative
theory of Layer 8 because it constructs the split case over `ℤ`. This construction serves a
specific prerequisite rather than generalizing the relative theory, and it must not wait
behind pseudo-reductive groups.

The [CFSG statement roadmap](../CFSGStatement/README.md) defines finite groups of Lie type
as fixed points of a Steinberg endomorphism on the `𝔽̄_p`-points of a pinned simply connected
group, or on an explicit carrier identified with those points. Its milestone L5 depends on
explicit carriers; Chevalley existence alone does not specify one.
The root data start from `DynkinType.simplyConnectedRootDatum` in [the root-systems
roadmap](../RepresentationTheory/RootSystems/README.md). Layer 7g supplies the Steinberg
fixed-point and representation-theory interfaces; Layer 9 supplies the pinned group schemes
and explicit carriers they consume.

#### 9A. The full reductive integral enveloping form

Fix a finite reduced root datum `(X, Φ, Y, Φ∨, ⟨−,−⟩)` with its perfect
character/cocharacter pairing, positive roots and pinning. Use the actual free
lattices X and Y. They need not be respectively the full abstract weight lattice
and coroot lattice. In particular do not discard the central torus, assume that
Y splits integrally into central and coroot summands, or replace a reductive Lie
algebra by its Killing-semisimple part.

1. Construct the rational pinned Lie algebra and its integral Chevalley lattice
   `Y ⊕ ⨁_(α∈Φ) ℤ e_α`, with `H_y` additive in y,
   `[H_y,e_α]=⟨α,y⟩e_α`, `[e_α,e_(−α)]=H_(α∨)` and the pinned signed
   root-string constants. Prove Jacobi, lattice independence of choices with
   specified transport, and the comparison with the Lie algebra of the group
   constructed in 9B. The root-free datum gives the full toral Lie algebra.
   These algebraic constructions precede that group comparison.
   **9A.1a. Signed ADE lattice presentation and its integral comparison.**
   For a finite, possibly disconnected ADE diagram with a specified order on its
   vertices, use its free simple-root coordinate lattice `Q=⊕_i ℤ α_i` and Gram
   pairing `B` with diagonal2 and off-diagonal minus the number of bonds. Specify
   the simply-laced isometry `Q→Q∨`, `α_i↦h_i`; this identifies the presentation's
   Cartan lattice with the coroot lattice, not with X or the full Y. Include the
   empty diagram. Consume the actual finite realizations of
   [RootSystems Layers5–6](../RepresentationTheory/RootSystems/README.md) and the
   native `IntegralLattice.integralForm`, `ofIntegralForm`, `carrierIsometry` and
   `rationalizationIsometry` dictionary from
   [IntegralLattices](../IntegralLattices/README.md). Prove that the norm2 shell
   `Φ={a∈Q:B(a,a)=2}` is exactly the root set of that realization, with explicit
   root/coroot index maps. A positive norm2 vector has a simple reflection that
   lowers height unless it is simple: its coefficients have one sign, since two
   nonzero disjoint sign parts would have norm at least4. This gives the
   height-induction proof, finiteness, root enumeration, reflection and component
   APIs. In particular `a+b∈Φ` iff `B(a,b)=−1`, and `B(a,b)=±2` iff `a=±b`.

   Construct the group on `Q×ℤˣ`, where `ℤˣ={±1}`, by
   `ε(a,b)=(−1)^(Σ_(i>j) bond(i,j)a_i b_j)` and
   `(a,s)(b,t)=(a+b,stε(a,b))`. Prove normalization and the cocycle identity,
   identity `(0,1)`, inverse `(a,s)⁻¹=(−a,sε(a,−a))`, and the commutator formula
   `[ê, f̂]=(−1)^B(a,b)`. Define `τ=(0,−1)`, its order2 and centrality, the actual
   injection of `ℤˣ`, projection to `Multiplicative Q`, exact kernel/image and
   surjectivity, packaged as native `GroupExtension`. Prove centrality separately
   from those exact-sequence fields. Supply the presentation by the ordered
   simple lifts and central τ with their bond commutators, via unique normal
   words; there is no square relation on a simple lift. Give the specified set
   section `u_a=(a,1)` and its inverse and cocycle-defect equation
   `u_a u_b=ι(ε(a,b))u_(a+b)`, with ι the actual kernel inclusion. Prove that
   this section is a homomorphic splitting exactly when the diagram has no
   bonds, including the empty diagram. `τu_a` lies over a, whereas `u_a⁻¹`
   lies over −a.

   Let `Φ̂` be the inverse image of Φ. Construct the quotient of the free
   ℤ-module on Φ̂ by `[τe]+[e]=0`, with its explicit section-basis equivalence to
   `Φ→₀ℤ`, and use `Q⊕(Φ→₀ℤ)` for the integral Lie carrier. With section vectors
   `x_a`, define the bilinear bracket by
   `[H_h,H_k]=0`, `[H_h,x_a]=B(h,a)x_a`,
   `[x_a,x_b]=ε(a,b)x_(a+b)` when `a+b∈Φ`,
   `[x_a,x_(−a)]=ε(a,−a)H_a`, and zero in all other root/root cases.
   On lifted generators the root-sum bracket is the vector indexed by the
   **group product** ef; the opposite bracket is `H_(πe)` if `ef=1` and its
   negative if `ef=τ`. Prove quotient well-definedness, additivity/scalar laws,
   evaluation on all generators, alternation, antisymmetry and Jacobi over ℤ.
   In particular an arbitrary negative-root section is not an inverse lift.
   For A2 ordered `α₁<α₂`, `ε(α₁+α₂,−α₁−α₂)=−1`: the matrix example has
   `x_(α₁+α₂)=E₁₃` but `x_(−α₁−α₂)=−E₃₁`. Include this rejection test,
   rank1, reducible components and rank0.

   Prove Jacobi before using any Serre or Chevalley comparison. Trilinearity
   reduces it to Cartan and root vectors. The Cartan cases use weight additivity.
   Dispose of repeated underlying root lines by alternation and antisymmetry
   without division by2. For three remaining roots a,b,c, total degree outside
   `Φ∪{0}` forces every term to vanish. At degree0 their cyclic lifted products
   agree with the same central sign, and the sum is that sign times
   `H_a+H_b+H_c=0`. At a root degree with no opposite pair the three pairings
   have pattern `(-1,-1,0)`; precisely two products occur and differ by τ. With
   b=−a, rescale the lift to `f=e⁻¹` and put `d=B(a,c)∈{0,±1}`. For d=0 all
   terms vanish; for d=1 the terms are `g,0,−g`; for d=−1 they are `0,−g,g`.
   These cases supply the complete integral proof, including disconnected types.

   Supply explicit changes of section and order. For orders o,o′ let `E_rev`
   consist **only of unordered bond edges whose relative order changes**. Then
   `σ(a)=(−1)^(Σ_{{i,j}∈E_rev}a_i a_j)` satisfies
   `ε′/ε=σ(a)σ(b)/σ(a+b)`; give the induced cover and Lie equivalences and
   their composition/value equations. For general specified lattice isometries,
   construct the corresponding quadratic coboundary, including diagonal
   `binom(a_i,2)` terms when needed. For homomorphic cover-isomorphism lifts
   of a fixed lattice isometry that fix the central sign kernel, classify
   differences by characters `Q→{±1}`; this character group is trivial at
   rank0. Normalized set sections instead differ by arbitrary normalized sign
   functions, which need not be characters. Track the diagonal quadratic factor when
   comparing the zero-diagonal ordered cocycle with a lattice-VOA asymmetry
   convention; transport root signs and inverse lifts rather than identify
   formulas belonging to different sections. The integral construction and
   elementary Jacobi argument require no VOA premise.

   Normalize the negative root vectors by inverse lifts so opposite brackets
   become `H_(a∨)` while retaining the simple positive pinning. Over ℚ construct
   the split root decomposition, Cartan and generation. Compute the Cartan
   Killing pairing as `Σ_(a∈Φ)B(h,a)B(k,a)` and its nondegeneracy, and use
   invariance to prove the nonzero opposite root-space pairings; assemble
   components. The simple generators satisfy the actual Serre relations, giving
   native `TauCeti.serreLift` with its H/E/F values and surjectivity. Consume
   [LieHighestWeight Layer7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/8e4c6c209a7a4675f8f9654b2a1a97f4966d34b3/TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md)
   for the split-field presentation/injectivity comparison; the native pinned
   Serre map alone supplies no injectivity theorem. Preserve its Cartan-matrix
   orientation even where ADE symmetry hides the transpose.

   Compare **integrally** with9A.1's pinned Chevalley lattice by explicit unit-sign
   root-basis maps and inverse maps. For each positive nonsimple root, subtract
   a suitable simple root and track the resulting bracket word, whose ADE
   root-string coefficient is a unit ±1. Prove word/choice consistency and
   identify the Cartan and all root basis images. A rational equivalence alone
   does not establish an integral equivalence. With the actual root/coroot maps
   into a general reductive datum, extend the Cartan to its full Y, use
   `[H_y,x_a]=⟨a,y⟩x_a`, and send the signed opposite bracket to `H_(a∨)`.
   Prove the same integral laws, comparison with the actual full-Y frame, unit
   basis inverse and all diagrams. Do not assume an integral center/derived
   splitting. Base change these identities and the basis to every commutative
   ring, with root-free data giving the full abelian toral algebra; simplicity
   in bad characteristic is a separate assertion. The9B group and9C distribution
   comparisons consume this construction and are not premises for its Lie laws.

   **9A.1a-L. The group of all kernel-fixing ADE cover lifts.**
   On the actual ordered cover of9A.1a, let A be the group of integral Gram
   isometries preserving its norm2 shell. Construct the subgroup of
   `MulAut(Cover) × A` consisting of pairs `(φ,g)` with
   `φ∘ι=ι` and `π∘φ=g∘π`, where `ι:ℤˣ→Cover` and π are the actual extension
   maps. Use native `GroupExtension.Equiv` for extension transport and its
   existing section-ratio/quotient APIs for the corresponding comparison laws.
   Prove closure, inverse and identity by these equations and use the
   native subgroup group structure. Export its cover action, projection to A,
   conjugation/change-of-order maps, and the literal action on simple lifts,
   section values, τ, products, inverses and root fibers. This is the group of
   **all** compatible lifts, not one silently selected lift per root isometry.

   The quadratic-coboundary construction above supplies a lift of every g,
   hence surjectivity onto A. Prove that the kernel is the character group
   `Hom(Q,{±1})`: χ acts by `(a,s)↦(a,sχ(a))`; for any kernel lift, the ratio
   of its value on a lift over a to that lift lies in ι({±1}), is independent
   of the lift, and is multiplicative in a. Give both inverse maps and all
   evaluation equations, injectivity/exactness and a native
   [`GroupExtension`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/GroupTheory/GroupExtension/Defs.lean#L73-L83).
   For a general central extension first project onto the actual subgroup of
   liftable automorphisms; only the proved ADE coboundary theorem makes that
   subgroup all of A. Choosing normalized set sections gives arbitrary
   normalized sign functions, whereas the difference of two homomorphic
   cover lifts of the same g is a character. Do not conflate these categories.

   For `(φ,g)` and the fixed section `u_a`, define the actual sign
   `s_φ(a)` by `φ(u_a)=ι(s_φ(a))u_(ga)`. On the signed integral Lie carrier
   construct `H_h↦H_(gh)` and `x_a↦s_φ(a)x_(ga)`, extending through the
   sign quotient. Prove root indexing, additivity/scalars, bracket and
   inverse/composition equations on the actual Cartan/root basis. In particular
   `[x_a,x_(-a)]` and the inverse-lift normalization must be transported,
   not guessed from negative-section labels. Kernel characters fix Cartan and
   multiply each root line by χ(a). Prove this action faithful over ℤ, using
   the simple root basis and cover normal words. Construct scalar-extension
   actions and their comparison diagrams; characteristic2 can collapse sign
   characters, so faithfulness is not asserted after every base change.
   State composition through native Lie-equivalence composition or actual
   action equations, without assuming an undeclared `Group` instance on
   endomorphism `LieEquiv`s. The companion `CoverLiftTargets.lean` consumes
   `SignedADETargets.lean`; it does not import back into that lower carrier.

   After9A.1b, compare its pinned **based** diagram lift with this full lift group
   and its simple-generator equations. For an unbased root automorphism use
   [RootSystems4A](../RepresentationTheory/RootSystems/README.md)'s actual
   Weyl/based factorization, while retaining the character ambiguity and
   any multiplication defect of separately chosen lifts. Export transport
   under every specified order/section and full-Y comparison. Full-Y maps
   require the actual compatible Y action; no integral central splitting is
   inferred. Include empty/reducible ADE, rank1, A2's negative-section test,
   component permutations and D4 triality. This signed ADE extension, a
   compact finite Tits lift, `N_K(T)→W`, and a topological covering group have
   different bases/kernels. None is identified with another by a “double
   cover” label, and no VOA or compact normalizer section is a premise here.

   Prove finiteness of the positive-definite lattice isometry group by its faithful permutation
   action on the finite norm-two root set, which spans the lattice, and finiteness of the lift
   group from this image and its finite character kernel. The kernel has order `2^rank(Q)`;
   this counts characters of the actual free root lattice, not arbitrary sign functions.

   **9A.1b. Pinned fixed Lie algebras and signed ADE folding.**
   Starting from9A.1a, construct the fixed Lie algebra of each finite ADE diagram
   automorphism, its actual integral fixed lattice, its split characteristic-zero
   root system and its normalized folded presentation. Include disconnected and
   empty diagrams and a compatible action on the full reductive datum. Keep the
   integral fixed lattice, its scalar extension, and a normalized folded
   Chevalley lattice distinct. This construction is algebraic and precedes9B's
   group comparison. The accompanying `FoldingADETargets.lean` gives native
   target forms; the definitions, maps, inverses and basic laws below are part of
   the definitive specification.

   **Pinned action and actual fixed carrier.** For the ordered diagram `(Q,B,o)`
   of9A.1a let γ permute the simple vertices and preserve B. Put
   `q_γ(a)=Σ_{{i,j} a bond, i<j, γi>γj} a_i a_j` and
   `s_γ(a)=(-1)^q_γ(a)`. Prove
   `ε(a,b)s_γ(a+b)=s_γ(a)s_γ(b)ε(γa,γb)`. Define the cover map
   `(a,t)↦(γa,t s_γ(a))`, fixing τ and sending each pinned simple lift to the
   specified lift over its image. Construct its inverse, identity and
   composition equations, including order/section-change conjugacy with9A.1a's
   specified transports. On the integral Lie carrier it gives
   `H_h↦H_(γh)` and `x_a↦s_γ(a)x_(γa)`. Prove the sign-quotient, bracket,
   root-index and pinning equations. The lift's kth iterate is identity when
   `γ^k=1`: it fixes all simple lifts and τ, hence every normal word. Projection
   proves its exact order equals that of γ. The identity/rank0 order is1.
   An arbitrary kernel-fixing lift need not have this order.

   For any actual Lie equivalence φ, use native
   `LinearMap.fixedSubmodule φ.toLinearMap` as the underlying module and extend
   it to native `LieSubalgebra` by bracket closure. Export membership, inclusion,
   kernel `ker(φ-id)`, bracket/evaluation laws, intertwining maps and equivalences,
   functoriality, scalar-extension maps and the relevant inverse diagrams.
   Reuse native `TauCeti.serreDiagramAut`, all H/E/F generator laws,
   `serreDiagramAut_iterate_eq_id` and `serreLift_comp_serreDiagramAut`.
   Endomorphism `LieEquiv`s here have no Group instance: state order relations
   through function iterates. Compare the signed pinned action with native
   `geckLieEquivOfEquiv` using its supplied base-preserving root-pairing
   equivalence and finite crystallographic characteristic-zero domain
   hypotheses, and prove equivariance of the actual9A.1a comparison maps.
   Do not replace these implemented automorphisms by privately assumed copies.

   When consuming native `DynkinType.diagramAut`, display both lattice maps:
   its weight map forwards roots by γ but its coweight map is the transpose
   map, carrying coroot indices backwards. The geometric forward action on Y
   is the inverse of that coweight map. Prove the literal root, coroot and
   pairing equations before using it in the full-Y construction. Check D4
   triality, where γ and γ⁻¹ differ, as well as involutions. Native Geck module
   and group pinning providers are comparison inputs with their actual lattice
   and carrier hypotheses; their existence does not compute a fixed Lie algebra.

   **Signed orbit modules and brackets.** On each orbit
   `a,γa,...,γ^(l-1)a` define `c_0=1`,
   `c_(r+1)=c_r s_γ(γ^r a)` and monodromy `μ=c_l∈{±1}`. Construct maps and
   inverse maps from fixed coefficient tuples to `Ann_A(μ-1)` over every
   commutative ring A: the inverse sends t to the tuple `(c_r t)_r`. A positive
   cycle contributes A, a negative cycle A[2]. For Q's Cartan permutation the
   distinct simple-orbit sums are an integral basis. Together with positive
   root-cycle sums they give the actual integral fixed-module basis. Prove
   independence, spanning, coordinate formulas, change-of-representative maps
   and the bracket coefficients in that basis. Negative cycles have no integral
   fixed vector; their A[2] vectors after base change must not disappear.
   Compute the fixed bracket by restricting the ambient bracket and expanding
   its actual finite signed sums, including the opposite-root Cartan cases.

   For a permutation orbit of connected components, choose one component and
   construct its return automorphism, restriction and diagonal-transport inverse;
   prove their Lie and pinning equations and change-of-choice comparisons.
   Perform this reduction before the connected root-space and generation
   calculations. It handles arbitrary component cycles and combined internal
   symmetries, not only action orders2/3.

   Over a characteristic-zero field K, use the Gram dictionary to identify the
   restriction of a root to the fixed Cartan with
   `p(a)=k⁻¹Σ_(r=0)^(k-1)γ^r a`. Construct the nonzero weights arising from
   positive-monodromy root orbits and prove their distinctness and one-dimensional
   weight spaces. Identify the zero-weight space with the fixed Cartan and
   prove it is a split Cartan subalgebra. Projecting every ambient root is not
   the fixed root system: even A has negative-monodromy roots whose projections
   would add doubled short roots of a nonreduced restricted system. Prove the
   complete actual-root/weight-space correspondence, including negatives,
   reflection and root/coroot equations, before identifying a Dynkin type.

   **Folded frame, finite Cartan and presentation.** For a simple orbit O put
   `d_O=Σ_(j∈O)B(α_j,α_i)` for i∈O. The induced graph on O is a regular finite
   forest, so its degree is0 or1 and `d_O=2` or1. Reducible diagrams can give a
   union of adjacent pairs. Set `c_O=2/d_O∈{1,2}` and define
   `H'_O=c_OΣ_(i∈O)H_i`, `E'_O=Σ_(i∈O)x_(α_i)`,
   `F'_O=c_OΣ_(i∈O)x_(-α_i)`; simple negative sections are inverse lifts.
   Prove fixedness, `[E'_O,F'_O]=H'_O`, all mixed E/F and Cartan equations, with
   the integer matrix having **H rows and E columns**
   `C_(O,P)=c_OΣ_(i∈O)B(α_i,α_j)`, j∈P.
   With `S_O=Σ_(i∈O)α_i` and `β_O=p(α_i)=S_O/|O|`, prove independence,
   `B(β_O,β_O)=d_O/|O|`, and
   `C_(O,P)=2B(β_O,β_P)/B(β_O,β_O)`. Its off-diagonal entries are nonpositive
   integers, its zero pattern is symmetric, and multiplying row O by
   `d_O/(2|O|)` gives the positive-definite projected Gram matrix. Construct the
   associated finite root pairing and its simple base, rather than just naming
   a matrix. The ambient `RootPairing.Base.cartanMatrix` uses roots as rows;
   translate it by the actual transpose to the H-row convention as in
   [LieHighestWeight Layer7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/8e4c6c209a7a4675f8f9654b2a1a97f4966d34b3/TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md).

   Prove the exact higher Serre powers and construct `TauCeti.IsSerreSystem`
   for these actual fixed vectors. The resulting native `serreLift` maps into
   the actual fixed Lie subalgebra, with H/E/F value equations. Prove its
   surjectivity by constructing every signed orbit root vector as a rational
   combination of bracket words in E′/F′, and the fixed Cartan from their
   brackets. Retain all nonzero factors2/3. Prove generation using the concrete
   comparisons below; a dimension match or existence of the Serre map alone
   is insufficient. Then consume Layer7's separately owned split-field
   injectivity/straightening theorem, componentwise in the reducible case, to
   obtain the equivalence from that same lift. Establish Killing nondegeneracy
   and its Cartan/opposite-root pairings from the constructed root decomposition.
   For each connected folded component prove simplicity by decomposing an ideal
   into Cartan/weight components, using opposite brackets and nonzero root-string
   coefficients to propagate a nonzero root component through the connected
   root system; a nonzero Cartan component produces such a root component.
   Construct the actual Cartan, split weight decomposition and triangularizability.
   Thus finite dimensionality, Killing nondegeneracy, Cartan triangularizability
   and connected simplicity are conclusions before applying Layer7, not added
   assumptions in place of the missing folding proof. Reducible inputs assemble
   their simple ideals; the full fixed central summand is not declared simple.
   Keep integral injectivity/equality as a separate question.

   **Uniform A and D constructions.** For A_n in the standard vertex order set
   m=n+1 and use the actual trace-zero matrix frame
   `e_i=E_(i,i+1)`, `f_i=E_(i+1,i)`, `h_i=E_(i,i)-E_(i+1,i+1)`.
   For the interval root a=α_i+...+α_j of height l construct the signed matrix
   comparison `x_a=E_(i,j+1)`, `x_-a=(-1)^(l-1)E_(j+1,i)`, its integral basis
   inverse and all overlap/opposite brackets. Changes of vertex order consume
   the earlier specified sign transport. Let J have antidiagonal entries
   `J_(i,m+1-i)=(-1)^(i-1)`. Prove `Jᵀ=(-1)^(m-1)J`,
   `J²=(-1)^(m-1)I` and that `θ(X)=-JXᵀJ⁻¹` is the pinned reversal on H/E/F.
   Equality with the signed lift follows on generators with the tracked root
   signs. Its fixed equation is `XᵀJ⁻¹+J⁻¹X=0`; trace0 follows since2 is
   invertible. Construct the fixed-carrier/skew-adjoint-carrier equivalence and
   its inverse. Native `skewAdjointMatricesLieSubalgebraEquiv F P h` maps
   X to `P⁻¹XP` and has target form `PᵀFP`, with actual invertibility of P;
   retain that direction in the frame value equations. For m=2r an explicit
   signed-permutation form change gives
   native `LieAlgebra.Symplectic.sp`, hence C_r. For m=2r+1 the form is split
   symmetric with r hyperbolic pairs and one line. Give the explicit scalar
   similarity and basis change to native `LieAlgebra.Orthogonal.JB/typeB`;
   retain the nonzero scalar and basis maps. Do not replace that split carrier
   by identity-Gram `Orthogonal.so` over ℚ. Prove an actual matrix root basis,
   its H/E/F dictionary and bracket-word generation, covering the adjacent
   middle pair of even A as well as the orthogonal-orbit case of odd A.

   For D_n, n≥4, use native `Orthogonal.JD/typeD` on the hyperbolic basis
   `u_1,...,u_n,v_1,...,v_n`. Let R exchange u_n,v_n and fix the other vectors.
   Construct its orthogonality and the pinning-preserving conjugation action:
   the fork matrices are
   `E_(n-1,n)-E_(2n,2n-1)` and `E_(n-1,2n)-E_(n,2n-1)`, with matched
   negative and Cartan generators. Its plus/minus spaces are orthogonal,
   nondegenerate and have dimensions2n-1 and1. The plus space has its actual
   basis of n-1 hyperbolic pairs and `w=u_n+v_n` of norm2; after reindexing its
   Gram matrix is exactly native `JB`. Restriction/block extension gives mutually
   inverse Lie maps from the fixed typeD algebra to native `typeB (Fin(n-1))`,
   the minus-line skew-adjoint algebra being zero. Prove the source signed-frame
   comparison, all root-basis images and rational bracket generation. Native
   `typeBEquivSo'` is an additional existing scalar/form comparison when a
   split-signature carrier is wanted. A norm1 alternative requires scalar
   similarity: divide `H^(n-1)⊕<2>` by2 and replace v_i by2v_i; it is not a
   rational isometry of the original norm2 and norm1 forms. No square root of2
   is needed. Identity-Gram `so` needs an actual suitable field/form comparison;
   `soIndefiniteEquiv` assumes a square root of−1 and is not such a comparison
   over ℚ. Treat D4's conjugate involutions by their numbered permutation;
   triality is the separate order-three case below.

   **Exceptional certificates, types and components.** For D4 triality and E6
   reversal construct full exact finite root enumerations, using the native
   finite realizations/root-index dictionaries of RootSystems and9A.1a's
   norm-shell theorem. Prove both inclusions, closure and the complete counts24
   and72; select positives with counts12 and36 in the pinned simple coordinates.
   Compute every lift sign and signed root orbit, its monodromy and actual
   invariant vector. Give the complete Cartan/root invariant bases, with fixed
   dimensions14 and52. Construct kernel-checkable rational certificates: for
   every surviving root-orbit basis vector record a finite Lie word expansion
   in the displayed E′/F′, its coefficient vector and a proof of the resulting
   equality. Verify all rows through the ambient integral bracket laws and
   exact rational arithmetic; prove the Cartan part by opposite brackets.
   These equalities, not an imported external program or rank computation,
   establish generation and all required Serre equations. Compare the actual
   folded matrices/root pairings with G2 and F4 via explicit oriented simple
   reindexing and root/coroot maps. Construct change-of-enumeration and
   change-of-pinning diagrams so certificates do not become an unexplained
   privileged model.

   Derive the connected type dictionary with its actual bounds:
   `A_(2r-1)→C_r` (r≥2), `A_(2r)→B_r` (r≥1,B1=A1),
   `D_(r+1)→B_r` (r≥3), D4 triality→G2 and E6 reversal→F4; identity actions
   retain their ADE component. Use RootSystems' valid-type reindexing in low
   rank, in particular C2=B2 and B1=A1, with actual oriented root/coroot maps
   rather than an invalid validity witness for `DynkinType.C 2` or `B 1`.
   Assemble these identifications using the earlier
   component-return maps. Include empty Q,
   identity, reducible mixtures and every non-simply-laced finite type.

   Export projection, distinct-orbit sum and full-k-sum as separate maps:
   `fullSum_k(a)=|Stab(a)|·distinctSum(a)=(k/|orbit(a)|)·distinctSum(a)=k·p(a)`.
   Full sums are a uniform scale of projected roots; distinct sums rescale
   different orbits differently and can give the dual type. Construct lattice
   image/index, root-length and coroot maps for each choice, without equating
   Q^γ, p(Q), their duals or the character/cocharacter lattices of a group.
   For connected nontrivial folds with orthogonal simple orbits and two root
   lengths, identify fixed simple vertices with long projected simple roots.
   Use the general formula `B(β_O,β_O)=d_O/|O|` for adjacent even-A orbits,
   rank1, identity actions and component permutations. In particular A4 reversal
   has no fixed vertex but has two projected root lengths, so the unrestricted
   fixed-vertex assertion is false in that case.
   Include A3 (outer orbit first, matrix `[[2,-2],[-1,2]]`), A4
   `[[2,-1],[-2,2]]`, A5's two paired orbits and fixed middle vertex with its
   full-sum factor2, and D4 triality `[[2,-3],[-1,2]]`. Track the A3 combinations
   `x_(abc)`, `x_(ab)-x_(bc)`, `x_a+x_c`, `x_b` under the specified section and
   sign dictionary; paired negative vectors and invariant Cartan complete the
   basis. These mathematical examples do not decide uncertain source commas,
   arrow marks or unexpanded proof announcements.

   **Integral and full-Y comparisons.** The actual integral fixed lattice is
   bracket-closed. For the Q-based carrier only, construct the comparison
   `A⊗_ℤ(g_ℤ^γ)→(A⊗_ℤg_ℤ)^γ` on the orbit basis. Its extra factors are exactly
   A[2] from negative cycles, so it is an isomorphism when A has no2-torsion;
   if there are no negative cycles it is an isomorphism for every A. Do not
   identify this lattice with a chosen normalized folded Chevalley form.
   For A2 exchange prove the integral basis e=xα+xβ, f=x−α+x−β,
   h=Hα+Hβ satisfies `[e,f]=h`, `[h,e]=e`, `[h,f]=-f`; the normalized A1 frame
   E=e,F=2f,H=2h has index4. Construct the rational equivalence and the actual
   integral lattice inclusion/index, retaining root-string factors2/3.

   For full Y retain its actual integral automorphism γY with
   `γY(a∨)=(γa)∨` and `⟨γa,γY y⟩=⟨a,y⟩`. Use a positive common finite
   exponent k for both the diagram and Y action, not merely the diagram order.
   The root action is the pinned signed one; the Cartan fixed module is
   `ker(γY-id)`. In actual finite free bases construct unimodular maps U,V and
   a diagonal D with `U(γY-I)V=D`. Consume native PID submodule Smith normal
   forms through image/kernel bases; those forms alone do not include a
   divisibility-chain normalization, and a nonsingular-matrix-only theorem
   does not apply to a matrix with kernel. Retain all nonzero diagonal entries
   d_i and zero positions, with the specified basis maps; no canonical invariant
   factor ordering is needed for this comparison. Over A construct the actual
   kernel equivalence to one free A per zero position and `Ann_A(d_i)` per
   nonzero position. The integral fixed lattice maps to the free factors;
   the annihilator factors are exactly the Cartan base-change obstruction,
   in addition to any negative root-cycle A[2]. Prove the pairing/bracket
   diagrams on all these factors. Flat scalar extension and invertibility of
   the actual full action order give sufficient isomorphism hypotheses.
   Preserve the root-free order-three example
   `γY=[[0,-1],[1,-1]]`: γY-I has diagonal factors1,3, integral invariants0,
   and F3 has the fixed vector(1,-1) despite2 invertible.

   Over characteristic zero construct the action-compatible center/derived
   decomposition of the full reductive Lie algebra and its fixed central
   summand, separately from the folded semisimple Serre presentation. A root-free
   full-Y torus is not the empty Q-carrier. No integral central splitting,
   bad-characteristic simplicity, equality with a group fixed scheme or
   global-form comparison is inferred. Those9B comparisons consume the actual
   Lie construction and retain their group-scheme/field hypotheses; special
   isogenies in characteristics2/3 do not make a long/short swap an ordinary
   integral Cartan symmetry. Root-automorphism/W semidirect products, compact
   normalizer splitting and a VOA construction are separate from this adapter.


2. In the native `UniversalEnvelopingAlgebra ℚ` of this rational Lie algebra,
   use `TauCeti.UniversalEnvelopingAlgebra.kostantForm` with **all** root
   vectors and `H_(y_j)` for a chosen ℤ-basis `(y_j)` of the full Y. Thus its
   generators are `e_α^(m)/m!` and `Ring.choose H_(y_j) m`, including m=0.
   Use the existing native divided-power, Cartan integer-translate, subring
   functoriality, invariant-lattice and rational-base-change APIs. The native
   `LieAlgebra.Basis.kostantForm` supplies its simple-generator special case;
   compare it only after checking the actual toral lattice. Rational spanning
   is not the integral PBW theorem.
3. Fix orders on Φ⁻ and Φ⁺ and construct the actual ordered basis
   `F^(a) · Π_j binom(H_(y_j),b_j) · E^(c)`, indexed by nonnegative root and
   toral multi-indices. Prove integral spanning by a terminating straightening
   procedure and independence by the rational PBW leading terms. Export finite
   integral multiplication coefficients, the product values of basis vectors,
   triangular factorization as ℤ-modules, and order filtrations. Include
   `E_α^(a)E_α^(b)=binom(a+b,a)E_α^(a+b)`, the Cartan-binomial product law,
   `binom(H_y,m)E_α^(r)=E_α^(r)binom(H_y+r⟨α,y⟩,m)`, and the opposite-root
   rule
   `E_α^(a)F_α^(b)=Σ_(r≤min(a,b)) F_α^(b−r)binom(H_(α∨)−a−b+2r,r)E_α^(a−r)`.
   Supply every different-root Chevalley straightening coefficient, including
   non-simply-laced constants without inverting bad primes. Consume native
   `TauCeti.UniversalEnvelopingAlgebra.instHopfAlgebraKostantForm` and its
   `kostantForm_comul`, `kostantForm_counit`, `kostantForm_antipode` comparisons
   from `Kostant.HopfAlgebra`, specialized to all root vectors and the full Y
   basis. Use `kostantFormComul_dividedPower`, `kostantFormComul_ringChoose`
   from `Kostant.Comultiplication` and the formulas in `Kostant.Antipode`:
   root divided powers and toral binomials have the sum coproduct
   over a+b=m, counit zero for m>0 and one for m=0; antipode sends a root
   divided power to `(−1)^m` times itself and `binom(H_y,m)` to
   `binom(−H_y,m)`. Use Layer0's left-factor-first Hopf coproduct convention throughout.
4. Prove invariance under a change of ℤ-basis of Y by the integral binomial
   identities for arbitrary integer linear combinations, and compare admissible
   root orders/pinning changes by explicit integral maps. Central isogenies use
   their actual maps on X,Y: a rational Lie isomorphism need not identify the
   integral forms. Base change this free ℤ-module algebra and its basis to every
   commutative ring A, retaining multiplication, triangularity, Hopf structure
   and filtration. After specialization the divided/toral symbols mean these
   base-changed elements, never factorial division or an assumed BinomialRing
   structure on A. The associated graded order algebra is the divided-power
   algebra on the integral Lie lattice; it becomes the usual symmetric/PBW
   algebra after rational comparison, not an unqualified symmetric algebra over ℤ.

5. Before9B's matrix construction, consume the characteristic-zero split Lie
   highest-module and finite-dimensionality construction of
   [LieHighestWeight Layers3–4](../RepresentationTheory/LieHighestWeight/README.md).
   Supply its rational split-Chevalley descent and extend the derived action by
   the prescribed central character in the actual X. For each dominant λ∈X
   construct a full finite free admissible ℤ-lattice generated from the highest
   line by the9A divided powers, prove its stability and weight decomposition,
   and choose finitely many such modules whose combined weights generate X.
   This supplies9B's faithful torus/finite matrix data and nilpotent root
   exponentials. Prove the resulting group-scheme/root-datum comparison in9B;
   do not assume the rational G-module classification of10B to construct G.
   The10B integral Weyl modules are compared with these earlier lattices after
   the group action and rational induction have been constructed.

The integral straightening/basis construction in 9A is an input to the following
explicit group construction. Its proof does not assume 9C's distribution
comparison for a group that is still being constructed.

#### 9B. Pinned groups and their explicit carriers

- **Split reductive group schemes over a base**, at least over `ℤ`: the definition, with the
  split maximal torus as part of the data rather than an existence statement.
- **Pinnings.** A pinning `(G, T, B, {X_α})` of a split reductive group scheme: the torus,
  a Borel containing it, and a choice of root vector for each simple root. This is what
  makes "the" graph automorphism well defined, so it is data, not a property.
- **The Chevalley–Demazure construction.** For each root datum, an explicitly constructed
  split reductive group scheme over `ℤ` realizing it, via a Chevalley basis and the Kostant
  `ℤ`-form of the enveloping algebra. Constructed, not asserted to exist.
- **Base change** along `ℤ → k` for any commutative ring `k`, and the compatibility of the
  pinning with it.
- **Root subgroup maps.** `x_α : 𝔾_a → G` for each root `α`, the Chevalley commutator
  relations they satisfy, and the equations pinning them against the pinning. Downstream
  work states its conventions against these, so they are part of the interface, not an
  implementation detail.
- **Points over an algebraically closed field** as a group, functorially in the field, so
  that a field endomorphism induces a group endomorphism of the points. The `q`-power
  Frobenius is the case a consumer asks for first.
- **The isomorphism theorem for pinned groups**: a based root-data isomorphism lifts uniquely
  to an isomorphism of pinned group schemes. This is what makes a diagram automorphism into
  a named group automorphism, and it is the source of the uniqueness a consumer needs when
  it pins `γ` by its action on simple root subgroups.
- **Special isogenies in characteristics two and three.** For `B₂`/`C₂` and `F₄` in
  characteristic two and `G₂` in characteristic three, the exceptional isogeny `τ` with
  `τ² = Frob_p`, together with its action on the long and short root subgroups. This is a
  statement about group schemes and belongs here rather than in any consumer. On the explicit
  carriers the CFSG roadmap's carrier plan designates, the three targets are: `τ` on the
  rank-two symplectic carrier (`TauCeti.SpStd.specialIsogeny`, done); `τ` on the short-root
  `G₂` carrier over `𝔽₃`, the closed subgroup scheme of `GL₇` generated over `𝔽₃` by the reduced
  root subgroups and torus of the toral closure of the seven-dimensional module, in characteristic
  three; and `τ` on the short-root `F₄` carrier over `𝔽₂`, generated the same way inside `GL₂₆`
  from the toral closure of the twenty-six-dimensional module, in characteristic two. The prime
  field is the base because the isogeny exists only there and the restriction argument needs the
  generated subgroup scheme's defining ideal to be maximal over that base; the CFSG roadmap's
  carrier plan records the reason. The `G₂` and `F₄` maps are explicit polynomial maps on matrices realizing
  the carrier's action on the quotient of its represented Chevalley Lie algebra by the short-root
  ideal, read back in the module through a fixed identification; the `Sp₄` map is the analogous
  action on the subquotient `ker φ ⧸ ⟨ω⟩` of the exterior square. Each comes with the pinning
  equations on the simple root subgroups and the square relation, proved by computation or
  structurally; the CFSG roadmap's carrier plan records the construction in detail.
- **Explicit carriers with numbered symmetries.** The toral-closure carriers the CFSG roadmap
  designates that do not yet exist: the short-root `G₂` and `F₄` carriers above, and the tripled
  `D₄` carrier, the toral closure of `8ᵥ ⊕ 8ₛ ⊕ 8꜀` inside `GL₂₄`, carrying triality as a
  numbered symmetry the way the doubled `E₆` carrier carries its graph automorphism. Each comes
  with its numbered simple root subgroups, weight torus, pinning equations against
  `DynkinType.simplyConnectedRootDatum`, Frobenius, and the span statement that its weights
  generate the full character lattice.

#### 9C. Algebraic distributions and Frobenius

For a smooth affine group scheme G of finite type over ℤ constructed in 9B,
write I for the identity augmentation ideal. Construct the finite order jets
`O(G)/I^(n+1)`, their finite free ℤ-duals and the filtered union of those duals,
with its convolution algebra, coalgebra and antipode from Layer0's Hopf maps.
These are distributions supported at the identity, not analytic distributions.
Prove finite freeness of the jets, the order inclusions and convolution estimates,
and arbitrary-ring base change level by level. For a constructed split reductive
G, use the big-cell open neighbourhood `U⁻×T×U⁺→G` to give the distribution
triangular factorization, root-subgroup coefficient distributions and the full
Y-toral binomial basis. Construct the rational comparison with U(Lie(G_ℚ)),
pinning the root derivative and H_y, and identify the integral form of9A with
`Dist_ℤ(G)`. Hence `A⊗_ℤ U_ℤ≃Dist_A(G_A)` for every commutative A, with actual
basis and order equations. Dist(T) includes every central toral direction.
For G=𝔾_m the root set is empty but the answer is the binomial algebra on its
cocharacter generator, not ℤ alone. For adjoint A₁, retain α∨=2y in Y: the
coroot-only form must not silently replace the full toral lattice. An isogeny
induces the specified distribution map; assert an isomorphism only with a proved
hypothesis such as invertibility of its finite kernel's order.

In characteristic p>0 first use the **relative** Frobenius G→G^(p), with its
actual scalar-twist comparison; the pinned ℤ/F_p form identifies the target when
an endomorphism is desired. Construct the induced Hopf map on distributions.
On every root divided-power basis it kills indices not divisible by p and
sends index pm to m; on `binom(H_(y_j),n)` it has the same rule. Give iterated
p^r formulas, the map on every ordered basis element and the toral formulas for
all y∈Y. Prove surjectivity and identify its kernel both by these basis equations
and as the ideal generated by the augmentation ideal of the Frobenius-kernel
distributions. For the r-th Frobenius kernel prove its distribution algebra is the
finite sub-Hopf algebra with all root and toral indices <p^r, of dimension
`p^(r dim G)`. Compare the first kernel with the restricted enveloping algebra
of the actual restricted Lie algebra. The full hyperalgebra is infinite and is
not that finite restricted algebra; ordinary division by p! is never performed.

Construct the positive and negative raising-index algebra maps on the unipotent
parts by their **simple-root** divided-power values `E_i^(m)↦E_i^(pm)` and
`F_i^(m)↦F_i^(pm)`, proving the divided-power relations and their Frobenius
section equations. Their nonsimple-root values are determined by the actual
relations, not an additional all-root index-multiplication assertion. They are
not asserted to be Hopf maps or to combine unmodified with a toral map into a
unital section on all Dist(G).

For the full split reductive group over an algebraically closed field of
characteristic p, construct the toral idempotent
`μ₀=Π_j binom(H_(y_j)−1,p−1)`. It projects rational T-modules onto weights in
pX. Construct the corner algebra `μ₀Dist(G)μ₀` with unit μ₀ and the unital
map φ from Dist(G) to this corner, with `Dist(F)φ=id` after inclusion. Its
simple-root and toral values are
`φ(E_i^(m))=E_i^(pm)μ₀`, `φ(F_i^(m))=F_i^(pm)μ₀` and
`φ(Π_j binom(H_(y_j),b_j))=(Π_j binom(H_(y_j),pb_j))μ₀`.
Prove the integer-linear toral and mixed relations for the actual coroots in Y,
basis/pinning transport and the corner unit law. Viewed in Dist(G) this map is
multiplicative and linear with φ(1)=μ₀, generally not unital; it is not a second
Hopf structure. This is the full reductive construction of
[Gros–Kaneda](https://arxiv.org/html/1712.06835), including central torus and
non-simply-connected derived groups. Construct its F_p-form by the displayed
pinned-generator formulas and prove its base change to every characteristic-p
field: multiplicativity and the section equations descend from a faithfully
flat algebraic-closure extension. Retain the relative Frobenius scalar twist
and the specified pinned split form in this comparison.

On a rational G-module construct the contracted rational module on μ₀M, with
weights pλ relabelled λ and action through φ. Prove integration using the
actual `(Dist(G),T)` module interface of10A, functoriality and compatibility with
Frobenius pullback, in particular `(F* N)^φ≃N` on rational modules on the
identified Frobenius target. The functor is exact. It is not claimed monoidal:
for T=𝔾_m, weights1 and p−1 can both contract to zero while their tensor
contracts nontrivially. Retain the positive/negative maps separately. The geometric
Frobenius splitting of flags, its trace normalization and Schubert compatibility
are applications owned by SchubertGeometry; none is a proof premise of9A–9C.

### Layer 10: rational representations, highest weights and regular functions

#### 10A. The rational category and actual torus lattice

Use Layer1's existing right O(G)-comodules and their actual coefficient maps,
tensor/dual/Hom and finite-dimensional full subcategory. Construct the rational
scheme-action comparison, subobjects, quotients, exact sequences, invariants,
restriction, and scalar extension at their stated field hypotheses. An action
on G(k) alone, especially over finite k, is not this rational representation.
For a split torus T with character lattice X, identify O(T)=k[X] and construct
the finite weight-support decomposition of every finite-dimensional rational
module, with integral X labels, direct sums, tensor convolution and dual
negation. The formal character lies in ℤ[X]. For split reductive G its Weyl
normalizer action and root-distribution maps retain the actual X,Y pairing,
central weights and all character-lattice restrictions. Lie toral eigenvalues
mod p do not recover the weights.

Differentiate a rational action through9C: `E_α^(n)` is the coefficient of t^n
in the action of x_α(t), and `binom(H_y,n)` acts on weight λ by
`binom(⟨λ,y⟩,n)`. Construct the integration comparison using a rational T-action
with those toral equations, root weight shifts and local finiteness, verifying
actual group/root relations. For finite modules the finite weight set supplies
the root-action finiteness; for general modules require a directed union of
finite-dimensional compatible submodules. Do not identify all abstract finite
Dist(G)-modules with rational G-modules: already Dist(𝔾_m) permits p-adic
binomial characters without an integer rational character. Full X-integrality
and T-compatibility are part of the integration interface.

#### 10B. Induction, Weyl modules and simple heads

For a split connected reductive G over a field fix B⁺ and its opposite B⁻,
with positive roots from B⁺. Consume [IntegralHeckeAndGaloisDeterminants0.7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1e875b1e9277da9091c8c1338594ede28d52f342/TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md#07-connected-reductive-invariant-evaluations)'s
canonical arbitrary-base algebraic induction: the actual cotensor equalizer for the
coordinate bialgebra map, its native comodule coaction and natural reciprocity maps.
Specialize to k and transport by its antipode/inversion comparison from
`F(hg)=hF(g)` with right translation to `f(gh)=h⁻¹f(g)` with left translation.
Construct the field regular-function and group-scheme dictionaries and identify counit
evaluation in Frobenius reciprocity. The generic induction engine remains with that
supplier; the induced/Weyl/highest-weight and integral applications remain here. Put `∇(λ)=Ind_(B⁻)^G k_λ`: its functions satisfy
`f(gb)=λ(b)^(−1)f(g)` and G acts by `a·f(g)=f(a^(−1)g)`. For λ∈X⁺ prove
finite dimensionality, highest weight λ and its one-dimensional B⁺-highest
line, and simple socle L(λ). For λ∉X⁺ prove the corresponding induced module
zero. Construct `Δ(λ)=∇(−w₀λ)*`, its distinguished generating highest line,
unique simple head L(λ), and the normalized nonzero map Δ(λ)→∇(λ) with image
L(λ). Prove the classification of finite-dimensional rational simples by X⁺,
absolute simplicity and End_G(L(λ))=k for split G. Give arbitrary-field base
change/descent proofs for these split objects; do not extend this last scalar
endomorphism assertion to arbitrary nonsplit groups. State induced/Weyl base
change and integral Weyl lattices with their actual freeness and action equations,
not simplicity at every specialization. Their characters are the Weyl characters;
characteristic-zero complete reducibility makes Δ=∇=L there. In characteristic p
retain distinct heads, socles and extensions: characters do not identify modules.

Construct the pinned integral group anti-involution τ fixing T and interchanging
simple positive/negative root subgroups, with its distribution anti-involution.
The contravariant dual `D_τ M=Hom_k(M,k)`, acted on by
`(g·φ)(m)=φ(τ(g)m)`, is distinct from the ordinary dual. Construct
`D_τΔ(λ)≃∇(λ)`, natural biduality and the perfect integral evaluation
pairing with the dual. Construct the top-normalized integral contravariant
form on Δ; after field specialization its radical is the maximal proper
submodule and its quotient is L. This latter form need not remain nondegenerate
in characteristic p. Put `σ(g)=τ(g)^(−1)`; the contravariant dual is the
ordinary dual with action twisted by this automorphism. Export the exact
highest/lowest line, torus-weight and extremal-vector equations under ordinary
duality, τ and opposition. In particular the ordinary dual remains
`Δ(λ)*≃∇(−w₀λ)`; a same-label identification requires the displayed twist,
not an implicit self-duality assertion.

Prove root-subgroup generation, highest-weight order and Weyl-orbit convex-hull
bounds in `(X⊗ℝ)`, retaining central coordinates. A unique highest line does not
by itself imply generation or simplicity. In a module generated by a
one-dimensional highest line prove the unique maximal proper submodule/head
by the top-weight argument; use generation, not bare cyclicity. Prove simple
highest-weight uniqueness through the cyclic span of two chosen highest vectors
in their direct sum and its two projections. Preserve disconnected/nonreduced
rational categories from Layer1; this dominant-weight classification is for the
stated split connected reductive hypothesis.

For split simply connected semisimple G in characteristic p>0, let
`ρ=½Σ_(α>0)α`, which is in this group's actual X. Construct the algebraic
Steinberg theorem before any flag splitting/Schubert cohomology:
`Δ((p−1)ρ)≃L((p−1)ρ)≃∇((p−1)ρ)`, of dimension `p^|Φ⁺|`.
Give the truncated negative-root PBW model, root-distribution actions and the
nonzero extremal-vector equation, together with a normalized nondegenerate
contravariant pairing for the pinned Chevalley anti-involution. Prove its
F_p-form/base-change and all-prime cases, including p=2. For a general reductive
G use its derived simply connected cover when this module is needed; do not
assume `(p−1)ρ∈X(G)` or that the same module descends. SchubertGeometry owns
central-isogeny flag transport, anticanonical trace and the geometric splitting.
The Steinberg proof uses9A/9C and10A/10B algebra, not that later splitting,
vanishing or standard-monomial theorem.

#### 10C. Binary forms and the source's characteristic-p exercises

Use the actual rational SL₂ action on `R_n=k[x,y]_n`,
`(g·f)(u,v)=f(du−bv,−cu+av)` for `g=[[a,b],[c,d]]`. For B⁺ upper triangular,
the unique B⁺-stable line is k y^n of weight n, and `R_n≃∇(n)`;
`R_n*≃Δ(n)` has the generating highest line k δ_(x^n).
Prove indecomposability through simple socle/head, not a false semisimplicity
argument. In characteristic zero R_n is simple. In characteristic p>0 write
`n=Σ n_j p^j`, `0≤n_j<p`; prove via Lucas coefficients and the rank-one
simple-module construction that
`dim L(n)=Π_j(n_j+1)`, and that the rational submodule generated by y^n is its
simple socle. Thus highest-line generation of R_n, simplicity of R_n and
`n=(a+1)p^m−1` for some `0≤a<p,m≥0` are equivalent. Include n=0 explicitly.
Generation here means the smallest rational subcomodule, not only a G(k)-orbit
span over a finite field.

Compute char3,n4: the socle spans x⁴,x³y,xy³,y⁴ and misses x²y². Compute
char2,n2: y² generates only span(x²,y²), whereas xy generates all R₂ as a
rational module. This separates bare cyclicity from generation by the highest
line. On R_n* prove highest-line generation for every n; at n=p the additional
B⁺-stable line k δ_(x^(p−1)y) shows uniqueness can fail. Retain the source's
ambiguous divisibility phrase as a source discrepancy; never promote it to
`p∤n` as a highest-line criterion. Give proper submodules for positive multiples
of p and treat the zero-degree exception separately. Root and torus action
formulas, dual-basis signs and all source exercises are applications of the same
rational category.

#### 10D. Algebraic Peter–Weyl and polynomial monoid actions

For linearly reductive affine groups over a field construct the cosemisimple
regular coefficient-coalgebra decomposition. Over an algebraically closed field,
identify it with `⊕_[V simple] V*⊗V` by
`φ⊗v ↦ (g↦φ(gv))`, with the action
`(a,b)·f(g)=f(a^(−1)gb)`. Hence the first factor acts on V* and the second on V.
For split connected reductive G in characteristic zero index these summands by
λ∈X⁺ using10B. Keep regular O(G), not all set-valued, continuous or L² functions.
Export the coefficient equations, Schur/Frobenius reciprocity multiplicities,
unit/tensor-product multiplication, counit φ(v), antipode/dual and
`Δc_(φ,v)=Σ_j c_(φ,e_j)⊗c_(e_j*,v)` with the left factor first. For a nonsplit
field retain the actual simple coefficient coalgebras and End_G(V)-balanced
bimodule/coequalizer comparison and descent; do not assume every irreducible has
scalar commutant. No compact Haar/Peter–Weyl theorem substitutes for this algebraic
construction. In positive characteristic no direct sum of simple coefficients
is asserted to exhaust O(G).

##### Right-unipotent invariants, Cartan multiplication and the rank-one quotient

For a split connected reductive group over an algebraically closed field of
characteristic zero, fix the same positive Borel `B⁺=T⋉N⁺`, actual character
lattice and normalized highest lines as 10B. Under 10D's coefficient map
`φ⊗v ↦ (g↦φ(gv))` and action `(a,b)f(g)=f(a⁻¹gb)`, construct the right
group-scheme-invariant algebra comparison
`O(G)^(1×N⁺) ≃ ⊕_(λ∈X⁺) V(λ)*⊗V(λ)^(N⁺)`.
Here invariants mean the coaction equalizer, not invariance only on rational
points. Right `T` acts on the highest line with weight λ; the left summand is
`V(λ)*`, and rewriting it as a sum of simples uses the explicit dual reindexing
λ↦−w₀λ. Choose actual highest vectors, including the unit at weight zero, and
construct the unique Cartan inclusion `V(λ+μ)→V(λ)⊗V(μ)` sending the chosen
highest vector to their tensor. Prove its associativity/unit compatibilities
and that multiplication of coefficient functions is its dual on the left
factors and the chosen highest-line product on the right. This fixes the
scalar coherences; unrelated choices of one-dimensional identifications do
not define the algebra. Prove compatibility with all central characters and
the existing flag-minor/section-ring applications. This simple-coefficient
direct sum stays in the stated characteristic-zero lane; it does not assert
semisimplicity of positive-characteristic rational representations.

Over **every field** k, give the separate explicit `SL₂/N⁺` construction.
For `g=[[a,b],[c,d]]`, `ad−bc=1`, right multiplication by
`n(t)=[[1,t],[0,1]]` changes `(b,d)` to `(b+at,d+ct)` and fixes `(a,c)`.
On coordinates the right coaction is
`a↦a⊗1`, `c↦c⊗1`, `b↦b⊗1+a⊗t`, `d↦d⊗1+c⊗t`.
The first-column morphism maps to `U=A²_k\{0}`. Construct its Zariski
`N⁺`-torsor charts using the sections
`s_a=[[a,0],[c,a⁻¹]]` on D(a) and
`s_c=[[a,−c⁻¹],[c,0]]` on D(c), with fibre coordinates
`u_a=b/a` and `u_c=d/c`. On the overlap prove
`s_c=s_a n(−1/(ac))` and `u_c=u_a+1/(ac)`, and prove the represented fppf
quotient universal property from these charts. Compute its global functions
by the Čech equalizer/localization intersection
`k[a,c]_a ∩ k[a,c]_c = k[a,c]` inside `k(a,c)`; explicitly prove the intersection
using the coprime variables. Prove the right coaction invariants on each
torsor chart are exactly its base ring by translation in an independent
indeterminate, which remains valid over finite fields and in positive
characteristic. Thus `O(SL₂)^(N⁺)=k[a,c]`, but the geometric quotient is the
quasiaffine punctured plane, not its affinization `Spec k[a,c]=A²_k`.
Identify the degree-n polynomials in `(a,c)` under left translation with10C's
actual contragredient binary-form module `∇(n)`. The actual right torus
`diag(t,t⁻¹)⊂SL₂` scales the first column by t and acts on degree-n functions
by the character `t↦t^n`, including n=0; arbitrary scalar matrices are not
being treated as elements of SL₂. Over characteristic zero compare this with the
preceding Cartan algebra; over positive characteristic retain10C's simple
socle, generation and nonsimplicity distinctions. In the preceding
characteristic-zero general-group lane, apply the coefficient and
multiplication comparisons to
[GroebnerGeometry G5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/d21bc1c2f895047275495326f5f693e89f0e244c/TauCetiRoadmap/GroebnerGeometry/README.md)'s
polynomial flag-minor/standard-monomial construction. First prove that its
polynomial flag-minor algebra is `O(Mat_n)^(1×N⁺)` for the actual right
upper-unipotent matrix action. Then prove that localization at the full
determinant identifies this algebra with `O(GL_n)^(1×N⁺)`, using the
invariant determinant and the actual coordinate-ring inclusion. Include
n=0, with determinant 1 and invariant algebra k. Minors in the first d
columns use G5's increasing row subsets and the right matrix action, while the left
action on polynomial coordinates is contragredient. Construct the row/column
and dual-action comparison explicitly. Do not assert the original flag
algebra is its toric initial algebra.

For the complex rank-one torsor and its cocycle, compare
[Hedén §§1,3](https://arxiv.org/html/1407.7638v2).

For GL(V), construct its polynomial representation comparison with actions of
the algebraic endomorphism monoid End(V). A finite rational action extends
uniquely exactly when its coefficient coaction factors through
`k[End(V)]⊂k[GL(V)]=k[x_ij,det^(−1)]`; prove that the factorization preserves
unit and multiplication, using the actual coordinate bialgebra maps. Treat
zero dimensions and all determinant inverses correctly. Construct homogeneous
polynomial coefficient coalgebras and their finite Schur-algebra duals, compare
Schur/Cartan modules with the same rational category, and prove over every field that a finite rational GL_n-module is polynomial
exactly when every actual T-weight is in ℕ^n. For n>0 identify homogeneous
degree d by the scalar-torus character t^d and the coefficient coalgebra; treat
the zero module and n=0 separately. For simples the
polynomial condition is the actual nonnegative dominant GL-weight condition;
prove it, rather than imposing semisimplicity on arbitrary characteristic-p
polynomial modules. Mixed positive/negative determinant twists remain rational,
and their regular coefficient localization uses all powers of det^(−1).

The generic category, integral/toral and algebraic highest-module constructions
here precede SchubertGeometry's geometric line-bundle/coordinate/section-ring
comparisons. With its opposite-Borel convention the geometric
`G×^(B⁻)k_λ` has H⁰=∇(λ); the positive-Borel bundle with associated character
−λ instead has H⁰=∇(−w₀λ)=Δ(λ)*. Geometric very ampleness, Schubert bases,
coherent vanishing and compatible Frobenius splitting are owned by that
application, not used as unnamed assumptions to establish this generic algebra.

---

### Layer 11: regular-semisimple spectral quotients and finite Weyl monodromy

This lane constructs the Lie-algebra spectral quotient and its based topology for every
connected reductive algebraic group over `ℂ`, with a specified maximal algebraic torus.
Construct it after Layers8–9 have supplied the group/root-datum and pinned root maps.
The lower smooth/holomorphic dictionary of [FormalConnectionsOpers F4.3](../FormalConnectionsOpers/README.md)
uses those outputs and is a prerequisite for the analytic charts here. The algebraic
classification, integral construction and that lower dictionary have no dependency on this lane.
The finite-arrangement construction in 11B is independent of the group application and runs
once RootSystems' finite Coxeter presentation is available. `SpectralWeylTargets.lean`
prototypes selected maps; all of 11A–11G below is normative.

**11A. Plane configurations, geometric braids and their basepoints.** Consume the early
configuration contract [InverseGaloisAndArithmeticFundamentalGroups IG.5.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/164e3b19e90ef83d80c3c51722ad429cedfc7f02/TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md),
including its actual injective-tuple carrier, permutation quotient, disc configuration
comparison, finite covering and native braid/permutation maps. This is a specialization of
that generic configuration theory; its later arithmetic and Hurwitz-moduli layers are not
inputs. Use subtype topology on `PConf_n(ℂ)={z:Fin n→ℂ | Function.Injective z}` and quotient
topology on `Conf_n(ℂ)=PConf_n(ℂ)/S_n`. Transport that quotient topology when comparing to
IG's finite-subset carrier; no discrete topology on `Finset ℂ` is intended. Permutations act
on tuples by `(σ·z)_i=z_(σ⁻¹ i)`.

Choose an actual ordered base configuration, for example `z_i=i`, and its unordered image.
The homeomorphism `z↦z/sqrt(1+|z|²)` to the open unit disc, with inverse
`w↦w/sqrt(1−|w|²)`, induces equivariant ordered/unordered homeomorphisms. Prove their inverse,
continuity, noncollision and cover equations. Transport basepoints to IG's chosen disc
configuration by the resulting actual image or a specified path. Construct the based
comparison with native `TauCeti.BraidGroup n`, and restrict to native
`BraidGroup.pureSubgroup n` for ordered configurations. Prove that the induced map of the
ordered cover is the subgroup inclusion and the covering permutation is native `permHom`.

For a lifted loop, its coordinate graphs in `ℂ×[0,1]` are collision-free strands; evaluation
of such strands gives the inverse loop. Prove both constructions respect endpoint
permutations and relative homotopies. Pin multiplication: Mathlib's fundamental-group
product is `p*q=q.trans p`. Choose strand stacking to match that product and check an
explicit product of two elementary half-twists; if another stacking convention is used,
construct the time-reversal/opposite-group comparison. Check the precise positive
half-twist against IG.3.2's Hurwitz convention `(a,b)↦(aba⁻¹,a)`, including inversion if
required, and prove the permutation square after the convention transport. Closure and
Markov equivalence are not substitutes for this based loop/strand theorem.

Give evenly covered neighborhoods using pairwise disjoint coordinate discs and the free
finite `S_n` action, with actual covering maps. Prove the exact sequence
`1→P_n→B_n→S_n→1`. It is nonsplit for `n≥2`: the sign of native `permHom` is the parity of
native `ArtinGroup.exponentSum`. A homomorphic section would lift a transposition to an
order-two element, whose integer exponent sum is zero, contradicting odd parity. Prove
the sign/exponent equation on generators and extend by native homomorphism extensionality.
No generic Artin torsion-freeness theorem is needed. The quotient is trivial for `n=0,1`.
Do not confuse this sequence with the pure forget-last-point sequence, which has a plane
section. Do not apply a covering theorem requiring simply connected total space to
`PConf_n(ℂ)`, which is not simply connected for `n≥2`.

**11B. The finite Weyl-arrangement theorem.** Start with a finite reduced crystallographic
real root pairing and a base, and its complexified root-hyperplane complement. Give the
chosen finite-dimensional realization, duality and real form explicitly; an identification
of a Cartan dual `𝔱*` with the Cartan requires an explicit linear-duality map.
Standard-coordinate prototypes consume native `rootPairingBaseChange` with its actual
dot-product and faithful scalar-extension hypotheses. Prove basis/dual-basis transport
from arbitrary finite-dimensional real realizations to that model and independence of the
chosen coordinates. Retain a `W`-fixed central vector summand in nonessential realizations.
Write `V_reg={v∈V_ℂ | α(v)≠0 for every root α}`, `B_W=V_reg/W`; construct the actual action,
quotient topology and quotient morphisms. Root and coroot spaces use their native dual
representations: `weylGroupRootRep` is a `W`-representation, whereas
`weylGroupCorootRep` is a `W.op`-representation.

Prove nonemptiness and path connectedness of the complex complement and the freeness of
`W` on it. For freeness, a `w` fixing `x+iy` fixes both real vectors. Some real linear
combination `x+c y` avoids every root hyperplane, since each root is nonzero on at least one
of `x,y`; finite real chamber freeness then gives `w=1`. Construct the finite covering
`V_reg→B_W` and local charts, with their transition permutations.

Build the finite face/chamber Salvetti model and its equivariant comparison with the
complex complement: specify its cells by real arrangement faces with incident chambers,
construct a good open-star cover and its contractible intersections, and prove the
homotopy or sufficient two-skeleton comparison using the based van Kampen and CW-cell
interfaces of [AlgebraicTopology](../AlgebraicTopology/README.md). In the quotient, prove
there is one vertex, one oriented one-cell for each simple wall and exactly the rank-two
alternating-word relations of length `m_ij`. Both generation and completeness of the
relations are targets. This gives a generator-characterized based isomorphism
`π₁(B_W,[b]) ≃ TauCeti.ArtinGroup (coxeterMatrixOfBase P base)` at a specified chamber point,
with explicit basepoint-change transport for any other basepoint.

Consume [RootSystems Layer2](../RepresentationTheory/RootSystems/README.md)'s
`weylCoxeterSystem`, with its exact spanning/reduced/characteristic-zero hypotheses and
coordinate transports. Native `weylCoxeterHom` supplies the map and surjectivity, but its
injectivity remains that lower written target. The Artin-to-W map is the native
`ArtinGroup.toCoxeterGroup` followed by the actual Weyl identification, not a private
presentation of a new group. Prove the geometric covering square, reflection-generator
normalization, and identify `π₁(V_reg,b)` with its kernel. Outside type A this is the pure
finite-type Artin group, not an ordinary `BraidGroup.pureSubgroup n`.

Include reducible products, exceptional types and the actual matrices with entries4 and6.
The empty-root case is a contractible central vector space with trivial groups. Rank1 is
`ℂ*` with sign quotient and square cover. Type A agrees with 11A. B and C share the Weyl
arrangement, but retain their different root data. This lane asserts finite real Weyl
arrangements; it commissions no affine, infinite-type or general complex-reflection
asphericity statement.

**11C. Algebraic invariant quotient and the discriminant base.** For the stated complex
reductive `G,T`, use Layer2's actual tangent Lie algebra `𝔤`, torus Lie subalgebra `𝔱`, root
spaces and adjoint action. Prove that the Lie-algebra regular-semisimple locus consists
of the conjugates of `𝔱_reg`, that its centralizer is the conjugate torus, and that
intersections with `𝔱_reg` are exactly `W`-orbits. Regular alone is insufficient: the
centralizer of a regular nilpotent in `GL₂` is `ℂ*×ℂ`, not a torus. Keep this locus
separate from regular semisimple **group elements**, whose root hypertori lead to a
different toric arrangement.

Construct `χ:𝔤→Spec ℂ[𝔤]^G` and the restriction isomorphism
`ℂ[𝔤]^G ≃ ℂ[𝔱]^W`, with actual polynomial restriction maps. First construct the canonical
characteristic-zero splitting `𝔤=𝔷(𝔤)⊕[𝔤,𝔤]` and the corresponding symmetric-algebra tensor
isomorphism. Apply [LieHighestWeight Layer7](../RepresentationTheory/LieHighestWeight/README.md)'s
Lie Chevalley restriction only to the Killing-semisimple summand, at its actual hypotheses;
the Killing form of all `𝔤` need not be nondegenerate. Prove the infinitesimal-to-group
invariant comparison in each finite homogeneous rational subrepresentation: connectedness,
root-subgroup exponentials and torus weights in characteristic zero show Lie-fixed equals
`G`-fixed. Prove central invariants factor because the group action on `𝔷(𝔤)` is trivial.
Consume the finite-W invariant-algebra and quotient construction of
[ReflectionInvariantTheory](../ReflectionInvariantTheory/README.md), retaining degree-one
central coordinates, to obtain the actual affine quotient and its discriminant complement.
No canonical choice of polynomial invariant generators is asserted.

The base is the image of `𝔱_reg` in `𝔱/W`, the **discriminant complement**. It is not the
smooth locus of the full invariant quotient, which is already an affine space in this
setting. Construct all scheme morphisms before comparing their complex points via FCO's
lower analytification dictionary. Prove the coarse orbit-space homeomorphism
`𝔤_rs/G ≃ₜ 𝔱_reg/W`. This is a coarse quotient; the stack `[𝔤_rs/G]` retains torus inertia.

**11D. Cameral product, local trivializations and homogeneous fiber.** Construct the
pullback `E={(x,t)∈𝔤_rs×𝔱_reg | χ(x)=[t]}` and the map
`(G/T)×𝔱_reg→E`, `([g],t)↦(Ad_g(t),t)`. Prove that it is an algebraic isomorphism and a
homeomorphism/holomorphic isomorphism on complex points, including the coset-valued inverse.
The right `W` action is `([g],t)·w=([g n_w],w⁻¹t)` for a representative `n_w∈N_G(T)`.
Prove independence of representatives and the action law: the multiplication defect lies
in `T` and vanishes in `G/T`. No homomorphic splitting of `N_G(T)→W` is assumed; already
in compact `SU₂`, a nontrivial Weyl lift can have order4.

Prove `𝔤_rs ≃ ((G/T)×𝔱_reg)/W` through `[g,t]↦Ad_g(t)`, with the algebraic descent and
complex quotient topologies explicitly compared. A local section of the finite W-cover
trivializes `χ_rs:𝔤_rs→𝔱_reg/W` with fiber `G/T`. Supply actual inverse maps and transition
functions, continuity, and holomorphicity. The root-coordinate differential is
`(X mod 𝔱,Y)↦[X,t]+Y`; prove it is an isomorphism and apply FCO's lower analytic inverse
function dictionary. A set-theoretic orbit bijection alone does not prove these statements.

Construct `G/T→G/B` as a locally trivial bundle with contractible fiber `B/T≃U`, using
Layer7's ordered root coordinates. Consume the actual flag CW structure with only even
real-dimensional cells from [LieGroups Layer8](../RepresentationTheory/LieGroups/README.md). Prove connectedness
and `π₁(G/T)=0` through that bundle and the based LES. This includes arbitrary connected
complex reductive global forms; it does not assume `G` is simply connected, or infer a
topological theorem merely from algebraic simple connectedness. Use
[SmoothBundlesConnections B1.4](../SmoothBundlesConnections/README.md)'s actual closed-subgroup
quotient and principal projection when changing analytic models.

Apply [DGFloer Layer1.2](../DGFloer/README.md)'s based fiber sequence to the actual spectral
projection and chosen `x₀=Ad₁(t₀)`. Retain the terms
`π₂(B_W)→π₁(G/T)→π₁(𝔤_rs)→π₁(B_W)→π₀(G/T)` and their basepoints. The middle map induced
by `χ_rs` is an isomorphism because the fiber is connected and simply connected. No
vanishing of `π₂(B_W)` is needed. The generic bundle/LES supplier must construct the connecting maps and prove exactness;
a Serre-fibration lifting predicate alone does not supply those theorems.

**11E. Matrices, trace-zero centering and boundary cases.** Use native `Matrix.charpoly`,
its diagonal and conjugation equations and the actual trace-zero special-linear Lie
subalgebra. The maps are `A↦charpoly A`, `z↦∏_i(X−z_i)` and `z↦diagonal z`; prove the
regular-semisimple/separable-polynomial and distinct-configuration comparisons with actual
inverses. For GL_n versus SL_n conjugacy, determinant-normalize an invertible conjugator
by a diagonal centralizer element; no nth-root choice is required. Local simple-root
branches and spectral projectors `P_i(A)=∏_(j≠i)(A−λ_j I)/(λ_i−λ_j)` give the type-A
trivialization. Prove their idempotence, orthogonality, rank1, completeness and local frame
maps at precisely the simple-spectrum hypothesis.

For `n>0`, centroid `c(z)=n⁻¹∑_i z_i` gives equivariant inverse maps
`z↦(c(z),(z_i−c(z))_i)` and `(c,w)↦(w_i+c)_i`. Prove the ordered homeomorphism
`PConf_n(ℂ)≃ₜℂ×PConf_n^0(ℂ)`, its descent to unordered configurations and all cover/basepoint
squares. The contractible central factor induces the SL_n/GL_n configuration π₁ comparison.
For `n=0`, both configuration spaces are points and no reciprocal0 is used. For `n=1`,
centered configurations and `𝔰𝔩₁` are points, while the uncentered spaces are `ℂ`. For
`n=2`, identify centered ordered configurations with `ℂ*` via `(z,−z)`, unordered projection
with `z↦z²`, and match native `B₂≃ℤ`, its sign quotient and the square-generated pure subgroup.


**11F. Root-system and root-datum local systems.** Construct the associated locally
constant family `(𝔱_reg×Φ)/W` with its discrete root fiber, actual roots/coroots, pairing,
reflection and root-addition data. Also associate the full `X,Y` lattices and their perfect
pairing; do not replace them by the root/coroot lattices. Trivialize on finite-cover charts,
prove transition and descent equations, and pull back by `χ_rs` to compare with the roots
of the actual centralizer Cartan through `Ad_g`, independent of all representatives.

Pin the direction of monodromy. For the left deck action, native
`IsQuotientCoveringMap.fundamentalGroupToMulOpposite` lands in `W.op`. If the based lift ends
at `w·t₀`, composing with inverse/opposite gives ordinary W-valued monodromy `w⁻¹`; associated
root transport is `α↦w⁻¹α`. Prove concatenation and half-twist equations before comparing
with the Artin-to-W map. State the inverse/transpose transport on coroots so the pairing is
preserved; never silently erase native `.op`. Central isogenies transport the Lie algebra,
flags and essential arrangement through actual differential/quotient maps but need not
identify full character/cocharacter lattices. Central torus **Lie** summands are complex
vector spaces, and contribute no extra π₁.

**11G. Prerequisite and scope comparisons.** The order is IG's early configuration/native
braid contract and RootSystems' Coxeter/chamber theory → finite arrangement topology;
independent RG8/9 → FCO's lower dictionary → 11C invariant/spectral maps; RG7+LG8 flag cells →
homogeneous-fiber connectedness and simple connectedness; the based DGF LES → the
`χ_rs`-induced π₁ isomorphism; finite cover → actual root-datum monodromy. LHW Lie invariants
and RIT finite invariants enter 11C with the explicit comparisons stated there. No edge
returns to those lower targets. This constructs Lie-algebra regular-semisimple topology
over `ℂ`; it does not assert the corresponding statements for group-element toric
arrangements, disconnected groups, bad characteristic, compact-normalizer splittings,
infinite or affine Weyl arrangements, or arbitrary complex reflection groups. Their
carriers and hypotheses are different. In particular a list of all braid lengths3 is
not the full B3 presentation, whose short/long pair has length4.

References for these constructions include Brieskorn's finite-reflection-complement
presentation, Salvetti's face/chamber model, and the based covering and van Kampen
contracts cited above. The arrangement presentation and all comparison maps remain
construction targets until proved; references are not replacements for those proofs.

## Worked examples

Concrete Hopf algebras / group schemes that exercise and validate the definitions:
`𝔾_a`, `𝔾_m`, `μ_n`/`μ_p`, `GLₙ`, `SLₙ`, `PGLₙ`, `SOₙ`, `Sp₂ₙ`, and tori. Prove they are
reductive where applicable via `R_u = 1` / root data (the definition that works in all
characteristics), and *additionally* via complete reducibility only in characteristic 0
or for linearly reductive groups. Exercise the diagonalizable/Cartier-duality theory on
the multiplicative-type examples. Use `GLₙ` as a test case for the general theory, not as its
source.

## Design notes (from Zulip)

- The functor of points is the notion of points, not `GroupLike` and not only `k`-points.
- A faithful representation is a closed immersion; on coordinate rings this requires the
  matrix coefficients together with the determinant inverse, equivalently the coefficients
  of `V ⊕ Vˇ`, to generate `A`.
- Geometric notions (connectedness, unipotence, reductivity) are defined after base change
  to `k̄`.
- Keep typeclass hypotheses separate; admit non-smooth and non-reduced groups such as `μ_p`,
  and make smoothness explicit where required.
- Keep the Hopf-algebra, group-object, and functor-of-points views synchronized by explicit
  equivalences, as well as the representation–comodule dictionary.
- Kevin Buzzard's example-design caution: use `GLₙ` to test the general theory, not as its
  source.

## Downstream consumers

The downstream consumers include p-adic representation theory of `G(K)` (smooth and
admissible representations, Hecke algebras; Shurui Liu and others), the Langlands programme,
automorphic forms (Kevin Buzzard), and FLT. The dynamic parabolic API and BN-pair results
are useful interfaces for p-adic consumers before the full root-data classification exists.

The finite groups of Lie type consume Layer 9 through fixed points of Steinberg endomorphisms
on the points of pinned Chevalley–Demazure groups, or on explicit carriers identified with
those points. Their CFSG milestone L5 needs constructions rather than existence theorems.

## References

- J. S. Milne, *Algebraic Groups* (2017): a scheme-theoretic reference.
- W. C. Waterhouse, *Introduction to Affine Group Schemes*: Hopf algebras, comodules,
  closed subgroups, the unipotent radical.
- A. Borel, *Linear Algebraic Groups*; T. A. Springer, *Linear Algebraic Groups*.
- J. C. Jantzen, *Representations of Algebraic Groups*.
- B. Conrad, *Reductive Group Schemes* (SGA3 exposition); **SGA3**, Exposé XIX.
- B. Conrad, O. Gabber, G. Prasad, *Pseudo-reductive Groups* (relative theory).


## Design references

- [Algebraic groups discussion on Lean Zulip](https://leanprover.zulipchat.com/#narrow/channel/217875-Is%20there%20code%20for%20X%3F/topic/Algebraic%20groups): Hopf algebras, affine group schemes and convolution points.
- [Class and definition discussion for p-adic representations](https://leanprover.zulipchat.com/#narrow/channel/116395-maths/topic/class%20and%20def%20%28p-adic%20reps%29): separate hypotheses, dynamic parabolics and BN-pair interfaces.

## Acknowledgements

This roadmap builds directly on earlier discussions on the [Lean Zulip](https://leanprover.zulipchat.com/). In particular, Kevin Buzzard's guidance informs the separate typeclass hypotheses, Layer 0 interface statements, and use of GLn as a test example rather than as the source of the general theory:

- [#Is there code for X? > Algebraic groups](https://leanprover.zulipchat.com/#narrow/channel/217875-Is%20there%20code%20for%20X%3F/topic/Algebraic%20groups)
  (Michael Rothgang, Bryan Gin-ge Chen, Yaël Dillies), on the Hopf/group-scheme dictionary
  and the convolution-product work in mathlib4#39281.
- [#maths > class and def (p-adic reps)](https://leanprover.zulipchat.com/#narrow/channel/116395-maths/topic/class%20and%20def%20%28p-adic%20reps%29)
  (Kevin Buzzard, Shurui Liu, Stepan Nesterov), on dynamic parabolics, BN-pairs, and
  downstream p-adic representation consumers.

Thanks to everyone who contributed to those discussions and to the recurring guidance on
keeping typeclass assumptions separate.
