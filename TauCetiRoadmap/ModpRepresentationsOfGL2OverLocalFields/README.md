# Roadmap: smooth mod p representations of GL₂ over a local field

**Summary.** Build the finiteness theory and the local structure theory of smooth representations
of `GL₂(F)`, `F/ℚ_p` finite, on `p`-power torsion modules over the integers `𝒪_L` of a finite
extension `L/ℚ_p`. The first half develops finite presentation in the smooth category through the
augmented Iwasawa algebra `𝒪_L[H] ⊗_{𝒪_L[U]} 𝒪_L[[U]]`, proves Shotton's coherence theorem for
`GL₂(F)/ϖ^ℤ`, the `ℚ_p` finite-length criteria of Colmez–Dospinescu–Nizioł (finite type implies
finite presentation, finite cosocle implies finite length, finite length is detected by smooth
vectors in the dual), the finite length of admissible finitely presented representations for every
`F` (Hu, Vignéras), and Emerton's ordinary parts with their finite-error counit for `F ≠ ℚ_p`. The
second half, for `F` unramified of degree `f`, develops the tame Serre-weight coordinates, the
graded algebra of the pro-`p` Iwahori subgroup and its crossing quotient, the Diamond boxes and
their multiplicity-preserving first-order enlargements, and reaches the two endpoints of
Breuil–Herzig–Hu–Morra–Schraen: the local Gelfand–Kirillov bound `dim_{GL₂(F)} π ≤ f` under the
socle, first-thickening and Iwahori-socle multiplicity hypotheses, and an integral lattice whose
reduction is `Proj_{K/Z₁} σ / 𝔪_{K₁}²`, with commutative endomorphism ring and relatively projective
quotients.

## Scope and ownership

This roadmap owns:

- torsion admissibility for smooth `p`-power torsion representations of an arbitrary `p`-adic Lie
  group (§0.1), the augmented Iwasawa algebra (§0.2), finite presentation in the smooth category
  and its exact-sequence calculus (§§0.3–0.4, 0.7), coherence for amalgams of compact open
  subgroups and its consequence for `GL₂(F)/ϖ^ℤ` (§0.5), Hom base change for finitely generated
  group-algebra modules (§0.6), and the compact-induction obstruction space of Hu (§0.8);
- the `ℚ_p` finite-length criteria of Colmez–Dospinescu–Nizioł §1.4 (Layer 1);
- the category `𝒞` of admissible finitely presented torsion representations of `GL₂(F)`, the
  extension of Emerton's ordinary-parts adjunction from `GL₂(ℚ_p)` to `GL₂(F)` for every finite
  `F/ℚ_p` on torsion-admissible representations, with its identification for `F = ℚ_p` with the
  functor of CompletedCohomologyAndLocalGlobalCompatibility §0.1, its values on ordinary
  constituents for `F ≠ ℚ_p`, and the finite-error counit with its Banach-lattice version
  (Layer 2);
- the labelled weight coordinates, the extension-graph map, the tame weight set `W(ρ̄)` for
  unramified `F` and the Diamond modules `D₀(ρ̄)`, `D₁(ρ̄)` (Layer 3);
- the Gelfand–Kirillov dimension of an admissible smooth representation, the central-regular-
  sequence dimension comparison, the explicit saturated valuation and graded algebra of the pro-`p`
  Iwahori subgroup, the crossing algebra, the truncations `W_{χ,n}` and the Iwahori dimension
  criterion (Layer 4);
- the finite-group and first-order extension calculus of `GL₂(𝔽_q)`, `K` and `I` used by
  Breuil–Herzig–Hu–Morra–Schraen, including the rational constituents of the projective lifts of
  the projective covers of Serre weights of `GL₂(k_F)` (Layers 5–6), multiplicity one through the
  third Iwahori layer and the local dimension bound (Layer 7), and the Bockstein maps, the gluing
  lattice and its endomorphisms (Layers 8–9).

It leaves to other roadmaps, by section:

- the smooth category over a ring, smoothness, compact-open invariants, the smooth contragredient,
  change of coefficients, the Grothendieck property with injectives, and smooth and compact
  induction: SmoothRepresentationsOfLocalGroups, targets *is-smooth*, *smooth-rep-category*,
  *compact-open-invariants*, *admissible*, *finiteness-conditions*, *smooth-dual*,
  *coefficient-change* (SR.0.1–SR.0.4), SR.0d.1, and *smooth-induction*, *compact-induction*,
  *frobenius-reciprocity*, *induction-exactness* (SR.2.1). The smooth-dual criterion of §1.6 is
  stated on SR's smooth contragredient; Suggested.lean carries a local copy of the smoothness
  predicate (`IsSmoothRep`, every vector has open stabiliser) and of the span of the smooth vectors
  of the full linear dual (`smoothDualSpan`) only so that its statements elaborate;
- the `GL₂(ℚ_p)` torsion categories, their admissibility (the `GL₂(ℚ_p)` specialisation of §0.1),
  local finiteness, the dual category and projective envelopes: PadicLocalLanglandsForGL2Qp
  §§2.1–2.3; the classification of irreducible mod `p` representations of `GL₂(ℚ_p)`, the Hecke
  operator `T` on `I(σ_r)`, `End_G(I(σ_r)) ≅ k[T]` and freeness: §2.7; the failures for `F ≠ ℚ_p`
  (non-finite-presentation of supersingulars): §2.9; blocks, the Gabriel decomposition and
  projective envelopes: §§5.1, 5.3; the finite-residue fundamental characters and the
  coefficient-linear torsion dual `Hom_𝒪(M, L/𝒪)` of a discrete torsion module: §0.3; Schikhof
  duality and admissible Banach representations: §0.1;
- Serre weights of `GL₂(F)` for every local field including `F = ℚ_p`, `I(σ) = c-Ind_{KZ}^G σ`,
  its Hecke algebra `k̄[T]` and freeness (`SerreWeight`, `compactInduction`, `heckeOperatorT`,
  `endEquivPolynomial`, `compactInduction_free`): FiniteFlatGroupsAndIntegralPadicHodgeTheory
  R07.5.15; for every finite `F/ℚ_p`, the Barthel–Livné classification of the non-supersingular
  irreducibles and the presentation of irreducible principal series and Steinberg twists by Hecke
  quotients of `I(σ)`: the same section (gap:barthel-livne-ordinary-classification,
  gap:ordinary-irreducible-hecke-presentation);
- ordinary parts as `N(𝒪)`-invariants with the transfer Hecke action of the positive torus,
  followed by localisation: PotentialAutomorphyInfrastructure §3.7 (`LocalOrdinaryParts`); their
  derived version on the derived smooth category: §3.12; §2.1 here keeps Emerton's right adjoint
  on admissible representations of `GL₂(F)`, built on the same Hecke action;
- Emerton's ordinary-parts functor `Ord_B` for `GL₂(ℚ_p)` with its adjunction
  `Hom_G(Ind_{B̄}^G U, V) ≅ Hom_T(U, Ord_B V)` on admissible representations over complete local
  coefficient rings: CompletedCohomologyAndLocalGlobalCompatibility §0.1; §2.1 here differs by
  allowing every finite `F/ℚ_p` (on torsion-admissible `𝒪`-representations) and proves that for
  `F = ℚ_p` it is that functor and that adjunction;
- noetherianity of completed group algebras of compact `p`-adic analytic groups, their freeness
  over open subgroups, the filtered-to-graded transfer of noetherianity and Auslander regularity,
  `p`-valuations, saturation and ordered bases, the weighted graded algebra of a `p`-valued group,
  Auslander regularity and global dimension without `p`-torsion, Lazard's exterior cohomology of
  uniform groups, and the grade `j_R(M)` with canonical dimension `δ_R(M) = gldim R − j_R(M)` and
  its finite-index invariance: NoncommutativeAndEquivariantIwasawa §§0.3, 0.5, 0.7, 0.8, 0.10,
  0.11, 0.13 and F.1;
- the growth `dim_k V^{U_r} ≍ [U:U_r]^{δ/d}` of invariants along the power filtration of a uniform
  group of dimension `d > 0`: CompletedCohomologyPartII §5.8; the admissible Banach lattice presentation:
  CompletedCohomologyPartII F.1;
- regular-sequence ideals and complete intersections: DeformationAndDerivedPatchingAlgebra §3.4;
  depth and Cohen–Macaulay rings, with the regular-sequence criterion:
  SchemeAndStackFoundations §0.17;
- the absolute local Artin map, its geometric normalisation, its behaviour on units and
  uniformisers and its norm functoriality: Tau Ceti (`TauCeti.ClassFieldTheory.geometricArtinMap`
  and the lemmas named in the supplier contracts), the interface of ClassFieldTheory Layer 7;
- finite-dimensional algebras, injective envelopes, socles, radicals and Krull–Schmidt:
  RepresentationTheory/QuiverRepresentations Layer 3;
- Brauer characters of a finite group, the pairing of simple modules with their projective covers
  (`dim Hom(P_σ, M) = [M : σ]` over a splitting field) and the comparison of the Brauer character of
  the reduction of a stable lattice with its ordinary character: GL2AutomorphicRepresentationsAndTransfer
  §R17.5.11. Brauer reciprocity and decomposition numbers for arbitrary finite groups are not part
  of this roadmap: §5.4 obtains the instance `[L ⊗ P̃_σ : V] = [V̄ : σ]` for `Γ = GL₂(k_F)` by
  composing that pairing with the pinned projective lifts below and Hom base change;
- completed group algebras, their level actions on finite quotients and their compact-module
  actions: Tau Ceti (`TauCeti.completedGroupAlgebra`,
  `TauCeti.completedGroupAlgebra.toQuotientEnd`, `TauCeti.IsCompactModule.completedGroupAlgebraModule`,
  `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean` and `.../Module.lean`);
  the action on a discrete smooth module that is not compact is assembled in §0.2; projective
  covers over a ring finite over an Artinian ring, in particular over a finite-dimensional algebra
  over a field: Tau Ceti (`TauCeti.exists_isProjectiveCover_of_finite`,
  `TauCeti/Algebra/Module/ProjectiveCover/Existence.lean`); lifting of projective modules along a
  complete principal ideal and their uniqueness: Tau Ceti
  (`TauCeti.exists_projective_quotient_smul_top_linearEquiv`,
  `TauCeti/Algebra/Module/Projective/Lift.lean`, and `Ideal.nonempty_linearEquiv_of_quotient_smul_top`,
  `TauCeti/Algebra/Module/Projective/Reduction.lean`); acyclicity of coinduced discrete
  modules in positive degrees: Tau Ceti (`TauCeti.ContCohomology.coindAcyclic`,
  `TauCeti/RepresentationTheory/Homological/ContCohomology/Coinduced/Acyclic.lean`); smooth
  discrete topological representations: Tau Ceti (`TauCeti.IsSmoothDiscrete`,
  `TauCeti.DiscreteRep`), compared with the untopologised predicate `IsSmoothRep` in the supplier
  contracts;
- continuous induction of continuous representations: Mathlib (`ContRepresentation.coind`,
  `Mathlib/RepresentationTheory/Continuous/Basic.lean`), used in §2.6.

No `p`-adic or mod `p` local Langlands correspondence for `GL₂(F)`, `F ≠ ℚ_p`, is asserted, and no
lower bound or equality for Gelfand–Kirillov dimension is part of this roadmap: the local theorem
of Layer 7 is an upper bound under explicit multiplicity hypotheses.

## Conventions

- `p` is a prime. `F/ℚ_p` is finite with integers `𝒪_F`, uniformiser `ϖ`, residue field `k_F`;
  `G = GL₂(F)`, `K = GL₂(𝒪_F)`, `Z` the centre, `B = TN` the upper Borel and `B̄` the lower Borel.
  `G′ = G/ϖ^ℤ` is the quotient by the subgroup generated by the scalar matrix `ϖ`, with the quotient
  topology; for `F = ℚ_p` this is `GL₂(ℚ_p)/p^ℤ`. In Suggested.lean it is `GL2ModScalar F ϖ`.
- `L/ℚ_p` is a second finite extension (coefficients), with integers `𝒪 = 𝒪_L`, maximal ideal
  `𝔪`, uniformiser `ϖ_L` and residue field `k`; `L` and `F` play different roles. In Layers 3–9 `k`
  is a finite field of characteristic `p` large enough to contain the images of all embeddings
  `k_F → k̄`.
- A representation is *smooth* if every vector has open stabiliser and, over `𝒪`, *torsion* if
  every vector is killed by a power of `p` (equivalently of `𝔪`). *Finite type* means finitely
  generated over the abstract group algebra (`Module.Finite` over `MonoidAlgebra`); *finite length*
  means finite length over the group algebra (`IsFiniteLength`), never over `𝒪`. A *finite
  `𝒪`-module* is a finitely generated one.
- For Layers 3–9, `F` is unramified of degree `f ≥ 1`, `q = p^f`, `J = ℤ/fZ` indexes the
  embeddings `σ_i = σ_0 ∘ Frob^i` of `k_F` into `k`, all indices are cyclic, and `K₁ = 1 + pM₂(𝒪_F)`,
  `I` the upper Iwahori, `I₁` its pro-`p` radical, `Z₁ = Z ∩ K₁`, `H = I/I₁` the residual torus.
  For a pro-`p` group `U`, `𝔪_U` is the augmentation ideal of `k[[U]]` and `V[𝔪_U^n]` the subspace
  killed by `𝔪_U^n`.
- Weights: `λ = ((a_i, b_i))_{i∈J}`, `r_i = a_i − b_i`, `F(λ) = ⊗_i (Sym^{r_i} k² ⊗ det^{b_i})^{(i)}`
  for `0 ≤ r_i ≤ p−1`, where `(i)` means the action through `σ_i`. `η_i = (1,0)` and `α_i = (1,−1)` in
  position `i`. Central weights `X⁰(T)` are the pairs `(c_i, c_i)`; the coordinate lattice
  `X*(T)/X⁰(T)` is `ℤ^J` with root sublattice `(2ℤ)^J`, and a root coordinate `ν = 2n` is lifted to
  the weight `((n_i, −n_i))`. Labelled finite-group weights are taken modulo `(p − π)X⁰(T)`, where
  `(πλ)_i = λ_{i−1}`. `λ` is *`N`-deep* when `N < r_i + 1 < p − N` for every `i`, that is
  `N ≤ r_i ≤ p − N − 2`.
- `χ_λ` is the character of `I` on the `I₁`-invariant line of `F(λ)`, and `χ^s` swaps its two
  diagonal entries. In characters `α_i(diag(a,d)) = σ_i(a/d)`.
- `V^∨` is the Pontryagin dual of a smooth torsion representation (PadicLocalLanglandsForGL2Qp §0.3)
  and, over `k`, the full linear dual with the topology of pointwise convergence; dual actions use
  `g ↦ (f ↦ f ∘ g⁻¹)`. `(−)_{K₁}` denotes coinvariants and `(−)^{K₁}` invariants.
- Endomorphism rings compose as functions, and `Hom(T_τ, T_σ)` is a right `End(T_τ)`-module by
  precomposition.
- Local class field theory: for `r ≥ 1` let `F′/F` be the unramified extension of degree `r`, with
  residue field `k_{F′}` of degree `f′ = rf` over `𝔽_p`, and assume that `k` contains the image of
  an embedding `σ′_0 : k_{F′} → k` extending `σ_0` (for `r = 2`, that `k` contains `𝔽_{p^{2f}}`).
  Since `I_F = I_{F′}`, the fundamental character `ω_{f′} : I_F → k^×` is the inverse of the
  geometric Artin map of `F′` on inertia (`TauCeti.ClassFieldTheory.geometricArtinMap` applied to
  `F′`: a uniformiser goes to geometric Frobenius, and `𝒪_{F′}^×` goes onto the image of inertia),
  followed by reduction `𝒪_{F′}^× → k_{F′}^×` and `σ′_0`. Its image has order `p^{f′} − 1`, and
  `ω_{f′}^{1 + q + ⋯ + q^{r−1}} = ω_f` by norm functoriality of the Artin maps (`q = p^f`). The
  Artin map of `F` alone gives only the niveau-`f` character. Over `ℚ_p`, `ω_1` is the reduction
  of the cyclotomic character on inertia. Witness: for `F = ℚ_p` and `u ∈ ℤ_p^×`, the arithmetic map
  satisfies `χ_cyc(artinMap u) = u⁻¹` (`TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_unit`),
  so `χ_cyc(geometricArtinMap u) = u`, and `ω_1` sends `geometricArtinMap u` to `ū`, the reduction
  of the same value; for `p = 5` and `u = 2` both give `2 ∈ 𝔽₅^×`, whereas the arithmetic
  normalisation would give `2⁻¹ = 3`.
- Prime bounds: the saturated Iwahori computations of Layer 4 and the extension calculus of
  Layers 5–7 assume `p > 3`; the multiplicity statement for `W_{χ,3}` in §5.1 assumes `p > 5`;
  the integral constructions of Layer 8 assume `p > 2`, `L/ℚ_p` unramified and `𝒪 = W(k)`. Every
  stronger depth or prime bound stated in a target is part of that target.
- Universes: all carriers live in one universe; the `ℚ_p` statements of Suggested.lean live in
  `Type`, where `ℚ_[p]` lives.

## Exact supplier contracts

### From Mathlib

- `Representation`, `Representation.asModule`, `Representation.stabilizer`
  (`Mathlib/RepresentationTheory/Basic.lean`, `.../Stabilizer.lean`): representations, their
  group-algebra module and vector stabilisers.
- `Representation.ind` and `Representation.IndV` (`Mathlib/RepresentationTheory/Induced.lean`):
  induction `A[G] ⊗_{A[U]} W` along `U.subtype`; for open `U` this is compact induction
  (SmoothRepresentationsOfLocalGroups *compact-induction* proves the comparison with the
  function model).
- `Representation.IntertwiningMap` with `ker`, and `Subrepresentation.toRepresentation`
  (`Mathlib/RepresentationTheory/Intertwining.lean`, `.../Subrepresentation.lean`).
- `Rep` (`Mathlib/RepresentationTheory/Rep/Basic.lean`): bundled representations, used for the
  finite-length modules `W_i` of a presentation.
- `IsFiniteLength`, `Module.length`, `IsSemisimpleModule`, `Module.Finite`,
  `Module.IsTorsion'`, `Module.Dual`, `Submodule.span`.
- `IsNonarchimedeanLocalField` with `𝒪[K]` and `𝓀[K]` (`Mathlib/NumberTheory/LocalField/Basic.lean`,
  `Mathlib/Topology/Algebra/Valued/ValuativeRel.lean`), the instance for `ℚ_[p]`
  (`Mathlib/NumberTheory/Padics/LocalField.lean`); `GL (Fin 2) F` with the topology of units of
  the matrix ring; quotient groups with the quotient topology
  (`Mathlib/Topology/Algebra/Group/Quotient.lean`); `Subgroup.normalClosure`; `OpenSubgroup`.
- `MvPolynomial`, `Ideal.span`, `Ideal.Quotient.mk`, `ringKrullDim`,
  `MvPolynomial.ringKrullDim_of_isNoetherianRing_of_finite`
  (`Mathlib/RingTheory/KrullDimension/Polynomial.lean`) and `RingTheory.Sequence.IsRegular`
  (`Mathlib/RingTheory/Regular/RegularSequence.lean`) for §4.5.
- `ContRepresentation`, `ContRepresentation.coindV` and `ContRepresentation.coind`
  (`Mathlib/RepresentationTheory/Continuous/Basic.lean`): for a continuous homomorphism
  `φ : B → G` of topological groups and a continuous representation `π` of `B` on a topological
  module `V`, the submodule of `C(G, V)` (compact-open topology) of functions with
  `f(φ(b)g) = π(b) f(g)`, with `G` acting by right translation. Used in §2.6 with `φ` the inclusion
  `B̄ → G`; the library's functoriality in `π` is for `ContRepresentation.coind₁` only
  (`ContRepresentation.coind₁Map`), not for `coind` along `φ`, and it has no comparison with smooth
  induction.
  A `ContRepresentation` is a homomorphism to continuous linear endomorphisms and includes no
  continuity in the group variable, so §2.6 adds joint continuity as a hypothesis.
  `ContIntertwiningMap` (same file): continuous equivariant linear maps.
- `IsModuleTopology` (`Mathlib/Topology/Algebra/Module/ModuleTopology.lean`): the canonical
  topology of a module over a topological ring, on a finite `𝒪`-module the `ϖ_L`-adic one;
  `Subrepresentation.quotient` (`Mathlib/RepresentationTheory/Subrepresentation.lean`);
  `NormedSpace`, `CompleteSpace` and `Bornology.IsBounded` for the Banach space and lattice of §2.6.

### From Tau Ceti

- `TauCeti.completedGroupAlgebra` with its projections `TauCeti.completedGroupAlgebra.proj` to the
  group algebras `R[Γ ⧸ U]` of the finite quotients and `TauCeti.completedGroupAlgebra.of`
  (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean`); the level action
  `TauCeti.completedGroupAlgebra.toQuotientEnd` (`.../Module.lean`): for a module `M` with an action
  of `Γ`, a `Γ`-stable submodule `V` and an open normal subgroup `U` acting trivially on `M ⧸ V`,
  the algebra map `R[[Γ]] → End_R(M ⧸ V)` through `R[Γ ⧸ U]`, independent of `U`
  (`TauCeti.completedGroupAlgebra.toQuotientEnd_eq`), extending the action of `Γ`
  (`TauCeti.completedGroupAlgebra.toQuotientEnd_of`) and compatible with the factor maps
  (`TauCeti.completedGroupAlgebra.factor_toQuotientEnd`); and
  `TauCeti.IsCompactModule.completedGroupAlgebraModule` (`.../Module.lean`): the `R[[Γ]]`-module
  structure on a compact `R`-module with a continuous action of a compact group `Γ`, `R` a compact
  ring. The compact-module structure does not apply
  to a discrete smooth module that is not compact, such as an infinite direct sum of trivial lines;
  the action on such a module is assembled from level actions in §0.2.
- `TauCeti.exists_isProjectiveCover_of_finite`
  (`TauCeti/Algebra/Module/ProjectiveCover/Existence.lean`): for an Artinian ring `K` and a ring
  `A` that is a finite `K`-module with `K` acting through `A` (`IsScalarTower K A A`), every
  `A`-module has a projective cover, with no finiteness asked of the module; applied with `K = k`
  a field and `A = k[GL₂(k_F)]`, a finite-dimensional algebra, it gives `P_σ = Proj_{GL₂(k_F)} σ`.
  It gives no cover in a pseudocompact category; that is §4.6 here.
- `TauCeti.exists_projective_quotient_smul_top_linearEquiv`
  (`TauCeti/Algebra/Module/Projective/Lift.lean`): for a commutative ring `R`, `r ∈ R`, an
  `R`-algebra `A` and a projective `A`-module `N` whose endomorphism ring is `(r)`-adically
  complete, every direct summand of `N ⧸ rN` is `X ⧸ rX` for a projective submodule `X` of `N`.
  Applied with `R = 𝒪` a complete discrete valuation ring, `r = ϖ_L`, `A = 𝒪[Γ]` for a finite group
  `Γ` and `N = A^n` (its endomorphism ring is finite over `𝒪`, hence `ϖ_L`-adically complete), it
  lifts every finitely generated projective `k[Γ]`-module.
- `Ideal.nonempty_linearEquiv_of_quotient_smul_top`
  (`TauCeti/Algebra/Module/Projective/Reduction.lean`): for an ideal `I` in the Jacobson radical of
  a ring `A` and projective `A`-modules with coatomic submodule lattices (finitely generated ones),
  an isomorphism of the reductions modulo `I` implies an isomorphism of the modules. Applied with
  `A = 𝒪[Γ]` and `I = ϖ_L 𝒪[Γ]`, which lies in the Jacobson radical because `𝒪[Γ]` is finite over the
  local ring `𝒪` (Nakayama), it makes the lift unique up to isomorphism.
- `TauCeti.ContCohomology.coindAcyclic`
  (`TauCeti/RepresentationTheory/Homological/ContCohomology/Coinduced/Acyclic.lean`): for a
  compact topological group `U` and a discrete module `A`, the continuous cohomology
  `H^n(U, Coind_1^U A)` vanishes for `n > 0`; used in §2.2 with `U = N₀`, where `Coind_1^{N₀} A`
  is the module `C^∞(N₀, A)` of locally constant functions with `N₀` acting by translation.
- `TauCeti.IsSmoothDiscrete`, `TauCeti.DiscreteRep` and `TauCeti.isSmoothDiscrete_iff_continuousSMul`
  (`TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean`): an object
  of Mathlib's `TopRep R G` is smooth discrete when its module is discrete and every point
  stabiliser is open, and for a discrete module this is continuity of the action map
  `G × V → V`; `TauCeti.DiscreteRep R G` bundles a discrete `G`-module with continuous action,
  over a topological coefficient ring `R` whose scalar action is continuous. These carry a
  topology on the module and on the coefficients. The statements here are made on Mathlib's
  `Representation` with no topology on the module, where smoothness is the predicate `IsSmoothRep`
  (every vector has open stabiliser) of SmoothRepresentationsOfLocalGroups *is-smooth*; giving the
  module the discrete topology, `IsSmoothRep ρ` is exactly the stabiliser condition of
  `TauCeti.IsSmoothDiscrete`. Over `𝒪` with its `ϖ_L`-adic topology the continuity of the scalar
  action on a discrete module says that every vector is torsion, so a `TauCeti.DiscreteRep` over
  `𝒪` is a smooth torsion representation.
- `TauCeti.ClassFieldTheory.geometricArtinMap`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/GeometricArtinMap.lean`): for a nonarchimedean
  local field `K`, the absolute local Artin map `Kˣ → G_K^ab` followed by inversion, so that a
  uniformiser goes to a geometric Frobenius
  (`TauCeti.ClassFieldTheory.isArithFrobeniusLift_inv_of_mk_eq_geometricArtinMap_uniformizer`), a
  unit goes into inertia (`TauCeti.ClassFieldTheory.mem_inertiaSubgroup_of_mk_eq_geometricArtinMap`),
  and the map is functorial for the norm of a finite extension
  (`TauCeti.ClassFieldTheory.geometricArtinMap_norm`). The units of `K` map onto the image of the
  inertia subgroup in `G_K^ab` (`TauCeti.ClassFieldTheory.map_artinMap_unitFiltration_zero`,
  `.../Local/Unramified.lean`, for the arithmetic map, whose image on the group of units is the
  same), and for `K/ℚ_p` finite the cyclotomic character of the arithmetic image of a unit `u` is
  `N_{K/ℚ_p}(u)⁻¹` (`TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_unit`,
  `.../Local/ExplicitCyclotomicSymbol/ArtinMap.lean`). These are the interface of ClassFieldTheory
  Layer 7. Used for the fundamental characters of the Conventions and the tame parameter of §3.4.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

- SR.0.1–SR.0.4: *is-smooth*, *smooth-rep-category*, *smooth-rep-abelian*,
  *compact-open-invariants*, *admissible*, *finiteness-conditions*, *smooth-dual*,
  *coefficient-change*, *smooth-centre*. Assumed: the smooth category over a commutative ring is
  abelian, invariants under compact opens are a functor, the smooth contragredient is the smooth
  part of the algebraic dual with the inverse action.
- SR.0d.1: the smooth category is Grothendieck abelian with enough injectives; used for injective
  envelopes of smooth representations of compact groups in §§4.6 and 5.6.
- SR.2.1: *smooth-induction* (unnormalised, right translation), *compact-induction* (with the
  identification of `c-Ind_U^G` with Mathlib's induction for open `U`), *frobenius-reciprocity*,
  *induction-exactness*, *mackey-filtration*. Used for `c-Ind`, `Ind_{B̄}^G` and Frobenius
  reciprocity throughout.

### From TauCetiRoadmap.PadicLocalLanglandsForGL2Qp

- §0.1: Schikhof duality and admissible unitary Banach representations; used in §2.6 here.
- §0.3: the coefficient-linear torsion dual `Hom_𝒪(M, L/𝒪)` of a discrete torsion `𝒪`-module,
  with exactness, biduality and contragredient action; the finite-residue fundamental characters
  of every level with Frobenius powers and norm compatibility; used in §§0.1, 1.6, 3.4 and 4.1
  here.
- §§2.1–2.3: the `GL₂(ℚ_p)` torsion categories with central character, local finiteness, the dual
  category `C_{G,ζ}(𝒪)` and its projective envelopes.
- §2.6: mod `p` principal series `Ind_B^G(δ₁ ⊗ δ₂)` of `GL₂(ℚ_p)`, irreducible exactly when
  `δ₁ ≠ δ₂`, and `Ind_B^G(χ ⊗ χ)` an extension of `St ⊗ χ∘det` by `χ∘det`; used in a Check of
  §2.6 here.
- §2.7: the classification of absolutely irreducible smooth representations of `GL₂(ℚ_p)` with
  central character as the `Π(r, λ, χ)`; their admissibility and finite presentation; Galois
  descent of irreducibles. The Serre weights, the compact induction and the Hecke operator it
  uses are the declarations of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15 below.
- §2.9: supersingular representations of `GL₂(F)`, `F ≠ ℚ_p`, are not finitely presented.
- §5.1: blocks with fixed central character and finite block support of finite-length objects
  (used by §1.4); §5.3: projective envelopes.
- What PadicLocalLanglandsForGL2Qp must provide (gap:ext1-finite-length-into-compact-induction):
  for `G′ = GL₂(ℚ_p)/p^ℤ`, a smooth finite-length `k[G′]`-representation `π` and a Serre weight
  `σ`, the space `Ext¹_{G′}(π, I(σ))` is finite-dimensional over `k`, for every prime `p`
  including `p = 2, 3` (DEG, Lemma 4.2.1, proves it for `p ≥ 5`), in §2.7.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

- R07.5.15: Serre weights `σ` of `GL₂(F)` as irreducible smooth `k̄[KZ]`-modules with central
  character (`SerreWeight`), `I(σ) = c-Ind_{KZ}^G σ` (`compactInduction`), the Hecke operator
  `T` supported on `KZ diag(1,ϖ)^{±1} KZ` (`heckeOperatorT`), `End_G(I(σ)) ≅ k̄[T]`
  (`endEquivPolynomial`), freeness of `I(σ)` over `k̄[T]` (`compactInduction_free`), for every
  `F` including `F = ℚ_p`. A *supersingular* representation of `GL₂(F)` is an irreducible
  quotient of `I(σ)/(T)` for some Serre weight `σ` (CDN23, §1.2.1, p. 11).
- What FiniteFlatGroupsAndIntegralPadicHodgeTheory must provide (gap:barthel-livne-finite-codimension):
  for a Serre weight `σ` of `GL₂(F)` and a nonzero `G`-subrepresentation `π′ ⊆ I(σ)`, the
  `I₁`-invariants `(π′)^{I₁}` have finite codimension in `I(σ)^{I₁}` (BARTHEL-LIVNE94, Proposition
  18), in R07.5.15.
- What FiniteFlatGroupsAndIntegralPadicHodgeTheory must provide (gap:barthel-livne-ordinary-classification):
  for every finite `F/ℚ_p`, every irreducible smooth `k̄[GL₂(F)]`-module with central character
  that is not supersingular is a character `χ∘det`, a twist `St ⊗ χ∘det` of the Steinberg
  representation or a principal series `Ind_B^G(χ₁ ⊗ χ₂)` with `χ₁ ≠ χ₂`, where `χ, χ₁, χ₂` are
  smooth characters `F^× → k̄^×` (BARTHEL-LIVNE94, Theorems 33–34 and Corollary 36, as cited in
  HU12, p. 16, and BP12, proof of Corollary 6.9, p. 44; CDN23, §1.2.1, pp. 11–12), in R07.5.15.
- What FiniteFlatGroupsAndIntegralPadicHodgeTheory must provide (gap:ordinary-irreducible-hecke-presentation):
  for every finite `F/ℚ_p`, every principal series `Ind_B^G(χ₁ ⊗ χ₂)` with `χ₁ ≠ χ₂` and every
  twist `St ⊗ χ∘det`, for smooth characters `χ, χ₁, χ₂ : F^× → k̄^×`, is the quotient of
  `I(σ) ⊗ (χ′∘det)` by a finitely generated `G`-subrepresentation, for some Serre weight `σ` and
  some smooth character `χ′ : F^× → k̄^×`: for the principal series the subrepresentation is the
  image of `T − λ` with `λ ≠ 0`, and for the Steinberg twist it is that image (with `σ` of
  dimension `q`) together with one further vector (BARTHEL-LIVNE94, Theorem 30, as used in HU12,
  proof of Théorème 3.27, p. 29; CDN23, §1.2.3, p. 12, and HU12, §5.1, p. 42, record the resulting
  finite presentation), in R07.5.15.

### From TauCetiRoadmap.PotentialAutomorphyInfrastructure

- §3.7 `LocalOrdinaryParts`: `N(𝒪)`-invariants with the transfer Hecke action
  `t·v = Σ_{n ∈ N(𝒪)/tN(𝒪)t⁻¹} n t v` of the positive torus monoid, its localisation and
  functoriality. Used for `GL₂` at a single place, with `N₀ = N(𝒪_F)` and `T⁺` the monoid
  contracting `N₀`.
- §3.12 (derived ordinary comparison): the derived functor `RΓ(N(𝒪), −)` on the bounded-below
  derived smooth category with its Hecke action, followed by the localisation; used for the
  cohomological ordinary parts `H^•Ord_B` of §2.2.

### From TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility

- §0.1: for `G = GL₂(ℚ_p)` and a complete local noetherian `𝒪`-algebra `A` with finite residue
  field, the `ϖ`-adically admissible category and Emerton's ordinary-parts functor `Ord_B` on it,
  right adjoint to unnormalised induction from the opposite Borel,
  `Hom_G(Ind_{B̄}^G U, V) ≅ Hom_T(U, Ord_B V)`. Assumed: with `A = 𝒪`, every smooth admissible
  representation killed by a power of `ϖ_L` is an object of that category, and `Ord_B` is the
  locally `Z_T`-finite part of `Hom_{𝒪[T⁺]}(𝒪[T], V^{N₀})`. Used in §2.1 for `F = ℚ_p`.

### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa

- §F.1: left and right noetherianity of `𝒪[[U]]` and `k[[U]]` for compact `p`-adic analytic `U`;
  the canonical topology on finite modules; `iwasawaGrade`, the coefficient shift and the
  finite-index grade comparison (restriction along an open inclusion preserves grade).
- §0.3: completed group algebras are free of finite rank over the completed algebra of an open
  subgroup, on both sides.
- §0.5: complete filtrations with noetherian graded ring lift noetherianity, domain, global
  dimension and (under the closure condition) Auslander regularity with `j_R(M) = j_{gr R}(gr M)`.
- §§0.7–0.8: `p`-valuations, finite rank, saturation and ordered bases; the weighted graded algebra
  `gr_ω 𝒪[[G]] ≅ gr 𝒪 ⊗_{𝔽_p[P]} U(gr G)` for a finite-rank `p`-valued `G` with ordered basis.
- §§0.10–0.11: Auslander regularity and global dimension `d` of `k[[G]]` for compact analytic `G`
  of dimension `d` without `p`-torsion, and (§0.11) the canonical dimension `gldim(R) − j_R(M)` of
  a nonzero finite module, with value `−∞` on the zero module, independent of the open uniform
  subgroup.
- §0.13: `H*(U, 𝔽_p) ≅ ∧* H¹(U, 𝔽_p)` for uniform `U`, with `dim H¹ = d`.

### From TauCetiRoadmap.CompletedCohomologyPartII

- §5.8: for torsion-free uniform `U` of dimension `d > 0`, a nonzero finite `k[[U]]`-module `M` of
  canonical dimension `δ` and `V = M^∨`, `dim_k V^{U^{p^r}}` lies between positive constants times
  `[U : U^{p^r}]^{δ/d}`.
- F.1: the lattice presentation of admissible unitary Banach representations (finite residual
  invariants exactly when the Schikhof dual is finite over `𝒪[[K]]`), and independence of the
  stable lattice.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

- §3.4: regular-sequence ideals and complete intersections; used for the crossing algebra of
  §4.5.

### From TauCetiRoadmap.SchemeAndStackFoundations

- §0.17: depth, Cohen–Macaulay modules and rings over Noetherian rings, Cohen–Macaulayness of
  polynomial rings, and the criterion that a module is Cohen–Macaulay when its quotient by a
  regular sequence is; used for the crossing algebra of §4.5.

### From TauCetiRoadmap.RepresentationTheory.QuiverRepresentations

- Layer 3: finite-dimensional algebras, Jacobson radical, socle and radical series, injective
  envelopes and projective covers, Krull–Schmidt, and duality between left and right modules; used
  for `GL₂(k_F)`-modules and for the finite-dimensional algebras `k[[K/Z₁]]/𝔪_{K₁}²` and
  `k[[I/Z₁]]/𝔪_{I₁}^n`.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

- §R17.5.11: for a finite group `Γ` and an algebraically closed field of characteristic `p`, Brauer
  characters, their additivity, the pairing `dim Hom(P_σ, M) = [M : σ]` of a simple module `σ` with
  its projective cover, and, for a splitting modular system, the equality of the Brauer character of
  the reduction of a stable lattice with its ordinary character on `p`-regular elements, so that the
  composition factors of the reduction do not depend on the lattice. Used in §5.4 for
  `Γ = GL₂(k_F)`, over a finite splitting field `k` after base change to `k̄` (§0.6).

## How to read the build

Layer 0 sets up the finiteness notions for smooth torsion representations of a `p`-adic Lie group
and proves coherence for `GL₂(F)/ϖ^ℤ`. Layer 1 specialises to `F = ℚ_p` and proves the three
finite-length criteria, using the `GL₂(ℚ_p)` classification. Layer 2 treats admissible finitely
presented representations for every `F`, and for `F ≠ ℚ_p` approximates them by inductions of
their ordinary parts. Layers 3–9 assume `F` unramified. Layer 3 fixes the weight coordinates, the
tame weight set and the Diamond modules. Layer 4 defines Gelfand–Kirillov dimension, computes the
graded algebra of the pro-`p` Iwahori subgroup and proves the Iwahori dimension criterion.
Layers 5 and 6 compute finite and first-order extensions and build the multiplicity-preserving
enlargements of Diamond boxes. Layer 7 proves multiplicity one through the third Iwahori layer and
the local dimension bound. Layers 8 and 9 build the gluing lattice from a projective cover of the
finite group, identify its reduction with the first-order projective truncation, and compute
its endomorphisms. Layers 0–2 and Layers 3–9 are independent except for §0.6, used in §§5.4 and 9.1;
inside Layers 3–9 the Gelfand–Kirillov chain (Layers 4, 6, 7) and the lattice chain (Layers 8–9)
share Layers 3 and 5.

## Layer 0: Smooth finiteness and augmented Iwasawa algebras

Throughout this layer `H` is a `p`-adic Lie group (in the applications `G`, `G′`, `SL₂(F)` or the
subgroup `G₀ = {g ∈ G : det g ∈ 𝒪_F^×}`), and representations are `𝒪`-linear.

### 0.1 Torsion admissibility

Define `IsTorsionAdmissible p ρ` for a representation `ρ` of a topological group on a module `V`
over a commutative ring `A` (in this roadmap `A = 𝒪`): for every compact open subgroup `U` and
every `j ≥ 0`, the submodule `V^U[p^j]` of vectors fixed by `U` and killed by `p^j` has finite
length over `A`. Since `p` and `ϖ_L^e` generate the
same ideal, this is Colmez–Dospinescu–Nizioł's condition that every `V^U[𝔪^j]` has finite length
(CDN23, §1.1.2, p. 10). Call a smooth torsion `V` *locally admissible* when every cyclic
subrepresentation `𝒪[H]v` is torsion-admissible. The notion differs from SmoothRepresentationsOfLocalGroups
*admissible*, which asks `V^U` to be finitely generated: the divisible module `L/𝒪` with trivial
action is torsion-admissible and not admissible in that sense. For `H = GL₂(ℚ_p)` with fixed
central character it is the admissibility of PadicLocalLanglandsForGL2Qp §2.1. *Needs:* Mathlib
`IsFiniteLength`, `OpenSubgroup`; SmoothRepresentationsOfLocalGroups *is-smooth*,
*compact-open-invariants*.

API:

- If `p^a` kills `V`, then `V` is torsion-admissible exactly when every `V^U` is a finitely
  generated `𝒪`-module, that is, when `V` is admissible over `𝒪/p^a` in the sense of
  SmoothRepresentationsOfLocalGroups *admissible* (CDN23, §1.1.2, p. 10).
- It suffices to test `U` in one neighbourhood basis of compact open subgroups, since
  `V^{U′}[p^j] ⊆ V^{U}[p^j]` for `U ⊆ U′` and `𝒪` is noetherian.
- Torsion admissibility passes to subrepresentations (invariants of a subrepresentation are a
  submodule) and to finite direct sums; for `H` a `p`-adic Lie group it passes to quotients of
  smooth torsion representations, because the Pontryagin dual of a quotient is a submodule of the
  dual, which is finite over the noetherian `𝒪[[U]]` by the next statement.
- For compact `H` and smooth torsion `V`, `V` is torsion-admissible exactly when its Pontryagin dual
  `V^∨` is a finitely generated `𝒪[[U]]`-module for one (equivalently every) compact open `U`
  (topological Nakayama applied to `V^∨/𝔪`, with `(V^∨/𝔪)^∨ = V[𝔪]`; the `GL₂(ℚ_p)` case is
  PadicLocalLanglandsForGL2Qp §2.3).
- Local admissibility can be checked on cyclic subrepresentations, and a finite sum of locally
  admissible subrepresentations is locally admissible.

**Checks.**

- For `H` trivial, `L/𝒪` is torsion-admissible: `(L/𝒪)[p^j]` has length `j·e` over `𝒪`, although
  `L/𝒪` is not a finite `𝒪`-module. A definition requiring finite length of all of `V^U` would
  reject it.
- An infinite direct sum of copies of `k` with trivial action is not torsion-admissible: already
  `V^H[p]` has infinite length.
- Every finite-length `𝒪`-module with a smooth action is torsion-admissible and locally
  admissible; in particular the zero representation is.
- For `H = GL₂(ℚ_p)` and `V = c-Ind_{KZ}^G σ` over `k`, `V^{I₁}` is infinite-dimensional, so `V` is
  not torsion-admissible, while the Steinberg representation (infinite-dimensional) is.

### 0.2 The augmented Iwasawa algebra

For a compact open subgroup `U ⊆ H` put `𝒪⟨H⟩ = 𝒪[H] ⊗_{𝒪[U]} 𝒪[[U]]`, a left `𝒪[H]`-module. Prove
that it carries a unique associative `𝒪`-algebra structure for which `𝒪[H] → 𝒪⟨H⟩` and
`𝒪[[U]] → 𝒪⟨H⟩` are algebra maps; that for another compact open `U′` there is a canonical
algebra isomorphism compatible with both maps; and that the `𝒪[H]`-action on a smooth torsion
representation extends uniquely to an `𝒪⟨H⟩`-module structure, functorially (SHOTTON20,
Proposition 3.2 (Kohlhaase) and Lemma 3.5; CDN23, §1.1.1, p. 10). Multiplication is the crossed
product given by coset representatives of `H/U`, not the componentwise product of the tensor
factors. Prove that `𝒪⟨H⟩` is flat as a right `𝒪[[U]]`-module (SHOTTON20, Lemma 3.3).

The `𝒪[[U]]`-action on a smooth torsion `V` is assembled here, without asking `V` to be compact.
For `v ∈ V` the `𝒪[U]`-span `M_v` of `v` is finite: the orbit `Uv` is finite, `U` being compact
and the stabiliser of `v` open, and each `𝒪u·v` is finite, `u·v` being torsion and `k` finite. The
kernel `U_v` of `U` on `M_v` is open and normal in `U`, and the level action
`TauCeti.completedGroupAlgebra.toQuotientEnd` (with the zero submodule of `M_v`) lets `𝒪[[U]]` act on
`M_v` through `𝒪[U/U_v]`, independently of `U_v`. For `M_v ⊆ M_w` both actions are those of the
image of `x ∈ 𝒪[[U]]` in `𝒪[U/U′]`, `U′ = U_v ∩ U_w`, so they agree on `M_v`. The union of these
actions is an `𝒪[[U]]`-module structure on `V = ⋃_v M_v`, and it is the only one in which each
`x` acts on each `M_v` through the finite quotients. *Needs:* Tau Ceti `TauCeti.completedGroupAlgebra`
and `TauCeti.completedGroupAlgebra.toQuotientEnd`; NoncommutativeAndEquivariantIwasawa §0.3;
SmoothRepresentationsOfLocalGroups *is-smooth*.

API:

- For compact `H` (take `U = H`) the algebra is `𝒪[[H]]`.
- The comparison isomorphisms for `U, U′, U″` satisfy the cocycle identity, so `𝒪⟨H⟩` is
  independent of `U` up to unique isomorphism.
- An `H`-equivariant `𝒪`-linear map between smooth torsion representations is `𝒪⟨H⟩`-linear for
  the extended structures, and every `𝒪⟨H⟩`-module on which `𝒪[[U]]` acts through finite
  quotients on each vector arises this way.
- As a right `𝒪[[U]]`-module `𝒪⟨H⟩` is free on a set of coset representatives of `H/U`.

**Checks.**

- For `H = {1}` the algebra is `𝒪`, and the extended action on a torsion module is its given scalar
  action.
- For discrete `H` and `U = {1}`, `𝒪⟨H⟩ = 𝒪[H]`, including its noncommutative multiplication when
  `H` is nonabelian: in `𝒪[S₃]`, `[(12)][(23)] = [(123)]` while `[(23)][(12)] = [(132)]`.
- For `H = ℤ_p ⋊ C₂`, with the generator `s` of `C₂` acting on `ℤ_p` by `x ↦ −x`, and `U = ℤ_p`,
  `𝒪⟨H⟩` is free on `{1, s}` as a right `𝒪[[T]]`-module, `T = [1] − 1`, and the crossed product gives
  `sTs⁻¹ = [−1] − 1 = (1 + T)⁻¹ − 1 = −T + T² − T³ + ⋯`; a multiplication in which the two tensor
  factors commute would give `sTs⁻¹ = T`, which differs already in the coefficient of `T` (and, for
  `p = 2` after reduction modulo `𝔪`, in that of `T²`).
- For `H = ℚ_p` and `U = ℤ_p`, `𝒪⟨H⟩ = 𝒪[ℚ_p] ⊗_{𝒪[ℤ_p]} 𝒪[[ℤ_p]]` is a free right
  `𝒪[[ℤ_p]] ≅ 𝒪[[T]]`-module on representatives of `ℚ_p/ℤ_p`. On the smooth representation
  `k[ℚ_p/ℤ_p]`, where `ℤ_p` fixes every coset, the extended action of `𝒪[[ℤ_p]]` factors through the
  augmentation and `T = [1] − 1` acts by zero.
- For `H = U = ℤ_p` and the discrete `V = ⊕_{n∈ℕ} k` with trivial action, `V` is infinite and not
  compact, so the compact-module structure of Tau Ceti does not apply to it; the assembled action
  is the augmentation action on each finite `M_v` and hence on `V`: `T` acts by zero.

### 0.3 Finite presentation in the smooth category

Define `IsFinitelyPresented ρ` for a representation `ρ` of a topological group `H` over a
commutative ring `A`: there are compact open subgroups `U₁, U₂`, smooth representations `W₁, W₂` of
`U₁, U₂` on `A`-modules of finite length, and an exact sequence of `A[H]`-modules
`c-Ind_{U₁}^H W₁ → c-Ind_{U₂}^H W₂ → V → 0` (CDN23, §1.1.2, p. 10; SHOTTON20, Definition 2.3). It
is not finite presentation over the abstract group algebra `A[H]`. Finite type is
`Module.Finite` over `MonoidAlgebra A H`. Prove, for smooth torsion `V` over `𝒪`: `V` is of finite
type exactly when it is a quotient of one `c-Ind_U^H W` with `W` of finite length, exactly when it
is a finitely generated `𝒪⟨H⟩`-module; and `V` is finitely presented exactly when it is a finitely
presented `𝒪⟨H⟩`-module (SHOTTON20, Lemmas 2.4 and 3.6, Proposition 3.8; CDN23, §1.1.2, p. 10).
*Needs:* §0.2; SmoothRepresentationsOfLocalGroups *compact-induction*; Mathlib
`Representation.ind`; NoncommutativeAndEquivariantIwasawa §F.1 (noetherianity of `𝒪[[U]]`).

API:

- `c-Ind_U^H W ≅ 𝒪⟨H⟩ ⊗_{𝒪[[U]]} W` for a smooth finite-length `W`; since `𝒪[[U]]` is noetherian,
  `W` is finitely presented over it, so `c-Ind_U^H W` is finitely presented over `𝒪⟨H⟩`.
- A finitely presented representation is smooth and torsion (a quotient of a compact induction of
  a smooth finite-length module).
- For an open subgroup `H′ ⊆ H` of finite index, `V` is of finite type, respectively finitely
  presented, exactly when its restriction to `H′` is (SHOTTON20, Lemma 2.8; CDN23, Remarque
  1.4(ii)).

**Checks.**

- For `H = {1}`, a torsion `𝒪`-module is finitely presented in this sense exactly when it has
  finite length: the compact inductions are finite-length modules and `𝒪` is noetherian. An
  infinite direct sum of copies of `k` is not.
- For `W` of finite length, `c-Ind_U^H W` is finitely presented, by the sequence
  `0 → c-Ind_U^H W → c-Ind_U^H W → 0`.
- The zero representation is finitely presented, with `W₁ = W₂ = 0`.
- For `H = ℚ_p` over `k`, the representation `k[ℚ_p/ℤ_p] = c-Ind_{ℤ_p}^{ℚ_p} k` is finitely
  presented, but it is not finitely presented over the abstract group algebra `k[ℚ_p]`: the
  augmentation kernel of `k[ℚ_p] → k[ℚ_p/ℤ_p]` is generated by `[x] − 1`, `x ∈ ℤ_p`, and is not
  finitely generated, `ℤ_p` not being finitely generated as an abstract group.

### 0.4 Exact-sequence and finite-index calculus

Let `0 → V₁ → V₂ → V₃ → 0` be an exact sequence of smooth torsion representations of `H`. Prove:
finite type is stable under extensions and quotients; if `V₁, V₃` are finitely presented then so
is `V₂`; if `V₂` is finitely presented and `V₁` of finite type then `V₃` is finitely presented;
if `V₂` is of finite type and `V₃` finitely presented then `V₁` is of finite type (CDN23,
Proposition 1.2, p. 11; SHOTTON20, Lemmas 2.6–2.7). With the finite-index statement of §0.3, the
same holds after restriction to a finite-index open subgroup. *Needs:* §0.3;
SmoothRepresentationsOfLocalGroups *induction-exactness*, *mackey-filtration*.

**Checks.**

- A subrepresentation of a finitely presented representation need not be finitely presented:
  for `H = G′` and `F ≠ ℚ_p`, a supersingular irreducible quotient of `c-Ind_{KZ}^{G} σ` is not
  finitely presented (PadicLocalLanglandsForGL2Qp §2.9), so its kernel, a subrepresentation of the
  finitely presented `c-Ind_{KZ}^{G} σ`, is not even of finite type, by the third assertion above.
- For `0 → c-Ind_U^H W → c-Ind_U^H W ⊕ c-Ind_U^H W → c-Ind_U^H W → 0` all three terms are finitely
  presented, as the second assertion requires.

### 0.5 Coherence for amalgams of compact open groups

Let `H` be a `p`-adic Lie group which is an amalgam `U₁ *_{U₀} U₂` of two compact open subgroups
over their intersection. Prove that `𝒪⟨H⟩ ≅ 𝒪[[U₁]] *_{𝒪[[U₀]]} 𝒪[[U₂]]`, and that this amalgam is
left coherent: the completed group algebras are noetherian (hence coherent), and each is free over
`𝒪[[U₀]]`, so Åberg's theorem on amalgams of coherent rings over a noetherian ring applies
(SHOTTON20, Propositions 4.1–4.3, Corollary 4.4). Hence the finitely presented smooth torsion
representations of `H` form an abelian subcategory: kernels and cokernels of maps between them are
finitely presented (SHOTTON20, Theorem 4.5; CDN23, Proposition 1.3, p. 11). By Ihara's theorem
`SL₂(F) = SL₂(𝒪_F) *_{I∩SL₂} αSL₂(𝒪_F)α⁻¹` (SERRE-TREES, Chapter II, §1.4, Corollaire 1) and
`G₀ = K *_I αKα⁻¹` with `α = diag(1, ϖ)` (the same §1.4, Théorème 3), the amalgamated subgroup
being `K ∩ αKα⁻¹ = I`, the upper Iwahori subgroup (lower-left entry in `ϖ𝒪_F`); since `G₀` has
finite index in `G′`, the finite-index calculus gives the headline statement.

Prove `isFinitelyPresented_ker`: for `F/ℚ_p` finite with uniformiser `ϖ` and `L/ℚ_p` finite with
the same residue characteristic, the kernel of an intertwining map between finitely presented
`𝒪_L`-representations of `G′ = GL₂(F)/ϖ^ℤ` is finitely presented (SHOTTON20, Theorem 4.5,
Corollary 5.2 and Lemma 2.8; CDN23, Proposition 1.3 and Remarque 1.4(ii)). The conclusion is
coherence, not noetherianity: `𝒪⟨G′⟩` is not noetherian. *Needs:* §§0.2–0.4;
NoncommutativeAndEquivariantIwasawa §F.1 (noetherianity of `𝒪[[U]]`) and §0.3 (freeness over
open subgroups); the amalgam
decompositions of SERRE-TREES, Chapter II, §1.4 (Théorème 3 and Corollaire 1), cited by
SHOTTON20, §5.

**Checks.**

- For `H` compact (a degenerate amalgam with `U₁ = U₀`), `𝒪⟨H⟩ = 𝒪[[H]]` is noetherian, and
  coherence is the familiar statement for finitely generated modules.
- For `G′` the cokernel statement is formal (§0.4); the content is the kernel: for `σ` a Serre
  weight defined over `k` and `T` the Hecke operator, the kernel of
  `T : c-Ind_{KZ}^{G} σ → c-Ind_{KZ}^{G} σ` is zero (freeness over `k̄[T]` after extending scalars),
  finitely presented as required.
- Shotton's statement for `G` itself is restricted to locally `Z`-finite representations
  (SHOTTON20, Corollary 5.2). Every smooth representation of `G′` is locally `Z`-finite, because
  `Z/(Z ∩ K)ϖ^ℤ` is finite; this is why the headline is stated on `G′`. The hypothesis that `ϖ` is a
  uniformiser matters: for `ϖ = 0` the defining set is empty and the quotient is `G`, where
  `c-Ind_K^G k` is finitely presented but not `Z`-finite.

### 0.6 Hom base change and residue fields of irreducibles

Let `k` be a field, `L′/k` a field extension, `V` a finitely generated `k[H]`-module and `W` any
`k[H]`-module. Prove that the natural map `Hom_H(V,W) ⊗_k L′ → Hom_H(V ⊗ L′, W ⊗ L′)` is an
isomorphism (CDN23, Lemme 1.6, p. 12). For `k` finite and an admissible irreducible smooth `k[H]`-
module `π`, prove that `End_H(π)` is a finite field `k′`, that `π` is absolutely irreducible as a
`k′`-representation, and that `π ⊗_k k̄` is the direct sum over the embeddings `k′ → k̄` of pairwise
nonisomorphic absolutely irreducible representations (CDN23, Lemme 1.7, p. 12). This is the general
form of the Galois descent used for `GL₂(ℚ_p)` in PadicLocalLanglandsForGL2Qp §2.7. *Needs:*
Mathlib `Module.Finite`; §0.1.

**Checks.**

- Finite generation of `V` is needed: for `V = ⊕_{n∈ℕ} k` with trivial `H` and `W = k`, the map is
  `(∏ k) ⊗ L′ → ∏ L′`, not surjective for `L′/k` infinite.
- Admissibility is needed: CDN23, Remarque 1.8 records irreducible smooth representations of
  `GL₂(ℚ_{p³})` over `k` for which the conclusions fail.
- For `H` trivial and `π = k`, `End = k` and `π ⊗ k̄` is one copy of `k̄`.

### 0.7 The five-term criterion

Let `F/ℚ_p` be finite. In an exact sequence `A → B → C → D → E` of smooth torsion representations
of `G′`, if `A, B, D, E` are finitely presented then so is `C` (CDN23, Lemme 2.9, p. 27; the number
2.10 in that passage labels a display). *Needs:* §§0.4–0.5.

**Checks.**

- With `A = B = 0`, the statement says that a kernel of a map between finitely presented `D → E`
  is finitely presented, which is §0.5.
- With `D = E = 0` it says that a cokernel of `A → B` is finitely presented, which is §0.4.

### 0.8 The compact-induction obstruction space

Let `F/ℚ_p` be finite and `W` a finite-dimensional smooth `k[KZ]`-module with central character. For
a `G`-equivariant surjection `q : c-Ind_{KZ}^G W → V` put `P⁺ = {(a b; 0 1) : a ∈ 𝒪_F ∖ {0}, b ∈ 𝒪_F}`,
`w = (0 1; ϖ 0)`, let `I⁺(W)` be the span of the standard functions `[g, v]` with `g ∈ P⁺`,
`v ∈ W`, and `I⁻(W) = w I⁺(W)`. Define `Δ(W,V) = q(I⁺(W)) ∩ q(I⁻(W)) ⊆ V` (HU12, §3.1.1, p. 17;
§3.3, p. 30). Prove that `c-Ind_{KZ}^G W = I⁺(W) ⊕ I⁻(W)` as `IZ`-modules and that `Δ(W,V)` is
stable under `IZ` and `w` (HU12, §3.1.1; VIGNERAS11, §5, Lemme 11, p. 21, and Proposition 9,
p. 22). Prove that for `σ` a Serre weight, an absolutely irreducible `W`
(FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15), and `V` a nonzero admissible quotient of
`c-Ind_{KZ}^G σ`, `Δ(σ,V)` contains `V^{I₁}`, hence is nonzero, `I₁` being pro-`p` (HU12,
Corollaire 3.9, p. 19). Admissibility cannot be dropped: Vignéras's Propositions 9 and 10 assert
the containment and the nonvanishing for every generating `KZ`-submodule of a smooth torsion `V`,
and the compact induction itself, with `Δ = 0`, refutes both; only the admissible form is used
here. *Needs:* SmoothRepresentationsOfLocalGroups *compact-induction*;
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15; §§0.1, 0.3.

API:

- `v ∈ Δ(W,V)` exactly when `v` has a preimage under `q` supported in `P⁺KZ` and one supported in
  `wP⁺KZ`.
- For `σ` a Serre weight and `V` a nonzero admissible quotient of `c-Ind_{KZ}^G σ`, `Δ(σ,V)`
  contains `V^{I₁}` (HU12, Corollaire 3.9, p. 19).
- A `G`-map `V → V′` compatible with the presentations restricts to `Δ(W,V) → Δ(W,V′)`, compatibly
  with identities and composition.

**Checks.**

- For `q` the identity of `c-Ind_{KZ}^G W`, `Δ = 0` by the two-cell decomposition, while
  `V^{I₁} ⊇ {[1, v] : v ∈ W^{I₁}} ≠ 0`, the pro-`p` group `I₁` having nonzero invariants on
  `W ≠ 0`; so the containment `V^{I₁} ⊆ Δ` and the nonvanishing of `Δ` both fail without
  admissibility, and `c-Ind_{KZ}^G W` is indeed not admissible (§0.1).
- For `W = k` trivial and `q` the augmentation onto the trivial line, both cell images are `k`, so
  `Δ = k`.
- The functor is not right exact: the augmentation above has `Δ(source) = 0` and
  `Δ(target) = k`, so the induced map is not surjective.

### Examples

- For `H = SL₂(ℚ_p)` and `σ = Sym^r k²`, `c-Ind_K^H σ` is finitely presented and the kernel of any
  endomorphism of it is finitely presented (§0.5; this is the case of SHOTTON20, Theorem 5.1,
  stated for `SL₂` of a division algebra).
- For `G′ = GL₂(ℚ_p)/p^ℤ` and `σ` trivial, the augmentation `c-Ind_{KZ}^G k → k` has kernel the
  representation generated by `[1,1] − [α,1]`; it is finitely presented by §0.5, and the obstruction
  space of the augmentation is `k` (§0.8).

### Dependencies

Mathlib representations, induction and finite length; Tau Ceti completed group algebras;
SmoothRepresentationsOfLocalGroups SR.0.1–SR.0.4 and SR.2.1; NoncommutativeAndEquivariantIwasawa
§§0.3 and F.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15 (Serre weights, §0.8);
PadicLocalLanglandsForGL2Qp §§2.3 and 2.9 for Checks.

## Layer 1: Finite-length criteria over ℚ_p

Throughout, `F = ℚ_p`, `G′ = GL₂(ℚ_p)/p^ℤ`, `k` is a finite field of characteristic `p`, and a
Serre weight `σ` is extended to `KZ` by letting `p` act trivially, so that
`I(σ) = c-Ind_{KZ}^G σ = c-Ind_K^{G′} σ` (CDN23, §1.4.2, p. 16). The Serre weights
`Sym^r ⊗ det^s` of `GL₂(𝔽_p)` (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15) are defined
over `𝔽_p ⊆ k`, so for `F = ℚ_p` the irreducible smooth `k[K]`-modules are exactly the Serre
weights defined over `k` (§1.2), and Serre weights and their compact inductions are taken over `k`.
Representations are smooth `k[G′]`-modules.

### 1.1 Proper quotients of Serre-weight compact inductions

Prove that every nonzero proper quotient of `I(σ)` has finite length (CDN23, Proposition 1.17,
p. 16). Route: for the kernel `π′ ≠ 0`, `(π′)^{I₁}` has finite codimension in `I(σ)^{I₁}`
(BARTHEL-LIVNE94, Proposition 18), so some nonzero `P(T)` sends the generator supported on `KZ`
into `π′`; the quotient then factors through `I(σ)/P(T)I(σ)`, which has finite length by the
`ℚ_p` classification (PadicLocalLanglandsForGL2Qp §2.7). Coefficients are descended from `k̄` to
`k` with §0.6. The hypothesis `F = ℚ_p` enters through this finite-length step; for general `F`,
CDN23, Remarque 1.18, p. 16, records Emerton's conjecture that nonzero admissible quotients of
`I(σ)` have finite length. *Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15 (the
operator `T`, freeness, and gap:barthel-livne-finite-codimension); PadicLocalLanglandsForGL2Qp
§2.7; §0.6.

**Checks.**

- `I(σ)` itself has infinite length: it is free of infinite rank over `k[T]`, and the quotients
  `I(σ)/(T − λ)I(σ)` for distinct `λ ∈ k̄` give infinitely many distinct constituents after
  extending scalars.
- For `σ` trivial and `P = T − 1`, `I(σ)/(T − 1)` has length two, with Steinberg subrepresentation
  and trivial quotient (PadicLocalLanglandsForGL2Qp §2.7).

### 1.2 A filtration by compact inductions of irreducible K-modules

Prove, for every finite `F/ℚ_p`, `G′ = GL₂(F)/ϖ^ℤ` and every finite field `k` of characteristic
`p`, that a smooth `k[G′]`-module `V` is of finite type exactly when it has a finite filtration
`0 = V_0 ⊆ V_1 ⊆ ⋯ ⊆ V_r = V` with `G′`-equivariant surjections `c-Ind_K^{G′} W_i → V_i/V_{i−1}`,
each `W_i` an irreducible smooth `k[K]`-module, extended to `KZ` by letting `ϖ` act trivially so
that `c-Ind_K^{G′} W_i = c-Ind_{KZ}^G W_i` (CDN23, Proposition 1.19, p. 17, and the remark after
its proof that the proof holds for `F ≠ ℚ_p`). Route: the `K`-span `W` of finitely many generators
is finite-dimensional, `c-Ind_K^{G′} W → V` is onto, and a composition series of `W` induces the
filtration, compact induction being exact; conversely compact inductions of finite-dimensional
modules are of finite type, and finite type is stable under quotients and extensions (§0.4).

The `W_i` are finite-dimensional with `1 + ϖM₂(𝒪_F)` acting trivially, and over a general finite
`k` they are `k`-forms that need not be absolutely irreducible: by §0.6, `End_K(W_i)` is a finite
field `k_i` and `W_i ⊗_k k̄` is the sum of `[k_i : k]` pairwise nonisomorphic Serre weights over `k̄`
(FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15), conjugate under `Gal(k̄/k)`. Prove that
when `k` contains the image of an embedding `k_F → k̄` (in particular for `F = ℚ_p` and every `k`),
every irreducible smooth `k[K]`-module is absolutely irreducible, a Serre weight `σ_i` defined over
`k`, so that the graded pieces are quotients of the `I(σ_i)`: the Serre weights of `GL₂(k_F)` are
tensor products of Frobenius twists of `Sym^{r_j}` through the embeddings and a character `η ∘ det`,
`η` a character of `k_F^×`, all defined over that image (BP12, equation (2), pp. 13–14), hence
fixed by `Gal(k̄/k)`, which forces `k_i = k`. This split form is the one used in §§1.3, 1.5 and
1.6. *Needs:* §§0.3, 0.4, 0.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15;
SmoothRepresentationsOfLocalGroups *compact-induction*, *frobenius-reciprocity*,
*induction-exactness*.

**Checks.**

- The zero module has the empty filtration.
- For `V = I(σ)`, `σ` a Serre weight defined over `k`, the filtration has one step.
- For `V` irreducible, any such filtration has exactly one nonzero graded piece, and `V` is a
  quotient of `c-Ind_K^{G′} W` for an irreducible `K`-submodule `W ⊆ V|_K`, which exists because the
  `K`-span of a nonzero vector is finite-dimensional (Frobenius reciprocity); `W` is a Serre weight
  defined over `k` when `k` contains the image of `k_F`, but not in general.
- Negative control for the split form: `F = ℚ_{25}` the unramified quadratic extension of `ℚ₅`,
  `ϖ = 5`, `k = 𝔽₅`, and `V = 𝔽₂₅` on which `g` acts by multiplication by `ac(det g)`, where
  `ac(5^n u) = ū ∈ k_F^× = 𝔽₂₅^×` for `u ∈ 𝒪_F^×`. The scalar `5` has determinant `25` and
  `ac(25) = 1`, so `V` is a smooth `k[G′]`-module, and `K` acts through `det` onto `𝔽₂₅^×`. In
  `𝔽₂₅ = 𝔽₅[t]/(t² − 2)` the element `diag(t̃, 1)`, `t̃` a lift of `t`, acts in the basis `(1, t)` by
  the matrix `(0 2; 1 0)`, whose characteristic polynomial `X² − 2` has no root in `𝔽₅` (the squares
  are `0, 1, 4`); so `V|_K` is irreducible with `End_K(V) = 𝔽₂₅` of dimension `2` over `𝔽₅`. A
  nonzero `K`-map from an absolutely irreducible `k[K]`-module to `V` would be an isomorphism, which
  the endomorphism dimensions `1 ≠ 2` exclude; so `Hom_{G′}(I(σ), V) = Hom_K(σ, V) = 0` for every
  Serre weight `σ` defined over `𝔽₅`, and `V` has no filtration by quotients of such `I(σ)`. The
  filtration of the statement has the one step `c-Ind_K^{G′}(V|_K) → V`. Over `𝔽₂₅`,
  `V ⊗ 𝔽₂₅ = χ ⊕ χ⁵` with `χ = ac∘det`, two distinct characters (`t⁵ = −t`), quotients of
  `I(χ|_K)` and of `I(χ⁵|_K)` respectively, and not of a common one: a `K`-map `χ|_K → χ⁵|_K` is a
  scalar `c` with `t c = −t c` at `diag(t̃, 1)`, so `c = 0` as `2t ≠ 0`, and
  `Hom_{G′}(I(χ|_K), χ⁵) = 0` by Frobenius reciprocity. The filtration of `V ⊗ 𝔽₂₅` has two steps,
  `W₁ = χ|_K` and `W₂ = χ⁵|_K`: dimension `2` over `𝔽₅` against `1 + 1` over `𝔽₂₅`.

### 1.3 Finite type implies finite presentation

Prove `isFinitelyPresented_of_finite`: every smooth `k[G′]`-module of finite type is finitely
presented (CDN23, Proposition 1.20, p. 17). Route: in the filtration of §1.2 the `W_i` are Serre
weights `σ_i` defined over `k`, `F` being `ℚ_p`, and each graded piece is
either `I(σ_i)`, finitely presented by §0.3, or a proper quotient, of finite length by §1.1 and
then finitely presented because irreducible smooth representations of `GL₂(ℚ_p)` are finitely
presented (PadicLocalLanglandsForGL2Qp §2.7); conclude by extension stability (§0.4). *Needs:*
§§0.3–0.4, 1.1–1.2; PadicLocalLanglandsForGL2Qp §2.7.

**Checks.**

- The statement fails for `F ≠ ℚ_p`: an irreducible supersingular representation of `G′` is of
  finite type but not finitely presented (PadicLocalLanglandsForGL2Qp §2.9).
- The coefficients are a field: the theorem is stated for `k[G′]`-modules; an `𝒪`-torsion version
  follows by dévissage along `ϖ_L` using §0.4.

### 1.4 Central characters and finite Ext support

Prove that every irreducible smooth `k[G′]`-module has a central character with values in `k`
(CDN23, Lemme 1.22, p. 17): the pro-`p` part `1 + pℤ_p` of the centre `ℤ_p^×` of `G′` acts
trivially, and `x^{p−1} = 1` for a generator `x` of `𝔽_p^×` splits over `𝔽_p ⊆ k`. Prove that for
a finite-length smooth `k[G]`-module `π` with central character and every irreducible smooth `π′`
with central character, `Ext¹_G(π, π′)` is finite-dimensional, and nonzero for only finitely many
isomorphism classes of `π′` (CDN23, Lemme 1.23, p. 18). Route: reduce to `π` irreducible, extend
scalars to `k̄` by §0.6, separate central characters, and use the finite Ext computation inside a
block. *Needs:* §0.6; PadicLocalLanglandsForGL2Qp §§2.7 and 5.1.

**Checks.**

- The central character is `k`-valued, not merely over an extension: for `p = 3` the centre of `G′`
  acts through `𝔽_3^× = {±1}`, and `−1` acts by `±1 ∈ k`.
- A smooth representation of infinite length need not have a central character:
  `I(σ) ⊕ I(σ) ⊗ (δ∘det)` for a character `δ` of `ℚ_p^×` trivial on `p` and on `1 + pℤ_p` with
  `δ² ≠ 1`, which exists exactly when `p > 3`. The scalar `z` acts on the two summands by
  `ω_σ(z)` and `ω_σ(z)δ(z²)`: for `p = 5` and `δ(u) = ū` (so `δ(2) = 2`), at `z = 2` they differ by
  `δ(4) = 4 ≠ 1`. For `δ` quadratic, `δ(z²) = 1` and the sum does have a central character.
- For `π = π′` the trivial character, `Ext¹_G(1, 1) = Hom(G, k)` is finite-dimensional.

### 1.5 Finite cosocle implies finite length

Prove `isFiniteLength_of_bounded_semisimple_quotients`: let `V` be a smooth `k[G′]`-module of
finite type whose semisimple quotients have bounded length (equivalently, whose cosocle is
semisimple of finite length); then `V` has finite length (CDN23, Théorème 1.21, p. 17). The
converse is immediate. Route: take the filtration of §1.2 with top piece a quotient of `I(σ₁)`;
this map is not an isomorphism because the cosocle of `I(σ₁)` has infinite length, so the top
piece has finite length by §1.1; the long exact sequence for `Hom_G(−, π′)` and §1.4 show that the
next step again has finite cosocle; induct. *Needs:* §§1.1, 1.2, 1.4.

**Checks.**

- For `V = I(σ)` the hypothesis fails: over the finite field `k`, the quotients `I(σ)/(P(T))` for
  infinitely many irreducible `P ∈ k[T]` are pairwise nonisomorphic and contain irreducible
  quotients, so semisimple quotients of unbounded length exist.
- For `V = I(σ)/(T − 1)` with `σ` trivial the cosocle is the trivial character, so `N = 1`, and
  `V` has length two; a bound by the number of irreducible quotients up to isomorphism alone would
  not suffice for `V = π ⊕ π`, whose semisimple quotients have length up to two although it has one
  irreducible quotient up to isomorphism.
- The bounded-length formulation is equivalent to the cosocle formulation: a bound `N` forces the
  radical to be the intersection of finitely many maximal subrepresentations, so `V/rad V` is
  semisimple of length at most `N`; conversely every semisimple quotient factors through
  `V/rad V`.

### 1.6 Finite length is detected by the smooth dual

Prove `isFiniteLength_iff_finite_smoothDualSpan`: a smooth `k[G′]`-module `V` of finite type has
finite length exactly when the smooth vectors of its full linear dual `V* = Hom_k(V, k)` (the smooth
contragredient of SmoothRepresentationsOfLocalGroups *smooth-dual*; their span is `smoothDualSpan`,
defined for a representation of a topological group over any commutative ring `A` as the span in
`Hom_A(V, A)` of the functionals with open stabiliser) span a finite-dimensional space
(CDN23, Théorème 1.24, p. 18). Prove also that a smooth `V` of finite type and infinite length has a
nonzero map `V → I(σ)` for some Serre weight `σ` (CDN23, Lemme 1.25, p. 18).

Route. Finite length implies finite dimension: by dévissage reduce to `V` irreducible, where the
smooth dual vanishes unless `V` is finite-dimensional (KOHLHAASE17, Proposition 3.9 and
Remark 3.10; the dual of an admissible `V` is finite over the noetherian `k[[U]]`, its smooth part is
a finitely generated submodule fixed by an open subgroup). For the converse, Lemme 1.25 is proved by
induction along the filtration of §1.2: a nonzero map from the infinite-length subobject into
`I(σ)` gives an infinite-dimensional, `k[T]`-torsion-free Hom space, and the connecting map into
`Ext¹(π/π₁, I(σ))` cannot be injective when that Ext is finite-dimensional
(gap:ext1-finite-length-into-compact-induction; DEG, Lemma 4.2.1, for `p ≥ 5`; CDN23, footnote 19,
for the central character). Then a finite-dimensional space of smooth vectors in `V*` is closed,
the finitely supported functionals are dense in `I(σ)^∨`, so the dual map `I(σ)^∨ → V^∨` has
finite-dimensional image, giving a nonzero finite-dimensional subrepresentation of `I(σ)`, which
does not exist. *Needs:* §§1.2, 1.3, 1.5; SmoothRepresentationsOfLocalGroups *smooth-dual*;
PadicLocalLanglandsForGL2Qp §§0.3, 2.7 (and its gap); NoncommutativeAndEquivariantIwasawa §F.1.

**Checks.**

- For `V` the trivial character, `V* = k` is smooth: dimension one, finite length one.
- For `V` the Steinberg representation (irreducible, infinite-dimensional), no nonzero functional
  is smooth, so the smooth dual is zero; the full dual is uncountable-dimensional.
- For `V = I(σ)`, every functional supported on finitely many cosets is smooth, so the smooth dual
  is infinite-dimensional, matching infinite length.
- The finite-type hypothesis is needed: an infinite direct sum of Steinberg representations has
  zero smooth dual and infinite length.

### Examples

- `V = I(σ)/(T − 1)` for `σ` trivial has length two, a one-dimensional smooth dual, and cosocle the
  trivial character; all three theorems apply.
- `V = I(σ)` is finitely presented (§1.3), has infinite length, infinite cosocle and
  infinite-dimensional smooth dual.

### Dependencies

Layer 0; PadicLocalLanglandsForGL2Qp §§0.3, 2.7, 2.9, 5.1 (with
gap:ext1-finite-length-into-compact-induction); FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.5.15 (with gap:barthel-livne-finite-codimension); SmoothRepresentationsOfLocalGroups
*smooth-dual*, *induction-exactness*; NoncommutativeAndEquivariantIwasawa §F.1.

## Layer 2: Admissible finite presentation and ordinary parts

`F/ℚ_p` is finite, `G = GL₂(F)`, `T` the diagonal torus, `N₀ = N(𝒪_F)` and `T⁺ ⊆ T` the monoid of
`t` with `t N₀ t⁻¹ ⊆ N₀`. Representations are smooth torsion `𝒪`-representations.

### 2.1 Ordinary parts for GL₂(F)

On torsion-admissible representations define Emerton's ordinary part `Ord_B(V)` as the subspace of
locally `Z_T`-finite vectors in `Hom_{𝒪[T⁺]}(𝒪[T], V^{N₀})`, where `T⁺` acts on `V^{N₀}` by the
transfer Hecke operators `t·v = Σ_{n ∈ N₀/tN₀t⁻¹} n t v` of PotentialAutomorphyInfrastructure §3.7
(EMERTON1, Definition 3.1.3, Lemma 3.1.7, equation (3.1.8) and Definition 3.1.9, pp. 15–17).
Prove that it is independent of the choice of the
contracting compact open subgroup, left exact, preserves torsion admissibility, and is right
adjoint to unnormalised smooth parabolic induction from the lower Borel: for admissible smooth
`U` of `T` and `V` of `G`, `Hom_G(Ind_{B̄}^G U, V) ≅ Hom_T(U, Ord_B V)` naturally (EMERTON1,
Theorem 4.4.6; CDN23, §1.5.2, p. 20). No modulus character is inserted. For `F = ℚ_p` the functor
and the adjunction are those of CompletedCohomologyAndLocalGlobalCompatibility §0.1, which is not
constructed again: prove that on torsion-admissible representations killed by a power of `ϖ_L`
(objects of its `ϖ`-adically admissible category with `A = 𝒪`) the two functors coincide and the
two adjunction isomorphisms agree, both being the locally `Z_T`-finite part of the same Hom module
with the same Hecke action. The content of this section is the extension to every finite `F/ℚ_p`
and to torsion-admissible representations of unbounded exponent. *Needs:*
PotentialAutomorphyInfrastructure §3.7; CompletedCohomologyAndLocalGlobalCompatibility §0.1;
SmoothRepresentationsOfLocalGroups *smooth-induction*, *frobenius-reciprocity*; §0.1.

API:

- The unit `U → Ord_B Ind_{B̄}^G U` is an isomorphism for admissible `U` (EMERTON1, Lemma 2.3.4 and
  Proposition 4.3.4, cited in CDN23, Proposition 1.30(a)).
- The counit `ι_V : Ind_{B̄}^G Ord_B(V) → V` is natural in `V`, `Ord_B(ker ι_V) = 0`, and the image
  `V^{ord}` of `ι_V` has `Ord_B(V^{ord}) = Ord_B(V)` (CDN23, §1.5.2, p. 20).
- Ord_B commutes with finite extension of the coefficient field, and so do its derived functors
  (CDN23, proof of Lemme 1.31).

**Checks.**

- For distinct smooth characters `χ₁, χ₂` of `F^×`, `Ind_B^G(χ₁ ⊗ χ₂) ≅ Ind_{B̄}^G(χ₂ ⊗ χ₁)` by
  conjugation with `w`, so `Ord_B(Ind_B^G(χ₁ ⊗ χ₂)) = χ₂ ⊗ χ₁`: inducing from the upper Borel in the
  adjunction would give the Weyl-conjugate character.
- `Ord_B(0) = 0` and its counit is zero.
- For `V = χ ∘ det` over `k`, `V^{N₀} = k` and a strictly contracting `t` acts by
  `[N₀ : tN₀t⁻¹]·χ(det t) = q^m χ(det t) = 0`, so `Ord_B(χ ∘ det) = 0` for every `F`; a definition
  with the naive action `v ↦ tv` would give `χ ⊗ χ`.
- For `F = ℚ_p` the comparison with CompletedCohomologyAndLocalGlobalCompatibility §0.1 is tested on
  three objects: both functors give `Ord_B(χ∘det) = 0`, `Ord_B(Ind_{B̄}^G U) = U` through the unit,
  and `Ord_B(Ind_B^G χ) = χ^w` for `χ ≠ χ^w`; an identification that inserted the Weyl conjugation
  `U ↦ U^w` would fail on the second object.

### 2.2 Ordinary parts on ordinary constituents away from ℚ_p

Assume `F ≠ ℚ_p`. Prove: for admissible `U`, `Ord_B(Ind_{B̄}^G U) ≅ U` and
`R¹Ord_B(Ind_{B̄}^G U) = 0`; for a smooth character `χ`, `Ord_B(St ⊗ χ∘det) ≅ χ ⊗ χ` and
`R¹Ord_B(St ⊗ χ∘det) = 0`; and `Ord_B(χ∘det) = R¹Ord_B(χ∘det) = 0` (CDN23, Proposition 1.30,
pp. 20–21). Here `R¹Ord_B` is the derived functor on locally admissible representations, and
`H^iOrd_B(V)` is the localisation `Hom_{𝒪[T⁺]}(𝒪[T], H^i(N₀, V))_{T-fin}` of the continuous
cohomology of `N₀`, on which `t ∈ T⁺` acts by conjugation followed by corestriction (EMERTON2,
Definition 3.3.1, p. 10, and the description after Proposition 3.5.6, p. 22). Prove the natural
injection `R¹Ord_B → H¹Ord_B` on locally admissible representations, the universal δ-functor
mapping to the δ-functor `H^•Ord_B` (EMERTON2, Remark 3.7.3, p. 23). Prove the two inputs that
the Steinberg and character statements need, for every `F`:

- for a smooth torsion representation `U` of `T`, `H^i(N₀, Ind_{B̄}^G U) ≅ H^i(N₀, U^w)` for every
  `i ≥ 1`, compatibly with the Hecke actions, `U^w` being `U` with `T` acting through
  conjugation by `w` and `N₀` trivially; and for a smooth character `χ`,
  `H^i(N₀, St ⊗ χ∘det) = 0` for every `i ≥ 1`. Route: the two `B`-orbits on `B̄\G = ℙ¹(F)`, the
  open cell `B̄N` and the fixed point `∞ = B̄w`, give the `B`-equivariant sequence
  `0 → C_c^∞(F) ⊗ U → Ind_{B̄}^G U → U^w → 0`, the quotient being evaluation at `∞`
  (SmoothRepresentationsOfLocalGroups *smooth-induction*, and *mackey-filtration* with `Q = B`,
  `Ind_{B̄}^G` being `c-Ind_{B̄}^G` as `B̄\G` is compact);
  restricted to `N₀` the left term is `⊕_{F/𝒪_F} C^∞(N₀, U)`, a direct sum of coinduced modules
  `Coind_1^{N₀} U`, acyclic in positive degrees (Tau Ceti `TauCeti.ContCohomology.coindAcyclic`),
  and continuous cohomology of the profinite `N₀` commutes with direct sums; so evaluation at `∞`
  is an isomorphism on `H^i` for `i ≥ 1`. The constant functions `χ∘det → Ind_{B̄}^G(χ⊗χ)` compose
  with evaluation at `∞` to an isomorphism `χ∘det ≅ (χ⊗χ)^w` of `N₀`-trivial modules, so they too
  induce isomorphisms on `H^i` for `i ≥ 1`, and the long exact sequence of
  `0 → χ∘det → Ind_{B̄}^G(χ⊗χ) → St ⊗ χ∘det → 0` forces `H^i(N₀, St ⊗ χ∘det) = 0` for `i ≥ 1`;
- for the character `χ∘det` and `t = diag(a, d) ∈ T⁺` with `c = a/d` of valuation `v_F(c) = 1`,
  so that `tN₀t⁻¹` is the subgroup of upper unipotent matrices with entry in `c𝒪_F`, of index `q`
  in `N₀`, the Hecke operator on `H¹(N₀, χ∘det) = Hom_{cont}(𝒪_F, χ∘det)` is `χ(ad)` times
  precomposition with multiplication by `q/c`: the transfer `N₀ → tN₀t⁻¹` of the abelian group
  `N₀ ≅ 𝒪_F` is multiplication by the index `q`, and conjugation by `t⁻¹` divides the unipotent
  coordinate by `c`. For `t = diag(ϖ, 1)` the multiplier is `q/ϖ`; in general
  `q/c = ϖ^{ef−1}·u` with `u ∈ 𝒪_F^×` depending on `t`. The operator is nilpotent exactly when
  `ef ≥ 2`, that is `F ≠ ℚ_p`, since `Hom_{cont}(𝒪_F, χ∘det)` factors through `𝒪_F/p^m` for some
  `m`; hence `H¹Ord_B(χ∘det) = 0` for `F ≠ ℚ_p`.

With these: `R¹Ord_B(Ind_{B̄}^G U) ↪ H¹Ord_B(Ind_{B̄}^G U) = 0` (HAUSEUX, Corollaire 4.2.4(ii)),
`R¹Ord_B(χ∘det) ↪ H¹Ord_B(χ∘det) = 0`, `R¹Ord_B(St ⊗ χ∘det) ↪ H¹Ord_B(St ⊗ χ∘det) = 0`,
`Ord_B(χ∘det) = 0` by the §2.1 Check, and `Ord_B` applied to the Steinberg sequence gives
`Ord_B(St ⊗ χ∘det) ≅ Ord_B(Ind_{B̄}^G(χ⊗χ)) ≅ χ ⊗ χ`. CDN23 justifies its Steinberg clause by
EMERTON2, Theorem 4.2.12, a statement about `GL₂(ℚ_p)` only; the route above replaces it.
*Needs:* §2.1; PotentialAutomorphyInfrastructure §§3.7 and 3.12; SmoothRepresentationsOfLocalGroups
SR.0d.1, *smooth-induction*, *mackey-filtration*; Tau Ceti `TauCeti.ContCohomology.coindAcyclic`.

**Checks.**

- The hypothesis `F ≠ ℚ_p` is needed: for `F = ℚ_p`, `H¹Ord_B(Ind_{B̄}^G U) ≅ ⊕_α U^α ⊗ (ω⁻¹∘α)` is
  nonzero (HAUSEUX, Corollaire 4.2.4(i)).
- The Hecke operator of `t = diag(ϖ, 1)` on `H¹(N₀, k) = Hom(𝒪_F/p, k)`, of dimension `ef`: for
  `F = ℚ_p` and `ϖ = p` it is precomposition with multiplication by `q/ϖ = 1`, invertible, and
  `H¹Ord_B(1) ≅ H¹(N₀, k)` is one-dimensional, as EMERTON2, Theorem 4.2.12(3), states; for
  `F = ℚ_{p²}` and `ϖ = p` it is precomposition with multiplication by `q/ϖ = p` on `𝒪_F/p`, which
  is zero, so `H¹Ord_B(1) = 0`; for `F = ℚ_p(ϖ)` with `ϖ² = p` it is precomposition with
  multiplication by `q/ϖ = ϖ` on `𝒪_F/ϖ²`, nonzero of square zero, so again `H¹Ord_B(1) = 0`.
- The unit of `t` matters: for `F = ℚ₅(ϖ)`, `ϖ² = 5`, `t = diag(2ϖ, 1)`, `χ = 1` and the functional
  `ℓ` on `𝒪_F/5` with `ℓ(1) = 0`, `ℓ(ϖ) = 1`, the operator sends `ℓ` to `x ↦ ℓ(5x/(2ϖ)) = ℓ(ϖx/2)`,
  whose value at `1` is `ℓ(3ϖ) = 3` (as `1/2 ≡ 3` modulo `5`), while precomposition with `q/ϖ = ϖ`
  would give `ℓ(ϖ) = 1`. Both operators have square zero, `(q/c)² = 5/4 ∈ 5𝒪_F`.
- The three statements are consistent with left exactness: applying `Ord_B` to
  `0 → χ∘det → Ind_{B̄}^G(χ⊗χ) → St⊗χ∘det → 0` gives
  `0 → 0 → χ⊗χ → Ord_B(St⊗χ∘det) → R¹Ord_B(χ∘det) = 0`.
- Over `ℚ_p`, `H¹Ord_B(1) ≠ 0` (EMERTON2, Theorem 4.2.12(3)), so the vanishing of `H¹Ord_B` on
  characters, which drives the computation, is exactly what fails; the `N₀`-cohomology of
  `St ⊗ χ∘det` vanishes in positive degrees for every `F`, `ℚ_p` included.

### 2.3 Finite obstruction and admissible length

Let `k` be a finite field of characteristic `p`, `V` a smooth `k[G]`-module of finite type with
central character, and `W ⊆ V` a finite-dimensional `KZ`-stable generating subspace. Prove that the
kernel of `c-Ind_{KZ}^G W → V` is finitely generated exactly when the obstruction space `Δ(W,V)` of
§0.8 is finite-dimensional; that this property does not depend on `W`; and that if `σ` is a
Serre weight defined over `k` (an absolutely irreducible smooth `k[KZ]`-module with central
character, as in the admissible form of §0.8) and `V` a nonzero admissible proper quotient of
`c-Ind_{KZ}^G σ` with `Δ(σ,V)` finite-dimensional, then `V` has finite length (HU12, Théorème 4.3,
Proposition 4.4 and Lemme 4.5, pp. 33–36; Proposition 3.30 and Corollaire 3.31, pp. 30–31;
VIGNERAS11, §5, Proposition 8 for torsion coefficients). An irreducible `k[KZ]`-module that is not
absolutely irreducible, such as the `k`-form of the negative control of §1.2, is first split by a
finite extension of `k`, as §2.4 does. In the proof of HU12 Proposition 4.4 the first displayed
intersection is between the positive and the negative cell, as in the next display and in
Lemme 4.5. Route for the last clause: an irreducible subrepresentation of `V` is admissible and so
has nonzero obstruction (§0.8, the admissible form), which injects (HU12, Proposition 3.30(i)),
while the quotient obstruction is a quotient, so `dim Δ` drops strictly; admissibility passes to
subobjects and quotients (§0.1). *Needs:* §§0.1, 0.4, 0.6, 0.8.

**Checks.**

- Properness and admissibility are needed: `c-Ind_{KZ}^G σ` has `Δ = 0` and infinite length.
- For `V` the trivial character and `W = k`, `Δ = k` is one-dimensional, and the kernel of the
  augmentation is generated by one element, as the criterion predicts.

### 2.4 Admissible finitely presented representations

Define `𝒞_𝒪(G)` as the full subcategory of smooth torsion `𝒪[G]`-representations that are
torsion-admissible (§0.1) and finitely presented (§0.3). Prove
`isFiniteLength_of_admissible_of_finitelyPresented`: every object of `𝒞_𝒪(G)` has finite length,
for every finite `F/ℚ_p` (CDN23, Théorème 1.26(i), p. 19; VIGNERAS11, §5, Théorème 6,
pp. 19–21). Prove `isFinitelyPresented_subrepresentation_of_admissible`: subrepresentations of
objects of `𝒞_𝒪(G)` are finitely presented, hence in `𝒞_𝒪(G)`; with §0.4 and §0.1, `𝒞_𝒪(G)` is closed
under subobjects, quotients and extensions (CDN23, Théorème 1.26(ii)). For `F = ℚ_p`, `𝒞_𝒪(G)` is the
category of finite-length smooth torsion representations, since irreducibles are admissible and
finitely presented (PadicLocalLanglandsForGL2Qp §2.7). For `F ≠ ℚ_p`, every object killed by `𝔪`
has, after a finite extension of `k`, only characters, twists of Steinberg and principal series as
constituents (CDN23, Lemme 1.29, p. 20). Route: reduce modulo `ϖ_L` (finite presentation bounds the
exponent), extend scalars to a finite field containing the image of `k_F` and the eigenvalues of
`ϖ` on a generating `KZ`-module, so that its composition factors are Serre weights defined over
that field (absolutely irreducible with central character, §1.2), apply §2.3 to the graded pieces
(VIGNERAS11, §5, Proposition 8, p. 21, and Théorème 6, pp. 19–21), and for `F ≠ ℚ_p` exclude
supersingular constituents: an irreducible constituent `π` is admissible and finitely presented,
so over a finite extension `k′` of `k` it splits into absolutely irreducible pieces (§0.6), each of
which, extended to `k̄`, has scalar endomorphisms and so a central character, and is finitely
presented, hence not supersingular (PadicLocalLanglandsForGL2Qp §2.9(i)); by
gap:barthel-livne-ordinary-classification it is a character, a Steinberg twist or a principal
series, defined over a finite extension of `k′` by §0.6. *Needs:* §§0.1, 0.3, 0.4, 0.6, 1.2, 2.3;
PadicLocalLanglandsForGL2Qp §§2.7, 2.9; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15
(gap:barthel-livne-ordinary-classification).

Prove that the ordinary irreducibles and the inductions of finite torus representations lie in
`𝒞_𝒪(G)`, for every finite `F/ℚ_p`: for smooth characters `χ, χ₁, χ₂ : F^× → k^×`, the
representations `χ∘det`, `St ⊗ χ∘det` and `Ind_B^G(χ₁ ⊗ χ₂)` over `k` are admissible and finitely
presented, and so is `Ind_{B̄}^G U` for every smooth representation `U` of `T` on an `𝒪`-module of
finite length (CDN23, §1.2.3, p. 12, and proof of Proposition 1.33, p. 21; HU12, §5.1, p. 42).
Route: `Ind_{B̄}^G` and `Ind_B^G` are exact and preserve admissibility, `B̄\G` and `B\G` being
compact (SmoothRepresentationsOfLocalGroups *induction-exactness*; EMERTON1, Propositions 4.1.5
and 4.1.7, pp. 27–29), and admissibility passes to the subrepresentation `χ∘det` and the quotient
`St ⊗ χ∘det` of `Ind_B^G(χ ⊗ χ)` (§0.1). For finite presentation, `I(σ) = c-Ind_{KZ}^G σ` is the
quotient of the finitely presented `c-Ind_K^G σ` by the image of the endomorphism
`ϖ − ζ_σ(ϖ)`, `ζ_σ` the central character of `σ`, hence finitely presented (§§0.3–0.4), and
`I(σ) ⊗ (χ′∘det) ≅ c-Ind_{KZ}^G(σ ⊗ χ′∘det)` is again of this form. After extension to `k̄`,
gap:ordinary-irreducible-hecke-presentation writes `V = Ind_B^G(χ₁ ⊗ χ₂)` with `χ₁ ≠ χ₂`, and
`V = St ⊗ χ∘det`, as the quotient of such an `I(σ) ⊗ (χ′∘det)` by a finitely generated
subrepresentation, so `V ⊗_k k̄` is finitely presented (§0.4). The weight, the character, the
surjection and the finitely many generators of its kernel are defined over a finite extension `k′`
of `k` (§0.6), so `V ⊗_k k′` is finitely presented over `k′`, hence over `k`; as
`V ⊗_k k′ ≅ V^{[k′:k]}` as `k[G]`-modules, `V` is the quotient of `V ⊗_k k′` by a finitely
generated complement, finitely presented (§0.4). The reducible `Ind_B^G(χ ⊗ χ)` is an extension of
`St ⊗ χ∘det` by the constant functions `χ∘det` (as in §2.2), hence finitely presented (§0.4), and
`χ∘det` is the quotient of `c-Ind_{KZ}^G χ` by a finitely generated kernel (§2.3, the obstruction
space being `k`). For `U`, a composition series has irreducible `k[T]`-modules as factors,
finite-dimensional and split into characters over a finite extension of `k` (`T` is abelian);
`Ind_{B̄}^G(χ₁ ⊗ χ₂) ≅ Ind_B^G(χ₂ ⊗ χ₁)` by conjugation with `w` (§2.1), and exactness of
induction, closure under extensions (§0.4) and the same descent conclude. *Needs:* §§0.1, 0.3,
0.4, 0.6, 2.1, 2.3; SmoothRepresentationsOfLocalGroups *smooth-induction*, *compact-induction*,
*induction-exactness*; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15 (`compactInduction`,
`heckeOperatorT`, gap:ordinary-irreducible-hecke-presentation).

API:

- Every object of `𝒞_𝒪(G)` has finite length (`isFiniteLength_of_admissible_of_finitelyPresented`).
- Subobjects, quotients and extensions of objects of `𝒞_𝒪(G)` lie in `𝒞_𝒪(G)`
  (`isFinitelyPresented_subrepresentation_of_admissible` for subobjects).
- For `F = ℚ_p`, `𝒞_𝒪(G)` is the full subcategory of finite-length smooth torsion representations.
- For every finite `F/ℚ_p`, the characters `χ∘det`, the Steinberg twists and the principal series
  `Ind_B^G(χ₁ ⊗ χ₂)` over `k`, and `Ind_{B̄}^G U` for every smooth representation `U` of `T` of
  finite length over `𝒪`, lie in `𝒞_𝒪(G)`.

**Checks.**

- Every smooth character `χ ∘ det` with values in `k^×` lies in `𝒞`: it is admissible, and finitely
  presented as a quotient of `c-Ind_{KZ}^G χ` by a finitely generated kernel (§2.3 with `Δ = k`).
- The Steinberg representation over `k` lies in `𝒞` and is infinite-dimensional: finite length is
  over `k[G]`.
- Admissibility of principal series comes from the compactness of `B\G`. For `n ≥ 1` and
  `K_n = 1 + ϖ^n M₂(𝒪_F)`, normal in `K`, `G = BK` gives `B\G/K_n = ℙ¹(𝒪_F/ϖ^n)`, with
  `(q + 1)q^{n−1}` elements (`q = |k_F|`), and each double coset carries a `K_n`-invariant function
  because `χ₁, χ₂` are trivial on the pro-`p` group `1 + ϖ𝒪_F`, `k^×` having no `p`-torsion; so
  `dim_k Ind_B^G(χ₁ ⊗ χ₂)^{K_n} = (q + 1)q^{n−1}`, which is `q + 1` for `n = 1`. Inducing from the
  torus `T` instead, `T\G/K_n` is infinite, every double coset again carries an invariant function,
  and the invariants are infinite-dimensional.
- The trivial weight does not reach the Steinberg through `Ind_B^G(1 ⊗ 1)`:
  `Hom_G(I(1), Ind_B^G(1 ⊗ 1))` is `Ind_B^G(1 ⊗ 1)^{KZ}`, the line of constant functions
  (`G = BK`, and `Z` acts trivially), so every map from `I(1)` lands in the trivial
  subrepresentation. The `K₁`-invariants `Ind_B^G(1 ⊗ 1)^{K₁} = k[ℙ¹(k_F)]` split as `k ⊕ St_q`, the
  constants splitting off because the augmentation sends the constant function `1` to
  `q + 1 = 1 ≠ 0` in `k`; the complement `St_q`, of dimension `q`, meets the constants in `0` and so
  maps injectively to the Steinberg quotient, matching the weight of dimension `q` in
  gap:ordinary-irreducible-hecke-presentation. `I(1)/(T − 1)` has the opposite orientation: the
  augmentation makes the trivial character its quotient, the Steinberg being its subrepresentation
  (Layer 1, Examples).
- Finite length over `𝒪`, not finite generation, is the hypothesis on `U`: for `U = 𝒪` with trivial
  action, `Ind_{B̄}^G 𝒪 = C^∞(ℙ¹(F), 𝒪)` contains the constant function `1`, which no power of
  `ϖ_L` kills, so it is not a torsion representation and not an object of `𝒞_𝒪(G)`; for
  `U = ⊕_{n∈ℕ} k` with trivial action, `(Ind_{B̄}^G U)^{K₁} = ⊕_ℕ k^{q+1}` is infinite-dimensional and
  the induction is not admissible.
- For `F ≠ ℚ_p` an admissible absolutely irreducible smooth `k[G]`-module `π` with central character
  whose scalar extension to `k̄` is supersingular is not in `𝒞`, because it is not finitely
  presented: a finite presentation of `π` extends to one of `π ⊗_k k̄`, which is admissible and
  supersingular, hence not finitely presented (PadicLocalLanglandsForGL2Qp §2.9(i); CDN23,
  Théorème 1.27, p. 19). `c-Ind_{KZ}^G σ` is finitely presented and not in `𝒞`, being
  non-admissible.
- Admissibility is not implied by irreducibility and a central character. Take `p > 2`,
  `F = ℚ_{p³}` (so `ϖ = p`), `k ⊇ 𝔽_{p³}`, a generic irreducible `ρ̄` in the sense of BP12,
  Definition 11.7, and the parameters `λ₀ = 1`, `λ_i = 2` for `i ≠ 0`. Write `D₀(ρ̄)` for the
  finite-dimensional `KZ`-module that BP12, Theorem 13.8, p. 79, attaches to `ρ̄` (LE19, §2.1,
  p. 3); when `ρ̄|_{I_F} ≅ τ(s, μ)` with `μ − η` 1-deep it is the module `D₀(W(ρ̄))` of §3.5,
  inflated to `KZ` with `p` acting trivially, `W(ρ̄)` being then the set of Buzzard–Diamond–Jarvis
  weights of `ρ̄` (§3.4). Le's representation `π` is
  an absolutely irreducible smooth `k[G′]`-module with a central character whose restriction to
  `KZ` contains `⊕_{i∈ℤ} D₀(ρ̄)`, infinitely many copies of a nonzero finite-dimensional module on
  which `K₁ = 1 + pM₂(𝒪_F)` acts trivially (LE19, Theorem 1.1, p. 1, proved by §§2.1–2.2,
  pp. 3–4, and Theorems 3.2 and 3.4, pp. 5–6; central character, p. 2). So `dim_k π^{K₁} = ∞` and
  `π` is not admissible. It is supersingular, a quotient of `I(σ)/(T)` for the weights `σ` of its `K`-socle,
  its Hecke eigenvalues being those of supersingular representations (LE19, p. 2); consistently,
  it is none of the characters, Steinberg twists and irreducible principal series of the
  Barthel–Livné classification (gap:barthel-livne-ordinary-classification), all of which are
  admissible, as this section proves for the ordinary irreducibles. Such `π` lies outside `𝒞` by
  failing admissibility; the previous Check does not apply to it.

### 2.5 Exactness of ordinary parts and the finite-error counit

Assume `F ≠ ℚ_p`. Prove that `Ord_B` is exact on `𝒞_𝒪(G)` with values finite `𝒪`-modules; that an
object with `Ord_B(V) = 0` is a finite `𝒪`-module; and that for every `V` in `𝒞_𝒪(G)` the kernel and
cokernel of the counit `ι_V : Ind_{B̄}^G Ord_B(V) → V` are finite `𝒪`-modules (CDN23, Lemmes
1.31–1.32 and Proposition 1.33, p. 21). Route: after a finite extension of `k`, which `Ord_B` and
its derived functors commute with (§2.1), the constituents of an object of `𝒞_𝒪(G)` are
characters, Steinberg twists and principal series (§2.4, through
gap:barthel-livne-ordinary-classification), on which `R¹Ord_B` vanishes by §2.2; an object with
zero ordinary part has only character constituents, `Ord_B` being nonzero on Steinberg twists and
principal series (§2.2); apply `Ord_B` to the counit, to its image and to its kernel, which lies in
`𝒞_𝒪(G)` because `Ind_{B̄}^G Ord_B(V)` does (§2.4, `Ord_B(V)` being of finite length over `𝒪`) and
`𝒞_𝒪(G)` is closed under subobjects. *Needs:* §§2.1, 2.2, 2.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.5.15 (gap:barthel-livne-ordinary-classification, gap:ordinary-irreducible-hecke-presentation).

**Checks.**

- Finiteness over `𝒪` is stronger than finite length: for `V = Ind_{B̄}^G(χ₁⊗χ₂)` the counit is an
  isomorphism and `V` is infinite-dimensional, while `Ord_B(V) = χ₁ ⊗ χ₂` is one-dimensional.
- For `V = χ ∘ det`, `Ord_B(V) = 0`, the counit is `0 → V` and its cokernel `V` is one-dimensional.
- For `V = St ⊗ χ∘det`, `Ord_B(V) = χ ⊗ χ`, and the counit `Ind_{B̄}^G(χ⊗χ) → St ⊗ χ∘det` is onto
  with kernel `χ ∘ det`, finite over `𝒪`.

### 2.6 An induced approximation of an admissible Banach lattice

For a continuous representation `σ` of `T` on a finite `𝒪`-module (with its `ϖ_L`-adic topology),
inflated to `B̄` through `B̄ → T`, the continuous induction `Ind_{B̄}^G σ` is Mathlib's
`ContRepresentation.coind` along the inclusion `B̄ → G`: the continuous `f : G → σ` with
`f(b̄g) = σ(b̄)f(g)`, `G` acting by right translation, with the compact-open topology, which is the
topology of uniform convergence because `B̄\G ≅ ℙ¹(F)` is compact. It is a functor from continuous
`T`-representations on finite `𝒪`-modules to continuous `G`-representations on `ϖ_L`-adically
complete and separated `𝒪`-modules.

API:

- Functoriality: a continuous `T`-equivariant `u : σ → σ′` induces `f ↦ u ∘ f`, a continuous
  `G`-equivariant map `Ind_{B̄}^G σ → Ind_{B̄}^G σ′`, compatibly with identities, composition and
  `𝒪`-linear combinations of maps.
- Finite-quotient comparison: for the finite discrete quotients `σ/ϖ_L^nσ`, on which `T` acts
  smoothly, continuous and locally constant functions agree, so `Ind_{B̄}^G(σ/ϖ_L^nσ)` is the
  smooth induction of SmoothRepresentationsOfLocalGroups *smooth-induction*; the reductions induce a
  `G`-equivariant homeomorphism `Ind_{B̄}^G σ ≅ lim_n Ind_{B̄}^G(σ/ϖ_L^nσ)` with the inverse-limit
  topology. The transition maps are onto, by exactness of smooth induction from `B̄` (`B̄\G`
  compact), so by the Mittag-Leffler condition each `Ind_{B̄}^G σ → Ind_{B̄}^G(σ/ϖ_L^nσ)` is onto, with
  kernel `Ind_{B̄}^G(ϖ_L^nσ)`; when `σ` is `𝒪`-torsion-free this kernel is `ϖ_L^n Ind_{B̄}^G σ`, so
  `Ind_{B̄}^G σ / ϖ_L^n ≅ Ind_{B̄}^G(σ/ϖ_L^nσ)`.

Assume `F ≠ ℚ_p`, that is `ef ≥ 2`: `p` is not a uniformiser of `𝒪_F` or `k_F ≠ 𝔽_p`. Let `E` be
an `L`-Banach space and `Θ ⊆ E` an open bounded `𝒪`-submodule with a jointly continuous
`𝒪`-linear action of `G` such that `Θ/ϖ_LΘ ∈ 𝒞_𝒪(G)`. The action extends `L`-linearly to a unitary
Banach representation `Π` on `E = L·Θ` (`Θ` is open, so it spans `E`), admissible because its
reduction is (CompletedCohomologyPartII F.1; PadicLocalLanglandsForGL2Qp §0.1), and every admissible
unitary `Π` with a `G`-stable open bounded lattice whose reduction lies in `𝒞_𝒪(G)` arises in
this way; on `Θ` the norm topology is the `ϖ_L`-adic one, `Θ` being open and bounded. Prove
`exists_coind_approximation_of_lattice`: there are a finite `𝒪`-module `M` with its canonical
(`ϖ_L`-adic) topology, a jointly continuous representation `σ` of `B̄` on `M` trivial on the lower
unipotent subgroup (a representation of `T` inflated to `B̄`), and a continuous `G`-map
`Ind_{B̄}^G σ → Θ` from the continuous induction (`ContRepresentation.coind` along `B̄ → G`) with
kernel and cokernel finite over `𝒪` (CDN23, Corollaire 1.34, p. 21). Route: apply §2.5 to
`Θ/ϖ_L^nΘ`; exactness gives `Ord_B(Θ/ϖ_L^{n+1}Θ) ⊗ 𝒪/ϖ_L^n = Ord_B(Θ/ϖ_L^nΘ)`, so the inverse
limit `σ` is finite over `𝒪` by Nakayama, and the counits pass to the limit, through the
finite-quotient comparison, with bounded error. *Needs:* §2.5; Mathlib `ContRepresentation.coind`;
CompletedCohomologyPartII F.1; PadicLocalLanglandsForGL2Qp §0.1; SmoothRepresentationsOfLocalGroups
*smooth-induction*, *induction-exactness*.

**Checks.**

- `σ = 0` gives `Ind_{B̄}^G σ = 0`.
- The hypothesis `F ≠ ℚ_p` is read as `ef ≥ 2`: for `F = ℚ_{p²}` the residue field has `p²`
  elements, for `F = ℚ_p(√p)` the element `p = (√p)²` is not a uniformiser, and for `F = ℚ_p`
  both conditions fail, so exactly `ℚ_p` is excluded.
- The hypothesis cannot be dropped: for `F = ℚ_p` and a lattice `Θ` whose reduction `π` is
  supersingular, an object of `𝒞_𝒪(G)` (PadicLocalLanglandsForGL2Qp §2.7), a map
  `Ind_{B̄}^G σ → Θ` with finite cokernel would have image of finite codimension in the
  infinite-dimensional irreducible `π`, hence would map onto `π`; filtering `σ` by its torsion
  submodule and using exactness of induction, `π` would be an irreducible subquotient of a smooth
  induction `Ind_{B̄}^G τ` with `τ` finite-dimensional over `k`, whose irreducible subquotients are
  characters, twists of Steinberg and principal series (PadicLocalLanglandsForGL2Qp §2.6). So no
  `σ` exists for such `Θ`.
- For `σ` killed by `ϖ_L`, such as a smooth character `T → k^×`, the inverse system is constant from
  `n = 1` and continuous induction is the smooth induction `Ind_{B̄}^G σ`.
- For `σ = 𝒪` with trivial action, `Ind_{B̄}^G 𝒪 = C(ℙ¹(F), 𝒪)`. With `U_n = ϖ^n𝒪_F`, clopen in
  `ℙ¹(F)`, the uniformly convergent sum `f = Σ_{n≥0} ϖ_L^n 1_{U_n}` is continuous, with
  `f(x) = Σ_{n=0}^{v_F(x)} ϖ_L^n` on `𝒪_F ∖ {0}` and `f(0) = (1 − ϖ_L)⁻¹`, and is not locally constant
  at `0`: smooth induction of the discrete module `𝒪` would miss it, so the two inductions differ
  over `𝒪`.
- For `Π = Ind_{B̄}^G(χ)` continuous induction of a unitary character with `Θ` the induced lattice,
  `σ = χ` and the map is an isomorphism.
- For `Π` the trivial representation `L` with `Θ = 𝒪`, `σ = 0` and the cokernel is `𝒪`, finite.

### Examples

- For `F = ℚ_{p²}` and `V = Ind_{B̄}^G(χ₁ ⊗ χ₂)` the reduction of a unitary principal series, `V`
  lies in `𝒞` (§2.4), has length at most two and `Ord_B(V) = χ₁ ⊗ χ₂` is its inducing character.
- For `F ≠ ℚ_p` the representation `V = St ⊗ χ∘det ⊕ χ′ ∘ det` has `Ord_B(V) = χ ⊗ χ`; the counit has
  kernel `χ∘det` and cokernel `χ′∘det`.

### Dependencies

Layer 0; PotentialAutomorphyInfrastructure §§3.7 and 3.12; CompletedCohomologyAndLocalGlobalCompatibility
§0.1 (the `F = ℚ_p` functor of §2.1); SmoothRepresentationsOfLocalGroups SR.0d.1 and SR.2.1; Tau Ceti
`TauCeti.ContCohomology.coindAcyclic`; Mathlib `ContRepresentation.coind`; PadicLocalLanglandsForGL2Qp
§§0.1, 2.6, 2.7, 2.9; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15 (with
gap:barthel-livne-ordinary-classification and gap:ordinary-irreducible-hecke-presentation);
CompletedCohomologyPartII F.1.

## Layer 3: Tame weights and extension coordinates

From here on `F/ℚ_p` is unramified of degree `f`, with the conventions on weights, depth and
indices fixed above. Serre weights of `GL₂(k_F)` are the irreducible `k[GL₂(k_F)]`-modules,
inflated to `K` and extended to `KZ` as in FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15.

### 3.1 Regular weights and depth

Define, for `λ = ((a_i,b_i))` with `0 ≤ r_i ≤ p−1`, the labelled Serre weight
`F(λ) = ⊗_i (Sym^{r_i} k² ⊗ det^{b_i})^{(i)}`; every Serre weight is of this form, uniquely modulo
`(p − π)X⁰(T)` (BHHMS23, §2.1–2.2, pp. 11–14; BP12, equation (2), pp. 13–14, for the
tensor-product form). Call `λ`
*regular* when `0 ≤ r_i ≤ p−2` for all `i`, and `N`-deep when `N < r_i + 1 < p − N` for all `i`
(BHHMS23, §2.4, pp. 15–17). *Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15;
RepresentationTheory/QuiverRepresentations Layer 3.

API:

- For an integer `N ≥ 0`, `λ` is `N`-deep exactly when `N ≤ r_i ≤ p − N − 2` for all `i`; in
  particular `N`-deep weights exist only when `p ≥ 2N + 2`.
- Adding a central weight `(c_i, c_i)` preserves every `r_i` and the depth, and twists `F(λ)` by
  `det^{Σ c_i p^i}`.
- In the coordinate lattice `ℤ^J`, `η_i` has coordinate `e_i` and `α_i` has coordinate `2e_i`.

**Checks.**

- For `p = 17` and all `r_i = 3`, `λ` is `3`-deep: `3 < 4 < 14`.
- For `p = 17`, `r_0 = 2` prevents `3`-depth whatever the other `r_i` are: `3 < 3` fails.
- `((5,0))` and `((8,3))` have the same depth (`r = 5`), and `F((8,3)) = F((5,0)) ⊗ det³` is a
  different labelled weight; the strict inequalities are on `r_i + 1`, so `r_i = p−N−2` is allowed
  and `r_i = p−N−1` is not.

### 3.2 The extension-graph coordinate map

For regular `λ` let `Λ_W^λ = {ω ∈ ℤ^J : 0 ≤ r_i + ω_i ≤ p−2 for all i}` (the range in which the
translated weight stays regular). Write `ω_i = 2n_i + δ_i` with `δ_i ∈ {0,1}` (Euclidean division,
also for negative `ω_i`) and define `t_λ(ω)`, modulo `(p − π)X⁰(T)`, by its `i`-th pair:
`(a_i + n_i + δ_i, b_i − n_i)` when `δ_{i+1} = 0`, and `(b_i − 1 − n_i, a_i + n_i + δ_i − p + 1)`
when `δ_{i+1} = 1` (BHHMS23, equation (14), p. 16; Lemma 2.4.6 and Remark 2.4.7, p. 17). The parity
at `i+1` selects the branch at `i`. Let `Σ = {Σ_{i∈A} η_i : A ⊆ J}`, and call two lattice points
adjacent when they differ by `±η_i` for one `i`. *Needs:* §3.1.

API:

- `t_λ(0) = λ`.
- For a root coordinate `ν = 2n` with lift `((n_i, −n_i))`, `t_{λ + lift(ν)}(ω) = t_λ(ω + ν)`.
- Adjacency is symmetric, irreflexive, and changes exactly one coordinate by one.

**Checks.**

- `f = 1`, `p = 17`, `λ = (5,0)`, `ω = −1`: `n = −1`, `δ = 1`, second branch, `t_λ(ω) = (0, −11)`,
  so `F(t_λ(ω)) = Sym^{11} ⊗ det^{−11} = Sym^{11} ⊗ det^5`, the second constituent `Sym^{p−1−r} ⊗ det^r`
  of the principal series of §5.3.
- `f = 1`, `p = 17`, `λ = (5,0)`, `ω = 1`: `n = 0`, `δ = 1`, `t_λ(ω) = (−1, −10)`, so
  `F = Sym^9 ⊗ det^6 = Sym^{p−3−r} ⊗ det^{r+1}`, the other Ext-neighbour of `Sym^5`.
- `f = 2`, `p = 17`, `λ = ((5,0),(6,0))`, `ω = (1,0)`: `δ = (1,0)`; at `i = 0` the branch is read from
  `δ_1 = 0`, giving `(6,0)`, and at `i = 1` from `δ_0 = 1`, giving `(−1,−10)`; reading the parity at
  `i` instead would give `((−1,−10),(6,0))`, a different weight.
- `0` and `2η_0` are not adjacent; `0` and `−η_0` are.

### 3.3 Change of origin and extensions between regular weights

For `ω ∈ Λ_W^μ` and a lift `λ` of `t_μ(ω)`, let `w_ω ∈ {±1}^J` have `i`-th sign `(−1)^{ω_{i+1}}`.
Prove `t_λ(ω′) = t_μ(w_ω^{-1}ω′ + ω)` on the corresponding domains, so that change of origin
preserves adjacency; and that for `ω, ω′ ∈ Λ_W^μ` and `(p, f) ≠ (2, 1)`,
`dim_k Ext¹_{GL₂(k_F)}(F(t_μ(ω)), F(t_μ(ω′)))` is `1` when `ω, ω′` are adjacent and `0` otherwise
(BHHMS23, Lemmas 2.4.4 and 2.4.6, Remark 2.4.7, p. 17; BP12, Corollary 5.6(i), pp. 37–38, whose
case `f = 1` assumes `p > 2`). For `(p, f) = (2, 1)` the formula fails and the exceptional value is
part of the target: the only regular weight is the trivial character of `GL₂(𝔽₂) ≅ S₃` (`r = 0`,
and `det` is trivial), `Λ_W^μ = {0}`, and `Ext¹_{S₃}(k, k) = Hom(S₃, k) = Hom(C₂, k)` is
one-dimensional although `0` is not adjacent to itself. *Needs:* §3.2;
RepresentationTheory/QuiverRepresentations Layer 3.

**Checks.**

- The Ext group is for the finite group `GL₂(k_F)`, not for `K` or `I`: for `f ≥ 2` and regular `σ`,
  `Ext¹_{GL₂(k_F)}(σ,σ) = 0`, consistent with `0` not being adjacent to itself, while
  `Ext¹_{K/Z₁}(σ,σ)` is computed in §5.6.
- For `f = 1`, `p = 17`, `μ = (5,0)`: `Ext¹(Sym^5, Sym^9 ⊗ det^6)` and `Ext¹(Sym^5, Sym^{11} ⊗ det^5)` are
  one-dimensional (`ω′ = ±1`), and `Ext¹(Sym^5, F(t_μ(2)))` vanishes.
- `p = 2`, `f = 1` is a negative control for the adjacency formula: the sign quotient `S₃ → C₂`
  acting on `k²` through `(1 1; 0 1)` (whose square is the identity in characteristic two) is a
  self-extension of the trivial character whose invariant line has no invariant complement, so
  `dim Ext¹ = 1`, while adjacency gives `0`.
- `p = 2`, `f ≥ 2`: the regular weights are the characters `det^b`, and
  `Ext¹_{GL₂(𝔽_q)}(det^a, det^b) = 0`, since `GL₂(𝔽_q) = SL₂(𝔽_q) × 𝔽_q^×` with `SL₂(𝔽_q)` perfect
  (`q ≥ 4`) and `𝔽_q^×` of odd order; this agrees with `Λ_W^μ = {0}` having no edges.
- `p = 3`, `f = 1`, `μ = (0,0)`: `Λ_W^μ = {0, 1}`, `t_μ(1) = (−1,−1)`, so the adjacent weights are
  `1` and `det`; `Ext¹_{GL₂(𝔽₃)}(det, 1)` is one-dimensional, and
  `Ext¹_{GL₂(𝔽₃)}(1, 1) = Hom(GL₂(𝔽₃), 𝔽₃) = 0`, the abelianisation being `𝔽₃^× = C₂`.

### 3.4 Tame Galois weights

Let `ρ̄ : G_F → GL₂(k)` be tame. For `s = (s_i) ∈ S₂^J` let `r ∈ {1, 2}` be the order of
`s_0 s_{f−1} ⋯ s_1`, `f′ = rf`, `F′/F` the unramified extension of degree `r`, and assume that `k`
contains the image of an embedding `σ′_0 : k_{F′} → k` extending `σ_0` (for `r = 2`, that
`𝔽_{p^{2f}} ⊆ k`); let `ω_{f′} : I_F = I_{F′} → k^×` be the fundamental character of the Conventions,
built from the Artin map of `F′`. Extend `s_i`, `ν_i`
periodically, put `a_j = s_1^{−1} ⋯ s_j^{−1}(ν_j)` (empty product at `j = 0`), and let `τ(s,ν)` be
the sum of the two characters `ω_{f′}^{Σ_{j=0}^{f′−1} p^j a_{j,c}}`, `c = 1, 2`, of inertia. If
`ρ̄|_{I_F} ≅ τ(s,μ)` with `μ − η` 1-deep, define `W(ρ̄) = {F(t_{μ−η}(sω)) : ω ∈ Σ}` (BHHMS23,
Definition 2.3.1, pp. 13–14; Proposition 2.4.2, p. 16). Prove that `W(ρ̄)` does not depend on the
inertial presentation `(s, μ)`, and that it is the set of Buzzard–Diamond–Jarvis weights of `ρ̄`
(the obvious weights, identified in BHHMS23, proof of Proposition 2.4.2).
The definition is for tame `ρ̄` only. *Needs:* §3.2; PadicLocalLanglandsForGL2Qp §0.3
(fundamental characters); Tau Ceti `TauCeti.ClassFieldTheory.geometricArtinMap` for `F′` and
`TauCeti.ClassFieldTheory.geometricArtinMap_norm` (ClassFieldTheory Layer 7).

API:

- `σ ∈ W(ρ̄)` exactly when `σ = F(t_{μ−η}(sω))` for some `ω ∈ Σ`.
- Equivalent inertial presentations give the same set.
- `W(ρ̄)` is nonempty with at most `2^f` elements (one for each `ω ∈ Σ`).
- The `c`-th character of `τ(s,ν)` has exponent `Σ_j p^j (s_1^{−1}⋯s_j^{−1} ν_j)_c` modulo
  `p^{f′} − 1`; no `η` is added to the input `ν`.

**Checks.**

- `f = 1`, `s = 1`, `μ − η = (5,0)`, `p = 17`: `W(ρ̄) = {F(5,0), F(−1,−10)} = {Sym^5, Sym^9 ⊗ det^6}`, the
  weights of `ρ̄|_I = ω^6 ⊕ 1` (Serre's recipe gives `Sym^r` and `Sym^{p−3−r} ⊗ det^{r+1}` for
  `ω^{r+1} ⊕ 1`).
- The empty subset gives `F(μ − η) ∈ W(ρ̄)`, so `W(ρ̄)` is never empty.
- For `f = 1`, `s = 1`, `ν = (a,b)`, `τ = ω_1^a ⊕ ω_1^b` with `ω_1` the reduction of the cyclotomic
  character on inertia; with the arithmetic Artin normalisation `ω_1` would be replaced by its
  inverse and `W(ρ̄)` by the weights of the dual.
- For `f = 1` replacing `s = −1` by `s = +1` changes `t_{μ−η}(s η_0)` from `t(−η_0)` to `t(η_0)`, a
  different weight.
- The level-two character needs the larger field `k_{F′}`: for `F = ℚ₅`, `r = 2`, the coefficient
  field `k = 𝔽₅` satisfies the convention of Layers 3–9 but `𝔽₅^×` has order `4`, while `ω_2` has
  image of order `24`. With `k = 𝔽₂₅`, `ω_2` maps onto `𝔽₂₅^×` and `ω_2^6 = ω_2^{1+p} = ω_1` has order
  `4`; the Artin map of `F = ℚ₅` alone yields only this niveau-one character.

### 3.5 The finite Diamond socle modules

For a finite set `𝒟` of pairwise nonisomorphic Serre weights define `D₀(𝒟)` as the largest
submodule of the injective envelope `Inj_{GL₂(k_F)}(⊕_{σ∈𝒟} σ)` in which each `σ ∈ 𝒟` occurs with
multiplicity one. Prove that it has socle `⊕_{𝒟} σ` and decomposes as `⊕_{σ∈𝒟} D_{0,σ}(𝒟)` with
`soc D_{0,σ} = σ` (BP12, Proposition 13.1 and Corollary 13.2, pp. 75–76; BHHMS23, §6.3, p. 63,
§6.4, pp. 72–73). For tame `ρ̄` with `μ − η` 1-deep put `D₀(ρ̄) = D₀(W(ρ̄))` and
`D₁(ρ̄) = D₀(ρ̄)^{I₁}`, an `I`-representation inflated from `H`. Only these finite modules are
used; no choice of the normaliser action of a full diagram is made. *Needs:* §3.4;
RepresentationTheory/QuiverRepresentations Layer 3; SmoothRepresentationsOfLocalGroups
*compact-open-invariants*.

API:

- Every finite `GL₂(k_F)`-module with socle `⊕_𝒟 σ` in which each `σ ∈ 𝒟` occurs once embeds into
  `D₀(𝒟)`, compatibly with a chosen socle embedding.
- `D₀(𝒟) = ⊕_𝒟 D_{0,σ}(𝒟)` with `soc D_{0,σ}(𝒟) = σ`.
- `D₁(ρ̄)` is the `I₁`-invariant subspace of `D₀(ρ̄)`, a semisimple `H`-module.

**Checks.**

- `D₀(∅) = 0` and `D₁` of it is zero.
- If `𝒟` is the set of all Serre weights, `D₀(𝒟) = ⊕_𝒟 σ`: any extra constituent would repeat a
  member of `𝒟`.
- `I₁` acts trivially on `D₁(ρ̄)` and `H` need not, and `D₁(ρ̄)` is not the space of invariants of
  the semisimplification. For `f = 1`, `p = 17`, `s = −1` and `μ − η = (5,0)`, `ρ̄` is irreducible
  with `ρ̄|_I = ω₂^6 ⊕ ω₂^{102}` (`k ⊇ 𝔽_{289}`), `W(ρ̄) = {Sym^5, Sym^{11} ⊗ det^5}` (§3.4), and
  `D₀(ρ̄)` is the sum of two nonsplit extensions, with socle `Sym^5` and cosocle `Sym^9 ⊗ det^6`, and
  with socle `Sym^{11} ⊗ det^5` and cosocle `Sym^3 ⊗ det`, of total dimension `6 + 10 + 12 + 4 = 32`
  (BP12, §16, case (iii) with `r₀ = 5`, p. 92). Here `dim D₁(ρ̄) = 2 = 3^f − 1` (BP12, Proposition
  14.7, p. 83, and §16, p. 92), so `D₁(ρ̄)` is the sum of the invariant lines of the two socle
  weights. With the `I₁`-invariant line of `Sym^r ⊗ det^b` spanned by `x^r`, on which `diag(a,d)`
  acts by `a^{r+b} d^b`, its two characters have exponents `(5,0)` and `(0,5)` modulo `16`, with
  values `5` and `1` at `diag(3,1)`, so `D₁(ρ̄)` is not the trivial `I`-module. The invariant lines
  of the two cosocle constituents, with exponents `(15,6)` and `(4,1)` and values `6` and `13` at
  `diag(3,1)`, do not lift through the nonsplit extensions; invariants of the semisimplification
  would give dimension `4` and the four values `5, 6, 1, 13`.

### Examples

- `f = 1`, `p = 17`, `ρ̄|_I = ω^6 ⊕ 1`: `W(ρ̄) = {Sym^5, Sym^9 ⊗ det^6}`; `D₀(ρ̄)` is the sum of the two
  largest multiplicity-free extensions with these socles inside their injective envelopes.
- For `f = 2`, `W(ρ̄)` is the image of the four points `Σ = {0, η_0, η_1, η_0 + η_1}`.

### Dependencies

FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15; PadicLocalLanglandsForGL2Qp §0.3;
Tau Ceti `TauCeti.ClassFieldTheory.geometricArtinMap` (ClassFieldTheory Layer 7);
RepresentationTheory/QuiverRepresentations Layer 3; SmoothRepresentationsOfLocalGroups
*compact-open-invariants*.

## Layer 4: Iwahori filtrations and Gelfand–Kirillov dimension

`k` is a finite field of characteristic `p`. In §§4.3–4.7, `p > 3`, `F` is unramified of degree
`f`, `P = I₁ ∩ SL₂(F)`, which maps isomorphically onto `I₁/Z₁` (for `p > 2` the determinant on `I₁`
has a square root in `1 + p𝒪_F`, so `I₁ = Z₁ × P`), `A = k[[P]]` and `𝔪 = 𝔪_P`.

### 4.1 Gelfand–Kirillov dimension of an admissible representation

For a `p`-adic Lie group `G` and an admissible smooth `k[G]`-module `V ≠ 0`, choose a compact open
subgroup `U` without `p`-torsion; its Pontryagin dual `V^∨` is a finitely generated
`k[[U]]`-module (§0.1), and define `dim_G V = δ_{k[[U]]}(V^∨) = dim U − j_{k[[U]]}(V^∨)` with the
grade of NoncommutativeAndEquivariantIwasawa §F.1 and the canonical dimension of its §0.11, whose
convention `δ(0) = −∞` gives `dim_G 0 = −∞` (BHHMS23, §5.1, pp. 46–47, equation (36)). Prove
that `dim_G V` does not depend on `U`, by the finite-index grade comparison of
NoncommutativeAndEquivariantIwasawa §F.1. For `U` uniform of dimension `d = dim U > 0` and
`V ≠ 0`, `dim_k V^{U^{p^r}}` lies between two positive constants times
`[U : U^{p^r}]^{dim_G V / d}` for all `r` (CompletedCohomologyPartII §5.8, applied to the nonzero
finite module `V^∨`), so `dim_G V` is the exponent of growth of these invariants against
`[U : U^{p^r}]^{1/d}`. When `dim G = 0` the group `G` is discrete, `U = {1}` is allowed and
admissibility makes `V` finite-dimensional, so `dim_G V = 0` for `V ≠ 0` by the grade formula and
`dim_k V^{U^{p^r}} = dim_k V` for every `r`; no growth exponent is defined there, the index
`[U : U^{p^r}]` being `1`. *Needs:* NoncommutativeAndEquivariantIwasawa §§F.1, 0.10–0.11;
CompletedCohomologyPartII §5.8; PadicLocalLanglandsForGL2Qp §0.3 (Pontryagin duality); §0.1.

API:

- Restriction to an open subgroup preserves `dim_G V`.
- `0 ≤ dim_G V ≤ dim G` for `V ≠ 0`, with `dim_G V = 0` exactly when `V` is finite-dimensional.
- Gelfand–Kirillov dimension is monotone on subrepresentations and quotients and equals the maximum
  over the two ends of a short exact sequence (Auslander regularity, NoncommutativeAndEquivariantIwasawa
  §§0.10–0.11).

**Checks.**

- The zero representation has dimension `−∞`: its dual is the zero module, of grade `+∞` (no
  `Ext^i(0, k[[U]])` is nonzero), so `dim U − j = −∞`; a nonzero finite-dimensional representation
  has dimension `0`. The values `(−∞, 0)` separate the zero representation from the trivial line,
  which a convention `dim 0 = 0` would identify. The maximum formula on short exact sequences holds
  under either convention (on `0 → V → V → 0` both sides are `dim V`), so it does not fix the value
  at zero; the grade formula does.
- For the trivial line, `V^∨ = k` has grade `dim U` over `k[[U]]`, so `dim_G k = 0`.
- For `G = ℤ_p^d` and `V = C^∞(ℤ_p^d, k)`, `V^∨ = k[[ℤ_p^d]]` is free of rank one, grade `0`,
  dimension `d`; the growth `dim V^{p^rℤ_p^d} = p^{rd}` agrees.
- The growth clause needs `dim U > 0`: for `G = U = {1}` and `V = k`, `k[[U]] = k`, the grade of
  `V^∨ = k` is `0` and `dim_G V = 0 − 0 = 0`, while `[U : U^{p^r}] = 1` and `dim V^{U^{p^r}} = 1`
  for every `r`; the exponent `1/dim U` is `1/0`, and since every power of the base `1` is `1` the
  growth would not distinguish exponent `0` from exponent `1`. The grade formula alone gives the
  value.
- `c-Ind_{KZ}^G σ` is not admissible, so it has no Gelfand–Kirillov dimension in this sense.

### 4.2 Quotient and central-regular-sequence comparisons

Prove: if a closed normal analytic subgroup `N` of `G` acts trivially on admissible `V`, then
`dim_G V = dim_{G/N} V` (BHHMS23, Lemma 5.1.2, p. 47). Let `U` be compact analytic without
`p`-torsion, `R = k[[U]]` with its `𝔪`-adic filtration and `gr R` Auslander regular; let
`z₁, …, z_r ∈ gr R` be a homogeneous central regular sequence generating `𝔍` with `gr R/𝔍` a
commutative polynomial ring in `dim U − r` variables. If `𝔍` annihilates `gr M` for a finitely
generated `R`-module `M` with good filtration, then `dim U − j_R(M)` is the Krull dimension of the
support of `gr M` over `gr R/𝔍` (BHHMS23, Lemma 5.1.3, pp. 47–48). Route: the filtered grade
equality of NoncommutativeAndEquivariantIwasawa §0.5, and for the central regular sequence the
change-of-rings spectral sequence, which shifts grade by `r` exactly as the dimension drops by `r`.
*Needs:* §4.1; NoncommutativeAndEquivariantIwasawa §§0.5, F.1; Mathlib `ringKrullDim`.

**Checks.**

- The commutative support formula is not applied to the noncommutative `gr R` itself: for
  `gr R = U(𝔥)`, the Heisenberg enveloping algebra of §4.4 with `f = 1`, `e` and `f` do not commute,
  and the formula is applied only to modules killed by the central `h`, over `k[e,f]`.
- For `U = ℤ_p^d` and `𝔍 = 0`, the statement is the commutative equality
  `d − j(M) = dim Supp(gr M)`; for `M = k` it gives `0`.

### 4.3 The nonuniform pro-p Iwahori valuation

On `g = ((1 + pa, b), (pc, 1 + pd)) ∈ P` define `ω(g) = min{1 + v_p(a), 1/2 + v_p(b), 1/2 + v_p(c), 1 + v_p(d)}`.
Prove that `ω` is a saturated `p`-valuation of finite rank `3f` in the sense of
NoncommutativeAndEquivariantIwasawa §0.7, and that the logarithm identifies `P` with the lattice
`𝒪_F ⊗_{ℤ_p} {((pa, b), (pc, −pa)) : a, b, c ∈ ℤ_p}`, on which `ω` becomes the corresponding
weighted valuation, with `e, f` of degree `1/2` and `h` of degree `1` (BHHMS23, §5.3, pp. 50–51;
Lemma 5.3.1 and proof, pp. 51–52). `P` is not uniform. *Needs:* NoncommutativeAndEquivariantIwasawa
§0.7; §3.1.

API:

- `ω(g^p) = ω(g) + 1` and `ω(1) = ∞`.
- `ω([g,h]) ≥ ω(g) + ω(h)`, and the ordered products of `exp` of the basis vectors `p a_i h_i`,
  `b_i e_i`, `p c_i f_i` (over a `ℤ_p`-basis of `𝒪_F`) form an ordered basis.
- Conjugation by `H` preserves `ω` and acts on the three directions by `α_i`, `α_i^{-1}` and `1`.

**Checks.**

- The upper unipotent matrix with entry `1` has `ω = 1/2`; the lower unipotent with entry `p` has
  `ω = 1/2`.
- `diag(1+p, (1+p)^{-1})` has `ω = 1` (`v_p(a) = 0`, and `(1+p)^{−1} = 1 + p d` with `v_p(d) = 0`).
- The identity has `ω = ∞`, not `0`.
- The commutator estimate is sharp: for `u = (1 1; 0 1)` and `l = (1 0; p 1)`, both of value
  `1/2`, the commutator `ulu⁻¹l⁻¹` is congruent to `diag(1+p, 1−p)` modulo terms of higher value and
  has value `1 = 1/2 + 1/2`; this is the bracket `[e, f] = h` of §4.4.

### 4.4 The graded pro-p Iwahori algebra

Prove that in `A` one has `gh − 1 ≡ (g−1) + (h−1)` and `g^{−1} − 1 ≡ −(g−1)` modulo `𝔪²`, that
`g^p − 1 ∈ 𝔪^p`, and that for the Lazard valuation `w` induced by `ω`, `𝔪^{2j} = {x : w(x) ≥ j}` for
`j ∈ (1/2)ℕ`. After doubling degrees, `gr_𝔪 A ≅ ⊗_{i∈J} U_k(𝔥_i)`, where `𝔥_i` has basis
`e_i, f_i, h_i` in degrees `1, 1, 2` with only nonzero bracket `[e_i, f_i] = h_i`; `H` acts on
`e_i, f_i, h_i` by `α_i, α_i^{−1}, 1`. This ring is Auslander regular, the `h_i` form a central
regular sequence, and the quotient by them is the polynomial ring `k[e_i, f_i : i ∈ J]` (BHHMS23,
Lemma 5.3.2 and Proposition 5.3.3, pp. 52–53; equations (42)–(43) and Theorem 5.3.4(i),
pp. 53–54). Route: the weighted graded algebra of NoncommutativeAndEquivariantIwasawa §0.8 for the
saturated `p`-valued group `(P, ω)`, reduced modulo `p`, with the brackets computed after splitting
`𝒪_F ⊗ k = ∏_J k`; PBW and §0.5 give Auslander regularity. *Needs:* §4.3;
NoncommutativeAndEquivariantIwasawa §§0.5, 0.8.

**Checks.**

- The full graded ring is noncommutative: `[e_i, f_i] = h_i ≠ 0` in degree two.
- Degree counts: `gr¹` has dimension `2f` and `gr²` has dimension `f(2f+1) + f = 2f² + 2f` (ordered
  quadratic monomials in the `e, f` plus the `h_i`).
- For `f = 1`, the `H`-weights in degree two are `α², α^{−2}` (for `e²`, `f²`) and `1` (for `ef`,
  `h`); in particular the trivial-weight part of `gr²` is spanned by `h` and `ef`.

### 4.5 The crossing algebra

For a field `k` and a finite set `J` define `C_J(k) = k[X_i, Y_i : i ∈ J]/(X_iY_i : i ∈ J)`. Prove
that its Krull dimension is `|J|`, that it is a complete intersection and Cohen–Macaulay, and that
the two-sided ideal `𝔍_P` of `gr_𝔪 A` generated by the `h_i` and the `e_i f_i` has quotient
`C_J(k)`, `H`-equivariantly, all generators of `𝔍_P` having degree two and trivial `H`-weight
(BHHMS23, Theorem 5.3.4(ii), p. 54). *Needs:* Mathlib `MvPolynomial`, `Ideal.span`,
`Ideal.Quotient.mk`, `ringKrullDim`, `MvPolynomial.ringKrullDim_of_isNoetherianRing_of_finite`,
`RingTheory.Sequence.IsRegular`; DeformationAndDerivedPatchingAlgebra §3.4 (complete
intersections); SchemeAndStackFoundations §0.17 (Cohen–Macaulay rings and the regular-sequence
criterion); §4.4.

API:

- The quotient map `k[X_i, Y_i] → C_J(k)` is surjective and kills each `X_iY_i`.
- `gr_𝔪 A / 𝔍_P ≅ C_J(k)` compatibly with the `H`-actions (`e_i ↦ X_i`, `f_i ↦ Y_i`).
- `ringKrullDim C_J(k) = |J|`: the sequence `(X_iY_i)_i` is regular in the polynomial ring of
  dimension `2|J|`, and the minimal primes are the `|J|`-variable coordinate ideals
  `(Z_i : i ∈ J)` with `Z_i ∈ {X_i, Y_i}`; `C_J(k)` is Cohen–Macaulay as the quotient of the
  Cohen–Macaulay polynomial ring by this regular sequence (SchemeAndStackFoundations §0.17).

**Checks.**

- `J = ∅`: `C_∅(k) = k`, of dimension `0`.
- `|J| = 1`: `k[X,Y]/(XY)` has `X, Y ≠ 0`, `XY = 0`, and dimension `1`, not `2`.
- For `i ≠ j`, `X_iY_j ≠ 0` in `C_J(k)`: only matching indices are killed.

### 4.6 Truncated projective Iwahori modules

For a compact `p`-adic analytic group `U` define the projective envelope `Proj_U(τ)` of a smooth
irreducible `τ` in the category of pseudocompact `k[[U]]`-modules as the Pontryagin dual of the
injective envelope of `τ^∨` in the smooth category (SmoothRepresentationsOfLocalGroups SR.0d.1).
For a smooth character `χ : I → k^×` trivial on `Z₁` and `n ≥ 1` put
`W_{χ,n} = Proj_{I/Z₁}(χ)/𝔪_{I₁}^n Proj_{I/Z₁}(χ)`. Prove that `Proj_{I/Z₁}(χ) = χ ⊗ k[[I₁/Z₁]]`, with
`I₁` acting by left multiplication and `H` by conjugation, so that
`W_{χ,n} = χ ⊗ k[[I₁/Z₁]]/𝔪^n` is finite-dimensional with simple cosocle `χ` (BHHMS23, equation
(45) and the following paragraph, p. 56). For `n = 2, 3` these are radical quotients of the
projective envelope, not socle truncations. *Needs:* Tau Ceti `TauCeti.completedGroupAlgebra`;
SmoothRepresentationsOfLocalGroups SR.0d.1; PadicLocalLanglandsForGL2Qp §0.3; §4.4.

API:

- `W_{χ,1} = χ`, compatibly with the projection from the envelope.
- For `m ≤ n` there is a surjection `W_{χ,n} → W_{χ,m}` with kernel `𝔪^m W_{χ,n}`.
- `dim W_{χ,2} = 1 + 2f` and `dim W_{χ,3} = 1 + 4f + 2f²`.

**Checks.**

- `W_{χ,1}` is the character `χ`, not the whole envelope.
- For `f = 1`, `dim W_{χ,2} = 3` and `dim W_{χ,3} = 7`; omitting the central generator `h` would
  give `6`.
- The `𝔪_{I₁}`-action factors through `I₁/Z₁`, and the `H`-characters of `W_{χ,2}` are `χ`,
  `χα_i`, `χα_i^{−1}`.

### 4.7 A multiplicity criterion for Gelfand–Kirillov dimension

Assume `p > 3` and let `V` be an admissible smooth `k`-representation of `I/Z₁`. Suppose that for
each character `χ` with `Hom_I(χ, V) ≠ 0`, precomposition with `W_{χ,3} → χ` is an isomorphism
`Hom_I(χ, V) ≅ Hom_I(W_{χ,3}, V)`. Then `𝔍_P` annihilates `gr_𝔪(V^∨)` and
`dim_I V = dim_{I/Z₁} V ≤ f` (BHHMS23, Corollary 5.3.5, pp. 54–55). Route: dually, the hypothesis
kills the trivial-weight part of `gr²` on the degree-zero generators of `gr(V^∨)`; `h_i` is
central, so `h_i gr(V^∨) = 0`, and modulo the `h_i` the algebra is commutative, so the `e_if_i` kill
everything; then §4.2 and §4.5 give the bound. *Needs:* §§4.2, 4.5, 4.6.

**Checks.**

- Only an upper bound is claimed: for `V` finite-dimensional the hypothesis can hold and
  `dim = 0 < f`.
- For `V = C^∞(I/Z₁, k)` with right translation (Gelfand–Kirillov dimension `3f`), the hypothesis
  fails at `χ = 1`: `Hom_I(W_{1,3}, V) ≅ Hom_k(W_{1,3}, k)` is `7`-dimensional for `f = 1`, while
  `Hom_I(1, V)` is one-dimensional.

### Examples

- For `f = 1`, `gr A = U(𝔥)` with `𝔥` the Heisenberg algebra and `gr A/𝔍_P = k[X,Y]/(XY)`, of
  dimension one: an admissible `V` satisfying §4.7 has `dim_I V ≤ 1`.
- For `G = ℤ_p` and `V = C^∞(ℤ_p, k)`, `dim = 1`; for `V = k`, `dim = 0`.

### Dependencies

Layer 0 (§0.1); NoncommutativeAndEquivariantIwasawa §§0.5, 0.7, 0.8, 0.10–0.11, F.1;
CompletedCohomologyPartII §5.8; SmoothRepresentationsOfLocalGroups SR.0d.1; Tau Ceti completed
group algebras; DeformationAndDerivedPatchingAlgebra §3.4; SchemeAndStackFoundations §0.17;
Mathlib commutative algebra; Layer 3 (§3.1).

## Layer 5: Finite and first-order extension modules

`p > 3`, `F` unramified of degree `f`, `Γ = GL₂(k_F)`, `P_σ = Proj_Γ σ` (Tau Ceti
`TauCeti.exists_isProjectiveCover_of_finite`) and `Inj_Γ σ` its injective envelope.

### 5.1 Iwahori character extensions and truncation embeddings

Prove: `Ext¹_{I/Z₁}(χ, χ′)` is nonzero exactly when `χ′ = χα_i` or `χα_i^{−1}` for some `i`, and is
then one-dimensional; write `E_{χ′,χ}` for the nonsplit extension `0 → χ′ → E → χ → 0`. It is
`K₁`-trivial (factors through `I/K₁`) exactly when `χ′ = χα_i`. Every nonzero map
`W_{χ′,2} → W_{χ,3}` for such `χ′` is injective (BHHMS23, Lemmas 6.1.1–6.1.2, p. 56; equation (44),
p. 55). For `p > 5`, every `χ′ ≠ χ` occurs at most once in `W_{χ,3}`. The bound `p > 5` is needed:
the printed statement assumes `p > 3`, but for `p = 5`, `f = 1` the root character `α` has order four,
`α² = α^{−2} ≠ 1`, and the independent degree-two vectors `e²`, `f²` both have weight `α²`, so `χα²`
occurs twice. *Needs:* §§4.4, 4.6; SmoothRepresentationsOfLocalGroups *compact-open-invariants*.

**Checks.**

- The `p = 5`, `f = 1` collision just described: multiplicity two for `χα²` in `W_{χ,3}`.
- `Ext¹_{I/Z₁}(χ, χ)` vanishes: the degree-one part of `gr A` has weights `α_i^{±1} ≠ 1` (as `p > 3`).
- Orientation: torus conjugation multiplies the upper unipotent direction `e_i` by `α_i` and the
  lower direction `f_i` by `α_i^{−1}`. The extension through `e_i` is `E_{χα_i,χ}` and factors through
  `I/K₁ = B(k_F)`; the extension through `f_i` is `E_{χα_i^{−1},χ}`, on which the elements
  `(1 0; pc 1) ∈ K₁` act nontrivially. Swapping the two would make the wrong extension `K₁`-trivial.

### 5.2 Finite Borel injectives and their conjugates

Let `B(k_F) = T(k_F)N(k_F)`. For a character `χ` of `T(k_F)` let `I_χ = Ind_{T(k_F)}^{B(k_F)} χ`, the
injective envelope of `χ` for `B(k_F)`. Prove that its socle and cosocle are `χ`, every other
constituent is `χα_0^{−j}`, `0 < j < q−1`, once; that for `j = Σ j_i p^i` the unique submodule with
cosocle `χα_0^{−j}` has constituents `χα_0^{−ℓ}` with `0 ≤ ℓ_i ≤ j_i` (digitwise); and the
corresponding statements for `J_χ`, the inflation to `I` conjugated by `w = (0 1; p 0)`, which has
socle and cosocle `χ^s` and other constituents `χ^s α_0^{j}` with the same digit order (BHHMS23,
Lemma 6.1.3 and Corollary 6.1.4, pp. 57–58). *Needs:* RepresentationTheory/QuiverRepresentations
Layer 3; SmoothRepresentationsOfLocalGroups *smooth-induction*; §3.1.

API:

- `I_χ` has dimension `q`, with socle and cosocle `χ`.
- For `0 < j < q−1`, the submodule with cosocle `χα_0^{−j}` has dimension `∏_i (j_i + 1)`.
- Conjugation by `w` replaces `χ` by `χ^s` and the exponents of `α_0` by their negatives.

**Checks.**

- `f = 1`, `0 < j < p−1`: the submodule has length `j + 1`.
- `p = 7`, `f = 2`, `j = 1 + 2p`: length `(1+1)(2+1) = 6`, not `j + 1 = 16`.
- `χ` occurs twice in `I_χ` (socle and cosocle), so `I_χ` is not multiplicity-free; `J_χ` does not
  factor through `B(k_F)` in general, although `I_χ` does.

### 5.3 Finite principal series and finite injective hulls

Prove: for `0 < r_i < p−1`, `Ind_I^K χ_λ^s` is multiplicity-free with constituents `F(t_λ(−η_A))`,
`A ⊆ J`, where `η_A = Σ_{i∈A} η_i`; for `0 < r_i < p−2`, the distinct constituents of `Inj_Γ F(λ)` are
the `F(t_λ(Σ a_i η_i))`, `a_i ∈ {−1, 0, 1}`; and for such a constituent `σ_a` there is a unique
submodule `I(F(λ), σ_a)` of `Inj_Γ F(λ)` with cosocle `σ_a` in which `F(λ)` occurs once; it is
multiplicity-free with constituents `σ_b`, `b_i ∈ {0, a_i}`, and length `2^{#{i : a_i ≠ 0}}`
(BHHMS23, Lemma 6.2.1, pp. 58–59; BP12, Corollary 3.12, p. 26). *Needs:* §§3.3, 5.2;
RepresentationTheory/QuiverRepresentations Layer 3; Tau Ceti
`TauCeti.exists_isProjectiveCover_of_finite`.

API:

- `I(σ, τ)` has simple socle `σ`, simple cosocle `τ`, and `[I(σ,τ) : σ] = 1`.
- Within `Inj_Γ σ`, the submodule with these endpoint and multiplicity properties is unique.
- For `τ = σ_a` its constituents are the `σ_b` with `b_i ∈ {0, a_i}`, each once.

**Checks.**

- `I(σ, σ) = σ`.
- If exactly one `a_i` is nonzero, `I(σ, σ_a)` is the nonsplit extension of length two.
- If two `a_i` are nonzero, `I(σ, σ_a)` has length four with two incomparable middle constituents,
  not a uniserial chain of length three. The whole of `Inj_Γ σ` is not multiplicity-free.

### 5.4 Rational constituents of projective lifts

Here `Γ = GL₂(k_F)` and `P_σ = Proj_Γ σ`, as throughout this layer. Every finitely generated
projective `k[Γ]`-module `P` has, over every complete discrete valuation ring `𝒪` with residue field
`k`, of either characteristic, and with uniformiser again written `ϖ_L`, a finitely generated
projective `𝒪[Γ]`-lift `P̃`, `P̃/ϖ_LP̃ ≅ P`, unique up to isomorphism: existence is Tau Ceti
`TauCeti.exists_projective_quotient_smul_top_linearEquiv` and uniqueness is
`Ideal.nonempty_linearEquiv_of_quotient_smul_top`, applied as recorded in the supplier contracts;
neither is proved again here. Write `P̃_σ` for the lift of `P_σ`.

Prove, for `𝒪 = 𝒪_L` as in the Conventions (so that `L` has characteristic zero and `k`
characteristic `p`), with `L` and `k` splitting `Γ`, `σ` a Serre weight of `Γ` and `V` an
irreducible `L[Γ]`-module with a `Γ`-stable `𝒪`-lattice `V°` and reduction `V̄ = V°/ϖ_LV°`, that
`[L ⊗_𝒪 P̃_σ : V] = [V̄ : σ]` (BHHMS23, last paragraph of the proof of Lemma 4.1.2, p. 27;
SERRE-LRFG, Part III, Chapters 14–15). This is the instance for `Γ` of Brauer reciprocity, and it
is obtained by composing imported inputs along the chain

    [L ⊗_𝒪 P̃_σ : V] = dim_L Hom_{L[Γ]}(L ⊗_𝒪 P̃_σ, V) = rank_𝒪 Hom_{𝒪[Γ]}(P̃_σ, V°)
                     = dim_k Hom_{k[Γ]}(P_σ, V̄) = [V̄ : σ].

The first equality holds as `L ⊗_𝒪 P̃_σ` is semisimple (Maschke, characteristic zero) and
`End(V) = L`; the second as `Hom_{𝒪[Γ]}(P̃_σ, V°)` is a full `𝒪`-lattice in the rational Hom space;
the third is the Hom base change below, the Hom module being free over `𝒪`; the last is the
projective-cover pairing of GL2AutomorphicRepresentationsAndTransfer §R17.5.11, read over `k̄` and
descended to the splitting field `k` with §0.6. In particular `[V̄ : σ]` does not depend on the
lattice. *Needs:* Tau Ceti `TauCeti.exists_projective_quotient_smul_top_linearEquiv`,
`Ideal.nonempty_linearEquiv_of_quotient_smul_top` and `TauCeti.exists_isProjectiveCover_of_finite`;
GL2AutomorphicRepresentationsAndTransfer §R17.5.11; §0.6.

API:

- `P̃_σ` is indecomposable with `P̃_σ/ϖ_L = P_σ`, and the lift of `P_σ ⊕ P_τ` is `P̃_σ ⊕ P̃_τ`, by
  uniqueness.
- `P̃` is free over `𝒪` of rank `dim_k P`, being a direct summand of a free `𝒪[Γ]`-module; with the
  identity, `dim_k P_σ = Σ_V [V̄ : σ] dim_L V`, the sum over the irreducible `L[Γ]`-modules.
- Hom base change: for every finite `𝒪[Γ]`-module `M`,
  `Hom_{𝒪[Γ]}(P̃, M) ⊗_𝒪 k ≅ Hom_{k[Γ]}(P, M/ϖ_LM)`, by exactness of `Hom_{𝒪[Γ]}(P̃, −)` on
  `M → M → M/ϖ_LM → 0` (the first map multiplication by `ϖ_L`); this holds in either
  characteristic.
- Lifting commutes with finite unramified extension `𝒪 → 𝒪′`: `𝒪′ ⊗_𝒪 P̃` is the lift of
  `k′ ⊗_k P`, by uniqueness.

**Checks.**

- The Steinberg weight, for `f = 1`: the unipotent `u = (1 1; 0 1)` acts on `σ = Sym^{p−1}k²` by a
  single Jordan block of size `p` (`(u − 1)^{p−1}` sends `Y^{p−1}` to `(p−1)! X^{p−1} ≠ 0`), so `σ`
  is free over the Sylow subgroup `⟨u⟩` and hence projective: `P_σ = σ` and `P̃_σ` is a lattice in
  the rational Steinberg representation `St_L = Ind_B^Γ 1 / 1`, of dimension `p`. The identity then
  says that `St_L` is the only irreducible `L[Γ]`-module whose reduction contains `σ`, once; indeed
  `Ind_B^Γ k = k ⊕ St_k` because `p ∤ [Γ : B] = p + 1`, so `St_L` reduces to `σ`, while the trivial
  character reduces to `k ≠ σ`. A lift containing the trivial character would give
  `[L ⊗ P̃_σ : 1] = 1 ≠ 0 = [k : σ]`.
- Characteristic zero is needed for the identity, not for the lifting: for `𝒪 = k[[t]]`,
  `L = k((t))` and `σ = k`, the lift is `P̃_k = k[[t]] ⊗_k P_k`, and `L ⊗_𝒪 P̃_k = k((t)) ⊗_k P_k`
  has the trivial character as a constituent at least twice, because `k[Γ]` is symmetric
  (`soc P_k ≅ k ≅ cosoc P_k`) and `P_k ≠ k` as `p` divides `|Γ|`; the trivial lattice `𝒪` reduces
  to `k` with `[k : k] = 1`. Written with `P̃[1/p]` instead, already `σ = k` fails in equal
  characteristic: `P̃[1/p] = 0` as `p = 0` in `𝒪`.
- Hom base change for `σ = k` and the trivial modules `M = 𝒪` and `M = k`: by the identity
  `Hom_{𝒪[Γ]}(P̃_k, 𝒪)` has rank `[L ⊗ P̃_k : 1] = [k : k] = 1`, and both base-changed sides are
  `Hom_{k[Γ]}(P_k, k) = k`, of dimension `1`, the cosocle of `P_k` being `k`; the torsion module
  `M = k` is covered, `M/ϖ_LM = k`.

### 5.5 Adjoint tensor and finite projective weight structure

Let `A_i = sl₂(k)` with `Γ` acting through `σ_i`. Prove: for 2-deep `λ`,
`A_i ⊗ F(λ) ≅ F(λ − α_i) ⊕ F(λ) ⊕ F(λ + α_i)`, and the same decomposition holds for the algebraic
highest-weight modules before restriction; for 3-deep `λ` and `σ = F(λ)`,
`A_i ⊗ P_σ ≅ P_{F(λ−α_i)} ⊕ P_σ ⊕ P_{F(λ+α_i)}`, and tensoring `σ → soc P_σ` and `cosoc P_σ → σ` with
`A_i` gives the full socle and cosocle of this tensor; `[P_σ : σ] = 2^f` and
`[P_{F(λ±α_i)} : σ] = 0`; and after a finite unramified extension `L′/L` splitting `Γ`,
`L′ ⊗_𝒪 P̃_σ` is the
sum of exactly `2^f` pairwise nonisomorphic absolutely irreducible representations (LMS22,
Proposition 3.3, pp. 7–8, read with LMS22-CORR, item (2); BHHMS23, last paragraph of the proof of
Lemma 4.1.2, p. 27; Lemma 6.3.7, p. 63; BP12, Lemmas 3.4–3.5, p. 21, and Lemma 3.8,
p. 23). LMS22 Proposition 3.3(2) as printed identifies every translated summand with a
projective cover; the corrected statement uses the translated module `R_{μ+ν}`, which is the
projective cover when the shifted weight is not a character, and the 3-deep hypothesis excludes
characters. *Needs:* §§3.1, 5.3, 5.4; Tau Ceti
`TauCeti.exists_isProjectiveCover_of_finite`.

**Checks.**

- `dim(A_i ⊗ P_σ) = 3 dim P_σ`, and its cosocle is the three shifted weights, not three copies of
  `σ`.
- For `f = 1`, `[P_σ : σ] = 2` and `L′ ⊗_𝒪 P̃_σ` has two distinct constituents: multiplicity-freeness of
  the rational lift does not make `P_σ` multiplicity-free.
- The 2-deep clause means `2 ≤ r_i ≤ p−4`; at `r_i = p−3` the weight `λ + α_i` has `r_i + 2 = p−1` and
  is not regular, and no decomposition is asserted there; at `r_i = 1` the weight `λ − α_i` has
  `r_i − 2 < 0` and is not a weight at all.

### 5.6 First-order Serre-weight hulls

Let `A₁ = k[[K/Z₁]]/𝔪_{K₁}²` (finite-dimensional). For a smooth irreducible `σ`, the injective
envelope `Inj_{K/Z₁} σ` (SmoothRepresentationsOfLocalGroups SR.0d.1) has
`Inj_{K/Z₁}σ[𝔪_{K₁}²] = Inj_{A₁} σ`, finite-dimensional, with `K₁`-invariants `Inj_Γ σ` and quotient
embedded in `Inj_Γ σ ⊗ H¹(K₁/Z₁, k)`, where `H¹(K₁/Z₁, k) ≅ ⊕_i A_i^*` (NoncommutativeAndEquivariantIwasawa
§0.13 for `K₁/Z₁` uniform of dimension `3f`). Prove (for `p > 3`): for 2-deep `σ` and
`τ ∈ JH(Inj_{A₁} σ)`, a submodule `V ⊆ Inj_{A₁} σ` with `cosoc V = τ` and `[V : σ] = 1` is unique and
multiplicity-free; if `τ ∈ JH(Inj_Γ σ)` then `K₁` acts trivially on `V` and `V = I(σ, τ)`. Dually,
for 2-deep `τ` a quotient of `Proj_{A₁} τ` with simple socle `σ` and `[V : τ] = 1` is unique; a quotient
`Q` of `Proj_{A₁} τ` with `[Q : τ] = 1` whose socle constituents lie in `JH(P_τ)` is multiplicity-free
and `K₁`-trivial. For distinct regular `σ, σ′`, inflation identifies `Ext¹_Γ(σ,σ′)`,
`Ext¹_{K/Z₁}(σ,σ′)` and `Ext¹_{A₁}(σ,σ′)`; `Ext¹_{K/Z₁}(σ,σ) = 0` for regular `σ` when `f ≥ 2`, and
for `f = 1` when `0 ≤ r ≤ p−3` (HW22, Lemma 2.10, p. 12; Theorem 2.23 and Corollaries 2.25–2.26,
p. 17; Theorem 2.30 and Corollary 2.31, p. 20). *Needs:* §§3.3, 5.3; Tau Ceti
`TauCeti.completedGroupAlgebra`; SmoothRepresentationsOfLocalGroups SR.0d.1;
NoncommutativeAndEquivariantIwasawa §0.13; RepresentationTheory/QuiverRepresentations Layer 3.

**Checks.**

- The 2-deep condition means `2 ≤ r_i ≤ p−4`; uniqueness is for submodules of the fixed hull with
  `[V:σ] = 1`, not for arbitrary `K`-extensions with prescribed constituents.
- `dim_k H¹(K₁/Z₁, k) = 3f`: `K₁/Z₁` is uniform of dimension `3f` (as `p > 2`), and
  `dim Inj_{A₁} σ ≤ (1 + 3f) dim Inj_Γ σ`.
- For `f = 1` and `r = p−2`, the self-extension clause is excluded, since the bound `r ≤ p−3` fails.

### Examples

- `f = 1`, `p = 17`, `σ = Sym^5`: `Inj_Γ σ` has distinct constituents `Sym^5`, `Sym^9 ⊗ det^6` and
  `Sym^{11} ⊗ det^5` (labels `a ∈ {−1, 0, 1}`), and `I(σ, Sym^9 ⊗ det^6)` is the nonsplit extension of
  length two.
- `f = 1`: `A_0 ⊗ Sym^r ≅ Sym^{r−2} ⊗ det ⊕ Sym^r ⊕ Sym^{r+2} ⊗ det^{−1}` for `2 ≤ r ≤ p−4`.

### Dependencies

Layers 3–4; RepresentationTheory/QuiverRepresentations Layer 3; Tau Ceti projective covers and
completed group algebras; Tau Ceti projective lifting and its uniqueness;
GL2AutomorphicRepresentationsAndTransfer §R17.5.11; Layer 0 (§0.6); SmoothRepresentationsOfLocalGroups
SR.0d.1 and SR.2.1; NoncommutativeAndEquivariantIwasawa §0.13.

## Layer 6: Diamond boxes and multiplicity-preserving enlargements

`p > 3`, `F` unramified of degree `f`, `K`-representations are smooth and factor through `K/Z₁`;
`σ_a = F(t_λ(Σ_i ε_i a_i η_i))` for a sign vector `ε` and `a ∈ ℕ^J`.

### 6.1 Rectangular multiplicity-free K-modules

Let `ε_i ∈ {±1}`, `B_i ≥ 0` and `d_i = (1 + ε_{i−1})/2` (cyclic indices). Assume `B_i ≡ 1 − d_i`
modulo 2, `B_i ≤ r_i ≤ p − 2 − d_i` when `ε_i = −1`, and `B_i ≤ p − 2 − r_i ≤ p − 2 − d_i` when
`ε_i = +1`. Prove that there is a multiplicity-free `K/Z₁`-module `V(λ, ε, B)` with constituents
`σ_a`, `0 ≤ a_i ≤ B_i`, such that the unique submodule with cosocle `σ_a` has exactly the
constituents `σ_b`, `0 ≤ b_i ≤ a_i`, and with socle `F(λ)` (BHHMS23, Proposition 6.2.2, pp. 59–60;
HU10, Lemma 2.13(i), pp. 14–15, numbered Lemma 2.12(i) in the journal version cited by BHHMS).
The target is existence with this structure, not uniqueness of modules with these constituents.
Route: for all signs negative, induce the digit-ordered submodule of `J_χ` (§5.2) with digit bounds
`(B_i − 1)/2` and identify the box by the principal-series labels; for `f ≥ 2` the covering
relations are the nonsplit edges given by Hu's lemma on `Ind_I^K E_j(χ)`, for `f = 1` by the
two-character Frobenius-reciprocity argument; mixed signs follow by change of origin (§3.3), the
shift `d_i` moving the parity condition to the predecessor index. *Needs:* §§3.3, 5.2, 5.3.

API:

- `JH(V)` is the box `{σ_a : 0 ≤ a_i ≤ B_i}`, each with multiplicity one, and
  `length V = ∏_i (B_i + 1)`.
- The submodule generated under the cosocle constituent `σ_a` has exactly the coordinatewise lower
  interval `b ≤ a`.
- `soc_K V = F(λ)`, the constituent `a = 0`.

**Checks.**

- All `ε_i = −1` and all `B_i = 1`: `d_i = 0`, the parity condition holds, `V` has length `2^f` and is
  the principal series `Ind_I^K χ_λ^s` of §5.3.
- `f = 2`, `ε = (+1, −1)`: `d_0 = (1 + ε_1)/2 = 0` and `d_1 = (1 + ε_0)/2 = 1`, so `B_0` must be odd and
  `B_1` even; using `ε_i` instead of `ε_{i−1}` would reverse them.
- A constituent with coordinate `a = (1, 2)` generates a lower interval of length `(1+1)(2+1) = 6`,
  when the bounds allow `B ≥ (1,2)`.

### 6.2 K₁-invariance and the box torsion filtration

Prove: if a finite-dimensional smooth `K`-module `V` has `soc_K V = F(λ)` with `2 < r_i < p−3`,
`[V : F(λ)] = 1`, and every constituent of `V` occurs in `Inj_Γ F(λ)`, then `K₁` acts trivially on
`V`. For `V(λ, ε, B)`, keep the predecessor parity condition and assume `3 + 2⌊B_i/2⌋ ≤ r_i ≤ p−4`
when `ε_i = −1` and `3 ≤ r_i ≤ p − 4 − 2⌊B_i/2⌋` when `ε_i = +1`; then for
`0 ≤ n − 1 ≤ Σ_i ⌊B_i/2⌋`, `V[𝔪_{K₁}^n]` has cosocle `⊕ σ_a` over the `a` with `0 ≤ a_i ≤ B_i`,
each `a_i` odd or equal to `B_i`, and `Σ_i ⌊a_i/2⌋ = n − 1`, and it is the union of the
corresponding lower intervals (BHHMS23, Lemma 6.2.3 and Proposition 6.2.4, pp. 60–61). *Needs:*
§§5.6, 6.1; RepresentationTheory/QuiverRepresentations Layer 3; SmoothRepresentationsOfLocalGroups
*compact-open-invariants*.

**Checks.**

- The `K₁`-depth is counted by `Σ ⌊a_i/2⌋`, not by the box rank `Σ a_i`: for `f = 1`, `B = 3`, the
  constituents `a = 0, 1` are `K₁`-invariant and `a = 2, 3` are in the second layer.
- `n = 1` gives `V[𝔪_{K₁}] = V^{K₁}`, the lower interval below the constituents with
  `⌊a_i/2⌋ = 0` for all `i`, that is `a_i ≤ 1`.
- The filtration is not a direct sum decomposition: `V(λ, ε, B)` is indecomposable with simple socle.

### 6.3 Cosocles and Ext control after Iwahori induction

Write `χ = χ_λ`. Prove: for `χ′ = χα_i^{−1}`, `Ind_I^K E_{χ′,χ}` and `Ind_I^K χ` have the same cosocle;
for `χ′ = χα_i` and `0 < r_j < p−3`, `Ind_I^K E_{χ′,χ}` is multiplicity-free; for `2 < r_j < p−3`,
`Ind_I^K W_{χ,2}` is multiplicity-free; and under these bounds, with `σ_χ = F(λ)`, the image of the
nonzero map `P_{σ_χ} → Ind_I^K E_{χα_i,χ}` (unique up to scalar) has constituents the intersection
of the two Jordan–Hölder sets, and for every quotient `Q` of this induced extension with
`[Q : σ_χ] = 0`, `Ext¹_K(τ, σ_χ) = 0` for all `τ ∈ JH(Q)` (BHHMS23, Lemmas 6.3.1 and 6.3.3–6.3.5,
pp. 61–63). *Needs:* §§5.1, 5.3, 6.1; RepresentationTheory/QuiverRepresentations Layer 3;
SmoothRepresentationsOfLocalGroups *frobenius-reciprocity*.

**Checks.**

- The two root directions behave differently: for `χ′ = χα_i^{−1}` the cosocle does not grow, for
  `χ′ = χα_i` the induced module is multiplicity-free of length `2^{f+1}`.
- For `f = 1`, `Ind_I^K χ` has length two (§5.3), and `Ind_I^K E_{χα,χ}` has length four.

### 6.4 The Diamond boxes `D_{λ,ε}`

For 1-deep `λ` and `ε ∈ {−1, 0, 1}^J` let `J_ε = {i : ε_i ≠ 0}` and
`D_{λ,ε} = I(F(λ), F(t_λ(Σ_i ε_i η_i)))` (§5.3). Prove that its constituents are
`F(t_λ(Σ_{i∈A} ε_i η_i))`, `A ⊆ J_ε`, with the Boolean lower-interval submodule order; it has length
`2^{|J_ε|}`, socle `F(λ)` and cosocle `F(t_λ(Σ ε_i η_i))`; `D_{λ,−𝟙} = Ind_I^K χ_λ^s`; and for 2-deep
semisimple `ρ̄` each `D_{0,σ}(ρ̄)` of §3.5 is of this form with all `ε_i = ±1` (BHHMS23, equation (48)
and Remark 6.3.6, p. 63). *Needs:* §§3.5, 5.3.

API:

- `JH(D_{λ,ε})` is the labelled Boolean box of subsets of `J_ε`.
- `soc D_{λ,ε} = F(λ)` and `cosoc D_{λ,ε} = F(t_λ(Σ ε_i η_i))`.
- `D_{λ,−𝟙} ≅ Ind_I^K χ_λ^s`.

**Checks.**

- `ε = 0`: `D_{λ,0} = F(λ)`, length one.
- Exactly one nonzero sign: the nonsplit extension of length two.
- Two nonzero signs: four constituents and two incomparable middle submodules, not a chain.

### 6.5 Tensoring Diamond boxes by an adjoint factor

Prove, for `2 < r_i < p−4`: `D_{λ,ε} ⊗ F(α_j)` (with `F(α_j) = A_j`) is multiplicity-free with
constituents `F(t_λ(2uη_j + Σ_{i∈A} ε_i η_i))`, `u ∈ {−1,0,1}`, `A ⊆ J_ε`; its socle has the three
labels `2uη_j` and its cosocle the three labels `2uη_j + Σ ε_i η_i`. If `λ` is 4-deep and `ε_j ≠ 0`,
it has an increasing three-step filtration with graded pieces `D_{λ+ε_jα_j, ε}`, `D_{λ,ε}`,
`D_{λ−ε_jα_j, ε}`, the first embedding having cokernel with socle `F(λ) ⊕ F(t_λ(−2ε_jη_j))`; if
`ε_j = 0` the tensor product is the direct sum of the three root shifts. If `λ` is 5-deep, every pair
of adjacent constituents occurs, in one orientation, as a nonsplit length-two subquotient
(BHHMS23, Lemmas 6.3.7–6.3.9 and Proposition 6.3.10, pp. 63–68). Route: §5.5 for a single weight;
the explicit length-two computation of Lemma 6.3.9 (three successive nonsplit length-two layers with
labels `(2ε, 3ε)`, `(0, ε)`, `(−2ε, −ε)` along `η_j`); glue across the Boolean box. *Needs:* §§3.3, 5.5,
6.3, 6.4; RepresentationTheory/QuiverRepresentations Layer 3.

**Checks.**

- The filtration is not split: the extensions between successive graded pieces are nonsplit.
- `ε = 0`: `F(λ) ⊗ A_j = F(λ − α_j) ⊕ F(λ) ⊕ F(λ + α_j)`, which is §5.5.
- Dimension: `dim(D_{λ,ε} ⊗ A_j) = 3 dim D_{λ,ε}`, and the constituent count is `3 · 2^{|J_ε|}`.

### 6.6 The maximal first-order enlargement of a Diamond box

Assume `λ` 7-deep and `ε ∈ {±1}^J`. Put `𝒲_{−ε} = {F(t_λ(−Σ_{i∈A} ε_i η_i)) : A ⊆ J}` and let `W` be the
largest submodule of `Inj_{K/Z₁} F(λ)[𝔪_{K₁}²]` with `[W : τ] = δ_{F(λ),τ}` for `τ ∈ 𝒲_{−ε}`. Prove
that `W` is multiplicity-free, `W^{K₁} = D_{λ,ε}`, and
`0 → D_{λ,ε} → W → ⊕_i D_{λ+ε_iα_i, ε} → 0` is exact; its cosocle has the labels
`2ε_jη_j + Σ ε_i η_i`, one for each `j`; and the unique submodule with cosocle `σ_a` consists of the
constituents `σ_b` of `W` with `0 ≤ b_i ≤ a_i` (BHHMS23, Theorem 6.3.11, pp. 68–69). Route: sums of
submodules preserving the protected multiplicities preserve them, giving `W`; `W/D` embeds into
`D ⊗ H¹(K₁/Z₁, k)` and the adjoint filtration of §6.5 selects the allowed shifted boxes. *Needs:*
§§3.5, 5.6, 6.2, 6.5; NoncommutativeAndEquivariantIwasawa §0.13; SmoothRepresentationsOfLocalGroups
SR.0d.1.

API:

- Every submodule of `Inj_{K/Z₁}F(λ)[𝔪_{K₁}²]` preserving the protected multiplicities lies in `W`.
- `W^{K₁} = D_{λ,ε}` and `𝔪_{K₁}² W = 0`.
- `W/D_{λ,ε} ≅ ⊕_i D_{λ+ε_iα_i, ε}`.

**Checks.**

- `f = 1`: `W` has length four, `D` of length two and the single shifted box of length two.
- An opposite neighbour `F(t_λ(−ε_jη_j))` does not occur in `W`: it is protected.
- `W ≠ W^{K₁}` for every `f ≥ 1`: replacing the first-order truncation by its invariants loses the
  quotient, and the quotient by `D` is a sum of shifted boxes while `W` itself is indecomposable.

### 6.7 Multiplicity-preserving enlargement of a tame socle

Let `ρ̄` be tame with `μ − η` 8-deep, and `τ = ⊕_{σ∈W(ρ̄)} σ^{m_σ}`, `m_σ ≥ 1`. Prove that the largest
submodule `V ⊆ Inj_{K/Z₁} τ [𝔪_{K₁}²]` preserving these multiplicities splits as `⊕ V_σ^{m_σ}`, that
distinct `V_σ` have disjoint Jordan–Hölder sets, that for `σ = F(λ)` with its signed box
`V_σ^{K₁} = D_{0,σ}(ρ̄)` and the constituents of `V_σ` are the `σ_a` with `a_i ≥ 0` and
`Σ ⌊a_i/2⌋ ≤ 1` inside the box support (`a_i ≤ 3`), with the lower-interval order; hence
`V^{K₁} = ⊕ D_{0,σ}(ρ̄)^{m_σ}` (BHHMS23, Corollaries 6.3.13 and 6.3.15, pp. 69–71). *Needs:* §§3.4,
3.5, 6.6.

**Checks.**

- The multiplicities `m_σ` are carried by the invariants; no multiplicity-one assumption on the
  socle is made.
- For `f = 1`, `W(ρ̄)` has two weights `σ₁, σ₂`, and `V_{σ₁}`, `V_{σ₂}` have disjoint constituents, each
  of length four.

### Examples

- `f = 1`, `p = 17`, `λ = (8,0)`, `ε = −1`: `D_{λ,−1} = Ind_I^K χ_λ^s` has constituents `Sym^8` and
  `Sym^8 ⊗ det^8`, and `W` adds the shifted box `D_{λ−α,−1}`.
- `f = 2`, `ε = (+1,+1)`: `D_{λ,ε}` has four constituents indexed by `A ⊆ {0,1}`, and `W/D` is the sum
  of two shifted boxes of length four each.

### Dependencies

Layers 3 and 5; NoncommutativeAndEquivariantIwasawa §0.13; SmoothRepresentationsOfLocalGroups
SR.0d.1, *compact-open-invariants*, *frobenius-reciprocity*; RepresentationTheory/QuiverRepresentations
Layer 3.

## Layer 7: Multiplicity one and the local dimension bound

`p > 3`, `F` unramified of degree `f`, `k` large enough; `π` is an admissible smooth
`k`-representation of `G = GL₂(F)`.

### 7.1 Connected semisimple Iwahori character sets

Call a semisimple smooth `I`-representation `V` *connected* when for all distinct characters
`χ, χ″` occurring in `V` with `χ″` in `soc_I W_{χ,3}`, there is a character `χ′` occurring in `V` with
`Ext¹_{I/Z₁}(χ, χ′) ≠ 0` and `Ext¹_{I/Z₁}(χ′, χ″) ≠ 0` (BHHMS23, Definition 6.4.2, p. 72; Lemma 6.4.3,
pp. 72–73). The condition depends only on the set of characters occurring, and asks for a middle
character on every length-two extension path inside `W_{χ,3}`; it is not graph connectedness.
*Needs:* §§4.6, 5.1.

API:

- Two semisimple representations with the same set of characters are connected or not together.
- For each qualifying pair `(χ, χ″)` a connected `V` contains a middle character `χ′` with both Ext
  groups nonzero.
- Twisting all characters by one smooth character preserves connectedness.

**Checks.**

- A single character, with any multiplicity, is connected (no distinct pairs).
- `f = 1`, `p = 17`: `{1, α²}` is not connected, since `α² ∈ soc W_{1,3}` and the middle character `α`
  is absent; `{1, α, α²}` is connected.
- Doubling every multiplicity preserves connectedness; a set of characters pairwise far apart
  (no `χ″ ∈ soc W_{χ,3}`) is connected although its extension graph is disconnected.

### 7.2 Vanishing on an induced Loewy-three socle

Let `χ = χ_λ` with `2 < r_i < p−3`. Suppose a finite-length smooth `I`-module `W` has socle and cosocle
`χ`, `soc W ⊊ rad W`, and `rad W / soc W` semisimple. For every nonzero quotient `Q` of `Ind_I^K W`
with `[Q : F(λ)] = 1`, the adjunction map `W → Q|_I` vanishes on `soc W = χ` (BHHMS23,
Proposition 6.4.1, pp. 71–72). Route: if the socle survived, pass to a quotient with irreducible
`K`-socle `F(λ)` inside its finite injective hull, split the middle layer into positive and negative
root extensions, and use §6.3 to produce two copies of `F(λ)`. *Needs:* §§5.1, 6.2, 6.3.

**Checks.**

- Loewy length three is used: for `W = χ` (Loewy length one) the adjunction map `χ → (Ind_I^K χ)|_I`
  is nonzero on `χ`.
- The numerical bounds: for `f = 1`, `p = 17`, `r = 8` satisfies `2 < r < p − 3 = 14`; for `p = 7` only
  `r = 3` is allowed, and for `p ≤ 5` the statement is empty.

### 7.3 Connectedness of tame Diamond invariants

For tame `ρ̄` with `μ − η` 6-deep, prove that `D₁(ρ̄)` is connected; hence so is every semisimple
`I`-representation with the same characters (BHHMS23, Lemma 6.4.3, pp. 72–73, in the tame case).
Route: `JH(D₀(ρ̄))` is the signed box `−1 ≤ a_i ≤ 2`; a two-step difference cannot use one embedding
twice without leaving the box; for distinct embeddings switch one coordinate at a time, the
intermediate principal series still meeting `W(ρ̄)`. *Needs:* §§3.3, 3.5, 6.4, 7.1.

**Checks.**

- Consistency with §7.6: connectedness is a hypothesis of §7.5, and §7.3 discharges it for every
  `π` with `JH(π^{I₁}) = JH(D₁(ρ̄))`, which is hypothesis (iii) of §7.6; the depth `6` here is
  weaker than the depth `8` there.
- Only tame `ρ̄` is treated; no statement is made for wild nonsplit `ρ̄`.

### 7.4 No new maps from the second Iwahori radical layer

Assume `π[𝔪_{K₁}²]` embeds into `⊕_{σ∈S} D̃_σ^{m_σ}`, `m_σ ≥ 1`, with `soc_K D̃_σ = σ`, that
`D̃ = ⊕_S D̃_σ` is multiplicity-free, and that every constituent `τ` of `D̃` has `χ_τ ≠ χ_τ^s`
(equivalently `1 < dim_k τ < q`). For every `χ = χ_λ` occurring in `π^{I₁}` with `2 < r_i < p−3`,
the quotient `W_{χ,2} → χ` induces `Hom_I(χ, π) ≅ Hom_I(W_{χ,2}, π)`; and for every `χ′` in `π^{I₁}`
with `Ext¹_{I/Z₁}(χ, χ′) ≠ 0` there is no embedding `E_{χ′,χ} → π` (BHHMS23, conditions (a)–(b),
p. 73; Lemma 6.4.4 and Corollary 6.4.5, pp. 74–75). The action of `w = (0 1; p 0)`, which normalises
`I₁` and exchanges the root directions, is used; the statement is about `G`-representations, not
arbitrary `K`-modules. *Needs:* §§4.6, 6.3.

**Checks.**

- `w` normalises `I₁` and exchanges the root directions: for `g = (a b; pc d)`,
  `w g w⁻¹ = (d c; pb a)`, so the upper entry `b` and the lower entry `pc` are swapped.
- The hypothesis `χ_τ ≠ χ_τ^s` excludes the one-dimensional and the `q`-dimensional weights, for
  which `χ_τ = χ_τ^s`.

### 7.5 Multiplicity one through the third Iwahori layer

Under the hypotheses of §7.4, assume also that `π^{I₁}` is connected (§7.1). Then for `χ = χ_λ` in
`π^{I₁}` with `2 < r_i < p−3`, `W_{χ,3} → χ` induces `Hom_I(χ, π) ≅ Hom_I(W_{χ,3}, π)` (BHHMS23,
Proposition 6.4.6, p. 75). Route: connectedness and the embeddings `W_{χ′,2} → W_{χ,3}` of §5.1 force
a map to vanish on the bottom characters other than `χ`; the rest lies in `π[𝔪_{K₁}²]`, and the
induced `K`-image contradicts §7.2 unless the map factors through `χ`. The genericity
`2 < r_i < p−3` forces `p ≥ 7`, so the `p = 5` collision of §5.1 does not enter. *Needs:* §§5.1, 7.1,
7.2, 7.4.

**Checks.**

- The bound `p ≥ 7`: `2 < r_i < p−3` has a solution only when `p − 3 > 3`.
- Without connectedness the statement is not claimed: for `f = 1`, `p = 17`, a `π` whose
  `π^{I₁}` has exactly the characters `{1, α²}` is not connected (§7.1), and §7.5 does not apply.

### 7.6 The local Gelfand–Kirillov bound

Assume `p > 3`, `F/ℚ_p` unramified of degree `f`, `ρ̄ : G_F → GL₂(k)` tame with `ρ̄|_{I_F} ≅ τ(s, μ)`
and `μ − η` 8-deep, and `π` an admissible smooth `k`-representation of `GL₂(F)` with a central
character such that (i) `JH(soc_K π) = W(ρ̄)` as sets; (ii) `[π[𝔪_{K₁}²] : σ] = [soc_K π : σ]` for every
`σ ∈ W(ρ̄)`; (iii) `JH(π^{I₁}) = JH(D₁(ρ̄))` as sets. Then `dim_{GL₂(F)} π ≤ f` (BHHMS23, Theorem 6.4.7,
p. 76, and Theorem 1.4, pp. 5–6). Route: the central character is trivial on the pro-`p` group `Z₁`;
(i)–(ii) embed `π[𝔪_{K₁}²]` into the enlargement of §6.7, which satisfies the hypotheses of §7.4;
(iii) and §7.3 give connectedness; §7.5 and §4.7 give `dim_I π ≤ f`, and §4.1 transfers it to
`GL₂(F)`. The conclusion is an upper bound; equality is not part of this roadmap. *Needs:* §§4.1, 4.7,
6.7, 7.3, 7.5.

**Checks.**

- Only `≤ f` is asserted. BHHMS23, Theorem 1.10, proves `dim = f` for the global representations
  considered there, with further input; hypotheses (i)–(iii) are not claimed to imply equality.
- `f = 1`: the bound reads `dim_{GL₂(ℚ_p)} π ≤ 1`, the Gelfand–Kirillov dimension of an irreducible
  supersingular or principal series representation of `GL₂(ℚ_p)`.
- The central character hypothesis is used: it makes `Z₁` act trivially, so that `π` is a
  representation of `I/Z₁` as §4.7 requires.

### Examples

- For `f = 1`, `k ⊇ 𝔽_{p²}` (§3.4, niveau two) and `ρ̄ = ind(ω₂^{r+1})` irreducible with `r` generic,
  `W(ρ̄) = {Sym^r, Sym^{p−1−r} ⊗ det^r}`, which is the `K`-socle of the supersingular representation
  `Π(r, 0, 1)` of PadicLocalLanglandsForGL2Qp §2.7; so (i) holds for it, and `dim Π(r,0,1) = 1 ≤ f`.
- For `f = 2` the bound reads `dim_{GL₂(ℚ_{p²})} π ≤ 2`, while `dim GL₂(ℚ_{p²}) = 8`.

### Dependencies

Layers 3–6.

## Layer 8: Bockstein maps and projective-cover lattices

`p > 2` (and `p > 3` where Layer 5 is used), `F` unramified of degree `f`, `L/ℚ_p` unramified with
`𝒪 = W(k)`, `Γ = GL₂(k_F)`, `P_σ = Proj_Γ σ` and `P̃_σ` its projective lift (§5.4).

### 8.1 The infinitesimal action and the coinvariant Bockstein sequence

Let `V°` be a `K/Z₁`-stable finite free `𝒪`-lattice in a continuous finite-dimensional
`L`-representation, with `K₁` acting trivially on `V°/p`. For `x ∈ sl₂(k_F)` and `v ∈ V°/p`, choose
lifts `x̃ ∈ sl₂(𝒪_F)`, `ṽ ∈ V°` and put `β_{V°}(x ⊗ v) = p^{−1}(ρ(exp(p x̃))ṽ − ṽ) mod p`. Prove that this is
a well-defined `K`-equivariant `k`-linear map `sl₂(k_F) ⊗_{𝔽_p} (V°/p) → V°/p`, and that
`sl₂(k_F) ⊗ (V°/p) → V°/p → (V°/p²)_{K₁} → V°/p → 0`, with second map multiplication by `p`, is exact
(BHHMS23, §7.1 and Lemma 7.1.1, pp. 76–77). The sequence uses coinvariants `(−)_{K₁}`. *Needs:*
NoncommutativeAndEquivariantIwasawa §0.13 (`exp(p·)` identifies `sl₂(𝒪_F)/p` with the Frattini
quotient of `K₁/Z₁`); SmoothRepresentationsOfLocalGroups *coefficient-change*; Mathlib
`Representation`.

API:

- `β_{V°}` is independent of both lifts and is `K`-equivariant.
- For a lattice `T` with trivial `K₁`-action, `β_{V° ⊗ T} = β_{V°} ⊗ id_{T/p}`.
- For `sl₂(𝒪_F) ⊗_{ℤ_p} 𝒪` with the adjoint action, `β(x ⊗ y) = [x, y]`.

**Checks.**

- If `K₁` acts trivially on `V°`, `β = 0` and the sequence reduces to `0 → V°/p → V°/p² → V°/p → 0`.
- Adjoint lattice: `β(e ⊗ f) = h` with `e` upper, `f` lower, `h = diag(1,−1)`; a sign error in the
  exponential would give `−h`.
- Adjoint lattice: `β(h ⊗ e) = 2e`, not `−2e` or `0`.

### 8.2 Bockstein exactness for preimage lattices

With `V°` as in §8.1, `W ⊆ V°/p` a `K`-submodule and `V₁°` its preimage in `V°`, prove that
`sl₂(k_F) ⊗_{𝔽_p} W → V°/p → (V₁°/p²V°)_{K₁} → W → 0` is exact, compatibly with the sequence of §8.1 via the
inclusions (BHHMS23, Lemma 7.1.4, pp. 78–79). *Needs:* §8.1.

**Checks.**

- The middle term is `V₁°/p²V°`, not `V₁°/p²V₁°`: for `W = 0`, `V₁° = pV°` and `V₁°/p²V° = pV°/p²V° ≅ V°/p`,
  the sequence reads `0 → V°/p → V°/p → 0`, whereas `pV°/p²·pV°` would have twice the length.
- For `W = V°/p` it is the sequence of §8.1.

### 8.3 The adjoint contraction automorphism

For a 2-deep weight `λ = (a,b)` of `GL₂/k` with `r = a − b`, let `L(λ)` be the algebraic
highest-weight module and `v_λ` a highest-weight vector. Fix `d_λ : L(λ) → sl₂(k) ⊗ L(λ)` with
`d_λ(v_λ) = 2e ⊗ f v_λ + r h ⊗ v_λ`, and `ψ_λ = ([−,−] ⊗ id) ∘ (id ⊗ d_λ)` on `sl₂ ⊗ L(λ)`. Prove that on the
summands `L(λ+α)`, `L(λ)`, `L(λ−α)` of §5.5 it acts by `−2r`, `4`, `2(r+2)`, hence is invertible. For a
Serre weight `σ = F(λ)` with every component 2-deep, choose nonzero `d_{σ,i}` in each embedding
component; their sum `d_σ` gives an invertible `Ψ = ([−,−] ⊗ id) ∘ (id ⊗ d_σ)` on `sl₂(k_F) ⊗_{𝔽_p} σ`
(BHHMS23, Lemma 7.2.1 and Proposition 7.2.2, pp. 79–81). *Needs:* §§3.1, 5.5.

API:

- `d_λ` is determined by the displayed value on `v_λ` and `GL₂`-equivariance.
- `ψ_λ` has eigenvalues `−2r`, `4`, `2(r+2)` on the plus, middle and minus summands.
- After splitting `sl₂(k_F) ⊗ k = ⊕_i A_i`, `Ψ` is a sum of nonzero multiples of `ψ_{λ_i}` tensored with
  identities.

**Checks.**

- `p = 11`, `r = 3`: eigenvalues `−6 ≡ 5`, `4`, `10`, all nonzero in `𝔽_11`.
- `r = 0`: the plus eigenvalue `−2r` vanishes, so invertibility fails at that boundary.
- `r = p−2`: the minus eigenvalue `2(r+2) = 2p` vanishes.
- Rescaling one `d_{σ,i}` by a nonzero scalar keeps `Ψ` invertible; setting it to zero makes `Ψ` zero
  on the `i`-th summand.

### 8.4 The projective-cover gluing lattice

For 3-deep `σ = F(λ)` put `R₁ = P̃_σ` and `R₂ = sl₂(𝒪_F) ⊗_{ℤ_p} P̃_σ = ⊕_i R_{2,i}`. Fix the
decompositions `R_{2,i}/p ≅ P_σ ⊕ P_{F(λ−α_i)} ⊕ P_{F(λ+α_i)}` of §5.5 with inclusions
`ι_i : P_σ → R_{2,i}/p`, let `ι = (ι_i)_i`, `R₂′` the preimage of `ι(P_σ)` in `R₂`, and
`R = {(x₁, x₂) ∈ R₁ ⊕ R₂ : x₂ mod p = ι(x₁ mod p)}`. Prove that `R` is a `K`-stable full `𝒪`-lattice in
`(1 ⊕ sl₂(F)) ⊗_{ℚ_p} P̃_σ[1/p]`, and that the partial fibre products `L_j`, imposing the condition only
for `i ≤ j` (with `L_{−1} = R₁`), satisfy `L_{f−1} = R` (BHHMS23, §7.3, equations (56)–(57),
pp. 81–83; introduction, equation (7), p. 8). *Needs:* §§5.4, 5.5, 8.2, 8.3; Tau Ceti
`TauCeti.exists_isProjectiveCover_of_finite`.

API:

- `(x₁, x₂) ∈ R` exactly when every component of `x₂ mod p` equals `ι_i(x₁ mod p)`.
- `p(R₁ ⊕ R₂) ⊆ R ⊆ R₁ ⊕ R₂`, so `R[1/p] = (R₁ ⊕ R₂)[1/p]`.
- `L_j = L_{j−1} ×_{P_σ} R′_{2,j}` and `L_{f−1} ≅ R`.

**Checks.**

- `f = 1`: `R` is the set of pairs with `x₂ mod p = ι_0(x₁ mod p)`, the first partial fibre product.
- `f = 2`: the compatibility is one diagonal copy of `P_σ`: components `ι_0(u)`, `ι_1(v)` with `u ≠ v`
  cannot both match the same `x₁`.
- `rank_𝒪 R = (1 + 3f) dim_k P_σ`; the reduction condition changes the index, not the rank.
- With no adjoint component, `L_{−1} = P̃_σ`.

### 8.5 Coinvariants and reduction of the gluing lattice

With the data of §8.4, prove that `(R₂′/pR₂′)_{K₁} ≅ P_σ`, the induced map `R₂′/p → ι(P_σ)` being this
quotient; that there is a `K`-equivariant exact sequence `0 → R₂/pR₂ → R/pR → P_σ → 0` whose right
map induces `(R/pR)_{K₁} ≅ P_σ`; and that tensoring `σ → P_σ` with `sl₂(k_F)` identifies its image with
the socle of `sl₂(k_F) ⊗ P_σ`, dually for the cosocle (BHHMS23, Proposition 7.3.1, Lemma 7.3.2 and
Theorem 7.3.3, pp. 82–84). Both isomorphisms are statements about coinvariants. *Needs:* §§5.5,
8.2–8.4.

**Checks.**

- `dim_k (R/pR) = dim R₂/pR₂ + dim P_σ = (3f + 1) dim P_σ`.
- `(R/pR)_{K₁} = P_σ` is the largest `K₁`-trivial quotient; the `K₁`-invariants of `R/pR` contain
  `R₂/pR₂`-classes and are not `P_σ`.

### 8.6 The first radical truncation of a projective cover

For 3-deep `σ`, prove that `cosoc_K(R/pR) = σ` and `R/pR ≅ Proj_{K/Z₁}(σ)/𝔪_{K₁}² Proj_{K/Z₁}(σ)` as
`K`-representations, so `dim_k (R/pR) = (3f+1) dim_k P_σ`; in the notation of the introduction this is
`L_{f−1}/pL_{f−1}` (BHHMS23, Corollary 7.3.4, p. 84; Theorem 1.7, p. 8). The cover is the
pseudocompact `K/Z₁`-cover of §4.6, not a `K₁/Z₁`-cover; three subscripts in the printed proof of
Corollary 7.3.4 read `K₁/Z₁` where the `K/Z₁` cover of the statement is meant. Route: §8.5 and
Nakayama give simple cosocle and a surjection from the truncated cover; both outer terms of §8.5
are `K₁`-trivial, so `𝔪_{K₁}²` kills `R/pR`; compare dimensions using `dim H¹(K₁/Z₁, k) = 3f`.
*Needs:* §§4.6, 5.6, 8.4, 8.5; NoncommutativeAndEquivariantIwasawa §0.13.

**Checks.**

- `dim Proj_{A₁} σ = (1 + 3f) dim P_σ` from the filtration of §5.6, matching `rank_𝒪 R`.
- `f = 1`, `p = 11`, `σ = Sym^5`: `dim (R/pR) = 4 dim P_σ`.
- A `K₁/Z₁`-cover of the trivial module has dimension `1 + 3f` after truncation and does not carry
  the `Γ`-structure: it is not `R/pR`.

### Examples

- `f = 1`: `R ⊂ P̃_σ ⊕ (sl₂(ℤ_p) ⊗ P̃_σ)` is cut out by one congruence, and `R/pR` is an extension of
  `P_σ` by `sl₂(𝔽_p) ⊗ P_σ`.
- For the adjoint lattice, the Bockstein map is the Lie bracket (§8.1), and `Ψ` of §8.3 is the
  contraction with `d_σ`.

### Dependencies

Layers 3–5; NoncommutativeAndEquivariantIwasawa §0.13; SmoothRepresentationsOfLocalGroups
*coefficient-change*; Tau Ceti projective covers.

## Layer 9: Endomorphisms and relative projectivity

Same setting as Layer 8; `T_σ = R_σ/pR_σ ≅ Proj_{K/Z₁}σ/𝔪_{K₁}²` (§8.6), a module over the
finite-dimensional algebra `A₁ = k[[K/Z₁]]/𝔪_{K₁}²`.

### 9.1 Endomorphisms of the first projective truncation

For `σ = F(λ)` with `2 < r_i < p−4` for all `i`, prove that `End_K(Proj_{K/Z₁}σ/𝔪_{K₁}²)` is commutative
(BHHMS23, Proposition 7.4.1, pp. 84–85), of `k`-dimension `2^f(f+1)` (from its proof). Route: after a
finite unramified extension, `R[1/p]` is a sum of `2^f(f+1)` pairwise distinct absolutely irreducible
`K`-representations (§5.5 for `L′ ⊗_𝒪 P̃_σ`, tensored with the trivial and the `f` adjoint factors), so
`End(R)` is commutative and torsion-free of rank `2^f(f+1)`; `[R/pR : σ] = 2^f(f+1)` equals
`dim End_K(R/pR)`, so reduction of endomorphisms is surjective. Finite extension of scalars preserves
the dimension and detects commutativity (§0.6). *Needs:* §§0.6, 5.4, 5.5, 8.4, 8.6.

**Checks.**

- `f = 1`: `dim End = 2 · 2 = 4`, and
  `[R/pR : σ] = [P_σ : σ] + ([P_σ : σ] + [P_{F(λ−α)} : σ] + [P_{F(λ+α)} : σ]) = 2 + (2 + 0 + 0) = 4`,
  the shifted covers not containing `σ` (§5.5).
- Commutativity in characteristic zero alone is insufficient; the dimension count gives the
  surjectivity that transfers it to the reduction.
- The bounds `2 < r_i < p−4` force `p ≥ 8`, that is `p ≥ 11`.

### 9.2 Cyclic Hom modules between projective truncations

Assume `5 < r_i < p−7`. For every Serre weight `τ` in `JH(T_σ)`, prove that `Hom_K(T_τ, T_σ)` is cyclic as a
right `End_K(T_τ)`-module under precomposition (BHHMS23, Lemma 7.4.2, p. 85). Route: the unique
multiplicity-free quotient of `T_σ` with socle `τ` and `σ` once (§5.6, dual form) gives a map from `T_τ`
by projectivity in `A₁`-modules, whose cokernel has no `τ`; then every map factors through it by
precomposition. *Needs:* §§5.6, 8.6, 9.1.

**Checks.**

- `τ = σ`: `Hom_K(T_σ, T_σ) = End_K(T_σ)` is cyclic, generated by the identity.
- The module structure is precomposition on the source; as a left `End_K(T_σ)`-module by
  postcomposition the statement is different and not claimed.
- The bounds force `p ≥ 14`, that is `p ≥ 17`: `p = 13` leaves `5 < r_i < 6`, empty, and `p = 17`
  gives `r_i ∈ {6, …, 9}`.

### 9.3 Relative projectivity of all quotients

Assume `5 < r_i < p−7`. For every quotient `Q` of `T_σ` and every subquotient `Q′` of `Q`, prove that
precomposition with `T_σ → Q` gives `Hom_K(Q, Q′) ≅ Hom_K(T_σ, Q′)`; and if `cosoc_K Q′ ≅ σ` there is a
`K`-equivariant surjection `Q → Q′`. Equivalently `Q` is projective in the smallest abelian
subcategory of `A₁`-modules containing all subquotients of `Q` (BHHMS23, Proposition 7.4.3 and
Remark 7.4.4, pp. 85–86). Route: for each constituent `τ`, `Hom(T_τ, Q)` is cyclic over the
commutative `End(T_τ)` (§§9.1–9.2), so every map into a subquotient kills `ker(T_σ → Q)`. *Needs:*
§§8.6, 9.1, 9.2.

**Checks.**

- `Q = T_σ`: the statement is the projectivity of `T_σ` among `A₁`-modules.
- `Q = σ`: `Hom(σ, σ) = k = Hom(T_σ, σ)`, the isomorphism holds, and the subcategory is semisimple.
- Projectivity is relative: a proper quotient `Q` of `T_σ` with two constituents is not projective
  among all `A₁`-modules, since its projective cover is `T_σ`.

### Examples

- For `f = 1`, `T_σ` has dimension `4 dim P_σ`, `End_K(T_σ)` is a commutative local `k`-algebra of
  dimension four, and every quotient of `T_σ` is projective relative to its own subquotients.
- The quotient `σ` of `T_σ` has `Hom(σ, Q′) = Hom(T_σ, Q′)` for its only subquotients `0` and `σ`.

### Dependencies

Layers 0 (§0.6), 5 and 8.

## Downstream consumers

- HilbertModularVarietiesAndShimuraCurvesPartII: Layers 3–9 at a place above `p`, for its
  Gelfand–Kirillov dimension theorem for mod `p` quaternionic cohomology: the weight coordinates,
  the tame weight set and the Diamond modules (§§3.1–3.5), Gelfand–Kirillov dimension and its
  comparisons (§§4.1–4.2), the finite and first-order weight hulls and the projective lifts with
  their adjoint decomposition (§§5.3–5.6), the Diamond boxes and their enlargements (§§6.4–6.7),
  connectedness and the local dimension bound (§§7.1, 7.3, 7.6), the gluing lattice and its
  truncation (§§8.4–8.6) and relative projectivity (§9.3).
- ScholzeFunctorAndModpCohomologyOfTheLubinTateTower: torsion admissibility, finite presentation,
  the exact-sequence calculus and coherence of Layer 0 (§§0.1, 0.3–0.5), Hom base change and the
  residue fields of irreducibles (§0.6), the central-character and `Ext¹` support of §1.4 and the
  `ℚ_p` criteria of §§1.3, 1.5 and 1.6.
- LocalGaloisDeformationRingsPartII: the weight coordinates, the extension-graph map and the tame
  weight set of §§3.1–3.4, for the Serre-weight side of local deformation rings of `GL₂` over
  unramified `F`.
- ProetaleCohomologyOfPAdicCurvesAndTowers: the finite-presentation calculus and coherence of
  Layer 0 (§§0.3–0.5, 0.7), the category `𝒞` (§2.4) and, for `F ≠ ℚ_p`, the induced approximation
  of admissible Banach lattices (§2.6).

Consumers that cite this roadmap by its former target identifiers find the content here:

| Former identifier (MP numbering) | Section here |
| --- | --- |
| MP.0 | Layer 0 |
| MP.0/torsion-admissibility | §0.1 |
| MP.0/finite-presentation | §0.3 |
| MP.0/finiteness-calculus | §0.4 |
| MP.0/amalgam-coherence | §0.5 |
| MP.0/scalar-extension | §0.6 |
| MP.1 | Layer 1 |
| MP.1/finite-type-presentation | §1.3 |
| MP.1/central-ext | §1.4 |
| MP.1/cosocle-length | §1.5 |
| MP.1/smooth-dual-length | §1.6 |
| MP.2 | Layer 2 |
| MP.2/category-c | §2.4 |
| MP.2/ordinary-banach | §2.6 |
| MP.3 | Layer 3 |
| MP.3/weight-coordinates | §3.1 (the extension-graph map is §3.2, change of origin §3.3) |
| MP.3/tame-weight-set | §3.4 |
| MP.3/diamond-socle | §3.5 |
| MP.4 | Layer 4 |
| MP.4/gk-dimension | §4.1 |
| MP.4/dimension-comparisons | §4.2 |
| MP.5 | Layer 5 |
| MP.5/finite-weight-hulls | §5.3 |
| MP.5/projective-adjoint | §§5.4–5.5 |
| MP.5/first-order-weight-hulls | §5.6 |
| MP.6 | Layer 6 |
| MP.6/diamond-box | §6.4 |
| MP.6/adjoint-tensor | §6.5 |
| MP.6/socle-enlargement | §6.7 |
| MP.7 | Layer 7 |
| MP.7/connected-characters | §7.1 |
| MP.7/diamond-connected | §7.3 |
| MP.7/local-gk-bound | §7.6 |
| MP.8 | Layer 8 |
| MP.8/projective-lattice | §8.4 |
| MP.8/lattice-coinvariants | §8.5 |
| MP.8/projective-truncation | §8.6 |
| MP.9 | Layer 9 |
| MP.9/relative-projectivity | §9.3 |

## Worked examples

- **The trivial weight over `ℚ_p`.** `σ = k`, `I(σ) = c-Ind_{KZ}^G k`. It is finitely presented
  (§0.3) and of infinite length; `I(σ)/(T−1)` has length two (Steinberg sub, trivial quotient),
  finite cosocle, one-dimensional smooth dual, and lies in `𝒞` (§2.4); its obstruction space for the
  presentation by `σ` is finite-dimensional (§2.3).
- **Coherence in action.** For `G′ = GL₂(F)/ϖ^ℤ`, `F` arbitrary, the kernel of the augmentation
  `c-Ind_{KZ}^G k → k` is finitely presented (§0.5), whereas for `F ≠ ℚ_p` the kernel of a surjection
  `c-Ind_{KZ}^G σ → π` onto a supersingular `π` is not even of finite type (§0.4).
- **Ordinary approximation.** For `F = ℚ_{p²}` and `V = St ⊗ χ∘det`, `Ord_B(V) = χ ⊗ χ` and the counit
  `Ind_{B̄}^G(χ⊗χ) → V` is onto with kernel `χ∘det` (§§2.2, 2.5).
- **Weights for `f = 1`, `p = 17`.** `λ = (5,0)`: `t_λ(1) = (−1,−10)`, `t_λ(−1) = (0,−11)`;
  `W(ρ̄) = {Sym^5, Sym^9 ⊗ det^6}` for `ρ̄|_I = ω^6 ⊕ 1` (§§3.2, 3.4).
- **The Iwahori algebra for `f = 1`.** `gr k[[I₁/Z₁]] = U(𝔥)` with `[e,f] = h`;
  `dim W_{χ,2} = 3`, `dim W_{χ,3} = 7`; `gr/𝔍_P = k[X,Y]/(XY)` of dimension one (§§4.4–4.6), giving
  the bound `dim ≤ 1` of §4.7.
- **The gluing lattice for `f = 1`.** `rank R = 4 dim P_σ`, `R/pR ≅ Proj_{K/Z₁}σ/𝔪_{K₁}²`,
  `End_K(R/pR)` commutative of dimension four (§§8.4–9.1).

## References

- **BHHMS23** — Christophe Breuil, Florian Herzig, Yongquan Hu, Stefano Morra, Benjamin Schraen,
  *Gelfand–Kirillov dimension and mod p cohomology for GL₂*, Invent. Math. 234 (2023), 1–128;
  locators use arXiv:2009.03127v7.
- **CDN23** — Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, *Factorisation de la cohomologie
  étale p-adique de la tour de Drinfeld*, Forum Math. Pi 11 (2023), e16; published text.
- **SHOTTON20** — Jack Shotton, *The category of finitely presented smooth mod p representations of
  GL₂(F)*, Doc. Math. 25 (2020), 143–157; locators use arXiv:1710.06003v3.
- **BP12** — Christophe Breuil, Vytautas Paškūnas, *Towards a modulo p Langlands correspondence for
  GL₂*, Mem. Amer. Math. Soc. 216 (2012), no. 1016; locators use the author copy.
- **EMERTON1** — Matthew Emerton, *Ordinary parts of admissible representations of p-adic reductive
  groups I. Definition and first properties*, Astérisque 331 (2010), 355–402; author copy.
- **EMERTON2** — Matthew Emerton, *Ordinary parts of admissible representations of p-adic reductive
  groups II. Derived functors*, Astérisque 331 (2010), 403–459; author copy.
- **HAUSEUX** — Julien Hauseux, *Extensions entre séries principales p-adiques et modulo p de G(F)*,
  J. Inst. Math. Jussieu 15 (2016); locators use arXiv:1307.1818v3.
- **DEG** — Andrea Dotto, Matthew Emerton, Toby Gee, *Localization of smooth p-power torsion
  representations of GL₂(ℚ_p)*; author copy (assumes `p ≥ 5`).
- **HW22** — Yongquan Hu, Haoran Wang, *On the mod p cohomology for GL₂: the non-semisimple case*;
  locators use arXiv:2009.09640v4.
- **VIGNERAS11** — Marie-France Vignéras, *Le foncteur de Colmez pour GL(2,F)*, Arithmetic Geometry and
  Automorphic Forms, ALM 19 (2011), 531–557; locators use arXiv:0909.4003v1 (§5: Théorème 6,
  pp. 19–21; Proposition 8 and Lemme 11, p. 21; Propositions 9–10, p. 22), whose numbering differs
  from the published Propositions 5.5–5.8.
- **LE19** — Daniel Le, *On some nonadmissible smooth irreducible representations for GL₂*, Math.
  Res. Lett. 26 (2019), 1747–1758; locators use arXiv:1809.10247v3.
- **HU12** — Yongquan Hu, *Diagrammes canoniques et représentations modulo p de GL₂(F)*, J. Inst.
  Math. Jussieu 11 (2012), 67–118; locators use arXiv:0904.3991v3.
- **KOHLHAASE17** — Jan Kohlhaase, *Smooth duality in natural characteristic*, Adv. Math. 317 (2017),
  1–49; author copy.
- **HU10** — Yongquan Hu, *Sur quelques représentations supersingulières de `GL₂(ℚ_{p^f})`*, J. Algebra
  324 (2010), 1577–1615; locators use arXiv:0909.0527v3.
- **LMS22** — Daniel Le, Stefano Morra, Benjamin Schraen, *Multiplicity one at full congruence
  level*, J. Inst. Math. Jussieu 21 (2022), 637–658; author copy.
- **LMS22-CORR** — Daniel Le, Stefano Morra, Benjamin Schraen, *Corrigé for Multiplicity one at full
  congruence level*; author copy, item (2).
- **SERRE-LRFG** — Jean-Pierre Serre, *Linear Representations of Finite Groups*, Graduate Texts in
  Mathematics 42, Springer (1977), Part III, Chapters 14–15.
- **SERRE-TREES** — Jean-Pierre Serre, *Arbres, amalgames, SL₂*, Astérisque 46, Société
  Mathématique de France (1977); Chapter II, §1.4, Théorème 3 and Corollaire 1 (Ihara).
- **BARTHEL-LIVNE94** — L. Barthel, R. Livné, *Irreducible modular representations of GL₂ of a
  local field*, Duke Math. J. 75 (1994), 261–292; Proposition 18, Theorem 30, Theorems 33–34 and
  Corollary 36, numbered as HU12 (pp. 16, 29) and BP12 (pp. 43–44) cite them; the classification
  is recorded in CDN23, §1.2.1.
