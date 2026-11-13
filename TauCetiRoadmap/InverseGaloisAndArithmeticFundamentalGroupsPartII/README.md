# Roadmap: inverse Galois theory and arithmetic fundamental groups, Part II: homological stability for Hurwitz spaces

**Summary.** This roadmap proves the homological stability theorem of Ellenberg, Venkatesh and
Westerland for Hurwitz spaces of branched covers of the disc with monodromy in a nonsplitting
conjugacy class `c` of a finite group `G`, and its arithmetic consequence, a bound on the étale
Betti numbers of Hurwitz schemes over `𝔽̄_q` that is uniform in the number of branch points. It
starts where
[InverseGaloisAndArithmeticFundamentalGroups](../InverseGaloisAndArithmeticFundamentalGroups/README.md)
stops: that roadmap builds the Hurwitz braid action, the braid-orbit monoid and the extraction of
class elements (its Layer IG.3), configuration spaces, the marked and unmarked topological Hurwitz
spaces, the arithmetic Hurwitz schemes and the comparison between complex and finite-field
cohomology for each fixed number `n` of branch points (its Layer IG.5), and it asserts no
homological stability. Here the connected components of all Hurwitz spaces are assembled into a
graded noncommutative algebra `R = k[S]` over a field `k` in which `|G|` is invertible; a central
element `U` of `R`, the sum over `g ∈ c` of the constant blocks `(g, …, g)` of length a multiple
of the order of `g`, stabilizes `R` itself (Layer 0). A Koszul-like complex `K(M)` attached to
every graded `R`-module controls the stability of `U` on `M` by two homology groups (Layer 1).
The arc complex of the punctured disc, highly connected by Hatcher–Wahl, resolves each Hurwitz
space (Layer 2), and the resulting spectral sequence has the K-complexes of the homology of
smaller Hurwitz spaces as rows (Layer 3). An induction on the homological degree proves that
`U` induces isomorphisms `H_p(Hur_n; k) → H_p(Hur_(n+deg U); k)` for `n > A p + B`, with
`A, B` independent of `k`, for marked, full-monodromy and unmarked Hurwitz spaces (Layer 4).
Finite cell models of configuration spaces then bound every Betti number by `C^(i+1)`, and the
fixed-degree comparisons of the parent roadmap transport this bound to the étale cohomology of
the Hurwitz schemes `Hn^c_{G,n}` over `𝔽̄_q` (Layer 5).

The end theorems are `hurwitz_homological_stability` (EVW Theorem 6.1 and Corollary 6.2),
`uniform_betti_bound` (EVW Proposition 2.5 with the topological part of Proposition 7.8) and the
uniform étale Betti bound (EVW Proposition 7.8). The companion [Suggested.lean](Suggested.lean),
in the namespace `TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroupsPartII`, states the
first two against the pinned Mathlib and Tau Ceti, in the braid-group-homology form of Layer 0,
together with the definitions they need; the étale bound is not statable there, because the
Hurwitz schemes are not available at the pins.

## Scope and ownership

This roadmap owns:

- the nonsplitting property of a conjugacy class and its basic example, the involution class of a
  group of order `2s` with `s` odd (Layer 0);
- the restriction of the Hurwitz action of `TauCeti.BraidGroup n` to the fibres of the marked and
  unmarked Hurwitz covers, the gluing maps along the block inclusion of braid groups (extended to
  the trivial group `B_0`), the identification of Hurwitz homology with braid-group homology with
  permutation coefficients, the component ring, the central stabilization sum and its stability on
  components (Layer 0);
- graded support degrees, central torsion and its defects, the change-of-rings estimates, graded
  Nakayama with support control, the K-complex, its generator homotopies, and the theorem that low
  K-homology controls stabilization, all for the component ring (Layer 1);
- the identification of the boundary-fixed mapping class group of the marked disc with
  `TauCeti.BraidGroup n`, the arc complexes `F(S; Δ, Λ) ⊇ A(S; Δ, Λ)` of a disc with finitely many
  boundary points `Δ` and interior points `Λ`, the based arc complex of the punctured disc, its
  truncated braid-coset model, the arc stabilizers and the connectivity of the arc complexes
  (Layer 2);
- the graded homology modules of Hurwitz spaces, the Borel arc resolution, the identification of
  its rows with K-complexes, the arc spectral sequence and its low-degree edge sequence
  (Layer 3);
- the inductive degree bound and homological stability for marked, full-monodromy and unmarked
  Hurwitz spaces, and the homology of the simultaneous-conjugation quotient (Layer 4);
- the finite cell models of the four Hurwitz variants, the uniform field Betti bound and the
  uniform étale Betti bound (Layer 5).

It does not own, and consumes by name:

- branch tuples, the Hurwitz braid action, the braid-orbit monoid and the extraction of an element
  of a single class: InverseGaloisAndArithmeticFundamentalGroups §IG.3.2 (*Branch tuples and Nielsen
  classes*, *The Hurwitz braid action*, *The braid-orbit monoid*, *Extracting an element of a single
  class*). Suggested.lean restates the Hurwitz action on the pinned braid group as
  `hurwitzAction`, because a roadmap module cannot be imported; it is the same action
  `(a, b) ↦ (a b a⁻¹, a)`, and the target is the parent's (§0.3);
- the asphericity of `Conf_n(𝔻)` with the identification of its fundamental group with
  `TauCeti.BraidGroup n` through which the Hurwitz spaces are defined, the marked topological
  Hurwitz spaces `Hur_{G,n}`, `Hur^c_{G,n}`, `CHur_{G,n}`, `CHur^c_{G,n}` and the forgetting of the
  boundary marking with its stabilizers `C_G(H)`: §§IG.5.1–IG.5.2 of the same roadmap;
- the arithmetic Hurwitz schemes, their complex comparison, the fixed-degree mod-`ℓ` comparison and
  the coefficient towers: §IG.5.3 (*Arithmetic Hurwitz stacks and schemes*, *Analytic and
  topological Hurwitz comparison*) and §IG.5.5 (*Fixed-degree Hurwitz mod-`ℓ` comparison*,
  *Coefficient towers and rational Betti dimensions*);
- the topological configuration spaces of the plane and of the open unit disc (`Conf_n(𝔻)` of
  §IG.5.1 is the same space), the `S_n`-equivariant homeomorphisms between them induced by
  `z ↦ z/√(1 + |z|²)`, the identification of `π_1(Conf_n(ℂ))` with `TauCeti.BraidGroup n` and the
  half-twist convention: ReductiveGroups Layer 11A; the finite Salvetti complex of a finite Weyl
  arrangement (a finite reduced crystallographic root pairing) and its comparison with the
  complexified complement: ReductiveGroups Layer 11B. The type-A poset model and its coarsening
  are therefore not built here; Layer 5 specializes the ReductiveGroups model to the Weyl group
  `W = S_n` of type `A_(n−1)` and lifts it to Hurwitz covers;
- homology of a `K(G, 1)` with local coefficients as group homology: ClassifyingSpaces Stage 4,
  items 16–17;
- singular homology, cellular homology, the Künneth theorem over a field, finite covers, transfer,
  Cartan–Leray and coinvariants for free actions of finite groups, the Serre spectral sequence,
  the exact sequence of a based pair, relative simplicial approximation, Hurewicz and Whitehead:
  AlgebraicTopology Layers 2, 4, 5 and 8;
- collars, tubular neighbourhoods, diffeomorphism groups of compact manifolds relative to the
  boundary, isotopy extension and the restriction fibration, cutting a surface along a proper arc,
  and Smale's disc theorem: GeometricTopology Layers 1 and 3 (§§3.3, 3.4) and §1.7.2;
- the block inclusions `TauCeti.BraidGroup.natAdd` and `TauCeti.BraidGroup.castAdd` of a braid
  group on the last and on the first strands of a larger one, with their values on generators
  `TauCeti.BraidGroup.natAdd_sigma` and `TauCeti.BraidGroup.castAdd_sigma`; the Serre fibrations
  `TauCeti.TopCat.serreFibrations` and the theorem that a locally trivial map is one; the
  diffeomorphism group `TauCeti.DiscDiff 2` of the disc fixing its boundary pointwise, CW
  approximation `TauCeti.cwApproximation` and the invariance of singular homology under weak
  homotopy equivalences, the thick realization `TauCeti.fatRealization` of a semisimplicial
  space, the abelian category
  `TauCeti.GradedModuleCat` of internally graded modules over a graded algebra, its shifts and
  graded free modules, and the graded balanced tensor product: Tau Ceti;
- the long exact sequences and spectral sequences of graded `Tor`: DGAInfinity Layer 5
  (gap:dga-graded-tor-spectral-sequences);
- group homology, representations, monoid algebras and their gradings, graded objects and
  spectral-sequence pages: Mathlib.

ArithmeticStatisticsPartVIII §5.16 states, for its own §5.19, the component-ring stability with
one exponent `D` for all subgroups, the graded `Tor` spectral sequences, the K-complex bound, the
arc spectral sequence, EVW Theorem 6.1 for the marked and full-monodromy Hurwitz spaces of every
nonsplitting pair, Corollary 6.2 for `CHur^c_{G,n}/G` with `G` centreless, the finite cell models
of `Hur^c_{G,n}`, `CHur^c_{G,n}` and (for centreless `G`) `CHur^c_{G,n}/G`, the field Betti bound
for `CHur^c_{G,n}/G` with `G` centreless, and the uniform étale Betti bound for every centreless
`G` and rational nonsplitting generating class; it imports nothing from this roadmap. Layers 0–5
prove these theorems in the generality stated here, which contains those statements, and beyond
them the unmarked stability of `Hur_n/G` and `CHur_n/G` for every finite `G` (§4.5), through the
homology of the conjugation quotient for a non-free action (§4.4), and the field Betti bound for
all four Hurwitz variants and every finite `G` (§5.2). Nothing here is cited from
ArithmeticStatisticsPartVIII, and every supplier of this roadmap precedes it in the build order.

A stabilization map that commutes with Frobenius, and limits of Cohen–Lenstra type over `𝔽_q(t)`
for fixed `q`, do not follow from the results here: the operator `U` is defined through gluing maps
of topological spaces, no algebraic form of it is constructed here, and the comparisons of Layer
IG.5 are for one `n` at a time.

## Conventions

- `G` is a finite group, `c` is a single conjugacy class of `G` (in Lean, `c : ConjClasses G`),
  and `d` is the common order of the elements of `c`. A *permitted field* is a field `k` in which
  `|G|` is invertible, that is `(Fintype.card G : k) ≠ 0`. In Suggested.lean `G` and `k` live in
  `Type`, because Mathlib's `groupHomology` takes the group, the coefficient ring and the module in
  one universe; every finite group is isomorphic to one in `Type`.
- Tuples are functions `Fin n → G`. The classical braid generators `σ_1, …, σ_(n−1)` are
  `TauCeti.BraidGroup.sigma i` for `i = 0, …, n − 2`. The positive Hurwitz move at positions
  `(i, i + 1)` replaces `(a, b)` by `(a b a⁻¹, a)`; its inverse replaces `(a, b)` by `(b, b⁻¹ a b)`.
  This is the convention of InverseGaloisAndArithmeticFundamentalGroups §IG.3.2 and of EVW (1.3.2)
  (EVW16 line 102). Exponents mean `g^h = h⁻¹ g h` (EVW16 line 341). Permutations compose from right
  to left and the ordered product of a tuple is `g_1 g_2 ⋯ g_n`, the boundary monodromy.
- `Hur_n` is the marked Hurwitz space `Hur^c_{G,n}` of §IG.5.2, with fibre `c^n` over the base
  configuration, including non-generating tuples and every boundary product; `CHur_n` is its
  full-monodromy subspace `CHur^c_{G,n}`, with fibre the tuples in `c^n` that generate `G`. No
  product-one condition is imposed. `X/G` is the quotient by simultaneous conjugation, which
  forgets the boundary marking. In Lean the fibre is `HurwitzFibre c false n` for `Hur_n`,
  `HurwitzFibre c true n` for `CHur_n`, and `UnmarkedFibre c full n` for the quotients.
- Gradings. The *internal* grading is the number `n` of branch points and is nonnegative; the
  homological degree of a complex is a separate index. The internal shift is `M[q]_n = M_(n−q)`,
  zero for `n < q` (EVW16 line 347). For a graded module `V`, `deg V` is the largest `n` with
  `V_n ≠ 0`, `deg 0 = −∞` and `deg V = +∞` for unbounded support; a bound `deg V ≤ b` means
  `V_n = 0` for every `n > b`. Internal shifts carry no Koszul signs.
- Constants. `D ≥ 1` is admissible when it satisfies §0.8; `a = D d` is the degree of `U_D`. Fix
  `A1 ≥ max(1, a, deg R[U], deg R/UR)` uniformly over all permitted fields, `A2 = A1 + a` and
  `A0 = 5 A1 + A2`. The lower bounds `A1 ≥ 1` and `A1 ≥ a` enlarge the constants (4.5.3) of EVW;
  see *Notes on the sources*.
- `Tor_i^R(N, M)` takes a graded right `R`-module `N` and a graded left `R`-module `M`; balanced
  tensor products over `R` are noncommutative. The augmentation `R → k` kills `R_+ = ⊕_(n>0) R_n`,
  and `H_i^aug(M) = Tor_i^R(k, M)`.
- The arc complex of the `n`-punctured disc has `q`-simplices only for `0 ≤ q < n`, and its
  augmentation is a point in degree `−1`. `K(M)` has every homological degree `q ≥ 0`. The arc
  spectral sequence is not augmented: its zeroth column on `E²` is `coker(K_2 → K_1)`, not
  `H_1(K)`.
- `U` acts on homology as the `k`-linear sum over `g ∈ c` of the gluing maps of the constant
  blocks `(g, …, g)` (§0.7). For `|c| ≥ 2` this is a sum of several maps of spaces; for a
  singleton class `c = {g}`, with `g` central, it is the single gluing map. No algebraic or
  Frobenius-compatible form of `U` is constructed or used.

## Exact supplier contracts

### From Mathlib

- `IsConj`, `ConjClasses`, `ConjClasses.mem_carrier_iff_mk_eq`, `ConjClasses.mk_eq_mk_iff_isConj`
  (`Mathlib/Algebra/Group/Conj.lean`): conjugacy and conjugacy classes, with `c.carrier` the set of
  elements of the class.
- `Subgroup.closure`, `MonoidHom.map_closure`, `Subgroup.map_top_of_surjective`
  (`Mathlib/Algebra/Group/Subgroup/`): generated subgroups and their images.
- `Sylow.isPretransitive_of_finite`, `IsPGroup.exists_le_sylow`, `Sylow.card_eq_multiplicity`
  (`Mathlib/GroupTheory/Sylow.lean`): Sylow conjugacy, containment of `p`-subgroups in Sylow
  subgroups and the order of a Sylow subgroup, used in §0.2.
- `MonoidAlgebra`, `MonoidAlgebra.single`, `MonoidAlgebra.mapDomainLinearMap`,
  `MonoidAlgebra.lhom_ext'` (`Mathlib/Algebra/MonoidAlgebra/`): the component ring is the monoid
  algebra of the braid-orbit monoid, and the permutation modules `k[X]` are monoid algebras of
  sets. `AddMonoidAlgebra.gradeBy` with its `GradedAlgebra` instance
  (`Mathlib/Algebra/MonoidAlgebra/Grading.lean`) and `MonoidAlgebra.toAdditiveAlgEquiv`
  (`Mathlib/Algebra/MonoidAlgebra/Basic.lean`) grade a monoid algebra by a homomorphism to `ℤ`.
- `Rep`, `Rep.ofMulAction`, `Rep.res`, `Rep.ofHom`, `Representation.ofMulAction`,
  `groupHomology`, `groupHomology.map` (`Mathlib/RepresentationTheory/`): representations, the
  permutation representation of an action, restriction along a homomorphism and group homology,
  functorial in a homomorphism `f : G →* H` together with a morphism `A ⟶ Rep.res f B`. Group
  homology is defined by inhomogeneous chains and is universe-monomorphic.
- `CategoryTheory.GradedObject` (`Mathlib/CategoryTheory/GradedObject.lean`): the carrier of
  internally graded families.
- `CategoryTheory.SpectralSequence` (`Mathlib/Algebra/Homology/SpectralSequence/Basic.lean`):
  pages and differentials only; it carries no convergence statement, which every use below proves
  separately.
- `CategoryTheory.Functor.leftDerived` (`Mathlib/CategoryTheory/Abelian/LeftDerived.lean`): left
  derived functors of an additive functor out of an abelian category with enough projectives;
  graded `Tor` is the left derived functor of the graded balanced tensor product of Tau Ceti.
- `IsCoveringMap` (`Mathlib/Topology/Covering/Basic.lean`), `FreeGroup`
  (`Mathlib/GroupTheory/FreeGroup/Basic.lean`), `Module.rank`.
- `AlgebraicGeometry.Scheme.EllAdicCohomology`
  (`Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean`): pro-étale `ℤ_ℓ`-cohomology of a
  scheme. It is not consumed: the étale bound of §5.3 uses the classical étale cohomology of the
  parent roadmap's suppliers, and the pins have no Hurwitz scheme to apply it to.

### From Tau Ceti

- `TauCeti.BraidGroup n`, the Artin–Tits group of type `A_(n−1)`, with `TauCeti.BraidGroup.sigma`,
  `TauCeti.BraidGroup.lift` and `TauCeti.BraidGroup.lift_sigma` (the presentation: a family
  satisfying far commutativity and the braid relation extends uniquely),
  `TauCeti.BraidGroup.sigma_mul_sigma_comm`, `TauCeti.BraidGroup.sigma_braid`,
  `TauCeti.BraidGroup.sigma_induction_on`, `TauCeti.BraidGroup.strand`,
  `TauCeti.BraidGroup.strandSucc`, `TauCeti.BraidGroup.permHom` and
  `TauCeti.BraidGroup.pureSubgroup`, all in the module
  `TauCeti.GroupTheory.SpecificGroups.Braid.Basic`. `BraidGroup 0` and `BraidGroup 1` are trivial.
- `TauCeti.BraidGroup.natAdd` and `TauCeti.BraidGroup.natAdd_sigma` (same module): for
  `m, n ≥ 0`, the homomorphism
  `TauCeti.BraidGroup.natAdd m : TauCeti.BraidGroup (n + 1) →* TauCeti.BraidGroup (m + n + 1)`
  places a braid on the last `n + 1` strands and sends `σ_i` to `σ_(m+i)`. It is defined only on
  braid groups with at least one strand, and neither its injectivity nor its image is pinned.
- `TauCeti.BraidGroup.castAdd` and `TauCeti.BraidGroup.castAdd_sigma` (same module): for
  `m, n ≥ 0`, the homomorphism
  `TauCeti.BraidGroup.castAdd m : TauCeti.BraidGroup (n + 1) →* TauCeti.BraidGroup (n + m + 1)`
  places a braid on the first `n + 1` strands and keeps the index of each generator.
- `TauCeti.TopCat.serreFibrations` (`TauCeti/Topology/Homotopy/SerreFibration/Basic.lean`): the
  Serre fibrations, as the `MorphismProperty` of `TopCat` given by the right lifting property
  against the inclusions `Dⁿ → Dⁿ × I` of the discs as bottoms of their cylinders; and
  `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`
  (`TauCeti/Topology/Homotopy/SerreFibration/FiberBundle.lean`): a map of `TopCat` whose base is
  covered by the base sets of trivializations with a fixed fibre is a Serre fibration, with no
  hypothesis on the base. No exact sequence of homotopy groups of a fibration is pinned; §2.1
  combines this lifting property with the exact sequence of a based pair (AlgebraicTopology §8.1,
  on Tau Ceti's `TauCeti.BasedTopPair` and `TauCeti.RelHomotopyGroup`).
- `TauCeti.DiscDiff 2` (`TauCeti/Geometry/Diffeomorphism/Disc.lean`): the group of smooth
  diffeomorphisms of the closed unit disc of `ℝ²` fixing the unit circle pointwise, the fixing
  subgroup `TauCeti.RelativeDiff` of the boundary, closed by `Diffeomorph.isClosed_fixingSubgroup`,
  with the subspace topology of the weak Whitney topology (the `C^∞` topology, the disc being
  compact). It is a topological group as a subgroup of the diffeomorphism group of the compact
  disc, which is one by `Diffeomorph.isTopologicalGroup`
  (`TauCeti/Geometry/Diffeomorphism/Inversion.lean`). Nothing about its homotopy type is pinned.
- `TauCeti.cwApproximation`, `TauCeti.cwApproximationMap` and
  `TauCeti.isWeakHomotopyEquivalence_cwApproximationMap`
  (`TauCeti/AlgebraicTopology/Homotopy/CWApproximation/Basic.lean`): for a based space `X`, a CW
  complex with a map to `X` that is a weak homotopy equivalence when `X` is path connected; and
  `ContinuousMap.IsWeakHomotopyEquivalence.isIso_singularHomologyMap`
  (`TauCeti/AlgebraicTopology/Singular/Homotopy/WeakHomotopyEquivalence.lean`): a weak homotopy
  equivalence induces isomorphisms on singular homology with coefficients in any ring. Used in
  §0.5, where `Conf_n` is path connected for every `n ≥ 0`.
- `TauCeti.fatRealization`, `TauCeti.fatRealizationFunctor` and `TauCeti.fatRealization.augment`
  (`TauCeti/AlgebraicTopology/FatRealization.lean`): the thick (fat) realization `‖X‖` of a
  semisimplicial space `X : SemiSimplexCategoryᵒᵖ ⥤ TopCat` (Mathlib `SemiSimplexCategory`, no
  degeneracies), the quotient of `Σ_q X_q × Δ^q` by the face identifications, with its
  characteristic maps `TauCeti.fatRealization.ι`, its functoriality, and the map `‖X‖ → Z` induced
  by an augmentation `X → const Z`. Its skeletal filtration and homology spectral sequence are not
  pinned.
- `TauCeti.GradedModuleCat 𝒜` (`TauCeti/Algebra/Category/GradedModuleCat/Basic.lean`): for a
  `k`-algebra `A`, not necessarily commutative, with a family `𝒜 : ℤ → Submodule k A`, the
  category of `A`-modules with an internal `ℤ`-grading on which `𝒜_i` raises degrees by `i`,
  morphisms of degree zero; its `Abelian` instance (`Abelian.lean`), the shift
  `TauCeti.GradedModuleCat.shiftFunctor n` with `(M{n})_p = M_(p−n)` and no sign (`Basic.lean`),
  graded free modules on homogeneous generators and the instance
  `TauCeti.GradedModuleCat.enoughProjectives` (`Free.lean`). Gradings are
  `TauCeti.InternalGrading`, built from a direct-sum decomposition by
  `TauCeti.InternalGrading.ofDecomposition`; `TauCeti.InternalGrading.opposite` grades the opposite
  algebra and `TauCeti.trivialGrading` grades `k` in degree zero. No positivity of the grading and
  no finite dimension is assumed; the nonnegatively supported modules used here form a full
  subcategory.
- `TauCeti.BalancedTensorProduct k A M N` (`TauCeti/LinearAlgebra/TensorProduct/Balanced/`): for a
  right `A`-module `M` (a `Module Aᵐᵒᵖ M`) and a left `A`-module `N`, the quotient of `M ⊗_k N` by
  `m a ⊗ n − m ⊗ a n`, with `TauCeti.BalancedTensorProduct.balance`, the universal property
  `TauCeti.BalancedTensorProduct.liftEquiv`, the grading
  `TauCeti.BalancedTensorProduct.grading` with `|m ⊗ n| = |m| + |n|` and no Koszul sign, and the
  evaluations `TauCeti.BalancedTensorProduct.lid`, `TauCeti.BalancedTensorProduct.rid` and
  `TauCeti.BalancedTensorProduct.finsuppScalarRight` on regular and free modules. As a functor,
  `TauCeti.GradedModuleCat.bimoduleModuleTensor` sends a graded `(A, B)`-bimodule and a graded left
  `B`-module to a graded left `A`-module, additively in the module; with `A = k` graded by
  `TauCeti.trivialGrading`, a graded right `R`-module `N` gives the additive functor `N ⊗_R −`
  whose left derived functors are graded `Tor_i^R(N, −)`.

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

- §IG.3.2, *The Hurwitz braid action*: the left action of `B_r` on `G^r`
  by positive moves, preserving the ordered product, the generated subgroup and the multiset of
  classes.
- §IG.3.2, *The braid-orbit monoid*: `c`-valued tuples of every length
  modulo braids, with concatenation; it contains the empty tuple and non-generating tuples, and a
  tuple of product one is central.
- §IG.3.2, *Extracting an element of a single class*: for `c` a single class generating `G` there
  is `N(G, c)` such that every generating tuple in `c^n`, `n ≥ N`, is braid equivalent to a tuple
  `(g, g_2, …, g_n)` for any prescribed `g ∈ c`, with `(g_2, …, g_n)` still generating.
- §IG.5.1, *Ordered and unordered configurations* and *Configurations and punctured-disc groups*:
  `Conf_n(𝔻)` is aspherical with fundamental group `TauCeti.BraidGroup n`, the adjacent exchanges
  corresponding to `TauCeti.BraidGroup.sigma`, with the orientation left to §IG.3.2. Through this
  identification §IG.5.2 defines `Hur_n` and §0.5 computes its homology. Layer 2 uses the
  identification of ReductiveGroups Layer 11A instead, and no statement here compares the two
  (§2.1).
- §IG.5.2, *Marked topological Hurwitz spaces*: `Hur_{G,n} = Ẽ ×_{B_n} G^n` and its subcovers with
  fibres `c^n`, generating tuples, and generating tuples in `c^n`; §IG.5.2, *Forgetting the boundary
  marking*: `G` acts by simultaneous conjugation, the quotient forgets the boundary marking, and
  the stabilizer of a tuple with exact image `H` is `C_G(H)`.
- §IG.5.3, *Arithmetic Hurwitz stacks and schemes*: the tame Hurwitz schemes over `ℤ[1/|G|]`,
  with exactly `n` branch points, including the variant with affine branch locus that is ramified
  or unramified at `∞`, which is EVW's `Hn_{G,n}`, and the open and closed loci over `ℤ[1/|G|]`
  defined by rational classes; §IG.5.3, *Analytic and topological Hurwitz comparison*: for
  centreless `G`, the complex points of `Hn_{G,n}` are `CHur^{c₁}_{G,n}/G`, `c₁ = G ∖ {1}`, for the
  Hurwitz space of the plane, the construction of §IG.5.2 with the disc replaced by `ℂ` and the
  boundary base point near `∞`. The branch locus is exact, so tuples with an identity entry are not
  points of the scheme. That target does not state the complex points of the class loci of the
  unmarked scheme, nor compare the plane with the disc; §5.3 derives both.
- §IG.5.5, *Fixed-degree Hurwitz mod-`ℓ` comparison*: for centreless `G`, a rational class `c`
  generating `G`, `q` prime to `|G|`, fixed `n` and a prime `ℓ > max(|G|, q, n)`, an isomorphism
  `H^i(Hn^c_{G,n}(ℂ), ℤ/ℓ) ≅ H^i_ét(Hn^c_{G,n} ⊗ 𝔽̄_q, ℤ/ℓ)` for every `i`; §IG.5.5, *Coefficient
  towers and rational Betti dimensions*: the same at every level `ℤ/ℓ^a`, compatibly, and the rank
  of finitely generated `ℤ_ℓ`-cohomology is at most the mod-`ℓ` dimension.

### From TauCetiRoadmap.ReductiveGroups

- Layer 11A: the plane configuration spaces `PConf_n(ℂ)` and `Conf_n(ℂ)`, the finite covering
  `PConf_n(ℂ) → Conf_n(ℂ)`, and the based isomorphism `π_1(Conf_n(ℂ)) ≅ TauCeti.BraidGroup n`
  sending the counterclockwise half twist of the points `i` and `i + 1` of the base configuration
  `z_j = j`, `0 ≤ j ≤ n − 1`, to `TauCeti.BraidGroup.sigma i`, with Mathlib's product
  `p * q = q.trans p` of loops. Layer 11A also constructs `PConf_n` and `Conf_n` of the open unit
  disc and the `S_n`-equivariant homeomorphisms with the plane ones induced by
  `z ↦ z/√(1 + |z|²)`, with inverse `w ↦ w/√(1 − |w|²)`; this roadmap takes as base
  configuration of the disc the image `z_j = j/√(1 + j²)`, `0 ≤ j ≤ n − 1`, of the plane one.
- Layer 11B: for a finite reduced crystallographic root pairing with a base (a finite Weyl
  arrangement; type `A_(n−1)`, with Weyl group `S_n`, is the case used here), the face/chamber
  Salvetti model with its comparison with the complexified root-hyperplane complement by
  Salvetti's explicit homotopy, at least on two-skeleta, its quotient with one vertex and one
  one-cell per simple wall, and the based identification of the fundamental group of the quotient
  with the Artin group.

What ReductiveGroups must provide (gap:reductive-salvetti-homotopy-type): in Layer 11B, for a
finite reduced crystallographic root pairing, the full `W`-equivariant homotopy equivalence between
the Salvetti complex and the complexified complement (not only its two-skeleton), and the cell
count of the quotient complex, one cell of dimension `|T|` for each subset `T` of the simple
reflections.

### From TauCetiRoadmap.ClassifyingSpaces

- Stage 4, items 16–17: for a `K(G, 1)` CW complex the augmented cellular chains of its universal
  cover are a free resolution of `ℤ`, and the homology with local coefficients in a `G`-module `M`
  is Mathlib's `groupHomology` of `M`, naturally in both variables and compatibly with long exact
  sequences.

### From TauCetiRoadmap.AlgebraicTopology

- Layer 2: singular chains and homology with coefficients in a field; `H_0` is free on path
  components.
- Layer 4: CW complexes, cellular homology and its comparison with singular homology (§§4.1–4.3),
  and the realization CW structure of a simplicial set (§4.7).
- §5.1: the cross product and Künneth isomorphism over a field. §5.3: finite covers and transfer;
  the homology of a finite cover as the homology of the base with coefficients in the permutation
  local system of a fibre, also for a nonregular cover; and, for a regular finite cover
  `E → E/Γ`, that is a free action of a finite group `Γ` whose deck action is simply transitive on
  each fibre, the Cartan–Leray spectral sequence and, when `|Γ|` is invertible in `k`, the
  identification `H_*(E/Γ; k) ≅ H_*(E; k)_Γ`. This comparison is stated for free actions only;
  the simultaneous conjugation of `G` on `Hur_n` is not free, and its quotient is treated in
  §4.4. §5.5: the Serre spectral sequence of a fibre bundle.
- Layer 8: the long exact sequence of a based pair (§8.1), relative simplicial approximation
  (§8.2), and the Hurewicz and Whitehead theorems (§§8.3–8.5).

What AlgebraicTopology must provide (gap:algtop-semisimplicial-realization): in Layer 4, for the
thick realization `TauCeti.fatRealization` of a semisimplicial space `X` (pinned), its skeletal
filtration and the natural first-quadrant homology spectral sequence
`E¹_(q,p) = H_p(X_q; k) ⇒ H_(p+q)(‖X‖; k)` with `d¹` the alternating sum of the face maps,
convergent since each total degree has finitely many terms.

What AlgebraicTopology must provide (gap:algtop-borel-construction): in Layer 5, the Borel
construction `EΓ ×_Γ X` of a discrete group acting on a space, functorial along a homomorphism
together with an equivariant map, the induced-space equivalence
`EΓ ×_Γ (Γ/Λ × Y) ≃ EΛ ×_Λ Y` for a subgroup `Λ`, and the associated bundle with fibre the
realization of a semisimplicial `Γ`-set.

What AlgebraicTopology must provide (gap:algtop-join-connectivity): in Layer 8, the connectivity of
a join of simplicial complexes, `conn(X * Y) ≥ conn X + conn Y + 2` including the empty
(`(−2)`-connected) and nonempty (`(−1)`-connected) boundary cases, and the criterion that a
simplicial complex is `m`-connected when every simplicial map from a triangulated `k`-sphere,
`k ≤ m`, extends over a triangulated disc.

### From TauCetiRoadmap.GeometricTopology

- Layer 1: collar and tubular neighbourhood theorems for smooth manifolds with boundary.
- Layer 3: the group `Diff(M, ∂M)` of a compact manifold with the `C^∞` topology, fixing the
  boundary pointwise, as a topological group.
- §3.3, *Isotopy extension*: for a compact manifold `N` and a boundaryless manifold `M`, the
  restriction fibration: `Diff_c(M) → Emb(N, M)`, `g ↦ g ∘ e`, has continuous local sections near
  `e`, its orbits are open and it is a locally trivial principal bundle; with relative and
  continuous isotopy extension. §2.1 uses it with `N` a finite set and `M = int D`, where
  `Emb(N, M)` is the ordered configuration space.
- §1.7.2, the cutting bullet: the complement of an open tube of a proper arc in a compact surface,
  its Euler characteristic and boundary circles, and the restriction to it of diffeomorphisms that
  are the identity on a closed tube of the arc.
- §3.4, Smale's disc theorem: the diffeomorphisms of the square `[0, 1]²` equal to the identity on
  a neighbourhood of the boundary form a contractible space (SMA59 Theorem B and Theorem 4), and a
  diffeomorphism of `D²` equal to the identity near `∂D²` is smoothly isotopic to the identity
  through such diffeomorphisms.

What GeometricTopology must provide (gap:geomtop-boundary-pointwise-disc-smale): in §3.4, Smale's
disc theorem in the boundary-pointwise form, that `TauCeti.DiscDiff 2` is weakly contractible. A
route: the subgroup `Diff_c(D²)` of diffeomorphisms equal to the identity on a neighbourhood of
`∂D²` is weakly contractible by the collar-fixing form, and its inclusion into
`TauCeti.DiscDiff 2` is a weak homotopy equivalence, by straightening compact families near `∂D²`
along a collar through homotopies that keep members of `Diff_c(D²)` inside it. `Diff_c(D²)` is not
closed in `TauCeti.DiscDiff 2`, so it is not a retract of it (§2.1, Checks).

What GeometricTopology must provide (gap:geomtop-arc-isotopy-extension): in §3.3, for a compact
surface `F` with boundary, a finite set `Λ` of interior points and a finite system of smooth arcs
from points of `∂F` to points of `Λ`, with interiors in `int F ∖ Λ` and disjoint except at common
endpoints: isotopy extension for such systems relative to `∂F ∪ Λ` (§3.3 states it for compact
sources in boundaryless targets), and the cut surface along such a system as a compact surface, to
which a diffeomorphism fixing `∂F` and the arcs pointwise restricts, with two arcs disjoint from
the system isotopic in the cut surface when they are isotopic in `F` relative to `∂F ∪ Λ` (the
cutting of §1.7.2 is along one proper arc).

What GeometricTopology must provide (gap:geomtop-marked-disc-diffeomorphisms): in Layer 3, the
closed subgroup `Diff(D, P; ∂D)` of `Diff(D, ∂D) = TauCeti.DiscDiff 2` preserving a finite set
`P` of interior points setwise, and the bijectivity of the homomorphism
`π_0 Diff(D, P; ∂D) → Mod(D, P)` to the topological mapping class group of the marked disc
relative to `∂D` defined in §2.1.

### From TauCetiRoadmap.DGAInfinity

- Layer 5: derived tensor products and semi-free resolutions.

The graded modules, their shifts, graded free modules and the graded balanced tensor product are
Tau Ceti's (*From Tau Ceti*), without Koszul signs, and graded `Tor_i^R(N, −)` is
`CategoryTheory.Functor.leftDerived` of the additive functor `N ⊗_R −` on
`TauCeti.GradedModuleCat`; DGAInfinity is consumed only for the homological algebra of that `Tor`.

What DGAInfinity must provide (gap:dga-graded-tor-spectral-sequences): in Layer 5, for a connected
nonnegatively graded `k`-algebra `R`, not necessarily commutative, and graded `Tor_i^R(N, M)` of
a graded right module `N` and a graded left module `M` defined as above: its computation by a
graded free resolution of either variable, the long exact sequences in either variable, the
composite-functor spectral sequence `Tor_i^(R̄)(k, Tor_j^R(R̄, M)) ⇒ Tor_(i+j)^R(k, M)` for a
quotient `R → R̄ → k`, and the hyperhomology spectral sequence of a bounded-below complex of
right modules tensored with a left module, all preserving the internal grading and with
finite-diagonal convergence. ArithmeticStatisticsPartVIII §5.16 (*Tor spectral sequences over
graded algebras*) states the same spectral sequences for its own use; their generic form is
DGAInfinity's, and this roadmap takes it from there.

## How to read the build

Layer 0 is algebra on tuples: the nonsplitting property, the Hurwitz representation of the
braid group on the fibres, gluing, the identification of Hurwitz homology with braid-group
homology, the component ring `R` and the central sum `U`, and the stability of `U` on `R`. Layer
1 is graded homological algebra over `R`: from the finiteness of `R/UR` and `R[U]` it proves
that the K-complex of any graded `R`-module has linearly growing homology once its first two
homology groups are bounded, and that `U` is then an isomorphism in high degrees. Layer 2 is the
topology of the punctured disc: mapping classes, arcs, their combinatorial coset model, stabilizers
and connectivity. Layer 3 uses the arc complex to resolve each Hurwitz space and identifies the
rows of the resulting spectral sequence with K-complexes. Layer 4 runs the induction and proves
stability for all three kinds of Hurwitz spaces. Layer 5 bounds the number of cells of each
Hurwitz space and turns stability into uniform Betti bounds, topological and étale. Layers 1
and 2 are independent of each other; Layer 3 needs both.

## Layer 0: nonsplitting classes, the Hurwitz representation and the component ring

This layer fixes the algebra of `c`-valued tuples. Its Lean definitions make the stability
theorems of Layer 4 statable.

### 0.1 Nonsplitting classes

Define `IsNonsplitting c` for a conjugacy class `c` of a group `G`: `c` generates `G`, and for
every subgroup `H ≤ G` any two elements of `c ∩ H` are conjugate by an element of `H`. Because `c`
is a single class of `G`, the intersection `c ∩ H` is stable under conjugation by `H`, so the
second condition says exactly that `c ∩ H` is empty or a single conjugacy class of `H`
(EVW16 Definition 3.1, p. 12; EVW16 line 537). *Needs:* Mathlib `ConjClasses`, `Subgroup.closure`.

- `IsNonsplitting c` implies that `c` generates `G`.
- The pairwise-conjugacy formulation is equivalent to the empty-or-one-class formulation, given
  that `c` is a whole conjugacy class of `G`.
- If `c ∩ H` is nonempty and generates `H`, the class `c ∩ H` of `H` is nonsplitting in `H`.
- A group isomorphism carries a nonsplitting class to a nonsplitting class.

**Checks.**

- For the trivial group and `c = {1}` the property holds: `c` generates and every intersection is
  `{1}`.
- In `S₃` the transposition class is nonsplitting: the subgroups are `S₃`, `A₃`, the three groups
  of order two and the trivial group, with intersections `c`, `∅`, one transposition and `∅`.
- In `S₄` the transposition class is not nonsplitting: `H = ⟨(12), (34)⟩` is abelian and contains
  the two transpositions `(12)` and `(34)`, which are not conjugate in `H`. For this class the
  number of components of `Hur^c_{S₄,n}` grows at least linearly in `n` (EVW16 line 131).
- In `C₆` the class of the involution has the subgroup property but does not generate, so it is not
  nonsplitting; a definition without generation would accept it.
- In `A₄` one class of 3-cycles is nonsplitting: its intersection with each subgroup of order three
  is a single element, and it misses the Klein four-group.

### 0.2 The involution class of a group of order `2s`

Prove: if `|G| = 2s` with `s` odd, the elements of order two form one conjugacy class `c`, and if
`c` generates `G` then `c` is nonsplitting (EVW16 Lemma 3.2, p. 12; EVW16 line 544). *Proof
sketch.* The Sylow 2-subgroups have order two and are conjugate, so their nonidentity elements form
the unique class of involutions; a subgroup `H` containing an involution has order `2s'` with `s'`
odd, and the same argument in `H` shows `c ∩ H` is one class of `H`. *Needs:* §0.1; Mathlib
`Sylow.isPretransitive_of_finite`, `IsPGroup.exists_le_sylow`, `Sylow.card_eq_multiplicity`.

**Checks.**

- `S₃` and every dihedral group of order `2s` with `s` odd satisfy both hypotheses.
- `C₆` has order `2 · 3` and a unique involution, which does not generate: generation is not a
  consequence of the order condition.
- In `S₄`, of order `24`, the involutions form two classes, and the order hypothesis fails.

### 0.3 The Hurwitz representation on the fibres

The Hurwitz action of `TauCeti.BraidGroup n` on `Fin n → G`, the generator `σ_i` acting by the
positive move `(a, b) ↦ (a b a⁻¹, a)` at positions `i, i + 1`, with its far commutativity, its braid
relation and the invariance of the ordered product (exactly, not only up to conjugacy), of the
generated subgroup and of the multiset of classes, is InverseGaloisAndArithmeticFundamentalGroups
§IG.3.2 *The Hurwitz braid action*. Suggested.lean needs it on the pinned braid group to state the
headline theorems and carries it under these names: the positive move `hurwitzMoveFun i`, replacing
the entries at the positions `TauCeti.BraidGroup.strand i` and `TauCeti.BraidGroup.strandSucc i`,
its inverse `hurwitzMoveInvFun i`, the permutation `hurwitzMove i`, the relations
`hurwitzMove_comm` and `hurwitzMove_braid`, and `hurwitzAction n G`, the homomorphism
`TauCeti.BraidGroup n →* Equiv.Perm (Fin n → G)` given by `TauCeti.BraidGroup.lift`. Two transfer
principles follow from `TauCeti.BraidGroup.sigma_induction_on`: a property of tuples preserved by
every move is preserved by every braid (`hurwitzAction_iff`), and a map of tuples that intertwines
each move with the image of `σ_i` under a homomorphism of braid groups intertwines every braid
(`hurwitzAction_comm`).

Define the fibre `HurwitzFibre c full n` of tuples with entries in `c`, generating `G` when `full`
holds (fields `HurwitzFibre.tuple`, `HurwitzFibre.mem`, `HurwitzFibre.gen`), with the braid action
`HurwitzFibre.instMulAction`; the simultaneous conjugation `conjFibre h`, the relation
`conjSetoid`, and the unmarked fibre `UnmarkedFibre c full n`, its quotient, with the induced action
`UnmarkedFibre.instMulAction` and class map `UnmarkedFibre.mk` (EVW16 Definition 2.2 and §2.4,
pp. 9–11; EVW16 lines 399–416). *Needs:* §IG.3.2 *The Hurwitz braid action*; Tau Ceti
`TauCeti.BraidGroup.lift`, `TauCeti.BraidGroup.sigma_induction_on`; Mathlib `ConjClasses`,
`Subgroup.closure`.

- The generator `σ_i` acts on a fibre point by the `i`-th move of its tuple.
- A move preserves the condition that all entries lie in `c` (`hurwitzMoveFun_mem_iff`) and the
  generated subgroup (`closure_range_hurwitzMoveFun`); hence every braid preserves the fibre
  conditions (`hurwitzFibre_prop_iff`), and the action on fibres is computed on tuples.
- A conjugacy class is closed under conjugation (`conj_mem_carrier`); moves commute with
  simultaneous conjugation (`hurwitzMoveFun_conj`), so the braid action commutes with it
  (`smul_conjFibre`) and descends to classes, where it is computed on representatives.
- The ordered product of a fibre point is invariant under the braid action, and simultaneous
  conjugation by `h` conjugates it by `h`.

**Checks.**

- For `a = (12)` and `b = (23)` in `S₃` the move gives `((13), (12))`, not the plain swap
  `((23), (12))`; both tuples have product `(123)`.
- For `G = S₃`, `c` the transpositions and `n = 2`, the fibre `c²` has nine points and five braid
  orbits: the three constant pairs are fixed, and the six others form two orbits of size three,
  with boundary products `(123)` and `(132)`. The fibre `HurwitzFibre c true 2` has six points,
  since the constant pairs generate only a group of order two.
- In the same case the unmarked fibre has two points: the constant pairs form one conjugation
  orbit, and the six non-constant pairs another, on which `S₃` acts freely because
  `C_{S₃}(S₃) = 1`.
- At `n = 0` the fibre is the empty tuple; `HurwitzFibre c true 0` is empty unless `G` is trivial,
  because the empty tuple generates the trivial subgroup.
- For `G = C₂` with its nontrivial class every fibre `c^n` is a single point fixed by every braid,
  so the Hurwitz space is `Conf_n` itself.

### 0.4 The block inclusion and gluing

The block inclusion `B_n → B_(m+n)` on the last `n` strands, `σ_i ↦ σ_(m+i)`, is Tau Ceti's
`TauCeti.BraidGroup.natAdd m` for `n ≥ 1` (`TauCeti.BraidGroup.natAdd_sigma`). Define
`shiftHom m n : TauCeti.BraidGroup n →* TauCeti.BraidGroup (m + n)` as
`TauCeti.BraidGroup.natAdd m` for `n ≥ 1` and as the trivial homomorphism out of `B_0 = 1` for
`n = 0`, so that gluing and stabilization are defined for every `n`; it sends `σ_i` to `σ_(m+i)`,
by `TauCeti.BraidGroup.natAdd_sigma`, there being generators only for `n ≥ 2`. Prove that
concatenation with a fixed prefix of length `m` is equivariant along
it (`hurwitzAction_shift`). Define `glue c full m g`, which prepends the constant block
`(g, …, g)` of length `m` to a fibre point; it preserves the class
condition and generation, is equivariant along the block inclusion (`glue_smul`), and satisfies
`glue g (h s h⁻¹) = h · glue (h⁻¹ g h) s · h⁻¹` (`glue_conjFibre`). Geometrically, for a fixed
point `t ∈ c^m` the map `Hur_n → Hur_(m+n)` induced on Borel constructions by
`(shiftHom m n, t ++ −)` glues the cover with monodromy `t` to the left. The general gluing
`Hur_m × Hur_n → Hur_(m+n)` is induced on Borel constructions by concatenation and the
homomorphism `B_m × B_n → B_(m+n)`, `(x, y) ↦ x' · shiftHom m n y`, where `x'` is the image of `x`
under `TauCeti.BraidGroup.castAdd n` on the first `m` strands for `m ≥ 1` and `x' = 1` for
`m = 0`; the two images commute by `TauCeti.BraidGroup.sigma_mul_sigma_comm`, since the native
generator indices of the first are at most `m − 2` and those of the second at least `m`. This
gluing is associative and unital up to homotopy, so it makes the union of the Hurwitz spaces an
H-space and is associative and unital on homology, and it is equivariant for simultaneous
conjugation (EVW16 §2.6, pp. 11–12; EVW16 lines 509–517). *Needs:* §0.3; Tau Ceti
`TauCeti.BraidGroup.natAdd`, `TauCeti.BraidGroup.natAdd_sigma`, `TauCeti.BraidGroup.castAdd`,
`TauCeti.BraidGroup.castAdd_sigma`, `TauCeti.BraidGroup.sigma_mul_sigma_comm`; §IG.5.2 *Marked
topological Hurwitz spaces*; AlgebraicTopology Layer 5 (gap:algtop-borel-construction) for the
gluing of spaces.

- The glued tuple has boundary product `∂t · ∂s`, in this order, and generated subgroup
  `⟨⟨t⟩, ⟨s⟩⟩`.
- The two three-fold gluings are homotopic, hence equal on homology; the empty tuple is a unit up
  to homotopy.
- Gluing commutes with simultaneous conjugation of both inputs.

**Checks.**

- Gluing the empty tuple on the left is the identity on tuples, and `shiftHom 0 n` is the identity
  of `B_n`.
- For `m = 1`, `shiftHom 1 2` sends the generator `σ_1` of `B_2` (native index `0`) to `σ_2` of
  `B_3` (native index `1`), not `σ_1`: the block sits on the last strands, whereas the inclusion
  that adds a strand at the end keeps the index.
- For `n = 0`, `shiftHom m 0` is the trivial homomorphism out of `B_0 = 1`, the one length the
  pinned block inclusion does not cover; gluing `(g, …, g)` then sends the empty tuple to the
  constant tuple of length `m`, which is a point of `HurwitzFibre c false m`.
- Gluing a tuple generating a proper subgroup `H` with an element outside `H` leaves the stratum of
  exact image `H`, so gluing does not preserve exact-image strata.
- For `m = n = 2` the two blocks of `B_4` are generated by the native `σ_0` (from `castAdd`) and
  `σ_2` (from `shiftHom 2 2`); `0 + 2 ≤ 2`, so they commute. Placing the first factor by
  `TauCeti.BraidGroup.natAdd` as well would send both native `σ_0` to the same `σ_2`, and the map
  `B_2 × B_2 → B_4` would not be the block inclusion.

### 0.5 Hurwitz homology as braid-group homology

Prove: for every finite `B_n`-set `X`, the covering space `Ẽ ×_{B_n} X → Conf_n` associated with
`X` has
`H_p(Ẽ ×_{B_n} X; k) ≅ H_p(B_n; k[X])` (Mathlib `groupHomology` of `Rep.ofMulAction k (B_n) X`),
naturally in `X`; for a homomorphism `f : B_n → B_m` and an `f`-equivariant map `X → Y` the induced
map of Borel constructions corresponds to `groupHomology.map`. Applied to the fibres of §0.3 this
identifies `H_p(Hur_n; k)`, `H_p(CHur_n; k)`, `H_p(Hur_n/G; k)` and `H_p(CHur_n/G; k)` with braid-group
homology with coefficients in `k[HurwitzFibre c false n]`, `k[HurwitzFibre c true n]` and
`k[UnmarkedFibre c full n]`; the quotient `Hur_n/G` is the covering space with fibre
`c^n/G`, because the conjugation action on the fibre commutes with the braid action. Applied to
`glue` it identifies the gluing of a component with `groupHomology.map (shiftHom m n)` of the map
of permutation modules (EVW16 §2.2, p. 10, Borel construction; EVW16 line 426). *Proof sketch.*
`Conf_n` is a path-connected `K(B_n, 1)` (§IG.5.1). Pull the covering back along the CW
approximation `Z → Conf_n` (Tau Ceti `TauCeti.cwApproximation`,
`TauCeti.isWeakHomotopyEquivalence_cwApproximationMap`): `Z` is a CW `K(B_n, 1)`, and the map from
the pulled-back cover to `Ẽ ×_{B_n} X` is again a weak homotopy equivalence, since both covers
have the monodromy action of `B_n` on `X` and a covering map is an isomorphism on `π_i` for
`i ≥ 2`; so it is an isomorphism on singular homology (Tau Ceti
`ContinuousMap.IsWeakHomotopyEquivalence.isIso_singularHomologyMap`). The homology of a finite
cover is the homology of the base with coefficients in the permutation local system of the fibre
(AlgebraicTopology §5.3), which for a `K(B_n, 1)` CW complex is group homology with coefficients
in `k[X]` (ClassifyingSpaces Stage 4, item 17). *Needs:* §0.3, §0.4; §IG.5.1, §IG.5.2;
ClassifyingSpaces Stage 4; AlgebraicTopology §5.3; Tau Ceti `TauCeti.cwApproximation`,
`ContinuousMap.IsWeakHomotopyEquivalence.isIso_singularHomologyMap`; Mathlib `groupHomology`,
`groupHomology.map`.

**Checks.**

- For `G` trivial the fibre is a point and the statement is `H_p(Conf_n; k) ≅ H_p(B_n; k)`.
- In degree zero, `H_0(B_n; k[X])` is the free vector space on the orbits `X/B_n`, matching
  `H_0` of the covering space as the free vector space on its components: for `S₃`, its
  transpositions and `n = 2` it has dimension five.
- For `X = S_n`, with `B_n` acting through `TauCeti.BraidGroup.permHom` by left multiplication, the
  covering space is `PConf_n` and `H_p(B_n; k[S_n]) ≅ H_p(P_n; k)` for the pure braid group
  `P_n = TauCeti.BraidGroup.pureSubgroup n` (Shapiro's lemma). For `n = 2` both sides are `k` in
  degrees `0` and `1`, as `PConf_2 ≃ S¹`; the trivial action on the two points of `S_2` would give
  `H_0` of dimension two, the homology of two copies of `Conf_2`.

### 0.6 The component ring

Define `R` as Mathlib's `MonoidAlgebra k S` of the braid-orbit monoid `S = ⊔_n c^n/B_n` of
§IG.3.2, graded by length, `R_n = k[c^n/B_n]`, with the augmentation `R → R_0 = k`, the conjugation
action of `G` and the grading by boundary product. Write `r_g` for the basis element of the
one-term tuple `(g)`. Then `R` is generated by the `r_g`, `g ∈ c`, subject to
`r_g r_h = r_(g h g⁻¹) r_g`, and gluing identifies `R` with `⊕_n H_0(Hur_n; k)` as graded algebras
(EVW16 §3.3, p. 13; EVW16 lines 561–569). *Needs:* §IG.3.2 *The braid-orbit monoid*, *The Hurwitz
braid action*; §0.4, §0.5; Mathlib `MonoidAlgebra`, `MonoidAlgebra.single`, and
`AddMonoidAlgebra.gradeBy` through `MonoidAlgebra.toAdditiveAlgEquiv` for the length grading;
Tau Ceti `TauCeti.InternalGrading.ofDecomposition`.

- The braid orbits form a homogeneous basis of `R`.
- A family of elements of a `k`-algebra satisfying the Hurwitz relations extends uniquely to an
  algebra map from `R`.
- The relation `r_g r_h = r_(g h g⁻¹) r_g` holds; equivalently `r_h r_(h⁻¹ g h) = r_g r_h`.
- The augmentation sends the empty tuple to `1` and every basis element of positive degree to `0`.
- The basis element of a tuple of boundary product one is central.
- The identification with `H_0` respects degree, products, conjugation and boundary grading.

**Checks.**

- `R_0 = k`, spanned by the empty tuple, also when `CHur_0` is empty.
- In `S₃` with transpositions, `r_(12) r_(23)` and `r_(23) r_(12)` have boundary products `(123)` and
  `(132)` and are different: `R` is not commutative.
- For `G` trivial and `c = {1}`, `R = k[t]` with `t` of degree one.
- For `S₃` with transpositions, `dim R_2 = 5`, the number of braid orbits on `c²`.
- The one-term tuple `(g)`, `g ≠ 1`, is a basis element of degree one; no product-one quotient is
  taken.

### 0.7 The central stabilization sum and the stabilization operators

For `D ≥ 1` put `U_D = Σ_(g ∈ c) r_g^(D d)`. Each block `r_g^(D d)` has boundary product `g^(D d) = 1`
and is central, so `U_D` is a central element of degree `a = D d`, fixed by simultaneous
conjugation, with boundary product one; no normalizing scalar is used (EVW16 Lemma 3.5, p. 14;
EVW16 line 623). On braid-group homology `U` is induced by the morphism of representations
`markedStabilizer k c full m n`, the sum over `g ∈ c` of `glueRepHom k c full m n g`, the gluing
of `(g, …, g)` of length `m` along `shiftHom m n`; on the unmarked fibres it is
`unmarkedStabilizer k c full m n`, sending the class of `s` to `unmarkedGlueSum`, the sum over `g`
of the classes of `glue g s`. *Needs:* §0.4, §0.5, §0.6; Mathlib `Rep.ofHom`,
`MonoidAlgebra.mapDomainLinearMap`.

- `U_D` commutes with every element of `R`, and the `G`-action fixes it.
- `U_D` is homogeneous of degree `D d` and boundary product one.
- A graded left `R`-linear map intertwines `U_D` on its source and target, and scalar extension of
  the field carries `U_D` to the same integral sum.
- The glue sum does not depend on the representative of a class: it is invariant under
  simultaneous conjugation of the input (`unmarkedGlueSum_conj`, `unmarkedGlueSum_eq_of_mk_eq`),
  and it is equivariant along the block inclusion. Hence
  `unmarkedStabilizer` is a morphism of representations, and it is the map induced by
  `markedStabilizer` on coinvariants of simultaneous conjugation.

**Checks.**

- For `G = C₂` and `c = {s}`, `d = 2` and `U_D = r_s^(2D)`, which is nonzero.
- For `S₃` with transpositions and `D = 1`, `U_1 = r_(12)² + r_(13)² + r_(23)²` has degree two; the
  product of the three blocks would have degree six.
- For `G` trivial, `U_D = t^D` in `k[t]`.
- `U_(2D)` is not `U_D²`: the square has the mixed terms `r_g^(Dd) r_h^(Dd)`, `g ≠ h`, already for
  `S₃` with transpositions.
- The degree of `U_D` is `D d`, not `|c| D d`.

### 0.8 Stability on components

Prove: if `c` is nonsplitting, there are `D ≥ 1` and `N ≥ 0`, depending only on `(G, c)`, such that
`U_D : R_n → R_(n+Dd)` is an isomorphism for every `n ≥ N` and every permitted field. In particular
`R[U_D]` and `R/U_D R` have finite degree, bounded independently of the field. `D` may be chosen
simultaneously for all subgroups `H` with `c ∩ H` nonempty and generating `H`, and every positive
multiple of an admissible `D` is admissible after enlarging `N` (EVW16 Lemma 3.5, p. 14, using
Proposition 3.4, p. 13; EVW16 lines 574–685). *Proof sketch.* Let `S_n(H)` be the braid orbits of
tuples in `c^n` generating exactly `H`. If it is nonempty, `c ∩ H` generates `H` and is one class of
`H` by nonsplitting, so the extraction of §IG.3.2 applies in `H` and multiplication by
`r_g^d`, `g ∈ c ∩ H`, maps `S_n(H)` onto `S_(n+d)(H)` for large `n`. Surjections between finite sets
whose cardinalities eventually stabilize along each residue class modulo `d` are eventually
bijections; the ratios of two such maps are permutations of bounded finite sets, and a common
exponent `D` makes all the maps `r_g^(Dd)` agree on each `S_n(H)`. Filter `R` by the order of the
exact image; `U_D` is triangular, and on the graded piece of exact image `H` it acts as
`|c ∩ H|` times a bijection, and `|c ∩ H|` divides `|H|`, hence `|G|`, and is a unit. Descend on the
order. Thresholds and exponents are chosen before the field. *Needs:* §0.1, §0.6, §0.7;
§IG.3.2 *Extracting an element of a single class*.

**Checks.**

- For `G` trivial one can take `D = 1` and `N = 0`; `R/UR = k` has degree `0`, while the
  constant `A1` is still at least `1`.
- For `S₄` with transpositions no `D` works: `dim R_n` grows with `n`.
- For `G = S₃`: on the exact-image stratum of a group `H` of order two, `c ∩ H` has one element and
  the diagonal coefficient of `U_D` is `1`, not `|c| = 3`.

### Examples

- `G = S₃`, `c` the transpositions, `D = 1`: `R_2` has dimension five, `U_1` lies in `R_2`, and
  `U_1 : R_n → R_(n+2)` is an isomorphism for large `n`.
- `G` trivial: `R = k[t]`, `U = t^D`, and the stabilization operators of §0.7 are the
  stabilization maps `H_p(B_n; k) → H_p(B_(n+D); k)` adding `D` strands on the left.

### Dependencies

InverseGaloisAndArithmeticFundamentalGroups §§IG.3.2, IG.5.1, IG.5.2; ClassifyingSpaces Stage 4;
AlgebraicTopology §5.3; Tau Ceti `TauCeti.BraidGroup`, `TauCeti.InternalGrading`,
`TauCeti.cwApproximation`; Mathlib
group homology, representations, monoid algebras and their gradings.

## Layer 1: graded K-complexes and homological degree bounds

Throughout, `(G, c)` is nonsplitting, `D` is admissible, `U = U_D`, `a = D d`, and `R̄ = R/UR`.
The layer shows that `R` behaves as if it had cohomological dimension one (EVW16 §4, p. 15).

### 1.1 Support degree and internal shift

Use graded left and right `R`-modules with an internal nonnegative grading, morphisms of internal
degree zero, `deg` as in the conventions, and the shift `M[q]`; a homogeneous map of degree `a` is a
degree-zero map `M[a] → N` (EVW16 §1.11, p. 8; EVW16 lines 342–349). Homological complexes keep a
separate chain index. Graded left `R`-modules are objects of `TauCeti.GradedModuleCat` for the
length grading of `R`; graded right `R`-modules are the graded `(k, R)`-bimodules taken by
`TauCeti.GradedModuleCat.bimoduleModuleTensor`, that is graded modules over `k ⊗_k Rᵐᵒᵖ` with the
tensor product of `TauCeti.trivialGrading` and the opposite grading
`TauCeti.InternalGrading.opposite`; and `M[q]` is `TauCeti.GradedModuleCat.shiftFunctor q`.
*Needs:* Tau Ceti `TauCeti.GradedModuleCat`, `TauCeti.GradedModuleCat.shiftFunctor`,
`TauCeti.InternalGrading.opposite`, `TauCeti.trivialGrading`; Mathlib
`CategoryTheory.GradedObject`.

- `deg V ≤ b` holds exactly when every piece above `b` is zero.
- For `n ≥ q` the `n`-th piece of `M[q]` is `M_(n−q)`, and it is zero below `q`.
- A nonzero module of finite degree `b` has `deg M[q] = b + q`; the zero module stays zero.
- In an exact sequence `A → B → C`, `deg B ≤ max(deg A, deg C)`; a finite direct sum has the
  maximum of the degrees.
- Shift is an exact functor on degree-zero morphisms.

**Checks.**

- The zero module satisfies `deg ≤ b` for every `b`, including negative `b`.
- `k` concentrated in degree `0` has `k[2]` concentrated in internal degree `2`, whatever its chain
  degree.
- The degree-zero piece of `k[1]` is zero; computing `M_(0−1)` with natural-number subtraction
  would wrongly give `M_0 = k`.
- `R = k[t]` has unbounded support, so `deg R = +∞`.

### 1.2 Central torsion and stability defects

For a graded left `R`-module `M` let `M[U] = ker(U : M → M)`, in the source grading, and `M/UM` in
the target grading; put `A(M) = max(deg M[U], deg M/UM)` and
`δ(M) = max(deg Tor_0^R(R̄, M), deg Tor_1^R(R̄, M))` (EVW16 (4.5.1)–(4.5.3), p. 18;
EVW16 lines 815–827). Finite `A(M)` is the meaning of eventual `U`-stability. *Needs:* §0.7,
§0.8, §1.1; Tau Ceti `TauCeti.GradedModuleCat.bimoduleModuleTensor`; Mathlib
`CategoryTheory.Functor.leftDerived`; DGAInfinity Layer 5 (gap:dga-graded-tor-spectral-sequences).

- `R̄ ⊗_R M` is naturally `M/UM`, compatibly with the left `R̄`-action.
- `M[U]_n` is the kernel of `U : M_n → M_(n+a)`.
- `H_0^aug(M) = k ⊗_R M = M/R_+ M`.
- For finite `b ≥ A(M)`, `U : M_n → M_(n+a)` is bijective for every `n > b`; the kernel and the
  cokernel conditions can be tested separately, the cokernel in target degree `n + a`.
- Torsion, quotient and `Tor` are natural in `M` and in extension of the field.

**Checks.**

- For `R = k[t]`, `U = t` and `M = R`: the kernel is zero and `R/UR = k` in degree `0`, so
  `A(R) = 0`, while `A1 ≥ 1` by convention.
- For `R = k[t]`, `U = t` and `M = k` in degree `0`: `M[U] = M/UM = k`, and
  `Tor_1^R(k, k) = k[1]`.
- Replacing `M` by `M[q]` shifts the torsion and cokernel degrees by `q`.
- The injective map `t : k[t] → k[t]` has a nonzero cokernel: the kernel alone does not detect
  stability.

### 1.3 Change of rings for the central quotient

Construct, for every graded left `R`-module `M`, a first-quadrant spectral sequence
`E²_(i,j) = Tor_i^(R̄)(k, Tor_j^R(R̄, M)) ⇒ Tor_(i+j)^R(k, M)` preserving the internal grading; the
inner `Tor` is a left `R̄`-module, and commutativity of `R` is not used (EVW16 (4.3.1), p. 17;
EVW16 line 782). *Proof sketch.* `R̄ ⊗_R −` takes graded free `R`-modules to graded free
`R̄`-modules, so the composite-functor spectral sequence applies; each total degree has finitely
many bidegrees. *Needs:* §1.2; DGAInfinity Layer 5 (gap:dga-graded-tor-spectral-sequences).

**Checks.**

- For `M = R` the inner higher `Tor` vanishes and the sequence returns `Tor_i^(R̄)(k, R̄)`, which is
  `k` for `i = 0` and zero otherwise.
- In total degree zero the abutment is `k ⊗_R M`, not `R̄ ⊗_R M`.
- The low-degree exact segment
  `Tor_2^(R̄)(k, R̄ ⊗_R M) → k ⊗_(R̄) Tor_1^R(R̄, M) → Tor_1^R(k, M)` holds.

### 1.4 A balanced tensor estimate

Prove: for a graded right `R`-module `N` and a graded left `R`-module `M`,
`deg(N ⊗_R M) ≤ deg N + deg H_0^aug(M)` whenever the right side is finite; the same holds over `R̄`
(EVW16 Lemma 4.4, p. 17; EVW16 line 785). *Proof sketch.* Filter a bounded `N` from its top degree;
the top piece is a sum of shifted copies of `k`, and right exactness of the balanced tensor product
reduces to `N = k`. *Needs:* §1.1, §1.2; Tau Ceti `TauCeti.BalancedTensorProduct`,
`TauCeti.BalancedTensorProduct.grading`, `TauCeti.GradedModuleCat.bimoduleModuleTensor`.

**Checks.**

- `N = k` gives equality with the augmentation coinvariants.
- No flatness of `N` is assumed.

### 1.5 `Tor` over the central quotient

Prove: for a graded left `R̄`-module `V`, `deg Tor_i^(R̄)(k, V) ≤ i deg R̄ + deg V` for every `i ≥ 0`,
and in particular `≤ i A1 + deg V` (EVW16 Lemma 4.5, p. 17; EVW16 line 800). *Proof sketch.* A
graded free right resolution of `k` over `R̄` can be chosen with `i`-th term generated in degrees
`≤ i deg R̄`; tensor with `V` and apply §1.4. *Needs:* §1.4, §1.2; DGAInfinity Layer 5
(gap:dga-graded-tor-spectral-sequences).

**Checks.**

- For `R̄ = k` every positive `Tor` vanishes.
- For `R = k[t]`, `U = t`: `R̄ = k`, and the bound is the degree of `V`.

### 1.6 Central torsion is bounded by quotient `Tor`

Prove: for every graded left `R`-module `M`, `A(M) ≤ δ(M) + A1`; more precisely there is a sequence
`R[U] ⊗_R M → M[U] → Tor_1^R(R̄, M)`, exact in the middle, whose first map has degree zero and whose
second map has degree `a` (EVW16 Lemma 4.6 and (4.6.3), p. 18; EVW16 lines 828–864). *Proof
sketch.* Factor `U : M → M` through `UR ⊗_R M`, tensor the sequences `R[U] → R → UR` and
`UR → R → R̄` with `M`, and apply §1.4 with `deg H_0^aug(M) ≤ deg M/UM ≤ δ(M)`. *Needs:* §1.2,
§1.4; DGAInfinity Layer 5 (gap:dga-graded-tor-spectral-sequences).

**Checks.**

- The tensor factor is `R[U] ⊗_R M`, with `R[U]` the right module; `M ⊗_R R[U]` is not defined for a
  left module `M`.
- For `R = k[t]`, `U = t`, `M = k`: `R[U] = 0`, `M[U] = k` in degree `0`, and the second map, of
  degree `a = 1`, sends it isomorphically onto `Tor_1^R(R̄, M) = k[1]`; `A(M) = 0 ≤ δ(M) + A1 = 2`.

### 1.7 Higher quotient `Tor`

Prove: `deg Tor_i^R(R̄, M) ≤ δ(M) + A1 i` for every `i ≥ 0` (EVW16 Lemma 4.7, p. 19;
EVW16 lines 866–898). *Proof sketch.* `R[U]` is a right `R̄`-module; resolve it by graded free right
`R̄`-modules `Q_j` generated in degrees `≤ (j + 1) A1`, and splice with `R[U] → R → R → R̄` into the
homogeneous complex `P_0 = R`, `P_1 = R[a]`, `P_j = Q_(j−2)[a]` for `j ≥ 2`. The hyperhomology
spectral sequence of `P ⊗_R M` bounds `Tor_b^R(R̄, M)`, `b ≥ 2`, by the pieces
`(b − u − 1) A1 + a + deg Tor_u^R(R̄, M)`, `0 ≤ u ≤ b − 2`, and `a ≤ A1` with induction gives
`δ(M) + b A1`. *Needs:* §1.2, §1.5; DGAInfinity Layer 5 (gap:dga-graded-tor-spectral-sequences).

**Checks.**

- `i = 0, 1` are the definition of `δ(M)`.
- Without the shifts `[a]` the map `U` in the splice is not of degree zero.

### 1.8 Graded Nakayama with support control

Prove: for a graded left `R̄`-module `V` with `deg(k ⊗_(R̄) V)` finite,
`deg V ≤ deg(k ⊗_(R̄) V) + deg R̄`; in particular `k ⊗_(R̄) V = 0` implies `V = 0` (EVW16 Lemma 4.8,
p. 19; EVW16 line 899). *Proof sketch.* Lift a homogeneous basis of the coinvariants; the quotient
by the submodule they generate has zero coinvariants, and its lowest nonzero degree would survive in
the coinvariants. *Needs:* §1.1, §1.2; Tau Ceti `TauCeti.GradedModuleCat`.

**Checks.**

- Over `R̄` the augmentation ideal is nilpotent, because `deg R̄` is finite, so the statement holds
  for every graded `R̄`-module. Over `R` itself, of infinite degree, the lower bound on the grading
  is needed: `k[t, t⁻¹]`, with `t` of degree one, has zero coinvariants over `k[t]` and is nonzero.
  The vanishing statement over `R` used in §1.18 is for nonnegatively graded modules.
- For `V = R̄` the bound is `deg R̄ ≤ 0 + deg R̄`.
- For `V = k[q]` the coinvariants are `k[q]` and the bound `q ≤ q + deg R̄` holds.

### 1.9 Low augmentation `Tor` controls the defect

Prove: for every graded left `R`-module `M`,
`δ(M) ≤ max(deg H_0^aug(M), deg H_1^aug(M)) + 4 A1` (EVW16 Lemma 4.9 and (4.9.1)–(4.9.4), p. 20;
EVW16 lines 909–927). *Proof sketch.* `deg R̄ ⊗_R M ≤ deg H_0^aug(M) + deg R̄` by §1.4; the
low-degree segment of §1.3 and §1.8 bound `Tor_1^R(R̄, M)` by `deg R̄` plus the larger of
`deg H_1^aug(M)` and `deg Tor_2^(R̄)(k, R̄ ⊗_R M) ≤ 3 deg R̄ + deg H_0^aug(M)`. *Needs:* §1.3,
§1.4, §1.5, §1.8.

**Checks.**

- For `R = k[t]`, `U = t`, `M = k`: `δ(M) = 1`, and the bound is `1 + 4 A1 ≥ 5`.
- For `M = R`: `δ(R) = deg R̄`, and `H_0^aug(R) = k`, `H_1^aug(R) = 0`.

### 1.10 A general `Tor` bound

Prove: for a graded right `R`-module `N` and a graded left `R`-module `M`,
`deg Tor_i^R(N, M) ≤ deg N + max(deg H_0^aug(M), deg H_1^aug(M)) + A1 i + 4 A1` for all `i ≥ 0`
(EVW16 Proposition 4.10, p. 20; EVW16 lines 928–945). *Proof sketch.* Reduce to `N = k` by
filtering; in §1.3 a term of total degree `i = a' + b` has degree at most
`a' deg R̄ + b A1 + δ(M)` by §1.5 and §1.7, and §1.9 bounds `δ(M)`. *Needs:* §1.3, §1.5,
§1.7, §1.9; DGAInfinity Layer 5 (gap:dga-graded-tor-spectral-sequences).

**Checks.**

- No commutativity of `R` and no finite global dimension is used.
- For `R = k[t]`, `M = N = k`: `Tor_1 = k[1]` has degree `1 ≤ 0 + 1 + A1 + 4 A1`.

### 1.11 The K-complex

Define, for a graded left `R`-module `M`, the homological complex `K(M)` with
`K(M)_q = k[c^q] ⊗_k M[q]`, `q ≥ 0`, and differential `K(M)_(q+1) → K(M)_q`,
`(g_0, …, g_q) ⊗ m ↦ Σ_(i=0)^q (−1)^i (g_0, …, ĝ_i, …, g_q) ⊗ r(g_i^(g_(i+1) ⋯ g_q)) m`, the empty
suffix product being `1`; `k[c^q]` sits in internal degree zero (EVW16 §4.1 and (4.1.1), p. 16;
EVW16 lines 726–740). *Needs:* §0.6, §1.1; Mathlib `TensorProduct`, `HomologicalComplex`; Tau Ceti
`TauCeti.GradedModuleCat`.

- The `n`-th internal piece in chain degree `q` is `k[c^q] ⊗ M_(n−q)`, zero for `n < q`.
- The differential preserves the internal grading and lowers the chain degree by one; adjacent
  deletions cancel by the relation of §0.6, so `d² = 0`.
- Degree-zero `R`-linear maps induce chain maps, functorially.
- `K(R)` carries the right regular action of `R` on its coefficient factor, with free right terms,
  and `K(M) ≅ K(R) ⊗_R M` naturally.

**Checks.**

- `d((g) ⊗ m) = r_g m`.
- `d((g, h) ⊗ m) = (h) ⊗ r(h⁻¹ g h) m − (g) ⊗ r_h m`, and `d²` gives
  `(r_h r_(h⁻¹ g h) − r_g r_h) m = 0`.
- For `M = k` through the augmentation every differential is zero and `H_q K(k) = k[c^q][q]`.
- For `n < q` the internal `n`-th piece of `K(M)_q` is zero although `K(M)_q` is defined.
- The suffix conjugation is `h⁻¹ g h`. With `h g h⁻¹` the square of the differential on `(g, h) ⊗ m`
  would be `(r_h r_(h g h⁻¹) − r_g r_h) m`, whose two terms have boundary products `h² g h⁻¹` and
  `g h`; these differ, so the terms lie in different braid orbits and do not cancel, whenever `g`
  does not commute with `h²`, for instance for `g = (123)` and `h = (134)` in `A₄`. For a class of
  involutions, such as the transpositions of `S₃`, the two conventions coincide and this example
  does not distinguish them.

### 1.12 Right linearity and the tensor comparison

Prove: the right action on `K(R)_q` commutes with the differential, and evaluation of the balanced
tensor product gives a natural isomorphism of complexes `K(R) ⊗_R M ≅ K(M)`, compatible with
internal shifts and with the action of `U` (EVW16 §4.1, p. 16, and proof of Proposition 4.13,
p. 21). *Proof sketch.* The differential acts by left multiplications on the `R` factor.
*Needs:* §1.11; Tau Ceti `TauCeti.GradedModuleCat.bimoduleModuleTensor`,
`TauCeti.BalancedTensorProduct.finsuppScalarRight`.

**Checks.**

- On `(g) ⊗ 1` the two sides give `r_g` and `r_g · 1`.
- The generator homotopies of §1.13 are not right `R`-linear; the comparison concerns only the
  differential.

### 1.13 Null-homotopies of right multiplication by generators

Construct, for `g ∈ c`, the `k`-linear map `S_g` on the basis of `K(R)`: for a tuple `w` of length `q`
and a basis element `s` of `R` with boundary product `b`,
`S_g(w; s) = (g^((∂w · b)⁻¹), w; s)`; it raises chain degree and internal degree by one and
satisfies `d S_g + S_g d = ` right multiplication by `r_g` (EVW16 proof of Lemma 4.11, p. 21;
EVW16 lines 953–958). *Needs:* §1.11, §1.12; §IG.3.2 *The braid-orbit monoid*.

- The prefix depends only on the braid orbit of `s`, since the boundary product is braid invariant.
- `S_g` has homological degree `+1` and internal degree `+1`.
- Right multiplication by `r_g` induces zero on `H_*(K(R))`.

**Checks.**

- `S_g(∅; 1) = ((g); 1)` and `d S_g(∅; 1) = (∅; r_g)`.
- On `(∅; s)` with boundary product `b` the prefix is `b g b⁻¹`, and `r_(b g b⁻¹) s = s r_g`; for
  `s = r_h` this is the relation `r_h r_g = r_(h g h⁻¹) r_h`.
- For `G` trivial, `S_g` prefixes `1`, and the identity says that multiplication by `t` is
  null-homotopic in every chain degree.
- With the constant prefix `g` in place of `b g b⁻¹` the identity fails as soon as `b` does not
  commute with `g`.

### 1.14 The positive ideal kills regular K-homology

Prove: for every `q ≥ 0` the right `R`-module `H_q(K(R))` is annihilated by `R_+`; in particular `U`
acts by zero on it (EVW16 Lemma 4.11, p. 21). *Needs:* §1.13, §0.7, §1.12.

**Checks.**

- The annihilation is on homology; multiplication by `r_g` is not zero on chains.
- For `R = k[t]`, `H_0(K(R)) = k`, killed by `t`.

### 1.15 Regular K-homology has linear support

Prove: `deg H_q(K(R)) ≤ A2 + q` for every `q ≥ 0` (EVW16 Proposition 4.12, p. 21;
EVW16 lines 959–978). *Proof sketch.* `U` is an isomorphism on `K(R)_q` in source degrees
`> A1 + q`, hence on cycles; cycles are generated in degrees `≤ A1 + a + q`, and §1.14 turns
generation into a support bound. *Needs:* §0.8, §1.2, §1.14, §1.12.

**Checks.**

- For `R = k[t]` (`G` trivial, `U = t`) the differential `K(R)_(q+1) → K(R)_q` is multiplication by
  `t` for `q` even and zero for `q` odd, so `H_q K(R) = k` in internal degree `q` for `q` even and
  `H_q K(R) = 0` for `q` odd; `deg H_q K(R) = q ≤ A2 + q`.
- The complex `K(R)` is not bounded, since `q` is unbounded; only each homology group is.

### 1.16 Universal coefficients for the K-complex

Construct the first-quadrant spectral sequence `E²_(i,j) = Tor_i^R(H_j(K(R)), M) ⇒ H_(i+j)(K(M))`,
preserving the internal grading, and prove
`deg H_q(K(M)) ≤ max(deg H_0^aug(M), deg H_1^aug(M)) + A1 q + 4 A1 + A2` (EVW16 Proposition 4.13,
p. 21, with the positive slope of the conventions; EVW16 lines 979–988). *Proof sketch.* Apply the
hyperhomology spectral sequence to the right-free complex `K(R)` and a free resolution of `M`; on
the diagonal `i + j = q`, §1.10 and §1.15 give
`max(deg H_0^aug, deg H_1^aug) + (A2 + j) + A1 i + 4 A1`, and `j + A1 i ≤ A1 q` because `A1 ≥ 1`.
*Needs:* §1.12, §1.15, §1.10; DGAInfinity Layer 5
(gap:dga-graded-tor-spectral-sequences); Mathlib `CategoryTheory.SpectralSequence`.

**Checks.**

- For `M = R` the higher `Tor` vanishes and the sequence degenerates to `H_j K(R)`.
- For `G` trivial, `R = k[t]`, `U = t`, `M = k`: `H_q K(k) = k[q]` has degree `q`, and
  `A1 ≥ 1` allows it.
- With `A1 = A(R) = 0` and `A2 = 1` in that example, the bound would be `1 + 0 + 0 + 1 = 2` for
  every `q`, but `H_3 K(k)` has degree `3`.

### 1.17 Low K-homology controls augmentation `Tor`

Prove: there are a natural isomorphism `H_0^aug(M) ≅ H_0(K(M))` and a natural surjection
`H_1(K(M)) → H_1^aug(M)`, preserving the internal grading; so `deg H_i^aug(M) ≤ deg H_i(K(M))` for
`i = 0, 1` (EVW16 (4.14.1), p. 22; EVW16 lines 1007–1035). *Proof sketch.* Factor
`K(M)_1 → M` as `k[c] ⊗ M[1] → R_+ ⊗_R M → M`; the first map is surjective, kills the image of
`K(M)_2` by the relation of §0.6, and the kernel of the second is `Tor_1^R(k, M)`. *Needs:*
§1.11, §1.2; DGAInfinity Layer 5 (gap:dga-graded-tor-spectral-sequences).

**Checks.**

- For `M = k`: `H_1(K(k)) = k[c][1]` maps onto `Tor_1^R(k, k)`, which for `G` trivial is `k[1]`.
- Only the degrees `0` and `1` compare: for `G` trivial and `M = k`, `H_2(K(k)) = k[2]` while
  `Tor_2^(k[t])(k, k) = 0`, since `k[t]` has global dimension one.

### 1.18 Higher K-homology from two low degrees

Prove: if `h_i = deg H_i(K(M))` is finite for `i = 0, 1`, then `h_q ≤ max(h_0, h_1) + A0 q` for
every `q > 1` (EVW16 Theorem 4.2 and (4.2.1), p. 16, with the enlarged constants; proof EVW16 §4.14,
p. 22). *Proof sketch.* Insert §1.17 in §1.16 and use `A1 q + 4 A1 + A2 ≤ (5 A1 + A2) q` for
`q ≥ 2`. If both low groups vanish, the coinvariants vanish and the graded Nakayama lemma over `R`
gives `M = 0`. *Needs:* §1.16, §1.17, §1.2.

**Checks.**

- For `R = k[t]`, `M = k`: `h_0 = 0`, `h_1 = 1`, `h_q = q ≤ 1 + A0 q`.
- The cases `q = 0, 1` are the hypotheses, not conclusions.

### 1.19 Stabilization from low K-homology

Prove: if `b ≥ max(deg H_0(K(M)), deg H_1(K(M)))` is a finite nonnegative integer, then
`U : M_n → M_(n+a)` is an isomorphism for every `n ≥ b + A0`; for `M = R` such a `b` exists. The
constants depend only on `(G, c)` and `D`, not on the permitted field (EVW16 Theorem 4.2, p. 16, and
§4.14, p. 22). *Proof sketch.* §1.6, §1.9 and §1.17 give `A(M) ≤ b + 5 A1 < b + A0`, since
`a ≥ 1`. *Needs:* §1.6, §1.9, §1.17, §1.15, §1.2.

**Checks.**

- The range is in the source degree `n`, not `n + a`.
- For `M = R` and `G` trivial, `b = 0` works and `t : R_n → R_(n+1)` is an isomorphism for all `n`.

### Examples

- `G` trivial: `R = k[t]`, `U = t`, `A(R) = 0`, `A1 = 1`, `A2 = 2`, `A0 = 7`. For `M = k`,
  `H_q K(k) = k[q]` and §1.18 gives `q ≤ 1 + 7 q`.
- `G = C₂`, `c = {s}`, `D = 1`: `R = k[r_s]`, `U = r_s²`, `R̄ = k[r_s]/(r_s²)` of degree one,
  `A1 = max(1, 2, deg R[U], deg R̄) = 2`, `A2 = 4`, `A0 = 14`.

### Dependencies

Layer 0; DGAInfinity Layer 5 (gap:dga-graded-tor-spectral-sequences);
Tau Ceti `TauCeti.GradedModuleCat`, `TauCeti.BalancedTensorProduct`;
Mathlib `CategoryTheory.GradedObject`, `CategoryTheory.SpectralSequence`,
`CategoryTheory.Functor.leftDerived`.

## Layer 2: the truncated arc resolution

`D` is a closed oriented smooth disc with a boundary base point `∗` and a set `P` of `n` interior
points, numbered `P_1, …, P_n` so that the straight segments from `∗` to them leave `∗` in
clockwise order. For the closed unit disc, `∗ = −i` and the base configuration
`P_j = (j − 1)/√(1 + (j − 1)²)`, `1 ≤ j ≤ n`, the image of the plane base configuration
`z_(j−1) = j − 1` of ReductiveGroups Layer 11A under its homeomorphism `z ↦ z/√(1 + |z|²)` onto the
open disc, this is the order of the real parts. The classical generator `σ_i`, the native
`TauCeti.BraidGroup.sigma (i − 1)`, is the counterclockwise half twist exchanging `P_i` and
`P_(i+1)` (§2.1).

### 2.1 The braid group as the mapping class group of the marked disc

Define `Mod(D, P)` as the group, under composition, of isotopy classes relative to `∂D` of
orientation-preserving homeomorphisms of `D` that fix `∂D` pointwise and preserve `P` setwise; an
isotopy relative to `∂D` fixes `∂D` pointwise and preserves `P` setwise at every time. Write
`Diff(D, ∂D)` for the group of diffeomorphisms of `D` fixing `∂D` pointwise (GeometricTopology
Layer 3), which for `D` the closed unit disc of `ℝ²` is Tau Ceti's `TauCeti.DiscDiff 2`, and
`Diff(D, P; ∂D)` for its closed subgroup of diffeomorphisms preserving `P` setwise; a
diffeomorphism fixing `∂D` pointwise preserves the orientation. *Needs:* Tau Ceti
`TauCeti.DiscDiff`; GeometricTopology Layer 3 (gap:geomtop-marked-disc-diffeomorphisms).

- Restriction to `P` is a homomorphism `Mod(D, P) → Sym(P)`, whose kernel is the pure mapping
  class group of the classes fixing `P` pointwise.
- `Mod(D, ∅)` is trivial: a homeomorphism of the disc fixing `∂D` pointwise is isotopic to the
  identity relative to `∂D` through the coning isotopy that is the identity outside the disc of
  radius `t` and a rescaled copy of the homeomorphism inside it (ALEX23, pp. 406–407).
- `Mod(D, P)` acts on the isotopy classes of arcs of §2.2.
- Inclusion induces a homomorphism `π_0 Diff(D, P; ∂D) → Mod(D, P)`, bijective by
  GeometricTopology Layer 3 (gap:geomtop-marked-disc-diffeomorphisms).

**Checks.**

- `n = 0` and `n = 1`: the group is trivial. For `n = 1` the coning isotopy centred at the marked
  point fixes that point at every time, so it is an isotopy relative to `∂D` and `P`.
- A wrong model that lets isotopies move `∂D` would make the Dehn twist about a curve parallel to
  `∂D` trivial, by rotating a collar; for `n = 2` that twist is the full twist `σ_1²`, which in
  `Mod(D, P) ≅ ℤ` generates the subgroup of index two, so the half twist has infinite order here
  and order two in the wrong model.
- A wrong model that fixes `P` pointwise gives, for `n = 2`, the subgroup `2ℤ` of `ℤ`: the half
  twist exchanges the two points and is excluded, as `Mod(D, P) → Sym(P)` records.

Prove: there are compatible isomorphisms
`π_0 Diff(D, P; ∂D) ≅ Mod(D, P) ≅ TauCeti.BraidGroup n ≅ π_1(Conf_n(int D), P)`, the last the
identification of ReductiveGroups Layer 11A transported to the disc, under which the generator
`σ_i` corresponds to the positive half twist exchanging the `i`-th and `(i+1)`-st points (EVW16 §2.1,
p. 8; EVW16 lines 354–368). *Proof sketch.* The evaluation map `Diff(D, ∂D) → Conf_n(int D)`,
`φ ↦ φ(P)`, is a locally trivial fibre bundle with fibre `Diff(D, P; ∂D)` over `P`. The
evaluation `e : Diff(D, ∂D) → PConf_n(int D)` at the points `P_1, …, P_n` in order has
continuous local sections: GeometricTopology §3.3 (the restriction fibration, with `N` the finite
set `P` and `M = int D`, where `Emb(N, M) = PConf_n(int D)`) gives them in `Diff_c(int D)`, and
pushing `n` small disjoint discs around the points of a configuration gives them with supports in
a fixed compact subset of `int D`, on which extension by the identity into `Diff(D, ∂D)` is
continuous. As `Diff(D, ∂D)` is a topological group (`Diffeomorph.isTopologicalGroup`) and
`e(ψ φ) = ψ(e(φ))`, a local section `s` over `V` trivializes `e` over `V` by
`φ ↦ (e(φ), s(e(φ))⁻¹ φ)`, with fibre the diffeomorphisms fixing `P` pointwise (the argument of
PAL60, Theorem A); the finite cover `PConf_n → Conf_n` carries the bundle down to `Conf_n`, with
fibre `Diff(D, P; ∂D)`. The exact sequence below uses only that `π_0` and
`π_1` of `Diff(D, ∂D)` vanish, and `Diff(D, ∂D)` is weakly contractible by Smale's disc theorem
in the boundary-pointwise form (GeometricTopology §3.4, gap:geomtop-boundary-pointwise-disc-smale).
Smale proves contractibility for the diffeomorphisms of the square that are the identity on a
neighbourhood of the boundary, in the `C^r` topology (SMA59, Theorem B and Theorem 4; SMA59
lines 15–17, 124–129). The corresponding subgroup `Diff_c(D)` of `Diff(D, ∂D)`, of diffeomorphisms
equal to the identity on a neighbourhood of `∂D`, is not closed (Checks below), so it is not a
retract of `Diff(D, ∂D)`; its inclusion is a weak homotopy equivalence, whose homotopies straighten
a compact family near `∂D` along a collar and move members of `Diff_c(D)` within `Diff_c(D)`.
Being locally trivial, the bundle is a Serre fibration
(`TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`), and its lifting property
identifies the relative homotopy groups of the based pair `(Diff(D, ∂D), Diff(D, P; ∂D))` with the
homotopy groups of `Conf_n(int D)`; the exact sequence of that pair then makes the boundary map
`π_1(Conf_n(int D), P) → π_0 Diff(D, P; ∂D)`, the class of a loop to the end of its lifted isotopy,
an isomorphism. Compose it with `π_0 Diff(D, P; ∂D) ≅ Mod(D, P)` and with the isomorphism
`π_1(Conf_n(int D), P) ≅ TauCeti.BraidGroup n` obtained from that of ReductiveGroups Layer 11A for
the plane through its homeomorphism `Conf_n(ℂ) ≅ Conf_n(int D)`, which carries the base
configuration `z_j = j` to `P`. Under it the native `TauCeti.BraidGroup.sigma (i − 1)` is the class
of the image of Layer 11A's loop turning `z_(i−1)` and `z_i` counterclockwise about their midpoint.
The map `z ↦ z/√(1 + |z|²)` preserves arguments and the orientation and maps the real axis to
itself, so this image exchanges `P_i` and `P_(i+1)` counterclockwise inside a disc meeting `P` in
those two points, and its lifted isotopy ends at the counterclockwise half twist about the segment
`[P_i, P_(i+1)]`.

This identification is the only one Layer 2 uses. The identification of §IG.5.1, through which
§IG.5.2 defines `Hur_n` and §0.5 computes its homology, is not compared with it, and nothing here
needs the comparison: Layer 3 uses the arc complex only through the semisimplicial `B_n`-set
`A(n)` of §2.3, on which `B_n` acts by left multiplication of cosets, and through the connectivity
of its realization (§§2.5–2.6), which involves no action at all. *Needs:* Tau Ceti
`TauCeti.BraidGroup`, `TauCeti.DiscDiff`, `Diffeomorph.isTopologicalGroup`,
`TauCeti.TopCat.serreFibrations`, `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`;
ReductiveGroups Layer 11A; GeometricTopology §3.3 (the restriction fibration), Layer 3
(gap:geomtop-marked-disc-diffeomorphisms) and §3.4 (gap:geomtop-boundary-pointwise-disc-smale);
AlgebraicTopology §8.1 (the exact sequence of a based pair).

**Checks.**

- `n = 0, 1`: all four groups are trivial; `Conf_0` is a point and `Conf_1 = int D` is
  contractible.
- `n = 2`: `B_2 ≅ ℤ`, generated by the half twist, whose square is the Dehn twist about a curve
  around both points, a pure mapping class; `Conf_2(int D)` has the homotopy type of a circle.
- The pure mapping classes are `TauCeti.BraidGroup.pureSubgroup n`, the kernel of
  `TauCeti.BraidGroup.permHom`; a full twist is not a half twist.
- Convention witness, `n = 2`, `∗ = −i`, `P_1 < P_2` real. Let `γ_j` be the loop from `∗` along
  the straight segment to `P_j`, once counterclockwise around `P_j` and back, and use Mathlib's
  product in `π_1(D ∖ P, ∗)`, where `p * q` runs through `q` first. The counterclockwise half
  twist `h` moves `P_1` along the side of `[P_1, P_2]` facing `∗`, so `h_*(γ_1) = γ_2` and
  `h_*(γ_2) = γ_2⁻¹ γ_1 γ_2`. A cover with monodromy `f` and `(f(γ_1), f(γ_2)) = (a, b)`, pushed
  forward along `h`, has monodromy `f ∘ h_*⁻¹`, with values `(a b a⁻¹, a)`: the positive move of
  the conventions. The boundary loop, counterclockwise from `∗`, is `γ_1 γ_2`, with monodromy the
  ordered product `a b`. Pulling back instead, `f ∘ h_*` has values `(b, b⁻¹ a b)`, the inverse
  move.
- For the annulus `A` in place of `D` the conclusion fails: `π_0 Diff(A, ∂A)` contains the Dehn
  twist about the core, which is not trivial, so the twist about the core, viewed in
  `π_0 Diff(A, {x}; ∂A)`, maps to a nontrivial class and is not the end of a lifted loop of the one
  point; the boundary map is not surjective, and the contractibility of `Diff(D, ∂D)` is what the
  disc statement uses.
- The collar-fixing subgroup `Diff_c(D)` is not closed in `Diff(D, ∂D)`. In polar coordinates let
  `f(r, θ) = (r, θ + φ(r))`, with `φ` smooth, zero near `r = 0` and equal to `exp(−1/(1 − r)²)`
  near `r = 1`, and let `f_j` be the same twist with `φ_j(r) = χ(j(1 − r)) φ(r)`, where `χ` is
  smooth, `0` on `(−∞, 1]` and `1` on `[2, ∞)`. Each `f_j` is the identity on the collar
  `r ≥ 1 − 1/j`; `f` is not, since `φ(1 − 1/j) = e^(−j²) > 0`; and `f_j → f` in every `C^m`:
  `φ_j − φ` is supported in `r ≥ 1 − 2/j`, where the `l`-th derivative of `χ(j(1 − r))` is
  `O(j^l)` and every derivative of `φ` is `O((1 − r)^N) = O(j^(−N))` for every `N`. A retraction
  onto `Diff_c(D)` would fix each `f_j`, hence by continuity fix `f`, which is not in `Diff_c(D)`.
  The twists with `φ` replaced by `s φ`, `0 ≤ s ≤ 1`, join `f` to the identity in `Diff(D, ∂D)`,
  as a weak homotopy equivalence permits.

### 2.2 The based arc complex

Define, for a closed smooth oriented disc `S`, a finite nonempty set `Δ ⊂ ∂S` and a finite set
`Λ ⊂ int S`, the simplicial complex `F(S; Δ, Λ)`: a vertex is the isotopy class, relative to
`Δ ∪ Λ`, of a smooth embedded arc from a point of `Δ` to a point of `Λ` whose interior avoids `∂S`
and `Λ` and whose initial vector is not tangent to `∂S`; a simplex is a finite set of classes with
simultaneous representatives disjoint except at common endpoints. `A(S; Δ, Λ)` is the subcomplex
of the simplices whose arcs have distinct endpoints in `Λ` (HW10 §7, pp. 34–35; HW10
lines 1625–1643). The arc complex of this layer is `A(D; {∗}, P)`: a `q`-simplex is a set of
`q + 1` classes with simultaneous representatives meeting only at `∗`, with distinct tangent
directions there and distinct endpoints in `P`. Order a simplex of `A(D; {∗}, P)` by the clockwise
order of its tangent directions at `∗`, the order of `P_1, …, P_n` for the straight arcs; faces
delete arcs, which makes it a semisimplicial set (EVW16 §5.5, p. 25; EVW16 lines 1139–1159, with
the order of *Notes on the sources*). *Needs:* §2.1; GeometricTopology §3.3
(gap:geomtop-arc-isotopy-extension), §1.7.2; AlgebraicTopology Layer 4.

- Relative isotopic arcs give the same vertex.
- A finite set of vertices spans a simplex exactly when it has simultaneous representatives as
  stated, with distinct endpoints in `Λ` for `A(S; Δ, Λ)`.
- In `A(D; {∗}, P)` the `i`-th face deletes the `i`-th arc in the clockwise order; the order of a
  simplex does not depend on the representatives.
- `A(S; Δ, Λ)` has no `q`-simplices for `q ≥ |Λ|`; in particular `A(D; {∗}, P)` has none for
  `q ≥ n`.
- `Diff⁺(D, P; ∂D)` acts simplicially on `A(D; {∗}, P)`, preserving the order, and the action
  factors through `TauCeti.BraidGroup n` by §2.1.

**Checks.**

- `n = 0`: no vertices; the realization is empty.
- `n = 1`: one vertex up to isotopy and no edges.
- Two arcs ending at the same point of `P` never span an edge of `A(D; {∗}, P)`, even with disjoint
  interiors; they can span an edge of `F(D; {∗}, P)`.
- With other points present, arcs to a fixed point need not be isotopic: the vertices are not the
  finite set `P`.
- For `∗ = −i` and `P_1 < P_2` on the real axis, the straight arcs leave `∗` with directions
  `(P_1, 1)` and `(P_2, 1)`, of arguments `arccot P_1 > arccot P_2`, so the arc to `P_1` comes first
  in the clockwise order and is deleted by `∂_0`.
- For `Δ = ∅` there are no arcs: `F(S; ∅, Λ)` is empty even for `|Λ| = 1`, which is why `Δ` is
  nonempty.

### 2.3 The truncated braid-coset model

Define, for `0 ≤ q < n`, the subgroup `L_(n,q) ≤ B_n` generated by the classical generators
`σ_(q+2), …, σ_(n−1)` (native indices `q + 1, …, n − 2`), trivial when the range is empty; put
`A(n)_q = B_n/L_(n,q)`, left cosets with `B_n` acting on the left, for `q < n`, and `A(n)_q = ∅` for
`q ≥ n`; faces `∂_i(b L_q) = b s_(q,i) L_(q−1)` with `s_(q,i) = σ_(i+1) ⋯ σ_q`, `s_(q,q) = 1`, for
`0 ≤ i ≤ q`, and the augmentation `A(n)_0 → pt` (EVW16 §5.2, p. 23; EVW16 lines 1062–1069, with the
truncation of *Notes on the sources*). The shifted-strand inclusion `B_(n−q−1) → B_n`,
`σ_j ↦ σ_(j+q+1)`, is Tau Ceti's block inclusion `TauCeti.BraidGroup.natAdd (q + 1)` for
`q ≤ n − 2` and the trivial homomorphism out of `B_0` for `q = n − 1`; prove that it is injective
with image `L_(n,q)`. *Proof sketch for injectivity.* Place the
`m = n − q − 1` moving points in a smaller disc and keep the first `q + 1` points outside; lift a
null-homotopy in `Conf_n` to the finite cover that records which `m` points form the moving block,
forget the other block, and shrink the small disc; for `m = 0, 1` both groups are trivial.
*Needs:* Tau Ceti `TauCeti.BraidGroup.sigma`, `TauCeti.BraidGroup.natAdd`,
`TauCeti.BraidGroup.natAdd_sigma`; Mathlib `Subgroup.closure`; §IG.5.1; AlgebraicTopology
Layer 5 (gap:algtop-borel-construction).

- `L_(n,q)` is the closure of the native generators with index at least `q + 1`.
- For `q < n` the shifted inclusion `B_(n−q−1) → B_n` is injective with image `L_(n,q)`.
- `A(n)_q` is a transitive `B_n`-set for `q < n` and empty above.
- Faces are right multiplication by `s_(q,i)` followed by passage to the larger subgroup.
- Left multiplication commutes with the faces and the augmentation.

**Checks.**

- `A(0)_q = ∅` for every `q`.
- `A(1)_0` is a point and `A(1)_1 = ∅`, although `B_1` is trivial and `B_1/L_(1,1)` would be a point.
- For `n ≥ 1`, `L_(n,n−1)` is trivial and `A(n)_(n−1) = B_n`.
- For `n = 3`, `q = 0` the subgroup is generated by the classical `σ_2` (native index `1`), not by
  `σ_1`.

### 2.4 The coset faces are semisimplicial

Prove: the faces are independent of the representative and `B_n`-equivariant, and
`∂_i ∂_j = ∂_(j−1) ∂_i` for `0 ≤ i < j ≤ q`; with the augmentation, `A(n)` is an augmented
semisimplicial `B_n`-set of dimension `n − 1` for `n ≥ 1` (EVW16 Proposition 5.3 and the vertex
description, pp. 23–24; EVW16 lines 1070–1095). *Proof sketch.* `L_q` commutes with `σ_j` for
`j ≤ q` and lies in `L_(q−1)`; for `j = q` use `s_(q,i) = s_(q−1,i) σ_q` with `σ_q ∈ L_(q−2)`; for
`j < q` move `σ_j` through the increasing products by the braid relations. *Needs:* §2.3; Tau Ceti
`TauCeti.BraidGroup.sigma_mul_sigma_comm`, `TauCeti.BraidGroup.sigma_braid`.

**Checks.**

- For `q = 1` the two faces of `b L_1` are `b σ_1 L_0` and `b L_0`, in this order.
- The vertices of `b L_q` are `b L_0, b σ_1 L_0, b σ_2 σ_1 L_0, …, b σ_q ⋯ σ_1 L_0`.
- No degeneracies are asserted.

### 2.5 Arc stabilizers and the coset identification

Prove: for `0 ≤ q < n`, `B_n` acts transitively on the `q`-simplices of the arc complex, the
stabilizer of the standard simplex `v_q` of the straight arcs from `∗` to `P_1, …, P_(q+1)`, in
this order, is `L_(n,q)`, and `b L_q ↦ b · v_q` is an equivariant isomorphism of augmented
semisimplicial sets from `A(n)` to the arc complex (EVW16 Proposition 5.6 and (5.6.1), pp. 25–27;
EVW16 lines 1160–1251).
*Proof sketch.* Straighten two simplices near `∗`, match endpoints using the surjection onto `S_n`,
and retract arcs inside disjoint tubular neighbourhoods. For the stabilizer, isotope a mapping class
fixing the arc classes to one fixing the arcs pointwise, one arc at a time: the obstruction to
removing intersections of an isotopy with the arcs already fixed lies in `π_2` of the punctured disc
relative to an arc, which vanishes. The complement of a neighbourhood of `v_q` is a disc with
`n − q − 1` points, whose mapping classes are the shifted braid group. Deleting the `i`-th arc of
`v_q` is `s_(q,i) · v_(q−1)`: applied to `v_(q−1)`, the half twists `σ_q, σ_(q−1), …, σ_(i+1)`, in
this order, carry the arc to `P_j` onto the arc to `P_(j+1)` for `j = q, q − 1, …, i + 1`, since
each moves its left point along the side facing `∗`. *Needs:* §2.1, §2.2, §2.3, §2.4;
GeometricTopology §3.3 (gap:geomtop-arc-isotopy-extension), §1.7.2, Layer 3
(gap:geomtop-marked-disc-diffeomorphisms).

**Checks.**

- `n = 2`, `q = 1`: the standard edge has trivial stabilizer, and the edges of the arc complex form
  one free `B_2`-orbit.
- A mapping class that fixes each arc class need not fix the arcs pointwise before the isotopy; the
  simultaneous straightening is a step of the proof.
- The face identification `∂_i(v_q) = s_(q,i) v_(q−1)` holds with right multiplication; with left
  multiplication the faces would not commute with the `B_n`-action.
- `n = 2`, `q = 1`, `∗ = −i`, `P_1 < P_2` real, `a_0, a_1` the straight arcs to `P_1, P_2`: the
  counterclockwise half twist `σ_1` moves `P_1` to `P_2` along the side of `[P_1, P_2]` facing `∗`
  and `P_2` to `P_1` along the far side, so `σ_1 · a_0 = a_1`. Hence `∂_0(v_1) = a_1 = s_(1,0) · v_0`
  and `∂_1(v_1) = a_0 = s_(1,1) · v_0`, as §2.3 requires. With `∗ = +i` the arcs to `P_1, P_2` leave
  `∗` in counterclockwise order and the same twist carries `a_1` onto `a_0`, so deleting the first
  arc would be `σ_1⁻¹ · v_0`, a different coset because `L_(2,0)` is trivial.

### 2.6 Connectivity of the arc complex

Prove: for every closed disc `S`, finite nonempty `Δ ⊂ ∂S` and finite `Λ ⊂ int S`, the complex
`F(S; Δ, Λ)` is contractible when `|Λ| ≥ 1` (HW10 Lemma 7.1, p. 34; HW10 lines 1631–1638), and
`A(S; Δ, Λ)` is `(|Λ| − 2)`-connected and Cohen–Macaulay of dimension `|Λ| − 1` (HW10
Proposition 7.2, p. 35; HW10 lines 1644–1667; HW10 Definition 3.4, p. 16). For `S = D`, `Δ = {∗}`,
`Λ = P` and `n ≥ 1` this says that the realization of the arc complex, and hence of `A(n)` by
§2.5, is `(n − 2)`-connected; for `n = 1` this means nonempty and for `n = 2` path connected (EVW16
Proposition 5.6, p. 25). *Proof sketch.* `F(S; Δ, Λ)` deformation retracts onto the star of a
vertex by Hatcher's surgery flow (HAT91, proof of the Theorem, p. 4; HAT91 lines 101–106), in the
form of WAH08 Lemma 2.5 (WAH08 lines 302–303), which applies since `∂S` carries only points of `Δ`;
that the points of `Λ` are interior plays no role (HW10 lines 1632–1638). For `A`, induct on
`|Λ|`, the cases `|Λ| ≤ 1` being immediate as `Δ` is nonempty. Extend a simplicial map of a
`k`-sphere, `k ≤ |Λ| − 2`, over a disc into `F(S; Δ, Λ)`. A simplex of the disc is bad when each
endpoint in `Λ` of its arcs is the endpoint of at least two of them; a bad simplex of maximal
dimension `p ≥ 1` has `d ≤ p` distinct endpoints, and its link maps into the join of the
complexes `A(S_i; Δ_i, Λ_i)` of the pieces `S_i` of `S` cut along its arcs (HW10 lines 1654–1663).
Each `S_i` is a disc, its set `Δ_i` of copies of points of `Δ` on `∂S_i` is nonempty, and
`Λ_i = Λ ∩ int S_i`, with `Σ |Λ_i| = |Λ| − d`; so the pieces lie in the same family, and by
induction and the join connectivity the join is `(|Λ| − d − 2)`-connected, at least
`(|Λ| − p − 2)`-connected, which allows the star of the bad simplex to be replaced by a join.
Cutting `S` along the arcs of a `q`-simplex of `A(S; Δ, Λ)`, which end at distinct points, leaves
one disc `S'`, and the link of the simplex is `A(S'; Δ', Λ')` with `|Λ'| = |Λ| − q − 1`, which
gives the Cohen–Macaulay property (HW10 lines 1645–1648). *Needs:* §2.2, §2.5; GeometricTopology
§3.3 (gap:geomtop-arc-isotopy-extension), §1.7.2; AlgebraicTopology Layer 4, Layer 8
(gap:algtop-join-connectivity).

**Checks.**

- `n = 1`: one vertex, nonempty, as required.
- `n = 2`: the arc complex is a connected graph.
- `Λ = ∅`: the complex is empty, which is `(−2)`-connected, and no connectivity is claimed.
- Without distinct endpoints the complex is contractible, but its simplices of dimension `≥ n`
  would spoil the coset model.
- Cutting `D` along two arcs from `∗` to the same point `p` with disjoint interiors gives two
  discs: the outer one carries two copies of `∗` on its boundary, the inner one carries one. So
  the induction leaves the complexes with `Δ = {∗}`, and the theorem is stated for every finite
  nonempty `Δ`.
- Cutting a disc along arcs from `∂S` to interior points always gives discs, each with its copies
  of points of `Δ` on its single boundary circle; on an orientable surface of positive genus two
  arcs from one point of `Δ` forming a nonseparating loop leave copies of that point on two
  boundary circles of one piece.

### Examples

- `n = 2`: the generator ranges defining `L_(2,0)` and `L_(2,1)` are empty, so
  `A(2)_0 = A(2)_1 = B_2 ≅ ℤ`; the faces of the edge `b` are `b σ_1` and `b`, so `|A(2)|` is the real
  line, contractible and in particular `0`-connected.
- `n = 3`, `q = 0`: `A(3)_0 = B_3/⟨σ_2⟩`, the vertices of the arc complex; their stabilizer is the
  braid group of the two points other than the endpoint.

### Dependencies

Tau Ceti `TauCeti.BraidGroup`, `TauCeti.DiscDiff`, `Diffeomorph.isTopologicalGroup`,
`TauCeti.TopCat.serreFibrations`, `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`;
§IG.5.1 (for §2.3); ReductiveGroups Layer 11A; GeometricTopology Layer 1
(§1.7.2) and Layer 3 (§§3.3, 3.4); AlgebraicTopology Layers 4, 5, 8. Independent of Layer 1.

## Layer 3: the arc spectral sequence for Hurwitz homology

### 3.1 Graded homology modules of Hurwitz spaces

Define `M_p = ⊕_(n ≥ 0) H_p(Hur_n; k)`, graded by `n`, with the left `R`-action given by gluing a
component on the left (EVW16 (5.0.2), p. 23; EVW16 line 1043). In braid-group homology a basis
element of `R_m` represented by `t` acts by `groupHomology.map (shiftHom m n)` of gluing `t`
(§0.5). *Needs:* §0.4, §0.5, §0.6, §1.1; AlgebraicTopology Layer 2, §5.1.

- `(M_p)_n = H_p(Hur_n; k)`.
- `M_0` is the regular left `R`-module.
- Simultaneous conjugation acts on `M_p` with `g(r m) = (g r)(g m)`, so `U` acts equivariantly.
- Extension of the field induces the natural comparison, compatibly with grading and action.

**Checks.**

- `(M_0)_0 = k` and `(M_p)_0 = 0` for `p > 0`, since `Hur_0` is a point.
- In degree zero the action is the multiplication of `R`.
- Restricting to full-monodromy tuples changes `M_0`: for nontrivial `G` its degree-zero piece is
  zero, not `k`.
- `p` is the homological degree and `n` the internal degree; they are never combined.

### 3.2 The Borel arc resolution

Construct, for each `n`, the semisimplicial space `X(n)_q = EB_n ×_(B_n) (A(n)_q × c^n)` and its
thick realization `X(n)` (Tau Ceti `TauCeti.fatRealization`), augmented to `Hur_n` by
`TauCeti.fatRealization.augment`; the augmentation is a bundle with fibre `|A(n)|`, and
for `n ≥ 2` it induces isomorphisms `H_t(X(n); k) → H_t(Hur_n; k)` for `t < n − 2` (EVW16 §5.3,
p. 24; EVW16 lines 1099–1111). *Proof sketch.* Realization commutes with the Borel construction;
apply §2.6 and the Serre spectral sequence of the bundle. *Needs:* §2.4, §2.6; §IG.5.2; Tau Ceti
`TauCeti.fatRealization`, `TauCeti.fatRealization.augment`; AlgebraicTopology Layer 4
(gap:algtop-semisimplicial-realization), Layer 5 (§5.5; gap:algtop-borel-construction),
Layer 8.

- `X(n)_q` is the Borel construction of `A(n)_q × c^n`.
- The augmentation forgets the simplex and realizes to `X(n) → Hur_n`, with fibre `|A(n)|`.
- The skeletal filtration has pieces only for `0 ≤ q < n`.

**Checks.**

- For `q ≥ n` the term is empty.
- `n = 1`: `|A(1)|` is a point and the augmentation is a homotopy equivalence, although the general
  range `t < −1` is empty.
- `n = 0`: the realization is empty while `Hur_0` is a point; no equivalence holds.

### 3.3 Rows are K-complexes

Prove: for `0 ≤ q < n`, `X(n)_q ≃ EB_n ×_(L_q) c^n ≃ c^(q+1) × Hur_(n−q−1)`, so
`H_p(X(n)_q; k) ≅ (K(M_p)_(q+1))_n`; under these identifications the face of `b L_q ↦ b s_(q,i) L_(q−1)`
acts on tuples by `s_(q,i)⁻¹`, removing `g_i` from the first `q + 1` entries and prefixing
`g_i^(g_(i+1) ⋯ g_q)` to the rest, so the alternating face sum is the differential of §1.11 (EVW16
§§5.3–5.4 and Lemma 5.4, pp. 24–25; EVW16 lines 1105–1134). *Proof sketch.* Induce from `L_q`; the
tail subgroup fixes the first `q + 1` entries and acts on the others by the Hurwitz action; the face
`(e, g) ↦ (e s_(q,i), s_(q,i)⁻¹ g)` is freely homotopic to `(e, g) ↦ (e, s_(q,i)⁻¹ g)`. *Needs:*
§3.2, §2.3, §2.5, §3.1, §1.11; §IG.3.2 *The Hurwitz braid action*; AlgebraicTopology
Layer 5 (§5.1; gap:algtop-borel-construction).

**Checks.**

- At `q = 0` the term is `k[c] ⊗ H_p(Hur_(n−1))`, not `H_p(Hur_n)`.
- For `q = 1` the two faces send `(g_0, g_1; x)` to `(g_1; g_0^(g_1), x)` and `(g_0; g_1, x)`, matching
  `d((g_0, g_1) ⊗ m) = (g_1) ⊗ r(g_0^(g_1)) m − (g_0) ⊗ r(g_1) m`.
- Using `s_(q,i)` instead of its inverse on tuples changes which entry leaves the first block, not
  only the conjugation. For `q = 1`, `i = 0` and `(g_0, g_1) = ((12), (23))` in `S₃`, the face by
  `s_(1,0)⁻¹ = σ_1⁻¹` gives `((23); (13), x)`, keeping `g_1` and prefixing `g_0^(g_1) = (13)`, while
  `σ_1` gives `((13); (12), x)`, keeping `g_0 g_1 g_0⁻¹ = (13)` and prefixing `g_0` itself. In
  general, for `i < q`, `s_(q,i)` puts `(g_i ⋯ g_(q−1)) g_q (g_i ⋯ g_(q−1))⁻¹` in position `i`,
  shifts `g_i, …, g_(q−2)` one place to the right and prefixes `g_(q−1)` itself to the rest, which
  does not match §1.11.

### 3.4 The arc spectral sequence

Construct, from the skeletal filtration of `X(n)`, a first-quadrant homological spectral sequence
`E¹_(q,p) = H_p(X(n)_q; k) = (K(M_p)_(q+1))_n`, zero for `q ≥ n`, with `d¹` the alternating face map
and `d^r` of bidegree `(−r, r − 1)`, converging to `H_(p+q)(X(n); k)`, which is `H_(p+q)(Hur_n; k)`
for `p + q < n − 2`. For `q > 0`, `E²_(q,p) = (H_(q+1) K(M_p))_n`, and
`E²_(0,p) = coker(K(M_p)_2 → K(M_p)_1)_n` (EVW16 Proposition 5.1, p. 23; EVW16 lines 1049–1052).
*Needs:* §3.2, §3.3, §1.11; Mathlib `CategoryTheory.SpectralSequence`; AlgebraicTopology
Layer 4 (gap:algtop-semisimplicial-realization), Layer 5.

- The `E¹` page, `d¹` and the bidegrees of the higher differentials are as stated.
- Row homology is `H_(q+1) K` for `q > 0`; for `q = 0` it is the cokernel.
- The augmentation gives an edge map `E²_(0,p) → (M_p)_n` induced by `K_1 → K_0`.
- Field extension and simultaneous conjugation act compatibly on pages and filtrations.

**Checks.**

- At `q = 0` the `E¹` term is `k[c] ⊗ H_p(Hur_(n−1))`, and `d¹` from `q = 1` has the two terms of
  §3.3.
- For `G` trivial, `M = R = k[t]` and `n = 1`: `coker(K_2 → K_1)` in degree one is `k`, while
  `H_1 K(R)` in degree one is zero.
- A term of total degree `n − 2` is defined, but its abutment is not identified with
  `H_(n−2)(Hur_n)`.
- `E¹` vanishes for `q ≥ n`, because `K_(q+1)` starts in internal degree `q + 1`.

### 3.5 The edge sequence of low K-homology

Prove: for all `p, n` there is an exact sequence
`0 → (H_1 K(M_p))_n → E²_(0,p) → (M_p)_n → (H_0 K(M_p))_n → 0`, whose middle map is the edge map of
§3.4 (EVW16 proof of Theorem 6.1, p. 28; EVW16 lines 1279–1306). *Proof sketch.* Chain algebra
gives the kernel and cokernel of `coker(K_2 → K_1) → K_0`; §3.3 identifies `K_1 → K_0` with the
augmentation; no differential leaves column zero. *Needs:* §3.4, §1.11, §1.17.

**Checks.**

- For `M_0 = R` and `G` trivial the sequence is `0 → 0 → k → k → 0 → 0` in internal degree one.
- The edge map is neither injective nor surjective in general before the higher rows are bounded.

### Examples

- `G` trivial, `p = 0`: `E¹_(q,0) = (K(R)_(q+1))_n = k` for `q < n`, the realization `X(n)` computes
  `H_*(B_n; k)` in degrees `< n − 2`, and the zeroth column is `k` in each degree `n ≥ 1`.

### Dependencies

Layers 0, 1, 2; §IG.5.2; AlgebraicTopology Layers 2, 4, 5, 8; Mathlib
`CategoryTheory.SpectralSequence`.

## Layer 4: linear stability for marked, full-monodromy and unmarked Hurwitz spaces

### 4.1 The inductive degree bound

Prove: for all `p, q ≥ 0`, `deg H_q(K(M_p)) ≤ A2 + A0 (3p + q)`, with constants independent of the
permitted field; for `p > 0` moreover `deg H_0 K(M_p), deg H_1 K(M_p) ≤ A2 + 3 A0 p` (EVW16 proof of
Theorem 6.1, pp. 27–29; EVW16 lines 1267–1309). *Proof sketch.* Induct on `p`. For `p = 0`,
`M_0 = R` and §1.15 applies, as `A0 ≥ 1`. For `p = P > 0` and `n > A2 + 3 A0 P`, the induction
hypothesis kills the terms `E²_(j,P+1−j)`, `j ≥ 2`, of degree `≤ A2 + A0(3P + 4 − 2j)`, and the terms
`E²_(j,P−j)`, `j ≥ 1`, of degree `≤ A2 + A0(3P + 1 − 2j)`; as `A2 ≥ 2` and `A0 ≥ 7`, also `P < n − 2`.
So `E²_(0,P) → (M_P)_n` is an isomorphism and §3.5 kills both low K-groups; §1.18 gives
`q ≥ 2`. *Needs:* §1.15, §1.18, §3.4, §3.5, §3.1, §1.2.

**Checks.**

- For `G` trivial and `p = 0` the bound reads `deg H_q K(R) ≤ 2 + 7 q`, while the true value is `q`
  for `q` even and `−∞` for `q` odd (§1.15).
- Incoming differentials start at `j = 2` on `E²`; treating column zero as `H_1(K)` would break the
  argument.

### 4.2 Marked homological stability

Prove: for a finite group `G` and a nonsplitting class `c`, with `U = U_D` and `a = D d`, there are
`A, B ≥ 0` depending only on `(G, c)` such that for every permitted field `k` and all `p, n ≥ 0`
with `n > A p + B`, `U : H_p(Hur_n; k) → H_p(Hur_(n+a); k)` is an isomorphism; one can take
`A = 3 A0` and `B = A2 + A0 + 2` (EVW16 Theorem 6.1 and (6.1.1), p. 27; EVW16 lines 1256–1261).
*Proof sketch.* In §1.19 take `b = A2 + 3 A0 p` from §4.1 for `p > 0`, and `b = A2 + 1` from §1.15
for `p = 0`, where `M_0 = R`; in both cases `n > 3 A0 p + A2 + A0 + 2` gives `n ≥ b + A0`. *Needs:*
§4.1, §1.15, §1.19, §0.7, §3.1.

**Checks.**

- For `G` trivial this is stability for `H_p(B_n; k)` under adding `D` strands, with the classical
  range of Arnold well inside `n > A p + B`.
- No single branch insertion of degree one is claimed to stabilize.
- Fields in which `|G|` vanishes and integral coefficients are excluded: Lemma 3.5 of EVW inverts
  `|c ∩ H|`.

### 4.3 Full-monodromy stability

Prove: with `D` chosen simultaneously for all subgroups generated by their intersection with `c`,
and `A, B` enlarged depending only on `(G, c)`, `U` restricts to isomorphisms
`H_p(CHur_n; k) → H_p(CHur_(n+a); k)` for `n > A p + B`. On the stratum of exact image `H` the
diagonal part of `U` is `U_H = Σ_(g ∈ c ∩ H) r_g^(D d)`, with coefficient one (EVW16 Theorem 6.1,
(6.1.2) and (6.1.6), pp. 27–29; EVW16 lines 1262–1337, with the correction of *Notes on the
sources*). *Proof sketch.* Decompose `Hur_n` by exact image; `U` maps the `H`-stratum to strata of
supergroups, its diagonal block is `U_H` for `(H, c ∩ H)`, which is nonsplitting, and induction on
`|H|` with §4.2 for each subgroup gives injectivity and surjectivity on the full stratum. *Needs:*
§4.2, §0.8, §0.1, §0.4; §IG.5.2.

**Checks.**

- For `G` trivial full monodromy is all monodromy, including `n = 0`.
- For nontrivial `G`, `CHur_0` is empty and its homology is zero in every degree.
- For `S₃` with transpositions and `H` of order two, the surviving coefficient of `U_H` is `1`;
  the factor `|c|/|c ∩ H| = 3` does not occur.

### 4.4 Homology of the simultaneous-conjugation quotient

Prove: for `X = Hur_n` or `CHur_n` and a permitted field, `X//G → X/G` induces isomorphisms on
homology and `H_p(X/G; k) ≅ H_p(X; k)_G`. The stabilizer of a point of exact image `H` is `C_G(H)`,
and on `CHur_n` it is `Z(G)` (EVW16 proof of Corollary 6.2, p. 29; EVW16 lines 1347–1360). The
action of `G` on `X` is not free, so the coinvariant comparison of AlgebraicTopology §5.3,
which is for free actions, is not applied to it. *Proof sketch.* In braid-group homology,
let `F` be the fibre of `X` over the base configuration: `c^n` for `Hur_n` and the generating
tuples in `c^n` for `CHur_n`, that is `HurwitzFibre c full n`, with the Hurwitz action of `B_n`
and the commuting action of `G` by simultaneous conjugation. Then `F/G` is
`UnmarkedFibre c full n`, `k[F]_G = k[F/G]` as `B_n`-modules, and
`H_p(B_n; k[F/G]) ≅ H_p(B_n; k[F])_G`, as coinvariants of a finite group of invertible order are
exact and commute with `H_p(B_n; −)`; §0.5, applied to the finite covers with fibres `F` and
`F/G`, identifies the two sides with `H_p(X/G; k)` and `H_p(X; k)_G`, the map being induced by the
quotient `X → X/G`. This handles the stabilizers. For the Borel construction
`X//G = EG ×_G X`, the group `G` acts freely on `EG × X`, and Cartan–Leray for this regular cover
(AlgebraicTopology §5.3) gives `H_p(X//G; k) ≅ H_p(X; k)_G`, induced by `X → X//G`.
Since `X → X//G → X/G` is the quotient map, `X//G → X/G` is an isomorphism on homology. *Needs:*
§IG.5.2 *Forgetting the boundary marking*; AlgebraicTopology Layer 2, §5.3, Layer 5
(gap:algtop-borel-construction); §0.3, §0.5.

**Checks.**

- For `G = C₂` conjugation is trivial and the quotient map is the identity.
- In `S₃` the constant tuple `((12), (12))` has stabilizer of order two; the action on `Hur_n` is not
  free.
- The invertibility of `|G|` is needed: for `C₂` acting antipodally on `S²` and `k = 𝔽₂`,
  `H_1(ℝP²; 𝔽₂) = 𝔽₂` while `H_1(S²; 𝔽₂)_(C₂) = 0`.
- The coefficients are the permutation module of the fibre `F`, not of the total space: for `G`
  trivial and `n = 1`, `F` is a point and `H_0(B_1; k[F]) = k = H_0(Conf_1; k)`, whereas the
  permutation module on the points of `X = Conf_1(int D)` has uncountable dimension. For `S₃`, its
  transpositions and `n = 2`, `H_0(B_2; k[F])` has dimension five, its conjugation coinvariants
  dimension two, and `H_0(B_2; k[F/G])` dimension two.

### 4.5 Unmarked homological stability

Prove: for a nonsplitting class `c` and every permitted field, `U` induces isomorphisms
`H_p(Hur_n/G; k) → H_p(Hur_(n+a)/G; k)` and `H_p(CHur_n/G; k) → H_p(CHur_(n+a)/G; k)` for
`n > A p + B`, with the constants of §§4.2–4.3. EVW state this for centreless `G`, the case in
which `CHur^c_{G,n}/G` is homeomorphic to the complex points of the Hurwitz scheme
`Hn^c_{G,n}` of §5.3 (for `1 ∉ c`); the argument does not use
centrelessness (EVW16 Corollary 6.2, p. 29; EVW16 lines 1341–1346). *Proof sketch.* `U` is fixed
by conjugation and gluing is equivariant, so the isomorphisms of §§4.2–4.3 are isomorphisms of
`k[G]`-modules; take coinvariants and apply §4.4.

In Lean, §4.2, §4.3 and §4.5 together are `hurwitz_homological_stability`: there are `m > 0`
with `g^m = 1` for `g ∈ c` and `A, B` such that for every field `k` with
`(Fintype.card G : k) ≠ 0`, every `full`, `p` and `n > A p + B`, both
`groupHomology.map (shiftHom m n) (markedStabilizer k c full m n) p` and
`groupHomology.map (shiftHom m n) (unmarkedStabilizer k c full m n) p` are bijective. *Needs:*
§4.2, §4.3, §4.4, §0.7, §0.4.

**Checks.**

- Coinvariants are taken of the `k[G]`-linear isomorphism induced by `U`, not of single gluing
  maps: a single summand need not descend to the quotient fibres. For `S₃`, its transpositions,
  `a = (12)`, `b = (23)`, `m = 2` and `n = 1`, the tuples `(a)` and `(b)` are conjugate, but gluing
  `(a, a)` gives `(a, a, a)` and `(a, a, b)`, which are not; the sum over `g ∈ c` gives the class
  of `(t, t, t)` plus twice the class of `(t, t, t')`, `t ≠ t'`, for both (§0.4, `glue_conjFibre`).
  For a singleton class `c = {g}` the element `g` is central and the single gluing map descends.
- For `G = S₃`, `c` the transpositions and `n = 2`, `H_0(Hur_2/G)` has dimension two and
  `H_0(Hur_2)` dimension five; the coinvariants of the five orbits under conjugation are two.

### Examples

- `G = C₂`, `c = {s}`: `Hur_n = Conf_n`, `U` adds `2D` strands, and the theorem is the stability of
  `H_p(B_n; k)` along `n ↦ n + 2D`.
- `G = S₃`, `c` the transpositions: the marked, full-monodromy and unmarked homologies of the spaces
  of `S₃`-covers branched at `n` points stabilize along `n ↦ n + 2D`.

### Dependencies

Layers 0–3; §IG.5.2; AlgebraicTopology Layer 2, §5.3.

## Layer 5: finite cell models and uniform Betti numbers

### 5.1 Finite cell models of Hurwitz spaces

Construct, for `n ≥ 2`, a finite CW complex `Z_n ≃ Conf_n` with one `q`-cell for each `q`-element
subset of the simple reflections `{s_1, …, s_(n−1)}` of `S_n`, `2^(n−1)` cells in all; `Z_0, Z_1` are
points. Pull back each of the four Hurwitz covers along the homotopy equivalence and lift cells:
each Hurwitz variant with `n` branch points is homotopy equivalent to a CW complex with at most
`(2|G|)^n` cells (EVW16 Proposition 2.5, p. 11; EVW16 lines 501–505; CD95 Theorem 1.4.1, p. 5, and
Corollary 2.2.3, p. 9; CD95 lines 181, 334). *Proof sketch.* Specialize the Salvetti complex of
ReductiveGroups Layer 11B to the Weyl arrangement of type `A_(n−1)`, the root hyperplanes
`z_i = z_j` of `ℂ^n` with Weyl group `S_n`: its complement is `PConf_n(ℂ)` (the diagonal line is a
`W`-fixed central summand, a contractible factor), its quotient by `S_n` is `Conf_n(ℂ)`, and the
quotient complex has one cell per subset of simple reflections. By ReductiveGroups Layer 11A the
homeomorphism `z ↦ z/√(1 + |z|²)` of `ℂ` onto the open unit disc induces `S_n`-equivariant
homeomorphisms `PConf_n(ℂ) ≅ PConf_n(int D)` and `Conf_n(ℂ) ≅ Conf_n(int D)`, carrying the base
configuration `z_j = j`, `0 ≤ j ≤ n − 1`, to `z_j = j/√(1 + j²)`. Pull each Hurwitz cover of
§IG.5.2 back along the resulting homotopy equivalence `Z_n → Conf_n(int D)`; a covering of degree
`≤ |G|^n` lifts each cell to at most `|G|^n` cells. *Needs:* ReductiveGroups Layers 11A, 11B
(gap:reductive-salvetti-homotopy-type); §§IG.5.1, IG.5.2; AlgebraicTopology Layer 4, §5.3.

- For `n ≥ 1` the `q`-cells of `Z_n` are indexed by the `q`-element subsets of `{1, …, n − 1}`.
- `Z_n` is homotopy equivalent to `Conf_n`, compatibly with the identification of the fundamental
  group with `TauCeti.BraidGroup n`.
- Pullback along the equivalence gives homotopy-equivalent finite covers with one lifted cell per
  sheet over each cell.
- Each of `Hur_n`, `CHur_n`, `Hur_n/G`, `CHur_n/G` has a CW model with at most `(2|G|)^n` cells.

**Checks.**

- `Z_2` has one vertex and one edge and is a circle, matching `Conf_2 ≃ S¹`.
- `Z_3` has one 0-cell, two 1-cells and one 2-cell, attached along the relation
  `x y x = y x y` of `B_3`.
- For nontrivial `G`, `CHur_0` is empty and has no cells; a model with a forced base point would be
  wrong.
- A `d`-sheeted cover lifts each open cell to `d` cells; omitting the sheet factor would give the
  bound `2^n` for `Hur_n`.
- The transport `z ↦ z/√(1 + |z|²)` of ReductiveGroups Layer 11A sends `0 ↦ 0`, `1 ↦ 1/√2` and
  `2 ↦ 2/√5`, so the base configuration
  `(0, 1)` of `Conf_2(ℂ)` goes to `(0, 1/√2)` in the open unit disc, and its inverse sends `1/√2`
  back to `1`. It fixes the empty configuration and commutes with every permutation of the
  coordinates; a constant rescaling such as `z ↦ z/2` is not onto the open disc and gives no
  homeomorphism of configuration spaces.
- The supplier's model is for crystallographic arrangements, and `S_n` is the Weyl group of type
  `A_(n−1)`; for `n = 3`, `W = S₃` of type `A₂`, the quotient has cell counts `(1, 2, 1)`. A
  noncrystallographic dihedral group such as `I₂(5)`, whose Cartan product `4 cos²(π/5)` is
  `(3 + √5)/2`, is not needed.

### 5.2 The uniform field Betti bound

Prove: for a nonsplitting class `c` of a finite group `G` there is `C`, depending only on `(G, c)`,
such that for every permitted field `k` and all `i, n ≥ 0`, each of `H_i(Hur_n; k)`,
`H_i(CHur_n; k)`, `H_i(Hur_n/G; k)`, `H_i(CHur_n/G; k)` has dimension at most `C^(i+1)`; one can take
`C = (2|G|)^(A + B + a + 1)` (EVW16 Proposition 2.5, p. 11, and proof of Proposition 7.8, p. 35;
EVW16 lines 1596–1602). This is `uniform_betti_bound` in Lean, with the four spaces given by
`HurwitzFibre c full n` and `UnmarkedFibre c full n`. *Proof sketch.* Every Betti number with `n`
branch points is at most `(2|G|)^n` by §5.1. If `n > A i + B`, invert stabilizations of degree
`a` along the residue class of `n` modulo `a` down to some `m ≤ A i + B + a`; every inverted map has
source degree above the threshold. Then `(2|G|)^m ≤ C^(i+1)`. *Needs:* §5.1, §4.2, §4.3,
§4.5, §0.5.

**Checks.**

- For `G` trivial, `dim H_i(B_n; k) ≤ C^(i+1)` for all `n`, consistent with `H_i(B_n; k)` being
  independent of `n` for `n ≥ 2i`.
- The reduction keeps the residue class of `n` modulo `a`; stabilization by one branch point is not
  available.
- For `i = 0` and `S₃` with transpositions, `dim H_0(Hur_n; k)` is the number of braid orbits on
  `c^n`, bounded independently of `n` by §0.8, whereas for `S₄` with transpositions it is
  unbounded and no `C` exists.

### 5.3 The uniform étale Betti bound

Prove: let `G` be finite and centreless, `c` a rational conjugacy class, generating `G` and
nonsplitting, `q` a prime power prime to `|G|`, and `Hn^c_{G,n}` the Hurwitz scheme over
`ℤ[1/|G|]` of tame `G`-covers of `ℙ¹` branched at `n` points of `𝔸¹` and possibly at `∞`, whose
inertia at each of the `n` finite branch points has a generator in `c`, with no condition at `∞`
(the class locus of §IG.5.3; EVW16 §7.3, p. 32; EVW16 lines 1461–1466). There is `C = C(G, c)` such
that for every `i, n ≥ 0` and every prime
`ℓ > max(|G|, q, n)`,
`dim_(ℚ_ℓ) H^i_ét(Hn^c_{G,n} ⊗ 𝔽̄_q, ℚ_ℓ) ≤ C^(i+1)` and
`dim_(𝔽_ℓ) H^i_ét(Hn^c_{G,n} ⊗ 𝔽̄_q, 𝔽_ℓ) ≤ C^(i+1)`
(EVW16 Proposition 7.8 and (7.8.1), p. 34; EVW16 lines 1578–1606; Remark 7.9, p. 35).
*Proof sketch.* If `G` is trivial then `c = {1}`; a cover with trivial group is unramified, so
`Hn^c_{1,0}` is `Spec ℤ` and `Hn^c_{1,n}` is empty for `n ≥ 1`, and every dimension is `1` for
`(i, n) = (0, 0)` and `0` otherwise, at most `C^(i+1)` for every `C ≥ 1`. Otherwise `1 ∉ c`,
because the class `{1}` generates only the trivial group, so `c ⊆ G ∖ {1}`. For the given `n`,
§IG.5.5 identifies the mod-`ℓ` étale cohomology with `H^i(Hn^c_{G,n}(ℂ), 𝔽_ℓ)`. §IG.5.3 identifies
`Hn_{G,n}(ℂ)` with the quotient by `G` of the Hurwitz space `CHur^{c₁}_{G,n}` of the plane,
`c₁ = G ∖ {1}`, whose fibre over a configuration is the set of generating tuples of local
monodromies at the `n` finite branch points, all different from `1`. In it the class locus is the
open and closed part where each local monodromy, a generator of the inertia group at its branch
point, lies in `c`: as `c` is rational the condition does not depend on the generator, and as `c`
is conjugation invariant it descends to the quotient, so this part is `CHur^c_{G,n}/G` of the plane.
The homeomorphism `Conf_n(ℂ) ≅ Conf_n(int D)` of ReductiveGroups Layer 11A comes from
`z ↦ z/√(1 + |z|²)`, which extends to a homeomorphism from `ℂ` with its circle of directions at `∞`
adjoined onto `D`, that circle going to `∂D`. §IG.5.2 identifies `Hur_{G,n}` with the space of
marked branched `G`-covers of `D`; transporting marked covers along this extension, with the base
point near `∞` read on the circle at `∞`, identifies the plane `CHur^c_{G,n}` with the pullback of
`CHur_n` along `Conf_n(ℂ) ≅ Conf_n(int D)`, compatibly with simultaneous conjugation. Hence
`Hn^c_{G,n}(ℂ)` is homeomorphic to `CHur_n/G`. Its mod-`ℓ` cohomology has the dimension of its
mod-`ℓ` homology, a finite complex being given by §5.1, and §5.2 with `k = 𝔽_ℓ` (permitted, as
`ℓ > |G|`) bounds it. The coefficient towers of §IG.5.5 bound the `ℚ_ℓ`-dimension by the
`𝔽_ℓ`-dimension. Only the comparison at the given `n` is used; no comparison at `n + a` and no
Frobenius-equivariant stabilization is needed. *Needs:* §5.2, §4.5; §IG.5.2 *Marked topological
Hurwitz spaces*, *Forgetting the boundary marking*; §IG.5.3 *Arithmetic Hurwitz stacks and
schemes*, *Analytic and topological Hurwitz comparison*; §IG.5.5 *Fixed-degree Hurwitz mod-`ℓ`
comparison*, *Coefficient towers and rational Betti dimensions*; ReductiveGroups Layer 11A.

**Checks.**

- The prime `ℓ` depends on `n`; a comparison between the degrees `n` and `n + a` through the fixed-degree
  isomorphisms would need `ℓ > max(|G|, q, n + a)`.
- The rank inequality can be strict: `H¹(ℝP², 𝔽₂) = 𝔽₂` while `H¹(ℝP², ℚ) = 0`; the bound is an upper
  bound only.
- Rationality of `c` is needed for the class locus over `ℤ[1/|G|]` (§IG.5.3); the topological
  stability theorems do not use it.
- If `c` does not generate `G`, `Hn^c_{G,n}` is empty and the bound is trivial (EVW16 Remark 7.9).
- Identity inertia. `G = 1`, `c = {1}`, `n = 1` satisfies every hypothesis; the exact-branch scheme
  `Hn^c_{1,1}` is empty, with `H^0` of dimension `0`, whereas `CHur_1/G = Conf_1` is contractible,
  with `H_0` of dimension `1`. So `Hn^c_{G,n}(ℂ)` is not `CHur^c_{G,n}/G` when `1 ∈ c`, and the
  trivial group is treated separately. For `S₃` with its transpositions, `1 ∉ c` and the comparison
  applies unchanged.
- The class condition is at the finite branch points only. For `S₃`, its transpositions and
  `n = 2`, the six generating pairs `(t, t')`, `t ≠ t'`, all have boundary product a `3`-cycle, so
  each such cover is ramified at `∞` with inertia outside `c`. The fibre of `CHur_2/G` is one
  point, the six pairs up to the free conjugation of `S₃`; imposing the condition at `∞` as well
  would make the fibre of `Hn^c_{S₃,2}(ℂ)` empty.

### Examples

- `G = S₃`, `c` the transpositions, `q` odd and prime to `3`: the étale Betti numbers of the Hurwitz
  schemes of connected `S₃`-covers of `𝔸¹` with `n` branch points are bounded by `C^(i+1)`
  uniformly in `n`; `S₃ = C₃ ⋊ C₂` is the case `A = C₃` of the groups `A ⋊ C₂` used by EVW for the
  `3`-parts of class groups of quadratic function fields.

### Dependencies

Layers 0–4; ReductiveGroups Layers 11A, 11B; §§IG.5.1–IG.5.3, IG.5.5; AlgebraicTopology
Layer 4, §5.3.

## Notes on the sources

The theorem and equation numbers of EVW16 agree in the arXiv version and the published article; the
following statements of the source are corrected where they are used.

- EVW16 Definition 2.2 (p. 9; EVW16 lines 395–413): the description of the fibres lists the
  generating tuples of `c^n` and of `G^n` in the wrong order, and calls `Sur(π, G)` a subset of
  `Hom^c(π, G)`. The fibre of `CHur_{G,n}` is the set of generating tuples in `G^n`, that of
  `CHur^c_{G,n}` the generating tuples in `c^n`, and only `Sur^c(π, G)` lies in `Hom^c(π, G)`. The
  parent's §IG.5.2 uses the corrected fibres.
- EVW16 proof of Lemma 4.6 (p. 18; EVW16 line 852): the tensor product before (4.6.3) is written
  `M ⊗_R R[U]`; it is `R[U] ⊗_R M`, as in (4.6.3), since `M` is only a left module.
- EVW16 §5.2 (p. 23; EVW16 lines 1062–1067): `A_q = B_n/L_q` is stated for all `q`; it holds for
  `0 ≤ q < n`, and `A_q = ∅` for `q ≥ n`, since a `q`-simplex needs `q + 1` distinct endpoints. For
  `n = 1` the formula would give a point `A_1 = B_1/L_1`.
- EVW16 (6.1.6) (p. 29; EVW16 line 1325): the diagonal of `U` on the stratum of exact image `Q` is
  `U_Q` itself, not `|c|/|c ∩ Q| · U_Q`; summands with `g ∉ Q` leave the stratum, and each
  summand with `g ∈ Q` occurs once. The induction is unaffected.
- EVW16 Proposition 4.13 and (4.5.3) (pp. 18, 21; EVW16 lines 825–827, 979–988): the bound replaces
  `(q − i) + A1 i` by `A1 q`, which needs `A1 ≥ 1`, while (4.5.3) allows `A1 = A(R) = 0`. For `G`
  trivial, `R = k[t]`, `U = t`, `M = k`: `A(R) = 0`, `A2 = 1`, the stated bound is `2` for every `q`,
  but `H_3 K(k) = k[3]`. The constants of the conventions, with `A1 ≥ max(1, a, A(R))`, repair it;
  Theorem 4.2 and Theorem 6.1 hold with them.
- EVW16 proof of Lemma 4.7 (p. 19; EVW16 lines 872–885): the spliced resolution is displayed with
  `P_0 = P_1 = R`, but multiplication by `U` has degree `a`; the homogeneous complex is `P_0 = R`,
  `P_1 = R[a]`, `P_j = Q_(j−2)[a]`, and `A1 ≥ a` absorbs the shift in the induction.
- EVW16 (7.8.3) (p. 35; EVW16 line 1599): the stabilization is written from `n` to `n + D`; it goes
  from `n` to `n + D d = n + deg U`, and the fixed-degree comparison at both ends needs
  `ℓ > max(|G|, q, n + deg U)`. §5.3 avoids this comparison.
- EVW16 §5.5 and proof of Proposition 5.6 (p. 25; EVW16 lines 1151–1153 and 1203–1205): the arcs
  are ordered counterclockwise at `∗`, while the direction of the half twist `σ_j` is left open
  (EVW16 lines 360–368). With the counterclockwise half twist of ReductiveGroups Layer 11A the face
  formula `∂_i(v_q) = s_(q,i) v_(q−1)` holds for the clockwise order, which §2.2 uses (§2.5,
  Checks); the counterclockwise order goes with the clockwise half twist.
- EVW16 §7.3 and Lemma 7.4 (p. 32; EVW16 lines 1461–1471): the class locus asks a generator of
  inertia at each branch point of the cover to lie in `c`, while Lemma 7.4 identifies its complex
  points with `CHur^c_{G,n}/G`, which puts no condition on the boundary monodromy. The two agree
  when the condition is read at the `n` finite branch points only, as §5.3 states it (§5.3,
  Checks).
- HW10 Lemma 7.1 and Proposition 7.2 (pp. 34–35; HW10 lines 1625–1644) take `Δ_0` finite; it has to
  be nonempty, since for `Δ_0 = ∅` there are no arcs. They are stated for a connected surface with
  `Δ_0` on one boundary circle, and on an orientable surface of positive genus the pieces cut off
  in the proof of Proposition 7.2 can carry copies of a point of `Δ_0` on two boundary circles;
  §2.6 states both results for discs, a family closed under that cutting.

## Downstream consumers

- ArithmeticStatisticsPartVIII takes the uniform étale Betti bound for its §5.19 from its own
  §5.16 (*Uniform Betti numbers of Hurwitz schemes*), with the hypotheses of §5.3 here: `G`
  centreless, `c` rational, nonsplitting and generating, coefficient primes `ℓ > max(|G|, q, n)`.
- HomologicalStabilityOfGeneralLinearGroups names this roadmap as the owner of homological
  stability for Hurwitz spaces and consumes none of its targets.
- A roadmap that needs the unmarked stability or the field Betti bounds for a group with
  nontrivial centre, or for `Hur_n/G`, cites §4.5 and §5.2.

## Worked examples

- *The trivial group.* `G = {1}`, `c = {1}`: fibres are points, `Hur_n = Conf_n`, `R = k[t]`,
  `U = t^D`, the K-complex of `R` (for `D = 1`) has `H_q = k` in degree `q` for even `q` and no odd
  homology, `A(R) = 0`, `A1 = 1`, and
  §4.2 is the homological stability of braid groups. The same example shows that EVW's
  Proposition 4.13 needs `A1 ≥ 1` (§1.16).
- *`S₃` and its transpositions.* `c` is nonsplitting (§0.2). For `n = 2` there are nine tuples,
  five braid orbits (three constant, two of size three with boundary products `(123)` and `(132)`),
  six generating tuples in two orbits, and two classes under conjugation. `U_1 = Σ_t r_t²` has degree
  two, and `U_1 : R_n → R_(n+2)` is eventually an isomorphism.
- *`S₄` and its transpositions.* Not nonsplitting; `dim H_0(Hur_n; k)` grows with `n` and no stability
  of components holds (§0.1, §0.8).

## References

- [EVW16] J. S. Ellenberg, A. Venkatesh, C. Westerland, *Homological stability for Hurwitz spaces
  and the Cohen–Lenstra conjecture over function fields*, Ann. of Math. 183 (2016), 729–786;
  [arXiv:0912.0325v4](https://arxiv.org/abs/0912.0325v4). Locators give the theorem number, the
  page of the arXiv version and its line in the cached text.
- [HW10] A. Hatcher, N. Wahl, *Stabilization for mapping class groups of 3-manifolds*, Duke Math.
  J. 155 (2010), 205–269; [arXiv:0709.2173v4](https://arxiv.org/abs/0709.2173v4), §7, Lemma 7.1 and
  Proposition 7.2, and Definition 3.4.
- [CD95] R. Charney, M. W. Davis, *Finite `K(π, 1)`s for Artin groups*, in *Prospects in Topology*,
  Ann. of Math. Stud. 138 (1995), 110–124;
  [author's copy](https://people.math.osu.edu/davis.12/finitekpi1.pdf), §1.2, Theorem 1.4.1,
  Lemma 2.2.1, Corollary 2.2.3.
- [SMA59] S. Smale, *Diffeomorphisms of the 2-sphere*, Proc. Amer. Math. Soc. 10 (1959), 621–626;
  [AMS open archive](https://www.ams.org/journals/proc/1959-010-04/S0002-9939-1959-0112149-8/),
  Theorem B and Theorem 4. Locators give the line in the cached text.
- [PAL60] R. S. Palais, *Local triviality of the restriction map for embeddings*, Comment. Math.
  Helv. 34 (1960), 305–312, [doi:10.1007/BF02565942](https://doi.org/10.1007/BF02565942),
  Theorem A and §3; cited by its locator.
- [ALEX23] J. W. Alexander, *On the deformation of an n-cell*, Proc. Nat. Acad. Sci. USA 9 (1923),
  406–407, [doi:10.1073/pnas.9.12.406](https://doi.org/10.1073/pnas.9.12.406); cited by its
  locator.
- [HAT91] A. Hatcher, *On triangulations of surfaces*, Topology Appl. 40 (1991), 189–194;
  [author's revised version](https://pi.math.cornell.edu/~hatcher/Papers/TriangSurf.pdf), the
  Theorem and its proof. Locators give the page and the line of the author's version.
- [WAH08] N. Wahl, *Homological stability for the mapping class groups of non-orientable surfaces*,
  Invent. Math. 171 (2008), 389–424; [arXiv:math/0601310v2](https://arxiv.org/abs/math/0601310v2),
  Lemma 2.5.
