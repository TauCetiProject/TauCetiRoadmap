# Roadmap: arithmetic locally symmetric spaces and their cohomology

**Summary.** This roadmap builds the arithmetic locally symmetric spaces
`X_K = G(F)∖(X^G × G(𝔸_F^∞)/K)` of a connected reductive group `G` over a number field `F`, and the
integral cohomology
theory that the modularity and torsion-Galois papers use on them. It starts from the adelic level
quotients of the Tau Ceti roadmap AdelicAlgebraicGroups, the Cartan theory of
RepresentationTheory/LieGroups and the singular and sheaf cohomology of AlgebraicTopology. It
first builds real points of linear algebraic groups as Lie groups, equivariant sheaves for
topological groups, Lie algebra cochains, automorphic
forms and cusp forms, and cohomological representations at infinity, together with the handedness
and restriction-of-scalars extensions of shared perfectness and arithmetic adapters for supplied
sheaf functors
(Layer ALS.F). Ordinary-module perfectness is supplied by DerivedModuleAlgebra §1.E.0;
enhanced comparisons and traces are supplied by EtaleCohomologyFoundations §F.10.3; the topological
coefficient comparisons are supplied by ComplexComparisonPartII on its stated coefficient domain.
It then constructs in turn: the symmetric space with its
split-centre correction and the finite
decomposition of `X_K` into arithmetic quotients `Γ_i\X^G`, with neatness, stabilizers and the
orientation local system (Layer ALS.0); arithmetic local systems from coefficient modules and the
Betti complexes `RΓ(X_K, V)`, `RΓ_c(X_K, V)` and `RΓ(∂X̄_K, V)` at every level, with their
comparison to singular and group cohomology, finite models and derived coefficient change (ALS.1);
the Borel–Serre compactification, its compactness, its finite triangulations and its boundary strata
with their nilmanifold fibrations (ALS.2); Hecke actions in the derived category, as endomorphisms
and as strict objects over the Hecke algebra, with traces, the Mackey formula, twisting and
degeneracy maps (ALS.3); the boundary triangle, the cohomology of boundary strata through parabolic
restriction, van Est and Kostant, and boundary vanishing at non-Eisenstein maximal ideals, ending
with Newton–Thorne's theorem that the boundary cohomology of `GL_n` is Eisenstein (ALS.4);
Poincaré–Verdier duality with orientation coefficients and its Hecke adjoints (ALS.5a); the de Rham
and moderate-growth comparisons in characteristic zero, cuspidal cohomology, and the cohomological
consequences of Franke's theorem for `GL_n` and `U(n,n)` over CM fields, stated with their analytic
and Galois-theoretic inputs as explicit hypotheses (ALS.5b); and descent along finite covers with
the Hochschild–Serre spectral sequence (ALS.6).

The roadmap is wanted because every theorem of the form "torsion classes in the cohomology of a
locally symmetric space carry Galois representations" (Scholze; Newton–Thorne; Allen, Calegari,
Caraiani, Gee, Helm, Le Hung, Newton, Scholze, Taylor and Thorne; Calegari–Geraghty;
Caraiani–Newton) is a statement about these complexes, their Hecke actions and their boundaries. The
basic examples are modular curves and compact quaternionic quotients; higher-rank boundary strata
explain why the compactification and the supported complexes have to be developed together. Integral
coefficients keep torsion, derived coefficient change and stabilizer cohomology; characteristic-zero
comparisons use algebraic coefficient representations.

| Layer | Title | Headline targets |
| --- | --- | --- |
| ALS.F | Foundations and arithmetic adapters | realPoints_lieGroup, PerfectComplex.IsPerfect.restrictScalars, SheafDerived.pushforward, EquivariantSheaf, lieCochains, AutomorphicForm, cohomologicalRepresentation |
| ALS.0 | Symmetric spaces, arithmetic quotients and local geometry | `IsCartanInvolution`, realPoints_cartanDatum, symmetricSpace, X, X.componentDecomposition, X.manifold_of_neat, iwahori, taylorWilesLevel, orientationSystem |
| ALS.1 | Arithmetic coefficients and Betti complexes | localSystem, RΓ, RΓc, RΓrel, RΓ.refinementIndependence, RΓ.isoSingular, RΓ.isoGroupCohomology, RΓ.baseChange, RΓ.pullback |
| ALS.2 | Borel–Serre corners and boundary strata | BorelSerre.face, BorelSerre.bordification, BorelSerre.compact_quotient, BorelSerre.stratum, BorelSerre.unipotentLattice_cocompact, BorelSerre.stratum_fibration, BorelSerre.stratSpectralSequence, BorelSerre.stratumCompactification |
| ALS.3 | Finite-level Hecke actions and correspondences | Hecke.invariantsFunctor, Hecke.heckeRing_normal, heckeAction, heckeComplex, RΓ.trace, RΓ.mackey, derivedHeckeAlgebra, twistHecke, oldformSplitting |
| ALS.4 | Boundary complexes and Eisenstein localization | boundaryTriangle, Hecke.satakeUnnormalized, nomizu, kostant_splittingField, BorelSerre.stratum_kostant, heckeLocalize, IsEisenstein, boundary_isEisenstein_GL |
| ALS.5a | Finite-level duality with orientation coefficients | BorelSerre.manifoldWithBoundary, verdierDuality, dualityPairing, verdierDuality_hecke, verdierDuality_triangle |
| ALS.5b | Characteristic-zero and automorphic comparisons | deRhamIso, moderateGrowthIso, automorphicComparison, cuspidalCohomology, GaloisInput, nonEisenstein_cuspidal_range, unitary_middleDegree_cuspidal |
| ALS.6 | Finite covers and descent | RΓrel.descent, hochschildSerre, lowestDegree_descent, towerChecks |

`Suggested.lean` states the Cartan-involution predicate, existence and conjugacy of ALS.0.1
(`IsCartanInvolution`, `IsCartanInvolution.exists`, `IsCartanInvolution.conj`). Planned names of
the other targets and Checks are written as plain text: they label mathematical targets and are
not declarations of that file.

## Scope and ownership

**Owned here.** The foundations of Layer ALS.F: the real points of a linear algebraic group as a
Lie group with its maximal compact subgroups, the noncommutative group-ring applications and
handedness extensions of the shared perfectness interface, arithmetic adapters for supplied derived sheaf functors, equivariant
sheaves for topological groups, absolute and relative Lie
algebra cochains with the invariant-forms comparison, automorphic forms, constant terms and cusp
forms with the discreteness of the cuspidal spectrum, and algebraic weights, coefficient lattices
and the cohomological representations at infinity. Cartan involutions of real reductive groups as an
algebraic-group predicate, existence over arbitrary real groups, the comparison with
AdelicAlgebraicGroups’ inverse-adjoint datum on rational groups and restrictions of scalars, and the
comparison of the real points with the Lie-theoretic Cartan datum, the symmetric space `X^G` with
the split centre removed, the adelic quotient `X_K` as a topological space with its translations,
level maps, finite component decomposition, proper discontinuity, neat-level manifold structure and
orientation local system; standard Iwahori, `Γ_0`, `Γ_1`, `Γ_p` and Taylor–Wiles levels. Arithmetic
local systems with their monodromy convention; the equivariant compactified models and the Betti
complexes at arbitrary level with their independence of the neat refinement; the arithmetic
specializations and naturality of the supplied comparisons with singular cochains with local coefficients and with group cohomology; finite projective models;
derived coefficient change; pullback, translation, trace, the Mackey formula. The Borel–Serre
bordification, its compact quotients, finite triangulations, boundary strata, the cocompact
unipotent lattices and the nilmanifold fibrations of the strata, the compactifications and finite
models of the transported parabolic spaces, and the two boundary spectral sequences. The Hecke
action on invariants and on derived invariants for Hecke pairs, the Hecke
action on Betti complexes as endomorphisms and as a strict object, its correspondence description,
composition, compatibility with supports, boundary, coefficients and cup products, the
topological–discrete comparison, the derived Hecke algebra of an arithmetic complex, twisting by
characters, degeneracy maps. The boundary triangle, restriction to parabolics and the unnormalized
Satake map, the Hecke action on strata, the Nomizu–van Est comparison, Kostant's theorem over a
splitting field, the Kostant–van Est computation of strata, the Leray–Hochschild–Serre
sequence of a stratum, boundary gluing, Eisenstein and non-Eisenstein maximal ideals of arithmetic
complexes, the eigenvalue criterion for boundary vanishing, the `GL_n` and `U(n,n)` boundary
theorems. The manifold-with-boundary structure of `X̄_K`, Poincaré–Verdier duality with orientation
coefficients, the pairings, the Hecke adjoints, the dual boundary triangle and duality at non-neat
level. The de Rham comparison with flat bundles and relative Lie algebra cochains, Borel's
moderate-growth comparison, the automorphic comparison map, cuspidal cohomology, and the
characteristic-zero applications. Finite-level descent, the Hochschild–Serre sequence with Hecke
action, descent of the lowest localized degree, and the modular and quaternionic examples.

**Used from Tau Ceti roadmaps.** AdelicAlgebraicGroups supplies the adelic points, the split
component `A_G` (§2.1), rational parabolics and real Siegel coordinates (§§3.1–3.2), the algebraic
inverse-adjoint Cartan datum and its existence for connected reductive rational groups (§3.7),
finiteness of class numbers, level arithmetic groups, component decompositions, compactness criteria and unipotent
class number one (§3.4), finiteness of cusps and Siegel sets (§3.6), neat elements and levels
(§4.3), level quotients, level maps, finiteness of rational stabilizers, the proper arithmetic
action on level spaces, the covering property and fibre masses (§4.4) and Hecke
correspondences with their degrees (§4.5), and its worked examples for `GL_1`, `GL_2` over `ℚ` and
definite quaternion groups (§§5.1–5.3), which the checks below reuse; its level quotient
`LevelMaps.LevelQuotient` is the carrier that `X_K` specializes, never reconstructed here.
For rational groups, including `Res_{F/ℚ} G`, Cartan existence is supplied by AA.3.7; ALS.0.1
compares its datum with the compact-twist predicate and ALS.0.2 adapts it to LieGroups. Adelic
reduction theory uses its own datum without a dependency on arithmetic cohomology. Its Siegel
coordinates and the symmetric space use the same involution and fixed compact subgroup.
RepresentationTheory/LieGroups supplies the closed-subgroup theorem (Layer 2) and, in Layer 9 (the
Cartan, Iwasawa, and KAK decompositions), the Cartan, Iwasawa and `KAK` decompositions of a real
reductive group, with its notions of a Cartan involution and of a real reductive structure on an abstract Lie group.
RepresentationTheory/LieHighestWeight supplies the classification of finite-dimensional irreducible
modules of split semisimple and reductive Lie algebras in characteristic zero by dominant integral
highest weights, complete reducibility, and the centre of the enveloping algebra with the
Harish-Chandra isomorphism (Layers 4, 5, 7 and 9). ClassFieldTheory supplies the local and global
Artin maps, arithmetically normalized, with local–global compatibility and reciprocity (Layers 7,
10 and 11). AlgebraicTopology supplies local coefficient systems and
twisted and relative singular chains (Stage 2, item 6), cellular chains of CW pairs (Stage 4),
products, finite covers and transfer, including the permutation local system of a nonregular cover
(Stage 5, item 3), and twisted singular cochains, cup and cap products, the orientation local system
and Poincaré–Lefschetz duality for compact manifolds with boundary (Stage 6, items 1–4).
Ordinary-module perfectness for every unital ring, its elementary finite-model API and closure
laws are supplied by DerivedModuleAlgebra §1.E.0 / `DerivedDeRham.IsPerfect`, with
`PerfectComplex.IsPerfect` as its shared alias. The DG/module comparison, commutative
compact/dualizable characterization, traces and filtered trace additivity are supplied by
EtaleCohomologyFoundations §F.10.3 /
`PerfectComplex.lefschetzNumber`, `PerfectComplex.filteredTraceAdditivity`; bounded
constructible/ctf categories are supplied by EtaleCohomologyFoundations §F.1 /
`VanishingCycles.constructibleDerivedCategory` on the étale domain. The topological
local-coefficient comparison for finite commutative coefficients, and, over every commutative
coefficient ring on locally compact Hausdorff spaces, extension by zero, c-soft resolutions,
derived compact supports, supported pushforward and the open–closed localization triangle, are
supplied by ComplexComparisonPartII §C6.1 / `topologicalCoefficientComparison`; compact-support
Artin comparison is supplied by its §C6.4 / `artinComparisonCompactSupport` on separated
finite-type complex schemes. The `R`-linear derived categories of module sheaves on a
topological space, their K-injective replacements and the adjunction `f^* ⊣ Rf_*` are supplied
by EnhancedDerivedSheaves §§0.1–0.2 and 0.4; the abelian derived pushforward, cohomology
pullback and flasque computation of `Sheaf.H` by SchemeAndStackFoundations §§2.1 and 2.5. ALS.F.2 supplies opposite-ring duality,
noncommutative scalar-extension handedness, restriction of scalars and right-module Tor tests
on the shared predicate; ALS.F.3 adapts the supplied topological functors and owns the
comparison of `R`-linear derived sections with Mathlib's abelian sheaf cohomology, the stalk
formula and exactness of pushforward along proper finite-fibre maps, and the sheaf/singular
comparison for local systems with arbitrary stalk modules and its relative form.
DifferentialGeometry supplies differential forms (Layer 0), orientations (Layer 2), de Rham
cohomology (Layer 6) and the de Rham theorem with real constant coefficients (Layer 8); this roadmap
constructs the flat-bundle version and its compatibilities with arithmetic correspondences.
GeometricTopology supplies triangulations (Layer 11, `IsTriangulable`). Whitehead's smooth
triangulation theorem appears there only as item 1 ("Smooth implies PL") of the section *The
smoothing-and-triangulation comparison*, which is not a layer and does not treat manifolds with
boundary, so the boundary-compatible smooth triangulation of compact manifolds with boundary used
by ALS.2.4 and ALS.2.10 is a target of ALS.2.4. IntegralHeckeAndGaloisDeterminants supplies
derived Hecke
images, ghosts, finite local factors and idempotent splitting of a perfect complex with a
commutative action (Layer 2), the spherical Hecke polynomials (Layer 3a)
and the residual Galois-type and non-Eisenstein predicates (Layer 3b);
this roadmap applies them to arithmetic complexes. SmoothRepresentationsOfLocalGroups supplies
smooth representations (SR.0), derived invariants on the smooth derived category (SR.0d.2),
ring-valued Haar measures and convolution Hecke algebras (SR.1.1), the Hecke algebra of a level in
its permutation form over every coefficient ring, acting on invariants, with traces and its
comparison with Mathlib's `HeckeRing` (SR.1.2), Iwahori
decompositions and the positive Hecke monoid homomorphism (SR.1.4), the modulus character, Jacquet
functors and parabolic induction (SR.2.2) and the integral and normalized Satake transforms
(SR.4.1). ReductiveGroupsPartII supplies parahoric and Iwahori subgroups (RG2.3.3,
`parahoric-subgroup`), lattice-chain stabilizer group schemes (RG2.3.5), the Iwahori and pro-`p`
Iwahori subgroups of `GL_n` (`LevelSubgroups.iwahori`, `LevelSubgroups.proPIwahori`, in the examples
of Layer RG2.3, `classical-level-subgroups`), the Iwahori factorization (RG2.4.2,
`iwahori-factorization`) and the local Iwasawa decomposition with its integration formula (RG2.4.4,
`iwasawa-decomposition`, `iwasawa-integration-and-unimodularity`). ProfiniteCohomology supplies
restriction, corestriction and the Mackey double-coset formula in all degrees for open subgroups of
a profinite group (Layer 10), which this roadmap applies to finite discrete groups.

**Discrete equivariant cohomology.** ALS.F.4 supplies the category of equivariant module sheaves
on the topological spaces used here, enough injectives, invariant sections and their derived
functor (written `H^n(X, Γ; F)` below), including closed supports and localization. Its discrete
specialization applies without compactness. SchemeAndStackFoundations §2.23 supplies the
scheme-domain equivariant theory; no scheme structure on these arithmetic spaces is assumed.
This roadmap applies the equivariant derived functor to the open–closed short exact sequence
of equivariant sheaves to obtain its localization triangles. ALS.F.2 consumes the shared
general-ring perfectness predicate and supplies handedness, restriction of scalars and the
pseudo-coherence criterion with right-module Tor tests. ALS.F.3 adapts supplied topological functors; ALS.F.4
owns equivariant sheaves for topological (in particular locally profinite) groups.

**Not in this roadmap.** The arithmetic nilmanifolds of boundary strata are built here (ALS.2.6–2.8)
from the unipotent class-number and compactness theorems; filtered nilmanifolds and their
equidistribution are a separate subject. Franke's theorem that automorphic forms compute the
cohomology of `X_K`, and the Franke–Schwermer description of its summands, rest on Langlands' theory
of Eisenstein series and are not proved here; they enter, through the hypothesis `FrankeInput` of
ALS.5b.4, only the characteristic-zero applications that need them. The existence of
characteristic-zero Galois representations attached to cuspidal
automorphic representations of `GL_m` and `U(m,m)` over CM fields, and of residual representations
attached to torsion classes, uses Shimura varieties and the completed cohomology built on this
roadmap; such representations enter only as explicit hypotheses (`GaloisInput` in ALS.5b.7, the
general linear Galois-type conditions in ALS.4.12–4.13 and ALS.5b.8–5b.9, and
`ResidualUnitaryGaloisInput` for the smaller unitary factors in ALS.4.13). The latter is a
residual-cohomology contract, separate from the characteristic-zero cuspidal `GaloisInput`;
IntegralHeckeAndGaloisDeterminants supplies its predicate, not the arithmetic existence theorem.
Level systems, completed cohomology,
derived limits over levels and continuous profinite cohomology are not treated; the coefficient
limit in ALS.3.10 is at one fixed good level. ALS.6 exports
finite-level descent and refinement maps only. Shimura varieties, their
canonical models and their compactifications are not treated.

## Conventions

Let `F` be a number field, `G` a connected reductive `F`-group and `𝐆 = Res_{F/ℚ} G`. Write
`F_∞ = F ⊗_ℚ ℝ`. The maximal **`ℚ`-split central torus** of `𝐆` is `A_𝐆`; put `A_∞ = A_𝐆(ℝ)°`. `A`
Cartan
involution fixes `K_∞`. The spaces are

```text
X^G = G(F_∞)/(K_∞ A_∞),
X_K = G(F)∖(X^G × G(𝔸_F^∞)/K).
```

The central directions are removed once. Replacing `K_∞` by `K_∞°` gives the connected-compact
covering that occurs in cohomological representation theory. All real components are retained in
`X_K`. For `GL₂(ℝ)`, positive determinant acts holomorphically on the upper half-plane and negative
determinant acts antiholomorphically; this is Mathlib's `UpperHalfPlane.glAction` through
`UpperHalfPlane.σ`.

For `g` in the finite adelic group, right translation is `r_g : X_{gKg⁻¹} → X_K`, `[x,h] ↦ [x,hg]`.
Consequently `r_g ∘ r_h = r_{hg}`, with the appropriate conjugated source level. A level inclusion
`K′ ⊂ K` gives `π_{K′,K}`. The group in the `g`-component is `Γ_{g,K} = G(F) ∩ gKg⁻¹`. Arithmetic
properness is AdelicAlgebraicGroups §4.4's proper action of `G(F)` on `G(𝔸)/K_∞A_∞K`, which uses
that `K_∞A_∞` is compact modulo the split centre; discreteness in the full archimedean group does
not prove projected discreteness.

Neatness is that of AdelicAlgebraicGroups §4.3 (`Neat.IsNeatLevel`, for a point homomorphism
satisfying `Neat.IsFaithfulAlgebraicPointHom`): every rational intersection `G(F) ∩ xKx⁻¹` is
neat, eigenvalues being taken in a faithful algebraic representation of `G` over `F` (through an
embedding `F → ℂ`, on which the notion does not depend). The adelic condition of Pink, NT16
(§3.1) and ACC+ (§2.1.1) instead tests every adelic element through the intersection of its local
eigenvalue-generated torsion groups. It implies this arithmetic-intersection convention; the
converse fails, as the torus Check in ALS.0.9 shows. The geometric constructions here use the
neatness of the arithmetic intersections, which provides the free arithmetic action. This is
weaker than neatness of the same groups inside `𝐆(ℚ)`, where all Galois conjugates of the
eigenvalues count. Neatness does not imply orientability: ALS.0.13 gives a neat level of `PGL_2`
over `ℚ`, and ALS.0.12 a neat level of `GL_2` over `ℚ(√5)`, whose arithmetic groups contain
orientation-reversing elements. The remark after NT16's definition of neatness (§3.1, p. 41) that
neat arithmetic groups preserve orientation therefore needs `G(F_∞)` connected, as for `GL_n` over
a CM field. The orientation local system `o_K` is kept throughout; for `GL_m/F` the character is
`sign(N_{F/ℚ}(det))^{m−1}`.

For a linear algebraic group `H` over `F`, a compact open subgroup `L ⊂ H(𝔸_F^∞)` is **good** if it
is neat in this roadmap's arithmetic-intersection convention and of the form `L = ∏_v L_v` over the
finite places `v`. This adapts the terminology of [ACC+23, §2.1.1, p. 910]. If
`K ⊂ G(𝔸^∞)` is good, then for every rational parabolic `P` and `g ∈ G(𝔸^∞)` the transported level
`L_g = P(𝔸^∞) ∩ gKg⁻¹` is good: it is the product of the `P(F_v) ∩ g_vK_vg_v⁻¹`, and it is neat
by inclusion of its rational intersections in those for `gKg⁻¹`. At decomposed parabolic levels,
the Levi level is the intersection with the Levi (ALS.2.7–2.8). For a product Levi, factorwise
arguments use neat product refinements and finite-cover descent (ALS.6); arithmetic-intersection
neatness of a level does not assert neatness of its projected factor levels.

Artin maps are normalized so that uniformizers go to **geometric** Frobenius elements, as in
[ACC+23, §1.2, p. 906]: `Art_{F_v}` and `Art_F : 𝔸_F^×/F^× → G_F^{ab}` are ClassFieldTheory's
arithmetically
normalized local `artinMap` and finite-layer `globalArtinMap` (Layers 7 and 11) precomposed with
inversion, assembled over the finite abelian extensions of `F` by their compatibility in towers.
`Frob_v` always denotes a geometric Frobenius, so the `p`-adic cyclotomic character satisfies
`ε(Frob_v) = q_v⁻¹`. For a continuous character `ψ : G_F → O^×` write `ψ(Art_F(x))` for `x` in the
finite ideles through `x ↦ (1, x) ∈ 𝔸_F^×`.

For coefficients in a commutative ring `R`, `V` has commuting `G(F)` and `K_S` actions. The slice
action on `Γ_{g,K}` is

```text
ρ_Γ(γ) = ρ_{G(F)}(γ) ρ_{K_S}((g⁻¹γg)_S).
```

There is no inverse on the `K_S` factor alone. For a lifted loop ending at `δ(ℓ)x₀`, Tau Ceti's loop
product `g*h` means `h` followed by `g`. Thus `δ` takes values in `Γᵐᵒᵖ` and monodromy is
`ρ_Γ(δ(ℓ)⁻¹)`. This inverts the entire slice action; the inversion `Γᵐᵒᵖ → Γ`, `x ↦ (unop x)⁻¹`,
is the inverse of Mathlib's `MulEquiv.inv' Γ : Γ ≃* Γᵐᵒᵖ`. The noncommuting matrix tests below fix
the order.

At arbitrary level choose a neat normal refinement `K₀ ⊂ K` and `Q = K/K₀`. Construct the supported
equivariant complexes on the compactification of `X_{K₀}` in `D(R[Q])`; their derived `Q`-invariants
give the complexes at `K`. Intersections of refinements and composition of derived invariants supply
independence of `K₀` (ALS.1.3). Underlying `R`-perfectness does not imply `R[Q]`-perfectness:
freeness of the full-level action is needed. Modular stabilizers can produce unbounded cohomology.
Averaging, or a stated derived-invariants comparison, is needed for coefficient change at arbitrary
level.

Hecke rings are Mathlib's `HeckeRing` on `HeckeCoset` with Tau Ceti's convolution ring structure
(`HeckeCosetModule.instRingHeckeRing`). For `UgU = ⊔ g_i U`, the action on invariants sums `g_i·v`
over the distinct left cosets `g_iU` contained in `UgU`. Tau Ceti's `HeckeCoset.heckeSum`, which
sums `q ∘ ρ(a_v)` over the right cosets `Γ₁a_v` of `Γ₁δΓ₂`, is the transposed (coinvariant) form
of the same operator, exchanged with it by the contragredient with `g` replaced by `g⁻¹`. The degree
is `[U : U ∩ gUg⁻¹]`; `Subgroup.relIndex` takes the subgroup being indexed as its second argument
(Tau Ceti `HeckeCoset.degree_eq_relIndex`). A ring map `H ⊗ R → End_{D(R)}(C)`, an action in
`D(R[Q])`, and a strict object of `D(H ⊗ R[Q])` carry different data;
the strict object is the derived Hecke-invariants complex of ALS.3.4.

Parabolic integration has `vol(U_N) = 1` and uses the integral unnormalized Satake map. For the
upper Borel of `GL₂` at hyperspecial level,

```text
S(T_p) = p[diag(p,1)] + [diag(1,p)],
δ_B^(1/2) S(T_p) = p^(1/2)([diag(p,1)] + [diag(1,p)]).
```

The single-term formula belongs to the positive Iwahori monoid and requires both product
decompositions. Global strata retain all transported parabolic levels. The distinguished `g = 1`
component describes the entire induced stratum only when the stated Iwasawa equality holds.

Complexes are cohomologically graded, with `C_c → C → B → C_c[1]`. If `d = dim X^G`,

```text
RHom_R(C_c(V), R) ≅ C(V^∨ ⊗ o_K)[d].
```

Boundary duality uses `d − 1`. Dualizing the triangle reverses its arrows; its comparison is the
inverse rotation of the shifted dual-coefficient triangle, including the negative rotated connecting
arrow. Hecke adjunction inverts double cosets and exchanges `𝔪` with `𝔪^∨`. These conventions also
apply on each transported open boundary stratum, with its own dimension and orientation.

## Exact supplier contracts

### From Mathlib

- Quotients and actions: quotient groups `G ⧸ H` (`QuotientGroup`), `MulAction.stabilizer`,
  `ProperlyDiscontinuousSMul`, `IsCoveringMap`, `CategoryTheory.ActionCategory`.
  `ProperlyDiscontinuousSMul` quantifies over compact sets: for compact `K`, `{γ : γK ∩ K ≠ ∅}` is
  finite. `MulEquiv.inv' G : G ≃* Gᵐᵒᵖ`, `g ↦ op g⁻¹`; its inverse `Gᵐᵒᵖ → G`, `x ↦ (unop x)⁻¹`, is
  the inversion of the monodromy convention (ALS.1.1, `endpointMonodromy`).
- Topology and geometry: `ContractibleSpace`, `ModelWithCorners`, `UpperHalfPlane` with
  `UpperHalfPlane.glAction` (the action of all of `GL(2,ℝ)`, antiholomorphic for negative
  determinant through `UpperHalfPlane.σ`), the fixed-point criteria
  `UpperHalfPlane.gl_smul_I_eq_I_iff_of_pos` (for `det g > 0`, `g • I = I ↔ g₀₀ = g₁₁ ∧ g₀₁ = −g₁₀`)
  and `UpperHalfPlane.gl_smul_I_eq_I_iff_of_neg` (for `det g < 0`,
  `g • I = I ↔ g₀₀ = −g₁₁ ∧ g₀₁ = g₁₀`), from which ALS.0.4's
  stabilizer_I_eq_orthogonalTimesScalars follows, the instance
  `ContractibleSpace ℍ`, and `UpperHalfPlane.instProperlyDiscontinuousSL2RSubgroup` (discrete
  subgroups of `SL(2,ℝ)` act properly discontinuously on `ℍ`).
- Matrix groups: `Matrix.GeneralLinearGroup` with `Matrix.GeneralLinearGroup.map` (reduction along
  a ring map, used for reduction modulo an ideal in ALS.0.10), `Matrix.SpecialLinearGroup`,
  `Matrix.orthogonalGroup`, `CongruenceSubgroup.Gamma0`, `CongruenceSubgroup.Gamma1`.
- Lie algebras: `LieAlgebra`, `LieModule`, and the low-degree cochains of `LieModule.Cohomology`
  (`oneCochain`, `twoCochain`, `d₁₂`), which the Chevalley–Eilenberg complex of ALS.F.5 extends to
  all degrees.
- Homological algebra: `Rep`, `Representation.invariants`, `groupCohomology`, `CochainComplex`,
  `DerivedCategory`, `CategoryTheory.IsIdempotentComplete`, `Module.Projective`, `Module.Flat`,
  `CategoryTheory.Sheaf.H`, `AlgebraicTopology.singularChainComplexFunctor`.
- Hecke rings: `IsHeckeTriple`, `HeckeCoset`, `HeckeCosetModule`, `HeckeRing` (notation `𝕋`),
  `DoubleCoset.doubleCoset`, `Subgroup.relIndex`.

### From Tau Ceti

- `TauCeti.LocalCoefficientSystem` (a functor from the fundamental groupoid to `ModuleCat`), with
  `pullback`, `constantFunctor` and `monodromyRepresentation`; the last goes from a given local
  system to a representation and does not construct arithmetic descent.
- `TauCeti.CoveringSpace.monodromyEquivalence`, classifying Type-valued covers of a path-connected,
  locally path-connected, semilocally simply connected space; it does not identify sheaf descent
  with linear local coefficients.
- `TopPair.singularChainComplexFunctor` (relative singular chains), and the twisted singular cochain
  complex `TauCeti.LocalCoefficientSystem.twistedCochainComplex` with the relative connecting map
  `TopPair.twistedCohomologyδ`. The cochain complex applies `Hom(−, M)` to chains twisted by a system
  `L`, so a cochain is a family of maps `L(σ(0)) → M`; it is contravariant in `L`. Cochains with
  values in the arithmetic system `V` are obtained with `L = V^∨` and `M = R`, since
  `Hom_R(V^∨, R) = V` for `V` finite projective; ALS.1.4 compares sheaf cohomology with these
  cochains, with that
  variance.
- Hecke rings: `HeckeCosetModule.instRingHeckeRing` (the convolution ring on `𝕋 Δ H R` for
  `IsHeckeTriple Δ H H`), `HeckeCosetModule.single` (the basis elements `r·[D]`),
  `HeckeCoset.degree_eq_relIndex` (`D.degree = (ConjAct.toConjAct D.rep • H₂).relIndex H₁`), and
  `HeckeCoset.heckeSum` with `HeckeCoset.heckeSum_eq_sum_of_rightCosets` and
  `HeckeCoset.heckeSum_comp_of_mem`: for `Γ₁δΓ₂ = ⊔ Γ₁a_v` and a `Γ₁`-invariant linear map `q`, the
  sum `Σ_v q ∘ ρ(a_v)` is independent of the representatives and `Γ₂`-invariant (Shimura §3.4). It
  is the coinvariant form of the operator of ALS.3.1, which an implementation of ALS.3.1 transposes
  rather than reproves. `TauCeti.card_fiber_orbitOfCosetTranslate_mul_cardStabilizerOnOrbit` gives
  the fibre counts with stabilizers used in ALS.3.6.
- `HeckeCosetModule.single_mul_single_of_mem_normalizer` proves the basis multiplication used
  in heckeRing_normal; ALS.3.2 assembles the quotient basis into a ring equivalence.
  `LeftCosetModule.deg` and `LeftCosetModule.degree_smul_eq_deg` give the degree homomorphism
  and its action on coefficient sums; hecke_degree_eq_index is the trivial-module form with
  explicit representatives, using `HeckeCoset.degree_eq_relIndex`.
  `HeckeRing.GL2.heckeT_prime_mul_heckeTDiag_one_prime_pow` at `k = 1` proves the same square
  relation as heckeBasis_GL2_square in `IntegralHeckeRing 2`, for the integral pair
  `(SL₂(ℤ), GL₂(ℚ)⁺ ∩ M₂(ℤ))`; ALS.3.8 uses the local pair `(GL₂(ℚ_p), GL₂(ℤ_p))`.
  `HeckeRing.GL2.heckeT_prime_pow_recurrence` uses the sum of all determinant-`p^k` double cosets,
  explaining the coefficient `p` in that convention.
- Group cohomology: `TauCeti.groupCohomology.corestriction` (`Hⁿ(S, Res_S A) ⟶ Hⁿ(G, A)` for a
  finite-index subgroup `S`), with `TauCeti.groupCohomology.map_subtype_id_comp_corestriction`
  (restriction followed by corestriction is multiplication by `[G : S]`) and
  `TauCeti.groupCohomology.corestriction_trans`; this is the trace at non-neat level (ALS.3.6).
- Representations: `Representation.charTwist` (for `χ : G →* kˣ`, the representation `g ↦ χ(g)·ρ(g)`
  on the same module), which at the character `g ↦ ψ(det g)⁻¹` is the coefficient twist
  `V(ψ^{−1,S})` of ALS.3.12; and `Representation.invariants_ne_bot_of_forall_pow_eq_one` (over a
  commutative ring of characteristic `p`, a nonzero representation of a finite group in which every
  element acts with `p`-power order has a nonzero invariant vector), the key step of ALS.6.3.
- Matrix groups: `TauCeti.upperTriangularGroup` and `TauCeti.upperUnitriangularGroup`, the
  upper-triangular and upper-unitriangular subgroups of `GL_m(R)` for a finite linearly ordered
  `m`, whose preimages under reduction modulo an ideal are the level subgroups `upperTriangularMod`
  and `unipotentMod` of ALS.0.10; `Matrix.SpecialLinearGroup.dilation` (`diag(e^{s/2}, e^{−s/2})`,
  acting on `ℍ` by `z ↦ e^s z`), the left action against which ALS.2.1 tests the geodesic action;
  and `TauCeti.ModularGroup.card_stabilizer_I` (the stabilizer of `i` in `SL(2, ℤ)` has order `4`),
  used in the checks of ALS.0.5 and ALS.0.8.
- `TauCeti.Cocharacter.parabolic` and `TauCeti.Cocharacter.leviDecompositionMulEquiv` (dynamic
  parabolic subgroups and their Levi decomposition).
- `IsQuotientCoveringMap.isEilenbergMacLaneSpaceOne_realTopologicalVectorSpace`: the orbit space of
  a free properly discontinuous action on a real topological vector space is a `K(G, 1)`; it gives
  the `K(Γ_i, 1)` clause of ALS.0.9.

### From other roadmaps

- **AdelicAlgebraicGroups**: §1.3 (discreteness of the rational points in the adelic points), §1.4
  (restriction of scalars), §2.1 (the split component `A_G`), §3.1 (algebraic Levi decompositions,
  minimal and standard rational parabolics), §3.2 (horospherical decomposition for a fixed maximal
  compact; simple roots and truncated tori; stated there for connected semisimple groups over `ℚ`,
  while ALS.2.1 states the reductive form it needs for spaces of type `S−Q`, after [BS73, §§3.2–3.9]),
  §3.7 (inverse-adjoint algebraic Cartan data and rational existence; ALS.0.1 owns the
  compact-twist comparison, preserving the datum used by the Siegel coordinates), §3.4
  (`Reduction.finite_classes`, `Reduction.levelArithmetic`, `Reduction.exists_compact_normOne_iff`
  for `G(F)\G(𝔸_F)^1`, "Arithmetic quotients of anisotropic groups are compact" for
  `Γ∖(G(F_∞)/A_G(ℝ)^0)`, the component decomposition of a level quotient, unipotent groups have
  class number one), §3.6 (finitely many cusps; finitely many fixed-`K` Siegel sets cover, stated
  there for connected semisimple groups over `ℚ`; finite overlaps of Siegel sets), §4.3
  (`Neat.IsNeatAut`, `Neat.IsNeatLevel`, `Neat.IsFaithfulAlgebraicPointHom`, neat groups are torsion
  free), §4.4 (`LevelMaps.LevelQuotient`, `LevelMaps.levelMap`, *rational-stabilizer-finite*, "Proper arithmetic action on the level space", both for
  `K∞` closed, containing `A_G(ℝ)^0` and compact modulo it, free action and covering maps at neat
  level, fibre masses, quotient groupoids at non-neat level), §4.5 (Hecke correspondences, degrees,
  cartesian squares of level maps), §§5.1–5.3 (worked examples: `GL_1` level quotients, the
  `GL_2/ℚ` component decomposition `AdelicExamples.GL2.exists_componentHomeomorph`, stated for
  `K_∞ = ℝ^×SO(2)` and the model `GL_2(ℚ)^+∖(ℍ × GL_2(𝔸_f)/U)`, with its principal levels, "`GL₂`
  components for `O(2)` and `SO(2)`" for the folded quotient with `K_∞ = ℝ^×O(2)`, definite quaternion
  groups).
- **RepresentationTheory/LieGroups**, Layer 2 (the closed-subgroup theorem) and Layer 9 (the
  Cartan, Iwasawa, and KAK decompositions): for a
  real reductive `G` with Cartan involution `θ` and maximal compact `K = G^θ`, `K × 𝔭 → G`,
  `(k, X) ↦ k·lieExp X` is a diffeomorphism; Iwasawa and `KAK`. Its Cartan involutions and real
  reductive structures are defined on an abstract Lie group; ALS.0.2 shows that the algebraic
  Cartan involutions of ALS.0.1 give such structures on `G(F_∞)`. The right quotient `G/K` used
  here is reached from the left form by `g ↦ g⁻¹`.
- **RepresentationTheory/LieHighestWeight**: Layer 4 (finite-dimensional irreducibles are the
  `L(λ)` with `λ` dominant integral), Layer 5 (Weyl's complete reducibility), Layer 7 (the centre of
  `U(L)` and the Harish-Chandra isomorphism, giving infinitesimal characters), Layer 9 (reductive
  Lie
  algebras and `gl_n`).
- **ClassFieldTheory**: Layer 7 (`artinMap`, its unramified normalization and
  `geometricArtinMap`), Layer 10 (global carriers and `infiniteArtinAt`), Layer 11
  (`globalArtinMap`, `globalArtinMap_local`, `globalArtinMap_principal`,
  `globalArtinMap_isArithFrobAt`, compatibility in towers), all arithmetically normalized; this
  roadmap uses their inverses, as fixed in *Conventions*.
- **AlgebraicTopology**: Stage 2, item 6 (local coefficient systems, twisted and relative singular
  chains); Stage 4 (CW pairs and cellular chains); Stage 5, item 3 (transfer along finite covers,
  with the permutation local system of a nonregular cover); Stage 6, items 1–4 (cochains with local
  coefficients, cup and cap products, the orientation local system, Poincaré–Lefschetz duality for
  compact manifolds with boundary).
- **DifferentialGeometry**: Layer 0 (differential forms and the wedge), Layer 2 (orientations),
  Layer 6 (the de Rham complex and cohomology), Layer 8 (the de Rham theorem with real
  coefficients).
- **GeometricTopology**: Layer 11 (`IsTriangulable`). The smooth triangulation theorem is item 1
  ("Smooth implies PL") of its section *The smoothing-and-triangulation comparison*, outside its
  layers and without boundary; ALS.2.4 states the form with boundary as its own target.
- **EnhancedDerivedSheaves**: §0.1 (`ClassicalDerived.enhancedCategory`, the derived category of
  module sheaves over a commutative ring on an essentially small site, here the site of opens of
  a topological space, with its `D⁺` and the identification of its homotopy category with
  Mathlib's `DerivedCategory`), §0.2 (`ClassicalDerived.replacements`, K-injective replacements;
  a bounded-below complex of injectives is K-injective), §0.4 (`ClassicalDerived.functorCoherence`,
  the adjunction `f^* ⊣ Rf_*` for an exact inverse image, with composition and agreement with
  Mathlib's bounded-below right derived functor).
- **SchemeAndStackFoundations**: §2.1 (`Sheaf.derivedPushforward` with `derivedPushforward_comp`,
  `Sheaf.H.pullback` and the identification `RΓ(D, Rf_*F) = RΓ(C, F)` for a morphism of sites with
  exact inverse image, applied to the site morphism `Opens.map f` of a continuous map), §2.5
  (`flasque_cech_vanishing`, `sheafH_iso_godement`: a flasque resolution of an abelian sheaf on
  a topological space computes `Sheaf.H`), §2.23 (scheme-domain equivariant sheaf cohomology,
  which ALS.F.4 parallels on topological spaces).
- **IntegralHeckeAndGaloisDeterminants**: Layers 0–1 (determinants, and semisimple reconstruction
  in §1.2), Layer 2 (§2.1 `HeckeImage.Supported`, `HeckeImage.derived_hom_finite`,
  `HeckeImage.IsGhost`; §2.2 `HeckeImage.ghost_nilpotence`, finite local factors and idempotent summands), Layer 3a
  (the spherical Hecke polynomial, with the coefficients `(−1)^i q^{i(i−1)/2} T_i`), Layer 3b (the
  residual Galois-type and non-Eisenstein predicates).
- **SmoothRepresentationsOfLocalGroups**: SR.0, SR.0d.2 (`derived-invariants`), SR.1.1, SR.1.2
  (`permutation-hecke-algebra`: `H(G, U; A) = Fun_G(G/U × G/U, A)` over every commutative `A`,
  with no measure; `hecke-ring-comparison`, whose convolution form assumes `μ(U) = 1`, that is `U`
  of invertible pro-order in `A`,
  for `HeckeAlgebraLevel`; there `V^U` is a right module, `[UgU]` acting as
  `[Ug⁻¹U]` does on the left here), SR.1.4 (`iwahori-decomposition`, `positive-hecke-homomorphism`
  item (3)), SR.2.2 (the modulus character through
  `LocalIntegration.modularCharacter_eq_adjointModulus`, the unnormalised `SmoothRep.jacquetFunctor`
  and unnormalised parabolic induction), SR.4.1 (`satake-transform`: the raw and
  normalized Satake transforms `S*` and `S = δ_P^{1/2} S*`).
- **ReductiveGroupsPartII**: RG2.3.3 (`parahoric-subgroup`: `IsParahoric`, `IsIwahori`), RG2.3.5
  (`lattice-chain-stabilizer-schemes`), the examples of Layer RG2.3 (`classical-level-subgroups`:
  `LevelSubgroups.iwahori`, `LevelSubgroups.proPIwahori`, `LevelSubgroups.iwahori_isParahoric`, the
  check `iwahori_relIndex_two`), RG2.4.2 (`iwahori-factorization`: `iwahoriFactorization`), RG2.4.4
  (`iwasawa-decomposition`, `iwasawa-parabolic-integral`, `iwasawa-integration-and-unimodularity`).
- **ProfiniteCohomology**, Layer 10 (continuous cohomology in all degrees): `corestriction`,
  `corestrictionLe`, `corestriction_comp_res` (`res ≫ corestriction = [G : U] • 𝟙`), `mackeyTerm`
  and `corestriction_mackey`, for open subgroups of a profinite group acting on discrete modules;
  applied here to finite discrete groups.

### Shared suppliers

Direct hard suppliers for the shared foundations and arithmetic interfaces include
AdelicAlgebraicGroups, SmoothRepresentationsOfLocalGroups,
ReductiveGroupsPartII and IntegralHeckeAndGaloisDeterminants at the
sections listed above, and DerivedModuleAlgebra, EtaleCohomologyFoundations,
ComplexComparisonPartII, EnhancedDerivedSheaves, SchemeAndStackFoundations and ClassifyingSpaces at the sections below. These contracts are dependencies of the mathematical
specification; `Suggested.lean` imports only the pinned Mathlib and Tau Ceti modules.
The inputs in the following subsection are hypotheses of the targets that use them, rather than
existence theorems assigned to a supplier. KleinianGroups is an outbound scope boundary: its
hyperbolic-space specialization does not supply a prerequisite here.

| Contract | Supplier and exact section / label | Convention or hypothesis gap and arithmetic consumer |
| --- | --- | --- |
| Generic perfect complexes and traces | Supplied by DerivedModuleAlgebra §1.E.0 / `DerivedDeRham.IsPerfect`, `isPerfect_triangle`, `isPerfect_retract`, `isPerfect_baseChange`; EtaleCohomologyFoundations §F.10.3 / `PerfectComplex.lefschetzNumber`, `PerfectComplex.filteredTraceAdditivity` | DerivedModuleAlgebra owns the ordinary-module predicate for every unital ring and its elementary finite-model and closure API; `PerfectComplex.IsPerfect` is its alias. EtaleCohomologyFoundations owns the enhanced DG/module and commutative compact/dualizable comparisons and traces. ALS.F.2 consumes the perfect full subcategory of `DerivedCategory (ModuleCat A)` through the realization equivalence `PerfectComplexInput(A)` constructed in §F.10.3, with its shift, scalar-extension, tensor, dual and trace compatibilities. ALS.F.2 retains opposite-ring duals, noncommutative scalar-extension handedness, restriction of scalars and right-module Tor tests. |
| Bounded constructible/ctf categories | Supplied by EtaleCohomologyFoundations §F.1 / `VanishingCycles.constructibleDerivedCategory` | These are étale module-sheaf categories with explicit global cohomological and Tor bounds, not a boundedness assertion for non-neat arithmetic groupoid cohomology. |
| Topological local-coefficient comparison and supports | Supplied by ComplexComparisonPartII §C6.1 / `topologicalCoefficientComparison`; §C6.4 / `artinComparisonCompactSupport` | The finite-coefficient local-system comparison and the topological compact-support theory have this owner. ALS.F.3 consumes its native local-system carrier and stalk/transport-preserving comparison (finite `Λ`; locally contractible paracompact spaces; finite compatible triangulations for compact-support cochains) and, over every commutative ring on locally compact Hausdorff spaces, its `j_!` with stalks and exactness, c-soft resolutions, `RΓ_c`, the identifications `RΓ_c(X, F) ≅ RΓ(X⁺, j_!F)` and `RΓ_c(U, F|_U) ≅ RΓ_c(X, j_!F)`, the open–closed localization triangle and `Rf_!`. §C6.4 is the separated finite-type complex-scheme Artin comparison. ALS.F.3 proves the arbitrary-stalk local-system comparison and its relative form; ALS retains arithmetic slices, whole-inverse monodromy, level/translation and Hecke naturality, and relative Borel–Serre models. |
| Derived module-sheaf categories over arbitrary rings | Supplied by EnhancedDerivedSheaves §0.1 / `ClassicalDerived.enhancedCategory`, §0.2 / `ClassicalDerived.replacements`, §0.4 / `ClassicalDerived.functorCoherence`; SchemeAndStackFoundations §2.1 / `Sheaf.derivedPushforward`, `Sheaf.H.pullback`, §2.5 / `flasque_cech_vanishing`, `sheafH_iso_godement` | Arbitrary commutative `R` on the site of opens of any topological space, which includes `X̄_K`, `X_K`, `∂X̄_K` and `X̄^G × G(A^∞)^δ`: `D⁺` of module sheaves, K-injective replacements, `f^* ⊣ Rf_*` with composition, the abelian `Rf_*`, the cohomology pullback, and flasque resolutions computing `Sheaf.H`. ALS.F.3 adds the comparison of `R`-linear derived sections with Mathlib's `Sheaf.H` (its `R`-linear injective objects are flasque), the proper finite-fibre stalk formula with `Rf_* = f_*`, the arbitrary-stalk local-system comparison and its relative form; ALS.F.4 adds the equivariant categories. |
| Cellular freeness | Supplied by ClassifyingSpaces §Stage 3, item 13 / **CW structures and coverings**, free cellular chain and quotient-cell basis clause | ALS.1.6 discharges the Hausdorff CW and quotient-cover hypotheses for the discrete full group `G(F) × K`, transports chosen cell lifts to left group-ring modules, and proves finite orbit counts, boundedness, the relative/coefficient model and perfectness. |
| Neat-component group cohomology | Supplied by ClassifyingSpaces §Stage 4, items 16–18 / item 17 **Homology**, local-coefficient cohomology clause | The contract requires cohomology with arbitrary `R[Γ]`-modules over every commutative `R` and a chain-level comparison natural in groups and coefficients; ALS.1.5 supplies the arithmetic slice action, deck/opposite identification, CW-model transport, sheaf/derived adapter, component assembly and non-neat descent. |
| Proper action (outbound) | This roadmap ALS.0.5 / proper-action and discrete-image/finite-kernel clause of LocallySymmetric.symmetricSpace.contractible | KleinianGroups §Layer 1 / **What to build / Deliverables**, `properlyDiscontinuousSMul_of_discrete` is the `PSL₂(ℂ)` special case after an equivariant identification of its `H³` model with `PSL₂(ℂ)/PSU(2)` and verification of the trivial split centre; its model identification and Kleinian applications remain there. |

The ordinary-module perfect core used by ALS.F.2 is supplied by DerivedModuleAlgebra §1.E.0.
EtaleCohomologyFoundations §F.10.3 supplies the enhanced comparisons and coherent filtered trace
maps on the full subcategory defined by that same predicate.

The arithmetic consumers use ComplexComparisonPartII §C6.1's finite-coefficient carrier and
comparison maps through ALS.F.3 and ALS.1.4.

### Inputs taken as hypotheses

- `FrankeInput` (ALS.5b.4): Franke's comparison and the Franke–Schwermer description of the
  associate-class summands, for the group, level and coefficient at hand.
- `GaloisInput` (ALS.5b.7): characteristic-zero Galois representations attached to the cuspidal
  automorphic representations of the Levi factors, with unramified local–global compatibility.
- Residual Galois type (IntegralHeckeAndGaloisDeterminants, Layer 3b) of the relevant Hecke complexes, in ALS.4.12,
  ALS.4.13 and ALS.5b.8–5b.9, as in the sources. ALS.4.13 also assumes
  `ResidualUnitaryGaloisInput`: rank-`2a` residual representations
  for the cohomological eigensystems of every smaller `U(a,a)`, `0 < a < n`, at good levels with
  all finite smooth coefficients, including dual orientation twists and finite residue-field
  extensions. Its existence is an arithmetic input from [ACC+23, Theorem 2.3.8, pp. 939–940,
  and proof of Theorem 2.4.2, pp. 942–945], not a consequence of determinant reconstruction.

## How to read the build

Layer ALS.F comes first: it builds foundations and adapters to the supplied generic interfaces. The
arithmetic layers are grouped by subject: ALS.0 builds the symmetric space and the quotients, ALS.1
the coefficient systems and the Betti complexes at every level, ALS.2 the Borel–Serre
compactification and its boundary strata, ALS.3 the Hecke action on all of these, ALS.4 the boundary
analysis and the Eisenstein theorems for the boundary, ALS.5a duality, ALS.5b the comparisons with
forms and automorphic forms in characteristic zero, and ALS.6 descent along finite covers. The order
in which the targets are built is not the order of the text. It is the following order, in which
every target's *Needs* precede it:

```text
ALS.F.1–F.7; ALS.0.1–0.13; ALS.2.1–2.3; ALS.5a.1; ALS.2.4 (geometric clause);
ALS.1.1–1.6; ALS.2.4 (cohomological clause); ALS.1.7–1.8; ALS.2.5–2.10;
ALS.3.1–3.8; ALS.3.11–3.12; ALS.3.9–3.10; ALS.3.13–3.14;
ALS.5a.2–5a.4; ALS.4.1–4.7; ALS.4.9; ALS.4.10; ALS.4.8;
ALS.4.11–4.13; ALS.5a.5–5a.6; ALS.5b.1–5b.9; ALS.6.1–6.4.
```

Thus the Borel–Serre bordification, its compact quotients and the manifold-with-boundary bridge
(ALS.2.1–2.3 and ALS.5a.1) come before the Betti complexes built on them; the finite triangulation
of ALS.2.4 comes next, before the compact-support comparison ALS.1.4 and the finite-cell
criterion ALS.1.6. Its cohomological consequences then precede coefficient change ALS.1.7.
The character twist ALS.3.12 precedes its cup-product use in ALS.3.9. Verdier
duality, the pairings and the Hecke adjoints (ALS.5a.2–5a.4), which use only geometry, Betti
complexes and Hecke operators, come before the boundary statements ALS.4.8 and ALS.4.11–4.13 that
use them; localization ALS.4.9 comes before boundary gluing ALS.4.8; and the last two duality
targets use the boundary triangle ALS.4.1 and localization ALS.4.9. The two boundary spectral
sequences of ALS.2.9 have different support conventions and are never interchanged. Each layer ends
with its examples and its dependencies.

## Layer ALS.F: Foundations and arithmetic adapters

This layer builds the real points of a linear algebraic group as a Lie group with its maximal
compact subgroups, the handedness and restriction-of-scalars extensions of shared perfectness,
arithmetic adapters for supplied derived sheaf functors, equivariant sheaves for topological groups, Lie
algebra cochains, automorphic forms and cusp forms, and cohomological representations at infinity.
The generic owners and the coefficient-domain hypotheses are fixed in the supplier contracts above.

### ALS.F.1 Real points of linear algebraic groups and their maximal compact subgroups

Prove LocallySymmetric.realPoints_lieGroup. Let `H` be a linear algebraic group over `ℝ` with a
closed embedding `H ⊂ GL_N`. Then `H(ℝ)` is a closed subgroup of `GL_N(ℝ)`, hence a real Lie group
by the closed-subgroup theorem; it has finitely many connected components (Whitney's theorem on real
algebraic sets); its Lie algebra as a Lie group is `Lie(H) ⊂ 𝔤𝔩_N(ℝ)`, the Lie algebra of `H` as an
algebraic group; and the Lie group structure does not depend on the embedding. For a number field
`F` and a linear algebraic `F`-group `G`, applied to `H = (Res_{F/ℚ} G)_ℝ`, this makes
`G(F_∞) = ∏_{v|∞} G(F_v)` a real Lie group with finitely many components and Lie algebra
`Lie(Res_{F/ℚ} G) ⊗_ℚ ℝ`. If `H` is reductive, some `a ∈ GL_N(ℝ)` makes `a⁻¹Ha` stable under
transposition (Mostow); for
such an embedding `K = H(ℝ) ∩ O(N)` is a maximal compact subgroup,
`H(ℝ) = K · (H(ℝ) ∩ exp Sym_N(ℝ))` with `H(ℝ)/K` connected and simply connected, every compact
subgroup of `H(ℝ)` lies in a
maximal compact subgroup, and any two maximal compact subgroups are `H(ℝ)`-conjugate. The statement
assumes `H` linear algebraic over `ℝ`, and `H` reductive for the maximal-compact clauses. ([PRR23,
§3.1, Theorem 3.12 and the comparison of Lie algebras before it, p. 136]; [PRR23, §3.2, Theorem
3.15, p. 138]; [PRR23, §3.2,
Theorem 3.24, p. 144, and Proposition 3.26, p. 146]; [PRR23, §3.2, Theorem 3.29, p. 148])

The API: LocallySymmetric.realPoints_lieGroup — `H(ℝ)` as a real Lie group with finitely many
components and Lie algebra `Lie(H)`, independent of the embedding;
LocallySymmetric.realPoints_lieGroup.maximalCompact — for reductive `H`, existence and
conjugacy of maximal compact subgroups, every compact subgroup lying in one, and the polar
decomposition for a transpose-stable embedding.

*Needs:* RepresentationTheory/LieGroups, Layer 2 (the closed-subgroup theorem) and Layer 9;
AdelicAlgebraicGroups §1.4 (restriction of scalars); Mathlib `Matrix.GeneralLinearGroup`,
`Matrix.orthogonalGroup`.

**Checks.**

- `GL_N(ℝ)` with `N ≥ 1` has two connected components and Lie algebra `𝔤𝔩_N(ℝ)`; `GL_0(ℝ)` is the
  trivial group, with one.
- `SL_2(ℝ)` is connected with maximal compact subgroup `SO(2)`, and the order-six subgroup generated
  by `(0, −1; 1, 1)` (characteristic polynomial `X² − X + 1`) lies in a conjugate of `SO(2)`.
- `μ_2 ⊂ GL_1` has real points `{±1}`, a zero-dimensional Lie group with two components.
- Non-example: the closed subgroup `2^ℤ ⊂ ℝ^×` is a Lie group with infinitely many components, so it
  is not the group of real points of any algebraic subgroup of `GL_1`.

### ALS.F.2 Shared perfectness, handedness and restriction of scalars

DerivedModuleAlgebra §1.E.0 supplies `DerivedDeRham.IsPerfect A K` on Mathlib's
`DerivedCategory (ModuleCat A)` for every unital ring `A`: an object is isomorphic to the image
of a bounded complex of finitely generated projective left `A`-modules. Its shared alias is
`PerfectComplex.IsPerfect`; its elementary finite-model API, shift invariance, two-out-of-three
for distinguished triangles and closure under retracts have that same owner. The predicate
already applies to noncommutative `R[Q]` for arbitrary finite groups `Q`.

EtaleCohomologyFoundations §F.10.3 / `PerfectComplex.lefschetzNumber`,
`PerfectComplex.filteredTraceAdditivity` supplies the enhanced DG/module comparison, the
commutative compact/dualizable characterization, traces and filtered trace additivity.
For commutative `A` the same section constructs `PerfectComplexInput(A)`, the realization
equivalence from its enhanced perfect objects onto the full subcategory defined by the shared
predicate, natural in module morphisms and coefficient maps and compatible with shifts, scalar
extension, tensor, duals and traces; these are consumed through it.

Prove the additional interface used by the arithmetic finite-cell and coefficient arguments:
perfectness is equivalent to pseudo-coherence and finite Tor dimension, where pseudo-coherence
means a bounded-above finitely generated projective left-module representative and finite Tor
dimension means one uniform finite interval for derived tensor with all right `A`-modules in
degree zero. For a unital ring map
`A → B`, extension of left modules is `B ⊗^L_A K` and preserves perfectness. Restriction sends a
perfect `B`-complex to a perfect `A`-complex if `B`, as a left `A`-module, is perfect. In particular
`R[Q]` is finite free over `R` for finite `Q`, so restriction preserves perfectness. Underlying
`R`-perfectness alone gives no converse; ALS.1.6 supplies group-ring perfectness from the free
full-level model. These handedness, restriction-of-scalars and right-module Tor extensions
are owned here and implemented on the shared predicate. They follow from finite-projective
representatives, their finite-free retracts, and truncation of a pseudo-coherent resolution at its Tor bound. Restriction is exact
and takes the thick subcategory generated by `B` into that generated by `A`.

For noncommutative `A` and perfect `K`, `RHom_A(K,A)` is a perfect right-module complex,
represented as a left `Aᵐᵒᵖ`-module complex; biduality uses the opposite ring on the second dual. Tensor products of two
left `A`-complexes and the symmetric-monoidal dualizable characterization are used only when `A`
is commutative. In that case the supplied duality, transported using `PerfectComplexInput(A)`, gives
`RHom_A(K,L) ≅ L ⊗^L_A RHom_A(K,A)`. Arithmetic duality for an `R[Q]`-complex instead uses
`RHom_R(K,R)` over the commutative coefficient ring, with contragredient action
`(q·f)(v) = f(q⁻¹·v)`; it is not the group-ring dual `RHom_{R[Q]}(K,R[Q])`.
([Stacks, Definition 15.76.1 (0657), Lemmas 15.76.2, 15.76.4–5, 15.76.8–9, 15.76.15
(0658, 066R, 066S, 066V, 066W, 07VI), for the commutative statements];
[ACC+23, §2.1.2, Lemma 2.1.7 and its finite group-ring model, p. 912], for the arithmetic use;
the left/right general-ring extension is the finite-projective argument specified above.)

The shared API uses `PerfectComplex.IsPerfect` as an alias of `DerivedDeRham.IsPerfect`.
PerfectComplex.IsPerfect.of_triangle and PerfectComplex.IsPerfect.of_summand consume
DerivedModuleAlgebra §1.E.0's `isPerfect_triangle` and `isPerfect_retract`; triangle rotation
and the supplied shift invariance give two-out-of-three. For commutative rings,
PerfectComplex.IsPerfect.baseChange consumes `isPerfect_baseChange`; for general unital
rings ALS.F.2 supplies extension in the order `B ⊗^L_A K`. The additional API is
PerfectComplex.IsPerfect.dual, with the ring and handedness conventions above, together with
PerfectComplex.IsPerfect.restrictScalars under the perfectness hypothesis on `B`,
and PerfectComplex.IsPerfect.iff_pseudoCoherent_finiteTorDimension with right-module Tor tests.

*Needs:* DerivedModuleAlgebra §1.E.0 / `DerivedDeRham.IsPerfect`, its alias
`PerfectComplex.IsPerfect`, `isPerfect_shift`, `isPerfect_triangle`, `isPerfect_retract` and
`isPerfect_baseChange`; Mathlib `DerivedCategory`, `ModuleCat`, `Module.Projective`,
`CategoryTheory.IsIdempotentComplete`; Mathlib `Module.Flat` for the commutative specialization.
The general-ring Tor tests use right modules as specified in this target.
For the commutative compact/dualizable characterization and trace transport only:
EtaleCohomologyFoundations §F.10.3 / `PerfectComplex.lefschetzNumber`,
`PerfectComplex.filteredTraceAdditivity`, and its realization equivalence `PerfectComplexInput(A)`.

**Checks.**

- `A^n[k]` is perfect for every unital ring `A`, every `n` and `k`, and so is the zero object.
- For a field `A`, `A[0]` has the same bounded-projective realization on both sides of
  `PerfectComplexInput(A)`; the supplied identity trace is `1`. Triangle and summand closure
  use the same ordinary-module predicate and supplied laws under that identification.
- Over a discrete valuation ring `O` with uniformizer `ϖ`, `(O/ϖ)[0]` is perfect through the
  resolution `O →ϖ O`, hence so are `(O/ϖ ⊕ O)[0]` and every perfect complex of `O/ϖ`-modules viewed
  over `O`.
- groupRing_S3_noncomm: in `ℤ[S₃]`, `[ (0 1) ][ (1 2) ]` and `[ (1 2) ][ (0 1) ]` are distinct
  basis elements. The regular left module is still finite projective over this noncommutative
  ring; its ring-valued dual is a right module, and its integral dual has the contragredient action.
- For finite `Q`, restriction of a perfect `R[Q]`-complex is `R`-perfect. For `R = 𝔽₂` and
  `Q = C₂`, the trivial module `R[0]` is `R`-perfect but not `R[Q]`-perfect: group cohomology is
  nonzero in every degree.
- Non-example: over `R = k[ε]/(ε²)` the module `k` is not perfect: `Tor^R_i(k, k) = k` for every
  `i ≥ 0`, so `k[0]` has no finite Tor dimension.

### ALS.F.3 Arithmetic adapters for supplied topological sheaf functors

The generic topological module-sheaf functors and comparison are supplied by
ComplexComparisonPartII §C6.1 / `topologicalCoefficientComparison` (the local-system comparison
for finite coefficients; extension by zero, compact supports and the localization triangle over
every commutative ring) and by EnhancedDerivedSheaves §§0.1–0.2 and 0.4 (derived categories of
module sheaves over every commutative ring and `f^* ⊣ Rf_*`). ALS.F.3 owns the arithmetic
adapters to these packages, the comparison with Mathlib's abelian sheaf cohomology, proper
finite-fibre pushforward, and the arbitrary-stalk local-system comparison below.
For finite commutative `Λ`, its local-system carrier is the finite-stalk full subcategory
`FiniteModuleLocalSystem Λ T` of `TauCeti.LocalCoefficientSystem Λ T`. Its equivalence with
locally constant module sheaves on locally path-connected, semilocally simply connected `T`
identifies the actual stalk at each vertex and its path transport, naturally under pullback
and coefficient maps. The direct cochain complex has
degree `n` equal to `∏_σ L.obj(σ(v₀))`, with inverse first-edge transport in the first face;
the sheaf augmentation and local-cochain resolution of §C6.1 fix the comparison map.
AlgebraicTopology Stages 2.6 and 6.1 supply the native coefficient functors and direct
cochains. The arithmetic adapters use the supplied derived module-sheaf carrier,
open extension by zero, locally proper separated pushforward
with proper supports, and compact-support comparison maps, with their composition and
localization identifications.
Consume its topological `j_!`, `Rf_!`, `RΓ_c`, ordinary local-system comparison and
finite-triangulation compact-support comparison. Compact-support Artin comparison and
independence of algebraic compactification are supplied by §C6.4 /
`artinComparisonCompactSupport` on separated finite-type complex schemes. The relative
Borel–Serre comparison uses §C6.1 and the arithmetic pair model, not the complex-scheme
comparison. Bounded constructible/ctf coefficient
categories on the étale side are supplied by EtaleCohomologyFoundations §F.1 /
`VanishingCycles.constructibleDerivedCategory`.

For a commutative ring `R` and a topological space `T`, module sheaves
`Sh(T, R) = Sheaf (Opens.grothendieckTopology T) (ModuleCat R)` form a Grothendieck abelian
category with enough injectives (Mathlib
`CategoryTheory.Sheaf.isGrothendieckAbelian_of_essentiallySmall`,
`CategoryTheory.IsGrothendieckAbelian.enoughInjectives`). The sheaf functors used outside the
supplier's finite-ring, finite-local-system and finitely triangulated domains, including those
of ALS.F.4, are: the `R`-linear derived category `D⁺(Sh(T, R))` with K-injective replacements
and derived global sections `RΓ(T, −) : D⁺(Sh(T, R)) → D⁺(R)` (EnhancedDerivedSheaves §§0.1–0.2
on the site of opens of `T`); for a continuous map `f : T → T′`, the adjunction `f^* ⊣ Rf_*` with
`R(g ∘ f)_* ≅ Rg_* ∘ Rf_*` and `RΓ(T′, Rf_*F) ≅ RΓ(T, F)` (EnhancedDerivedSheaves §0.4 applied
to Mathlib's `TopCat.Sheaf.pullback` and `TopCat.Sheaf.pushforward`, whose
`TopCat.Sheaf.pullbackPushforwardAdjunction` has an exact left adjoint; the abelian form and the
cohomology pullback `RΓ(T′, F) → RΓ(T, f^*F)` through the unit are SchemeAndStackFoundations
§2.1); and, on locally compact Hausdorff spaces, `j_! ⊣ j^*` for an open `j : U → T` with its
stalk formula and exactness, c-soft resolutions, `RΓ_c`, the identifications
`RΓ_c(T, F) ≅ RΓ(T⁺, j_!F)` and `RΓ_c(U, F|_U) ≅ RΓ_c(T, j_!F)` (so `RΓ_c(U, F|_U) ≅ RΓ(T, j_!F)`
for `T` compact), the open–closed localization triangle `j_!j^*F → F → i_*i^*F` with its boundary
signs, and `Rf_!` (ComplexComparisonPartII §C6.1, over every commutative ring). Prove the two
generic statements this roadmap owns. (i) Comparison with abelian sheaf cohomology: for
`F ∈ Sh(T, R)` the `R`-module `H^n(RΓ(T, F))` is naturally isomorphic to Mathlib's
`CategoryTheory.Sheaf.H` of the underlying abelian sheaf, compatibly with restriction, with the
degree-`0` identification with sections, and with the long exact sequences of short exact
sequences. Route: an injective object of `Sh(T, R)` is flasque, because the free module sheaf
`R_U` on a representable open satisfies `Hom(R_U, F) ≅ F(U)` and `R_U → R_V` is a monomorphism
for `U ⊂ V`, the argument of Tau Ceti's `isFlasque_of_injective` for abelian sheaves; a flasque
resolution of an abelian sheaf computes `Sheaf.H` (SchemeAndStackFoundations §2.5 /
`flasque_cech_vanishing`, `sheafH_iso_godement`, through Tau Ceti
`subsingleton_H_succ_of_isFlasque`), so the forgetful image of an injective resolution in
`Sh(T, R)` computes `Sheaf.H`. (ii) Proper finite-fibre pushforward: for a
proper map `f : T → T′` (Mathlib `IsProperMap`) of locally compact Hausdorff spaces with finite
fibres, the stalk of `f_*F` at `y` is `∏_{x ∈ f⁻¹(y)} F_x` (the zero module for an empty fibre),
so `f_*` is exact and `Rf_* ≅ f_*`. Route: a proper map is closed (Mathlib
`IsProperMap.isClosedMap`), so for every open `W ⊇ f⁻¹(y)` the open set `T′ ∖ f(T ∖ W)` contains
`y` and its preimage lies in `W`; the finitely many points of `f⁻¹(y)` have pairwise disjoint
open neighbourhoods, so such `W` may be taken to be disjoint unions of neighbourhoods of the
fibre points, on which the sheaf condition gives the product of the sections, and the colimit
over these `W` is the product of the stalks (Mathlib `TopCat.Presheaf.stalkPushforward` gives the
comparison map). The comparisons retain restriction, coefficient maps, forget-supports maps and
coherent finite-group actions. None of these statements asserts a finite Tor bound or
perfectness.

Define the arithmetic adapters LocallySymmetric.SheafDerived.pushforward,
LocallySymmetric.SheafDerived.sections, LocallySymmetric.SheafDerived.pullback,
LocallySymmetric.SheafDerived.extendByZero, LocallySymmetric.SheafDerived.localizationTriangle
and LocallySymmetric.SheafDerived.compactSupport by applying those supplied functors to the
arithmetic local systems, their compactified extensions, level maps, translations and the
open–closed Borel–Serre pair. Prove the identifications natural in the coefficient module and
these maps; apply equivariant derived sections to the supplied localization triangle. The
arithmetic adapters retain residual finite-group actions before forgetting them. No separate
generic sheaf category or compact-support functor is constructed here; the arbitrary-stalk
comparison below reruns the supplier's local-cochain resolution with arbitrary stalks.
([Stacks, Section 6.31 (009Z), Lemmas 6.31.8 and 6.31.12 (00A7, 00AB), Lemma 17.3.4 (01AK)];
[Stacks, Section 6.32 (00AD), Lemma 6.32.3 (00AG), Lemma 17.6.3 (01AZ)];
[Stacks, Section 20.3 (0716), Section 20.21 (0A39)];
[ACC+23, §2.1.2, pp. 911–912], for the arithmetic equivariant application.)

*Needs:* EtaleCohomologyFoundations §F.1 / `VanishingCycles.constructibleDerivedCategory`
on the étale domain; ComplexComparisonPartII §C6.1 / `topologicalCoefficientComparison`
(including its extension by zero, compact supports and localization triangle over every
commutative ring), §C6.4 / `artinComparisonCompactSupport`; EnhancedDerivedSheaves §§0.1–0.2
and 0.4; SchemeAndStackFoundations §§2.1 and 2.5; AlgebraicTopology Stages 2.6 and 6.1; Mathlib
`DerivedCategory`, `CategoryTheory.Sheaf.H`, `TopCat.Sheaf`, `TopCat.Sheaf.pushforward`,
`TopCat.Sheaf.pullback`, `TopCat.Sheaf.pullbackPushforwardAdjunction`,
`TopCat.Presheaf.stalkPushforward`, `IsProperMap`, `IsProperMap.isClosedMap`, `ModuleCat`,
`CategoryTheory.IsGrothendieckAbelian.enoughInjectives`; Tau Ceti
`TauCeti.Topology.Sheaves.Flasque` (`TauCeti.Topology.isFlasque_of_injective`,
`TauCeti.Topology.subsingleton_H_succ_of_isFlasque`).

**Checks.**

- For a point and every commutative `R`, `Sh(pt, R) ≃ Mod(R)` makes derived sections the
  identity of `D⁺(R)`, and the comparison (i) is the identity of `R`-modules in degree `0`.
- For (i), an injective module sheaf is flasque but a flasque one need not be injective: on a
  point, the constant sheaf `ℤ` over `R = ℤ` is flasque and not injective, while `ℚ` is both; the
  route uses only the acyclicity of the forgetful image, not its injectivity.
- For (ii) and the double cover `f : S¹ → S¹`, `z ↦ z²`, with constant `R`: every stalk of `f_*R`
  is `R²`, `f_*R` is the rank-two local system whose monodromy swaps the two factors, and
  `RΓ(S¹, f_*R) ≅ RΓ(S¹, R)` has `H⁰ = R` (the diagonal invariants of the swap) and `H¹ = R`
  (its coinvariants).
- For (ii) with a fixed point: `q : S¹ → [−1, 1]`, `z ↦ Re z`, is proper with fibres of one or
  two points, `(q_*R)_{±1} = R` and `(q_*R)_t = R²` for `|t| < 1`; `q_*R` is not locally
  constant, and `RΓ([−1, 1], q_*R) ≅ RΓ(S¹, R)` has `H¹ = R` although `[−1, 1]` is contractible.
- Non-example for (ii): properness cannot be dropped. For the inclusion `f : (0, 1) → [0, 1]`,
  which has finite fibres and is not proper, `(f_*R)_0 = R` while the fibre over `0` is empty.
- On a compact triangulated manifold with a constant finite-field local system, the arithmetic
  comparison uses the same derived sheaf/singular equivalence as the supplier, with compact
  support equal to ordinary support. On `S¹`, `H⁰ = H¹ = R` and `H^i = 0` for `i ≥ 2`.
- For `j : (0,1) → [0,1]`, the supplied localization triangle gives
  `RΓ([0,1],j_!R) = R[−1]` for every commutative `R`: the sections of `R` on `[0,1]` map
  diagonally to those on `{0, 1}`, `R → R²`, with cokernel `R` in degree `1`.
- On a point, `ℤ/2` over `R = ℤ/4` lies in the finite-coefficient comparison domain and has
  bounded cohomology, but is not perfect: its Tor groups with `ℤ/2` are nonzero in every degree.
- Non-example: assume `R` is nonzero. `j_!` is not `j_*`: for this interval and constant `R`,
  their stalks at `0` are respectively `0` and `R`.

**Local systems with arbitrary stalks — LocallySymmetric.SheafDerived.isoSingular.**
Let `R` be a commutative ring, `T` a semi-locally contractible space (every open subset `U` is
covered by open subsets `W ⊂ U` whose inclusions `W → U` are null-homotopic; a locally
contractible space, in which every open subset is covered by open subsets contractible in
themselves, is one) and `L` a local system of `R`-modules on `T` with arbitrary stalks, viewed
through AlgebraicTopology Stage 2.6 as a functor on the fundamental groupoid and as the
associated locally constant sheaf; a semi-locally contractible space is locally path-connected
and semilocally simply connected, since a null-homotopy of `W → U` joins every point of `W` to
one point by a path in `U` and kills every loop of `W` in `U`, so that identification applies.
Prove a natural isomorphism `RΓ(T, L) ≅ C^•(T; L)` in `D(R)` with the direct singular cochains
with local coefficients of AlgebraicTopology Stage 6.1, compatible with pullback along
continuous maps, coefficient maps, restriction to open subsets and finite-group actions on the
pair `(T, L)`, and agreeing with ComplexComparisonPartII §C6.1's comparison when `R` is finite
and the stalks are finite. For `Z ⊂ T` closed and semi-locally contractible, `U = T ∖ Z` and
`j : U → T`, prove `RΓ(T, j_!(L|_U)) ≅ C^•(T, Z; L)` compatibly with the open–closed triangle
and the long exact sequence of the pair; when `T` is compact Hausdorff the left side is
`RΓ_c(U, L|_U)` by §C6.1. Route: Sella's nesting-small cochains, taken with values in the stalk
of `L` at the first vertex of each simplex, form for every open `U` a direct limit over nestings
of surjective images of `C^•(U; L)`; the direct limit is a sheaf and each surjection is a
quasi-isomorphism, so the complex is flasque with global sections quasi-isomorphic to
`C^•(T; L)` without any paracompactness hypothesis. The sheaf and flasqueness steps do not
involve the coefficients; the small-chains step is built on each singular simplex from
operators on the standard simplex, whose output simplices lie in the image of that one simplex,
so it lifts to local coefficients exactly as the subdivision operators of AlgebraicTopology
Stage 2.6 do. The complex resolves `L` because a null-homotopic inclusion `W → U` pulls `L` back
to a constant system on `W` and induces the zero map from the augmented cohomology of `U` to
that of `W`, by the homotopy invariance of cohomology with local coefficients (Stage 6.1). The
relative form follows from the absolute comparisons on `T` and `Z`, the §C6.1 triangle
`j_!j^*L → L → i_*i^*L`, exactness of `i_*`, the surjective restriction
`C^•(T; L) → C^•(Z; L)` with kernel `C^•(T, Z; L)`, and the five lemma. The statement assumes:
`R` commutative; `T` semi-locally contractible; for the relative form `Z` closed and semi-locally
contractible. ([Sel16, definitions p. 1, main theorem p. 2, Lemma 0.1 pp. 2–3, the nesting
construction and its sheaf property pp. 6–8, and the small-chains homotopy pp. 8–19], for
constant coefficients, extended to local coefficients as described)

**Checks.**

- On `S¹` with `R = ℤ` and the rank-one system with stalk `ℤ` and monodromy `−1`, both sides give
  `H⁰ = 0` (invariants) and `H¹ = ℤ/2` (coinvariants `ℤ/(−1 − 1)ℤ`).
- Stalks need not be finite or finitely generated: for constant `ℚ` on `S¹` over `R = ℤ` both
  sides give `H⁰ = H¹ = ℚ`, outside the finite-coefficient supplier domain.
- Relative form: for `T = [0,1]`, `Z = {0, 1}` and constant `R`, `RΓ([0,1], j_!R) = R[−1]` and
  `H^1([0,1], {0,1}; R) = R`, all other relative groups being zero.
- Non-example: semi-local contractibility cannot be dropped. The closed topologist's sine curve
  is connected with two path components, so sheaf `H⁰` with constant `ℤ` is `ℤ` while singular
  `H⁰` is `ℤ²`; it is not locally path-connected at the points of its limit segment.

### ALS.F.4 Equivariant sheaves for topological groups

Define LocallySymmetric.EquivariantSheaf. Let `G` be a topological group, `R` a commutative ring
and `X` a `G`-space, that is, a topological space with a continuous right action `m : X × G → X`;
write `p : X × G → X` for the projection. A `G`-equivariant sheaf of `R`-modules on `X` is a sheaf
`F` of `R`-modules with an isomorphism `θ : p^*F ≅ m^*F` satisfying the cocycle condition on
`X × G × G`; these form an abelian category `Sh_G(X, R)`, which for discrete `G` is
the category of module sheaves with a compatible isomorphism for each group element.
Prove: (i) if `q : X → X/G`
is a locally trivial `G`-torsor, `q^* : Sh(X/G, R) → Sh_G(X, R)` is an equivalence with inverse
`F ↦ (q_*F)^G`; (ii) if `X` is compact, the global sections of every object of `Sh_G(X, R)` form a
smooth
`G`-representation; (iii) taking the stalk is an equivalence from `Sh_G(pt, R)` to the smooth
`R[G]`-modules of SmoothRepresentationsOfLocalGroups SR.0; (iv) for compact `X`, the functor
`Γ_X : Sh_G(X, R) → Mod_sm(G, R)` preserves injectives, being right adjoint to the exact pullback
along `X → pt`; (v) for `G` locally profinite, `Sh_G(X, R)` has enough injectives, so that for
compact `X`
there
is a right derived functor `RΓ_X : D⁺(Sh_G(X, R)) → D⁺_sm(G, R)`. The statement assumes `G` a
topological group acting continuously on `X`; the underlying topological sheaf functors of
ALS.F.3; local triviality for (i); `X`
compact for (ii) and
(iv); `G` locally profinite for (v). ([NT16, §2.4, Definitions 2.22–2.23 and Lemma 2.24]; [NT16,
§2.4.1, Lemmas 2.25–2.26, Definition 2.27 and Lemma 2.28]; [CN23, §2.1.2, p. 10, and footnote 3])

For a discrete group `Γ` and any topological `Γ`-space `X`, prove that the forgetful functor to
module sheaves is exact and has coinduction as right adjoint, and that equivariant sheaves have
enough injectives. Restriction to a subgroup preserves injectives by exact sheaf induction.
Equivariant global sections `Γ_X` take values in `R[Γ]`-modules and preserve injectives by their
exact constant-sheaf left adjoint; compactness is unnecessary for discrete `Γ`. Define invariant
sections by `Γ_X(F)^Γ`. For an equivariant injective `I, Γ_X(I)` is injective over `R[Γ]`, hence
acyclic for invariants. Therefore the derived invariant-sections functor is
`RΓ(Γ, RΓ_X(F))`, naturally at chain level; apply invariants termwise to `Γ_X` of a bounded-below
equivariant injective resolution. For a closed `Γ`-stable `Z ⊂ X`, use the right adjoint
`𝓗_Z` to exact closed pushforward to obtain supported invariant sections
`Γ_Z(X,F)^Γ = Γ(Z,𝓗_Z(F))^Γ` and the localization triangle with `X ∖ Z`.
For an open `j` and complementary closed `i`, resolve `j_!F` and `i_*i^*F` separately to obtain
the compact-support/open–closed triangle; exactness of `j_!` alone gives no preservation of
injectives. The support and open–closed assertions assume `X` locally compact Hausdorff and use
ComplexComparisonPartII §C6.1's extension by zero and localization triangle through ALS.F.3. ([NT16, §2.3, Definition 2.12, Lemma 2.13, Lemma 2.14, Corollary 2.15
and Proposition 2.18, pp. 21–24]; [Stacks, Section 20.21 (0A39), Lemma 20.21.1 (0A3A)])

The API: LocallySymmetric.EquivariantSheaf — the category `Sh_G(X, R)`;
LocallySymmetric.EquivariantSheaf.descent — the equivalence `Sh(X/G, R) ≃ Sh_G(X, R)` for a free
`G`-space; LocallySymmetric.EquivariantSheaf.smoothSections — global sections on a compact
`G`-space are smooth; LocallySymmetric.EquivariantSheaf.pointEquiv — `Sh_G(pt, R) ≃ Mod_sm(G, R)`;
LocallySymmetric.EquivariantSheaf.derivedSections — `RΓ_X : D⁺(Sh_G(X, R)) → D⁺_sm(G, R)` for
compact `X`.

The discrete API also supplies LocallySymmetric.EquivariantSheaf.invariantSections —
`F ↦ Γ(X,F)^Γ` and its right derived functor;
LocallySymmetric.EquivariantSheaf.invariantSectionsWithSupport — closed supported invariants
and their derived localization triangle. Discrete `derivedSections` is defined for every `X`.

*Needs:* ALS.F.3; Mathlib `CategoryTheory.Adjunction.map_injective`;
SmoothRepresentationsOfLocalGroups SR.0 (smooth representations) and SR.0d.2
(`derived-invariants`).

**Checks.**

- For `X` a point, `Sh_G(pt, R)` is the category of smooth `R[G]`-modules and `RΓ_pt` is the
  identity of `D⁺_sm(G, R)`.
- For `G = ℤ_p` acting on `X = ℤ_p` by translation, `X` is a free compact `G`-space with quotient a
  point, `Sh_G(ℤ_p, R)` is equivalent to the category of `R`-modules, and the global sections of the
  sheaf attached to `M` are the locally constant functions `ℤ_p → M`, a smooth representation.
- Non-example: assume `R` is nonzero. Compactness cannot be dropped in (ii). For `G = ℤ_p`
  acting on `X = ℤ_p × ℕ` (with `ℕ` discrete) by translation on the first factor and `F` the
  constant sheaf `R`, the global section
  `(x, n) ↦ 1_{p^nℤ_p}(x)` is fixed by no open subgroup of `ℤ_p`.
- For discrete `Γ = C₂` on a point with `R = 𝔽₂` and trivial coefficients, derived invariant
  sections give `𝔽₂` in every nonnegative degree; plain invariants give degree zero alone.
- For `Γ = ℤ` translating `ℝ`, the quotient-cover descent gives invariant cohomology
  `H⁰ = H¹ = R` and no higher groups, without requiring `ℝ` compact.
- For trivial `Γ` and nonzero `R`, closed support at `{0}` in `ℝ` gives `R[−1]`. The open–closed
  compact-pair calculation for `j : (0,1) → [0,1]` gives `RΓ([0,1],j_!R) = R[−1]` with zero
  boundary stalks, whereas `RΓ([0,1],j_*R) = R` in degree zero.

### ALS.F.5 Lie algebra cochains, relative cochains and invariant forms

Define LocallySymmetric.lieCochains. For a Lie algebra `𝔤` over a field `E` of characteristic zero
and a `𝔤`-module `V`, the Chevalley–Eilenberg complex is `C^q(𝔤, V) = Hom_E(∧^q 𝔤, V)` with its
standard differential, and `H^q(𝔤, V)` its cohomology; `H⁰(𝔤, V) = V^𝔤`, and in degrees `≤ 2` the
cochains and the differential `d₁₂` are those of Mathlib's `LieModule.Cohomology`. For a real Lie
algebra `𝔤` (or its complexification), a compact Lie group `K` acting on `𝔤` with Lie algebra
`𝔨 ⊂ 𝔤`, and a `(𝔤, K)`-module `W`, the relative complex is `C^q(𝔤, K; W) = Hom_K(∧^q(𝔤/𝔨), W)` with
the
induced differential, and `H^q(𝔤, K; W)` its cohomology. Prove: for finite-dimensional `𝔤` and a
field extension `E′/E`, `C^•(𝔤, V) ⊗_E E′ ≅ C^•(𝔤 ⊗_E E′, V ⊗_E E′)`; and for a Lie group `H` with
Lie algebra `𝔥`, a compact subgroup `K` and a smooth representation `W` of `H`, evaluation at the
base
point identifies the complex of `H`-invariant `W`-valued differential forms on `H/K` (with `H`
acting on forms and on `W`) with `C^•(𝔥, K; W)`; for `K = 1` and `H` connected these are the
left-invariant forms and `C^•(𝔥, W)`. The statement assumes `E` of characteristic zero, `K` compact
with Lie algebra `𝔨`, and `W` smooth for the invariant-forms comparison. ([HR15, §3.1.1, pp.
15–16]; [Fra98, §2.3, (16)–(17), p. 197])

The API: LocallySymmetric.lieCochains — `C^•(𝔤, V)` and `H^•(𝔤, V)`;
LocallySymmetric.lieCochains.relative — `C^•(𝔤, K; W)` and `H^•(𝔤, K; W)`;
LocallySymmetric.lieCochains.baseChange — compatibility with extension of scalars;
LocallySymmetric.lieCochains.invariantForms — `H`-invariant `W`-valued forms on `H/K` are
`C^•(𝔥, K; W)`.

*Needs:* Mathlib `LieModule.Cohomology`, `LieAlgebra`, `LieModule`;
ALS.F.1;
RepresentationTheory/LieGroups, Layer 2; DifferentialGeometry, Layers 0 and 6 (forms and the de Rham
complex).

**Checks.**

- For the one-dimensional abelian Lie algebra `𝔤 = E` and `V = E`, `H⁰ = H¹ = E` and `H^q = 0` for
  `q ≥ 2`.
- For `𝔤 = 𝔰𝔩_2(E)` and `V = E`, `H¹ = H² = 0` and `H³ = E`; `H¹ = 0` because `[𝔤, 𝔤] = 𝔤`.
- Relative: for `(𝔰𝔩_2(ℝ), SO(2))` and `W = ℂ`, `SO(2)` rotates `𝔤/𝔨` with weights `±2`, so
  `H⁰ = H² = ℂ` and `H¹ = 0`, the cohomology of the compact dual `S²`.

### ALS.F.6 Automorphic forms, constant terms and cusp forms

Define LocallySymmetric.AutomorphicForm. Let `G` be connected reductive over a number field `F`,
`K_∞ ⊂ G(F_∞)` a maximal compact subgroup (ALS.F.1),
`𝔤 = Lie G(F_∞) ⊗_ℝ ℂ`, `Z(𝔤)` the centre of its enveloping algebra
(RepresentationTheory/LieHighestWeight, Layer 7) and
`‖·‖` an adelic norm attached to a faithful representation. A smooth function on `G(𝔸_F)` (smooth in
the archimedean variable, locally constant in the finite one) has moderate growth if
`|f(g)| ≤ C‖g‖^m` for some `C, m`. Define `T([G])`, the smooth right `K_∞`-finite functions on
`G(F)\G(𝔸_F)`,
right invariant under some compact open subgroup of `G(𝔸^∞)`, all of whose `U(𝔤)`-derivatives have
moderate growth with a common exponent. An automorphic form is a smooth function `f` on
`G(F)\G(𝔸_F)` that is right `K_∞`-finite, right invariant under a compact open subgroup of
`G(𝔸^∞)`, annihilated by an ideal of finite codimension of `Z(𝔤)`, and of moderate growth; they form
a `(𝔤, K_∞) × G(𝔸^∞)`-module `𝒜(G)`. For a rational parabolic `P` with unipotent radical `N` the
constant term is `f_P(g) = ∫_{N(F)\N(𝔸_F)} f(ng) dn`, and `f` is cuspidal if `f_P = 0` for every
proper `P`, equivalently for every proper maximal `P`; cusp forms are cuspidal automorphic forms.
Prove: (i) for a fixed ideal `J` of finite codimension, finite set of `K_∞`-types and level, the
space of automorphic forms of that type is finite dimensional; (ii) every automorphic form `f`
satisfies `f = f * α` for some `α ∈ C_c^∞(G(F_∞))` invariant under conjugation by `K_∞`, namely
`α(kxk⁻¹) = α(x)` for all `k ∈ K_∞`, equivalently `α(kx) = α(xk)`, hence lies in `T([G])`; (iii) a
cuspidal function satisfying the conditions on `K_∞`, level and `Z(𝔤)`, with a unitary central
character on `A_∞`, is a cusp form if and only if it is bounded, if and only if it is square
integrable modulo `A_∞`, and then it is rapidly decreasing on `A_∞G(F)\G(𝔸_F)`; (iv) for a unitary
character `χ` of
`A_∞`, the cuspidal subspace of `L²(G(F)\G(𝔸_F))_χ` is a Hilbert direct sum of irreducible closed
invariant subspaces with finite multiplicities (Gelfand–Piatetski-Shapiro). In each irreducible
summand take its archimedean smooth `K_∞`-finite vectors that are fixed by some compact open finite
level; these form its admissible module and are `Z(𝔤)`-finite. The cusp forms with central character
`χ` are the algebraic direct sum of those modules, including the multiplicity spaces. Equivalently
they are the vectors of the cuspidal Hilbert space that are archimedean smooth, `K_∞`-finite,
`Z(𝔤)`-finite and fixed by some compact open finite level. An irreducible admissible
`(𝔤, K_∞) × G(𝔸^∞)`-module is a cuspidal automorphic representation if it is a subquotient of the
cusp forms.
The statement assumes `G` connected reductive over `F`. ([BJ79, §1.6 (2), p. 191]; [BJ79, §1.8, pp.
191–192]; [BJ79, §4.2 and §4.3 (i), pp. 194–195]; [BJ79, §4.4, p. 196]; [BJ79, §4.6, pp. 196–197];
[Fra98, §2.3, Proposition 2, p. 198], for `T([G])`; [BorAF, §4.2, p. 4], for the conjugation
convention in (ii))

The API: LocallySymmetric.AutomorphicForm — the module `𝒜(G)`;
LocallySymmetric.AutomorphicForm.uniformModerateGrowth — the space `T([G])` and the inclusion
`𝒜(G) ⊂ T([G])`; LocallySymmetric.AutomorphicForm.finiteDimensional — (i);
LocallySymmetric.AutomorphicForm.constantTerm — `f ↦ f_P`;
LocallySymmetric.AutomorphicForm.cuspForm — cusp forms, with (iii);
LocallySymmetric.AutomorphicForm.cuspidalSpectrum_discrete — (iv);
LocallySymmetric.AutomorphicForm.cuspidalRepresentation — cuspidal automorphic representations.

*Needs:* ALS.F.1; AdelicAlgebraicGroups §1.3 (rational points discrete),
§2.1 (the split component `A_G`), §3.4 (finiteness of class numbers) and §3.6 (Siegel sets);
RepresentationTheory/LieHighestWeight, Layer 7 (the centre of the enveloping algebra);
SmoothRepresentationsOfLocalGroups SR.0 (smooth representations).

**Checks.**

- For `G = GL_{1,ℚ}` there is no proper parabolic, so every automorphic form is cuspidal; the
  automorphic forms are the finite sums of products of Hecke characters with polynomials in
  `log|x|_𝔸`, the logarithm of the global idele norm. The product formula makes this norm
  trivial on `ℚ^×`: the identity idele and the principal idele `2` both have norm `1`, although
  their archimedean logarithms are `0` and `log 2`.
- For `G` anisotropic modulo its centre, `A_∞G(F)\G(𝔸_F)` is compact and every automorphic form is a
  cusp form.
- For `G = GL_{2,ℚ}`, the adelic lift of a holomorphic cusp form is a cusp form, while the constant
  function `1` is an automorphic form with constant term `1` along the upper Borel, hence not
  cuspidal.
- For the norm-one group of an indefinite quaternion division algebra over `ℚ`, at neat finite
  level the arithmetic surface is compact and there are no proper rational parabolics. An infinite
  sum of right `K_∞`-invariant Laplace eigenfunctions with distinct eigenvalues and nonzero
  coefficients decreasing fast enough to converge in every smooth seminorm is smooth and in the
  cuspidal Hilbert space. No nonzero polynomial in the Casimir annihilates it, so it is not
  `Z(𝔤)`-finite and is not in the algebraic cusp-form module.

### ALS.F.7 Algebraic weights and cohomological representations at infinity

Define LocallySymmetric.cohomologicalRepresentation. Let `G` be connected reductive over a number
field `F`, `𝐆 = Res_{F/ℚ} G`, and `E` a field of characteristic zero over which `𝐆` is split, with
split maximal torus `T` and Borel `B ⊃ T`. (i) Algebraic weights: the irreducible algebraic
representations of `𝐆_E` are absolutely irreducible, determined by their highest weight, a dominant
character `λ` of `T`, and every algebraic representation is a direct sum of them; write `V_λ`, with
differential the irreducible `L(λ)` of RepresentationTheory/LieHighestWeight. For `G = GL_n` and `E`
containing the images of all embeddings of `F`, the dominant weights are `(ℤ^n_+)^{Hom(F,E)}`,
`V_λ = ⊗_τ V_{λ_τ}` and `V_λ^∨ ≅ V_{λ^∨}` with `λ^∨_{τ,i} = −λ_{τ,n+1−i}`, and for `E` `p`-adic
with ring of integers `O` the coefficient lattice `𝒱_λ = ⊗_τ 𝒱_{λ_τ}` is the tensor product of the
integral dual Weyl modules, a finite free `O`-module equipped with an `O`-linear representation of
`∏_{v|p} GL_n(O_{F_v})`. Each reduction `𝒱_λ/ϖ^m` is smooth with its discrete coefficient fibre;
`𝒱_λ` itself need not be smooth as a discrete module. (ii) Wigner's lemma: if
`W` is a `(𝔤, K_∞)`-module on which `Z(𝔤)` acts by a character and `H^*(𝔤, K_∞; W ⊗ V_λ) ≠ 0`, then
that character is the infinitesimal character of `V_λ^∨`. The finite-fibre theorem of
Harish–Chandra is also a target here: for `G(F_∞)` and its full maximal compact `K_∞`, each algebra
character `χ : Z(𝔤) → ℂ` occurs in only finitely many isomorphism classes of irreducible admissible
`(𝔤, K_∞)`-modules. These are compatible modules of ALS.F.5, locally finite under `K_∞`, with finite
multiplicity of each irreducible `K_∞`-type; the differentiated compact action agrees with the
restricted Lie action, and `k(Xw) = (Ad(k)X)(kw)`. Together with Wigner's lemma this gives finitely
many irreducible admissible `W` with nonzero cohomology for fixed `λ`. (iii) For `F` imaginary CM and
`G = GL_n`, put
`q₀ = [F⁺ : ℚ] n(n − 1)/2` and `ℓ₀ = [F⁺ : ℚ] n − 1`, and let `𝔪_G = 𝔤/𝔞_G`; for a cuspidal
automorphic
representation `π` of `GL_n(𝔸_F)` whose central character on `A_∞` is inverse to that of `V_λ`,
`H^*(𝔪_G, K_∞; π_∞ ⊗ V_λ) = 0` unless `π` is regular algebraic of weight `λ`, and then
`H^j(𝔪_G, K_∞; π_∞ ⊗ V_λ) ≠ 0` exactly for `j ∈ [q₀, q₀ + ℓ₀]`. (iv) For `F` totally real or CM and
`π` cuspidal with `π_∞` regular `L`-algebraic, `π|·|^{(n+1)/2}` is regular `C`-algebraic and
cohomological: some algebraic `ξ` of `Res_{F/ℚ} GL_n` has
`H^*(𝔪_G, K_∞°; π_∞|·|^{(n+1)/2} ⊗ ξ) ≠ 0`. The statement assumes the hypotheses of each part.
([ACC+23, §2.2, pp. 917–918]; [HR15, §3.1.2,
Lemma 3.2, and §3.1.4, pp. 16–17]; [BK, §4, Theorem 4.2(ii), pp. 20–21], for finite fibres;
[ACC+23, §2.4.9, Theorem 2.4.10 and its proof, pp. 948 and 951];
[Sch15, §V.4, proof of Corollary V.4.2, p. 102]; [CN23, §2.1.11, p. 16], for the integral lattices)

The API: LocallySymmetric.cohomologicalRepresentation — the `(𝔤, K_∞)`-modules with nonzero
cohomology against some `V_λ`; LocallySymmetric.cohomologicalRepresentation.algebraicWeight —
`λ ↦ V_λ`, with duals; LocallySymmetric.cohomologicalRepresentation.coefficientLattice — `𝒱_λ`;
LocallySymmetric.cohomologicalRepresentation.wigner — the central-character implication in (ii);
LocallySymmetric.cohomologicalRepresentation.finiteInfinitesimalCharacter — its finite-fibre theorem;
LocallySymmetric.cohomologicalRepresentation.degreeRange — (iii), with `q₀` and `ℓ₀`;
LocallySymmetric.cohomologicalRepresentation.twist_cAlgebraic — (iv).

*Needs:* ALS.F.5; ALS.F.6;
RepresentationTheory/LieHighestWeight,
Layers 4, 5, 7 and 9. Within this target the compatible-module conventions and the finite-fibre
theorem precede the fixed-weight finiteness conclusion. Algebraic coefficients and Wigner's lemma
precede the specialized cuspidal degree and twisting results (iii)–(iv), whose proofs are targets
of this section with the cited sources.

**Checks.**

- For `G(F_∞) = ℝ^×` and `K_∞ = {±1}`, the one-dimensional modules realized by `|x|^c` and
  `sign(x)|x|^c`, for `c ∈ ℂ`, have the same infinitesimal character. A finite fibre need not be a
  singleton.
- For the compact torus `U(1)` with `K_∞ = U(1)`, compatibility forces its irreducibles to have
  integral infinitesimal weight: in the coordinate where `z ↦ z^m` has weight `m`, each integral
  fibre is a singleton and every nonintegral fibre is empty.
- For `ℝ^×`, the trivial modules `ℂ^r`, `r ≥ 1`, have the same infinitesimal character and distinct
  dimensions. They are admissible; irreducibility is essential to the finite-fibre assertion.
- `n = 1`, `F` imaginary quadratic: `q₀ = ℓ₀ = 0`, and an algebraic Hecke character contributes in
  degree `0` only.
- `n = 2`, `F` imaginary quadratic: `q₀ = ℓ₀ = 1`, so the range is `{1, 2}`, the cuspidal degrees of
  Bianchi threefolds.
- Non-example for (ii): for `(𝔰𝔩_2(ℝ), SO(2))`, `W = ℂ` and `V = Sym² ℂ²`, the infinitesimal
  characters differ and `H^*(𝔤, K; W ⊗ V) = 0`, whereas for `V = ℂ` one gets `ℂ` in degrees `0`
  and `2`.
- For `n = 1` and `λ = 0`, `𝒱_λ = O` is the rank-one trivial `O`-representation. For a
  nontrivial compact group, `[g] − [1]` with `g ≠ 1` annihilates it, so it is not free over the
  compact-group algebra.
- For `n = 1` and `λ = (k) ≠ 0`, `𝒱_λ = O` has the rank-one character action through the
  `k`-th powers of the embeddings. Freeness and finiteness are over `O`, separately from that
  representation.

### Examples

- `GL_N(ℝ)`, for `N ≥ 1`, has two components and maximal compact `O(N)`; `GL_0(ℝ)` is trivial
  with one component. `SL_2(ℝ)` is connected with maximal
  compact `SO(2)`.
- Over a discrete valuation ring, `O/ϖ` is a perfect `O`-module; over `k[ε]/(ε²)`, `k` is not.
- `RΓ([0, 1], j_!R) = R[−1]` for `j : (0, 1) → [0, 1]`.
- On the noncompact `ℤ_p × ℕ`, global sections of an equivariant sheaf need not be smooth.
- `H^•(𝔰𝔩_2(ℝ), SO(2); ℂ) = ℂ ⊕ ℂ[−2]`.

### Dependencies

Mathlib (`DerivedCategory`, `CategoryTheory.Sheaf.H`, `LieModule.Cohomology`, `Module.Projective`);
RepresentationTheory/LieGroups, Layers 2 and 9; RepresentationTheory/LieHighestWeight, Layers 4, 5,
7 and 9; DifferentialGeometry, Layers 0 and 6; AdelicAlgebraicGroups §§1.3–1.4, 2.1, 3.4, 3.6;
ALS.F.4; SmoothRepresentationsOfLocalGroups SR.0 and SR.0d.2.

## Layer ALS.0: Symmetric spaces, arithmetic quotients and local geometry

This layer builds the geometric objects: the Cartan datum of the real points, the symmetric space
with the split centre removed, the adelic quotient `X_K` and its decomposition into arithmetic
quotients, proper discontinuity with finite stabilizers, the manifold structure at neat level, the
standard level subgroups, and the orientation local system. The quotient carrier is
AdelicAlgebraicGroups' `LevelMaps.LevelQuotient` for the archimedean subgroup `K_∞A_∞`; this layer
adds the symmetric-space factor and its geometry.

### ALS.0.1 Cartan involutions of real reductive groups

Define `IsCartanInvolution`. Let `H` be a connected linear algebraic group over `ℝ`,
with complex conjugation `g ↦ ḡ` on `H(ℂ)`. An involution `θ` of `H`, as an algebraic group over `ℝ`, is a
Cartan involution if the twisted real form `H^(θ)(ℝ) = {g ∈ H(ℂ) : g = θ(ḡ)}` is compact. For a
connected reductive group `G` over a number field `F` we apply this to `H = (Res_{F/ℚ} G)_ℝ`, so
that `H(ℝ) = G(F_∞) = ∏_{v|∞} G(F_v)`; a Cartan involution of `G(F_∞)` is a product of Cartan
involutions of the
factors `G_{F_v}`. Its fixed group `K_θ = G(F_∞)^θ` is the associated maximal compact subgroup (see
ALS.0.3). The statement assumes: `H` connected linear algebraic group
over `ℝ` (reductive for existence); `G` connected reductive over a number field `F`. Rational
and restriction-of-scalars existence uses AdelicAlgebraicGroups AA.3.7 and the comparison below;
existence over arbitrary real groups is owned here. ([Mil17, §1,
definition (9), p. 15]; [Mil17, §1, Theorem 1.16, p. 15]; [Mil17, §1, Example 1.17(a)–(c), p. 15])

The API: `IsCartanInvolution` — The predicate on an involution `θ` of `G_ℝ`: the
twisted real form `G^(θ)(ℝ)` is compact; `IsCartanInvolution.exists` — Every
connected reductive group over `ℝ` has a Cartan involution (Satake; Milne Theorem 1.16),
with the rational case obtained from AA.3.7;
`IsCartanInvolution.conj` — Any two Cartan involutions `θ, θ′` of `G` differ by `ad(g)`
for some `g ∈ G(ℝ): θ′ = ad(g) ∘ θ ∘ ad(g)⁻¹`; LocallySymmetric.IsCartanInvolution.transposeInverse
— If `G ⊂ GL_n` is stable under `g ↦ gᵗ`, then `g ↦ (gᵗ)⁻¹` restricts to a Cartan involution of `G`;
for `G = GL_n` it is Cartan with fixed group `O(n)`; LocallySymmetric.IsCartanInvolution.prod —
For `G = G₁ × G₂, θ₁ × θ₂` is Cartan if and only if `θ₁` and `θ₂` are; for `Res_{F/ℚ}G` Cartan
involutions are products
over `v | ∞`; LocallySymmetric.IsCartanInvolution.killing — For a semisimple real group, the induced
involution is Cartan iff `(X, Y) ↦ −B(X, dθ(Y))` is positive definite. For a reductive group this
criterion tests only the derived subgroup; compactness of the twisted central torus is a separate
condition.

`Suggested.lean` defines `IsCartanInvolution` on Tau Ceti's finite-type coordinate Hopf algebras,
that is, on affine real algebraic groups, by compactness of the twisted complex points in the
evaluation topology, which for finite type is the usual topology on complex points. Its
`IsCartanInvolution.exists` states existence for every connected reductive real algebraic group,
and `IsCartanInvolution.conj` states conjugacy by a real point. The latter uses Tau Ceti's
`TauCeti.CommHopfAlgCat.innerConjugationIso`, retaining the contravariance of coordinate pullback.

*Needs:* Mathlib `Matrix.GeneralLinearGroup`; RepresentationTheory/LieGroups, Layer 9;
AdelicAlgebraicGroups AA.3.7 (rational inverse-adjoint data and existence).

**Checks.**

- cartanInvolution_GL_transposeInverse: For `G = GL_n` over `ℝ, θ(g) = (gᵗ)⁻¹` is a Cartan involution
  and `G(ℝ)^θ = O(n)`.
- cartanInvolution_SL2_adjoint: For `G = SL_2` and `θ = ad((0, 1; −1, 0))`, the twisted form is `SU(2)`,
  compact (Milne Example 1.15), so `θ` is Cartan.
- cartanInvolution_compact_id: If `G(ℝ)` is compact (`e`.`g`. `G = SO(n)` or a norm-one torus), the
  identity is a Cartan involution and the only one.
- not_cartanInvolution_id_GL2: The identity of `GL_2` is not a Cartan involution: its twisted form
  is `GL_2(ℝ)`, which is not compact.

**Shared algebraic Cartan comparison — LocallySymmetric.IsCartanInvolution.iff_inverseAdjoint.**
For a connected reductive `ℚ`-group `𝐆` and a specified real algebraic involution `θ` of `𝐆_ℝ`,
prove that `IsCartanInvolution θ` holds exactly when there are a faithful rational matrix
representation `ρ` and a positive definite real symmetric form `b` satisfying
`ρ(θ(g)) = b⁻¹ρ(g⁻¹)ᵀb` on every real coefficient algebra, the datum of AA.3.7. Forward from the
inverse-adjoint equation, the twisted real points embed as a closed subgroup of `U(b)`, hence are
compact. Conversely, apply the transpose-stable realization to a faithful rational representation
base changed to `ℝ`; conjugacy of Cartan involutions transports its positive form to the specified
`θ`. The comparison preserves `θ` itself and identifies both compact subgroups with the literal
`Fix(θ)`, including all components. It preserves `A_𝐆`, `A_∞` and `𝔞_G`; `θ` acts by inversion on
the split central torus. Apply AA.3.7 to `Res_{F/ℚ}G` for number-field existence. The Lie adapter
ALS.0.2 and the horospherical coordinates of ALS.2.1 consume this same datum.
([Mil17, §1, Theorem 1.16 and Example 1.17(b)–(c), p. 15]; AdelicAlgebraicGroups AA.3.7)

*Needs:* the predicate and conjugacy API above; AdelicAlgebraicGroups AA.3.7. This bridge is owned
here; rational inverse-adjoint existence is owned by AA.3.7.

**Checks.**

- For `GL₂`, the rational standard representation and `b = 1` give transpose-inverse on both
  presentations and the same `O(2)`, including its determinant-negative component; the compact
  twist is `U(2)`.
- For the split central `G_m`, `θ(a) = a⁻¹`, the fixed compact is `{±1}`, and the positive real
  component lies in `exp(𝔭)`; identity has noncompact twist and satisfies neither presentation.
- For `SL₂` and the upper Borel, the AA.3.7 datum with `b = 1` gives `SO(2)` in both the imported
  Siegel coordinates and the symmetric-space basepoint. ALS.2.1 uses its `θ`-stable Levi; changing
  to a conjugate compact requires transporting the whole datum and coordinates together.

### ALS.0.2 Real points and the Lie-theoretic Cartan datum

Prove LocallySymmetric.realPoints_cartanDatum. Let `G` be connected reductive over a number field
`F` and `𝐆 = Res_{F/ℚ} G` (AdelicAlgebraicGroups §1.4). Then `G(F_∞) = 𝐆(ℝ) = ∏_{v|∞} G(F_v)` is a
real Lie group with finitely many connected components whose Lie algebra is `𝔤 = Lie(𝐆) ⊗_ℚ ℝ`
(ALS.F.1). For the specified Cartan involution `θ` of
`𝐆_ℝ`, identified with the AA.3.7 datum by ALS.0.1, the differential `dθ` is
an involution of `𝔤`
with eigenspace decomposition `𝔤 = 𝔨 ⊕ 𝔭`, the fixed group `K_θ = G(F_∞)^θ` has Lie algebra `𝔨`, and
`(G(F_∞), K_θ, θ)` is a real reductive group in the sense of RepresentationTheory/LieGroups, Layer
9. LieGroups' Cartan decomposition `K_θ × 𝔭 → G(F_∞)`, `(k, X) ↦ k·exp X`, is a diffeomorphism;
composing with inversion `g ↦ g⁻¹` and using `𝔭 = −𝔭` gives the
right-coset form `𝔭 × K_θ → G(F_∞)`, `(X, k) ↦ exp(X)·k`, so `G(F_∞)/K_θ ≅ 𝔭` through
`exp(X)K_θ ↔ X`. The split centre sits inside this datum: `A_∞ = A_𝐆(ℝ)°` is central, contained in
`exp(𝔭)`, and
`𝔞_G = Lie(A_∞) ⊆ 𝔭 ∩ 𝔷(𝔤)`, so `X^G = G(F_∞)/K_θA_∞ ≅ 𝔭/𝔞_G`; and `π₀(K_θ) → π₀(G(F_∞))` is a
bijection. The algebraic predicate of ALS.0.1 and the Lie-theoretic one agree:
`θ` is Cartan exactly when `X, Y ↦ −B_θ(X, dθ Y)` is positive definite on the derived algebra and
the twisted form of the central torus is compact, where `B_θ` is the trace form of a faithful
representation. The statement assumes `G` connected reductive over `F`; `θ` an algebraic Cartan
involution of `𝐆_ℝ`. ([Mil17, §1, definition (9) and Theorem 1.16, p. 15]; [NT16, §3.1, p. 41,
citing BS73 (1.9)]; [BS73, §§1.4–1.9, pp. 440–444])

*Needs:* ALS.0.1; ALS.F.1;
RepresentationTheory/LieGroups, Layer 9; AdelicAlgebraicGroups §1.4 (restriction of scalars) and
§2.1 (the split component `A_G`).

**Checks.**

- `GL_n(ℝ)` with `n ≥ 1`: `θ(g) = (gᵀ)⁻¹`, `dθ(X) = −Xᵀ`, `𝔭 = Sym_n(ℝ)`; LieGroups' polar form
  `g = k·exp(S)` is turned by inversion into `g = exp(kSk⁻¹)·k`, so `GL_n(ℝ)/O(n) ≅ Sym_n(ℝ)`; with
  `A_∞ = ℝ_{>0}·1` removed, `𝔭/𝔞_G` is the trace-zero symmetric matrices, of dimension
  `n(n+1)/2 − 1`. For `n = 0` the group is trivial, `A_∞ = 1` and `X^G` is a point.
- Degenerate: for `G = GL_{1,F}` with `F` real quadratic, `G(F_∞) = (ℝ^×)²`, `K_θ = {±1}²`,
  `𝔭 = ℝ²`, `𝔞_G` the diagonal line, and `X^G ≅ ℝ`; for `F = ℚ` or imaginary quadratic `X^G` is a
  point.
- Non-example: dividing by the whole identity component of the real centre instead of `A_∞` is
  wrong. For `Res_{F/ℚ} G_m` with `F` real quadratic the connected real centre is `(ℝ_{>0})²`, which
  would collapse `X^G` to a point and lose the unit-group circle of `GL_{1,F}`; only the `ℚ`-split
  diagonal `ℝ_{>0}` is removed.

### ALS.0.3 Maximal compact subgroups from Cartan involutions

Prove LocallySymmetric.isMaximalCompact_fixedPoints. Let `G` be connected reductive over a number
field `F` and `θ` a Cartan involution of `G(F_∞)`. Then `K_∞ = G(F_∞)^θ` is a maximal compact subgroup of
`G(F_∞)`, it meets every connected component of `G(F_∞)`, every compact subgroup of `G(F_∞)` is contained
in a `G(F_∞)`-conjugate of `K_∞`, and with `𝔭` the (−1)-eigenspace of `dθ` on `𝔤 = Lie G(F_∞)`, the
map `K_∞ × 𝔭 → G(F_∞), (k, X) ↦ k·exp X`, is a diffeomorphism. The statement assumes: `G` connected
reductive over
`F; θ` a Cartan involution of `G(F_∞)`. ([NT16, §3.1, after Definition 3.1, p. 40]; [BS73, §§1.4,
1.6–1.7, pp. 440–444]; [PRR23, §3.2, Proposition 3.26, p. 146])

*Needs:* ALS.0.1; ALS.0.2;
ALS.F.1 (maximal compact subgroups); RepresentationTheory/LieGroups,
Layer 9.

**Checks.**

- `GL_n(ℝ)` with `n ≥ 1: K_∞ = O(n)` meets both components; polar decomposition
  `GL_n(ℝ) = O(n)·exp(Sym_n)`. For `n = 0` the group and `K_∞` are trivial, with one component.
- `GL_n(ℂ): K_∞ = U(n)`, connected.
- `SL_2(ℝ): K_∞ = SO(2)`, and the finite subgroup generated by (0, −1; 1, 1) is conjugate into it.

### ALS.0.4 The symmetric space of G with the split-centre correction

Define LocallySymmetric.symmetricSpace. Let `G` be connected reductive over a number field
`F, 𝐆 = Res_{F/ℚ} G, A_𝐆` the maximal `ℚ`-split torus in the centre of `𝐆` and `A_∞ = A_𝐆(ℝ)°`. Fix
a Cartan
involution `θ` with maximal compact `K_∞ = G(F_∞)^θ`. The symmetric space of `G` is `X^G = G(F_∞)/K_∞A_∞`, a
homogeneous space for the left action of `G(F_∞)` whose point stabilizers are the conjugates
`g K_∞ A_∞ g⁻¹`. Equivalently `X^G` is the space of type `S−Q` for `𝐆` in the sense of Borel–Serre:
the isotropy
groups are `K·S(ℝ)` with `S` a maximal `ℚ`-split torus of the radical normalized by `K`. It is independent
of `θ` up to `G(F_∞)`-equivariant isomorphism, and `d_G = dim X^G = dim G(F_∞) − dim K_∞ − dim A_∞`. The
split-centre correction is part of the definition: for `GL_n` with `n ≥ 1, X = GL_n(F_∞)/K_∞ℝ^×_{>0}`
(ACC+ writes
`K_∞ℝ^×`, which agrees since `−1 ∈ K_∞`). The statement assumes: `G` connected reductive over a number
field `F; A_𝐆` the maximal `ℚ`-split central torus of `Res_{F/ℚ} G`. ([NT16, §3.1, Definition 3.1, p. 40];
[ACC+23, §2.1.1, pp. 909–910])

The API: LocallySymmetric.symmetricSpace — `X^G = G(F_∞)/K_∞A_∞` as a topological space (smooth
manifold) with its left `G(F_∞)`-action; LocallySymmetric.symmetricSpace.basepoint — The base point
`x₀ = [1]` with stabilizer `K_∞A_∞`; LocallySymmetric.symmetricSpace.stabilizer_eq —
`Stab(g·x₀) = g K_∞A_∞ g⁻¹` for all `g ∈ G(F_∞)`; LocallySymmetric.symmetricSpace.isoOfCartan —
For Cartan
involutions `θ, θ′ = ad(h)θad(h)⁻¹` the map `gK_θA_∞ ↦ g h⁻¹K_θ′A_∞` is a `G(F_∞)`-equivariant
diffeomorphism; LocallySymmetric.symmetricSpace.dim_eq —
`dim X^G = dim G(F_∞) − dim K_∞ − dim A_∞; e`.`g`. 2 for `GL_2/ℚ, 3` for `GL_2` over an imaginary
quadratic field, `n(n+1)/2 − 1` for `GL_n/ℚ` with
`n ≥ 1` (and 0 for the trivial group `GL_0`);
LocallySymmetric.symmetricSpace.prod — `X^{G₁×G₂} ≅ X^{G₁} × X^{G₂}` equivariantly when
`A_{G₁×G₂} = A_{G₁} × A_{G₂}`; LocallySymmetric.symmetricSpace.connectedVariant —
`X̃^G = G(F_∞)/K_∞°A_∞` with the
covering `X̃^G → X^G` whose deck group is `π_0(K_∞) = π_0(G(F_∞))`; for `GL_{2,ℚ}, X̃ = ℍ^±` (Scholze's
`X̃_K` uses this variant).

For `GL_{2,ℚ}`, the stabilizer identity `K_∞A_∞ = ℝ_{>0}·O(2)` for Mathlib's action of
`GL(2, ℝ)` on `ℍ` follows from its fixed-point criteria
`UpperHalfPlane.gl_smul_I_eq_I_iff_of_pos` and `UpperHalfPlane.gl_smul_I_eq_I_iff_of_neg`.

*Needs:* ALS.0.1; ALS.0.3; AdelicAlgebraicGroups
§2.1 (the split component `A_G`); Mathlib `UpperHalfPlane.glAction`,
`UpperHalfPlane.gl_smul_I_eq_I_iff_of_pos`, `UpperHalfPlane.gl_smul_I_eq_I_iff_of_neg`.

**Checks.**

- symmetricSpace_GL2_Q: For `G = GL_{2,ℚ}, X^G ≅ ℍ` (upper half-plane) `G(ℝ)`-equivariantly, with `g`
  acting by `z ↦ (az+b)/(cz+d)` if `det g > 0` and `z ↦ (az̄+b)/(cz̄+d)` if `det g < 0; dim X = 2`.
  The matrices `diag(−1,1)` and `2I` lie in the stabilizer, whereas `diag(2,1)` does not,
  distinguishing both determinant signs and the split-centre factor.
- symmetricSpace_GL1: For `G = GL_{1,F}, X^G = (F⊗ℝ)^×/(K_∞ℝ_{>0}) ≅ ℝ^{r₁+r₂−1}`; it is a point
  exactly when `F` is `ℚ` or imaginary quadratic.
- symmetricSpace_SL2_compat: For `G = SL_{2,ℚ}, X^G = SL_2(ℝ)/SO(2)` is identified with Mathlib's
  UpperHalfPlane through `g ↦ g·i`, equivariantly for the Möbius action.
- symmetricSpace_not_without_centre: Without the split-centre factor, `GL_2(ℝ)/O(2) ≅ ℍ × ℝ_{>0}`
  has dimension 3 and every `γ ∈ GL_2(ℤ)` acts trivially on the `ℝ_{>0}` factor `(|det γ| = 1)`, so
  `Γ∖(GL_2(ℝ)/O(2)) ≅ (Γ\ℍ) × ℝ_{>0}` has infinite volume; for the unit group of a definite
  quaternion algebra over `ℚ` (anisotropic modulo its centre) the quotient would be noncompact.

### ALS.0.5 The symmetric space is contractible with proper action

Prove LocallySymmetric.symmetricSpace.contractible. `X^G` is diffeomorphic to Euclidean space of
dimension `d_G`: with `𝔞_G = Lie A_∞ ⊂ 𝔭`, the map `𝔭/𝔞_G → X^G, X ↦ exp(X)·x₀`, is a diffeomorphism. In
particular `X^G` is contractible and orientable. The induced action of `G(F_∞)/A_∞` is proper, with
compact point stabilizers `K_∞A_∞/A_∞` and their conjugates. A subgroup `Γ` acts properly
discontinuously with finite stabilizers if its image in `G(F_∞)/A_∞` is discrete and its kernel
`Γ ∩ A_∞` is finite. Discreteness of `Γ` in `G(F_∞)` and `Γ ∩ A_∞ = 1` alone do not imply this
projected
discreteness. The statement assumes: For the subgroup consequence: the image of `Γ` in `G(F_∞)/A_∞` is
discrete and `Γ ∩ A_∞` is finite. ([NT16, §3.1, after Definition 3.1, p. 40]; [ACC+23, §2.1.1, p.
910]; [BS73, §2.4, pp. 444–447])

KleinianGroups §Layer `1 /` **What to build / Deliverables**, `properlyDiscontinuousSMul_of_discrete`
states the PSL₂(`ℂ`) special case, which is reconciled
with this theorem through an equivariant identification of `H³` with PSL₂(`ℂ`)/PSU(2) and its trivial
split centre.

*Needs:* ALS.0.4; ALS.0.3;
ALS.0.2; ALS.F.1;
RepresentationTheory/LieGroups, Layer 9; Mathlib `ContractibleSpace`;
Mathlib `ProperlyDiscontinuousSMul`.

**Checks.**

- `dim X^G = d_G` and `X^G` is homeomorphic to `ℝ^{d_G}; GL_2/ℚ` gives `ℍ ≅ ℝ²`.
- `SL_2(ℤ)` acts properly discontinuously on `ℍ` with stabilizer of `i` of order 4 (order 2 modulo `±1`);
  this is Mathlib's instance for discrete subgroups of `SL(2, ℝ)`, the order is Tau Ceti's
  `TauCeti.ModularGroup.card_stabilizer_I`, and `ContractibleSpace ℍ` is in Mathlib.
- Non-example: `Γ = {2^n·R_{nα} : n ∈ ℤ} ⊂ GL_2(ℝ)`, with `R_θ` the rotation by `θ` and `α/π` irrational, is
  discrete in `GL_2(ℝ)` and meets `A_∞ = ℝ_{>0}·1` only in 1, but its image modulo `A_∞` is the dense
  subgroup `{R_{nα}}` of `SO(2)`; it fixes `i ∈ ℍ` with infinite stabilizer, so it does not act properly
  discontinuously. Projected discreteness is the condition that matters.

### ALS.0.6 The arithmetic locally symmetric space `X_K`

Define LocallySymmetric.X. For a compact open subgroup `K ⊂ G(A_F^∞)` put
`X_K = X^G_K = G(F)∖(X^G × G(A_F^∞)/K)`, with `G(F)` acting diagonally (through `G(F) → G(F_∞)` on
`X^G`) and the quotient topology.
Write `𝔛_G = G(F)∖(X^G × G(A_F^∞)^δ)`, with `G(A_F^∞)` discrete, a right `G(A_F^∞)`-space with
`X_K = 𝔛_G/K`. Right translation by `g ∈ G(A_F^∞)` induces homeomorphisms
`r_g : X_{gKg⁻¹} → X_K, [x, h] ↦ [x, hg]`, and for `K′ ⊂ K` the projection `π_{K′,K} : X_{K′} → X_K`. Under
`X^G × G(A_F^∞)/K = G(A_F)/K_∞A_∞K, X_K` is AdelicAlgebraicGroups' level quotient
`LevelMaps.LevelQuotient` (§4.4) for the archimedean
subgroup `K_∞A_∞`. The statement assumes: `K ⊂ G(A_F^∞)` compact open. ([ACC+23, §2.1.1, p. 910]; [NT16,
§3.1, p. 41])

The API: LocallySymmetric.X — `X_K = G(F)∖(X^G × G(A^∞)/K)` as a topological space;
LocallySymmetric.X.mk — The class `[x, g] ∈ X_K` of `(x, g) ∈ X^G × G(A^∞)`;
LocallySymmetric.X.mk_eq_mk_iff — `[x, g] = [x′, g′]` iff there are `γ ∈ G(F), k ∈ K` with `x′ = γx` and
`g′ = γ g k`; LocallySymmetric.X.translate — `r_g : X_{gKg⁻¹} → X_K, [x, h] ↦ [x, hg]`, a
homeomorphism with `r_1 = id` and `r_g ∘ r_h = r_{hg}`; LocallySymmetric.X.levelMap —
`π_{K′,K} : X_{K′} → X_K` for `K′ ⊂ K`, with `π_{K,K} = id, π_{K′,K} ∘ π_{K″,K′} = π_{K″,K}`, and
`r_g ∘ π = π ∘ r_g`;
LocallySymmetric.X.equivLevelQuotient — `X_K ≃` AdelicAlgebraicGroups' level quotient
`G(F)∖G(A_F)/K_∞A_∞K` (`LevelMaps.LevelQuotient`), compatibly with right translations.

*Needs:* ALS.0.4; AdelicAlgebraicGroups §4.4 (`LevelMaps.LevelQuotient`);
AdelicAlgebraicGroups §3.4 (`Reduction.levelArithmetic`).

**Checks.**

- `X_GL1_Q`: For `G = GL_{1,ℚ}` and `K = Ẑ^×, X_K` is a single point:
  `ℚ^×∖(pt × A_f^×/Ẑ^×) = ℚ^×∖(ℚ^×_{>0}·Ẑ^×)/Ẑ^×` is one class.
- X_trivialGroup: For `G` trivial, `X_K` is a point for the unique `K`.
- X_GL2_levelOne: For `G = GL_{2,ℚ}` and `K = GL_2(Ẑ), X_K ≅ GL_2(ℤ)∖ℍ = (SL_2(ℤ)∖ℍ)/(z ↦ −z̄)` as
  topological spaces (one component since `det GL_2(Ẑ) = Ẑ^×` and `A_f^× = ℚ^×_{>0}Ẑ^×`), where `ℍ` is
  identified with `GL_2(ℝ)/O(2)ℝ_{>0}` as in symmetricSpace_GL2_Q. Since `K_∞A_∞ = ℝ^×O(2)`,
  X.equivLevelQuotient lands in the folded quotient of AdelicAlgebraicGroups §5.2 ("`GL₂` components
  for `O(2)` and `SO(2)`", at principal level `N = 1`). The model of
  `AdelicExamples.GL2.exists_componentHomeomorph` uses `K_∞ = ℝ^×SO(2)` and gives `SL_2(ℤ)\ℍ` at
  `GL_2(Ẑ)`; `X_K` is its quotient by the residual involution `z ↦ −z̄`.
- X_not_coarse_of_discrete: `X_K` is not `G(F)∖G(A_F^∞)/K` (a finite set): forgetting `X^G` loses all
  positive-dimensional topology; for `GL_{2,ℚ}` and `K = GL_2(Ẑ)` that set is a point while `X_K` is the
  modular curve.

### ALS.0.7 Finite decomposition of `X_K` into arithmetic quotients

Prove LocallySymmetric.X.componentDecomposition. Let `K ⊂ G(A_F^∞)` be compact open and `g_1`, …, `g_s`
representatives of the finite set `G(F)∖G(A_F^∞)/K`. Put `Γ_i = G(F) ∩ g_iKg_i⁻¹`, viewed in `G(F_∞)`.
Then `[x] ↦ [x, g_i]` on the `i`-th summand is a homeomorphism `⊔_{i=1}^s Γ_i∖X^G ≅ X_K`. The stabilizer
of `[x, g_i]` in the `G(F)`-action on `X^G × G(A^∞)/K` is identified with
`Stab_{Γ_i}(x) = Γ_i ∩ Stab_{G(F_∞)}(x)`; changing `g_i` to `γ g_i k` replaces `Γ_i` by `γΓ_iγ⁻¹`.
The connected components of `X_K`
are the images `Γ_i∖X^G`. The statement assumes: `K` compact open in `G(A_F^∞)`. ([NT16, §3.1, Lemma
3.2(1), p. 42]; [ACC+23, §2.1.1, p. 910])

*Needs:* ALS.0.6; ALS.0.5;
AdelicAlgebraicGroups §3.4 (component decomposition of a level quotient); AdelicAlgebraicGroups §3.4
(`Reduction.finite_classes`).

**Checks.**

- `GL_{2,ℚ}, K = K(N)` principal level `N ≥ 3`: the components are indexed by
  `GL_2(ℚ)∖GL_2(A_f)/K(N) ≅ Ẑ^×/(±1·det K(N)) = (ℤ/N)^×/±1`, so there are `φ(N)/2` of them, each
  `Γ(N)∖ℍ` (AdelicAlgebraicGroups
  §5.2, the `O(2)` component count).
- Anisotropic `G`: every `Γ_i∖X^G` is compact, since `Γ_i∖(G(F_∞)/A_∞)` is compact when `G^der` is
  `F`-anisotropic (AdelicAlgebraicGroups §3.4, "Arithmetic quotients of anisotropic groups are
  compact"); `Reduction.exists_compact_normOne_iff` concerns `G(F)∖G(𝔸_F)^1` instead.
- `G = GL_{1,ℚ}` and `K = Ẑ^×: G(ℚ)∖G(𝔸^∞)/K` is one point, `Γ_1 = {±1}`, and `X_K = Γ_1∖X^G` is a point.

### ALS.0.8 Proper discontinuity and finite stabilizers at arbitrary level

Prove LocallySymmetric.X.properlyDiscontinuous. For every compact open `K` and
`g ∈ G(A^∞), Γ_{g,K} = G(F) ∩ gKg⁻¹` is a discrete subgroup of `G(F_∞)` acting properly
discontinuously on `X^G`. The two
underlying facts are AdelicAlgebraicGroups §4.4, applied to `K∞ = K_∞A_∞`, which is closed, contains
`A_G(ℝ)^0` and is compact modulo it: `G(F)` acts properly discontinuously on `G(𝔸)/K_∞A_∞K`
("Proper arithmetic action on the level space"), and `G(F) ∩ hK_∞A_∞Kh⁻¹` is finite
(the label *rational-stabilizer-finite*). This target transports them
along `G(𝔸)/K_∞A_∞K = X^G × G(A^∞)/K`: the `G(F)`-action on `X^G × G(A^∞)/K` is properly
discontinuous; the stabilizer of `(x, hK)` is `Γ_{h,K} ∩ Stab_{G(F_∞)}(x)`, a finite group; and the
finite central subgroup `Z_K = Z(F) ∩ K_∞A_∞K` lies in every stabilizer and acts trivially. Hence `X_K`
is the coarse quotient of the action groupoid `𝒳_K` (AdelicAlgebraicGroups §4.4 (quotient groupoids
at non-neat level) for `K_∞A_∞`), whose automorphism groups are these finite stabilizers; at points
with trivial stabilizer `X_K` is locally homeomorphic to `X^G`. The statement assumes: `K` compact open.
([NT16, §3.1, p. 41]; [CG18, §9, before §9.0.1, pp. 84–85]; [BS73, §§9.1–9.3, Theorem 9.3, pp.
474–476])

*Needs:* ALS.0.7; ALS.0.5;
AdelicAlgebraicGroups §4.4 (*rational-stabilizer-finite*;
"Proper arithmetic action on the level space"; quotient groupoids at non-neat level);
AdelicAlgebraicGroups §1.3 (rational points discrete in the adelic points);
Mathlib `ProperlyDiscontinuousSMul`; Mathlib `CategoryTheory.ActionCategory`.

**Checks.**

- For `G = SL_{2,ℚ}` and `K = SL_2(Ẑ), Γ = SL_2(ℤ)` and the stabilizer of `i` has order 4 (Tau Ceti
  `TauCeti.ModularGroup.card_stabilizer_I`), with central kernel `{±1}`. For `G = GL_{2,ℚ}` at
  `GL_2(Ẑ)`, the full stabilizer has order 8, including
  orientation-reversing elements.
- At neat level all stabilizers are trivial (ALS.0.9).
- For `G = GL_{1,ℚ}` and `K = Ẑ^×, X_K` is a point whose stabilizer is `Z_K = {±1}`, acting trivially.

### ALS.0.9 At neat level `X_K` is a manifold and each component is a `K(Γ, 1)`

Prove LocallySymmetric.X.manifold_of_neat. Let `K` be neat (AdelicAlgebraicGroups §4.3
(`Neat.IsNeatLevel`)). Then every `Γ_{g,K}` is torsion-free, meets `A_∞` trivially and acts freely and
properly discontinuously on `X^G; G(F) × K^δ` acts freely and properly discontinuously on
`X^G × G(A^∞)^δ`: every point has a neighbourhood `U` with `γU·k ∩ U = ∅` for
`(γ,k) ≠ (1,1); X^G × G(A^∞)/K → X_K` is a covering map; `X_K` is a smooth manifold of dimension
`d_G`, each component `Γ_i∖X^G` is an
Eilenberg–MacLane space `K(Γ_i, 1)`; and for `K′ ⊂ K` normal, `π_{K′,K} : X_{K′} → X_K` is a finite
covering with free `K/K′`-action (a Galois covering on each component when `X_{K′}` is connected over
it). The statement assumes: `K` neat. ([NT16, §3.1, p. 41]; [ACC+23, §2.1.1, p. 910]) The `K(Γ_i, 1)`
clause is Tau Ceti's `IsQuotientCoveringMap.isEilenbergMacLaneSpaceOne_realTopologicalVectorSpace`,
applied to the free properly discontinuous action of `Γ_i` transported to the real vector space
`𝔭/𝔞_G` along the diffeomorphism of ALS.0.5.

*Needs:* ALS.0.8; AdelicAlgebraicGroups §4.3 (`Neat.IsNeatLevel`);
AdelicAlgebraicGroups §4.3 (neat groups are torsion free); AdelicAlgebraicGroups §4.4 (covering maps
between neat levels); AdelicAlgebraicGroups §4.4 (free action at neat level); Mathlib
`IsCoveringMap`; Tau Ceti
`IsQuotientCoveringMap.isEilenbergMacLaneSpaceOne_realTopologicalVectorSpace`.

**Checks.**

- For `N ≥ 3`, the principal level `K(N) ⊂ GL_2(Ẑ)` is neat and `X_{K(N)}` is a disjoint union of `φ(N)/2`
  copies of `Γ(N)∖ℍ`, each a punctured surface with free fundamental group.
- `K_0(N) ⊂ GL_2(Ẑ)` is never neat: `−I ∈ GL_2(ℚ) ∩ K_0(N)` has eigenvalue `−1`; it lies in `Z_K` and acts
  trivially, which is why stabilizers are computed with `Z_K`.
- On `T = G_m²/ℚ`, take `K_3 = ℤ_3^× × (1 + 3ℤ_3)`,
  `K_5 = (1 + 5ℤ_5) × ℤ_5^×` and `K_ℓ = (ℤ_ℓ^×)²` otherwise. Every rational coordinate in `K` is
  `±1`; the condition at `5` kills the first minus sign and that at `3` kills the second. Since
  `T` is abelian, every conjugated rational intersection is trivial, so `K` is neat here. But the
  adelic element with `k_3 = (−1,1)`, `k_5 = (1,−1)` and `k_ℓ = (−1,1)` otherwise belongs to `K`
  and has local eigenvalue torsion group `{±1}` at every prime in the faithful diagonal
  representation. Thus it fails the adelic neatness condition of NT16 and ACC+.

### ALS.0.10 Standard level subgroups: Iwahori, `Γ0`, `Γ1`, `Γp` and Taylor–Wiles levels

Define LocallySymmetric.iwahori. Let `v` be a finite place of `F` with ring of integers `O_v`,
uniformizer `ϖ_v`, residue field `k_v`. `(i) Iw_v ⊂ GL_n(O_v)` is the subgroup of matrices upper
triangular mod `ϖ_v` and `Iw_{v,1} ⊂ Iw_v` the pro-`v` Iwahori, unipotent upper triangular mod
`ϖ_v; Iw_v/Iw_{v,1} ≅ (k_v^×)^n`. (ii) For `n = 2` and `c ≥ 1`, inside `PGL_2(O_v): Γ_0(v^c) =`
{`g ≡ (1 ∗; 0 ∗)`
mod `ϖ_v^c`}, `Γ_1(v^c) =` {`g ≡ (1 ∗; 0 1)` mod `ϖ_v^c`}, `Γ_p(v^c) =` {`g ≡ (1 ∗; 0 d)` mod
`ϖ_v^c` with `d` of
`p`-power order}. (iii) For `PGL_n` with `n ≥ 2, K_0(v) =` image of {`g ∈ GL_n(O_v) : g` stabilizes the
line `ℓ = k_ve_1 ⊂ k_v^n` mod `ϖ_v`}, i.e. `g ≡ (1 ∗; 0 GL_{n−1})` mod `ϖ_v` after normalizing
the top-left
entry ([CG18, §9.0.1]), and its normal
subgroup `K_1(v) = {g ≡ (1 ∗; 0 SL_{n−1})}` with `K_0(v)/K_1(v) ≅ k_v^×`. (iv) For a finite set `Q` of
places and a level `K` with `K_v` maximal at `v ∈ Q, K_0(Q)` and `K_1(Q)` replace `K_v` by
`K_0(v), K_1(v)` for
`v ∈ Q; K_1(Q) ⊂ K_0(Q)` is normal with quotient
`Δ_Q = ∏_{v∈Q} k_v^×; Y_0(Q) = X_{K_0(Q)}, Y_1(Q) = X_{K_1(Q)}`. For `Δ` a quotient of `Δ_Q, K_Δ(Q)`
is the preimage of `ker(Δ_Q → Δ)` and `Y_Δ(Q) = X_{K_Δ(Q)}`.
The statement assumes: `v` a finite place of `F; Q` a finite set of finite places at which `K` is maximal;
`n ≥ 2` for the `PGL_n` Taylor–Wiles quotient formula; `PGL_1` is treated separately. ([CG18, §5.2.1, pp.
56–57]; [CG18, §9.0.1, pp. 84–85]; [CGH20, §3.1, pp. 4–6])

The API: LocallySymmetric.iwahori — `Iw_v` as a compact open subgroup of `GL_n(O_v)`, with
`Iw_v ⊃ Iw_{v,1} = iwahoriOne`; LocallySymmetric.gamma0 — `Γ_0(v^c)` as a compact open subgroup of
`PGL_2(O_v)`, equivalently upper-triangular reduction modulo `ϖ_v^c`; the normalized projective
representative has top-left entry 1; LocallySymmetric.taylorWilesLevel — `K_0(Q) ⊃ K_1(Q)` for a
finite set `Q` of places where `K` is maximal, and the subgroup `K_Δ(Q)` for a quotient `Δ` of `Δ_Q`;
LocallySymmetric.taylorWilesLevel.quotientEquiv — `K_1(Q)` is normal in `K_0(Q)` and
`K_0(Q)/K_1(Q) ≅ Δ_Q = ∏_{v∈Q} k_v^×`; LocallySymmetric.iwahori.index — `[GL_n(O_v) : Iw_v] = #(GL_n/B)(k_v)` and
`[Iw_v : Iw_{v,1}] = (q_v − 1)^n`; LocallySymmetric.iwahori.eq_parahoric — `Iw_v` and `K_0(v)` are the
`O_v`-points of parahoric group schemes of ReductiveGroupsPartII RG2.3: for `Iw_v` (standard alcove)
this is ReductiveGroupsPartII's `LevelSubgroups.iwahori_isParahoric` read inside `GL_n(O_v)`; the
`GL_n(O_v)`-preimage of `K_0(v)` is the stabilizer of the lattice chain
`O_v^n ⊃ O_ve_1 + ϖ_vO_v^n ⊃ ϖ_vO_v^n`, whose group scheme is that of RG2.3.5
(`lattice-chain-stabilizer-schemes`), and its image
`K_0(v)` in `PGL_n(O_v)` is the group of `O_v`-points of the corresponding `PGL_n` parahoric group scheme.
For `n ≥ 3` this line stabilizer is `GL_n(F_v)`-conjugate to, but not equal to, the hyperplane
stabilizer {last row of `ḡ` in `(0, …, 0, ∗)`} of the chain `O_v^n ⊃ O_v^{n−1} ⊕ ϖ_vO_v` that
ReductiveGroupsPartII calls the (1, n−1)-parahoric; LocallySymmetric.iwahoriOne — `Iw_{v,1}` is the
inverse image of the upper
unipotent subgroup under reduction `GL_n(O_v) → GL_n(k_v)`; it is normal in `Iw_v`, and the diagonal
reduction identifies `Iw_v/Iw_{v,1}` with `(k_v^×)^n`; LocallySymmetric.gamma1 — `Γ_1(v^c) ⊂ PGL_2(O_v)`
is the image of matrices whose lower-left entry is `≡ 0` mod `ϖ_v^c` and whose diagonal entries agree
modulo `ϖ_v^c`; equivalently, after normalizing the top-left entry to 1, the lower-right entry is
`≡ 1` mod `ϖ_v^c`;
LocallySymmetric.gammaP — `Γ_p(v^c) ⊂ Γ_0(v^c)` is the inverse image of the `p`-primary subgroup of
`(O_v/ϖ_v^c)^×` under the ratio of diagonal entries; `Γ_1` is the kernel of that ratio. For `c=1, Γ_p/Γ_1`
is the `p`-primary subgroup of `k_v^×`.

The Iwahori and pro-`v` Iwahori subgroups are ReductiveGroupsPartII's `LevelSubgroups.iwahori` and
`LevelSubgroups.proPIwahori`, stated there inside `GL_n(F_v)` (the examples of Layer RG2.3,
`classical-level-subgroups`) with the index check `iwahori_relIndex_two`. Here they are the same
groups inside `GL_n(O_v)`, as the cases `I = 𝔪_v` of the congruence subgroups modulo an arbitrary
ideal `I` that the `Γ_0(v^c)`, `Γ_1(v^c)` and `Γ_p(v^c)` levels need. Over any commutative ring,
the upper triangular and upper unitriangular congruence subgroups are preimages under reduction
modulo `I` of Tau Ceti's `TauCeti.upperTriangularGroup` and `TauCeti.upperUnitriangularGroup`.
Over an arbitrary local ring these preimages modulo the maximal ideal are the groups denoted
`iwahori` and `iwahoriOne`; they are the Iwahori and pro-`p` Iwahori subgroups when the ring is
the valuation ring of a nonarchimedean local field. The pullback of the upper triangular
congruence subgroup to `SL_2(ℤ)` agrees with Mathlib's classical `Γ₀(N)` for every natural number `N`.

*Needs:* ALS.0.6; ReductiveGroupsPartII RG2.3.3 (parahoric and Iwahori
subgroups), RG2.3.5 (lattice-chain stabilizers) and the examples of Layer RG2.3
(`classical-level-subgroups`); Mathlib `Matrix.GeneralLinearGroup`, `Matrix.GeneralLinearGroup.map`;
Tau Ceti `TauCeti.upperTriangularGroup`, `TauCeti.upperUnitriangularGroup`.

**Checks.**

- iwahori_index_GL2: `[GL_2(Z_p) : Iw_p] = p + 1` (`Iw_p` is the stabilizer of a line in `F_p²`).
- gamma0_eq_congruenceSubgroup: For `F = ℚ` and `v = p`, intersecting the `GL_2`-preimage of the
  projective `Γ_0(p^c)` with `SL_2(ℤ)` gives Mathlib CongruenceSubgroup.Gamma0 `(p^c)`. For projective `Γ_1`
  the diagonal entries are a common unit a with `a² ≡ 1` mod `p^c`. For odd `p` this gives ±Gamma1;
  for `p = 2` and `c ≥ 3` extra solutions occur (`e`.`g`. a `= 3` mod 8, realized by
  `(3, 1; 8, 3) ∈ SL_2(ℤ)`), so
  the unqualified ±Gamma1 assertion fails: this determinant-one matrix belongs to the projective
  preimage and satisfies neither diagonal congruence `a ≡ ±1`.
- taylorWiles_quotient_trivial_n1: For `Q = ∅, Δ_Q` is trivial and `K_0(Q) = K_1(Q) = K`. For `PGL_1`
  the ambient group is trivial and so is its level quotient; the formula `Δ_Q = ∏ k_v^×` applies only
  to `n ≥ 2`.
- gammaP_ne_gamma1: For `c = 1, [Γ_p(v) : Γ_1(v)]` is the `p`-primary part of `q_v − 1`; the inclusion
  is strict iff `p` divides `q_v − 1`. For example `p = 3, q_v = 7` gives index `3; p = 3, q_v = 5` gives
  equality. It is not the prime-to-`p` part. Over `ZMod 7`, the matrices `diag(1,2)` and
  `diag(1,−1)` witness strictness for `p = 3` and `p = 2`, respectively; for `p = 3` over
  `ZMod 5` the two subgroups agree.
- Membership is expressed through entries below the diagonal and diagonal congruences.
  Over `ZMod 5` at `I = ⊥`, `(1,1;0,1)` belongs to both groups, `diag(2,1)` is upper triangular
  but not unipotent, and `(1,0;1,1)` is not upper triangular.
- levels_top: modulo `I = ⊤`, the upper triangular, upper unipotent and projective Γ₁
  preimages are the entire general linear group.
- iwahoriOne_two_eq_three_lt: `Iw₁ = Iw` over `ℤ_2`, while `Iw₁ < Iw` over `ℤ_3`, testing
  the diagonal quotient at residue-field sizes 2 and 3.

### ALS.0.11 Two pro-v Iwahori factors of distinct residue characteristic force neatness

Prove LocallySymmetric.isNeat_of_two_proUnipotent. Let `G` be a connected linear algebraic group
over `F` with a faithful representation `ρ : G → GL_N` over `F` (the representation in which
neatness is measured, AdelicAlgebraicGroups §4.3), and `K = ∏_v K_v ⊂ G(A_F^∞)` compact open. Suppose
there are finite places `v, v′` of `F` with distinct residue characteristics `q ≠ q′` such that `ρ(K_v)` and
`ρ(K_{v′})` are pro-`q` and pro-`q′` groups. Then `K` is neat: the reduction of a pro-`q` subgroup of
`GL_N(O_{F_v})` is a `q`-group, so every eigenvalue of every `ρ(k), k ∈ K_v`, is `≡ 1` modulo the maximal
ideal, and a root of unity generated by such eigenvalues has `q`-power order; at `v′` it has `q′`-power
order, so it is 1. For `G = GL_n` and `ρ` the standard representation this applies to `K_v = Iw_{v,1}` and
`K_{v′} = Iw_{v′,1}` (pro-`v` Iwahori subgroups, ALS.0.10); for `G = PGL_2`
and `ρ` the adjoint representation it applies to principal congruence factors `K(v)` and `K(v′)`. The
statement assumes: `ρ` faithful; `v, v′` finite places with distinct residue characteristics and
`ρ(K_v), ρ(K_{v′})` pro-`q` and pro-`q′`. ([ACC+23, §6.5.1, Lemma 6.5.2, p. 1062]; [ACC+23, §6.5.1,
proof of
Lemma 6.5.2, p. 1062])

*Needs:* ALS.0.10; AdelicAlgebraicGroups §4.3 (`Neat.IsNeatLevel`);
AdelicAlgebraicGroups §4.3 (`Neat.IsNeatAut`).

**Checks.**

- `K` with `K_2 = Iw_{2,1}, K_3 = Iw_{3,1}` and `K_v = GL_n(O_v)` elsewhere is neat.
- One pro-`v` factor does not suffice: for `F = ℚ, n = 2` and `K = Iw_{3,1}·∏_{p≠3}GL_2(Z_p), K ∩ GL_2(ℚ)`
  contains elements of order 3 such as (1, 1; −3, −2) (trace `−1`, determinant `1, ≡` unipotent upper
  triangular mod 3), so `K` is not neat.
- `PGL_2` over `ℚ` with `K = K(5)K(13)∏_{p≠5,13}PGL_2(Z_p)`: the adjoint images of `K(5)` and `K(13)` lie in
  the principal congruence subgroups of `GL_3(Z_5)` and `GL_3(Z_13)`, which are pro-5 and pro-13, so `K`
  is neat; this is the neatness used in ALS.0.13.

### ALS.0.12 The orientation local system of `X_K` and its character

Define LocallySymmetric.orientationCharacter. For compact open `K`, the orientation local system `o_K`
on `X_K` is the descent of the `G(F_∞)`-equivariant orientation sheaf of `X^G`: the orientation character
`ε : G(F_∞) → {±1}` sends `g` to the sign of det(`dg_{x₀}` composed with the parallel transport back),
equivalently `ε(g) = sign det(Ad(g) | 𝔭/𝔞_G)` computed after moving `g` into `K_∞A_∞` by the Cartan
decomposition (`ε` is trivial on the identity component and `ε(k) = sign det(Ad(k)|𝔭)` for `k ∈ K_∞`).
Then `o_K = (X^G × G(A^∞)/K × ℤ(ε))/G(F)` with `G(F)` acting on `ℤ(ε)` through `ε`, a rank-one local system
of `ℤ`-modules on the orbifold `X_K`; at neat level it is the orientation local system of the manifold
`X_K` of AlgebraicTopology, Stage 6. For `G = Res_{F/ℚ}GL_m, ε(γ) = sign(N_{F/ℚ} det γ)^{m−1}`
for `γ ∈ GL_m(F)`. The statement assumes: `K` compact open (orbifold local system); neat `K` for the
manifold statement. ([NT16, §3.1, after Definition 3.1, p. 40]; [NT16, §3.1, p. 41])

The API: LocallySymmetric.orientationCharacter — `ε : G(F_∞) → {±1}`, the action of `G(F_∞)` on the
orientations of `X^G`; LocallySymmetric.orientationSystem — `o_K`, the rank-one local system on `X_K`
descended from `ℤ(ε)`; LocallySymmetric.orientationSystem.monodromy — On `Γ_i∖X^G`, the coefficient
action is `ε|Γ_i`. Fix the endpoint convention of `localSystem`.monodromy: a lifted loop ends at `δ(ℓ)x₀`,
and its Tau Ceti monodromy is `ε(δ(ℓ)⁻¹)=ε(δ(ℓ))`; LocallySymmetric.orientationSystem.pullback —
`π_{K′,K}^* o_K ≅ o_{K′}` and `r_g^* o_K ≅ o_{gKg⁻¹}`; LocallySymmetric.orientationSystem.eq_manifold
— At neat level `o_K` is isomorphic to the orientation local system of the manifold `X_K` from
AlgebraicTopology, Stage 6; LocallySymmetric.orientationCharacter_GL — For
`G = Res_{F/ℚ}GL_m, ε(γ) = sign(N_{F/ℚ}(det γ))^{m−1}`.

*Needs:* ALS.0.9; ALS.0.5;
AlgebraicTopology, Stage 6; Tau Ceti `TauCeti.LocalCoefficientSystem`; Tau Ceti
`TauCeti.LocalCoefficientSystem.monodromyRepresentation`.

**Checks.**

- orientationCharacter_GL2_Q: For `G = GL_{2,ℚ}, ε(g) = sign det g: diag(−1, 1)` acts on `ℍ` by
  `z ↦ −z̄`, reversing orientation.
- orientationCharacter_connected: If `G(F_∞)` is connected (`e`.`g`. `GL_n` or `PGL_n` over an imaginary CM
  field), `ε` is trivial and `o_K ≅ ℤ` for every `K`.
- orientationSystem_GL_formula: For `γ ∈ GL_m(O_F), ε(γ) = sign(N_{F/ℚ} det γ)^{m−1}`; for `m` odd `ε`
  is trivial for every number field and every odd rank. Distinguish neatness over `F` from neatness of the restriction of scalars over `ℚ`: take
  `F=ℚ(√5), u=682+305`√5 with `N(u)=−1`, and `γ=diag(u,1)`. At `v=(11,√5−7)` and `w=(31,√5−6), u` reduces to
  1. Principal congruence at `v` and `w`, maximal integral level elsewhere, is `F`-neat by the
  two-distinct-residue-characteristics criterion, contains `γ`, and has `ε(γ)=−1`. The same `γ` is not
  neat in `Res_{F/ℚ}GL_2`: its eigenvalues over `ℚ` include `u` and its conjugate `u′`, whose product is `−1`.
- orientation_not_trivial_at_neat_PGL2: Neat level does not force orientability: for `G = PGL_{2,ℚ}`
  and `K = K(5)K(13)∏_{p≠5,13}PGL_2(Z_p)`, the class of (57, 455; 455, 3632) (det −1) lies in `Γ_{1,K}`
  and `ε` of it is `−1` (see ALS.0.13).

### ALS.0.13 A nonorientable neat arithmetic quotient for `PGL_2` over `ℚ`

Prove LocallySymmetric.nonorientable_neat_PGL2. Let `G = PGL_{2,ℚ}`, so `X^G ≅ ℍ` with `PGL_2(ℝ)` acting
holomorphically for `det > 0` and antiholomorphically for `det < 0`. Let
`K = K(5)·K(13)·∏_{p≠5,13} PGL_2(Z_p)` with `K(p) = ker(PGL_2(Z_p) → PGL_2(F_p))`. Then `K` is neat,
and `γ = [(57, 455; 455, 3632)] ∈ PGL_2(ℚ)` (`det = −1`, the matrix `≡ 57·I` mod 65 with `57² ≡ −1`
mod 65) lies in `Γ_{1,K} = PGL_2(ℚ) ∩ K`
and reverses orientation. Hence the component `Γ_{1,K}∖ℍ` of `X_K` is a nonorientable surface and `o_K` is
nontrivial. In contrast, at the non-neat level `GL_2(Ẑ)` for `GL_{2,ℚ}`, the orbifold `X_K` has nontrivial
orientation character det on `GL_2(ℤ)`, while every neat level of `GL_{2,ℚ}` gives an orientable `X_K`.
For `GL_m` over `F` the same norm argument applies when each arithmetic subgroup is neat for
`Res_{F/ℚ}GL_m` as an algebraic group over `ℚ`: then `N_{F/ℚ} det γ = 1`. Neatness defined using faithful
`F`-representations of `GL_m` alone does not imply this stronger hypothesis; the real-quadratic
example in orientationSystem_GL_formula is `F`-neat and orientation-reversing. The example
qualifies the remark after NT16's definition of neatness ([NT16, §3.1, p. 41]) that neat arithmetic
groups preserve orientation.

*Needs:* ALS.0.12; ALS.0.9;
AdelicAlgebraicGroups §4.3 (`Neat.IsNeatAut`); ALS.0.11.

**Checks.**

- The adjoint eigenvalues of `γ` are `−λ², 1, −λ⁻²` with `λ > 1` the positive eigenvalue of the matrix;
  they generate the torsion-free group `⟨−λ²⟩`, so `γ` is neat although `det γ < 0`.
- The index-two subgroup `Γ_{1,K} ∩ ker ε` gives the orientation double cover of the component, which
  is orientable.
- Membership: `455 = 7·65` and `3632 − 57 = 55·65`, so the matrix is `≡ 57·I` modulo 65, its images in
  `PGL_2(F_5)` and `PGL_2(F_13)` are trivial, and its determinant `−1 = 57·3632 − 455²` is `≡ 57²` modulo
  65, as a scalar's must be.

### Examples

- `GL_{2,ℚ}`: `K_∞A_∞ = ℝ_{>0}·O(2)` is the stabilizer of `i` for Mathlib's
  `UpperHalfPlane.glAction`, `X^G ≅ ℍ` with negative determinant acting antiholomorphically,
  `X_{GL_2(Ẑ)} ≅ GL_2(ℤ)\ℍ`, and at principal level `K(N)`, `N ≥ 3`, `X_{K(N)}` is a disjoint union
  of `φ(N)/2` copies of `Γ(N)\ℍ`.
- `GL_{1,F}`: `X^G ≅ ℝ^{r₁+r₂−1}`, and `X_K` is a finite union of compact tori of that dimension
  (AdelicAlgebraicGroups §5.1).
- Neatness and orientation: `diag(−1, 1)` reverses the orientation of `ℍ`; the `PGL_2/ℚ` level
  `K(5)K(13)` is neat yet has a nonorientable component, through the element
  `[(57, 455; 455, 3632)]` of determinant `−1`.
- Neatness criterion: `(1, 1; −3, −2)` has order `3` and lies in the pro-`3` Iwahori subgroup of
  `GL_2(ℤ_3)`, so one pro-`v` factor does not force neatness.

### Dependencies

Layer ALS.F (ALS.F.1); AdelicAlgebraicGroups §§1.3–1.4, 2.1, 3.1–3.4, 3.6, 4.3–4.5, 5.2;
RepresentationTheory/LieGroups, Layer 9; ReductiveGroupsPartII RG2.3.3, RG2.3.5 and the examples of
Layer RG2.3; AlgebraicTopology, Stage 6; Mathlib (`ProperlyDiscontinuousSMul`,
`ContractibleSpace`, `UpperHalfPlane`, `CongruenceSubgroup.Gamma0`, `Matrix.GeneralLinearGroup`);
Tau Ceti (`TauCeti.LocalCoefficientSystem`, `TauCeti.upperTriangularGroup`,
`TauCeti.upperUnitriangularGroup`, `IsQuotientCoveringMap.isEilenbergMacLaneSpaceOne_realTopologicalVectorSpace`).

## Layer ALS.1: Arithmetic coefficients and Betti complexes

This layer attaches coefficients. A module `V` with commuting `G(F)` and `K_S` actions gives an
equivariant sheaf on `X̄^G × G(𝔸^∞)^δ`; its derived equivariant sections, computed at a neat normal
refinement and descended by derived finite-group invariants, are the Betti complexes at every level.
They are compared with singular cochains with local coefficients and with group cohomology, given
finite projective models, and shown to commute with derived coefficient change; pullback and
translation complete the layer.

### ALS.1.1 Arithmetic local systems from coefficient modules

Define LocallySymmetric.localSystem. Let `R` be a commutative ring, `S` a finite set of finite places,
`K = K_S K^S` a compact open subgroup and `V` an `R`-module with commuting actions of `G(F)` and of `K_S` (an
`R[G(F) × K_S]`-module); no finiteness is needed to form the local system, while the tensor and Hom
statements below and the comparison with Tau Ceti's local coefficient systems take `V` finite
projective over `R`. Pull `V` back from a point to a `G(F) × G^S × K_S`-equivariant sheaf on
`X^G × G(A^∞)^δ` (`G(F)` acting through its action on `V, G^S` trivially,
`K_S` through its action on `V`), descend along the free `G(F)`-action to a `G^S × K_S`-equivariant sheaf `V`
on `𝔛_G`, and, for `K` neat, along the free `K`-action to a sheaf `V_K` on `X_K`. Concretely `V_K`
is the sheaf
of locally constant sections of `G(F)∖(X^G × G(A^∞) × V)/K → X_K` with commuting left `G(F)`-action and
right `K`-action `(x,g,v) ↦ (γx,γgk,γ·k_S⁻¹·v)`; this is not written as a left action of `G(F) × K` with
its ordinary product law. On the component `Γ_i∖X^G` it is the local system with `Γ_i`-equivariant
coefficient representation `Γ_i → Aut_R(V), γ ↦ ρ_{G(F)}(γ)ρ_{K_S}((g_i⁻¹γg_i)_S)`. `Fix x₀` and lift a
loop `ℓ` at its image in `Γ_i∖X^G` from `x₀` to `δ(ℓ)x₀`. Tau Ceti multiplies loops by `g*h=h`
followed by `g`,
so `δ` is an antihomomorphism to `Γ_i` (a homomorphism to `Γ_iᵐᵒᵖ`). In the diagonal associated bundle
`(γx,ρ_Γ(γ)v)`∼(x,v), parallel transport sends `v` to `ρ_Γ(δ(ℓ)⁻¹)v`. This inverts the entire slice
representation, not only the `K_S` factor, and is a homomorphism for Tau Ceti’s multiplication. Two
cases are used: `V` an `R[K_S]`-module with trivial `G(F)`-action (`p`-adic weights, NT16's `M_G`), and `V` an
`R[G(F)]`-module with trivial `K_S`-action (rational representations); for an algebraic representation
the two agree after inverting `p`. The statement assumes: `R` commutative; `V` an `R[G(F) × K_S]`-module,
finite projective over `R` for localSystem.tensor and localSystem_eq_LocalCoefficientSystem; `K`
neat for the sheaf on `X_K`; arbitrary `K` for the equivariant sheaf on `𝔛_G`. ([ACC+23, §2.1.2, p. 910];
[ACC+23, §2.1.2, pp. 910–911]; [NT16, §2.3, Lemma 2.17(2), p. 23])

The API: LocallySymmetric.localSystem — `V ↦ V_K`, the sheaf on `X_K` (neat `K`), and `V ↦ V_𝔛`,
the `G^S × K_S`-equivariant sheaf on `𝔛_G` (any `K`); LocallySymmetric.localSystem.stalk — The
stalk of `V_K` at `[x, g]` is identified with `V`; changing the representative by `(γ, k)` acts by
`γ·k_S⁻¹`;
LocallySymmetric.localSystem.monodromy — `Fix x₀` and lift a loop `ℓ` at its image in `Γ_i∖X^G` from `x₀`
to `δ(ℓ)x₀`. Tau Ceti multiplies loops by `g*h=h` followed by `g`, so `δ` is an antihomomorphism to `Γ_i` (a
homomorphism to `Γ_iᵐᵒᵖ`). In the diagonal associated bundle `(γx,ρ_Γ(γ)v)`∼(x,v), parallel transport
sends `v` to `ρ_Γ(δ(ℓ)⁻¹)v`. This inverts the entire slice representation, not only the `K_S` factor, and
is a homomorphism for Tau Ceti’s multiplication; LocallySymmetric.localSystem.map — An
`R[G(F) × K_S]`-linear map `V → W` induces `V_K → W_K`, functorially (identity and composition),
exact in `V`;
LocallySymmetric.localSystem.tensor — `(V ⊗_R W)_K ≅ V_K ⊗_R W_K` and `Hom_R(V, W)_K ≅ ℋom(V_K, W_K)`;
in particular `(V^∨)_K ≅ ℋom(V_K, R)`; LocallySymmetric.localSystem.pullback —
`π_{K′,K}^* V_K ≅ V_{K′}` for `K′ ⊂ K`. For `L = gKg⁻¹`, let `V^(g)` have the same underlying
`R`-module and rational
action as `V`, with `L_S`-action `ρ^(g)(k′) = ρ_{K_S}(g_S⁻¹k′g_S)`. Then
`r_g^* V_K ≅ (V^(g))_L` canonically. To compare with a prescribed coefficient `W` at `L` requires an
`R`-linear isomorphism `A_g : V^(g) ≃ W` commuting with `G(F)` and satisfying
`A_g ρ_{K_S}(k) = ρ_{W,L_S}(g_S k g_S⁻¹) A_g` for `k ∈ K_S`. A compatible action of the group
generated by `K_S, L_S` and `g_S` supplies `A_g = ρ(g_S)`; a monoid action supplies only a morphism
unless this operator is invertible. The same comparison holds for equivariant sheaves at arbitrary
level;
LocallySymmetric.localSystem.constant — For `V = R` with trivial actions, `V_K` is the constant sheaf
`R` (Tau Ceti's `constantFunctor` on each component).

*Needs:* ALS.0.9; ALS.0.6;
ALS.F.4 (discrete equivariant sheaf cohomology `H^n(X,Γ;F)`); Tau Ceti
`TauCeti.LocalCoefficientSystem`; Tau Ceti `TauCeti.LocalCoefficientSystem.monodromyRepresentation`;
Tau Ceti `TauCeti.CoveringSpace.monodromyEquivalence`; AlgebraicTopology, Stage 2 (item 6); Mathlib
`MulEquiv.inv'`.

**Checks.**

- localSystem_trivial: For `V = R` with trivial `G(F)`- and `K_S`-actions, `V_K ≅` the constant sheaf
  `R_{X_K}`. The slice representation is trivial when both actions are trivial, and equals
  `ρ_G` when only the `K_S`-action is trivial. The monodromy is trivial for `δ = 1` and every `ρ_Γ`.
- On the coefficient line `ℚ`, take trivial rational action, `Γ = K_S = ℤ, φ = id` and
  `χ(n) = 2^n`. The slice representation sends the generator to multiplication by 2;
  endpoint monodromy, with `δ` the identity of `Γᵐᵒᵖ`, sends its opposite to multiplication by `1/2`.
- localSystem_monodromy_GL1: For `G = GL_{1,F}` with `F` real quadratic, `K` neat (so that
  `−1 ∉ O_F^× ∩ K`) and `V = R(χ), χ` the sign of the first real embedding on `F^×`, the monodromy
  on the circle
  `O_F^{×}∩K∖ℝ` is `χ` of a generator; it is `−1` exactly when the generator is negative at that
  embedding. Neatness is needed: at `K = Ô_F^×, −1 ∈ O_F^×` acts trivially on `ℝ` but by `χ(−1) = −1` on
  `R(χ)`, so `R(χ)` does not descend to a local system.
- localSystem_eq_LocalCoefficientSystem: At neat level the construction gives
  TauCeti.LocalCoefficientSystem via the above whole-inverse endpoint convention. For `K`-factor
  matrices `A=(1,1;0,1), B=(1,0;1,1)` in the natural `GL₂(ℚ)` representation and trivial rational
  action, the slice representation sends `AB` and `BA` on `(1,0)` to `(2,1)` and `(1,1)`.
  With `δ = id` on `Γᵐᵒᵖ`, endpoint monodromy sends `op(A)op(B)` and `op(B)op(A)` on `(1,0)` to
  `(2,−1)` and `(1,−1)`, and its first value equals the product of the two inverse actions.
  Thus the endpoint convention remains a homomorphism with noncommuting `K_S` values.
- localSystem_not_constant_of_trivial_stalk: A rank-one system may have trivial stalks and
  nontrivial monodromy. At non-neat `GL_2(Ẑ), R(sign det)` is an orbifold coefficient system; it is
  not asserted to descend to a local system on the coarse quotient. A manifold example is the
  real-quadratic `GL_1 sign` character in localSystem_monodromy_GL1.

### ALS.1.2 Betti complexes `RΓ(X_K, V)`, `RΓ_c(X_K, V)` and their equivariant models

Define LocallySymmetric.RΓ. For compact open `K` choose a normal finite-index neat `K₀⊂K`, put
`Q=K/K₀, Y=X_{K₀}` and let `Ȳ=X̄_{K₀}` be its compact Borel–Serre closure with the `Q`-action and
equivariant
coefficient extension `V̄`. The objects `C=RΓ(Ȳ,V̄), C_c=RΓ(Ȳ,j_!V), C_∂=RΓ(∂Ȳ,i^*V̄)` live in `D(R[Q])`,
obtained from equivariant sheaves before forgetting `Q`. Define
`RΓ(X_K,V)=RΓ(Q,C), RΓ_c(X_K,V)=RΓ(Q,C_c), RΓ(∂X̄_K,V)=RΓ(Q,C_∂)`. At neat `K` these agree with
ordinary sheaf cohomology
and compact support by free descent and the interior homotopy equivalence. At arbitrary `K` they
compute groupoid cohomology, not coarse cohomology; group invariants are derived and can be
unbounded. For `K′⊲K` choose `K₀⊂K′` and define `RΓ_{K/K′}(X_{K′},V)=RΓ(K′/K₀,C)` in `D(R[K/K′])` using the
equivariant derived functor, with analogous support and boundary objects. Independence of the choice
of `K₀`, the coherence of the comparisons and the agreement with ordinary sheaf cohomology at neat
level are ALS.1.3. For ordinary cohomology this agrees with
Newton–Thorne's discrete equivariant model `RΓ(K, RΓ(𝔛_G, V_𝔛))`, whose Hecke structure is the Hecke
complex of ALS.3.4. The construction uses no finiteness of `V`; finiteness and
perfectness are the business of ALS.1.6 and
ALS.2.4. The statement assumes: `R` commutative; `V` an
`R[G(F) × K_S]`-module; the topological sheaf functors of ALS.F.3 (EnhancedDerivedSheaves
§§0.1 and 0.4 and ComplexComparisonPartII §C6.1, over every commutative ring). ([ACC+23, §2.1.2, p. 911]; [NT16, §3.1, Corollary 3.3, p. 42]; [CN23, §2.1.2, after
Proposition 2.1.3, p. 11])

The API: LocallySymmetric.RΓ — `RΓ(X_K,V)=RΓ(Q,RΓ(Ȳ,V̄))` in `D(R), Q=K/K₀` for a neat normal
refinement; naturally identified with the ordinary NT16 equivariant invariant-sections model;
LocallySymmetric.RΓc — `RΓ_c(X_K,V)=RΓ(Q,RΓ(Ȳ,j_!V))` in `D(R)`, independent of the chosen neat normal
refinement by equivariant finite-cover descent; at neat `K` this is ordinary compact support;
LocallySymmetric.RΓrel — For `K₀⊂K′⊲K, RΓ_{K/K′}(X_{K′},V)=RΓ(K′/K₀,RΓ(Ȳ,V̄))` in `D(R[K/K′])`; the
residual action is retained in the equivariant derived construction;
LocallySymmetric.RΓ.isoSheafCohomology — For neat `K, RΓ(X_K, V) ≅ RΓ(X_K, V_K)` (sheaf cohomology,
Mathlib's Sheaf.`H` in degree `i`); LocallySymmetric.RΓrel.forget — The image of `RΓ_{K/K′}(X_{K′}, V)`
under `D(R[K/K′]) → D(R)` is `RΓ(X_{K′}, V)`; LocallySymmetric.RΓc.forgetSupports — The natural map
`RΓ_c(X_K, V) → RΓ(X_K, V)`; LocallySymmetric.RΓ.map — `V ↦ RΓ(X_K, V)` and `V ↦ RΓ_c(X_K, V)` are
triangulated functors of `V` (short exact sequences of coefficient modules give triangles).

*Needs:* ALS.1.1; ALS.0.8;
ALS.2.2; ALS.2.3;
ALS.F.4 (discrete equivariant sheaves, enough injectives,
derived invariant sections, supports and localization); ALS.F.3 (derived sections, pushforward, `j_!` and the
localization triangle); Mathlib `DerivedCategory`; Mathlib `CategoryTheory.Sheaf.H`.

**Checks.**

- RΓ_point: If `X_K` is a finite set of points (`G` a torus with `T(ℝ)/A_∞` compact),
  `RΓ(X_K, V) = ⊕_{x} V^{Stab(x)}` concentrated in degree 0 for `|Stab(x)|` invertible in `R`.
- H1_modularCurve_levelGamma1_5: For `G = SL_{2,ℚ}` (`A_G` trivial) at the neat level giving `Γ_1(5)∖ℍ`
  (a sphere minus four cusps), `H⁰ = R, H¹ ≅ R³, H^i = 0` for `i ≥ 2`, and `H¹_c ≅ R³, H²_c ≅ R`.
- RΓ_eq_groupCohomology_levelOne: For `G = SL_{2,ℚ}` and `K = SL_2(Ẑ), H^i(X_K, ℤ)` is group
  cohomology `H^i(SL_2(ℤ), ℤ): ℤ, 0, ℤ/12, 0, ℤ/12`, … (2-periodic from degree 2), not the cohomology
  of the coarse space `SL_2(ℤ)∖ℍ ≅ ℂ`.
- RΓ_ne_coarse: At non-neat level `H^*(X_K, ℤ)` differs from the singular cohomology of the coarse
  quotient: for `SL_2(ℤ), H²(X_K, ℤ) = ℤ/12` while `H²(SL_2(ℤ)∖ℍ, ℤ) = 0`.

### ALS.1.3 Independence of the neat refinement and free descent

Prove LocallySymmetric.RΓ.refinementIndependence. Let `K` be compact open, `V` an `R`-module with
commuting `G(F)` and `K_S` actions, and let `K₁ ⊂ K₀ ⊂ K` be neat open subgroups, both
normal in `K`, with `Q_i = K/K_i`. Write `C_?(K_i) ∈ D(R[Q_i])` for the three equivariant objects of
ALS.1.2, `? ∈ {∅, c, ∂}`, computed on `X̄_{K_i}` from the `G(F) × K`-equivariant
sheaf `V̄` on `X̄^G × G(𝔸^∞)^δ` (ALS.F.4, discrete equivariant sheaves),
with `j_!` for compact support and `i^*` for the boundary. (i) Free descent: `K₀/K₁` acts freely on
`X̄_{K₁}` with quotient `X̄_{K₀}`, the quotient map is a finite Galois covering, and pullback
induces an isomorphism `C_?(K₀) ≅ RΓ(K₀/K₁, C_?(K₁))` in `D(R[Q₀])`; for compact support this uses
that a finite covering is proper, so pushforward and proper pushforward agree. (ii) Composition:
`RΓ(Q₀, −) ∘ RΓ(K₀/K₁, −) ≅ RΓ(Q₁, −)` as functors `D⁺(R[Q₁]) → D⁺(R)`, because
`(−)^{K₀/K₁} : Mod R[Q₁] → Mod R[Q₀]` is right adjoint to the exact inflation functor and so carries
injective
`R[Q₁]`-modules to injective `R[Q₀]`-modules; and the underlying object of `RΓ(K₀/K₁, −)` is group
cohomology of `K₀/K₁`, because restriction to `K₀/K₁` carries injective `R[Q₁]`-modules to
injective `R[K₀/K₁]`-modules. Hence the two definitions of `RΓ_?(X_K, V)` through `K₀` and `K₁` are
canonically isomorphic. (iii) Coherence: for three such refinements the three comparison
isomorphisms satisfy the cocycle identity, and they commute with the maps `C_c → C → C_∂ → C_c[1]`
of the boundary triangle, so `RΓ(X_K, V)`, `RΓ_c(X_K, V)` and `RΓ(∂X̄_K, V)` with their triangle are
well defined up to unique isomorphism; any two neat normal refinements are compared through their
intersection. (iv) At neat `K` one may take `K₀ = K`, and the objects are ordinary sheaf cohomology
`RΓ(X_K, V_K)`, compactly supported cohomology `RΓ(X̄_K, j_!V_K) = RΓ_c(X_K, V_K)` (since `X̄_K` is
compact) and `RΓ(∂X̄_K, V_K)`. The same holds for the relative objects `RΓ_{K/K′}` of
ALS.1.2. ([ACC+23, §2.1.2, pp. 911–912]; [NT16, §2.3, Lemma 2.17 and Proposition
2.18, pp. 23–24]; [CN23, §2.1.2, Lemma 2.1.5, p. 11])

*Needs:* ALS.1.2; ALS.0.9;
ALS.2.3; ALS.F.4 (discrete equivariant sheaves,
enough injectives, derived invariant sections and supports);
ALS.F.3; AlgebraicTopology, Stage 5 (finite covers and transfer).

**Checks.**

- Degenerate: for neat `K` and `K₀ = K` the comparison is the identity, and `RΓ_c(X_K, R)` of a
  connected modular curve with `c` cusps has `H²_c = R` and `H¹_c` of rank `2g + c − 1`.
- Derived, not plain, invariants: if `X_K` is a point with stabilizer of order `2` and `R = F₂`, the
  definition gives `RΓ(C₂, F₂)`, with `F₂` in every degree; taking `Q`-invariants of cohomology
  would give `F₂` in degree `0` only.
- Non-example: an arbitrary finite-index subgroup `K₀ ⊂ K` that is neat but not normal does not give
  a `Q`-action on `X̄_{K₀}`; replace it by its normal core in `K`, which is still neat.

### ALS.1.4 Sheaf cohomology of arithmetic local systems agrees with singular cochains

Prove LocallySymmetric.RΓ.isoSingular. For neat `K` and `V` finite projective, there are natural
isomorphisms in `D(R)` `RΓ(X_K, V_K) ≅ C^•(X_K; V_K)` and
`RΓ_c(X_K, V_K) ≅ C^•_c(X_K; V_K) := colim_C C^•(X_K, X_K ∖ C; V_K)` (`C` compact), where `C^•` are
the singular cochains with local coefficients of
AlgebraicTopology, Stages 2 and 6; they are compatible with pullback along level maps and
translations, with the forget-supports map, and, on `X̄_K` (ALS.2), with the relative cochains of the
pair `(X̄_K, ∂X̄_K)`. Equivalently, `RΓ(X_K, V_K) ≅ Hom_{ℤ[Γ_i]}(C_•(X^G), V)` on the component `Γ_i∖X^G`,
with `Γ_i` acting through the slice representation. Apply the supplied derived comparison of
ComplexComparisonPartII §C6.1 / `topologicalCoefficientComparison`: `X_K` is a locally contractible
paracompact manifold. Its compact-support comparison applies to the relative Borel–Serre model
using the finite boundary-compatible triangulation of ALS.2.4's geometric clause. For arbitrary
commutative `R`, apply the arbitrary-stalk comparison of ALS.F.3, absolute on `X_K` and relative on
the pair `(X̄_K, ∂X̄_K)`. This target transports
the supplied maps to the arithmetic slice system, proves naturality in level maps and translations,
and identifies compact support with the relative Borel–Serre cochains. The Hecke compatibility is
the arithmetic correspondence statement of ALS.3.5. In terms of Tau Ceti's twisted cochains
(`TauCeti.LocalCoefficientSystem.twistedCochainComplex`, which apply `Hom(−, M)` to chains twisted by
a system `L` and so are contravariant in `L`) the right side is the twisted cochain complex with
`L = V_K^∨` and `M = R`, since `Hom_R(V^∨, R) = V` for `V` finite projective. The statement assumes:
`K` neat; `V`
finite projective over the commutative ring `R`. The supplier's first-vertex cochain convention is
transported to the whole-inverse endpoint convention of ALS.1.1; its value system is `V_K`, whereas
Tau Ceti's Hom-of-twisted-chains carrier uses `L = V_K^∨`. ([Sel16, Introduction, main theorem, p. 2];
[ACC+23, §2.1.2, proof of Lemma 2.1.7, p. 912])

*Needs:* ALS.1.2; ALS.0.9;
ALS.2.4 (geometric clause, for compact support and relative cochains);
ComplexComparisonPartII §C6.1 / `topologicalCoefficientComparison`, §C6.4 /
`artinComparisonCompactSupport` on its domain; ALS.F.3, including its arbitrary-stalk comparison
for the wider coefficient domain; AlgebraicTopology, Stage 2;
AlgebraicTopology, Stage 4; AlgebraicTopology, Stage 6; Mathlib
`AlgebraicTopology.singularChainComplexFunctor`; Tau Ceti `TopPair.singularChainComplexFunctor`; Tau
Ceti `TauCeti.LocalCoefficientSystem`; ALS.1.1.

**Checks.**

- For `X_K` compact the compactly supported comparison reduces to the absolute one. In particular
  a constant `𝔽₂` system on a compact triangulated arithmetic manifold uses the supplier's
  comparison directly, rather than a second resolution.
- A rank-one `𝔽₃` system on a circle with monodromy `−1` has `H⁰ = H¹ = 0` on both sides;
  `L = V_K^∨` in the pinned Hom-of-chains carrier gives the same value system after biduality.
- For a connected orientable noncompact surface `Γ∖ℍ` and constant coefficients `R, H²_c(Γ∖ℍ,R)=R` and
  `H²(Γ∖ℍ,R)=0` on both sides. Without orientability, the first formula requires the orientation
  coefficient system `o_R` instead of constant `R`. For the nonorientable neat `PGL_2` example and
  `R=ℚ, H²_c(Γ∖ℍ,ℚ)=0`, not `ℚ`.

### ALS.1.5 Betti cohomology as group cohomology of the arithmetic groups

Prove LocallySymmetric.RΓ.isoGroupCohomology. For every compact open `K` (neat or not) and every
`R[G(F) × K_S]`-module `V` there is a natural isomorphism `RΓ(X_K, V) ≅ ⊕_{i=1}^s RΓ(Γ_i, V)`, with
`Γ_i = G(F) ∩ g_iKg_i⁻¹` acting on `V` by `γ ↦ ρ_{G(F)}(γ)ρ_{K_S}((g_i⁻¹γg_i)_S)`, as the slice
representation of
ALS.1.1 and `RΓ(Γ_i, −)` group cohomology (Mathlib's `groupCohomology` in
each degree). At neat level apply the supplied neat-component comparison
to each arithmetic component and assemble the finite sum. In particular `H^*(X_K, V)` is the orbifold
cohomology of `X_K`, and differs from the cohomology of the coarse quotient by terms killed by the
orders of the stabilizers: if every stabilizer order is invertible in
`R`, `H^*(X_K, V) ≅ H^*(Γ∖X^G, (π_*V)^stabilizer)`. When stabilizer orders are invertible, the
invariant pushforward to the coarse
quotient is generally a constructible sheaf; it is a local system only under an additional descent
condition such as trivial stabilizer action on the fibres. The statement assumes: `V` an
`R[G(F) × K_S]`-module; the arbitrary-stalk sheaf/singular comparison of ALS.F.3 outside the
finite local-system supplier domain. ([ACC+23, §2.1.2, proof of Lemma 2.1.7, p. 912];
[CG18, §5.2, arithmetic quotients, pp. 55–56])

**Neat-component group cohomology.** (*neat-component-group-cohomology*)

Provides the comparison between local-coefficient cohomology of a `K(Γ,1)` and discrete group
cohomology. Supplied by ClassifyingSpaces §Stage 4, items 16–`18 /` item 17 **Homology**,
local-coefficient cohomology clause.
ClassifyingSpaces identifies the deck group with the opposite fundamental group; this roadmap's
adapter uses the arithmetic slice representation with its compatible left action and the
sheaf-to-cochain comparison of ALS.1.4 to reach the complex in `D(R)`.

For neat components, discharge the Hausdorff CW and covering-space hypotheses using
ALS.0.9 and the finite boundary-compatible triangulation of ALS.2.4's geometric clause, whose
interior inclusion is a homotopy equivalence, transporting the slice local system to the resulting
CW model. For arbitrary `V` use the ordinary comparison with cochains valued directly in `V`,
supplied by ALS.F.3's arbitrary-stalk comparison when `V` is outside the finite local-system supplier domain; no
dual-coefficient realization is asserted unless `V` is finite projective. Transport the supplier's
chain-level comparison to `D(R)`, retaining naturality, the finite component sum and equivariant
descent at non-neat level with the stabilizer
corrections above.

*Needs:* ALS.1.2; ALS.0.7;
ALS.0.5; ALS.0.9;
ALS.1.4; ClassifyingSpaces §Stage 4, items 16–18
(neat-component group cohomology); ALS.2.4 (geometric clause); Mathlib `groupCohomology`; Mathlib `Rep`.

**Checks.**

- `H^*(SL_2(ℤ), ℤ) = ℤ, 0, ℤ/12, 0, ℤ/12`, … (2-periodic from degree 2), unbounded although `SL_2(ℤ)∖ℍ`
  is a surface.
- With `R = ℤ[1/6]` the same orbifold has `H⁰ = R` and `H^i = 0` for `i > 0`, the cohomology of the coarse
  space `ℂ`.
- Coefficients need not be projective: for `V = ℤ/4` with trivial actions at level
  `SL_2(Ẑ), H¹(X_K, V) = Hom(SL_2(ℤ), ℤ/4) = Hom(ℤ/12, ℤ/4) = ℤ/4`.

### ALS.1.6 Bounded finite projective models from a finite equivariant cell structure

Prove LocallySymmetric.RΓrel.perfect_of_freeCellModel. Suppose the Borel–Serre closure of
`X^G × G(A^∞)^δ` has a `G(F) × K`-invariant Hausdorff CW structure with boundary a subcomplex,
finitely many
cell orbits and trivial cell stabilizers for the full group `G(F) × K`, and that the orbit map for
this discrete full-group action is a quotient covering map, as at good neat `K`. For `K′` open normal
in `K`, take the cellular chains `C_•` from the supplied cellular freeness, count
the quotient-cell basis elements and bound their degrees in `[0,d_G]`, obtaining bounded finite free
`ℤ[G(F) × K]`-modules. For finite projective `R`-coefficients `V, RΓ_{K/K′}(X_{K′}, V)` is computed
by `Hom_{ℤ[G(F)×K′]}(C_•, V)`, a bounded finite projective
left `R[K/K′]`-complex. Hence it satisfies the shared `PerfectComplex.IsPerfect` predicate
over the possibly noncommutative ring `R[K/K′]` by ALS.F.2; for `K′ = K, RΓ(X_K, V)` is perfect over `R`
with amplitude in `[0,d_G]`. The analogous relative cell model computes `RΓ_c`. Freeness only for `G(F) × K′`
does not imply perfectness over `R[K/K′]` when `K` has stabilizers. The statement assumes: Finite
`G(F) × K`-invariant Hausdorff CW structure with boundary a subcomplex, free for the full group
`G(F) × K`,
and its quotient-cover property; good neat `K` supplies the arithmetic case; `K′` open normal in `K`
(so `K/K′` is finite, with no abelian hypothesis); `R` commutative; `V` finite projective over `R`.
([ACC+23, §2.1.2, Lemma 2.1.7, p. 912]; [ACC+23, §2.1.2, proof of Lemma 2.1.7, p. 912])

**Cellular freeness.** (*cellular-freeness*)

Provides free cellular chain modules over the integral group ring when the quotient-cover action
permutes cells freely. Supplied by ClassifyingSpaces §Stage 3, item `13 /` **CW structures and
coverings**, free cellular chain clause.
This roadmap uses the action of the full group `G(F) × K`, discharges the supplier's Hausdorff CW
and quotient-cover hypotheses, transports the chosen quotient-cell lifts to left group-ring
modules, and separately proves finite orbit counts, boundedness and the relative/coefficient
model.

*Needs:* ALS.1.2; ALS.1.4; AlgebraicTopology,
Stage 4; ClassifyingSpaces §Stage 3, item 13 (cellular freeness);
ALS.2.4 (geometric clause, supplying the arithmetic cell structure);
ALS.F.2; Mathlib `Module.Projective`.

**Checks.**

- For `K′ = K` neat, `RΓ(X_K, V)` is a perfect complex of `R`-modules with amplitude `[0, d_G]`.
- For `R = ℤ` and `V = ℤ, H^*(X_K, ℤ)` is finitely generated in each degree.
- A full-level free model with quotient `Q = S₃` gives finite projective left `R[S₃]` terms;
  ALS.F.2 applies despite the two unequal products of transpositions in the group ring.
- Non-example: for `SL_{2,ℚ}, K = SL_2(Ẑ)` and `K′ = K(3), RΓ_{K/K′}(X_{K′}, F_2)` is perfect over `F_2`
  but not over `F_2[K/K′]`: derived `K/K′`-invariants of a perfect `F_2[K/K′]`-complex are bounded, while
  they give `H^*(SL_2(ℤ), F_2)`, which is nonzero in every degree.

### ALS.1.7 Derived coefficient change and the universal-coefficient spectral sequence

Prove LocallySymmetric.RΓ.baseChange. Let `R` be a commutative ring, `R → R′` a ring map, `K` neat and `V` a
finite projective `R`-module with `R[G(F)×K_S]`-action (or, more generally, a bounded complex of such of
uniform Tor-amplitude in `[a, b]`). Then `(i) RΓ(X_K, V) ⊗^L_R R′ ≅ RΓ(X_K, V ⊗_R R′)` and
`RΓ_c(X_K, V) ⊗^L_R R′ ≅ RΓ_c(X_K, V ⊗_R R′)` naturally in `D(R′)`, compatibly with level maps; (ii)
there is a
convergent spectral sequence `E_2^{i,j} = Tor^R_{−i}(H^j(X_K, V), R′) ⇒ H^{i+j}(X_K, V ⊗_R R′)`, with
every Tor term present; for `R′ = R/ϖ^m` and `R` a discrete valuation ring it degenerates to the short
exact sequences `0 → H^j(X_K, V)/ϖ^m → H^j(X_K, V/ϖ^m) → H^{j+1}(X_K, V)[ϖ^m] → 0`. Torsion-free
cochains do not imply torsion-free cohomology: `H^{j+1}(X_K, V)[ϖ^m]` can be nonzero. The statement
assumes: `R` commutative; `K` neat; `V` finite projective over `R`, or a bounded complex of such with
Tor-amplitude in `[a, b]`. ([NT16, §3.1, Proposition 3.7(2), p. 48]; [NT16, §3.1, proof of Proposition
3.7, p. 49])

*Needs:* ALS.1.6; ALS.1.2;
ALS.F.2; Mathlib `Module.Flat`; Mathlib
`DerivedCategory`; ALS.2.4.

**Checks.**

- `V = ℤ, R′ = F_p: 0 → H^j(X_K, ℤ)/p → H^j(X_K, F_p) → H^{j+1}(X_K, ℤ)[p] → 0`.
- If `H^*(X_K, V)` is `R`-free, coefficient change commutes with cohomology.
- `V = ℤ, R′ = ℚ: ℚ` is flat, every Tor term vanishes and `H^j(X_K, ℚ) = H^j(X_K, ℤ) ⊗ ℚ`.

### ALS.1.8 Pullback and translation on Betti complexes

Define LocallySymmetric.RΓ.pullback. For `K′ ⊂ K` compact open, restriction of derived
invariants gives `π^*_{K′,K} : RΓ(X_K,V) → RΓ(X_{K′},V)`, agreeing with sheaf pullback at neat
level. For `g ∈ G(A^∞)`, put `L = gKg⁻¹` and use the conjugation-transported coefficient `V^(g)`
of ALS.1.1. Geometric translation gives the canonical isomorphism
`r_g^* : RΓ(X_K,V) ≅ RΓ(X_L,V^(g))`. It uses no action of `g_S` on `V`. For a prescribed coefficient `W`
at `L` and an `R`-linear map `A_g : V^(g) → W`, commuting with `G(F)` and intertwining the level actions
as in ALS.1.1, compose geometric pullback with the induced coefficient morphism. This composite
is a translation isomorphism when `A_g` is an equivariant `R`-linear isomorphism. A compatible group
action extending the level actions supplies such an isomorphism; a compatible monoid action alone
supplies a coefficient morphism.

For `g ∈ G^S` take `W = V` and `A_g = id`, recovering the same-coefficient translation. Geometric
translations compose after canonical identification `(V^(g))^(h) = V^(hg)`, and translation by `g⁻¹`
is inverse to translation by `g`. For specified coefficient maps, composition uses
`A_{hg} = A_h A_g` with the transported domains, and the identity uses `A_1 = id`. Inverse-translation
identities require inverse coefficient isomorphisms. For `k ∈ K`, identify `V^(k)` with `V` by `ρ(k_S)`;
then `r_k^* = id`. All these maps commute with level pullback. The same statements hold on
`RΓ_c`, the compactification and its boundary: translations are homeomorphisms of the compactified
pairs and finite level maps are proper at neat level. For `K′` normal in `K` the relative translation
compares `RΓ_{K/K′}(X_{K′},V)` with
`RΓ_{gKg⁻¹/gK′g⁻¹}(X_{gK′g⁻¹},V^(g))`, transporting the deck action by `q ↦ gqg⁻¹`. A further
coefficient map must intertwine these transported deck actions to give a morphism over the
identified group rings. Arbitrary levels use equivariant descent with the same coefficient maps.
The statement assumes: `R` commutative; `K′ ⊂ K` compact open; `g ∈ G(A^∞); V` an `R[G(F) × K_S]`-module;
`W` an `R[G(F) × L_S]`-module when used; `A_g` with the stated equivariance, and invertible when an
isomorphism is claimed; the sheaf functors and comparisons of ALS.F.3 outside the finite-coefficient
domain.
([NT16, §2.3, Definition 2.12 and after Proposition 2.18, pp. 22–24];
[ACC+23, §2.1.2, p. 911])

The API: LocallySymmetric.RΓ.pullback — `π^*_{K′,K}`, with pullback_id and pullback_comp;
LocallySymmetric.RΓ.translate — geometric translation to `V^(g)`, with translate_one, translate_mul
and inverse translation after coefficient transport; same-coefficient translation carries the
specified equivariant coefficient isomorphism, with translate_of_mem using `ρ(k_S)`;
LocallySymmetric.RΓ.translate_pullback — `r_g^* ∘ π^*_{K′,K} = π^*_{gK′g⁻¹,gKg⁻¹} ∘ r_g^*`,
retaining transported coefficients;
LocallySymmetric.RΓ.pullback_eq_sheafPullback — at neat level these geometric maps are sheaf
pullbacks; a composite with `A_g` retains its coefficient morphism;
LocallySymmetric.RΓc.pullback — the same maps on `RΓ_c`, commuting with forget-supports.

*Needs:* ALS.1.1; ALS.1.2;
ALS.0.6; AlgebraicTopology, Stage 2;
Tau Ceti `TauCeti.LocalCoefficientSystem.pullback`.

**Checks.**

- pullback_H0: In degree `0, π^*_{K′,K} : R^{π_0(X_K)} → R^{π_0(X_{K′})}` is the map induced by
  `π_0(π_{K′,K})` (each component pulled back to the union of the components over it).
- translate_of_mem: For `k ∈ K`, geometric pullback followed by `ρ(k_S)` is id on `RΓ(X_K,V)`.
  For a group coefficient action, the coefficient isomorphism at `g⁻¹` is the inverse of that
  at `g`; the inverse identities also hold for compact
  support and transported deck actions.
- For `G = G_m` over `ℚ, p ∈ S, K_p = ℤ_p^×` and
  `Δ_p = {p^n u : n ≥ 0, u ∈ ℤ_p^×}`, let `Δ_p` act by multiplication on `V = R = ℤ_p` and let
  `G(ℚ)` act trivially. Translation by `g_p = p` fixes the level and pure geometric coefficient
  transport is the identity, but its specified monoid coefficient map is multiplication by `p`.
  It is not surjective on a stalk, hence cannot supply a coefficient-sheaf isomorphism.
  Tame level may be chosen neat.
- Reduction of that example to `R = V = 𝔽_p` gives the zero `p`-operator on a nonzero stalk, while
  `K_p` acts smoothly through `𝔽_p^×`. This linear map fails to be bijective.
  The geometric translation remains an isomorphism.
- pullback_injective_rational: If `K` is neat and `[K : K′]` is invertible in `R` then `π^*` is split
  injective on `H^*`, with left inverse `[K : K′]⁻¹·`(trace) (see ALS.3.6).
- pullback_not_iso: `π^*` is not an isomorphism in general: for
  `GL_{2,ℚ}, π^* : H¹(X_{K(3)}, ℚ) → H¹(X_{K(9)}, ℚ)` has a nonzero cokernel (the genus grows).

### Examples

- `SL_{2,ℚ}` at the neat level `Γ₁(5)`: a sphere with four punctures, `H⁰ = R`, `H¹ ≅ R³`,
  `H¹_c ≅ R³`, `H²_c ≅ R`.
- `SL_{2,ℚ}` at level `SL_2(Ẑ)`: `H^*(X_K, ℤ) = H^*(SL_2(ℤ), ℤ) = ℤ, 0, ℤ/12, 0, ℤ/12, …`, while the
  coarse quotient `SL_2(ℤ)\ℍ ≅ ℂ` has the cohomology of a point; over `ℤ[1/6]` the two agree.
- Coefficient change: `0 → H^j(X_K, ℤ)/p → H^j(X_K, F_p) → H^{j+1}(X_K, ℤ)[p] → 0` for neat `K`.
- Monodromy convention: for `A = (1, 1; 0, 1)` and `B = (1, 0; 1, 1)`, `AB ≠ BA` and
  `(AB)⁻¹ = B⁻¹A⁻¹ ≠ A⁻¹B⁻¹`; inverting the whole slice action gives a homomorphism for Tau Ceti's
  loop
  product, inverting one factor does not.

### Dependencies

Layers ALS.F and ALS.0; ALS.2.1–2.3, ALS.5a.1 and the geometric clause of ALS.2.4 precede
ALS.1.2; the cohomological clause of ALS.2.4 precedes ALS.1.7 in *How to read the build*.
AlgebraicTopology, Stages 2, 4, 5 and 6; Mathlib
(`groupCohomology`, `Rep`, `DerivedCategory`, `Module.Projective`, `Module.Flat`);
Tau Ceti (`TauCeti.LocalCoefficientSystem`, `TopPair.singularChainComplexFunctor`).

## Layer ALS.2: Borel–Serre corners and boundary strata

This layer builds the Borel–Serre compactification: the geodesic action and boundary faces, the
corners and their gluing, compactness of the arithmetic quotients and the homotopy equivalence with
the interior, finite triangulations, the stratification of the boundary by parabolic classes, the
cocompact unipotent lattices and the parabolic arithmetic extensions, the nilmanifold fibrations of
the strata, and the two boundary spectral sequences.

### ALS.2.1 Geodesic action and the boundary face `e(P)`

Define LocallySymmetric.BorelSerre.geodesicAction. Let `𝐆 = Res_{F/ℚ}G` and `P` a rational parabolic
subgroup of `𝐆` (equivalently an `F`-parabolic of `G`) with unipotent radical `N_P` and Levi
quotient `L_P = P/N_P`. Let `S_P` be the maximal `ℚ`-split central torus of the Levi quotient `L_P`,
modulo the image of
the maximal `ℚ`-split central torus of `𝐆` (equivalently the split-radical quotient `Rd(P)/(R_u(P)·Rd(𝐆))`
in NT16's convention), and `A_P = S_P(ℝ)°`. At the basepoint use the AA.3.7 Cartan datum identified
in ALS.0.1, with the same fixed compact as the imported Siegel coordinates; transport it by the
action of `𝐆(ℝ)` at other points.
For `x ∈ X^G` let `L′_x ⊂ P_ℝ` be the unique Levi subgroup
stable under the Cartan involution attached to the maximal compact subgroup of `Stab(x)`. The geodesic
action of `A_P` on `X^G` is `a • x = a_x·x` with `a_x ∈ L′_x(ℝ)` the lift of `a`; it is free, commutes with
`P(ℝ)` and with the action of `P(ℚ)`. The boundary face is `e(P) = A_P∖X^G`, a space of type `S−Q` for `P`,
with `e(P) ≅ N_P(ℝ) × X_{L_P}` (`X_{L_P}` the symmetric space of `L_P` with its own split centre already
removed) via a choice of horospherical trivialization; transport the `P(ℝ)`-action to this product
(the Levi action includes the conjugation action on `N_P`); `dim e(P) = d_G − dim A_P`. For
`P = 𝐆, e(𝐆) = X^G`. The statement assumes: `P` a rational parabolic subgroup of `Res_{F/ℚ}G`,
including `G` for the
whole-group face; proper `P` for a boundary face. ([NT16, §3.1, p. 41]; [JM02, §7.3, p. 483]; [BS73,
§§3.2–3.9, pp. 448–452])

The API: LocallySymmetric.BorelSerre.geodesicAction — The action `A_P × X^G → X^G, (a, x) ↦ a • x`;
LocallySymmetric.BorelSerre.geodesicAction_free — The geodesic action is free and proper, and
commutes with the left action of `P(ℝ)`; LocallySymmetric.BorelSerre.face — `e(P) = A_P∖X^G` with its
`P(ℝ)`-action (a space of type `S−Q` for `P`); LocallySymmetric.BorelSerre.faceEquiv — A horospherical
trivialization identifies `e(P)` with `N_P(ℝ) × X_{L_P}`; transport the `P(ℝ)`-action to this product,
including the Levi conjugation action on `N_P`; LocallySymmetric.BorelSerre.face_conj — For
`γ ∈ 𝐆(ℚ)=G(F), x ↦ γx` induces `e(P) ≅ e(γPγ⁻¹)` compatibly with the geodesic actions;
LocallySymmetric.BorelSerre.face_dim — `dim e(P) = d_G − dim A_P`.

For the diagonal torus of `SL_2`, the geodesic action on `ℍ` is
`t • (x + iy) = x + i e^{2t}y`. It is free, fixes real parts and commutes with `N_B(ℝ)`.

*Needs:* ALS.0.4; ALS.0.1; AdelicAlgebraicGroups §3.2
(horospherical decomposition for a fixed maximal compact, stated there for semisimple groups; its
reductive form for spaces of type `S−Q` is `faceEquiv` here); AdelicAlgebraicGroups §3.1 (minimal and
standard rational parabolics); Tau Ceti `TauCeti.Cocharacter.parabolic`; Tau Ceti
`TauCeti.Cocharacter.leviDecompositionMulEquiv`; Tau Ceti `Matrix.SpecialLinearGroup.dilation`.

**Checks.**

- face_SL2_borel: For `SL_{2,ℚ}` and the upper triangular Borel `B, e(B) ≅ N_B(ℝ) ≅ ℝ` (`X_{L_B}` is a
  point) and `dim e(B) = 2 − 1 = 1`.
- face_whole_group: For `P = 𝐆, A_P = 1` (in this convention `A_𝐆` is already divided out) and `e(𝐆) = X^G`.
- face_GL3_minimal: For `GL_{3,ℚ}` and the Borel `B, A_B ≅ ℝ_{>0}², X^G` has dimension 5 and
  `e(B) ≅ N_B(ℝ)` (a Heisenberg group, dimension 3) has dimension `5 − 2 = 3`.
- geodesicAction_ne_leftAction: The geodesic action is not the left action of `A_P ⊂ P(ℝ)` through a
  fixed Levi: for `SL_{2,ℚ}` the left action of `diag(a, a⁻¹)` on `ℍ, z ↦ a²z` (Tau Ceti's
  `Matrix.SpecialLinearGroup.dilation (2 log a)`), moves horizontally displaced points along rays
  through 0, whereas the geodesic action moves every point vertically.

### ALS.2.2 The Borel–Serre partial compactification `X̄^G`

Define LocallySymmetric.BorelSerre.bordification. As a set
`X̄^G=⊔_{P rational parabolic, including G} e(P)`, with `e(G)=X^G`. For `Δ_P` the simple relative
roots, let `Ā_P=(0,∞]^{Δ_P}`; reciprocals of the
root coordinates identify it analytically with `[0,∞)^{Δ_P}`. The associated corner
`X^G(P)=X^G×^{A_P}Ā_P` is an analytic manifold with corners and equals `⊔_{Q⊇P}e(Q)`. If `P⊂Q`, the
root-factorization `A_P=A_{P,Q}×A_Q` gives the analytic open embedding `X^G(Q)→X^G(P)` of Borel–Serre
5.3. Glue these embeddings: `X^G(P)∩X^G(Q)=X^G(R)`, where `R` is the smallest rational parabolic
containing `P` and `Q` (`R` may be `G`). This is an atlas of open corners, with cocycle identities from the
root-factorizations. The interior is `X^G; closure(e(P))=⊔_{Q⊂P}e(Q)`, and `e(P)` meets `closure(e(Q))`
exactly when `P⊂Q`. The rational action extends analytically by `γe(P)=e(γPγ⁻¹)`. The inclusion of the
interior is a homotopy equivalence, so `X̄^G` is contractible. Set `𝔛̄_G=G(F)∖(X̄^G×G(A^∞)^δ)`,
`X̄_K=G(F)∖(X̄^G×G(A^∞)/K)`, with boundary the union of proper-parabolic faces. The statement assumes:
`G` connected reductive over `F`. ([ACC+23, §2.1.1, p. 910]; [JM02, §7.3, p. 483]; [JM02, §7.4,
Proposition 7.4, p. 484]; [BS73, §§5.1–5.3, 7.1–7.6, pp. 455–459, 463–465])

The API: LocallySymmetric.BorelSerre.bordification — `X̄^G` as a topological space (manifold with
corners) containing `X^G` as an open dense subset; LocallySymmetric.BorelSerre.corner —
`X^G(P)=⊔_{Q⊇P}e(Q)≅X^G×^{A_P}Ā_P` is open; `X(P)∩X(Q)=X(R)` for the smallest rational parabolic `R`
containing `P,Q`. Nested embeddings are analytic and satisfy the cocycle identity;
LocallySymmetric.BorelSerre.boundary — `∂X̄^G = ⊔_{P proper} e(P)`, closed in `X̄^G`;
LocallySymmetric.BorelSerre.closure_face — The closure of `e(P)` in `X̄^G` is `⊔_{Q ⊂ P} e(Q)`;
LocallySymmetric.BorelSerre.smul — `𝐆(ℚ)=G(F)` acts analytically on `X̄^G` extending its action on
`X^G`, with `γ·e(P) = e(γPγ⁻¹)`; LocallySymmetric.BorelSerre.contractible — `X̄^G` is contractible and
the inclusion `X^G → X̄^G` is a homotopy equivalence; LocallySymmetric.BorelSerre.adelic —
`X̄_K = G(F)∖(X̄^G × G(A^∞)/K)` and `∂X̄_K`, with the open immersion `j_K : X_K → X̄_K`.

*Needs:* ALS.2.1; Mathlib `ModelWithCorners`; Mathlib
`ContractibleSpace`; AdelicAlgebraicGroups §3.2 (simple roots of `P` and truncated tori).

**Checks.**

- bordification_SL2: For `SL_{2,ℚ}, ∂X̄ = ⊔_{c∈ℙ¹(ℚ)} e(P_c)` with each `e(P_c) ≅ ℝ`, and `SL_2(ℤ)∖∂X̄`
  is a single circle (one cusp, the circle `N(ℤ)∖N(ℝ)`).
- bordification_anisotropic: If `G` is anisotropic over `F` (no proper `F`-parabolics), `X̄^G = X^G` and
  `∂X̄^G = ∅`.
- bordification_interior: The interior is `X^G` and `e(P)` has codimension `|Δ_P|` in `X^G(P)`. For two
  distinct minimal parabolics of `SL₂`, their open corners intersect in `X^G=X^G(G)`, although their
  boundary faces are disjoint.
- bordification_ne_onePoint: `X̄_K` is not the one-point (or Baily–Borel) compactification: for a
  modular curve each cusp is replaced by a circle, so the boundary has Euler characteristic 0 and
  `H¹(∂X̄_K, ℤ)` has rank equal to the number of cusps.

### ALS.2.3 Compactness of the Borel–Serre quotient and the interior homotopy equivalence

Prove LocallySymmetric.BorelSerre.compact_quotient. Every arithmetic subgroup `Γ ⊂ 𝐆(ℚ)` acts
properly discontinuously on `X̄^G` with compact Hausdorff quotient `Γ∖X̄^G`. Consequently, for every
compact open `K, X̄_K` is compact Hausdorff; if `K` is neat, `X̄_K` is a compact smooth manifold with
corners with interior `X_K` and boundary `∂X̄_K`, and the inclusion `j_K : X_K → X̄_K` is a homotopy
equivalence. At neat `K, ∂X̄_K = X̄_K ∖ X_K` is a compact topological manifold of dimension `d_G − 1`;
its original corner strata give a finite stratification, rather than a smooth boundary obtained by
treating intersecting faces as disjoint (empty iff `G` is `F`-anisotropic modulo centre). The covering
of `Γ∖X^G` by finitely many Siegel sets is AdelicAlgebraicGroups §3.6, stated there for connected
semisimple groups over `ℚ` (with the simple roots of §3.2); for reductive `G/F` it is applied to the
derived group of `𝐆 = Res_{F/ℚ}G`: the central torus contributes a compact factor, since its quotient
by `A_𝐆` is `ℚ`-anisotropic (AdelicAlgebraicGroups §3.4, "Arithmetic quotients of anisotropic groups are
compact"), and the product of the derived group and the centre maps onto `𝐆` with finite kernel and
carries arithmetic subgroups to arithmetic subgroups of finite index. The statement assumes: `Γ`
arithmetic; `K` compact open; neat for the manifold-with-corners statement. ([ACC+23, §2.1.1, p.
910]; [JM02, §7.4, Proposition 7.4, p. 484]; [BS73, Theorem 9.3, pp. 475–476, and §9.5, p. 477])

*Needs:* ALS.2.2; ALS.0.7;
ALS.0.9; AdelicAlgebraicGroups §3.6 (finitely many fixed-`K` Siegel sets
cover, for semisimple groups over `ℚ`); AdelicAlgebraicGroups §3.6 (finitely many cusps);
AdelicAlgebraicGroups §3.6 (finite overlaps of Siegel sets); AdelicAlgebraicGroups §3.4 (arithmetic
quotients of anisotropic groups are compact).

**Checks.**

- For a modular curve `Γ(N)∖ℍ`, the Borel–Serre compactification is a compact surface with one
  boundary circle per cusp.
- For `G F`-anisotropic modulo centre, `X_K` is already compact.
- For `G = GL_{1,F}` with `F` real quadratic the derived group is trivial and everything comes from the
  centre: `(Res_{F/ℚ}G_m)/A_𝐆` has character lattice `ℤ·(1,−1)`. The nonidentity element of
  `Gal(F/ℚ)` exchanges the two coordinates and acts by `−1`, so there is no `ℚ`-rational character;
  complex conjugation fixes both real embeddings. Thus `X_K` is a finite union of circles,
  compact with empty boundary.

### ALS.2.4 Finite triangulations and finiteness of Betti cohomology

Prove LocallySymmetric.BorelSerre.finiteTriangulation. The geometric clause assumes `K` neat and
applies the smooth triangulation target below to the rounded compact manifold with boundary of
ALS.5a.1, which gives a finite triangulation of `X̄_K` compatible with its boundary. Lift its cells along the
quotient covering of ALS.2.3 to `X̄^G × G(A^∞)^δ`: the full discrete group `G(F) × K` permutes these
cells freely, with one orbit per quotient cell, and the boundary lifts to a subcomplex. In
particular `G(F) × K′` acts freely for each `K′ ⊂ K`. This clause uses only geometry, the
smooth triangulation target and the CW-cover lifting of ClassifyingSpaces Stage 3, item 13.
([BS73, §11.1, pp. 481–483]; [ACC+23, §2.1.2, proof of Lemma 2.1.7, p. 912])

The cohomological clause applies ALS.1.4 and ALS.1.6 to this cell structure. Consequently:
`(i) X_K` has the homotopy type of a finite CW complex; (ii) for `K′ ⊂ K` normal and both neat and `V`
finite projective over a commutative ring `R, RΓ_{K/K′}(X_{K′}, V)` and `RΓ_{c,K/K′}(X_{K′}, V)` are
perfect in `D(R[K/K′])` and `RΓ(X_K, V), RΓ_c(X_K, V), RΓ(∂X̄_K, V)` are perfect in `D(R)`; (iii)
`H^*(X_K, V)` and `H^*_c(X_K, V)` are zero outside `[0, d_G]` and, when `R` is noetherian, finitely
generated `R`-modules (the cohomology of a bounded complex of finite projective modules over a
non-noetherian ring need not be finitely generated: see the Checks); (iv)
for a discrete
valuation ring `O` and any `O[G(F) × K_S]`-module `V` that is finite over `O, RΓ(X_K, V), RΓ_c(X_K, V)`
and `RΓ(∂X̄_K, V)` are perfect in `D(O)`: by the triangles of ALS.1.2 for
`0 → V_tors → V → V/V_tors → 0` and for the `ϖ`-adic filtration of `V_tors`, it suffices to treat
`V/V_tors`, which is
finite free over `O`, and the graded pieces, which are finite projective over `O/ϖ`, so that (ii) over
`O/ϖ` and ALS.F.2 (restriction along `O → O/ϖ`, a perfect `O`-module) apply. The
statement assumes the geometric clause's hypotheses; `K′ ⊂ K` normal for (ii); `V` finite projective
over `R` for (ii)–(iii), `R` noetherian for the finite generation in (iii), and `V` finite over the
discrete valuation ring `O` for (iv).
([ACC+23, §2.1.2, proof
of Lemma 2.1.7, p. 912]; [ACC+23, §2.1.2, Lemma 2.1.4, p. 911]; [BS73, §11.1, pp. 481–483])

*Needs (geometric clause):* ALS.2.3;
ALS.5a.1; ClassifyingSpaces Stage 3, item 13 (CW-cover lifting);
GeometricTopology, Layer 11 (`IsTriangulable`); the smooth triangulation target below, including
compatibility with the boundary.

*Needs (cohomological clause):* the geometric clause;
ALS.1.2; ALS.1.4;
ALS.1.6; AlgebraicTopology, Stage 4;
ALS.F.2 (restriction of scalars).

**Checks.**

- For a neat modular-curve level, the geometric clause triangulates a compact surface with its
  cusp circles as a boundary subcomplex, before any coefficient module is chosen.
- If `G` is anisotropic modulo its split centre, the boundary is empty and the geometric clause
  is a finite triangulation of `X_K` itself.
- For `K′` normal in neat `K` with `Q = K/K′`, each lifted quotient cell has exactly `|Q|` cells at
  level `K′`, freely permuted by `Q`. Cell freeness here is geometric and holds in every coefficient
  characteristic, including those dividing `|Q|`.
- `H^*(X_K, ℤ)` is finitely generated for every neat `K`.
- Non-example for the finite generation in (iii): `R` noetherian cannot be dropped. Let
  `R = ℚ[x_1, x_2, …]/(x_1 x_i : i ≥ 1)`: the annihilator of `x_1` is the ideal `(x_1, x_2, …)`,
  which is not finitely generated, and `1 + x_1` is a unit with inverse `1 − x_1`. For `GL_1` over
  a real quadratic field `F` at a neat level `K`, as in the Check localSystem_monodromy_GL1 of
  ALS.1.1, take `V = R(χ)` with `χ : F^× → R^×` a homomorphism with `χ(−1) = 1` and
  `χ(ε) = 1 + x_1` for the fundamental unit `ε`; one exists because `F^×/{±1}` is free abelian
  with `⟨ε⟩` a direct summand (its quotient by `⟨ε⟩` is the free group of principal fractional
  ideals). A generator `±ε^m` of `O_F^× ∩ K` acts on the stalk by `(1 + x_1)^m = 1 + m x_1`. On
  that circle component `RΓ(X_K, V)` is the perfect complex `R → R` given by `±m x_1`, so (ii)
  holds, while `H⁰ = ker(m x_1) = (x_1, x_2, …)` is not finitely generated.
- For `SL_2(ℤ)`-level the orbifold cohomology is not bounded
  (ALS.1.5), so neatness is needed for (ii).
- (iv) at a neat modular-curve level with `O = ℤ_p` and `V = O/ϖ ⊕ O`, which is not projective over `O`
  or over any `O/ϖ^m, RΓ(X_K, V)` is perfect over `O` and splits as `RΓ(X_K, F_p) ⊕ RΓ(X_K, ℤ_p)`.

**Smooth triangulation of compact manifolds with boundary — LocallySymmetric.BorelSerre.smoothTriangulation.**
Let `M` be a compact smooth manifold with boundary of dimension `n ≥ 1`, modelled on Mathlib's
`modelWithCornersEuclideanHalfSpace n`. Prove that there are a finite simplicial complex `L`, a
subcomplex `L₀` and a homeomorphism `h : |L| → M` with `h(|L₀|) = ∂M`, whose restriction to each
closed simplex is smooth of rank equal to the dimension of that simplex. In particular `M` and
`∂M` are triangulable in the sense of GeometricTopology Layer 11 (`IsTriangulable`), by compatible
triangulations. Route: form a collar of `∂M` and the closed double `DM`, in which `∂M` is a closed
smooth submanifold; embed `DM` in some `ℝ^N` (Mathlib's compact Whitney embedding in
`Mathlib.Geometry.Manifold.WhitneyEmbedding`);
take a fine linear triangulation of a neighbourhood in general position with respect to the
tangent planes and push it to `DM` by the nearest-point retraction of a tubular neighbourhood
(Whitehead's secant approximation); run the construction relative to `∂M`, so that it becomes a
subcomplex, and restrict to one copy of `M`. The collar, the double and the tubular neighbourhood
are part of this target. ALS.2.4 applies it to the rounded `X̄_K` of ALS.5a.1 and ALS.2.10 to the
rounded `Ȳ^P_{L_g}`. The statement assumes: `M` compact and smooth with boundary.
([Whi40]; [Mun66, Chapter II]; [BS73, §11.1, pp. 481–483], for the application to `X̄_K`)

**Checks.**

- The closed disc: the cone from the centre over the boundary of a triangle triangulates
  `(D², S¹)` with `4` vertices, `6` edges and `3` triangles, Euler characteristic `1`, and the
  boundary `3`-cycle of Euler characteristic `0` is a subcomplex.
- The annulus `S¹ × [0,1]`: the prism over a triangle boundary, with each square split by a
  diagonal, has `6` vertices, `12` edges and `6` triangles, Euler characteristic `0`, and its two
  boundary circles are disjoint `3`-cycles.
- Compactness is needed for finiteness: the realization of a finite complex is compact, so the
  open interval `(0,1)` has no finite triangulation, although it has an infinite one.
- Smoothness cannot be dropped: Freedman's `E₈` manifold is a closed topological `4`-manifold
  with no triangulation at all.

### ALS.2.5 The stratification of the Borel–Serre boundary by parabolic classes

Define LocallySymmetric.BorelSerre.stratum. Let `P_1`, …, `P_s` represent the `G(F)`-conjugacy classes
of proper `F`-parabolic subgroups of `G`. For a rational parabolic `P` put `𝔛_P = P(F)∖(e(P) × P(A^∞)^δ)`
and, for compact open `K`, `X^P_K = P(F)∖(e(P) × G(A^∞)/K)`. The maps
`j_{P_i} : Ind_{P_i^∞}^{G^∞} 𝔛_{P_i} = P_i(F)∖(G(A^∞) × e(P_i)) → ∂𝔛̄_G` are `G(A^∞)`-equivariant
locally closed immersions and `⊔_i Ind 𝔛_{P_i} → ∂𝔛̄_G` is a continuous bijection; at level
`K, ⊔_i X^{P_i}_K → ∂X̄_K` is a continuous
bijection onto a finite stratification by locally closed strata, the stratum of `P` lying in the
closure of that of `Q` iff `P` is conjugate into `Q`. For `P` maximal, `X^P_K` is open in `∂X̄_K`. `X^P_K`
decomposes further over `P(F)∖G(A^∞)/K` into quotients `Γ_P∖e(P)` with `Γ_P = P(F) ∩ gKg⁻¹`. The index set
is finite: `P(𝔸^∞)∖G(𝔸^∞)` is compact (the Iwasawa decomposition `G(F_v) = P(F_v)K_v` at hyperspecial
places and compactness of `G(F_v)/P(F_v)` elsewhere), so `P(𝔸^∞)∖G(𝔸^∞)/K` is finite, and each
`P(F)∖P(𝔸^∞)/(P(𝔸^∞) ∩ gKg⁻¹)` is finite by finiteness of class numbers for the linear group `P`. The
statement assumes: `K` compact open. ([NT16, §3.1, before Lemma 3.10, p. 50]; [NT16, §3.1, Lemma
3.10(2), p. 51]; [ACC+23, §2.4.1, p. 941])

The API: LocallySymmetric.BorelSerre.stratum — `X^P_K = P(F)∖(e(P) × G(A^∞)/K)` with its locally
closed immersion `j_P : X^P_K → ∂X̄_K` (depending only on the `G(F)`-class of `P` up to isomorphism);
LocallySymmetric.BorelSerre.stratum_bijective — `⊔_{i} X^{P_i}_K → ∂X̄_K` is a continuous bijection,
`P_i` running over representatives of `G(F)`-classes of proper parabolics;
LocallySymmetric.BorelSerre.stratum_closure — The closure of the stratum of `P` is the union of the
strata of the parabolics conjugate into `P`; LocallySymmetric.BorelSerre.stratum_isOpen_of_maximal —
For `P` maximal, `j_P` is an open immersion; LocallySymmetric.BorelSerre.stratum_components —
`X^P_K ≅ ⊔_{g ∈ P(F)∖G(A^∞)/K} Γ_{P,g}∖e(P)` with `Γ_{P,g} = P(F) ∩ gKg⁻¹`.

*Needs:* ALS.2.2; ALS.2.3;
AdelicAlgebraicGroups §3.6 (finitely many cusps); AdelicAlgebraicGroups §3.4
(`Reduction.finite_classes` for `P`) with ReductiveGroupsPartII RG2.4.4 (Iwasawa decomposition);
AdelicAlgebraicGroups §3.1 (minimal and standard rational parabolics).

**Checks.**

- stratum_SL2_cusps: For `SL_{2,ℚ}` there is one `G(F)`-conjugacy class of proper parabolics, so at
  neat level `K` there is one stratum `X^B_K`; it is the disjoint union of the cusp circles of `X_K`, each
  arithmetic component being `Γ_N∖N(ℝ) ≅ ℝ/ℤ·h` (`h` the cusp width).
- stratum_anisotropic_empty: If `G` has no proper `F`-parabolic, there are no strata and `∂X̄_K = ∅`.
- stratum_GL3_poset: For `GL_{3,F}` there are three classes of proper parabolics (two maximal, one
  Borel); the Borel stratum lies in the closure of both maximal strata, which are open in `∂X̄_K`.
- stratum_not_disjoint_union_topologically: `∂X̄_K` is not the topological disjoint union of the
  strata: for `GL_3` the closure of a maximal stratum meets the Borel stratum, so the bijection
  `⊔ X^{P_i}_K → ∂X̄_K` is not a homeomorphism.

### ALS.2.6 Unipotent arithmetic lattices are cocompact

Prove LocallySymmetric.BorelSerre.unipotentLattice_cocompact. Let `N` be a unipotent group over
`F` (for example the unipotent radical `N_P` of a rational parabolic `P`), `L_N ⊂ N(𝔸_F^∞)` compact
open and `Γ_N = N(F) ∩ L_N`. Then `Γ_N` is a discrete cocompact subgroup of `N(F_∞)`, the map
`N(F_∞) → N(F)\N(𝔸_F)/L_N` induces a homeomorphism `Γ_N\N(F_∞) ≅ N(F)\N(𝔸_F)/L_N`, and `Γ_N\N(F_∞)`
is a compact nilmanifold of dimension `dim_ℚ Res_{F/ℚ} N`. If `N ⊂ G`, then for compact open
`K ⊂ G(𝔸^∞)` and `g ∈ G(𝔸^∞)` the same holds for the transported lattice `Γ_{N,g} = N(F) ∩ gKg⁻¹`,
the
case `L_N = N(𝔸^∞) ∩ gKg⁻¹`. The proof: unipotent groups have class number one, `N(𝔸^∞) = N(F)·L_N`,
so every adelic class has a representative with trivial finite component and the stated
map is a bijection; `N(F)` is discrete in `N(𝔸)`; and `N(F)\N(𝔸)` is compact, because for the
unipotent `ℚ`-group `Res_{F/ℚ} N` the quotient of the real points by the integral points is compact,
by induction along a central series with `G_a` quotients. The statement assumes `N` unipotent over
`F`; `L_N` compact open. ([NT16, §3.1, p. 43]; [HR15, §4.2.1, p. 25]; [PRR23, §4.3, Lemma 4.22(1)
and its proof, pp. 220–221])

*Needs:* AdelicAlgebraicGroups §3.4 (unipotent groups have class number one); AdelicAlgebraicGroups
§1.3 (rational points discrete) and §1.4 (restriction of scalars).

**Checks.**

- `N = G_a` over `ℚ`, `L_N = Ẑ`: `Γ_N = ℤ` and `Γ_N\N(ℝ)` is the circle `ℝ/ℤ`; over an imaginary
  quadratic `F` with `L_N = Ô_F` it is the torus `ℂ/𝒪_F`.
- Computation: for the unipotent radical of the upper Borel of `GL_3/ℚ` (the Heisenberg group) with
  integral level, `Γ_N` is the integral Heisenberg group and the quotient is a compact
  three-dimensional nilmanifold that is not a torus (its fundamental group is not abelian).
- Non-example: unipotence is needed; for the split torus `G_m` with `L = Ẑ^×`, `G_m(ℚ) ∩ Ẑ^× = {±1}`
  is not cocompact in `ℝ^×`.

### ALS.2.7 Arithmetic groups of decomposed parabolic levels

Prove LocallySymmetric.BorelSerre.parabolicArithmeticExtension. Let `P = M ⋉ N` be a rational
parabolic with a fixed Levi decomposition over `F`, `L ⊂ P(𝔸^∞)` compact open and decomposed,
`L = L_M ⋉ L_N` with `L_M = L ∩ M(𝔸^∞)` and `L_N = L ∩ N(𝔸^∞)` (the condition of [ACC+23, §2.1.2, p.
912]). Put `Γ_P = P(F) ∩ L`, `Γ_N = N(F) ∩ L_N` and `Γ_M = M(F) ∩ L_M`. Then
`1 → Γ_N → Γ_P → Γ_M → 1` is exact, with the second map induced by `P → M`, and it is split by
`Γ_M ⊂ Γ_P`. Surjectivity
uses the decomposition: an element `m ∈ Γ_M` lies in `L_M ⊂ L`, hence in `Γ_P`. For a component `g`
of a global stratum the same holds for the transported level `L_g = P(𝔸^∞) ∩ gKg⁻¹` whenever it is
decomposed, and `Γ_{M,g}` acts on `Γ_{N,g}` by conjugation; this is the monodromy of the fibration
of ALS.2.8. Without the decomposition, the image of `Γ_P` in
`M(F)` lies in `M(F) ∩ pr_M(L)`, which can be strictly larger than `M(F) ∩ L`, and the base and
fibre must then be computed after passing to a decomposed normal refinement. The statement assumes
`L` decomposed with respect to `P = M ⋉ N`. ([ACC+23, §2.1.2, p. 912]; [NT16, §3.1, pp. 43–44];
[HR15, §4.2.1, p. 25])

*Needs:* ALS.2.6; AdelicAlgebraicGroups §3.1 (rational parabolics
and Levi decompositions); AdelicAlgebraicGroups §3.4 (`Reduction.levelArithmetic`); Tau Ceti
`TauCeti.Cocharacter.leviDecompositionMulEquiv`.

**Checks.**

- `SL_2/ℚ`, `P = B`, `L = B(𝔸^∞) ∩ K(N)` with `N ≥ 3`: `Γ_N = (1 Nℤ; 0 1)`, `Γ_M` is trivial and
  `Γ_P = Γ_N`; at level `SL_2(Ẑ)` (not neat) `Γ_M = {±1}` and the extension is `ℤ ⋊ {±1}` with `−1`
  acting trivially on `ℤ`.
- Degenerate: for `P = G` (`N = 1`) the sequence is `1 → 1 → Γ → Γ → 1`.
- `GL_3/ℚ`, Borel, principal level `K(N)`: `Γ_N` is the level-`N` integral Heisenberg group and
  `Γ_M` is trivial for `N ≥ 3`, so the stratum component is a single Heisenberg nilmanifold.

### ALS.2.8 Boundary strata fibre over Levi quotients with nilmanifold fibres

Prove LocallySymmetric.BorelSerre.stratum_fibration. Let `P = M ⋉ N` be a rational parabolic.
Distinguish the `P`-space `Y^P_L = P(F)∖(e(P) × P(A^∞)/L)` from the induced `G`-stratum `X^P_K` of
ALS.2.5. The latter decomposes over representatives `g` of `P(A^∞)∖G(A^∞)/K`
as a disjoint union of `Y^P_{L_g}`, where `L_g = P(A^∞) ∩ gKg⁻¹`. For each good neat `L_g` decomposed as
`L_{M,g} ⋉ L_{N,g}`, the projection `e(P) ≅ N(ℝ) × X_M → X_M` induces a proper submersion
`Y^P_{L_g} → X^M_{L_{M,g}}`. Here `X_M` already has its own split centre removed. On an arithmetic
component the
fibre is the compact nilmanifold `Γ_{N,g}∖N(F_∞)` of ALS.2.6; its
monodromy is induced by the extension `1 → Γ_{N,g} → Γ_{P,g} → Γ_{M,g} → 1` of
ALS.2.7, and the submersion is the fibre bundle
`Γ_{P,g}∖e(P) → Γ_{M,g}∖X_M` associated with the horospherical product `e(P) ≅ N(F_∞) × X_M` of
ALS.2.1, on which `Γ_{N,g}` acts on the first factor only. The local
system `R^qπ_*V` has stalk `H^q(Γ_{N,g}, V)`. A global stratum with multiple `g` is not assigned one
untransported Levi base. Nondecomposed levels require a separate comparison after refinement. The
statement assumes: Each transported `P`-level `L_g` used in the fibration is good, neat and decomposed
with respect to `P = M ⋉ N`. ([NT16, §3.1, p. 43]; [HR15, §4.2.1, p. 25, before (4.2)])

*Needs:* ALS.2.5; ALS.2.1;
AlgebraicTopology, Stage 5; ALS.2.6;
ALS.2.7; AdelicAlgebraicGroups §3.4 (unipotent groups have class
number one).

**Checks.**

- For `SL_{2,ℚ}` and `P = B, M = T` is a torus with `X_M` a point, and each arithmetic component of the
  stratum `X^B_K` is a circle `Γ_N∖N(ℝ)`; the stratum is their disjoint union over the cusps.
- For `GL_3` and the Borel, fibres are Heisenberg nilmanifolds of dimension 3 over a point.
- For `GL_{3,ℚ}` and the maximal parabolic with Levi `GL_2 × GL_1`, at a good neat decomposed level each
  component of `Y^P` is a bundle of 2-tori `Γ_{N,g}∖N(ℝ)` over an open modular curve.

### ALS.2.9 The stratification filtration of `∂X̄_K` and its spectral sequence

Define LocallySymmetric.BorelSerre.stratFiltration. Let `B=∂X̄_K` at neat `K`. For `p≥0` set `Z_p=`union
of strata of relative parabolic `rank ≥p+1`, with `Z_0=B` and `Z_{r+1}=∅`, and `U_p=Z_p∖Z_{p+1}`. Put
`O_p=B∖Z_{p+1}, O_{−1}=∅, F_p=RΓ_c(O_p,V), A_p=RΓ_c(U_p,V)`. Open/closed localization gives
`F_{p−1}→F_p→A_p→F_{p−1}[1]`. Its exact couple has
`D_1^{p,q}=H^{p+q}_c(O_p,V), E_1^{p,q}=⊕_{rk P=p+1}H^{p+q}_c(X^P_K,V), i` of bidegree (1,−1), j of
bidegree (0,0), k of bidegree (−1,2). Thus `d_r`
has bidegree `(−r,r+1)`, and finite convergence gives `H^{p+q}(B,V)` with the filtration induced by the
`O_p`. Reindexing `(s,t)=(−p,q+2p)` preserves `s+t=p+q` and gives the usual differential bidegree (r,1−r).
Separately, for `G=Res_{F/ℚ}GL_N` with `F` totally real, the ordinary closed-cover/flag resolution of
Harder–Raghuram §4.1 gives `E_1^{p,q}=⊕_{[P],rk P=p+1}H^q(X^P_K,V)⇒H^{p+q}(B,V), d_1:(p,q)→(p+1,q)`.
Order maximal standard parabolics; its `d_1` is the alternating restriction to intersections, with
`sign (−1)^j` when the `j`-th vertex is deleted. Compactified strata and all arithmetic
translates/transported levels are included in this resolution; a single untransported `Γ_P` is not the
global stratum. The two sequences have different indexing and maps and are not identified by
relabelling their `E_1` pages. Both constructions are finite, natural in coefficients and compatible
with level maps and translations. The statement assumes: `K` neat; `V` a sheaf (local system) on `∂X̄_K`.
([NT16, §4, proof of Lemma 4.4, p. 56]; [NT16, §3.1, Lemma 3.10(1), p. 51]; [HR15, §4.1, pp. 23–24])

The API: LocallySymmetric.BorelSerre.stratFiltration — The closed filtration `Z_k` of `∂X̄_K` by
unions of strata of parabolic `rank ≥ k + 1`; LocallySymmetric.BorelSerre.stratSpectralSequence —
The spectral sequence `E_1^{p,q} = ⊕_{rk P = p+1} H^{p+q}_c(X^P_K, V) ⇒ H^{p+q}(∂X̄_K, V)`;
LocallySymmetric.BorelSerre.stratSpectralSequence_d1 — For the compact-support exact couple,
`d₁:E₁^{p,q}→E₁^{p−1,q+2}` is `j∘k`, the connecting map of `F_{p−1}→F_p→A_p` followed by its quotient to
`A_{p−1}`; it goes from higher-rank to lower-rank strata with total degree `+1`;
LocallySymmetric.BorelSerre.stratSpectralSequence_map — Natural in `V` and compatible with `π_{K′,K}`
and `r_g`; LocallySymmetric.BorelSerre.mayerVietorisSpectralSequence — For `Res_{F/ℚ}GL_N` with `F`
totally real the ordinary flag/closed-cover sequence has `E₁^{p,q}=⊕_{rk P=p+1}H^q(X^P_K,V), d₁` of
bidegree (1,0), with alternating restriction signs `(−1)^j` from deletion in the ordered
maximal-parabolic simplex. Its global strata include all transported levels.

*Needs:* ALS.2.5; ALS.2.3;
ALS.1.2; AlgebraicTopology, Stage 2; AlgebraicTopology, Stage 6.

**Checks.**

- stratSS_SL2: For `SL_{2,ℚ}` at neat level with `c` cusps, `E_1 = E_∞ = ⊕_{c} H^*(S^1, V)`, so
  `H⁰(∂X̄_K, ℤ) = ℤ^c` and `H¹(∂X̄_K, ℤ) = ℤ^c` for trivial `V`.
- stratSS_empty: For `G F`-anisotropic the filtration is empty and the spectral sequence is zero.
- stratSS_rank_one_collapse: If the `F`-rank of `G` modulo centre is 1, all proper parabolics are
  minimal and maximal, the strata are closed and open, and `H^*(∂X̄_K, V) = ⊕_P H^*(X^P_K, V)`.
- stratSS_E1_not_complex: For `rank ≥2` the compact-support `d₁` is a localization connecting map of
  degree (−1,2), while the ordinary `GL_N` flag `d₁` is an alternating restriction of degree (1,0). The
  ordinary degree-zero restriction from a connected maximal stratum to a nonempty incident Borel
  stratum sends 1 to 1. Neither `E₁` page alone is asserted to be the boundary cohomology.

### ALS.2.10 Compactifications and finite models of transported parabolic spaces

Prove LocallySymmetric.BorelSerre.stratumCompactification. Let `P` be a proper rational parabolic,
`K` good, and `L_g = P(𝔸^∞) ∩ gKg⁻¹` a transported level (good by *Conventions*), with
`Y^P_{L_g} = P(F)∖(e(P) × P(𝔸^∞)/L_g)` as in ALS.2.8. The closure
`ē(P)` of
`e(P)` in `X̄^G` is a manifold with corners extending `e(P)`, namely the bordification of `e(P)`
with its structure of space of type `S−Q` for `P`, and it is `P(F)`-stable. Put
`Ȳ^P_{L_g} = P(F)∖(ē(P) × P(𝔸^∞)/L_g)`. Then `Ȳ^P_{L_g}` is a compact smooth manifold with corners,
on each
arithmetic component the quotient `Γ_{P,g}\ē(P)`, with interior `Y^P_{L_g}` and boundary
`∂Ȳ^P_{L_g} = Ȳ^P_{L_g} ∖ Y^P_{L_g}`; the inclusion of the interior is a homotopy equivalence; and
the
natural map to `X̄_K` carries it onto the closure of the corresponding piece of the stratum `X^P_K`.
Rounding its corners as in ALS.5a.1 gives a compact smooth manifold
with boundary of dimension `d_P = dim e(P)`, which by the smooth triangulation target of ALS.2.4
has a finite triangulation with the boundary a subcomplex. Consequently, for a commutative ring `R` and `V` finite projective over `R` with its
`R[P(F) × (L_g)_S]`-action (through `l ↦ g_S⁻¹ l g_S` on the `K_S`-factor),
`RΓ(Y^P_{L_g}, V) ≅ RΓ(Ȳ^P_{L_g}, V̄)` and `RΓ_c(Y^P_{L_g}, V) ≅ RΓ(Ȳ^P_{L_g}, j_!V)` are perfect in
`D(R)`, compatibly
with transported level maps and translations, and the orientation local system `o_{P,g}` of
`Y^P_{L_g}` extends over `Ȳ^P_{L_g}`. The statement assumes: `K` good; `R` commutative; `V` finite
projective over `R`. ([BS73, §7, Proposition 7.3(i),
p. 464]; [BS73, §9, Theorem 9.3, pp. 475–476, applied to the group `P`, and Proposition 9.4,
p. 476]; [BS73, §9.5, p. 477]; [DH73, Theorem and Definition 6.2, pp. 487–489])

*Needs:* ALS.2.8; ALS.2.2;
ALS.2.3; ALS.2.4;
ALS.5a.1; ALS.1.6;
ALS.F.2;
ALS.F.3; ALS.2.4 (smooth triangulation of compact manifolds with boundary).

**Checks.**

- For `SL_{2,ℚ}` and `P = B`, `ē(B) = e(B)` since `B` is minimal, so `Ȳ^B = Y^B` is a disjoint union of
  circles with empty boundary, and `RΓ_c = RΓ` on it.
- For `GL_{3,ℚ}` and a maximal parabolic with Levi `GL_2 × GL_1`, `d_P = 5 − 1 = 4`; `Ȳ^P` is the
  bundle of 2-tori over the Borel–Serre compactified modular curve, and its boundary, over the
  boundary circles, consists of three-dimensional nilmanifolds, the Borel faces in its closure.
- Non-example: the open piece is not compact: for the same `P`, `Y^P` fibres over a noncompact
  modular curve, and `H⁰_c(Y^P, ℚ) = 0` while `H⁰(Y^P, ℚ) ≠ 0`.

### Examples

- `SL_{2,ℚ}`: the boundary of `X̄^G` is `⊔_{c ∈ ℙ¹(ℚ)} e(P_c)` with each face a line; at a neat
  level each cusp becomes a circle `Γ_N\N(ℝ) ≅ ℝ/hℤ`, and `H⁰(∂X̄_K, ℤ) = H¹(∂X̄_K, ℤ) = ℤ^c`.
- `GL_{3,ℚ}`: three classes of proper parabolics; the Borel stratum lies in the closure of both
  maximal strata, its components are Heisenberg nilmanifolds of dimension `3` over a point, and
  `dim e(B) = 5 − 2 = 3`.
- Anisotropic groups (compact quaternionic quotients): no boundary, `X̄_K = X_K`.
- Compactified parabolic spaces: for `GL_{3,ℚ}` and a maximal parabolic, `Ȳ^P` is a bundle of
  2-tori over a compactified modular curve, of dimension `4`.

### Dependencies

Layers ALS.F and ALS.0; ALS.1.1–1.6 (used by the cohomological clause of ALS.2.4, ALS.2.9 and
ALS.2.10) and ALS.5a.1 (used by the geometric clause of ALS.2.4 and ALS.2.10), in the build order
of *How to read the build*; AdelicAlgebraicGroups §§1.3,
1.4, 3.1, 3.2, 3.4, 3.6; ReductiveGroupsPartII RG2.4.4; AlgebraicTopology, Stages 2, 4, 5 and 6;
GeometricTopology, Layer 11; Mathlib (`ModelWithCorners`, `ContractibleSpace`); Tau Ceti
(`TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.leviDecompositionMulEquiv`).

## Layer ALS.3: Finite-level Hecke actions and correspondences

This layer puts the Hecke action on the Betti complexes. Hecke rings act on invariants and derived
invariants of any Hecke pair; for the arithmetic pairs this gives an endomorphism action on
`RΓ(X_K, V)` and, through the derived Hecke-invariants functor, a strict object over the Hecke
algebra
together with the residual finite-group action. The layer then identifies the operators with
correspondences, constructs traces and the Mackey formula, proves composition and compatibility with
supports, boundary, coefficients and cup products, compares the topological and discrete set-ups,
defines the derived Hecke algebra, twists by characters and splits off old forms.

### ALS.3.1 Hecke rings acting on invariants and on derived invariants

Define LocallySymmetric.Hecke.invariantsModule. Let `Δ` be a group, or a submonoid of an ambient
group `G`, and `U ⊂ Δ` a subgroup of `G` with `(Δ, U)` a Hecke pair (IsHeckeTriple `Δ U U`), and
`𝕋(Δ, U) = 𝕋 Δ U ℤ` the Hecke ring (Mathlib's HeckeRing with Tau Ceti's convolution ring structure).
For a
`ℤ[Δ]`-module `M` define the `𝕋(Δ, U)`-module structure on `M^U` by `[UαU]·m = Σ_i α_i m` where
`UαU = ⊔_i α_iU`; equivalently `[UαU]` acts as `M^U → M^{U∩αUα⁻¹} → M^U, m ↦ α·m` followed by the
trace
`tr_{U/U∩αUα⁻¹}`. This defines a left exact functor `Γ_U : Mod(ℤ[Δ]) → Mod(𝕋(Δ, U))` whose composite
with the forgetful functor is `U`-invariants, and its right derived functor
`RΓ_U : D⁺(ℤ[Δ]) → D⁺(𝕋(Δ, U))` lifts `RΓ(U, −)`. For a locally profinite `G` and compact open
`U, 𝕋(G, U)` is the ring `H(G, U) = H(G, U; ℤ) = Fun_G(G/U × G/U, ℤ)` of
SmoothRepresentationsOfLocalGroups SR.1.2's permutation form,
with basis the double cosets `[UgU]` and no measure; over `R, H(G, U) ⊗ R = H(G, U; R)`. When `U` has
invertible pro-order in `R, H(G, U; R)` is also the convolution algebra of `U`-biinvariant `R`-valued
functions for the `R`-valued Haar measure with `μ(U) = 1, [UgU] ↦ 1_{UgU}`. These comparisons, the
action on `V^U` and the traces between levels are SR.1.2 (`permutation-hecke-algebra`,
`hecke-ring-comparison`) for locally profinite `G`; SR.1.2 lets `[UgU]` act on the right, which is
the left action of `[Ug⁻¹U]` here. This target keeps the abstract Hecke pairs, including monoids,
and the derived functor. The statement assumes: `(Δ, U)` a Hecke pair: `U` and `αUα⁻¹`
commensurable for `α ∈ Δ`; in the monoid case `Δ` is a submonoid of an ambient group `G` and `U` is
contained in `Δ` (as Mathlib's IsHeckeTriple requires). ([NT16, §2.2.1, Lemma 2.3, p. 12]; [NT16,
§2.2.1, (2.5), p. 13])

The API: LocallySymmetric.Hecke.invariantsModule — `M^U` is a module over `𝕋(Δ, U)` via
`[UαU]·m = Σ α_i m`; LocallySymmetric.Hecke.smul_eq_trace — `[UαU]·m = tr_{U/U∩αUα⁻¹}(α·m)` for
`m ∈ M^U`;
LocallySymmetric.Hecke.invariantsFunctor — `Γ_U : Mod(ℤ[Δ])` ⥤ `Mod(𝕋(Δ, U))`, left exact, with `Γ_U` ⋙
forget `= U`-invariants; LocallySymmetric.Hecke.derivedInvariants — `RΓ_U : D⁺(ℤ[Δ]) → D⁺(𝕋(Δ, U))`
with forget `∘ RΓ_U ≅ RΓ(U, −)`; LocallySymmetric.Hecke.one_smul — [U1U]`·m = m`;
LocallySymmetric.Hecke.eq_heckeAlgebra — For `G` locally profinite and `U` compact open,
`𝕋(G, U) ⊗ R ≅ H(G, U; R)` in the permutation form, and with the convolution algebra for `μ(U) = 1`
when `U` has
invertible pro-order in `R, [UαU] ↦ 1_{UαU}`; this is SmoothRepresentationsOfLocalGroups SR.1.2's
*hecke-ring-comparison* for `HeckeAlgebraLevel`, cited and not reproved.

Tau Ceti has the coinvariant form of the same sum, `HeckeCoset.heckeSum` with
`HeckeCoset.heckeSum_eq_sum_of_rightCosets` and `HeckeCoset.heckeSum_comp_of_mem` (Shimura
§3.4): for a right-coset decomposition `Γ₁δΓ₂ = ⊔ Γ₁a_v` and a `Γ₁`-invariant map, `Σ_v q ∘ ρ(a_v)`
is independent of the representatives and `Γ₂`-invariant. The invariant operator here is its
transpose under `(V^∨)^U = (V_U)^∨` for finite free `V`, with `g` replaced by `g⁻¹`; an
implementation reuses it. The invariant operator preserves `U`-invariants and is independent
of the representatives, with the degree formula on the trivial module given below.

*Needs:* Mathlib `IsHeckeTriple`; Mathlib `HeckeCoset`; Mathlib `HeckeRing`; Tau Ceti
`HeckeCosetModule.instRingHeckeRing`; Tau Ceti `HeckeCoset.degree_eq_relIndex`; Tau Ceti
`LeftCosetModule.deg`, `LeftCosetModule.degree_smul_eq_deg` (degree action on coefficient sums,
used on the trivial module in hecke_degree_eq_index); Tau Ceti `HeckeCoset.heckeSum`;
SmoothRepresentationsOfLocalGroups SR.1.1 (Haar measures and convolution Hecke algebras) and SR.1.2
(`permutation-hecke-algebra`, `hecke-ring-comparison`); Mathlib `DerivedCategory`.

**Checks.**

- hecke_one_smul: `[U1U]` acts as the identity on `M^U`: any representative set of `U1U/U` is a
  single element of `U`, which fixes `M^U`; and for `Δ = U` the functor `Γ_U` is ordinary invariants.
  The singleton `{1}` represents `U1U/U`.
- hecke_Tp_permutation: For `Δ = GL_2(ℚ_p), U = GL_2(Z_p)` and `M = ℤ[Δ/U]` (formal sums of lattices
  in `ℚ_p²`), `T_p = [U diag(p, 1) U]` sends the `U`-fixed element `[Z_p²]` to `Σ [L′]` over the `p + 1`
  lattices `L′ ⊂ Z_p²` with `Z_p²/L′ ≅ F_p` (the cosets `α_iU` of `U diag(p,1) U`).
- hecke_degree_eq_index: On the trivial module `M = ℤ, [UαU]` acts by the degree
  `#(UαU/U) = [U : U ∩ αUα⁻¹]` (Tau Ceti's HeckeCoset.degree_eq_relIndex).
- hecke_not_pointwise: The action is not `α·m` for a single representative: on `M = ℤ[Δ/U]` with
  `Δ = GL_2(ℚ_p)`, applying only `diag(p, 1)` gives one lattice, not the sum of `p + 1`.

### ALS.3.2 Hecke rings of normal subgroups and of product pairs

Prove LocallySymmetric.Hecke.heckeRing_normal and LocallySymmetric.Hecke.heckeRing_prod. (i) If
`U` is a normal subgroup of a group `Δ` (so `(Δ, U)` is a Hecke pair with every double coset a
single coset), then `[UgU] ↦ gU` is a ring isomorphism `𝕋(Δ, U) ≅ ℤ[Δ/U]` onto the group ring of the
quotient group: the structure constants of Tau Ceti's convolution product are
`#{(i, j) : γ ∈ α_i β_j U}`, which for single cosets is `1` exactly when `γU = αβU`. (ii) For Hecke
pairs `(Δ₁, U₁)` and
`(Δ₂, U₂)`, `[U₁gU₁] ⊗ [U₂hU₂] ↦ [(U₁ × U₂)(g, h)(U₁ × U₂)]` is a ring isomorphism
`𝕋(Δ₁, U₁) ⊗_ℤ 𝕋(Δ₂, U₂) ≅ 𝕋(Δ₁ × Δ₂, U₁ × U₂)`, since double cosets, coset decompositions and
structure constants
of a product pair are products. In particular, for `K = K_S K^S`, a normal open `K′_S ⊂ K_S` and
`Δ = G^S × K_S`, `U = K^S × K′_S`, one gets `𝕋(Δ, U) ≅ H(G^S, K^S) ⊗ ℤ[K_S/K′_S]`, the ring through
which the relative complexes of ALS.1.2 carry Hecke operators and the residual
finite-group action at once; for `K′_S = K_S` this is the identification
`H(G^S × K_S, K) ≅ H(G^S, K^S)` used by Newton–Thorne. ([NT16, §2.2.1, Lemma 2.3 and (2.5), pp.
12–13]; [NT16, §3.1, p. 43])

*Needs:* ALS.3.1; Mathlib `IsHeckeTriple`, `HeckeCoset`, `HeckeRing`;
Tau Ceti `HeckeCosetModule.instRingHeckeRing` and
`HeckeCosetModule.single_mul_single_of_mem_normalizer` (the basis multiplication behind the
normal-quotient ring equivalence).

**Checks.**

- Degenerate: `Δ = U` gives `𝕋(U, U) = ℤ` with unit `[U]`.
- Computation: for `Δ = ℤ/4` and `U = 2ℤ/4`, `𝕋(Δ, U) ≅ ℤ[ℤ/2] = ℤ[t]/(t² − 1)`, with `t = [1 + U]`.
- Non-example: normality is needed for (i). For `Δ = S₃` and `U = ⟨(1 2)⟩` there are two double
  cosets, `U` and `U(1 3)U` of size `4` and degree `2`, so `𝕋(S₃, U)` has rank `2` and is not
  `ℤ[S₃/U]` (which is not even a ring, `U` not being normal, and has rank `3` as a module).

### ALS.3.3 The Hecke action on `RΓ(X_K, V)` in the derived category

Define LocallySymmetric.heckeObject. Let `S` be finite, `K=K_SK^S` compact open, `R` commutative and `V`
an `R`-module with commuting `G(F)` and `K_S` actions. Derived equivariant invariant sections give a
ring homomorphism `T_K:H(G^S,K^S)⊗R→End_{D(R)}(RΓ(X_K,V))`, and analogous homomorphisms for compact
support, compactification and boundary. All coefficient/support maps intertwine these endomorphisms
in `D(R)`. The derived Hecke-invariants functor of ALS.3.1 also
provides a strict lift to `D⁺(H⊗R)`, the Hecke complex of ALS.3.4; its comparison
with the geometric equivariant model uses the acyclicity of the composite section functor, not just
equality on cohomology. For `K′⊲K` with `K′^S=K^S` the relative object lives in `D(R[K/K′])`, and `H⊗R` acts
through `End_{D(R[K/K′])}`; applying derived `K/K′` invariants recovers `T_K`. This relative endomorphism
action is the ACC+ (2.1.5)–(2.1.6) conclusion. A strict lift to `D(H⊗R[K/K′])` is the relative Hecke
complex of ALS.3.4, built from the Hecke pair `(G^S × K_S, K^S × K′_S)`; it is not a
consequence of the endomorphism action alone. For monoid Hecke actions with compatible
coefficient actions, each at-`S` correspondence uses the coefficient morphism of
ALS.3.5, with its stated direction and intertwining condition.
The coefficient morphism is an isomorphism under the invertibility hypothesis of
ALS.1.8. The statement assumes: `K = K_SK^S` compact open;
`V` an `R[G(F) × K_S]`-module. ([ACC+23, §2.1.2, (2.1.3), p. 911]; [ACC+23, §2.1.2, p.
911]; [NT16, §2.3, Proposition 2.18, p. 24]; [CN23, §2.1.2, Proposition 2.1.3, Lemma 2.1.5 and
footnote 5, pp. 10–11])

The API: LocallySymmetric.heckeObject — The object `RΓ(X_K,V)` with its ring homomorphism
`H⊗R→End_D(R)`; its strict lift to `D(H⊗R)` is the Hecke complex of ALS.3.4;
LocallySymmetric.heckeAction — `T_K : H(G^S, K^S) ⊗ R →+* End_{D(R)}(RΓ(X_K, V))`;
LocallySymmetric.heckeAction_c — The same for `RΓ_c(X_K, V), RΓ(X̄_K, V)` and `RΓ(∂X̄_K, V)`;
LocallySymmetric.heckeActionRel — `H⊗R→End_{D(R[K/K′])}(RΓ_{K/K′}(X_{K′},V))`, recovering
`heckeAction` after `RΓ(K/K′,−)`; the strict `D(H⊗R[K/K′])` lift is the relative Hecke complex, not a
consequence of this homomorphism alone; LocallySymmetric.heckeAction_one — `T_K([K]) = id`;
LocallySymmetric.heckeAction_natural — For a coefficient-linear `V→W`, the induced morphism in `D(R)`
intertwines `T_K(t)` for every `t`; it is a morphism of Hecke complexes (heckeComplex.map).

*Needs:* ALS.3.1; ALS.1.2;
ALS.2.2; ALS.F.4 (discrete equivariant sheaf cohomology
`H^n(X,Γ;F)`); ALS.F.3 (derived functors of sheaves);
ALS.3.2.

**Checks.**

- heckeAction_one: `T_K([K])` is the identity of `RΓ(X_K, V)`.
- heckeAction_H0: For `V = R`, on `H⁰(X_K, R) = Fun(G(F)∖G(A^∞)/K, R)` the operator `[KgK]` is
  `f ↦ (x ↦ Σ_i f(x g_i))` with `KgK = ⊔ g_iK`.
- heckeAction_modularCurve_Tp: For `GL_{2,ℚ}, K = K_1(N), p ∤ N` and `V = ℂ, T_K([K diag(p,1) K])` on
  `H¹(X_K, ℂ)` agrees, under the Eichler–Shimura isomorphism, with the classical `T_p` on weight-two
  forms (normalised by the right coset decomposition).
- heckeAction_not_on_cochains: The geometric formulas give operators up to chain homotopy on a
  chosen singular cochain complex. A ring homomorphism to `End_D(R)` does not by itself specify a
  strict `D(H⊗R)` lift; the latter needs the equivariant-derived-invariants construction and its
  comparison.

### ALS.3.4 The Hecke complex: a strict object over the Hecke algebra

Define LocallySymmetric.heckeComplex. Let `S` be finite, `K = K_S K^S` compact open, `K′ ⊂ K` a
normal open subgroup with `K′^S = K^S`, `R` commutative and `V` an `R`-module with commuting `G(F)`
and `K_S` actions. Put `Δ = G^S × K_S`, `U = K^S × K′_S`, `L = K^S × K_S` and
`Q = L/U = K/K′`. Use the discrete-group specialization `Sh_Δ(Z,R)` of ALS.F.4,
where `Z = 𝔛_G = G(F)∖(X^G × G(𝔸^∞)^δ)` with the
topology induced by the discrete finite-adelic factor, or its Borel–Serre compactification.
The whole space need not be discrete. The section functor
`Γ_Z : Sh_Δ(Z,R) → Mod(R[Δ])` is right adjoint to exact equivariant constant-sheaf
pullback from a point and therefore preserves injectives. Take a bounded-below injective
resolution `I^•` of the equivariant coefficient sheaf of ALS.1.1
in this category, and put `M_V = Γ_Z(I^•)`. For the supported and boundary variants,
resolve `j_!V_𝔛` and `i_*i^*V̄_𝔛` separately on the compactification; exactness of `j_!`
does not assert that it preserves injectives. The sheaf functors and comparisons are those of
ALS.F.3, over every commutative ring. Define

```text
heckeComplex(K, K′, V) = RΓ_U(M_V) ∈ D⁺(𝕋(Δ, U) ⊗ R) = D⁺(H(G^S, K^S) ⊗ R[K/K′]),
```

with `RΓ_U` the derived Hecke-invariants functor of ALS.3.1 and the
ring identification of ALS.3.2. Since `M_V` is a bounded-below complex
of injective `R[Δ]`-modules, the complex `Γ_U(M_V)` computes both this object and the right
derived composite `R(Γ_U ∘ Γ_Z)`. Each term carries the Hecke action by double-coset sums;
the differentials are Hecke linear, giving a strict complex of Hecke modules. This uses
`Γ_U`-acyclicity of injective objects in its **source** `Mod(R[Δ])`, with no injectivity
assertion in its full target `Mod(𝕋(Δ,U) ⊗ R)`.

For neat `K′`, `U` acts freely with the quotient-cover property of ALS.0.9 and ALS.2.3.
Restriction `Sh_Δ(Z,R) → Sh_L(Z,R)` preserves injectives because its left adjoint is exact
sheaf induction. Free descent along `f : Z → Z/U` is an exact equivalence
`Sh_L(Z,R) ≃ Sh_Q(Z/U,R)` and preserves injectives. Equivariant quotient sections
`Γ_{Z/U} : Sh_Q(Z/U,R) → Mod(R[Q])` also preserve injectives, by their exact constant-sheaf
left adjoint. Under restriction of Hecke modules to `R[Q]`, the termwise natural
identification is

```text
Γ_U Γ_Z(I^•)|_{R[Q]} ≅ Γ_{Z/U}(f_*^U Res_Δ^L I^•).
```

Consequently its derived image is the `Q`-equivariant quotient-cohomology object
`RΓ_{K/K′}(X_{K′},V)` of ALS.1.2, with the same deck action. Forgetting `Q` gives ordinary
quotient cohomology; the compactified ordinary model is identified with the interior by
ALS.2.2, and descent commutes with the open and closed coefficient constructions for the
two other variants.

For non-neat `K′`, choose `K₀ ⊂ K′` neat and normal in `K` and put `E = K/K₀`,
`N = K′/K₀`. Restrict the same resolution to `Sh_L(Z,R)` and descend freely by `K₀` to
`Sh_E(Z/K₀,R)`. Equivariant sections give a bounded-below complex of injective `R[E]`-modules
representing the neat-level complex `C_?(K₀)` of ALS.1.3. The functor
`(−)^N : Mod(R[E]) → Mod(R[Q])`
preserves injectives as the right adjoint of exact inflation; restriction to `N` also
preserves injectives, by exact group-module induction. Thus the same termwise complex
after restricting its Hecke action to `R[Q]` computes `RΓ(N,C_?(K₀))`, the relative
groupoid cohomology of ALS.1.2–1.3. The refinement comparisons retain `Q` and satisfy the
cocycle identity; free descent directly by `U` is used only at neat `K′`.
This strict Hecke object is what localization, derived tensor products and patching consume.
([NT16, §2.3, Lemmas 2.13–2.17, Proposition 2.18 and diagram (2.9), pp. 22–24];
[NT16, §2.2.1, Lemma 2.3, p. 12]; [ACC+23, §2.1.2, (2.1.5)–(2.1.6), pp. 911–912])

The API: LocallySymmetric.heckeComplex — the object of `D⁺(H(G^S, K^S) ⊗ R[K/K′])` above, with
compactly supported and boundary variants heckeComplex_c and `heckeComplex_∂`;
LocallySymmetric.heckeComplex.forget — its image in `D(R[K/K′])` is `RΓ_{K/K′}(X_{K′}, V)`, and in
`D(R)` is `RΓ(X_{K′}, V)`; LocallySymmetric.heckeComplex.endo — the endomorphisms induced by
`H(G^S, K^S) ⊗ R` are those of `heckeActionRel` in ALS.3.3;
LocallySymmetric.heckeComplex.invariants — `RΓ(K/K′, −)` applied after restricting to
`H(G^S, K^S) ⊗ R` gives the Hecke complex at level `K`; LocallySymmetric.heckeComplex.map — an
`R[G(F) × K_S]`-linear `V → W` induces a morphism in `D⁺(H(G^S, K^S) ⊗ R[K/K′])`, functorially;
LocallySymmetric.heckeComplex.triangle — the triangle `C_c → C → C_∂ → C_c[1]` lifts to an exact
triangle of Hecke complexes.

*Needs:* ALS.3.1; ALS.3.2;
ALS.1.1; ALS.1.2;
ALS.1.3; ALS.F.4 (discrete equivariant sheaves, enough
injectives and derived invariant sections); Mathlib `DerivedCategory`.
The injective-preservation arguments use Mathlib `CategoryTheory.Adjunction.map_injective`;
ALS.F.3 supplies the sheaf functors and their coefficient-domain
hypotheses; ALS.F.4 supplies their discrete-group
equivariant category.

**Checks.**

- heckeComplex_H0: for `V = R` and `K′ = K`, `H⁰` of the Hecke complex is `Fun(G(F)\G(𝔸^∞)/K, R)`
  with `[KgK]` acting by `f ↦ (x ↦ Σ_i f(x g_i))` for `KgK = ⊔ g_i K`, a module over
  `H(G^S, K^S) ⊗ R`, not just an abelian group with endomorphisms.
- heckeComplex_trivialGroup (degenerate): for `G` trivial the object is `R` in degree `0` with
  `H(1, 1) ⊗ R[1] = R` acting by multiplication.
- heckeComplex_forget (compatibility): forgetting `heckeComplex(K, K′, V)` to `D(R)` recovers
  `RΓ(X_{K′}, V)` of ALS.1.2, which is `RΓ(X_K, V)` when `K′ = K`, and the
  endomorphisms recover `heckeActionRel` of ALS.3.3.
- heckeComplex_not_underived (non-example): at `K = SL_2(Ẑ)` for `SL_{2,ℚ}` with `R = ℤ`, plain
  Hecke invariants of `H⁰` miss `H²(SL_2(ℤ), ℤ) = ℤ/12`; the derived functor is needed.
- heckeInvariants_S3_obstruction (non-example): for `k = 𝔽₃`, `Δ = S₃` and `U = ⟨(0 1)⟩`,
  the Hecke algebra is `H = k[ε]/(ε²)` with `ε = T + 1`, where `T` is the nonidentity
  double coset. The regular `k[Δ]`-module is injective, by its finite-group Frobenius
  pairing. On its three-dimensional `U`-invariants, `ε` is the all-ones matrix: its image
  is the constant line and its kernel is the plane of coordinate sum zero. The vector
  `(1,2,0)` is in the kernel outside the image. The
  `H`-linear map `(ε) → (k[Δ])^U` sending `ε` to this vector cannot extend to `H`, since
  an extension would send it to `ε` times the image of `1`. These invariants are therefore
  not injective over `H`, although restriction to the coefficient field is injective.

### ALS.3.5 Hecke operators as correspondences: representative independence

Prove LocallySymmetric.heckeAction_eq_correspondence. For `g ∈ G^S` put `K_g = K ∩ gKg⁻¹` and let
`p_1 = π_{K_g,K} : X_{K_g} → X_K` and `p_2 = π_{g⁻¹K_gg,K} ∘ r_g : X_{K_g} → X_{g⁻¹K_gg} → X_K`
(AdelicAlgebraicGroups §4.5 (Hecke correspondences)). For neat `K`, the image of `[KgK]` under `T_K` equals
`θ(g) = p_{1*} ∘ (p_1^*V ≅ p_2^*V) ∘ p_2^*`, the composite
`RΓ(X_K, V) → RΓ(X_{K_g}, p_2^*V) ≅ RΓ(X_{K_g}, p_1^*V) → RΓ(X_K, V)` with `p_{1*}` the transfer of
the finite covering `p_1`
(AlgebraicTopology, Stage 5, item 3), which ALS.3.6 identifies with the trace of
derived invariants (RΓ.trace_eq_coveringTransfer). It depends only on the double coset KgK. On
singular cochains
(ALS.1.4) and for `KgK = ⊔_i g_iK` it is given by summing the translates
by the `g_i` of the pulled-back cochain.

For an at-`S` correspondence use the same geometric maps for `g ∈ G(A^∞)`, together with an
`R`-linear coefficient morphism `A_g : V → V` commuting with `G(F)` and satisfying
`A_g ρ_{K_S}(g_S⁻¹ k_S g_S) = ρ_{K_S}(k_S) A_g` for every `k ∈ K_g`. This is precisely a morphism
`c_g : p_2^*V → p_1^*V` on `X_{K_g}`, and the operator is `p_{1*} ∘ c_g ∘ p_2^*`.
A compatible action of a submonoid `Δ_S ⊂ G_S` containing `K_S` and `g_S` supplies `A_g = ρ(g_S)`;
invertibility is unnecessary for this operator. Coherent maps for all elements, with
`A_1 = id, A_{hg} = A_h A_g` and `A_k = ρ(k_S)` for `k ∈ K`, give representative independence
and the monoid Hecke action of ALS.3.1. An equivariant coefficient isomorphism recovers the
isomorphism version of ALS.1.8; inverse-translation identities apply only in that subcase.
The same coefficient morphism and trace define the compact-support, compactified, boundary and
deck-equivariant operators. For the last variant retain the deck intertwining of ALS.1.8;
endomorphisms over a fixed deck group are asserted only when that condition holds. Generic
monoid and Hecke carriers are those of SmoothRepresentationsOfLocalGroups SR.1.2–SR.1.4;
the coefficient transport on arithmetic local systems is owned here.
The statement assumes: `K` neat; `g ∈ G^S` for the original formula; at `S`, the explicitly stated
coefficient morphism, and a compatible monoid action for the monoid Hecke algebra comparison.
([NT16, §2.3, after Proposition 2.18, p. 24]; [NT16, §2.3, Lemma 2.19, p. 24])

*Needs:* ALS.3.3; AlgebraicTopology, Stage 5 (transfer along finite
covers); ALS.1.8; ALS.1.4; AdelicAlgebraicGroups
§4.5 (Hecke correspondences and their degrees).

**Checks.**

- `deg p_1 = [K : K_g] = #(KgK/K)` at neat level (AdelicAlgebraicGroups §4.5 (degree of a Hecke
  correspondence)).
- For `g ∈ K, θ(g) = id`, using `A_g = ρ(g_S)` in the coefficient identification.
- For the `G_m` coefficient line over `ℤ_p` of ALS.1.8, the `p`-correspondence has degree one and
  coefficient map multiplication by `p`. Modulo `p` its Hecke operator is zero, although the
  underlying geometric translation is a homeomorphism.
- For `GL_2, p ∤` level and `g = diag(p, 1)`, both `p_1` and `p_2` have degree `p + 1`, since
  conjugation by `g`
  carries `K_g` onto a subgroup of `g⁻¹Kg` of the same index.

### ALS.3.6 Trace along level maps and the groupoid correction

Define LocallySymmetric.RΓ.trace. For `K′ ⊂ K` compact open define the trace
`π_{K′,K*} : RΓ(X_{K′}, V) → RΓ(X_K, V)` as the corestriction (transfer) `RΓ(K′, M) → RΓ(K, M)`
applied to `M = RΓ(𝔛_G, V_𝔛)`,
the derived version of `m ↦ Σ_{k ∈ K/K′} k·m`. At neat level it is the trace of the finite covering
`π_{K′,K}` (AlgebraicTopology, Stage 5, item 3, transfer; adjunction `π_! = π_*, π^! = π^*`), and the
same construction gives traces on `RΓ_c` and `RΓ(∂X̄)`. Then `π_* ∘ π^* = [K : K′]` on `RΓ(X_K, V)` for
every `K′ ⊂ K`, and `π^* ∘ π_* = Σ_{k ∈ K/K′} r_k^*` for `K′` normal in `K`; the general double-coset
formula is ALS.3.7. At non-neat level the trace is the corestriction of group
cohomology of the `Γ_i` (ALS.1.5), Tau Ceti's
`TauCeti.groupCohomology.corestriction` with `cor ∘ res = [K : K′]` its
`TauCeti.groupCohomology.map_subtype_id_comp_corestriction`, and on cohomology of the coarse
quotients the degrees acquire the stabilizer weights of AdelicAlgebraicGroups §4.4 (fibre mass of a
level map with stabilizers): the fibre of `π` over `x` has `Σ_{y↦x} 1/|Γ_y| = [K : K′]/|Γ_x|` (up to the
central correction). The statement assumes: `K′ ⊂ K` compact open. ([NT16, §2.3, after Proposition
2.18, p. 24]; [ACC+23, §2.1.2, (2.1.6), p. 912])

The API: LocallySymmetric.RΓ.trace — `π_{K′,K*} : RΓ(X_{K′}, V) → RΓ(X_K, V)`, the corestriction /
covering trace; LocallySymmetric.RΓ.trace_pullback — `π_* ∘ π^* = [K : K′]·id`;
LocallySymmetric.RΓ.pullback_trace — For `K′ ⊲ K, π^* ∘ π_* = Σ_{k ∈ K/K′} r_k^*`;
LocallySymmetric.RΓ.trace_comp — `π_{K′,K*} ∘ π_{K″,K′*} = π_{K″,K*}`;
LocallySymmetric.RΓ.trace_eq_coveringTransfer — At neat level the trace is the transfer of the
finite covering `X_{K′} → X_K` (AlgebraicTopology, Stage 5, item 3); LocallySymmetric.RΓ.trace_c —
Traces on `RΓ_c` and `RΓ(∂X̄)`, compatible with forget-supports and restriction to the boundary.

*Needs:* ALS.1.8; ALS.1.5; AlgebraicTopology,
Stage 5; AdelicAlgebraicGroups §4.4 (fibre mass of a level map with stabilizers); Tau Ceti
`TauCeti.card_fiber_orbitOfCosetTranslate_mul_cardStabilizerOnOrbit`; Tau Ceti
`TauCeti.groupCohomology.corestriction`; Mathlib `Subgroup.relIndex`;
ALS.F.3 (derived pushforward and pullback); ALS.1.2.

**Checks.**

- trace_pullback_H0: On `H⁰(X_K, R) = Fun(π_0(X_K), R), π_*π^*` is multiplication by `[K : K′]`.
- trace_self: For `K′ = K, π_* = id`.
- trace_eq_transfer: At neat level and in degree `0, π_*` sends `f` to `x ↦ Σ_{y ∈ π⁻¹(x)} f(y)`, the
  covering transfer of AlgebraicTopology, Stage 5.
- trace_coarse_fails: On coarse quotients the naive degree is wrong: for `SL_2(ℤ) ⊃ Γ(2)·{±1}` with
  quotient `S_3`, the fibre of `ℍ/Γ(2) → ℍ/SL_2(ℤ)` over the image of `i` has 3 points, not
  `[PSL_2(ℤ) : Γ̄(2)] = 6`; the weighted count `Σ 1/|Γ_y| = 6/|Γ̄_i| = 3` is the correct one.

### ALS.3.7 The Mackey formula for restriction and trace

Prove LocallySymmetric.RΓ.mackey. Let `K` be compact open, `K₀ ⊂ K` a neat open normal subgroup
and `H₁, H₂` open subgroups with `K₀ ⊂ H_i ⊂ K`. For `x ∈ K`, translation `r_x^*` identifies
`RΓ(X_{H₁}, V)` with `RΓ(X_{xH₁x⁻¹}, V)` (ALS.1.8). Then, as maps
`RΓ(X_{H₁}, V) → RΓ(X_{H₂}, V)` in `D(R)`,

```text
π^*_{H₂,K} ∘ π_{H₁,K *} = Σ_{x ∈ H₂\K/H₁} π_{H₂ ∩ xH₁x⁻¹, H₂ *} ∘ π^*_{H₂ ∩ xH₁x⁻¹, xH₁x⁻¹} ∘ r_x^*,
```

the sum running over a set of double-coset representatives and independent of that choice. Since all
objects are derived invariants of the finite group `Q = K/K₀` acting on the single object `C(K₀)` of
ALS.1.2, the formula is the Mackey double-coset formula for restriction and
corestriction of the finite group `Q`, applied to that complex; at neat `K` it is the double-coset
formula for transfer along the nonregular finite covering `X_{H₁} → X_K` pulled back to `X_{H₂}`.
The same formula holds for `RΓ_c` and `RΓ(∂X̄)`, and for normal `H₁ = H₂ = K′` it reduces to
`π^* π_* = Σ_{k ∈ K/K′} r_k^*` of ALS.3.6. The statement assumes `K₀ ⊂ H₁, H₂ ⊂ K`
with
`K₀` neat and normal in `K`. ([NSW, (1.5.6)], through ProfiniteCohomology Layer 10
`corestriction_mackey`; [ACC+23, §2.1.2, (2.1.6), p. 912])

*Needs:* ALS.3.6; ALS.1.8; ALS.1.3;
ProfiniteCohomology, Layer 10 (`corestriction`, `corestriction_comp_res`, `corestriction_mackey`);
AlgebraicTopology, Stage 5 (transfer along finite covers, the permutation local system of a
nonregular cover).

**Checks.**

- `H₁ = H₂ = K′` normal: one double coset per element of `K/K′`, recovering `π^*π_* = Σ_k r_k^*`.
- `H₂ = K`: a single double coset, and the formula is `π_{H₁,K *} = π_{H₁,K *}`.
- For neat `K`, in degree `0` with `V = R` and `X_K` connected, both sides send a locally constant
  function `f` on `π₀(X_{H₁})` to the function on `π₀(X_{H₂})` obtained by summing `f` over the
  fibres of the finite coverings; a formula without the `H₂ ∩ xH₁x⁻¹` terms gives the wrong
  multiplicities when `H₁` is not normal. At non-neat `K` the coarse fibres undercount: the
  traces are groupoid transfers with the stabilizer multiplicities of ALS.3.6
  (trace_coarse_fails).

### ALS.3.8 Composition of Hecke correspondences, coherence and change of level

Prove LocallySymmetric.heckeAction_mul. The endomorphism action
`T_K:H(G^S,K^S)⊗R→End_{D(R)}(RΓ(X_K,V))` preserves Tau Ceti convolution: if `[KgK][KhK]=Σ_jc_j[Kγ_jK]`,
then `θ(g)∘θ(h)=Σ_jc_jθ(γ_j)`. The equality is in `End_{D(R)}` even when the complex has a compatible
`D(H⊗R)` lift: multiplication by a general noncentral Hecke element is not `H`-linear. For a commutative
acting Hecke algebra (or central elements), the individual operators are `H`-linear and the equality
also holds in `D(H⊗R)`. For `K′⊂K` with `K′^S=K^S`, pullback and trace intertwine all these operators; on
the Hecke complexes of ALS.3.4 they are morphisms of strict objects, and they
satisfy the Mackey and composition identities of ALS.3.7. The same statements for
compact support and boundary use the compactified equivariant support model and trace. At non-neat
level the endomorphism identities hold on groupoid complexes; the strict statement is made on the
Hecke complex, and it is not a consequence of an action on each `H^i`. The statement assumes: `K`
compact open; neat for the correspondence description. ([NT16, §2.2.1, Lemma 2.3(1), pp. 12–13];
[ACC+23, §2.1.2, (2.1.5)–(2.1.6), pp. 911–912])

*Needs:* ALS.3.3; ALS.3.5;
ALS.3.6; Tau Ceti `HeckeCosetModule.instRingHeckeRing`; AdelicAlgebraicGroups §4.5
(cartesian squares of level maps); ALS.3.4; ALS.3.7;
Tau Ceti `HeckeRing.GL2.heckeT_prime_mul_heckeTDiag_one_prime_pow` (the integral-pair square
relation at `k = 1`) and `HeckeRing.GL2.heckeT_prime_pow_recurrence` (the determinant-sum
convention).

**Checks.**

- `[KgK]·[Kg⁻¹K]` contains `[K]` with coefficient [`K : K ∩ gKg⁻¹`]. For `G=S₃` and `K={1}, H=R[S₃]` acts on
  its left regular module: left multiplication by (12) fails to commute with left multiplication by
  (23), so is not an `H`-linear endomorphism.
- heckeBasis_GL2_square: For `GL_2` and `p ∤` level, `T_p² = T_{p²} + (p + 1)S_p` with
  `T_{p²} = [K diag(p², 1) K]` the single
  double coset and `S_p = [K diag(p, p) K]`: the coefficient of `S_p` counts the `p + 1` index-`p`
  sublattices between `ℤ_p²` and `pℤ_p²`. If `T_{p²}` denotes the sum of all double cosets of determinant
  `p²`, the coefficient becomes `p`.

### ALS.3.9 Hecke compatibility with supports, boundary, coefficients and cup products

Prove LocallySymmetric.heckeAction_compatible. The maps `RΓ_c(X_K, V) → RΓ(X_K, V) → RΓ(∂X̄_K, V)`
and the restriction `RΓ(X̄_K, V) → RΓ(∂X̄_K, V)` are morphisms in `D(R)` intertwining every Hecke
endomorphism, and lift to morphisms of the Hecke complexes of ALS.3.4 in
`D(H(G^S,K^S)⊗R)`; so are the coefficient maps of Layer ALS.1 (induced by `R[G(F)×K_S]`-linear `V → W`,
and the base change isomorphisms of ALS.1.7). For cup products: `π^*` is
multiplicative, the trace satisfies the projection formula `π_*(π^*a ∪ b) =` a `∪ π_*b`, and for a class
`c ∈ H⁰(X_K, W)` represented by a `G^S`-equivariant map `R → H⁰(𝔛_G, W)(χ⁻¹)`, where
`χ : G^S → Rˣ` is trivial on `K^S`, cup product with `c` satisfies
`c ∪ T(t)(x) = T(f_χ(t))(c ∪ x)` (ALS.3.12). The source `R` has trivial action;
by `Representation.charTwist`, this hypothesis means `g·c = χ(g)c`. In general
`T(t)` is not a ring endomorphism of `H^*(X_K, R)`. Coefficient base-change isomorphisms here have
exactly ALS.1.7’s neatness/perfectness hypotheses; arbitrary-level derived
invariants require the extra averaging or base-change comparison stated at
ALS.4.1. The statement assumes: `K` neat for the cup-product statements. ([NT16,
§3.1, before Proposition 3.7, p. 48]; [NT16, §4, after Theorem 4.2, p. 55];
[ACC+23, §2.2.20, proof of Proposition 2.2.23, p. 934])

*Needs:* ALS.3.3; ALS.3.6; ALS.1.7;
ALS.3.12 (the automorphism `f_χ` in the twisted cup formula);
ALS.2.2; ALS.3.4; AlgebraicTopology, Stage 6;
ALS.F.3 (derived pushforward and pullback).

**Checks.**

- `T_p` is not a ring endomorphism of `H^*(X_K, ℚ)` for modular curves: `T_p(1) = (p + 1)·1` in `H⁰`, so
  `T_p(1) ≠ 1` and `T_p(1)·T_p(1) = (p + 1)²·1` differs from `T_p(1·1) = (p + 1)·1`.
- The forget-supports map `H¹_c → H¹` for modular curves is Hecke-equivariant with image the
  interior cohomology.
- Projection formula in degree 0 at neat level: on `H⁰ = Fun(π_0, R)` it reads `Σ_{y ↦ x} a(x)b(y) = a(x) Σ_{y ↦ x} b(y)`.
- For `Q = C₃ = ⟨g⟩`, `R = 𝔽₇`, `T_g f(a) = f(ag)` and `χ(g) = 2`, take
  `c = (1,2,4)` and `x = (1,1,1)` in `Fun(Q,R)`. Then `T_g c = 2c`, so `c` is fixed in the
  `χ⁻¹` twist, and the cup identity reads `c · T_g x = 4 T_g(c · x) = c`.
  For `d = (1,4,2)`, the `χ` twist fixes `d`, but `4 T_g(d · x) = 2d ≠ d · T_g x`.
  These are the component functions for `G = GL₁/ℚ` and
  `K(7) = {u ∈ Ẑˣ : u ≡ 1 mod 7}`: the full archimedean compact gives
  `(ℤ/7)ˣ/{±1} ≅ C₃` with trivial arithmetic stabilizers.

### ALS.3.10 Topological and discrete set-ups give the same Hecke actions

Prove LocallySymmetric.heckeAction_discrete_eq_topological. Let `𝔛̄^top_G = lim_K X̄_K`, the limit
over good `K`; it is `G(F)∖(X̄^G × G(𝔸^∞))` with `G(𝔸^∞)` carrying its locally profinite topology, a
compact Hausdorff space with continuous right `G(𝔸^∞)`-action, containing the open interior
`𝔛^top_G = G(F)∖(X^G × G(𝔸^∞))` through `j` and the closed boundary `∂𝔛̄^top_G`. Let
`𝔛̄^dis_G = G(F)∖(X̄^G × G(𝔸^∞)^δ)`, with `π_dis : 𝔛̄^dis_G → 𝔛̄^top_G`. A smooth `R[K_S]`-module
`V`
with discrete coefficient fibre, inflated to
`G^S × K_S` and pulled back, gives `G^S × K_S`-equivariant sheaves `V̄` and `j_!V` on `𝔛̄^top_G`
(ALS.F.4) and the restriction of `V̄` to the boundary. (i) The
square of derived functors `D⁺Sh_{G^S×K_S}(𝔛̄^top) → D⁺_sm(G^S × K_S, R) → D⁺(H(G^S, K^S) ⊗ R)`
(global sections, then derived `K`-invariants) and
`D⁺Sh_{G^S×K_S}(𝔛̄^top) → D⁺Sh_K(𝔛̄^top) ≃ D⁺Sh(X̄_K) → D⁺(R)` commutes with the forgetful functor;
the first arrow exists because
`𝔛̄^top_G` is compact, so that global sections are smooth and the global-section functor preserves
injectives, and the descent equivalence holds because a good `K` acts freely (CN23 Proposition
2.1.3). (ii) `RΓ(𝔛̄^top, −)` has bounded cohomological dimension: `R^iΓ(𝔛̄^top, 𝔉) = 0` for
`i > dim X_K` (CN23 Lemma 2.1.4). (iii)
`RΓ(K, −) ∘ RΓ(𝔛̄^top, −) ≅ RΓ(K^dis, −) ∘ RΓ(𝔛̄^dis, −) ∘ π_dis^*` as functors to
`D⁺(H(G^S, K^S) ⊗ R)` (CN23 Lemma 2.1.5). Applied to `V̄`, `j_!V` and the
boundary sheaf, and composed with `RΓ(X̄_K, V̄) ≅ RΓ(X_K, V)` (the homotopy equivalence `j_K` of
ALS.2.3) and `RΓ(X̄_K, j_!V) = RΓ_c(X_K, V)`, the two set-ups give
the same Hecke actions on `RΓ(X_K, V)`, `RΓ_c(X_K, V)` and `RΓ(∂X̄_K, V)`. The noncompact interior
`𝔛^top_G` is not used as a carrier: on a noncompact space the global sections of an equivariant
sheaf need not be smooth. The statement assumes: `K` good; `R` commutative; the finite levels used
in the sheaf and descent comparisons good; `V` smooth as a discrete `R[K_S]`-module.
The discrete arithmetic construction of ALS.1.1–1.2 still applies to arbitrary coefficient modules;
compactness and good level do not imply smoothness of `V`. ([CN23, §2.1.1, p. 9]; [CN23, §2.1.2,
Proposition 2.1.3, pp. 10–11]; [CN23, §2.1.2,
Lemma 2.1.4, p. 11]; [CN23, §2.1.2, Lemma 2.1.5, p. 11])

*Needs:* ALS.3.3; ALS.0.9;
ALS.2.3; ALS.F.4 (equivariant
sheaves for locally profinite groups and discrete groups, smooth sections on compact spaces, preservation of
injectives); ALS.F.3; SmoothRepresentationsOfLocalGroups SR.0 (smooth
representations) and SR.0d.2 (`derived-invariants`, the derived invariants of the smooth derived
category).

**Checks.**

- For `V = R` both set-ups give the same `T_p` on `H¹` of a modular curve.
- For odd `p`, `K_p = 1 + pℤ_p` acting on `V = ℤ_p` by multiplication has stabilizer `{1}`
  at `1`, which is not open. This lattice is continuous for the `p`-adic topology but is not a
  smooth discrete coefficient module. Each `V/p^m` is smooth: `1 + p^mℤ_p` fixes every vector
  for `m ≥ 1`.
- Smoothness: for smooth `V` in the topological set-up, `H^i(𝔛̄^top, V̄)` and `H^i(𝔛̄^top, j_!V)`
  are smooth `G^S × K_S`-representations, by compactness of `𝔛̄^top`.
- Non-example: the interior cannot replace the compactified tower in (i): on the noncompact
  `ℤ_p × ℕ` of ALS.F.4 an equivariant constant sheaf already has
  a global section fixed by no open subgroup.

**Fixed-level integral comparison — LocallySymmetric.heckeAction_integralLimit.**
Let `O` be a complete DVR with uniformizer `ϖ`, `K` one fixed good level, and `V` a finite free
`O`-module with `O[K_S]`-action such that every `V_m = V/ϖ^m V` is smooth as a discrete module.
For `?` equal to ordinary, compactly supported or boundary cohomology, let `C^dis_?(K,V)` be the
arithmetic complex of ALS.1.2 and `C^top_?(K,V_m)` the finite-level topological complex above.
Prove a natural Hecke-equivariant isomorphism
`C^dis_?(K,V) ≅ R lim_m C^top_?(K,V_m)` in `D(O)`, using the compatible reduction maps and
restriction of scalars from `O/ϖ^m`. The transition comparisons must commute with pullback,
translation, trace and the boundary triangle. Construct the limit on the compatible strict Hecke
complexes of ALS.3.4, so it carries the same `H(G^S,K^S) ⊗ O`-action as the discrete complex.
Use ALS.1.6 and ALS.2.4's bounded finite free coefficient models: their reductions have surjective
transition maps in each degree, so the derived inverse limit is the termwise limit and completeness
identifies it with the original model. The finite models rest on ALS.2.4's smooth triangulation
target. There is
no assertion that the integral limit is an object of the smooth discrete category. The statement
assumes precisely these coefficient, good-level and finite-model hypotheses.
([CN23, §2.1.2, after Remark 2.1.10 and footnote 7, p. 14]; [CN23, §5.5, coefficient set-up, p. 79, and Lemma 5.5.1, p. 80])

*Needs:* the smooth comparison above; ALS.1.6–1.7; ALS.2.4; ALS.3.4 and ALS.3.9 (compatible strict
Hecke complexes, coefficient change and supports). The fixed-level coefficient-limit comparison
is a target here.

**Checks.**

- For the weight-one `ℤ_p` line under `1+pℤ_p`, the smooth reductions recover the discrete
  integral arithmetic complex, although the line itself fails the point-sheaf smoothness test.
- For a point with trivial coefficient `O`, the tower `O/ϖ^m[0]` has derived limit `O[0]`;
  surjectivity gives no degree-one inverse-limit term.
- For constant `O` on a modular curve, the ordinary, supported and boundary finite models recover
  their integral boundary triangle; the recovered `T_ℓ` for `ℓ ∉ S` is the restriction–translation–trace
  operator on the integral model.

### ALS.3.11 The derived Hecke algebra `T^S(K, V)` of an arithmetic complex

Define LocallySymmetric.derivedHeckeAlgebra. Let `O` be the ring of integers of a finite extension
`E/ℚ_p, S ⊃ S_p` finite with `K_v` hyperspecial for `v ∉ S`, and `T^S = H(G^S, K^S) ⊗_ℤ O`, a commutative
`O`-algebra. For neat `K` and `V` a finite `O`-module with `O[K_S]`-action, write `T^S(K, V)` for the image of
`T^S` in `End_{D(O)}(RΓ(X_K, V))` (ACC+'s `T^S(K, λ)` for `V = V_λ`; NT16's `T^S(C^•)`); similarly
`T^S_c(K, V)`
for `RΓ_c` and `T^S_∂(K, V)` for `RΓ(∂X̄_K, V)`. It is a commutative finite `O`-algebra with surjections
`T^S(K, V) → T^S(H^*(X_K, V))` with nilpotent kernel, and for `V` finite free over
`O, T^S(K, V) ≅ lim_N T^S(K, V/ϖ^N)`. It is IntegralHeckeAndGaloisDeterminants' derived Hecke image
(Layer 2, §2.1: the
image `α.range` of a commutative action on a complex with finite cohomology, finite by
`HeckeImage.derived_hom_finite`; §2.2: `HeckeImage.ghost_nilpotence` bounds the nilpotence of the
kernel to cohomology) for the complex `RΓ(X_K, V)` with the action of
ALS.3.3. The statement assumes: `K` neat with `K_v` hyperspecial for `v ∉ S; V`
finite over `O`. ([NT16, §3.2, p. 51]; [NT16, §3.2, p. 52]; [NT16, §3.2, Lemma 3.12, p. 53])

The API: LocallySymmetric.derivedHeckeAlgebra — `T^S(K, V) :=` image of
`T^S → End_{D(O)}(RΓ(X_K, V))`, with variants for `RΓ_c` and `RΓ(∂X̄_K, V)`;
LocallySymmetric.derivedHeckeAlgebra.commRing —
`T^S(K, V)` is a commutative `O`-algebra, finite as an `O`-module;
LocallySymmetric.derivedHeckeAlgebra.toCohomology — The surjection `T^S(K, V) → T^S(H^*(X_K, V))`,
with nilpotent kernel (index of nilpotence `≤ d_G + 1`); LocallySymmetric.derivedHeckeAlgebra.limit
— `T^S(K, V) ≅ lim_N T^S(K, V/ϖ^N)` for `V O`-flat;
LocallySymmetric.derivedHeckeAlgebra.eq_derivedHeckeImage — `T^S(K, V)` is
IntegralHeckeAndGaloisDeterminants' derived Hecke image (Layer 2) of the complex `RΓ(X_K, V)` with its
`T^S`-action; LocallySymmetric.derivedHeckeAlgebra.maximalIdeals_finite — `T^S(K, V)` has finitely
many maximal ideals, all with residue field finite over `k`.

*Needs:* ALS.3.3; ALS.2.4;
IntegralHeckeAndGaloisDeterminants, Layer 2 (derived Hecke images, ghosts, finite local factors,
idempotent splitting); ALS.F.2 (perfect complexes).

**Checks.**

- derivedHeckeAlgebra_zeroComplex: If `RΓ(X_K, V) = 0` then `T^S(K, V) = 0`.
- derivedHeckeAlgebra_GL1: For `G=GL₁/ℚ`, principal level `K(3)={u∈Ẑ×:u≡1 mod 3}`, and constant
  `O`-coefficients, `X_K` is one point with trivial arithmetic stabilizer and the derived Hecke image is
  `O`. At the non-neat level `Ẑ×` the same assertion requires 2 invertible in `O`; otherwise the `C₂`
  stabilizer gives higher groupoid cohomology. More generally a finite component group `C` acting
  regularly on functions has image `O[C]`, which need not be a product of copies of `O` (it is not
  when `p` divides `|C|`). General number fields can
  have positive-dimensional unit tori, so degree-zero finite-set cohomology is not asserted for
  `GL₁/F`.
- derivedHeckeAlgebra_surj_cohomology: The map `T^S(K, V) → T^S(H^*(X_K, V))` is surjective with
  nilpotent kernel; it can fail to be injective (an endomorphism of a complex can act by zero on
  cohomology without being zero).
- derivedHeckeAlgebra_ne_cohomologyAlgebra: Generic derived-image test: over a DVR `O` with residue
  field `k`, the perfect complex `C = k[0] ⊕ k[1]` has a nonzero off-diagonal ghost in
  `Hom_D(O)(k,k[1]) = Ext^1_O(k,k)`. Its square is zero and it acts as zero on cohomology. Let
  `T = O[ε]/(ε²)` send `ε` to
  this ghost; the derived image has nonzero nilpotent kernel over its cohomological image. This
  tests the generic derived-image input of IntegralHeckeAndGaloisDeterminants Layer 2, not an
  asserted arithmetic realization. A lone complex `[O →(ϖ) O]` is quasi-isomorphic to one `k` and does
  not provide that ghost.

### ALS.3.12 Twisting Hecke algebras and coefficients by a character of det

Define LocallySymmetric.twistHecke. Let `G = GL_{n,F}, K ⊂ GL_n(A_F^∞)` good and `ψ : G_F → O^×` a
continuous character with `ψ∘Art_{F_v}` trivial on `det(K_v)` for all `v ∉ S`. Define
`f_ψ : H(G^S, K^S) ⊗_ℤ O → H(G^S, K^S) ⊗_ℤ O` by `f_ψ(f)(g) = ψ(Art_F(det g))⁻¹ f(g)`; it is an
`O`-algebra isomorphism with
inverse `f_{ψ⁻¹}`. If `K_v = GL_n(O_{F_v})` for `v ∉ S`, then `f_ψ(T_{v,i}) = ψ(Frob_v)^{−i} T_{v,i}`, and
for a maximal ideal `𝔪 ⊂ T^S, 𝔪(ψ) := f_ψ(𝔪)`. For an `O[K_S]`-module `V, V(ψ^{−1,S})` is `V` with `g ∈ G^S`
additionally acting by `ψ(det g)⁻¹` (on the equivariant sheaf on `𝔛_G`). More generally, for any `G` and a
character `χ : G(A^∞) → O^×` trivial on `G(F)` and `K^S, f_χ(f)(g) = χ(g)⁻¹f(g)`. Here `Art_F` and
`Art_{F_v}` are the geometrically normalized Artin maps of *Conventions*, and
`ψ_𝔸 = ψ ∘ Art_F : 𝔸_F^× → O^×` is the continuous character attached to `ψ`: for every `m ≥ 1, ψ`
mod `ϖ^m` factors through
`Gal(L_m/F)` for a finite abelian extension `L_m/F, ψ_𝔸` mod `ϖ^m` is the composite of ClassFieldTheory's
`globalArtinMap` for `L_m/F` with inversion, and these characters are compatible in `m` by the
compatibility of the global Artin maps in towers; `ψ_𝔸` is trivial on `F^×` by global reciprocity
(`globalArtinMap_principal`), and its restriction to `F_v^×` is `ψ ∘ Art_{F_v}`
(`globalArtinMap_local`). The statement assumes: `ψ` continuous, `ψ∘Art_{F_v}` trivial on `det(K_v)` for
`v ∉ S`. ([ACC+23, §1.2, p. 906]; [ACC+23, §2.2.20, p. 933])

The API: LocallySymmetric.twistHecke —
`f_ψ : H(G^S, K^S) ⊗ O ≃ₐ H(G^S, K^S) ⊗ O, f ↦ (g ↦ ψ(Art_F(det g))⁻¹ f(g))`;
LocallySymmetric.twistHecke_T — `f_ψ(T_{v,i}) = ψ(Frob_v)^{−i} T_{v,i}` for
`v ∉ S` with `K_v` hyperspecial; LocallySymmetric.twistHecke_mul — `f_ψ ∘ f_{ψ′} = f_{ψψ′}` and
`f_1 = id`; LocallySymmetric.idelicCharacter — `ψ ↦ ψ_𝔸 = ψ ∘ Art_F`, continuous on `𝔸_F^×/F^×`,
with
`ψ_𝔸|_{F_v^×} = ψ ∘ Art_{F_v}` and `ψ_𝔸(ϖ_v) = ψ(Frob_v)` at unramified `v`;
LocallySymmetric.twistMaximalIdeal — `𝔪(ψ) = f_ψ(𝔪)` for maximal ideals of `T^S`;
and on coefficients `V ↦ V(ψ^{−1,S})`, the module with `G^S` acting additionally through `ψ(det)⁻¹`, which
is Tau Ceti's `Representation.charTwist` at the character `g ↦ ψ(det g)⁻¹` and is not redefined
here.

*Needs:* ALS.3.3; ALS.3.11; ClassFieldTheory,
Layers 7, 10 and 11 (`artinMap`, `geometricArtinMap`, `globalArtinMap`, `globalArtinMap_local`,
`globalArtinMap_principal`, `globalArtinMap_isArithFrobAt`); Tau Ceti
`HeckeCosetModule.instRingHeckeRing`; Tau Ceti `Representation.charTwist`.

**Checks.**

- A character trivial on `U` takes value 1 on the identity double coset, including when `U = G`.
- For `Γ = ℤ, U = 2ℤ` and `χ(n) = (−1)^n` valued in `ℚ^×`, the distinct representatives 1 and 3
  differ by a `U`-translate, so the character has the same value on their double coset.
- For `Γ = S₃, U = A₃` and the sign character valued in `ℤ^×`, the normal quotient has order 2 and
  the character takes value `−1` on the transposition coset.
- twistHecke_trivial: `f_1 = id`.
- twistHecke_T_GL1: For `n = 1, T_{v,1} = [ϖ_v K_v]` and `f_ψ(T_{v,1}) = ψ(Frob_v)⁻¹ T_{v,1}`.
- twistHecke_mul: `f_ψ` is an `O`-algebra automorphism with `f_ψ ∘ f_{ψ⁻¹} = id`.
- twist_not_identity_on_maximalIdeals: For a fixed `O`-valued eigensystem `φ` with residue
  eigenvalues in `k = O/ϖ`, if `ψ(Frob_v) ≠ 1` in `k` and `φ(T_{v,1}) ≠ 0`, twisting changes that eigenvalue
  and its `k`-valued eigensystem. For residue fields larger than `k`, two changed eigensystems can be
  Frobenius-conjugate and define the same maximal ideal; nontrivial `ψ` alone does not prove that
  every such ideal moves.
- idelicCharacter_convention: for `F = ℚ`, the geometric `Art_{ℚ_2}(2)` acts on the unramified
  extension `ℚ_2(ζ_5)` by `ζ_5 ↦ ζ_5^3`, the inverse of the arithmetic Frobenius `ζ_5 ↦ ζ_5^2` of
  ClassFieldTheory. Changing to arithmetic Artin replaces each twisting factor
  `ψ(Frob_v)^{−i}` by its inverse; the original Hecke eigenvalue is unchanged. With `ψ = 1` and
  the constant `GL_2` eigensystem at `q_v = 2`, both normalizations give `T_{v,1} = 3`.

### ALS.3.13 Twisting `RΓ(X_K, V)` by a character, and its Hecke algebras

Prove LocallySymmetric.twistIso. Let `G = GL_{n,F}, K ⊂ GL_n(A_F^∞)` good, `S ⊃ S_p`, and
`ψ : G_F → O^×` continuous with `(1) ψ∘Art_{F_v}` trivial on `det(K_v)` for every finite `v ∤ p`,
and (2) some `m = (m_τ) ∈ ℤ^{Hom(F,E)}` with
`ψ(Art_{F_v}(k)) = ∏_{τ ∈ Hom_{ℚ_p}(F_v, E)} τ(k)^{−m_τ}` for all `v | p` and
`k ∈ det(K_v)`, and `(3) ψ(c_v) = 1` for every real place `v` of `F, c_v` a complex conjugation at `v; (3)`
holds automatically when `F` has no real place, in particular for the imaginary CM fields of
[ACC+23, §2.2.1]. Condition (3) makes `g ↦ ψ(Art_F(det g))` invariant under `G(F)` on the finite
adeles: for `γ ∈ G(F), ψ(Art_F((det γ)_∞)) = ∏_{v real} ψ(c_v)^{[σ_v(det γ) < 0]}`. Let `O(m)` be the
rank-one `O[K_p]`-module on which `k` acts by `∏_τ τ(det k)^{m_τ}`. Then for every
`O[K_S]`-module `V` whose underlying `O`-module is finite free there is an isomorphism
`RΓ(X_K, V) ≅ RΓ(X_K, V ⊗ O(m))` in `D(O)`,
equivariant for `H(G^S, K^S) ⊗ O` acting in the usual way on the source and through `f_ψ` on the target.
If `K_v = GL_n(O_{F_v})` for `v ∉ S, f_ψ` descends to an isomorphism `T^S(K, V) ≅ T^S(K, V ⊗ O(m))`, and `𝔪`
is in the support of `H^*(X_K, V)` iff `𝔪(ψ)` is in the support of `H^*(X_K, V ⊗ O(m))`. (ACC+ states this
for `V = V_λ`, where `V_λ ⊗ O(m) = V_{λ+μ}` with `μ_τ = (m_τ, …, m_τ)`.) No such isomorphism is asserted
when `ψ` is odd at a real place. The statement assumes: `G = GL_{n,F}; K` good; `ψ` satisfying (1), (2)
and (3). ([ACC+23, §2.2.1, p. 916]; [ACC+23, §2.2.20, Proposition 2.2.23, p. 933]; [ACC+23,
§2.2.20, proof of Proposition 2.2.23, p. 934]; [ACC+23, §2.2.20, Corollary 2.2.24, pp. 934–935])

*Needs:* ALS.3.12; ALS.3.9;
ALS.3.11.

**Checks.**

- `ψ = 1, m = 0` gives the identity.
- The trivial lattice `V = O` is an allowed coefficient module. For nonzero `O` and
  `k ≠ 1` in `K_S`, `[k] − [1]` is a nonzero annihilator, so this lattice is not free over
  `O[K_S]`; the group-ring annihilator example of ALS.F.7 applies here.
- For `n = 1`, twisting permutes the Hecke eigensystems in cohomology by `ψ∘Art_F`; the space need not
  be a finite set for general `F`.
- twistIso_odd_real (non-example): `F = ℚ, n = 1, p = 5, O = ℤ_5, K = K(3) = {u ∈ Ẑ^× : u ≡ 1 mod 3}`, `S = {3, 5}, V = O, m = 0` and `ψ` the odd quadratic character of conductor 3 satisfy (1) and
  (2) but not (3). `X_K` is one point with trivial stabilizer, `T_2` acts on `H⁰ = O` by 1, and
  `f_ψ(T_2) = ψ(Frob_2)⁻¹T_2` acts by `−1`, since 2 is inert in `ℚ(√−3)`; no `O`-linear isomorphism
  intertwines 1
  and `−1`.

### ALS.3.14 Degeneracy maps at `Γ0(x)`-level and the old-space splitting

Prove LocallySymmetric.oldformSplitting. Let `G = PGL_{2,F}, K` a level and `x ∉ S` a place with
`K_x = PGL_2(O_x)`; let `K_0(x) ⊂ K` be the `Γ_0(x)`-level at `x`
(ALS.0.10), `Y = X_K, Y_0(x) = X_{K_0(x)}`. The two degeneracy maps
`Y_0(x) → Y` are `π` and `π ∘ r_g` with `g = diag(1, ϖ_x) = diag(ϖ_x, 1)⁻¹` in `PGL_2(F_x)`: with
the convention `r_g : X_{gK′g⁻¹} → X_{K′}` of
*Conventions*, `r_g` goes from `Y_0(x)` to `X_{g⁻¹K_0(x)g}`, and `g⁻¹K_0(x)g ⊂ K` because conjugation by `g`
multiplies the lower-left entry by `ϖ_x⁻¹` and the upper-right entry by `ϖ_x`. They induce
`φ : H^*(Y, A)^2 → H^*(Y_0(x), A)` (sum of the two pullbacks) and
`φ^∨ : H^*(Y_0(x), A) → H^*(Y, A)^2` (the
two traces), for `A = O/ϖ^n`, and `φ^∨ ∘ φ = (N(x)+1, T_x; T_x, N(x)+1)`, with determinant
`(N(x)+1)² − T_x²`; the off-diagonal entry is `T_x` because the inverse double coset of
`diag(ϖ_x, 1)` is
`K diag(ϖ_x, 1) K` again in `PGL_2`. If `𝔪` is a maximal ideal with `T_x² − (1 + N(x))² ∉ 𝔪`, then `φ^∨ ∘ φ`
is invertible after localization at `𝔪` and `H^*(Y_0(x), A)_𝔪 ≅ H^*(Y, A)^2_𝔪 ⊕ W` for a `T`-stable `W`.
On the image of `φ` the operator `U_x = [K_0(x) diag(ϖ_x, 1) K_0(x)]` acts through a matrix with
characteristic polynomial `X² − T_xX + N(x)`, the level-`Y` factor carrying no `U_x` of its own. If
moreover the roots `α_x, β_x` of `X² − T_xX + N(x)` modulo `𝔪` are distinct, `α_x` lifted to the
coefficients, and `𝔪̃ = (𝔪, U_x − α_x)` in the algebra enlarged by `U_x`, then
`H^*(Y_0(x), A)_{𝔪̃} ≅ H^*(Y, A)_𝔪 ⊕ W_{𝔪̃}`, the first summand embedded by `φ` followed by the
projection onto the
generalized `U_x = α_x` eigenspace. Both conditions hold at a Taylor–Wiles prime (`N(x) ≡ 1` mod `p` and
`α_x ≠ β_x` with `α_xβ_x ≡ 1`, so `α_x` ≢ `±1`). The statement assumes: `G = PGL_{2,F}; K_x` maximal;
`T_x² − (1+N(x))² ∉ 𝔪` for the two-copy splitting; in addition `α_x` ≢ `β_x` mod `𝔪` for the one-copy
splitting. ([CG18, §9, proof of Lemma 9.6, pp. 88–90])

*Needs:* ALS.3.6; ALS.3.5; ALS.3.8;
ALS.0.10.

**Checks.**

- For `F = ℚ` and `A = ℂ` this is the classical decomposition of `H¹(Γ_0(Nx))` into the two copies of old
  forms plus new forms.
- If `x` is not Taylor–Wiles `(α_x = β_x), φ^∨φ` need not be invertible at `𝔪`.
- The determinant condition does not give one copy: `N(x) = 2` and `T_x ≡ 6` in a residue field `F_7`
  give `T_x² − (1 + N(x))² = 27` ≢ 0, but `X² − 6X + 2 = (X − 3)²`, so localizing at `(𝔪, U_x − 3)`
  keeps both copies of `H^*(Y, A)_𝔪`.
- Direction of the translation: with `g = diag(ϖ_x, 1)` in place of `diag(1, ϖ_x)`, the element
  `u = (1, 1; 0, 1) ∈ K_0(x)` has `g⁻¹`ug `= (1, ϖ_x⁻¹; 0, 1) ∉ PGL_2(O_x)`, so `π ∘ r_g` is not defined on
  `Y_0(x)`.

### Examples

- `T_p` on lattices: for `Δ = GL_2(ℚ_p)`, `U = GL_2(ℤ_p)`, `T_p = [U diag(p, 1) U]` sends `[ℤ_p²]`
  to the sum of the `p + 1` index-`p` sublattices, and acts on the trivial module by `p + 1`.
- `GL_2` Hecke relation: `T_p² = T_{p²} + (p + 1)S_p` for `p` prime to the level, with
  `T_{p²} = [K diag(p², 1) K]` and `S_p = [K diag(p, p) K]`.
- Old forms: at a Taylor–Wiles prime `x` the matrix `φ^∨ ∘ φ = (N(x)+1, T_x; T_x, N(x)+1)` has
  determinant `(N(x) + 1)² − T_x²`, a unit at `𝔪`, so two copies of the level-`K` cohomology split
  off at `Γ₀(x)`-level.

### Dependencies

Layers ALS.F and ALS.0–ALS.2; IntegralHeckeAndGaloisDeterminants, Layer 2;
SmoothRepresentationsOfLocalGroups SR.0, SR.0d.2, SR.1.1 and SR.1.2; ClassFieldTheory, Layers 7, 10
and 11; AdelicAlgebraicGroups §4.5; ProfiniteCohomology, Layer 10;
ALS.F.4; AlgebraicTopology, Stages 5 and 6; Mathlib (`IsHeckeTriple`,
`HeckeCoset`, `HeckeRing`, `Subgroup.relIndex`); Tau Ceti (`HeckeCosetModule.instRingHeckeRing`,
`HeckeCoset.degree_eq_relIndex`).

## Layer ALS.4: Boundary complexes and Eisenstein localization

This layer analyses the boundary. The boundary triangle relates ordinary, compactly supported and
boundary cohomology Hecke-equivariantly. Each boundary stratum is computed through parabolic
restriction and the unnormalized Satake map, the Nomizu–van Est comparison and Kostant's theorem
over a splitting field, or integrally through the Leray–Hochschild–Serre sequence. Localization at
maximal ideals of the derived Hecke algebra, the Galois-type and Eisenstein predicates and the
eigenvalue criterion then give the boundary theorems for `GL_n` and `U(n, n)`.

### ALS.4.1 The boundary exact triangle `RΓ_c → RΓ → RΓ_∂`

Prove LocallySymmetric.boundaryTriangle. For every compact open `K` and `V` finite projective with
`R[G(F) × K_S]`-action there is an exact triangle
`RΓ_c(X_K, V) → RΓ(X_K, V) → RΓ(∂X̄_K, V) → RΓ_c(X_K, V)[1]` in `D(R)` with Hecke-equivariant arrows
and connecting map; the Hecke complexes of
ALS.3.4 lift the whole triangle (heckeComplex.triangle), not three independent
Hecke actions, functorial in `V` (`R[G(F)×K_S]`-linear maps) and in the level (pullbacks and traces of
ALS.1.8 and ALS.3.6), and compatible with coefficient change at
neat `K` under ALS.1.7; for general `K` this compatibility requires `|K/K₀|`
invertible in both coefficient rings or the derived-invariants base-change hypothesis, and is not
automatic. It is obtained from `j_!j^*V → V → i_*i^*V` on `X̄^G × G(A^∞)` and the identification
`RΓ(X̄_K, V) ≅ RΓ(X_K, V)` given by the homotopy equivalence `j_K`. The statement assumes: `K` compact
open (neat for the sheaf-theoretic description). ([NT16, §4, after Theorem 4.2, p. 55])

*Needs:* ALS.2.3; ALS.3.9;
ALS.3.6; ALS.1.7; ALS.3.4;
AlgebraicTopology, Stage 5; ALS.F.3 (extension by zero and the
localization triangle).

**Checks.**

- For a modular curve (`GL_{2,ℚ}`, neat `K`) with `c` cusps:
  `0 → H⁰ → H⁰(∂) = ℤ^c → H¹_c → H¹ → H¹(∂) = ℤ^c → H²_c → 0` on each component.
- For `G` anisotropic, `RΓ(∂X̄_K, V) = 0` and `RΓ_c = RΓ`.
- Euler characteristics for a connected modular curve with `c` cusps and `V = ℚ`: the boundary circles
  have `χ = 0`, so `χ_c = χ = 1 − (2g + c − 1) = 2 − 2g − c`.

### ALS.4.2 Restriction to P, integration along `N` and the unnormalized Satake map

Define LocallySymmetric.Hecke.restrictParabolic. For a local reductive `G, P=M⋉N` and compact open `U`
with `G=PU, U_P=U∩P=U_N⋊U_M`, restriction `r_P:H(G,U)→H(P,U_P)` and integration
`r_M(f)(m)=∫_N f(mn)dn (vol(U_N)=1)` are algebra homomorphisms, and their composite `S` is the
integral unnormalized Satake
map (NT16 Lemmas 2.4 and 2.7). A separate monoid form uses both Iwahori decomposition product
bijections `U_N×U_M×U_Nbar→U` and the reversed order. Define `Δ_M` by `mU_Nm⁻¹⊂U_N` and
`U_Nbar⊂mU_Nbar m⁻¹, Δ=U_NΔ_MU_Nbar` and `Δ_P=Δ∩P`. ACC+ Lemmas 2.1.10–2.1.11 give
`r_P:H(Δ,U)→H(Δ_P,U_P), r_M:H(Δ_P,U_P)→H(Δ_M,U_M)` and
`S([UmU])=[U_N:mU_Nm⁻¹][U_MmU_M]=|δ_P(m)|⁻¹[U_MmU_M]` for `m∈Δ_M`; on
this positive monoid `S` is SmoothRepresentationsOfLocalGroups SR.1.4's restriction–integration map,
and the formula is its `positive-hecke-homomorphism` (3), cited here. This single-term formula is
confined to the positive Iwahori-monoid branch. At hyperspecial `U` the
transform has the full usual sum; its relation to normalized Satake is `δ_P^{1/2}S`, with `q`-half
coefficients adjoined separately. Parabolic induction and its derived invariants compare through `r_P`
under the NT16 hypotheses. The statement assumes: For the full Hecke algebra: `G(F_v)=P(F_v)U` and
`U_P=U_N⋊U_M`.; For the single-term monoid basis formula: both Iwahori product decompositions and `m` in
`Δ_M` with the stated `N` and opposite-`N` positivity. ([NT16, §2.2.3, Lemma 2.4(1), pp. 13–14]; [NT16,
§2.2.4, Lemma 2.7(1), pp. 16–17]; [ACC+23, §2.1.9, after Lemma 2.1.11, p. 914])

The API: LocallySymmetric.Hecke.restrictParabolic — `r_P : H(G, U) →ₐ H(P, U_P)`, restriction of
functions; LocallySymmetric.Hecke.integrateUnipotent — `r_M : H(P, U_P) →ₐ H(M, U_M)`, integration
along `N` with `vol(U_N) = 1`; LocallySymmetric.Hecke.satakeUnnormalized —
`S = r_M ∘ r_P : H(G, U) →ₐ H(M, U_M)`; LocallySymmetric.Hecke.satakeUnnormalized_basis — In the
ACC+ positive Iwahori-monoid
setting (both Iwahori product decompositions, `Δ_M` positivity and `Δ=U_NΔ_MU_Nbar`),
`S([UmU])=|δ_P(m)|⁻¹[U_MmU_M]`, which is SR.1.4 `positive-hecke-homomorphism` (3) once `S` is identified
with SR.1.4's restriction–integration map. This is not a single-term formula for the hyperspecial
spherical transform; LocallySymmetric.Hecke.satake_compat_normalized — For hyperspecial `U, S`
agrees with SmoothRepresentationsOfLocalGroups SR.4's Satake transform composed with the `δ_P^{−1/2}`
twist (the `q`-half normalization specified separately);
LocallySymmetric.Hecke.parabolicInduction_invariants — For
`V = Ind_{P}^{G} W, V^U ≅ r_P^*(W^{U_P})` as `H(G, U)`-modules (NT16 Lemma 2.4(3)), and
`RΓ_U Ind ≅ r_P^* RΓ_{U_P}` (NT16
Corollary 2.6).

*Needs:* ALS.3.1; SmoothRepresentationsOfLocalGroups SR.2.2 (modulus
character, Jacquet functor and parabolic induction); SmoothRepresentationsOfLocalGroups SR.1.4
(Iwahori decompositions and positive Hecke algebras); SmoothRepresentationsOfLocalGroups SR.4.1
(integral and normalized Satake transforms); ReductiveGroupsPartII RG2.4.2–RG2.4.4 (Iwahori
factorization, Iwasawa decomposition and integration).

**Checks.**

- satake_GL2_Tp: For `GL_2`, upper Borel `B, U = GL_2(Z_p)` and `S(f)(t) = ∫_N f(tn)dn` with
  `vol(N(Z_p)) = 1: S(T_p) = p·[diag(p,1)] + [diag(1,p)]` in `H(T(ℚ_p),T(Z_p))`.
- satake_one: `S([U]) = [U_M]`, and for `P = G, S = id`.
- satake_compat_SR4: `δ_B^{1/2}·S(T_p) = p^{1/2}([diag(p,1)] + [diag(1,p)])`, the normalized Satake
  transform of SmoothRepresentationsOfLocalGroups SR.4.1 (after inverting `p^{1/2}`).
- satake_unnormalized_not_W_invariant: For `p > 1, p[diag(p,1)] + [diag(1,p)]` is not invariant
  under swapping diagonal entries; `δ_B^{1/2}·S(T_p)` is Weyl-invariant.

### ALS.4.3 Hecke action on boundary strata through parabolic restriction

Prove LocallySymmetric.BorelSerre.stratum_hecke_restrict. Let `P=M⋉N` be a proper rational parabolic
and `K` a good neat level. Write the induced `G`-stratum
`X^P_K=⊔_g Y^P_{L_g}, g∈P(A^∞)∖G(A^∞)/K, L_g=P(A^∞)∩gKg⁻¹`; for decomposed `L_g=L_{M,g}⋉L_{N,g}` use
its own Levi base `X^M_{L_{M,g}}`.
Restriction `RΓ(∂X̄_K,B)→RΓ(X^P_K,B)` is Hecke-equivariant for the induced parabolic action. For `P`
maximal extension by zero `RΓ_c(X^P_K,B)→RΓ(∂X̄_K,B)` followed by restriction is the forget-supports
map. At the distinguished component `g=1` with `G^S=P^SK^S` and `K_P` decomposed, evaluation on that
component identifies the induced-invariants action with pullback through `r_P`. For a coefficient
direct summand `A⊂B^{K_{N,S}}`, the projection to the Levi and this inclusion give
`i:r_M^*RΓ(X^M_{K_M},A)→RΓ(Y^P_{K_P},B)`, with a splitting `s` after forgetting the Hecke action, `s∘i=1`
(NT16 Proposition 3.4). If `G^S≠P^SK^S`, evaluation is only the split morphism of ACC+ Lemma 2.1.14;
it is not an identification of the entire induced stratum with `Y^P_{K_P}`. Other components use the
transported levels and corresponding coefficient actions. Consequently all global stratum formulas
must be summed/induced across `g`, and the split Levi summand has Hecke action through `S=r_M∘r_P`. The
statement assumes: `K` good and neat; each used transported `P`-level decomposed with respect to `P=M⋉N`.
`P` is maximal for the extension-by-zero assertion. The distinguished-component identification
requires `G^S=P^SK^S`; the split Levi map requires the stated coefficient direct summand. ([NT16,
§3.1, Proposition 3.8(2), p. 49]; [NT16, §3.1, Proposition 3.4, pp. 44–45]; [ACC+23, §2.1.9, Lemma
2.1.14, pp. 915–916])

*Needs:* ALS.4.2; ALS.2.5;
ALS.2.8; ALS.3.3;
SmoothRepresentationsOfLocalGroups SR.2.2 (modulus character, Jacquet functor and parabolic
induction).

**Checks.**

- For `GL₂/ℚ`, upper Borel `B` and hyperspecial `U`, the Hecke action on cusp-circle `H⁰` uses
  `S(T_ℓ)=ℓ[diag(ℓ,1)]+[diag(1,ℓ)]`, giving `1+ℓ` on constant functions.
- If `K_{N,S}` acts trivially on `B`, then `B^{K_{N,S}} = B` and the split Levi map applies with `A = B`.

### ALS.4.4 Nomizu–van Est: cohomology of unipotent arithmetic groups is Lie algebra cohomology

Prove LocallySymmetric.nomizu. Let `N` be a unipotent group over `ℚ, 𝔫_E=Lie(N)⊗ℚE, Γ_N⊂N(ℚ)` an
arithmetic lattice, `E` a number field, and `V` a finite-dimensional algebraic representation of `N_E`.
Rational Nomizu comparison, extended to `E`, gives `H*(𝔫_E,V)≅H*(Γ_N,V)`, the left side being the
cohomology of the absolute Chevalley–Eilenberg complex over `E` (ALS.F.5),
equivalently the local-system cohomology of `Γ_N∖N(ℝ)`. After
an embedding `E→ℂ` this is the comparison by the invariant `V`-valued differential-form complex with its
coefficient action. If `N` is the unipotent radical of a rational parabolic `P=M⋉N` and `V` extends to an
algebraic `P_E`-representation, its Lie cohomology carries the algebraic `M_E`-action. The fixed
nilmanifold comparison is equivariant for the normalizer of `Γ_N` in `M(ℚ)`; other commensurator
elements require transported lattices and their pullback/trace maps. No integral or mod-`p`
Nomizu–Kostant comparison is asserted. The statement assumes: `E` a number field of characteristic
zero; the comparison is `E`-linear, before any complex embedding; `V` a finite-dimensional algebraic
`N_E`-representation; `Γ_N` arithmetic in `N(ℚ)`, hence a lattice in `N(ℝ)`; For the Levi-equivariance
statement, `N` is the unipotent radical of the rational parabolic `P=M⋉N` and `V` extends to an algebraic
`P_E`-representation. ([HR15, §4.2.1, pp. 25–26])

*Needs:* ALS.2.8; ALS.2.6;
ALS.F.5 (absolute cochains, base change and invariant forms); Mathlib
`groupCohomology`.

**Checks.**

- `N = 𝔾_a, Γ_N = ℤ, V = E` with trivial action: `H⁰ = H¹ = E`, matching `H^*(𝔫, E)` for the
  one-dimensional abelian `𝔫`.
- `N = 𝔾_a` and `V = Sym^k(E²)` restricted to the upper unipotent: `H⁰(𝔫, V)` and `H¹(𝔫, V)` are
  one-dimensional (highest and lowest weight lines).
- `N` the Heisenberg group (the unipotent radical of the Borel of `GL_3`) and
  `V = E: H¹(𝔫, E) = (𝔫/[𝔫, 𝔫])^* = E²`, matching `H¹(Γ_N, E) = Hom(Γ_N, E)` for the integral
  Heisenberg group, whose
  abelianization has `rank 2`.

### ALS.4.5 Kostant's theorem over a splitting field

Prove LocallySymmetric.kostant_splittingField. Let `E` be a field of characteristic zero over
which `𝐆 = Res_{F/ℚ} G` is split, with a split maximal torus `T ⊂ B` defined over `E`, a standard
parabolic `P = M ⋉ N` containing `B` with Levi `M ⊇ T`, `𝔫_E = Lie(N_E)`, and `V_λ` the irreducible
algebraic `𝐆_E`-representation of dominant integral highest weight `λ`. Let `W^P` be Kostant's
representatives (the `w` with `w⁻¹α > 0` for every simple root `α` of `M`) and `w·λ = w(λ + ρ) − ρ`.
Then there is an isomorphism of algebraic `M_E`-representations

```text
H^q(𝔫_E, V_λ) ≅ ⊕_{w ∈ W^P, ℓ(w) = q} V^M_{w·λ},
```

multiplicity free, where the left side is the cohomology of the absolute Chevalley–Eilenberg complex
over `E` with the coefficient action of `M` tensored with the contragredient action on `∧^• 𝔫_E`.
Over `ℂ` this is Kostant's theorem, owned here and proved by Kostant's Laplacian argument on
`∧^• 𝔫 ⊗ V_λ` ([Kos61]). For general `E` the proof descends: choose a subfield `E₀ ⊂ E` finitely
generated over `ℚ` over which `T`, `B` and `P` are defined and `T` is split; then `V_λ`, the
`M`-action and the cochains `Hom(∧^q 𝔫, V_λ)` are defined over `E₀`, and `E₀` embeds in `ℂ`, being
of
finite transcendence degree over `ℚ` (an arbitrary characteristic-zero `E` need not embed in `ℂ`).
The finite-dimensional cochain complexes commute with the base changes `E₀ → ℂ` and `E₀ → E`
(ALS.F.5) compatibly with `M`; algebraic representations of the split reductive `M`
in characteristic zero are semisimple with absolutely irreducible simple objects `V^M_μ` defined
over
`E₀` (ALS.F.7), and the multiplicity of `V^M_μ` is unchanged by
base change. The statement
includes the centre of `M`: the full Levi weight `w·λ` is kept. No statement over `𝒪_E` or in
positive characteristic is made. The statement assumes `E` of characteristic zero splitting `𝐆`,
with the torus, Borel and `P` defined over `E` and compatible. ([HR15, §4.2.3, (4.5), p. 27],
after [Kos61])

*Needs:* ALS.F.5 (absolute cochains and base change);
ALS.F.7 (algebraic weights);
RepresentationTheory/LieHighestWeight,
Layers 4, 5, 7 and 9 (highest weights, complete reducibility, the Casimir element and Weyl group
combinatorics).

**Checks.**

- `GL_{2,ℚ}`, `E = ℚ`, `P = B`, `λ = (k, 0)`: `W^B = {1, s}`, `H⁰(𝔫, V_λ) = E(k, 0)` (the highest
  weight line) and `H¹(𝔫, V_λ) = E(−1, k + 1)` (`s·λ = (−1, k + 1)`).
- Degenerate: `P = G` gives `N = 1`, `W^P = {1}` and `H⁰ = V_λ`.
- Non-example: the Levi action cannot be replaced by its restriction to the derived group; for
  `GL_2`, `λ = 0`, the two summands `E(0, 0)` in degree `0` and `E(−1, 1)` in degree `1` have the
  same restriction to `SL_1 × SL_1 = 1` but different central characters, which is what the Hecke
  computations of ALS.4.6 detect.
- A splitting field with no complex embedding: `E = ℚ(t_i : i ∈ I)` with `|I|` larger than the
  cardinality of `ℂ` splits `GL_2`; the theorem holds over it by descent to `E₀ = ℚ`, although the
  route through an embedding `E ↪ ℂ` is unavailable.

### ALS.4.6 Cohomology of a boundary stratum via van Est and Kostant

Prove LocallySymmetric.BorelSerre.stratum_kostant. Let `G` be connected reductive over `F, P=M⋉N`
proper, `K` good neat, `E` a number field that splits `𝐆=Res_{F/ℚ}G` and contains all embeddings of `F`, and
`V_λ` the irreducible algebraic `𝐆_E`-representation of dominant integral highest weight `λ` for a fixed
split Borel and torus. For each transported decomposed level `L_g` from
ALS.2.8, Leray/Hochschild–Serre gives
`E₂^{a,b}=H^a(X^M_{L_{M,g}},H^b(𝔫,V_λ)~)⇒H^{a+b}(Y^P_{L_g},V_λ)`, by Nomizu–van Est. Kostant's theorem
over `E` (ALS.4.5) identifies `H^b(𝔫,V_λ)=⊕_{w∈W^P,ℓ(w)=b}V^M_{w(λ+ρ)−ρ}` as
algebraic `M_E`-representations; this describes the `E₂` page for general reductive `G` and does not
assert degeneration. For `𝐆=Res_{F/ℚ}GL_N` with `F` totally real and `E/ℚ` Galois containing `F`, the
Leray–Serre spectral sequence of the nilmanifold fibration degenerates at `E₂`, by Schwermer ([Schw83,
Theorem 2.7]; [Schw90, §7]), as recorded in Harder–Raghuram §4.2.1, and Harder–Raghuram (4.2) and
Proposition 4.3 then give the natural cohomological decomposition
`H^q(X^P_K,V_λ)=⊕_g⊕_{w∈W^P}H^{q−ℓ(w)}(X^M_{L_{M,g}},V^M_{w·λ})`, with the
transported-component and real-component invariants of that source. Over all levels this is its
algebraic unnormalized induction from `π₀(P(ℝ))×P(A^∞)` to `π₀(G(ℝ))×G(A^∞)`. At eligible hyperspecial
components the Hecke action is through the integral unnormalized `S=r_M∘r_P`; conversion to normalized
induction multiplies by the explicit modulus half-character. A general reductive direct-sum/derived
splitting requires a separate Levi-equivariant nilpotent-cochain formality theorem; `E₂` degeneration
alone would give only an associated graded, not a canonical splitting. No integral Kostant
decomposition is asserted. The statement assumes: `F` a number field; `E/ℚ` a finite characteristic-zero
splitting field for `𝐆=Res_{F/ℚ}G` containing all embeddings of `F; Fix` the split torus and Borel over
`E` and a dominant integral highest weight `λ; P` and its Levi are compatible with these choices; `K` neat
and decomposed at the transported levels; The cited natural direct-sum decomposition and
real-component induction of Harder–Raghuram are used for `𝐆=Res_{F/ℚ}GL_N` with `F` totally real and `E/ℚ`
Galois containing `F`. General reductive `G` uses the `E₂` spectral sequence unless a separate splitting
theorem is supplied. ([HR15, §4.2.1, p. 25, citing Schw83, Theorem 2.7, and Schw90, §7]; [HR15,
§4.2.1, (4.2), p. 26]; [HR15, §4.2.3, (4.5), p. 27]; [HR15, §4.2.1, Proposition 4.3, p. 26])

*Needs:* ALS.4.4; ALS.4.3;
ALS.4.2; ALS.2.8;
ALS.4.5; ALS.F.5; SmoothRepresentationsOfLocalGroups
SR.2.2 (modulus character,
Jacquet functor and parabolic induction).

**Checks.**

- `GL_{2,ℚ}, P = B, λ = (k, 0): W^B = {1, s}, H⁰(𝔫, V_λ) = E(k, 0), H¹(𝔫, V_λ) = E(−1, k + 1)`, so
  each cusp contributes the characters (k,0) in degree 0 and `(−1, k+1)` in degree 1.
- `λ = 0: H^*(𝔫,E) = ⊕_{w∈W^P} V^M_{w·0}[−ℓ(w)]`. These are irreducible Levi representations, not
  generally one-dimensional characters; for a Borel `M` is a torus and the character notation `E(w·0)`
  is valid.
- `GL_{3,ℚ}, P = B, λ = 0: W^B = S_3` has one element of length 0, two of lengths 1 and 2 and one of
  length 3, so `H^*(𝔫, E)` has dimensions 1, 2, 2, 1, the Betti numbers of the three-dimensional
  Heisenberg nilmanifold.

### ALS.4.7 The integral Leray–Hochschild–Serre spectral sequence of a stratum

Prove LocallySymmetric.BorelSerre.stratum_hochschildSerre. For neat decomposed `K` and `P=M⋉N`, write
`X^P_K=⊔_gY^P_{L_g}`, with all levels and arithmetic groups transported as in
ALS.2.8. For each component the discrete extension
`1→Γ_{N,g}→Γ_{P,g}→Γ_{M,g}→1` gives `E₂^{a,b}=H^a(Γ_{M,g},H^b(Γ_{N,g},V))⇒H^{a+b}(Γ_{P,g},V)`,
equivalently the Leray sequence on the Levi base with the indicated local coefficient sheaf. Sum
these sequences across `g`. They are Hecke-compatible through the induced parabolic action and the `r_M`
comparison where its hypotheses hold. Coefficient base change is a derived map of spectral
sequences, retaining Tor terms; it is not an isomorphism of `E₂` pages without flatness. In the
special NT16 Lemma 4.5 setting, `N` is an `F`-unipotent group, `Γ_N` is a congruence subgroup `N(F)∩U_N`,
and `k` has the stated `p`-residue coefficients with trivial `N`-action. The comparison with `U_{N,S}` uses
the discrete groups and the arithmetic acyclicity argument in that lemma. The pro-`p` topology of
`U_{N,S}` does not by itself identify its continuous cohomology with this discrete cohomology; no
general discrete/profinite comparison is claimed here. The statement assumes: `K` neat and decomposed;
`V` finite projective. ([NT16, §4, Lemma 4.5, p. 57]; [HR15, §4.2.1, p. 25, before (4.2)])

*Needs:* ALS.2.8; ALS.4.3;
Mathlib `groupCohomology`; ALS.1.5; AlgebraicTopology, Stage 5.

**Checks.**

- For `GL_{2,ℚ}, P = B: Γ_N ≅ ℤ, E_2^{a,b} = H^a(pt, H^b(ℤ, V))`, giving `H⁰` and `H¹` of the cusp
  circle as invariants and coinvariants of the unipotent monodromy on `V`.
- In characteristic 0, over a number field `E` splitting the group and for `V=V_λ` irreducible of
  dominant integral highest weight, the `E_2` page is the Kostant–van Est formula.

### ALS.4.8 Gluing over strata: convergence and Hecke compatibility of the boundary spectral sequence

Prove LocallySymmetric.BorelSerre.boundary_localized_vanishing. The compact-support exact couple
of ALS.2.9 is Hecke-equivariant, finite and convergent, with
`d_r:(p,q)→(p−r,q+r+1)`. Each global term is the sum/induction over its transported `P`-spaces. Exact
localization of this finite filtration shows: if `H^*_c(X^P_K,V)_𝔪=0` for every proper `P`, then
`H^*(∂X̄_K,V)_𝔪=0`. If only open maximal-parabolic strata survive, extension by zero identifies their
direct sum of compact-support complexes with the localized boundary complex. To deduce the
compact-support hypothesis from ordinary-stratum vanishing at neat level over a field, use the
stratum duality of ALS.5a.2 on the compactified transported spaces of
ALS.2.10 and the Hecke adjoints of
ALS.5a.4: `H^*(X^P_K,V^∨⊗o_P)_{𝔪^∨}=0` implies `H^*_c(X^P_K,V)_𝔪=0`, where
`𝔪^∨` is transported through the inverse-double-coset involution. Over `O` first reduce coefficients
modulo `ϖ`, use this field duality and the perfectness of ALS.2.10, then
derived Nakayama. Ordinary vanishing for `V` at `𝔪` is sufficient only when an additional argument
supplies the
required dual-coefficient/inverse-ideal vanishing (as in NT16 Lemmas 4.1 and 4.4). For `Res_{F/ℚ}GL_N`
with `F` totally real the separate ordinary flag sequence also converges, with alternating-restriction
`d₁:(p,q)→(p+1,q)`; it is not substituted for the support argument in NT16’s proof. The statement
assumes: `K` neat; `𝔪` a maximal ideal of `T^S`. ([NT16, §4, proof of Lemma 4.4, p. 56]; [ACC+23, §2.4.1,
proof of Theorem 2.4.2, p. 942])

*Needs:* ALS.2.9; ALS.2.10;
ALS.4.3; ALS.4.9;
ALS.5a.2; ALS.5a.4.

**Checks.**

- If no stratum has `𝔪` in its support, the boundary vanishes at `𝔪`.
- For `F`-rank one the spectral sequence is a direct sum (the check stratSS_rank_one_collapse of
  ALS.2.9), the strata being compact, so `H^*_c = H^*` on them.
- For `GL_{3,ℚ}` the two maximal strata sit in `p = 0` and the Borel stratum in `p = 1`, so the only
  differential is `d₁ : E₁^{1,q} → E₁^{0,q+2}`, from the compactly supported cohomology of the Borel
  stratum to that of the maximal strata.

### ALS.4.9 Localizing perfect Hecke complexes at a maximal ideal

Define LocallySymmetric.heckeLocalize. Let `C` be a perfect complex of `O`-modules with a homomorphism
`T^S → End_{D(O)}(C)` and `T^S(C)` its (commutative, finite) image. For a maximal ideal `𝔪 ⊂ T^S(C)` let
`e_𝔪 ∈ T^S(C)` be the idempotent of the factor `T^S(C)_𝔪` in `T^S(C) = ∏_𝔪 T^S(C)_𝔪`. Since idempotents
split in `D(O), C ≅ C_𝔪 ⊕ C′` with `e_𝔪` acting as the projector onto `C_𝔪`, unique up to unique
isomorphism; `T^S(C)_𝔪 ≅ T^S(C_𝔪)` and `H^*(C)_𝔪 ≅ H^*(C_𝔪)`. For a maximal ideal `𝔪` of
`T^S, C_𝔪 := C_{𝔪T^S(C)}` (zero if `𝔪` is not in the support). Localization is functorial for
`T^S`-equivariant maps
between such complexes, exact (carries exact triangles of `T^S`-complexes to exact triangles), and
commutes with coefficient change `O → O/ϖ^m`. This is IntegralHeckeAndGaloisDeterminants' idempotent
splitting (§2.2, finite local factors and idempotent summands) applied to
arithmetic complexes; when `C` is a Hecke complex of ALS.3.4, the summand `C_𝔪` is
again a strict object, and derived tensor product with `T^S_𝔪` computes it. The statement assumes: `O` a
complete discrete valuation ring; `C` perfect. ([NT16, §3.2, p. 52])

The API: LocallySymmetric.heckeLocalize — `C ↦ C_𝔪`, the `e_𝔪`-summand of a perfect `T^S`-complex, with
inclusion and projection maps; LocallySymmetric.heckeLocalize.cohomology — `H^*(C_𝔪) ≅ H^*(C)_𝔪` as
`T^S`-modules; LocallySymmetric.heckeLocalize.heckeAlgebra — `T^S(C_𝔪) ≅ T^S(C)_𝔪`;
LocallySymmetric.heckeLocalize.triangle — Localization carries `T^S`-equivariant exact triangles to
exact triangles (`e`.`g`. the boundary triangle); LocallySymmetric.heckeLocalize.eq_zero_iff — `C_𝔪 = 0`
iff `𝔪` is not in the support of `H^*(C)`; LocallySymmetric.heckeLocalize.reduction —
`(C ⊗^L O/ϖ^m)_𝔪 ≅ C_𝔪 ⊗^L O/ϖ^m`.

*Needs:* ALS.3.11; IntegralHeckeAndGaloisDeterminants, Layer 2 (derived
Hecke images, ghosts, finite local factors, idempotent splitting); Mathlib
`CategoryTheory.IsIdempotentComplete`; ALS.F.2 (perfect complexes).

**Checks.**

- heckeLocalize_unsupported: If `𝔪 ∉` Supp `H^*(C)`, then `C_𝔪 ≅ 0`.
- heckeLocalize_module: If `C = M[0]` for a finite `T^S`-module `M, C_𝔪 = M_𝔪[0]`, the localization of
  commutative algebra.
- heckeLocalize_sum: `C ≅ ⊕_𝔪 C_𝔪` over the finitely many maximal ideals of `T^S(C)`.
- heckeLocalize_not_tensor: A ring homomorphism `T^S→End_D(O)(C)` does not itself specify a strict
  cochain `T^S`-action. With a specified compatible lift to `D(T^S)`, derived tensor with `T^S_𝔪` computes
  localization. The geometric relative ring action alone does not provide this lift.

### ALS.4.10 Galois type, Eisenstein and non-Eisenstein maximal ideals

Define LocallySymmetric.IsGaloisType. Let `G = GL_{m,F}, S ⊃ S_p, T^S = T^S_{GL_m}` generated by
`T_v^i (i = 1, …, m)` and `(T_v^m)⁻¹, v ∉ S`. A perfect `T^S`-complex `C` of `O`-modules is of `S`-Galois type
if for each maximal ideal `𝔪 ⊂ T^S(C)` there is a continuous semisimple
`ρ̄_𝔪 : G_{F,S} → GL_m(T^S(C)/𝔪)` with `det(X − ρ̄_𝔪(Frob_v)) = X^m − T_v^1X^{m−1} +` …
`+ (−1)^j q_v^{j(j−1)/2}T_v^jX^{m−j} +` … `+ (−1)^m q_v^{m(m−1)/2}T_v^m` for all `v ∉ S`. The
polynomial is
the spherical Hecke polynomial of IntegralHeckeAndGaloisDeterminants Layer 3a, and the predicate is
its Layer 3b Galois-type predicate applied to every maximal ideal of the derived Hecke algebra of `C`. Then `𝔪` is
Eisenstein if `ρ̄_𝔪` is absolutely reducible and non-Eisenstein otherwise
(its Layer 3b non-Eisenstein predicate); `C` is Eisenstein if all its maximal ideals are. For `PGL_2` over an
imaginary quadratic `F` (CG18), a maximal ideal `𝔪` of the Hecke algebra `T_Q` is Eisenstein if
`T_λ − 2 ∈ 𝔪` for all but finitely many primes `λ` splitting completely in some fixed abelian
extension of `F`; both
definitions agree when `ρ̄_𝔪` exists (reducible semisimple `ρ̄` with determinant conditions forces
`T_λ ≡ 2` on a density-one set of split `λ`). The statement assumes: `G = GL_m` (Galois definition);
`G = PGL_2`
over imaginary quadratic `F` (CG18 definition). ([NT16, §4, p. 54]; [CG18, §5.3, Definition 5.5, p.
57])

The API: LocallySymmetric.IsGaloisType — A perfect `T^S`-complex `C` is of `S`-Galois type: residual
representations `ρ̄_𝔪` with the displayed Frobenius characteristic polynomials exist for all `𝔪`;
LocallySymmetric.IsEisenstein — `𝔪` is Eisenstein: `ρ̄_𝔪` is absolutely reducible (for `C` of `S`-Galois
type); LocallySymmetric.IsEisenstein.of_cohomology — `S`-Galois type and the Eisenstein property of
`C` depend only on `H^*(C)` with its `T^S`-action; LocallySymmetric.IsEisensteinCG — CG18's notion for
`PGL_2/F: T_λ − 2 ∈ 𝔪` for almost all `λ` split in a fixed abelian extension;
LocallySymmetric.IsEisenstein.iff_CG — For `PGL_2` over imaginary quadratic `F` with `ρ̄_𝔪` existing,
the two notions agree.

*Needs:* ALS.4.9; ALS.3.11; Mathlib
`Matrix.GeneralLinearGroup`; IntegralHeckeAndGaloisDeterminants, Layers 3a–3b
(spherical Hecke polynomials, Galois-type and non-Eisenstein predicates).

**Checks.**

- eisenstein_H0: For `GL_2`, the constant-functions eigensystem on `H⁰` has `T_v^1 = 1 + q_v` and
  `T_v^2 = 1`. Its Hecke polynomial is `X² − (1+q_v)X + q_v = (X−1)(X−q_v)`, so the associated
  residual
  representation is reducible. The cyclotomic character or its inverse is fixed by the Frobenius
  convention; `T_v^2 = q_v` would give the wrong determinant `q_v²`.
- eisenstein_GL1: For `m = 1` every maximal ideal of `S`-Galois type is non-Eisenstein
  (one-dimensional representations are irreducible).
- eisenstein_iff_CG_PGL2: For `PGL_2` over imaginary quadratic `F, ρ̄_𝔪` reducible `⇔ T_λ − 2 ∈ 𝔪` for
  almost all `λ` split in a fixed abelian extension (CG18 Definition 5.5).
- siegel_pullback_boundary_can_survive: In the setting of ALS.4.13,
  boundary cohomology of `U(n,n)` can survive at `𝔪̃ = S⁻¹(𝔪)`, the Satake pullback of a non-Eisenstein
  ideal `𝔪` for the Siegel Levi `Res_{F/F⁺}GL_n`. The ambient rank-2n system at `𝔪̃` is Eisenstein: it
  has two rank-`n` summands. The non-Eisenstein hypothesis is on `𝔪`.
  ([ACC+23, §2.4.1, Theorem 2.4.2 and its proof, pp. 941–945])
- siegel_pullback_isEisenstein: For `n ≥ 1`, either rank-`n` summand is a nonzero proper invariant
  subspace of the rank-2n pullback system, even when the summands are isomorphic. At `n = 1` the
  Levi character is absolutely irreducible, while its unitary pullback is a sum of two characters
  and has a proper invariant line. ([ACC+23, proof of Theorem 2.4.2, pp. 943–945])

### ALS.4.11 Boundary vanishing by an eigenvalue argument

Prove LocallySymmetric.boundary_vanishing_of_eigenvalues. Let `K` be neat and decomposed with
respect to the standard parabolics, `V` finite projective over `O` and `𝔪 ⊂ T^S_G` a maximal ideal. For
every proper `P=M⋉N` and every transported component `g` of the global `P`-stratum, use its actual level
`L_g`, Levi level `L_{M,g}`, and lattice `Γ_{N,g}`. For `W=V⊗k` at `𝔪` and also `W=(V⊗k)^∨⊗o_{P,g}` at the
inverse-double-coset ideal `𝔪^∨`, impose the following eigenvalue exclusion: no maximal ideal `𝔪_M` in
the support of any Levi complex `RΓ(X^M_{L_{M,g}},A)`, with `A` a finite local-coefficient subquotient
arising from `H^b(Γ_{N,g},W)`, pulls back through the unnormalized Satake map to the corresponding
`G`-ideal. Then `RΓ(∂X̄_K,V)_𝔪=0` and `RΓ_c(X_K,V)_𝔪→RΓ(X_K,V)_𝔪` is an isomorphism. The dual exclusion
can equivalently be replaced by direct vanishing of every compact-support stratum complex at `𝔪`. It
is not inferred from the ordinary exclusion alone. These are actual conditions on all transported
Levi eigensystems; the label non-Eisenstein alone proves nothing. The statement assumes: `K` neat and
decomposed; the stated ordinary and dual/inverse-ideal exclusions for every proper parabolic and
every transported component, or the stated direct compact-support alternative. ([NT16, §4, Lemma
4.4, p. 55]; [ACC+23, §2.4, p. 941])

*Needs:* ALS.4.8; ALS.4.7;
ALS.4.1; ALS.4.9;
ALS.4.2; ALS.5a.2;
ALS.5a.4.

**Checks.**

- In the PGL₂/`ℚ` trivial-coefficient case where every cusp component has the trivial torus
  eigensystem, `T_ℓ` acts on cusp `H⁰` by `1+ℓ` in the stated normalization. Exclusion of this eigensystem
  and its dual/inverse counterpart kills the cusps. At levels with nontrivial torus characters,
  exclude all occurring character eigensystems; a test against `1+ℓ` alone is insufficient.
- For `GL_n` this is the mechanism of NT16 Theorem 4.2.

### ALS.4.12 Boundary cohomology of `GL_n` is Eisenstein

Prove LocallySymmetric.boundary_isEisenstein_GL. Let `F` be a number field, `G = GL_{n,F}, S ⊃ S_p`,
and `U ⊂ GL_n(𝔸_F^∞)` neat with `U = ∏_v U_v, U_v ⊂ GL_n(O_{F_v})` for all `v` and `U_v = GL_n(O_{F_v})` for
`v ∉ S` (NT16 writes `U ∈ J_{G,U_S}`). Assume ♠: for every `1 ≤ m ≤ n` and every such
level for `GL_m, RΓ(X^U_{GL_m}, k)` is of `S`-Galois type (this is Newton–Thorne's hypothesis ♠; the
attachment of residual representations to torsion classes uses the cohomology of Shimura varieties
built on this roadmap, so it is a hypothesis here, exactly as in the source). In addition assume the
orientation-compatible form of this input: for every such `GL_m` level and finite smooth `k[U_S]`-module
`B, RΓ(X^U_{GL_m}, B^∨⊗o_U)` is of `S`-Galois type with the same rank-`m` unnormalized Hecke-polynomial
convention. At orientable levels this extra condition follows from the ordinary finite-coefficient
input; at general real-place levels it is an explicit additional hypothesis, not a consequence of
neatness. Then for every smooth `O[U_S]`-module `A`, finite over `O, RΓ(∂X̄^U_G, A)` is Eisenstein; hence
for every non-Eisenstein maximal ideal `𝔪 ⊂ T^S(RΓ(X^U_G, A)), (RΓ_c(X^U_G, A))_𝔪 → (RΓ(X^U_G, A))_𝔪`
is a quasi-isomorphism. Variants: (a) for `G = PGL_{n,F}, F` imaginary CM, at the levels
`Y(K), Y_0(Q), Y_1(Q)` of CG18 §9 and `O/ϖ^n` coefficients, if `r̄_𝔪` is absolutely irreducible then
`H^*(∂Y_?, O/ϖ^n)_𝔪 = 0; (b)` for `PGL_2` over imaginary quadratic `F, Q` a set of Taylor–Wiles
primes as in CG18 §5.3, `Δ` a
quotient of `Δ_Q` of `p`-power order and `μ` a finitely generated `O[Δ]`-module, viewed as a local system on
`Y_0(Q)` through the covering `Y_Δ(Q) → Y_0(Q)`, and `𝔪` the maximal ideal of CG18's `T^univ` determined by
a non-Eisenstein maximal ideal `𝔪_∅` of `T_∅` (CG18 Definition 5.5) and a choice of `U_x`-eigenvalue for
each `x ∈ Q, H_i(Y_0(Q), μ)_𝔪 ≅ H_i^{BM}(Y_0(Q), μ)_𝔪` (CG18 Lemma 5.9(3)). The statement assumes: ♠
(Galois
type for `GL_m, m ≤ n`); `U` neat, `U = ∏_v U_v` with `U_v ⊂ GL_n(O_{F_v})`, hyperspecial outside `S`;
Orientation-compatible Galois type for the dual coefficient system `B^∨⊗o_U` at every `GL_m` level used
in the induction; for variant `(b), μ` finitely generated over `O[Δ]` with `Δ` a `p`-power quotient of `Δ_Q`
and `𝔪` coming from a non-Eisenstein `𝔪_∅`. ([NT16, §3.1, p. 42], for `J_G`; [NT16, §4, Theorem 4.2,
p. 55]; [CGH20, §3.1, proof of Theorem 3.2, pp. 5–6]; [CG18, §5.3.1 and Lemma 5.9(3), pp. 58–61])

*Needs:* ALS.4.11; ALS.4.10;
ALS.4.3; ALS.3.11;
ALS.5a.2; ALS.5a.4.

**Checks.**

- For `GL_{2,ℚ}` and modular curves, `H^*(∂X̄_K)_𝔪 = 0` for every `𝔪` with `ρ̄_𝔪` irreducible, so interior
  and compactly supported cohomology agree at `𝔪`.
- For `n = 1` the boundary is empty.
- Finite coefficients need not be projective: for
  `A = O/ϖ ⊕ O, RΓ(∂X̄^U_G, A) = RΓ(∂X̄^U_G, O/ϖ) ⊕ RΓ(∂X̄^U_G, O)` is perfect over `O`
  (ALS.2.4 (iv)), and its
  derived Hecke algebra is Eisenstein when those of the two summands are.

### ALS.4.13 Localized boundary cohomology of `U`(n, n) is the Siegel stratum

**Residual-unitary Galois-type contract — LocallySymmetric.ResidualUnitaryGaloisInput.**
For a CM field `F` with maximal totally real subfield `F⁺`, `n ≥ 1`, a complete coefficient DVR
`O` with finite residue field of characteristic `p`, and a finite conjugation-stable set
`S ⊃ S_p` containing the places ramified over `F⁺`, define the following input. For every
`0 < a < n`, every good level `L ⊂ U(a,a)(𝔸^∞_{F⁺})` hyperspecial outside `S`, every finite
extension `k` of the residue field of `O`, and every finite-dimensional smooth discrete
`k[L_S]`-module `B`, each maximal ideal `η` of `T̃^S_a ⊗_O k` in the Hecke support of
`H^*(X^{U(a,a)}_L, B)` has finite residue field `k_η` and a continuous semisimple representation
`ρ̄_η : G_{F,S} → GL_{2a}(k_η)` satisfying

```text
det(X − ρ̄_η(Frob_v)) = P̃_{a,v}(X) mod η,
P̃_{a,v}(X) = Σ_{j=0}^{2a} (−1)^j q_v^{j(j−1)/2} T̃_{v,j} X^{2a−j},  T̃_{v,0} = 1,
```

for every `v ∉ S`. Here `T̃_{v,j}` are the unitary spherical operators of ACC+23 §2.2.5,
defined through unramified base change, including at inert places; `Frob_v` is geometric.
Use the Galois-type predicate of IntegralHeckeAndGaloisDeterminants Layer 3b with rank `2a` and these polynomials. The quantifiers include all
transported factor levels, their good refinements inside `S`, every finite local-coefficient
subquotient arising in the stratum spectral sequences, and `B^∨ ⊗ o_L`. They also include the
finite coefficient-field extensions needed to split the product Levi eigensystems. The contract
is stable under restricting the rank and level families and supplies a realizing representation
for each supported eigensystem. Its all-finite-coefficients form is an explicit hypothesis:
the source obtains the needed instances by shrinking level to trivialize finite coefficients
and preserving Hecke support by Hochschild–Serre. The Shimura-variety existence theorem is not a
target here. ([ACC+23, §2.2.5, (2.2.7), p. 922]; [ACC+23, Theorem 2.3.8 and its proof,
pp. 939–940]; [ACC+23, proof of Theorem 2.4.2, pp. 942–945])

*Needs:* ALS.3.11; ALS.4.10;
IntegralHeckeAndGaloisDeterminants, Layer 3b (the Galois-type predicate, applied to the specified
unitary polynomial system). Arithmetic existence is assumed by this contract.

**Checks.**

- At `a = 1` the polynomial is `X² − T̃_{v,1}X + q_v T̃_{v,2}` and the supplied representation
  has dimension two; rank-one general linear Galois type cannot supply it.
- A finite stratum coefficient module `B`, its dual orientation twist, and their scalar extensions
  to a finite residue field all lie in the contract, even when `B` has nontrivial level action.
  Trivial-coefficient Galois type at a single fixed level does not meet these quantifiers.
- For `n = 1` there is no positive `a < n`, so the input is vacuous; for `n = 2` it includes
  precisely the smaller unitary group `U(1,1)` at every specified level and coefficient system.

Prove LocallySymmetric.boundary_localized_eq_siegel. Let `F` be CM with maximal totally real
subfield `F⁺, n ≥ 1, O` as in `ResidualUnitaryGaloisInput`, and `G̃` the quasi-split unitary group
`U(n, n)` over `F⁺` with Siegel parabolic `P = G ⋉ U, G = Res_{F/F⁺}GL_n, K̃` good and decomposed
with respect to `P, K = K̃ ∩ G(A^∞_{F⁺}), S = S^c`. Let `𝔪 ⊂ T^S(K, λ)` be non-Eisenstein and
`𝔪̃ = S^*(𝔪) ⊂ T̃^S`. Then for every `λ̃ ∈ (ℤ^{2n}_+)^{Hom(F⁺,E)}` there
is a natural `T̃^S`-equivariant isomorphism `RΓ(X̃^P_{K̃}, Ṽ_λ̃)_𝔪̃ ≅ RΓ(∂X̃_{K̃}, Ṽ_λ̃)_𝔪̃` in `D(O)`:
after localization only the Siegel stratum contributes. A proper standard Levi is
`∏_i Res_{F/F⁺}GL_{n_i} × U(n−s,n−s)`, with `Σ_i n_i = s`, `1 ≤ s ≤ n`; the unitary factor is
absent when `s = n`. The general linear Galois-type input supplies the rank-`n_i` representations
and `ResidualUnitaryGaloisInput` supplies the rank-`2(n−s)` representation. After a common finite
residue-field extension, the unnormalized Satake polynomial comparison assembles them with the
conjugate dual general linear factors and the prescribed cyclotomic twists; the middle unitary
factor is twisted by `ε^{−s}`. For a non-Siegel Levi every `n_i < n`, so this semisimple
representation has a nonzero constituent of dimension less than `n`. It cannot realize the
polynomials at `𝔪̃`, whose Siegel pullback has two absolutely irreducible rank-`n` constituents.
Apply this exclusion also to the dual coefficients at the inverse Hecke ideal, use stratum
duality, and run ALS.4.8 to kill the compact-support non-Siegel
terms. Applying the same exclusion to the boundary of the Siegel stratum's closure identifies its
compactly supported and ordinary localized complexes, giving the displayed isomorphism. The
statement assumes: `F` CM; `K̃` good and decomposed with respect to `P; 𝔪` non-Eisenstein (of Galois type
with `ρ̄_𝔪` absolutely irreducible); `S` finite with `S ⊃ S_p, S = S^c`, containing the places ramified
over `F⁺`, and `K̃` hyperspecial outside `S`; for every `1 ≤ m ≤ n` and every good general linear factor
level hyperspecial outside `S`, the Hecke complexes of `Res_{F/F⁺}GL_m` with all finite smooth
coefficients over finite extensions of the residue field, including their dual orientation twists,
are of `S`-Galois type (IntegralHeckeAndGaloisDeterminants, Layer 3b); and `ResidualUnitaryGaloisInput(F,n,O,S)`.
([ACC+23, §2.4.1, Theorem 2.4.2, pp. 941–942]; [ACC+23, Theorem 2.3.8, pp. 939–940];
[ACC+23, §2.4.1, complete proof of Theorem 2.4.2, pp. 942–945])

*Needs:* ALS.4.8; ALS.4.12;
ALS.4.10; ALS.4.2;
ALS.2.5; ALS.5a.2;
ALS.5a.4;
`ResidualUnitaryGaloisInput` (the assumed residual-unitary
existence contract for all smaller unitary factors and the finite coefficients used above).

**Checks.**

- `n = 1: G̃ = U(1,1)`, the Siegel parabolic is the Borel and the boundary is its stratum.
- For `U(2,2)`, the non-Siegel maximal parabolic has Levi `Res_{F/F⁺}GL₁ × U(1,1)`.
  General linear Galois type supplies the rank-one factor;
  `ResidualUnitaryGaloisInput(F,2,O,S)` supplies the middle rank-two factor from the `U(1,1)`
  eigensystem. The Satake twists and conjugate dual give dimensions `1 + 2 + 1`, incompatible
  with the two irreducible rank-two constituents at `𝔪̃`; both ordinary and dual-coefficient
  exclusions apply. General linear inputs alone leave the middle factor unassigned.
- The hypothesis on `𝔪` cannot be dropped: an Eisenstein `𝔪` receives contributions from the Borel
  stratum.

### Examples

- Modular curves: `0 → H⁰ → H⁰(∂) = ℤ^c → H¹_c → H¹ → H¹(∂) = ℤ^c → H²_c → 0`, and the cusp circles
  carry `T_ℓ ↦ 1 + ℓ` on `H⁰` through `S(T_ℓ) = ℓ[diag(ℓ, 1)] + [diag(1, ℓ)]`; at a maximal ideal
  with irreducible residual representation the boundary vanishes and `H^*_c = H^*`.
- Kostant for `GL_{2,ℚ}`, `λ = (k, 0)`: `H⁰(𝔫, V_λ) = E(k, 0)`, `H¹(𝔫, V_λ) = E(−1, k + 1)`.
- Eisenstein test: the constant eigensystem has Hecke polynomial `X² − (1 + q_v)X + q_v = (X − 1)(X − q_v)`.

### Dependencies

Layers ALS.0–ALS.3; the first four targets of Layer ALS.5a; IntegralHeckeAndGaloisDeterminants,
Layers 2, 3a and 3b; SmoothRepresentationsOfLocalGroups SR.2.2 and SR.4.1; ReductiveGroupsPartII
RG2.3.3, RG2.4.2 and RG2.4.4; Layer ALS.F (ALS.F.2 and ALS.F.5);
RepresentationTheory/LieHighestWeight,
Layers 4, 5 and 9; Mathlib (`groupCohomology`,
`CategoryTheory.IsIdempotentComplete`).

## Layer ALS.5a: Finite-level duality with orientation coefficients

This layer proves duality at finite level. Douady–Hérault's rounding makes `X̄_K` a compact
topological manifold with boundary; Poincaré–Lefschetz duality with the orientation local system
then gives Verdier duality for perfect coefficient complexes, with its pairings, its Hecke adjoints
through inverse double cosets, its compatibility with the boundary triangle, and its form at
non-neat level under an averaging hypothesis. The same statements hold on each open boundary stratum
with its own dimension and orientation system.

### ALS.5a.1 `X̄_K` as a compact topological manifold with boundary

Prove LocallySymmetric.BorelSerre.manifoldWithBoundary. For neat `K`, round `X̄_K` by Douady–Hérault
Theorem and Definition 6.2: a positive boundary-defining product function and a strictly outward
vector field give a smooth manifold with boundary on the same underlying topological space, whose
smooth structure agrees away from corners of depth `≥2`. Proposition 4.2 supplies the topological
collar of the full boundary; choices alter the smoothing, not the underlying pair `(X̄_K,∂X̄_K)`. Its
interior is `X_K` and its boundary is a closed topological `(d_G−1)`-manifold. The orientation system
extends from the interior and restricts to the boundary orientation system via the outward-normal
convention, with a fixed sign if the inward normal is used instead. Thus AlgebraicTopology, Stage 6,
Poincaré–Lefschetz duality applies. Naturality of pair cohomology, orientation sheaves and
finite-cover transfers uses the original topological pair; it does not require a functorial
smoothing choice. The statement assumes: `K` neat. ([ACC+23, §2.1.1, p. 910]; [NT16, §3.1, Proposition
3.7(1), p. 48]; [DH73, Propositions 4.2–4.3, Proposition 6.1, Theorem and Definition 6.2, pp.
487–489])

*Needs:* ALS.2.3; ALS.0.12;
AlgebraicTopology, Stage 6; Mathlib `ModelWithCorners`.

**Checks.**

- For a modular curve, `X̄_K` is a compact surface with boundary circles.
- For `G` anisotropic, `X̄_K = X_K` is closed and the bridge is the identity.

### ALS.5a.2 Poincaré–Verdier duality for `X_K` with perfect coefficients and orientation twist

Prove LocallySymmetric.verdierDuality. Let `K` be neat, `R` a commutative ring, `d = d_G`, and `V` a bounded
complex of finite projective `R`-modules with `R[G(F) × K_S]`-action (a perfect coefficient complex);
`V^∨ = Hom_R(V, R)`. Then there is a natural isomorphism in
`D(R) RHom_R(RΓ_c(X_K, V), R) ≅ RΓ(X_K, V^∨ ⊗ o_K)[d]`, and likewise
`RHom_R(RΓ(X_K, V), R) ≅ RΓ_c(X_K, V^∨ ⊗ o_K)[d]` and, for the closed
(d−1)-manifold `∂X̄_K, RHom_R(RΓ(∂X̄_K, V), R) ≅ RΓ(∂X̄_K, V^∨ ⊗ o_K)[d − 1]`. These are natural in `V`,
compatible with coefficient change `R → R′` (ALS.1.7) and with pullback along
level maps (`π^*` dual to the trace `π_*`). In each degree they give the universal-coefficient sequences
`0 → Ext^1_R(H^{d−i+1}_c(X_K, V), R) → H^i(X_K, V^∨ ⊗ o_K) → Hom_R(H^{d−i}_c(X_K, V), R) → 0` when `R`
is a Dedekind domain. When `X_K` is orientable (`e`.`g`. `G(F_∞)` connected) `o_K` may be omitted, as in NT16
Proposition 3.7 and ACC+ Proposition 2.2.21. The same oriented-manifold argument gives
`RHom_R(RΓ_c(Y^P_{L_g},V),R)≅RΓ(Y^P_{L_g},V^∨⊗o_{P,g})[d_P]` for each good neat transported `P`-space of
ALS.2.5, with `d_P=dim e(P)` and its own orientation system. The proof is
the same on that open stratum: cap product with the fundamental class of the orientation local
system of the rounded compact manifold with boundary `Ȳ^P_{L_g}` of
ALS.2.10 (AlgebraicTopology, Stage 6), made a perfect-complex statement
by the finite model of ALS.2.10; a nonreductive parabolic is not
treated as a reductive `G`. For `X_K` itself: by ALS.5a.1 `(X̄_K, ∂X̄_K)`
is a compact topological manifold with boundary, Poincaré–Lefschetz duality with local coefficients
and the orientation system gives the isomorphisms on cohomology, and the finite projective models of
ALS.1.6 (made effective by ALS.2.4)
upgrade the chain-level cap product to an isomorphism in `D(R)` for perfect coefficient complexes. The
statement assumes: `K` neat; `R` commutative; `V` a bounded complex of finite projective `R`-modules. ([NT16,
§3.1, Proposition 3.7(1), p. 48]; [ACC+23, §2.2.20, Proposition 2.2.21, p. 932])

*Needs:* ALS.5a.1; ALS.1.6;
ALS.1.7; ALS.2.4; AlgebraicTopology,
Stage 6 (cap products with local coefficients, orientation local system, Poincaré–Lefschetz
duality); ALS.F.2 (perfect complexes);
ALS.2.5; ALS.2.8;
ALS.2.10.

**Checks.**

- For a modular curve (orientable surface, `d = 2`) `H²_c(X_K, R) ≅ R` per component and `H¹_c` is dual
  to `H¹`.
- For a nonorientable closed surface `Σ, H²(Σ, ℤ) = ℤ/2` but `H²(Σ, o) = ℤ`.
- On a transported Borel space of `SL_{2,ℚ}`, a circle (`d_B = 1`, empty boundary in
  ALS.2.10), the stratum duality pairs `H⁰_c = H⁰ = R` with `H¹ = R`.

### ALS.5a.3 Evaluation, cup-product and relative duality pairings

Define LocallySymmetric.dualityPairing. For neat `K`, commutative `R` and `V` as in
ALS.5a.2, define the cup-product pairings
`⟨·,·⟩ : H^i_c(X_K, V) × H^{d−i}(X_K, V^∨ ⊗ o_K) → H^d_c(X_K, o_K) → R` (cup product with the
evaluation `V ⊗ V^∨ → R`, then the
trace given by the fundamental class of the orientation local system) and the relative pairing
`H^i(X̄_K, ∂X̄_K; V) × H^{d−i}(X̄_K; V^∨ ⊗ o_K) → R`, identified with the first through
`RΓ_c(X_K) ≅ RΓ(X̄_K, ∂X̄_K)` and `RΓ(X_K) ≅ RΓ(X̄_K)`; and the boundary pairing
`H^i(∂X̄_K, V) × H^{d−1−i}(∂X̄_K, V^∨ ⊗ o_K) → R`. These pairings are the evaluations of the
isomorphisms of
ALS.5a.2; over a field they are perfect. The statement assumes: `K` neat;
`R` commutative. ([NT16, §4, proof of Lemma 4.1, p. 54])

The API: LocallySymmetric.dualityPairing — `⟨·,·⟩ : H^i_c(X_K, V) × H^{d−i}(X_K, V^∨ ⊗ o_K) → R`;
LocallySymmetric.dualityPairing_relative — The relative pairing on `(X̄_K, ∂X̄_K)` and the boundary
pairing on `∂X̄_K`; LocallySymmetric.dualityPairing_perfect — Over a field the pairings are perfect;
LocallySymmetric.dualityPairing_pullback_trace — `⟨π^*x, y⟩_{K′} = ⟨x, π_*y⟩_K` for `K′ ⊂ K` (pullback
adjoint to trace); LocallySymmetric.dualityPairing_eq_evaluation — The pairing is the evaluation
of `RHom(RΓ_c(X_K, V), R) ≅ RΓ(X_K, V^∨ ⊗ o_K)[d]` on cohomology.

*Needs:* ALS.5a.2; ALS.5a.1;
AlgebraicTopology, Stage 6.

**Checks.**

- pairing_surface_H0H2: For a connected modular curve `X_K` and a field
  `k, H⁰(X_K, k) × H²_c(X_K, k) → k` is `(a, b) ↦ a·∫b`, perfect with both sides `k`.
- pairing_compact_case: If `X_K` is compact (`G` anisotropic), `H^i_c = H^i` and the pairing is
  classical Poincaré duality on a closed manifold.
- pairing_pullback_trace: `⟨π^*x, y⟩_{K′} = ⟨x, π_*y⟩_K` for `K′ ⊂ K` neat.
- pairing_needs_orientation: Without the twist by `o_K` the pairing
  `H²_c(X_K, F_3) × H⁰(X_K, F_3) → F_3` vanishes identically on the nonorientable component of
  ALS.0's `PGL_2` example, since `H²_c` of
  a nonorientable surface with `F_3` coefficients is 0.

### ALS.5a.4 Hecke adjoints: inverse double cosets and restriction/corestriction

Prove LocallySymmetric.verdierDuality_hecke. Under ALS.5a.2 the
transpose of the operator `[Kg⁻¹K]` on `RHom_R(RΓ_c(X_K, V), R)` corresponds to `[KgK]` on
`RΓ(X_K, V^∨ ⊗ o_K)` for `g ∈ G^S, i`.`e`. `⟨x, [KgK]y⟩ = ⟨[Kg⁻¹K]x, y⟩` (the orientation character
contributes nothing
because `g ∈ G^S` acts on `𝔛_G` through `G(A^∞)` and the orientation of `X^G` is untouched); equivalently,
the duality is equivariant when `H(G^S, K^S)` acts on the left through the anti-involution
`ι([KgK]) = [Kg⁻¹K]`. Restriction and corestriction are adjoint: `⟨π^*x, y⟩ = ⟨x, π_*y⟩`. For `GL_n`
with `K_v = GL_n(O_{F_v}), T_v^i` acting on `H^*` corresponds to `T_v^{n−i}(T_v^n)⁻¹` on `H^*_c`,
and `ι` descends to an
isomorphism `T^S(RΓ_c(X_K, V)) ≅ T^S(RΓ(X_K, V^∨ ⊗ o_K))` with `𝔪 ↦ 𝔪^∨ = ι(𝔪)`. On transported `P`-spaces
the same adjoint argument pairs compact and ordinary dual-coefficient cohomology with `o_{P,g}`;
rational component maps pull back the local orientation sheaf, and the finite adelic correspondence
preserves its archimedean factor. The statement assumes: `K` neat; `g ∈ G^S`. ([NT16, §3.1, Proposition
3.7(3), p. 48]; [ACC+23, §2.2.20, Corollary 2.2.22, p. 932]; [NT16, §4, proof of Lemma 4.1, p. 54])

*Needs:* ALS.5a.2; ALS.5a.3;
ALS.3.5; ALS.3.6; ALS.3.11.

**Checks.**

- For `GL_2: T_v` on `H^*` is dual to `T_v S_v⁻¹` on `H^*_c, S_v = T_v^2`.
- For `g ∈ K`, both sides are the identity.

### ALS.5a.5 Duality, the boundary triangle and coefficient change

Prove LocallySymmetric.verdierDuality_triangle. For neat `K` write `C_c(V)→C(V)→B(V)→C_c(V)[1]` for
the boundary triangle and `D=RHom_R(−,R)`. Contravariant duality gives
`D B(V)→D C(V)→D C_c(V)→D B(V)[1]`. ALS.5a.2 identifies these terms
with
`B(V^∨⊗o)[d−1]→C_c(V^∨⊗o)[d]→C(V^∨⊗o)[d]→B(V^∨⊗o)[d]`. This is the inverse rotation of the shifted
boundary triangle, with the negative rotated connecting arrow prescribed by the
triangulated-category sign convention. It is Hecke-equivariant after applying the
inverse-double-coset anti-involution `ι` on the dual side. For perfect coefficient complexes it
commutes with derived coefficient change `R → R′`,
with the dual on the base-changed side taken over `R′`. These clauses assume `K` neat, `R`
commutative and `V` a bounded complex of finite projective `R`-modules.

For localization assume separately `R = O` a complete DVR and a commutative finite Hecke image
as in ALS.4.9. Duality carries the projector `e_𝔪` to its
contravariant dual, corresponding under the Hecke anti-involution `ι` to `e_{𝔪^∨}` on the paired
complex. Thus `D(C_c(V)_𝔪) ≅ C(V^∨⊗o)_{𝔪^∨}[d]`, with `D = RHom_O(−,O)`; both summands are
`O`-perfect because they are direct summands of `O`-perfect complexes. The localized dual triangle
has the same compatibility with reduction `O → O/ϖ^m`. ([NT16, §3.1,
Proposition 3.7(2), p. 48]; [ACC+23, §2.2.20, p. 932])

*Needs:* ALS.5a.2; ALS.5a.4;
ALS.4.1; ALS.4.9;
ALS.1.7.

**Checks.**

- For a modular curve the dual of the boundary sequence `H⁰ → H⁰(∂) → H¹_c` is `H¹ → H¹(∂) → H²_c`.
- For `G` anisotropic the triangle degenerates and the statement is ordinary Poincaré duality.
- Over a complete DVR, a finite Hecke image `O × O` acting by the two projections on a perfect
  complex `C₁ ⊕ C₂` localizes to `C₁` and `C₂`; duality gives the corresponding dual summands,
  with their factors transported by `ι`.
- Non-example: for `R = T = ℤ`, `C = ℤ[0]` and `𝔪 = (p)`,
  `H⁰ RHom_ℤ(ℤ_(p),ℤ) = 0` whereas `(H⁰ RHom_ℤ(ℤ,ℤ))_(p) = ℤ_(p)`.
  The image of `1` under a homomorphism `ℤ_(p) → ℤ` must be divisible by every power of any
  prime distinct from `p`, so it is zero. Ordinary localization does not preserve duality over
  the original coefficient ring.
- Supports, in the complete-DVR finite-image setting: if `𝔪` is not in the support of
  `H^*_c(X_K, V)`, then `D(C_c(V)_𝔪) = 0 ≅ C(V^∨ ⊗ o)_{𝔪^∨}[d]`, so `𝔪^∨` is not in the
  support of `H^*(X_K, V^∨ ⊗ o_K)`.

### ALS.5a.6 Duality at non-neat level: stabilizer hypotheses

Prove LocallySymmetric.verdierDuality_of_invertibleOrder. Let `K` be arbitrary and `K′ ⊂ K` normal,
neat and of finite index, with `K′^S = K^S`. The equivariant complex `RΓ_{K/K′}(X_{K′},V)` is perfect
over `R` after forgetting the finite-group action; it is not generally perfect over `R[K/K′]` unless the
full `K`-action is free (`e`.`g`. `K` neat). Derived finite-group invariants compute orbifold `RΓ(X_K,V)`. If
|K/K′| is invertible in R, averaging makes this a direct summand of the finite projective R-complex
at `K′`, and yields finite-level duality `RHom_R(RΓ_c(X_K,V),R) ≅ RΓ(X_K,V^∨ ⊗ o_K)[d]`,
Hecke-equivariantly, for the corresponding groupoid support model. Invertibility of `|K/K′|` is
sufficient and is not equivalent to invertibility of all stabilizer orders. Without such a
hypothesis orbifold cohomology can be unbounded. Use the compactified equivariant support model of
ALS.1.2. A point with stabilizer `C_p` over `F_p` gives `H^*(C_p,F_p)` in arbitrarily
high degrees, so invertibility of `|K/K′|` cannot be dropped. The statement assumes: `K′ ⊂ K` normal
and neat; `|K/K′|` invertible in `R` for the duality. ([ACC+23, §2.1.2, Lemma 2.1.7, p. 912]; [CGH20,
§3.1, proof of Lemma 3.1, pp. 5–6])

*Needs:* ALS.5a.2; ALS.2.4;
ALS.1.5; ALS.3.6;
ALS.1.3.

**Checks.**

- For `SL_2(ℤ)` and `R = ℤ[1/6]: RΓ(X_K, R) = R[0]` and `RΓ_c(X_K, R) = R[−2]`, dual with `d = 2`.
- For `R = F_2` or `F_3` at level `SL_2(Ẑ)` the cohomology is unbounded.
- Degenerate: for `K` neat one may take `K′ = K`, the hypothesis holds for every `R`, and the statement
  is ALS.5a.2.

### Examples

- A modular curve is an orientable surface: `H²_c(X_K, R) ≅ R` per component, `H¹_c` is dual to
  `H¹`, and the dual of `H⁰ → H⁰(∂) → H¹_c` is `H¹ → H¹(∂) → H²_c`.
- Orientation matters: on the nonorientable neat `PGL_2` component, `H²_c` with `F_3` coefficients
  vanishes, while `H²_c` with coefficients in the orientation system is `F_3`.
- Non-neat level: for `SL_2(ℤ)` and `R = ℤ[1/6]`, `RΓ(X_K, R) = R[0]` and `RΓ_c(X_K, R) = R[−2]` are
  dual with `d = 2`; over `F_2` or `F_3` the cohomology is unbounded.

### Dependencies

Layers ALS.0–ALS.3; the boundary triangle and localization of Layer ALS.4 for the last two targets;
AlgebraicTopology, Stage 6; Layer ALS.F (ALS.F.2–F.3); ALS.2.10; Mathlib (`ModelWithCorners`).

## Layer ALS.5b: Characteristic-zero and automorphic comparisons

This layer compares with forms and automorphic forms in characteristic zero. The de Rham theorem
with local coefficients, Borel's moderate-growth comparison and the automorphic comparison map are
constructed here; cuspidal cohomology is defined and mapped to interior cohomology. Franke's theorem
and the Franke–Schwermer description, which rest on Langlands' theory of Eisenstein series, enter as
the hypothesis `FrankeInput`, and characteristic-zero Galois representations of the Levi factors as
the hypothesis `GaloisInput`; the algebraic comparisons that combine them are proved here. With
these inputs the layer proves that rational cohomology at a non-Eisenstein ideal is cuspidal in the
range `[q₀, q₀ + ℓ₀]`, and the middle-degree statement for `U(n, n)`.

### ALS.5b.1 Betti, de Rham and relative Lie algebra cohomology in characteristic zero

Prove LocallySymmetric.deRhamIso. Let `𝔞_G = Lie(A_∞) ⊗_ℝ ℂ` and `𝔪_G = (Lie(G(F_∞)) ⊗_ℝ ℂ)/𝔞_G`.
Let `K` be neat and `V` a finite-dimensional complex (or real) algebraic representation of
`𝐆 = Res_{F/ℚ} G` on which `A_∞` acts through a character `ζ_V`, with associated flat bundle `𝒱` on
`X_K`
whose sheaf of flat sections is the local system `V_K` of ALS.1.1. Write
`𝒞_V(G) = {f ∈ C^∞(G(F)\G(𝔸_F)) : f(ga) = ζ_V(a)⁻¹f(g) for a ∈ A_∞}`; on `𝒞_V(G) ⊗ V`, with `𝔤`
acting by right derivatives on functions and through `V`, the subalgebra `𝔞_G` acts by zero, so
`𝒞_V(G) ⊗ V` is an `(𝔪_G, K_∞)`-module, and `G(𝔸^∞)` acts by right translation, which commutes with
`A_∞`. Then there are natural isomorphisms

```text
H^*(X_K, V) ≅ H^*_dR(X_K, 𝒱) ≅ H^*(Ω^•(X^G × G(𝔸^∞)/K, V)^{G(F)}) ≅ H^*(𝔪_G, K_∞; 𝒞_V(G)^K ⊗ V),
```

equivariant for `H(G^S, K^S)`, compatible with level maps and translations, and the same with
compact supports for `H^*_c`. The first isomorphism is the de Rham theorem with local coefficients,
constructed here: in flat local frames the de Rham complex of `𝒱` is locally the
constant-coefficient de Rham complex, so the Poincaré lemma makes it a fine resolution of `V_K`, and
sheaf cohomology of `V_K` is singular cohomology by ALS.1.4;
DifferentialGeometry's de Rham theorem is the case of the trivial one-dimensional `V`. The second is
pullback to the cover `X^G × G(𝔸^∞)/K`. The third evaluates a `G(F)`-invariant `V`-valued form at
the base point after untwisting by the archimedean component, `g ↦ g_∞⁻¹·ω_g`, which identifies it
with a relative cochain in `Hom_{K_∞}(∧^•(𝔤/(𝔨 + 𝔞_G)), 𝒞_V(G)^K ⊗ V)` and the exterior derivative
with the relative Chevalley–Eilenberg differential of ALS.F.5; a form is invariant
under `A_∞ ⊂ K_∞A_∞`, so the untwisted function transforms under `A_∞` by `ζ_V⁻¹`, and the Hecke
operators act by right translation with no further twist. Multiplying by `e^{⟨ζ_V, H_G(g)⟩}`
identifies `𝒞_V(G)` with the `A_∞`-invariant functions, on which right translation by `h ∈ G(𝔸^∞)`
becomes translation twisted by `e^{−⟨ζ_V, H_G(h)⟩}`, the normalization of Franke [Fra98, §2.3]. The
statement assumes `K` neat; `V` finite-dimensional complex algebraic with `A_∞` acting by a
character. ([Fra98, §2.3, (16)–(17) and Theorem 4, pp. 197–198]; [Fra98, §7.4, p. 255]; [CGH20,
§3.1, proof of Lemma 3.1, pp. 5–6])

*Needs:* ALS.1.4; ALS.1.1;
ALS.0.9; ALS.F.5 (relative cochains and invariant forms);
DifferentialGeometry, Layers 0, 6 and 8; AlgebraicTopology, Stage 6.

**Checks.**

- On a connected `SL_2` modular component with `V = Sym^k ℂ²`, the comparison computes `H¹` by
  `V`-valued forms; its cuspidal part is the Eichler–Shimura pair of holomorphic and antiholomorphic
  forms, and ordinary cohomology also has its Eisenstein part. For the full `GL_2` quotient the
  real-component and central-character invariants are kept.
- Degenerate: for `G` anisotropic and `V = ℂ`, `H^*(X_K, ℂ) = H^*(𝔪_G, K_∞; 𝒞_ℂ(G)^K)`, and
  for `X_K` finite (a torus with `T(ℝ)/A_∞` compact) both sides are functions on `X_K` in degree
  `0`.
- Non-example: without removing `𝔞_G`, the pair `(𝔤, K_∞)` adds the exterior algebra of the split
  central Lie algebra: for `GL_1/ℚ`, `X_K` is a point but `H¹(𝔤𝔩_1, {±1}; ℂ) = ℂ`.
- The central character must be matched: for `GL_{1,ℚ}`, `K = K(3)` and `V` the standard character
  (`ζ_V(a) = a`), `ℚ^×\𝔸^×/K ≅ ℝ^×`, `𝒞_V(G)^K` consists of the functions `c_±|x|⁻¹` on the two
  half-lines, and the `K_∞ = {±1}`-invariants of `𝒞_V(G)^K ⊗ V` are the line `c_− = −c_+`, matching
  `H⁰(X_K, V) = ℂ` for the point `X_K`. On `A_∞`-invariant functions tensored with `V`, `𝔞_G` would
  act by `1`, so they do not form an `𝔪_G`-module.

### ALS.5b.2 Duality, traces and Hecke operators on forms

Prove LocallySymmetric.deRham_pairing. For neat `K` and a finite-dimensional complex algebraic
representation `V` of `𝐆`, the de Rham isomorphism of ALS.5b.1 carries (i)
the cup-product pairing of ALS.5a.3 on
`H^i_c(X_K, V) × H^{d−i}(X_K, V^∨ ⊗ o_K)` to `(α, β) ↦ ∫_{X_K} ⟨α ∧ β⟩` on compactly supported and
arbitrary closed forms, with the
evaluation `V ⊗ V^∨ → ℂ` and the orientation twist; (ii) pullback and trace along level maps to
pullback and fibre integration of forms; and (iii) the Hecke operators of
ALS.3.5 to the correspondence action on forms. No new duality is
constructed here: the duality, pairings and adjoints are those of Layer ALS.5a, transported. The
statement assumes `K` neat; `V` finite-dimensional complex algebraic. ([ACC+23, §2.2.20, Proposition
2.2.21, p. 932])

*Needs:* ALS.5b.1; ALS.5a.3;
ALS.5a.4; DifferentialGeometry, Layers 0 and 2 (forms and orientations).

**Checks.**

- For a modular curve, `⟨α, β⟩ = ∫ α ∧ β` on `H¹_c × H¹` with constant coefficients, and for the
  complex orientation (`dx ∧ dy` positive, which trivializes `o_K`) a holomorphic weight-two cusp
  form `f` gives `∫ f(z)dz ∧ conj(f(z)dz) = −2i ∫ |f|² dx dy = −2i⟨f, f⟩`, since
  `dz ∧ dz̄ = −2i dx ∧ dy`, with `⟨f, f⟩` the unnormalized Petersson norm.
- Degenerate: for compact `X_K` this is classical Poincaré duality of de Rham cohomology.
- Pullback and trace: for `K′ ⊂ K`, `∫_{X_{K′}} π^*α ∧ β = ∫_{X_K} α ∧ π_*β`, the form version of
  dualityPairing_pullback_trace.

### ALS.5b.3 Borel's moderate-growth comparison

Prove LocallySymmetric.moderateGrowthIso. Let `K` be neat, `V` a finite-dimensional complex
algebraic representation of `𝐆` on which `A_∞` acts through a character `ζ_V`, write `T([G])` for
the smooth `K_∞`-finite functions of uniform moderate growth on `G(F)\G(𝔸_F)`
(ALS.F.6), and `T_V([G]) = T([G]) ∩ 𝒞_V(G)` for those transforming under `A_∞`
by `ζ_V⁻¹`, with `𝒞_V(G)` as in ALS.5b.1. The inclusions of `T_V([G])^K` into
`𝒞_V(G)^K` and of moderately increasing `V`-valued forms into all `V`-valued forms induce
isomorphisms

```text
H^*(X_K, V) ≅ H^*(𝔪_G, K_∞; 𝒞_V(G)^K ⊗ V) ≅ H^*(𝔪_G, K_∞; T_V([G])^K ⊗ V),
```

equivariant for `H(G^S, K^S)` acting by right translation and compatible with level maps; in
Franke's normalization by `A_∞`-invariant functions the finite adelic action carries the twist
described in ALS.5b.1. The proof follows Franke: moderately increasing forms
(the union over weights
of the weighted `L²`-forms with all derivatives) sheafify on the Borel–Serre compactification `X̄_K`
to a fine resolution of the extension of the local system, as do all forms, and the two have the
same local cohomology at every point of `X̄_K` (Franke §2.2, Theorem 2, p. 190); regularization
identifies weighted `L²` cohomology with the cohomology of the weighted Sobolev forms (Theorem 3, p.
193), and evaluation at the base point identifies that complex with the relative Lie algebra
cochains of the weighted Sobolev spaces (Theorem 4, p. 198); the union over weights
of these spaces is `T([G])` (Proposition 2, p. 198). Nothing here uses Eisenstein series. The
statement assumes `K` neat; `V` finite-dimensional complex algebraic with `A_∞` acting by a
character. ([Fra98, §2.2, Theorem 2, p. 190]; [Fra98, §2.3, Theorems 3–4 and Proposition 2, pp.
193–198])

*Needs:* ALS.5b.1; ALS.2.3;
ALS.2.2; ALS.F.6 (the space `T([G])`);
ALS.F.5 (relative cochains); AdelicAlgebraicGroups §3.6 (Siegel sets).

**Checks.**

- Compact case: if `G` is anisotropic modulo its centre, every smooth function on the compact
  quotient has uniform moderate growth and the statement reduces to ALS.5b.1.
- `SL_2/ℚ`, `V = ℂ`, `K = K(N)`: the constant function `1` and the Eisenstein classes spanning the
  boundary part of `H¹(X_K, ℂ)` are represented by forms of moderate growth; compactly supported
  forms alone would compute `H^*_c`, not `H^*`.
- Non-example: square-integrable forms do not compute `H^*(X_K, ℂ)`: for a modular curve the `L²`
  cohomology in degree `1` is the cuspidal part (of dimension `2g` on a connected component),
  strictly smaller than `H¹` (of dimension `2g + c − 1`) when there are at least two cusps.

### ALS.5b.4 The automorphic comparison and Franke's input

Define LocallySymmetric.automorphicComparisonMap and the hypothesis
LocallySymmetric.FrankeInput, and prove LocallySymmetric.automorphicComparison. Let `K` be neat
and `V = V_λ` irreducible of highest weight `λ` (ALS.F.7), with
`A_∞` acting through `ζ_V`, and let `J ⊂ Z(𝔤)` be the annihilator of `V^∨`. Automorphic forms have
uniform moderate growth (ALS.F.6), so the space `𝒜_J(G)` of automorphic forms
annihilated by a power of `J` and transforming under `A_∞` by `ζ_V⁻¹` lies in `T_V([G])`, and the
inclusion together with ALS.5b.3 defines the `H(G^S, K^S)`-equivariant
map

```text
ι_𝒜 : H^*(𝔪_G, K_∞; 𝒜_J(G)^K ⊗ V) → H^*(X_K, V),
```

compatible with level maps; this map is constructed unconditionally. `FrankeInput(G, K, V)` is the
following statement about automorphic forms on `G`, taken as a hypothesis: (a) the inclusion
`𝒜_J(G) ⊂ T_V([G])` induces an isomorphism on `(𝔪_G, K_∞)`-cohomology of `K`-invariants with
coefficients
`V`
(Franke's theorem); (b) `𝒜_J(G) = ⊕_{{P}} 𝒜_{J,{P}}(G)` as `(𝔤, K_∞) × G(𝔸^∞)`-modules, over
associate classes `{P}` of rational parabolics, with `𝒜_{J,{G}}(G)` the cusp forms in `𝒜_J(G)`; and
(c) for a proper `{P}` every Hecke eigensystem of `H(G^S, K^S)` occurring in
`H^*(𝔪_G, K_∞; 𝒜_{J,{P}}(G)^K ⊗ V)` is that of the unnormalized parabolic induction
`Ind_{P(𝔸^∞)}^{G(𝔸^∞)} σ^∞` of
a cuspidal automorphic representation `σ` of the Levi `L_P(𝔸)` whose infinitesimal character is that
of the dual of the `L_P`-representation of highest weight `w(λ + ρ) − ρ` for some Kostant
representative `w ∈ W^P`. Under `FrankeInput(G, K, V)`, prove that `ι_𝒜` is an isomorphism and that

```text
H^*(X_K, V) = ⊕_{{P}} H^*_{{P}}(X_K, V),   H^*_{{P}} = ι_𝒜 H^*(𝔪_G, K_∞; 𝒜_{J,{P}}(G)^K ⊗ V),
```

is a decomposition into `H(G^S, K^S)`-submodules, compatible with pullback along level maps, whose
`{G}`-summand is the image of cuspidal cohomology (ALS.5b.5) and whose other
summands carry only the eigensystems in (c). Franke proves (a) in Theorem 18 from his Theorems 2–4,
6 and 16, and (b)–(c) are the Franke–Schwermer description as used by ACC+; the proof of (a) needs
Langlands' theory of Eisenstein series and is not part of this roadmap. A general
finite-dimensional algebraic `V` is a finite direct sum `⊕_λ V_λ^{m_λ}`
(ALS.F.7);
for it, `J`, `𝒜_J(G)`, `FrankeInput(G, K, V)`, `ι_𝒜` and the decomposition are taken summand by
summand and added, `FrankeInput(G, K, V)` meaning `FrankeInput(G, K, V_λ)` for every `λ` with
`m_λ ≠ 0`. The statement assumes `K` neat; `V` finite-dimensional complex algebraic, irreducible for
the highest-weight clause (c) and componentwise otherwise; `FrankeInput(G, K, V)` for the
isomorphism and the decomposition. ([Fra98, §7.4, Theorem 18, p. 255]; [Fra98, §3, Theorem 6, p.
201]; [Fra98, §7.6, p.
261]; [ACC+23, §2.4.9, proof of Theorem 2.4.10, pp. 949–950])

The API: LocallySymmetric.automorphicComparisonMap — the map `ι_𝒜` above;
LocallySymmetric.automorphicComparisonMap.hecke — it intertwines the actions of `H(G^S, K^S)` by
right translation; LocallySymmetric.automorphicComparisonMap.levelMap — it
commutes with pullback along `π_{K′,K}`; LocallySymmetric.FrankeInput — the hypothesis (a)–(c);
LocallySymmetric.automorphicComparison — under `FrankeInput`, `ι_𝒜` is an isomorphism and the
displayed decomposition holds.

*Needs:* ALS.5b.3; ALS.5b.1;
ALS.F.6 (automorphic forms, their uniform moderate growth, constant terms and
cusp forms); ALS.F.5 (relative cochains); ALS.F.7
(algebraic weights and Wigner's lemma).

**Checks.**

- For `G` anisotropic modulo its centre there are no proper rational parabolics, `𝒜_J(G)` consists
  of cusp forms, and the decomposition has the single summand `{G}`: this is Matsushima's formula.
  Automorphic forms are `Z(𝔤)`-finite; they are not all `K_∞`-finite smooth functions.
- For `GL_{2,ℚ}` and `V = ℂ`, the `{B}`-summand of `H¹(X_K, ℂ)` is spanned by Eisenstein series
  classes, with the eigenvalues `χ₁(ℓ) + ℓχ₂(ℓ)` of classical weight-two Eisenstein series (`1 + ℓ`
  for trivial characters); at level `K(N)` it has dimension `c − 1` on each connected component with
  `c` cusps.
- Non-example: the square-integrable automorphic forms do not suffice. For a modular curve with
  `c ≥ 2` cusps their contribution to `H¹` is the interior part, of dimension `2g`, while `H¹` has
  dimension `2g + c − 1`; the decomposition is of ordinary cohomology and needs all of `𝒜_J(G)`,
  Eisenstein series included.
- Reducible coefficients: for `G = SL_{2,ℚ}` and `V = ℂ ⊕ Sym²ℂ²`, there is no single `λ`; the
  comparison is the sum of those for `V_0 = ℂ` and `V_2 = Sym²ℂ²`, with the ideals `J_0 ≠ J_2`.

### ALS.5b.5 Cuspidal cohomology

Define LocallySymmetric.cuspidalCohomology. For neat `K` and `V` as in
ALS.5b.3,

```text
H^*_cusp(X_K, V) = ⊕_π m(π) · H^*(𝔪_G, K_∞; π_∞ ⊗ V) ⊗ (π^∞)^K,
```

the sum over cuspidal automorphic representations `π` of `G(𝔸_F)` whose central character on `A_∞`
is inverse to that of `V`, with `m(π)` the cuspidal multiplicity; the sum is finite by the
discreteness of the cuspidal spectrum and the finite dimensionality of spaces of cusp forms of fixed
type (ALS.F.6) together with Wigner's lemma
(ALS.F.7). Cusp forms are rapidly decreasing, hence of uniform
moderate growth, so ALS.5b.3 gives an `H(G^S, K^S)`-equivariant map
`H^*_cusp(X_K, V) → H^*(X_K, V)`. Its image lies in the interior cohomology
`H^*_!(X_K, V) = im(H^*_c(X_K, V) → H^*(X_K, V))`: the restriction of a class to a boundary stratum
is computed by the constant term along the corresponding parabolic, which vanishes on cusp forms.
The map is injective, by Borel's regularization theorem: a cuspidal class is represented by a
rapidly decreasing form, and one that is exact among all forms is already exact in the cuspidal
complex; this uses the rapid decay of cusp forms and the regularization of
ALS.5b.3, and no Eisenstein series. Under `FrankeInput(G, K, V)` its
image is the `{G}`-summand of ALS.5b.4. The statement assumes `K` neat;
`FrankeInput(G, K, V)` only for the identification with the `{G}`-summand. ([Bor83, §5]; [ACC+23,
§2.4.9, proof of Theorem 2.4.10, p. 949]; [HR15, §4.1, pp. 23–25]; [Fra98, §7.4, p. 256])

The API: LocallySymmetric.cuspidalCohomology — `H^*_cusp(X_K, V)` as an `H(G^S, K^S)`-module with
its map to `H^*(X_K, V)`; LocallySymmetric.cuspidalCohomology_injective — the map to `H^*(X_K, V)`
is injective and Hecke-equivariant, with no hypothesis;
LocallySymmetric.cuspidalCohomology_le_interior — its image lies in
`im(H^*_c(X_K, V) → H^*(X_K, V))`; LocallySymmetric.cuspidalCohomology_decomp — the displayed
decomposition as a sum over
cuspidal `π`; LocallySymmetric.cuspidalCohomology_eq_franke — under `FrankeInput` it is the
`{G}`-summand of ALS.5b.4.

*Needs:* ALS.5b.3; ALS.5b.4;
ALS.4.1; ALS.F.6 (rapid decay of cusp forms, the
discreteness of the cuspidal spectrum, constant terms); ALS.F.5 (relative
cochains);
ALS.F.7 (Wigner's lemma).

**Checks.**

- cuspidal_GL2_weight2: for the connected `SL_2` component `Γ₁(N)\ℍ` with `N ≥ 5`, constant `ℂ`
  coefficients and genus `g`, `dim H¹_cusp = 2 dim S₂(Γ₁(N)) = 2g`. For a full `GL_2` adelic
  quotient the real-component and central-character invariants are also kept; no componentwise
  two-dimensional `GL_2` formula is asserted.
- cuspidal_torus (degenerate): for `G` a torus every automorphic form is cuspidal and
  `H^*_cusp(X_K, V) = H^*(X_K, V)`.
- cuspidal_le_interior (characterisation): for the connected modular curve `Γ₁(N)\ℍ` with constant
  `ℂ` coefficients, the cuspidal image and the interior cohomology in degree `1` both have dimension
  `2g`.
- cuspidal_ne_ordinary (non-example): for `Γ₁(5)\ℍ` (genus `0`, four cusps), `H¹_cusp = H¹_! = 0`
  but `H¹(X, ℂ) = ℂ³`; cuspidal cohomology is not all of ordinary cohomology.

### ALS.5b.6 Regular algebraic cuspidal representations of `GL_n` contribute to cohomology

Prove LocallySymmetric.cuspidal_contributes_GL. Let `F` be totally real or CM and `π` a cuspidal
automorphic representation of `GL_n(𝔸_F)` with `π_∞` regular `L`-algebraic, unramified outside a
finite set `S`. Then `π′ = π|·|^{(n+1)/2}` is regular `C`-algebraic, i.e. cohomological: there is an
algebraic representation `ξ` of `Res_{F/ℚ} GL_n` over `ℂ ≅ Q̄_p`, extending to `Res_{𝒪_F/ℤ} GL_n`
over `Z̄_p`, such that the Hecke eigensystem of `π′` away from `S` occurs in
`H^i(X̃_K, M_{ξ,K}) ⊗_{Z̄_p} ℂ` for some sufficiently small `K = K_S K^S` and some `i`, where
`X̃_K = GL_n(F)∖[(GL_n(F ⊗ ℝ)/ℝ_{>0}K_∞°) × GL_n(𝔸_F^∞)/K]` is the connected-compact variant of
ALS.0.4
(equal to `X_K` for `F` CM, and a `(ℤ/2)^{[F:ℚ]}`-cover for `F` totally real). After twisting by a
quadratic character `η : 𝔸_F^×/F^× → {±1}` with prescribed archimedean components, `π′ ⊗ (η ∘ det)`
occurs in `H^i(X_K, M_{ξ,K}) ⊗ ℂ`. The proof: `π′_∞` has nonzero `(𝔪_G, K_∞°)`-cohomology with
coefficients `ξ` (Clozel's lemma, ALS.F.7 (iv)), so `π′`
contributes to cuspidal cohomology, which injects into `H^*` by
ALS.5b.5. The statement assumes `F` totally real or CM; `π` cuspidal with
`π_∞` regular `L`-algebraic. ([Sch15, §V.4, proof of Corollary
V.4.2, pp. 102–103]; [Bor83, §5])

*Needs:* ALS.5b.5; ALS.0.4;
ALS.F.7 (algebraic weights, Clozel's lemma and cohomological
representations); ALS.F.6 (cuspidal automorphic representations).

**Checks.**

- `n = 1`: an algebraic Hecke character contributes to `H⁰(X_K, ξ)`.
- `n = 2`, `F = ℚ`: a weight-`k` eigenform contributes to `H¹(X_K, Sym^{k−2})` (Eichler–Shimura),
  after the twist to `π′`, which changes `ξ` by a power of the determinant.
- Non-example: the twist is needed for even `n`. For `n = 2` the exponents of the Langlands
  parameter of `π_∞` on `ℂ^×` lie in `ℤ` when `π` is `L`-algebraic and in `1/2 + ℤ` when it is
  `C`-algebraic. The `L`-algebraic `π` of a weight-two form (the unitary `π_f` twisted by `|·|^{1/2}`)
  has integral exponents, so it is not `C`-algebraic and occurs with no algebraic coefficient `ξ`
  until it is twisted by a half-integral power of `|·|`.

### ALS.5b.7 Characteristic-zero Galois inputs and induced eigensystems

Define the hypotheses LocallySymmetric.GaloisInput.GL and LocallySymmetric.GaloisInput.unitary,
and prove the comparisons GaloisInput.induced_charpoly and GaloisInput.unitary_constituents. Fix
a prime `p`, an isomorphism `ι : Q̄_p ≅ ℂ`, a CM field `F` with maximal totally real subfield `F⁺`,
and the Hecke polynomials `P_v(X)` of IntegralHeckeAndGaloisDeterminants Layer 3a
(coefficients `(−1)^i q_v^{i(i−1)/2} T_{v,i}`), with the unitary
polynomials `P̃_v(X)` obtained from them through unramified base change.

`GaloisInput.GL(F, m)` is the statement: for every cuspidal automorphic representation `π` of
`GL_m(𝔸_F)` of some weight `λ` (infinitesimal character that of `V_λ^∨`) there is a continuous
semisimple `r_ι(π) : G_F → GL_m(Q̄_p)` such that for every rational prime `ℓ ≠ p` at which `F` and
`π` are unramified and every `v | ℓ`, `r_ι(π)` is unramified at `v` and the characteristic
polynomial of `r_ι(π)(Frob_v)` is the image of `P_v(X)` under the eigensystem of `ι⁻¹π_v` ([ACC+23,
Theorem 2.3.2, p. 935]). `GaloisInput.unitary(F, m)`, for `F` containing an imaginary quadratic
field, is the statement: for every cuspidal `π` of `U(m, m)(𝔸_{F⁺})` that is `ξ`-cohomological there
is a continuous semisimple `r_ι(π) : G_F → GL_{2m}(Q̄_p)`, unramified with characteristic polynomial
of Frobenius the image of `P̃_v(X)` at every `v | ℓ` for rational `ℓ ≠ p` unramified in `F` with `π`
unramified above `ℓ`, de Rham above `p` with labelled Hodge–Tate weights
`{λ̃_{τ,1} + 2m − 1, …, λ̃_{τ,2m}}` for the highest weight `λ̃` of `ι⁻¹(ξ ⊗ ξ)^∨`, and with
Frobenius-semisimplified
Weil–Deligne representation at places above primes split in an imaginary quadratic subfield given by
the normalized local Langlands correspondence ([ACC+23, Theorem 2.3.3, pp. 935–936]). Both are
hypotheses here: their proofs use Shimura varieties and the cohomology theory of this roadmap.

The comparisons owned here are algebraic. (i) Let `Q ⊂ Res_{F/ℚ} GL_n` be the standard parabolic of
the partition `n = n₁ + ⋯ + n_r`, and `M` a Hecke eigensystem of `H(GL_n(𝔸_F^{∞,S}), K^S) ⊗ ℂ` that
is the eigensystem of the unnormalized induction `Ind_Q σ^∞` of `σ = ⊗_i π_i`, `π_i` cuspidal on
`GL_{n_i}(𝔸_F)` with weights as in `FrankeInput` (c). Under `GaloisInput.GL(F, n_i)` for all `i`,

```text
r_ι(M) = ⊕_{i=1}^{r} r_ι(π_i) ⊗ ε^{−(n_{i+1} + ⋯ + n_r)}
```

has characteristic polynomial of `Frob_v` equal to `P_v(X) mod M` for all but finitely many `v ∉ S`,
with `ε` the `p`-adic cyclotomic character; in particular `r_ι(M)` is reducible when `Q` is proper.
The proof is the factorization of the Satake parameters of an induced representation through the
unnormalized Satake map of ALS.4.2. Put `b_i = n₁ + ⋯ + n_{i−1}` and
`a_i = n_{i+1} + ⋯ + n_r`, and write the normalized Satake isomorphisms of `GL_n` and of the blocks
`GL_{n_i}` with values in `ℂ[Y_1^{±1}, …, Y_n^{±1}]^{S_n}` and
`⊗_i ℂ[Z_{i,1}^{±1}, …, Z_{i,n_i}^{±1}]^{S_{n_i}}`. The modulus character `δ_Q^{1/2}` takes the
value `q_v^{−(a_i−b_i)/2}`
on
the uniformizer in position `b_i + j`, so the integral unnormalized `S_v = r_M ∘ r_P` corresponds to
the substitution

```text
Y_{b_i+j} ↦ q_v^{(a_i − b_i)/2} Z_{i,j}   (1 ≤ i ≤ r, 1 ≤ j ≤ n_i):
```

the normalized `GL_n`-Satake transform of `f`, after this substitution, is the normalized block
Satake transform of `S_v(f)`. Equivalently, the `GL_n` Satake parameters of the induced eigensystem
in
block `i` are those of `π_{i,v}` multiplied by `q_v^{(a_i−b_i)/2}`. The roots of `P_v` are
`q_v^{(n−1)/2}` times the `GL_n` Satake parameters and those of the block Hecke polynomial
`q_v^{(n_i−1)/2}` times the block parameters; since `n − n_i = a_i + b_i`, the roots of `P_v` in
block
`i` are those of the block polynomial times
`q_v^{(n−1)/2 + (a_i−b_i)/2 − (n_i−1)/2} = q_v^{a_i} = ε^{−a_i}(Frob_v)`, which gives the displayed
twists. NT16 Lemma 4.6 prints the exponent `a_i − b_i`;
the correct exponent is `(a_i − b_i)/2`, as the generator check below shows. The square roots of
`q_v` occur only in the normalized charts and cancel: the integral Hecke operators, `S_v` and the
twists `ε^{−a_i}` involve none. (ii) For the
Siegel-type parabolics of `U(n, n)`, with Levi
`Res_{F/F⁺}GL_{n₁} × ⋯ × Res_{F/F⁺}GL_{n_r} × U(n − s, n − s)` and `s = n₁ + ⋯ + n_r`, under
GaloisInput.GL and GaloisInput.unitary the analogous
sum has at least three Jordan–Hölder constituents unless `(r, s) ∈ {(1, n), (0, 0)}`. The statement
assumes the two hypotheses for the ranks that occur. ([ACC+23, §2.4.9, proofs of Theorems 2.4.10 and
2.4.11, pp. 949–953]; [NT16, §4, Lemma 4.6 and the end of the proof of Theorem 4.2, pp. 59–60])

The API: LocallySymmetric.GaloisInput.GL — the hypothesis for `GL_m` over `F`;
LocallySymmetric.GaloisInput.unitary — the hypothesis for `U(m, m)` over `F⁺`;
LocallySymmetric.GaloisInput.induced_charpoly — comparison (i);
LocallySymmetric.GaloisInput.unitary_constituents — comparison (ii).

*Needs:* ALS.4.2; ALS.5b.4;
IntegralHeckeAndGaloisDeterminants, Layers 3a–3b (spherical Hecke
polynomials and the Galois-type predicate); IntegralHeckeAndGaloisDeterminants, Layers 0–1 (determinants, and
semisimple reconstruction in §1.2); SmoothRepresentationsOfLocalGroups SR.4.1 (Satake transforms);
ALS.F.6 (cuspidal automorphic representations);
ALS.F.7 (cohomological representations).

**Checks.**

- galoisInput_generator_GL2 (computation): `n = 2`, `Q = B`, so `a_1 − b_1 = 1` and
  `a_2 − b_2 = −1`. The normalized image of `T_{v,1}` is `q_v^{1/2}(Y_1 + Y_2)` and
  `S_v(T_{v,1}) = q_vZ_{1,1} + Z_{2,1}`; the substitution `Y_1 ↦ q_v^{1/2}Z_{1,1}`,
  `Y_2 ↦ q_v^{−1/2}Z_{2,1}` turns the first
  into
  the second. The exponent `a_i − b_i` would give `q_v^{3/2}Z_{1,1} + q_v^{−1/2}Z_{2,1}`, which at
  `q_v = 4` and `Z = 1` is `17/2` instead of `5`.
- galoisInput_induced_trivial (computation): `n = 2`, `Q = B`, `σ` trivial (the eigensystem of
  constant functions, `T_{v,1} = 1 + q_v`, `T_{v,2} = 1`): through the same substitution the block
  parameters `1, 1` give the `GL_2` parameters `q_v^{1/2}, q_v^{−1/2}`, hence
  `T_{v,1} = q_v^{1/2}(q_v^{1/2} + q_v^{−1/2}) = 1 + q_v` and roots `q_v, 1` of `P_v`; so
  `r_ι(M) = ε^{−1} ⊕ 1`,
  and with geometric Frobenius `ε^{−1}(Frob_v) = q_v` the characteristic polynomial is
  `(X − q_v)(X − 1) = X² − (1 + q_v)X + q_v = P_v(X) mod M`, as in eisenstein_H0.
- galoisInput_induced_whole (degenerate): for `Q = G` (`r = 1`), `a_1 = b_1 = 0`, the substitution
  is the identity and the comparison says `r_ι(M) = r_ι(π)`.
- galoisInput_induced_twist (non-example): dropping the cyclotomic twists gives `1 ⊕ 1` for the
  constant eigensystem, with characteristic polynomial `(X − 1)²`, which is not `P_v(X) mod M`.
- galoisInput_unitary_U11: for `n = 1` the only proper parabolic of `U(1, 1)` is the Borel, which
  is the Siegel parabolic `(r, s) = (1, 1)`; the comparison excludes nothing there, which is why the
  Siegel case is handled by the weight hypothesis of ALS.5b.9.

### ALS.5b.8 Rational cohomology at a non-Eisenstein ideal is cuspidal and lives in [q₀, q₀ + ℓ₀]

Prove LocallySymmetric.nonEisenstein_cuspidal_range. Let `F` be an imaginary CM field with maximal
totally real subfield `F⁺`, fix `ι : Q̄_p ≅ ℂ`, let `q₀ = [F⁺ : ℚ] n(n − 1)/2` and
`ℓ₀ = [F⁺ : ℚ] n − 1`, let `K ⊂ GL_n(𝔸_F^∞)` be good and `V_λ` the `𝒪`-lattice of highest weight `λ`
(ALS.F.7). (1) If `π` is
cuspidal regular algebraic of weight `ιλ` with `(π^∞)^K ≠ 0`, the Hecke eigensystem of `(ι⁻¹π^∞)^K`
factors through `T^S → T^S(K, λ)`. (2) If `𝔪 ⊂ T^S(K, V_λ)` is a maximal ideal of Galois type with
`ρ̄_𝔪` absolutely irreducible, then `H^j(X_K, V_λ)_𝔪[1/p] ≠ 0` only for `j ∈ [q₀, q₀ + ℓ₀]`, and if
one of these groups is nonzero all are; and every homomorphism `f : T^S(K, V_λ)_𝔪 → Q̄_p` is the
eigensystem of `(ι⁻¹π^∞)^K` for a cuspidal regular algebraic `π` of weight `ιλ`, with `r_ι(π)`
residually isomorphic to `ρ̄_𝔪`. The proof: by ALS.5b.4 the cohomology
decomposes over associate classes; a proper class `{Q}` carries only eigensystems of induced
representations, whose Galois representations are reducible by
ALS.5b.7 (i), so it dies at `𝔪`; on the cuspidal summand
Wigner's lemma, Clozel's lemma and Borel–Wallach give the weight condition and the degree range
`[q₀, q₀ + ℓ₀]` (with the Künneth formula over the archimedean places). The statement assumes `F`
imaginary CM; `K` good; `𝔪` of Galois type with `ρ̄_𝔪` absolutely irreducible;
`FrankeInput(Res_{F/ℚ} GL_n, K, V_{ιλ})`; `GaloisInput.GL(F, m)` for `m ≤ n`. ([ACC+23, §2.4.9,
Theorem 2.4.10, pp. 948–951])

*Needs:* ALS.5b.4; ALS.5b.5;
ALS.5b.7; ALS.4.10;
ALS.4.9; ALS.F.7 (algebraic
weights and lattices, Wigner's lemma, `q₀`, `ℓ₀` and the degree range).

**Checks.**

- `n = 1`: `q₀ = 0` and `ℓ₀ = [F⁺ : ℚ] − 1`, the dimension of the components of `X_K` (tori of the
  unit rank of `F`).
- `n = 2`, `F` imaginary quadratic: `[q₀, q₀ + ℓ₀] = [1, 2]`, the cuspidal range of Bianchi
  threefolds.
- Non-example: at an Eisenstein `𝔪` the range fails; for `GL_2` over an imaginary quadratic field
  the constant-function eigensystem gives a nonzero `H⁰`, outside `[1, 2]`.

### ALS.5b.9 Middle-degree rational cohomology of `U`(n, n) at a split ideal is semisimple and cuspidal

Prove LocallySymmetric.unitary_middleDegree_cuspidal. Let `F` be a CM field containing an
imaginary quadratic field, `G̃ = U(n, n)` over `F⁺` with Siegel parabolic `P` and Levi
`Res_{F/F⁺} GL_n`, `ρ` half the sum of the positive roots of `Res_{F⁺/ℚ} G̃` (an element of
`X^*(Res_{F⁺/ℚ} T) ⊗ ℚ` for the diagonal torus `T`; generally half-integral, while `w(λ̃ + ρ) − ρ`
is integral), `ι : Q̄_p ≅ ℂ`, and `λ̃ ∈ (ℤ^{2n}_+)^{Hom(F⁺, E)}` such that for every Kostant
representative `w ∈ W^P`
there is no cuspidal automorphic representation of `GL_n(𝔸_F)` of weight `ιλ_w`, where
`λ_w = w(λ̃ + ρ) − ρ` is read as a `GL_n/F` weight through the Siegel-Levi identification
`(ℤ^{2n})^{Hom(F⁺, E)} ≅ (ℤ^n)^{Hom(F, E)}`. Let `S = S^c` contain the `p`-adic places, with every
`v ∉ S` of residue
characteristic `ℓ` either such that no `ℓ`-adic place lies in `S` and `ℓ` is unramified in `F`, or
such that `ℓ` splits in an imaginary quadratic subfield of `F`. Let `𝔪̃ ⊂ T̃^S` be a maximal ideal
in the support of `H^*(X̃_{K̃}, Ṽ_λ̃)` of Galois type with `ρ̄_𝔪̃` a direct sum of two
`n`-dimensional absolutely irreducible representations of `G_F`, and `d = ½ dim_ℝ X̃ = n²[F⁺ : ℚ]`.
Then `H^d(X̃_{K̃}, Ṽ_λ̃)_𝔪̃[1/p]` is a semisimple `T̃^S[1/p]`-module, and every homomorphism
`T̃^S(H^d(X̃_{K̃}, Ṽ_λ̃)_𝔪̃) → Q̄_p` is the eigensystem of `(ι⁻¹π̃^∞)^{K̃}` for a cuspidal regular
algebraic `π̃` of `G̃(𝔸_{F⁺})` of weight `ιλ̃`. The proof: by ALS.5b.4
the degree-`d` cohomology decomposes over associate classes (with no central twist, `Res_{F⁺/ℚ} G̃`
having no split centre); the Siegel class dies by the weight hypothesis, through the Kostant modules
of ALS.4.6; every other proper class dies at `𝔪̃` by
ALS.5b.7 (ii), since its Galois representations have at
least three constituents; the cuspidal summand is semisimple. The statement assumes the field,
weight and `S` conditions above; `ρ̄_𝔪̃` a sum of two `n`-dimensional absolutely irreducible
representations; `FrankeInput(Res_{F⁺/ℚ} G̃, K̃, Ṽ_{ιλ̃})`; `GaloisInput.GL(F, m)` and
`GaloisInput.unitary(F, m)` for `m ≤ n`. ([ACC+23, §2.4.9, Theorem 2.4.11 and its proof, pp.
951–953]; [ACC+23, Theorem 2.3.8, p. 939], for the condition on `S`)

*Needs:* ALS.5b.4; ALS.5b.5;
ALS.5b.7;
ALS.4.6; ALS.4.13
(Levi decomposition and Satake-polynomial comparison only; the characteristic-zero argument uses
`GaloisInput`, independently of `ResidualUnitaryGaloisInput`);
ALS.4.10; ALS.F.7 (Wigner's lemma).

**Checks.**

- `n = 1`: `G̃ = U(1, 1)`, `d = [F⁺ : ℚ]`, the middle degree of a quotient of a product of
  hyperbolic planes; the only proper parabolic is the Siegel (Borel) one.
- If `ρ̄_𝔪̃` has three or more constituents the conclusion can fail through Eisenstein contributions
  of the non-Siegel classes.
- Non-example: the weight hypothesis cannot be dropped; if `λ_w` is the weight of a cuspidal `π` of
  `GL_n(𝔸_F)` for some `w ∈ W^P`, the Siegel class can carry eigensystems of `Ind_P(π)` whose Galois
  representation is a sum of two `n`-dimensional pieces, compatible with the residual hypothesis.

### Examples

- Modular curves with `V = Sym^k ℂ²`: `H¹` is computed by `V`-valued forms of moderate growth, its
  cuspidal part is the Eichler–Shimura pair, and its `{B}`-part is spanned by Eisenstein classes.
- `GL_2` over an imaginary quadratic field: `q₀ = 1`, `ℓ₀ = 1`, so rational cohomology at a
  non-Eisenstein ideal lives in degrees `1` and `2`.
- `GL_n`, `n = 1`: `q₀ = 0`, and an algebraic Hecke character contributes to `H⁰`.

### Dependencies

Layers ALS.F and ALS.0–ALS.5a; DifferentialGeometry, Layers 0, 2, 6 and 8;
IntegralHeckeAndGaloisDeterminants, Layers 0, 1, 3a and 3b;
SmoothRepresentationsOfLocalGroups SR.4.1; the hypotheses `FrankeInput` and `GaloisInput`.

## Layer ALS.6: Finite covers and descent

This layer descends along finite covers: the relative complexes with their residual finite-group
action and Hecke operators, the Hochschild–Serre spectral sequence with Hecke action, descent of the
lowest localized degree along `p`-group covers, and examples for modular and quaternionic
towers. It exports finite-level descent and refinement maps; assembly over level systems is not part
of this roadmap.

### ALS.6.1 Finite-level descent along a normal inclusion of levels

Prove LocallySymmetric.RΓrel.descent. Let `K′⊲K` compact open, differing only at places in `S′`, and `V`
finite projective with the needed commuting coefficient actions. The relative compactified
equivariant construction gives `C_{K′/K}=RΓ_{K/K′}(X_{K′},V)` in `D(R[K/K′])`, with a ring homomorphism
`H(G^{S∪S′},K^{S∪S′})⊗R→End_{D(R[K/K′])}(C_{K′/K})`. There is a natural isomorphism
`RΓ(K/K′,C_{K′/K})≅RΓ(X_K,V)` in `D(R)`, intertwining all these Hecke operators; its forgetful image is
`RΓ(X_{K′},V)`. The same statements hold for compact support and boundary using
ALS.1.2, compatibly with their exact triangle. For `K″⊂K′` with both `K″` and `K′`
normal in `K` choose a common neat normal refinement inside `K″`: the two iterated derived-invariants
identifications agree with direct `K/K″` descent, including the relative residual actions. If full `K`
is good neat, the free full-level finite cell model proves `PerfectComplex.IsPerfect` over the
possibly noncommutative ring `R[K/K′]` by ALS.F.2.
If only `K′` is neat, only underlying `R`-perfectness is asserted. The strict lift to `D(H⊗R[K/K′])` is
the relative Hecke complex of ALS.3.4, and the descent isomorphism is its
heckeComplex.invariants. This target exports finite-level descent and refinement maps; assembly
into level systems is not part of this roadmap. The statement assumes: `K′ ⊲ K`, equal away from a
finite set `S′; K` neat for group-ring perfectness; `K′` neat suffices for perfectness over `R` after
forgetting the action. ([ACC+23, §2.1.2, (2.1.5)–(2.1.6), pp. 911–912]; [ACC+23, §2.1.2, Lemma
2.1.7, p. 912])

*Needs:* ALS.3.3; ALS.3.6; ALS.4.1;
ALS.2.4; AlgebraicTopology, Stage 5; ALS.3.4;
ALS.1.3; ALS.F.2 for general-ring perfectness
and restriction of scalars.

**Checks.**

- `K′ = K: RΓ_{K/K} = RΓ(X_K, V)`.
- For `K/K′` of order invertible in `R, RΓ(X_K, V) = RΓ(X_{K′}, V)^{K/K′}`.
- For a full-level free model and nonabelian quotient `S₃`, descent takes the perfect left
  `R[S₃]`-complex to `RΓ(X_K,V)`. Restriction to `R` preserves perfectness without averaging; the
  descent isomorphism uses derived invariants even when `6` is not invertible in `R`.

### ALS.6.2 The finite-cover Hochschild–Serre spectral sequence with Hecke action

Prove LocallySymmetric.hochschildSerre. In the situation of ALS.6.1 there
is a convergent first-quadrant spectral sequence
`E_2^{i,j} = H^i(K/K′, H^j(X_{K′}, V)) ⇒ H^{i+j}(X_K, V)`, natural in `V`, functorial for inclusions
of such pairs, and equivariant for
`H(G^{S∪S′}, K^{S∪S′}) ⊗ R` acting on both sides (Hecke operators at places where `K` and `K′` agree);
likewise for `H^*_c` and `H^*(∂X̄)`, compatibly with the maps of the boundary triangle, and the edge
maps are `π^* (E_2^{0,j} ← H^j)` and restriction/corestriction identities hold
`(res ∘ cor = Σ_{k∈K/K′} k, cor ∘ res = [K : K′])`. At neat level it is the Cartan–Leray spectral
sequence of the regular
covering `X_{K′} → X_K`; at non-neat level `K` it computes the groupoid cohomology of `X_K`. If `|K/K′|` is
invertible in `R` it degenerates: `H^*(X_K, V) = H^*(X_{K′}, V)^{K/K′}`. The statement assumes: as in
ALS.6.1. ([CGH20, §3.1, proof of Theorem 3.2, pp. 5–6]; [CG18, §9, proof of
Lemma 9.6, pp. 88–90])

*Needs:* ALS.6.1; ALS.3.6; AlgebraicTopology, Stage 5;
Mathlib `groupCohomology`.

**Checks.**

- `Y_1(Q) → Y_0(Q)` with group `Δ_Q: E_2^{i,j} = H^i(Δ_Q, H^j(Y_1(Q), V))`.
- For `K/K′` of order prime to `p` and `V = O/ϖ^n, H^*(X_K) = H^*(X_{K′})^{K/K′}`.

### ALS.6.3 The lowest nonvanishing localized degree descends along a p-group cover

Prove LocallySymmetric.lowestDegree_descent. Let `K′ ⊂ K` be as in ALS.6.1,
`k` a field of characteristic `p, V` a `k[G(F)×K_{S∪S′}]`-module finite over `k`, and `𝔪` a maximal ideal of
the Hecke algebra away from `S ∪ S′` (and from the places where `K′ ≠ K`), possibly enlarged by
operators `U_x` commuting with the `K/K′`-action. Let `i` be the least degree with `H^i(X_{K′}, V)_𝔪 ≠ 0`.
If `K/K′` is a `p`-group, or more generally `K/K′` acts on `H^i(X_{K′}, V)_𝔪` through a `p`-group quotient,
then `H^i(X_K, V)_𝔪 ≠ 0` and `H^j(X_K, V)_𝔪 = 0` for `j < i`. In particular, for the Taylor–Wiles covers
of ALS.0.10 the statement applies to `Y_Δ(Q) → Y_0(Q)` for `Δ` the maximal
`p`-power quotient of `Δ_Q` (not to `Y_1(Q) → Y_0(Q)` itself unless `Δ_Q` is a `p`-group or its prime-to-`p`
part acts trivially after localization). The proof of CGH20 Theorem 3.2 descends from `Y_1(Q)`, whose
group over `Y_0(Q)` is all of `Δ_Q` (CG18 §9.0.1); the argument holds as written for `Y_Δ(Q)`, which is
what the Taylor–Wiles application needs. The key step, that a `p`-group acting on a nonzero module in
characteristic `p` has nonzero invariants, is Tau Ceti's
`Representation.invariants_ne_bot_of_forall_pow_eq_one`. The statement assumes: `k`
of characteristic `p; K/K′` acting on `H^i(X_{K′}, V)_𝔪` through a `p`-group. ([CGH20, §3.1,
proof of Theorem 3.2, pp. 5–6]; [CGH20, §3.1, Theorem 3.2, pp. 5–6])

*Needs:* ALS.6.2; ALS.4.9;
ALS.0.10; Tau Ceti `Representation.invariants_ne_bot_of_forall_pow_eq_one`.

**Checks.**

- `K/K′ = ℤ/p, V = F_p`: the lowest localized degree is the same at both levels.
- Counterexample to the unrestricted statement: for `K/K′` of order prime to `p` acting on `H^i(X_{K′})_𝔪`
  through a nontrivial character, the invariants vanish and `H^i(X_K)_𝔪` can be 0.

### ALS.6.4 Finite-cover examples for modular and compact quotients

Prove LocallySymmetric.towerChecks. (i) Modular curves: for `G = SL_{2,ℚ}` (or `GL_{2,ℚ}`), `N ≥ 3` and
a prime `p ∤ N, K′ = K(Np) ⊂ K = K(N)` is normal with `K/K′ ≅ SL_2(F_p)` (resp. `GL_2(F_p)` on the whole
adelic cover; determinant-one subgroups stabilize individual components); the finite-cover
Hochschild–Serre spectral sequence for `X_{K′} → X_K` with `ℚ`-coefficients degenerates,
`H¹(X_K, ℚ) = H¹(X_{K′}, ℚ)^{K/K′}`, compatibly with `T_ℓ` (`ℓ ∤` Np), with `H¹_c` and with the
boundary circles (cusps
of `X_{K′}` over a cusp of `X_K` form a `K/K′`-set with stabilizers the upper unipotent subgroup);
`dim H¹ = 2g + c − 1` per component. (ii) Compact quotients: for `G = D^×/ℚ^×` with `D` an
indefinite quaternion
algebra over `ℚ`, ramified at a nonempty set of primes, every `X_K` is compact (no proper `ℚ`-parabolics),
`∂X̄_K = ∅, RΓ_c = RΓ`, and for neat `K′ ⊲ K` the spectral sequence of
ALS.6.2 with `F_ℓ`-coefficients, `ℓ ∤ |K/K′|`, degenerates to
`H^*(X_K, F_ℓ) = H^*(X_{K′}, F_ℓ)^{K/K′}`, while for `ℓ | |K/K′|` nontrivial differentials and
higher group
cohomology can occur. ([ACC+23, §2.1.2, (2.1.6), p. 912]; [NT16, §1, p. 1])

*Needs:* ALS.6.2; ALS.4.1;
ALS.2.5; ALS.0.7; AdelicAlgebraicGroups §3.4
(compactness criterion, `Reduction.exists_compact_normOne_iff`); Mathlib
`CongruenceSubgroup.Gamma0`; Mathlib `CongruenceSubgroup.Gamma1`; Mathlib `UpperHalfPlane`.
The connected-compact example uses ALS.0.4,
ALS.F.4 (finite-quotient invariants) and
ALS.1.5 (rational coarse comparison).

**Checks.**

- The compactified modular curve `X(7)` has genus 3 and 24 cusps; its open component `Y(7)` has
  `dim H¹(Y(7),ℚ) = 2·3+24−1 = 29`. For `p∤7, H¹(Y(7),ℚ) ≅ H¹(Y(7p),ℚ)^{SL_2(F_p)}` for the `SL_2`
  tower.
- For `D` of discriminant 6, fix a maximal order `O_D` and take `K` to be the product of the images
  of `O_{D,v}^×` in the local projective groups. The connected-compact variant `X̃_K`, with
  `K_∞° ≅ SO(2)` and symmetric space `ℍ^±`, is the usual compact Shimura curve of genus 0
  ([Voi21, §43.2, pp. 788–789]). `X_K` uses PO(2) and is its folded quotient; finite-quotient
  rational invariants give `H¹(X_K,ℚ) = 0`. For `D = (2,3)_ℚ` choose `O_D` containing `i` with `i² = 2`.
  The unit `1+i` has reduced norm `−1` and inverse `i−1`, so its class lies in `K` at every finite
  place and reverses orientation. A negative-norm unit fixing a point of `ℍ` would have trace
  zero and square 1, impossible in a division algebra; the induced involution on `X̃_K` is free.
  Thus the folded coarse component is `ℝP²`, with `H²(X_K,ℚ) = 0`, while `H²(X̃_K,ℚ) = ℚ`.
- Cusps in (i) for `N = 3` and `p = 2: K/K′ = SL_2(F_2) ≅ S_3` permutes the 12 cusps of `Y(6)` over the 4
  cusps of `Y(3)`, with stabilizers the upper unipotent subgroup of order 2, so each fibre has 3
  cusps.

### Examples

- `X(7)` has genus `3` and `24` cusps; `dim H¹(Y(7), ℚ) = 2·3 + 24 − 1 = 29`, and for `p ∤ 7`,
  `H¹(Y(7), ℚ) ≅ H¹(Y(7p), ℚ)^{SL_2(F_p)}` in the `SL_2` tower.
- At the maximal-order unit level for discriminant `6`, the connected-compact quotient `X̃_K`
  is the genus-zero Shimura curve; the PO(2) quotient `X_K` has coarse component `ℝP²` and
  `H¹(X_K, ℚ) = 0` by finite-quotient invariants.
- Taylor–Wiles covers: `Y_Δ(Q) → Y_0(Q)` with `Δ` the maximal `p`-power quotient of `Δ_Q` preserves
  the lowest localized degree; the full cover `Y_1(Q) → Y_0(Q)` need not when `Δ_Q` has prime-to-`p`
  part acting nontrivially.

### Dependencies

Layers ALS.1–ALS.4; AlgebraicTopology, Stage 5; Mathlib (`groupCohomology`,
`CongruenceSubgroup.Gamma0`, `CongruenceSubgroup.Gamma1`, `UpperHalfPlane`); AdelicAlgebraicGroups
§3.4.

## References

- **[Voi21]** J. Voight, *Quaternion algebras*, Springer (2021), stable post-publication version
  1.0.5 (2024), [author copy](https://jvoight.github.io/quat-book-v1.0.5.pdf).
- **[ACC+23]** P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P.
  Scholze, R. Taylor, J. A. Thorne, *Potential automorphy over CM fields*, Annals of Mathematics 197
  (2023), 897–1113; page numbers are those of the Annals, as in the [author
  copy](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
- **[BJ79]** A. Borel, H. Jacquet, *Automorphic forms and automorphic representations*, in
  *Automorphic forms, representations and L-functions*, Part 1, Proceedings of Symposia in Pure
  Mathematics 33, American Mathematical Society (1979), 189–202.
- **[BK]** J. Bernstein, B. Krötz, *Smooth Fréchet globalizations of Harish-Chandra modules*,
  [arXiv:0812.1684v3](https://arxiv.org/abs/0812.1684v3), §4, pp. 20–21.
- **[BorAF]** A. Borel, *Automorphic forms on reductive groups*,
  [notes](https://homepages.math.uic.edu/~rtakloo/papers/borel/borel3.pdf), §4.2, p. 4.
- **[Bor83]** A. Borel, *Regularization theorems in Lie algebra cohomology. Applications*, Duke
  Mathematical Journal 50 (1983), 605–623.
- **[BS73]** A. Borel, J.-P. Serre, *Corners and arithmetic groups*, Commentarii Mathematici
  Helvetici 48 (1973), 436–483,
  [e-periodica](https://www.e-periodica.ch/iiif/com-001:1973:48::32/manifest).
- **[CG18]** F. Calegari, D. Geraghty, *Modularity lifting beyond the Taylor–Wiles method*,
  Inventiones Mathematicae 211 (2018), 297–433; section and page numbers are those of
  [arXiv:1207.4224v2](https://arxiv.org/abs/1207.4224v2), whose §9.0.1 is the published §9.1.
- **[CGH20]** F. Calegari, D. Geraghty, M. Harris, *Bloch–Kato conjectures for automorphic motives*,
  [arXiv:1907.08694](https://arxiv.org/abs/1907.08694), §3.1; published as the appendix to
  Calegari–Geraghty, *Minimal modularity lifting for nonregular symplectic representations*, where
  §3.1 is §A.3.1 and Theorem 3.2 is Theorem A.4.
- **[CN23]** A. Caraiani, J. Newton, *On the modularity of elliptic curves over imaginary quadratic
  fields*, [arXiv:2301.10509v3](https://arxiv.org/abs/2301.10509v3).
- **[DH73]** A. Douady, L. Hérault, *Arrondissement des variétés à coins*, appendix to [BS73],
  Commentarii Mathematici Helvetici 48 (1973), 484–489,
  [e-periodica](https://www.e-periodica.ch/iiif/com-001:1973:48::33/manifest).
- **[Fra98]** J. Franke, *Harmonic analysis in weighted L₂-spaces*, Annales scientifiques de l'École
  Normale Supérieure (4) 31 (1998), 181–279,
  [Numdam](https://www.numdam.org/item/10.1016/s0012-9593%2898%2980015-3.pdf).
- **[HR15]** G. Harder, A. Raghuram, *Eisenstein cohomology for GL_N and ratios of critical values
  of Rankin–Selberg L-functions*, [arXiv:1405.6513v2](https://arxiv.org/abs/1405.6513v2) (2015).
- **[JM02]** L. Ji, R. MacPherson, *Geometry of compactifications of locally symmetric spaces*,
  Annales de l'Institut Fourier 52 (2002), 457–559,
  [Numdam](https://www.numdam.org/item/AIF_2002__52_2_457_0.pdf).
- **[Kos61]** B. Kostant, *Lie algebra cohomology and the generalized Borel–Weil theorem*, Annals of
  Mathematics 74 (1961), 329–387.
- **[Mil17]** J. S. Milne, *Introduction to Shimura varieties*, notes, version of 16 September 2017,
  [jmilne.org](https://www.jmilne.org/math/xnotes/svi.pdf).
- **[Mun66]** J. R. Munkres, *Elementary Differential Topology*, revised edition, Annals of
  Mathematics Studies 54, Princeton University Press (1966).
- **[NSW]** J. Neukirch, A. Schmidt, K. Wingberg, *Cohomology of Number Fields*, 2nd edition,
  electronic edition 2.3, [author page](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/);
  (1.5.6) is in §I.5, p. 51.
- **[NT16]** J. Newton, J. A. Thorne, *Torsion Galois representations over CM fields and Hecke
  algebras in the derived category*, Forum of Mathematics, Sigma 4 (2016), e21; page numbers are
  those of the [published version](https://doi.org/10.1017/fms.2016.16).
-  **[PRR23]** V. Platonov, A. Rapinchuk, I. Rapinchuk, *Algebraic Groups and Number Theory*, volume
  1,
  2nd edition, Cambridge University Press (2023), doi:10.1017/9781139017756.
- **[Sch15]** P. Scholze, *On torsion in the cohomology of locally symmetric varieties*, Annals of
  Mathematics 182 (2015), 945–1066; section and page numbers are those of
  [arXiv:1306.2070v2](https://arxiv.org/abs/1306.2070v2), whose Corollary V.4.2 is the published
  Corollary 5.4.2.
- **[Schw83]** J. Schwermer, *Kohomologie arithmetisch definierter Gruppen und Eisensteinreihen*,
  Lecture Notes in Mathematics 988, Springer (1983).
-  **[Schw90]** J. Schwermer, *Cohomology of arithmetic groups, automorphic forms and L-functions*,
  in
  *Cohomology of arithmetic groups and automorphic forms* (Luminy–Marseille, 1989), Lecture Notes in
  Mathematics 1447, Springer (1990), 1–29.
- **[Sel16]** Y. Sella, *Comparison of sheaf cohomology and singular cohomology*,
  [arXiv:1602.06674v3](https://arxiv.org/abs/1602.06674v3).
- **[Stacks]** The Stacks project authors, *The Stacks project*,
  [stacks.math.columbia.edu](https://stacks.math.columbia.edu); tags in parentheses.
- **[Whi40]** J. H. C. Whitehead, *On C¹-complexes*, Annals of Mathematics 41 (1940), 809–824.
