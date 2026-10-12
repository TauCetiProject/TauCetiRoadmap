# Roadmap: analytic adic geometry for diamonds

**Summary.** Scholze's comparison between the étale site of an analytic adic space and that of its
diamond needs, on the adic side, an étale geometry beyond Huber's noetherian setting. This roadmap
supplies it. Layer A0 fixes how completed tensor products and fibre products of complete Huber
pairs are used and adds the analytic locus of a non-Tate space. Layer A1 defines finite étale
algebras over arbitrary complete Tate rings with their Huber pairs, strongly sheafy rings, finite
étale and étale morphisms by Kedlaya–Liu's local description, and builds the étale, finite étale,
pro-étale and pro-finite-étale sites with geometric points, strict localisations, the finite étale
fundamental group and the presentation of non-sheafy spaces as Yoneda-adic spaces. Layer A2 adds
relative polydiscs and tori, smooth morphisms by ball charts, compatible toric charts and the
dimension theory of adic spaces. Layer A3 proves the nonnoetherian affinoid étale approximation of
Scholze's Lemma 6.4(iv) from pseudocoherent modules and standard étale presentations. Layer A4
builds the tower of finite étale torsors of an analytic adic space over `Spa ℤ_p`, proves its
uniform completion perfectoid (Scholze's Lemma 15.3) and assembles the perfectoid torsor
presentation from which DiamondsAndVStacks layer D6 builds the diamond and identifies the étale
sites (Scholze's Proposition 15.4, Definition 15.5, Lemma 15.6).

| Layer | Title | What it builds |
|---|---|---|
| A0 | Completed tensor products and the fibre products actually used | the completed pushout of complete Huber pairs, rational and finite étale pullbacks, associativity, the analytic locus |
| A1 | Finite étale and étale geometry | finite étale pairs and morphisms, étale morphisms by local description, the étale, finite étale and pro-étale sites, geometric points, Yoneda-adic presentations |
| A2 | Separatedness, smooth charts, and classical analytic geometry | relative polydiscs and tori, smooth morphisms by ball charts, toric charts, dimension |
| A3 | The nonnoetherian affinoid étale approximation input | pseudocoherent modules, standard étale presentations, the closed embedding into a relative ball, Scholze's Lemma 6.4(iv) |
| A4 | Analytic adic presentations for diamondification | split rings, finite étale torsors and their tower, perfectoidness, the perfectoid torsor presentation |

```text
AdicSpacesPartII R0–R1, AdicSpacesPartIII F0/R2/R3 → A0, A2
A0, AdicSpacesPartII R0, AdicSpacesPartIII R3, DiamondsAndVStacks D0 → A1 → A2
A1, AdicSpacesPartIV R5, PerfectoidSpaces P1–P5 → A3
A1, PerfectoidSpaces P1–P3, P5–P6, PerfectoidTowers P9 → A4 → DiamondsAndVStacks D6
```

## Scope and ownership

This roadmap owns: in A0, the completed pushout of complete Huber pairs as the interface to
AdicSpacesPartII R0's completed tensor product, the comparisons R0 does not state (tracking of
definition data and plus rings, associativity, symmetry, unit, maps into affinoids) and the analytic
locus; in A1, strongly sheafy rings, the Huber pair of a finite étale algebra, finite étale and
étale morphisms of analytic adic spaces with the comparison to Huber's definitions, the étale,
finite étale, pro-étale and pro-finite-étale sites, geometric points, strict localisations, the
finite étale fundamental group, Kedlaya–Liu's site of an arbitrary analytic adic space, profinite
`G`-sets, change of base field, points (with Deligne's theorem on coherent topoi as a stated input)
and Yoneda-adic spaces; in A2, relative polydiscs and tori, smooth morphisms by ball charts,
compatible toric charts and dimension; in A3, pseudocoherent modules and sheaves over Tate rings,
standard étale presentations, the closed embedding of an affinoid étale object into a relative ball
and Lemma 6.4(iv); in A4, rings without nonsplit finite étale covers, finite étale torsors and their
tower, the completed tower, its perfectoidness and spectra, and the perfectoid torsor presentation.

AdicSpaces and AdicSpacesPartII own Huber pairs, adic spaces, completed tensor products,
uniformisation, fibre products and Huber's morphism classes; AdicSpacesPartIII owns formal schemes,
generic fibres, coherent sheaves and continuous differentials; AdicSpacesPartIV owns the site
applications of R4 and the sousperfectoid theory of R5, and re-exports the sites of A1 on its
carriers (*etale-slice-site*, *proetale-slice-open-subspace*, *etale-site-functoriality*,
*stable-basis-covering-reduction*). PerfectoidSpaces P1–P7 own perfectoid Tate rings, almost purity,
tilting and the finite-stage descent of Lemma 6.4(o)–(iii); PerfectoidTowers P8–P9 own quotients and
towers; DiamondsAndVStacks owns pro-categories and the qcqs vocabulary of topoi (D0) and `Spd`, the
representability of diamonds and the comparison of étale sites (D6). Derived étale cohomology
belongs to the étale-cohomology roadmaps; the sites here are geometric sites. Where a clause of a
target here is a sibling's statement in a special case (locally noetherian, strongly noetherian,
sousperfectoid, perfectoid), the target names the sibling label and states only what remains its
own.

## Conventions

1. Huber rings, pairs, morphisms of pairs, adic spectra and rational subsets are Tau Ceti's;
complete includes Hausdorff; adic spaces are `TauCeti.AdicSpace`, with AdicSpacesPartII's affinoid
charts and morphism classes. 2. *Analytic* means every point is analytic; then affinoid charts can
be taken Tate and every morphism into the space is adic. 3. A finite étale algebra over a complete
Tate ring carries its natural (module) topology and the plus ring is the integral closure of the
image of `A⁺`, never `B°`. 4. *Étale* means Kedlaya–Liu's local description (open immersion, finite
étale, open immersion); Huber's infinitesimal notion is AdicSpacesPartII's `AdicSpace.Etale`, used
only for comparison. 5. Statements that need fibre products of étale maps are made over locally
strongly sheafy spaces; sheafiness alone is not known to pass to finite étale extensions. 6.
Coverings are jointly surjective on all points, including points of higher rank; geometric points
are `Spa(C, C⁺) → X` with `C` complete algebraically closed and `C⁺` of any rank. 7. Pro-étale
coverings follow Scholze's erratum to [PH]: a transfinite tower of pullbacks of finite étale
surjections followed by an étale map; the deleted statements of the 2013 paper are not used. 8. The
dimension of an adic space is the topological Krull dimension of its underlying space. 9.
`|f| ≤ |g|^{a/b}` means `v(f^b) ≤ v(g^a)`; the action of a group on spectra is by transport,
`(g · v)(b) = v(g⁻¹ b)`, so `b ↦ (g ↦ g · b)` induces `(g, x) ↦ g⁻¹ x` on spectra.

## Exact supplier contracts

| Supplier | Exact file | Contract used |
|---|---|---|
| Mathlib `Algebra.Etale`, `Module.Finite`, `Module.FaithfullyFlat`, `Module.rankAtStalk`, `Algebra.IsFiniteSplit`, `IsSepClosed`, `IsGalois`, `MulSemiringAction`, `HenselianRing`, `Ring.DirectLimit` | `Mathlib/RingTheory/Etale/Basic.lean`, `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean`, `Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean`, `Mathlib/RingTheory/TotallySplit.lean`, `Mathlib/FieldTheory/IsSepClosed.lean`, `Mathlib/FieldTheory/Galois/Basic.lean`, `Mathlib/Algebra/Ring/Action/Basic.lean`, `Mathlib/RingTheory/Henselian.lean`, `Mathlib/Algebra/Colimit/Ring.lean` | Finite étale algebras, faithful flatness, rank, split algebras, separably closed fields, Galois extensions, henselian pairs, direct limits. |
| Mathlib `IsModuleTopology`, `moduleTopology`, `topologicalKrullDim`, `ringKrullDim`, `MvPowerSeries.pderiv`, `CategoryTheory.Limits.PullbackCone`, `GrothendieckTopology` | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean`, `Mathlib/Topology/KrullDimension.lean`, `Mathlib/RingTheory/KrullDimension/Basic.lean`, `Mathlib/RingTheory/MvPowerSeries/Derivative.lean`, `Mathlib/CategoryTheory/Limits/Shapes/Pullback/PullbackCone.lean`, `Mathlib/CategoryTheory/Sites/Grothendieck.lean` | Natural topology of finite modules, dimension, partial derivatives, limits and sites. |
| Tau Ceti `Huber.IsHuberRing`, `Huber.IsTateRing`, `Huber.PairOfDefinition`, `Huber.IsPseudoUniformizer` | `TauCeti/RingTheory/Huber/Basic.lean:156,192,142,165` | Huber and Tate rings, pairs of definition, pseudouniformisers. |
| Tau Ceti `Huber.Pair`, `Huber.Pair.Hom`, `Huber.Pair.powerBounded`, `Huber.powerBoundedSubring`, `Huber.IsBounded`, `Huber.IsUniform` | `TauCeti/RingTheory/Huber/Pair.lean:138,155,227`; `PowerBounded.lean:433`; `Bounded.lean:89`; `Uniform.lean:65` | Huber pairs and their morphisms, `A°`, boundedness, uniformity. |
| Tau Ceti `Huber.restrictedMvPowerSeriesCompletion`, `Huber.weightedRestrictedSubring`, `Huber.weightedX`, `Huber.IsStronglyNoetherian` | `TauCeti/RingTheory/Huber/StronglyNoetherian.lean:253,135`; `WeightedRestrictedSeries/Basic.lean:709,747` | Tate algebras `A⟨T₁, …, Tₙ⟩`, restricted series and their variables, strong noetherianness. |
| Tau Ceti `Huber.PairOfDefinition.locUniformSpace`, `toCompletionLoc`, `completedPlusSubring` | `TauCeti/RingTheory/Huber/LocalizationTopology/Completion.lean:120`; `Trivial.lean:297`; `Plus.lean:116` | The completed rational localisation `A⟨T/s⟩` and its plus ring. |
| Tau Ceti `completeSpace_moduleTopology`, `Huber.IsTateRing.t2Space_moduleTopology` | `TauCeti/Topology/Algebra/Module/Finite.lean:82`; `TauCeti/RingTheory/Huber/FiniteModuleTopology.lean:62` | Completeness and (noetherian) Hausdorffness of the natural topology. |
| Tau Ceti `Huber.IsSheafyRing`, `Huber.IsStablySheafyRing`, `Huber.IsSheafyForEveryPresentation` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/SheafyRing.lean:82,175`; `SheafForEveryPresentation.lean:75` | Sheafy and stably sheafy rings. |
| Tau Ceti `ValuationSpectrum.spa`, `rationalSubset`, `spaAnalytic`, `IsAnalyticPoint`, `suppFun`, `Huber.Pair.Hom.spaComap`, `Huber.Pair.Hom.isSpectralMap_spaComap_of_isTateRing` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean:101`; `RationalSubset/Basic.lean:142`; `Analytic.lean:72,83`; `ValuationSpectrum/Basic.lean:501`; `HuberPair.lean:62`; `MorphismSpectral.lean:122` | Adic spectra, rational subsets, analytic points, supports, functoriality. |
| Tau Ceti `AdicSpace`, `PreAdicSpace.restrict`, `PreAdicSpace.ofRestrict`, `PreAdicSpace.IsOpenImmersion` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243`; `Restrict.lean:91,157`; `OpenImmersion.lean:61` | The category of adic spaces, open subspaces, open immersions. |
| AdicSpacesPartII `AdicSpace.Affinoid`, `Chart`, `HomChart`, `Affinoid.IsInducedBy`, `IsAnalytic`, `IsAdic`, `IsFinite`, `Etale`, `Smooth`, `LocallyOfWeaklyFiniteType`, `QuasiCompact`, `Huber.IsAdicHom`, `Huber.Pair.Hom.IsFinite`, `Huber.IsNoetherianType` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | Affinoid charts and Huber's morphism classes; completed tensor products, uniformisation, fibre products and rigid spaces are its README targets, cited by label. |
| AdicSpacesPartIII `Huber.IsRationalCompletion`, `Huber.GlueingSquare`, `Huber.GlueingDatum` | `TauCetiRoadmap/AdicSpacesPartIII/Suggested.lean` | Rational completions and Kiehl glueing; formal schemes, coherent sheaves and continuous differentials are its README targets. |
| AdicSpacesPartIV R4–R5; PerfectoidSpaces P1–P7; PerfectoidTowers P8–P9; DiamondsAndVStacks D0, D6 | roadmaps | Sousperfectoid rings, perfectoid rings, almost purity, tilting, towers, pro-categories and diamonds, cited by label at the targets. |

## How to read the build

`Suggested.lean` states the parts of this roadmap that are a few lines over the pinned carriers: the
completed pushout and the analytic locus (A0); strongly sheafy rings, finite étale Huber pairs,
finite étale and étale morphisms with their stability and comparison theorems, geometric points
(A1); polydiscs and tori over a Huber pair, dimension, smooth morphisms by ball charts (A2);
pseudocoherence, Kedlaya–Liu's acyclicity in its sheafy form and standard étale presentations (A3);
split rings, finite étale torsors, the torsor tower, the ring core of Lemma 15.3 and the orbit
description of `Spa` of a torsor (A4). The sites, Yoneda-adic spaces, the completed tower and the
perfectoid torsor presentation are stated here only. Each target is one paragraph: statement with
hypotheses, source locator, the discriminating Checks and, when there is one, its Lean carrier; a
target without a Lean note is stated in this README only. Each layer's subsections are in reading
order; a few targets rest on later subsections of their own layer.

## Layer A0: completed tensor products and the fibre products actually used

This layer is the comparison interface with the completed tensor product of complete Huber pairs (a
README target of AdicSpacesPartII layer R0, *completed-tensor-product*) and R0's fibre products.
Completed tensor products are taken only along adic maps (automatic over a Tate base), never
uniformised implicitly, and their sheafiness is a hypothesis, never inferred. Fibre products are
asserted only under the hypotheses of Huber's Proposition 1.2.2 as R0 states them. The layer adds
the analytic locus, carrying R0's constructions to analytic adic spaces with non-Tate charts.

### A0.1 the comparison interface: the pushout of complete Huber pairs

**The completed tensor product is the pushout of complete Huber pairs.**
(*supplier-contract-fibre-products*) For morphisms `f : (A, A⁺) → (B, B⁺)`, `g : (A, A⁺) → (C, C⁺)`
of complete Hausdorff Huber pairs with adic ring maps, the completed tensor product `D = B ⊗̂_A C`
of AdicSpacesPartII R0, with `inl(b) = b ⊗ 1`, `inr(c) = 1 ⊗ c`, is a pushout among complete
Hausdorff Huber pairs, cocone legs need not be adic ([H94] §3, proof of Prop. 3.7, p. 536); (i) `D`
completes `B ⊗_A C` for compatible pairs of definition, `inl`, `inr` are adic, and no choice matters
([H94] §3, proof of Lem. 3.9(i), p. 537; [Morel] §II.3.2, Prop. II.3.2.1, pp. 76–77); (ii) `D⁺` is
the closure of the integral closure of the image of `B⁺ ⊗_{A⁺} C⁺` ([KL I] §2.4, Def. 2.4.1, p. 38;
[PS] §6, proof of Prop. 6.18, p. 38); (iii) if `A`, `B`, `C`, `D` are sheafy, `Spa D` is
`Spa B ×_{Spa A} Spa C`, globalised under Huber's hypotheses ([H96] §1.2, Prop. 1.2.2 and proof,
pp. 47–49). Checks: for `L = ℚ_p(√p)`, the idempotent `(1, 0)` of `L ⊗̂_{ℚ_p} L = L × L` is in the
plus ring, not in the image of `O_L ⊗ O_L`; for the non-adic `ℤ_p → ℤ_p⟦X⟧` (`(p, X)`-adic), no
Huber topology on `ℤ_p⟦X⟧ ⊗_{ℤ_p} ℚ_p` makes both maps continuous with `ℤ_p⟦X⟧` open ([Morel]
§II.3.2, Ex. II.3.2.2, p. 77). Lean: `Huber.IsCompletedPushout`, `Huber.exists_isCompletedPushout`,
`AdicSpace.FibreProduct`; rest README.

**Morphisms into affinoids.** (*maps-into-affinoids*) For an adic space `X` (AdicSpaces layer 5) and
a sheafy complete Hausdorff Huber pair `(A, A⁺)`, `h ↦ h^♯` is a natural bijection from morphisms
`X → Spa(A, A⁺)` to continuous ring maps `A → O_X(X)` with `A⁺ → O_X⁺(X)` (rational localisation,
AdicSpaces layer 3, and gluing; [H94] §2, Prop. 2.1(ii), p. 522; [KL I] §8.2, Lem. 8.2.9, p. 160).
Check: `ℚ_p`-maps from `Spa(L, O_L)`, `L/ℚ_p` finite, to the closed disc are the `t ∈ O_L`.

### A0.2 uniformization, supplied separately

**The uniform completed tensor product is the pushout among uniform Tate pairs.**
(*uniformization-contract*) For `A` Tate and `f`, `g` as in A0.1, R0's uniform completed tensor
product (*uniform-completed-tensor-product*), with coprojections `ι ∘ inl`, `ι ∘ inr` for R0's
uniformisation `ι` (*uniformization*), is a pushout among complete Hausdorff pairs with uniform Tate
ring (not among all); `ι` is the adjunction unit, `Spa(ι)` a homeomorphism matching rational subsets
([KL I] §2.8, Def. 2.8.13, p. 63), and `ι` an isomorphism iff `B ⊗̂_A C` is uniform. Fibre products
use `B ⊗̂_A C`, as uniformisation can lose a topological splitting ([HK] §7, Rem. 7.2, p. 25).
Check: `ℂ_p ⊗̂_{ℚ_p} ℂ_p` is complete, separated and not uniform ([KL I] §2.8, Rem. 2.8.5, p. 60).

### A0.3 tracking rings of definition, pseudouniformisers and plus rings

**Definition data and plus rings through the completed tensor product.**
(*definition-data-and-plus-ring-tracking*) For `f`, `g`, `D` as in A0.1: (a) `D`, `inl`, `inr` are
independent of definition data and plus rings, and pseudouniformisers of `A`, `B`, `C` stay so in
`D`; (b) `D⁺` is the closure of the integral closure of the ring generated by `inl(B⁺) ∪ inr(C⁺)`,
so it is the same for all rings of integral elements of `A` mapping into `B⁺`, `C⁺`, even for
noncomplete Huber rings with adic maps ([Hüb] §9, proof of Thm. 9.2, p. 41; [H94] §3, proof of
Lem. 3.9(i), p. 537); (c) for rings of integral elements `B'⁺ ⊇ B⁺`, `C'⁺ ⊇ C⁺` with tensor plus
ring `D'⁺ ⊇ D⁺`, `Spa(D, D'⁺) = Spa(inl)⁻¹(Spa(B, B'⁺)) ∩ Spa(inr)⁻¹(Spa(C, C'⁺))` ([KL I] §2.4,
Def. 2.4.3 and (2.4.3.1), pp. 38–39), not an open immersion in general.

### A0.4 pullback along rational open immersions

**Pullback along a rational open immersion is restriction.** (*rational-pullback-comparison*) For a
morphism `φ : (A, A⁺) → (B, B⁺)` of complete Hausdorff Huber pairs with adic ring map, `T ⊆ A`
finite with `T·A` open and `s ∈ A`: `Spa(φ)⁻¹(R(T/s)) = R(φ(T)/φ(s))`, and `b ⊗ a ↦ b·φ(a)` is an
isomorphism `B ⊗̂_A A⟨T/s⟩ ≅ B⟨φ(T)/φ(s)⟩` of complete pairs over `(B, B⁺)`, with plus ring the
closure of the integral closure of `B⁺[φ(T)/φ(s)]` ([KL I] §2.4, Def. 2.4.12 and the paragraph after
it, p. 41), giving `Spa(B, B⁺) ×_{Spa(A, A⁺)} R(T/s)` for sheafy pairs. Adicness is needed: in
`Spa ℤ_p⟦X⟧` (`(p, X)`-adic) the preimage of `R(p/p)` is the open unit disc `⋃_n R((Xⁿ, p)/p)` over
`ℚ_p`, not quasi-compact (R0 *fibre-product-along-finite-type*; [Wedhorn] §7.5, Lem. 7.46(3), p. 68;
[Hüb] §9, Ex. 9.4, p. 43; [Berkeley] Lecture 4, examples of adic spaces, p. 28).

### A0.5 pullback along finite étale maps

**Pullback along a finite étale map is the uncompleted tensor product.**
(*finite-etale-pullback-comparison*) For a finite morphism `φ : (A, A⁺) → (B, B⁺)` of complete
Hausdorff Tate pairs, `A → B` étale, `B` in its natural topology, and `(A, A⁺) → (C, C⁺)`, `C`
complete Hausdorff Tate: `B ⊗_A C` in its `C`-module topology is complete Hausdorff ([KL I] §2.2,
Lem. 2.2.12(a), p. 32), equals `B ⊗̂_A C` and is finite étale over `C`, with rational preimages
`R(φ(f)/φ(g))`, rings `B ⊗_A A⟨f/g⟩`; if `B⁺` is the integral closure of `A⁺`, the plus ring is the
unclosed integral closure of `C⁺` and `C → B ⊗_A C` is a finite map of pairs. If `B ⊗_A C` is sheafy
(e.g. `C` strongly noetherian; not claimed in general, [KL I] §8.2, Rem. 8.2.18, p. 162), its `Spa`
is the fibre product ([KL I] §8.2, Def. 8.2.16, p. 162). Checks: finiteness and the plus condition
matter (`Σ pⁿTⁿSⁿ ∉ ℚ_p⟨T⟩ ⊗ ℚ_p⟨S⟩`; `(K, K⁺) → (K, K°)` is not finite); `√T` on `|T| = 1` exists
on `{|T − 1| ≤ |p|}` for odd `p`, for `p = 2` not on `{|T − 1| ≤ |2|}` but on `{|T − 1| ≤ |8|}`.

### A0.6 chart independence

**Every affinoid chart of the glued fibre product is the completed tensor product of the charts
below it.** (*fibre-product-affinoid-chart-comparison*) From R0: for adic `f : X → S`, `g : Y → S`
meeting R0's existence hypotheses, `Z = X ×_S Y` with projections `p`, `q`, and open affinoids
`W = Spa(A, A⁺) ⊆ S`, `U = Spa(C, C⁺) ⊆ f⁻¹(W)`, `V = Spa(B, B⁺) ⊆ g⁻¹(W)` of complete Hausdorff
pairs with `C ⊗̂_A B` sheafy, `p⁻¹(U) ∩ q⁻¹(V) = Spa(C ⊗̂_A B)`, independent of the gluing cover,
compatibly with rational `U' ⊆ U`, `V' ⊆ V`, `W' ⊆ W`, `f(U') ⊆ W' ⊇ g(V')`; so gluings of `Z` agree
canonically over the projections (for two discs, the factor swap moves `{|T| ≤ |p|, |S| = 1}`).

### A0.7 associativity, symmetry and unit

**Associativity, symmetry and unit isomorphisms, and their affinoid formulas.**
(*fibre-product-associativity-and-unit*) For `X, Y, Z → S` locally of finite type, all four covered
by affinoids with complete stably sheafy rings (e.g. locally noetherian), iterated fibre products
exist (R0; [H94] §3, Prop. 3.7, p. 535; not in general, [Berkeley] Lecture 4, examples of adic
spaces, p. 28), and associator, symmetry, unit are the unique isomorphisms over the projections,
hence coherent. On charts they are `Spa` of the inverse of `(c ⊗ b) ⊗ e ↦ c ⊗ (b ⊗ e)` (pasted
pushouts, [Morel] §II.3.2, Prop. II.3.2.1, pp. 76–77; needs only adic maps from `A`; transports plus
rings), of R0's commutativity, of `B ⊗̂_A A ≅ B`, `b ⊗ a ↦ ba`.

### A0.8 the analytic locus and restriction of morphisms

**The analytic locus of an adic space.** (*analytic-locus-restriction*) A point of an adic space `X`
is analytic if its support in any affinoid neighbourhood is not open, iff a neighbourhood `U` has a
topologically nilpotent unit in `O_X(U)` ([H94] §3, definition of analytic points, p. 532; [Wedhorn]
§8.3, Prop. and Def. 8.36, p. 85); they form an open subspace `X_a` ([Hüb] §6, Lem. 6.10, p. 30;
[Wedhorn] §8.3, Rem. 8.37(1), p. 86), equal to `X` iff `X` is analytic. (a) `U_a = X_a ∩ U` for open
`U` ([Wedhorn] §8.3, Rem. 8.37(2), p. 86). (b) On `Spa(A, A⁺)`, `A` complete, `X_a` is Tau Ceti's
analytic locus, a finite union of rational subsets with Tate rings, all of `X` for `A` Tate, empty
iff `A` is discrete, and over `Spa(ℤ_p, ℤ_p)` (adic structure map) the preimage of `Spa(ℚ_p, ℤ_p)`
([Hüb] §6, after Lem. 6.8, p. 29). (c) Maps into analytic spaces are adic. (d) `f : Y → X` is adic
iff `f(Y_a) ⊆ X_a`, and then restricts uniquely and functorially to `Y_a → X_a` ([Wedhorn] §8.4,
Prop. 8.39, p. 86). (e) A map from an analytic space factors (uniquely) through `X_a` iff it is
adic. (f) If `Y ×_X Z` exists and `g : Z → X` is adic, `(Y ×_X Z)_a = p⁻¹(Y_a)` for the projection
`p`. Check: the non-adic `Spa ℤ_p⟦T⟧ → Spa ℤ_p` (`(p, T)`-adic) maps the analytic `T`-adic point of
`𝔽_p((T))` to the closed point and, as `g`, breaks (f). Lean: `AdicSpace.analyticPoints`,
`AdicSpace.restrict`, `AdicSpace.ofRestrict`, `AdicSpace.analyticPoints_isOpen`,
`AdicSpace.isAnalytic_iff_analyticPoints`, `AdicSpace.analyticPoints_restrict`,
`AdicSpace.analyticPoints_spa`, `AdicSpace.isAdic_iff_mapsTo_analyticPoints`; rest README.

### Examples

- `K⟨T⟩ ⊗̂_K L = L⟨T⟩` (disc over `L`); `K⟨T^{1/p^∞}⟩ ⊗̂_K L = L⟨T^{1/p^∞}⟩` (perfectoid, P2).
- `ℚ_p⟨S⟩ ⊗̂_{ℚ_p⟨T⟩} ℚ_p⟨T⟩⟨(T, p)/p⟩ = ℚ_p⟨S, S²/p⟩` along `T ↦ S²`, `S ⊗ T + 1 ⊗ 1 ↦ S³ + 1`.
- `Spa(ℤ_p⟦T⟧)_a = R((p, T)/p) ∪ R((p, T)/T)` ([Hüb] §6, Ex. 6.12, p. 30); `Spa(A_inf)_a ⊋ 𝒴`.

### Dependencies

- AdicSpacesPartII R0: completed tensors, uniformisation, adic and finite maps, fibre products.
- AdicSpaces layers 0, 2, 3, 5: completion, analytic points, rational localisation, gluing.
- Boundary: PerfectoidSpaces P2, P3 and AdicSpacesPartIV R5 (perfectoid cases); A1 (non-sheafy).

## Layer A1: finite étale and étale geometry

This layer defines finite étale and étale morphisms of possibly non-noetherian analytic adic spaces
by the Kedlaya–Liu local description and builds the étale, finite étale and pro-étale sites,
geometric points, strict localisations, `π₁` and Kedlaya–Liu's general site. *Analytic*: every point
is analytic. A finite étale `B` over `(A, A⁺)` has its natural `A`-module topology and plus ring the
integral closure of `A⁺`, never `B°`. Results using fibre products of étale maps assume *locally
strongly sheafy* spaces. *Étale*: locally open immersion, finite étale, open immersion. Coverings
are jointly surjective on points of all ranks. Geometric points are `Spa(C, C⁺) → X`, `C` complete
algebraically closed, `C⁺` of any rank. It builds on layer A0, AdicSpacesPartII R0,
AdicSpacesPartIII R3 and AdicSpaces layers 2–5. AdicSpacesPartIV R4–R5, PerfectoidSpaces P3–P4,
layers A2 and A4, DiamondsAndVStacks D6 and the `p`-adic Hodge, étale-cohomology and `A_inf`
roadmaps consume it.

### A1.1 strongly sheafy rings

**Strongly sheafy rings.** (*strongly-sheafy-huber-pair*) A complete Hausdorff Tate ring `A` is
strongly sheafy if every `A⟨T₁, …, Tₙ⟩` (`n ≥ 0`, `Huber.restrictedMvPowerSeriesCompletion`) is
sheafy (`Huber.IsSheafyRing`) ([HK] §4, Def. 4.1, p. 11); an analytic adic space is locally strongly
sheafy if covered by open affinoids `Spa(A, A⁺)` with `A` strongly sheafy. From [HK] §4, Thm. 4.2,
Lem. 4.3, Cor. 4.5: such `A` is sheafy (`n = 0`); the class passes to `A⟨S₁, …, S_m⟩`, to rational
localisations ([HK] §4, Lem. 4.3(b), p. 11) and to finite étale algebras
(*finite-etale-strongly-sheafy*), descends along finite rational covers of a sheafy `A` ([HK] §4,
Cor. 4.5, p. 12, via [HK] §3, Prop. 3.10, p. 8; sheafiness of `A` stays, as [KL I] Thm. 1.2.22(b)
lacks a complete proof, [HK] §4, Rem. 4.6, p. 13), and contains the strongly noetherian, stably
sheafy (`Huber.IsStablySheafyRing`) and noetherian-ring-of-definition complete Tate rings. Open
affinoids of locally strongly sheafy spaces have strongly sheafy rings; open subspaces and locally
noetherian analytic spaces are locally strongly sheafy. Check: a uniform non-sheafy Tate ring
(Buzzard–Verberkmoes, Mihara) is not strongly sheafy ([HK] §1, p. 2). Lean:
`Huber.IsStronglySheafy`, `Huber.IsStronglySheafy.isSheafyRing`,
`Huber.IsStronglySheafy.restrictedMvPowerSeries`, `Huber.IsStronglySheafy.of_isStronglyNoetherian`,
`Huber.IsStronglySheafy.of_isStablySheafyRing`, `AdicSpace.IsLocallyStronglySheafy`,
`AdicSpace.IsLocallyNoetherianAnalytic`,
`AdicSpace.IsLocallyNoetherianAnalytic.isLocallyStronglySheafy`; rest README.

### A1.2 the Huber pair of a finite étale algebra

**The Huber pair of a finite étale algebra.** (*finite-etale-affinoid-algebra*) For a complete
Hausdorff Tate pair `(A, A⁺)` (no sheafiness or noetherian hypothesis) and `B` finite étale over
`A`, build `ι : (A, A⁺) → (B, B⁺)` ([KL I] §2.4, Rem. 2.4.2, p. 38; [PS] §7, Def. 7.1(i), p. 39):
(i) `B`, finite projective, has the natural `A`-module topology, subspace and quotient topology of
any `B ⊕ Q ≅ Aⁿ` ([KL I] §2.2, Lem. 2.2.12(a), p. 32), and is a complete Tate ring ([HK] §2,
Rem. 2.4, p. 4) with ring of definition `A₀[ϖᴺb₁, …, ϖᴺb_m]`, Hausdorff over a Hausdorff base; (ii)
`B⁺` is the integral closure of `ι(A⁺)`, never `B°`; (iii) `ι` is finite
(`Huber.Pair.Hom.IsFinite`), `Spa(ι)` has fibres of size `≤ rank_x(B)` and is surjective iff `B` is
faithfully flat; (iv) maps `(B, B⁺) → (D, D⁺)` under `(A, A⁺)` into complete pairs are exactly the
`A`-algebra maps `B → D`; (v) for `(A, A⁺) → (C, C⁺)` of complete Tate pairs, `C ⊗_A B` is already
the completed tensor product (AdicSpacesPartII R0, *completed-tensor-product*), with plus ring the
integral closure of `C⁺ ⊗ B⁺` ([PS] §7, proof of Lem. 7.3(ii), p. 40; R0's
*finite-algebra-tensor-complete*; A0's *finite-etale-pullback-comparison*), e.g.
`O(U) ⊗_A B ≅ B⟨ιf/ιg⟩` for `U = R(f/g)`; (vi) for `A` noetherian or with a noetherian ring of
definition it is R0's *finite-algebra-over-affinoid*, finite étale in Huber's sense ([H96] §1.6,
Example 1.6.6(ii); R0's *finite-etale-algebra-comparison*). Checks: `B = A` gives `(A, A⁺)`, not
`(A, A°)`; for `K⁺ ⊊ O_K` of rank 2, `K × K` with plus ring `B°` would miss the closed point; `A/J`,
`J` non-closed, is neither étale nor Hausdorff. Lean: `Huber.isTateRing_moduleTopology`,
`Huber.Pair.Hom.IsFiniteEtale`, `Huber.Pair.exists_isFiniteEtale`,
`Huber.Pair.Hom.IsFiniteEtale.isFinite`, `Huber.Pair.Hom.IsFiniteEtale.finite_fibre`,
`Huber.Pair.Hom.IsFiniteEtale.surjective_spaComap_iff`, `Huber.Pair.Hom.IsFiniteEtale.exists_hom`;
rest README.

**Finite étale algebras over strongly sheafy rings.** (*finite-etale-strongly-sheafy*) If `(A, A⁺)`
is a complete Tate pair with `A` strongly sheafy and `B ∈ FÉt(A)`, then `B` is strongly sheafy, so
`Spa(B, B⁺)` is an affinoid adic space: `B` is monogenic with unit discriminant over a finite
rational covering ([HK] §4, proof of Cor. 4.7, p. 13; [HK] §5, after Def. 5.7, p. 16), and finite
locally free locally monogenic extensions preserve strong sheafiness ([HK] §4, Cor. 4.7, p. 13).
Strong noetherianity and noetherian rings of definition pass to `B`. For `A` merely sheafy this is
unknown ([KL I] §8.2, Rem. 8.2.18, p. 162); stably uniform `A` gives uniform `B`, not known stably
uniform ([HK] §3, Def. 3.13, p. 9). Lean: `Huber.IsStronglySheafy.finiteEtale`; rest README.

**Rational descent of finite étale algebras.** (*finite-etale-rational-descent*) For a complete Tate
pair `(A, A⁺)` (no sheafiness) and a finite rational covering `{U_i}`, `B ↦ (B ⊗_A O(U_i))_i` is an
equivalence from `FÉt(A)` onto descent data with cocycle condition on triple overlaps, using
uncompleted tensor products, compatibly with plus rings ([KL I] §2.6, Thm. 2.6.9, p. 55; Kiehl
gluing at a noetherian stage, *affinoid-system-approximation*, *finite-etale-approximation*).

**Affinoid systems.** (*affinoid-system-approximation*) A complete Hausdorff Tate pair `(A, A⁺)`,
`A⁺` arbitrary, is the completed limit of a nonempty directed system of complete strongly noetherian
Tate pairs (dense images, plus rings exhausting `A⁺`, compatible rings of definition and
pseudouniformisers, congruences mod `ϖⁿ` detected at later stages), built from quotients of
`ℤ((z))⟨S₁, …, S_m⟩`, `z ↦ ϖ`, with the supremum of quotient and subspace norms ([KL I] §2.6,
Def. 2.6.1 and Lem. 2.6.2, p. 53); for bounded `A⁺` the stage rings of definition exhaust `A⁺` too.
(a) `Spa(A, A⁺) ≅ lim Spa(A_α, A_α⁺)`, and rational subsets, finite rational coverings and
localisations come from stages ([KL I] §2.6, Rem. 2.6.3, p. 53; Lem. 2.6.5(a) and Rem. 2.6.7, p. 54;
PerfectoidSpaces P5's *spa-of-filtered-colimit-of-tate-pairs*, *descent-of-quasicompact-opens*); (b)
base changes of `B_α ∈ FÉt(A_α)` have limit the pair of `B_α ⊗_{A_α} A`, whose `Spa` surjects onto
`Spa(B_α) ×_{Spa(A_α)} Spa(A)` ([H94], proof of Lem. 3.9(i), pp. 537–538; [KL I] Lem. 2.2.12(a),
p. 32). Check: stage rings of definition cannot exhaust the unbounded `A⁺ = A°` of `ℚ_p⟨T⟩[ε]/(ε²)`.

**Finite étale algebras at a finite stage.** (*finite-etale-approximation*) For an affinoid system
with completed limit `(A, A⁺)` and `A_∞ = colim A_α`, base change `2-colim FÉt(A_α)` → `FÉt(A_∞)` →
`FÉt(A)` gives rank-preserving tensor equivalences, also over rational localisations
(PerfectoidSpaces P3's *finite-etale-completed-direct-limit*; [KL I] §2.6, Prop. 2.6.8, p. 55; §1.2,
Rem. 1.2.9, p. 15); density alone does not give `A_∞ = A`, the exhaustive systems above do.

### A1.3 finite étale and étale morphisms

**Finite étale morphisms.** (*finite-etale-morphism*) A morphism `f : Y → X` of analytic adic spaces
is finite étale if `X` is covered by open affinoids `V = Spa(A, A⁺)`, `A` complete Tate ([H96] §1.1,
p. 39), with `f⁻¹(V) ≅ Spa(B, B⁺)` over `V`, `B ∈ FÉt(A)`, `B⁺` the integral closure of `A⁺`
([KL I] §8.2, Def. 8.2.16, p. 162; [PS] §7, Def. 7.1(ii), p. 39; [Berkeley] Lecture 7,
Def. 7.5.1(1), p. 55); `f` need not be surjective. Prove: `Spa` of a finite étale pair is finite
étale when both pairs are sheafy; target-locality; finiteness (R0) and étaleness (preadic:
*etale-site-generalized*). Checks: the ramified `T ↦ S²` on the disc is not finite étale, nor is
`Spa(K × K, O_K × O_K) → Spa(K, K⁺)` for `K⁺ ⊊ O_K`. Lean: `AdicSpace.IsFiniteEtale`; rest README.

**Local-to-global over strongly sheafy affinoids.** (*finite-etale-local-to-global*) For `f` finite
étale and an open affinoid `V = Spa(A, A⁺) ⊆ X` with `A` strongly sheafy: (a)
`B = O_Y(f⁻¹V) ∈ FÉt(A)` and `f⁻¹(V) ≅ Spa(B, B⁺)` ([ECD] §6, after Def. 6.2, p. 26; [PS] §7,
Prop. 7.6, p. 41); (b) on locally strongly sheafy `X`, `f` is finite étale iff preimages of all (or
one cover's) open affinoids are affinoid finite étale ([ECD] §6, Def. 6.2(i), p. 26); (c) finite
étale `V`-spaces form `FÉt(A)^op` ([KL I] §8.2, Lem. 8.2.17(a), p. 162); (d) the degree is locally
constant, and `f` is surjective iff it is `≥ 1` iff `B` is faithfully flat; (e) `f` is finite.
Proof: rational descent and *finite-etale-strongly-sheafy* ([KL I] §8.2, proof of Lem. 8.2.17,
p. 162); strongly noetherian (c), (e): R0's *finite-etale-algebra-comparison*.

**Étale morphisms.** (*etale-morphism*) A morphism `f : Y → X` of analytic adic spaces (no
noetherian, sheafiness or separatedness hypothesis) is étale if each `y ∈ Y` has an open `U` with
`f|_U` an open immersion, then finite étale, then an open immersion ([KL I] §8.2, Def. 8.2.16,
p. 162; [PS] §7, Def. 7.1(iii), p. 39; [ECD] §6, Def. 6.2(ii), p. 26, whose "`y ∈ Y`" means
`y ∈ V`); equivalently locally `Spa(C, C⁺) ⊆ Spa(B, B⁺) → Spa(A, A⁺) ⊆ X`, `A → B` finite étale,
`B → C` rational ([ECD] §15, proof of Lem. 15.6, p. 91; [PH] §5, Lem. 5.2, p. 28). It is local on
source and target and holds for open immersions and finite étale maps; on locally noetherian spaces
it is Huber's `AdicSpace.Etale` (A1.4). Check: `T = 0` in the disc is finite unramified, not étale.
Lean: `AdicSpace.IsEtaleLocalDescription`, `AdicSpace.IsEtaleLocalDescription.of_isOpenImmersion`,
`AdicSpace.IsEtaleLocalDescription.of_isFiniteEtale`; rest README.

### A1.4 comparison with Huber's definitions

**Comparison with Huber.** (*etale-morphisms-local-description-and-comparison*) For `X` locally
noetherian analytic and `f : Y → X`: (i) `f` is finite étale iff finite and Huber-étale (locally of
finite presentation, bijective lifting along square-zero thickenings of affinoids, [H96] §1.6,
Def. 1.6.5, p. 78; [H96] §1.6, Example 1.6.6(ii), via R0); (ii) `f` is étale iff Huber-étale, by
Huber's Lemma 2.2.8 via R0's *etale-local-open-finite-etale-factorisation* and conversely R0's
*open-embedding-etale*, *finite-etale-algebra-comparison*, *etale-smooth-composition*,
*etale-smooth-locality* ([dJvP] §3.1, Prop. 3.1.4 over a field; [PS] §7, after Def. 7.1, p. 39;
[Berkeley] Lecture 7, after Def. 7.5.1, p. 55; [KL I] §8.2, before Def. 8.2.16, p. 162); (iii)
`Et/X` with its coverings ([H96] §2.1, p. 109) is Huber's site, with his presentations, flatness,
openness, local quasi-finiteness; (iv) étale `Y` is locally noetherian. Lemma 2.2.8 (gap noted in
R0) enters only via R0; no non-analytic claim. Lean: `AdicSpace.IsEtaleLocalDescription.iff_etale`,
`AdicSpace.IsFiniteEtale.iff_isFinite_and_etale`; rest README.

### A1.5 stability properties

**Base change.** (*etale-base-change*) In A1.5, `X` is locally strongly sheafy. For `f : Y → X`
finite étale (resp. étale) and `g : X' → X` with `X'` locally strongly sheafy, `Y ×_X X'` exists, is
locally strongly sheafy and finite étale (resp. étale) over `X'` ([KL I] §8.2, after Def. 8.2.16,
p. 162; noetherian case R0's *smooth-etale-base-change*, *fibre-product-points*), affinoid-locally
the pair of the uncompleted `C ⊗_A B` ([PS] §7, Lem. 7.3(ii), p. 40; A0's
*finite-etale-pullback-comparison*, *rational-pullback-comparison*); it is surjective on points
([PS] §7, Lem. 7.3(i), p. 40, indices permuted; [H96] §1.2, Cor. 1.2.3, p. 49), so coverings pull
back. For arbitrary analytic `X'` the same holds when each `C ⊗_A B` met is sheafy; otherwise fibre
products are only formed among Yoneda-adic spaces (*etale-site-generalized*; [KL I] §8.2,
Rem. 8.2.5, p. 160). Lean: `AdicSpace.IsEtaleLocalDescription.exists_fibreProduct`,
`AdicSpace.IsEtaleLocalDescription.baseChange`, `AdicSpace.IsFiniteEtale.baseChange`; rest README.

**Composition.** (*etale-composition*) Finite étale maps compose (plus ring the integral closure of
`A⁺`), étale maps compose, and spaces étale over `X` are locally strongly sheafy. Locally, finite
étale over rational over finite étale over a strongly sheafy `A` is near each point rational over
finite étale over a rational localisation of `A` ([KL I] §8.2, Lem. 8.2.17(c), p. 162), proved at a
noetherian stage via R0's *etale-smooth-composition* ([KL I] §8.2, proof of Lem. 8.2.17, p. 162;
[Berkeley] Lecture 7, Prop. 7.5.2(1), p. 55; [PS] §7, proof of Cor. 7.8, p. 42). Lean:
`AdicSpace.IsEtaleLocalDescription.comp`, `AdicSpace.IsFiniteEtale.comp`; rest README.

**Diagonal.** (*etale-diagonal*) For `f` étale, `Δ_f : Y → Y ×_X Y` is an open immersion, open and
closed if `f` is finite étale, cut out by the diagonal idempotent of `B ⊗_A B` ([KL I] §1.2,
Def. 1.2.2, p. 13; [KL I] §2.6, Prop. 2.6.4, p. 54; [dJvP] §3.2, proof of Prop. 3.2.2, p. 24;
noetherian case R0's *infinitesimal-criteria*, *diagonal-locally-closed*). So étale `X`-spaces have
open equalisers, clopen in the finite étale case ([ECD] §14, proof of Prop. 14.3, p. 82), and
sections are open (clopen) immersions; for two discs glued along `{|p| ≤ |T|}` it is not closed.

**Cancellation.** (*etale-cancellation*) If `Y → X` and `Z → X` are étale (resp. finite étale),
every `X`-morphism `Y → Z` is étale (resp. finite étale) ([dJvP] §3.2, p. 23; [Berkeley] Lecture 7,
Prop. 7.5.2(3), p. 55; [ECD] §6, after Def. 6.2, p. 26; R0's *etale-smooth-cancellation*). Check:
squaring the disc over the disc is not étale, its source not being étale over the base. Lean:
`AdicSpace.IsEtaleLocalDescription.of_comp`; rest README.

**Openness.** (*etale-open-map*) Étale maps are open (via R0's *smooth-morphism-open*, Huber 1.7.8;
[PS] §7, proof of Cor. 7.8, p. 42; [ECD] §1, p. 3); for quasi-compact `Y`, `f(Y)` is quasi-compact
open and `f` factors uniquely through a surjective étale map onto it ([KL I] §8.2, Lem. 8.2.17(b),
p. 162), a finite union of rational subsets if `X` is affinoid ([dJvP] §3.1, Prop. 3.1.7(1), p. 21);
étale families cover iff their images do, finitely many quasi-compact pieces sufficing over
quasi-compact `X`. Lean: `AdicSpace.IsEtaleLocalDescription.isOpenMap`; rest README.

### A1.6 the étale and finite étale sites

**The small étale site.** (*etale-site*) For `X` locally strongly sheafy analytic, `X_ét` has the
adic spaces étale over `X`, all `X`-morphisms and jointly surjective coverings, higher-rank points
included ([H96] §2.1, p. 109; [KL I] §8.2, Def. 8.2.19 and the paragraph after it, pp. 162–163;
[Berkeley] Lecture 7, Def. 7.5.1(3), p. 55; [PS] §7, Def. 7.11, p. 43). Prove: finite limits, a
pretopology, `λ_X : X_ét → X_an`, and for `g : X' → X` a morphism `X'_ét → X_ét` ([dJvP] §3.2,
p. 23) with `(g_*F)(U) = F(U ×_X X')`, left adjoint `g^{-1}` and coherent `(h ∘ g)^* ≅ g^* h^*`
(AdicSpacesPartIV R4's *etale-site-functoriality*); it is Huber's site on locally noetherian `X` and
Scholze's on perfectoid `X` (general `X`: *etale-site-generalized*). Check: for `K⁺` of rank 2 the
open generic point `{η} ⊆ Spa(K, K⁺)` contains all rank-one points but does not cover.

**The small finite étale site.** (*finite-etale-site*) `X_fét` has the spaces finite étale over `X`,
all `X`-morphisms and jointly surjective coverings ([KL I] §8.2, Def. 8.2.19 and the paragraph after
it, pp. 162–163; [PH] §3, before Def. 3.3, p. 13). Prove: finite limits (clopen equalisers), finite
coproducts and `∅`; for `X = Spa(A, A⁺)`, `X_fét ≃ FÉt(A)^op` ([KL I] §8.2, Lem. 8.2.17(a), p. 162;
[ECD] §6, after Def. 6.2, p. 26), a finite family covering iff `∏ B_i` is faithfully flat;
`X_fét → X_ét` is fully faithful, continuous and preserves finite limits; base change; fibre
functors at geometric points; for connected nonempty `X`, a Galois category
(*finite-etale-galois-category*). For `Spa(K, K⁺)` it is finite continuous `Gal(K^sep/K)`-sets.

**Structure sheaves.** (*etale-structure-sheaf*) `O_{X_ét} : U ↦ O_U(U)` and `O⁺_{X_ét}` are sheaves
(of complete topological rings, resp. rings) with `λ_{X,*}O_{X_ét} = O_X` and
`λ_{X,*}O⁺_{X_ét} = O⁺_X`; for surjective finite étale `Spa(B, B⁺) → Spa(A, A⁺)`, `A → B ⇉ B ⊗_A B`
is an equaliser of topological rings ([KL I] §8.2, Thm. 8.2.22(a), p. 165; [HK] §5, proof of
Prop. 5.5, p. 15; [dJvP] §3.2, Prop. 3.2.2, p. 23). Special cases: AdicSpacesPartIV R5's
*stable-basis-etale-vector-bundles*, PerfectoidSpaces P3's *etale-almost-acyclicity*; higher
cohomology ([KL I] Thm. 8.2.22; [HK] §5, Prop. 5.8, p. 16): AdicSpacesPartIII R3.

**The affinoid étale basis.** (*basis-comparison*) An object is basic if affinoid and reached from
an open affinoid `V ⊆ X` by rational inclusions and finite étale `Spa`s ([HK] §5, proof of
Prop. 5.5, p. 15). (a) objects have open basic coverings; (b) basic objects have strongly sheafy
rings and are stable under finite étale maps, rational embeddings and fibre products over `V`, and
for basic `U`, `U'` over a quasi-separated étale `W`, `U ×_W U'` has a finite basic covering
(quasi-separated `X` does not suffice: closed discs `V`, `V'` glued along `{|T| < 1}` give `W` étale
over one disc with `V ×_W V'` not quasi-compact); a stable basis ([KL I] §8.2, Def. 8.2.19 and the
paragraph after it, pp. 162–163); (c) they form a dense subsite (`Functor.IsDenseSubsite`), so
sheaves of sets, groups, modules, rings agree; sousperfectoid case: AdicSpacesPartIV R5's
*sousperfectoid-stably-adic*; noetherian cases: [PH] §5, Lem. 5.2, p. 28; [ECD] §6, proof of
Prop. 6.4, pp. 27–28.

**Covering reduction and sheaf criterion.** (*etale-covering-reduction*) A property of finite
coverings among basic objects that passes from refinements, is stable under composition and holds
for rational coverings and surjective finite étale maps holds for all of them ([KL I] §8.2,
Prop. 8.2.20 and its proof, p. 163, after [dJvP] §3.2, Prop. 3.2.2, p. 23; AdicSpacesPartIV R5's
*stable-basis-covering-reduction*). So a presheaf of sets or groups on `X_ét` is a sheaf iff it is a
Zariski sheaf on each object with descent along surjective finite étale maps of basic objects.

**The slice site.** (*slice-site*) For `u : U → X` in `X_ét`, `U_ét ≃ X_ét/U` as sites ([dJvP] §3.2,
p. 23; [H96] §2.1, p. 109; [PH] §3, Prop. 3.15, p. 19; AdicSpacesPartIV R4's *etale-slice-site*),
with `(u^{-1}F)(V) = F(V → X)` and `u_*G(W) = G(W ×_X U)`; likewise `U_fét ≃ X_fét/U` for finite
étale `u` and `U_an ≃ X_an/U` for open `U`. No cohomology is defined on these sites.

### A1.7 geometric points, enough points, strict localisations

**Étale maps to `Spa(C, C⁺)` split near the closed point.** (*geometric-point-etale-split*) Let `C`
be algebraically closed, complete for a nontrivial nonarchimedean absolute value, `C⁺` an open
bounded valuation subring (`C°° ⊆ C⁺ ⊆ O_C`, any rank) and `S = Spa(C, C⁺)`. (i) `|S|` is the chain
of valuation rings between `C⁺` and `O_C`; its closed point `s` is a specialisation of every point
and has `S` as its only open neighbourhood ([ECD] §7, proof of Lem. 7.5, p. 31); `S` is
quasi-compact and connected and `(C, C⁺)` is strongly sheafy. (ii) Finite étale `S' → S` are finite
disjoint unions of copies of `S` (`Cⁿ` with `(C⁺)ⁿ`). (iii) An étale `g : V → S` has through each
`v` over `s` a section that is an open immersion ([ECD] §7, proof of Prop. 7.16, p. 36), so global
sections on `S_ét` define a point ([ECD] §14, proof of Prop. 14.3, p. 82). (iv) For `C⁺ ≠ O_C`, two
copies of `S` glued along `S ∖ {s}` are étale over `S` with two sections but not a disjoint union of
opens of copies of `S`. (v) For complete nonarchimedean `K` with a nontrivial finite separable
`L/K`, `K⁺` open bounded and `L⁺` the integral closure of `K⁺`, `Spa(L, L⁺) → Spa(K, K⁺)` is a
nonsplit finite étale cover ([ECD] §7, proof of Prop. 7.16, p. 36). Check: `C⁺ = C` is open but
unbounded and `Spa(C, C) = ∅` (a valuation `≤ 1` on `C` has `v(ϖ) = 1`, so is not continuous).

**Geometric points and their fibre functors.** (*etale-site-and-geometric-points*) Let `X` be
locally strongly sheafy analytic with étale site `X_ét` (*etale-site*; Huber's `X_et` if locally
noetherian, [H96] §2.1, p. 109). A geometric point is `ξ : Spa(C, C⁺) → X`, `(C, C⁺)` as in
*geometric-point-etale-split* ([H96] §2.5, Definitions 2.5.1 and 2.5.11, pp. 130, 134; perfectoid
version [ECD] §14, Proposition 14.3, p. 82, higher rank kept in §19, p. 109); its support is
`x = ξ(s)`. Every `x` is a support (`C` the completed algebraic closure of the completed residue
field `k(x)^`, `C⁺ ∩ k(x)^ = k(x)^+`). The fibre functor `ε_ξ : U ↦ Hom_X(Spa(C, C⁺), U)` is a point
of `X_ét` with stalk `F_ξ = colim F(U)`; for `g : X' → X`, `g ∘ ξ'` is a geometric point,
`ε_{g∘ξ'} ≅ g^* ⋙ ε_{ξ'}` and `(g^{-1}F)_{ξ'} ≅ F_{g∘ξ'}`; the image of `ξ` consists of
generisations of `x` ([PH] §3, footnote to Prop. 3.13, p. 18). Rank-one points do not suffice (rigid
analogue [dJvP] §3.3, p. 27, insufficient by [dJvP] §3.3, p. 29): on `Spa(K, K⁺)` with `K⁺` of rank
2 and `j : {η} → X` the generic point, `coker(j_!ℤ → ℤ) ≠ 0` has zero stalk at every
`Spa(C, O_C) → X`. Lean: `AdicSpace.GeometricPoint`, `AdicSpace.exists_geometricPoint`; rest README.

**The étale site has enough points.** (*etale-enough-points*) For `X` locally strongly sheafy
analytic and any geometric points `ξ_x` with support `x`, `(ε_{ξ_x})_{x ∈ X}` is a conservative
family ([ECD] §14, proof of Prop. 14.3, p. 82; coverings are surjective families, [H96] §2.1,
p. 109): morphisms of sheaves of sets, abelian groups or modules are isomorphisms, monos or epis iff
they are so on all stalks, and sections vanish iff all geometric germs do. Rank-one points do not
suffice ([dJvP] §3.3, p. 29); the classification of all topos points ([H96] Ch. 2) is not claimed.
For locally noetherian `X` this is Huber's conservativity ([H96] Ch. 2, introduction, p. 108).

**The strict localisation at a geometric point.** (*strict-localisation*) For `X` locally strongly
sheafy analytic and a geometric point `ξ` (`C⁺` of any rank), the étale neighbourhoods `(U, ū)` form
a cofiltered essentially small category `N(ξ)` ([dJvP] §3.3, p. 28), and `X(ξ) = lim_{N(ξ)} U` with
its lift of `ξ` is the initial pro-étale object with a lift of the geometric point ([FS] §IV.2.1,
p. 114). Define `F(X(ξ)) := colim F(U)`, `O_{X_ét, ξ} := colim O_{U, ū(s)}` ([KL I] §2.4,
Lem. 2.4.17(a), p. 43; [H96] 2.5.3–2.5.4, p. 131) and `O⁺_{X_ét, ξ}` (*etale-structure-sheaf*) with
the map to `C` and valuation `v_ξ` given by the lifts, and `|X(ξ)| = lim |U|` ([H96] §2.5,
2.5.9–2.5.13, pp. 132–135); opens around `ū(s)` in neighbourhoods are cofinal ([H96] 2.5.9, p. 132,
proof of 2.5.10, p. 134), and `g : X' → X` induces `X'(ξ') → X(g ∘ ξ')` and
`O_{X_ét, gξ'} → O_{X'_ét, ξ'}`. Check: for `ξ = id` on `Spa(C, C⁺)`, `X(ξ) = X`.

**Strict localisations of analytic adic spaces.** (*strict-localisation-analytic*) Let `X` be
locally noetherian analytic and `ξ` a geometric point with support `x` (`C⁺` of any rank). (a)
`O_{X_ét, ξ}` is strictly henselian, a filtered colimit along local maps of the henselian
`O_{U, ū(s)}` ([KL I] §2.4, Lem. 2.4.17(a), p. 43; [KL I] §1.2, Thm. 1.2.8, p. 15), and the closure
`C_ξ ⊆ C` of its separably closed residue field is algebraically closed and complete ([dJvP] §3.3,
p. 27). (b) With `C_ξ⁺ := C⁺ ∩ C_ξ`, `|Spa(C, C⁺)| → |X(ξ)|` factors through a homeomorphism
`|Spa(C_ξ, C_ξ⁺)| ≅ |X(ξ)|` ([H96] §2.5, Prop. 2.5.13(i), pp. 134–135, Lem. 2.5.12, p. 134; [FS]
§IV.2.1, p. 114; [dJvP] §3.3, p. 28), so `F_ξ` depends only on `x` and `C_ξ⁺`, `ξ` factors through
`Spa(C_ξ, C_ξ⁺)`, and `|X(ξ)|` is the chain of generisations of `x` (`rank(x)` points if finite).
(c) For `X = Spa(K, K⁺)`, `O_{X_ét, ξ} = K^sep ⊆ C`, `X(ξ) = Spa((K^sep)^, C⁺ ∩ (K^sep)^)`, and the
stalk is `colim F(Spa(L, L⁺))` over finite separable `L ⊆ K^sep` with its `Gal(K^sep/K)`-action.
Check: for the rank-2 specialisation `x` of the Gauss point `η` of the disc over `ℚ_p`,
`|X(ξ)| = {η, x}`, though `k(x)^+` is not henselian.

### A1.8 the finite étale fundamental group

**The finite étale site of a connected space is a Galois category.**
(*finite-etale-galois-category*) For `X` nonempty, connected, locally strongly sheafy analytic and a
geometric point `ξ`, `F_ξ : Y ↦ Hom_X(Spa(C, C⁺), Y)` (*geometric-point-etale-split* (ii)) is a
fibre functor `X_fét → FintypeCat` and `X_fét` is a Galois category (clopens of affinoids come from
idempotents, [KL I] §2.6, Prop. 2.6.4, p. 54); so `π₁(X, ξ) := Aut(F_ξ)` is profinite, `X_fét` is
equivalent to finite continuous `π₁`-sets, and `π₁` depends on `ξ` up to inner automorphism ([PH]
§3, before Def. 3.4, p. 13, for connected locally noetherian `X`, connectedness at [PH] §3, p. 13;
[Berkeley] Lecture 16, §16.3, p. 143, for diamonds). For `X = Spa(K, K⁺)`, `K` complete
nonarchimedean, `π₁ ≅ Gal(K^sep/K)` for every open bounded `K⁺`. Check: the closed disc over `ℂ_p`
has nontrivial `π₁` (`Sᵖ = 1 + pT` is a connected finite étale cover, the binomial series diverging
on `|T| = 1`).

### A1.9 the Kedlaya–Liu site of an arbitrary analytic adic space

**The Kedlaya–Liu étale and finite étale sites.** (*etale-site-generalized*) Let `X` be analytic,
not necessarily locally strongly sheafy, so finite étale covers of affinoids are not known to be
adic spaces ([KL I] §8.2, Def. 8.2.3, p. 159, Rem. 8.2.18, p. 162). Regard `X` as an analytic
Yoneda-adic space (*generalized-adic-presentation*), define étale and finite étale maps by the local
descriptions of *etale-morphism*, *finite-etale-morphism* with `Spa^Y` for `Spa` ([KL I] §8.2,
Def. 8.2.16, p. 162), and the sites `X_ét^Y`, `X_fét^Y` with jointly surjective coverings ([KL I]
§8.2, Def. 8.2.19 and after, pp. 162–163). Prove: (i) fibre products, base change, composition,
pretopologies ([KL I] §8.2, Rem. 8.2.5, p. 160; Lem. 8.2.17(c), p. 162); (ii)
`FÉt(A)^op ≃ Spa^Y(A, A⁺)_fét^Y` for every complete Tate pair, sheafy or not ([KL I] §8.2,
Lem. 8.2.17(a), p. 162); (iii) for locally strongly sheafy `X` every object is an adic space,
`X_ét^Y ≃ X_ét` and `X_fét^Y ≃ X_fét`; (iv) geometric points form a conservative family of points;
(v) this is `Y_ét` of [ECD] §15, Lem. 15.6, p. 91, for analytic `Y` over `ℤ_p` (generality of [ECD]
§15, after Def. 15.5, p. 91), the right side of `Y^◇_ét ≅ Y_ét` in DiamondsAndVStacks layer D6.
Check: for sheafy `A` not known strongly sheafy and `B ∈ FÉt(A)`, `Spa^Y(B, B⁺)` is an object though
`Spa(B, B⁺)` is not known to be adic, and adic objects are not known to be closed under fibre
products ([KL I] §8.2, Rem. 8.2.5, p. 160).

### A1.10 pro-étale morphisms and the underlying space

Throughout A1.10–A1.15, `X` is locally noetherian analytic (locally `Spa(A, A⁺)`, `A` complete
strongly noetherian Tate; *pro-etale-finite-limits* needs this, [PH] §3, before Def. 3.3, p. 13);
derived comparisons (Lemma 3.16 for `i > 0`, Corollary 3.17, Proposition 3.7(iii)) go to the
étale-cohomology roadmaps; `X`-maps between étale `X`-spaces are étale (*etale-cancellation*).
`pro-X_ét` is the pro-category of DiamondsAndVStacks layer D0 (small cofiltered indices),
`Hom(lim_i U_i, lim_j V_j) = lim_j colim_i Hom_X(U_i, V_j)`, `|U| := lim_i |U_i|`;
`c : X_ét → pro-X_ét` is fully faithful, `X` final, and *surjective* means on `|·|`. Disjoint unions
are covered by their summands, transfinite steps are pulled back from `X_ét`, and the
field-extension slice theorem is for spaces of finite type over the base field.

**Étale, finite étale and pro-étale morphisms of pro-objects.** (*pro-etale-morphism*) Cofiltered
limits exist and `|·|` is a functor ([PH] §3, Def. 3.1 and Prop. 3.2, p. 13; before Def. 3.9,
p. 15). `f : U → V` is *étale* (*finite étale*) if `U ≅ U_0 ×_{V_0} V` for some `V → V_0` and an
étale (finite étale) `U_0 → V_0` of `X_ét`; *pro-étale* if `U ≅ lim_{k∈K} U_k` over `V`, `K` small
cofiltered, all `U_k → V` étale and transitions finite étale surjective for `k ≥ k' ≥ k_0` ([PH] §3,
Def. 3.9, p. 15). Prove `Hom(lim_i U_i, c V) ≃ colim_i Hom_X(U_i, V)` ([PH] §3, Prop. 3.2, p. 13;
*pro-category-of-finite-t0-spaces*), étale ⇒ pro-étale, and `c(g)` étale, finite étale iff `g` is.
Check: the Kummer tower `X̃ = lim Spa(K⟨T^{±1/pⁿ}⟩, K°⟨T^{±1/pⁿ}⟩)` (`char K = 0`) is pro-étale but
not étale: over `T = 1` its fibre is `ℤ_p` if `K ⊇ μ_{p^∞}`, while quasi-compact étale maps have
finite fibres.

**Scholze's Lemma 3.10 (i)–(iv).** (*pro-etale-base-change*) For `U → V` étale (finite étale,
pro-étale) and any `W → V`, `U ×_V W` exists, `U ×_V W → W` is of the same class,
`|U ×_V W| → |U| ×_{|V|} |W|` is surjective with nonempty compact fibres, and fibre products commute
with cofiltered limits ([PH] §3, Lem. 3.10(i) and its proof, pp. 15–16).
(*pro-etale-etale-composition*) Composites of étale (finite étale) maps are étale (finite étale),
pulled back from `X_ét` at a stage of the target ([PH] §3, Lem. 3.10(ii), p. 15).
(*pro-etale-quasicompact-opens*) For `U ∈ pro-X_ét` and a quasi-compact open `W ⊂ |U|`, an étale
`V → U` pulled back from an open of a stage maps `|V|` homeomorphically onto `W`; if `U ∈ X_proét`,
then `V ∈ X_proét`, `V → U` is a monomorphism and `V' → U` factors uniquely through `V` iff `|V'|`
lands in `W`, compatibly with finite intersections ([PH] §3, Lem. 3.10(iii), p. 15).
(*pro-etale-maps-open*) Pro-étale maps, hence étale maps and (by *finite-etale-tower-is-pro-etale*)
towers, are open on `|·|`, by reduction to *etale-open-map* (Huber's Prop. 1.7.8, AdicSpacesPartII
layer R0) ([PH] §3, Lem. 3.10(iv) and its proof, pp. 15–16).

**Scholze's Lemma 3.10 (v)–(vii).** (*pro-etale-surjective-etale-descent*) For `V ∈ X_proét`, a
surjective étale (finite étale) `U → V` is pulled back from a surjective étale (finite étale) map of
`X_ét` to a stage of a pro-étale presentation of `V` ([PH] §3, Lem. 3.10(v), p. 15).
(*pro-etale-composition*) If `U → V → W` are pro-étale and `W ∈ X_proét`, then `U, V ∈ X_proét` and
`U → W` is pro-étale; every pro-étale map is a cofiltered limit of finite étale surjections followed
by an étale map ([PH] §3, Lem. 3.10(vi) and its proof, pp. 16–17). (*pro-etale-finite-limits*)
`X_proét` has finite limits, computed in `pro-X_ét`; for pro-étale `U → X` and an intersection
`V ⊂ |U|` of clopens, `V = lim V_i` is pro-étale over `X`, the nonformal input being
*etale-locally-finitely-many-components* ([PH] §3, Lem. 3.10(vii) and its proof, pp. 16–17; after
Lem. 3.10, p. 17).

**Étale spaces have locally finitely many components.** (*etale-locally-finitely-many-components*)
Points of `Y ∈ X_ét` have affinoid neighbourhoods `Spa(B, B⁺)` with `B` complete strongly noetherian
Tate, hence sheafy (AdicSpaces layer 4). For every complete Hausdorff Tate pair `(A, A⁺)`, the
clopens of `Spa(A, A⁺)` are the loci `{v : v(e) ≠ 0}` of idempotents `e ∈ A` ([KL I] §2.6,
Prop. 2.6.4, p. 54, adic Banach rings; [KL I] §2.5, Cor. 2.5.21, p. 52, affinoid algebras); for
strongly noetherian `A` there are finitely many connected components, each cut out by a primitive
idempotent. So quasi-compact `Y ∈ X_ét` are finite disjoint unions of connected clopens and étale
objects are locally connected ([PH] §3, before Def. 3.3, p. 13; after Lem. 3.10, p. 17). Check: for
`A = C(K, ℚ_p)`, `K` the Cantor set, `Spa(A, A°)` has infinitely many components.

### A1.11 the corrected covering condition

**Finite-étale towers.** (*finite-etale-tower*) The erratum restricts the coverings, not the
category ([PH erratum] item (1), p. 1). A finite-étale tower of ordinal length `λ` over
`W ∈ pro-X_ét` is a functor `μ ↦ U_μ` on `{μ < λ}ᵒᵖ` over `W`, `U_0 = W`, with each
`U_μ → lim_{μ'<μ} U_{μ'}` (`W` for `μ = 0`) the pullback of a finite étale surjection of `X_ét`; a
tower is a morphism isomorphic over `W` to `lim_{μ<λ} U_μ → W`. Steps occur at limit ordinals too
(transfinite compositions); steps from `X_ét`, not only `X_fét`, keep the countable case unchanged
([PH erratum] item (1), p. 1). Length `1` gives isomorphisms, length `2` finite étale surjections;
towers are surjective and stable under concatenation and base change. Checks: the Kummer tower has
length `ω`; for a nonempty open `V ⊊ X`, `c(V) → X` is étale but not a tower; over `Spa(C, O_C)`
(`C` algebraically closed, `O_C` of rank one) an open surjection `S → S'` of profinite sets without
continuous section ([RZ], Example 5.6.9, cited in [PH erratum] item (1)) gives `S × X → S' × X`,
pro-étale surjective but not a tower.

**Towers are pro-étale.** (*finite-etale-tower-is-pro-etale*) A tower `t : U → W` of length `λ` is
pro-étale, `U ≅ lim_F V_F` over the directed finite subsets `F ⊂ λ` closed under a dependency
function (finite by König's lemma), all `V_F → W` and transitions finite étale surjective, so
`U ∈ X_proét` if `W` is, and `|t|` is surjective with nonempty compact fibres; conversely a
countably indexed pro-étale presentation `lim U_i → V` has a stage `i_0` with `U → U_{i_0}` a tower
of length `ω` and `U_{i_0} → V` étale ([PH erratum] item (1), p. 1; [PH] §3, proof of Lem. 3.10(vi),
p. 17; proof of Lem. 3.10(i), p. 16).

**Transfinite towers of profinite sets split.** (*transfinite-tower-splitting*) If a continuous
`f : S → S'` of profinite sets is `S = lim_{μ<λ} S_μ → S_0 = S'`, `λ` any ordinal, with each
`S_μ → lim_{μ'<μ} S_{μ'}` pulled back from a surjection of finite sets, then `f` has a continuous
section; so over `Spa(C, O_C)` (`C` algebraically closed, rank one) towers between quasi-compact
objects split on spaces. The printed Prop. 3.7(i), that open continuous surjections of profinite
sets split, is false and unused ([PH erratum] item (1), p. 1, with the counterexample of [RZ],
*Profinite groups*, 2nd ed., Example 5.6.9; [PH] §3, Prop. 3.7(i), p. 14).

**Profinite groups are towers.** (*profinite-group-tower*) For profinite `G`, not necessarily
countably based: (a) there are an ordinal `λ` and decreasing closed normal `N_μ`, `N_0 = G`,
`⋂ N_μ = 1`, with `(⋂_{μ'<μ} N_{μ'})/N_μ` finite; (b) for closed `A ⊂ B` of finite index,
`G/A → G/B` is the pullback of `G/AN → G/BN` for an open normal `N` with `B ∩ N ⊂ A`; (c) for closed
`H ⊆ K`, `G/H → G/K` is a `G`-tower (stages `G/H(K ∩ N_μ)`), so `G → G/G'` and `G → pt` are
coverings of the profinite `G`-set site (*profinite-g-sets-site*) ([PH erratum] item (1), p. 1). The
continuous sections of `G → G/G'` are already in Tau Ceti (ProfiniteCohomology layer 0). Check:
`∏_{i∈I} ℤ/2`, `I` uncountable, is a tower of cardinal-indexed length.

**Étale over a tower is a tower followed by étale.** (*etale-over-tower-swap*) For a tower
`t : U → W` and an étale `e : A → U`, `t ∘ e = e' ∘ t'` with `t'` a tower and `e'` étale
(transfinite induction); so finite composites of towers and étale maps are (étale) ∘ (tower)
([PH erratum] item (1), p. 1; [PH] §3, proof of Lem. 3.10(vi), p. 17; [PH] §3, Prop. 3.2, p. 13).

**The corrected coverings form a pretopology.** (*corrected-covers-pretopology*) A family
`{f_i : U_i → U}` in `X_proét` is a *corrected covering* if `|U| = ⋃ f_i(|U_i|)` and each `f_i` is a
tower followed by an étale map. They form a Grothendieck pretopology whose members are pro-étale and
open; jointly surjective étale families, towers, and printed Def. 3.9 coverings by countably
presented pro-étale maps are corrected coverings, and corrected coverings are printed coverings
([PH erratum] item (1), p. 1; [PH] §3, Def. 3.9, p. 15; [PH] §3, Lem. 3.10(i), p. 15). The étale
factor is the reading adopted here of the erratum's analogous condition; without it open covers
would be excluded.

### A1.12 the pro-étale site

**The pro-étale site with corrected coverings.** (*pro-etale-site-corrected*) `X_proét` is the full
subcategory of `pro-X_ét` of objects pro-étale over `X` ([PH] §3, Def. 3.9, p. 15), with the
topology `J_proét` generated by corrected coverings; `X` is final, finite limits and `|·|` are
computed in `pro-X_ét` and covering members are open. `J_proét` is coarser than the printed
topology, strictly once an open surjection of profinite sets without continuous section occurs over
a geometric point, and countably presented families cover as before ([PH erratum] item (1), p. 1);
Corollary 3.8 (Proposition 3.8 in the erratum) and the last sentence of Proposition 3.13, deleted by
the erratum, are not used ([PH erratum] item (2), p. 1); enough points is only
*proetale-topos-enough-points*. It is neither the perfectoid pro-étale site ([ECD] §8, Def. 8.1(ii),
p. 39; DiamondsAndVStacks layer D2) nor Mathlib's pro-étale topology on schemes. Checks: over
`Spa(C, O_C)` (`C` algebraically closed, rank one) the [RZ] surjection covers for the printed
topology but not for `J_proét` by *transfinite-tower-splitting*, and the geometric stalk is not
conservative: the sheafification of `S ↦ C(S, ℝ)/LC(S, ℝ)` vanishes at `pt` but not on the Cantor
set ([PH] §3, Rem. 3.14, first sentence, p. 19).

**The projection ν.** (*proetale-projection-nu*) `c : X_ét → X_proét` is fully faithful, preserves
finite limits and sends étale coverings to corrected coverings, so it gives a morphism of sites
`ν : X_proét → X_ét`, `ν_*F = F ∘ c`, with `ν^*` commuting with finite limits and `ν^*F` the
sheafification of `lim V_j ↦ colim_j F(V_j)` ([PH] §3, before Lem. 3.16, p. 19; [PH] §3, Prop. 3.2,
p. 13). Check: for `X = Spa(K, O_K)`, `K` complete discretely valued, the quasi-compact objects form
a site equivalent to profinite `G`-sets, `G = Gal(K^sep/K)`, with the same topos
(*proetale-profinite-etale-morphism-of-sites*), and `ν^*` of a discrete `G`-module `M` is
`S ↦ Hom_cont,G(S, M)`.

**Sections of ν^*F on qcqs objects.** (*nu-pullback-sections-qcqs*) For a sheaf of sets `F` on
`X_ét` and a qcqs `U = lim U_j ∈ X_proét` (*proetale-quasicompactness-detection*) presented by qcqs
`U_j ∈ X_ét`, `(ν^*F)(U) = colim_j F(U_j)` (Čech argument; uses *proetale-coherence*), so
`F → ν_*ν^*F` is an isomorphism and `ν^*` is fully faithful on sheaves of sets. This is Lemma 3.16
for `i = 0`; `i > 0` and Corollary 3.17 belong to the étale-cohomology roadmaps ([PH] §3, Lem. 3.16
and its proof, pp. 19–20; after Cor. 3.17, p. 20).

**Slices.** (*proetale-slice*) For `V ∈ X_ét`, `V_proét ≃ X_proét/c(V)` as sites (slice topology),
so `Sh(V_proét) ≃ Sh(X_proét)/h_V`, compatibly with `ν` and *slice-site*; AdicSpacesPartIV layer R4
re-exports the open case (*proetale-slice-open-subspace*) ([PH] §3, before Prop. 3.15, p. 19; [PH]
§3, Lem. 3.10(iii), p. 15).

**Profinite sets.** (*profinite-set-objects*) For `U ∈ X_proét` and profinite `S = lim S_j` put
`U × S := U ×_X lim_j ⊔_{S_j} X`. Then `U × S ∈ X_proét`, `|U × S| ≅ |U| × S`,
`Hom(V, U × S) ≅ Hom(V, U) × C(|V|, S)` for quasi-compact `V`, and for `S ≠ ∅`, `U × S → U` has a
section, hence covers (a tower for metrizable `S`; no tower form is claimed in general). Over
`Spa(C, O_C)` (`C` algebraically closed, rank one) the [RZ] surjection `S → S'` gives a pro-étale
surjection `X × S → X × S'` whose sieve does not cover ([PH] §5, proof of Lem. 5.6, p. 31; [PH] §6,
Cor. 6.6, p. 36; [PH erratum] item (1), p. 1). The perfectoid analogue is PerfectoidSpaces layer P6
(*product-with-profinite-set*).

**Galois covers.** (*profinite-galois-cover-is-covering*) Let `U ∈ X_proét`, `G` profinite and
`Ũ = lim Ũ_j → U` a pro-finite-étale `G`-torsor (compatible finite étale Galois `Ũ_j → U` with
groups `G/N_j`, `N_j` open normal, `⋂ N_j = 1`; levelwise quotients,
*finite-etale-galois-category*). Then `Ũ ×_U Ũ ≅ Ũ × G`, `(x, g) ↦ (x, xg)`; `Ũ → U` is a tower by
*profinite-group-tower*, hence a covering for every profinite `G`; and `F(U) = eq(F(Ũ) ⇉ F(Ũ × G))`,
and for qcqs `U` and `F = ν^*F'`, `F(Ũ × G) = LC(G, F(Ũ))` and `F(U) = F(Ũ)^G` ([PH] §5, proof of
Lem. 5.6, p. 31; [PH erratum] item (1), p. 1). Check: for `K = ℚ_p` (`p` odd) the Kummer stages are
not Galois, yet the tower covers.

### A1.13 profinite G-sets and the pro-finite-étale site

**Sites of finite and profinite G-sets.** (*profinite-g-sets-site*) For a topological group `G`, let
`G-fsets` be finite discrete `G`-sets (jointly surjective coverings) and `G-pfsets` profinite sets
with continuous `G`-action (fibre products on underlying sets). A `G`-map is *`G`-étale* if it is
pulled back from a map of finite `G`-sets along some `S → B`, `B` finite, and a *`G`-tower* if it is
a transfinite composite `lim_{μ<λ} S_μ → S` of pullbacks of surjections of finite `G`-sets (towers
compose, lengths adding). Corrected coverings are jointly surjective families of towers followed by
`G`-étale maps; they form a pretopology for every `G` and replace the printed Def. 3.4 (jointly
surjective open maps), the `G`-étale factor reading the erratum's condition so that summands cover a
disjoint union. For a topological `G`-module `M`, `F_M(S) = Hom_cont,G(S, M)` is an abelian sheaf.
For profinite `G`, `G-pfsets ≃ Pro(G-fsets)` (the Yoneda embedding on `G-fsets`, whose coverings are
preserved) and `G/H` is a profinite `G`-set for every closed subgroup `H`, normal or not; for
`G = 1`, `G-pfsets ≃ Profinite` ([PH] §3, Def. 3.4, p. 13; [PH] §3, proof of Prop. 3.5, p. 14; [PH]
§3, after Lem. 3.6, p. 14; [PH erratum] item (1), p. 1). Checks: for `G = 1` an open surjection of
profinite sets without continuous section is not a covering, though it was for Def. 3.4; `G → pt`
covers, without equivariant section for `G ≠ 1`, and for infinite `G` is a tower but not `G`-étale;
for discrete `G = ℤ`, `ℤ ∪ {∞}` with translation has only constant maps to finite `ℤ`-sets, so `G`
must be compact.

**Open surjections of profinite G-sets.** (*open-surjection-profinite-structure*) For profinite `G`,
an open surjection `S → S'` of `G-pfsets` is a cofiltered limit over `S'` of pullbacks
`A_i ×_{B_i} S' → S'` of surjections of finite `G`-sets, but by *transfinite-tower-splitting* need
not be a `G`-tower ([PH] §3, Lem. 3.6 and its proof, p. 14). Check: the Ribes–Zalesskii [RZ]
surjection has such a presentation and no section.

**Sections over free G-sets are exact.** (*free-g-profinite-sections-exact*) For profinite `G` and
free `S ∈ G-pfsets`, `S ≅ (S/G) × G`, since `S → S/G` is a `G`-tower along the filtration of
*profinite-group-tower* and splits by *transfinite-tower-splitting* (the false printed 3.7(i) is not
used); and `F ↦ F(S)` is exact on abelian sheaves for the corrected coverings ([PH] §3,
Prop. 3.7(ii) and its proof, pp. 14–15; [PH erratum] item (1), p. 1). Checks: for `G = ℤ_p`,
`F ↦ F(G)` is exact; freeness is needed: for finite `G ≠ 1`, the epimorphism `F_{ℤ[G]} → F_ℤ` has
image `|G|ℤ` on `pt`.

**The pro-finite-étale site with corrected coverings.** (*pro-finite-etale-site-corrected*)
`X_profét := Pro(X_fét)`, a full subcategory of `X_proét` with `|U| = lim |U_i|`, has as coverings
the families whose images cover `|U|` and whose members are a pro-finite-étale tower (steps
pullbacks of finite étale surjections; *finite-etale-tower*) followed by the pullback of a morphism
of `X_fét` along some `U → V₀`, `V₀ ∈ X_fét`. They form a pretopology, contain towers and the
summands of a finite disjoint union (which the erratum's tower-only condition, read literally,
excludes), and replace the printed Def. 3.3 ([PH] §3, Def. 3.3, p. 13; [PH erratum] item (1), p. 1;
[PH] §5, proof of Lem. 5.6, p. 31). Checks: `Spa(K, K⁺)_profét ≃ Gal(K^sep/K)-pfsets`; `∅ → X` is
finite étale but covers no nonempty `X`.

**Pro-finite-étale objects are profinite π₁-sets.** (*profinite-etale-galois-sets*) For `X`
connected with a geometric point `x̄`, `X_fét` with `F_x̄` is a Galois category
(*finite-etale-galois-category*; [PH] §3, before Def. 3.4, p. 13) and `lim Y_i ↦ lim F_x̄(Y_i)` is
an equivalence of sites `X_profét ≃ π₁(X, x̄)-pfsets` for corrected coverings ([PH] §3, Prop. 3.5
and its proof, p. 14). Check: for `X = Spa(K, O_K)`, `K` complete discretely valued,
`X_profét ≃ G_K-pfsets`.

**Open equals pro-étale on X_profét; the morphism of sites.**
(*proetale-profinite-etale-morphism-of-sites*) A morphism of `X_profét` is open on spaces iff it is
pro-étale; the inclusion `X_profét ⊂ X_proét` preserves fibre products and coverings, giving a
morphism of sites `X_proét → X_profét` (the printed coincidence of coverings is not asserted) ([PH]
§3, Lem. 3.11, p. 17). Check: for `X = Spa(K, O_K)`, `K` `p`-adic, `X_proét^qc = X_profét` with the
same topos, while `⊔_ℕ X` is pro-étale but not pro-finite-étale.

### A1.14 coherence and change of base field

**Coherence of the pro-étale topos.** (*proetale-coherence*) A pro-étale presentation by affinoids
is quasi-compact; those factoring through an affinoid open of `X` form a generating class `B_X`,
closed under fibre products over members (not under products over a non-quasi-separated `X`), whose
members are coherent; `Sh(X_proét)` is algebraic (DiamondsAndVStacks D0; SGA 4 VI 2.3) ([PH] §3,
Prop. 3.12(i)–(iii) and proof of (iii), pp. 17–18).

**Quasi-compactness is detected on underlying spaces.** (*proetale-quasicompactness-detection*)
Objects and morphisms of `X_proét` are quasi-compact (resp. quasi-separated) iff their spaces are,
this passes along limits of finite étale surjections, and `X_proét` is quasi-separated (resp.
coherent) iff `|X|` is; for quasi-separated `X` the quasi-compact objects form a dense subsite ([PH]
§3, Prop. 3.12(iv)–(vii) and after Prop. 3.12, pp. 17–18). Check: the open disc has
non-quasi-compact `X_proét`.

**Étale descent along an algebraic extension.** (*etale-descent-along-algebraic-extension*) Let `K`
be complete nonarchimedean with open valuation subring `K⁺`, `X` qcqs and locally of finite type
over `Spa(K, K⁺)` (AdicSpaces layer 5), and `L/K` separable algebraic with finite subextensions
`L_i`, plus rings the integral closures of `K⁺`. Then `|X_{L̂}| = lim |X_{L_i}|`, morphisms between
base changes of qcqs étale spaces over `X_{L̂}` are colimits of those over the `X_{L_j}`, and every
qcqs étale `X_{L̂}`-space descends, so `2-colim_i (X_{L_i})_{ét,qcqs} ≃ (X_{L̂})_{ét,qcqs}`, via
standard étale presentations and perturbation ([PH] §3, before Prop. 3.15, p. 19; [H93] §3,
Prop. 3.9, p. 468). Check: for `X = Spa(K, K°)` this is Krasner's lemma.

**Change of base field.** (*proetale-field-extension-slice*) With `K, K⁺, L, L_i` as above and `X`
locally of finite type over `Spa(K, K⁺)`, not necessarily qcqs, `X_L := lim X_{L_i}` is
pro-finite-étale and `X_{L̂,proét} ≃ X_proét/X_L` as sites (corrected coverings; by descent on
quasi-compact objects, then gluing); for finite `L/K` it is *proetale-slice*. Finite type over `K`
replaces Scholze's "locally noetherian", under which `X_{L̂}` need not be locally noetherian ([PH]
§3, before Prop. 3.15 and Prop. 3.15, p. 19). Checks: for `L = ℚ_p^unr`, `L̂` is not perfectoid and
`X_L` is a `Ẑ`-torsor; for `ℚ₂ ⊂ C₂`, `X_L` has one point but two lifts to `ℚ₂(√2)`.

### A1.15 points

**Scholze's point morphisms.** (*proetale-fibre-morphism-of-topoi*) Let `X` be locally noetherian
analytic, `x ∈ X`, `Y_x = Spa(k(x)^, k(x)^+) → X` (image: the generisations of `x`; [PH] §3,
footnote 2 to Prop. 3.13, p. 18), `x̄ = Spa(C, C⁺)` over the closed point of `Y_x` (`C` the
completed algebraic closure of `k(x)^`, `C⁺` of any rank, `C⁺ ∩ k(x)^ = k(x)^+`), and
`D_x ⊆ G_x = Gal(k(x)^sep/k(x)^)` the stabiliser of `C⁺ ∩ k(x)^sep`, i.e. the automorphisms of `x̄`
over `Y_x`; `D_x = G_x` iff `k(x)^+` is henselian (e.g. at rank one). For affinoid `X` and
quasi-compact `U = lim U_i ∈ X_proét`, `Φ_x(U) = lim Hom_X(x̄, U_i)` is a profinite `D_x`-set. (a)
`Φ_x : X_proét^qc → D_x-pfsets` preserves finite limits and corrected coverings
(*geometric-point-etale-split*, *transfinite-tower-splitting*), giving a morphism of topoi
`i_x : Sh(D_x-pfsets) → Sh(X_proét)` (for general `X` via an affinoid neighbourhood). (b) If
`k(x)^+` is henselian, `D_x-pfsets ≃ Y_x,profét` and `i_x` is the morphism of [PH] §3, Prop. 3.13,
first sentence, p. 18 (sketched in its proof, p. 19); at rank one `Φ_x(U)` is the profinite fibre of
`U ×_X Y_x`. Conservativity is not claimed; the last sentence of Prop. 3.13 is deleted ([PH erratum]
item (2), p. 1). Check: at the rank-two specialisation of the Gauss point of `Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`
towards `|T| < 1`, Galois swaps the two extensions of the valuation to `k(x)^(α)`, `α² − α = T`, so
`D_x ≠ G_x`, and an étale covering of `Y_x` restricts to the empty sieve of `Y_x,profét` (so `i_x`
is not built by base change through `Y_x,proét`).

**Deligne's theorem: coherent topoi have enough points.** (*coherent-topos-enough-points*) A site
`(C, J)`, `C` essentially `w`-small, whose topos is coherent (SGA 4 VI 2.3: algebraic,
DiamondsAndVStacks D0.17, with qcqs terminal object; e.g. finite
limits and finite covering subfamilies) has enough points relative to `w` (Mathlib
`GrothendieckTopology.HasEnoughPoints`): a `w`-small family of points jointly reflecting
isomorphisms of sheaves of `w`-sets ([SGA 4 VI] Exp. VI, Appendix by P. Deligne, Prop. 9.0, p. 336
of the original pagination).

**Enough points.** (*proetale-topos-enough-points*) `Sh(X_proét)` has enough points: for qcqs `|X|`
it is coherent (*proetale-quasicompactness-detection*) and Deligne applies; in general cover by qcqs
opens (*proetale-slice*). So does `G-pfsets` for profinite `G` (objects compact, coverings with
finite subcoverings), with points in the next universe. Scholze's Cor. 3.8 and the last sentence of
Prop. 3.13 are deleted and unused ([PH erratum] item (2), p. 1; [PH] §3, Corollary 3.8 (called
Proposition 3.8 in the erratum), p. 15; [PH] §3, Prop. 3.13, last sentence, p. 18). Check: for
`G = 1` and `T` with two points, `S ↦ C(T, S)` is not a point, the summand covering failing.

### A1.16 generalized adic presentations

**The rational-covering site on complete Huber pairs.** (*huber-pair-rational-site*) Let `𝒞` be the
category of complete Hausdorff Huber pairs with all morphisms of Huber pairs, adic or not
([Berkeley] Lecture 3, §3.4, p. 22). A morphism `φ` out of `(A, A⁺)` is a rational localisation at
`R(T/s)` (`T` finite, `T·A` open) if `Spa(φ)` lands in `R(T/s)` and every morphism whose `Spa` lands
there factors uniquely through `φ` ([Wedhorn] Lemma 8.1 and Prop. 8.2, p. 74). Localisations at
finite rational coverings (the empty one iff `A = 0`) form a coverage on `𝒞ᵒᵖ`, preimages being
refined by rational coverings (for adic `φ` the data `(φ(T_k), φ(s_k))` already are one, [Berkeley]
Lecture 5, Prop. 5.1.5(1), p. 35); `J_rat` is the generated topology. `𝒪 : (A, A⁺) ↦ A` is
represented by the discrete pair `(ℤ[T], ℤ)`; on complete Tate pairs, `𝒪` satisfies the sheaf
condition on rational coverings of `(A, A⁺)` and of its rational localisations iff `(A, A⁺)` is
sheafy ([KL I] §8.2, Def. 8.2.3, p. 159; [Wedhorn] Def. 8.26, p. 81; [Berkeley] Lecture 3,
Def. 3.1.11, p. 19; [Berkeley] Lecture 4, Prop. 4.3.4, p. 34). Checks: `R({1}/ϖ) = ∅` for a
pseudouniformiser `ϖ`; adicness matters: for `(ℤ_p, ℤ_p) → (ℤ_p⟦T⟧, ℤ_p⟦T⟧)` the image of `R({p}/1)`
is no rational covering; in `(ℚ₂, ℤ₂)` empty numerators give no rational localisation; `𝒪` is a
sheaf on strongly noetherian Tate pairs ([Wedhorn] Thm. 8.28(b), p. 81), not on Rost's pair ([HK]
§6, Ex. 6.28, p. 24).

**Yoneda-adic spaces.** (*generalized-adic-presentation*) `Spa^Y(A, A⁺)` is the
`J_rat`-sheafification of `Hom_𝒞((A, A⁺), −)`; open immersions into it are the open subsheaves
`colim_{V ⊆ U rational} Spa^Y(O(V), O⁺(V))` of opens `U ⊆ Spa(A, A⁺)`, in general those that are so
after affinoid base change; a sheaf is Yoneda-adic if it is the colimit of its affinoid open
immersions. These are Scholze–Weinstein's adic spaces (Moduli of p-divisible groups, Def. 2.1.5;
[Berkeley] Lecture 3, §3.4 and Def. 3.4.1, pp. 21–22; name: [Berkeley] Appendix to Lecture 3, p. 24,
unlike [Wedhorn] §8.1, Rem. and Def. 8.10, p. 77), over Tate pairs Kedlaya–Liu's preadic spaces
([KL I] §8.2, Def. 8.2.3, p. 159), and the setting of ECD Def. 15.5 and Lem. 15.6 ([ECD] §15, after
Def. 15.5, p. 91), needed as sheafiness may not pass to finite étale extensions ([KL I] §8.2,
Rem. 8.2.18, p. 162). Prove `Hom(Spa^Y(A, A⁺), G) ≃ G(A, A⁺)`, that `Spa^Y(A, A⁺)` is Yoneda-adic
and initial iff `A = 0`, and that `A → Γ(Spa^Y(A, A⁺))`, `Γ = Hom(−, Spa^Y(ℤ[T], ℤ))`, is bijective
when `𝒪` satisfies the sheaf condition on rational coverings of every rational localisation (for
Tate pairs: sheafy). Checks: the open disc is Yoneda-adic, not affinoid; Rost's pair makes `Spa^Y`
unfaithful.

**Open immersions into affinoids.** (*yoneda-adic-open-immersions*) Without sheafiness, rational
localisations give open immersions; `U ↦` its open subsheaf is an order-preserving bijection from
opens of `Spa(A, A⁺)` to open immersions into `Spa^Y(A, A⁺)`, compatible with intersections and
unions; a rational covering is jointly epimorphic (the gluing ECD §15 uses for `Spd`); open
immersions are monomorphisms, stable under base change and composition ([Berkeley] Lecture 3,
Def. 3.4.1, p. 22; [Berkeley] Appendix to Lecture 3, proof of Prop. 3.5.3, pp. 24–26; [ECD] §15,
before Def. 15.5, p. 91). Check: `ℤ[T] → ℤ`, `T ↦ 0`, gives a monomorphism that is no open
immersion, `{|T| = 0}` not being open.

**The ind-ringed description and the underlying space.** (*yoneda-adic-ind-ringed-description*)
Pre-adic spaces in `(V)_ind` (spaces with a sheaf of ind-topological rings and valuations on stalks,
locally some `Spa^ind(A, A⁺)`; [Berkeley] Appendix to Lecture 3, Def. 3.5.1, p. 23; Def. 3.5.2,
p. 24) are equivalent to Yoneda-adic spaces via `X ↦ Hom(Spa^ind(−), X)`, matching affinoids and
open immersions (Prop. 3.5.3 with its proof, pp. 24–26). So every Yoneda-adic `F` has a functorial
space `|F|`, with `|Spa^Y(A, A⁺)| = Spa(A, A⁺)`, covered by its affinoid charts, whose opens are its
open immersions; sheafifying in topological rings fails ([Berkeley] Appendix to Lecture 3, p. 23;
[KL I] §8.2, Def. 8.2.3, p. 159). Check: the sheafification unit, an isomorphism for sheafy pairs,
kills `X₃` for Rost's pair.

**Maps from adic spaces to Yoneda affinoids.** (*maps-from-adic-spaces-to-yoneda-affinoids*) For an
adic space `X` (AdicSpaces layer 5) with `X^Y = colim Spa^Y(O_X(U), O_X⁺(U))` and any `(A, A⁺) ∈ 𝒞`,
sheafy or not, maps `X^Y → Spa^Y(A, A⁺)` are naturally the morphisms `(A, A⁺) → (O_X(X), O_X⁺(X))`,
deduced from Huber's Prop. 2.1(ii) (A0 *maps-into-affinoids*) ([KL I] §8.2, Lem. 8.2.9 and
Rem. 8.2.10, p. 160; [ECD] §15, Lem. 15.1(ii), p. 89). Check: on the open disc these are the rigid
functions.

**Adic spaces inside Yoneda-adic spaces.** (*adic-spaces-in-yoneda-adic-spaces*) `X ↦ X^Y` is a
fully faithful functor from AdicSpaces's adic spaces (sheafy: `Huber.IsSheafyForEveryPresentation`)
to Yoneda-adic spaces, sending `Spa(A, A⁺)` to `Spa^Y(A, A⁺)` for sheafy pairs, preserving and
reflecting open immersions and spaces, with essential image those covered by `Spa^Y` of sheafy
pairs; on sheafy affinoids it agrees with AdicSpaces's affinoid pre-adic spaces, then adic
([Berkeley] Lecture 3, §3.4, p. 22; [Berkeley] Lecture 3, Def. 3.2.1 and Prop. 3.2.2, p. 20; [KL I]
§8.2, Def. 8.2.3, p. 159). For locally strongly sheafy `X` it also matches the small étale and
finite étale sites (finite étale maps of Yoneda-adic spaces taking whole preimages of affinoid
charts, étale ones having analytic source and target). Checks: `Spa^Y(ℚ_p, ℤ_p)` is the subsheaf of
the terminal sheaf where `p` is a topologically nilpotent unit ([Wedhorn] Prop. 7.52(2), p. 70); the
open disc in the closed disc is not finite étale.

**Analytic Yoneda-adic spaces are Tate-local.** (*yoneda-adic-analytic-tate-local*) A point is
analytic if it lies in an affinoid chart with Tate ring ([Berkeley] Lecture 4, Def. 4.3.2, p. 33).
(a) On `Spa(A, A⁺)` this means non-open support (AdicSpaces layer 2), and the analytic locus is a
finite union of rational subsets with Tate rings ([Berkeley] Lecture 4, Prop. 4.3.1(2), pp. 32–33);
(b) morphisms out of a Tate (or analytic) ring are adic ([Berkeley] Lecture 5, Lem. 5.1.2 and after
Prop. 5.1.3, p. 35; AdicSpacesPartII *adic-iff-analytic-locus*); (c) restriction to complete Tate
pairs is fully faithful on analytic Yoneda-adic spaces, which are Kedlaya–Liu's preadic spaces
([KL I] §8.2, Def. 8.2.2 and Def. 8.2.3, p. 159). Check: `Spa^Y(ℤ_p⟦T⟧, ℤ_p⟦T⟧)` is not analytic.

**Fibre products.** (*yoneda-adic-fibre-products*) For adic `(A, A⁺) → (B, B⁺)`, `(C, C⁺)`
(automatic for analytic `A`), without sheafiness,
`Spa^Y(B) ×_{Spa^Y(A)} Spa^Y(C) ≅ Spa^Y(B ⊗̂_A C)`, the completed tensor product (AdicSpacesPartII
R0, *completed-tensor-product*) being the pushout in `𝒞` ([Berkeley] Lecture 5, Prop. 5.1.5(2) and
Rem. 5.1.6, pp. 35–36); so analytic Yoneda-adic spaces have analytic fibre products, whose points
surject onto compatible pairs (affinoid case: AdicSpacesPartII *fibre-product-points*, [H96]
Cor. 1.2.3(iii)(d), p. 49). Check: adicness is needed, `ℤ_p⟦T⟧ ← ℤ_p → ℚ_p` having no pushout of
Huber pairs ([Berkeley] Lecture 5, Rem. 5.1.7, p. 36; [KL I] §8.2, Rem. 8.2.5, p. 160).

### Examples

The Kummer cover `T ↦ S²` of the torus (`p` odd) is finite étale and splits over `{|T − 1| ≤ |p|}`;
in the disc, `{|T| ≤ |p|}` is étale, not finite étale. For a field `K`, `X_fét` and `X_profét` are
(pro)finite `Gal(K^sep/K)`-sets. The Kummer tower is a pro-étale covering, the [RZ] surjection is
not. `Spa^Y` recovers the closed disc; the open disc is Yoneda-adic, not affinoid; Rost's pair makes
`Spa^Y` non-faithful.

### Dependencies

Inside: A0 (rational and finite étale pullbacks); A4's henselian inputs via PerfectoidSpaces P3;
A1.10–A1.15 use A1.1–A1.9, and the Kedlaya–Liu site (A1.9) uses A1.16. AdicSpacesPartII R0 (Huber's
morphisms, fibre and completed tensor products) and R3 (Kiehl); DiamondsAndVStacks D0
(pro-categories, algebraic topoi); AdicSpaces layers 0 and 2–5. Sheafiness of finite étale algebras
stays a hypothesis (supplied by PerfectoidSpaces P2–P3, AdicSpacesPartIV R5); Yoneda-adic spaces
carry the non-sheafy case. Consumers: AdicSpacesPartIV R4–R5, PerfectoidSpaces P3–P4,
PerfectoidTowers P9, A2–A4, DiamondsAndVStacks D6.

## Layer A2: separatedness, smooth charts, and classical analytic geometry

This layer is the comparison interface with AdicSpacesPartII R0–R1 (separated, proper, smooth
morphisms; analytification) and AdicSpacesPartIII F0/R2 (formal schemes, generic fibres). It owns
relative closed polydiscs and tori, smooth morphisms by ball charts, compatible toric charts,
dimension, analytification compatibility with A1's étale site, and formal schemes and generic fibres
in the scope of specialisation. Spaces are analytic, covered by affinoids with complete stably
sheafy rings (e.g. locally noetherian). Lean has affinoid-level polydiscs, `Huber.Pair.polydisc S n`
(the global ball over an adic space is stated in this README only), and chart-local ball charts,
`AdicSpace.IsPolydiscOver`.

### A2.1 separated, proper and partially proper morphisms

**Separated, proper and partially proper morphisms.** (*supplier-contract-separated-proper-smooth*)
Cited from AdicSpacesPartII R0. For `f : X → Y` quasi-separated of analytic spaces (needed for the
criteria, [H96] §1.3, before Def. 1.3.5, p. 52), locally of weakly finite type, `X` covered by
affinoids with complete stably sheafy rings: (1) `f` is separated ([H96] §1.3, Def. 1.3.1, p. 51)
iff `Δ_f` is a closed embedding iff each `(x, A) ∈ X_v` has at most one centre over each `y`
([H96] §1.3, Prop. 1.3.7, pp. 52–53); for `f` locally of +weakly finite type, (2) partially proper
iff each centre on `Y` lifts uniquely to `X` ([H96] §1.3, Cor. 1.3.9, pp. 54–55), (3) if
quasi-compact, proper (= partially proper and quasi-compact, [H96] §1.3, Lem. 1.3.4, pp. 51–52) iff
the same; (4) closed embeddings and finite maps to analytic spaces are proper ([H96] §1.4, Lem.
1.4.5(ii)–(iii), p. 62); separated, universally closed and proper maps are stable under composition
and adic base change. Checks: `P^{1,ad}_K` is proper, the closed disc is not (the Gauss point's
valuation ring at `T = ∞` has no centre), the open disc is partially proper; the disc doubled along
`{|ϖ| ≤ |T|}` has a valuation ring with two centres; the doubled origin is not quasi-separated.

### A2.2 relative closed polydiscs

**The relative closed unit polydisc.** (*relative-closed-polydisc*) For a complete Hausdorff Huber
pair `(A, A⁺)`, not necessarily Tate, the closure `A⁺⟨T⟩` of `A⁺[T₁, …, Tₙ]` in `A⟨T⟩` is the ring
of integral elements `{h : |h| ≤ 1 on Spa(A⟨T⟩, A⁺⟨T⟩)}`, and maps `(A⟨T⟩, A⁺⟨T⟩) → (D, D⁺)` under
`(A, A⁺)` to complete pairs correspond to `n`-tuples in `D⁺` ([Berkeley] Lecture 4, §4.1, p. 27;
[ECD] §24, after Prop. 24.4, p. 156). For `X` covered by affinoids `Spa(B, B⁺)`, `B` complete stably
sheafy, `B^n_X := X ×_{Spa ℤ} Spa(ℤ[T], ℤ[T])`, with projection `π`, has (a) charts
`Spa(B⟨T⟩, B⁺⟨T⟩)`; (b) `Hom_X(Z, B^n_X) ≃ O⁺_Z(Z)ⁿ`; (c) base change to `X'` of the same kind,
`B^{m+n}_X ≅ B^m_X ×_X B^n_X`, `B⁰_X ≅ X`; (d) `π` quasi-compact, separated, and for locally
noetherian `X` smooth with `Ω` free on the `dTᵢ` ([H96] 1.6.2(i), p. 76); `B^n_X` locally
noetherian, resp. analytic, with `X`; (e) for `X` locally noetherian analytic, `B^n_X = {|Tᵢ| ≤ 1}`
in R1's `A^n_ℤ ×_{Spec ℤ} X`, and over `Spa(K, K°)` (`K` complete nonarchimedean) it is
`ValuationSpectrum.closedPolydisc n K`. Checks: over `Spa(K, K⁺)`, `K⁺ ⊊ K°`, the fibre strictly
contains `Spa(K⟨T⟩, K°⟨T⟩)`, so `B⟨T⟩°` is the wrong plus ring; plus ring `ℤ` gives the
non-quasi-compact affine line; over `Spa(ℤ_p, ℤ_p)`, `B¹` is not analytic. Lean:
`Huber.Pair.polydiscVar`, `Huber.Pair.polydiscPlus`, `Huber.Pair.polydisc`,
`Huber.Pair.polydisc.proj`, `Huber.Pair.polydisc.existsUnique_hom`,
`Huber.Pair.isRingOfIntegralElements_polydiscPlus`; rest README.

### A2.3 relative tori

**The relative torus.** (*relative-torus*) For `X` as in *relative-closed-polydisc*, `T^n_X ⊆ B^n_X`
is the open `{|T₁ ⋯ Tₙ| ≥ 1} = {all |Tᵢ| = 1}`, on charts the rational subset
`Spa(B⟨T^{±1}⟩, B⁺⟨T^{±1}⟩)`. Prove: `Hom_X(Z, T^n_X) ≃ ((O⁺_Z(Z))^×)ⁿ`; for locally noetherian `X`,
smoothness with `Ω` free on the `dTᵢ`; base change, sums of `n`, `T⁰_X = X`; a commutative group law
over `X`; over `Spa(K, K°)`, Scholze's `Tⁿ` ([PH] §4, Ex. 4.4, p. 23); for a topologically nilpotent
unit `ϖ`, `Tᵢ ↦ 1 + ϖTᵢ` maps `B^n_X` isomorphically onto `{|Tᵢ − 1| ≤ |ϖ|} ⊆ T^n_X` ([PH] §5, proof
of Lem. 5.2, p. 28); `B¹_X = T¹_X ∪ (T¹_X + 1)` ([ECD] §24, proof of Prop. 24.4, p. 156). Checks:
`T ↦ c` lies on `T¹` iff `|c| = 1`, so inversion does not extend to `B¹`; `T¹ ≠ (G_m)^{ad}` (not
quasi-compact). Lean: `Huber.Pair.torusLocus`, `Huber.Pair.mem_torusLocus_iff`; rest README.

### A2.4 smooth morphisms by ball charts, and Huber's smooth morphisms

**Smooth morphisms by étale charts over relative balls.** (*smooth-morphism-ball-charts*) For
`f : Y' → Y` of analytic adic spaces, `Y` covered by affinoids with complete stably sheafy rings,
`f` is locally étale over a relative ball if each `y'` has, in any given neighbourhood, an open
`U ∋ y'` with an A1-étale `g : U → B^n_Y`, `f|_U = π ∘ g`: "smooth" of [ECD] §24, Prop. 24.4,
p. 156, with no noetherian hypothesis; balls over `Y` again satisfy the hypothesis ([Zav] Lem. 3.2
and Cor. 3.4). Prove: A1-étale maps and open restrictions of `B^n_Y → Y` qualify; stability under
composition and base change ([KL I] §8.2, Def. 8.2.16, p. 162), locality on the source, and equality
with Huber's `AdicSpace.Smooth` on locally noetherian analytic spaces. Checks: the origin
`Spa(K, K°) → B¹_K` fails (image not open); the non-perfectoid `B^n_Y → Y` over affinoid perfectoid
`Y ≠ ∅` qualifies. Lean: `AdicSpace.IsPolydiscOver`, `AdicSpace.IsLocallyEtaleOverPolydisc`,
`AdicSpace.IsLocallyEtaleOverPolydisc.iff_smooth`; rest README.

**Huber's smooth morphisms have ball charts.** (*smooth-local-ball-charts*) For `f : X → S` of
locally noetherian analytic adic spaces, `f` is smooth ([H96] §1.6, Def. 1.6.5, p. 78) iff each `x`
has, in any neighbourhood, an open `U ∋ x` with an étale `g : U → B^n_S`, `n = rk_x Ω_{X/S}`,
`f|_U = π ∘ g` ([H96] §1.6, Cor. 1.6.10, p. 80; R0 *smooth-local-structure*); over `Spa(K, K°)`, `U`
can contain the closure of `{x}` in a smooth affinoid neighbourhood ([PH] §5, Lem. 5.2, p. 28). With
[H96] §2.2, Lem. 2.2.8, pp. 116–117, this gives *smooth-morphism-ball-charts*; `n = 0` means étale.

### A2.5 compatible toric charts

**Compatible local toric charts.** (*relative-toric-charts*) Let `K` be complete, nontrivially
valued of rank one, with pseudouniformiser `ϖ`, `f : X → Y` smooth between adic spaces smooth over
`Spa(K, K°)`, `X` affinoid, `x ∈ X`, `d = rk_x Ω_{X/Y}`, and `h : V → T^m_K` étale, a composite of
rational embeddings and finite étale maps, on an affinoid open `V ⊆ Y` containing the closure of
`{f(x)}`. Prove: in any open neighbourhood of the closure of `{x}` there are an affinoid open
`U ⊆ f⁻¹(V)` containing it and an étale `k : U → T^d_V` over `V` of the same kind, so
`(id × h) ∘ k : U → T^{d+m}_K` lies over `h` via the last `m` coordinates ([PH] §5, Lem. 5.2, p. 28,
case `m = 0`; [PH] §5, proof of Lem. 5.2, p. 28); as assumed in [PH] §8, Lem. 8.6, p. 50. Checks:
for `B¹_V → V`, `B¹_V ≅ {|T − 1| ≤ |ϖ|} ⊆ T¹_V`; in `Spa(K, K⁺)`, `K⁺` of rank two, the open generic
point omits its specialisation, so neighbourhoods of `x` alone do not suffice.

### A2.6 dimension and dimension estimates

**Dimension, pure and relative dimension.** (*dimension-of-adic-spaces*) For an adic space `X`,
`dim X` is `topologicalKrullDim |X|`, the supremum of lengths of specialisation chains ([H96] §1.8,
Def. 1.8.1, as stated in [Zav] §3, Def. 3.1, p. 4); `X` is pure of dimension `d` if all nonempty
opens have dimension `d` ([Zav] §3, Def. 3.1, p. 4); `dim f := ⨆_y dim f⁻¹(y)`, and relative pure
dimension `d` means all nonempty fibres are pure of dimension `d` ([Zav] §3, after Def. 3.1, p. 5).
Prove `dim Spa(K, K⁺) = rk(K⁺) − 1` for `K` complete of rank one, `K⁺ ⊆ K°` a valuation ring of any
rank ([Hüb] §2, p. 5), and, for `X` locally of finite type over `Spa(K, K°)`, pure dimension `d` iff
`dim O_{X,x} = d` at classical points ([Zav] §3, Lem. 3.3, p. 5); the closed `n`-polydisc is pure of
dimension `n`. Checks: `Spa(K, K⁺)`, `K⁺` of rank two, is Tau Ceti's `IsPureDimensional 1` but not
pure (an open point has dimension `0`), `B¹_K` the reverse (`0`-dimensional classical components);
`Spa(K, K°) ⊔ B¹_K` has no pure dimension; for the non-valuation ring `K⁺ = k₀ + t·k₀(u)⟦t⟧` in
`K = k₀(u)((t))`, `dim Spa(K, K⁺) ≥ 1 > ringKrullDim K⁺ − 1`. Lean: `AdicSpace.IsPureDim`,
`AdicSpace.relDim`, `AdicSpace.IsPureRelDim`, `AdicSpace.topologicalKrullDim_spa_field`,
`AdicSpace.isPureDim_spa_polydisc`; rest README.

**Rank-one fibres and smooth morphisms.** (*relative-dimension-rank-one-fibres*)
(*smooth-pure-relative-dimension*) For `S` locally noetherian analytic and `f : X → S` locally of
finite type, `f` has relative pure dimension `d` iff each fibre over `Spa(K(s), K(s)°)`, `s` of rank
one, is empty or pure of dimension `d` ([H96] §1.8, Cor. 1.8.7, p. 94; [Zav] §3, Lem. 3.2, p. 5); if
`f` is smooth with `Ω_{X/S}` locally free of rank `d`, it has relative pure dimension `d` ([Zav] §3,
Cor. 3.4, p. 5). Checks: over non-analytic `Spa(ℤ_p, ℤ_p)`, `B¹` has a fibre of dimension `≥ 2`; the
origin of `B¹_K` is of relative pure dimension `0` but not étale.

**Finite relative dimension.** (*weakly-finite-type-finite-dimension*) For `f : X → Y`
quasi-compact, locally of weakly finite type, between locally noetherian analytic adic spaces with
`Y` quasi-compact, `dim f < ∞` ([Zav] §3, Lem. 3.7, p. 7). Check: `⨆_n B^n_K → Spa K` (not
quasi-compact) has `dim f = ∞`. Lean: `AdicSpace.relDim_lt_top_of_locallyOfWeaklyFiniteType`.

### A2.7 analytification

**Analytified affine space and polydiscs.** (*analytification-relative-polydisc-comparison*) Cited
from AdicSpacesPartII R1: for `S = Spa(A, A⁺)`, `A` strongly noetherian Tate, `ϖ` a
pseudouniformiser, `A^n_A ×_{Spec A} S` is `⋃_k {|ϖᵏTᵢ| ≤ 1}` with `B^n_S` at `k = 0`; R1's
comparisons apply to balls and tori, and étale sites compare via AdicSpacesPartIV R4.

### A2.8 compatibility with A1's étale site

**Smooth charts cover the étale site.** (*smooth-etale-site-compatibility*) For `f : X → S` smooth
between locally noetherian analytic adic spaces, open immersions `U → X` with étale `S`-maps
`U → B^n_S` generate a covering sieve of A1's `X_ét` ([H96] §2.1, p. 109), with
`u^*Ω_{X/S} ≅ Ω_{U/S}` and stability under base change; over `Spa(K, K°)` toric charts also cover
([PH] §4, proof of Cor. 4.7, p. 25), e.g. the annuli `{|T| = 1}`, `{|T − 1| = 1}` of `B¹_K`.

### A2.9 formal schemes and generic fibres in the scope of the étale-cohomology roadmaps

**Huber's generic fibre is the analytic locus.** (*formal-generic-fibre-analytic-locus*) Cited from
AdicSpacesPartIII R2. For `𝔛` locally noetherian (F0), of type (S) ([H96] §1.9, condition (S),
p. 96), `d(𝔛) ≅ t(𝔛)_a` ([Hüb] §8, Thm. 8.1, p. 37; [H96] §1.9, Prop. 1.9.1, pp. 96–97), compatibly
with specialisation, open subschemes and adic `g` (`t(g)` adic iff `g` is, [H94] §4, Prop. 4.2(i),
p. 540). R2 also covers henselian `A` ([H96] §3.2, Ex. 3.2.11, p. 181), completions ([H96] §1.9,
1.9.4–1.9.6) and type (S)(b) models. Checks: `d(Spf ℤ_p⟦T⟧)` is quasi-compact, unlike the open disc
([Hüb] §8, Ex. 8.7, p. 39); `d(Spf ℤ_p⟨T⟩)` is the closed disc ([Hüb] §9, Ex. 9.4, p. 43).

### Examples

- `P^{1,ad}_K`, the closed, open and doubled discs; `B¹` over `ℚ_p` and `ℤ_p`; the affine line.
- `T¹`, `T ↦ 1 + pT`, the annulus cover; the origin of `B¹_K`; `dim Spa(K, K⁺) = 1`; `⨆_n B^n_K`.
- `A^{1,ad}_K = ⋃_k {|ϖᵏT| ≤ 1}`; `d(Spf ℤ_p⟦T⟧)` versus Berthelot's fibre; `d(Spf ℤ_p⟨T⟩)`.

### Dependencies

- AdicSpacesPartII R0 (fibre products, separated, proper, smooth, étale maps, toric charts), R1.
- AdicSpacesPartIII F0, R2, R3; AdicSpacesPartIV R4, R5; AdicEtaleGeometry A0, A1; A3 is a consumer.
- AdicSpaces layers 1, 2, 3, 5; Mathlib `topologicalKrullDim`; Tau Ceti restricted power series.

## Layer A3: the nonnoetherian affinoid étale approximation input

This layer proves [ECD] §6, Prop. 6.4(iv), p. 27: for a cofiltered system of affinoid perfectoid
spaces `X_i = Spa(R_i, R_i⁺)` (PerfectoidSpaces' `Perfectoid.IsPerfectoidTateRing`) with limit `X`, base change
gives an equivalence `2-colim_i (X_i)_{ét,aff} → X_{ét,aff}`. Full faithfulness is [ECD] 6.4(ii)
(PerfectoidSpaces P5); essential surjectivity is built by analytic algebra over perfectoid and
sousperfectoid bases, with no diamonds and no [ECD] 5.8, 11.30 or 15.6. The Kedlaya–Liu
pseudocoherence results are stated over sheafy complete Tate pairs and used over sousperfectoid ones
(sheafy by AdicSpacesPartIV R5). Inputs: PerfectoidSpaces P1–P3 and P5, AdicSpacesPartII R0,
AdicSpacesPartIII R3, AdicSpacesPartIV R5, layer A1. Consumers: PerfectoidSpaces P6 ([ECD]
7.10–7.11, hence 7.18 for DiamondsAndVStacks D1) and the relative Fargues–Fontaine roadmap. Tensor
products are algebraic unless written `⊗̂`; "pc" abbreviates pseudocoherent.

### A3.1 pseudocoherent modules and sheaves

**Pseudocoherent and fpd modules.** (*pseudocoherent-module*) Over a commutative ring, `M` is
*m-pc* (`m ≤ ∞`) if some exact `F_m → ⋯ → F₀ → M → 0` has finite free terms ([Stacks] Tag 064T;
SGA 6's `(−m)`-pseudo-coherence, [Stacks] Tag 064Q; not the Bourbaki notion of [KL II] §1.1,
p. 10), and *m-fpd* if it has a length-`≤ m` resolution by finite projectives ([KL II] §1.1,
Def. 1.1.1, p. 10); 0-pc and 1-pc are `Module.Finite` and `Module.FinitePresentation`. Prove:
m-fpd ⟺ pc of projective dimension `≤ m`; ∞-pc ⟺ m-pc for all finite `m` ([Stacks] Tag 064U); for
flat `M`, `M ⊗ N` inherits m-pc and m-fpd ⊗ n-fpd is (m+n)-fpd ([KL II] Rem. 1.1.3, p. 11, holds
only derived, [Stacks] Tag 0DJE); flat base change preserves both, exactly ([KL II] Rem. 1.1.13,
p. 13; [Stacks] Tag 066C); for an algebra that is pc as a module, pc over it and over the base
agree ([Stacks] Tag 064Z; [KL II] Rem. 1.1.13, p. 14); finite modules over noetherian rings are pc
([Stacks] Tag 066E). Checks: `R/xR` over `k[x, y₁, y₂, …]/(x·yᵢ)` is finitely presented, not 2-pc
(2-pc is stronger over non-coherent rings, [KL II] Rem. 1.1.8, p. 12); `R/(x) ⊗ R/(√2·x)` over
`ℚ + xℝ[x]` is not 2-pc (flatness is needed); `ℤ/2` over `ℤ/4` is pc but not fpd. Lean:
`Huber.IsPseudoCoherentOver`, `Huber.IsPseudoCoherentOver.zero_iff`,
`Huber.IsPseudoCoherentOver.one_iff`, `Module.IsFPD`,
`Module.IsFPD.isPseudoCoherent`; rest README.

**Two-out-of-three.** (*pseudocoherent-two-out-of-three*) In `0 → M₁ → M → M₂ → 0`, `m ≥ 0`:
`M₁, M₂` m-pc ⟹ `M` m-pc; `M₁` (m−1)-pc (void if `m = 0`) and `M` m-pc ⟹ `M₂` m-pc; `M` m-pc and
`M₂` (m+1)-pc ⟹ `M₁` m-pc; `M₁, M₂` m-fpd ⟹ `M` m-fpd; `M₁` m-fpd and `M` (m+1)-fpd ⟹ `M₂`
(m+1)-fpd; `M` m-fpd and `M₂` (m+1)-fpd ⟹ `M₁` m-fpd ([KL II] §1.1, Lem. 1.1.5, p. 11; [Stacks] Tag
064R, index negated). Check: `0 → 𝔪 → O → O/𝔪 → 0` for the valuation ring of `ℂ_p` makes the
shifts sharp.

**Weakly regular quotients.** (*koszul-regular-sequence-fpd*) If `f₁, …, f_r` is weakly regular on
`R` (Mathlib `RingTheory.Sequence.IsWeaklyRegular`; `R/(f) = 0` allowed), the Koszul complex
resolves `R/(f)`: it is r-fpd, `(f)` is (r−1)-fpd for `r ≥ 1`, and `(f)/(f)²` is free on the `fᵢ`
([KL II] §1.1, Rem. 1.1.6, p. 12, iterated), also after flat base change. Check: the variables are
weakly regular on `C⟨u₁, …, u_N⟩`, so `C` is N-fpd over it.

**Natural topology.** (*natural-topology-strict-exactness*) For `A` complete Hausdorff Tate and `M`
finite: (a) any `Aⁿ ↠ M` induces `moduleTopology A M`, making linear maps continuous ([KL II] §1.2,
Def. 1.2.2, p. 14); (b) continuous surjections, and maps with closed image, of complete metrizable
modules are strict ([KL II] Thm. 1.2.9(b), p. 16); (c) natural completeness ⟺ Hausdorffness, and
presentation kernels are closed ([KL II] Rem. 1.2.3, pp. 14–15); (d) in naturally complete `M` a
submodule with finitely generated closure is closed and naturally complete ([KL II] Cor. 1.2.11,
p. 16), not so for `x·C(ℤ_p, ℚ_p)`, whose closure is not finitely generated; (e) finite projectives
are naturally complete ([KL II] Rem. 1.2.4, p. 15); (f) completion keeps strict exactness
(AdicSpacesPartII R0). Lean: `Huber.IsNaturallyComplete`; rest README.

**Strictly and stably pc modules.** (*stably-pseudocoherent-module*) Over a complete Tate pair
`(A, A⁺)`, `M` is *strictly* m-pc (m-fpd) if m-pc (m-fpd) and naturally complete ([KL II] §1.2,
Def. 1.2.13, p. 17), *stably* so if also `M ⊗_A B` is naturally complete for every rational
localisation `B = A⟨T/s⟩` (plus ring: completed integral closure of `A⁺[T]`, [KL I] §2.4,
Lem. 2.4.13(a), p. 42) ([KL II] §2.4, Def. 2.4.1, p. 35); no sheafiness assumed. Prove: stably ⟹
strictly (needs `A` complete: not for `M = ℚ` over `p`-adic `ℚ`); finite projectives are stably
0-fpd; along a 2-pseudoflat `B`, `M ⊗_A B` stays stably 2-pc ([KL II] Rem. 2.4.5, p. 37), and
stably pc if all rational localisations are 2-pseudoflat ([KL II] Thm. 2.4.15, p. 40), when also
stable pc passes from `M₁, M₂` to `M` and from `M, M₂` to `M₁`, not to cokernels (`×x` on
`C(ℤ_p, ℚ_p)`); over strongly noetherian `A`, finite modules qualify ([KL II] remark after
Def. 2.4.1, p. 35). Check: [KL II] Ex. 2.4.2, pp. 35–36: an `A/fA` over affinoid perfectoid `A`,
strictly but not stably pc. Lean: `Huber.ratLoc`, `Huber.ratLocPair`,
`Huber.IsStablyPseudoCoherent`; rest README.

**Pseudoflatness and pro-projectivity.** (*pseudoflat-module*) Over a complete Tate pair, `B` is
*m-pseudoflat* if `Tor₁^A(P, B) = 0` for stably m-pc `P` ([KL II] §2.4, Def. 2.4.4, p. 36),
equivalently `M ⊗ B → N ⊗ B` is injective for `0 → M → N → P → 0` with `N` finite projective;
strictly m-pc `P` suffice ([KL II] Rem. 2.4.5, pp. 36–37). Complete metrizable `B` is
*pro-projective* if continuous projectors `πₖ` with finite projective images satisfy `πₗπₖ = πₖ`
(`k ≤ l`) and `πₖ(v) → v` ([KL II] Def. 2.4.6, p. 37). Flat ⟹ pseudoflat; 2-pseudoflat rational
localisations compose with 2-pseudoflat maps ([KL II] Rem. 2.4.5, p. 37). Check: `ℚ_p⟨T⟩/(T)` is
not pseudoflat over `ℚ_p⟨T⟩`. Lean: `Huber.IsPseudoFlat`; rest README.
(*restricted-power-series-pro-projective*) `A⟨T⟩`, `A⟨T^{±1}⟩` are pro-projective by truncation,
also after completed base change ([KL II] Def. 2.4.6, p. 37); for pro-projective `B` and strictly
2-pc `M`, `M ⊗ B` is complete and `Tor₁^A(M, B) = 0` ([KL II] Lem. 2.4.7, p. 37; Cor. 2.4.8, p. 38);
for naturally complete finite (finitely presented) `M`, `M ⊗ A⟨T⟩ → M⟨T⟩` and its Laurent analogue
are onto (bijective) ([KL II] Cor. 2.4.9, p. 38; noetherian case Wedhorn 8.29). Check: Hausdorffness
is needed, as zero projectors on an indiscrete `ℚ_p⟨T⟩/(T)` would qualify.

**Simple Laurent coverings.** (*simple-laurent-strict-multiplication*) For a sheafy complete Tate
pair `(A, A⁺)`, any `f ∈ A` and `U₁ = {v(f) ≤ 1}`, `U₂ = {v(f) ≥ 1}` with rings `B₁, B₂, B₁₂`,
multiplication by `T − f` and `1 − fT` is strictly injective on `A⟨T⟩`, `A⟨T^{±1}⟩`, so
`B₁ = A⟨T⟩/(T − f)`, `B₂ = A⟨T⟩/(1 − fT)`, `B₁₂ = A⟨T^{±1}⟩/(T − f)` with no closure ([KL II] §2.4,
Lem. 2.4.10, p. 38; [KL II] §1.2, Rem. 1.2.8, p. 15; [KL I] §2.4, Lem. 2.4.13(a), p. 42); for
`f = 1/p ∈ ℚ_p`, `B₁ = 0`. (*simple-laurent-pseudoflat*) `A → B₂` ([KL II] Lem. 2.4.12, p. 39),
`A → B₁`, `A → B₁₂` ([KL II] Lem. 2.4.13, pp. 39–40) are 2-pseudoflat; flat if `A` is strongly
noetherian ([KL II] §2.2, Lem. 2.2.6, p. 32).

**Rational localisations are 2-pseudoflat.** (*rational-inclusion-reduction*) For a Tate ring `A`,
not necessarily complete, and any subring `A⁺`, a transitive property of inclusions `V ⊆ U` of
rational subsets of `Spa(A, A⁺)` holding for `V = {v ∈ U : v(h) ≤ 1}` and `{v(h) ≥ 1}` (`h = t/sⁿ`
suffices) holds for all ([KL I] §2.4, Prop. 2.4.24, p. 47; inclusion form of AdicSpacesPartIII R3's
*rational-covering-reduction*). (*rational-localisation-pseudoflat*) Hence rational localisations
of a sheafy complete Tate pair are 2-pseudoflat, and for `m ∈ {2, ∞}` base change to them preserves
stable m-pc and is exact on stably m-pc modules ([KL II] §2.4, Thm. 2.4.15, p. 40), replacing
flatness, unknown non-noetherianly ([KL II] §2.2, Rem. 2.2.8, p. 32); for strongly noetherian `A`
it is flatness (Wedhorn 8.30). Lean: `Huber.isPseudoFlat_ratLoc`; rest README.

**Tate acyclicity and locality of fpd.** (*pseudocoherent-tate-acyclicity*) For `(A, A⁺)` sheafy
complete Tate and `M` stably pc, the augmented Čech complex of `U ↦ M ⊗_A O(U)` for any finite
rational covering of a rational `U` is exact ([KL II] §2.5, Thm. 2.5.1 and its proof, p. 41);
`M = A` and finite projective `M` are AdicSpacesPartIII R3 (*sheafy-cech-acyclicity*,
*finite-projective-module-acyclicity*). (*fpd-local-to-global*) If moreover every `M ⊗_A O(V)` on a
finite rational covering is m-fpd, `M` is m-fpd; `m = 0` gives locality of finite projectivity ([KL
II] §2.5, Cor. 2.5.2, p. 41). Lean: `Huber.cech_injective_of_isStablyPseudoCoherent` (degree 0),
`Huber.IsStablyPseudoCoherent.isFPD_of_cover`; rest README.

**Pseudocoherent and fpd sheaves.** (*pseudocoherent-sheaf*) On an adic space covered by sheafy
complete Tate affinoids, an `O_X`-module (analytic topology) is *pc* (*fpd*) if locally `M̃` for a
stably (not strictly) pc (stably fpd) `M` ([KL II] §2.5, Def. 2.5.3, p. 41); `M̃` qualifies, and
the class is stable under restriction, kernels of surjections, cokernels of injections with closed
images on rational sections, and fpd ⟹ pc; [FS] §IV.4.1, Prop. IV.4.19, p. 140, uses it for ideal
sheaves. Checks: `j_*O_U` for `U = {|T| ≤ |p|}` in `Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` is not pc; nor is the
cokernel of `×x` on `Spa(C(ℤ_p, ℚ_p), C(ℤ_p, ℤ_p))`.

**Descent and Kiehl gluing.** (*simple-laurent-pseudocoherent-descent*) For a simple Laurent cover
of a sheafy complete Tate pair, `A → B₁ ⊕ B₂` is effective descent for stably pc (stably fpd)
modules, `(M₁, M₂, ψ)` descending to `ker(M₁ ⊕ M₂ → M₂ ⊗ B₁₂)` ([KL II] §2.5, Lem. 2.5.4,
pp. 41–42; [KL I] §2.7, Lem. 2.7.4, p. 57). (*pseudocoherent-kiehl-gluing*) Hence, for `(A, A⁺)`
sheafy complete Tate: (a) global sections are an exact equivalence from pc (fpd) sheaves on
`Spa(A, A⁺)` to stably pc (stably fpd) modules, inverse `M ↦ M̃` ([KL II] §2.5, Thm. 2.5.5, p. 42);
(b) along a map of such pairs inducing an open immersion, base extension is exact on them,
`M ⊗_A B = M̃(Spa(B, B⁺))` and `B` is pseudoflat ([KL II] Cor. 2.5.6, p. 43; projective case [KL I]
§2.7, Thm. 2.7.7, p. 58). For strongly noetherian `A` this is Kiehl's theorem (AdicSpacesPartIII
R3). Lean: `Huber.exact_tensor_ratLoc` (exactness in (b) for rational localisations); rest README.

### A3.2 standard étale presentations and the implicit function theorem

**Newton–Hensel for restricted power series.** (*restricted-power-series-newton*) Let `C` be
complete Hausdorff Tate, `C₀ ∋ ϖ` a ring of definition, `F ∈ C₀⟨T₁, …, T_N⟩^N`, `t ∈ C₀^N`, and
`M ∈ M_N(C₀)` with `M·J(t) = J(t)·M = ϖᵏ` and `F(t) ∈ ϖ^{2k+1}C₀^N`. Then `F` has a unique zero
`t* ∈ t + ϖ^{k+1}C₀^N`; if `F(t) ∈ ϖ^e C₀^N`, `e ≥ 2k + 1`, then `t* − t ∈ ϖ^{e−k}C₀^N` and
`ϖᵏJ(t*)^{−1}` is integral; `t*` is functorial in continuous `φ` with `φ(C₀) ⊆ C'₀` and lies in
`C₀⟨S⟩^N` with parameters; any characteristic (Hasse derivatives). This quantifies [H96] §1.7,
Prop. 1.7.1, proof (1), pp. 81–82 (cf. [ECD] §6, proof of Prop. 6.4(iv), p. 28; [FS] §IV.4.1, proof
of Lem. IV.4.16, p. 139). Check: over `ℚ_2`, `T² − a` from `t = 1` needs `k = 1` and `a ≡ 1 mod 8`.

**Perturbing generators.** (*perturbation-of-generators*) Over a complete Tate pair with ring of
definition `A₀ ∋ ϖ`, `X ↦ X + ε(X)` (`ε ∈ ϖA₀⟨X⟩ⁿ`) is an automorphism of `A⟨X₁, …, Xₙ⟩` of the
same form, preserving `A₀⟨X⟩`, `A⁺⟨X⟩`; so a quotient mapping `π` can be moved to send `X` to any
`c' ≡ π(X) mod ϖπ(A₀⟨X⟩)`, its kernel becoming the closure of the inverse (not forward) substitutes
of the equations, with Jacobian changed by a unit `≡ 1 mod ϖ`. Noetherian case: [H96] §1.7,
Prop. 1.7.1, proof (3), p. 83 (AdicSpacesPartII R0, *etale-local-structure*). Check: the dilation
`X ↦ ϖX` is no automorphism.

**Standard étale presentations.** (*standard-etale-presentation*) Over a complete Tate pair
`(A, A⁺)` with pseudouniformiser `ϖ`, a presentation of a complete pair `(C, C⁺)` is
`(N, F, k, π)`: `F ∈ A⁺⟨T₁, …, T_N⟩^N`, `π : (A⟨T⟩, A⁺⟨T⟩) → (C, C⁺)` surjective with kernel
`closure(F)`, quotient topology and `C⁺` the integral closure of the image, and `J_F = det(∂F/∂T)`
a unit of `C` with `ϖᵏπ(J_F)^{−1} ∈ C⁺` ([H96] §1.7, Prop. 1.7.1, p. 80; [ECD] §6, proof of
Prop. 6.4(iv), p. 28; [KL I] §2.4, Lem. 2.4.13(a), p. 42); `V(F) = Spa(C, C⁺)` lies in the relative
polydisc `B^N_X`. The explicit-inverse form `(F', S·J_{F'} − ϖ^{k'})`, with `J_F = J_{F'}²`,
`k = 2k'`, is always reachable and presents its quotient for any `F'`; presentations base change
(AdicSpacesPartII R0). Checks: `T^p − a` in characteristic `p` has `J_F = 0` (Artin–Schreier
`T^p − T − u` has `−1`); `A × A = A⟨T⟩/(T² − T)` has `k = 0` in every characteristic. Lean:
`Huber.tateSeries`, `Huber.tateSeries.X`, `Huber.tateSeriesPlus`, `Huber.StandardEtalePresentation`;
rest README.

**Basic pieces.** (*standard-presentation-basic-pieces*) (a) For `s₁, …, sₙ, t ∈ A⁺` with `ϖ^c`
among the `sᵢ`, `A⟨s/t⟩` is presented by `(n, (tTᵢ − sᵢ), cn)` ([KL I] §2.4, Lem. 2.4.13(a), p. 42);
(b) finite étale algebras with integral-closure plus ring (layer A1,
*finite-etale-affinoid-algebra*) are presented, perfectoid over perfectoid `A` ([ECD] §6, Thm.
6.1(i), p. 26); (c) composites of presentations are presented; (d) so are rational subsets of
presented loci and composites of rational and finite étale maps ([ECD] §6, proof of Prop. 6.4(ii),
p. 28). Lean: `Huber.StandardEtalePresentation.nonempty_ratLocPair` (a),
`Huber.StandardEtalePresentation.nonempty_of_finiteEtale` (b); rest README.

**Tubular neighbourhoods.** (*tubular-neighbourhood*) Let `A` be sousperfectoid (AdicSpacesPartIV
R5), `e ∈ A⁺⟨T₁, …, T_N⟩^N`, `k ≥ 0`, `m ≥ 2k + 1`, `R ⊆ B^N_X` an intersection of `R(g_j/h_j)` with
integral data and `ϖ^{c_j}` in their ideal, `c_j < m − k`, `Δ = det(∂e/∂T)`,
`W = R ∩ {|eᵢ| ≤ |ϖ^m|} ∩ {|ϖᵏ| ≤ |Δ|}` and `C = O(W)/closure(e)`. (a) A unique isomorphism
`C⟨u₁, …, u_N⟩ ≅ O(W)` over `A`, `uᵢ ↦ ϖ^{−m}eᵢ`, restricts to a section `ρ` of `q : O(W) → C`
with `ρ(q(T)) − T ∈ ϖ^{m−k}O⁺(W)^N`; (b) likewise over `W' ⊆ W` pulled back from `V(e) ∩ W` or
equal to `W ∩ R'`, not over arbitrary rational `W'` (`{|T| ≤ |p|²}` for `e = T` over `ℚ_p`);
(c) `e·O(W')` is closed and `O(W')/(e) = C ⊗̂_{O(W)} O(W')` for all rational `W' ⊆ W`. Integrality
of `e` in `T` is needed (`e = (T/p)²` fails). Replaces [FS] §IV.4.1, before Lem. IV.4.14, p. 137,
and proof of Lem. IV.4.16, p. 139.

**Perturbation stability.** (*standard-presentation-perturbation*) For a presentation in
explicit-inverse form with exponent `k` over a sousperfectoid base, `m₀ = 4k + 2` and
`G ≡ F mod ϖ^{m₀}`: `G` presents `C_G = A⟨T⟩/closure(G)` with exponent `2k`; a unique
`α_{F,G} : (C, C⁺) ≅ (C_G, C_G⁺)` over `(A, A⁺)` has `α(π(T)) − π_G(T) ∈ ϖ^{m₀−2k}`, unique even
among continuous maps; for `G` in explicit-inverse form `α_{G,F} = α_{F,G}^{−1}`, cocycles hold and
`α` commutes with base change. Noetherian case: [H96] §1.7, Cor. 1.7.2(i), p. 85
(AdicSpacesPartII R0, *etale-presentation-perturbation*); cf. [ECD] §6, proof of Prop. 6.4(iv),
p. 28. Check: `T − a` perturbed to `T − a'`, `a ≡ a' mod ϖ²`, gives the identity of `A`.

**Loci over sousperfectoid bases.** (*standard-etale-locus-sousperfectoid*) Over a sousperfectoid
base a presented `C` is a direct summand of `O(W)` through the tube section, hence sousperfectoid,
sheafy and stably uniform, with presented rational localisations (étale case of [FS] §IV.4.1,
Prop. IV.4.17, p. 139). (*fs-iv-4-13-regular-sequence*) On every rational `W' ⊆ W` the `eᵢ` form a
weakly regular sequence with closed ideal, `O(W')/(e) ≅ O(V(e) ∩ W')`, `(e)/(e)²` is free, and
`O(W)/(e)` is stably N-fpd, `(e)` stably (N−1)-fpd for `N ≥ 1` (étale case of [FS] §IV.4.1,
Lem. IV.4.13, p. 137, without diamond-level spreading).

### A3.3 the Fargues–Scholze specialisations by analytic algebra

**Base fields in characteristic `p`.** (*char-p-perfectoid-base-field*) For a perfectoid Tate pair
`(R, R⁺)` of characteristic `p` with pseudouniformiser `ϖ` and `K = F_p((t^{1/p^∞}))^∧`, a unique
continuous `K → R` sends `t^{1/pⁿ} ↦ ϖ^{1/pⁿ}` and `K°` into `R⁺`; `(R, R⁺)` is a completed colimit
of `p`-finite perfectoid `K`-algebras, completed perfections of reduced topologically finite type
`S_α`, with `R⁺/ϖ^M = colim S_α^{+,1/p^r}/ϖ^M` ([PS] §6, Lem. 6.13(i), p. 37; Def. 6.9, p. 35).

**Jacobian criterion in characteristic `p`.** (*jacobian-criterion-char-p*) For perfectoid
`(A, A⁺)` of characteristic `p`, `(B, B⁺) = O(Q)` for rational `Q ⊆ B^m_X` and `(C, C⁺)` presented
over it, `Spa(C) → Spa(B)` is étale by local description (layer A1,
*etale-morphisms-local-description-and-comparison*); for `m = 0`, `C` is perfectoid and étale in
the sense of [ECD] Def. 6.2; maps of rational subsets of `B^n_X` with unit Jacobian are étale ([FS]
§IV.4.1, Prop. IV.4.15(ii), p. 138; Prop. IV.4.17, p. 139). Proof: noetherian approximation and
perturbation as in [PS] §7, Prop. 7.7, p. 41, avoiding [ECD] Lem. 12.17.

**Integral cut-offs and graphs.** (*integral-cutoff-graph-presentation*) Let `A` be sousperfectoid,
`R ⊆ B^N_X` rational, `(C, C⁺)` presented in variables `v`, `g : Spa(C, C⁺) → R` over `X`, and
`w_l ∈ O(R)`, monic `P_l ∈ O⁺(R)[Z]`, `M ≥ 1` with `g*(w_l) − π_v(v_l) ∈ ϖπ_v(A₀⟨v⟩)` and
`g*(P_l(w_l)) ∈ ϖ^{M+1}C⁺`. Then `R'' = R ∩ ⋂_l {|P_l(w_l)| ≤ |ϖ^M|}` and the
`Q_l = R ∩ {|P_l(w_l)| ≥ |ϖ^M|}` cover `R`, `g` lands in `R''`, `w_l ∈ O⁺(R'')`, `O(R'') → C` and
its rational restrictions are quotient mappings (surjective, open, plus ring the integral closure of
the image; [FS] §IV.4.1, Prop. IV.4.19(i), p. 140), `C` and the kernel are stably pc ([KL II] §1.1,
Rem. 1.1.13, p. 14) and the ideal sheaf is pc ([KL I] §2.4, Lem. 2.4.13(a), p. 42; replaces [FS]
proof of Prop. IV.4.19, p. 140). Check: `(K, K⁺₁) → (K, K⁺₂)`, `K⁺₁ ⊊ K⁺₂`, is no quotient mapping.

**Zariski closed immersions.** (*fs-iv-4-19-zariski-closed-char-p*) For a perfectoid pair `(A, A⁺)`
of any characteristic, `Y' ⊆ B^N_X` a finite union of rational subsets and `g : Y → Y'` over `X`
with `Y` affinoid perfectoid étale over `X`: `Y'` has a rational cover with `O(V') → O(g⁻¹V')`
quotient mappings iff every rational `V'` has this ([FS] §IV.4.1, Prop. IV.4.19(i), p. 140); then
`g` is Zariski closed ([FS] Def. IV.4.20, p. 141), its ideal sheaf `I` is pc and
`O(V')/I(V') ≅ O(g⁻¹V')` with integral-closure plus ring ([FS] Prop. IV.4.19, p. 140).

**Standard rational covers.** (*etale-standard-piece-cover*) For `Y = Spa(B, B⁺) → X` étale between
affinoid perfectoid spaces ([ECD] §6, Def. 6.2(ii), p. 26), unit-ideal `σ₁, …, σ_m ∈ B` make every
`Y(σ/σ_j)` a rational subset of some finite étale `W_j → U_j ⊆ X`, hence presented ([ECD] §6, proof
of Prop. 6.4(ii), p. 28; remark after Def. 6.2, p. 26). Check: `X' ⊔ X''` uses `σ = (e, 1 − e)`.

### A3.4 the closed embedding of an affinoid étale object

**Integral approximation.** (*integral-approximation-of-generators*) For a complete Tate pair
`(B, B⁺)`, `V = Y(σ/σ_j)`, `ū ∈ O⁺(V)` and `M ≥ 0`, some `z ≡ ū mod ϖ^M O⁺(V)` of the form
`b/σ_j^s` is a root of a monic polynomial with coefficients in `ℤ[β₁, …, β_r][σ/σ_j]`, `β ∈ B⁺`
([KL I] §2.4, Lem. 2.4.13(a), p. 42); uniformity is not needed.

**Closed embedding into a ball.** (*affinoid-etale-zariski-closed-embedding*) For perfectoid
`(A, A⁺)` of any characteristic and `Y = Spa(B, B⁺) → X` étale affinoid perfectoid, some
`b ∈ (B⁺)^N` (and any enlargement) makes `A⟨T₁, …, T_N⟩ → B`, `T ↦ b`, a quotient mapping with
stably pc kernel `I`, pc ideal sheaf and `O(V')/I·O(V') ≅ O(g_b⁻¹V')` for rational `V'`; asserted
in [ECD] §6, proof of Prop. 6.4(iv), p. 28 (cf. [KL I] §2.4, after Def. 2.4.12, p. 41), built from
the two previous targets and an integral cut-off cover. Check: `X(s/t)` uses `b = (sᵢ/t)`.

**Conormal module and local equations.** (*conormal-description*) For such `g : Y → U ⊆ B^N_X`,
rational `V' ⊆ U`, `V = g⁻¹V'`, `I = ker(O(V') → O(V))`: `Ω^c_{O(V)/A} = 0` and
`I/I² → ⊕ O(V)·dTᵢ`, `e ↦ Σ ∂e/∂Tᵢ dTᵢ`, is an isomorphism ([ECD] §6, proof of Prop. 6.4(iv),
p. 28), with no Tor-independence (`(T₁, T₂) ⊆ ℂ_p⟨T₁, T₂⟩` has `Tor₁(R/I, I) ≠ 0`).
(*local-equations-near-closed-subspace*) For `V' = B^N_X`, some `eᵢ ∈ I` have identity Jacobian on
`Y`, and for `ϖ^a e` integral a rational `W ⊇ g(Y)` in the tube of `ϖ^a e` (`k = aN`) has `e·O(W)`
closed and `O(W)/(e) ≅ O(Y)`, by an idempotent cut-off replacing [FS] §IV.4.1, proof of
Prop. IV.4.19, p. 140.

**Global presentations.** (*global-standard-etale-presentation*) Every étale `Y = Spa(B, B⁺) → X` of
affinoid perfectoid spaces has a standard étale presentation, in explicit-inverse form; in
characteristic `p` presented loci are conversely étale affinoid perfectoid ([H96] §1.7, Prop. 1.7.1,
p. 80, for perfectoid spaces; [ECD] §6, proof of Prop. 6.4(iv), p. 28).

### A3.5 finite-stage approximation and Scholze's Lemma 6.4(iv)

**Approximation at a finite stage.** (*cofiltered-limit-presentation-approximation*) For
`X = lim X_i` as in PerfectoidSpaces P5, `R⁺⟨T⟩/ϖ^M = colim (R_i⁺/ϖ^M)[T]`, so finitely many series
and rational data are approximated mod `ϖ^M` at some stage (same rational subset for large `M`), and
a presentation over `R_i` base changes to one of `C_i ⊗̂_{R_i} R`, `Y_i ×_{X_i} X` being its `Spa`
([ECD] §6, Prop. 6.4 set-up, p. 27; proof of Prop. 6.5, p. 29).

**Finite-stage descent in characteristic `p`.** (*finite-stage-approximation-char-p*) For a
cofiltered system of affinoid perfectoid spaces of characteristic `p` and affinoid étale `Y → X`,
some affinoid étale `Y_i → X_i` has `Y_i ×_{X_i} X ≅ Y`: approximate `F'` mod `ϖ^{4k+2}` and rebuild
`F_i = (F'_i, S·J_{F'_i} − ϖᵏ)`, which forces `|J_{F'_i}| ≥ |ϖᵏ|` on all of `V(F_i)`, then compare
by perturbation ([ECD] §6, proof of Prop. 6.4(iv), p. 28). Check: `X(s/t)` gives `X_i(s_i/t_i)`.

**Lemma 6.4(iv).** (*independence-of-presentations*) Two affinoid étale models of `Y` become
isomorphic over some `X_j` compatibly with the given identifications, uniquely in the colimit, and
agree with PerfectoidSpaces P5's qcqs descent ([ECD] §6, proofs of Prop. 6.4(ii) and (iv), p. 28).
(*affinoid-etale-finite-stage-6-4-iv*) For a small cofiltered system of affinoid perfectoid `X_i` of
any characteristic, `2-colim_i (X_i)_{ét,aff} → X_{ét,aff}` is an equivalence, by tilting
(PerfectoidSpaces P3 *etale-site-tilting-equivalence*, P5 *completed-colimit-is-perfectoid*) to
the previous target ([ECD] §6, Prop. 6.4(iv), p. 27, sketch p. 28). Used in [ECD] §7, proofs of
Lem. 7.18, p. 37, and Lem. 7.11(i), p. 33.

**Proposition 6.4 assembled.** (*etale-descent-to-finite-stage-6-4*) With (o)–(iii) and
`κ`-smallness of [ECD] §6, Prop. 6.4, p. 27 (`κ` as in [ECD] Lem. 4.1) from PerfectoidSpaces P5,
the four equivalences commute with `X_{fét} ⊆ X_{ét,aff} ⊆ X_{ét,qc,sep} ⊆ X_{ét,qcqs}` (cited by
PerfectoidSpaces P6, *affinoid-etale-finite-stage-assembly*).

**Strong Zariski closedness.** (*zariski-closed-immersion-ecd-comparison*) In characteristic `p` the
embedding into `B^N_X` composed into the perfectoid ball `Spa(A⟨T^{1/p^∞}⟩, A⁺⟨T^{1/p^∞}⟩)` is
strongly Zariski closed ([ECD] §5, Def. 5.7(ii), p. 24): surjective with integral-closure plus ring,
and almost surjective on plus rings as the integrally closed image is perfect; [ECD] Thm. 5.8 is
not used. Check: `𝔽₂ + tB ⊆ 𝔽₂[t^{1/2^∞}] = B` lacks `t^{1/2}`.

### Examples

- `Y = X(s/t)`: embedding `Tᵢ ↦ sᵢ/t`, ideal `closure(tTᵢ − sᵢ)`, model `X_i(s_i/t_i)`; finite
  étale `Y`: model from an approximated monic presentation, as in [ECD] 6.4(i).
- Tube of `T − a`: `{|T − a| ≤ |ϖ|} ≅ B¹(|ϖ|)`; over `ℚ_p⟨T⟩` pc is coherent, pseudoflat is flat.
- Non-examples: `R/xR` over `k[x, y₁, …]/(x·yᵢ)`; [KL II] Ex. 2.4.2; `ℚ_p⟨T⟩/(T)`; `j_*O_U`;
  `X ↦ ϖX`; `T^p − a` in characteristic `p`; the non-integral `(T/p)²`.

### Dependencies

- Layer A1 (étale by local description, finite étale affinoid algebras); PerfectoidSpaces P1–P3,
  P2 ([PS] Lem. 6.13), P5 ([ECD] 6.4(o)–(iii); this layer owns 6.4(iv)).
- AdicSpacesPartII R0 (completed tensor products, differentials, Huber's noetherian étale theory);
  AdicSpacesPartIII R3 (Tate acyclicity, glueing squares, Kiehl gluing); AdicSpacesPartIV R5
  (sousperfectoid rings and spaces); AdicSpaces layers 0–5.
- Not inputs: [ECD] 5.8, 11.30, 15.6 (DiamondsAndVStacks D6); [FS] IV.4.13–IV.4.19 in general
  form; [KL II] Rem. 2.4.3; Kedlaya–Liu's open points (flatness of rational localisations).

## Layer A4: analytic adic presentations for diamondification

This layer is the analytic half of [ECD] §15. Throughout, `p` is a prime, *complete* means complete
Hausdorff, `FÉt(R)` denotes finite étale `R`-algebras (Mathlib `Algebra.Etale`, `Module.Finite`) and
`(A, A⁺)` is never assumed sheafy. Over a complete Tate ring `A` it builds a tower of finite étale
torsors whose colimit has no nonsplit finite étale covers (A4.1–A4.3), shows uniformization changes
neither spectra nor finite étale algebras (A4.4), completes the tower keeping its finite étale data
(A4.5), proves the completion perfectoid ([ECD] §15, Lem. 15.3, p. 90; A4.6), computes its `Spa`
(A4.7) and builds the perfectoid torsor presentation handed to DiamondsAndVStacks D6 (A4.8–A4.9).

### A4.1 rings without nonsplit finite étale covers

**Rings with no nonsplit finite étale covers.** (*finite-etale-split-ring*) A finite étale algebra
`T` over a commutative ring `R` (no topology) is totally split if `T ≅ ∏_{j=1}^m R/(1 − e_j)` for
idempotents `e_j`, `m ≥ 0` (ranks may vary, unlike Mathlib's `Algebra.IsFiniteSplit`); `R` is
*split* (has no nonsplit finite étale covers) if every such `T` is, equivalently every faithfully
flat `T` has a section `T → R` (over `R ≠ 0` the zero algebra has none). Then monic `P` of degree
`≥ 1` with `P′` a unit mod `P` have roots; a field is split iff `IsSepClosed`; splitness transfers
along base-change equivalences `FÉt(R) ≅ FÉt(R′)`, passes to finite products and holds for the zero
ring and locally constant maps from a profinite set to a separably closed field; totally split
algebras pass to idempotent quotients and finite étale direct factors ([ECD] §15, Lem. 15.3, p. 90;
[Berkeley] Lecture 10, Lem. 10.1.6, p. 75). `ℚ_p` is not split (`X² − p`). Lean:
`Algebra.IsTotallySplit`, `IsFiniteEtaleSplit`, `isFiniteEtaleSplit_iff_exists_section`,
`IsFiniteEtaleSplit.exists_root`, `isFiniteEtaleSplit_iff_isSepClosed`; rest README.

### A4.2 finite étale torsors

**Finite étale `G`-torsors.** (*finite-etale-galois-torsor*) A finite group `G` acting on the left
on a commutative `A`-algebra `B` by `A`-automorphisms makes `B` a finite étale `G`-torsor if `B` is
finite étale, faithfully flat and `B ⊗_A B → ∏_{g∈G} B`, `b ⊗ b′ ↦ (g ↦ b·g(b′))`, is bijective.
Then `B` has constant rank `|G|`, `B^G = A`, `B^{⊗(k+1)} ≅ Map(G^k, B)`, and `G` is a Galois group
if `A ≠ 0` (over `A = 0`, `B = 0` is a torsor for every `G`); torsors are stable under base change
and products, an equivariant map `B → B′` of torsors along `G′ ↠ G` makes `B′` a torsor over `B`
under the kernel; for fields `L/K` it means Galois with `G ≅ Gal(L/K)` ([ECD] §15, Lem. 15.3, p. 90,
and proof of Prop. 15.4, p. 91; [Berkeley] Lecture 10, proof of Lem. 10.1.6, p. 75). Conjugation:
`ℤ[1/2][i]` is a torsor over `ℤ[1/2]`, `ℤ[i]` not over `ℤ`. Lean: `Algebra.galoisTensorMap`,
`Algebra.IsFiniteEtaleTorsor`, `Algebra.IsFiniteEtaleTorsor.iff_isGalois`; rest README.

### A4.3 the finite étale torsor tower

**Colimits and splitting torsors.** (*finite-etale-algebras-filtered-colimit*) For a nonempty
directed system of rings `R_i`, base change is an equivalence `2-colim FÉt(R_i) ≅ FÉt(colim R_i)`;
faithful flatness, sections and splittings descend to a finite level ([KL I] §1.2, Rem. 1.2.9,
p. 15); the empty colimit is `ℤ`, and `ℤ × ℤ` comes from no stage.
(*splitting-torsor-of-finite-etale-algebra*) For finite étale `S` over a ring `A`, `S ⊗_A P` is
totally split for some finite étale `S_n`-torsor `A → P`, `n` the maximal rank of `S` ([Stacks]
Tag 0BN2, Lem. 58.3.8; [KL I] §1.4, Rem. 1.4.7(c), p. 22; [ECD] §15, proof of Lem. 15.3, p. 90); for
`ℚ(∛2)/ℚ`, `P = ℚ(∛2, ζ_3)`. Lean: `Algebra.exists_isFiniteEtaleTorsor_isTotallySplit`; rest README.

**The finite étale torsor tower.** (*finite-etale-torsor-tower*) Over any commutative ring `A`, a
finite étale torsor tower is a nonempty directed system of finite étale `G_i`-torsors `A_i` with
surjections `G_j → G_i` and equivariant maps `A_i → A_j` whose colimit `A_∞` is split. Every ring
has one; `G = lim G_i` acts on `A_∞` with open stabilisers, `A_∞^G = A`, `A_∞ ⊗_A A_∞ ≅ LC(G, A_∞)`;
each finite étale `A`-algebra splits over some `A_i`; transitions are torsors under the kernels
([ECD] §15, Lem. 15.3, p. 90; [Berkeley] Lecture 10, proof of Lem. 10.1.6, p. 75). The cyclotomic
system over `ℚ_p` is not a tower. Lean: `FiniteEtaleTorsorTower`, `FiniteEtaleTorsorTower.colim`,
`FiniteEtaleTorsorTower.nonempty_tower`, `FiniteEtaleTorsorTower.exists_level_totallySplit`; rest
README.

### A4.4 uniformization does not change spectra or finite étale algebras

**Invariance under uniformization.** (*uniform-completion-etale-comparison*) For `A` complete Tate,
any `A⁺` and the uniformization `ι : (A, A⁺) → (A^u, A^{u+})` (AdicSpacesPartII R0 *uniformization*;
[KL I] §2.8, Def. 2.8.13, p. 63), `Spa(ι)` is a homeomorphism matching rational subsets; base change
gives `FÉt(A) ≅ FÉt(A^u)` ([KL I] §2.8, Prop. 2.8.16(a), p. 64) under which `B ⊗_A A^u`, with the
integral closure of `A^{u+}`, uniformizes `(B, B⁺)` ([KL I] §2.8, Prop. 2.8.16(b), pp. 64–65); so
`A` is split iff `A^u` is ([ECD] §15, Lem. 15.3, p. 90). Completeness matters: finite étale
`ℚ_p⟨T⟩[X]/(X^p − X − T/p)` splits at `T = 0`, is inert at `T = p`, so is not from `ℚ_p[T]`.

### A4.5 the completed tower and its finite étale data

**The completed torsor tower.** (*completed-tower-pair*) For complete Tate `(A, A⁺)`, a
pseudouniformizer `ϖ` and a tower, levels are A1 pairs (*finite-etale-affinoid-algebra*);
`(A_∞, colim A_i⁺)` with `colim A_i°` open and `ϖ`-adic is a uniform Tate pair; its completion
`(Â_∞, Â_∞⁺)` (`Â_∞⁺` the closure of `colim A_i⁺`) is complete uniform (`ℂ_p` over `ℚ_p`) with
continuous `G`-action, universal for compatible level maps to complete pairs with bounded `B°`
([Berkeley] Lecture 10, Lem. 10.1.6, p. 75; [ECD] §15, Lem. 15.3 and Prop. 15.4, p. 90).

**Henselian rings of definition.** (*henselian-pairs-filtered-colimit*) Nonempty directed colimits
of henselian pairs are henselian ([Stacks] Tag 0FWT, Lemma 15.11.13).
(*power-bounded-henselian-along-pseudouniformizer*) For `A` complete Tate with pseudouniformizer
`ϖ`, rings of definition containing `ϖ` are `ϖ`-adically complete, so henselian along `ϖ` ([Wedhorn]
§6.2, Prop. 6.14, p. 49), hence so are `A°` and its open subrings containing `ϖ`, directed unions of
them ([Wedhorn] §6.1, Cor. 6.4(3), p. 47); for non-complete `ℚ_p[T]`, `(ℤ_p[T], p)` is not
henselian. Lean: `Huber.henselianRing_powerBoundedSubring`; rest README.

**Finite étale data.** (*finite-etale-invariance-along-tower*) For `A` complete Tate and any tower,
`Â_∞` is split and base change gives `2-colim FÉt(A_i) ≅ FÉt(A_∞) ≅ FÉt(Â_∞)` and, for `k ≥ 0`,
`2-colim FÉt(Map(G_i^k, A_i)) ≅ FÉt(C^0(G^k, Â_∞))` ([Berkeley] Lecture 7, Thm. 7.4.8, p. 54;
PerfectoidSpaces P3; [ECD] §15, proof of Lem. 15.6, p. 91, citing [PS] §7, Lem. 7.5(i), pp. 40–41).
(*finite-etale-effective-descent-along-tower*) Base change identifies `FÉt(A)` with finite étale
`Â_∞`-algebras with continuous semilinear `G`-action (ibid.; [KL I] §1.3, Thms. 1.3.4–1.3.5, p. 16).

### A4.6 perfectoidness

**The Frobenius argument.** Three steps of the proof of [ECD] §15, Lem. 15.3, p. 90 (the first two
also [Berkeley] Lecture 10, proof of Lem. 10.1.6, p. 75). (*root-of-monic-in-split-tate-ring*) Over
a complete split Tate ring `R`, a monic `P ∈ R°[X]` of degree `≥ 1` with `P′ ≡ u(1 − τ)` mod `P`,
`u ∈ R^×`, `τ` topologically nilpotent in `R[X]/(P)`, has a root, lying in `R°`.
(*pseudouniformizer-dividing-p*) If also `p` is topologically nilpotent, `ϖ_0` a pseudouniformizer,
`p^n ∈ ϖ_0R°` and `p^{n−1} > n`, every root `ϖ` of `X^{p^n} − ϖ_0X − ϖ_0` (one exists) is a
pseudouniformizer with `ϖ^p | p` in `R°` and `p/ϖ^p` topologically nilpotent; [ECD]'s `p^{n−1} ≥ n`
fails for `X⁴ − 4X − 4` over `ℂ_2`. (*frobenius-surjective-for-split-tate-ring*) For any
pseudouniformizer `ϖ` with these two properties, `Φ : R°/ϖ → R°/ϖ^p` is surjective; without `p/ϖ^p`
topologically nilpotent (`ϖ = p^{1/p}` over `ℚ_p(p^{1/p^∞})^∧`), `X^p − pX + p − 1` has a double
root, a gap in [ECD]'s proof. Lean: `Huber.exists_isPseudoUniformizer_pow_dvd_p`; rest README.

**Perfectoidness.** (*split-tate-ring-is-perfectoid*) A complete uniform split Tate ring with `p`
topologically nilpotent is perfectoid (P1; [ECD] §3, Def. 3.1 and Rem. 3.2, p. 14;
[Berkeley] Lecture 10, proof of Lem. 10.1.6, p. 75); `ℚ̄_p` (not complete) and `ℂ_p⟨T⟩` (not split)
show both are needed. (*perfectoid-uniform-completion*) So for `A` complete Tate with `p`
topologically nilpotent, any `A⁺` and any tower, `(Â_∞, Â_∞⁺)` is perfectoid with continuous
`G`-action ([ECD] §15, Lem. 15.3, p. 90, completeness added; [Berkeley] Lecture 10, Lem. 10.1.6,
p. 75); over non-complete `ℚ_p[T]` this fails (`T` is no `p`-th power mod `p`). Lean:
`Huber.isPerfectoid_of_isFiniteEtaleSplit` (its conclusion is PerfectoidSpaces' `Perfectoid.IsPerfectoidTateRing`); rest README.

### A4.7 adic spectra of the tower

**The adic spectrum of a torsor is a `G`-quotient.** (*torsor-spa-orbits*) For `A` complete Tate,
any `A⁺` and a finite étale `G`-torsor `A → B` with its A1 pair, `G` acting by `(g·y)(b) = y(g⁻¹b)`,
the map `Spa(B, B⁺) → Spa(A, A⁺)` is open and surjective with fibres the `G`-orbits ([ECD] §15,
proof of Prop. 15.4, p. 91; [KL I] §9.1, proof of Lem. 9.1.9, p. 191; [H94] §3, proof of
Lem. 3.9(i), p. 538, used in [PS] §7, proof of Lem. 7.3, p. 40). Lean:
`ValuationSpectrum.spaComap_orbits_of_isFiniteEtaleTorsor`.

**The completed tower.** (*spa-of-completed-tower*) For `A` complete Tate and any tower,
`|Spa(Â_∞, Â_∞⁺)| ≅ lim |Spa(A_i, A_i⁺)|` with rational subsets from finite levels, and the map to
`Spa(A, A⁺)` is open and surjective with fibres the `G`-orbits ([ECD] §15, proof of Prop. 15.4,
p. 91; [KL I] §2.6, Rem. 2.6.3, p. 53). (*completed-tower-self-product*) `A_∞ ⊗_A A_∞ ≅ LC(G, A_∞)`
induces `Â_∞ ⊗̂ᵘ_A Â_∞ ≅ (C^0(G, Â_∞), C^0(G, Â_∞⁺))` (R0 *uniform-completed-tensor-product*), the
insertions going to `b ↦ (g ↦ b)` and `b ↦ (g ↦ g·b)`, and all `C^0(G^k, Â_∞)` are perfectoid if `p`
is topologically nilpotent (P6; [ECD] §15, proof of Lem. 15.6, p. 91; Prop. 15.4, p. 90).

### A4.8 the perfectoid torsor presentation

**Perfectoid torsor presentation.** (*perfectoid-cover-presentation*) For complete Tate `(A, A⁺)`, a
perfectoid torsor presentation is a profinite `G`, a complete perfectoid pair `(Ã, Ã⁺)` with
continuous `G`-action and a `G`-invariant `q : (A, A⁺) → (Ã, Ã⁺)` with
`Ã ⊗̂ᵘ_A Ã ≅ (C^0(G, Ã), C^0(G, Ã⁺))`, `b ⊗ b′ ↦ (g ↦ b·g(b′))`, and `Spa(q)` open, surjective, with
`G`-orbit fibres. `X̃ = Spa(Ã, Ã⁺)` and `R̃ = Spa(C^0(G, Ã), C^0(G, Ã⁺)) ≅ G × X̃` are an affinoid
perfectoid action groupoid. For `p` topologically nilpotent a completed tower gives one; perfectoid
pairs: `G = 1` ([ECD] §15, Prop. 15.4, p. 90, and proof, p. 91; [Berkeley] Lecture 10, Lem. 10.1.7,
p. 75; [ECD] §15, after Def. 15.5, p. 91). Over `ℚ_p`, `|R̃| → |X̃| ×_{|Spa ℚ_p|} |X̃|` is not
injective: `R̃` is an equivalence relation only as v-sheaves.

### A4.9 comparison interfaces with diamonds

**Diamond interfaces.** (*spd-of-tate-huber-pair-and-perfectoid-torsor*) Of [ECD] §15, Lem. 15.3,
p. 90, and Prop. 15.4, pp. 90–91, A4 supplies the presentation (non-complete `A` via completion);
the v-sheaf statements (Lems. 15.1–15.2, Prop. 15.4, pp. 89–91) are D6's *spd-of-a-tate-pair* and
*spd-is-a-spatial-diamond*. (*diamond-of-analytic-adic-space-and-etale-site-15-6*) [ECD] §15,
Def. 15.5 and Lem. 15.6, p. 91, are D6's *gluing-and-the-diamond-functor* and
*etale-site-comparison*, fed by A4.5, A4.7 and A1's sites ([KL I] §8.2, Lem. 8.2.17(a), p. 162).

### Examples

- `(ℚ_p, ℤ_p)`: the Galois tower gives `ℂ_p`, `|Spa ℂ_p|/G = |Spa ℚ_p|`; perfectoid pairs: `G = 1`.
- `ℚ_p⟨T⟩`: `Â_∞` is perfectoid though `ℚ_p⟨T⟩` is not; `X^p − X − T/p` splits over it.
- `ℚ_p[T]` (not complete): finite étale algebras change under uniformization.

### Dependencies

- A1: Huber pairs of finite étale algebras (*finite-etale-affinoid-algebra*) and étale sites.
- AdicSpacesPartII R0: uniformization, spectral seminorm, (uniform) completed tensor product.
- PerfectoidSpaces P1, P2, P3, P5, P6; PerfectoidTowers P9; AdicSpaces (Huber pairs, `Spa`).
- Consumers: DiamondsAndVStacks D6, `Bun_G` and Newton-strata roadmaps.

## Downstream consumers

AdicSpacesPartIV layers R4 and R5 re-export the sites of A1 on their carriers (the étale slice
site, the pro-étale slice site, the functoriality of the étale site, the reduction of étale
coverings on a stable basis) and use A1's finite étale and étale morphisms over sousperfectoid
spaces. PerfectoidSpaces P3–P6 and PerfectoidTowers P8–P9 cite finite étale algebras over a filtered
colimit (*finite-etale-algebras-filtered-colimit*), the finite étale Galois torsors and their
completed towers (*torsor-spa-orbits*, *spa-of-completed-tower*) and the compatibility clause of the
assembled Proposition 6.4 (*etale-descent-to-finite-stage-6-4*). DiamondsAndVStacks D6 consumes the
perfectoid torsor presentation (*perfectoid-cover-presentation*) and the analytic input of the
étale-site comparison (*diamond-of-analytic-adic-space-and-etale-site-15-6*). The étale-cohomology,
Shimura-variety, `p`-adic Hodge theory and adic-coefficient roadmaps consume A1–A4 through the
layers named in their own documents.

## References

Page locators refer to the printed pagination of the stated PDF or book edition.

- [HK] David Hansen, Kiran S. Kedlaya, Sheafiness criteria for Huber rings.
  https://kskedlaya.org/papers/criteria.pdf. Version dated 6 August 2026.
- [H96] Roland Huber, Étale Cohomology of Rigid Analytic Varieties and Adic Spaces.
  https://link.springer.com/book/10.1007/978-3-663-09991-8.
  Aspects of Mathematics E30, Vieweg, 1996.
- [H94] Roland Huber, A generalization of formal schemes and rigid analytic varieties.
  https://gdz.sub.uni-goettingen.de/id/PPN266833020_0217. Math. Z. 217 (1994), 513–551.
- [Hüb] Katharina Hübner, Adic spaces. https://arxiv.org/abs/2405.06435. arXiv:2405.06435v1.
- [KL I] Kiran S. Kedlaya, Ruochuan Liu, Relative p-adic Hodge theory: foundations.
  https://arxiv.org/abs/1301.0792. arXiv:1301.0792v5; Astérisque 371 (2015).
- [Morel] Sophie Morel, Adic spaces (lecture notes).
  https://web.math.princeton.edu/~smorel/adic_notes.pdf. Lecture notes, 22 April 2019.
- [ECD] Peter Scholze, Étale cohomology of diamonds. https://arxiv.org/abs/1709.07343.
  arXiv:1709.07343v4, 14 April 2026.
- [PS] Peter Scholze, Perfectoid spaces. https://arxiv.org/abs/1111.4914v1. arXiv:1111.4914v1, whose
  pagination the locators use; published in Publ. Math. IHÉS 116 (2012), 245–313.
- [Berkeley] Peter Scholze, Jared Weinstein, Berkeley Lectures on p-adic Geometry.
  https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf. Annals of
  Mathematics Studies 207 (2020); PDF dated 27 March 2020.
- [Wedhorn] Torsten Wedhorn, Adic Spaces. https://arxiv.org/abs/1910.05934v1. arXiv:1910.05934v1.
- [PH] Peter Scholze, p-adic Hodge theory for rigid-analytic varieties.
  https://arxiv.org/abs/1205.3463. arXiv:1205.3463v2; Forum of Mathematics, Pi 1 (2013), e1.
- [dJvP] Johan de Jong, Marius van der Put, Étale cohomology of rigid analytic spaces.
  https://ems.press/content/serial-article-files/25781. Documenta Mathematica 1 (1996), 1–56.
- [FS] Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence.
  https://arxiv.org/abs/2102.13459. arXiv:2102.13459v4.
- [PH erratum] Peter Scholze, Erratum to 'p-adic Hodge theory for rigid-analytic varieties'.
  https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf.
  Author’s three-page erratum; read alongside PH.
- [RZ] Luis Ribes, Pavel Zalesskii, Profinite groups, 2nd ed., Ergebnisse der Mathematik und ihrer
  Grenzgebiete (3) 40, Springer, 2010. Cited through [PH erratum] item (1) (Example 5.6.9).
- [H93] Roland Huber, Continuous valuations.
  https://gdz.sub.uni-goettingen.de/id/PPN266833020_0212. Math. Z. 212 (1993), 455–477.
- [Zav] Bogdan Zavyalov, Some foundational results in adic geometry.
  https://arxiv.org/abs/2409.15516. arXiv:2409.15516v2, 17 July 2025.
- [KL II] Kiran S. Kedlaya, Ruochuan Liu, Relative p-adic Hodge theory, II: Imperfect period rings.
  https://arxiv.org/abs/1602.06899. arXiv:1602.06899v3, 21 October 2019.
- [Stacks] The Stacks project authors, The Stacks project. https://stacks.math.columbia.edu. Online
  edition; references use stable tags.
- [SGA 4 VI] Alexander Grothendieck and Jean-Louis Verdier, Théorie des topos et cohomologie étale
  des schémas, Tome 2, Exposé VI, with the Appendix by Pierre Deligne. Lecture Notes in
  Mathematics 270, Springer, 1972.
