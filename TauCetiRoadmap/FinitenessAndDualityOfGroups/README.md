# Roadmap: finiteness and duality of groups

**Summary.** This roadmap develops the homological finiteness and dimension theory of discrete
groups over an arbitrary commutative ring `R`, on Mathlib's carriers `groupCohomology`,
`groupHomology`, `tateCohomology` and `Rep R G`, and on Tau Ceti's module-level notions of
pseudocoherence, finite projective dimension and Gorenstein-projective objects. It defines the
finiteness types `FP_n`, `FP_∞`, `FP` and `FL` of a group over `R`, proves the Bieri–Eckmann–Brown
criterion by direct limits and products and the stability of the types under finite index,
extensions, products, amalgams and HNN extensions; defines cohomological and homological dimension
`cd_R` and `hd_R` with their behaviour under subgroups, extensions, directed unions and amalgams,
and the dichotomy for finite subgroups; constructs the signed tensor induction of complexes and
proves Serre's theorem that a torsion-free group has the cohomological dimension of each of its
finite-index subgroups; develops virtual cohomological dimension, the virtual types and groups of
finite homological type; defines geometric dimension and proves the Eilenberg–Ganea theorem;
develops duality and Poincaré duality groups over `R` with their dualizing module, orientation
character, criterion and inheritance; defines the Hattori–Stallings rank of projective modules over
group rings and proves Swan's theorem in its rational and mod-`p` forms; defines the Euler
characteristic of groups of finite homological type and proves its multiplicativity under finite
index and extensions, the equivariant formula for actions on acyclic complexes, and the
denominator theorem for groups of finite homological type, through Serre's action with finite
stabilizers on a finite-dimensional acyclic simplicial set and the classical Smith theory of finite
`p`-groups acting on such simplicial sets; and constructs
complete resolutions and Farrell cohomology for groups with a finite-index subgroup of finite
cohomological dimension, compared with ordinary cohomology above that dimension and with Tate
cohomology for finite groups. The end theorems are the finiteness criterion (1.5), Serre's theorem
(3.2), the Eilenberg–Ganea theorem (5.3), the duality criterion (6.3), the Euler characteristic of
groups of finite homological type with its multiplicativity (8.4, 8.6) and equivariant formula
(8.7), Brown's denominator theorem (8.9), and the comparison of Farrell cohomology with ordinary
cohomology above the virtual cohomological dimension (9.4).

## Scope and ownership

This roadmap owns the finiteness, dimension, duality and Euler-characteristic theory of discrete
groups and the Farrell cohomology of groups of finite virtual cohomological dimension. The group
`G` is an arbitrary group and the coefficients form an arbitrary commutative ring `R`; `R = ℤ` is an
instance, and a statement is made over `ℤ` only where the theory is integral: Serre's theorem, the
virtual cohomological dimension, the Euler characteristic, and Poincaré duality from abstract
isomorphisms. No other roadmap plans these objects:
CohomologyOfGroups excludes them by name in its Scope and describes a roadmap on finiteness
conditions and duality groups among its downstream consumers.

**Already in the library and used as it stands.** Mathlib's `groupCohomology`, `groupHomology` and
`tateCohomology` on `Rep R G`; the comparisons `groupCohomologyIsoExt`, `groupHomologyIsoTor` and
`groupCohomologyIso`; Shapiro's lemma `groupCohomology.coindIso` and `groupHomology.indIso`; the
equivalence `Rep.equivalenceModuleMonoidAlgebra` with modules over `MonoidAlgebra R G`;
`HasProjectiveDimensionLE`; `Group.IsFinitelyPresented`, `Monoid.PushoutI`, `HNNExtension`; the
cohomology of finite cyclic groups `Rep.FiniteCyclicGroup.groupCohomologyIsoEven`. Tau Ceti's
pseudocoherence `TauCeti.Huber.IsPseudoCoherentOver` with its degree-by-degree, two-out-of-three
and restriction-of-scalars lemmas; finite projective dimension `TauCeti.Module.IsFPD` with
`TauCeti.Module.isFPD_iff_hasProjectiveDimensionLE`; the least bound `TauCeti.leastENatBound`;
totally acyclic complexes of projectives and Gorenstein-projective objects in an abelian category
(`CochainComplex.IsTotallyAcyclicProjective`, `CategoryTheory.isGorensteinProjective`) with their
Frobenius exact structure and the comparison theorem for complete resolutions
(`TauCeti.ExactStructure.CompleteResolution.homotopyEquiv`); the cellular resolution of an
aspherical CW complex `TauCeti.cellularResolutionOfIsAspherical`; the universal cover
`TauCeti.UniversalCover` as a quotient covering for the fundamental group, and semilocal simple
connectivity of locally contractible spaces; cell attachment, the Hurewicz and Whitehead theorems;
the vanishing of characters of projective modules at `p`-singular elements
`TauCeti.trace_ofModule'_eq_zero_of_dvd_orderOf`; Swan's theorem for `ℤ_p[G]`,
`TauCeti.nonempty_linearEquiv_of_projective_of_tensorRat`; the determination of
finite-dimensional representations of a finite group by their characters in characteristic zero,
`FDRep.nonempty_iso_of_character_eq`; and the Grothendieck group of an abelian category
`TauCeti.AbelianK0` with its Euler–Poincaré relation for bounded complexes; Tau Ceti's CW
structure `AbstractSimplicialComplex.realizationCWComplex` on the realization of an abstract
simplicial complex with its ordered cellular chains `TauCeti.cellularChainComplexRealizationIso`;
Mathlib's simplicial sets with group actions (`CategoryTheory.Action`), their homology
`SSet.homology` and normalized chains, and induced representations `Rep.ind`; Mathlib's
Euler characteristic of a complex of modules `HomologicalComplex.homologyEulerChar`, the cohomology
and homology functors `groupCohomology.functor` and `groupHomology.functor` with the comparison maps
`CategoryTheory.Limits.colimit.post` and `CategoryTheory.Limits.piComparison`; Tau Ceti's
comparison of continuous with discrete cohomology of a finite discrete group in every degree,
`TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology`; and Tau Ceti's
vanishing of the homology of a directed union of subgroups whose homology vanishes,
`TauCeti.groupHomology.isZero_groupHomology_of_directed`, which is all that 2.5(a) and 6.4 use of
the behaviour of homology under directed unions. Exact statements are under Exact supplier
contracts.

**Owned elsewhere and imported by section.**
- CohomologyOfGroups owns the operations on group (co)homology used throughout: permutation
  modules and Shapiro isomorphisms for `G`-sets (§1.4), the quotient action on the cohomology of a
  normal subgroup (§1.2), the comparison of continuous and discrete cohomology of a discrete group
  (§1.5), the orbit spectral sequence of a monomial complex (§3.2), the chain complex of a tree and
  the tree, amalgam, HNN and free-group sequences (§§3.4–3.6), the cap product (§4.6), the universal
  coefficient sequences (§5.2) and the Hochschild–Serre spectral sequences with convergence
  (§§6.2–6.3). This roadmap proves no spectral sequence and no product.
- SpectralSequencesAndConvergence owns the Euler identity of a spectral sequence converging in
  every total degree with finite filtrations and a page with finitely many nonzero terms in a weak
  Serre class (§3.4), and its form for the spectral sequence of a complex with a filtration finite
  in each degree (§5.3). 8.6 and 8.7 apply it, with the finite-dimensional `ℚ`-vector spaces and
  their dimension, to the Hochschild–Serre and orbit spectral sequences of CohomologyOfGroups.
- FreeGroupsAndLimitGroups owns graphs of groups, the identification of one-edge splittings with
  Mathlib's amalgams and HNN extensions (§4.5), the Bass–Serre tree (§4.7), the structure theorem
  for actions on trees (§4.8) and the fixed points of finite groups acting on trees (§4.9).
- EtaleCohomologyFoundations §F.10.3 owns the Hattori–Stallings trace of finite projective modules
  over an arbitrary ring with its additivity and scalar extension, and, for a finite group, the
  identity-coefficient trace with the centralizer formula `Tr_Λ(γ, P) = |Z_γ| · Tr^{Z_γ}_Λ(γ, P)`;
  Layer 7 specialises the trace to group rings, and 7.2 imports the centralizer formula, proving
  only its comparison with the conjugacy-class coordinates of the rank of 7.1.
- ClassifyingSpaces owns `K(G, 1)` CW complexes, their uniqueness up to homotopy equivalence
  (Stage 3 item 12), their cellular chains as free resolutions (Stage 4 item 16) and the
  identification of their (co)homology with local coefficients with group (co)homology (Stage 4
  item 17). AlgebraicTopology owns the local contraction of an arbitrary Hausdorff CW complex within
  each neighbourhood of a point (§4.7), singular (co)homology with local coefficients and its
  homotopy invariance (§6.1), cellular connectivity (§8.1), the absolute Hurewicz theorem in every
  universe (§8.3), Whitehead's theorem (§8.5), the finite CW type of compact Hausdorff smooth
  manifolds (§8.7), twisted Poincaré duality of manifolds (§§6.3–6.4), and the replacement of CW
  complexes by abstract simplicial complexes (§8.11a). The form of that replacement with the
  dimension bound of Hatcher2002 Theorem 2C.5, which §8.11a does not state and Serre's
  construction needs, is 5.4 here.
- ProfiniteCohomology Layer 11 owns the cohomological dimension of profinite groups, carried by Tau
  Ceti's `TauCeti.cohomologicalDimension` (continuous cohomology with discrete torsion
  coefficients). The invariant of this roadmap is the discrete one, under another name, compared
  with it in 2.8. ProfiniteCohomology §13.2 owns the Evens norm, built from a tensor induction of
  the coinduced resolution of a compact open subgroup of a profinite group in continuous
  cohomology; the signed tensor induction 3.1 of complexes of modules over a subgroup of finite
  index of a discrete group, the input of Serre's theorem, is a different construction and is owned
  here.
- Instances owned elsewhere and not restated: ArithmeticKTheory §3.2 owns the Borel–Serre duality of
  torsion-free finite-index subgroups of `Aut(P)` with the Steinberg dualizing module, an instance
  of Layer 6; FuchsianOrbifolds Layer 5 item 6 owns the orbifold Euler characteristic of a Fuchsian
  group by its signature, whose value `−1/6` at `PSL(2, ℤ)` is the value 8.7 gives the free product
  `ℤ/2 ∗ ℤ/3`; BianchiModularForms §9.3 owns the orbifold Euler characteristics of Bianchi groups;
  BordismFormalGroups owns a complete resolution of the profinite Morava stabilizer groups, a
  continuous theory distinct from Layer 9.
- GorensteinHomologicalAlgebra owns Gorenstein dimensions of modules over rings and excludes
  complete cohomology of groups. Layer 9 uses only the pinned Gorenstein-projective objects of an
  abelian category and owns Farrell cohomology.
- SheafTheoreticSmithTheory owns Smith restriction for prime-order actions on étale sheaves, a
  different theory. The classical Smith theory of 8.8 (finite `p`-groups acting on
  finite-dimensional simplicial sets with finite mod-`p` homology) and Serre's construction 5.5 of a
  finite-dimensional acyclic simplicial set with finite stabilizers have no other owner and are
  owned here.

**Out of scope.** Stallings' theorem on ends and the Stallings–Swan theorem that a group of
cohomological dimension one is free (so the classification of duality groups of dimension one is not
stated). Separations of the finiteness types (Bestvina–Brady groups, a group of type `FP_2` that is
not finitely presented) and the Eilenberg–Ganea problem in dimension two. The inequality
`cd_R G ≤ hd_R G + 1` for countable groups, which needs the Govorov–Lazard theorem over
noncommutative rings. Brown's refinements of the denominator theorem through the poset of nontrivial
finite subgroups, which need its equivariant Euler characteristic and the acyclic-cover comparison
of Brown1974 Appendix B: Theorem 5 for a nonempty family of finite subgroups, its Corollaries 2 and
3, Theorem 6 with the formula for `χ − χ_ℚ`, and the `p`-fractional part of `χ` (Brown1974 §§6–7).
Products on Farrell cohomology, which need a complete diagonal approximation. `L²`-invariants,
Bieri–Neumann–Strebel invariants, and the comparison of the Hattori–Stallings and rational Euler
characteristics beyond type `FL` (the Bass conjecture). The dimension theory of profinite groups.

## Conventions

- **Universes and rings.** `R G : Type u`, `[CommRing R]`, `[Group G]`; representations are objects
  of `Rep.{u} R G`, the generality of Mathlib's `groupCohomology` and `groupHomology`. For `R = ℤ`
  the group lies in `Type`, and so do the spaces of Layer 5 and the manifolds of 6.6. Subgroups
  `H ≤ G` carry restricted representations `Rep.res H.subtype M`, written `M`.
- **Group rings and modules.** `RG = MonoidAlgebra R G`. Representations and left `RG`-modules are
  identified by `Rep.equivalenceModuleMonoidAlgebra`; the trivial module `R` is
  `(Representation.trivial R G R).asModule`. A right module is turned into a left module by
  `g · m = m · g⁻¹` (BieriEckmann1973 lines 122–124); tensor products `M ⊗_R N` and `Hom_R(M, N)` of
  representations carry the diagonal action `g(m ⊗ n) = gm ⊗ gn`, `(g · f)(m) = g f(g⁻¹ m)`,
  Mathlib's monoidal and internal-hom structures on `Rep`. The group ring `RG` as a coefficient
  representation carries the left regular action; `Hᵏ(G, RG)` then carries the action induced by
  right multiplication by `g⁻¹` on the coefficients, which commutes with the left action.
  Witness: for `G = ℤ = ⟨t⟩`, `H¹(G, RG) = RG/(t − 1)RG ≅ R` and right multiplication by `t⁻¹`
  acts trivially on it.
- **Finiteness index.** `n ∈ ℕ∞`; `FP_∞` is `FP_⊤`. The index of the types is that of
  pseudocoherence: `FP_0` means that the trivial module is finitely generated over `RG` (every
  group), `FP_1` that it is finitely presented. Witness: the additive group `ℚ` is of type `FP_0`
  and not of type `FP_1` over any nonzero `R`; the model shifted by one degree would make `FP_0`
  equivalent to finite generation of `ℚ`.
- **Dimensions.** `cd_R G` and `hd_R G` are valued in `ℕ∞` through `TauCeti.leastENatBound`, so a
  group with cohomology in infinitely many degrees has dimension `⊤`. Over the zero ring every
  representation is zero and every group has `cd_0 G = hd_0 G = 0`; statements about torsion,
  duality groups and Euler characteristics assume `R` nontrivial, and the zero ring is a
  negative-control Check where it matters.
- **Indices.** `[G : H]` is `H.index`, which is `0` for infinite index; every statement using it
  assumes `H.FiniteIndex`.
- **Cap product and duality map.** The cap product is CohomologyOfGroups §4.6's
  `∩ : Hᵏ(G, M) ⊗ Hₙ(G, N) → Hₙ₋ₖ(G, P)` for a pairing `μ : M ⊗ N ⟶ P`, adjoint to the cup product
  without sign. For `e ∈ Hₙ(G, D)` the *duality map* is `x ↦ x ∩ e` for the pairing
  `β : M ⊗ D ⟶ D ⊗ M` (the symmetry of `Rep`), a map `Hᵏ(G, M) → Hₙ₋ₖ(G, D ⊗_R M)` defined for
  `k ≤ n`; for `k > n` the duality statements are vanishing statements, since natural-number
  subtraction would read `n − k` as `0`. Witness: for `G = ℤ = ⟨t⟩`, `D = R` and `e` the class of
  the cycle `[t]`, the duality map `H¹(ℤ, R) = Hom(ℤ, R) → H₀(ℤ, R) = R` sends `x` to `x(t)`.
- **Hattori–Stallings rank.** For a finitely generated projective left `RG`-module `P`, `r_P` is the
  finitely supported function on conjugacy classes of `G` whose value at `[g]` is the coefficient of
  `[g]` in the Hattori–Stallings trace of `P` in `RG/[RG, RG] ≅ R^{(G/conj)}`. Witness: for `G`
  finite with `|G|` invertible in `R` and `P = R·e`, `e = |G|⁻¹ Σ_g g`,
  `r_P([g]) = |[g]|/|G| = 1/|C_G(g)|`. For `R ≠ 0` and `G ≠ 1` this is not `δ_{[1]}`, although
  `P ≅ R` is cyclic: at `g ≠ 1` the value `1/|C_G(g)|` is a unit, hence nonzero (for `G = ℤ/2` over
  `ℚ`, `r_P = (1/2, 1/2)` against `δ_{[1]} = (1, 0)`). The difference lies at the nonidentity
  classes, since the identity coefficients can agree (for `G = ℤ/4` over `𝔽₃`, `1/4 = 1`). For
  `G = 1` or `R = 0` the two functions coincide.
- **Euler characteristics.** Two invariants are kept apart. For a group with `H_*(G, ℚ)`
  finite-dimensional, `χ_ℚ(G) = Σᵢ (−1)ⁱ dim_ℚ Hᵢ(G, ℚ) ∈ ℤ`; for a group of finite homological type
  (4.4), the Euler characteristic `χ(G) ∈ ℚ` is `χ_ℚ(H)/[G : H]` for a torsion-free finite-index `H`
  (8.4). They agree on torsion-free groups of finite homological type. Witness: for `G = ℤ/2`,
  `χ_ℚ(G) = 1` (rational homology is `ℚ` in degree `0`) while `χ(G) = χ_ℚ(1)/2 = 1/2`; for `G = ℤ`
  both are `1 − 1 = 0`. The cohomological sum `Σ(−1)ⁱ dim Hⁱ(G, ℚ)` equals `χ_ℚ(G)` by universal
  coefficients over a field. Both are total functions on groups `G : Type` (`rationalEulerChar`,
  `groupEulerChar`), with the conventions of `HomologicalComplex.homologyEulerChar`: a sum with
  infinitely many nonzero terms is `0`, the dimension of an infinite-dimensional space is `0`, and
  `χ(G) = 0` when `G` has no torsion-free subgroup of finite index or when two such subgroups give
  different values of `χ_ℚ(H)/[G : H]` (for the free group of countable rank, whose rational
  homology is infinite-dimensional in degree `1`, the whole group gives `1/1` and a subgroup of
  index `2` gives `1/2`, so `χ = 0`). Every statement about them carries hypotheses under which
  these conventions do not occur.
- **Complete resolutions.** A complete resolution is a chain complex `(F_k)_{k ∈ ℤ}` with
  `d : F_k → F_{k−1}`; it is turned into a cochain complex by `Fᵏ := F_{−k}` when the pinned
  `CochainComplex.IsTotallyAcyclicProjective` is applied. Farrell cohomology is
  `Ĥᵏ(G, M) = Hᵏ(Hom_G(F, M))` with `Hom_G(F, M)` in degree `k` equal to `Hom_G(F_k, M)`. Witness:
  for `G = ℤ/2` and `M = ℤ`, `Ĥ⁰ = ℤ/2`, `Ĥ⁻¹ = 0`, `Ĥ¹ = 0`, `Ĥ² = ℤ/2`; the model shifted by one
  degree gives `Ĥ⁰ = 0`.
- **Spectral sequences.** Indexing and convergence are those of CohomologyOfGroups §§6.2–6.3.

## Exact supplier contracts

### From Mathlib

Pinned at `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`.

- `groupCohomology`, `groupHomology`
  (`Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean`,
  `.../GroupHomology/Basic.lean`) for `{k G : Type u}`, `A : Rep.{u} k G`;
  `groupCohomologyIsoExt A n : groupCohomology A n ≅ Extⁿ(k, A)` in `Rep k G`
  (GroupCohomology/Basic.lean line 202) and `groupHomologyIsoTor` (GroupHomology/Basic.lean line
  246); `groupCohomologyIso`, computing cohomology from any projective resolution of the trivial
  representation. These identify `Hᵏ(G, −)` with `Ext^k_{RG}(R, −)` and `Hₖ(G, −)` with `Tor_k`,
  naturally in the coefficient.
- `groupCohomology.coindIso` (`.../GroupCohomology/Shapiro.lean` line 58) and `groupHomology.indIso`
  (`.../GroupHomology/Shapiro.lean` line 65), Shapiro's lemma for any subgroup.
- `tateCohomology` (`.../TateCohomology/Basic.lean`), defined for finite groups in every integer
  degree by the norm splice, with its long exact sequence; `TateCohomology.isoGroupCohomology`.
- `Rep.equivalenceModuleMonoidAlgebra : Rep.{w} k G ≌ ModuleCat k[G]`
  (`Mathlib/RepresentationTheory/Rep/Iso.lean` line 157), `Representation.asModule`
  (`Mathlib/RepresentationTheory/Basic.lean` line 142), `Representation.trivial`, `Rep.res`.
- `groupCohomology.functor R G n`, `groupHomology.functor R G n : Rep R G ⥤ ModuleCat R`
  (`.../GroupCohomology/Functoriality.lean` line 534, `.../GroupHomology/Functoriality.lean` line
  831), for `R G : Type u`;
  `CategoryTheory.Limits.colimit.post F Φ : colimit (F ⋙ Φ) ⟶ Φ.obj (colimit F)`
  (`Mathlib/CategoryTheory/Limits/HasLimits.lean` line 490) and
  `CategoryTheory.Limits.piComparison Φ N : Φ.obj (∏ᶜ N) ⟶ ∏ᶜ (Φ.obj ∘ N)`
  (`Mathlib/CategoryTheory/Limits/Shapes/Products.lean` line 448), the canonical comparison maps of
  1.5; `Rep.{u} R G` has all colimits and limits indexed by types in `Type u`.
- `HasProjectiveDimensionLE X n` (`Mathlib/CategoryTheory/Abelian/Projective/Dimension.lean` line
  53): `Ext^i(X, Y) = 0` for all `Y` and `i ≥ n + 1`, in an abelian category; nothing about finite
  generation.
- `Rep.FiniteCyclicGroup.groupCohomologyIsoEven` (`.../GroupCohomology/FiniteCyclic.lean` line 80):
  for a finite cyclic group generated by `g` and `i > 0` even, `Hⁱ(G, A)` is the homology of
  `A →N A →(g − 1) A`; for trivial `A = R` this is `R/|G|R`.
- `Group.IsFinitelyPresented` (`Mathlib/GroupTheory/FinitelyPresentedGroup.lean` line 95),
  `PresentedGroup`, `FreeGroup`, `Monoid.PushoutI` (`Mathlib/GroupTheory/PushoutI.lean` line 60),
  `HNNExtension` (`Mathlib/GroupTheory/HNNExtension.lean` line 52), `Subgroup.index`,
  `Subgroup.FiniteIndex`.
- `Topology.CWComplex`, `Topology.RelCWComplex.FiniteDimensional` and `RelCWComplex.FiniteType`
  (`Mathlib/Topology/CWComplex/Classical/Finite.lean` lines 40 and 49): finite dimensionality means
  that `cell C n` is empty for all large `n`, finite type that each `cell C n` is finite.
- `Module.Flat` for modules over a commutative ring (used only for `R`-modules, never for
  `RG`-modules), `Module.Projective` and `Module.Finite` over any semiring, `PadicInt`.
- Further carriers the layers name: `MonoidAlgebra` (`Mathlib/Algebra/MonoidAlgebra/Defs.lean` line
  76), the group ring `RG` (1.2, 7.1); `Rep.trivial` (`Mathlib/RepresentationTheory/Rep/Basic.lean`
  line 288), the trivial representation as an object of `Rep` (2.1); `Representation.ofModule'`
  (`Mathlib/RepresentationTheory/Basic.lean` line 191), the representation of `G` on an `RG`-module
  (7.2); `ConjClasses` (`Mathlib/Algebra/Group/Conj.lean` line 133), the conjugacy classes indexing
  Hattori–Stallings ranks (7.1); `PiTensorProduct`
  (`Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean` line 104) and `HomologicalComplex`
  (`Mathlib/Algebra/Homology/HomologicalComplex.lean` line 59) for tensor induction (3.1) and 8.1;
  `QuasiIso` (`Mathlib/Algebra/Homology/QuasiIso.lean` line 138: an isomorphism on homology in every
  degree) and `IsNoetherianRing` (`Mathlib/RingTheory/Noetherian/Defs.lean` line 191) for Wall's
  finite replacement of complexes (8.1); `IsLocalRing` (`Mathlib/RingTheory/LocalRing/Defs.lean`
  line 30) for 7.5; `Sylow` (`Mathlib/GroupTheory/Sylow.lean` line 54) with Sylow's existence
  theorem `Sylow.exists_subgroup_card_pow_prime` (line 723: a finite group whose order is divisible
  by `pⁿ` has a subgroup of order `pⁿ`), for 8.8 and 8.9.
- `CategoryTheory.ProjectiveResolution`
  (`Mathlib/CategoryTheory/Preadditive/Projective/Resolution.lean` line 37), whose `complex` is a
  chain complex indexed by `ℕ`, and `HomologicalComplex.opcycles`
  (`Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean` line 215): the cokernel of the
  differential into degree `n`. For a projective resolution `P` of `R`, `P.complex.opcycles n` is
  the `n`-th syzygy: `R` for `n = 0` (exactness at `P_0`), and the image of `P_n → P_{n−1}` for
  `n ≥ 1`. Used in 9.2.
- `HomologicalComplex.homologyEulerChar` (`Mathlib/Algebra/Homology/EulerCharacteristic.lean`
  line 154): for a complex of modules over a ring, the `finsum` of the signed `Module.finrank` of
  its homology, `0` when infinitely many terms are nonzero; the model of the Euler characteristics
  of complexes in 8.2, 8.8 and 8.9 and of `rationalEulerChar` in 8.3. Over `ℤ`, `Module.finrank`
  of a finitely generated abelian group is the rank of its free quotient (`ℤ ⊕ ℤ/2` has rank `1`).
- `Localization.AtPrime` (`Mathlib/RingTheory/Localization/AtPrime/Basic.lean` line 55), a local
  ring by the instance `Localization.AtPrime.isLocalRing` (line 105), and Nakayama's lemma
  `Submodule.eq_bot_of_le_smul_of_le_jacobson` (`Mathlib/RingTheory/Nakayama.lean` line 117): a
  finitely generated submodule `N` with `N ≤ I • N`, for an ideal `I` contained in the Jacobson
  radical, is zero. It is stated over a commutative ring, so for modules over a group ring of a
  finite group (7.4, 7.5) it is applied over the local coefficient ring.
- `IsMulTorsionFree` (`Mathlib/Algebra/Group/Monoid.lean` line 552), the meaning of *torsion-free*
  throughout: commuting elements with equal nonzero powers are equal; for a group it holds exactly
  when no element other than `1` has finite order (`isMulTorsionFree_iff_not_isOfFinOrder`,
  `Mathlib/GroupTheory/OrderOfElement.lean` line 911). Multiplicative `ℤ` satisfies it and `ℤ/2`
  does not (`s² = 1²` with `s ≠ 1`).
- `SSet`, its chain complex `SSet.chainComplex` and homology `SSet.homology`
  (`Mathlib/AlgebraicTopology/SimplicialSet/Homology/Basic.lean` lines 67 and 124): the unnormalized
  simplicial chains with coefficients in an object of a preadditive category, whose degree-`n` term
  is a coproduct over all `n`-simplices, degenerate ones included, so it does not vanish above the
  dimension (for `Δ[0]` it is `ℤ` in every degree). Homology is always `SSet.homology`; every
  chain-level argument of 5.5, 8.8 and 8.9 uses the normalized chains of
  `Mathlib/AlgebraicTopology/SimplicialSet/Homology/Nondegenerate.lean`:
  `SSet.normalizedChainComplex` (line 43, built from the canonical splitting `SSet.splitting` by
  nondegenerate simplices), whose degree-`n` term is the coproduct over the nondegenerate
  `n`-simplices (`SSet.isColimitCofanNormalizedChainComplex`, line 167);
  `SSet.homotopyEquivNormalizedChainComplex` (line 86), a homotopy equivalence from the unnormalized
  to the normalized chains, so both have the homology `SSet.homology`;
  `SSet.normalizedChainComplexMap` (line 200), the functoriality in simplicial maps;
  `SSet.isZero_normalizedChainComplex_X_of_hasDimensionLT` (line 182) and
  `SSet.isZero_homology_of_hasDimensionLT` (line 252): for `X.HasDimensionLT d` the normalized
  chains and the homology vanish in degrees `≥ d`. A simplicial set is finite-dimensional when
  `SSet.HasDimensionLE X N` holds for some `N`
  (`Mathlib/AlgebraicTopology/SimplicialSet/Dimension.lean` lines 32 and 36: every nondegenerate
  simplex has dimension at most `N`), and `SSet.hasDimensionLE_prod`
  (`Mathlib/AlgebraicTopology/SimplicialSet/FiniteProd.lean` line 66) bounds the dimension of a
  product by the sum of the dimensions.
- `AbstractSimplicialComplex` (`Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean`), whose
  faces are nonempty finite sets closed under passing to nonempty subsets; used in 5.5.
- `SSet.homologyMap` (`Mathlib/AlgebraicTopology/SimplicialSet/Homology/Basic.lean` line 129), the
  map on `SSet.homology` induced by a map of simplicial sets, used with the map
  `CategoryTheory.Limits.terminal.from` to the point to say that a simplicial set is acyclic (5.5);
  `ModuleCat.of` (`Mathlib/Algebra/Category/ModuleCat/Basic.lean` line 79) gives the coefficient
  objects `ℤ` and `𝔽_p = ZMod p` of `SSet.homology` (5.5, 8.8).
- `CategoryTheory.Action V G` (`Mathlib/CategoryTheory/Action/Basic.lean` line 48): an object `V`
  with a monoid homomorphism `ρ : G →* End V`; in this Mathlib `CategoryTheory.End V` is a
  structure, and `(ρ g).asHom : V ⟶ V` is the underlying morphism. With `V = SSet` it is an action
  of `G` by simplicial automorphisms (`ρ g⁻¹` inverts `ρ g`).
  `Action.functorCategoryEquivalence` (line 238) turns it into a functor from the one-object
  category of `G` to `SSet`, whose limit and colimit, computed degreewise, are the simplicial sets
  of fixed simplices and of orbits (5.5, 8.8).
- `Rep.ind φ A` (`Mathlib/RepresentationTheory/Induced.lean` line 102), for `φ : H →* G` and
  `A : Rep k H`, the induced representation `(k[G] ⊗_k A)_H`, the left adjoint of restriction;
  with `φ = S.subtype` for a subgroup `S` it is `Ind_S^G A`. `ChainComplex.single₀`
  (`Mathlib/Algebra/Homology/Single.lean` line 195), the complex
  concentrated in degree `0`; a resolution of the trivial representation is a complex `C` with a
  `QuasiIso` to `single₀` of it (8.7).
- `IsCoveringMap.existsUnique_continuousMap_lifts` (`Mathlib/Topology/Homotopy/Lifting.lean`
  line 489): a map from a simply connected, locally path-connected space lifts uniquely along a
  covering map once the lift of one point is fixed.
- `LocallyContractibleSpace X` (`Mathlib/Topology/Homotopy/LocallyContractible.lean` line 81): every
  neighbourhood `U` of a point contains a neighbourhood `V` of it whose inclusion `V → U` is
  null-homotopic (a predicate, not a class); Mathlib does not prove it for CW complexes. The
  instance making a `DeltaGeneratedSpace` a `LocallyPathConnectedSpace`
  (`Mathlib/Topology/Compactness/DeltaGeneratedSpace.lean` line 51). Both are used in 5.1.
- `finite_of_finite_type_of_isJacobsonRing R S` (`Mathlib/RingTheory/Jacobson/Ring.lean` line 691,
  Zariski's lemma): a field `S` of finite type over a Jacobson ring `R` is a finite `R`-module; and
  the instance making an Artinian ring a Jacobson ring (same file, line 102). Mathlib does not
  provide `IsJacobsonRing ℤ`; 7.5 obtains it from Tau Ceti's criterion below.
- `ChartedSpace.secondCountable_of_sigmaCompact` (`Mathlib/Geometry/Manifold/ChartedSpace.lean`
  line 236): a σ-compact charted space over a second-countable model is second countable. Mathlib's
  `ChartedSpace` (line 141) and `IsManifold` (`Mathlib/Geometry/Manifold/IsManifold/Basic.lean`
  line 777) include no separation axiom, so 6.6 assumes `T2Space` explicitly.

### From Tau Ceti

Pinned at `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

- `TauCeti.Huber.IsPseudoCoherentOver A M m` (`TauCeti/Algebra/Module/PseudoCoherent/Basic.lean`
  line 89), for `[Ring A]` and `m : ℕ∞`: a resolution `⋯ → A^{n₁} → A^{n₀} → M → 0` by coordinate
  finite free modules, exact at `M, F₀, …, F_{m−1}`. With `.zero_iff` (finitely generated),
  `.one_iff` (finitely presented), `.mono`, `.of_equiv`, `.succ_iff_ker`, `.ker_of_projective`,
  `.top_iff`, `.of_projective`, `.prod`, `.pi`;
  `TauCeti.Huber.IsPseudoCoherentOver.of_isNoetherianRing` (line 391: over a noetherian ring a
  finitely generated module is `⊤`-pseudocoherent, used in the Checks of 1.2); `.extension`,
  `.cokernel` and `.kernel` of `TwoOutOfThree.lean` (a cokernel of an injection from an `(m − 1)`-
  into an `m`-pseudocoherent module is `m`-pseudocoherent); and
  `TauCeti.Huber.isPseudoCoherentOver_restrictScalars_iff` (`RestrictScalars.lean` line 155), for
  `[Ring A] [Ring S] [Module A S] [IsScalarTower A S S]` with `S` `m`-pseudocoherent over `A`,
  noncommutative rings allowed.
- `TauCeti.Module.IsFPD A M m`
  (`TauCeti/Algebra/Module/PseudoCoherent/FiniteProjectiveDimension.lean` line 69): a possibly
  unbounded resolution `⋯ → A^{n₁} → A^{n₀} → M → 0` by finitely generated free modules, exact
  everywhere, whose `m`-th syzygy is projective; equivalently, a resolution of length at most `m` by
  finitely generated projective modules. It does not say that the free resolution terminates: over
  `ℚ[ℤ/2]` the trivial module `ℚ` satisfies `IsFPD` with `m = 0` (it is projective, `2` being
  invertible) but has no finite resolution by finitely generated free modules, since every such
  resolution has even alternating sum of `ℚ`-dimensions while `dim_ℚ ℚ = 1`;
  `TauCeti.Module.IsFPD.isPseudoCoherentOver`, `TauCeti.Module.IsFPD.zero_iff`, `.mono`, and
  `TauCeti.Module.isFPD_iff_hasProjectiveDimensionLE` (line 153): for `M : Type u` in the universe
  of `A`,
  `IsFPD A M m ↔ IsPseudoCoherentOver A M ⊤ ∧ HasProjectiveDimensionLE (ModuleCat.of A M) m`.
- `TauCeti.leastENatBound` with `leastENatBound_le_iff` (monotone predicates),
  `leastENatBound_eq_top_iff`, `leastENatBound_eq_zero_iff` (`TauCeti/Data/ENat/LeastBound.lean`).
- `TauCeti.cohomologicalDimension.{v} G`
  (`TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean` line
  156): for a topological group `G : Type u`, the supremum over primes `p` of the least `n` such
  that continuous cohomology of every discrete `p`-primary torsion module in `Type (max u v)` with
  continuous action vanishes above `n`.
- `TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology`
  (`TauCeti/RepresentationTheory/Homological/ContCohomology/DiscreteGroup.lean` line 166): for a
  finite group `G : Type` with the discrete topology and a discrete `G`-module `M`, the continuous
  cohomology of `M` is additively isomorphic to `groupCohomology` of `M` in every degree; it gives
  the Checks of 2.8 at finite groups. For an infinite discrete group 2.8 uses CohomologyOfGroups
  §1.5.
- `CochainComplex.IsTotallyAcyclicProjective`, `CategoryTheory.isGorensteinProjective`
  (`TauCeti/Algebra/Homology/TotallyAcyclic/Abelian.lean` lines 113 and 224), in any abelian
  category: projective terms, acyclic, every chain map to a projective in one degree null-homotopic;
  `CochainComplex.isTotallyAcyclicProjective_splice` (`.../Abelian/Extension.lean` line 63: a splice
  of short exact sequences with projective middle terms and ends with `Ext¹(−, Q) = 0` for
  projective `Q` is totally acyclic); `CategoryTheory.isGorensteinProjective.ext_eq_zero`;
  `CategoryTheory.isGorensteinProjective_of_projective` (`.../Abelian.lean` line 263: a projective
  object is Gorenstein projective, through the complete resolution `Q →𝟙 Q` in degrees `−1` and
  `0`); `CategoryTheory.GorensteinProjective.exactStructure_isFrobenius`
  (`.../Abelian/Frobenius.lean` line 195) with relative projectives and injectives the projective
  objects; `TauCeti.ExactStructure.CompleteResolution`, `.lift`, `.nonempty_homotopy_zero_iff` and
  `.homotopyEquiv` (`TauCeti/CategoryTheory/Exact/Resolution/Complete/Comparison.lean` lines 458 and
  481). The finitely generated variant `CochainComplex.IsTotallyAcyclic` of
  `TotallyAcyclic/Basic.lean` is not used.
- `TauCeti.cellularResolutionOfIsAspherical`
  (`TauCeti/AlgebraicTopology/EilenbergMacLane/Resolution.lean` line 57): for `E B G : Type w`, a
  quotient covering `p : E → B` for `G` with `E` simply connected and `B` an aspherical Hausdorff CW
  complex, the lifted cellular chains as a `ProjectiveResolution` of the trivial representation over
  any `[CommRing k]`, free on the cells of `B` (`TauCeti.cellularChainRepIsoFree`);
  `TauCeti.cwComplexPreimage` (lifted CW structure); `TauCeti.cellularClassifyingSpaceResolution`,
  `TauCeti.isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`,
  `TauCeti.PresentationComplex.cellOneEquiv` and `.cellTwoEquiv` (one `1`-cell per generator, one
  `2`-cell per relator); `TauCeti.IsAspherical`, `TauCeti.IsEilenbergMacLaneSpaceOne`
  (`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean` lines 59 and 123: path-connected with
  vanishing higher homotopy, and fundamental group isomorphic to `G`).
- `TauCeti.cellAttachment` (`TauCeti/Topology/CWComplex/Abstract/CellAttachment.lean` line 52),
  attaching cells along any family `ι → (∂Dⁿ ⟶ X)`; `HomotopyGroup.bijective_hurewicz`
  (`TauCeti/AlgebraicTopology/Homotopy/Hurewicz/Absolute.lean` line 161, spaces in `Type`);
  `TauCeti.contractibleSpace_of_subsingleton_homotopyGroup` (`.../Homotopy/Whitehead.lean` line
  356).
- `TauCeti.WedgeSum.isEilenbergMacLaneSpaceOne_circle` (`.../EilenbergMacLane/OneDimensional.lean`
  line 105), `TauCeti.isZero_groupHomology_freeGroup`,
  `TauCeti.isZero_groupHomology_pi_multiplicative_int`.
- `TauCeti.groupHomology.isZero_groupHomology_of_directed`
  (`TauCeti/RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean` line 132): for
  `{k G : Type u}`, `k` commutative, a nonempty directed family of subgroups `S_i` with supremum `G`
  and `A : Rep k G`, if `Hₙ(S_i, A) = 0` for every `i` then `Hₙ(G, A) = 0`. It does not identify
  `Hₙ(G, A)` with the colimit of the `Hₙ(S_i, A)`; the vanishing is all that 2.5(a) and 6.4 use.
- `TauCeti.groupCohomology.corestriction` for a subgroup of finite index, with
  `TauCeti.groupCohomology.map_subtype_id_comp_corestriction`
  (`TauCeti/RepresentationTheory/Homological/GroupCohomology/Corestriction.lean` line 165):
  restriction followed by corestriction is multiplication by the index on `Hⁿ(G, A)`.
- `TauCeti.groupHomology.transfer M S n : Hₙ(G, M) ⟶ Hₙ(S, M)` for `M : Rep R G` and
  `[S.FiniteIndex]` (`TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean`
  line 79), with `TauCeti.groupHomology.transfer_comp_map_subtype_id` (line 121): transfer followed
  by corestriction `Hₙ(S, M) ⟶ Hₙ(G, M)` is multiplication by `[G : S]` on `Hₙ(G, M)`, in every
  degree `n`; used in 2.3(c).
- `TauCeti.exists_linearEquiv_comp_fst_eq_comp_snd_comp`
  (`TauCeti/Algebra/Module/Projective/Schanuel.lean` line 82): Schanuel's lemma in automorphism
  form, over any semiring: for linear maps `a : A → E` and `b : B → E` from projective modules with
  the same range, `a ∘ fst` and `b ∘ snd` differ by a linear automorphism of `A × B`; for surjective
  `a`, `b` it carries `ker a × B` onto `A × ker b`. Used in 8.3, applied degree by degree to the
  syzygies of two finite projective resolutions (the generalized Schanuel lemma), for the
  independence of `χ̃` from the resolution.
- `TauCeti.groupHomologyPiMultiplicativeIntExteriorPowerEquiv`
  (`TauCeti/AlgebraicTopology/ClassifyingSpace/Torus.lean` line 243): for a commutative ring `k` and
  a finite type `ι` in the same universe, `⋀ⁿ H₁(ℤ^ι, k) ≃ Hₙ(ℤ^ι, k)` with trivial coefficients;
  used in the Checks of 2.4.
- `TauCeti.cwComplexProd` (`TauCeti/Topology/CWComplex/Classical/Product.lean` line 194): the
  product CW structure on `C ×ˢ D` for finite CW complexes `C`, `D`, with `n`-cells the pairs of a
  `p`-cell and a `q`-cell with `p + q = n`; used in the Checks of 5.1.
- `TauCeti.trace_ofModule'_eq_zero_of_dvd_orderOf`
  (`TauCeti/Algebra/MonoidAlgebra/ProjectiveTrace.lean` line 67): `A` commutative local with the
  prime `p` not a unit, `G` finite, `X` finitely generated projective over `A[G]`; if
  `p ∣ orderOf g` then the Mathlib trace `LinearMap.trace A X` of `g` on `X` is `0` (`X` is free
  over the local ring `A`, so this is its trace as a free module).
- `LinearMap.projectiveTrace R M` (`TauCeti/LinearAlgebra/Trace/Projective.lean` line 72), for
  `[CommSemiring R]`, `[Module.Finite R M]`, `[Module.Projective R M]`: the trace of an endomorphism
  of a finite projective module, the contraction `Dual R M ⊗ M → R` transported along
  `dualTensorHomEquiv`; with `LinearMap.projectiveTrace_cyclic` (line 96, cyclicity across two
  finite projective modules), `LinearMap.projectiveTrace_eq_trace` (line 118, equal to Mathlib's
  `LinearMap.trace` on finite free modules) and `LinearMap.projectiveTrace_baseChange` (line 158).
  Mathlib's `LinearMap.trace` (`Mathlib/LinearAlgebra/Trace.lean` line 75) is defined to be `0` when
  the module has no finite basis, so it is not the trace of a finite projective module.
- `TauCeti.nonempty_linearEquiv_of_projective_of_tensorRat`
  (`TauCeti/NumberTheory/Padics/GroupAlgebra/Swan.lean` line 58): finitely generated projective
  `ℤ_p[G]`-modules with isomorphic rationalizations are isomorphic, `G` finite; and its coprime case
  `TauCeti.nonempty_linearEquiv_of_projective_of_tensorRat_of_not_dvd`
  (`TauCeti/NumberTheory/Padics/GroupAlgebra/Rational.lean` line 134), the same conclusion for
  `p ∤ |G|`, used in the Checks of 7.4.
- `TauCeti.isJacobsonRing_of_quotient_span_singleton` (`TauCeti/RingTheory/Jacobson/Ring.lean` line
  36): a commutative ring with zero Jacobson radical whose quotients by nonzero principal ideals are
  Jacobson rings is a Jacobson ring; used in 7.5 for `ℤ`.
- `FDRep.nonempty_iso_of_character_eq` and `Representation.nonempty_equiv_of_character_eq`
  (`TauCeti/RepresentationTheory/CharacterTable/Determined.lean` lines 59 and 49): over a field of
  characteristic zero, finite-dimensional representations of a finite group with equal characters
  are isomorphic.
- `TauCeti.AbelianK0 C` (`TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean` line 79), for an
  essentially small abelian category `C`: the free abelian group on isomorphism classes modulo
  `[X₂] = [X₁] + [X₃]` for every short exact sequence; and the Euler–Poincaré relation
  `TauCeti.AbelianK0.eulerChar_eq_homologyEulerChar`
  (`TauCeti/CategoryTheory/GrothendieckGroup/EulerCharacteristic.lean` line 370): for a cochain
  complex strictly supported in degrees `[a, b]`, the alternating sum of the classes of its terms
  equals that of its cohomology objects. Used in 8.5 with `C = FDRep K Δ` for a finite group `Δ`,
  which is abelian (Mathlib's instances on `FGModuleCat` over a noetherian ring,
  `Mathlib/Algebra/Category/FGModuleCat/Abelian.lean` line 36, and on `Action`,
  `Mathlib/CategoryTheory/Action/Limits.lean` line 394) and essentially small
  (`CategoryTheory.Action.essentiallySmall`, `TauCeti/CategoryTheory/Action/EssentiallySmall.lean`
  line 54); then `AbelianK0` is `G₀(K[Δ])` in every characteristic, the comparison with characters
  holding only in characteristic zero.
- `TauCeti.UniversalCover x₀` (`TauCeti/AlgebraicTopology/UniversalCover/Basic.lean` line 70), the
  universal cover by homotopy classes of based paths, with `TauCeti.UniversalCover.isCoveringMap`
  (`.../UniversalCover/Covering.lean` line 58) for locally path-connected, semilocally simply
  connected spaces; `TauCeti.UniversalCover.simplyConnectedSpace` (`.../Covering.lean` line 183,
  same hypotheses: the universal cover is simply connected); and
  `TauCeti.UniversalCover.isQuotientCoveringMap` (`.../UniversalCover/Action.lean` line 162): for
  `X` locally path-connected, path-connected and semilocally simply connected, the projection is a
  quotient covering map for the action of `FundamentalGroup X x₀`. The semilocal simple
  connectivity is supplied by `TauCeti.SemilocallySimplyConnectedSpace.of_locallyContractibleSpace`
  (`TauCeti/AlgebraicTopology/SemilocallySimplyConnected/Basic.lean` line 131: a space satisfying
  Mathlib's `LocallyContractibleSpace` is semilocally simply connected) and the local
  path-connectedness by `TauCeti.instDeltaGeneratedSpaceOfCWComplexUniv`
  (`TauCeti/Topology/CWComplex/Classical/DeltaGenerated.lean` line 66: a Hausdorff space with a CW
  structure on `univ` is delta-generated). Neither library states that a general CW complex is
  locally contractible or semilocally simply connected (AlgebraicTopology §4.7 supplies it); the
  wedge of circles is, by `TauCeti.WedgeSum.instSemilocallySimplyConnectedSpaceCircle`
  (`.../SemilocallySimplyConnected/WedgeSum.lean` line 112), used in a Check of 5.1.
- `AbstractSimplicialComplex.Realization`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Basic.lean` line 71), the realization of
  an abstract simplicial complex, used in 5.5.
- `AbstractSimplicialComplex.realizationCWComplex K`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/Realization/CWComplex/Basic.lean` line 172), for `K`
  on a linearly ordered vertex type: the CW structure on the (Hausdorff) realization `|K|` whose
  `n`-cells are the faces with `n + 1` vertices, enumerated increasingly; and
  `TauCeti.cellularChainComplexRealizationIso` (`…/Realization/CWComplex/OrderedChainComplex.lean`
  line 132), for a vertex type `ι : Type u` and a ring `R : Type u`: an isomorphism of chain
  complexes from the cellular chains of `|K|` with this CW structure to the ordered simplicial
  chains `TauCeti.orderedSimplicialChainComplex K R`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/ChainComplex.lean` line 186), free on the faces with
  boundary `∂[v₀, …, vₙ₊₁] = Σ_j (−1)ʲ [v₀, …, v̂ⱼ, …, vₙ₊₁]`, sending the cellular basis vector of
  a cell to a unit multiple, depending only on `n`, of that face. Used in 5.5(a).
- `SSet.eilenbergZilberHomotopyEquiv`
  (`TauCeti/AlgebraicTopology/SimplicialSet/EilenbergZilber.lean` line 761): for simplicial sets
  `K, L`, the Alexander–Whitney map from the chains of `K ⊗ L` (the product) to the tensor product
  of chains is a chain homotopy equivalence, with inverse the shuffle map.
- `Subgroup.tensorInducedRepresentation` and `Representation.wreathTensor`
  (`TauCeti/RepresentationTheory/Tensor/Induction/Basic.lean`): tensor induction of representations
  along a transversal; the complex-level construction there is sign-free and is used only in
  characteristic two, so 3.1 owns the signed version.

### From TauCetiRoadmap.CohomologyOfGroups

- §1.2: for `N ◁ G`, the representations of `G ⧸ N` on `Hᵏ(N, M)` and `Hₖ(N, M)`, natural in `M`.
- §1.4: for a `G`-set `X` with orbit representatives `Σ`, natural isomorphisms
  `Hₙ(G, k[X] ⊗ M) ≅ ⊕_{x ∈ Σ} Hₙ(G_x, M)` and `Hⁿ(G, Hom_k(k[X], M)) ≅ ∏_{x ∈ Σ} Hⁿ(G_x, M)`, and
  the versions with a character of the stabilizer.
- §1.5: for `G` discrete and a discrete representation `A`,
  `Θₙ : continuousCohomology n A ≅ Hⁿ(G, A)`.
- §2.3: the two spectral sequences of a complex, converging with filtrations finite in each total
  degree.
- §3.2: for a monomial complex `C` (each `C_p ≅ ⊕_{σ ∈ Σ_p} Ind_{G_σ}^G(k_σ)` with `k_σ` a
  character), the orbit spectral sequence
  `E¹_{p,q} = ⊕_{σ ∈ Σ_p} H_q(G_σ, k_σ ⊗ M) ⇒ H^G_{p+q}(C; M)`, the first sequence of §2.3, and its
  cohomological dual; 3.1 there identifies `H^G_*(C; M)` with `H_*(G, M)` when `C` resolves `k` by
  `k`-flat terms.
- §3.4: for a `G`-tree (an action without inversions, with a `G`-invariant orientation `E⁺` of the
  edges), the exact sequence `0 → k[E⁺] → k[V] → k → 0` of permutation representations, split after
  forgetting the `G`-action (split over `k`) and not `G`-equivariantly: for `G = ℤ` translating the
  line it is `0 → k[t, t⁻¹] →(t − 1) k[t, t⁻¹] → k → 0`, where the `k`-linear section `1 ↦ [0]` is
  moved to `[1]` by `t`, and an equivariant section would be an invariant element of `k[ℤ]` of
  augmentation `1`, which does not exist for `k ≠ 0`. Layers 1 and 8 use only its exactness.
- §§3.5–3.6: the tree sequences, and for amalgams, HNN extensions and free groups the long exact
  sequences in homology and cohomology; for `F = FreeGroup S`, `Hⁿ(F, M) = Hₙ(F, M) = 0` for `n ≥ 2`
  and `0 → H₁(F, M) → M^{(S)} → M → H₀(F, M) → 0`.
- §4.6: the cap product `∩ : Hᵖ(G, M) ⊗ Hₙ(G, N) → Hₙ₋ₚ(G, P)` for `μ : M ⊗ N ⟶ P`, natural in the
  coefficients, compatible with connecting maps, with the projection formula
  `f_*(f^*x ∩ z) = x ∩ f_*z` and, for finite index, `tr(y ∩ z) = res y ∩ tr z`.
- §5.2: the universal coefficient sequences over a ring of global dimension at most one (Checks
  only).
- §§6.1–6.2: for `N ◁ G` and `M : Rep k G`, the convergent spectral sequence
  `E₂^{p,q} = Hᵖ(G ⧸ N, H^q(N, M)) ⇒ H^{p+q}(G, M)`, natural in `M` and in morphisms of extensions,
  with `H^{p+q}(G, M)` finitely filtered by subquotients of the `E₂^{p, n−p}`; it is realised as the
  spectral sequence of a filtration of the normalized cochains that is finite in each degree (§6.1),
  with the classical `E_r` on the native page `r + 1`.
- §6.3: the homological spectral sequence `E²_{p,q} = H_p(G ⧸ N, H_q(N, M)) ⇒ H_{p+q}(G, M)`.

### From TauCetiRoadmap.SpectralSequencesAndConvergence

- §3.4 (Euler identity): for a spectral sequence in Mathlib's carrier with a bidegree assignment
  (§2.1), converging weakly in every total degree to an abutment whose filtrations are finite, and a
  page `r` whose nonzero positions are finitely many and all lie in a weak Serre class `P`, only
  finitely many `Hⁿ` are nonzero and `Σ_n (−1)ⁿ v(Hⁿ) = Σ_{pq} (−1)^{deg pq} v(E_r(pq))` for every
  `v` additive on short exact sequences in `P`.
- §5.3 (Euler characteristic of a filtered complex): the same identity for Tau Ceti's spectral
  sequence of a cochain complex with a filtration finite in each degree, on a native page `r ≥ 2`
  (the classical `E_{r−1}`), with the sign `(−1)^{p+q}` of the total degree; the Hochschild–Serre
  sequence of CohomologyOfGroups §6.2 and the bicomplex sequences of its §2.3 are of this form.

These are used with `P` the finite-dimensional `ℚ`-vector spaces and `v` the dimension.

### From TauCetiRoadmap.FreeGroupsAndLimitGroups

- §4.5: one-edge graphs of groups are `Monoid.PushoutI` over `Bool` and `HNNExtension`.
- §4.7: the Bass–Serre tree of a graph of groups, a tree with an action without inversions whose
  vertex and edge stabilizers are conjugates of the vertex and edge groups.
- §4.8: the structure theorem for an action without inversions on a tree; with trivial vertex and
  edge stabilizers it makes a group acting freely without inversions on a tree free.
- §4.9: an element of finite order acting on a tree without inversions is elliptic, and a finitely
  generated group of elliptic elements fixes a vertex; so a finite group fixes a vertex.

### From TauCetiRoadmap.EtaleCohomologyFoundations

- §F.10.3: the Hattori–Stallings trace of a finite projective right module over any ring `Λ` with
  values in `Λ/[Λ, Λ]`, with cyclicity, independence of the complement, additivity on direct sums
  and split exact sequences, and scalar extension along ring homomorphisms. Right modules are left
  modules over the opposite ring; 7.1 applies it to `(RG)ᵐᵒᵖ`, whose right modules are the left
  `RG`-modules, and `(RG)ᵐᵒᵖ/[,]` is `RG/[RG, RG]` as an additive group.
- §F.10.3: over a commutative ring, the Hattori–Stallings trace agrees with
  `LinearMap.projectiveTrace`. For a finite group `G`, the identity coefficient
  `ε : Λ[G]/[Λ[G], Λ[G]] → Λ/[Λ, Λ]` and `Tr^G = ε ∘ Tr_HS` on finite projective `Λ[G]`-modules. The
  centralizer formula, proved without dividing by `|G|`: let `1 → G → Γ̃ → ℤ → 1` be an extension,
  `Γ` the inverse image of `ℕ`, `P` a `Λ[Γ]`-module finite projective over `Λ[G]`, `γ ∈ Γ` and
  `Z_γ = {g ∈ G | gγ = γg}`; then `Tr_Λ(γ, P) = |Z_γ| · Tr^{Z_γ}_Λ(γ, P)`. 7.2 applies it to
  `Γ̃ = G × ℤ` with `ℤ` acting trivially and `γ = (g, 1)`, where `Z_γ = C_G(g)` and `Tr_Λ(γ, P)` is
  the trace of `g` on `P`.

### From TauCetiRoadmap.ClassifyingSpaces

- Stage 2 item 10: a cellular `K(G, 1)` CW complex for every group, Hausdorff with a CW structure on
  the whole space.
- Stage 4 item 16: for a `K(G, 1)` CW complex `B` with universal cover `E`, the augmented cellular
  chains of `E` are a free resolution of `ℤ` over `ℤG`, with one free generator for each cell of
  `B`.
- Stage 3 item 12: two `K(G, 1)` spaces of CW type are homotopy equivalent, by an equivalence
  inducing any prescribed isomorphism of fundamental groups.
- Stage 4 item 17: the (co)homology of the classifying space with local coefficients in a
  `G`-module `M` is `groupHomology`, `groupCohomology` of `M`, naturally.

### From TauCetiRoadmap.AlgebraicTopology

- §4.7: the cell-neighbourhood local contraction of an arbitrary Hausdorff CW complex: for a point
  `x` in an open set `U` there are an open `V` with `x ∈ V ⊆ U` and a homotopy `V × I → U` from the
  inclusion to the constant map at `x`. Applied to the interior of a neighbourhood, this says that
  a Hausdorff space with a CW structure on `univ` satisfies Mathlib's `LocallyContractibleSpace`
  (Hatcher2002, Appendix, Proposition A.4, p. 522). Used in 5.1.
- §6.1: singular (co)homology with coefficients in a local system, with its homotopy invariance;
  used in 6.6 to pass from a closed aspherical manifold to the classifying space of its fundamental
  group.
- §8.1: the inclusion of the `k`-skeleton of a CW complex induces isomorphisms on `π_i` for `i < k`
  and a surjection on `π_k`.
- §8.3: the absolute Hurewicz theorem: an `(n − 1)`-connected space has vanishing reduced homology
  below `n` and `π_n ≅ H_n` for `n ≥ 2`, in every universe.
- §8.5: Whitehead's theorem for spaces of CW type.
- §8.7: a compact Hausdorff second-countable smooth manifold with the Euclidean model has finite CW
  type (a homotopy equivalence to a finite CW complex).
- §6.3: the integral orientation local system `or_M` of a boundaryless manifold, built from the
  local homology system with its transport along paths; its monodromy `π₁(M, x) → {±1}` is the
  orientation character used in 6.6.
- §6.4: twisted Poincaré duality of a closed `n`-manifold (compact and Hausdorff, charted on
  `EuclideanSpace ℝ (Fin n)`): cap product with the fundamental class is an isomorphism
  `Hᵏ(M; L) ≅ H_{n−k}(M; L ⊗ or_M)` for every local system `L` of modules.
- §8.11a: every CW complex is homotopy equivalent to the realization of an abstract simplicial
  complex, by skeletal simplicial approximation and mapping cylinders (Hatcher2002, Theorem 2C.5,
  p. 182, as cited there). It states no bound on the dimension of the simplicial complex; 5.4
  supplies the bound by the same skeletal construction.

## How to read the build

Layer 1 defines the finiteness types on Tau Ceti's pseudocoherence and finite projective dimension,
proves a module-level criterion by directed colimits, and deduces the group criterion and the
stability of the types under finite index, extensions, products and splittings over trees. Layer 2
defines `cd_R` and `hd_R`, identifies them with projective dimension and Tor-vanishing, proves their
behaviour under subgroups, extensions, directed unions and amalgams, the dichotomy for finite
groups, and compares `cd_ℤ` with the profinite invariant. Layer 3 constructs the signed tensor
induction of complexes and proves Serre's theorem, which Layer 4 needs to make the virtual
cohomological dimension independent of the subgroup; Layer 4 also defines the virtual types and the
groups of finite homological type on which Layer 8 rests. Layer 5 compares `cd` with the geometric
dimension, proves the Eilenberg–Ganea theorem, replaces a finite-dimensional CW complex by an
abstract simplicial complex of the same dimension, and with it builds Serre's action of a group of
finite `vcd` with finite stabilizers on a finite-dimensional acyclic simplicial set; later layers
use its
comparison 5.2, in the manifold theorem 6.6, and Serre's construction 5.5, in the denominator
theorem 8.9. Layer 6 develops duality groups from the cap product of CohomologyOfGroups and the
finiteness criterion of Layer 1. Layer 7 is independent of Layers 2–6: it specialises the
Hattori–Stallings trace to group rings and proves Swan's theorem and Brown's theorem on `Hom` from a
projective module into a finite-dimensional representation, which Layer 8 uses to define and
multiply Euler characteristics; Layer 8 also proves the classical Smith theory of finite `p`-groups
acting on finite-dimensional simplicial sets, which with 5.5 bounds the denominator of the Euler
characteristic. Layer 9 builds complete resolutions and Farrell cohomology from the pinned
Gorenstein-projective objects, using Layers 2 and 4.

---

## Layer 1: finiteness types of groups

### 1.1 Finiteness of modules by directed colimits

Prove, for a ring `A` (not necessarily commutative), a left `A`-module `M` in the universe of `A`,
and directed systems `(N_i)_{i ∈ I}` of `A`-modules indexed by a directed preorder `I` in the same
universe, with `c_k : colim_i Ext^k_A(M, N_i) → Ext^k_A(M, colim_i N_i)` the canonical map:

- (a) `M` is finitely generated if and only if `c_0` is injective for every directed system, if and
  only if `colim_i Hom_A(M, N_i) = 0` for every directed system with `colim_i N_i = 0`;
- (b) `M` is finitely presented if and only if `c_0` is bijective for every directed system;
- (c) for `n ∈ ℕ`, `M` is `n`-pseudocoherent if and only if `c_k` is bijective for `k < n` and
  injective for `k = n`, for every directed system, if and only if `colim_i Ext^k_A(M, N_i) = 0` for
  all `k ≤ n` and every directed system with zero colimit.

(Brown1975 Theorem 2, (i)–(iii), lines 83–92, stated there for complexes of projectives over any
ring and applied to a projective resolution of `M`; Corollary of Theorem 1, lines 78–81; Lemma 1(a),
lines 105–114, for (a).) Route: (a) and (b) by the direct system of quotients `M/M'` over finitely
generated submodules `M'` (Brown1975 lines 111–114) and, for (b), the five lemma on a presentation;
(c) by induction on `n`: write `0 → K → Aᵐ → M → 0` with `M` finitely generated; directed colimits
of modules are exact, `Ext^k(Aᵐ, −) = 0` for `k ≥ 1` and `Hom(Aᵐ, −)` commutes with colimits, so the
long exact `Ext`-sequence shows that the conditions on `M` in degrees `≤ n + 1` are the conditions
on `K` in degrees `≤ n` together with (a) for `M`; then
`TauCeti.Huber.IsPseudoCoherentOver.succ_iff_ker`. *Needs:* Tau Ceti
`TauCeti.Huber.IsPseudoCoherentOver`, `.zero_iff`, `.one_iff`, `.succ_iff_ker`; Mathlib `Ext` in
`ModuleCat A` and its long exact sequence, colimits in `ModuleCat A`.

- For `n`-pseudocoherent `M`, the functors `Ext^k_A(M, −)` for `k < n` preserve directed colimits.
- The conditions in (c) are monotone in `n`, and for `n = ⊤` they read: `Ext^k_A(M, −)` preserves
  directed colimits for every `k`.

**Checks.**

- For `A = ℤ` and `M = ℚ`, the system `N_i = ℚ/(1/i!)ℤ` has zero colimit while the projections
  `ℚ → N_i` define a nonzero element of `colim_i Hom(ℚ, N_i)`, since none of them is zero: `ℚ` is
  not finitely generated, as (a) requires.
- Finitely generated is weaker than finitely presented: for `A = k[x₁, x₂, …]` over a field and
  `M = A/(x₁, x₂, …) = k`, the system `N_i = A/(x₁, …, x_i)` has colimit `k`, every `Hom_A(k, N_i)`
  is zero because `x_{i+1}` is a non-zero-divisor on `N_i`, and `Hom_A(k, k) = k`: `c_0` is
  injective and not surjective.
- For `M = 0` every condition holds in every degree, and `0` is `⊤`-pseudocoherent.

### 1.2 The finiteness types

Define, for `n ∈ ℕ∞`, `G` to be *of type `FP_n` over `R`* (`IsOfTypeFPn R G n`) when the trivial
module `R` is `n`-pseudocoherent over `RG` (`TauCeti.Huber.IsPseudoCoherentOver`), *of type `FP_∞`*
when it is of type `FP_⊤`, *of type `FP`* (`IsOfTypeFP R G`) when `R` has a finite resolution by
finitely generated projective `RG`-modules (`TauCeti.Module.IsFPD RG R m` for some `m : ℕ`), and
*of type `FL`* when `R` has a
resolution `0 → F_m → ⋯ → F_0 → R → 0` by finitely generated free `RG`-modules (BieriEckmann1973
§4.1, lines 540–544, types (FP) and (FF) over `ℤ`; BieriEckmann1974, §3.3, lines 286–287, finitely
generated free resolutions; Brown1974, §3, lines 345–351; Serre1971Bourbaki 1.2, lines 55–58).
*Needs:* Mathlib `MonoidAlgebra`, `Representation.trivial`, `Representation.asModule`; Tau Ceti
`TauCeti.Huber.IsPseudoCoherentOver`, `TauCeti.Module.IsFPD`.

- The types are invariant under isomorphisms of groups.
- `G` is of type `FP_n` over `R` exactly when `R` has a projective resolution `P → R` with
  `P_0, …, P_n` finitely generated, by `TauCeti.Huber.IsPseudoCoherentOver.ker_of_projective`.
- `FP_n` is antitone in `n`, and `G` is of type `FP_∞` exactly when it is of type `FP_n` for every
  `n : ℕ` (`.mono`, `.top_iff`).
- `G` is of type `FP` over `R` exactly when it is of type `FP_∞` and `R` has finite projective
  dimension over `RG` (`TauCeti.Module.isFPD_iff_hasProjectiveDimensionLE`); with 2.1 this reads:
  type `FP` is type `FP_∞` with `cd_R G < ⊤` (BieriEckmann1974 Proposition 3.2, lines 288–295).
- A group of type `FP` over `R` is of type `FL` exactly when, in a finite resolution whose terms
  below the top are finitely generated free, the top term is stably free (BrownGTM87, §VIII.6): if
  `P_m ⊕ RGᵃ ≅ RGᵇ` for the top term `P_m`, adding the identity `RGᵃ → RGᵃ` in degrees `m + 1` and
  `m` gives a finite resolution by finitely generated free modules, and conversely the generalized
  Schanuel lemma compares a finite free resolution with the given one.

**Checks.**

- The trivial group is of type `FL` over every `R`, with the resolution `0 → R → R → 0`.
- `ℤ = ⟨t⟩` is of type `FL` over every `R`, with `0 → R[ℤ] →(t − 1) R[ℤ] → R → 0`
  (CohomologyOfGroups §3.4, Check for the line).
- Over the zero ring every group is of type `FL`; over `R ≠ 0` the additive group `ℚ` is of type
  `FP_0` and not of type `FP_1` (1.4), so the index of the types is that of pseudocoherence.
- A nontrivial finite group `G` is of type `FP_∞` over `ℤ` (`ℤG` is noetherian,
  `TauCeti.Huber.IsPseudoCoherentOver.of_isNoetherianRing`) and not of type `FP` over `ℤ` (2.7);
  over a field in which `|G|` is invertible it is of type `FP`, since `R` is then a direct summand
  of `RG`.

### 1.3 Implications and change of coefficients

Prove `FL ⇒ FP ⇒ FP_∞ ⇒ FP_n ⇒ FP_m` for `m ≤ n`, and that for a homomorphism of commutative rings
`R → R'` a group of type `FP_n` (`FP`, `FL`) over `R` is of that type over `R'`. Route: a partial
resolution `F_n → ⋯ → F_0 → R → 0` by free `RG`-modules, exact at `R, F_0, …, F_{n−1}`, consists of
free `R`-modules and ends in the free `R`-module `R`, so it is split exact over `R` in those
degrees; `R' ⊗_R −` keeps it exact and turns `RG^k` into `R'G^k` (BrownGTM87, §VIII.5). *Needs:*
1.2; Tau Ceti `TauCeti.Module.IsFPD.isPseudoCoherentOver`,
`TauCeti.Huber.IsPseudoCoherentOver.mono`.

**Checks.**

- The converse of the change of coefficients fails: `ℤ/2` is of type `FP` over `ℚ` and not over `ℤ`.
- Base change to the zero ring makes every group of type `FL`, consistent with 1.2.
- For `R = ℤ → R' = 𝔽_p`, the resolution `0 → ℤ[ℤ] → ℤ[ℤ] → ℤ → 0` becomes
  `0 → 𝔽_p[ℤ] → 𝔽_p[ℤ] → 𝔽_p → 0`, still exact.

### 1.4 Low degrees

Prove: (a) every group is of type `FP_0` over `R`; (b) for `R` nontrivial, `G` is of type `FP_1`
over `R` if and only if `G` is finitely generated; (c) a finitely presented group
(`Group.IsFinitelyPresented`) is of type `FP_2` over every `R`. (Brown1974, §4, lines 441–447, for
(b): if the augmentation ideal is generated by `s_i − 1` for finitely many `s_i`, the subgroup they
generate fixes the identity coset in `R[G/⟨s_i⟩]` and so is `G`; BieriEckmann1974 line 294;
BieriEckmann1973 line 662, sequence (5.1), for (c).) Route for (b): `R` is finitely presented over
`RG` exactly when the augmentation ideal is finitely generated
(`TauCeti.Huber.IsPseudoCoherentOver.one_iff`, `.succ_iff_ker`), and the augmentation ideal is
generated by the `g − 1` for `g` in any generating set. Route for (c): for a presentation
`⟨S | Rel⟩` with `S` and `Rel` finite, the resolution `TauCeti.cellularClassifyingSpaceResolution`
is free on the cells of the cellular classifying space (`TauCeti.cellularChainRepIsoFree`), whose
cells of dimension at most `2` are the single vertex, the `1`-cells `S` and the `2`-cells `Rel` of
the presentation complex (`TauCeti.PresentationComplex.cellOneEquiv`, `.cellTwoEquiv`), the cells
attached afterwards having dimension at least `3`; so its terms of degree `≤ 2` are finitely
generated. *Needs:* 1.2; Tau Ceti `TauCeti.Huber.IsPseudoCoherentOver.zero_iff`, `.one_iff`,
`.succ_iff_ker`, `TauCeti.cellularClassifyingSpaceResolution`, `TauCeti.cellularChainRepIsoFree`,
`TauCeti.PresentationComplex.cellOneEquiv`, `TauCeti.PresentationComplex.cellTwoEquiv`; Mathlib
`Group.IsFinitelyPresented`, `PresentedGroup`.

**Checks.**

- `ℚ` and the free group on an infinite set are not finitely generated, hence not of type `FP_1`
  over any nonzero `R`; over the zero ring they are (1.2), so the nontriviality hypothesis of (b) is
  used.
- A finite group is finitely presented, so of type `FP_2` over every `R`; the free group `G` on two
  generators `s, t` is finitely presented with no relator, and its resolution of (c) has terms `RG`,
  `(RG)²`, `0` in degrees `0, 1, 2` over the augmentation `RG → R` in degree `−1`, the boundary
  being `(a, b) ↦ a(s − 1) + b(t − 1)`: over `ℤ` the degree-`0` term `ℤG` (one free orbit of
  vertices of the universal cover) has infinite rank as an abelian group, while a model putting `R`
  in degree `0` would give rank `1`.
- The normal closure of `b` in `FreeGroup {a, b}` is free on the conjugates `aᵏba⁻ᵏ`, `k ∈ ℤ`, so
  its abelianization is free of infinite rank and it is not finitely generated; by (b), over every
  nonzero `R` it is not of type `FP_1`, while `FreeGroup {a, b}` is of type `FL` (1.8): `FP_1` does
  not pass to subgroups of infinite index. Over the zero ring both groups are of type `FL` (1.2), so
  this does not separate them there.

### 1.5 The finiteness criterion

Prove, for `n ∈ ℕ`, that the following are equivalent (Brown1975 Theorem 2, lines 83–101, applied
to a projective resolution of the trivial module over `RG`; Theorem 3, lines 189–194, for `FP_∞`;
BieriEckmann1974 Proposition 1.2, lines 135–137, for (e)). Directed systems are functors to
`Rep R G` from nonempty directed preorders `I : Type u`, families are indexed by types
`J : Type u`, and the comparison maps are `CategoryTheory.Limits.colimit.post` for the functor
`groupCohomology.functor R G k` and `CategoryTheory.Limits.piComparison` for
`groupHomology.functor R G k`:

- (a) `G` is of type `FP_n` over `R`;
- (b) for every directed system `(M_i)` of representations,
  `colim_i Hᵏ(G, M_i) → Hᵏ(G, colim_i M_i)` is bijective for `k < n` and injective for `k = n`
  (`isOfTypeFPn_iff_colimit`);
- (c) for every directed system with `colim_i M_i = 0`, `colim_i Hᵏ(G, M_i) = 0` for `k ≤ n`;
- (d) for every family `(N_j)_{j ∈ J}` of representations, `Hₖ(G, ∏_j N_j) → ∏_j Hₖ(G, N_j)` is
  bijective for `k < n` and surjective for `k = n` (`isOfTypeFPn_iff_piComparison`);
- (e) the same as (d) for every family of copies of `RG`.

`G` is of type `FP_∞` exactly when (b), equivalently (d), holds in every degree. The exact degree
bounds are part of the statement. Route: (a) ⇔ (b) ⇔ (c) is 1.1(c) for `A = RG` and `M = R`,
through `groupCohomologyIsoExt` and `Rep.equivalenceModuleMonoidAlgebra`, under which directed
colimits of representations are those of the underlying modules. (a) ⇒ (d): with `P_0, …, P_n`
finitely generated projective, `− ⊗_{RG} P_k` commutes with products for `k ≤ n`, and the five lemma
on the truncation gives the bounds (Brown1975 lines 147–157). (d) ⇒ (e) is immediate. (e) ⇒ (a):
induction along `0 → K → RGᵐ → R → 0` as in BieriEckmann1974 Lemma 1.1 and Proposition 1.2 (lines
95–137), with `Hₖ(G, N) = Tor_k^{RG}(R, N)` and `Tor^{RG}_k(K, N) ≅ Hₖ(G, K ⊗_R N)`, `K` being
projective over `R`. *Needs:* 1.1, 1.2; Mathlib `groupCohomologyIsoExt`, `groupHomologyIsoTor`,
`Rep.equivalenceModuleMonoidAlgebra`.

**Checks.**

- For `n = 0`, (b) asks injectivity of `colim (M_i)^G → (colim M_i)^G`, which holds for every group,
  as 1.4(a) requires.
- For `G = ℚ`, `R ≠ 0`, `n = 1`: the system `M_i = R[ℚ/(1/i!)ℤ]` has colimit `R`, each `(M_i)^ℚ` is
  zero (infinite orbits), and `(colim M_i)^ℚ = R`, so (b) fails at `k = 0 < 1`.
- For `G = ℚ` and `R ≠ 0`, (e) fails at `k = 0`. Write `[x]` for the basis element of `Rℚ` at
  `x ∈ ℚ`. The element `([0] − [1/j!])_j` of `∏_j Rℚ` maps to zero in `∏_j R`, but it is not in the
  augmentation ideal times `∏_j Rℚ`: an element of that submodule is a finite sum
  `Σ_l ([g_l] − [0]) x_l`, so every coordinate would lie in `I_S · Rℚ` for the finitely generated,
  hence cyclic, subgroup `S` generated by the `g_l`, and `[1/j!] − [0] ∈ I_S · Rℚ` forces
  `1/j! ∈ S` (as `Rℚ/I_S Rℚ ≅ R[ℚ/S]` and `R ≠ 0`) for every `j`, which no cyclic subgroup allows. Over the zero ring every
  module in this Check and the previous one is `0`, both comparison maps are `0 → 0` and bijective,
  and `ℚ` is indeed of type `FP_1` over `0` (1.4).

### 1.6 Subgroups of finite index

Prove that for `H ≤ G` of finite index, `G` is of type `FP_n` over `R` if and only if `H` is, and
that types `FP` and `FL` pass from `G` to `H` (BrownGTM87, §VIII.5). Route: `RG` is a free left
`RH`-module of rank `[G : H]` on a set of representatives of `H\G`, hence `n`-pseudocoherent over
`RH` for every `n`, and `TauCeti.Huber.isPseudoCoherentOver_restrictScalars_iff` applies to
`RH → RG`; restriction of a finite projective (free) resolution is one. *Needs:* 1.2; Tau Ceti
`TauCeti.Huber.isPseudoCoherentOver_restrictScalars_iff`; Mathlib `Subgroup.FiniteIndex`.

**Checks.**

- For `G = ℤ/2 × ℤ ⊇ H = 0 × ℤ` over `ℤ`: `H` is of type `FL`, so `G` is of type `FP_∞`, while `G`
  is not of type `FP` (it contains `ℤ/2`, 2.7): type `FP` does not pass up to a finite-index
  supergroup in general; over `ℚ`, `G` is of type `FP`.
- For `H = G` the statement is the identity; for `H` of infinite index the normal closure of `b` in
  the free group on `a, b` (1.4) shows that over every nonzero `R` none of the types `FP_n`
  (`n ≥ 1`), `FP_∞`, `FP`, `FL` passes down: the free group is of type `FL` and the normal closure
  is not of type `FP_1`. Over the zero ring every group is of type `FL`.

### 1.7 Extensions and products

Prove: (a) if `N ◁ G` and `N` and `G ⧸ N` are of type `FP_n` over `R`, then so is `G`
(BieriEckmann1974 Proposition 3.3(a), lines 298–313, states it for `FP_∞` and `FP` over `ℤ`, by the
spectral sequence of the extension; for finite `n` and arbitrary `R` the route below, through the
criterion 1.5(c), is the proof); (b) if `A` and `B` are of type `FL` (`FP`, `FP_n`) over `R`, so is
`A × B` (BrownGTM87, §VIII.5). Route for (a): criterion 1.5(c). For a directed system `(M_i)` with
zero colimit, the spectral sequences of CohomologyOfGroups §6.2 for the `M_i` form a directed system
whose colimit is a convergent spectral sequence (directed colimits are exact) with `E₂`-terms
`colim_i Hᵖ(G ⧸ N, H^q(N, M_i))`. For `q ≤ n` the system `(H^q(N, M_i))_i` of
`G ⧸ N`-representations (CohomologyOfGroups §1.2) has zero colimit by 1.5(c) for `N`, so 1.5(c) for
`G ⧸ N` kills these terms for `p ≤ n`; hence every graded piece of `colim_i Hᵏ(G, M_i)` vanishes for
`k ≤ n`. Route for (b): for resolutions `P → R` over `RA` and `Q → R` over `RB` whose terms are
projective over `R` (projective over the group ring, `RA` and `RB` being free over `R`), the tensor
product `P ⊗_R Q` is a resolution of `R` over `RA ⊗_R RB = R[A × B]` (Künneth over `R` for complexes
of projective, hence flat, `R`-modules), with `P_i ⊗_R Q_j` a finitely generated projective (free)
`R[A × B]`-module when `P_i` and `Q_j` are finitely generated projective (free). For type `FL` take
finite resolutions by finitely generated free modules; for type `FP` finite resolutions by finitely
generated projective modules, which `TauCeti.Module.IsFPD` provides but which need not be free (the
trivial `ℚ[ℤ/2]`-module `ℚ` of the Tau Ceti supplier contract); for type `FP_n` free resolutions
whose terms in degrees `≤ n` are finitely generated, so that the total degree `k ≤ n` term
`⊕_{i+j=k} P_i ⊗_R Q_j` is finitely generated. *Needs:* 1.2, 1.5; CohomologyOfGroups §1.2, §6.2; Tau
Ceti `TauCeti.Module.IsFPD`.

**Checks.**

- `ℤⁿ` is of type `FL` over every `R`, as the `n`-fold product of `ℤ` (1.2).
- `ℤ/2 × ℤ` is of type `FP_∞` over `ℤ` as an extension of `ℤ` by `ℤ/2`, in agreement with 1.6.
- The extension statement has no converse over a nonzero `R`: the lamplighter group `ℤ/2 ≀ ℤ` is
  generated by two elements, so of type `FP_1` over every `R`, and its quotient by the base
  `⊕_ℤ ℤ/2` is `ℤ`, of type `FL`; the base is not finitely generated (its finitely generated
  subgroups are finite), so over every nonzero `R` it is not of type `FP_1` (1.4). Over the zero
  ring both groups are of type `FL`, so this does not distinguish the converse there.

### 1.8 Amalgams, HNN extensions and free groups

Prove: (a) for injective `C →* A` and `C →* B`, if `A` and `B` are of type `FP_n` over `R` and `C`
is of type `FP_{n−1}`, then the amalgam `A ∗_C B` (`Monoid.PushoutI` over `Bool`) is of type `FP_n`;
(b) for `A, B ≤ H` with `φ : A ≃* B`, if `H` is of type `FP_n` and `A` of type `FP_{n−1}`, then
`HNNExtension H A B φ` is of type `FP_n`; (c) the free group on a finite set `S` is of type `FL`
over every `R`, with the resolution `0 → RF^{(S)} → RF → R → 0` (BieriEckmann1973 Proposition 5.1,
lines 646–650, type (FF) over `ℤ` for nontrivial free groups; CohomologyOfGroups §3.6; for (a) and
(b) the route below, through the Bass–Serre tree and the cokernel lemma for pseudocoherence, is the
proof). Here `n − 1` is subtraction in `ℕ∞`, so `0 − 1 = 0` and `⊤ − 1 = ⊤`. Route: the Bass–Serre
tree of the one-edge graph of groups (FreeGroupsAndLimitGroups §§4.5, 4.7) gives by
CohomologyOfGroups §3.4 the exact sequences `0 → R[G/C] → R[G/A] ⊕ R[G/B] → R → 0` and
`0 → R[G/A] → R[G/H] → R → 0` of `RG`-modules; `R[G/A] = RG ⊗_{RA} R`, and induction along
`RA → RG`, `RG` being free over `RA`, is exact and sends `RAᵏ` to `RGᵏ`, so it preserves
`m`-pseudocoherence; conclude with `TauCeti.Huber.IsPseudoCoherentOver.cokernel` and `.prod`.
*Needs:* 1.2; CohomologyOfGroups §3.4, §3.6; FreeGroupsAndLimitGroups §4.5, §4.7; Tau Ceti
`TauCeti.Huber.IsPseudoCoherentOver.cokernel`, `.prod`; Mathlib `Monoid.PushoutI`, `HNNExtension`.

**Checks.**

- `ℤ/4 ∗_{ℤ/2} ℤ/6` is of type `FP_∞` over `ℤ`, its factors and edge group being finite.
- `BS(1, 2) = HNNExtension ℤ ℤ (2ℤ) (×2)` is of type `FP_∞` over every `R`.
- For `n = 1` the condition on `C` is vacuous: an amalgam of finitely generated groups over any
  subgroup is finitely generated.

### Examples

`ℤⁿ`, free groups of finite rank and `BS(1, 2)` are of type `FL` (the last as an HNN extension of
`ℤ` over `ℤ`, with resolution of length `2`); nontrivial finite groups and `ℤ/2 × ℤ` are of type
`FP_∞` but not `FP` over `ℤ`, and of type `FP` over `ℚ`, while the trivial group is of type `FL`
over every `R`; `ℚ` and infinitely generated free groups are not of type `FP_1` over any nonzero
`R`.

### Dependencies

Mathlib's carriers and `Ext`; Tau Ceti's pseudocoherence, finite projective dimension and cellular
resolution of a presented group; CohomologyOfGroups §§1.2, 3.4, 3.6 and 6.2;
FreeGroupsAndLimitGroups §§4.5 and 4.7.

---

## Layer 2: cohomological and homological dimension

### 2.1 Definitions and characterizations

Define the *cohomological dimension* `cd_R G` (`cohomologicalDim R G`) as the least `n ∈ ℕ∞` such
that `Hᵏ(G, M) = 0` for every `M : Rep R G` and every `k > n`, through `TauCeti.leastENatBound`
(Serre1971Bourbaki 1.1, lines 40–42; Brown1974, §3, lines 345–348), and the *homological dimension*
`hd_R G` in the same way with `Hₖ(G, M)` (BieriEckmann1973 line 155). The name differs from the
profinite `TauCeti.cohomologicalDimension`. Prove that for `n ∈ ℕ` the following are equivalent:
`cd_R G ≤ n`; `HasProjectiveDimensionLE (Rep.trivial R G R) n` in `Rep R G`; the `n`-th syzygy of
some (every) projective resolution of `R` over `RG` is projective; `R` has a projective resolution
of length at most `n`. Prove that `hd_R G ≤ n` if and only if `Tor_k^{RG}(N, R) = 0` for every right
`RG`-module `N` and every `k > n`. *Needs:* Mathlib `groupCohomology`, `groupHomology`,
`groupCohomologyIsoExt`, `groupHomologyIsoTor`, `HasProjectiveDimensionLE`; Tau Ceti
`TauCeti.leastENatBound`, `TauCeti.leastENatBound_le_iff`.

- The vanishing predicates are monotone in `n`, so `cd_R G ≤ n` holds exactly when the predicate
  holds at `n` (`TauCeti.leastENatBound_le_iff`); `cd_R G = ⊤` exactly when for every `n` some
  `Hᵏ(G, M)` with `k > n` is nonzero.
- `cd_R G = 0` exactly when `R` is a projective `RG`-module.
- If `Hᵏ(G, M) ≠ 0` then `k ≤ cd_R G`; likewise for `hd_R`.
- Both invariants are invariant under isomorphisms of groups.

**Checks.**

- `cd_R 1 = hd_R 1 = 0`.
- For `R ≠ 0`, `cd_R ℤ = hd_R ℤ = 1`: the resolution of 1.2 has length `1`, and
  `H¹(ℤ, R) = Hom(ℤ, R) = R ≠ 0`, `H₁(ℤ, R) = R ≠ 0`.
- Over the zero ring, `cd_0 G = hd_0 G = 0` for every `G`, including `G = ℤ/2`, while
  `cd_ℤ (ℤ/2) = ⊤` (2.7).

### 2.2 Homological against cohomological dimension, and type `FP`

Prove: (a) `hd_R G ≤ cd_R G`; (b) if `cd_R G < ⊤` and `Hᵏ(G, F) = 0` for every free `RG`-module `F`
and every `k > n`, then `cd_R G ≤ n` (BieriEckmann1973 Proposition 2.1, lines 280–286, by dimension
shifting along a free presentation); (c) for `G` of type `FP` over `R` with `cd_R G = n`, putting
`C = Hⁿ(G, RG)` (Conventions), there is `e ∈ Hₙ(G, C)` such that `x ↦ x ∩ e` is an isomorphism
`Hⁿ(G, A) ≅ H₀(G, C ⊗_R A) = C ⊗_{RG} A`, natural in `A` (BieriEckmann1973 Theorem 4.2, lines
566–602, over `ℤ`; the argument uses only that `P_n` is finitely generated projective, through
`Hom_{RG}(P_n, A) ≅ P_n^* ⊗_{RG} A`); (d) for `G` of type `FP` over `R`, `cd_R G = hd_R G`
(BieriEckmann1973 Corollary 4.3, lines 604–607), and if moreover `R` is nontrivial, `cd_R G` is the
largest `k` with `Hᵏ(G, RG) ≠ 0` (cohomology of a group of type `FP` commutes with direct sums, then
(b); BieriEckmann1973 lines 615–621). *Needs:* 2.1, 1.2; CohomologyOfGroups §4.6; Tau Ceti
`TauCeti.Module.isFPD_iff_hasProjectiveDimensionLE`.

**Checks.**

- For `G = ℤⁿ` and `R ≠ 0`, `cd_R = hd_R = n` and `Hⁿ(ℤⁿ, Rℤⁿ) ≅ R`, the top cohomology of the
  Koszul resolution dualised; `Hᵏ(ℤⁿ, Rℤⁿ) = 0` for `k ≠ n`.
- (d) needs type `FP`: for the additive group `ℚ`, `hd_ℤ ℚ = 1` and `cd_ℤ ℚ = 2` (2.5).
- For the finite group `ℤ/2` over `ℤ`, `hd = cd = ⊤`, and `(ℤ[ℤ/2])^{ℤ/2} ≠ 0` while
  `Hᵏ(ℤ/2, ℤ[ℤ/2]) = 0` for `k > 0`: (d) is not claimed outside type `FP`.
- Over the zero ring and `G = 1`, `cd_0 1 = 0` and every `Hᵏ(1, F)` is zero, so no degree carries
  nonzero cohomology with free coefficients: (b) gives `cd_0 1 ≤ n` for every `n ∈ ℕ`, which is
  true, while a model of `cd_R G` as the largest `k` with some `Hᵏ(G, F) ≠ 0` would have no value.
  This is why (b) is an upper bound and the characterization in (d) assumes `R` nontrivial; over
  `R ≠ 0` and `G = ℤ²`, `H²(ℤ², Rℤ²) = R ≠ 0` and `cd_R ℤ² = 2`.

### 2.3 Subgroups

Prove: (a) for `H ≤ G`, `cd_R H ≤ cd_R G` and `hd_R H ≤ hd_R G`, by Shapiro's lemma
(`Hᵏ(H, M) ≅ Hᵏ(G, Coind M)`, `Hₖ(H, M) ≅ Hₖ(G, Ind M)`); (b) if `H` has finite index and
`cd_R G < ⊤`, then `cd_R H = cd_R G` (BieriEckmann1973 Proposition 2.1, lines 280–286, with
`RG ≅ Coind_H^G RH` and coinduction commuting with direct sums at finite index; BieriEckmann1973
Proposition 3.1, lines 366–369, with the isomorphism `Hom_H(ℤG, ℤH) ≅ ℤG` of lines 345–351);
(c) if `H` has finite index and `[G : H]` is a unit of `R`, then `cd_R G ≤ cd_R H` and
`hd_R G ≤ hd_R H`, since restriction followed by corestriction is multiplication by `[G : H]`
(BrownGTM87, §III.10). *Needs:* 2.1, 2.2; Mathlib `groupCohomology.coindIso`,
`groupHomology.indIso`; Tau Ceti `TauCeti.groupCohomology.corestriction`,
`TauCeti.groupCohomology.map_subtype_id_comp_corestriction`, `TauCeti.groupHomology.transfer`,
`TauCeti.groupHomology.transfer_comp_map_subtype_id`.

**Checks.**

- (b) needs `cd_R G < ⊤`: for `G = ℤ/2 × ℤ ⊇ H = 0 × ℤ` over `ℤ`, `cd H = 1` and `cd G = ⊤`.
- (c) for the same pair over `ℚ`: `[G : H] = 2` is a unit, so `cd_ℚ G ≤ 1`, and `cd_ℚ G = 1`.
- For `H = 2ℤ ≤ ℤ` and `R ≠ 0`, both sides of (b) are `1`; over the zero ring both are `0`.

### 2.4 Extensions and products

Prove that for `N ◁ G`, `cd_R G ≤ cd_R N + cd_R (G ⧸ N)` and `hd_R G ≤ hd_R N + hd_R (G ⧸ N)` in
`ℕ∞` (BieriEckmann1973 lines 479–480; CohomologyOfGroups §§6.2–6.3: `E₂^{p,q} = 0` for
`p > cd_R (G ⧸ N)` or `q > cd_R N`, and convergence); hence `cd_R (A × B) ≤ cd_R A + cd_R B`, and an
extension of groups of type `FP` over `R` is of type `FP` (BieriEckmann1974 Proposition 3.3(a),
lines 298–313; 1.7 and 1.2). *Needs:* 2.1, 1.7; CohomologyOfGroups §6.2, §6.3.

**Checks.**

- `cd_R ℤⁿ ≤ n` by induction from `ℤ`, with equality for `R ≠ 0` since `Hₙ(ℤⁿ, R) ≅ Λⁿ(Rⁿ) ≅ R`
  (`TauCeti.groupHomologyPiMultiplicativeIntExteriorPowerEquiv`), so `n ≤ hd_R ≤ cd_R`.
- For `ℤ/2 × ℤ` over `ℤ` the bound is `⊤ + 1 = ⊤`, the true value.
- The Klein bottle group `K = ℤ ⋊ ℤ` (the generator `t` of the quotient acting on `ℤ = ⟨a⟩` by
  `−1`) has `cd_R K ≤ 2`, with equality for `R = 𝔽₂`: as the HNN extension of `⟨a⟩` along
  `a ↦ a⁻¹`, CohomologyOfGroups §3.6 gives `H¹(⟨a⟩, 𝔽₂) → H¹(⟨a⟩, 𝔽₂) → H²(K, 𝔽₂) → H²(⟨a⟩, 𝔽₂) = 0`
  with first map `1 − (−1) = 0` mod `2`, so `H²(K, 𝔽₂) = 𝔽₂`.

### 2.5 Directed unions

Prove: (a) if `G` is the union of a directed family of subgroups `G_i`, then
`hd_R G = sup_i hd_R G_i` (`≥` by 2.3(a); `≤` because `Hₙ(G, A)` vanishes when every
`Hₙ(G_i, A)` does, `TauCeti.groupHomology.isZero_groupHomology_of_directed`); (b) if `G` is the union of an
increasing sequence of subgroups `G_0 ≤ G_1 ≤ ⋯`, then `cd_R G ≤ sup_i cd_R G_i + 1` (BrownGTM87,
§VIII.2; the telescope argument below, valid over every `R`, is the proof). Route for (b): the
telescope sequence `0 → ⊕_i R[G/G_i] → ⊕_i R[G/G_i] → R → 0`, with first map
`a ↦ a − (image of a in the next term)`, is exact because `colim_i R[G/G_i] = R`; its long exact
`Ext`-sequence and `Ext^k_{RG}(⊕_i R[G/G_i], M) ≅ ∏_i Hᵏ(G_i, M)` (CohomologyOfGroups §1.4) give
`Hᵏ(G, M) = 0` above `sup_i cd_R G_i + 1`. *Needs:* 2.1, 2.3; Tau Ceti
`TauCeti.groupHomology.isZero_groupHomology_of_directed`; CohomologyOfGroups §1.4; Mathlib
`groupCohomologyIsoExt`.

**Checks.**

- For `ℚ = ⋃_i (1/i!)ℤ`: `hd_ℤ ℚ = 1` by (a) and `cd_ℤ ℚ ≤ 2` by (b). The bound is attained: by
  CohomologyOfGroups §5.2, `H²(ℚ, ℤ)` contains `Ext¹_ℤ(H₁(ℚ, ℤ), ℤ) = Ext¹_ℤ(ℚ, ℤ)`, which is the
  cokernel of the countable `Hom(ℚ, ℚ) = ℚ` in the uncountable `Hom(ℚ, ℚ/ℤ)`, hence nonzero; so
  `cd_ℤ ℚ = 2 = hd_ℤ ℚ + 1`.
- The free group of countably infinite rank is the increasing union of free groups of finite rank:
  over `R ≠ 0`, `hd_R = 1` by (a), and `cd_R ≤ 2` by (b), while 2.6 gives the true value
  `cd_R = 1`; over the zero ring both dimensions are `0`.
- (a) needs directedness: `ℤ²` is the union of its cyclic subgroups, each of `hd_ℤ ≤ 1`, while
  `hd_ℤ ℤ² = 2`; the family is not directed.

### 2.6 Amalgams, HNN extensions and free groups

Prove `cd_R (A ∗_C B) ≤ max(cd_R A, cd_R B, cd_R C + 1)`,
`cd_R (HNNExtension H A B φ) ≤ max(cd_R H, cd_R A + 1)` and the same for `hd_R`, and that a free
group `F` has `cd_R F ≤ 1`, with equality when `F ≠ 1` and `R ≠ 0` (CohomologyOfGroups §3.6;
BrownGTM87, §VIII.2). *Needs:* 2.1; CohomologyOfGroups §3.6.

**Checks.**

- `cd_R (ℤ ∗ ℤ) = 1` for `R ≠ 0`.
- For `ℤ/4 ∗_{ℤ/2} ℤ/6` over `ℚ` the bound is `max(0, 0, 0 + 1) = 1`, the true value; over `ℤ` it is
  `⊤`.
- For `BS(1, 2) = HNNExtension ℤ ℤ (2ℤ) (×2)` and `R ≠ 0` the bound is
  `max(cd_R ℤ, cd_R ℤ + 1) = max(1, 2) = 2`; over the zero ring it is `max(0, 0 + 1) = 1`, while
  `cd_0 BS(1, 2) = 0` (2.1).

### 2.7 Finite subgroups and torsion

Prove, for `R` nontrivial: a finite group `H` has `cd_R H = 0` if `|H|` is a unit of `R` and
`cd_R H = ⊤` otherwise; hence every finite subgroup of a group of finite `cd_R` has order invertible
in `R`, a group of finite `cd_ℤ` is torsion-free, and `cd_R G = 0` exactly when `G` is finite of
order invertible in `R` (Brown1974, §3, lines 352–358; BieriEckmann1973 line 61). Route: if `|H|` is
a unit, `1 ↦ |H|⁻¹ Σ_h h` splits the augmentation; otherwise some prime `p ∣ |H|` is not a unit of
`R`, `H` contains an element of order `p`, and `H^{2k}(ℤ/p, R) = R/pR ≠ 0` for all `k ≥ 1`
(`Rep.FiniteCyclicGroup.groupCohomologyIsoEven`), so 2.3(a) applies; if `cd_R G = 0`, a splitting of
the augmentation is an invariant element of `RG` of augmentation `1`, which forces `G` finite and
`|G|` invertible. *Needs:* 2.1, 2.3; Mathlib `Rep.FiniteCyclicGroup.groupCohomologyIsoEven`.

**Checks.**

- `cd_{ℤ[1/2]} (ℤ/2) = 0` and `cd_{ℤ/6} (ℤ/2) = ⊤`: in `ℤ/6`, `2 ≠ 0` but `2` is not a unit, and
  `H²(ℤ/2, ℤ/6) = ℤ/2`. A model asking `|H| ≠ 0` in `R` instead of `|H|` a unit gives `0` here.
- `cd_{ℤ[1/2]} (ℤ/6) = ⊤`, since `3` is not a unit of `ℤ[1/2]`.
- Over the zero ring every scalar is a unit, so every finite group falls in the unit-order branch,
  with `cd_0 H = 0` as predicted; the nontriviality of `R` is used for the implication from
  `cd_R G = 0` to finiteness of `G`, which fails over the zero ring: `cd_0 ℤ = 0` although `ℤ` is
  infinite.

### 2.8 Comparison with the profinite invariant

Prove that for `G : Type` with the discrete topology,
`TauCeti.cohomologicalDimension.{0} G ≤ cd_ℤ G`, where `cd_ℤ` is the discrete invariant of 2.1
(Serre1971Bourbaki 1.1, lines 40–42; the comparison is the following argument): for a discrete
torsion `G`-module `M` every action is continuous, and CohomologyOfGroups §1.5 identifies the
continuous cohomology with `Hᵏ(G, M)`, which vanishes above `cd_ℤ G`. For finite `G` that
identification is Tau Ceti's `TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology`.
*Needs:* 2.1; CohomologyOfGroups §1.5; Tau Ceti `TauCeti.cohomologicalDimension`, and for finite
`G` `TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology`.

**Checks.**

- For `G = ℤⁿ` both sides are `n`: `Hⁿ(ℤⁿ, ℤ/p) = ℤ/p ≠ 0` for every prime `p`.
- For a nontrivial finite `G` both sides are `⊤`, by `p`-torsion coefficients for a prime `p ∣ |G|`.
- For `G = 1` both sides are `0`.

### Examples

`cd_ℤ` and `hd_ℤ` of `ℤⁿ`, nontrivial free groups and the Klein bottle group are `n`, `1` and `2`,
while the free group of rank `0` is trivial with both equal to `0`; finite nontrivial groups have
both equal to `⊤` over `ℤ` and `0` over `ℚ`; the additive group `ℚ` has `hd_ℤ = 1 < cd_ℤ = 2`.

### Dependencies

Layer 1; Mathlib's `Ext` and projective dimension; Tau Ceti's corestriction, `leastENatBound` and
the profinite cohomological dimension, and its vanishing of the homology of a directed union;
CohomologyOfGroups §§1.4–1.5, 3.6, 4.6, 5.2 and 6.2–6.3.

---

## Layer 3: tensor induction of complexes and Serre's theorem

### 3.1 Signed tensor induction of complexes

Let `H ≤ G` have finite index `d`, fix a transversal `t_1, …, t_d` of `G ⧸ H`, and for `g ∈ G` write
`g t_i = t_{σ_g(i)} h_i(g)` with `σ_g` a permutation and `h_i(g) ∈ H`. For a chain complex `F` of
`RH`-modules indexed by `ℕ`, define its *tensor induction* `Ind_H^{G,⊗} F`: the graded `R`-module
`F^{⊗_R d}` with total degree, the differential `Σ_i ± 1 ⊗ ⋯ ⊗ d ⊗ ⋯ ⊗ 1` with the Koszul sign of
moving `d` past the factors before it, and the action
`g · (x_1 ⊗ ⋯ ⊗ x_d) = ε · ⊗_j h_{σ_g⁻¹(j)}(g) x_{σ_g⁻¹(j)}`, where `ε = ±1` is the Koszul sign of
permuting the homogeneous factors by `σ_g`. Prove: (a) this is a chain complex of `RG`-modules (the
signs make the action compatible with the differential and with composition in `G`); (b) a change of
transversal gives a naturally isomorphic complex; (c) tensor induction is functorial in chain maps,
and its underlying complex of `R`-modules is `F^{⊗_R d}`, so it carries chain maps that are
`R`-linear homotopy equivalences to `R`-linear homotopy equivalences; (d) if `F → R` is a resolution
of the trivial module by `R`-projective terms, then `Ind_H^{G,⊗} F → R^{⊗ d} = R` is a resolution of
the trivial `RG`-module; (e) if `F_k = 0` for `k > n` then `(Ind_H^{G,⊗} F)_k = 0` for `k > nd`; (f)
suppose each `F_k` is a free `RH`-module with a chosen basis `S_k`, so that `F_k = R[X_k]` is the
permutation module on the free `H`-set `X_k = H × S_k` (its *regular `R`-basis*, `H` acting by left
multiplication on the first factor). Then the tensors `x_1 ⊗ ⋯ ⊗ x_d` with `x_j ∈ X_{k_j}` and
`Σ_j k_j = k` form an `R`-basis of `(Ind_H^{G,⊗} F)_k` indexed by the set `T_k` of these index
tuples; `G` acts on `T_k` by `g · (x_j)_j = (h_{σ_g⁻¹(j)}(g) x_{σ_g⁻¹(j)})_j`, and on the module by
this permutation of the basis times the Koszul sign. For an index tuple `τ ∈ T_k` let `K_τ` be its
stabilizer in the `G`-set `T_k` and `χ_τ : K_τ → {±1}` the Koszul sign of the permutation of the
graded factors of `τ` by which an element of `K_τ` acts (a homomorphism, read in `R` through
`ℤ → R`). Prove that `(Ind_H^{G,⊗} F)_k ≅ ⊕_τ Ind_{K_τ}^G(R_{χ_τ})`, the sum over representatives of
the `G`-orbits on `T_k`, and that every `K_τ` meets the normal core `N = ⋂_g gHg⁻¹` trivially, so is
finite. The stabilizer is that of the index tuple, defined independently of `R`, and not that of the
submodule spanned by the basis tensor: over the zero ring that submodule is `0` and its stabilizer
is all of `G`. (Brown1974, §6, lines 643–651, for Serre's multiplicative induction of a complex and
its fixed points; Serre1971Prospects n°1.7; BrownGTM87, §VIII.3.) Route: (a)–(b) from the monomial
description of the wreath-product action, as in Tau Ceti's sign-free `Representation.wreathTensor`,
with the Koszul sign added; (d) because a resolution by `R`-projective terms of the projective
`R`-module `R` is an `R`-linear homotopy equivalence `F ≃ R`, and (c); (f) by the orbit
decomposition of a signed permutation module (over `ℤ`, then by base change to `R`), and because an
element `g` of `N` has `σ_g = id` and acts on the `j`-th index by `t_j⁻¹ g t_j ∈ H`, which fixes no
element of the free `H`-set `X_{k_j}` unless it is `1`. *Needs:* Tau Ceti
`Subgroup.tensorInducedRepresentation`, `Representation.wreathTensor`; Mathlib `PiTensorProduct`,
`HomologicalComplex`.

- Tensor induction from `H = G` is the identity functor, and tensor induction is transitive along
  `K ≤ H ≤ G` up to natural isomorphism.
- In degree `0` of a complex concentrated in degree `0` it is
  `Subgroup.tensorInducedRepresentation`.

**Checks.**

- For `H = 1`, `G = ℤ/2 = ⟨s⟩` and `F = R·x` concentrated in degree `1`, the degree-`2` term is
  `R·(x ⊗ x)` with `s · (x ⊗ x) = −x ⊗ x`: the index tuple `(x, x)` has stabilizer `K = ℤ/2`, and
  `χ(s) = −1` because `s` exchanges two odd factors; the term is `Ind_K^G(R_χ) = R_χ`, the sign
  representation, for every `R` (over `𝔽₂` the image of `χ` in `R` is trivial). For
  `F = (R·x → R·y)`, `dx = y`, one has `d(x ⊗ x) = y ⊗ x − x ⊗ y`; the signed action sends `x ⊗ x`
  to `−x ⊗ x` and `y ⊗ x − x ⊗ y` to `x ⊗ y − y ⊗ x`, so it commutes with `d`, while the sign-free
  swap `s'` fixes `x ⊗ x` and also sends `y ⊗ x − x ⊗ y` to its negative, so
  `d s'(x ⊗ x) − s' d(x ⊗ x) = 2(y ⊗ x − x ⊗ y)`. When `2 ≠ 0` in `R` (for instance `R = ℤ`) this is
  nonzero and the model without the Koszul sign is not a chain map; over `𝔽₂` the two models
  coincide, which is why Tau Ceti's sign-free construction is used only in characteristic two.
- For `H = 1`, `G = ℤ/2 = ⟨s⟩` and the contractible `F = (R·x →id R·y)` in degrees `1, 0`, the
  tensor induction is `R·(x ⊗ x) → RG → R` in degrees `2, 1, 0`, of length `2 = 1 · 2`: with
  `a = x ⊗ y` and `b = y ⊗ x = s·a`, degree `1` is free on `a`, `s` acts on `x ⊗ x` by `−1`,
  `d(x ⊗ x) = b − a` and `da = db = y ⊗ y`. It is contractible as a complex of `R`-modules, as (c)
  predicts: `h(y ⊗ y) = a`, `h(a) = 0`, `h(b) = x ⊗ x` give `dh + hd = id` in degrees `0, 1, 2`. It
  has an `RG`-linear contraction exactly when `2` is a unit of `R`: an equivariant `h` sends `y ⊗ y`
  to an invariant `k(a + b)`, whose boundary is `2k·(y ⊗ y)`, and when `2` is a unit,
  `h(y ⊗ y) = (a + b)/2`, `h(a) = −(x ⊗ x)/2`, `h(b) = (x ⊗ x)/2` is one. So over `ℤ` or `𝔽₂` the
  augmentation `RG → R` has no `G`-equivariant section, and although `F ≃ 0` is `RH`-linear here,
  its tensor induction is not `RG`-linearly contractible: (c) is a statement about `R`-linear
  homotopy equivalences only.
- For `H = G` and any `F`, the result is `F`.
- The stabilizers of (f) are taken on indices, so the zero ring is covered: for `R = 0`, `H = G = ℤ`
  (so `d = 1` and `N = ℤ`) and `F = RH` in degree `0` with the basis `{1}`, the index set is
  `T_0 = X_0 = ℤ` with the regular action, every index has stabilizer `1`, which meets `N` in `1`,
  and the single orbit contributes `Ind_1^ℤ(0) = 0 = F_0`. The stabilizer of the submodule spanned
  by a basis tensor would be the stabilizer of `0`, namely `ℤ`, infinite and equal to its
  intersection with `N`. For `R ≠ 0` the two stabilizers agree, since, writing `e_τ` for the basis
  tensor of `τ`, `±e_{τ'}` lies in `R·e_τ` only for `τ' = τ`.

### 3.2 Serre's theorem

Prove that if `G : Type` is torsion-free (`IsMulTorsionFree G`) and `H ≤ G` has finite index, then
`cd_ℤ G = cd_ℤ H` (`cohomologicalDim_eq_of_finiteIndex`; Serre1971Prospects n°1.7, Théorème 1, as
cited at Brown1974 line 354 and BieriEckmann1973 line 396; BrownGTM87, §VIII.3). Deduce that a
torsion-free group with a finite-index subgroup of type `FP` over `ℤ` is of type `FP`
(BieriEckmann1974 Proposition 3.3(b), lines 300–313). Route: if `cd_ℤ H = n`, modify a projective
resolution of length `n` by the Eilenberg swindle on its top term into a resolution of length `n` by
free `ℤH`-modules with chosen bases; by 3.1(d)–(f) its tensor induction is a resolution of `ℤ` over
`ℤG` of length `nd` whose terms are sums of `Ind_{K_τ}^G(ℤ_{χ_τ})` with `K_τ` finite, hence
`K_τ = 1` and the terms are free; so `cd_ℤ G < ⊤` and 2.3(b) gives equality. *Needs:* 3.1, 2.3, 2.7,
1.6; Mathlib `IsMulTorsionFree`.

**Checks.**

- Torsion-freeness is used: `ℤ/2 × ℤ ⊇ 0 × ℤ` has `cd_ℤ = ⊤` against `1`.
- The Klein bottle group contains `ℤ²` with index `2`, and both have `cd_ℤ = 2`.
- For `G = H` the statement is trivial; for `G = ℤ ⊇ dℤ` both sides are `1`.

### Examples

The Klein bottle group and every torsion-free extension of `ℤ` by a finite group have the
cohomological dimension of their finite-index free abelian subgroups; `ℤ/2 × ℤ` shows that the
torsion-free hypothesis cannot be dropped.

### Dependencies

Layers 1–2; Tau Ceti's tensor induction of representations; Mathlib's indexed tensor products.

---

## Layer 4: virtual cohomological dimension and virtual finiteness

### 4.1 Virtual cohomological dimension

Define, for `G : Type`, `vcd G` (`virtualCohomologicalDim G`) as the infimum in `ℕ∞` of `cd_ℤ H`
over the subgroups `H` of finite index. Prove that if some finite-index subgroup has finite `cd_ℤ`,
then `vcd G = cd_ℤ H` for every finite-index subgroup `H` with `cd_ℤ H < ⊤`, and for every
torsion-free finite-index subgroup `H`; such subgroups exist, and they are exactly the torsion-free
finite-index subgroups (Serre1971Bourbaki lines 77–86; Brown1974, §3, lines 352–358). Route: two
finite-index subgroups of finite `cd` share a finite-index subgroup, so 2.3(b) equates their
dimensions; a torsion-free finite-index subgroup has finite `cd` by 3.2, and a subgroup of finite
`cd` is torsion-free by 2.7. *Needs:* 2.3, 2.7, 3.2.

- `vcd G = 0` exactly when `G` is finite.
- If `cd_ℤ G < ⊤` then `vcd G = cd_ℤ G`.
- `vcd G < ⊤` exactly when `G` is virtually torsion-free with a torsion-free finite-index subgroup
  of finite `cd_ℤ`; `vcd G = ⊤` when no finite-index subgroup is torsion-free.
- `vcd` is invariant under isomorphism.

**Checks.**

- `vcd` of a finite group is `0`, the trivial subgroup having finite index and `cd_ℤ 1 = 0`.
- `vcd (ℤ/2 × ℤⁿ) = n`, through the subgroup `ℤⁿ`, while `cd_ℤ (ℤ/2 × ℤⁿ) = ⊤`.
- `vcd (ℤ/4 ∗_{ℤ/2} ℤ/6) = 1`: the homomorphism to `ℤ/12` given by `×3` on `ℤ/4` and `×2` on `ℤ/6`
  is injective on both factors, so its kernel meets every conjugate of a factor trivially; finite
  subgroups fix a vertex of the Bass–Serre tree (FreeGroupsAndLimitGroups §4.9), so the kernel is
  torsion-free, acts freely and is free (§4.8), nontrivial, of index `12`, with `cd_ℤ = 1`.
- The infinite direct sum `⊕_ℕ ℤ/2` has no torsion-free subgroup of finite index, so its `vcd` is
  `⊤`.

### 4.2 Behaviour under subgroups and extensions

Prove: `vcd H ≤ vcd G` for `H ≤ G`, with equality when `H` has finite index; and for `N ◁ G` with
`G` virtually torsion-free, `vcd G ≤ vcd N + vcd (G ⧸ N)` (BrownGTM87, §VIII.11). Route: intersect
with a torsion-free finite-index subgroup; for the extension, choose `G' ≤ G` torsion-free of finite
index whose image in `G ⧸ N` lies in a torsion-free finite-index subgroup of `G ⧸ N`, and apply 2.4
to `G' ∩ N ◁ G'`. *Needs:* 4.1, 2.3, 2.4.

**Checks.**

- `vcd (ℤ/2 × ℤ) = 1 = vcd (ℤ/2) + vcd ℤ`.
- `vcd (ℤ/2) = 0 < 1 = vcd (ℤ/2 × ℤ)`, while `cd_ℤ` is `⊤` for both: `vcd` separates the subgroup
  from the group where `cd` does not.
- If `G` is not virtually torsion-free its `vcd` is `⊤` (4.1), so the hypothesis of the extension
  bound is what makes it informative.

### 4.3 Cohomology above the virtual dimension with rational coefficients

Prove that if `vcd G = n < ⊤` and `R` is a commutative ring in which the index of some torsion-free
finite-index subgroup is a unit, in particular every `ℚ`-algebra, then `cd_R G ≤ n`: `Hᵏ(G, M) = 0`
for `k > vcd G` and every `M : Rep R G` (BrownGTM87, §VIII.2). Route: `cd_R H ≤ cd_ℤ H` by base
change of a projective resolution of `ℤ` over `ℤH`, which consists of free `ℤ`-modules and so stays
exact, and 2.3(c). *Needs:* 4.1, 2.3, 1.3.

**Checks.**

- For `G = ℤ/2 × ℤ`, `cd_ℚ G = 1 = vcd G`.
- The index hypothesis is used: over `𝔽₂`, `Hᵏ(ℤ/2 × ℤ, 𝔽₂) ⊇ Hᵏ(ℤ/2, 𝔽₂) ≠ 0` for every `k`
  (the projection to `ℤ/2` splits), so `cd_{𝔽₂} = ⊤ > 1`.
- For a finite group, `cd_ℚ = 0 = vcd`.

### 4.4 Virtual finiteness types and finite homological type

Define `G` to be *virtually of type `FP`* (`IsVirtuallyOfTypeFP G`; virtually of type `FL`) when
some finite-index subgroup is of type `FP` (`FL`) over `ℤ`, and to have *finite homological type*
(`HasFiniteHomologicalType G`) when `vcd G < ⊤` and every torsion-free finite-index subgroup has
finitely generated integral homology in every degree (Brown1974, §3, lines 359–370). Prove: if
`vcd G < ⊤`, `G` is virtually of type `FP` exactly when it is of type `FP_∞` over `ℤ`, and then
every torsion-free finite-index subgroup is of type `FP` (Brown1974 lines 359–362); a group
virtually of type `FP` has finite homological type; and `G` has finite homological type exactly when
a finite-index subgroup has (Brown1974 Proposition 1, lines 380–384, from the homological spectral
sequence of a torsion-free group over a finite-index normal subgroup, CohomologyOfGroups §6.3, whose
`E²`-terms are homology of a finite group with finitely generated coefficients). *Needs:* 4.1, 1.6,
1.2, 2.3; CohomologyOfGroups §6.3.

- Virtual types are invariant under isomorphism and pass to and from finite-index subgroups.
- A group of type `FP` over `ℤ` is torsion-free with finite homological type, and its `vcd` is its
  `cd_ℤ`.

**Checks.**

- A finite group has finite homological type and is virtually of type `FL`.
- `ℤ/4 ∗_{ℤ/2} ℤ/6` is virtually of type `FL` through its free subgroup of index `12` (4.1).
- `ℤ/2 × ℚ` has `vcd = 2` but not finite homological type, since `H₁(ℚ, ℤ) = ℚ` is not finitely
  generated; and `ℚ` is not virtually of type `FP` although `vcd ℚ = 2`.

### Examples

Arithmetic groups are the motivating examples (every torsion-free finite-index subgroup of type
`FL`, Brown1974 lines 371–379); the Borel–Serre instance for `Aut(P)`, with a finite classifying
complex at neat level, is ArithmeticKTheory §3.2. Here the examples are finite groups, `ℤ/2 × ℤⁿ`
and the amalgam `ℤ/4 ∗_{ℤ/2} ℤ/6`.

### Dependencies

Layers 1–3; CohomologyOfGroups §6.3; FreeGroupsAndLimitGroups §§4.8–4.9 for a Check.

---

## Layer 5: geometric dimension, the Eilenberg–Ganea theorem and proper actions

### 5.1 Geometric dimension

Define, for `G : Type u`, the *geometric dimension* `gd G` (`geometricDim G`) as the least `n ∈ ℕ∞`
such that some Hausdorff space `X : Type u` with a CW structure on `univ` having no cells of
dimension above `n` is a `K(G, 1)` (`TauCeti.IsEilenbergMacLaneSpaceOne G X x` for some `x`), and
`⊤` if there is none (BrownGTM87, §VIII.7). A `K(G, 1)` CW complex exists for every group
(ClassifyingSpaces Stage 2 item 10; Tau Ceti
`TauCeti.isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`), so `gd G = ⊤` means that none is
finite dimensional. *Needs:* Mathlib `Topology.CWComplex`; Tau Ceti
`TauCeti.IsEilenbergMacLaneSpaceOne`, `TauCeti.IsAspherical`, `TauCeti.leastENatBound`.

- `gd` is invariant under isomorphism of groups.
- `gd G = 0` exactly when `G` is trivial: a `K(G, 1)` is nonempty and path-connected (both are part
  of `TauCeti.IsAspherical`), a CW complex with no cells of positive dimension is discrete, so a
  nonempty path-connected one has exactly one `0`-cell and is a point with trivial fundamental
  group; conversely the point is a `K(1, 1)`.
- `gd G ≤ n` exactly when a `K(G, 1)` CW complex of dimension at most `n` exists.

Covering-space theory applies to every Hausdorff space `X` with a CW structure on `univ`: to every
`K(G, 1)` of the definition, to its skeleta, and to the complexes obtained from them by attaching
cells, which 5.2, 5.3 and 5.5 lift to universal covers. Such an `X` is locally path-connected, being
delta-generated (`TauCeti.instDeltaGeneratedSpaceOfCWComplexUniv` with Mathlib's instance for
`DeltaGeneratedSpace`), and locally contractible in the sense of Mathlib's
`LocallyContractibleSpace` (AlgebraicTopology §4.7, the cell-neighbourhood local contraction;
Hatcher2002, Appendix, Proposition A.4, p. 522), hence semilocally simply connected
(`TauCeti.SemilocallySimplyConnectedSpace.of_locallyContractibleSpace`). So if `X` is
path-connected, for every `x ∈ X` the universal cover `TauCeti.UniversalCover x` is simply connected
(`TauCeti.UniversalCover.simplyConnectedSpace`) and its projection is a quotient covering map for
the action of `π₁(X, x)` (`TauCeti.UniversalCover.isQuotientCoveringMap`); for a `K(G, 1)` these are
the hypotheses on `p : E → B` of `TauCeti.cellularResolutionOfIsAspherical`, with `G ≅ π₁(X, x)`.
*Needs:* AlgebraicTopology §4.7; Mathlib `LocallyContractibleSpace`, `DeltaGeneratedSpace`; Tau Ceti
`TauCeti.instDeltaGeneratedSpaceOfCWComplexUniv`,
`TauCeti.SemilocallySimplyConnectedSpace.of_locallyContractibleSpace`,
`TauCeti.UniversalCover.simplyConnectedSpace`, `TauCeti.UniversalCover.isQuotientCoveringMap`.

**Checks.**

- `gd 1 = 0` (a point) and `gd (FreeGroup S) = 1` for `S` nonempty: the wedge of circles
  (`TauCeti.WedgeSum.isEilenbergMacLaneSpaceOne_circle`) is `1`-dimensional and `gd ≥ cd_ℤ = 1`
  (5.2).
- `gd ℤⁿ = n`: the product of `n` circles with the product CW structure (`TauCeti.cwComplexProd`) is
  an `n`-dimensional `K(ℤⁿ, 1)`, and `gd ≥ cd_ℤ = n`.
- `gd G = ⊤` for a nontrivial finite group, since `cd_ℤ G = ⊤` (2.7, 5.2).
- Dimension zero, not the absence of `1`-cells, is what makes a path-connected CW complex a point:
  `S²` with one `0`-cell and one `2`-cell is path-connected and has no `1`-cells, yet
  `H₂(S², ℤ) = ℤ` while a point has `H₂ = 0`; nor is it a `K(1, 1)`, since
  `π₂(S²) ≅ H₂(S², ℤ) = ℤ` by the Hurewicz theorem. The two-point discrete space is zero-dimensional
  but not path-connected, hence no `K(G, 1)`.
- The CW structure is what makes universal covers available. The shrinking wedge of circles (the
  union in `ℝ²` of the circles `C_n` of radius `1/n` centred at `(1/n, 0)`) is compact, Hausdorff
  and path-connected, but not semilocally simply connected at the origin (Hatcher2002, §1.3,
  p. 63): every neighbourhood of the origin contains some `C_n`, and the retraction onto `C_n`
  collapsing the other circles (continuous by pasting along two closed sets meeting at the origin)
  sends the loop around `C_n` to a generator of `π₁(C_n) ≅ ℤ`, so that loop is not null-homotopic.
  Hence, by the paragraph above, this space admits no CW structure. The wedge of countably many
  circles, the same set with the weak topology, is a `1`-dimensional CW complex and is semilocally
  simply connected (`TauCeti.WedgeSum.instSemilocallySimplyConnectedSpaceCircle`).

### 5.2 Cohomological against geometric dimension, and finite classifying spaces

Prove that for `G : Type` and every `R : Type`, `cd_R G ≤ gd G`; that a `K(G, 1)` CW complex with
finitely many cells is a witness that `G` is of type `FL` over every `R`; and that one with finitely
many cells in each dimension `≤ n` makes `G` of type `FP_n` over every `R` (Serre1971Bourbaki 1.2,
lines 55–58; Brown1975, §3, lines 216–231; BrownGTM87, §VIII.7). Route: the lifted cellular chains
of the universal cover, a quotient covering for `π₁ ≅ G` (5.1), are a free resolution of `R` with
one generator per cell (`TauCeti.cellularResolutionOfIsAspherical`,
`TauCeti.cellularChainRepIsoFree`; ClassifyingSpaces Stage 4 item 16). *Needs:* 5.1, 1.2, 2.1;
Tau Ceti `TauCeti.cellularResolutionOfIsAspherical`, `TauCeti.cellularChainRepIsoFree`,
`TauCeti.UniversalCover.isQuotientCoveringMap`; ClassifyingSpaces Stage 4 item 16.

**Checks.**

- The torus `T²` with its product structure (one `0`-cell, two `1`-cells, one `2`-cell) gives the
  resolution `0 → Rℤ² → (Rℤ²)² → Rℤ² → R → 0` and `cd_R ℤ² ≤ 2`.
- For the presentation complex of a finite presentation, the finitely many cells of dimension `≤ 2`
  give type `FP_2`, consistent with 1.4(c).
- A finite group has no finite-dimensional `K(G, 1)` CW complex unless it is trivial.

### 5.3 The Eilenberg–Ganea theorem

Prove that `gd G ≤ max(3, cd_ℤ G)` for `G : Type` (`geometricDim_le_max`); hence `gd G = cd_ℤ G`
whenever `cd_ℤ G ≥ 3` (EilenbergGanea1957, main theorem; BrownGTM87, §VIII.7). Route, for
`n = max(3, cd_ℤ G)` finite: let `X` be a `K(G, 1)` CW complex and `Y` its `(n − 1)`-skeleton, which
has fundamental group `G` since `n − 1 ≥ 2` (AlgebraicTopology §8.1). The cellular chains of the
universal cover `Ỹ` (a quotient covering for `π₁(Y) ≅ G`, 5.1) are exact below degree `n − 1`, and
`Z = ker(∂ : C_{n−1} → C_{n−2}) = H_{n−1}(Ỹ)` is the `n`-th syzygy of a free resolution of `ℤ`,
projective because `cd_ℤ G ≤ n` (2.1). Choose `Q` with `Z ⊕ Q` free and put `F = (Z ⊕ Q)^{(ℕ)}`, so
that `Z ⊕ F ≅ F` (the Eilenberg swindle); wedge `Y` with one `(n − 1)`-sphere for each element of a
basis of `F` (attaching `(n − 1)`-cells along constant maps, `TauCeti.cellAttachment`), which adds
`F` to `C_{n−1}` with zero boundary and makes the new cycle module `Z ⊕ F` free. The new universal
cover (again by 5.1) is simply connected and `(n − 2)`-connected, so by the Hurewicz theorem
`π_{n−1} = H_{n−1}` (AlgebraicTopology §8.3; Tau Ceti `HomotopyGroup.bijective_hurewicz`); attach
`n`-cells along maps representing a basis of this free module (`TauCeti.cellAttachment`). The
result is `n`-dimensional, has fundamental group `G` (`n ≥ 3`), and its universal cover has acyclic
cellular chains, so it is contractible by the Hurewicz and Whitehead theorems (AlgebraicTopology
§8.5; Tau Ceti `TauCeti.contractibleSpace_of_subsingleton_homotopyGroup`). *Needs:* 5.1, 5.2, 2.1;
AlgebraicTopology §8.1, §8.3, §8.5; ClassifyingSpaces Stage 4 item 16; Tau Ceti
`TauCeti.cellAttachment`, `TauCeti.UniversalCover.isQuotientCoveringMap`,
`HomotopyGroup.bijective_hurewicz`, `TauCeti.contractibleSpace_of_subsingleton_homotopyGroup`,
`TauCeti.cwComplexPreimage`,
`TauCeti.isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`.

**Checks.**

- For `G = ℤ³` the theorem gives `gd ≤ 3 = cd`, attained by the `3`-torus.
- For `G = ℤ²` it gives only `gd ≤ 3`, while `gd ℤ² = 2` (5.1): the bound `max(3, cd)` is not
  claimed to be attained in dimension `2`, and dimension `1` (the Stallings–Swan theorem) is a
  non-goal.
- For a nontrivial finite group `cd_ℤ = ⊤`, and the theorem says nothing beyond `gd = ⊤`.

### 5.4 Simplicial replacement in bounded dimension

Prove that if `X : Type u` is a Hausdorff space with a CW structure on `univ` having no cells of
dimension above `N ∈ ℕ`, then `X` is homotopy equivalent to the realization
`AbstractSimplicialComplex.Realization K` of an abstract simplicial complex `K` on a vertex type in
`Type u` with `AbstractSimplicialComplex.dimension K ≤ N`, that is, every face of `K` has at most
`N + 1` vertices (Hatcher2002, Theorem 2C.5, p. 182, which chooses the simplicial complex of the
same dimension as the CW complex). This is the replacement of AlgebraicTopology §8.11a with the
dimension bound, which §8.11a does not state. Route: the skeletal induction of §8.11a, keeping
track of dimensions. Suppose the `n`-skeleton `Xⁿ` is homotopy equivalent to `|K_n|` with
`dim K_n ≤ n`. The attaching map of each `(n + 1)`-cell, composed with this equivalence, is a map
from the compact sphere `∂Δⁿ⁺¹` into `|K_n|`; by simplicial approximation it is homotopic to the
realization of a simplicial map from an iterated barycentric subdivision of `∂Δⁿ⁺¹`, of dimension
`n`, to an iterated barycentric subdivision of `K_n`, of dimension at most `n` and with the same
realization (`AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph`). The mapping
cylinder of a simplicial map between complexes of dimension at most `n` is triangulated, after
subdivision, by a complex of dimension at most `n + 1`, and coning off its free end adds simplices
of dimension at most `n + 1`; attaching cells along homotopic maps gives homotopy equivalent
spaces. As `X` has no cells above dimension `N`, the induction stops at `n = N`. *Needs:*
AlgebraicTopology §8.11a (skeletal simplicial approximation and mapping cylinders); Tau Ceti
`AbstractSimplicialComplex.Realization`, `AbstractSimplicialComplex.dimension`,
`AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph`; Mathlib
`Topology.CWComplex`.

**Checks.**

- For `N = 0`, a Hausdorff CW complex with only `0`-cells is a discrete space, homeomorphic to the
  realization of the complex whose faces are its singletons, of dimension `0`.
- The circle with one `0`-cell and one `1`-cell is not itself the realization of a simplicial
  complex on its cells, since its edge would have a single vertex; it is replaced by `∂Δ²`, with
  three vertices and three edges, of dimension `1 = N`. No complex of dimension `0` will do: a
  discrete space has `H₁ = 0`, while `H₁(S¹, ℤ) = ℤ`.
- The bound is attained in every dimension: `Sⁿ` with one `0`-cell and one `n`-cell has
  `Hₙ(Sⁿ, ℤ) = ℤ`, while a complex `K` of dimension below `n` has no faces with `n + 1` vertices,
  so its ordered simplicial chains vanish in degree `n` and `Hₙ(|K|, ℤ) = 0`
  (`TauCeti.cellularChainComplexRealizationIso` for the CW structure
  `AbstractSimplicialComplex.realizationCWComplex`); the replacement `∂Δⁿ⁺¹` has dimension `n`.

### 5.5 Proper actions on finite-dimensional acyclic simplicial sets

Simplicial sets are Mathlib's `SSet`, with homology `SSet.homology` of the chain complex
`SSet.chainComplex`; a simplicial set is *finite-dimensional* when its nondegenerate simplices have
bounded dimension (`SSet.HasDimensionLE`), and *acyclic* when its integral homology is `ℤ` in degree
`0` (through the augmentation) and zero in positive degrees. Chain-level statements use the
normalized chains `SSet.normalizedChainComplex`, free on the nondegenerate simplices and zero above
the dimension, which compute `SSet.homology` through `SSet.homotopyEquivNormalizedChainComplex`; a
group acting by simplicial automorphisms permutes the nondegenerate simplices and so acts on them
by permutation modules, through `SSet.normalizedChainComplexMap`. Prove:

- (a) for `Γ : Type` with `cd_ℤ Γ < ⊤` there is an acyclic simplicial set `W` whose nondegenerate
  simplices have dimension at most `N = max(3, cd_ℤ Γ)`, with an action of `Γ` by simplicial
  automorphisms that is free on simplices;
- (b) (Serre's construction) for `G : Type` with a finite-index subgroup `Γ` such that
  `cd_ℤ Γ < ⊤` (equivalently `vcd G < ⊤`, 4.1), and `W` as in (a) for `Γ`, the simplicial set
  `Z = Map_Γ(G, W)` whose `k`-simplices are the maps `f : G → W_k` with `f(γx) = γ f(x)` for
  `γ ∈ Γ`, with faces and degeneracies taken pointwise and `G` acting by `(g · f)(x) = f(xg)`, is
  acyclic, its nondegenerate simplices have dimension at most `[G : Γ] · N`, and the stabilizer
  `G_f` of every simplex `f` meets `Γ` trivially, so has order at most `[G : Γ]`; in particular
  every torsion-free subgroup of `G` acts freely on the simplices of `Z`, and the normalized chains
  of `Z` are a resolution of `ℤ` over `ℤΓ'` of length at most `[G : Γ] · N` by free modules for
  every torsion-free `Γ' ≤ G`;
- (c) (`exists_acyclic_action_finite_stabilizers`) for `G : Type`, a subgroup `Γ` of finite index
  and `n : ℕ` with `cd_ℤ Γ ≤ n`, the group `G` acts by simplicial automorphisms (an `Action` of `G`
  on an `SSet`) on an acyclic simplicial set whose nondegenerate simplices have dimension at most
  `[G : Γ] · max(3, n)`, and the stabilizer of every simplex is finite, has at most `[G : Γ]`
  elements and meets `Γ` only in `1`.

(Brown1974 §6, Lemma, lines 637–651, which states (b) for semi-simplicial complexes together with
the acyclicity of the fixed points of finite subgroups; Serre1971Prospects n°1.7, as cited there.)
Route for (a): 5.3 gives a Hausdorff `K(Γ, 1)` CW complex `B₀` of dimension at most `N`; 5.4
replaces `B₀` up to homotopy equivalence by the realization `|K|` of an abstract simplicial complex
`K` of dimension at most `N`, so `|K|` is a `K(Γ, 1)`. Choose a linear order on the vertices of `K` and give `|K|` the CW structure
`AbstractSimplicialComplex.realizationCWComplex K`, with one `n`-cell for each face with `n + 1`
vertices. Let `K_≤` be the simplicial set whose `k`-simplices are the weakly increasing strings
`v₀ ≤ ⋯ ≤ v_k` of vertices spanning a face of `K`, with faces by deletion and degeneracies by
repetition. Its nondegenerate simplices are the faces of `K` with their increasing enumeration, so
it has dimension at most `N`, and its normalized chains are the ordered simplicial chains
`TauCeti.orderedSimplicialChainComplex K ℤ`, which `TauCeti.cellularChainComplexRealizationIso`
identifies with the cellular chains of `|K|`. The realized simplex of a string is the affine simplex
of `|K|` through its vertices. Let `W` be the simplicial set whose `k`-simplices are the pairs of a
`k`-simplex of `K_≤` and a lift of its realized simplex to the universal covering
`TauCeti.UniversalCover` of `|K|` (a quotient covering map for the action of `π₁(|K|) ≅ Γ` by
`TauCeti.UniversalCover.isQuotientCoveringMap`, `|K|` being a path-connected Hausdorff CW complex,
5.1), with faces and degeneracies acting on both entries; a lift exists and is determined by the
image of one point, because the simplex is simply connected
(`IsCoveringMap.existsUnique_continuousMap_lifts`). The deck
group `Γ` acts on the lifts, freely since a deck transformation fixing a lift fixes a point, and
transitively on the lifts of each simplex. A simplex of `W` is degenerate exactly when its string
is, so the normalized chains of `W` are in each degree free over `ℤΓ` on the faces of `K`. They are
the cellular chains of the universal cover with the lifted CW structure
(`TauCeti.cwComplexPreimage`): its cells are the lifts of the cells of `|K|`, the boundary of the
cell of a pair `(σ, ℓ)` meets the cells `(d_j σ, ℓ ∘ δ_j)` obtained by restricting the lift to the
faces, one for each face of `σ`, and the projection carries each of these onto the corresponding
cell of `|K|`, so the coefficients are those of `TauCeti.cellularChainComplexRealizationIso`. Hence
they are the free resolution of `ℤ` over `ℤΓ` of length at most `N` that
`TauCeti.cellularResolutionOfIsAspherical` gives for `B = |K|` with this CW structure
(`TauCeti.cellularChainRepIsoFree`; ClassifyingSpaces Stage 4 item 16), and `W` is acyclic, its
homology `SSet.homology` being that of the normalized chains
(`SSet.homotopyEquivNormalizedChainComplex`). Route for (b): a choice of representatives of `Γ\G`
identifies `Z` with the product of `[G : Γ]` copies of `W`; its chains are homotopy equivalent to
the tensor power of the chains of `W` (Tau Ceti `SSet.eilenbergZilberHomotopyEquiv`, iterated),
which is quasi-isomorphic to `ℤ` by the Künneth formula for complexes of free abelian groups; a
nondegenerate simplex of a product has dimension at most the sum of the dimensions of the factors
(`SSet.hasDimensionLE_prod`). If `γ ∈ Γ` fixes `f`, then `γ f(1) = f(γ) = (γ · f)(1) = f(1)`, so
`γ = 1` by freeness; hence `G_f ∩ Γ = 1`, and `G_f` injects into `Γ\G`. A torsion-free `Γ'` meets
every finite `G_f` trivially, so it permutes the nondegenerate simplices of `Z` freely and the
normalized chains of `Z`, zero above `[G : Γ] · N`, are free over `ℤΓ'`. For (c), take `Z` of (b)
with `N = max(3, cd_ℤ Γ) ≤ max(3, n)`; acyclicity says that `SSet.homologyMap` of the map to the
point is an isomorphism, the point having homology `ℤ` in degree `0` and `0` above. *Needs:* 5.1,
5.3, 5.4, 4.1; ClassifyingSpaces Stage 4 item 16; Tau Ceti `AbstractSimplicialComplex.realizationCWComplex`,
`TauCeti.orderedSimplicialChainComplex`, `TauCeti.cellularChainComplexRealizationIso`,
`TauCeti.UniversalCover`, `TauCeti.UniversalCover.isQuotientCoveringMap`,
`TauCeti.cwComplexPreimage`, `TauCeti.cellularResolutionOfIsAspherical`,
`TauCeti.cellularChainRepIsoFree`,
`SSet.eilenbergZilberHomotopyEquiv`; Mathlib `AbstractSimplicialComplex`, `SSet`,
`SSet.chainComplex`, `SSet.homology`, `SSet.homologyMap`, `SSet.normalizedChainComplex`,
`SSet.homotopyEquivNormalizedChainComplex`, `SSet.normalizedChainComplexMap`,
`SSet.hasDimensionLE_prod`, `CategoryTheory.Action`,
`IsCoveringMap.existsUnique_continuousMap_lifts`.

- `Z` is functorial in `W` for `Γ`-equivariant simplicial maps, and for `Γ = G` it is `W`.
- For `Γ'` torsion-free and normal of finite index in `G`, the quotient `Z/Γ'` is a
  finite-dimensional simplicial set with integral homology `H_*(Γ', ℤ)`, on which `G ⧸ Γ'` acts
  with the stabilizer of the image of `f` isomorphic to `G_f`.

**Checks.**

- For `G` finite and `Γ = 1`, take `W` a point (`cd_ℤ 1 = 0`): `Z` is a point and its stabilizer is
  all of `G`, of order `[G : 1]`, so the bound on stabilizers is attained.
- For `G = ℤ/2 × ℤ = ⟨s⟩ × ⟨t⟩` and `Γ = ⟨t⟩`, take `W` the line (vertices `ℤ`, edges `i → i + 1`).
  A simplex `f` is the pair `(f(1), f(s))` of simplices of `W`; `t` acts diagonally by translation
  and `s` swaps the two entries (`(s · f)(1) = f(s)`, `(s · f)(s) = f(s²) = f(1)`). So `Z` is the
  plane `W × W`, of dimension `2 = [G : Γ] · 1` although `vcd G = 1`, and the stabilizers are `⟨s⟩`
  on the diagonal and trivial elsewhere: finite, and trivial on the torsion-free subgroup `Γ`.
- The hypothesis `vcd G < ⊤` is used: a torsion-free group acting with finite stabilizers acts
  freely, so the normalized chains of a finite-dimensional acyclic `Z` would resolve `ℤ` by free
  modules in finite length; the free abelian group of countable rank has `cd_ℤ = ⊤` (it contains
  `ℤⁿ` for every `n`, 2.3, 2.4), so it has no such `Z`.
- For `K` a single vertex, `K_≤` is the point `Δ[0]`, with normalized chains `ℤ` in degree `0`.
  For `K` a single edge `{0 < 1}`, the nondegenerate simplices of `K_≤` are `(0)`, `(1)` and
  `(0, 1)`, so its normalized chains have the ranks `(2, 1)` of `K` itself and Euler characteristic
  `1`, matching the cellular chains of `|K|`; the string `(0, 0, 1)` is the degeneracy `s₀` of
  `(0, 1)`.
- For `K = ∂Δ²` (three vertices, three edges, no `2`-face) the ordered simplicial chains of `K_≤`
  have ranks `(3, 3)`, boundary `[a, b] ↦ [b] − [a]` on the three edges `a < b`, and
  `H₀ = H₁ = ℤ`, the homology of `|K| = S¹`. Weakly increasing strings are forced: with all strings
  of vertices spanning a face, the edge `{0, 1}` alone would have the nondegenerate simplices
  `(0, 1)`, `(1, 0)`, `(0, 1, 0)`, … in every dimension, so the simplicial set would not be
  finite-dimensional.

### Examples

Free groups, `ℤⁿ` and finitely presented groups give `gd` from explicit complexes; for groups of
`cd_ℤ ≥ 3`, the Eilenberg–Ganea theorem turns every algebraic computation of `cd_ℤ` into a geometric
one. A group of finite `vcd`, such as `ℤ/2 × ℤ` or `ℤ/4 ∗_{ℤ/2} ℤ/6`, acts with finite stabilizers
on a finite-dimensional acyclic simplicial set (5.5), the input of the denominator theorem 8.9.

### Dependencies

Layers 1–2 and 4.1; ClassifyingSpaces Stage 2 item 10 and Stage 4 item 16; AlgebraicTopology §§4.7,
8.1, 8.3, 8.5 and 8.11a; Tau Ceti's cell attachment,
Hurewicz and Whitehead theorems, cellular resolution of an aspherical CW complex, lifted CW
structures, universal covers as quotient coverings, semilocal simple connectivity of locally
contractible spaces, local path-connectedness of CW complexes, Eilenberg–Zilber theorem, product CW
structures, wedges of circles, the CW structure of the realization of an abstract simplicial
complex with its ordered cellular chains, its dimension and the realization homeomorphism of its
barycentric subdivision; Mathlib's simplicial sets with their homology, normalized
chains and group actions, local contractibility, and lifting along coverings.

---

## Layer 6: duality groups and Poincaré duality groups

### 6.1 Duality groups

Define `G` to be a *duality group of dimension `n ∈ ℕ` over `R`* with *dualizing module*
`D : Rep R G` and *fundamental class* `e ∈ Hₙ(G, D)` when, for every `M : Rep R G`, the duality map
`x ↦ x ∩ e : Hᵏ(G, M) → Hₙ₋ₖ(G, D ⊗_R M)` of the Conventions is bijective for every `k ≤ n`, and
`Hᵏ(G, M) = 0` for every `k > n` (BieriEckmann1973 Definition 1.1, lines 116–121, over `ℤ` with a
right dualizing module and the conventions of lines 122–135; Brown1975 lines 195–199, over `ℤ`; the
definition over `R` replaces `ℤ` by `R` and `ℤG` by `RG` throughout). The vanishing clause replaces
the source's convention `H_j = 0` for `j < 0`, which natural-number subtraction would misread.
*Needs:* CohomologyOfGroups §4.6; Mathlib `groupCohomology`, `groupHomology`, the monoidal structure
of `Rep R G`.

- The duality map is natural in `M` and compatible with the connecting maps of short exact sequences
  of coefficients after `D ⊗_R −` when `D` is flat over `R` (CohomologyOfGroups §4.6).
- Being a duality group of dimension `n` over `R` is invariant under isomorphisms of groups, of
  dualizing modules and of fundamental classes.
- With `R` nontrivial, the dimension and the dualizing module are determined by `G` (6.2).

**Checks.**

- `ℤ` is a duality group of dimension `1` over every `R`, with `D = R` and `e` the class of `[t]`;
  the duality map `H¹(ℤ, R) → H₀(ℤ, R)` is `x ↦ x(t)`.
- A finite group of order invertible in `R` is a duality group of dimension `0`, with `D = R` and
  `e = 1 ∈ H₀(G, R) = R`: the duality map `H⁰(G, M) = M^G → H₀(G, M) = M_G` is the composite
  `M^G ↪ M ↠ M_G`, whose inverse is `[m] ↦ |G|⁻¹ Σ_g g·m`, and `Hᵏ(G, M) = 0` for `k > 0` (2.7).
- Over the zero ring every group is a duality group of every dimension with `D = 0`, so the
  consequences in 6.2 assume `R` nontrivial.

### 6.2 Consequences of duality

Prove, for a duality group `G` of dimension `n` over a nontrivial `R` with dualizing module `D` and
fundamental class `e`:

- (a) `Hₙ(G, D) ≅ R`, generated by `e` (the duality isomorphism for `M = R`, `k = 0`);
- (b) `Hᵏ(G, RG) = 0` for `k ≠ n` and `D ≅ Hⁿ(G, RG)` as representations, with the action of the
  Conventions (BieriEckmann1973 Proposition 1.2, lines 139–164; BieriEckmann1974 Proposition 2.1,
  lines 148–154);
- (c) `cd_R G = hd_R G = n` (BieriEckmann1973 Proposition 1.2(iii));
- (d) `G` is of type `FP` over `R` (Brown1975 Corollary 1 of Theorem 3, lines 195–205:
  `Hᵏ(G, −) ≅ Hₙ₋ₖ(G, D ⊗_R −)` preserves directed colimits, so 1.5 gives `FP_∞` and (c) gives
  `FP`); in particular `G` is finitely generated (BieriEckmann1973 Theorem 4.6, lines 624–643, by
  another route);
- (e) `D` is flat as an `R`-module (BieriEckmann1973 Proposition 1.6, lines 210–220, torsion-free
  over `ℤ`): for type `FP` with `Hᵏ(G, RG) = 0` for `k ≠ n`, the dual of a finite projective
  resolution resolves `D`, and `D` is `R`-flat exactly when `Hᵏ(G, RG ⊗_R N) = 0` for all `k ≠ n`
  and all `R`-modules `N`; this holds because duality identifies `Hᵏ(G, RG ⊗_R N)` with
  `Hₙ₋ₖ(G, D ⊗_R RG ⊗_R N)`, the homology of an induced module (BieriEckmann1973 Lemma 1.3, lines
  178–191);
- (f) `D` admits a resolution of length `n` by finitely generated projective `RG`-modules (Brown1975
  Corollary 2 of Theorem 3, lines 208–215).

Finite generation in (d) is type `FP_1` through 1.4(b), `R` being nontrivial; the vanishing of the
homology of `RG ⊗_R M` in positive degrees used in (e) is CohomologyOfGroups §1.4 for the free
`G`-set `G`. *Needs:* 6.1, 1.4, 1.5, 2.2, 2.1; CohomologyOfGroups §§1.4, 4.6.

**Checks.**

- For `ℤ` over `R`: `H¹(ℤ, Rℤ) = Rℤ/(t − 1) ≅ R` with trivial action, so `D = R`, and
  `H⁰(ℤ, Rℤ) = 0`.
- For the free group `F` of rank `r ≥ 2` on `s_1, …, s_r`, `D = H¹(F, RF)` is the cokernel of
  `RF → (RF)^r`, `a ↦ ((s_i − 1)a)_i`: this is `Hom_{RF}(−, RF)` applied to the boundary
  `(a_i)_i ↦ Σ_i a_i(s_i − 1)` of the resolution of 1.8(c), and it is right `RF`-linear, so the
  quotient carries the right multiplication of the Conventions. Over a field `D` has infinite
  dimension, so `F` is a duality group of dimension `1` that is not a Poincaré duality group.
- The order of the factors in that cokernel is forced: for `R ≠ 0` and `F = ⟨s, t⟩`, the vector
  `(s − 1, t − 1)` is the image of `1` under both `a ↦ ((s − 1)a, (t − 1)a)` and
  `a ↦ (a(s − 1), a(t − 1))`. Its right translate `((s − 1)t, (t − 1)t)` is the image of `t` under
  the first map, but not an image under the second: the second coordinate forces `a = t` (no nonzero
  element of `RF` is fixed by right multiplication by `t`, which has infinite order), and then the
  first would need `t(s − 1) = (s − 1)t`, false as `ts ≠ st`. So the second quotient carries no
  right action. For `F = ℤ` both maps give `R[t, t⁻¹]/(t − 1) ≅ R`.
- For a finite group of order invertible in `R`, `H⁰(G, RG) = R·Σ_g g ≅ R` with trivial action.

### 6.3 The duality criterion

Prove: (a) `G` is a duality group of dimension `n` over `R` if and only if `G` is of type `FP` over
`R`, `Hᵏ(G, RG) = 0` for `k ≠ n`, and `Hⁿ(G, RG)` is flat as an `R`-module (BieriEckmann1973 Theorem
4.5, lines 612–621, over `ℤ`, where flat means torsion-free; over `R` the route below, with
`R`-flatness in place of torsion-freeness, is the proof; 6.2 for the converse); (b) without
finiteness: `G` is a duality group of dimension `n` over `R` if and only if `cd_R G < ⊤`,
`Hᵏ(G, F) = 0` for `k ≠ n` and every free `RG`-module `F`, `C = Hⁿ(G, RG)` is `R`-flat, and some
`e ∈ Hₙ(G, C)` makes `x ↦ x ∩ e : Hⁿ(G, F) → C ⊗_{RG} F` bijective for every free `F`
(BieriEckmann1973 Theorem 2.3, lines 317–323, with Propositions 2.1–2.2, lines 280–298). Route: (b)
by dimension shifting along free presentations `0 → K → F → A → 0`, where `R`-flatness of `C` keeps
`C ⊗ K → C ⊗ F → C ⊗ A` exact and `Hⱼ(G, C ⊗ F) = 0` for `j > 0` because `C ⊗_R F` is induced
(BieriEckmann1973 Lemma 1.3, lines 178–191; for `F = R[X]` with `X` a free `G`-set this is
CohomologyOfGroups §1.4); (a) from (b) and 2.2(c), cohomology of a group of type `FP` commuting with
direct sums. *Needs:* 6.1, 6.2, 2.2, 1.2; CohomologyOfGroups §§1.4, 4.6.

**Checks.**

- `ℤⁿ` satisfies (a) over every `R`: type `FL`, `Hᵏ(ℤⁿ, Rℤⁿ) = 0` for `k ≠ n` and `Hⁿ ≅ R` (2.2).
- The vanishing of `Hᵏ(G, RG)` for `k ≠ n` is used: `ℤ ∗ ℤ²` is of type `FP` (1.8, 2.6) with
  `cd = 2`, but the
  free-product sequence of CohomologyOfGroups §3.6 with coefficients `ℤG` embeds
  `H⁰(1, ℤG) = ℤG` into `H¹(ℤ ∗ ℤ², ℤG)`, since `H⁰(ℤ, ℤG) = H⁰(ℤ², ℤG) = 0`; so it is not a duality
  group.
- A finite nontrivial group over `ℤ` fails type `FP`, and indeed is not a duality group.

### 6.4 Poincaré duality groups

Define a *Poincaré duality group of dimension `n` over `R`* as a duality group of dimension `n` over
`R` whose dualizing module is free of rank one as an `R`-module, and its *orientation character*
`w : G →* Rˣ` as the scalar by which `g` acts on `D ≅ R` (independent of the chosen isomorphism, `R`
being commutative); `G` is *orientable* when `w = 1`. The duality then reads
`Hᵏ(G, M) ≅ Hₙ₋ₖ(G, R_w ⊗_R M)` (BieriEckmann1974, §3.1, lines 253–257, over `ℤ`, with the passage
between right and left modules through `sgn` of lines 261–266). Prove, over `ℤ`: (a) `w` takes
values in `{±1}`; (b) if `sgn : G →* {±1}` and isomorphisms `Hᵏ(G, A) ≅ Hₙ₋ₖ(G, ℤ_sgn ⊗ A)` for
`k ≤ n`, not assumed natural or given by a cap product, exist for every `A`, together with
`Hᵏ(G, A) = 0` for `k > n` and `Hⱼ(G, A) = 0` for `j > n`, then `G` is a Poincaré duality group of
dimension `n` with orientation character `sgn` (BieriEckmann1974 Theorem 3.4, lines 327–334). Route
for (b): `G` is finitely generated by the argument of BieriEckmann1973 Theorem 4.6 (lines 625–643).
`G` is the union of the directed family of its finitely generated subgroups and
`Hₙ(G, ℤ_sgn) ≅ H⁰(G, ℤ) = ℤ` is nonzero, so `Hₙ(S, ℤ_sgn) ≠ 0` for some finitely generated `S`
(`TauCeti.groupHomology.isZero_groupHomology_of_directed`); and
`Hₙ(S, ℤ_sgn) ≅ Hₙ(G, ℤ_sgn ⊗ ℤ[G/S]) ≅ H⁰(G, ℤ[G/S])` (CohomologyOfGroups §1.4, then the given
isomorphism with `k = 0`), which is `0` unless `[G : S]` is finite, a permutation module on an
infinite transitive `G`-set having no nonzero invariants. Then `Hₖ(G, ∏ ℤG) ≅ ∏ Hₖ(G, ℤG) = 0` for
`k ≥ 1` through the given isomorphisms and the commutation of cohomology with products
(BieriEckmann1974 lines 314–323); with `G` of type `FP_1` (1.4(b)) this is condition 1.5(e) in every
degree, so `G` is of type `FP_∞` (1.5) and, with `cd_ℤ G ≤ n` (2.1), of type `FP`; `Hᵏ(G, ℤG) = 0`
for `k ≠ n` and `Hⁿ(G, ℤG) ≅ ℤ`, so 6.3 applies; finally the orientation character is `sgn`, because
otherwise the true duality for `M = ℤ_{sgn·w}` gives `0 = H⁰(G, ℤ_{sgn·w}) ≅ Hₙ(G, ℤ_sgn) ≅ ℤ`.
*Needs:* 6.1–6.3, 1.4, 1.5, 2.1; CohomologyOfGroups §1.4; Tau Ceti
`TauCeti.groupHomology.isZero_groupHomology_of_directed`.

**Checks.**

- `ℤⁿ` is an orientable Poincaré duality group of dimension `n` over every `R` (6.3, 6.5).
- The Klein bottle group `K = ⟨a, t | t a t⁻¹ = a⁻¹⟩` is a Poincaré duality group of dimension `2`
  over `ℤ` with `w(a) = 1`, `w(t) = −1` (6.5): `H²(K, ℤ) ≅ H₀(K, ℤ_w) = ℤ/2`, while the orientable
  model would give `H₀(K, ℤ) = ℤ`. Over `𝔽₂` it is orientable.
- Over `R ≠ 0`, a finite group is a Poincaré duality group of dimension `0` exactly when `|G|` is a
  unit of `R`, and the free group of rank `r ≥ 1` is one (of dimension `1`) exactly when `r = 1`.
  Over the zero ring every group is one of every dimension, its dualizing module `0` being free of
  rank one over `0` (6.1).

### 6.5 Subgroups of finite index and extensions

Prove: (a) a finite-index subgroup `S` of a duality group `G` of dimension `n` over `R` is a duality
group of dimension `n` over `R` with the restricted dualizing module, and restriction
`Hₙ(G, D) → Hₙ(S, D)` (the transfer) is an isomorphism sending the fundamental class of `G` to that
of `S` (BieriEckmann1973 Theorem 3.2, lines 366–386, from Shapiro's lemma and the projection formula
`tr(y ∩ z) = res y ∩ tr z`); (b) over `ℤ`, a torsion-free group with a finite-index subgroup that is
a duality group of dimension `n` is one (BieriEckmann1973 Theorem 3.3, lines 388–465, with Serre's
theorem 3.2); (c) for `N ◁ G` with `N` and `G ⧸ N` duality groups over `R` of dimensions `n` and
`m`, `G` is a duality group of dimension `n + m` over `R` and `D_G ≅ D_{G⧸N} ⊗_R D_N` as
representations of `G`, acting diagonally on the tensor product, through `G ⧸ N` on `D_{G⧸N}`, and
on `D_N = Hⁿ(N, RN)` by conjugation on `N` together with conjugation `r ↦ g r g⁻¹` on the
coefficients `RN`: on a cochain `f` of a projective resolution `P` of `R` over `RG`,
`(g·f)(p) = g f(g⁻¹p) g⁻¹`. For `g ∈ N` this is `(g·f)(p) = f(p) g⁻¹`, right multiplication by `g⁻¹`
on the coefficients, the action of the Conventions (BieriEckmann1973 §1.5, lines 238–253, and the
remark after Theorem 3.5, lines 474–477; Theorem 3.5 and Proposition 1.8, lines 255–272 and 468–516,
over `ℤ`; over `R` the route below is the proof). Route for (c): CohomologyOfGroups §6.2 collapses
for coefficients `A` with `H^q(N, A) = 0` for `q ≠ n`, the duality isomorphism of `N` is
`G ⧸ N`-equivariant (BieriEckmann1973 Proposition 1.8; over `R` the scalar by which `g` moves `e_N`
is killed on `D_N`, hence on `Hₙ(N, D_N) ≅ R`, so it is `1`), and 6.3(b) applies. *Needs:* 6.1–6.3,
3.2; CohomologyOfGroups §1.2, §4.6, §6.2; Mathlib `groupCohomology.coindIso`,
`groupHomology.indIso`.

**Checks.**

- `ℤⁿ⁺¹` is the extension of `ℤ` by `ℤⁿ`, and (c) gives `D = R ⊗ R = R`, recovering 6.4.
- For the Klein bottle group, (c) with `N = ⟨a⟩` and `G ⧸ N = ⟨t⟩` gives `D = R ⊗ H¹(⟨a⟩, R⟨a⟩)`, on
  which `t` acts through conjugation `a ↦ a⁻¹`, by `−1`: on the crossed homomorphism `d` with
  `d(a) = 1`, whose class generates `H¹(⟨a⟩, R⟨a⟩) = R⟨a⟩/(a − 1) ≅ R`,
  `(t·d)(a) = t d(a⁻¹) t⁻¹ = −t a⁻¹ t⁻¹ = −a`, of augmentation `−1`, while `a` acts by right
  multiplication by `a⁻¹`, trivially on the quotient. So `w(a) = 1` and `w(t) = −1`, as in 6.4; a
  model with `t` acting trivially on `D_N` would give `w = 1`, hence `H²(K, ℤ) ≅ H₀(K, ℤ) = ℤ`,
  against the true `ℤ/2`.
- (b) needs torsion-freeness: `ℤ/2 × ℤ` contains the duality group `ℤ` with index `2` and is not a
  duality group over `ℤ` (`cd_ℤ = ⊤`).

### 6.6 Closed aspherical manifolds

Prove that if `M : Type` is a compact connected Hausdorff (`T2Space M`) smooth manifold without
boundary of dimension `n`, modelled on `EuclideanSpace ℝ (Fin n)`, and is aspherical, then
`G = π₁(M, x)` is a Poincaré duality group of dimension `n` over every `R : Type`, with orientation
character the image in `Rˣ` of the orientation character of `M` (Serre1971Bourbaki 1.4, lines 63–67;
BieriEckmann1974, §3.2, lines 271–281). Mathlib's `ChartedSpace` and `IsManifold` include no
separation axiom, so Hausdorffness is a hypothesis; second countability is not, since a compact
charted space over `EuclideanSpace ℝ (Fin n)` is covered by finitely many chart domains and is
second countable (`ChartedSpace.secondCountable_of_sigmaCompact`). Route: `M` has finite CW type
(AlgebraicTopology §8.7, for compact Hausdorff second-countable smooth manifolds), so `G` is of type
`FL` (5.2); `M` is a `K(G, 1)` of CW type, so its cohomology with local coefficients is group
cohomology (it is homotopy equivalent to the classifying space of `G` by ClassifyingSpaces Stage 3
item 12, local-coefficient cohomology is homotopy invariant by AlgebraicTopology §6.1, and Stage 4
item 17 identifies that of the classifying space); twisted Poincaré duality with coefficients in the
local system `RG` (AlgebraicTopology §6.4) gives `Hᵏ(G, RG) ≅ Hₙ₋ₖ(G, RG ⊗ R_w)`, which is `0` for
`k ≠ n` and `R_w` for `k = n`, and 6.3(a) applies. *Needs:* 6.3, 6.4, 5.2; AlgebraicTopology §6.1,
§6.3, §6.4, §8.7; ClassifyingSpaces Stage 3 item 12 and Stage 4 item 17; Mathlib
`ChartedSpace.secondCountable_of_sigmaCompact`.

**Checks.**

- For the torus `(S¹)ⁿ`, aspherical with fundamental group `ℤⁿ`, the conclusion is 6.4's orientable
  case.
- The Klein bottle is a closed non-orientable aspherical surface, and the conclusion is the
  non-orientable character of 6.4.
- Asphericity is used: `S²` is a closed manifold with trivial fundamental group, which over every
  nonzero `R` is a Poincaré duality group of dimension `0`, not `2`: in dimension `2` the duality
  map `H⁰(1, R) = R → H₂(1, R) = 0` is not bijective. Over the zero ring it is one of every
  dimension (6.4).
- Hausdorffness is used: the circle with one point doubled (two copies of the circle glued along the
  complement of a point) is compact, connected and a smooth `1`-manifold in Mathlib's sense, and is
  the union of two open circles meeting in an open interval, so it is weakly equivalent to
  `S¹ ∨ S¹`: aspherical with fundamental group `F₂`. But over `ℤ` (indeed over every nonzero `R`,
  6.4) `F₂` is not a Poincaré duality group of dimension `1`: `H¹(F₂, ℤ) = ℤ²`, while `H₀(F₂, ℤ_w)`
  is `ℤ` or `ℤ/2` for every `w`. Over the zero ring it is one (6.4).

### Examples

Free groups of finite positive rank are duality groups of dimension `1` over every nonzero `R`, and
the free group of rank `0` is the trivial group, a duality group of dimension `0`; `ℤⁿ`, the Klein
bottle group and the fundamental groups of closed aspherical manifolds are Poincaré duality groups;
products and extensions of duality groups are duality groups. The Borel–Serre duality of
torsion-free arithmetic groups, with the Steinberg module as dualizing module, is an instance owned
by ArithmeticKTheory §3.2.

### Dependencies

Layers 1–3 and 5; CohomologyOfGroups §§1.2, 1.4, 4.6 and 6.2; AlgebraicTopology §§6.1, 6.3–6.4
and 8.7; ClassifyingSpaces Stage 3 item 12 and Stage 4 item 17; Tau Ceti's vanishing of the homology of a directed union of
subgroups with vanishing homology.

---

## Layer 7: ranks of projective modules over group rings and Swan's theorem

### 7.1 The Hattori–Stallings rank over a group ring

Define, for a finitely generated projective left `RG`-module `P`, its *Hattori–Stallings rank*
`r_P`, the finitely supported function on the conjugacy classes of `G` with values in `R` obtained
from the Hattori–Stallings trace of EtaleCohomologyFoundations §F.10.3 (applied to `(RG)ᵐᵒᵖ`)
through the `R`-linear isomorphism `RG/[RG, RG] ≅ R^{(G/conj)}`, `Σ a_g g ↦ Σ a_g [g]` (BrownGTM87,
§IX.2). Prove that `[RG, RG]` is the `R`-span of the `g − hgh⁻¹`, so that this map is an
isomorphism, and that `r_P` is: additive in `P` and invariant under isomorphism; equal to `δ_{[1]}`
for `P = RG`; compatible with base change along `R → R'`; compatible with induction from `H ≤ G`,
`r_{RG ⊗_{RH} P}([g]_G) = Σ r_P([h]_H)` over the `H`-classes contained in `[g]_G`; and, for `H` of
finite index, `r_{Res P}([1]) = [G : H] · r_P([1])` (conjugation by coset representatives preserves
the coefficient of `1`); and that `Σ_{[g]} r_P([g])` is the Hattori–Stallings trace of the
projective `R`-module `R ⊗_{RG} P`, its rank when `R` is a field or `ℤ`. *Needs:*
EtaleCohomologyFoundations §F.10.3; Mathlib `MonoidAlgebra`, `ConjClasses`.

- `r_{P ⊕ Q} = r_P + r_Q` and `r_P = r_Q` for `P ≅ Q`.
- `r_{RGⁿ} = n · δ_{[1]}`.
- `r_{R' ⊗_R P}` is the image of `r_P` under `R → R'`.
- For `G` trivial, `r_P([1])` is the trace of the identity of the finite projective `R`-module `P`
  in the sense of `LinearMap.projectiveTrace` (its rank function when `R` is connected).

**Checks.**

- `r_{RG} = δ_{[1]}`, and for `G = ℤ/2` and `H = 1`, induction of `R` gives `RG` with rank
  `δ_{[1]}`, as the induction formula requires.
- For `G` finite with `|G|` a unit and `P = R·e`, `e = |G|⁻¹ Σ_g g` (the trivial module), the rank
  is `r_P([g]) = |[g]|/|G| = 1/|C_G(g)|`; a model that recorded only the rank of `P` over `R` would
  give `δ_{[1]}`, which differs from it when `R ≠ 0` and `G ≠ 1`, since then `1/|C_G(g)|` is a unit,
  not `0`, at every `g ≠ 1`. For `G = 1`, or over the zero ring, the two coincide.
- For `H = 1 ≤ G` finite and `P = RG`, `Res P = R^{|G|}` and `r_{Res P}([1]) = |G| = [G : 1] · 1`.

### 7.2 Characters of projective modules over finite groups

Let `R` be an arbitrary commutative ring, `G` a finite group, `P` a finitely generated projective
`RG`-module (hence finitely generated projective over `R`, which need not be free), `g ∈ G` and
`C = C_G(g)` its centralizer. Left multiplication by `g` is an `RC`-linear endomorphism of `P`, and
`P` is finitely generated projective over `RC`; write `Tr^C(g, P) = ε(Tr_HS(g · −))` for its
identity-coefficient trace over `RC` in the sense of EtaleCohomologyFoundations §F.10.3 (`ε` the
coefficient of `1`). Prove that `Tr^C(g, P) = r_P([g⁻¹])`, the coefficient at the class of `g⁻¹` of
the Hattori–Stallings rank of 7.1 over the whole of `G` (BrownGTM87, §IX.2). This comparison is what
7.2 adds to the supplier, which states the centralizer formula but not the conjugacy-class
coordinates of the rank. Deduce that the trace of `g` on `P` as a finite projective `R`-module,
`χ_P(g) = LinearMap.projectiveTrace R P (g · −)`, is `|C_G(g)| · r_P([g⁻¹])`: apply §F.10.3's
formula `Tr_R(γ, P) = |Z_γ| · Tr^{Z_γ}_R(γ, P)` to the extension `G × ℤ` of `ℤ` by `G`, with `ℤ`
acting trivially on `P` and `γ = (g, 1)`, so that `Z_γ = C`, together with §F.10.3's agreement of
the commutative Hattori–Stallings trace with `LinearMap.projectiveTrace`. The trace is Tau Ceti's
`LinearMap.projectiveTrace`, not Mathlib's `LinearMap.trace`, which is `0` on a module without a
finite basis. Route for the comparison: both sides are invariant under isomorphism, so take
`P = RGᵐ·e` with `e` an idempotent matrix acting on the right; complement independence of the trace
over `RC` (§F.10.3) identifies `Tr^C(g, P)` with `ε` of the trace over `RC` of `v ↦ g v e` on `RGᵐ`.
Choose representatives `x` of the right cosets `Cx` of `C` in `G`, so that the `u_i x`, with
`u_1, …, u_m` the standard basis of `RGᵐ`, form an `RC`-basis of `RGᵐ`; the identity coefficient of
the diagonal entry at `u_i x` is the coefficient of `x` in `g x e_{ii}`, namely the coefficient of
`x⁻¹ g⁻¹ x` in `e_{ii}`. Since `Cx ↦ x⁻¹ g⁻¹ x` is a bijection from the right cosets onto the
conjugacy class of `g⁻¹`, whose centralizer is `C`, the sum over `i` and `x` is the coefficient of
`[g⁻¹]` in `Σ_i e_{ii}`, which is `r_P([g⁻¹])`. No division by `|C|` occurs, so the comparison holds
where `|C|` is a zero divisor and carries more than the character identity. *Needs:* 7.1;
EtaleCohomologyFoundations §F.10.3; Tau Ceti `LinearMap.projectiveTrace`; Mathlib
`Representation.ofModule'`.

**Checks.**

- For `P = RG`, the coset basis gives the diagonal entries `g`, `[G : C]` of them, so
  `Tr^C(g, RG) = [G : C] · [g = 1] = [g = 1]` (`g = 1` forces `C = G`), equal to
  `r_{RG}([g⁻¹]) = [g = 1]`; the consequence is `χ_{RG}(g) = |G| · [g = 1] = |C_G(g)| · [g = 1]`.
- For `|G|` a unit and the trivial module `P = R·e` of 7.1, `P ≅ RC·e_C` over `RC` with
  `e_C = |C|⁻¹ Σ_{c ∈ C} c`, and `g` acts on it as the identity, so `Tr^C(g, P) = ε(e_C) = 1/|C|`;
  and `r_P([g⁻¹]) = |[g⁻¹]|/|G| = 1/|C_G(g⁻¹)| = 1/|C|`. The consequence is
  `χ_P(g) = 1 = |C| · 1/|C|`.
- For `G` trivial both sides are the Hattori–Stallings trace of the identity of `P`, and the factor
  `|C|` is `1`. For `R = ℚ × ℚ` and `P = R·(1, 0)`, a finitely generated projective `R`-module
  without a basis (its ranks at the two factors are `1` and `0`), both sides are `(1, 0)`, and so is
  the projective trace of the identity. Mathlib's `LinearMap.trace` of the identity is `0` there, so
  a statement with it would be false.
- The inverse in `r_P([g⁻¹])` is forced: for `G = ℤ/3 = ⟨g⟩` over `ℂ`, a character `ζ` with
  `ζ(g) = ω` a primitive cube root of unity, and `P = ℂG·e` with `e = (1/3) Σ_h ζ(h)⁻¹ h`, one has
  `g e = ω e`, so `g` acts on `P` as `ω` and `Tr^G(g, P) = ω · ε(e) = ω/3`; the coefficient of `g⁻¹`
  in `e` is `ζ(g⁻¹)⁻¹/3 = ω/3`, while that of `g` is `ω⁻¹/3`. The consequence is
  `χ_P(g) = 3 · ω/3 = ω`.
- The comparison is not the character identity divided by `|C|`: for `R = 𝔽_p`, `G = ℤ/p`,
  `P = 𝔽_p G` and `g = 1`, `χ_P(1) = p = 0` in `𝔽_p`, while `Tr^G(1, P) = r_P([1]) = 1`.

### 7.3 Swan's theorem, rational form

Prove that for `G` finite and `P` a finitely generated projective `ℤG`-module: (a) `r_P([g]) = 0`
for `g ≠ 1`; (b) `ℚ ⊗ P ≅ (ℚG)^m` as `ℚG`-modules, with
`m = r_P([1]) = rank_ℤ(P)/|G| = rank_ℤ(ℤ ⊗_{ℤG} P)` (Brown1974, §1, lines 168–172, citing Swan). A
`ℤG`-linear isomorphism `P ⊗_ℤ ℚ ≅ (ℤG)^m ⊗_ℤ ℚ` is the same as a `ℚG`-linear one, an additive map
of `ℚ`-vector spaces being `ℚ`-linear; in that form, with `m · |G| = rank_ℤ P`, (b) is
`exists_linearEquiv_tensorRat`. Route: for `g ≠ 1` choose a prime `p ∣ orderOf g`; `ℤ_p ⊗ P` is
finitely generated projective over `ℤ_p[G]`, and `TauCeti.trace_ofModule'_eq_zero_of_dvd_orderOf`
(with `A = ℤ_p`, local, `p` not a unit) gives `χ_P(g) = 0`; so the character of `ℚ ⊗ P` is
`rank_ℤ(P) · [g = 1]`, the dimension of its invariants `rank_ℤ(P)/|G|` is a natural number `m`, the
characters of `ℚ ⊗ P` and `(ℚG)^m` agree, and `FDRep.nonempty_iso_of_character_eq` gives (b); (a)
follows from 7.2. *Needs:* 7.1, 7.2; Tau Ceti `TauCeti.trace_ofModule'_eq_zero_of_dvd_orderOf`,
`FDRep.nonempty_iso_of_character_eq`; Mathlib `PadicInt`.

**Checks.**

- For `P = (ℤG)²`, `m = 2 = rank_ℤ(P)/|G|`.
- Projectivity is used: the trivial module `ℤ` over `ℤ/2` has character `1` at the generator, and
  `ℚ` is not a free `ℚ[ℤ/2]`-module.
- For `G` trivial, `m = rank_ℤ P` and the statement is that `ℚ ⊗ P ≅ ℚ^m`.

### 7.4 Swan's theorem modulo `p`

Prove that for `G` finite, `P` a finitely generated projective `ℤG`-module, `p` prime and `m` as in
7.3, `ℤ_(p) ⊗ P ≅ (ℤ_(p) G)^m`, `ℤ_p ⊗ P ≅ (ℤ_p G)^m` and `𝔽_p ⊗ P ≅ (𝔽_p G)^m`, where `ℤ_(p)` is
the localization of `ℤ` at the prime ideal `(p)` (`Localization.AtPrime`) and `ℤ_p` the ring of
`p`-adic integers. The source states the first form, for the localization of `ℤ` at every prime
ideal (Brown1974 Appendix A, lines 1311–1320, the refinement used in the proof of Theorem 7; at the
zero ideal it is 7.3(b)); the other two follow from it by base change along `ℤ_(p) → ℤ_p` and
`ℤ_(p) → 𝔽_p`. A `ℤG`-linear isomorphism `P ⊗_ℤ 𝔽_p ≅ (ℤG)^m ⊗_ℤ 𝔽_p` is the same as an
`𝔽_p G`-linear one, both sides being modules over the quotient `𝔽_p G` of `ℤG`; in that form, with
`m · |G| = rank_ℤ P`, the `𝔽_p` form is `exists_linearEquiv_tensorZMod`. Route:
`ℚ_p ⊗_{ℤ_p} (ℤ_p ⊗ P) ≅ ℚ_p ⊗_ℚ (ℚ ⊗ P) ≅ (ℚ_p G)^m` by 7.3, so
`TauCeti.nonempty_linearEquiv_of_projective_of_tensorRat` gives the `ℤ_p` form, and reduction
modulo `p` the `𝔽_p` form. For the `ℤ_(p)` form, lift an isomorphism `(𝔽_p G)^m ≅ 𝔽_p ⊗ P` to a map
`(ℤ_(p) G)^m → ℤ_(p) ⊗ P`; its cokernel, and its kernel (a direct summand, `ℤ_(p) ⊗ P` being
projective), are finitely generated over the local ring `ℤ_(p)` because `G` is finite, and both
vanish modulo `p`, so both are zero by Nakayama's lemma over `ℤ_(p)`. *Needs:* 7.3; Tau Ceti
`TauCeti.nonempty_linearEquiv_of_projective_of_tensorRat`; Mathlib `PadicInt`,
`Localization.AtPrime`, `Submodule.eq_bot_of_le_smul_of_le_jacobson`.

**Checks.**

- For `P = ℤG` the three statements are the identity with `m = 1`; for `G` trivial and `P = ℤ^m`
  they read `ℤ_(p)^m`, `ℤ_p^m` and `𝔽_p^m`.
- Projectivity is used: the trivial module `ℤ` over `G = ℤ/p` reduces to `𝔽_p`, of dimension `1`,
  which is not free over `𝔽_p G` (dimension `p`), and `ℤ_(p)` and `ℤ_p`, of rank `1 < p`, are not
  free over `ℤ_(p) G` and `ℤ_p G`.
- For `p ∤ |G|`, the `ℤ_p` form is also
  `TauCeti.nonempty_linearEquiv_of_projective_of_tensorRat_of_not_dvd`.

### 7.5 Homomorphisms from a projective module into a finite-dimensional representation

Prove that for a finitely generated group `Γ`, a finitely generated projective `ℤΓ`-module `P`, a
field `K`, a `KΓ`-module `V` of finite dimension and `Γ' ◁ Γ` of finite index, the `K[Γ/Γ']`-module
`Hom_{ℤΓ'}(P, V)` (with `(γ·f)(x) = γ f(γ⁻¹ x)`) is free of rank `r(P) · dim_K V`, where
`r(P) = rank_ℤ(ℤ ⊗_{ℤΓ} P)`; in particular `dim_K Hom_{ℤΓ}(P, V) = r(P) · dim_K V` (Brown1974
Appendix A, Theorem 7, lines 1284–1355). Route, following the three cases there: for `Γ` finite,
`K ⊗ P` is free over `KΓ` by 7.3 (characteristic zero) or 7.4 (characteristic `p`); for `K` finite,
the action on `V` factors through a finite quotient and the finite case applies; in general, the
finitely many matrices of generators lie in a finitely generated subring of `K`, whose residue
fields at maximal ideals are finite (Brown1974 Appendix A, Lemma 2, lines 1303–1310): such a residue
field `k` is a field of finite type over `ℤ`, hence a finite `ℤ`-module
(`finite_of_finite_type_of_isJacobsonRing`), `ℤ` being a Jacobson ring by
`TauCeti.isJacobsonRing_of_quotient_span_singleton` (its Jacobson radical is `0`, and each `ℤ/n`,
`n ≠ 0`, is finite, so Artinian, so Jacobson); `k` is not of characteristic zero, since a subgroup
`ℚ` of a finitely generated abelian group would be finitely generated, so `k` is a
finite-dimensional vector space over some `𝔽_p`. So `V` has a `Γ`-stable lattice `L` over a local
ring `A ⊂ K`, the localization at a maximal ideal, with finite residue field `k`;
`Hom_{ℤΓ'}(P, L)` is finitely generated projective over `A[Γ/Γ']` (it is induced from `L` when
`P = ℤΓ`, Brown1974 Appendix A, Lemma 1, lines 1295–1302), its reduction is free of the stated rank
by the finite case, and a finitely generated projective module over `A[Δ]`, `Δ` finite, whose
reduction is free is free (lift the isomorphism, Nakayama). *Needs:* 7.3, 7.4; Mathlib
`IsLocalRing`, Nakayama's lemma, `Module.Projective`, `finite_of_finite_type_of_isJacobsonRing`;
Tau Ceti `TauCeti.isJacobsonRing_of_quotient_span_singleton`.

**Checks.**

- For `Γ` finite, `Γ' = 1`, `P = ℤΓ` and `V = K`, `Hom_ℤ(ℤΓ, K) = K^Γ ≅ KΓ`, free of rank `1`.
- For `Γ = ℤ = ⟨t⟩`, `Γ' = Γ`, `P = ℤΓ` and `V = K` with `t` acting by `λ`, the dimension is
  `1 = r(ℤΓ) · 1` for every `λ`.
- Projectivity is used: for the trivial module `P = ℤ` over `Γ = ℤ` and `λ ≠ 1`,
  `Hom_{ℤΓ}(ℤ, V) = V^Γ = 0`, while `r(ℤ) · dim V = 1`.

### Examples

For `G = ℤ/p`, the rank of a projective `ℤG`-module is concentrated at the identity, its
rationalization is free, and the dimension of its homomorphisms into any finite-dimensional
representation is computed by its rank alone.

### Dependencies

EtaleCohomologyFoundations §F.10.3 (the Hattori–Stallings trace and the centralizer formula); Tau
Ceti's projective trace, character vanishing, Swan's theorem for `ℤ_p[G]`, the determination of
representations by characters, and the Jacobson criterion through principal quotients; Mathlib's
Zariski lemma over a Jacobson ring.

---

## Layer 8: Euler characteristics

### 8.1 Wall's finiteness lemma

Prove that for a left noetherian ring `A` and a chain complex `C` of projective `A`-modules indexed
by `ℕ` with finitely generated homology in each degree, there is a complex `D` of finitely generated
free modules with a quasi-isomorphism `D → C`, which is a homotopy equivalence; and that if moreover
`Hⁱ(Hom_A(C, M)) = 0` for `i > n` and every finitely generated `M`, then `D` can be chosen with
`D_i = 0` for `i > n` and `D_n` finitely generated projective (Brown1974, §1, Lemma, lines 135–164,
implicit in Wall). Route: build the truncations of `D` and compatible maps inductively, killing the
homology of the mapping cone one degree at a time with finitely many generators (noetherianity keeps
the cycles finitely generated); a quasi-isomorphism of bounded-below complexes of projectives is a
homotopy equivalence; for the second part, the vanishing for `M = D_i/B_i` splits `B_{i−1}` off
`D_{i−1}` above `n`. *Needs:* Mathlib `HomologicalComplex`, `QuasiIso`, `IsNoetherianRing`,
`Module.Projective`.

**Checks.**

- For `C = (F →id F)` with `F = ℤ^{(ℕ)}` in degrees `1, 0`, the homology is zero and `D = 0`.
- Noetherianity is used: over `k[x₁, x₂, …]`, a projective resolution of `k` has finitely generated
  homology but `k` is not finitely presented, so no such `D` exists.
- For a finitely generated free resolution of a module the lemma returns it up to homotopy.

### 8.2 Finite groups acting on complexes of projective modules

Prove that for a finite group `G` and a finite-dimensional chain complex `C` of projective
`ℤG`-modules with finitely generated homology, `C_G = ℤ ⊗_{ℤG} C` has finitely generated homology,
`χ(C) = |G| · χ(C_G)` (Euler characteristics of the ranks of homology), and the Lefschetz number
`Σ_i (−1)ⁱ tr(g | Hᵢ(C) ⊗ ℚ)` vanishes for `g ≠ 1` (Brown1974, §1, Theorem 1, lines 125–172). Route:
8.1 over the noetherian ring `ℤG` replaces `C` by a finite complex `D` of finitely generated
projectives, and 7.3 makes each `ℚ ⊗ D_i` free of rank `m_i`, so both Euler characteristics and the
Lefschetz numbers are computed on chains. *Needs:* 8.1, 7.3.

**Checks.**

- For `G = ℤ/2` and `C = ℤG` in degree `0`: `χ(C) = 2 = 2 · χ(ℤ)`, and the Lefschetz number at the
  generator is `0`.
- Projectivity is used: for the trivial module `ℤ` in degree `0`, `χ(C) = 1 ≠ 2 · χ(C_G) = 2`.
- For the cellular chains of the circle with `ℤ/2` acting by the rotation of order `2` (free on
  cells), `χ(C) = 0 = 2 · χ(circle)`.

### 8.3 The rational Euler characteristic and the identity-class rank

Define, for a group with `H_*(G, ℚ)` of finite total dimension, `χ_ℚ(G) = Σᵢ (−1)ⁱ dim_ℚ Hᵢ(G, ℚ)`
(`rationalEulerChar G`; for other groups its value is the convention stated under Conventions;
Brown1974, §4, lines 386–387; this is the invariant Brown1974 calls the naive Euler characteristic,
lines 82–83). For `G` of type `FP` over `ℤ` and a finite projective resolution `P` of the trivial
`ℤG`-module, define `χ̃(G) = Σᵢ (−1)ⁱ r_{Pᵢ}([1]) ∈ ℤ`, the alternating sum of the identity-class
coefficients of the Hattori–Stallings ranks of 7.1 (the ranks as in BrownGTM87, §IX.2). Prove:
`χ̃(G)` does not depend on `P` (generalized Schanuel lemma and the additivity of 7.1);
`χ̃(H) = [G : H] · χ̃(G)` for `H` of finite index (7.1); for type `FP`,
`χ_ℚ(G) = Σᵢ (−1)ⁱ Σ_{[g]} r_{Pᵢ}([g]) = Σᵢ (−1)ⁱ rank_ℤ(ℤ ⊗_{ℤG} Pᵢ)`; and for type `FL`,
`χ_ℚ(G) = χ̃(G) = Σᵢ (−1)ⁱ rank Fᵢ` (Brown1974 lines 402–410). *Needs:* 7.1, 1.2; Tau Ceti's
Schanuel lemma `TauCeti.exists_linearEquiv_comp_fst_eq_comp_snd_comp`.

- `χ_ℚ` and `χ̃` are invariant under isomorphism of groups, and `χ_ℚ(1) = χ̃(1) = 1`.
- `χ_ℚ(G) = Σ(−1)ⁱ dim Hⁱ(G, ℚ)` by universal coefficients over `ℚ`.

**Checks.**

- `χ_ℚ(ℤ) = χ̃(ℤ) = 1 − 1 = 0`, `χ_ℚ(F_r) = 1 − r` from `0 → ℤF^r → ℤF → ℤ → 0`, and
  `χ_ℚ(ℤⁿ) = Σ_k (−1)ᵏ (n choose k) = 0` for `n ≥ 1`.
- For a finite group `G`, `χ_ℚ(G) = 1` for every order, so `χ_ℚ` does not see the order of a finite
  group (compare `χ` in 8.4). For a nontrivial finite group `χ̃` is not defined (`cd_ℤ G = ⊤` by
  2.7, so there is no finite projective resolution over `ℤ`): for `G = ℤ/2` one has `χ_ℚ = 1`,
  `χ = 1/2` and no `χ̃`. For `G = 1` the resolution `0 → ℤ → ℤ → 0` of length `0` gives
  `χ̃(1) = 1 = χ_ℚ(1) = χ(1)`.
- For the additive group `ℚ`, `χ_ℚ(ℚ) = 1 − 1 = 0` although `ℚ` is not of type `FP_1` over `ℤ`.

### 8.4 Normal subgroups of finite index and groups of finite homological type

Define, for `G : Type`, the *Euler characteristic* `χ(G)` (`groupEulerChar G`) as the common value
of `χ_ℚ(H)/[G : H]` over the torsion-free subgroups `H` of finite index, without choosing one: when
the set of these values is a singleton, `χ(G)` is its element, and `χ(G) = 0` when there is no such
subgroup or when two of them give different values. Prove: (a) if `cd_ℤ Γ < ⊤` and `Γ' ◁ Γ` has
finite index with finitely generated integral homology, then `H_*(Γ, ℚ)` is finite-dimensional and
`χ_ℚ(Γ') = [Γ : Γ'] · χ_ℚ(Γ)` (Brown1974, §4, Theorem 3, lines 388–401: apply 8.2 to `ℤ ⊗_{ℤΓ'} P`
for a finite projective resolution `P` over `ℤΓ`); (b) for `G` of finite homological type,
`χ(G) = χ_ℚ(H)/[G : H]` for every torsion-free finite-index subgroup `H`, so the values agree and
`χ(G)` is their common value (`groupEulerChar_eq_div_index`; Brown1974 lines 411–424: compare
through a torsion-free normal subgroup of finite index contained in two of them, using (a)); (c) for
`G` of finite homological type, `χ(H) = [G : H] · χ(G)` for every finite-index `H` (which has finite
homological type by 4.4) (`groupEulerChar_subgroup`); `χ(G) = χ_ℚ(G) ∈ ℤ` when
`G` is torsion-free; and `χ(G) = χ̃(G) = Σᵢ (−1)ⁱ rank Fᵢ` for `G` of type `FL`; (d) `χ` is the
unique `ℚ`-valued function on groups virtually of type `FL` that is multiplicative on finite-index
subgroups and given by the ranks of a finite free resolution for type `FL`, so it is the Euler
characteristic of Wall and Serre (Brown1974 lines 402–410; Serre1971Bourbaki lines 77–86; Wall1961;
Serre1971Prospects n°1.8). *Needs:* 8.2, 8.3, 4.1, 4.4, 2.3.

- `χ` is invariant under isomorphism, and `χ(G) = 1/|G|` for `G` finite.

**Checks.**

- `χ(G) = 1/|G|` for a finite group, against `χ_ℚ(G) = 1`.
- `χ(ℤ/2 × ℤ) = χ(ℤ)/2 = 0`.
- `χ(ℤ/4 ∗_{ℤ/2} ℤ/6) = χ_ℚ(K)/12 = −1/12` for its free kernel `K` of index `12` (4.1), whose rank
  is `2` by the count of 8.7: the two computations agree.

### 8.5 Twisted coefficients

Prove that for `G` of type `FP` over `ℤ`, a field `K` and a `KG`-module `V` of finite dimension,
`Σᵢ (−1)ⁱ dim_K Hⁱ(G, V) = χ(G) · dim_K V`, a finite sum since the cohomology is finite-dimensional
and vanishes above `cd_ℤ G` (`finsum_finrank_groupCohomology_eq_groupEulerChar_mul`); and that for
`Γ' ◁ G` of finite index, in the Grothendieck group `G₀(K[G/Γ'])` of finite-dimensional
representations of the finite group `G/Γ'` over `K` (generated by the classes `[W]`, with
`[W] = [W'] + [W'']` for every short exact sequence `0 → W' → W → W'' → 0`),
`Σᵢ (−1)ⁱ [Hⁱ(Γ', V)] = χ(G) · dim_K V · [K[G/Γ']]`, where `G/Γ'` acts on `Hⁱ(Γ', V)` as in
CohomologyOfGroups §1.2 and `χ(G) = χ_ℚ(G) ∈ ℤ` because `G` is torsion-free (4.4, 8.4(c)). In
characteristic zero, where characters are additive on short exact sequences and determine
finite-dimensional representations, this is equivalent to the statement that the alternating sum of
the characters of `G/Γ'` on `H*(Γ', V)` is `χ(G) · dim_K V` times the regular character (Brown1974,
§4, Theorem 4 and Corollary 1, lines 425–451, in characteristic zero there; Appendix A, Theorem 7,
lines 1284–1355, gives the freeness the Grothendieck-group form needs over every field). Route: for
a finite projective resolution `P` of `ℤ` over `ℤG`, `Hom_{ℤΓ'}(P, V)` is a bounded complex of
finite-dimensional `K[G/Γ']`-modules whose cohomology is `H*(Γ', V)` with its `G/Γ'`-action; by 7.5
(a group of type `FP` is finitely generated, 1.4) its degree-`i` term is free of rank
`r(Pᵢ) · dim_K V`; the Euler–Poincaré relation in `G₀` equates the alternating sums of the classes
of the terms and of the cohomology; and `Σ(−1)ⁱ r(Pᵢ) = χ_ℚ(G) = χ(G)` (8.3, 8.4). The first
identity is the image of the case `Γ' = G` under the dimension `G₀(K) → ℤ`. The character form
follows by additivity of characters, and conversely implies the class form through
`FDRep.nonempty_iso_of_character_eq`. *Needs:* 7.5, 8.3, 8.4, 4.4, 1.4; CohomologyOfGroups §1.2; Tau
Ceti `TauCeti.AbelianK0` and `TauCeti.AbelianK0.eulerChar_eq_homologyEulerChar`; for the character
form in characteristic zero, Tau Ceti `FDRep.nonempty_iso_of_character_eq`.

**Checks.**

- For `G = ℤ` and `V = K` with `t` acting by `λ`: if `λ ≠ 1` both `H⁰` and `H¹` vanish, if `λ = 1`
  both are `K`; in both cases the sum is `0 = χ(ℤ)`.
- For `G = F_2` and trivial `V = K`: `1 − 2 = −1 = χ(F_2)`.
- Type `FP` is used: for `G = ℤ/2` and `V = ℚ`, the sum is `1` while `χ(ℤ/2) · 1 = 1/2`.
- For `G = F_2 = ⟨a, b⟩`, `Γ'` the kernel of `a ↦ 1, b ↦ 0` onto `ℤ/2` (free on `b, aba⁻¹, a²`) and
  trivial `V = ℚ`: `H⁰ = ℚ`, and `H¹ = Hom(Γ', ℚ) = ℚ³` on which `a` exchanges the duals of `b` and
  `aba⁻¹` and fixes that of `a²`, so `H¹ ≅ 2·𝟙 ⊕ sgn` and
  `[H⁰] − [H¹] = −𝟙 − sgn = −[ℚ[ℤ/2]] = χ(F_2) · [ℚ[ℤ/2]]`. The dimension count alone, `1 − 3 = −2`,
  would also be met by `−2·𝟙`, which the class excludes.
- The same `G`, `Γ'` and `V = 𝔽₂`: `G₀(𝔽₂[ℤ/2]) ≅ ℤ` by length (the trivial module is the only
  simple one), and the class is `1 − 3 = −2 = χ(F_2) · 2`. The regular representation of `ℤ/2` over
  `𝔽₂` has trace `0` at both elements, so an identity of traces reads `0 = 0` and cannot see the
  `−2`: over a field of positive characteristic only the class form carries the theorem.

### 8.6 Extensions

Prove that if `N ◁ G`, `N` and `G ⧸ N` are virtually of type `FP` and `G` is virtually torsion-free
(it has a torsion-free subgroup of finite index), then `G` is virtually of type `FP` and
`χ(G) = χ(N) · χ(G ⧸ N)` (`isVirtuallyOfTypeFP_and_groupEulerChar_eq_mul`; Brown1974, §4, Corollary
2, lines 452–463). Route: pass to a torsion-free finite-index subgroup `Γ` of `G` whose intersection
`Γ ∩ N` and image `Q` in `G ⧸ N` are of type `FP` (4.4, 8.4(c)); it is of type `FP` (2.4). The
spectral sequence of CohomologyOfGroups §6.2 for `Γ ∩ N ◁ Γ` with coefficients `ℚ`,
`E₂^{p,q} = Hᵖ(Q, H^q(Γ ∩ N, ℚ))`, is the spectral sequence of a filtration of the normalized
cochains that is finite in each degree (CohomologyOfGroups §6.1); its `E₂`-page is zero unless
`p ≤ cd_ℤ Q` and `q ≤ cd_ℤ(Γ ∩ N)`, its terms are finite-dimensional, and by 8.5 its alternating row
sums are `χ(Q) · dim H^q(Γ ∩ N, ℚ)`. The Euler characteristic identity of
SpectralSequencesAndConvergence §5.3, with the finite-dimensional `ℚ`-vector spaces as weak Serre
class and the dimension as additive invariant, applied on the classical `E₂` (its native page `3`),
gives `χ_ℚ(Γ) = Σ_{p,q} (−1)^{p+q} dim E₂^{p,q} = χ(Q) · χ_ℚ(Γ ∩ N)`; dividing by
`[G : Γ] = [G ⧸ N : Q] · [N : Γ ∩ N]` gives the product (8.4). *Needs:* 8.4, 8.5, 4.4, 2.4;
CohomologyOfGroups §§6.1–6.2; SpectralSequencesAndConvergence §5.3.

**Checks.**

- `χ(ℤ/2 × ℤ) = χ(ℤ/2) · χ(ℤ) = 0`.
- `χ(F_2 × F_3) = (−1)(−2) = 2`, also `χ_ℚ` of the product by the Künneth formula. With `N = F_3`,
  the `E₂`-terms `H⁰(F_2, ℚ) ⊗ H^q(F_3, ℚ)` and `H¹(F_2, ℚ) ⊗ H^q(F_3, ℚ)` have dimensions `1, 3`
  and `2, 6`, so the total degrees `0, 1, 2` carry dimensions `1, 5, 6` and the supplied Euler
  identity gives `1 − 5 + 6 = 2`.
- For the Klein bottle group as an extension of `ℤ` by `ℤ`, `χ = 0 · 0 = 0`.

### 8.7 Actions on acyclic complexes, amalgams and HNN extensions

Prove that if `G` has finite homological type and `C` is a finite-length resolution of `ℤ` over `ℤG`
with `C_p ≅ ⊕_{σ ∈ Σ_p} Ind_{G_σ}^G(ℤ_σ)`, each `Σ_p` finite, each `ℤ_σ` given by a character
`G_σ → {±1}` and each `G_σ` of finite homological type, then `χ(G) = Σ_p (−1)^p Σ_{σ ∈ Σ_p} χ(G_σ)`
(`groupEulerChar_eq_sum_of_monomialResolution`: the resolution is a `QuasiIso` from `C` to the
trivial representation in degree `0`, `Ind` is Mathlib's `Rep.ind` along the inclusion of `G_σ`, and
a character `G_σ → {±1}` is the same as a representation of `G_σ` on a free `ℤ`-module of rank one).
In particular, for a simplicial action of `G` on an acyclic simplicial complex with finitely many
simplices modulo `G` and simplex stabilizers of finite homological type, `χ(G)` is the equivariant
Euler characteristic `Σ_σ (−1)^{dim σ} χ(G_σ)` over representatives `σ` of the simplices (Brown1974,
§5, lines 464–479, Proposition 2(i), line 509, and Proposition 4, lines 558–582; Serre1971Prospects
n°1.8, Proposition 14(b)). Deduce, for amalgams and HNN extensions of finite homological type whose
vertex and edge groups have finite homological type, `χ(A ∗_C B) = χ(A) + χ(B) − χ(C)` for injective
`C →* A` and `C →* B` (the amalgam being `Monoid.PushoutI` over `Bool`; `groupEulerChar_pushoutI`)
and `χ(HNNExtension H A B φ) = χ(H) − χ(A)` (`groupEulerChar_hnnExtension`), from the Bass–Serre
tree (CohomologyOfGroups §3.4; FreeGroupsAndLimitGroups §§4.5, 4.7). Route: restrict to a
torsion-free normal subgroup `Γ'` of finite index, decomposing each `Ind_{G_σ}^G` over the double
cosets `Γ'\G/G_σ`; the orbit spectral sequence of CohomologyOfGroups §3.2 with rational
coefficients, `E¹_{p,q} = ⊕ H_q(Γ'_σ, ℚ_σ) ⇒ H_{p+q}(Γ', ℚ)`, converging with filtrations finite in
each total degree (CohomologyOfGroups §2.3, where it is the spectral sequence of the row filtration
of a first-quadrant bicomplex), has finitely many nonzero `E¹`-terms, all finite-dimensional, so the
Euler identity of SpectralSequencesAndConvergence §3.4, in its filtered-complex form §5.3 (the
finite-dimensional `ℚ`-vector spaces and their dimension), gives `χ_ℚ(Γ')`; a character `ε` of a
torsion-free group `T` of finite homological type does not change it, `χ_ℚ(T; ℚ_ε) = χ_ℚ(T)`, by
8.4(a) for `ker ε`. *Needs:* 8.4, 4.4; CohomologyOfGroups §§2.3, 3.2, 3.4;
SpectralSequencesAndConvergence §§3.4, 5.3; FreeGroupsAndLimitGroups §4.5, §4.7; Mathlib `Rep.ind`,
`ChainComplex.single₀`, `QuasiIso`.

**Checks.**

- `χ(ℤ/4 ∗_{ℤ/2} ℤ/6) = 1/4 + 1/6 − 1/2 = −1/12`, so its free kernel of index `12` has
  `χ = −1`, rank `2` (8.4). With the sign of the edge term reversed the amalgam would give
  `11/12`, which is not `χ_ℚ(K)/12` for any free `K`.
- `χ(ℤ/2 ∗ ℤ/3) = 1/2 + 1/3 − 1 = −1/6`, the value FuchsianOrbifolds Layer 5 item 6 gives for the
  orbifold Euler characteristic of `PSL(2, ℤ)`.
- The free group on `r` generators acts on its Cayley tree with one vertex orbit and `r` edge
  orbits, all stabilizers trivial: `1 − r`. `BS(1, 2)` as an HNN extension of `ℤ` over `ℤ` gives
  `0 − 0 = 0`.

### 8.8 Smith theory and orbit counting

Let a finite group `G` act by simplicial automorphisms on a finite-dimensional simplicial set `X`
(5.5). For `H ≤ G` the `H`-fixed simplices form a simplicial subset `X^H`, a face of a fixed simplex
being fixed, and `X/H` is the orbit simplicial set; for an action `X : Action SSet G`, viewed
through `Action.functorCategoryEquivalence` as a functor on the one-object category of `G`, `X^G`
and `X/G` are its limit and its colimit, computed degreewise. Homology is `SSet.homology`; with
coefficients in `𝔽_p`, `χ_p(Y) = Σᵢ (−1)ⁱ dim_{𝔽_p} Hᵢ(Y; 𝔽_p)` whenever the total dimension is
finite. Chains are the normalized chains `N(Y) = SSet.normalizedChainComplex` (5.5), zero above the
dimension of `Y` (`SSet.isZero_normalizedChainComplex_X_of_hasDimensionLT`) and computing
`SSet.homology` (`SSet.homotopyEquivNormalizedChainComplex`); `G` acts on `N(X)` through
`SSet.normalizedChainComplexMap`, permuting the basis of nondegenerate simplices. Prove first the
two compatibilities the arguments below use: for `H ≤ G`, a simplex of `X^H` is degenerate in `X^H`
if and only if it is degenerate in `X` (if `x = s_i y` then `y = d_i x` is `H`-fixed), so `N(X^H)`
is the subcomplex of `N(X)` spanned by the `H`-fixed nondegenerate simplices, and for a union of
fixed simplicial subsets the relative normalized chains are spanned by the nondegenerate simplices
outside it; and the image in `X/H` of a nondegenerate simplex is nondegenerate (if `[x] = s_i[y]`
then `x = h · s_i y = s_i(h · y)` for some `h ∈ H`), so `N(X/H)` is the module of `H`-coinvariants
`ℤ ⊗_{ℤH} N(X)`, compatibly with the differentials. Prove:

- (a) (Smith, Floyd) for a prime `p`, `G = ℤ/p` and `Σᵢ dim Hᵢ(X; 𝔽_p) < ∞`: `X^G` and `X/G` have
  finite total mod-`p` homology, `Σ_{i ≥ n} dim Hᵢ(X^G; 𝔽_p) ≤ Σ_{i ≥ n} dim Hᵢ(X; 𝔽_p)` for every
  `n`, and `χ_p(X) + (p − 1) χ_p(X^G) = p χ_p(X/G)` (`smith_floyd`, for `G = ℤ/p` written
  `Multiplicative (ZMod p)` and `X` of dimension at most `N` with each `Hᵢ(X; 𝔽_p)`
  finite-dimensional, which for a finite-dimensional `X` is the finiteness of the total dimension;
  the sums run over the degrees `≤ N`, above which all three simplicial sets have no homology;
  Floyd1952 Theorem 4.2, lines 292–330, and Theorem 4.4, lines 333–348, for locally compact
  finite-dimensional Hausdorff spaces; the proof rests on the chain-level Smith sequences (A) and
  (B) of Floyd1952 Theorems 2.3–2.4, lines 110–176, stated for a simplicial action of prime period
  whose fixed points form a subcomplex, and on
  Smith's facts (3.4)–(3.6), lines 261–267: the special homology vanishes above the dimension, and
  the special homology relative to the fixed points is the homology of the orbit space relative to
  the image of the fixed points);
- (b) for a finite `p`-group `G` with `Σᵢ dim Hᵢ(X; 𝔽_p) < ∞`, every `X^H`, `H ≤ G`, has finite
  total mod-`p` homology (Brown1974 lines 327–333, which attributes this to Smith theory);
- (c) for a finite `p`-group `G` and a finite-dimensional chain complex `C` of projective
  `𝔽_p[G]`-modules with finite total homology, `C_G = 𝔽_p ⊗_{𝔽_p[G]} C` has finite total homology
  and `χ(C) = |G| · χ(C_G)` (Brown1974 Theorem 1′, lines 174–185);
- (d) (Brown) if every `Hᵢ(X; ℤ)` is finitely generated (they vanish above the dimension of `X`,
  `SSet.isZero_homology_of_hasDimensionLT`),
  and an integer `d ≥ 1` divides the cardinality of the `G`-orbit of every nondegenerate simplex of
  `X`, then
  `d ∣ χ(X) = Σᵢ (−1)ⁱ rank Hᵢ(X; ℤ)` (Brown1974 §2, Corollary of Theorems 2 and 2′, lines 251–260,
  with `X′` empty).

Route: (a) as in Floyd1952 §§2 and 4, whose chain-level arguments apply verbatim to a simplicial
set, since for `G = ℤ/p` a nondegenerate simplex is either fixed or has `p` distinct translates, so
the normalized chains of `X` over `𝔽_p` are those of `X^G` plus free `𝔽_p[G]`-modules; for a
simplicial set Smith's facts (3.4)–(3.6) hold at the chain level, the normalized chains vanishing
above the dimension of `X` and the norm `1 + g + ⋯ + g^{p−1}` identifying the free part modulo
`1 − g` with the normalized chains of `X/G` relative to the image of `X^G` (the compatibilities
above); (b) by (a) along a chain `1 = H₀ < H₁ < ⋯ < H_r = H`
with each `H_{i−1}` normal in `H_i` of index `p`, as `X^{H_i} = (X^{H_{i−1}})^{H_i/H_{i−1}}`; (c)
because `𝔽_p[G]` is local, so projective modules are free, and 8.1 over the noetherian ring
`𝔽_p[G]` (the vanishing hypothesis holds above the dimension of `C`) replaces `C` by a bounded
complex of finitely generated free modules, on which both sides are computed from ranks; (d) for
each prime `p` with `p^e ∥ d`, restrict to a Sylow `p`-subgroup `P`, whose orbits all have
cardinality divisible by `p^e`; decompose `X` by isotropy type, `X_H` being the simplices with
stabilizer exactly `H`, a difference of the simplicial subsets `X^H` and `⋃_{H′ > H} X^{H′}`, which
have finite mod-`p` homology by (b) and Mayer–Vietoris (the family of fixed simplicial subsets is
closed under intersection); `N_P(H)/H` acts freely on the basis of the relative normalized chains
of `X_H`, a finite-dimensional complex of free `𝔽_p[N_P(H)/H]`-modules, so (c) gives
`χ_p(X_H) = (N_P(H) : H) · χ_p(Y_H)` with `Y_H = X_H/N_P(H)`, and additivity along the filtration of
`X` by `P`-invariant simplicial subsets gives `χ_p(X) = Σ_H (P : H) · χ_p(Y_H)` over representatives
`H` of the occurring conjugacy classes of isotropy groups (Brown1974 lines 261–326, applying its
Theorem 1 to the normalized chain complex at line 302); every term is
divisible by `p^e`; finally
`χ_p(X) = χ(X)` by universal coefficients, the integral homology being finitely generated. *Needs:*
8.1; Mathlib `SSet`, `SSet.homology`, `SSet.normalizedChainComplex`,
`SSet.homotopyEquivNormalizedChainComplex`, `SSet.normalizedChainComplexMap`,
`SSet.isZero_normalizedChainComplex_X_of_hasDimensionLT`, `SSet.isZero_homology_of_hasDimensionLT`,
`Sylow`, `CategoryTheory.Action`, `Action.functorCategoryEquivalence`.

- The Smith inequality of (a) with `n = 0` bounds the total mod-`p` homology of `X^G` by that of
  `X`; in particular, for a finite `p`-group acting on a finite-dimensional simplicial set with the
  mod-`p` homology of a point, `X^G` has the mod-`p` homology of a point (by (a) and Floyd's
  relation, its Euler characteristic is `1 mod p`, so it is nonempty).
- For `G = ℤ/p` acting without fixed simplices, (a) and (d) with `d = p` agree:
  `χ_p(X) = p χ_p(X/G)`.

**Checks.**

- Floyd's relation, with fixed points: let `X` be the circle with vertices `v₀, v₁, v₂, v₃` and
  edges `v₀ → v₁`, `v₂ → v₁`, `v₀ → v₃`, `v₂ → v₃`, and `ℤ/2` swap `v₁` and `v₃`. Then
  `X^G = {v₀, v₂}` (`χ = 2`, total dimension `2 ≤ 2`), `X/G` is the path `v₀ → [v₁] ← v₂` (`χ = 1`),
  and `0 + (2 − 1) · 2 = 2 · 1`. A relation without the fixed-point term would give `0 = 2`.
- Free actions: on the same `X` let `ℤ/2` swap `v₀ ↔ v₂` and `v₁ ↔ v₃`. It acts freely, `X/G` is a
  circle with two vertices and two edges, and `0 + 0 = 2 · 0`; every orbit has two elements and
  `2 ∣ χ(X) = 0`, as (d) says. On the subdivided interval (vertices `v₀, v₁, c`, edges `v₀ → c` and
  `v₁ → c`) with `v₀ ↔ v₁` swapped, `χ = 1`, the fixed vertex `c` has an orbit of one element, and
  `X^G = {c}` has the homology of a point, as Smith theory requires.
- Finite dimension is used: `ℤ/2` acts freely on the contractible simplicial set `E(ℤ/2)` whose
  `k`-simplices are the `(k + 1)`-tuples of elements of `ℤ/2`, so every orbit has two elements,
  while its Euler characteristic is `1`, not divisible by `2`; it has nondegenerate simplices in
  every dimension.
- Normalized, not unnormalized, chains: for `X = Δ[0]` the unnormalized chains `SSet.chainComplex`
  are `ℤ` in every degree, with `d_n` the alternating sum of `n + 1` identities, so `d₁ = 0` and
  `d₂ = id`, while the normalized chains are `ℤ` in degree `0` and `0` above. Both give `H₀ = ℤ` and
  `Hᵢ = 0` for `i > 0`, but only the normalized complex has finite length, as (a), (c), (d) and 5.5
  require; a chain model counting degenerate simplices would make every complex of this section
  unbounded.
- Finite total homology of `X` is used in (b): `ℤ/2` acting trivially on the discrete simplicial set
  `ℕ` (dimension `0`) has `X^G = X` with `H₀(X^G; 𝔽₂) = 𝔽₂^{(ℕ)}` of infinite dimension, and is
  excluded because `H₀(X; 𝔽₂)` is infinite as well. For a point both totals are `1`; for the
  reflection of the circle above the total for `X` is `2` and for `X^G` it is `2`.

### 8.9 Denominators

Prove that if `G` has finite homological type (4.4) and `m` is the least common multiple of the
orders of the finite subgroups of `G`, then `m · χ(G) ∈ ℤ`, and so `m' · χ(G) ∈ ℤ` for every common
multiple `m'` of those orders (`exists_int_eq_mul_groupEulerChar`, stated for every common
multiple); equivalently, every prime power dividing the denominator of `χ(G)` is the order of a
subgroup of `G` (`exists_subgroup_card_eq_of_dvd_den`) (Brown1974, §6, Corollary 1 of Theorem 5,
lines 603–610, the case of the empty family; Serre1971Prospects n°1.8, Proposition 13, as cited at
Brown1974 lines 611–614, for the weaker statement that some power of `m` works). The least common
multiple exists: for a torsion-free normal subgroup `Γ'` of finite index (the normal core of a
torsion-free finite-index subgroup, 4.1), every finite subgroup of `G` meets `Γ'` trivially, so its
order divides `[G : Γ']`. Route: let `Q = G ⧸ Γ'` and `Z` the simplicial set of 5.5(b); `Γ'` acts
freely on `Z`, so `X = Z/Γ'` is a finite-dimensional simplicial set whose normalized chains are
those of `Z` tensored over `ℤΓ'` with `ℤ` (8.8); as the normalized chains of `Z` are a free
resolution of `ℤ` over `ℤΓ'` (5.5(b)), `Hᵢ(X; ℤ) ≅ Hᵢ(Γ', ℤ)` (`groupHomologyIsoTor`), finitely
generated as `G` has finite homological type, and `χ(X) = χ_ℚ(Γ')`. The group `Q` acts on `X`, and
the stabilizer of the image of a simplex `z` is the image of `G_z`, isomorphic to `G_z` since
`G_z ∩ Γ' = 1`; its order divides `m`, and `m` divides `|Q|`, so `d = |Q|/m` divides the cardinality
of every `Q`-orbit. By 8.8(d), `d ∣ χ_ℚ(Γ')`, and `m · χ(G) = m · χ_ℚ(Γ')/|Q| = χ_ℚ(Γ')/d ∈ ℤ`
(8.4(b)). The equivalence: if `mχ(G) ∈ ℤ`, a prime power `p^a` dividing the denominator divides `m`,
hence the order of a finite subgroup, which has a subgroup of order `p^a` by Sylow's theorem;
conversely each prime power exactly dividing the denominator then divides `m`. *Needs:* 8.8, 8.4,
5.5, 4.1, 4.4; Mathlib `groupHomologyIsoTor`, `Sylow`.

- If `G` is virtually torsion-free and acts on an acyclic simplicial complex with finitely many
  orbits of simplices and finite stabilizers (more generally, `C` as in 8.7 with every `G_σ`
  finite), then a torsion-free normal subgroup `Γ'` of finite index meets every stabilizer
  trivially and acts freely with finitely many orbits (for `C`: its restriction to `Γ'` is a
  finite resolution by finitely generated free modules, each `Ind_{G_σ}^G(ℤ_σ)` restricting to a
  sum over the finitely many double cosets `Γ'\G/G_σ` of copies of `ℤΓ'`), so `G` is virtually of
  type `FL` and has finite homological type (4.4); 8.7 then gives
  `χ(G) = Σ_σ (−1)^{dim σ}/|G_σ|`, so `m_C · χ(G) ∈ ℤ` for the least common multiple `m_C` of the
  stabilizer orders, which divides `m` (Brown1974 Proposition 4, lines 558–563, assumes virtual
  torsion-freeness in the same way).
- For `G` torsion-free, `m = 1` and the statement is `χ(G) ∈ ℤ` (8.4(c)).

**Checks.**

- For `ℤ/4 ∗_{ℤ/2} ℤ/6`, the finite subgroups are conjugate into a factor (FreeGroupsAndLimitGroups
  §4.9), of orders `1, 2, 3, 4, 6`, so `m = 12` and `12 · (−1/12) = −1`; the denominator
  `12 = 4 · 3` gives subgroups of orders `4` and `3`. A model with `m` the largest order of a finite
  subgroup would give `6 · (−1/12) = −1/2 ∉ ℤ`.
- For `ℤ/2 ∗ ℤ/3`, `m = 6` and `6 · (−1/6) = −1`, while the largest finite order `3` gives
  `3 · (−1/6) = −1/2`.
- For `G` finite, `m = |G|` and `|G| · 1/|G| = 1`; for `ℤ/2 × ℤ`, whose finite subgroups have order
  at most `2`, `m = 2` and `2 · 0 = 0`.
- For `ℤ/4 ∗_{ℤ/2} ℤ/6` on its Bass–Serre tree (vertex stabilizers of orders `4` and `6`, one edge
  orbit with stabilizer of order `2`), the action bullet gives `1/4 + 1/6 − 1/2 = −1/12` and
  `m_C = 12 = m`; the kernel `Γ'` of the map to `ℤ/12` of 4.1 acts freely with `12/4 + 12/6 = 5`
  vertex orbits and `12/2 = 6` edge orbits, so `χ(Γ') = 5 − 6 = −1 = 12 · (−1/12)` and `Γ'` is free
  of rank `2`. Virtual torsion-freeness is necessary for the conclusion of that bullet: a
  finite-index subgroup of type `FL` has finite `cd_ℤ` and so is torsion-free (2.7).

### Examples

`χ(SL₂(ℤ)) = −1/12` (Serre1971Bourbaki line 214) is the value of 8.7 on `ℤ/4 ∗_{ℤ/2} ℤ/6`, which is
`SL₂(ℤ)` by Serre's theorem on its action on a tree; the identification is not a target here, and
the Checks are stated for the amalgam.

### Dependencies

Layers 1, 2, 4, 5 (Serre's construction 5.5) and 7; CohomologyOfGroups §§1.2, 2.3, 3.2, 3.4, 6.1 and
6.2; SpectralSequencesAndConvergence §§3.4 and 5.3; FreeGroupsAndLimitGroups §§4.5, 4.7 and 4.9;
Mathlib's simplicial sets with their normalized chains, and Sylow subgroups; Tau Ceti's Grothendieck
group `TauCeti.AbelianK0` of `FDRep` with its Euler–Poincaré relation, and the determination of
representations by characters (8.5).

---

## Layer 9: complete resolutions and Farrell cohomology

Throughout, `G` has a subgroup `H` of finite index with `cd_R H ≤ n < ⊤`. Over `ℤ` this says that
`vcd G ≤ n` (4.1), and for every `R` it holds with `n = vcd G` when `vcd G < ⊤`, by base change as
in 4.3.

### 9.1 Modules projective over a subgroup of finite index are Gorenstein projective

Prove that a representation `M : Rep R G` whose restriction to `H` is projective is Gorenstein
projective in `Rep R G` (`CategoryTheory.isGorensteinProjective`) (BrownGTM87, §X.2; Farrell1977).
Route: the unit `M → Coind_H^G Res M` is injective and split over `H`, its target is projective over
`RG` because `Coind_H^G = Ind_H^G` at finite index and `Res M` is projective, and its cokernel is
again projective over `H`; iterating gives a right resolution by projectives with `H`-projective
cokernels, and any projective resolution of `M` has `H`-projective syzygies; for `Z` projective over
`H` and `Q` projective over `G`, `Ext¹_{RG}(Z, Q) = 0`, because `Q` is a summand of a free module
`⊕ RG = Coind_H^G(⊕ RH)` and Shapiro's lemma gives `Ext¹_{RH}(Z, ⊕ RH) = 0`; the splice is totally
acyclic by `CochainComplex.isTotallyAcyclicProjective_splice`. *Needs:* Tau Ceti
`CochainComplex.isTotallyAcyclicProjective_splice`, `CategoryTheory.isGorensteinProjective`; Mathlib
`groupCohomology.coindIso`, `Rep.equivalenceModuleMonoidAlgebra`.

**Checks.**

- For `G` finite, `H = 1` and `R` a field, every `RG`-module is Gorenstein projective.
- For `H = G` the hypothesis is projectivity and the conclusion is
  `CategoryTheory.isGorensteinProjective_of_projective`.
- The hypothesis is used: for `G = ℤ` and `R ≠ 0`, the trivial module `R` has projective dimension
  `1`, and a Gorenstein-projective module of finite projective dimension is projective (it has no
  extensions by projectives, `CategoryTheory.isGorensteinProjective.ext_eq_zero`), which `R` is not.

### 9.2 Complete resolutions

Define a *complete resolution* of `R` over `RG` as a chain complex `F` indexed by `ℤ` that is a
totally acyclic complex of projectives (`CochainComplex.IsTotallyAcyclicProjective` after
reindexing), with a projective resolution `P → R` and a chain map `F → P` (`P` extended by zero in
negative degrees) which is an isomorphism in all degrees `≥ d` for some `d`. Prove that one exists
with `d = n`, and that any two are related by a homotopy equivalence commuting up to homotopy with
their maps to `P` (Farrell1977; BrownGTM87, §X.2). In the pinned carriers the existence reads: for
every projective resolution `P` of the trivial representation `R` in `Rep R G`, its `n`-th syzygy
`P.complex.opcycles n` is Gorenstein projective in `Rep R G` (`isGorensteinProjective_opcycles`); a
totally acyclic complex with degree-zero cycles the syzygy, spliced with `P` above degree `n`, is
the complete resolution. Route: the `n`-th syzygy `Ω` of `P` restricts to an `n`-th syzygy over
`RH`, projective as `cd_R H ≤ n` (2.1), so 9.1 gives a complete resolution of `Ω`, spliced with `P`
in degrees `≥ n`; for uniqueness, the syzygies of two resolutions agree up to projective summands
(Schanuel), hence are isomorphic in the stable category of the Frobenius exact structure on
Gorenstein-projective objects, and `TauCeti.ExactStructure.CompleteResolution.lift` with
`.nonempty_homotopy_zero_iff` and `.homotopyEquiv` give the homotopy equivalence. *Needs:* 9.1, 2.1;
Tau Ceti `CochainComplex.IsTotallyAcyclicProjective`,
`CategoryTheory.GorensteinProjective.exactStructure_isFrobenius`,
`TauCeti.ExactStructure.CompleteResolution.homotopyEquiv`,
`TauCeti.ExactStructure.CompleteResolution.nonempty_homotopy_zero_iff`.

- Restricting a complete resolution of `R` over `RG` to a finite-index subgroup gives one over that
  subgroup.
- A complete resolution agreeing with `P` above `d` agrees with it above every `d' ≥ d`.

**Checks.**

- For `G = ℤ/2 = ⟨s⟩` over `ℤ`, the periodic complex `⋯ → ℤG →(1 − s) ℤG →(1 + s) ℤG →(1 − s) ⋯`,
  agreeing with the periodic resolution in degrees `≥ 0`, is a complete resolution.
- If `cd_R G < ⊤`, the syzygy is projective and every complete resolution is contractible.
- For `G` trivial (`n = 0`), `F` is contractible: `R` is projective over `R`.

### 9.3 Farrell cohomology

Define `Ĥᵏ(G, M) = Hᵏ(Hom_{RG}(F, M))` for `k ∈ ℤ` and `M : Rep R G`, with the indexing of the
Conventions. Prove that it is independent of `F` up to canonical isomorphism (9.2), functorial in
`M`, has a natural long exact sequence for every short exact sequence of representations (each
`Hom_{RG}(F_k, −)` is exact), vanishes on projective `M` (total acyclicity), and has restriction
maps to finite-index subgroups compatible with the long exact sequences (Farrell1977; BrownGTM87,
§X.3). *Needs:* 9.2.

- `Ĥᵏ(G, −)` is an additive functor `Rep R G ⥤ ModuleCat R` for each `k ∈ ℤ`, and the connecting
  maps are natural.
- Dimension shifting: for `0 → M' → Q → M → 0` with `Q` projective, `Ĥᵏ(G, M) ≅ Ĥᵏ⁺¹(G, M')`.

**Checks.**

- For `G = ℤ/2` and `M = ℤ`: `Ĥ⁰ = ℤ/2`, `Ĥ⁻¹ = 0`, `Ĥ¹ = 0`, `Ĥ² = ℤ/2`; the indexing shifted by
  one degree gives `Ĥ⁰ = 0`.
- For `M = RG`, `Ĥ*(G, M) = 0`.
- For `G = ℤ`, `Ĥ*(G, −) = 0`.

### 9.4 Comparison with ordinary cohomology and vanishing

Prove: (a) the map `Hᵏ(G, M) → Ĥᵏ(G, M)` induced by `F → P` is an isomorphism for `k > n` and
surjective for `k = n`, naturally in `M` and compatibly with the long exact sequences (Farrell1977;
BrownGTM87, §X.3); (b) `Ĥ*(G, −) = 0` if and only if `cd_R G < ⊤`, and in particular Farrell
cohomology over `ℤ` vanishes for a torsion-free group of finite `vcd` (3.2). Route for (b): if
`Ĥⁿ(G, Ω) = 0`, the cocycle `P_n ↠ Ω` extends over `F_{n−1}`, so the identity of `Ω` factors through
a projective and `Ω` is projective. *Needs:* 9.2, 9.3, 2.1, 3.2.

**Checks.**

- For `G = ℤ/2 × ℤ` (`vcd = 1`) and `M = ℤ`, `Ĥᵏ(G, ℤ) = Hᵏ(G, ℤ) = ℤ/2` for `k ≥ 2`: `G` is the HNN
  extension of `ℤ/2` along the identity, and CohomologyOfGroups §3.6 gives
  `0 → Hᵏ⁻¹(ℤ/2, ℤ) → Hᵏ(G, ℤ) → Hᵏ(ℤ/2, ℤ) → 0`, with one outer term `ℤ/2` and the other `0`.
- For `ℤ/4 ∗_{ℤ/2} ℤ/6` (`vcd = 1`), `Ĥᵏ = Hᵏ(−, ℤ)` for `k ≥ 2`, which is `ℤ/12` for even and `0`
  for odd `k`: in even degrees the amalgam sequence of CohomologyOfGroups §3.6 reads
  `0 → Hᵏ → ℤ/4 ⊕ ℤ/6 → ℤ/2 → Hᵏ⁺¹ → 0`, restriction to `ℤ/2` being onto in even degrees, and the
  kernel contains `(1, 1)` of order `12`.
- At `k = n` the map is not injective in general: for `G = ℤ/2` (`n = 0`) it is `ℤ = H⁰ → Ĥ⁰ = ℤ/2`.

### 9.5 Finite groups

Prove that for `G` finite, Farrell cohomology over `R` is Mathlib's `tateCohomology`: natural
isomorphisms `Ĥᵏ(G, M) ≅ tateCohomology M k` for all `k ∈ ℤ`, compatible with the long exact
sequences and, for `k ≥ 1`, with the identification of both with `Hᵏ(G, M)` (BrownGTM87, §VI.3;
Farrell1977). Route: for `H = 1` and `n = 0`, splice the standard resolution with its `R`-dual along
the norm; `Hom_{RG}` of it into `M` is the norm splice of inhomogeneous cochains and chains defining
`tateCohomology`. *Needs:* 9.2–9.4; Mathlib `tateCohomology`, `TateCohomology.isoGroupCohomology`.

**Checks.**

- For `G = ℤ/2` and `M = ℤ` both sides are `ℤ/2, 0, ℤ/2, 0` in degrees `0, 1, 2, −1`.
- For `G = 1` both sides vanish.
- For `M = RG` both sides vanish.

### Examples

For a group of finite virtual cohomological dimension, Farrell cohomology captures the cohomology
above `vcd`, which comes from the finite subgroups: `ℤ/2 × ℤ` and `ℤ/4 ∗_{ℤ/2} ℤ/6` have the
periodic Farrell cohomology of their finite subgroups, and torsion-free groups have none.

### Dependencies

Layers 2–4; Tau Ceti's totally acyclic complexes, Gorenstein-projective objects, Frobenius exact
structure and comparison theorem for complete resolutions; Mathlib's `tateCohomology`;
CohomologyOfGroups §3.6 for Checks.

---

## Downstream consumers

- PosetHomotopyAndSubgroupComplexes places Brown's theorem on the `p`-fractional part of the Euler
  characteristic of a group of finite virtual cohomological dimension outside its scope; the
  invariants that theorem concerns are `vcd` (4.1) and `χ` (8.4) of this roadmap.
- ArithmeticKTheory §3.2 (Borel–Serre duality of dimension `d` for the torsion-free finite-index
  subgroups of `Aut(P)`, `P` a projective lattice over the integers of a number field, so that
  `vcd Aut(P) = d`: an instance of 4.1 and Layer 6), ArithmeticKTheory §3.4 (a Check using
  `vcd SL₂(ℤ[i]) = 2` and the vanishing of `H³(SL₂(ℤ[i]); ℝ)`: instances of 4.1 and 4.3),
  BianchiModularForms §9.3 (`χ(Γ₀(𝔫, 𝔞)) = 0`:
  an instance of 8.4) and FuchsianOrbifolds Layer 5 item 6 (multiplicativity of the orbifold Euler
  characteristic of cofinite Fuchsian groups under finite index, with `χ_orb(PSL(2, ℤ)) = −1/6`:
  instances of 8.4(c) and 8.7) state these instances by their own means, independently of this
  roadmap; their values are comparison points for the general invariants of Layers 4, 6 and 8.

## References

- [Serre1971Bourbaki] J.-P. Serre, *Cohomologie des groupes discrets*, Séminaire Bourbaki 23
  (1970/71), exposé 399.
- [Serre1971Prospects] J.-P. Serre, *Cohomologie des groupes discrets*, in Prospects in Mathematics,
  Ann. of Math. Studies 70, Princeton, 1971.
- [BieriEckmann1973] R. Bieri, B. Eckmann, *Groups with homological duality generalizing Poincaré
  duality*, Invent. Math. 20 (1973), 103–124.
- [BieriEckmann1974] R. Bieri, B. Eckmann, *Finiteness properties of duality groups*, Comment. Math.
  Helv. 49 (1974), 74–83.
- [Brown1974] K. S. Brown, *Euler characteristics of discrete groups and G-spaces*, Invent. Math. 27
  (1974), 229–264.
- [Brown1975] K. S. Brown, *Homological criteria for finiteness*, Comment. Math. Helv. 50 (1975),
  129–135.
- [BrownGTM87] K. S. Brown, *Cohomology of Groups*, Graduate Texts in Mathematics 87, 1982.
- [Farrell1977] F. T. Farrell, *An extension of Tate cohomology to a class of infinite groups*, J.
  Pure Appl. Algebra 10 (1977).
- [EilenbergGanea1957] S. Eilenberg, T. Ganea, *On the Lusternik–Schnirelmann category of abstract
  groups*, Ann. of Math. 65 (1957).
- [Wall1961] C. T. C. Wall, *Rational Euler characteristics*, Proc. Cambridge Philos. Soc. 57
  (1961).
- [Floyd1952] E. E. Floyd, *On periodic maps and the Euler characteristics of associated spaces*,
  Trans. Amer. Math. Soc. 72 (1952), 138–147.
- [Hatcher2002] A. Hatcher, *Algebraic Topology*, Cambridge University Press, 2002.
