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
  group-scheme representation map and closed immersion with their full hypotheses, and
  Tannakian reconstruction.
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

The layers are ordered by mathematical prerequisites. Their target signatures are collected
in `Suggested.lean` with `sorry` where appropriate.

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
- **Tannakian reconstruction.** Recover the group from its tensor category of
  representations, consuming the existing comodule and matrix-coefficient foundations.
  Mathlib's representation-theory Tannaka material is a pattern source; the algebraic-group
  reconstruction statement and its precise hypotheses remain owned here.

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
  classification of semisimple groups by Dynkin diagrams; central isogenies and the
  isogeny theorem; Chevalley existence.
- **Relative theory over a base** and **pseudo-reductive groups**
  (Conrad–Gabber–Prasad).

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
- **The isomorphism theorem for pinned groups**: an isomorphism of root data lifts uniquely
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

---

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
